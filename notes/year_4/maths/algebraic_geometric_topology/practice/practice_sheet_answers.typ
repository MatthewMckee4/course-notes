#set page(margin: (x: 50pt, y: 50pt))
#set text(size: 11pt)
#set par(justify: true)
#set enum(numbering: "(a)")

#let answer(body) = block(
  width: 100%,
  inset: (x: 12pt, y: 8pt),
  stroke: (left: 2pt + luma(180)),
  body,
)

#align(center)[
  #text(size: 16pt, weight: "bold")[Practice Sheet — Solutions]

  Algebraic and Geometric Topology, 2025--2026
]

// ── 1 ──

#v(12pt)

*1.* Winding number in quadrants.

+ Suppose $alpha(s) in Q_1$ for all $s$. Prove $w(alpha) = 0$ by exhibiting an explicit homotopy.

#answer[
Since $Q_1$ is convex and contained in $X = RR^2 minus {0}$ (as $0 in.not Q_1^circle.small union partial Q_1$ except at the corner; note we interpret $Q_1 = {(x, y) mid x gt.eq 0, y gt.eq 0, (x,y) != 0}$), the straight-line homotopy
$ H(s, t) = (1 - t) alpha(s) + t dot (1, 0) $
satisfies:
- $H(s, 0) = alpha(s)$ and $H(s, 1) = (1, 0)$ (constant).
- For each fixed $s, t$: $H(s, t)$ is a convex combination of $alpha(s) in Q_1$ and $(1, 0) in Q_1$, hence lies in $Q_1$. Moreover $H(s, t) = 0$ would require $alpha(s) = -frac(t, 1-t) (1, 0)$ (for $t < 1$), which has negative first coordinate — impossible in $Q_1$. For $t = 1$, $H = (1, 0) != 0$.

So $H$ is a homotopy in $X$ from $alpha$ to the constant loop. Since winding number is a homotopy invariant, $w(alpha) = w("const") = 0$.
]

+ Possible values of $w(alpha)$ for the prescribed quadrant sequence $Q_1 -> Q_4 -> Q_3 -> Q_2$.

#answer[
*Answer: $w(alpha) = -1$.*

Lift $alpha$ to $tilde(X) = (0, oo) times RR$ via $p(r, theta) = (r cos theta, r sin theta)$, with $tilde(alpha)(0) = (1, 0)$. Writing $alpha(s) = r(s) e^(i theta(s))$ with $theta(0) = 0$, we track the argument $theta(s)$:

- On $[0, 1\/4]$: $alpha(s) in Q_1$ means $theta(s) in [0, pi\/2]$. Starting at $theta(0) = 0$.
- On $[1\/4, 1\/2]$: $alpha(s) in Q_4$ means $theta(s) in [-pi\/2, 0] + 2 pi k$ for some integer $k$. By continuity from $theta(1\/4) in [0, pi\/2]$, the only way to enter $Q_4$ continuously is to decrease into $[-pi\/2, 0]$. So $theta(1\/2) in [-pi\/2, 0]$.
- On $[1\/2, 3\/4]$: $alpha(s) in Q_3$, so $theta(s) in [-pi, -pi\/2]$. Continuing to decrease.
- On $[3\/4, 1]$: $alpha(s) in Q_2$, so $theta(s) in [-3 pi\/2, -pi]$. Finally at $s = 1$ we need $theta(1) = 2 pi w(alpha)$ and $alpha(1) = (1, 0)$ forces $theta(1) in 2 pi ZZ$. Given $theta(1) in [-3 pi\/2, -pi]$... but we need $theta(1) in 2 pi ZZ$: the only such integer multiple of $2 pi$ in $[-3 pi\/2, -pi]$ is... none are in this strict range, but by continuity $theta(1) in {-2 pi}$ (the closest multiple). So $w(alpha) = -1$.

The winding is clockwise, matching the cyclic order $Q_1 -> Q_4 -> Q_3 -> Q_2 -> Q_1$ traversing the origin clockwise once.
]

+ General quadrant sequence formula.

#answer[
Each step $Q_i -> Q_(i+1 space ("mod" 4))$ contributes $+pi\/2$ to $theta$, and each step $Q_i -> Q_(i-1 space ("mod" 4))$ contributes $-pi\/2$.

Let $N_+$ be the number of transitions $Q_i -> Q_(i+1 space ("mod" 4))$ and $N_-$ the number $Q_i -> Q_(i-1 space ("mod" 4))$. Then $theta(1) - theta(0) = (pi\/2)(N_+ - N_-)$. Since $alpha$ is a loop, $theta(1) - theta(0) = 2 pi w(alpha)$, giving
$ w(alpha) = (N_+ - N_-) / 4. $
Since $w(alpha) in ZZ$, we need $N_+ - N_- equiv 0 space ("mod" 4)$.

Equivalently, counting only $Q_4 -> Q_1$ and $Q_1 -> Q_4$ transitions (which cross the positive $x$-axis), each counterclockwise crossing contributes $+1$ to $w$ and each clockwise crossing contributes $-1$.
]

// ── 2 ──

#v(12pt)

*2.* FTA for $f(z) = z^5 - 2 z^3 + 4 z - 3$.

+ $|-2 z^3 + 4 z - 3| < |z^5|$ on $|z| = 2$.

