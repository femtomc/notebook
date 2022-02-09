#lang pollen

◊(define-meta template "template.html")
◊(define-meta title "The mathematical foundations of importance sampling")
◊(define-meta node-title "The mathematical foundations\nof importance sampling")

Probabilistic modeling and inference deals with probability distributions - mathematical objects which are formally equivalent to ◊link["https://en.wikipedia.org/wiki/Measure_(mathematics)"]{measures}.

A measure ◊${\mu} is a non-negative map from a set ◊${X} equipped with a ◊link["https://en.wikipedia.org/wiki/%CE%A3-algebra"]{◊${\sigma}-algebra} (denoted ◊${\Sigma}) to ◊${\mathbb{R}} which satisfies a few properties (all stated with respect to the underlying ◊${\sigma}-algebra).

◊itemize{
    ◊b{Non-negativity}: as already stated, for all elements ◊${E} of ◊${\Sigma}, ◊${\mu(E) \geq 0}.
    
    ◊b{Null goes to 0}: ◊${\mu(\phi) = 0}

    ◊b{Countable additivity}: for all countable collections ◊${\{E_k\}_{k=1}^\infty} of pairwise disjoint sets in ◊${\Sigma}, ◊${\mu(\cup_{k=1}^\infty E_k) = \sum_{k = 1}^\infty \mu(E_k)}.
}

The full triple ◊${(X, \Sigma, \mu)} is called a ◊i{measure space}. Probablity measures are measures with an additional property: ◊${\mu(X) = 1}.

Useful to know - but we often work with ◊i{densities} or ◊i{probability mass functions}. How do these objects arise?

Probability mass functions arise when considering probability measures over discrete or countably infinite spaces - in this case, we generally are working with the measure directly! E.g. evaluating the query "what is the probability of the random variable taking value ◊i{this primitive set}" means evaluating the measure on that primitive set (which, by construction, is in the ◊${\sigma}-algebra).

Density functions arise when considering probability measures over ◊${\mathbb{R}} or ◊${\mathbb{R}^N}. To understand how they arise, it is important to understand that there is a "canonical" measure on ◊${\mathbb{R}^N} - the ◊link["https://en.wikipedia.org/wiki/Lebesgue_measure"]{◊i{Lebesgue measure}}. Here, I'm implicitly hiding the ◊${\sigma}-algebra - which requires more discussion. Buying the construction of the Lebesgue measure for the moment, we can construct new measures from an existing reference measure by writing a non-negative function ◊${f: \mathbb{R}^N \rightarrow \mathbb{R}} and expressing our new measure as the integral of this function using the reference measure over measurable subsets of the triple ◊${(\mathbb{R}^N, \Sigma, \mu)}:

◊$${
\nu(A) = \int_A f \ d\mu
}

This non-negative function is called a ◊i{density} - these functions are the objects which we are accustomed to working with.
