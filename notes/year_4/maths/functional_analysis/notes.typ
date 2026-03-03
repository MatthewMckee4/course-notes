#set document(title: "Functional Analysis")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none)
#pagebreak()

= Week 1: Vector Spaces, Normed Spaces, Banach Spaces

== Vector Space (Sec 2.1)

=== 2.1-1 Definition (Vector space)

A *vector space* (or _linear space_) over a field $K$ is a nonempty set $X$ of elements $x, y, dots.c$ (called _vectors_) together with two algebraic operations: _vector addition_ and _multiplication of vectors by scalars_ (elements of $K$).

*Vector addition* associates with every ordered pair $(x, y)$ of vectors a vector $x + y$, called the _sum_, such that:
- $x + y = y + x$ (commutativity)
- $x + (y + z) = (x + y) + z$ (associativity)
- There exists a _zero vector_ $0$ such that $x + 0 = x$ for all $x$
- For every $x$ there exists $-x$ such that $x + (-x) = 0$

*Multiplication by scalars* associates with every vector $x$ and scalar $alpha$ a vector $alpha x$, such that for all vectors $x, y$ and scalars $alpha, beta$:
$ alpha (beta x) = (alpha beta) x, quad 1 x = x, quad alpha (x + y) = alpha x + alpha y, quad (alpha + beta) x = alpha x + beta x $

$K$ is the *scalar field* of $X$. If $K = RR$, then $X$ is a *real vector space*. If $K = CC$, then $X$ is a *complex vector space*.

For all vectors and scalars: $0 x = theta$, $alpha theta = theta$, $(-1) x = -x$.

=== Examples

*2.1-2 Space $RR^n$.* All $n$-tuples $x = (xi_1, dots.c, xi_n)$ of reals with componentwise operations.

*2.1-3 Space $CC^n$.* All $n$-tuples of complex numbers with componentwise operations.

*2.1-4 Space $C[a, b]$.* All continuous real-valued functions on $[a, b]$ with $(x + y)(t) = x(t) + y(t)$, $(alpha x)(t) = alpha x(t)$.

*2.1-5 Space $l^2$.* Sequences $(xi_j)$ with $sum |xi_j|^2 < infinity$, operations defined componentwise.

=== Subspaces, Span

A *subspace* of a vector space $X$ is a nonempty subset $Y subset.eq X$ such that $alpha y_1 + beta y_2 in Y$ for all $y_1, y_2 in Y$ and scalars $alpha, beta$.

The *span* of $M subset X$ is the set of all linear combinations of vectors from $M$, written $"span" M$.

=== 2.1-6 Definition (Linear independence)

A set ${x_1, dots.c, x_r}$ is *linearly independent* if $alpha_1 x_1 + dots.c + alpha_r x_r = 0$ implies $alpha_1 = dots.c = alpha_r = 0$. Otherwise it is *linearly dependent*.

=== 2.1-7 Definition (Dimension)

$X$ is *finite dimensional* with $dim X = n$ if $X$ contains a linearly independent set of $n$ vectors but any set of $n + 1$ vectors is linearly dependent. Otherwise $X$ is *infinite dimensional*.

A *basis* (or *Hamel basis*) for $X$ is a linearly independent subset that spans $X$. Every $x in X$ has a unique representation as a finite linear combination of basis elements.

=== 2.1-8 Theorem (Dimension of a subspace)

_Any proper subspace $Y$ of an $n$-dimensional vector space $X$ has $dim Y < n$._

== Normed Space, Banach Space (Sec 2.2)

=== 2.2-1 Definition (Normed space, Banach space)

A *normed space* $X$ is a vector space with a *norm* $|| dot ||$ satisfying:

/ (N1): $||x|| >= 0$
/ (N2): $||x|| = 0 <==> x = 0$
/ (N3): $||alpha x|| = |alpha| ||x||$
/ (N4): $||x + y|| <= ||x|| + ||y||$ #h(2em) (Triangle inequality)

A *Banach space* is a complete normed space. The norm induces a metric $d(x, y) = ||x - y||$.

The *reverse triangle inequality*: $abs(||y|| - ||x||) <= ||y - x||$.

=== Examples

*2.2-2 Euclidean space $RR^n$ and unitary space $CC^n$.* Banach spaces with $||x|| = (sum_(j=1)^n |xi_j|^2)^(1\/2)$.

*2.2-3 Space $l^p$.* Banach space with $||x|| = (sum_(j=1)^infinity |xi_j|^p)^(1\/p)$.

*2.2-4 Space $l^infinity$.* Banach space with $||x|| = sup_j |xi_j|$.

*2.2-5 Space $C[a, b]$.* Banach space with $||x|| = max_(t in [a,b]) |x(t)|$.

