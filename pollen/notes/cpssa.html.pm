#lang pollen

◊(define-meta template "template.html")
◊(initialize-links-db "Some thoughts about CPS & SSA")

◊h1{Some thoughts about CPS & SSA}

Consider a simple block IR:

◊highlight{
1: (%1, %2)  {
    %3 = intrinsic_add(%1, %2)
    %4 = intrinsic_add(%3, %3)
    return %4
}
}

where ◊code{intrinsic_add} is an intrinsic for our IR language - e.g. it can be mapped directly onto an assembly element, and doesn't require allocating a stack frame (for example). 

In our basic block here, there is no flow of control out of the block until the computation terminates. In a functional language like Haskell, you could image replacing ◊code{return} with an effectful operator (e.g. something which requires a monadic context) that interacts with the outside world. In other words, the completion of the computation performs some effectful action (so we see the result in ◊code{%4}) and then no other flow of control is performed.

What if our function calls another function which is not a primitive?

◊highlight{
1: (%1, %2)  {
    %3 = non_primitive(%1, %2)
    %4 = intrinsic_add(%3, %3)
    return %4
}
}

In SSA, we have to represent the transfer of control to the ◊code{non_primitive} (which will be represented by basic blocks). But now, when the ◊code{non_primitive} call returns, where does it transfer control to? To handle this, the real block representation would actually look like this:

◊highlight{
-- I'm abusing SSA here by re-using register names.
1: (%1, %2)  {
    invoke 2 (%1, %2)
}

2: (%1, %2) {
    %3 = some_other_intrinsic(%1, %2)
    invoke 3 (%3)
}

3: (%1) {
    %2 = intrinsic_add(%1, %1)
    return %2
}
}

Now, the flow of control is explicit, and linear - we don't have to "jump to the middle" of a block. Furthermore, every block knows how to transfer control to a target. Notice how this optimizes manipulation of stack frames - each transfer of control indicates a complete de-allocation (e.g. no required saving/restoring). This is exactly equivalent to tail call optimization.

But this is exactly the same idiom as CPS - when we write:

◊highlight{
    f x k c = c $ some_computation x k
}

each continuation ◊code{c} also knows where to jump to next, and never has a return back.

Let's also look at recursion in the block representation by studying ◊code{factorial}:

◊highlight{
function factorial(n)
    if (n == 0)
        return 1
    else
        return n * factorial(n - 1)
    end
end
}

This might (pseudo) lower to:

◊highlight{
1: (%1) {
    %2 = primitive_check(%1, 0)
    check %2 then invoke 2 (1) -- problematic.
    %3 = primitive_sub(%1, 1)
    %4 = invoke 1 (%3)
    %5 = primitive_mul(%1, %4)
    invoke 2 (%5)
}

2: (%1) {
    return %1
}
}

But notice how we've broken the nice property discussed above - now, we "return to the middle of a block" which means we have to do some costly stack frame manipulation. How do we handle this in CPS?

◊highlight{
fact_cps n c = 
    if n == 0 then c 1 
              else fact_cps (n - 1) \v -> c (n * v)
                                    ---------------
                                    --  closure  --
}

When ◊code{n == 0}, we follow the branch by invoking the continuation ◊code{c} explicitly on ◊code{1} - otherwise, we accumulate the result ◊em{in the continuation which we pass to the recursive call}.

We can take inspiration and re-visit the block representation. There's a few issues - one is that our functional language supports closures, and I haven't specified how this works in the block language. No problem - we'll use ◊link["https://en.wikipedia.org/wiki/Lambda_lifting"]{lambda lifting} and imagine giving each closure a unique name in global scope. This means that the closure will be converted into a block with (ignoring the closed-over continuation ◊code{c} for the moment) 2 arguments.

Now, the closure closes over the continuation ◊code{c} - this may seem problematic. The key here is to understand that the continuation ◊code{c} passed into ◊code{fact_cps} will be the final block which control is transferred to. That just means that we will need to specify the last block. It's likely easy to see this if we study composition of CPS functions:

◊highlight{
f1 k a = k $ some_computation a
f2 k a = k $ other_computation a
compose k f1 f2 a = (f1 (f2 k) a)
-- == k $ other_computation $ some_computation a
}

So the passed continuation ◊code{k} is always invoked last.

◊highlight{
1: (%1) {
    %2 = primitive_check(%1, 0)
    check %2 then invoke 4 (1)
    invoke 3 (%1, 1)
}

2: (%1, %2) {
    %3 = primitive_check(%1, 0)
    check %3 then invoke 4 (%2)
    invoke 3 (%1, %2)
}

3: (%1, %2) {
    %3 = primitive_mul(%1, %2)
    %4 = primitive_sub(%1, 1)
    invoke 2 (%4, %3)
}

4: (%1) {
    return %1
}
}

Above is one example of how this might be represented. It is interesting to study the control flow graph (CFG) of this example.

◊dot{
1 -> 4;
1 -> 3;
3 -> 2;
2 -> 3;
2 -> 4;
}

◊h2{SSA & delimited control}

One interesting thought experiment is studying a modified block language where blocks also accept label or continuation arguments:

◊highlight{
1: <l> (%1, %2)  {
    %3 = intrinsic_add(%1, %2)
    %4 = intrinsic_add(%3, %3)
    invoke l (%4)
    return %4
}
}

For the moment, let's ignore the optimization requirement that blocks always transfer control away, and never require resumption.

Suppose ◊code{l} wants to return to the invocation site with a special operator called ◊code{resume}

◊highlight{
1: <l> (%1, %2)  {
    %3 = intrinsic_add(%1, %2)
    %4 = intrinsic_add(%3, %3)
    invoke l (%4)
    invoke 2 (%4)
}

2: <> (%1) {
    %3 = intrinsic_add(%1, %1)
    return %3
}
}

where ◊code{l} is something like the following:

◊highlight{
l: (%1) {
    %2 = some_computation(%1)
    resume
}
}

What has to happen to allow resumption? Well, the computation continuing from the ◊code{invoke} point needs to be captured by the runtime and resumed when ◊code{resume} occurs:

◊highlight{
1: <k> (%1, %2)  {
    %3 = intrinsic_add(%1, %2)
    %4 = intrinsic_add(%3, %3)
    invoke k (%4) -- may resume here.
    
    -- Captures %4 from the current stack frame.
    invoke 2 (%4)
    -- must be captured up to here.
}

2: <> (%1) {
    %3 = intrinsic_add(%1, %1)
    return %3
}
}

In the CFG, this causes a "kink":

◊dot{
1 -> k;
k -> elsewhere;
k -> 1;
1 -> 2;
2 -> done;
}

But here, notice that we don't need to restore the entire stack frame - just the part which is captured by the bounds of the resumption.

There is a series of concepts (as far as I can tell, first explored in Lisp) called control operators and delimited control which refer to the same sort of "capturing" mechanism.

◊highlight{
(* 2 (reset (+ 1 (shift k (k 5)))))
}

In this code, the operators ◊code{shift} and ◊code{reset} set limits on what is captured into the continuation ◊code{k}. Here, the continuation ◊code{\k . (+ 1 k)} is captured and then immediately applied.

◊highlight{
(* 2 (reset (+ 1 (shift k (k 5)))))
-- => k == \x . (+ 1 x)
-- -> (* 2 (k 5))
-- -> (* 2 (\x . (+ 1 x) 5))
-- -> (* 2 6)
-- -> 12
}
