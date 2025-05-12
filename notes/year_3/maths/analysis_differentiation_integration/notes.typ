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

== Differentiability

=== Definition 2.1

Let $f$ be a real valued function and let $c in "dom"(f)$ be a point such that $"dom"(f)$ contains a neighbourhood of $c$. We say that $f$ is *differentiable at* $c$ if the limit

$ lim_(x arrow.r c) (f(x) - f(c))/(x - c) $

exists. In this case we call the value of this limit the *derivative of* $f$ *at* $c$ and write it as $f'(c)$.

=== Definition 2.2

Let $f$ be a real valued function. Say that $f$ is *differentiable* if it is differentiable at $c$ for all $c in "dom"(f)$. In this case the function $f': "dom"(f) arrow.r RR$ is called the *derivative of* $f$.

=== Proposition 2.3

Let $f$ be a real function which is differentiable at $c$. Then $f$ is continuous at $c$.

=== Proposition 2.4

Let $f$, $g$ be real functions and suppose that $f$ and $g$ are differentiable at $c$.

a) For all $lambda in RR$, the function $lambda f$ is differentiable at $c$ and $(lambda f)'(c) = lambda f'(c)$.

b) The function $f + g$ is differentiable at $c$ and $(f + g)'(c) = f'(c) + g'(c)$.

c) The function $f g$ is differentiable at $c$ and $(f g)'(c) = f'(c)g(c) + f(c)g'(c)$.

d) If $g(c) != 0$, then the function $f/g$ is differentiable at $c$ and $(f/g)'(c) = (f'(c)g(c) - f(c)g'(c))/(g(c)^2)$.

=== Proposition 2.5

Let $I$ and $J$ be intervals in $RR$ and let $f: I arrow.r J$ be a continuous bijection. Then $f^(-1): J arrow.r I$ is continuous.

=== Proposition 2.6 (Inverse function theorem)

Let $I$, $J$ be intervals, and let $f: I arrow.r J$ be a continuous bijection with $f$ differentiable at $c$. Suppose that $f'(c) != 0$. Then $f^(-1)$ is differentiable at $d = f(c)$ and

$ (f^(-1))'(d) = 1/(f'(c)) $

=== Proposition 2.7 (The chain rule)

Let $f$, $g$ be real functions such that $g$ is differentiable at $c in RR$ and $f$ is differentiable at $g(c)$. Then $f compose g$ is differentiable at $c$ and

$ (f compose g)'(c) = f'(g(c))g'(c) $

=== Lemma 2.8 (Rolle's Theorem)

Suppose that $f: [a, b] arrow.r RR$ be continuous on $[a, b]$ and differentiable on $(a, b)$. Suppose that $f(a) = f(b)$. Then there exists $c in (a, b)$ with $f'(c) = 0$.

=== Proposition 2.9

Let $f$ be a real function which is differentiable at $c$. Suppose that there exists $mu > 0$ such that either:

a) $f(x) <= f(c)$ whenever $x in (c - mu, c + mu)$, i.e. $a = f(c)$ is a local maximum of $f$.

b) $f(x) >= f(c)$ whenever $x in (c - mu, c + mu)$, i.e. $a = f(c)$ is a local minimum of $f$.

Then $f'(c) = 0$.

=== Theorem 2.10 (Mean value theorem)

Suppose that $f: [a, b] arrow.r RR$ is continuous on $[a, b]$ and differentiable on $(a, b)$. Then there exists some point $c in (a, b)$ with

$ f'(c) = (f(b) - f(a))/(b - a) $

=== Corollary 2.11 (Constant value theorem)

Let $f: [a, b] arrow.r RR$ be continuous on $[a, b]$ and differentiable on $(a, b)$. If $f'(x) = 0$ for all $x in (a, b)$, then $f$ is constant.

=== Definition 2.12

Let $f$ be a real function and $A$ a subset of $"dom"(f)$. Say that

a) $f$ is *strictly increasing* on $A$ if $f(x) < f(y)$ for all $x$, $y in A$ with $x < y$.

b) $f$ is *strictly decreasing* on $A$ if $f(x) > f(y)$ for all $x$, $y in A$ with $x < y$.

c) $f$ is *increasing* on $A$ if $f(x) <= f(y)$ for all $x$, $y in A$ with $x < y$.

d) $f$ is *decreasing* on $A$ if $f(x) >= f(y)$ for all $x$, $y in A$ with $x < y$.

As we know from calculus, these notions are related to the derivative.

=== Proposition 2.13

Let $f: [a, b] arrow.r RR$ be continuous on $[a, b]$ and differentiable on $(a, b)$.

a) If $f'(x) > 0$ for all $x in (a, b)$, then $f$ is strictly increasing on $[a, b]$.

b) If $f'(x) >= 0$ for all $x in (a, b)$, then $f$ is increasing on $[a, b]$.

c) If $f'(x) < 0$ for all $x in (a, b)$, then $f$ is strictly decreasing on $[a, b]$.

d) If $f'(x) <= 0$ for all $x in (a, b)$, then $f$ is decreasing on $[a, b]$.

=== Lemma 2.14 (Cauchy mean value theorem)

Suppose that $f$ and $g$ are real functions which are continuous on $[a, b]$ and differentiable on $(a, b)$ with $g'(c) != 0$ for $c in (a, b)$. Then there exists $c in (a, b)$ such that