*2.2-6 Incomplete normed spaces.* $C[0, 1]$ with $||x|| = integral_0^1 |x(t)| dif t$ is _not_ complete.

*2.2-7 Completion $L^2[a, b]$.* The space of continuous functions on $[a, b]$ with $||x|| = (integral_a^b x(t)^2 dif t)^(1\/2)$ is _not_ complete. Its completion is $L^2[a, b]$, a Banach space. More generally, $L^p[a, b]$ is the completion under $||x||_p = (integral_a^b |x(t)|^p dif t)^(1\/p)$.

=== 2.2-9 Lemma (Translation invariance)

_A metric $d$ induced by a norm satisfies:_
+ $d(x + a, y + a) = d(x, y)$
+ $d(alpha x, alpha y) = |alpha| d(x, y)$

=== Schauder Basis

A sequence $(e_n)$ in a normed space $X$ is a *Schauder basis* if for every $x in X$ there is a unique sequence of scalars $(alpha_n)$ such that $||x - (alpha_1 e_1 + dots.c + alpha_n e_n)|| -> 0$ as $n -> infinity$. We write $x = sum_(k=1)^infinity alpha_k e_k$.

For example, $l^p$ has Schauder basis $(e_n)$ where $e_n = (delta_(n j))$.

= Week 2: Convergence, Completeness, Further Properties

== Convergence, Cauchy Sequence, Completeness (Sec 1.4)

=== 1.4-1 Definition (Convergence)

A sequence $(x_n)$ in a metric space $X = (X, d)$ _converges_ to $x in X$ if $lim_(n -> infinity) d(x_n, x) = 0$, written $x_n -> x$.

=== 1.4-2 Lemma

*(a)* A convergent sequence is bounded and its limit is unique.

*(b)* If $x_n -> x$ and $y_n -> y$, then $d(x_n, y_n) -> d(x, y)$.

=== 1.4-3 Definition (Cauchy sequence, completeness)

$(x_n)$ is *Cauchy* if for every $epsilon > 0$ there is $N$ such that $d(x_m, x_n) < epsilon$ for all $m, n > N$. The space $X$ is *complete* if every Cauchy sequence converges.

=== 1.4-4 Theorem

_$RR$ and $CC$ are complete metric spaces._

=== 1.4-5 Theorem

_Every convergent sequence is Cauchy._ The converse holds only in complete spaces.

=== 1.4-6 Theorem (Closure, closed set)

*(a)* $x in overline(M) <==>$ there is $(x_n)$ in $M$ with $x_n -> x$.

*(b)* $M$ is closed $<==>$ ($x_n in M$, $x_n -> x$ implies $x in M$).

=== 1.4-7 Theorem (Complete subspace)

_A subspace $M$ of a complete metric space $X$ is complete if and only if $M$ is closed in $X$._

=== 1.4-8 Theorem (Continuous mapping)

_$T: X -> Y$ is continuous at $x_0$ if and only if $x_n -> x_0$ implies $T x_n -> T x_0$._

== Further Properties of Normed Spaces (Sec 2.3)

=== 2.3-1 Theorem (Subspace of a Banach space)

_A subspace $Y$ of a Banach space $X$ is complete if and only if $Y$ is closed in $X$._

=== Convergence in normed spaces

$(x_n)$ _converges_ to $x$ if $||x_n - x|| -> 0$. $(x_n)$ is _Cauchy_ if $||x_m - x_n|| -> 0$ as $m, n -> infinity$.

An infinite series $sum_(k=1)^infinity x_k$ _converges_ if the partial sums $s_n = x_1 + dots.c + x_n$ converge. It is *absolutely convergent* if $sum ||x_k||$ converges. In a normed space, absolute convergence implies convergence if and only if the space is complete.

== Completeness Proofs (Sec 1.5)

General pattern: (1) construct a candidate limit $x$, (2) prove $x$ is in the space, (3) prove $x_n -> x$.

=== 1.5-1 Completeness of $RR^n$ and $CC^n$

For a Cauchy sequence $(x_m)$ in $RR^n$, each component sequence $(xi_j^((m)))$ is Cauchy in $RR$, hence converges to some $xi_j$. Then $x = (xi_1, dots, xi_n) in RR^n$ and $x_m -> x$.

=== 1.5-2 Completeness of $l^infinity$

For a Cauchy sequence $(x_m)$ in $l^infinity$ with $x_m = (xi_j^((m)))$, each $(xi_j^((m)))_(m=1)^infinity$ is Cauchy in $RR$ (or $CC$) and converges to $xi_j$. Define $x = (xi_j)$. Since $|xi_j^((m)) - xi_j| <= epsilon$ for $m > N$ and $|xi_j| <= epsilon + k_m$ (where $|xi_j^((m))| <= k_m$), $x in l^infinity$. Also $d(x_m, x) = sup_j |xi_j^((m)) - xi_j| <= epsilon$.

