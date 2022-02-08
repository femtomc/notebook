#lang pollen

◊(define-meta template "template.html")

◊(title "Notes on sequential Monte Carlo")

There is a critical (and still ◊i{highly relevant}) paper on sequential Monte Carlo (SMC) samplers which deserves a read from all those interesting in probabilistic modeling and approximate inference.

The paper is ◊link["https://www.stats.ox.ac.uk/~doucet/delmoral_doucet_jasra_sequentialmontecarlosamplersJRSSB.pdf"]{Sequential Monte Carlo samplers} by Pierre Del Moral, Arnaud Doucet, and Ajay Jasra (DMDJ) - whose contributions include laying the conceptual bricks for modern variants of SMC by carefully discussing a methodology to sample sequentially from a sequence of probability distributions defined on the same space.

In this note, I'll be working through the paper - elaborating where I may, and deferring to other material as required.

◊h2{Background}

Sampling from probability distributions is a commonly desired operation in probabilistic modeling and inference. Especially in the latter case, direct sampling can sometimes be intractable - either because the distribution in question may be defined indirectly through marginalization of an existing density (which is often intractable, although sometimes not) or because ◊link["https://web.mit.edu/urban_or_book/www/book/chapter7/7.1.3.html"]{existing methods} do not apply to densities which lack an analytic CDF.

Practitioners have constructed clever approximation techniques to get around these limitations, including Monte Carlo methods - algorithms which internally use randomness to approximately perform optimization, numerical integration, and sampling from target probability distributions. 

Sequential Monte Carlo is one such method with a unique set of computational trade offs.

◊h2{Comparison to Markov chain Monte Carlo}

As part of the motivation, (DMDJ) discuss a number of computational comparisons between SMC samplers and Markov chain Monte Carlo (MCMC) samplers.

◊itemize{
For batch observations ◊${y_1, ..., y_n}, MCMC sampling require complete likelihood evaluation at each step. This must include all observations, which may be prohibitively expensive. Instead, it may be computationally beneficial to evaluate likelihoods on partial sets of observations in sequence.

For computational reasons, it may be useful to sample ◊i{sequentially} from a series of distributions, beginning with an easy-to-sample distribution ◊${\pi_1} and ending with the distribution of interest ◊${\pi_p}.
}

◊h2{A simple working example}

One easy way to understand why this technique is useful is to imagine that a you want to update a distribution in light of new evidence in an online fashion (one new observation every so often).

◊fig[◊dot->ref{
rankdir=TD;
{ rank = same; 
    X0 X1 X2 };
X0 -> X1;
X1 -> X2;
X0 -> Y0;
X1 -> Y1;
X2 -> Y2;
}]{Graphical model representation of an unrolled hidden Markov model.}

Traditionally, SMC algorithms were developed to solve dynamical systems filtering problems. Let's look at the decomposition of the joint from the model displayed above.

◊$${
P(X_0, X_1, X_2, Y_0, Y_1, Y_2) = P(X_0) \prod_{i = 0} P(X_{i + 1} | X_i)P(Y_i | X_i)
}

Now, from this joint, we could ask questions about the "filtering distributions" ◊${P(X_0 | Y_0)}, ◊${P(X_1 | Y_0, Y_1)}, ◊${P(X_2 | Y_0, Y_1, Y_2)} in turn.

This presentation is originally from ◊link["https://www.stats.ox.ac.uk/~doucet/doucet_defreitas_gordon_smcbookintro.pdf"]{Doucet, de Freitas, and Gordon}. This presentation should also be praised for treatment of Monte Carlo sampling in general (and in computational comparison with techniques like numerical integration).

◊h2{Sequential importance sampling}

◊h2{Sequential importance resampling}

◊h2{Conditional SMC}

◊h2{Resample-move SMC}

In this section, I'd like to discuss a modification to the SMC framework discussed above which introduces MCMC steps in between SMC update steps. The resultant algorithm class is profoundly interesting

◊h2{Relevant works}

There are quite a few relevant works which have contributed to my own presentation here:

◊itemize{
◊link["https://www.stats.ox.ac.uk/~doucet/doucet_defreitas_gordon_smcbookintro.pdf"]{Doucet, de Freitas, and Gordon, 2001}

◊link["http://www.mathcs.emory.edu/~whalen/Papers/BNs/MonteCarlo-DBNs.pdf"]{Gilks and Berzuini, 2001}

◊link["https://www.stats.ox.ac.uk/~doucet/delmoral_doucet_jasra_sequentialmontecarlosamplersJRSSB.pdf"]{Del Moral, Doucet, and Jasra, 2006}

◊link["https://www.stats.ox.ac.uk/~doucet/doucet_johansen_tutorialPF2011.pdf"]{Doucet and Johansen, 2008}
}