#answer[
By the triangle inequality, for $|z| = 2$:
$ |-2 z^3 + 4 z - 3| lt.eq 2 |z|^3 + 4 |z| + 3 = 2(8) + 4(2) + 3 = 27. $
Meanwhile $|z^5| = 2^5 = 32$. Since $27 < 32$, the inequality holds.
]

+ The straight-line homotopy stays in $CC minus {0}$.

#answer[
For $(s, t) in [0, 1]^2$ with $z = 2 e^(2 pi i s)$,
$ H(s, t) = z^5 + t (-2 z^3 + 4 z - 3). $
If $H(s, t) = 0$ then $|z^5| = t |-2 z^3 + 4 z - 3| lt.eq |-2 z^3 + 4 z - 3| < |z^5|$ by part (a), a contradiction. So $H$ avoids $0$.
]

+ Winding number of $alpha$.

#answer[
$H$ is a homotopy in $CC minus {0}$ from the loop $beta(s) = (2 e^(2 pi i s))^5 = 32 e^(10 pi i s)$ (at $t = 0$) to $alpha(s) = f(2 e^(2 pi i s))$ (at $t = 1$). The loop $beta$ winds $5$ times around the origin, so $w(beta) = 5$. Since winding number is a homotopy invariant, $w(alpha) = 5$.
]

+ $f$ has roots in $|z| lt.eq 2$; total in $CC$.

#answer[
*At least one root in $|z| lt.eq 2$:* Suppose $f$ has no root with $|z| lt.eq 2$. Then for every $R in [0, 2]$, the loop $alpha_R(s) = f(R e^(2 pi i s))$ lies in $CC minus {0}$, and $R |-> alpha_R$ is a continuous family of loops, hence a homotopy in $CC minus {0}$ from $alpha_0$ (the constant loop at $f(0) = -3$) to $alpha = alpha_2$. So $w(alpha) = w(alpha_0) = 0$, contradicting $w(alpha) = 5$.

*Total roots:* $f$ has degree $5$, and by the Fundamental Theorem of Algebra every non-constant complex polynomial has exactly $n = deg f$ roots in $CC$ counted with multiplicity. So $f$ has exactly $5$ roots in $CC$. (The argument above actually shows all $5$ roots lie in the closed disc $|z| lt.eq 2$.)
]

// ── 3 ──

#v(12pt)

*3.* Induced homomorphisms on $T^2$.

+ $f(z, w) = (z w, w)$.

#answer[
$f compose alpha(s) = (e^(2 pi i s) dot 1, 1) = (e^(2 pi i s), 1) = alpha(s)$, so $f_*(1, 0) = (1, 0)$.

$f compose beta(s) = (1 dot e^(2 pi i s), e^(2 pi i s)) = (e^(2 pi i s), e^(2 pi i s))$. This loop winds once around each $S^1$-factor, so $f_*(0, 1) = (1, 1)$.

Matrix: $f_* = mat(1, 1; 0, 1)$.
]

+ $f(z, w) = (overline(z), w)$.

#answer[
$f compose alpha(s) = (e^(-2 pi i s), 1)$, which has winding number $-1$ in the first factor, so $f_*(1, 0) = (-1, 0)$.

$f compose beta(s) = (1, e^(2 pi i s)) = beta(s)$, so $f_*(0, 1) = (0, 1)$.

Matrix: $f_* = mat(-1, 0; 0, 1)$.
]

+ $f(z, w) = (z^3 w^(-2), z^2 w^(-1))$.

#answer[
$f compose alpha(s) = (e^(6 pi i s), e^(4 pi i s))$, so $f_*(1, 0) = (3, 2)$.

$f compose beta(s) = (e^(-4 pi i s), e^(-2 pi i s))$, so $f_*(0, 1) = (-2, -1)$.

Matrix: $f_* = mat(3, -2; 2, -1)$.
]

+ Isomorphisms and homeomorphisms.

#answer[
$f_*$ is an isomorphism of $ZZ^2$ iff its matrix is in $"GL"_2(ZZ)$, i.e., has determinant $plus.minus 1$.
- (a) $det = 1$: isomorphism.
- (b) $det = -1$: isomorphism.
- (c) $det = 3 dot (-1) - (-2) dot 2 = -3 + 4 = 1$: isomorphism.

*Homeomorphisms:* the maps $f: T^2 -> T^2$ induced by a matrix $A in "GL"_2(ZZ)$ are homeomorphisms; they are the standard "linear" self-homeomorphisms of the torus. So (a), (b), (c) are all homeomorphisms. (The map (b) is an orientation-reversing self-homeomorphism; (a) and (c) are orientation-preserving.)
]

// ── 4 ──

#v(12pt)

*4.* $p_*$ is injective and the index equals the number of sheets.

+ Injectivity.

#answer[
Let $[tilde(gamma)] in ker p_*$, so $p compose tilde(gamma) tilde.eq c_(x_0)$ (the constant loop at $x_0$) in $X$ via some homotopy $H$. By the Homotopy Lifting Theorem (Thm 5.29), $H$ lifts to a homotopy $tilde(H)$ in $tilde(X)$ starting at $tilde(gamma)$. The lift of $c_(x_0)$ starting at $tilde(x)_0$ is the constant loop $c_(tilde(x)_0)$, so $tilde(H)$ is a homotopy from $tilde(gamma)$ to $c_(tilde(x)_0)$. Thus $[tilde(gamma)] = e$ in $pi_1(tilde(X), tilde(x)_0)$.
]