=== 1.5-4 Completeness of $l^p$

For a Cauchy sequence in $l^p$, componentwise limits exist. Using Minkowski's inequality and letting $n -> infinity$ in the Cauchy condition shows $x = (xi_j) in l^p$ and $x_m -> x$.

= Week 3: Linear Operators, Bounded Operators, Linear Functionals

== Linear Operators (Sec 2.6)

=== 2.6-1 Definition (Linear operator)

A *linear operator* $T$ satisfies $T(alpha x + beta y) = alpha T x + beta T y$ for all $x, y in cal(D)(T)$ and scalars $alpha, beta$. The *null space* $cal(N)(T) = {x in cal(D)(T) : T x = 0}$.

=== Examples

- *Identity operator*: $I x = x$
- *Zero operator*: $0 x = 0$
- *Differentiation*: $T x(t) = x'(t)$ on polynomials
- *Integration*: $T x(t) = integral_a^t x(tau) dif tau$ on $C[a, b]$
- *Matrices*: $A = (alpha_(j k))$ defines $T: RR^n -> RR^r$ by $y = A x$

=== 2.6-9 Theorem (Range and null space)

*(a)* $cal(R)(T)$ is a vector space. *(b)* If $dim cal(D)(T) = n$, then $dim cal(R)(T) <= n$. *(c)* $cal(N)(T)$ is a vector space.

The inverse $T^(-1)$ exists if and only if $cal(N)(T) = {0}$.

== Bounded and Continuous Linear Operators (Sec 2.7)

=== 2.7-1 Definition (Bounded linear operator)

$T: cal(D)(T) -> Y$ is *bounded* if there exists $c$ such that $||T x|| <= c ||x||$ for all $x in cal(D)(T)$. The *operator norm* is:

$ ||T|| = sup_(x != 0) (||T x||) / (||x||) = sup_(||x|| = 1) ||T x|| $

Key inequality: $||T x|| <= ||T|| ||x||$.

=== Examples

- *Identity*: $||I|| = 1$ on $X != {0}$.
- *Differentiation*: $T x = x'$ on polynomials with sup-norm is *unbounded* (take $x_n (t) = t^n$: $||T x_n|| / ||x_n|| = n$).
- *Integral operator*: $y(t) = integral_0^1 k(t, tau) x(tau) dif tau$ with continuous kernel $k$ is bounded: $||T x|| <= k_0 ||x||$ where $k_0 = max |k|$.

=== 2.7-8 Theorem (Finite dimension)

_If $X$ is finite dimensional, every linear operator on $X$ is bounded._

=== 2.7-9 Theorem (Continuity and boundedness)

*(a)* _$T$ is continuous if and only if $T$ is bounded._

*(b)* _If $T$ is continuous at a single point, it is continuous everywhere._

*Proof of (a).* If $T$ is bounded, then $||T x - T x_0|| = ||T(x - x_0)|| <= ||T|| ||x - x_0|| < epsilon$ whenever $||x - x_0|| < epsilon / ||T||$. Conversely, if $T$ is continuous at $x_0$, there is $delta > 0$ with $||T x - T x_0|| <= epsilon$ for $||x - x_0|| <= delta$. For any $y != 0$, set $x = x_0 + (delta / ||y||) y$. Then $||T y|| <= (epsilon / delta) ||y||$. $square$

=== 2.7-10 Corollary

*(a)* $x_n -> x$ implies $T x_n -> T x$. *(b)* $cal(N)(T)$ is closed.

=== 2.7-11 Theorem (Bounded linear extension)

_If $T: cal(D)(T) -> Y$ is bounded linear with $Y$ a Banach space, then $T$ has a unique bounded linear extension $tilde(T): overline(cal(D)(T)) -> Y$ with $||tilde(T)|| = ||T||$._

== Linear Functionals (Sec 2.8, first part)

A *functional* maps into $RR$ or $CC$. A *linear functional* $f: cal(D)(f) -> K$ satisfies $f(alpha x + beta y) = alpha f(x) + beta f(y)$. A *bounded linear functional* satisfies $|f(x)| <= c ||x||$ with norm $||f|| = sup_(x != 0) |f(x)| / ||x||$.

=== Examples

- *Dot product*: $f(x) = x dot a$ on $RR^3$ has $||f|| = ||a||$.
- *Definite integral*: $f(x) = integral_a^b x(t) dif t$ on $C[a, b]$ has $||f|| = b - a$.

= Weeks 4--5: Linear Functionals, Dual Spaces, Normed Spaces of Operators

