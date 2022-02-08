#lang pollen

◊(define-meta template "template.html")

◊title{AIDE: towards analyses of inference error}

◊link["https://arxiv.org/pdf/1705.07224.pdf"]{AIDE} is a technique for measuring the accuracy of probabilistic inference algorithms by computing an estimator for the symmetric Kullback-Leibler (KL) divergence between the approximating distributions of two inference algorithms. 

In this note, I'll be working through the paper - attempting to provide informal context where necessary.

◊h2{Background}

First, some background. In approximate Bayesian inference, the goal is to compute an approximation of the posterior that converges to the true posterior in some limit of computation. In Monte Carlo (importance) sampling, for example, the limit may be the number of samples. In Markov chain Monte Carlo (MCMC), this limit is the number of transition steps. 

Often times, these limits are framed by considering an expectation taken with respect to the target distribution, e.g.

◊$${
E[X;P] \approx \hat{E}_n[X;P] = \frac{1}{n}\sum_{i=1}^n x_i
}

These algorithms are configurable. 

In importance sampling, the user can provide a proposal distribution which the algorithm will sample from (but the proposal must cover the support of the posterior). Intuitively, the closer the proposal is to the true posterior, the smaller the number of samples required to reduce the variance to a specified tolerance. So the choice of proposal distribution has ramifications for the amount of computation required to estimate the expectation. The theoretical "best" proposal distribution requires only a single sample - in practice, usage almost always necessitates taking a number of samples and computating the expectation using a weighted average. A good reference here on proposals, variance bounds, and computation is ◊link["https://projecteuclid.org/journals/annals-of-applied-probability/volume-28/issue-2/The-sample-size-required-in-importance-sampling/10.1214/17-AAP1326.full"]{Chatterjee and Diaconis, 2018}.

A similar characterization is true for MCMC, where the user can provide a kernel (which must satisfy a property called detailed balance with respect to the target distribution to ensure that the Markov chain targets the correct distribution). The computational limit parameter in question is the length of the Markov chain.

Often times, categorization of these algorithms discuss these explicit parameters in great detail - but in practice, there are also implicit computational costs which must be considered when designing custom inference algorithms. In importance sampling, sampling from the proposal distribution and evaluation of log-likelihood functions are two computational processes which are effectively involved in every sampling step. In MCMC, sampling from the kernel and evaluation of the accept-reject ratio are involved in every step.

These implicit costs must be considered in the practical design of inference - e.g. an algorithm which theoretically converges quickly may practically be unacceptable under computational restrictions. In many practical cases of Bayesian inference, effective algorithms which are known to be empirically successful from the literature will be run for a restricted number of steps. In MCMC, for example, this induces accuracy penalties against the true posterior. So the goal, really, is not choosing an algorithm by comparing behavior in the theoretical ◊${n \rightarrow \infty} limit, but comparing algorithms within a fixed computational restriction.

AIDE is a technique which seeks to address part of this design problem.

◊fig["assets/aide.png"]{
The AIDE architecture, as presented in ◊link["https://arxiv.org/pdf/1705.07224.pdf"]{Cusumano-Towner and Mansinghka, 2017}.
}

◊h2{Inference and meta-inference}

One important thing to understand is that AIDE sits within a conceptual framework for probabilistic and inference programming developed by (◊link["https://www.mct.dev/"]{Marco Cusumano-Towner} ◊link["http://probcomp.csail.mit.edu/"]{et al}) called ◊link["https://www.gen.dev/"]{Gen}. The paper is full of terminology which overlaps with this project - including things like traces and generative functions.

In particular, the way that AIDE is applied to inference algorithms is by framing them as ◊i{generative inference models} - ◊link["https://www.mct.dev/assets/mct-thesis.pdf"]{generative models} (whose mathematical background is covered in great depth in Marco's thesis) which return the output density of the inference algorithm when marginalized over internal random choices. This choice essentially motivates what follows - the difficulty of computing densities of inference algorithms occurs because it is difficult to marginalize over internal random choices of the algorithm. The authors specify: let's treat inference algorithms as generative models, and then use techniques from marginal likelihood estimation in a Monte Carlo estimator of divergence between output distributions of the two algorithms.

◊hline

◊h4{Generative inference model}

A tuple ◊${(U, X, q)} where ◊${q(u, x)} is a joint density on ◊${U \times X}. A generative inference model ◊i{models} an inference algorithm if the output density of the inference algorithm is the marginal ◊${q(x) = \int q(u, x) \ du}. An element ◊${u \in U} represents a complete assignment to the internal random choices within the inference algorithm (and, following Gen terminology, is called a trace). The interface to generative inference models require that it is possible to simulate (sample) from ◊${q(u, x)} but analytic computation of the density is not required.

◊h4{Meta-inference algorithm}

For a given ◊i{generative inference model} ◊${(U, X, q)}, a meta-inference algorithm is a tuple ◊${(r, \xi)} where ◊${r(u; x)} is a density on traces ◊${u \in U} indexed (possibly implicitly conditioned on, or represented as a function which accepts) on ◊${x}. ◊${\xi(u, x)} is defined as

◊$${
\xi(u, x) = Z \frac{q(u, x)}{r(u; x)}, \text{for some $Z > 0$}
}

The interface to meta-inference algorithms requires the ability to sample ◊${u ~ r(u; x)} and evaluate ◊${\xi(u, x)} for specified ◊${u} and ◊${x}.

◊note{
(◊link["https://arxiv.org/pdf/1705.07224.pdf"]{c.f. section 3.1 of the paper})

Conceptually, a meta-inference sampler tries to answer the question "how could my inference algorithm have produced this output ◊${x}?" 

Note that if it is tractable to evaluate the marginal likelihood ◊${q(x)} of the generative inference model up to a normalizing constant, then it is not necessary to represent internal random variables for the inference algorithm, and a generative inference model can define the trace as an empty token ◊${u = ()} with ◊${U = \{()\}}. In this case, the meta-inference algorithm has ◊${r(u; x) = 1, \forall x} and ◊${ξ(u, x) = Zq(x)}.
}

◊hline

So, what exactly does a generative inference model and meta-inference algorithm look like? 

The authors present a meta-inference algorithm for SMC:

◊fig["assets/aide_smc.png"]{
Meta-inference sampler for SMC, as presented in ◊link["https://arxiv.org/pdf/1705.07224.pdf"]{Cusumano-Towner and Mansinghka, 2017}.
}

◊h2{The estimator}

A key part of AIDE is the usage of the symmetrized KL divergence as a measure of difference between distributions. The KL divergence is defined as

◊$${
D_{KL}(P, Q) = \sum_{x\in X}P(x) \log \big( \frac{P(x)}{Q(x)} \big)
}

which is not a metric, although it satisfies some properties of metrics, like ◊${D_{KL}(P, Q) \geq 0} with saturation if ◊${P \equiv Q} almost everywhere. The symmetrized KL divergence looks like the following

◊$${
D_{KL}(P, Q) = \sum_{x\in X}(P(x) - Q(x)) \log \big( \frac{P(x)}{Q(x)} \big)
}

◊fig["assets/aide_alg.png"]{
The AIDE algorithm, as presented in ◊link["https://arxiv.org/pdf/1705.07224.pdf"]{Cusumano-Towner and Mansinghka, 2017}.
}