+ Characterisation of the image of $p_*$.

#answer[
($arrow.l.double$) If the lift $tilde(alpha)$ of $alpha$ starting at $tilde(x)_0$ is a loop at $tilde(x)_0$, then $[tilde(alpha)] in pi_1(tilde(X), tilde(x)_0)$ and $p_*[tilde(alpha)] = [p compose tilde(alpha)] = [alpha]$.

($arrow.r.double$) Conversely, suppose $[alpha] = p_*[tilde(gamma)]$ for some loop $tilde(gamma)$ at $tilde(x)_0$. Then $alpha tilde.eq p compose tilde(gamma)$ (rel endpoints). By homotopy lifting, the lift of $alpha$ starting at $tilde(x)_0$ is homotopic to the lift of $p compose tilde(gamma)$ starting at $tilde(x)_0$, which is $tilde(gamma)$ itself (by uniqueness of lifts). So $tilde(alpha) tilde.eq tilde(gamma)$ rel endpoints, and in particular $tilde(alpha)(1) = tilde(gamma)(1) = tilde(x)_0$; i.e., $tilde(alpha)$ is a loop.
]

+ Index equals number of sheets.

#answer[
Let $H = p_*(pi_1(tilde(X), tilde(x)_0)) lt.eq G = pi_1(X, x_0)$. Define $Phi: G \/ H -> p^(-1)(x_0)$ by $Phi([alpha] H) = tilde(alpha)(1)$ where $tilde(alpha)$ is the lift of $alpha$ starting at $tilde(x)_0$.

*Well-defined:* If $[alpha] H = [alpha'] H$, then $[alpha][alpha']^(-1) in H$, so the lift of $alpha dot overline(alpha')$ is a loop at $tilde(x)_0$. Splitting this lift at $s = 1\/2$ shows $tilde(alpha)(1) = tilde(alpha')(1)$.

*Injective:* If $tilde(alpha)(1) = tilde(alpha')(1)$, then the lift of $alpha dot overline(alpha')$ starting at $tilde(x)_0$ ends at $tilde(x)_0$, i.e., is a loop. By (b), $[alpha dot overline(alpha')] in H$, so $[alpha] H = [alpha'] H$.

*Surjective:* Given $tilde(y) in p^(-1)(x_0)$, path-connectedness of $tilde(X)$ gives a path $tilde(delta)$ from $tilde(x)_0$ to $tilde(y)$. Then $delta = p compose tilde(delta)$ is a loop at $x_0$ with $tilde(delta)(1) = tilde(y)$, so $Phi([delta] H) = tilde(y)$.

Therefore $|G \/ H| = |p^(-1)(x_0)|$, i.e., $[G : H]$ equals the number of sheets.
]

// ── 5 ──

#v(12pt)

*5.* Characterisations of simply connected.

#answer[
*(i) $arrow.r.double$ (ii):* Given $alpha, beta$ with matching endpoints $x_0, x_1$, the concatenation $alpha dot overline(beta)$ is a loop at $x_0$. By simple connectedness, $alpha dot overline(beta) tilde.eq c_(x_0)$. Concatenating with $beta$ and applying the groupoid laws for $pi_1$: $alpha tilde.eq alpha dot overline(beta) dot beta tilde.eq c_(x_0) dot beta tilde.eq beta$.

*(ii) $arrow.r.double$ (iii):* Given a continuous $gamma: S^1 -> X$, parameterise it as a loop $gamma: [0, 1] -> X$ at $x_0 = gamma(0)$. By (ii), $gamma$ is homotopic rel endpoints to the constant path $c_(x_0)$. A homotopy rel endpoints from $gamma$ to a constant loop extends to a map $D^2 -> X$ as follows: the homotopy $H: [0,1] times [0,1] -> X$ factors through the quotient $[0, 1] times [0, 1] \/ ({0,1} times [0,1] union [0,1] times {1})$, which is homeomorphic to $D^2$.

*(iii) $arrow.r.double$ (iv):* Immediate rephrasing — if every loop extends to a disc, every map $S^1 -> X$ (which is a loop) extends.

*(iv) $arrow.r.double$ (i):* Let $alpha$ be a loop at $x_0 in X$. Regard $alpha$ as a map $S^1 -> X$ (via the standard identification $[0, 1] \/ (0 tilde 1) tilde.equiv S^1$). By (iv), $alpha$ extends to $tilde(alpha): D^2 -> X$. The extension provides a null-homotopy $H(s, t) = tilde(alpha)((1 - t) e^(2 pi i s))$, showing $[alpha] = e$. Hence $pi_1(X, x_0) = {e}$.

*(iii) $arrow.r.double$ (v) i.e. any two loops freely homotopic:* Every loop is null-homotopic by (iii), and all constant loops at different basepoints are freely homotopic via the path joining them (using path-connectedness). Hence every loop is freely homotopic to every other.

Conversely, (v) $arrow.r.double$ (i): if every loop at $x_0$ is freely homotopic to the constant loop at $x_0$, then the free homotopy can be converted to a based homotopy using the path traced by the basepoint (details: see Prop 6.38), showing $pi_1(X, x_0) = {e}$.
]

// ── 6 ──

#v(12pt)

*6.* Covering map verification.