== Linear Functionals (Sec 2.8, continued)

=== 2.8-7 Evaluation functional on $C[a, b]$

For fixed $t_0 in [a, b]$, $f_1(x) = x(t_0)$ is linear, bounded, with $||f_1|| = 1$.

=== 2.8-8 Functional on $l^2$

For fixed $a = (alpha_j) in l^2$, $f(x) = sum_(j=1)^infinity xi_j alpha_j$ is bounded by Cauchy--Schwarz: $|f(x)| <= ||x|| ||a||$.

=== Algebraic Dual Space

The set $X^*$ of all linear functionals on a vector space $X$ forms a vector space (the *algebraic dual space*) with $(f_1 + f_2)(x) = f_1(x) + f_2(x)$ and $(alpha f)(x) = alpha f(x)$.

The *second algebraic dual* $X^(**)  = (X^*)^*$ contains functionals $g_x (f) = f(x)$ for fixed $x in X$.

== Normed Spaces of Operators (Sec 2.10)

=== 2.10-1 Theorem (Space $B(X, Y)$)

_The set $B(X, Y)$ of all bounded linear operators from normed space $X$ into normed space $Y$ is a normed space with $||T|| = sup_(||x|| = 1) ||T x||$._

=== 2.10-2 Theorem (Completeness)

_If $Y$ is a Banach space, then $B(X, Y)$ is a Banach space._

*Proof.* Let $(T_n)$ be Cauchy in $B(X, Y)$. For each $x$, $(T_n x)$ is Cauchy in $Y$ (since $||T_n x - T_m x|| <= ||T_n - T_m|| ||x||$) and converges to some $y in Y$. Define $T x = y$. Then $T$ is linear, and letting $m -> infinity$ in $||T_n x - T_m x|| <= epsilon ||x||$ gives $||T_n x - T x|| <= epsilon ||x||$, so $T_n - T$ is bounded, hence $T in B(X, Y)$ and $||T_n - T|| -> 0$. $square$

