#set document(title: "Algebraic and Geometric Topology")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none)
#pagebreak()

= §1: Point-Set Topology

== Metric Spaces

=== 1.1 Definition (Metric)

A *metric* on a set $X$ is a function $d: X times X -> RR$ satisfying for all $x, y, z in X$:
+ Positivity: $d(x,y) gt.eq 0$, and $d(x,y) = 0$ iff $x = y$
+ Symmetry: $d(x,y) = d(y,x)$
+ Triangle inequality: $d(x,z) lt.eq d(x,y) + d(y,z)$

A set $X$ together with a metric $d$ is called a *metric space* $(X, d)$.

=== 1.2 Definition (Continuity for Metric Spaces)

Let $X$ and $Y$ be metric spaces. A function $f: X -> Y$ is *continuous* at a point $p in X$ if, for every $epsilon > 0$, there exists $delta > 0$ so that for all $x in X$,
$ d(x, p) < delta quad => quad d(f(x), f(p)) < epsilon. $
We say $f$ is *continuous* if it is continuous at every point $p in X$.

=== 1.3 Definition (Open Set)

Let $X$ be a metric space. An *open ball* is $B(c, r) = \{x in X mid(|)d(x, c) < r\}$ where $c in X$ is the *centre* and $r > 0$ is the *radius*. A set $U subset.eq X$ is *open* if for every $x in U$ there exists an open ball $B(x, r)$ contained in $U$.

=== 1.4 Proposition (Properties of Open Sets)

_Let $X$ be a metric space._
+ _$X$ and $emptyset$ are open in $X$._
+ _Any union of open sets in $X$ is open._
+ _Any intersection of finitely many open sets in $X$ is open._

=== 1.5 Remark

An intersection of infinitely many open sets is not necessarily open. For example, each $(-1\/n, 1\/n)$ is open in $RR$, but $inter.big_(n=1)^oo (-1\/n, 1\/n) = \{0\}$ is not open.

=== 1.6 Proposition (Continuity via Open Sets)

_If $X$ and $Y$ are metric spaces, a function $f: X -> Y$ is continuous if and only if $f^(-1)(U)$ is open in $X$ for every open set $U$ in $Y$._

== Topological Spaces

=== 1.7 Definition (Topology)

A *topology* on a set $X$ is a collection of subsets of $X$ called *open sets*, satisfying:
+ The empty set $emptyset$ and the whole set $X$ are open.
+ Any union of open sets is open.
+ Any intersection of finitely many open sets is open.

A *topological space* is a set $X$ together with a choice of topology on $X$.

An *open neighbourhood* of a point $p in X$ is any open set that contains $p$. A *closed set* in $X$ is a set whose complement is open. Intersection of closed sets is closed, and any union of finitely many closed sets is closed.

=== 1.8 Example (Metric Topology)

Any metric space $X$ is also a topological space, with the open sets defined as in Definition 1.3. The topology on $X$ defined in this fashion is called the *metric topology*.

=== 1.9 Example (Subspace Topology)

Any subset $A$ of a topological space $X$ inherits a topology called the *subspace topology*, where each open set is an intersection $A inter U$ of $A$ with an open set $U$ in $X$. When given this topology, $A$ is said to be a *subspace* of $X$. Note that open subsets of $A$ are not necessarily open in $X$. For example, if $X = RR$ and $A = [-1, 1]$, then $(0, 1] = A inter (0, oo)$ is open in $A$ but not open in $X$.

=== 1.10 Example (Discrete and Indiscrete Topologies)

If $X$ is any set, there are two "extreme" topologies:
+ In the *discrete topology*, every subset of $X$ is open.
+ In the *indiscrete topology*, the only open sets are $emptyset$ and $X$.

== Continuous Functions

=== 1.11 Definition (Continuous Map)

A function $f: X -> Y$ between topological spaces is *continuous* if $f^(-1)(U)$ is open in $X$ for every open set $U subset.eq Y$. We often use the word *map* to mean a continuous function between topological spaces.

=== 1.12 Exercise (Compositions)

_If $f: X -> Y$ and $g: Y -> Z$ are maps, then the composition $g compose f: X -> Z$ is continuous._

=== 1.14 Proposition (Gluing Lemma)

_Let $X$ and $Y$ be topological spaces, and let $f: X -> Y$ be a piecewise function of the form_
$ f(x) = cases(g(x) & "if" x in A, h(x) & "if" x in B) $
_where $A union B = X$ and $g(x) = h(x)$ for all $x in A inter B$. If $A$ and $B$ are closed and the functions $g: A -> Y$ and $h: B -> Y$ are continuous, then $f$ is continuous as well._

== Homeomorphisms

=== 1.16 Definition (Homeomorphism)

A function $h: X -> Y$ between topological spaces is called a *homeomorphism* if it is bijective and both $h$ and $h^(-1)$ are continuous. If such a map exists, then $X$ and $Y$ are *homeomorphic*.

=== 1.18 Example

The arctangent function $tan^(-1): RR -> (-pi\/2, pi\/2)$ is a homeomorphism between $RR$ and the open interval $(-pi\/2, pi\/2)$. Any open interval $(a, b)$ in $RR$ is homeomorphic to $RR$. Any half-open interval $[a, b)$ is homeomorphic to $[0, oo)$.

=== 1.19 Example

Any open ball in $RR^n$ is homeomorphic to $RR^n$ itself. For example, if $B$ is the open unit ball centred at the origin, then $h: B -> RR^n$ defined by $h(x) = x / (1 - ||x||)$ is a homeomorphism.

=== 1.20 Example

A continuous bijection $h: X -> Y$ is not necessarily a homeomorphism. For example, $h: [0, 2pi) -> S^1$ defined by $h(x) = (cos x, sin x)$ is continuous and bijective, but $h^(-1)$ is not continuous at $(1, 0)$.

== Bases

=== 1.21 Definition (Basis)

Let $X$ be a topological space. A *basis* for the topology on $X$ is a collection $cal(B)$ of open sets in $X$, called *basic open sets*, with the property that every open set in $X$ is a union of basic open sets.

=== 1.22 Proposition (Basis for the Metric Topology)

_If $X$ is a metric space, then the collection $cal(B)$ of all open balls in $X$ is a basis for the topology on $X$._

*Proof.* Let $U subset.eq X$ be open. By definition, for every $x in U$ there exists an open ball $B_x$ centred at $x$ contained in $U$. Then $U = union.big_(x in U) B_x$.

=== 1.24 Proposition (Continuity via Basis)

_Let $X$ and $Y$ be topological spaces and let $cal(B)$ be a basis for the topology on $Y$. Then a function $f: X -> Y$ is continuous if and only if $f^(-1)(B)$ is open in $X$ for every basic open set $B in cal(B)$._

*Proof.* If $f$ is continuous, then $f^(-1)(B)$ is open for every basic open set $B$ since $B$ is open. Conversely, if $U subset.eq Y$ is open, write $U = union.big_(i in I) B_i$ for basic open sets $B_i$. Then $f^(-1)(U) = union.big_(i in I) f^(-1)(B_i)$, which is open as a union of open sets.

== Hausdorff Spaces

=== 1.25 Definition (Hausdorff)

A topological space $X$ is *Hausdorff* if, for every pair of distinct points $x, y in X$, there exists an open neighbourhood $U$ of $x$ and an open neighbourhood $V$ of $y$ so that $U inter V = emptyset$.

Any metric space is Hausdorff. Any indiscrete space with two or more points is not Hausdorff.

=== 1.28 Proposition (Finite Subsets Closed)

_If $X$ is a Hausdorff space, then any finite subset of $X$ is closed._

*Proof.* For a one-point set $\{x\}$: since $X$ is Hausdorff, for each $y != x$ we can find disjoint open neighbourhoods $U_y$ of $x$ and $V_y$ of $y$. Then $union.big_(y != x) V_y = X without \{x\}$ is open, so $\{x\}$ is closed. Any finite set is a union of finitely many closed one-point sets, hence closed.

== Compact Spaces

=== 1.29 Definition (Compact Space)

Let $X$ be a topological space.
+ An *open cover* of $X$ is a collection $cal(C)$ of open sets whose union is all of $X$.
+ If $cal(C)$ is an open cover of $X$, a *finite subcover* is a finite subcollection $\{C_1, ..., C_n\}$ of $cal(C)$ for which $C_1 union dots.c union C_n = X$.
+ $X$ is *compact* if every open cover has a finite subcover.

A set $K subset.eq X$ is *compact* if it is compact in the subspace topology. A subset of $RR^n$ is *bounded* if it is contained in some open ball.

=== 1.30 Theorem (Heine-Borel)

_A subset of $RR^n$ is compact if and only if it is closed and bounded._

=== 1.31 Proposition (Properties of Compact Spaces)

+ _Any compact subset of a Hausdorff space is closed._
+ _Any closed subset of a compact space is compact._
+ _If $f: X -> Y$ is a continuous function and $K subset.eq X$ is compact, then $f(K)$ is compact._
+ _If $X$ is a Hausdorff space and $K_1 supset.eq K_2 supset.eq dots.c$ is a nested sequence of nonempty compact subsets of $X$, then the intersection $inter.big_(n in NN) K_n$ is nonempty._

=== 1.32 Proposition (Compact to Hausdorff)

_If $X$ is a compact space and $Y$ is a Hausdorff space, then any continuous bijection $h: X -> Y$ is a homeomorphism._

*Proof.* We must prove $h^(-1)$ is continuous, i.e., $h(U)$ is open for every open $U subset.eq X$. The complement $U^c$ is closed in $X$ and hence compact. Since $h$ is continuous, $h(U^c)$ is compact. Since $Y$ is Hausdorff, $h(U^c)$ is closed in $Y$. But $h(U^c) = h(U)^c$ since $h$ is bijective, so $h(U)$ is open.

=== 1.33 Corollary

_Any continuous bijection between compact Hausdorff spaces is a homeomorphism._

== Paths and Connectedness

=== 1.34 Definition (Path)

A *path* in a topological space $X$ is a continuous function $gamma: [0,1] -> X$. The points $gamma(0)$ and $gamma(1)$ are the *endpoints*; $gamma$ is a *path from $x$ to $y$* if $gamma(0) = x$ and $gamma(1) = y$. If such a path exists, we say $x$ and $y$ are *joined by a path*.

=== 1.35 Example (Circular Path)

If $n$ is a positive integer, then $gamma(s) = (cos 2 pi n s, sin 2 pi n s)$ is a path in $RR^2$ that winds $n$ times counterclockwise around the origin.

=== 1.36 Example (Straight-Line Path)

If $x$ and $y$ are points in $RR^n$, then $gamma(s) = (1 - s) x + s y$ is a straight-line path from $x$ to $y$.

=== 1.37 Proposition

_If $X$ is a topological space, "joined by a path" is an equivalence relation on $X$._

*Proof.* Reflexive: the *constant path* $c_x(s) = x$ for all $s in [0,1]$ is a path from $x$ to $x$.

Symmetric: if $alpha$ is a path from $x$ to $y$, the *reverse* $overline(alpha)(s) = alpha(1 - s)$ is a path from $y$ to $x$.

Transitive: if $alpha$ is a path from $x$ to $y$ and $beta$ is a path from $y$ to $z$, the *concatenation* $gamma = alpha * beta$ defined by
$ gamma(s) = cases(alpha(2s) & "if" s in [0, 1\/2], beta(2s - 1) & "if" s in [1\/2, 1]) $
is a path from $x$ to $z$. Continuity follows from the gluing lemma.

=== 1.39 Definition (Path Components, Path-Connected)

If $X$ is a topological space, the *path components* of $X$ are the equivalence classes for the "joined by a path" relation. We say $X$ is *path-connected* if it has exactly one path component, i.e., it is nonempty and every pair of points in $X$ is joined by a path.

=== 1.41 Remark (Connected vs. Path-Connected)

A topological space $X$ is *connected* if there is no partition of $X$ into two or more nonempty open sets. Path-connected spaces are always connected, but there exist unusual spaces that are connected but not path-connected. For the purpose of algebraic and geometric topology, path-connectedness is much more important than connectedness.

== Products

=== 1.42 Definition (Product Topology)

If $X$ and $Y$ are topological spaces, the *product topology* on $X times Y$ is the topology that has the following basis:
$ cal(B) = \{U times V mid(|)U "open in" X "and" V "open in" Y\}. $
That is, an open set in $X times Y$ is a union $union.big_(i in I)(U_i times V_i)$, where each $U_i$ is open in $X$ and each $V_i$ is open in $Y$.

=== 1.43 Remark

The collection $cal(B)$ given above is always a basis for a topology (exercise), but it is not itself a topology, since a union of products $U_1 times V_1$ and $U_2 times V_2$ cannot in general be expressed as a single product $U times V$.

=== 1.45 Proposition (Components of Maps)

_If $W$, $X$, and $Y$ are topological spaces, then a function $f: W -> X times Y$ is continuous if and only if its components $f_X: W -> X$ and $f_Y: W -> Y$ are continuous, where $f(w) = (f_X (w), f_Y (w))$._

== Disjoint Unions

=== 1.49 Definition (Disjoint Union Topology)

Let $X$ and $Y$ be disjoint topological spaces. The *disjoint union topology* on $X union Y$ is the topology with open sets of the form $U union V$, where $U$ is open in $X$ and $V$ is open in $Y$. We write $X union.sq Y$ for the disjoint union.