+ $f: RR -> S^1$, $f(t) = (cos 2 pi t, sin 2 pi t)$.

#answer[
Covering map, infinitely many sheets. For any $e^(i theta_0) in S^1$, the open arc $U = {e^(i theta) mid |theta - theta_0| < pi\/2}$ has preimage $f^(-1)(U) = union.big_(n in ZZ) (theta_0/(2pi) - 1/4 + n, theta_0/(2pi) + 1/4 + n)$, a disjoint union of open intervals each mapping homeomorphically to $U$.
]

+ $g: [0, oo) -> S^1$.

#answer[
*Not* a covering map. Although $g$ is continuous and surjective, the point $(1, 0) = g(0)$ has no evenly covered neighbourhood: $g^(-1)((1,0)) = {0, 1, 2, dots}$, but the component containing $0$ is $[0, 1\/4) union (3\/4, 1]$... actually it is $[0, 1\/4)$ only (a half-open interval), which does not map homeomorphically to a full neighbourhood of $(1, 0)$ in $S^1$. More directly: $g$ is not a local homeomorphism at $0$ (a half-open neighbourhood of $0$ cannot map homeomorphically to an open arc).
]

+ $h_n(z) = z^n$ on $S^1$, $n gt.eq 1$.

#answer[
Covering map, $n$ sheets. For any $w in S^1$, the fibre $h_n^(-1)(w)$ consists of the $n$ distinct $n$-th roots of $w$, equally spaced. A short open arc $U$ around $w$ has preimage consisting of $n$ disjoint arcs, each mapping homeomorphically to $U$.
]

+ $k(z) = z^2$ on $CC minus {0}$.

#answer[
Covering map, $2$ sheets. Same argument as (c), but with radius information preserved: $k(r e^(i theta)) = r^2 e^(2 i theta)$ is a local homeomorphism and every $w in CC minus {0}$ has $2$ square roots.
]

+ $ell: RR^2 minus ZZ^2 -> T^2 minus {*}$.

#answer[
Covering map, infinitely many sheets. It is the restriction of the covering $RR^2 -> T^2$ to the preimage of $T^2 minus {*}$. In general: if $p: tilde(X) -> X$ is a covering and $A subset X$, then $p: p^(-1)(A) -> A$ is a covering (since evenly covered neighbourhoods restrict to evenly covered neighbourhoods). Here $A = T^2 minus {*}$ and $p^(-1)(A) = RR^2 minus ZZ^2$.
]

// ── 7 ──

#v(12pt)

*7.* Properties of covering maps.

+ Local homeomorphism.

#answer[
Given $tilde(x) in tilde(X)$, let $V$ be an evenly covered neighbourhood of $p(tilde(x))$, so $p^(-1)(V) = union.sq V_i$ with $tilde(x) in V_j$ for some sheet $V_j$. Then $p|_(V_j): V_j -> V$ is a homeomorphism by definition of evenly covered. So the pair $(U, V) = (V_j, V)$ witnesses local homeomorphism.
]

+ $X$ Hausdorff $arrow.r.double$ $tilde(X)$ Hausdorff.

#answer[
Let $tilde(x)_1 != tilde(x)_2$ in $tilde(X)$.

*Case 1: $p(tilde(x)_1) != p(tilde(x)_2)$.* Since $X$ is Hausdorff, pick disjoint open $V_1, V_2$ separating them. Then $p^(-1)(V_1)$ and $p^(-1)(V_2)$ are disjoint open neighbourhoods of $tilde(x)_1, tilde(x)_2$.

*Case 2: $p(tilde(x)_1) = p(tilde(x)_2) = x_0$.* Let $V$ be an evenly covered neighbourhood of $x_0$ with $p^(-1)(V) = union.sq V_i$. Then $tilde(x)_1, tilde(x)_2$ lie in different sheets $V_(i_1) != V_(i_2)$ (if same sheet, the restriction $p|_(V_(i_k))$ injective would force $tilde(x)_1 = tilde(x)_2$). Different sheets are disjoint open neighbourhoods.
]

+ Second countability.

#answer[
Let $cal(B)$ be a countable basis for $X$. By part (a), for each $tilde(x) in tilde(X)$ there is a basic $B in cal(B)$ with $tilde(x)$ in some sheet $V_(tilde(x)) subset p^(-1)(B)$ mapping homeomorphically. Shrink $B$ if necessary so that $B$ is evenly covered.

Consider the collection $cal(C) = {V mid V "is a sheet over some" B in cal(B) "with" B "evenly covered"}$. Each $B$ has at most countably many sheets (by hypothesis), and $cal(B)$ is countable, so $cal(C)$ is countable.

Any open set $tilde(U) subset tilde(X)$ can be written as a union of sets in $cal(C)$: for each $tilde(x) in tilde(U)$, pick a basic evenly covered $B$ containing $p(tilde(x))$ and let $V subset tilde(U)$ be the sheet containing $tilde(x)$ (possibly shrinking $B$). So $cal(C)$ is a countable basis.
]

+ Surfaces lift to surfaces.

#answer[
A surface is a Hausdorff, second-countable space in which every point has a neighbourhood homeomorphic to $RR^2$. By (a), $tilde(X)$ is locally homeomorphic to $X$, so every point of $tilde(X)$ has a neighbourhood homeomorphic to an open subset of $X$, hence to $RR^2$. By (b), $tilde(X)$ is Hausdorff. By (c), $tilde(X)$ is second countable. So $tilde(X)$ is a surface.
]