=== 2.10-3 Definition (Dual Space $X'$)

The *dual space* $X'$ is the set of all bounded linear functionals on $X$, with $||f|| = sup_(||x|| = 1) |f(x)|$. Since $X' = B(X, K)$ with $K = RR$ or $CC$ complete:

=== 2.10-4 Theorem

_The dual space $X'$ of a normed space $X$ is a Banach space (whether or not $X$ is)._

=== Dual Space Examples

*2.10-5* The dual of $RR^n$ is $RR^n$: every $f in (RR^n)'$ has the form $f(x) = sum xi_k gamma_k$ with $||f|| = (sum gamma_k^2)^(1\/2)$.

*2.10-6* The dual of $l^1$ is $l^infinity$: every $f in (l^1)'$ has the form $f(x) = sum xi_k gamma_k$ with $||f|| = sup_j |gamma_j|$.

*2.10-7* The dual of $l^p$ is $l^q$ where $1 / p + 1 / q = 1$ ($1 < p < infinity$): every $f in (l^p)'$ has the form $f(x) = sum xi_k gamma_k$ with $||f|| = (sum |gamma_k|^q)^(1\/q)$.

#table(
  columns: 2,
  align: (center, center),
  [*Space $X$*], [*Dual Space $X'$*],
  [$RR^n$], [$RR^n$],
  [$l^1$], [$l^infinity$],
  [$l^p$ ($1 < p < infinity$)], [$l^q$ ($1\/p + 1\/q = 1$)],
)

= Week 6: Inner Product Spaces, Orthogonal Complements

== Inner Product Spaces (Sec 3.1)

=== 3.1-1 Definition (Inner product space, Hilbert space)

An *inner product space* (or _pre-Hilbert space_) is a vector space $X$ with an *inner product* $chevron.l dot, dot chevron.r: X times X -> K$ satisfying:

- *(IP1)* $chevron.l x + y, z chevron.r = chevron.l x, z chevron.r + chevron.l y, z chevron.r$
- *(IP2)* $chevron.l alpha x, y chevron.r = alpha chevron.l x, y chevron.r$
- *(IP3)* $chevron.l x, y chevron.r = #math.overline($chevron.l y, x chevron.r$)$
- *(IP4)* $chevron.l x, x chevron.r >= 0$, and $chevron.l x, x chevron.r = 0 <==> x = 0$

A *Hilbert space* is a complete inner product space. The inner product induces a norm $||x|| = #math.sqrt($chevron.l x, x chevron.r$)$ and metric $d(x, y) = ||x - y||$.

The inner product is *sesquilinear*: linear in the first argument, conjugate linear in the second.

The *parallelogram equality*: $||x + y||^2 + ||x - y||^2 = 2(||x||^2 + ||y||^2)$.

If a norm does not satisfy this, it cannot come from an inner product.

=== 3.1-2 Definition (Orthogonality)

$x perp y$ if $chevron.l x, y chevron.r = 0$.

=== Examples

*3.1-3 $RR^n$*: Hilbert space with $chevron.l x, y chevron.r = sum xi_j eta_j$.

*3.1-4 $CC^n$*: Hilbert space with $chevron.l x, y chevron.r = sum xi_j overline(eta)_j$.

*3.1-5 $L^2[a, b]$*: Hilbert space with $chevron.l x, y chevron.r = integral_a^b x(t) overline(y(t)) dif t$.

*3.1-6 $l^2$*: Hilbert space with $chevron.l x, y chevron.r = sum_(j=1)^infinity xi_j overline(eta)_j$.

*3.1-7 $l^p$ ($p != 2$)*: _Not_ an inner product space (parallelogram equality fails).

*3.1-8 $C[a, b]$*: With sup-norm, _not_ an inner product space.

== Further Properties of Inner Product Spaces (Sec 3.2)

=== 3.2-1 Lemma (Schwarz inequality, triangle inequality)

*(a) Schwarz inequality:*
$ |chevron.l x, y chevron.r| <= ||x|| ||y|| $
Equality iff ${x, y}$ is linearly dependent.

*(b) Triangle inequality:*
$ ||x + y|| <= ||x|| + ||y|| $
Equality iff $y = 0$ or $x = c y$ with $c >= 0$.

*Proof of (a).* For $y != 0$, choose $alpha$ with $overline(alpha) = chevron.l y, x chevron.r / chevron.l y, y chevron.r$. Then $0 <= ||x - alpha y||^2 = ||x||^2 - |chevron.l x, y chevron.r|^2 / ||y||^2$. $square$

=== 3.2-2 Lemma (Continuity of inner product)

_If $x_n -> x$ and $y_n -> y$, then $chevron.l x_n, y_n chevron.r -> chevron.l x, y chevron.r$._

=== 3.2-3 Theorem (Completion)

_Every inner product space has a completion which is a Hilbert space, unique up to isomorphism._

=== 3.2-4 Theorem (Subspace)

*(a)* A subspace $Y$ of a Hilbert space $H$ is complete iff $Y$ is closed. *(b)* Finite-dimensional subspaces are complete. *(c)* Subsets of separable spaces are separable.

== Orthogonal Complements and Direct Sums (Sec 3.3, first part)

The *distance* from $x$ to $M != emptyset$: $delta = inf_(tilde(y) in M) ||x - tilde(y)||$.

A set $M$ is *convex* if for all $x, y in M$ and $0 <= alpha <= 1$: $alpha x + (1 - alpha) y in M$.

=== 3.3-1 Theorem (Minimizing vector)

_Let $M != emptyset$ be a convex complete subset of an inner product space $X$. For every $x in X$ there exists a unique $y in M$ such that $delta = ||x - y||$._

*Proof.* Choose $(y_n)$ in $M$ with $||x - y_n|| -> delta$. By the parallelogram equality on $v_n = y_n - x$:
$ ||y_n - y_m||^2 <= -4 delta^2 + 2(delta_n^2 + delta_m^2) -> 0 $
so $(y_n)$ is Cauchy and converges to $y in M$ with $||x - y|| = delta$. Uniqueness follows from convexity and the parallelogram equality. $square$

=== 3.3-2 Lemma (Orthogonality)

_If $M = Y$ is a complete subspace, then $z = x - y perp Y$._

=== 3.3-3 Definition (Direct sum)

$X = Y plus.o Z$ if each $x in X$ has a unique decomposition $x = y + z$ with $y in Y$, $z in Z$.

=== Orthogonal Complement

$ Y^perp = {z in H : z perp Y} = {z in H : chevron.l z, v chevron.r = 0 "for all" v in Y} $

=== 3.3-4 Theorem (Projection theorem)

_For any closed subspace $Y$ of a Hilbert space $H$:_
$ H = Y plus.o Y^perp $

= Week 7: Orthogonal Complements (ctd), Orthonormal Sets

== Orthogonal Complements and Direct Sums (Sec 3.3, continued)

=== Orthogonal Projection

The decomposition $x = y + z$ ($y in Y$, $z in Y^perp$) defines the *(orthogonal) projection* $P: H -> Y$, $x |-> y = P x$. $P$ is a bounded linear operator with $P^2 = P$ (idempotent).

=== 3.3-5 Lemma

$Y^perp = cal(N)(P)$ (the null space of the projection).

=== Annihilator

The *annihilator* of $M != emptyset$: $M^perp = {x in X : chevron.l x, v chevron.r = 0 "for all" v in M}$.

$M^perp$ is always a closed vector space, and $M subset M^(perp perp)$.

=== 3.3-6 Lemma

_If $Y$ is a closed subspace of a Hilbert space $H$, then $Y = Y^(perp perp)$._

=== 3.3-7 Lemma (Dense set)

_For $M != emptyset$ in a Hilbert space $H$: $"span" M$ is dense in $H$ iff $M^perp = {0}$._

== Orthonormal Sets and Sequences (Sec 3.4)

=== 3.4-1 Definition

An *orthonormal set* $M subset X$ satisfies $chevron.l x, y chevron.r = delta_(x y)$ (Kronecker delta) for all $x, y in M$.

=== Pythagorean relation

For orthogonal $x, y$: $||x + y||^2 = ||x||^2 + ||y||^2$. More generally, for orthogonal ${x_1, dots, x_n}$:
$ ||x_1 + dots.c + x_n||^2 = ||x_1||^2 + dots.c + ||x_n||^2 $

=== 3.4-2 Lemma

_An orthonormal set is linearly independent._

=== Examples

*3.4-3 $RR^3$*: $(1,0,0)$, $(0,1,0)$, $(0,0,1)$ form an orthonormal set.

*3.4-4 $l^2$*: $e_n = (delta_(n j))$ form an orthonormal sequence.

*3.4-5 Trigonometric functions.* On $[0, 2 pi]$ with $chevron.l x, y chevron.r = integral_0^(2 pi) x(t) y(t) dif t$, the orthonormal sequences are $e_0(t) = 1 / sqrt(2 pi)$, $e_n(t) = cos(n t) / sqrt(pi)$ and $tilde(e)_n(t) = sin(n t) / sqrt(pi)$.

=== Orthogonal Projection onto $Y_n$

For any $x in X$ and orthonormal ${e_1, dots, e_n}$, the projection onto $Y_n = "span"{e_1, dots, e_n}$ is:
$ y = sum_(k=1)^n chevron.l x, e_k chevron.r e_k $

Then $z = x - y perp y$ and $||x||^2 = ||y||^2 + ||z||^2 = sum_(k=1)^n |chevron.l x, e_k chevron.r|^2 + ||z||^2$.

=== 3.4-6 Theorem (Bessel inequality)

_For an orthonormal sequence $(e_k)$ and any $x in X$:_
$ sum_(k=1)^infinity |chevron.l x, e_k chevron.r|^2 <= ||x||^2 $

The quantities $chevron.l x, e_k chevron.r$ are the *Fourier coefficients* of $x$.

=== Gram--Schmidt Process

Given a linearly independent sequence $(x_j)$, produce an orthonormal sequence $(e_j)$ with $"span"{e_1, dots, e_n} = "span"{x_1, dots, x_n}$ for every $n$:

$ e_1 = x_1 / ||x_1||, quad v_n = x_n - sum_(k=1)^(n-1) chevron.l x_n, e_k chevron.r e_k, quad e_n = v_n / ||v_n|| $

= Week 8: Generalised Fourier Series, Total Orthonormal Sets

== Series Related to Orthonormal Sequences (Sec 3.5)

=== 3.5-1 Fourier Series

The *Fourier series* of a $2 pi$-periodic continuous function $x$ is $a_0 + sum_(k=1)^infinity (a_k cos k t + b_k sin k t)$ with *Euler formulas*:
$ a_0 = 1/(2 pi) integral_0^(2 pi) x(t) dif t, quad a_k = 1/pi integral_0^(2 pi) x(t) cos k t dif t, quad b_k = 1/pi integral_0^(2 pi) x(t) sin k t dif t $

In terms of the orthonormal sequences from 3.4-5:
$ x = chevron.l x, e_0 chevron.r e_0 + sum_(k=1)^infinity [chevron.l x, e_k chevron.r e_k + chevron.l x, tilde(e)_k chevron.r tilde(e)_k] $

=== 3.5-2 Theorem (Convergence)

_Let $(e_k)$ be orthonormal in a Hilbert space $H$. Then:_

*(a)* $sum_(k=1)^infinity alpha_k e_k$ converges iff $sum_(k=1)^infinity |alpha_k|^2$ converges.

*(b)* If $sum alpha_k e_k$ converges to $x$, then $alpha_k = chevron.l x, e_k chevron.r$.

*(c)* For any $x in H$, the series $sum chevron.l x, e_k chevron.r e_k$ converges.

*Proof of (a).* By orthonormality, $||s_n - s_m||^2 = |alpha_(m+1)|^2 + dots.c + |alpha_n|^2 = sigma_n - sigma_m$. So $(s_n)$ is Cauchy iff $sigma_n = sum_(k=1)^n |alpha_k|^2$ is Cauchy. Both $H$ and $RR$ are complete. $square$

=== 3.5-3 Lemma

_Any $x$ in an inner product space has at most countably many nonzero Fourier coefficients with respect to an orthonormal family. The sum $sum chevron.l x, e_k chevron.r e_k$ is independent of the ordering._

== Total Orthonormal Sets and Sequences (Sec 3.6)

=== 3.6-1 Definition

A *total set* in a normed space $X$ is a subset $M$ whose span is dense in $X$. A *total orthonormal set* is sometimes called an *orthonormal basis*.

Every Hilbert space $H != {0}$ has a total orthonormal set. All total orthonormal sets in $H$ have the same cardinality, called the *Hilbert dimension*.

=== 3.6-2 Theorem (Totality)

*(a)* If $M$ is total in $X$, then $x perp M ==> x = 0$.

*(b)* If $X$ is complete, the converse also holds.

=== 3.6-3 Theorem (Parseval relation)

_An orthonormal set $M$ in a Hilbert space $H$ is total iff for all $x in H$:_
$ sum_k |chevron.l x, e_k chevron.r|^2 = ||x||^2 quad ("Parseval relation") $

*Proof.* If $M$ is not total, $exists x != 0$ with $x perp M$, giving $0 != ||x||^2$ but $sum |chevron.l x, e_k chevron.r|^2 = 0$. Conversely, if $M$ is total, define $y = sum chevron.l x, e_k chevron.r e_k$. Then $x - y perp M$, so $x - y in M^perp = {0}$ by 3.3-7, giving $x = y$ and $||x||^2 = sum |chevron.l x, e_k chevron.r|^2$. $square$

=== 3.6-4 Theorem (Separable Hilbert spaces)

*(a)* If $H$ is separable, every orthonormal set in $H$ is countable.

*(b)* If $H$ has a total orthonormal sequence, then $H$ is separable.

=== 3.6-5 Theorem (Isomorphism and Hilbert dimension)

_Two Hilbert spaces (both real or both complex) are isomorphic iff they have the same Hilbert dimension._

= Week 9: Riesz Representation, Hilbert-Adjoint Operator

== Representation of Functionals on Hilbert Spaces (Sec 3.8)

=== 3.8-1 Theorem (Riesz representation)

_Every bounded linear functional $f$ on a Hilbert space $H$ has a unique representation_
$ f(x) = chevron.l x, z chevron.r $
_where $z in H$ depends on $f$ and $||z|| = ||f||$._

*Proof.* If $f = 0$, take $z = 0$. Let $f != 0$. Then $cal(N)(f)$ is closed and $cal(N)(f) != H$, so $cal(N)(f)^perp$ contains some $z_0 != 0$. For any $x in H$, $v = f(x) z_0 - f(z_0) x in cal(N)(f)$, so $chevron.l v, z_0 chevron.r = 0$ gives:
$ f(x) = (f(z_0)) / (||z_0||^2) chevron.l x, z_0 chevron.r = chevron.l x, z chevron.r quad "where" z = (overline(f(z_0))) / (||z_0||^2) z_0 $

*Uniqueness:* $chevron.l x, z_1 chevron.r = chevron.l x, z_2 chevron.r$ for all $x$ implies $||z_1 - z_2||^2 = 0$.

*Norm:* From $||z||^2 = f(z) <= ||f|| ||z||$ we get $||z|| <= ||f||$. From $|f(x)| = |chevron.l x, z chevron.r| <= ||x|| ||z||$ we get $||f|| <= ||z||$. $square$

=== 3.8-2 Lemma

_If $chevron.l v_1, w chevron.r = chevron.l v_2, w chevron.r$ for all $w$, then $v_1 = v_2$._

=== 3.8-3 Definition (Sesquilinear form)

A *sesquilinear form* $h: X times Y -> K$ is linear in the first argument and conjugate linear in the second. It is *bounded* if $|h(x, y)| <= c ||x|| ||y||$ with norm $||h|| = sup |h(x,y)| / (||x|| ||y||)$.

=== 3.8-4 Theorem (Riesz representation for sesquilinear forms)

_For a bounded sesquilinear form $h: H_1 times H_2 -> K$ on Hilbert spaces, there exists a unique bounded linear operator $S: H_1 -> H_2$ with $h(x, y) = chevron.l S x, y chevron.r$ and $||S|| = ||h||$._

== Hilbert-Adjoint Operator (Sec 3.9, first part)

=== 3.9-1 Definition

The *Hilbert-adjoint operator* $T^*: H_2 -> H_1$ of a bounded linear operator $T: H_1 -> H_2$ is defined by:
$ chevron.l T x, y chevron.r = chevron.l x, T^* y chevron.r quad "for all" x in H_1, y in H_2 $

=== 3.9-2 Theorem

_$T^*$ exists, is unique, is a bounded linear operator, and $||T^*|| = ||T||$._

*Proof.* $h(y, x) = chevron.l y, T x chevron.r$ is a bounded sesquilinear form with $||h|| = ||T||$. By Theorem 3.8-4, $h(y, x) = chevron.l T^* y, x chevron.r$ for a unique bounded linear $T^*$ with $||T^*|| = ||h|| = ||T||$. $square$

=== 3.9-3 Lemma (Zero operator)

*(a)* $Q = 0 <==> chevron.l Q x, y chevron.r = 0$ for all $x, y$.

*(b)* If $X$ is complex and $chevron.l Q x, x chevron.r = 0$ for all $x$, then $Q = 0$.

Part (b) fails for real spaces (e.g., rotation by $pi / 2$ in $RR^2$).

= Week 10: Hilbert-Adjoint Operator (ctd), Self-Adjoint Operators

== Hilbert-Adjoint Operator (Sec 3.9, continued)

=== 3.9-4 Theorem (Properties)

For bounded linear operators $S, T: H_1 -> H_2$ and scalar $alpha$:

- (a) $chevron.l T^* y, x chevron.r = chevron.l y, T x chevron.r$
- (b) $(S + T)^* = S^* + T^*$
- (c) $(alpha T)^* = overline(alpha) T^*$
- (d) $(T^*)^* = T$
- (e) $||T^* T|| = ||T T^*|| = ||T||^2$
- (f) $T^* T = 0 <==> T = 0$
- (g) $(S T)^* = T^* S^*$ #h(2em) (when $H_2 = H_1$)

*Proof of (e).* From $||T x||^2 = chevron.l T x, T x chevron.r = chevron.l T^* T x, x chevron.r <= ||T^* T|| ||x||^2$, taking $sup$ over $||x|| = 1$ gives $||T||^2 <= ||T^* T|| <= ||T^*|| ||T|| = ||T||^2$. $square$

== Self-Adjoint, Unitary and Normal Operators (Sec 3.10)

=== 3.10-1 Definition

A bounded linear operator $T: H -> H$ is:

- *Self-adjoint* (Hermitian) if $T^* = T$, equivalently $chevron.l T x, y chevron.r = chevron.l x, T y chevron.r$
- *Unitary* if $T$ is bijective and $T^* = T^(-1)$
- *Normal* if $T T^* = T^* T$

Self-adjoint and unitary operators are normal.

=== 3.10-2 Matrix representations

For $T: CC^n -> CC^n$ with matrix $A$, the Hilbert-adjoint $T^*$ has matrix $overline(A)^TT$ (conjugate transpose). Hence:

- Self-adjoint $<==>$ $A$ is Hermitian ($overline(A)^TT = A$)
- Unitary $<==>$ $A$ is unitary ($overline(A)^TT = A^(-1)$)
- For real spaces: self-adjoint $<==>$ symmetric, unitary $<==>$ orthogonal

=== 3.10-3 Theorem (Self-adjointness)

*(a)* If $T = T^*$, then $chevron.l T x, x chevron.r in RR$ for all $x$.

*(b)* If $H$ is complex and $chevron.l T x, x chevron.r in RR$ for all $x$, then $T = T^*$.

Part (b) requires $H$ to be complex.

=== 3.10-4 Theorem

_The product $S T$ of self-adjoint operators is self-adjoint iff $S T = T S$._

*Proof.* $(S T)^* = T^* S^* = T S$. So $S T = (S T)^* <==> S T = T S$. $square$

=== 3.10-5 Theorem (Sequences)

_If $(T_n)$ is a sequence of bounded self-adjoint operators with $T_n -> T$ in operator norm, then $T$ is self-adjoint._

*Proof.* $||T - T^*|| <= ||T - T_n|| + ||T_n - T_n^*|| + ||T_n^* - T^*|| = 2||T_n - T|| -> 0$. $square$

=== 3.10-6 Theorem (Unitary operator)

_For unitary $U: H -> H$:_

- (a) $U$ is isometric: $||U x|| = ||x||$
- (b) $||U|| = 1$ (if $H != {0}$)
- (c) $U^(-1) = U^*$ is unitary
- (d) $U V$ is unitary if $V$ is unitary
- (e) $U$ is normal
- (f) A bounded linear $T$ on a complex $H$ is unitary iff $T$ is isometric and surjective

An isometric operator need not be unitary (may fail to be surjective). Example: the right shift $(xi_1, xi_2, dots) |-> (0, xi_1, xi_2, dots)$ on $l^2$ is isometric but not surjective.
