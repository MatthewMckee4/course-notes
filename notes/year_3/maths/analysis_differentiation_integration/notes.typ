#set document(title: "Analysis of Differentiation and Integration")
#set page(margin: 20pt)

= Analysis of Differentiation and Integration

== Continuity

=== Definition 1.1

Let $f$ be a real function and $c in "dom"(f)$. Say that $f$ is *continuous* at $c$ if and only if

$ forall epsilon > 0, exists delta > 0 "s.t." forall x in "dom"(f), |x - c| < delta arrow.r.double |f(x) - f(c)| < epsilon $

=== Definition 1.2

Let $f$ be a real function. Say that f is *continuous* if and only if it is continuous at every $c in "dom"(f)$.

$ forall c in "dom"(f), forall epsilon > 0, exists delta > 0 "s.t." forall x in "dom"(f), |x - c| < delta arrow.r.double |f(x) - f(c)| < epsilon $

=== Proposition 1.3

Suppose $f$ and $g$ are both continuous at $c$ and $lambda in RR$. Then $lambda f$, $f + g$, $f g$, $max{f, g}$ and $min{f, g}$ are continuous at $c$.
If $g(c) != 0$, then $f/g$ is continuous at $c$.

=== Definition 1.4

Let $f$ be a real function. Say that f is *uniformly continuous* if

$ forall epsilon > 0, exists delta > 0 "s.t." forall x, y in "dom"(f), |x - y| < delta arrow.r.double |f(x) - f(y)| < epsilon $

=== Proposition 1.5 (Sequential Characterization of Continuity)

Let $f$ be a real function and $c in "dom"(f)$. Then $f$ is continuous at $c$ if and only if for every sequence
$(x_n)_(n=1)^infinity$ in $"dom"(f)$ with $x_n arrow.r c$, we have $f(x_n) arrow.r f(c)$.

=== Theorem 1.6

Let $f: [a, b] arrow.r RR$ be a continuous function. Then $f$ is uniformly continuous.

=== Theorem 1.7 (Extreme Value Theorem)

Let $f: [a, b] arrow.r RR$ be continuous. Then $f$ is bounded and attains its bounds.
Precisely, there exist $u, v in [a, b]$ with $f(u) <= f(x) <= f(v)$ for all $x in [a, b]$.

=== Theorem 1.8 (Intermediate Value Theorem)
Let $f: [a, b] arrow.r RR$ be continuous. Let $f(a) < d < f(b)$ (or $f(a) > d > f(b)$). Then there exists $c in (a, b)$ such that $f(c) = d$.

=== Definition 1.9

Let $f$ be a real function and suppose $c in RR$ satisfies the condition that for all $delta > 0$, there exists $x in "dom"(f)$ with $0 < |x - c| < delta$.
For $L in RR$, we say that $f(x)$ *converges to* $L$ as $x$ *converges to* $c$ (written $f(x) arrow.r L$ as $x arrow.r c$ or $lim_(x arrow.r c) f(x) = L$) if and only if

$ forall epsilon > 0, exists delta > 0 "s.t." forall x in "dom"(f), 0 < |x - c| < delta arrow.r.double |f(x) - L| < epsilon $

=== Proposition 1.10

Let $f$ and $g$ be real functions, and let $c in RR$ be such that for every $delta > 0$ there exists $x in "dom"(f) inter "dom"(g)$ with $0 < |x - c| < delta$.
Suppose that $f(x) arrow.r L$ and $g(x) arrow.r M$ as $x arrow.r c$. Then


- $(lambda f)(x) arrow.r lambda L$ as $x arrow.r c$;
- $(f + g)(x) arrow.r L + M$ as $x arrow.r c$;
- $(f g)(x) arrow.r L M$ as $x arrow.r c$;
- Provided $M != 0$, $(f/g)(x) arrow.r L/M$ as $x arrow.r c$.

=== Proposition 1.11

Let $f$ be a real function and $c in "dom"(f)$ be a point such that for all $delta > 0$ there exists $x in "dom"(f)$ with $0 < |x - c| < delta$. Then $f$ is continuous at $c$ if and only if $lim_(x arrow.r c) f(x) = f(c)$.

#pagebreak()

=== Definition 1.12

Let $f$ be a real function and $c in RR$ such that for all $delta > 0$, $"dom"(f) inter (c, c + delta) != emptyset.rev$. Let $L in RR$. Say that $f(x)$ *converges to* $L$ as $x$ *converges to* $c$ *from above* (written $lim_(x arrow.r c^+) f(x) = L$ or $f(x) arrow.r L$ as $x arrow.r c^+$) if and only if

$ forall epsilon > 0, exists delta > 0 "s.t." forall x in "dom"(f), c < x < c + delta arrow.r.double |f(x) - L| < epsilon $

For $c in RR$ such that for all $delta > 0$, $"dom"(f) inter (c - delta, c) != emptyset.rev$, we say that $f(x)$ *converges to* $L$ as $x$ *converges to* $c$ *from below* (written $lim_(x arrow.r c^-) f(x) = L$ or $f(x) arrow.r L$ as $x arrow.r c^-$) if and only if

$ forall epsilon > 0, exists delta > 0 "s.t." forall x in "dom"(f), c - delta < x < c arrow.r.double |f(x) - L| < epsilon $

=== Proposition 1.13

Let $f$ be a real function and let $c, L in RR$.

a) Suppose that $f(x) arrow.r L$ as $x arrow.r c^+$ and $f(x) arrow.r L$ as $x arrow.r c^-$. Then $f(x) arrow.r L$ as $x arrow.r c$.

b) Suppose that for each $delta > 0$, $"dom"(f) inter (c - delta, c) != emptyset.rev$ and $"dom"(f) inter (c, c + delta) != emptyset.rev$. If $f(x) arrow.r L$ as $x arrow.r c$, then both $lim_(x arrow.r c^+) f(x) = L$ and $lim_(x arrow.r c^-) f(x) = L$.