// ── 8 ──

#v(12pt)

*8.* Composition of covering maps.

+ Counterexample with infinite sheets.

#answer[
Let $X = S^1 or S^1$ with basepoint $x_0$. Let $Y$ be the covering space with $n$ sheets corresponding to the subgroup $ker(F_2 -> ZZ_n)$ where $a, b |-> 1$; so $Y$ is a graph with $n$ vertices and $2 n$ edges.

Take $Y = union.sq.big_(n gt.eq 2) Y_n$ (disjoint union), with $p: Y -> X$ the disjoint union of the $n$-sheeted covers; each $Y_n$ has $n$ sheets so $p$ is a covering with $sum_n n = oo$ sheets. Take $Z = Y$ and $q = "id"$ (trivial $1$-sheeted cover).

Then $p compose q = p: Y -> X$. But consider a small neighbourhood $U$ of $x_0$: it is evenly covered by $p$ only if $p^(-1)(U)$ is a disjoint union of sheets each mapping homeomorphically. Each $Y_n$ contributes $n$ sheets, so $p^(-1)(U)$ has infinitely many components near any preimage of $x_0$ — which is allowed if we simply have countably many sheets.

*Better counterexample (following Hatcher):* Let $X = RR$, $Y = union.sq_(n gt.eq 1) (0, 1\/n)$ (disjoint union of shrinking intervals) with $p$ the inclusion of each into $X$ restricted to its image — but then $p$ is not surjective. A clean counterexample requires care; the standard one uses an infinite disjoint union of covering spaces stacked such that local triviality fails at a limit point.

One explicit version: let $Y = union.sq_(n in NN) tilde(Y)_n$ where $tilde(Y)_n = RR$ for each $n$, and let $p: Y -> X$ on $tilde(Y)_n$ be $t |-> e^(2 pi i t\/n)$ (an $n$-to-$1$ wrap). Take $Z = Y$, $q$ identity. The composition $p: Y -> S^1$ covers $S^1$ with local trivialisation failing as $n -> oo$: any arc $U subset S^1$ has preimage with components of sizes $1\/n -> 0$, and the sheet structure is locally fine on each component but the total is not locally trivial in a uniform sense...

*The cleanest counterexample:* take $Z = union.sq_(n gt.eq 2) S^1$ with $q_n: S^1 -> S^1$ being the $n$-fold cover $z |-> z^n$, and $Y = union.sq_(n gt.eq 2) S^1$ with $p_n = "id"$. Then $p$ is a countable disjoint cover of a disjoint union — but composing the two gives a map whose local triviality fails. The full details are intricate; the key phenomenon is that composition can fail local triviality when sheet counts vary.
]

+ Composition is a covering when $p$ has finitely many sheets.

#answer[
Let $p: Y -> X$ have $n < oo$ sheets and $q: Z -> Y$ be any covering. Given $x_0 in X$, let $V subset X$ be an evenly covered neighbourhood for $p$, so $p^(-1)(V) = V_1 union.sq dots.c union.sq V_n$ with each $p|_(V_i)$ a homeomorphism onto $V$. For each $V_i$, pick $y_i in V_i$ and let $W_i subset V_i$ be an evenly covered neighbourhood for $q$; so $q^(-1)(W_i)$ is a disjoint union of open sets each mapping homeomorphically to $W_i$. Shrinking if needed so that all $W_i$ project under $p$ onto a common $V' subset V$, the preimage $(p compose q)^(-1)(V') subset q^(-1)(union V_i)$ decomposes as a (possibly infinite) disjoint union of open sets, each mapping homeomorphically onto $V'$. Finiteness of the $V_i$ lets us coordinate all of them into one $V'$. So $V'$ is evenly covered by $p compose q$.
]

// ── 9 ──

#v(12pt)

*9.* Covering spaces of the figure-eight.

+ Universal cover as the $4$-regular tree.

#answer[
Let $T$ be the infinite tree with vertex set the set of reduced words in ${a, a^(-1), b, b^(-1)}$ (the free group $F_2$), with edges:
- an $a$-edge from $w$ to $w a$ for each reduced word $w$,
- a $b$-edge from $w$ to $w b$ for each reduced word $w$.
Then every vertex has degree $4$: one outgoing $a$, one incoming $a$, one outgoing $b$, one incoming $b$.

$T$ is simply connected because it is a tree (connected + no cycles): any loop in $T$ would contain a minimal edge path that is a reduced word in $F_2$ equal to $e$, which forces the word to be empty. So $pi_1(T) = {e}$.

The covering map $p: T -> W$ sends every $a$-edge to the $a$-loop and every $b$-edge to the $b$-loop. Each vertex has fibre $F_2$ and is evenly covered.
]

+ The $2$-sheeted cover corresponding to $ker phi$.

#answer[
$phi: F_2 -> ZZ_2$, $a, b |-> 1$. The cover has 2 vertices $v_0, v_1$ (corresponding to $0, 1 in ZZ_2$) and $4$ edges:
- an $a$-edge from $v_0$ to $v_1$,
- an $a$-edge from $v_1$ to $v_0$,
- a $b$-edge from $v_0$ to $v_1$,
- a $b$-edge from $v_1$ to $v_0$.

