#!/usr/bin/env python3
"""Calculate probabilities for the Newton-Pepys problem.

Which of the following three outcomes has the highest probability?
- Roll six dice, get at least one "6"
- Roll twelve dice, get at least two "6"s
- Roll eighteen dice, get at least three "6"s.
"""
from scipy.stats import binom


def compcdf(k, n, p):
    """Return he binomial probability of at least k successes from n trials."""
    return 1 - binom.cdf(k - 1, n, p)


if __name__ == '__main__':
    ns = [6, 12, 18]
    p = 1/6
    ks = [1, 2, 3]

    for k, n in zip(ks, ns):
        print(f'P(At least {k} \"6\"s in {n} trials) = {compcdf(k, n, p):.3f}')