=== 1.52 Proposition

_Let $X$, $Y$, and $Z$ be topological spaces. Then a function $f: X union.sq Y -> Z$ is continuous if and only if the restrictions $f|_X: X -> Z$ and $f|_Y: Y -> Z$ are continuous._

== Key Spaces: Balls, Spheres, and More

=== 1.54 Definition (n-Ball)

The *(closed) $n$-ball* is the closed unit ball in $RR^n$:
$ B^n = \{x in RR^n : ||x|| lt.eq 1\}. $
For example: $B^1 = [-1, 1]$, $B^2$ is the closed unit disc (sometimes denoted $D^2$), and $B^3$ is a solid ball. Since $B^n$ is closed and bounded in $RR^n$, it is compact by Heine-Borel. The boundary $partial B^n = S^(n-1)$.

=== 1.56 Definition (n-Sphere)

The *$n$-sphere* is the unit sphere in $RR^(n+1)$:
$ S^n = \{x in RR^(n+1) : ||x|| = 1\}. $
For example, $S^0 = \{plus.minus 1\}$, $S^1$ is the unit circle in $RR^2$, and $S^2$ is the unit sphere in $RR^3$. Spheres are compact (closed and bounded subsets of $RR^(n+1)$).

=== 1.58 Theorem (Stereographic Projection)

_For any point $p in S^n$, the complement $S^n without \{p\}$ is homeomorphic to $RR^n$._

*Proof.* It suffices to take $p = (0, ..., 0, 1)$. Let $H$ be the hyperplane $x_(n+1) = -1$ in $RR^(n+1)$, which is homeomorphic to $RR^n$. Define $h: S^n without \{p\} -> H$ by mapping each point $x$ to the intersection of the line through $p$ and $x$ with $H$. This is called *stereographic projection*. The formula is:
$ h(x_1, ..., x_(n+1)) = (frac(2x_1, 1 - x_(n+1)), ..., frac(2x_n, 1 - x_(n+1)), -1) $
and the inverse is:
$ h^(-1)(x_1, ..., x_n, -1) = (frac(4x_1, r^2 + 4), ..., frac(4x_n, r^2 + 4), frac(r^2 - 4, r^2 + 4)), quad "where" r^2 = x_1^2 + dots.c + x_n^2. $
Both are continuous, so $h$ is a homeomorphism.

=== 1.60 Theorem (Jordan Curve Theorem)

_If $C$ is a subspace of $S^2$ which is homeomorphic to a circle, then the complement $S^2 without C$ has exactly two path components._

=== 1.62 Proposition (Annulus)

An *annulus* is a region in the plane bounded by two concentric circles: $\{x in RR^2 : r_1 lt.eq ||x - c|| lt.eq r_2\}$.

_Any closed annulus is homeomorphic to $S^1 times [0,1]$, and any open annulus is homeomorphic to $S^1 times (0,1)$._

*Proof.* $S^1 times [0,1]$ is compact (product of compact spaces) and the annulus $A$ is Hausdorff. A continuous bijection $h: S^1 times [0,1] -> A$ given by $h(x, t) = c + ((1-t) r_1 + t r_2)x$ is therefore a homeomorphism by Prop 1.32.

=== 1.65 Proposition (Torus)

_Any torus is homeomorphic to $S^1 times S^1$._

*Proof.* A torus $T^2$ in $RR^3$ is defined by the equation $(r - a)^2 + z^2 = b^2$ in cylindrical coordinates $(r, theta, z)$ where $a > b > 0$. Regard a point in $S^1 times S^1$ as a pair of angles $(sigma, tau)$. The function $h: S^1 times S^1 -> T^2$ that maps $(sigma, tau)$ to the point with cylindrical coordinates $(r, theta, z) = (a + b cos tau, sigma, b sin tau)$ is a continuous bijection. Since $S^1 times S^1$ is compact and $T^2$ is Hausdorff, Prop 1.32 gives a homeomorphism.

=== 1.68 Definition (Real Projective Space)

The *real projective space* $RR P^n$ is the metric space consisting of all lines through the origin in $RR^(n+1)$, where the distance between two lines $L_1$ and $L_2$ is defined by $d(L_1, L_2) = $ the (smaller) angle between $L_1$ and $L_2$.

Equivalently, $RR P^n = S^n \/ (x tilde -x)$ (antipodal identification). We have $RR P^1 tilde.equiv S^1$. The projective plane $RR P^2$ is a surface that is not homeomorphic to a sphere or a torus, and does not embed in $RR^3$.

= §2: Quotient Spaces

== Equivalence Relations and Quotients

An *equivalence relation* $tilde$ on a set $X$ is a binary relation that is reflexive ($x tilde x$), symmetric ($x tilde y => y tilde x$), and transitive ($x tilde y$ and $y tilde z => x tilde z$). The *equivalence class* of $a in X$ is $[a] = \{x in X mid(|)x tilde a\}$. The collection $X \/ tilde$ of all equivalence classes is the *quotient* of $X$, and the surjection $pi: X -> X\/tilde$ defined by $pi(a) = [a]$ is the *canonical projection*.

== Quotient Topology

=== 2.3 Definition (Quotient Topology)

Let $X$ be a topological space, and let $Q = X\/tilde$ be a quotient of $X$. The *quotient topology* on $Q$ is the topology whose open sets are:
$ \{U subset.eq Q mid(|)pi^(-1)(U) "is open in" X\} $
where $pi: X -> Q$ is the canonical projection. Under this topology, $Q$ is called a *quotient space*.

=== 2.4 Example (Gluing Endpoints)

Consider $[0,1]$ with $0 tilde 1$. The quotient $[0,1]\/tilde$ is homeomorphic to $S^1$.

=== 2.5 Example (Cylinder)

Let $X = [0,1] times [0,1]$ with $(0, y) tilde (1, y)$. The quotient $Q = X\/tilde$ is homeomorphic to the closed cylinder $S^1 times [0,1]$.

=== 2.6 Definition (Collapsing a Subspace)

Let $X$ be a topological space, let $A subset.eq X$, and let $tilde$ be the equivalence relation that identifies all points of $A$ together: $x tilde y$ iff $x = y$ or $x, y in A$. The quotient $X\/tilde$ is usually denoted $X\/A$, and is the quotient of $X$ obtained by *collapsing* $A$ to a single point.

=== 2.9 Definition (Wedge Sum)

Let $X$ and $Y$ be disjoint spaces, and choose points $x_0 in X$ and $y_0 in Y$. The *wedge sum* of $X$ and $Y$, denoted $X or Y$, is the quotient $(X union.sq Y)\/tilde$ where $tilde$ is the equivalence relation that identifies $x_0$ and $y_0$. That is, $X or Y$ is the space obtained by gluing $X$ and $Y$ together along a single point.

== Theory of Quotient Spaces

=== 2.11 Proposition (Maps on Quotients)

_Let $f: X -> Y$ be a map, and let $Q = X\/tilde$ be a quotient of $X$. If the function $g: Q -> Y$ defined by $g([x]) = f(x)$ is well-defined (i.e., $x_1 tilde x_2 => f(x_1) = f(x_2)$), then it is continuous._

*Proof.* Suppose $g$ is well-defined, and let $U subset.eq Y$ be open. Note $f = g compose pi$, so $pi^(-1)(g^(-1)(U)) = f^(-1)(U)$. Since $f$ is continuous, $f^(-1)(U)$ is open in $X$, so $g^(-1)(U)$ is open in $Q$ by definition of the quotient topology.

=== 2.13 Proposition (Continuity of $pi$)

_If $X$ is a topological space and $Q = X\/tilde$ is a quotient of $X$, then the canonical projection $pi: X -> Q$ is a continuous surjection._

=== 2.14 Corollary

_Any quotient of a compact space is compact._

=== 2.15 Corollary

_Any quotient of a path-connected space is path-connected._

=== 2.16 Proposition (Recognizing Quotients)

_Let $f: X -> Y$ be a surjective map, where $X$ is compact and $Y$ is Hausdorff. Then $f$ descends to a homeomorphism $h: X\/tilde -> Y$, where $tilde$ is the equivalence relation on $X$ defined by $x_1 tilde x_2 <=> f(x_1) = f(x_2)$._

*Proof.* By Proposition 2.11, $f$ descends to a map $h$. This map $h$ is bijective by definition of $tilde$. But $X\/tilde$ is compact by Corollary 2.14, and $Y$ is Hausdorff, so $h$ is a homeomorphism by Proposition 1.32.

=== 2.17 Example ($[0,1]\/(0 tilde 1) tilde.equiv S^1$)

Let $f: [0,1] -> S^1$ be $f(x) = (cos 2 pi x, sin 2 pi x)$. Then $f(0) = f(1)$ and these are the only points with the same image, so $x_1 tilde x_2 <=> f(x_1) = f(x_2)$. By Proposition 2.16, $h: Q -> S^1$ is a homeomorphism.

=== 2.20 Remark (Quotient Map)

A continuous surjection $f: X -> Y$ is called a *quotient map* if it descends to a homeomorphism $h: X\/tilde -> Y$. By Proposition 2.11, any continuous surjection from a compact space to a Hausdorff space is a quotient map.

=== 2.22 Example (Line with Two Origins)

The *line with two origins* $X$ is a famous non-Hausdorff space. The points of $X$ are all points in $RR without \{0\}$ together with two additional points $0_1$ and $0_2$. Open sets are defined so that both $X without \{0_1\}$ and $X without \{0_2\}$ are homeomorphic to $RR$, but $X$ is not Hausdorff since no neighbourhood of $0_1$ is disjoint from any neighbourhood of $0_2$. It is a quotient of $RR union.sq RR$ by identifying each nonzero point in the first copy with the corresponding point in the second copy, showing that a quotient of a Hausdorff space need not be Hausdorff.

= §3: Surfaces

== Definition and Basic Examples

=== 3.1 Definition (Surface)

A topological space $X$ is called a *surface* if every point in $X$ has an open neighbourhood homeomorphic to an open disc. In addition, we require all surfaces to be Hausdorff and second countable.

=== 3.2 Examples (Basic Examples)

- The plane $RR^2$ is a surface.
- Any open subset of the plane is a surface, as is any space homeomorphic to an open subset of the plane. E.g., the infinite cylinder $S^1 times RR$ is a surface.
- The sphere $S^2$ is a surface: each open hemisphere is homeomorphic to an open disc.
- The torus $T^2 = S^1 times S^1$ is a surface.

=== 3.5 Definition (Second Countable)

A topological space $X$ is *second countable* if there exists a countable basis for the topology on $X$.

For example, $RR$ is second countable with countable basis $\{(a,b) mid(|)a, b in QQ, a < b\}$. More generally, $RR^n$ is second countable. Any subspace of a second countable space is second countable. An uncountable disjoint union $union.sq.big_(i in I) X_i$ (with each $X_i$ nonempty) is never second countable.

== Surfaces with Boundary

=== 3.12 Definition (Surface with Boundary)

The *half-disc* is the set $\{(x,y) in RR^2 mid(|)x^2 + y^2 < 1 "and" y gt.eq 0\}$.

A topological space $X$ is called a *surface with boundary* if every point in $X$ has an open neighbourhood homeomorphic to an open disc or a half-disc. We require all surfaces with boundary to be Hausdorff and second countable.

=== 3.14 Definition (Interior and Boundary Points)

If $X$ is a surface with boundary, a point $x in X$ is called an *interior point* if it has an open neighbourhood homeomorphic to an open disc, and is a *boundary point* otherwise. The *interior* of $X$ is the set $"int"(X)$ of all interior points, and the *boundary* of $X$ is the set $partial X$ of all boundary points.

For example, the interior of a closed disc is an open disc, and the boundary of a closed disc is a circle. Every surface is a surface with boundary (with $partial X = emptyset$), but most surfaces with boundary are not surfaces.

== Connected Sums

=== 3.17 Definition (Connected Sum)

Let $X_1$ and $X_2$ be connected surfaces. The *connected sum* $X_1 \# X_2$ is the surface obtained by removing the interior of a closed disc from each $X_i$, and then gluing the two spaces together along the resulting boundary circles.

=== 3.19 Example (Surface of Genus $g$)

The *surface of genus $n$*, denoted $Sigma_n$, is the connected sum $T^2 \# T^2 \# dots.c \# T^2$ of $n$ tori. Note that $Sigma_m \# Sigma_n tilde.equiv Sigma_(m+n)$.

=== 3.20 Example (Connected Sums with a Sphere)

If $X$ is any connected surface, then $X \# S^2 tilde.equiv X$. This is because removing a disc from $S^2$ yields a disc, and gluing this to $X$ with a disc removed yields $X$ back. Thus $S^2$ is the *surface of genus zero*, denoted $Sigma_0$.

== Surfaces from Polygons

=== 3.23 Example (Annulus and Mobius Strip)

A closed annulus $S^1 times [0,1]$ is constructed from the square $[0,1] times [0,1]$ by identifying $(0,y) tilde (1,y)$. The *Mobius strip* (or *Mobius band*) is constructed by identifying $(0,y) tilde (1, 1-y)$ instead. The Mobius strip is a surface with boundary whose boundary is a single circle.

=== 3.25 Example (Square Torus)

We can construct a torus by gluing the opposite sides of a square: $(0,y) tilde (1,y)$ and $(x,0) tilde (x,1)$. All four corners are identified to the same point.

=== 3.27 Remark (Surface Symbol)