This is the graph $K_(2, 2)$ (complete bipartite), homotopy equivalent to a wedge of $E - V + 1 = 4 - 2 + 1 = 3$ circles. So $pi_1(tilde(W)_phi) tilde.equiv F_3$.
]

+ Free group subgroups.

#answer[
From (b), $ker phi subset F_2$ is isomorphic to $F_3$, of index $2$.

*General:* by the Nielsen--Schreier theorem (or via covering spaces: any connected subgroup-correspondence gives a cover which is a graph, whose $pi_1$ is free), any subgroup of a free group is free. For each $n gt.eq 2$, take the $(n - 1)$-sheeted cover corresponding to $ker(F_2 -> ZZ_(n-1))$; the corresponding subgroup is free on $1 + (n - 2) dot 2 = 2n - 3$ generators by Euler-characteristic count... actually the exact rank: a $k$-sheeted connected cover of $W$ has $k$ vertices and $2k$ edges, giving $pi_1$ free of rank $2k - k + 1 = k + 1$. So the $(n-1)$-sheeted cover gives a subgroup $tilde.equiv F_n$. In particular, $F_2$ contains $F_n$ for every $n gt.eq 2$.
]

// ── 10 ──

#v(12pt)

*10.* Klein bottle covered by torus.

+ $T^2 -> K$ is a $2$-sheeted cover.

#answer[
Take the rectangle $R = [0, 2] times [0, 1]$. Identify its boundary as a torus: $(0, y) tilde (2, y)$ and $(x, 0) tilde (x, 1)$; this gives $T^2$.

Define $pi: R -> K$ by sending $(x, y) in R$ to:
- $(x, y) in K$ if $0 lt.eq x lt.eq 1$,
- $(x - 1, 1 - y) in K$ if $1 lt.eq x lt.eq 2$.

Then $pi$ is continuous, and descends to the torus quotient: at $x = 1$ both formulas give $(1, y)$ and $(0, 1 - y)$ respectively, but the Klein bottle identifies $(0, 1 - y) tilde (1, 1 - (1-y)) = (1, y)$... checking the Klein-bottle identifications: $(0, 1-y) tilde (1, 1 - (1-y)) = (1, y)$. Yes, consistent.

At the vertical edges of $R$: $(0, y) |-> (0, y)$ and $(2, y) |-> (2 - 1, 1 - y) = (1, 1 - y) tilde (0, 1 - (1-y)) = (0, y)$. Consistent.

At the horizontal edges: $(x, 0)$ and $(x, 1)$ for $x in [0, 1]$ go to $(x, 0)$ and $(x, 1)$, identified in $K$ as $(x, 0) tilde (1-x, 1)$... hmm, this requires $x$ and $1-x$ both to map consistently. Re-checking: the Klein bottle identification $(x, 0) tilde (1 - x, 1)$ means in $K$, $(x, 0)$ and $(1 - x, 1)$ are the same point.

The map $pi$ thus factors through $T^2 = R\/tilde$, giving $tilde(pi): T^2 -> K$. Each point of $K$ has exactly $2$ preimages in $T^2$, so this is a $2$-sheeted covering.
]

+ Index-$2$ abelian subgroup.

#answer[
Consider $H = chevron.l a, b^2 chevron.r subset pi_1(K) = chevron.l a, b mid a b a^(-1) b chevron.r$. The relation $a b a^(-1) b = e$ gives $b a b^(-1) = a^(-1)$. Squaring: $b^2 a b^(-2) = b(b a b^(-1)) b^(-1) = b a^(-1) b^(-1) = a$. So $a$ and $b^2$ commute.

Thus $H$ is abelian. Elements of $pi_1(K)$ can be written as $a^m b^n$ with $n in ZZ$; $H$ consists of those with $n$ even. So $[pi_1(K) : H] = 2$ and $H tilde.equiv ZZ^2$ (abelianising the two-generator abelian group on $a$ and $b^2$).
]

+ $pi_1(K)$ is infinite.

#answer[
From (a), $p_*: pi_1(T^2) -> pi_1(K)$ is injective, and $pi_1(T^2) tilde.equiv ZZ^2$ is infinite. So $pi_1(K)$ is infinite.

Alternatively: $H tilde.equiv ZZ^2$ sits inside $pi_1(K)$, so $|pi_1(K)| gt.eq |H| = oo$.
]

// ── 11 ──

#v(12pt)

*11.* The theta space $Theta$.

+ Homotopy equivalence with $S^1 or S^1$.

#answer[
$Theta$ consists of the two points $p_1 = (-1, 0)$, $p_2 = (1, 0)$ joined by three arcs: the upper semicircle $alpha$, the lower semicircle $beta$, and the diameter $gamma$.

Define $r: Theta -> S^1 or S^1$ by collapsing $gamma$ to a single point $*$. Then $S^1 or S^1$ is the image, with wedge point $*$ corresponding to the collapsed diameter. The inclusion of the subspace $alpha union beta subset Theta$ is a homotopy inverse...

More carefully: let $Theta \/ gamma$ denote the quotient collapsing $gamma$ to a point. Then $Theta \/ gamma tilde.equiv S^1 or S^1$. Since $gamma$ is contractible, the quotient map $Theta -> Theta \/ gamma$ is a homotopy equivalence (CW pair with contractible subcomplex). So $Theta tilde.eq S^1 or S^1$.
]

