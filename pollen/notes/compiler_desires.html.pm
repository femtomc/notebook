#lang pollen

◊(define-meta template "template.html")
◊(initialize-links-db "Things I want in a compiler")

◊h1{Things I want in a compiler}

This is going to be a bit of a ramble - (ahead of time warning) I feel like I'm quite a biased programmer. I feel like I complain about language and compiler design features more than your average programmer. I think it's perfectly fine to complain about things like this, especially in programming - where there are strong incentives (tendencies) to settle into ecosystem-based language optima. I suspect the study and usage of programming languages exemplifies the "perfect is the enemy of the good" ethos. Nonetheless, new ideas which radically simplify things will always be attractive to me - even if the cost in a language implementation is that you have to start with a young ecosystem.

With that out of the way, ◊i{I know what I like} in programming languages. I started with Python, then I messed around with Rust, then I used C for a bit, which helped me realize that Rust was really nice, then I started using Julia, then I used Julia a lot, then I played around with Haskell. Along the way, I've used Scala, OCaml, Racket, Zig, even a little bit of VHDL for an FPGA course project. By far, I'm most comfortable with Julia and Rust. Of course, I reach for them for different things - but I'm reasonably confident that I could put together medium to large codebases in each language and not have it be a total disaster.

I love Julia for many reasons. It feels like the "code is data, data is code" ethos of Lisp has been built into the DNA of the compiler. The official language compiler implementation is also freaking fast, and the community is obsessed with making it faster in the ways that count (for me, machine learning). The language implementation is well-designed, even though it requires a GC - the compiler is smart enough to not generate a lot of garbage. The language combination of subtyping and multiple dispatch has created this composability solace (from the framework chaos storm that is modern computing). Julia was sort of like my gateway drug to language/compiler things. On the other hand, there are things about Julia which frustrate me. When you start to get into the Julia compiler, there are packages which lull you into a false sense of promise - the promise that you (yes, you, intrepid programmer) can explore truly insane things like full language AD, or plugging compiler passes into the hot running runtime, even changing inference (which is for performance, not correctness, so it's all good). In practice, there are limitations built into the compiler (for good reasons! which make sense when you start to read about Julia's type inference, and the requirements of dynamism). There are pedantic things, like the "unorthodox" (at least, compared to traditional AOT compilers) workflow for compiling Julia code to a binary. Or the fact that Julia's AD story is sort of ... in a rut (at least, at the time of this writing, early 2022). Most of all, I think I've used and enjoyed Julia more than any other language I've played around with - and sometimes I've just wanted to expand my horizons, explore other ideas, etc. Julia is beautiful, but no matter where you are at, sometimes you might get the "grass is always greener" sort of feeling.

I love Rust because the compiler toolchain is (I think, bar none) the best thing I've ever used. It's crazy how many QoL things are just part of the toolchain, and just work seamlessly. Using the Rust compiler honestly feels like cheating. There's this weird quality to the Rust workflow which I can only encapsulate with "solid" or "robust". It just feels good. Coming from Julia (with Julia's emphasis on multiple dispatch and subtyping), I appreciate traits - sometimes I've reached for idioms which I would use in Julia, and I forget that subtyping is not a thing in Rust (although dynamic dispatch via trait objects is a thing). The error handling is also very well done (especially compared to Go, for example, or other languages which don't even provide special syntax or facilities for propagating errors).

◊h2{Things I hate}

I sort of hate Python - but not really enough to work myself into a passion about it. I just sort of think it's bland. It's a bland language, the native interpreter-based implementation is slow, lack of any form of typing hurts my soul and prevents me from rapidly reading Python code. All the crazy "bind the real framework from C++ in Python" things sort of feel like composability poison (especially if you get used to Julia, where everything "just composes" via multiple dispatch and subtyping).

I absolutely hate C++, probably with an intensity which is unwarranted. I just fundamentally do not understand (outside of ecosystem momentum! which is obviously a big thing) why anyone would use C++ today. The tooling feels like complicated garbage (conan seems alright, but then that's a project-specific thing -- and not enforced like Rust "strong opinion" enforces cargo), CMake feels like complicated garbage (and most people soft express a similar opinion when loosely asked), templates are too powerful, and lead to more complicated garbage, like metaprogramming templates, which is just a nightmare for debugging. It honestly nauseates me. In my biased head, Rust is basically superior to C++ in every single way ◊i{except for ecosystem}, which is one of the most important reasons for why anyone uses any language. I feel sort of comfortable with Rust, I would consider myself an intermediate Rust programmer. I've spent many weeks looking at C++ code, trying to get certain compiler things working (LLVM/MLIR) with the CMake tooling - I've just found it be way more complex, in a cognitively tiring way. I just dislike it, because it feels like all the things I don't want to think about have been made more complex (maybe arbitrarily so). And now, after looking at Rust, I can't really buy any argument "that it has to be this way" - because the Rust tooling is so helpful, in a cognitively easing sort of way.