For a polygon with edges identified in pairs, we can specify the identifications by a *surface symbol*: a string of letters read around the polygon boundary, using $a$ for one direction and $a^(-1)$ for the reverse.
- Sphere $S^2$: $a a^(-1)$ (bigon)
- Torus $T^2$: $a b a^(-1) b^(-1)$
- Projective plane $RR P^2$: $a a$ (bigon with both edges identified in the same direction)
- Klein bottle $K$: $a b a^(-1) b$ (or equivalently $a a b b$)
- $Sigma_g$: $a_1 b_1 a_1^(-1) b_1^(-1) a_2 b_2 a_2^(-1) b_2^(-1) dots.c a_g b_g a_g^(-1) b_g^(-1)$
- $N_k$: $a_1 a_1 a_2 a_2 dots.c a_k a_k$

Connected sums correspond to concatenating surface symbols.

== The Projective Plane

=== 3.31 Proposition (Sphere Description of $RR P^2$)

_Let $tilde$ be the equivalence relation on $S^2$ that identifies each pair of antipodal points $p, -p in S^2$. Then $S^2\/tilde$ is homeomorphic to $RR P^2$._

=== 3.32 Proposition (Disc Description of $RR P^2$)

_Let $tilde$ be the equivalence relation on $D^2$ that identifies each pair of opposite points on the boundary circle. Then $D^2\/tilde$ is homeomorphic to $RR P^2$._

*Proof.* Let $pi: S^2 -> RR P^2$ be the canonical projection. Identify $D^2$ with the closed upper hemisphere of $S^2$. For any antipodal pair $\{-p, p\}$, at least one lies in $D^2$, so $pi|_(D^2)$ is surjective. Two points in $D^2$ are antipodal iff they are opposite boundary points. Since $D^2$ is compact and $RR P^2$ is Hausdorff, Prop 2.16 gives $D^2\/tilde tilde.equiv RR P^2$.

=== 3.34 Remark (Orientability)

A surface is called *non-orientable* if it has a subspace homeomorphic to a Mobius strip; otherwise it is *orientable*. The surfaces $Sigma_g$ are orientable; the surfaces $N_k$ are non-orientable.

A surface given by a polygon with sides identified is orientable iff every pair of identified edges has one edge pointing clockwise and one edge pointing counterclockwise. If any pair both point the same way, there is a Mobius strip going through those edges, and the surface is non-orientable.

=== 3.35 Definition (Klein Bottle)

The *Klein bottle* $K$ is the quotient of the closed square $[0,1]^2$ with identifications $(0,y) tilde (1,y)$ (same direction) and $(x,0) tilde (1-x,1)$ (reversed direction). Its surface symbol is $a b a^(-1) b$. The Klein bottle does not embed in $RR^3$ but does embed in $RR^4$.

== Classification of Compact Surfaces

=== 3.39 Theorem (Classification of Compact Surfaces)

_Every compact, connected surface is homeomorphic to exactly one of the following:_
+ _The surface $Sigma_g = T^2 \# dots.c \# T^2$ of genus $g$ for some $g gt.eq 0$, obtained as the connected sum of $g$ tori (where $Sigma_0 = S^2$)._
+ _The surface $N_k = RR P^2 \# dots.c \# RR P^2$ for some $k gt.eq 1$, obtained as the connected sum of $k$ projective planes._

The proof has four steps: (1) every compact surface is a polygon with edges identified in pairs (via triangulation), (2) every such polygon is homeomorphic to a connected sum of tori and projective planes (via cutting and pasting), (3) Dyck's theorem eliminates the mixed case, (4) algebraic invariants show distinctness.

== Triangulation

=== 3.44 Theorem (Triangulation of Surfaces)

_Every compact surface can be obtained from a finite disjoint union of triangles by identifying edges in pairs._

=== 3.46 Corollary (Existence of Polygon Descriptions)

_Every compact, connected surface can be obtained from a polygon by identifying pairs of edges._

*Proof.* By Theorem 3.44, there is a decomposition $P_1 union.sq dots.c union.sq P_n$ of polygons (triangles) with edges identified in pairs. If $n > 1$, since the surface is connected there exist distinct polygons $P_i$ and $P_j$ with an identified pair of edges. Gluing $P_i$ and $P_j$ along this pair reduces to $n - 1$ polygons. Continuing, we eventually reduce to a single polygon.

== Cutting and Pasting

=== 3.48 Definition (Manipulating Polygons)

Three moves for simplifying polygon representations of surfaces:
+ *Cut and Paste:* A polygon can be cut along a diagonal and then glued together along a corresponding pair of edges.
+ *Combining Edges:* If the same sequence of edges (such as $b a$) appears twice along the boundary, it can be consolidated into a single new edge.
+ *Zipping Up:* If two consecutive edges are to be identified in opposite directions, we can "zip up" the edges to obtain a smaller polygon.

=== 3.53 Proposition

_Every surface obtained by identifying pairs of edges of a polygon is homeomorphic to either a sphere or to a connected sum of one or more surfaces, each of which is a torus or a projective plane._

*Proof sketch.* By induction on the number of sides $n$ of the polygon. Base cases: bigons for $S^2$ and $RR P^2$, and the square for $T^2$. Induction step: if no zipping is possible, use three tricks to split off tori or projective planes:

*Trick 1 (Splitting off $T^2$ or $RR P^2$):* Two consecutive edges with the same label pointing the same way give $RR P^2$; four consecutive edges in $a b a^(-1) b^(-1)$ pattern give $T^2$.

*Trick 2 (Finding $RR P^2$):* Two edges with the same label pointing the same way, sharing a vertex, yield $RR P^2$ via cut and paste.

*Trick 3 (Finding $T^2$):* Two edges labelled $a$ pointing opposite directions, with two $b$ edges on either side also pointing opposite directions, yield $T^2$ via two cuts and pastes.

== Dyck's Theorem

