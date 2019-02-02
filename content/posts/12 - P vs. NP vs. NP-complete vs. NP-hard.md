---
title: "P vs. NP vs. NP-complete vs. NP-hard"
slug: "p-vs-np-vs-np-complete-vs-np-hard"
date: 2018-11-25
tags: ["computer", "science"]
type: "lncs"
draft: false
image_dir: "/images/lncs/2-p-vs-np-vs-np-complete-vs-np-hard/"
---
These definitions all refer to *how long it takes* for a program to run.

## P
- Polynomial
- efficiently solvable,
- Problems that can be solved in polynomial time,
	- polynomial time: time taken is of the form O(n^c)
- Decision problems that can be solved efficiently.
- Efficient algorithms:
	- are algorithms that use at most polynomial amount of computer resources,
	- are algorithms that have polynomial worst-case running time.
- Formally, a decision problem Q is in P if:
	- there is an efficient algorithm A for all inputs x:
		- if Q(x) = YES then A(x) = YES,
		- if Q(x) = NO then A(x) = NO,

## NP
- Non-deterministic polynomial,
- efficiently verifiable,
- Problems with efficient algorithms for verifying proofs/certificates/witnesses(sometime people use certificate or witness in place of proof),
- A program that solves a problem in non-deterministic polynomial(NP) time,
	- not in polynomial time on a regular computer(deterministic Turing machine)
	- BUT on polynomial time on a non-deterministic Turing machine
		- a non-deterministic Turing machine can do everything a regular computer does and more
- Problems that cannot be solved, but verified in polynomial time,
- Class of problems which have efficient verifiers,
- Formally, a decision problem Q is in NP if:
	- there is an efficient algorithm V called verifier for all inputs x:
		- if Q(x) = YES then there is a proof y such that V(x, y) = YES,
		- if Q(x) = NO then for all proofs y such that V(x, y) = NO,
- A decision problem is in NP if we can give an efficient verifier which is sound and complete:
	- **sound verifier:** a verifier which does not accept any proof when the answer is NO,
	- **complete verifier:** a verifier which accepts at least one proof when the answer is YES.
- **REMARK:** If any particular problem is said to be in NP and nothing else is said about it, then the fastest algorithm to solve this problem takes exponential time. **But**, it does **not** mean that there are better algorithms; it's just that we do not know of that.
- **REMARK:** Stating that a problem is in NP space, does not mean that it's hard to solve; it just means that it's easy to verify, it's an upper-bound on the difficulty of solving the problem.
- REMARK: Many NP problems are easy to solve since 𝖯⊆𝖭𝖯.
- If a reduction algorithm A works in polynomial time, then it's called `polynomial time black box reduction` or `Cook Reduction`

## NP-hard
- A problem X is NP-hard, if there's an NP-complete problem Y such that Y can be reduced to X in polynomial time,
- A problem is NP-hard if it's at least as hard as the hardest problem in NP-complete.
- If a problem satisfies the second condition of NP-completeness(the universal conditionality), then it's NP-hard
- A way of saying that a problem is difficult
- NP-hardness = universality
	- Therefore the name NP-universal would be a better name than NP-hard since it's just that we don't know if they're easily solvable.

## NP-complete
- A problem that is both NP-hard and NP.
- The most difficult problems in NP to solve
- If we can solve an NP-complete problem efficiently, we can solve all NP problems efficiently.
- Many natural NP problems turns out to be NP-complete
	- natural problem: a problem which people really care about solving but not an artificial one just to prove a point

## Overall Picture
Here is a nice picture to see a comparison of everything talked here.

{{< img src="overall-comparison.png" title="Overall Comparison" >}}

## Resources
- https://cs.stackexchange.com/questions/9556/what-is-the-definition-of-p-np-np-complete-and-np-hard
- https://www.quora.com/What-are-P-NP-NP-complete-and-NP-hard
- https://www.quora.com/What-does-NP-hard-mean