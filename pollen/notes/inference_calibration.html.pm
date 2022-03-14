#lang pollen

◊(define-meta template "template.html")
◊(define-meta node-title "Rank statistics and\ninference calibration")
◊(define-meta title "Rank statistics and inference calibration")

Inference calibration encapsulates a set of techniques used to quantify distribution approximation error in Bayesian approximate inference. In the context of Markov chain Monte Carlo (MCMC), a distribution approximation algorithm used extensively by statisticians and probabilistic modelers alike, numerous techniques have been developed to facilitate the process of diagnosing problems with inference (and indeed, convergence of MCMC).

In this note, I'll be covering ◊link["https://cfreer.org/papers/SFAM-goftests.pdf"]{this paper} which develops an exact goodness-of-fit test for high-dimensional discrete distributions. Between this paper, and generalizations of a technique called ◊i{simulation-based calibration} (SBC), there are more than a few techniques in the arsenal for detecting distributional mismatch.

◊h2{Simulation-based calibration}

SBC takes advantage of the fact that samples ◊${(z, x)} from a probabilistic joint ◊${P(z, x)} for ◊${z} are also samples from the posterior ◊${P(z \ | \ x)}. 

Given the ability to sample from the joint ◊${P(z, x)}, and an algorithm which approximates ◊${P(z \ | \ x)}, for each joint sample ◊${(z, x)}, we can ask the approximation algorithm to approximate ◊${P(z \ | \ x)} from ◊${x} and then compute a rank statistic with respect to the "ground truth" ◊${z}. Computation of the rank statistic requires that the space ◊${Z} (where ◊${z \in Z}) provides a total order relation on elements. 

Provided that this is true, repeatedly computing ◊${P(z' \lt z \ | \ x)} for pairs ◊${(z, x)} using the approximation algorithm posterior ◊${P'(z \ | \ x)} furnishes an interesting property: ◊${P(z' \lt z \ | \ x) \sim \text{Uniform}(0, 1)} ◊i{iff} the approximation is close to the true posterior.

The original paper on this technique is ◊link["https://arxiv.org/abs/1804.06788"]{Talts et al, 2018}.

◊h2{Stochastic rank statistic}

Simulation-based calibration was designed to handle single continuous latent inference - and generalizations (multiple marginal tests with statistical corrections - e.g. ◊link["https://en.wikipedia.org/wiki/Bonferroni_correction"]{Bonferroni correction}) essentially follow the same recipe. In ◊link["https://proceedings.mlr.press/v89/saad19a.html"]{Saad et al, 2019}, the authors explore goodness-of-fit testing in the context of discrete random variables.

◊fig["assets/srs.png"]{
Exact goodness-of-fit testing using stochastic rank statistic, as presented in ◊link["https://proceedings.mlr.press/v89/saad19a.html"]{Saad et al, 2019}.
}

Structurally, this test is similar to SBC - with the addition of a tie breaking mechanism when the order relation produces a tie.