=== 3.54 Theorem (Dyck's Theorem)

_The surface $T^2 \# RR P^2$ is homeomorphic to $RR P^2 \# RR P^2 \# RR P^2 = N_3$._

=== 3.55 Corollary

_If $g gt.eq 0$ and $k gt.eq 1$, then $Sigma_g \# N_k$ is homeomorphic to $N_(2g+k)$._

Thus every compact connected surface is either $Sigma_g$ or $N_k$.

== Euler Characteristic

The *Euler characteristic* of a triangulated surface with $V$ vertices, $E$ edges, and $F$ faces is $chi = V - E + F$. This is a topological invariant:
$ chi(Sigma_g) = 2 - 2g, quad chi(N_k) = 2 - k. $

== Manifolds

=== 3.56 Definition ($n$-Manifold)

An *$n$-manifold* or *manifold of dimension $n$* is a second countable Hausdorff space $X$ such that every point in $X$ has an open neighbourhood homeomorphic to an open $n$-ball.

=== 3.57 Definition ($n$-Manifold with Boundary)

An *$n$-manifold with boundary* is a second countable Hausdorff space $X$ such that every point has an open neighbourhood homeomorphic to either an open $n$-ball or to the half-ball $\{(x_1, ..., x_n) in RR^n mid(|)x_1^2 + dots.c + x_n^2 < 1 "and" x_n gt.eq 0\}$.

A 2-manifold is the same as a surface, and a 2-manifold with boundary is the same as a surface with boundary. A 1-manifold is sometimes called a *curve*.

=== 3.58 Theorem (Classification of 1-Manifolds)

+ _Every connected 1-manifold is homeomorphic to the real line $RR$ or the circle $S^1$._
+ _Every connected 1-manifold with boundary is homeomorphic to $RR$, $S^1$, the ray $[0, oo)$, or the closed interval $[0, 1]$._

= §4: The Fundamental Group

== Paths, Loops, and Concatenation

=== 4.3 Definition (Constant Paths, Reverse, Concatenation)

Let $X$ be a topological space.
+ For each $x in X$, the corresponding *constant path* $c_x: [0,1] -> X$ is defined by $c_x (s) = x$ for all $s in [0,1]$.
+ If $alpha$ is a path in $X$, the *reverse* of $alpha$ is the path $overline(alpha)$ defined by $overline(alpha)(s) = alpha(1 - s)$.
+ If $alpha: [0,1] -> X$ and $beta: [0,1] -> X$ are paths and $alpha(1) = beta(0)$, the *concatenation* of $alpha$ and $beta$, denoted $alpha dot beta$, is the path defined by
$ (alpha dot beta)(s) = cases(alpha(2s) & "if" s in [0, 1\/2], beta(2s - 1) & "if" s in [1\/2, 1].) $
The concatenation is continuous by the gluing lemma.

=== 4.4 Definition (Loop)

If $X$ is a topological space with basepoint $x_0$, a *loop based at $x_0$* is a path $alpha$ in $X$ for which $alpha(0) = alpha(1) = x_0$.

== Homotopy of Paths

=== 4.6 Definition (Homotopy of Paths)

Let $X$ be a topological space, and let $alpha$ and $beta$ be paths in $X$ with the same endpoints $x = alpha(0) = beta(0)$ and $y = alpha(1) = beta(1)$. We say $alpha$ and $beta$ are *homotopic*, written $alpha tilde.eq beta$, if there exists a map $H: [0,1] times [0,1] -> X$ satisfying:
+ $H(s, 0) = alpha(s)$ and $H(s, 1) = beta(s)$ for all $s in [0,1]$.
+ $H(0, t) = x$ and $H(1, t) = y$ for all $t in [0,1]$.
The map $H$ is called a *homotopy* from $alpha$ to $beta$.

We can think of $H$ as a family of paths $\{h_t\}_(t in [0,1])$ where $h_t(s) = H(s,t)$, with $h_0 = alpha$ and $h_1 = beta$, and each $h_t$ a path from $x$ to $y$.

=== 4.8 Example (Straight-Line Homotopy)

In $RR^n$, any two paths $alpha$ and $beta$ with the same endpoints are homotopic via $H(s,t) = (1-t) alpha(s) + t beta(s)$.

=== 4.10 Example (Punctured Plane)

In the punctured plane $RR^2 without \{(0,0)\}$, the paths $alpha(s) = (cos pi s, sin pi s)$ and $beta(s) = (cos pi s, -sin pi s)$ both go from $(1,0)$ to $(-1,0)$, but $alpha$ goes above the puncture and $beta$ goes below, so they are not homotopic.

=== 4.11 Proposition

_If $X$ is a topological space, then homotopy is an equivalence relation on the set of all paths in $X$._

*Proof.* Reflexive and symmetric are easy. Transitivity requires the gluing lemma.

=== 4.12 Definition (Homotopy Class)

If $alpha$ is a path in $X$, the *homotopy class* of $alpha$, denoted $[alpha]$, is the equivalence class of $alpha$ under the homotopy relation. That is, $[alpha] = [beta]$ iff $alpha tilde.eq beta$.

== The Fundamental Group

=== 4.13 Definition (Fundamental Group)

If $(X, x_0)$ is a pointed space, the *fundamental group* of $X$ based at $x_0$, denoted $pi_1(X, x_0)$, is the set of all homotopy classes of loops based at $x_0$, with operation defined by
$ [alpha][beta] = [alpha dot beta]. $

=== 4.14 Proposition (Well-Definedness)

_If $alpha tilde.eq alpha'$ are homotopic paths from $x$ to $y$, and $beta tilde.eq beta'$ are homotopic paths from $y$ to $z$, then $alpha dot beta tilde.eq alpha' dot beta'$. In particular, the product operation on $pi_1(X, x_0)$ is well-defined._

*Proof.* Let $H$ be a homotopy from $alpha$ to $alpha'$, let $I$ be a homotopy from $beta$ to $beta'$. Define $J: [0,1] times [0,1] -> X$ by
$ J(s,t) = cases(H(2s, t) & "if" (s,t) in [0, 1\/2] times [0,1], I(2s-1, t) & "if" (s,t) in [1\/2, 1] times [0,1].) $
Then $J$ is continuous by the gluing lemma and is a homotopy from $alpha dot beta$ to $alpha' dot beta'$.

=== 4.15 Lemma (Reparametrization)

_If $alpha$ is a path in $X$, then any reparametrization of $alpha$ is homotopic to $alpha$._

*Proof.* Let $alpha compose phi$ be a reparametrization, where $phi: [0,1] -> [0,1]$ is a homeomorphism with $phi(0) = 0$ and $phi(1) = 1$. Then $H(s,t) = alpha((1-t) phi(s) + t s)$ is a homotopy from $alpha compose phi$ to $alpha$.

=== 4.16 Proposition (Associativity)

_If $alpha$, $beta$, and $gamma$ are paths in $X$ with $alpha(1) = beta(0)$ and $beta(1) = gamma(0)$, then_
$ (alpha dot beta) dot gamma tilde.eq alpha dot (beta dot gamma). $
_In particular, the product operation on $pi_1(X, x_0)$ is associative._

*Proof.* $(alpha dot beta) dot gamma$ is a reparametrization of $alpha dot (beta dot gamma)$ with the homeomorphism $phi: [0,1] -> [0,1]$ defined by
$ phi(s) = cases(2s & "if" s in [0, 1\/4], s + 1\/4 & "if" s in [1\/4, 1\/2], s\/2 + 1\/2 & "if" s in [1\/2, 1].) $
By the reparametrization lemma, $(alpha dot beta) dot gamma tilde.eq alpha dot (beta dot gamma)$.

=== 4.17 Proposition (Identity)

_Let $(X, x_0)$ be a pointed space, and let $c$ be the constant path at $x_0$. Then $[c]$ is an identity element for $pi_1(X, x_0)$._

*Proof.* We must show $c dot alpha tilde.eq alpha$ and $alpha dot c tilde.eq alpha$ for any loop $alpha$ based at $x_0$. Both follow from the reparametrization lemma.

=== 4.18 Proposition (Inverses)

_If $alpha$ is a loop in $X$ based at $x_0$, then $[overline(alpha)]$ is an inverse for $[alpha]$ in $pi_1(X, x_0)$._

*Proof.* We show $alpha dot overline(alpha) tilde.eq c$ (the constant path). Define $H: [0,1] times [0,1] -> X$ by:
$ H(s,t) = cases(alpha(2s) & "if" 0 lt.eq s lt.eq (1-t)\/2, alpha(1-t) & "if" (1-t)\/2 lt.eq s lt.eq (1+t)\/2, alpha(2-2s) & "if" (1+t)\/2 lt.eq s lt.eq 1.) $
This is continuous by the gluing lemma and is a homotopy from $alpha dot overline(alpha)$ to $c$.

== Basepoint Independence

=== 4.20 Proposition (Basepoint Independence)

_If two points $x_0$ and $x_1$ are connected by a path in $X$, then $pi_1(X, x_0)$ is isomorphic to $pi_1(X, x_1)$._

*Proof.* Choose a path $gamma$ from $x_0$ to $x_1$, and define $phi: pi_1(X, x_0) -> pi_1(X, x_1)$ by
$ phi([alpha]) = [overline(gamma) dot alpha dot gamma]. $
This is well-defined and is an isomorphism: $phi^(-1)([beta]) = [gamma dot beta dot overline(gamma)]$.

The isomorphism $phi$ is the *change of basepoint isomorphism* determined by $gamma$.

=== 4.21 Corollary

_If $X$ is a path-connected space, then $pi_1(X, x_0)$ is isomorphic to $pi_1(X, x_1)$ for all $x_0, x_1 in X$._

In this case we often write $pi_1(X)$ to mean $pi_1(X, x_0)$ for some $x_0 in X$.

=== 4.22 Remark (Disconnected Spaces)

If $X$ is disconnected, then $pi_1(X, x_0) = pi_1(C, x_0)$ where $C$ is the path component of $X$ containing $x_0$.

= §5: Winding Numbers and Covering Spaces

== The Punctured Plane

=== 5.1 Theorem (Winding Number and Homotopy)

_Let $alpha$ and $beta$ be loops in the punctured plane $X = RR^2 without \{(0,0)\}$ based at the same point. Then $alpha tilde.eq beta$ if and only if $w(alpha) = w(beta)$._

=== 5.2 Theorem

_If $X$ is the punctured plane and $x_0 in X$, then $pi_1(X, x_0) tilde.equiv ZZ$._

=== 5.3 Definition (Universal Cover of Punctured Plane)

The *universal cover* of the punctured plane $X = RR^2 without \{(0,0)\}$ is the space
$ tilde(X) = \{(r, theta) mid(|)r > 0 "and" theta in RR\} = (0, oo) times RR. $
The corresponding *covering map* $p: tilde(X) -> X$ is defined by
$ p(r, theta) = (r cos theta, r sin theta). $
Two points $(r_1, theta_1)$ and $(r_2, theta_2)$ in $tilde(X)$ map to the same point iff $r_1 = r_2$ and $theta_2 = theta_1 + 2 pi n$ for some $n in ZZ$.

=== 5.5 Proposition (Discs are Evenly Covered)

_If $U$ is any open disc in the punctured plane, then $p^(-1)(U)$ is a disjoint union $union.big_(n in ZZ) U_n$ of open sets, each of which maps homeomorphically to $U$ under $p$._

== Lifting Paths

=== 5.6 Definition (Lift)

If $alpha$ is a path in the punctured plane, a *lift* of $alpha$ is a path $tilde(alpha): [0,1] -> tilde(X)$ such that $p(tilde(alpha)(s)) = alpha(s)$ for each $s in [0,1]$. Equivalently, $tilde(alpha)$ is a lift of $alpha$ if $p compose tilde(alpha) = alpha$.

=== 5.10 Theorem (Path Lifting)

_Let $alpha$ be a path in the punctured plane, and let $(r_0, theta_0) in tilde(X)$ so that $p(r_0, theta_0) = alpha(0)$. Then there exists a unique lift $tilde(alpha)$ of $alpha$ with $tilde(alpha)(0) = (r_0, theta_0)$._

*Proof.* If the image of $alpha$ is contained in a single open disc $U$, then $p^(-1)(U) = union.big_(n in ZZ) U_n$ by Prop 5.5, and since $[0,1]$ is connected, $tilde(alpha)$ must lie entirely in one $U_n$, giving a unique lift $tilde(alpha) = p_n^(-1) compose alpha$.

In general, by compactness of $[0,1]$, subdivide $0 = s_0 < s_1 < dots.c < s_m = 1$ so that each $alpha([s_(i-1), s_i])$ is contained in an open disc. Lift each piece inductively, matching endpoints, and glue by the gluing lemma.

== Winding Number

=== 5.11 Definition (Winding Number)

Let $alpha$ be a loop in the punctured plane based at $(1,0)$, and let $tilde(alpha)$ be the lift of $alpha$ starting at $(r_0, theta_0) = (1, 0)$. Then
$ tilde(alpha)(1) = (1, 2 pi n) $
for some $n in ZZ$, and this integer $n$ is the *winding number* $w(alpha)$ of $alpha$ around the origin.

=== 5.13 Example (Circular Loops)

The loop $alpha_n(s) = (cos 2 pi n s, sin 2 pi n s)$ has lift $tilde(alpha)_n(s) = (1, 2 pi n s)$, so $w(alpha_n) = n$. In particular, any integer can be a winding number.

=== 5.15 Proposition (Winding Number Properties)

_If $alpha$ and $beta$ are loops in the punctured plane based at $(1,0)$, then_
$ w(overline(alpha)) = -w(alpha) quad "and" quad w(alpha dot beta) = w(alpha) + w(beta). $

*Proof.* Let $m = w(alpha)$ and $n = w(beta)$. Then $alpha$ has a lift $tilde(alpha)$ with endpoints $(1,0)$ and $(1, 2 pi m)$, and $beta$ has a lift $tilde(beta)$ with endpoints $(1, 0)$ and $(1, 2 pi n)$.

For the reverse: $s |-> tilde(alpha)(1-s) - (0, 2 pi m)$ is a lift of $overline(alpha)$ from $(1, 0)$ to $(1, -2 pi m)$, so $w(overline(alpha)) = -m$.

For concatenation: the piecewise path $s |-> cases(tilde(alpha)(2s) & s in [0, 1\/2], tilde(beta)(2s-1) + (0, 2 pi m) & s in [1\/2, 1])$ is a lift of $alpha dot beta$ from $(1,0)$ to $(1, 2 pi(m+n))$, so $w(alpha dot beta) = m + n$.

== Lifting Homotopies

=== 5.16 Theorem (Homotopy Lifting)

_Let $alpha$ and $beta$ be paths in the punctured plane with $alpha(0) = beta(0)$, and let $tilde(alpha)$ and $tilde(beta)$ be lifts with $tilde(alpha)(0) = tilde(beta)(0)$. Then $alpha tilde.eq beta$ if and only if $tilde(alpha) tilde.eq tilde(beta)$._

*Proof sketch.* If $tilde(alpha) tilde.eq tilde(beta)$, then $H = p compose tilde(H)$ is a homotopy from $alpha$ to $beta$. Conversely, if $alpha tilde.eq beta$ via $H$, subdivide $[0,1] times [0,1]$ into rectangles each mapping into an evenly covered open set, and lift $H$ to $tilde(H)$ inductively on the rectangles.

=== 5.17 Corollary

_Let $alpha$ and $beta$ be loops in the punctured plane based at $(1,0)$. Then $alpha tilde.eq beta$ if and only if $w(alpha) = w(beta)$._

*Proof.* Let $tilde(alpha)$ and $tilde(beta)$ be lifts starting at $(1, 0)$. If $alpha tilde.eq beta$, then $tilde(alpha) tilde.eq tilde(beta)$ by Theorem 5.16, so they have the same endpoints, hence $w(alpha) = w(beta)$. Conversely, if $w(alpha) = w(beta)$, then $tilde(alpha)$ and $tilde(beta)$ have the same endpoints in $tilde(X) = (0, oo) times RR$, which is homeomorphic to $RR^2$ and hence simply connected; so $tilde(alpha) tilde.eq tilde(beta)$ and by Theorem 5.16, $alpha tilde.eq beta$.

=== 5.18 Theorem (Fundamental Group of Punctured Plane)

_Let $X$ be the punctured plane, and let $x_0 = (1,0)$. Then $pi_1(X, x_0) tilde.equiv ZZ$._

*Proof.* Define $phi: pi_1(X, x_0) -> ZZ$ by $phi([alpha]) = w(alpha)$. This is well-defined and injective by Corollary 5.17, surjective because the circular loops $alpha_n$ achieve every integer (Example 5.13), and a homomorphism by Proposition 5.15.

== Covering Spaces

=== 5.21 Definition (Covering Map / Covering Space)

Let $X$ and $tilde(X)$ be topological spaces, and let $p: tilde(X) -> X$ be a map.
+ An open set $U subset.eq X$ is *evenly covered* by $p$ if $p^(-1)(U)$ is a disjoint union $union.big_(i in I) U_i$ of open sets, each of which maps homeomorphically to $U$ under $p$. The sets $U_i$ are called *sheets*.
+ $p$ is a *covering map* if every point in $X$ has an open neighbourhood which is evenly covered by $p$. In this case, $tilde(X)$ is called a *covering space* of $X$.

=== 5.23 Example (Punctured Plane)

The space $tilde(X) = (0, oo) times RR$ is a covering space of $X = RR^2 without \{(0,0)\}$, with covering map $p(r, theta) = (r cos theta, r sin theta)$.

=== 5.24 Example (The Circle)

If $S^1$ is the unit circle in $RR^2$, then the map $p: RR -> S^1$ defined by $p(x) = (cos 2 pi x, sin 2 pi x)$ is a covering map, with every open arc being evenly covered. One can use this to define winding number for loops in $S^1$ and prove $pi_1(S^1, x_0) tilde.equiv ZZ$.

=== 5.25 Example (Products)

If $p: tilde(X) -> X$ and $q: tilde(Y) -> Y$ are covering maps, then $p times q: tilde(X) times tilde(Y) -> X times Y$ is a covering map. For example, $p times p: RR^2 -> T^2 = S^1 times S^1$ is a covering map.

=== 5.26 Example (Projective Plane)

The canonical projection $pi: S^2 -> RR P^2$ (identifying antipodal points) is a covering map, with each evenly covered open set having two sheets (one in each hemisphere).

=== 5.28 Theorem (General Path Lifting)

_Let $p: tilde(X) -> X$ be a covering map, let $alpha$ be a path in $X$, and let $tilde(x)_0 in X$ so that $p(tilde(x)_0) = alpha(0)$. Then there exists a unique lift $tilde(alpha)$ of $alpha$ such that $tilde(alpha)(0) = tilde(x)_0$._

=== 5.29 Theorem (General Homotopy Lifting)

_Let $p: tilde(X) -> X$ be a covering map, let $alpha$ and $beta$ be paths in $X$ with $alpha(0) = beta(0)$, and let $tilde(alpha)$ and $tilde(beta)$ be lifts with $tilde(alpha)(0) = tilde(beta)(0)$. Then $alpha tilde.eq beta$ if and only if $tilde(alpha) tilde.eq tilde(beta)$._

== Simply Connected Spaces and Universal Covers

=== 5.30 Definition (Simply Connected)

A topological space $X$ is *simply connected* if it is path-connected and $pi_1(X, x_0)$ is trivial for every choice of basepoint $x_0 in X$.

=== 5.31 Example

$RR^n$ is simply connected (any two paths with the same endpoints are homotopic by the straight-line homotopy).

=== 5.33 Theorem ($S^n$ Simply Connected for $n gt.eq 2$)

_The sphere $S^n$ is simply connected for all $n gt.eq 2$._

*Proof.* $S^n$ is path-connected. To show any loop $alpha$ is null-homotopic: if $alpha$ is not surjective, then $alpha$ misses a point $x$, and $S^n without \{x\} tilde.equiv RR^n$ is simply connected, so $alpha$ is null-homotopic in $S^n without \{x\}$ and hence in $S^n$. The key technical fact (Lemma 5.42) is that for $n gt.eq 2$, every path in $S^n$ is homotopic to a non-surjective path. This uses the Lebesgue number lemma (compactness) to subdivide the path into pieces, each lying in $S^n without \{x\}$ or $S^n without \{y\}$ for suitable points $x, y$.

=== 5.34 Definition (Universal Cover)

A covering map $p: tilde(X) -> X$ is a *universal covering map* if $tilde(X)$ is simply connected. In this case, $tilde(X)$ is called a *universal cover* of $X$.

=== 5.36 Proposition

_Let $p: tilde(X) -> X$ be a universal covering map, let $alpha$ and $beta$ be paths in $X$ with $alpha(0) = beta(0)$, and let $tilde(alpha)$ and $tilde(beta)$ be lifts with $tilde(alpha)(0) = tilde(beta)(0)$. Then $alpha tilde.eq beta$ if and only if $tilde(alpha)(1) = tilde(beta)(1)$._

*Proof.* By Theorem 5.29, $alpha tilde.eq beta$ iff $tilde(alpha) tilde.eq tilde(beta)$. Since $tilde(X)$ is simply connected, $tilde(alpha) tilde.eq tilde(beta)$ iff they have the same endpoints. Since $tilde(alpha)(0) = tilde(beta)(0)$, this reduces to $tilde(alpha)(1) = tilde(beta)(1)$.

=== 5.37 Corollary ($pi_1(RR P^n) tilde.equiv ZZ_2$ for $n gt.eq 2$)

_If $x_0$ is any point in $RR P^2$, then $pi_1(RR P^2, x_0) tilde.equiv ZZ_2$._

*Proof.* $p: S^2 -> RR P^2$ is a universal covering map (since $S^2$ is simply connected for $n gt.eq 2$). The fibre $p^(-1)(x_0) = \{z_0, -z_0\}$ has two elements. If $alpha$ and $beta$ are loops in $RR P^2$ based at $x_0$, lift them to paths $tilde(alpha)$ and $tilde(beta)$ starting at $z_0$. By Prop 5.36, $alpha tilde.eq beta$ iff $tilde(alpha)(1) = tilde(beta)(1)$. But the only possibilities for $tilde(alpha)(1)$ are $z_0$ and $-z_0$, giving exactly two homotopy classes.

=== 5.38 Remark

An identical argument shows $pi_1(RR P^n) tilde.equiv ZZ_2$ for all $n gt.eq 2$.

= §6: More on Fundamental Groups

== Applications of Winding Number

=== 6.1 Theorem (Brouwer Fixed Point Theorem)

_Every map from a closed disc to itself has a fixed point. That is, if $f: D^2 -> D^2$ is continuous, then there exists $x in D^2$ with $f(x) = x$._

=== 6.2 Theorem (No Retraction Theorem)

_There is no retraction $r: D^2 -> S^1$, i.e., no continuous map $r$ with $r(x) = x$ for all $x in S^1$._

*Proof of Theorem 6.2.* Suppose such an $r$ existed. Let $alpha(s) = (cos 2 pi s, sin 2 pi s)$ be the standard loop around $S^1$. Since $D^2$ is simply connected, there is a homotopy $H$ in $D^2$ from $alpha$ to a constant path. Then $r compose H$ is a homotopy in $S^1$ from $r compose alpha = alpha$ to a constant path. But $alpha$ has winding number 1 in $S^1$, and a constant path has winding number 0, a contradiction.

*Proof of Theorem 6.1.* Suppose $f: D^2 -> D^2$ has no fixed point. For each $x in D^2$, let $r(x)$ be the intersection of the ray from $f(x)$ through $x$ with $S^1$. Then $r: D^2 -> S^1$ is a continuous retraction, contradicting Theorem 6.2.

=== 6.3 Theorem (Fundamental Theorem of Algebra)

_Every non-constant polynomial with complex coefficients has a complex root._

=== 6.4 Lemma

_Let $f(z)$ be a polynomial of degree $n gt.eq 1$ with complex coefficients. Then for sufficiently large $R > 0$, the loop $alpha(s) = f(R e^(2 pi i s))$ in $CC without \{0\}$ has winding number $n$ around the origin._

*Proof of FTA.* Suppose $f(z) = a_n z^n + dots.c + a_0$ has no roots, so $f: CC -> CC without \{0\}$. By Lemma 6.4, for large $R$, the loop $alpha(s) = f(R e^(2 pi i s))$ has winding number $n gt.eq 1$. But the loop $s |-> R e^(2 pi i s)$ is homotopic to a constant path in $CC$ (shrinking $R$ to $0$), and if $H$ is such a homotopy, then $f compose H$ is a homotopy in $CC without \{0\}$ from $alpha$ to a constant path. So $alpha$ has winding number 0, contradicting $n gt.eq 1$.

== Fundamental Groups of Products

=== 6.8 Proposition (Products)

_If $(X, x_0)$ and $(Y, y_0)$ are pointed spaces, then_
$ pi_1(X times Y, z_0) tilde.equiv pi_1(X, x_0) times pi_1(Y, y_0) $
_where $z_0 = (x_0, y_0)$._

*Proof.* Any loop $alpha: [0,1] -> X times Y$ has the form $alpha(s) = (alpha_X (s), alpha_Y (s))$. Define $phi: pi_1(X times Y, z_0) -> pi_1(X, x_0) times pi_1(Y, y_0)$ by $phi([alpha]) = ([alpha_X], [alpha_Y])$. This is well-defined (components of a homotopy give homotopies of the components), bijective (surjectivity: any pair of loops is the components of a product loop; injectivity: homotopies of components give a homotopy of the product), and a homomorphism ($phi([alpha][beta]) = phi([alpha dot beta]) = ([alpha_X dot beta_X], [alpha_Y dot beta_Y]) = phi([alpha]) phi([beta])$).

=== 6.9 Example (Products with $RR$)

Since $pi_1(RR) = 1$, we have $pi_1(A times RR) tilde.equiv pi_1(A)$ for any path-connected space $A$. For example, the punctured plane is homeomorphic to $S^1 times RR$, so $pi_1(RR^2 without \{0\}) tilde.equiv pi_1(S^1) tilde.equiv ZZ$.

=== 6.10 Example (Torus)

$pi_1(T^2) = pi_1(S^1 times S^1) tilde.equiv ZZ times ZZ = ZZ^2$.

=== 6.11 Example ($n$-Torus)

The $n$-torus $T^n = S^1 times dots.c times S^1$ has $pi_1(T^n, x_0) tilde.equiv ZZ^n$.

== Induced Homomorphisms

=== 6.12 Proposition (Induced Homomorphisms)

_Let $f: X -> Y$ be a map, and let $x_0 in X$ and $y_0 = f(x_0)$. Then the function $f_*: pi_1(X, x_0) -> pi_1(Y, y_0)$ defined by $f_*([alpha]) = [f compose alpha]$ is a homomorphism._

*Proof.* Well-defined: if $H$ is a homotopy from $alpha$ to $beta$, then $f compose H$ is a homotopy from $f compose alpha$ to $f compose beta$. Homomorphism: $f compose (alpha dot beta) = (f compose alpha) dot (f compose beta)$, so $f_*([alpha][beta]) = f_*([alpha]) f_*([beta])$.

=== 6.13 Definition (Induced Homomorphism)

Let $(X, x_0)$ and $(Y, y_0)$ be pointed spaces. A map $f: X -> Y$ is called *basepoint-preserving* if $f(x_0) = y_0$. We write $f: (X, x_0) -> (Y, y_0)$. The *induced homomorphism* is $f_*: pi_1(X, x_0) -> pi_1(Y, y_0)$ defined by $f_*([alpha]) = [f compose alpha]$.

=== 6.19 Proposition (Functoriality)

_If $f: (X, x_0) -> (Y, y_0)$ and $g: (Y, y_0) -> (Z, z_0)$ are basepoint-preserving maps, then_
$ (g compose f)_* = g_* compose f_*. $

*Proof.* $(g compose f)_*([alpha]) = [(g compose f) compose alpha] = [g compose (f compose alpha)] = g_*([f compose alpha]) = g_*(f_*([alpha]))$.

=== 6.20 Corollary (Homeomorphisms Induce Isomorphisms)

_If $f: (X, x_0) -> (Y, y_0)$ is a homeomorphism, then $f_*: pi_1(X, x_0) -> pi_1(Y, y_0)$ is an isomorphism of groups._

*Proof.* Let $g = f^(-1)$. Then $g_* compose f_* = (g compose f)_* = ("id"_X)_* = "id"$ and similarly $f_* compose g_* = "id"$.

=== 6.21 Proposition (Retracts and Induced Homomorphisms)

_If $A$ is a retract of $X$ and $a_0 in A$, then the homomorphism $i_*: pi_1(A, a_0) -> pi_1(X, a_0)$ induced by the inclusion map is injective._

*Proof.* Let $r: X -> A$ be a retraction, so $r compose i = "id"_A$. By functoriality, $r_* compose i_* = ("id"_A)_*$, which is the identity on $pi_1(A, a_0)$. Hence $i_*$ is injective.

== Homotopy of Maps

=== 6.23 Definition (Homotopy of Maps)

Let $X$ and $Y$ be topological spaces, and $f, g: X -> Y$ be maps. A *homotopy of maps* from $f$ to $g$ is a function $H: X times [0,1] -> Y$ such that $H(x, 0) = f(x)$ and $H(x, 1) = g(x)$ for all $x in X$. If such an $H$ exists, $f$ and $g$ are *homotopic*, denoted $f tilde.eq g$.

A homotopy of paths (Def 4.6) is a homotopy of maps with the additional condition that the endpoints remain fixed: $H(0,t) = x$ and $H(1,t) = y$ for all $t$. This is called a *homotopy with fixed endpoints*.

=== 6.30 Definition (Basepoint-Preserving Homotopy)

Let $(X, x_0)$ and $(Y, y_0)$ be pointed spaces, and let $f, g: (X, x_0) -> (Y, y_0)$ be basepoint-preserving maps. A homotopy of maps $H$ from $f$ to $g$ is *basepoint-preserving* if $H(x_0, t) = y_0$ for all $t in [0,1]$.

=== 6.31 Proposition (Homotopy and Induced Homomorphisms)

_Let $(X, x_0)$ and $(Y, y_0)$ be pointed spaces, and let $f$ and $g$ be basepoint-preserving maps from $X$ to $Y$. If there exists a basepoint-preserving homotopy from $f$ to $g$, then $f_* = g_*$._

*Proof.* If $H: X times [0,1] -> Y$ is a basepoint-preserving homotopy and $alpha$ is a loop based at $x_0$, then $I(s, t) = H(alpha(s), t)$ is a homotopy of paths from $f compose alpha$ to $g compose alpha$, so $f_*([alpha]) = g_*([alpha])$.

== Free Homotopy of Loops

=== 6.32 Definition (Free Homotopy)

Let $X$ be a topological space, and let $alpha$ and $beta$ be loops in $X$. A *free homotopy* from $alpha$ to $beta$ is a homotopy of maps $H$ from $alpha$ to $beta$ such that $H(0, t) = H(1, t)$ for all $t in [0,1]$. That is, each intermediate path $h_t$ is a loop, but the basepoint $h_t(0) = h_t(1)$ may depend on $t$. If such a homotopy exists, $alpha$ and $beta$ are *freely homotopic*.

Any homotopic pair of loops is freely homotopic, but not conversely.

=== 6.38 Proposition (Characterization of Free Homotopy)

_Let $alpha$ and $beta$ be loops in a topological space $X$ based at points $x$ and $y$, respectively. Then $alpha$ and $beta$ are freely homotopic if and only if there exists a path $gamma$ from $x$ to $y$ such that $alpha tilde.eq gamma dot beta dot overline(gamma)$._

=== 6.40 Corollary (Free Homotopy and Conjugacy)

_Let $alpha$ and $beta$ be loops in $X$ based at the same point $x_0$. Then $alpha$ and $beta$ are freely homotopic if and only if $[alpha]$ and $[beta]$ are conjugate in $pi_1(X, x_0)$._

== Deformation Retractions

=== 6.43 Definition (Deformation Retraction)

A *deformation retraction* of a space $X$ onto a subspace $A$ is a homotopy of maps $H: X times [0,1] -> X$ satisfying:
+ $H(x, 0) = x$ for all $x in X$ (initial map is the identity).
+ $H(x, 1) in A$ for all $x in X$ (final map sends $X$ into $A$).
+ $H(a, t) = a$ for all $a in A$ and $t in [0,1]$ (points of $A$ stay fixed).

If such a homotopy exists, we say $A$ is a *deformation retract* of $X$.

=== 6.45 Proposition

_If $A$ is a deformation retract of $X$ and $a_0 in A$, then the homomorphism $i_*: pi_1(A, a_0) -> pi_1(X, a_0)$ induced by the inclusion map is an isomorphism of groups._

*Proof.* Let $H$ be a deformation retraction, and let $r = H(dot, 1): X -> A$ be the retraction. Then $i compose r = H(dot, 1)$ is homotopic to $"id"_X$ (via $H$) by a basepoint-preserving homotopy, so $(i compose r)_* = ("id"_X)_*$ by Prop 6.31. Also $r compose i = "id"_A$ (since $H(a, t) = a$). By functoriality, $i_* compose r_* = "id"$ and $r_* compose i_* = "id"$, so $i_*$ and $r_*$ are inverse isomorphisms.

=== 6.46 Example (Circle in Punctured Plane)

$X = RR^2 without \{(0,0)\}$ deformation retracts onto $S^1$ via $H(x, t) = (1-t)x + t x\/||x||$. Hence $pi_1(RR^2 without \{0\}) tilde.equiv pi_1(S^1) tilde.equiv ZZ$.

=== 6.47 Example (Circle in Mobius Strip)

The Mobius strip $M$ deformation retracts onto its centerline $C$, which is homeomorphic to a circle. Hence $pi_1(M) tilde.equiv ZZ$.

=== 6.48 Example (Figure Eight)

A twice-punctured plane $RR^2 without \{p, q\}$ deformation retracts onto a figure-eight curve. The fundamental group of the figure eight is the free group on 2 generators (shown using Van Kampen's theorem in §7).

=== 6.49 Example ($S^(n-1)$ in Punctured $RR^n$)

$X = RR^n without \{bold(0)\}$ deformation retracts onto $S^(n-1)$ via $r(x) = x\/||x||$ and the straight-line homotopy. For $n gt.eq 3$, $pi_1(S^(n-1)) = 1$, so $pi_1(RR^n without \{bold(0)\}) = 1$ for $n gt.eq 3$.

=== 6.50 Example (Contractible Spaces)

A space $X$ is *contractible* if it deformation retracts onto a single point. For example, $RR^n$ is contractible by a straight-line homotopy, as is any star-shaped subset of $RR^n$. Any contractible space has trivial fundamental group.

== Homotopy Equivalence

=== 6.52 Definition (Homotopy Equivalence)

Two pointed spaces $(X, x_0)$ and $(Y, y_0)$ are *homotopy equivalent* if there exist basepoint-preserving maps $f: (X, x_0) -> (Y, y_0)$ and $g: (Y, y_0) -> (X, x_0)$ such that $g compose f tilde.eq "id"_X$ and $f compose g tilde.eq "id"_Y$ by basepoint-preserving homotopies. In this case, $f$ is called a *homotopy equivalence*.

=== 6.54 Proposition

_Homotopy equivalence is an equivalence relation on pointed topological spaces._

=== 6.55 Example

If $A$ is a deformation retract of $X$ and $a_0 in A$, then $X$ and $A$ are homotopy equivalent. Thus $S^1$, $S^1 times [0,1]$ (closed annulus), $RR^2 without \{0\}$ (punctured plane), and the Mobius strip are all homotopy equivalent.

=== 6.58 Proposition

_If $f: (X, x_0) -> (Y, y_0)$ is a homotopy equivalence, then the induced homomorphism $f_*: pi_1(X, x_0) -> pi_1(Y, y_0)$ is an isomorphism of groups._

*Proof.* $g_* compose f_* = (g compose f)_* = ("id"_X)_*$ (using Prop 6.31 since $g compose f tilde.eq "id"_X$), and similarly $f_* compose g_* = ("id"_Y)_*$. So $f_*$ and $g_*$ are inverse isomorphisms.

Hence homotopy equivalent spaces have isomorphic fundamental groups. Homeomorphic spaces are homotopy equivalent, but not vice versa.

= §7: Van Kampen's Theorem

== Group Presentations

=== 7.1 Definition (Word)

Let $G$ be a group, and let $S$ be a subset of $G$. A *word* in $S$ is an expression of the form $w_1 w_2 dots.c w_n$ where each $w_i$ is either an element of $S$ or the inverse of an element of $S$. The number $n$ is the *length* of the word. The identity element is a word of length 0.

=== 7.4 Definition (Generating Set)

A subset $S subset.eq G$ is called a *generating set* for $G$ if every element of $G$ can be represented by a word in $S$. The elements of $S$ are called *generators*, and together they are said to *generate* $G$.

=== 7.7 Definition (Relation)

If $G$ is a group with generating set $S$, a *relation* in $G$ is an equation of the form $u = v$, where $u$ and $v$ are words in $S$ that represent the same element of $G$.

=== 7.8 Definition (Presentation)

A *presentation* for a group $G$ is a pair $chevron.l S mid(|)R chevron.r$, where $S$ is a generating set for $G$, and $R$ is a set of relations in $G$ with the property that every relation in $G$ can be derived from those in $R$.

=== Examples of Presentations

- *Dihedral group:* $D_n = chevron.l r, s mid(|)s^2 = 1, r^n = 1, s r = r^(-1) s chevron.r$
- *Cyclic groups:* $ZZ_n = chevron.l a mid(|)a^n = 1 chevron.r$ and $ZZ = chevron.l a mid(|)- chevron.r$ (no relations)
- *$ZZ^2$:* $ZZ^2 = chevron.l a, b mid(|)a b = b a chevron.r$
- *$ZZ^n$:* $ZZ^n = chevron.l a_1, ..., a_n mid(|)a_i a_j = a_j a_i "for all" i, j chevron.r$

== Free Groups

=== 7.12 Definition (Free Group)

A *free group* is a group that has a presentation with no relations. For $n gt.eq 1$, the *free group of rank $n$* is $F_n = chevron.l x_1, ..., x_n mid(|)- chevron.r$.

=== 7.15 Definition (Reduced Word)

Given a word for an element of $F_n$, we can *reduce* it by cancelling adjacent inverse pairs ($s s^(-1)$ or $s^(-1) s$). A word is *reduced* if it has no such pairs.

=== 7.16 Proposition

_Let $F = chevron.l S mid(|)- chevron.r$ be a free group. Then every element of $F$ can be represented uniquely by a reduced word in $S$._

Thus distinct reduced words represent distinct elements of a free group.

=== Examples

$F_1 = chevron.l x mid(|)- chevron.r tilde.equiv ZZ$. $F_2 = chevron.l x, y mid(|)- chevron.r$ is different from $ZZ^2$ since $x$ and $y$ do not commute.

== Free Products

=== 7.19 Definition (Free Product)

Given two groups $G = chevron.l S mid(|)R chevron.r$ and $H = chevron.l S' mid(|)R' chevron.r$, the *free product* of $G$ and $H$ is the group
$ G * H = chevron.l S, S' mid(|)R, R' chevron.r. $
The key difference from the direct product $G times H$ is that elements of $G$ and $H$ do not commute in $G * H$.

=== 7.24 Definition (Alternating Word)

If $G$ and $H$ are groups, an *alternating word* in $G union.sq H$ is a word $w_1 dots.c w_n$ where the $w_i$ alternate between elements of $G$ and elements of $H$. An alternating word is *reduced* if each $w_i$ is nontrivial.

=== 7.25 Theorem

_If $G$ and $H$ are groups, then every element of $G * H$ can be represented uniquely by a reduced alternating word._

=== Examples

- $ZZ * ZZ = chevron.l a, b mid(|)- chevron.r = F_2$ (free group on 2 generators).
- $ZZ_6 * ZZ_8 = chevron.l a, b mid(|)a^6 = 1, b^8 = 1 chevron.r$, which is infinite even though both factors are finite.
- Free product of free groups: $F_m * F_n tilde.equiv F_(m+n)$.

== Tietze Transformations

*Tietze transformations* are two moves for simplifying group presentations:
+ *Remove an extra relation:* If one relation follows from the others, it can be removed.
+ *Remove an extra generator:* If a relation has the form $c = w$ where $c$ is a single generator and $w$ does not involve $c$, remove $c$ and replace $c$ by $w$ in all other relations.

The inverses (adding an extra relation or generator) are also Tietze transformations. It is a theorem that any two finite presentations of the same group are related by a finite sequence of Tietze transformations.

== Van Kampen's Theorem (Basic Version)

=== 7.32 Theorem (Basic Van Kampen)

_Suppose $X = U union V$, where $U$ and $V$ are path-connected open sets and $U inter V$ is simply connected ($pi_1(U inter V) = \{e\}$). Then_
$ pi_1(X) tilde.equiv pi_1(U) * pi_1(V). $

*Proof.* See Hatcher's _Algebraic Topology_, Section 1.2. The proof is not examinable.

=== 7.33 Example (Twice-Punctured Plane)

Let $X = RR^2 without \{p, q\}$ with $p = (-1, 0)$ and $q = (1, 0)$. Let $U = \{x < 1\/2\}$ and $V = \{x > -1\/2\}$. Then $U inter V$ is a strip homeomorphic to $RR^2$, hence simply connected. Both $U$ and $V$ are homeomorphic to the punctured plane, so $pi_1(U) tilde.equiv pi_1(V) tilde.equiv ZZ$. By Van Kampen, $pi_1(X) tilde.equiv ZZ * ZZ tilde.equiv F_2$.

=== 7.36 Principle (Wedge Sums)

_If $A$ and $B$ are "reasonable" spaces (i.e., they have neighbourhoods of the basepoint that deformation retract to the basepoint), then $pi_1(A or B) tilde.equiv pi_1(A) * pi_1(B)$._

=== 7.37 Example (Wedge of Two Circles)

Let $X = S^1 or S^1$ (figure eight). Take $U$ = left circle with a neighbourhood of the wedge point in the right circle, and $V$ = right circle with a neighbourhood of the wedge point in the left circle. Then $U$ deformation retracts onto the left $S^1$, $V$ deformation retracts onto the right $S^1$, and $U inter V$ is a cross-shaped region that deformation retracts to a point. By Van Kampen, $pi_1(S^1 or S^1) tilde.equiv ZZ * ZZ = F_2$.

== Hawaiian Earring

=== 7.42 Proposition

_The fundamental group $pi_1(E, e_0)$ of the Hawaiian earring is uncountable. In particular, it has no countable generating set._

The key idea is that "infinite concatenations" $f_1 dot f_2 dot f_3 dots.c$ of loops around successive circles are well-defined continuous loops but are not in the subgroup generated by the individual circle loops.

=== 7.43 Proposition

_The natural homomorphism $pi_1(E) * pi_1(E) -> pi_1(E or E)$ is not an isomorphism (it is not surjective)._

This shows the wedge sum principle (Principle 7.36) requires the spaces to be "reasonable" -- the Hawaiian earring fails because its basepoint has no neighbourhood that deformation retracts to a point.

== Van Kampen's Theorem (Full Version)

=== 7.45 Theorem (Full Van Kampen)

_Let $X$ be a topological space, and suppose that $X = U union V$, where $U$ and $V$ are path-connected open subsets of $X$, and $U inter V$ is path-connected. Fix a basepoint $x_0 in U inter V$, and suppose that_
$ pi_1(U, x_0) = chevron.l S mid(|)R chevron.r quad "and" quad pi_1(V, x_0) = chevron.l S' mid(|)R' chevron.r, $
_and let $S''$ be a generating set for $pi_1(U inter V, x_0)$. Then_
$ pi_1(X, x_0) = chevron.l S, S' mid(|)R, R', "and" i_*(c) = j_*(c) "for all" c in S'' chevron.r, $
_where $i_*: pi_1(U inter V, x_0) -> pi_1(U, x_0)$ and $j_*: pi_1(U inter V, x_0) -> pi_1(V, x_0)$ are the homomorphisms induced by the inclusion maps._

That is, $pi_1(X)$ is the *amalgamated free product* $pi_1(U) *_(pi_1(U inter V)) pi_1(V)$: the free product $pi_1(U) * pi_1(V)$ modulo the normal closure of $\{i_*(c) j_*(c)^(-1) mid(|)c in pi_1(U inter V)\}$.

== Application: Fundamental Groups of Surfaces

Using the full Van Kampen theorem with a polygon representation: let $U$ = interior of the polygon (contractible, $pi_1 = \{e\}$) and $V$ = neighbourhood of the boundary. The boundary loop gives one relation:

=== Torus

$ pi_1(T^2) = chevron.l a, b mid(|)a b a^(-1) b^(-1) chevron.r tilde.equiv ZZ^2 $

=== Surface of Genus $g$

$ pi_1(Sigma_g) = chevron.l a_1, b_1, ..., a_g, b_g mid(|)[a_1, b_1][a_2, b_2] dots.c [a_g, b_g] chevron.r $
where $[a_i, b_i] = a_i b_i a_i^(-1) b_i^(-1)$ is the commutator. This is a single relation.

=== Non-Orientable Surface $N_k$

$ pi_1(N_k) = chevron.l a_1, ..., a_k mid(|)a_1^2 a_2^2 dots.c a_k^2 chevron.r $

=== Special Cases

- $pi_1(RR P^2) = chevron.l a mid(|)a^2 chevron.r tilde.equiv ZZ_2$
- $pi_1(K) = chevron.l a, b mid(|)a b a^(-1) b chevron.r$ (Klein bottle)

== Abelianisation and Classification

=== 7.51 Definition (Abelianisation)

The *abelianisation* of a group $G$ is $G^"ab" = G \/ [G, G]$, the quotient by the commutator subgroup, and is the largest abelian quotient of $G$. If $G = chevron.l A mid(|)R chevron.r$, then $G^"ab" = chevron.l A mid(|)R, [a_i, a_j] "for all" a_i, a_j chevron.r$.

The *first homology group* is defined as $H_1(X) := pi_1(X)^"ab"$.

=== 7.56 Theorem (Classification via Abelianisation)

The abelianisations distinguish the surfaces:
- $H_1(S^2) = 0$
- $H_1(Sigma_g) = pi_1(Sigma_g)^"ab" tilde.equiv ZZ^(2g)$ (free abelian of rank $2g$)
- $H_1(N_k) = pi_1(N_k)^"ab" tilde.equiv ZZ^(k-1) plus.o ZZ_2$ (free part of rank $k-1$, plus $ZZ_2$ torsion)

*Proof sketch.* For $Sigma_g$: abelianising $chevron.l a_1, b_1, ..., a_g, b_g mid(|)[a_1, b_1] dots.c [a_g, b_g] chevron.r$ adds commutativity relations $a_i b_j = b_j a_i$ etc. The single relation becomes trivial (product of commutators), giving $ZZ^(2g)$.

For $N_k$: abelianising $chevron.l a_1, ..., a_k mid(|)a_1^2 dots.c a_k^2 chevron.r$ gives $chevron.l a_1, ..., a_k mid(|)a_1^2 dots.c a_k^2, a_i a_j = a_j a_i chevron.r$. Setting $b_i = a_i a_k^(-1)$ for $i < k$, the relation becomes $a_k^2 = (b_1 dots.c b_(k-1))^(-2) a_k^(2-2k)$ which simplifies to $ZZ^(k-1) plus.o ZZ_2$.

Since $H_1$ is a topological invariant, these surfaces are all topologically distinct, completing the proof of the Classification Theorem 3.39.

== Summary: Proof of Classification of Compact Surfaces

Combining geometric (cutting/pasting, triangulation) and algebraic (fundamental groups, abelianisation) methods:

+ *Existence*: every compact surface can be reduced (by cutting/pasting) to one of the standard polygon words $Sigma_g$ or $N_k$ (Prop 3.53 + Dyck's theorem).
+ *Distinctness*: $H_1$ distinguishes all surfaces simultaneously: $H_1(Sigma_g) tilde.equiv ZZ^(2g)$ (torsion-free) while $H_1(N_k) tilde.equiv ZZ^(k-1) plus.o ZZ_2$ (has $ZZ_2$ torsion). Alternatively, the Euler characteristic $chi$ distinguishes within each family, while orientability distinguishes the $Sigma_g$ family from the $N_k$ family.

= §8: Classification of covering maps

Coverings of a space $X$ correspond to subgroups of $pi_1(X)$. The main result is the *Galois correspondence*.

== Examples of non-universal covers

=== 8.1 Example (Circle covering circle)

For $n gt.eq 1$, the map $p: S^1 -> S^1$, $(cos theta, sin theta) |-> (cos n theta, sin n theta)$ is a covering map wrapping $n$ times.

=== 8.2 Example (Cylinder covering torus)

Let $C = \{x^2 + y^2 = 1\} subset RR^3$ be an infinite cylinder and $T^2 = S^1 times S^1$. Then $p: C -> T^2$, $(x, y, z) |-> ((x, y), (cos z, sin z))$ is a covering wrapping infinitely many times.

=== 8.3 Example (Figure-eight cover)

Let $X = S^1 or S^1$ with edges labelled $a, b$. A finite graph $tilde(X)$ with edges labelled so that each $a$-edge maps to the $a$-loop and each $b$-edge to the $b$-loop gives a covering $p: tilde(X) -> X$.

== The subgroup associated to a cover

=== 8.5 Proposition

_The homomorphism $p_*$ induced by a basepoint-preserving covering map is injective._

*Proof sketch.* If $p_*([alpha]) = p_*([beta])$ then $p compose tilde(alpha) tilde.equiv p compose tilde(beta)$ in $X$. By the homotopy lifting theorem, lifts $tilde(alpha), tilde(beta)$ are homotopic in $tilde(X)$.

=== 8.6 Corollary

If $p: (tilde(X), tilde(x)_0) -> (X, x_0)$ is a basepoint-preserving covering, then $p_*(pi_1(tilde(X), tilde(x)_0))$ is a subgroup of $pi_1(X, x_0)$ isomorphic to $pi_1(tilde(X), tilde(x)_0)$. This is the *subgroup corresponding to $p$*.

=== 8.7 Example (Covers of $S^1$)

The $n$-fold cover $p: S^1 -> S^1$ induces multiplication by $n$ on $pi_1(S^1) = ZZ$, so corresponds to the subgroup $n ZZ subset.eq ZZ$.

=== 8.8 Exercise

_$p$ is a universal covering iff the corresponding subgroup is trivial._

=== 8.9 Proposition

_Let $p: (tilde(X), tilde(x)_0) -> (X, x_0)$ be a basepoint-preserving covering. The corresponding subgroup is_
$ H = \{ [alpha] in pi_1(X, x_0) mid(|) alpha "lifts to a loop in" tilde(X) "based at" tilde(x)_0 \}. $

*Proof sketch.* If $[alpha] in H$, the lift $tilde(alpha)$ is a loop with $p_*([tilde(alpha)]) = [alpha]$. Conversely if $alpha = p compose tilde(beta)$ for some loop $tilde(beta)$, the homotopy lifting theorem shows the lift $tilde(alpha)$ is homotopic to $tilde(beta)$, hence is a loop.

=== 8.10 Example ($F_3$ as a subgroup of $F_2$)

For the figure-eight cover of Example 8.3 with three vertices in $tilde(X)$, the lifts of $a$, $b^2$, and $b a b^(-1)$ are loops at $tilde(x)_0$ but $b$ is not. The corresponding subgroup $H subset.eq F_2$ is generated by $\{a, b^2, b a b^(-1)\}$ and is isomorphic to $F_3$ (since $pi_1(tilde(X)) tilde.equiv F_3$).

=== 8.11 Example (Basepoint matters)

Different choices of basepoint $tilde(x)_i$ in the same covering space give distinct subgroups of $pi_1(X, x_0)$ (all isomorphic to $pi_1(tilde(X))$).

== Equivalence of covers

=== 8.12 Definition (Equivalent covers)

Two basepoint-preserving covers $p: (tilde(X), tilde(x)_0) -> (X, x_0)$ and $q: (tilde(Y), tilde(y)_0) -> (X, x_0)$ are *equivalent* if there exists a homeomorphism $h: (tilde(X), tilde(x)_0) -> (tilde(Y), tilde(y)_0)$ with $p = q compose h$.

=== 8.14 Example (Equivalent covers of $S^1$)

For $n gt.eq 2$, the clockwise and counterclockwise $n$-fold covers of $S^1$ are equivalent via $h(x, y) = (x, -y)$.

=== 8.15 Example (Inequivalent covers of $S^1$)

For distinct $m, n gt.eq 1$, the $m$-fold and $n$-fold covers are inequivalent (a cover-preserving homeomorphism would have to match preimage cardinalities).

=== 8.16 Theorem (Galois correspondence: uniqueness)

_Let $X$ be locally path-connected and let $p, q$ be basepoint-preserving coverings with $tilde(X), tilde(Y)$ connected. Then $p$ and $q$ are equivalent iff their corresponding subgroups of $pi_1(X, x_0)$ are equal._

*Proof sketch.* If $p = q compose h$ then $p_* = q_* compose h_*$ and $h_*$ is an isomorphism, so images agree. Converse uses Hatcher Prop 1.33 (not examinable).

=== 8.17 Remark (Locally path-connected)

$X$ is *locally path-connected* if every point has a path-connected neighbourhood basis. For such $X$, connected iff path-connected.

=== 8.18 Corollary (Uniqueness of universal covers)

_For locally path-connected $X$, any two pointed universal covers are equivalent._

== Existence of covers

=== 8.19 Theorem (Galois correspondence: existence)

_Let $(X, x_0)$ be connected, locally path-connected, and semilocally simply connected. For any subgroup $H subset.eq pi_1(X, x_0)$, there exists a basepoint-preserving cover $p: (tilde(X), tilde(x)_0) -> (X, x_0)$ corresponding to $H$._

*Proof.* Hatcher Prop 1.36 (not examinable).

=== 8.20 Remark (Semilocally simply connected)

$X$ is *semilocally simply connected* if every point has a neighbourhood $V$ such that every loop in $V$ is null-homotopic in $X$. Satisfied by any manifold.

=== 8.21 Corollary (Existence of universal covers)

_If $X$ is connected, locally path-connected, and semilocally simply connected, then $X$ has a universal cover._

=== 8.22 Example (Universal cover of figure eight)

The universal cover of $S^1 or S^1$ is the infinite 4-valent tree, with red edges mapping to $a$ and blue edges to $b$.

=== 8.23 Example (Universal cover of $Sigma_2$)

The universal cover of the two-holed torus is homeomorphic to an open disk, obtained as a tiling of the hyperbolic plane by hyperbolic octagons.

== The Galois correspondence

=== 8.24 Theorem (Galois correspondence)

_Let $(X, x_0)$ be connected, locally path-connected, and semilocally simply connected. There is a one-to-one correspondence between:_
+ _Subgroups of $pi_1(X, x_0)$, and_
+ _Equivalence classes of basepoint-preserving coverings $p: (tilde(X), tilde(x)_0) -> (X, x_0)$ with $tilde(X)$ connected._

*Proof sketch.* Combines Theorems 8.16 and 8.19. Smaller subgroups correspond to bigger covers: the trivial subgroup corresponds to the universal cover, the whole group corresponds to $X$ itself.

=== 8.25 Example (Coverings of a circle)

Subgroups of $pi_1(S^1) tilde.equiv ZZ$ are $\{0\}$, $ZZ$, and $n ZZ$ for $n gt.eq 2$. These correspond to $RR -> S^1$ (universal), the identity $S^1 -> S^1$, and the $n$-fold cover respectively.

=== 8.26 Example (Coverings of a torus)

Subgroups of $ZZ^2$ include $\{(0, 0)\}$, various $m ZZ times n ZZ tilde.equiv ZZ^2$, and various cyclic $ZZ$ subgroups. Connected covers of $T^2$ are homeomorphic to $RR^2$ (universal), $T^2$, or $S^1 times RR$ according to the subgroup type.

=== 8.27 Example (Coverings of a figure eight)

Covers of $S^1 or S^1$ correspond to directed graphs with edges labelled $a, b$ such that each vertex has exactly one incoming and one outgoing edge of each label. Each such graph realises a subgroup of $F_2$.

= §9: Introduction to homology

== Introduction

Homotopy groups $pi_k(X, x_0)$ form an infinite sequence; higher ones are extremely intricate (e.g. $pi_n(S^m)$ are largely unknown). *Homology groups* $H_k(X)$ are always abelian, require no basepoint, and give a much simpler theory detecting "$k$-dimensional holes".

=== 9.1 Theorem (Meaning of $H_0$)

_If $X$ is path-connected then $H_0(X) tilde.equiv ZZ$. Otherwise $H_0(X) tilde.equiv ZZ^n$, where $n$ is the number of path components._

=== 9.2 Theorem (Hurewicz)

_If $X$ is path-connected, $H_1(X)$ is isomorphic to the abelianisation of $pi_1(X)$._

Thus $H_1(S^1) tilde.equiv ZZ$, $H_1(T^2) tilde.equiv ZZ^2$, and $H_1(S^1 or S^1) tilde.equiv ZZ^2$ (abelianisation of $F_2$).

=== 9.3 Theorem (Homology of spheres)

_For $n gt.eq 1$: $H_0(S^n) tilde.equiv ZZ$, $H_n(S^n) tilde.equiv ZZ$, and $H_k(S^n) = 0$ otherwise._

Immediate corollary: $S^m$ and $S^n$ are not homeomorphic for $m eq.not n$.

=== 9.4 Remark (Homology and dimension)

$H_k(X) = 0$ when $k$ exceeds the dimension of $X$: discrete spaces have $H_k = 0$ for $k gt.eq 1$; graphs for $k gt.eq 2$; $n$-manifolds for $k gt.eq n+1$.

=== 9.5 Remark (Homotopy invariance)

Homotopy equivalent spaces have isomorphic homology.

=== 9.6 Remark (Disjoint unions)

$H_k(X union.sq Y) tilde.equiv H_k(X) plus.o H_k(Y)$. Note this means disconnected spaces do not satisfy Hurewicz directly.

=== 9.7 Example (Common spaces)

#table(columns: 5, align: center,
  [$X$], [$H_0$], [$H_1$], [$H_2$], [$H_k$ ($k gt.eq 3$)],
  [pt / $RR^n$], [$ZZ$], [$0$], [$0$], [$0$],
  [two points], [$ZZ^2$], [$0$], [$0$], [$0$],
  [$S^1$], [$ZZ$], [$ZZ$], [$0$], [$0$],
  [$S^1 or S^1$], [$ZZ$], [$ZZ^2$], [$0$], [$0$],
  [$S^1 union.sq S^1$], [$ZZ^2$], [$ZZ^2$], [$0$], [$0$],
  [$S^2$], [$ZZ$], [$0$], [$ZZ$], [$0$],
  [$T^2$], [$ZZ$], [$ZZ^2$], [$ZZ$], [$0$],
  [$RR P^2$], [$ZZ$], [$ZZ_2$], [$0$], [$0$],
  [$Sigma_g$], [$ZZ$], [$ZZ^(2g)$], [$ZZ$], [$0$],
  [$N_k$], [$ZZ$], [$ZZ^(k-1) plus.o ZZ_2$], [$0$], [$0$],
)

== Abelian group presentations

Homology groups are abelian, so we write operations additively. An *abelian group presentation* is like a group presentation but written additively with commutativity understood. For example $chevron.l a, b mid(|) 3 b = 0 chevron.r$ presents $ZZ plus.o ZZ_3$.

A *free abelian group* has a presentation with no relations; a free abelian group on $n$ generators is $ZZ^n$. Any abelian group is a quotient of a free abelian group: if $G = chevron.l a_1, ..., a_m mid(|) r_1 = 0, ..., r_n = 0 chevron.r$ then $G tilde.equiv chevron.l a_1, ..., a_m chevron.r \/ chevron.l r_1, ..., r_n chevron.r$.

== Homology of graphs

=== 9.8 Definition (Chain groups and boundary)

Let $X$ be an oriented graph with vertices $v_1, ..., v_m$ and edges $e_1, ..., e_n$.

+ *Chain groups*: $C_0(X) = chevron.l v_1, ..., v_m chevron.r tilde.equiv ZZ^m$ (0-chains) and $C_1(X) = chevron.l e_1, ..., e_n chevron.r tilde.equiv ZZ^n$ (1-chains).
+ *Boundary map* $partial_1: C_1(X) -> C_0(X)$: if edge $e$ runs from $v_j$ to $v_k$, then $partial_1(e) = v_k - v_j$.
+ *Homology*: $H_1(X) = ker partial_1$, $H_0(X) = C_0(X) \/ im partial_1$, and $H_k(X) = 0$ for $k gt.eq 2$.

=== 9.9 Example (Triangle graph)

For a triangle with edges $a: u -> v$, $b: v -> w$, $c: w -> u$: $partial_1(a) = v - u$, $partial_1(b) = w - v$, $partial_1(c) = u - w$. Then $ker partial_1 = chevron.l a + b + c chevron.r tilde.equiv ZZ$ and $H_0(X) = chevron.l u, v, w mid(|) v - u, w - v, u - w chevron.r tilde.equiv ZZ$.

=== 9.10 Remark (Cycles)

Any directed cycle $e_1, ..., e_n$ gives $e_1 + dots.c + e_n in ker partial_1$. Backward edges are negated.

=== 9.11 Example (Theta graph)

Two vertices $u, w$ and edges $a, b: w -> u$ and $c: v -> x$ on a disjoint piece gives $H_0 tilde.equiv ZZ^2$ (two components) and $H_1 tilde.equiv ZZ$.

=== 9.12 Remark ($H_0$ counts components)

$H_0(X) tilde.equiv ZZ^c$ where $c$ is the number of connected components of $X$.

=== 9.13 Example (Wedge of two circles)

With single vertex $v$ and loops $a, b$: $partial_1(a) = partial_1(b) = 0$, so $H_1(X) = chevron.l a, b chevron.r tilde.equiv ZZ^2$ and $H_0(X) tilde.equiv ZZ$.

=== 9.14 Example (Theta/two-vertex multi-edge)

Two vertices $v, w$, three edges $a, b, c: v -> w$: $ker partial_1 = chevron.l a - b, b - c chevron.r tilde.equiv ZZ^2$, so $H_1 tilde.equiv ZZ^2$ and $H_0 tilde.equiv ZZ$.

== Homology of polygonal complexes

=== 9.15 Definition (Polygonal complex)

A *(finite) polygonal complex* is a quotient $X = (tilde(X) union.sq P_1 union.sq dots.c union.sq P_n) \/ tilde$ where $tilde(X)$ is a finite graph, each $P_i$ is a closed polygon, and $tilde$ identifies each edge of each $P_i$ with an edge of $tilde(X)$. We assume orientations on edges and polygons.

=== 9.16 Definition (Homology of polygonal complex)

For an oriented polygonal complex with vertices, edges, polygons:

+ *Chain groups* $C_0, C_1, C_2$ freely generated by vertices, edges, polygons.
+ *Boundary maps* $C_2 ->^(partial_2) C_1 ->^(partial_1) C_0$: $partial_1$ as for graphs; $partial_2(P) = $ signed sum of boundary edges (negate edges whose orientation disagrees with the polygon swirl).
+ *Homology*: $H_2 = ker partial_2$, $H_1 = ker partial_1 \/ im partial_2$, $H_0 = C_0 \/ im partial_1$, and $H_k = 0$ for $k gt.eq 3$.

=== 9.17 Remark ($partial_1 compose partial_2 = 0$)

The boundary of any polygon is a cycle, so $partial_1(partial_2(P)) = 0$ for each $P$. Hence $im partial_2 subset.eq ker partial_1$ and the quotient defining $H_1$ makes sense.

=== 9.18 Example (Two triangles glued to a cycle)

Triangles $P, Q$ both attached to cycle $a, b, c$ with an extra edge $d$ from $v$ to $w$. Then $partial_2(P) = a + b + c = partial_2(Q)$, so $ker partial_2 = chevron.l P - Q chevron.r tilde.equiv ZZ$ giving $H_2 tilde.equiv ZZ$ (the two triangles form a sphere). With $x = a + b + c$ and $y = c + d$: $ker partial_1 = chevron.l x, y chevron.r$, $im partial_2 = chevron.l x chevron.r$, so $H_1 tilde.equiv ZZ$. And $H_0 tilde.equiv ZZ$.

=== 9.19 Example (Bigon on a circle)

Attach a bigon $P$ with $partial_2(P) = a - c$ to the graph on vertices $v, w$ with edges $a, b, c: v -> w$. With $x = a - b$, $y = b - c$: $ker partial_1 = chevron.l x, y chevron.r$, $im partial_2 = chevron.l x + y chevron.r$, so $H_1 tilde.equiv ZZ$, $H_2 = 0$, $H_0 tilde.equiv ZZ$.

=== 9.20 Example (Homology of the torus)

Build $T^2$ from a square with boundary word $a b a^(-1) b^(-1)$ attached to the wedge $S^1 or S^1$. One vertex $v$, two edges $a, b$, one polygon $P$. Then $partial_1(a) = partial_1(b) = 0$ and $partial_2(P) = a + b - a - b = 0$. So:
$ H_2(T^2) = chevron.l P chevron.r tilde.equiv ZZ, quad H_1(T^2) = chevron.l a, b chevron.r tilde.equiv ZZ^2, quad H_0(T^2) tilde.equiv ZZ. $

=== 9.21 Example (Homology of $RR P^2$)

Build $RR P^2$ from a bigon with boundary $a a$ attached to a circle. One vertex, one edge $a$, one polygon $P$ with $partial_2(P) = 2 a$. Then $ker partial_2 = 0$, $im partial_2 = chevron.l 2 a chevron.r$, so:
$ H_2(RR P^2) = 0, quad H_1(RR P^2) = chevron.l a mid(|) 2 a chevron.r tilde.equiv ZZ_2, quad H_0(RR P^2) tilde.equiv ZZ. $
Non-orientability forces $H_2 = 0$.

= §10: Introduction to knot theory

== Introduction to knots and links

=== 10.1 Definition (Knot, link)

A *knot* is a subspace of $RR^3$ homeomorphic to $S^1$. A *link* is a disjoint union of finitely many knots, called the *components*.

Basic examples: the *unknot* (round circle), the *trefoil knot*, the *figure-eight knot*; the *unlink* (disjoint unknots), the *Hopf link* (two linked unknots), the *Borromean rings* (three circles, no two linked).

=== 10.2 Definition (Smooth knot)

A knot $K subset.eq RR^3$ is *smooth* if it admits a parametrisation $alpha: [0, 1] -> K$ which is surjective, injective on $[0, 1)$, with $alpha(0) = alpha(1)$, all derivatives existing and matching at endpoints, and $alpha'(s) eq.not (0, 0, 0)$ everywhere. This rules out *wild knots* (infinite accumulating tangles).

=== 10.3 Convention

All knots are smooth.

=== 10.4 Remark (Piecewise-linear alternative)

Piecewise-linear knot theory is equivalent to smooth knot theory.

=== 10.5 Definition (Smooth isotopy)

A *smooth isotopy* from $K$ to $K'$ is a smooth homotopy $H: [0, 1] times [0, 1] -> RR^3$ such that $h_0$ parametrises $K$, $h_1$ parametrises $K'$, and each $h_t$ parametrises some knot. Knots are *equivalent* if a smooth isotopy exists.

=== 10.12 Remark (Ambient isotopy)

An *ambient isotopy* is a homotopy $H: RR^3 times [0, 1] -> RR^3$ with $h_0 = id$, each $h_t$ a homeomorphism, and $h_1(K) = K'$. Two knots are equivalent iff they are ambient isotopic.

== Knot and link diagrams

=== 10.13 Definition (Diagram)

A *diagram* of a knot or link $L$ is an orthogonal projection onto a plane, free of:
- *cusps* (tangent perpendicular to plane),
- *double tangencies* (two strands tangent at a point),
- *triple points* (three strands crossing at a point),
with over/under information at each crossing. Components of the projection between undercrossings are called *arcs*; the number of arcs equals the number of crossings.

=== 10.14 Remark

Diagrams are considered the same up to orientation-preserving homeomorphism of the plane.

== Reidemeister moves

Three moves on diagrams:

- *Type I*: twist/untwist a loop (introduces or removes one crossing).
- *Type II*: add/remove an overlap between two strands (two crossings).
- *Type III*: drag a strand over/under/through a crossing of two others (three crossings).

=== 10.15 Theorem (Reidemeister 1926; Alexander--Briggs 1927)

_Two knot or link diagrams represent equivalent knots/links iff one can be obtained from the other by a sequence of Reidemeister moves (and plane homeomorphisms)._

=== 10.16 Remark

The three move types correspond to the three diagram defects: type I passes through a cusp, type II through a double tangency, type III through a triple point.

== Knot colouring

=== 10.18 Definition (Tricolouring)

A *tricolouring* of a diagram assigns one of three colours to each arc so that every crossing is either monochrome or uses all three colours. It is *trivial* if all arcs share a colour. The diagram is *tricolourable* if a nontrivial tricolouring exists.

=== 10.19 Example (Unknot)

The unknot has one arc, so no nontrivial tricolouring exists.

=== 10.20 Example (Trefoil)

The standard trefoil diagram admits a tricolouring with all three colours appearing, each crossing meeting all three.

=== 10.21 Example (Figure-eight)

No nontrivial tricolouring of the standard figure-eight diagram: case analysis on the four arcs forces all to share a colour.

=== 10.22 Theorem

_Tricolourability is a knot invariant._

*Proof sketch.* By Theorem 10.15, suffices to check the three Reidemeister moves preserve the existence of a nontrivial tricolouring. Each move has a case-by-case extension of the colouring, and none can convert a nontrivial tricolouring into a trivial one.

=== 10.23 Corollary

The trefoil is not equivalent to the unknot or the figure-eight knot.

=== 10.24 Exercise

Use tricolourability to show the Hopf link is not equivalent to the 2-component unlink.

== Fox $n$-colouring

=== 10.25 Definition ($n$-colouring)

For $n gt.eq 1$, an *$n$-colouring* of a diagram assigns a number in $\{0, 1, ..., n-1\}$ to each arc such that at every crossing with overstrand $a$ and understrands $b, c$:
$ 2 a equiv b + c mod n. $
Trivial if all arcs carry the same number; the diagram is *$n$-colourable* if a nontrivial $n$-colouring exists.

=== 10.26 Remark

A 3-colouring coincides with a tricolouring (the equation forces all equal or all distinct mod 3).

=== 10.27 Example (Unknot)

The unknot is not $n$-colourable for any $n$.

=== 10.28 Example (Figure-eight)

The standard figure-eight diagram is 5-colourable with arcs labelled $0, 1, 2, 4$: each of the four crossing equations $2 a equiv b + c$ holds mod 5.

=== 10.29 Exercise

_A link diagram is 2-colourable iff the link has more than one component._

=== 10.30 Theorem

_$n$-colourability is a knot invariant._

*Proof sketch.* Check each Reidemeister move extends an $n$-colouring (the mod-$n$ arithmetic at the affected arcs is consistent, e.g. a type II move introduces a new arc labelled $2 a - b$; type III introduces $2 a - 2 b + c$). None converts nontrivial to trivial colourings.

=== 10.31 Corollary

The figure-eight knot is not equivalent to the unknot.

== Knot and link groups

=== 10.32 Definition (Knot/link group)

For a knot $K subset.eq RR^3$, the *knot group* is $pi K = pi_1(RR^3 without K)$. For a link $L$, $pi L = pi_1(RR^3 without L)$. The complement is path-connected so basepoints are irrelevant. Equivalent knots have isomorphic knot groups (by the isotopy extension theorem).

=== Wirtinger presentation

Place the knot diagram in the $x y$-plane and view from $(0, 0, 1)$. For each arc $alpha_i$, form a loop $x_i$ going straight down, under the arc, and back. These *Wirtinger generators* generate $pi K$. Each crossing gives one *Wirtinger relation* $x y = z x$, where $x$ is the overstrand and $y, z$ are the understrands on either side.

=== 10.33 Theorem (Wirtinger 1904)

_If a knot/link $K$ has a diagram with arcs $alpha_1, ..., alpha_m$ and crossings contributing relations $r_1, ..., r_n$, then_
$ pi K = chevron.l x_1, ..., x_m mid(|) r_1, ..., r_n chevron.r. $

*Proof.* Stillwell §4.2.4 (not examinable).

=== 10.34 Example (Trefoil)

For the trefoil with arcs $a, b, c$ and three crossings giving relations $b c = c a$, $c a = a b$, $a b = b c$:
$ pi K = chevron.l a, b, c mid(|) b c = c a, c a = a b chevron.r tilde.equiv chevron.l a, b mid(|) b a b = a b a chevron.r. $
(The third relation follows from the first two; Tietze eliminates $c = a b a^(-1)$.)

=== 10.35 Remark (Homology of complements)

From the Wirtinger presentation and Hurewicz, each relation $z = x y x^(-1)$ abelianises to $z = y$, so all generators become equal:
$ H_1(RR^3 without K) tilde.equiv ZZ $
for any knot $K$. For a link with $k$ components, $H_1(RR^3 without L) tilde.equiv H_2(RR^3 without L) tilde.equiv ZZ^k$ and $H_3 = 0$. Thus homology sees component count but not knotting.

=== 10.36 Example (Unknot and unlink)

$pi(U) tilde.equiv ZZ$ (one generator, no relations). For the $n$-component unlink, $pi L tilde.equiv F_n$.