$ (f'(c))/(g'(c)) = (f(b) - f(a))/(g(b) - g(a)) $

=== Theorem 2.15 (L'Hôpital's rule)

Let $f$ and $g$ be real functions, continuous on a neighbourhood $N$ of $c$ and differentiable on $N backslash {c}$ which satisfy $f(c) = g(c) = 0$ and $g'(x) != 0$ for $x in N backslash {c}$. For $L in RR$,

$ lim_(x arrow.r c) (f'(x))/(g'(x)) = L arrow.r.double lim_(x arrow.r c) f(x)/g(x) = L $

=== Theorem 2.16

Suppose that $f$, $g: (K, infinity) arrow.r RR$ are differentiable functions with $f(x) arrow.r infinity$ and $g(x) arrow.r infinity$ as $x arrow.r infinity$ and $g'(x) != 0$ for all $x > K$. For $L in RR$,

$ lim_(x arrow.r infinity) (f'(x))/(g'(x)) = L arrow.r.double lim_(x arrow.r infinity) f(x)/g(x) = L $

== Power Series

=== Definition 3.1

Let $(a_n)_(n=0)^infinity$ be real numbers. The *power series* with coefficients $(a_n)$ is the real function $f(x) = sum_(n=0)^infinity a_n x^n$. The domain of $f$ is given by

$ "dom"(f) = {x in RR: sum_(n=0)^infinity a_n x^n " converges"} $

and is called the *interval of convergence* of $f$.

=== Lemma 3.2

Let $f(x) = sum_(n=0)^infinity a_n x^n$ be a real power series. Suppose that for some $y in RR$, $f(y)$ converges. Then for all $x in RR$ with $|x| < |y|$, $f(x)$ converges absolutely.

=== Theorem 3.3

Let $f(x) = sum_(n=0)^infinity a_n x^n$ be a real power series. Then exactly one of the following holds:

a) $f(x)$ converges only for $x = 0$;

b) There exists $R in (0, infinity)$ such that $f(x)$ converges absolutely for $|x| < R$ and diverges for $|x| > R$;

c) $f(x)$ converges absolutely for all $x in RR$.

=== Definition 3.4

The *radius of convergence* of $f$ is defined to be:

a) $0$ in case a of Theorem 3.3;

b) $R$ in case b of Theorem 3.3;

c) $infinity$ in case c of Theorem 3.3.

=== Proposition 3.5

Let $f(x) = sum_(n=0)^infinity a_n x^n$ be a real power series. Suppose that $(|a_(n+1)|)/(|a_n|) arrow.r L$ as $n arrow.r infinity$.

a) If $L = infinity$, then $f$ has radius of convergence $0$;

b) If $0 < L < infinity$, then $f$ has radius of convergence $1/L$;

c) If $L = 0$, then $f$ has radius of convergence $infinity$.

=== Lemma 3.6

Let $f(x) = sum_(n=0)^infinity a_n x^n$ be a power series and define a new power series by $g(x) = sum_(n=1)^infinity n a_n x^(n-1)$. Then $f$ and $g$ have the same radii of convergence.

=== Theorem 3.7

Let $f(x) = sum_(n=0)^infinity a_n x^n$ be a power series with radius of convergence $R > 0$. Then $f : (-R, R) arrow.r RR$ is differentiable and has

$ f'(x) = sum_(n=1)^infinity n a_n x^(n-1), forall x in (-R, R) $

=== Definition 3.8

Define $exp : RR arrow.r RR$ by $exp(x) = sum_(n=0)^infinity x^n/(n!)$.

=== Proposition 3.9

Suppose $sum_(n=0)^infinity a_n$ and $sum_(n=0)^infinity b_n$ are absolutely convergent. Then defining $c_n = sum_(i=0)^n a_(n-i) b_i$, the series $sum_(n=0)^infinity c_n$ is absolutely convergent and

$ sum_(n=0)^infinity c_n = (sum_(n=0)^infinity a_n)(sum_(n=0)^infinity b_n) $

=== Lemma 3.10

$exp : RR arrow.r (0, infinity)$ is bijective.

=== Definition 3.11

Define $log : (0, infinity) arrow.r RR$ as the inverse of $exp$.

=== Theorem 3.12 (Taylor's theorem)

Fix $n in NN$. Let $f$ be a real function such that $f, dots, f^((n-1))$ are defined and continuous on $[a, b]$ and $f^((n))$ is defined on $(a, b)$. Then there exists $c in (a, b)$ such that

$ f(b) = f(a) + f'(a)(b - a) + f''(a) (b - a)^2/2 + dots + f^((n-1))(a) (b - a)^(n-1)/(n-1)! + f^((n))(c) (b - a)^n/n! $

=== Definition 3.13

Let $f$ be a real function which is infinitely differentiable at $0$. Then

$ sum_(n=0)^infinity (f^((n))(0))/n! x^n = f(0) + f'(0)x + (f''(0))/2 x^2 + (f^((3))(0))/3 x^3 + dots $

is called the *Maclaurin series* for $f$. We say that the Maclaurin series is valid at $x$ if it converges and equals $f(x)$, i.e.

$ f(x) = sum_(n=0)^infinity (f^((n))(0))/n! x^n $

