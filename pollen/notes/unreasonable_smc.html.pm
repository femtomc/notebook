#lang pollen

◊(define-meta template "template.html")
◊(define-meta node-title "The unreasonable effectiveness\nof rejuvenation move SMC")
◊(define-meta title "The unreasonable effectiveness of rejuvenation move SMC")

In this note, I'll be covering an approximate inference algorithm design framework which extends SMC with Monte Carlo proposal moves at each step of the algorithm.

Previously, ◊link["smc_samplers.html"]{I've covered introductory material on sequential Monte Carlo} (SMC), where I mentioned some of the benefits of SMC in comparison to techniques like Markov chain Monte Carlo (MCMC).

Here, I'll be discussing ◊link["https://dl.acm.org/doi/10.1145/3296979.3192399"]{Cusumano-Towner et al, 2018} - a paper which extends SMC to support incremental inference.