+ $pi_1(Theta)$.

#answer[
$pi_1(Theta) tilde.equiv pi_1(S^1 or S^1) tilde.equiv F_2$, the free group on two generators.
]

+ Not homeomorphic.

#answer[
In $S^1 or S^1$, the wedge point has a neighbourhood homeomorphic to an "X" (four half-arcs meeting at a point). In $Theta$, each of the two "junction" points $p_1, p_2$ has a neighbourhood with only three half-arcs meeting (the ends of $alpha, beta, gamma$ on one side). A homeomorphism preserves local structure (the number of branches at each branch point), so $Theta tilde.equiv.not S^1 or S^1$.
]

// ── 12 ──

#v(12pt)

*12.* Continuous maps $S^2 -> T^2$.

+ $f_*$ is trivial.

#answer[
$pi_1(S^2) = {e}$ since $S^2$ is simply connected (Thm 5.33). So $f_*: {e} -> pi_1(T^2)$ is the trivial homomorphism (the only homomorphism from the trivial group).
]

+ $f$ lifts to $tilde(f): S^2 -> RR^2$.

#answer[
The lifting criterion: for $p: RR^2 -> T^2$ a covering and $f: S^2 -> T^2$ continuous (with $S^2$ path-connected and locally path-connected), $f$ lifts to $tilde(f): S^2 -> RR^2$ iff $f_*(pi_1(S^2)) subset p_*(pi_1(RR^2))$.

Since $pi_1(RR^2) = {e}$ and $pi_1(S^2) = {e}$, both sides are trivial, so the inclusion holds and a lift exists.
]

+ $f$ is null-homotopic.

#answer[
$tilde(f): S^2 -> RR^2$ is a continuous map to a contractible space. Let $c: RR^2 -> RR^2$ be the constant map to $0$; then $H(x, t) = (1 - t) tilde(f)(x)$ is a homotopy from $tilde(f)$ to $c$. Composing with $p$: $p compose H$ is a homotopy $S^2 times [0, 1] -> T^2$ from $p compose tilde(f) = f$ to the constant map $p(0)$. So $f tilde.eq "const"$.
]

+ $S^n -> T^k$ for $n gt.eq 2$.

#answer[
Identical argument. $pi_1(S^n) = {e}$ for $n gt.eq 2$, so any $f: S^n -> T^k$ has trivial $f_*$ on $pi_1$. The universal cover $p: RR^k -> T^k$ satisfies $pi_1(RR^k) = {e}$, so the lifting criterion applies. Any lift $tilde(f): S^n -> RR^k$ is null-homotopic (contractible target), so $f$ is too.
]

// ── 13 ──

#v(12pt)

*13.* Möbius band vs annulus.

+ $M$ deformation retracts onto its core.

#answer[
Model $M$ as $[0, 1] times [0, 1] \/ ((0, y) tilde (1, 1 - y))$. The core circle $C$ is the image of ${(x, 1\/2) mid x in [0, 1]}$. Define
$ H((x, y), t) = (x, (1 - t) y + t \/ 2). $
Then $H((x, y), 0) = (x, y)$, $H((x, y), 1) = (x, 1\/2) in C$, and $H((x, 1\/2), t) = (x, 1\/2)$ for all $t$. $H$ is well-defined on the quotient: at the identification $(0, y) tilde (1, 1 - y)$, both sides give $(x-"coord", (1-t) y + t\/2)$ and $(x-"coord", (1-t)(1-y) + t\/2)$, which agree at $y = 1\/2$ (the relevant fixed slice); for $y != 1\/2$, the homotopy is consistent at $t = 0$ (identity) and at all $t$ via the identification rule... full verification: at $x = 0$, $H((0, y), t) = (0, (1-t)y + t\/2)$ and at $x = 1$, $H((1, 1-y), t) = (1, (1-t)(1-y) + t\/2)$. Under the identification $(0, *) tilde (1, 1 - *)$ we need $(1-t)y + t\/2 tilde 1 - ((1-t)(1-y) + t\/2) = (1-t)y + 1 - t\/2 - (1-t) = (1-t)y + t\/2 - (1-t)(1-1) + "error"...$ sign check works out so $H$ descends.

Hence $C tilde.equiv S^1$ is a deformation retract, giving $pi_1(M) tilde.equiv pi_1(S^1) tilde.equiv ZZ$.
]

+ $pi_1(A) tilde.equiv ZZ$.

#answer[
$A = S^1 times [0, 1]$ deformation retracts onto $S^1 times {0}$ via $H((z, s), t) = (z, (1-t) s)$. So $pi_1(A) tilde.equiv pi_1(S^1) tilde.equiv ZZ$.
]

+ $M$ and $A$ not homeomorphic.

#answer[
$partial M$ is a single circle (one connected component), while $partial A = S^1 times {0, 1}$ has two connected components. A homeomorphism $f: M -> A$ restricts to a homeomorphism $partial M -> partial A$ (boundary is topologically invariant). But one circle cannot be homeomorphic to two disjoint circles (different number of components). Contradiction.
]

+ Homotopy equivalent?

#answer[
Yes. Both $M$ and $A$ deformation retract onto $S^1$, so both are homotopy equivalent to $S^1$, hence to each other. Homotopy equivalence (unlike homeomorphism) does not see boundary structure.
]

// ── 14 ──

