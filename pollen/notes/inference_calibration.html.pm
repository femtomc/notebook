#lang pollen

◊(define-meta template "template.html")
◊(define-meta title "Rank statistics and inference calibration")
◊(define-meta node-title "Rank statistics and\ninference calibration")

◊title{Rank statistics and inference calibration}

Inference calibration encapsulates a set of techniques used to quantify distribution approximation error in Bayesian approximate inference. In the context of Markov chain Monte Carlo (MCMC), a distribution approximation algorithm used extensively by statisticians and probabilistic modelers alike, numerous techniques have been developed to facilitate the process of diagnosing problems with inference (and indeed, convergence of MCMC).

In this note, I'll be covering ◊link["https://cfreer.org/papers/SFAM-goftests.pdf"]{this paper} which develops an exact goodness-of-fit test for high-dimensional discrete distributions. Between this paper, and generalizations of a technique called ◊i{simulation-based calibration} (SBC), there are more than a few techniques in the arsenal for detecting distributional mismatch.

◊h2{Simulation-based calibration}

SBC takes advantage of the fact that samples ◊${(z, x)} from a probabilistic joint ◊${P(z, x)} for ◊${z} are also samples from the posterior ◊${P(z | x)}. 

Given the ability to sample from the joint ◊${P(z, x)}, and an algorithm which approximates ◊${P(z | x)}, for each joint sample ◊${(z, x)}, we can ask the approximation algorithm to approximate ◊${P(z | x)} from ◊${x} and then compute a rank statistic with respect to the "ground truth" ◊${z}. Computation of the rank statistic requires that the space ◊${Z} (where ◊${z \in Z}) provides a total order relation on elements. 

Provided that this is true, repeatedly computing ◊${P(z' \lt z | x)} for pairs ◊${(z, x)} using the approximation algorithm posterior ◊${P'(z | x)} furnishes an interesting property: ◊${P(z' \lt z | x) \sim \text{Uniform}(0, 1)} ◊i{iff} the approximation is close to the true posterior.

◊h2{Stochastic rank statistic}