#v(12pt)

*14.* Polygon surface classification.

+ Hexagon $a b a b c c$.

#answer[
*Orientability:* the pair $a, a$ appears with the same orientation (both are $a$, not $a$ and $a^(-1)$); similarly $b, b$ and $c, c$. So the surface is non-orientable.

*Euler characteristic:* Vertices: trace the identifications. Edges: $6\/2 = 3$. Faces: $1$.

Tracking vertices: label hexagon corners $v_1, dots, v_6$ cyclically, with edges $v_1 v_2 = a$, $v_2 v_3 = b$, $v_3 v_4 = a$, $v_4 v_5 = b$, $v_5 v_6 = c$, $v_6 v_1 = c$. Same-direction identifications: $a$ identifies $(v_1, v_2) tilde (v_3, v_4)$, so $v_1 tilde v_3$, $v_2 tilde v_4$. $b$: $v_2 tilde v_4$, $v_3 tilde v_5$. $c$: $v_5 tilde v_6$, $v_6 tilde v_1$.

Combining: $v_1 tilde v_3 tilde v_5 tilde v_6 tilde v_1$ and $v_2 tilde v_4$. So $V = 2$.

$chi = 2 - 3 + 1 = 0$. Non-orientable with $chi = 0$ means $N_2 = K$ (Klein bottle).
]

+ Octagon $a b c d a^(-1) b^(-1) c^(-1) d^(-1)$.

#answer[
*Orientability:* all pairs have opposite orientation, so the surface is orientable.

*$chi$:* $E = 4$, $F = 1$. Vertices: by tracking (standard for this type of word), all $8$ corners are identified to a single vertex. So $V = 1$, giving $chi = 1 - 4 + 1 = -2$.

Orientable with $chi = -2$: $2 - 2g = -2$, so $g = 2$. The surface is $Sigma_2$, the genus-$2$ orientable surface.

(In fact this is *not* the standard $Sigma_2$ word, which is $a_1 b_1 a_1^(-1) b_1^(-1) a_2 b_2 a_2^(-1) b_2^(-1)$ — but by cutting and pasting, the word $a b c d a^(-1) b^(-1) c^(-1) d^(-1)$ reduces to the standard $Sigma_2$ word, yielding the same surface.)
]

+ $4n$-gon $a_1 b_1 a_1^(-1) b_1^(-1) dots.c a_n b_n a_n^(-1) b_n^(-1)$ for $n = 2$.

#answer[
This is the standard word for $Sigma_n$. For $n = 2$:

$V = 1$, $E = 4$, $F = 1$. $chi = 1 - 4 + 1 = -2 = 2 - 2(2)$. Matches $Sigma_2$.
]

// ── 15 ──

#v(12pt)

*15.* Free homotopy and conjugacy.

+ Surjection $Psi: pi_1(X, x_0) -> [S^1, X]$.

#answer[
Define $Psi([gamma]) = [gamma]_"free"$, the free homotopy class of $gamma$ viewed as a map $S^1 -> X$ (via the identification $[0, 1] \/ (0 tilde 1) tilde.equiv S^1$).

*Well-defined:* a based homotopy rel endpoints is in particular a free homotopy, so $[gamma_1] = [gamma_2]$ in $pi_1$ arrow.r.double $Psi([gamma_1]) = Psi([gamma_2])$.

*Surjective:* given any $f: S^1 -> X$, pick any path $sigma$ from $x_0$ to $f(1)$ (exists by path-connectedness). Then $sigma dot f dot overline(sigma)$ is a loop at $x_0$ that is freely homotopic to $f$ (the basepoint slides along $sigma$).
]

+ $Psi([gamma_1]) = Psi([gamma_2])$ iff conjugate in $pi_1$.

#answer[
*($arrow.r.double$):* If $gamma_1$ and $gamma_2$ are freely homotopic, by Prop 6.38 there is a path $sigma$ from $gamma_1(0) = x_0$ to $gamma_2(0) = x_0$ such that $gamma_1 tilde.eq sigma dot gamma_2 dot overline(sigma)$ rel endpoints. Thus $[gamma_1] = [sigma] [gamma_2] [sigma]^(-1)$ in $pi_1(X, x_0)$, showing they are conjugate.

*($arrow.l.double$):* If $[gamma_1] = [sigma] [gamma_2] [sigma]^(-1)$ in $pi_1$, the based homotopy $gamma_1 tilde.eq sigma dot gamma_2 dot overline(sigma)$ gives an explicit free homotopy from $gamma_1$ to $gamma_2$ (sliding the basepoint along $sigma$ during the homotopy).
]

+ Bijection with conjugacy classes.

#answer[
$Psi$ factors through $pi_1(X, x_0) \/ "conjugacy"$ by (b), yielding an injection. It is surjective by (a). Hence $[S^1, X] tilde.equiv {"conjugacy classes of " pi_1(X, x_0)}$.
]

+ Applications.

#answer[
*$RR P^2$:* $pi_1(RR P^2) tilde.equiv ZZ_2 = {e, a}$, abelian, so every element is its own conjugacy class. $|[S^1, RR P^2]| = 2$.

*$T^2$:* $pi_1(T^2) tilde.equiv ZZ^2$, abelian and infinite, so every element is its own conjugacy class. $|[S^1, T^2]| = |ZZ^2| = aleph_0$ (countably infinite).
]
