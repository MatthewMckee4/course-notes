#set page(margin: (x: 50pt, y: 50pt))
#set text(size: 11pt)
#set par(justify: true)
#set enum(numbering: "(a)")

#align(center)[
  #text(size: 16pt, weight: "bold")[Practice Sheet]

  Algebraic and Geometric Topology, 2025--2026
]

#v(8pt)

These exercises develop the core material of Chapters 1--7. They mirror the style of the marked homeworks and are drawn from (or inspired by) classical sources such as Hatcher, Munkres, and Lee.

// ── 1. Winding numbers (style of 6.1) ──

#v(10pt)

*1.* Let $alpha$ be a loop in the punctured plane $X = RR^2 minus {(0,0)}$ based at $x_0 = (1, 0)$, and let $Q_1, Q_2, Q_3, Q_4$ denote the closed first, second, third, and fourth quadrants.

+ Suppose $alpha(s) in Q_1$ for all $s in [0, 1]$. Prove that $w(alpha) = 0$ by exhibiting an explicit homotopy $H: [0,1] times [0,1] -> X$ from $alpha$ to the constant loop.

+ Suppose $alpha(s) in Q_1$ for $s in [0, 1\/4]$, $alpha(s) in Q_4$ for $s in [1\/4, 1\/2]$, $alpha(s) in Q_3$ for $s in [1\/2, 3\/4]$, and $alpha(s) in Q_2$ for $s in [3\/4, 1]$. What are the possible values of $w(alpha)$? Prove your answer.

  _Hint:_ Lift $alpha$ to the universal cover $tilde(X) = (0, oo) times RR$.

+ More generally, suppose $alpha$ passes through quadrants in the cyclic order $Q_(j_1), Q_(j_2), dots, Q_(j_n)$ (with $j_1 = j_n = 1$), where consecutive quadrants differ by $plus.minus 1 space ("mod" 4)$. Prove that $4 w(alpha)$ is exactly the signed number of transitions from $Q_4$ to $Q_1$ minus the number of transitions from $Q_1$ to $Q_4$.

// ── 2. Polynomial roots via winding number (style of 7.2) ──

#v(12pt)

*2.* Let $f: CC -> CC$ be the polynomial $f(z) = z^5 - 2 z^3 + 4 z - 3$.

+ Prove that if $z in CC$ with $|z| = 2$, then $|{-2 z^3 + 4 z - 3}| < |z^5|$.

+ Deduce that the straight-line homotopy
  $ H(s, t) = (2 e^(2 pi i s))^5 + t dot ({-2 (2 e^(2 pi i s))^3 + 4 (2 e^(2 pi i s)) - 3}) $
  stays in $CC minus {0}$ for all $(s, t) in [0, 1]^2$.

+ Deduce that the loop $alpha(s) = f(2 e^(2 pi i s))$ has winding number $5$ around the origin.

+ Conclude that $f$ has at least one root in the disc $|z| lt.eq 2$, and use the Fundamental Theorem of Algebra to determine the total number of roots of $f$ in $CC$ (counted with multiplicity).

// ── 3. Induced homomorphism on T² (style of 7.3) ──

#v(12pt)

*3.* Let $T^2 = S^1 times S^1 subset CC times CC$, with basepoint $x_0 = (1, 1)$ and generating loops $alpha(s) = (e^(2 pi i s), 1)$ and $beta(s) = (1, e^(2 pi i s))$. Identify $pi_1(T^2, x_0)$ with $ZZ^2$ via $[alpha] = (1, 0)$ and $[beta] = (0, 1)$.

For each of the following maps $f: T^2 -> T^2$, compute $f_*: ZZ^2 -> ZZ^2$ as a $2 times 2$ integer matrix.

+ $f(z, w) = (z w, w)$.

+ $f(z, w) = (overline(z), w)$.

+ $f(z, w) = (z^3 w^(-2), z^2 w^(-1))$.

+ For which of these is $f_*$ an isomorphism? For which is $f$ itself a homeomorphism? Justify briefly.

// ── 4. p_* is injective (style of 7.4) ──

#v(12pt)

*4.* Let $p: tilde(X) -> X$ be a covering map with $p(tilde(x)_0) = x_0$.

+ Prove that $p_*: pi_1(tilde(X), tilde(x)_0) -> pi_1(X, x_0)$ is injective.

+ Prove that a loop class $[alpha] in pi_1(X, x_0)$ lies in $p_*(pi_1(tilde(X), tilde(x)_0))$ if and only if the unique lift of $alpha$ starting at $tilde(x)_0$ is a loop at $tilde(x)_0$.

+ Suppose $tilde(X)$ is path-connected. Prove that the index of $p_*(pi_1(tilde(X), tilde(x)_0))$ in $pi_1(X, x_0)$ equals the number of sheets of $p$.

  _Hint:_ Define a bijection from $pi_1(X, x_0) \/ p_*(pi_1(tilde(X), tilde(x)_0))$ to $p^(-1)(x_0)$ by sending the coset of $[alpha]$ to the endpoint of the lift of $alpha$.

// ── 5. Characterisations of simply connected (style of 7.5) ──

#v(12pt)

*5.* Let $X$ be a path-connected topological space. Prove that the following are equivalent.

+ $X$ is simply connected.

+ Any two paths $alpha, beta: [0,1] -> X$ with $alpha(0) = beta(0)$ and $alpha(1) = beta(1)$ are homotopic rel endpoints.

+ Every continuous map $S^1 -> X$ extends to a continuous map $D^2 -> X$.

+ Any two loops in $X$ (at possibly different basepoints) are freely homotopic.

// ── 6. Covering map verification (style of 6.F1) ──

#v(12pt)

*6.* Determine whether each of the following is a covering map. If it is, state the number of sheets. If not, identify the first condition in the definition that fails.

+ $f: RR -> S^1$, $f(t) = (cos 2 pi t, sin 2 pi t)$.

+ $g: [0, oo) -> S^1$, $g(t) = (cos 2 pi t, sin 2 pi t)$.

+ $h_n: S^1 -> S^1$, $h_n(z) = z^n$, for each $n gt.eq 1$ (where $S^1 subset CC$).

+ $k: CC minus {0} -> CC minus {0}$, $k(z) = z^2$.

+ $ell: RR^2 minus ZZ^2 -> T^2 minus {*}$, the restriction of the standard covering $RR^2 -> T^2$ to the complement of lattice points, where $* in T^2$ is the image of the lattice.

// ── 7. Multi-part covering properties (style of 6.5) ──

#v(12pt)

*7.* Let $p: tilde(X) -> X$ be a covering map.

+ Prove that $p$ is a local homeomorphism: for every $tilde(x) in tilde(X)$ there exist open neighbourhoods $U$ of $tilde(x)$ and $V$ of $p(tilde(x))$ such that $p$ restricts to a homeomorphism $U -> V$.

+ Prove that if $X$ is Hausdorff, then $tilde(X)$ is Hausdorff.

  _Hint:_ Given $tilde(x)_1 != tilde(x)_2$, treat the cases $p(tilde(x)_1) = p(tilde(x)_2)$ and $p(tilde(x)_1) != p(tilde(x)_2)$ separately.

+ Prove that if $X$ is second countable and $p$ has countably many sheets, then $tilde(X)$ is second countable.

+ Conclude: if $X$ is a surface and $p$ is a covering with countably many sheets, then $tilde(X)$ is a surface.

// ── 8. Composition of covering maps (Hatcher 1.3.7) ──

#v(12pt)

*8.* Suppose $p: Y -> X$ and $q: Z -> Y$ are covering maps.

+ Give an example where $p compose q: Z -> X$ is *not* a covering map.

  _Hint:_ The classical counterexample uses $X = S^1 or S^1$ with covers of unbounded sheet count stacked over a point.

+ Prove that if $p$ has finitely many sheets, then $p compose q$ is a covering map.

// ── 9. Covering spaces of the figure-eight ──

#v(12pt)

*9.* Let $W = S^1 or S^1$ denote the wedge of two circles, with generating loops $a$ and $b$. Recall $pi_1(W) tilde.equiv F_2 = chevron.l a, b chevron.r$.

+ Describe explicitly the universal cover $tilde(W)$ as the infinite $4$-regular tree in which every vertex has one incoming $a$-edge, one outgoing $a$-edge, one incoming $b$-edge, and one outgoing $b$-edge. Verify that it is simply connected.

+ Let $phi: F_2 -> ZZ_2$ be the homomorphism sending both $a, b$ to the non-trivial element. Describe the $2$-sheeted covering space $tilde(W)_phi -> W$ corresponding to $ker phi$ as a finite graph, and compute its fundamental group.

+ Deduce that the free group $F_2$ contains a subgroup isomorphic to $F_3$ of index $2$. More generally, argue that $F_2$ contains subgroups isomorphic to $F_n$ for every $n gt.eq 2$.

// ── 10. Klein bottle covered by torus ──

#v(12pt)

*10.* Let $K$ be the Klein bottle, obtained from the unit square $[0, 1]^2$ by identifying $(0, y) tilde (1, y)$ and $(x, 0) tilde (1 - x, 1)$.

+ Show that the map $[0, 2] times [0, 1] -> K$ induced by the standard identification of the rectangle $[0, 2] times [0, 1]$ into a torus factors through a continuous, $2$-to-$1$ covering map $T^2 -> K$.

+ Deduce that $pi_1(K)$ contains $ZZ^2$ as a subgroup of index $2$, and verify this directly from the presentation $pi_1(K) = chevron.l a, b mid a b a^(-1) b chevron.r$ by exhibiting an index-$2$ abelian subgroup.

+ Use (a) to give a proof that $pi_1(K)$ is infinite.

// ── 11. Fundamental group of a theta space ──

#v(12pt)

*11.* The *theta space* $Theta$ is the subspace of $RR^2$ consisting of the unit circle $S^1$ together with the horizontal diameter ${(x, 0) mid -1 lt.eq x lt.eq 1}$.

+ Show that $Theta$ is homotopy equivalent to $S^1 or S^1$.

  _Hint:_ Collapse one of the three arcs joining the two distinguished points to a point, and justify that this is a homotopy equivalence.

+ Compute $pi_1(Theta)$.

+ Deduce that $Theta$ is not homeomorphic to $S^1 or S^1$, despite being homotopy equivalent.

  _Hint:_ Consider local properties near the two vertices of the theta.

// ── 12. Continuous maps S² → T² ──

#v(12pt)

*12.* Prove that every continuous map $f: S^2 -> T^2$ is null-homotopic, via the following steps.

+ Show that $f_*: pi_1(S^2) -> pi_1(T^2)$ is the trivial homomorphism.

+ Using the lifting criterion for covering maps together with the universal cover $p: RR^2 -> T^2$, show that $f$ admits a continuous lift $tilde(f): S^2 -> RR^2$ with $p compose tilde(f) = f$.

+ Deduce that $tilde(f)$ is homotopic to a constant map, and hence so is $f$.

+ By the same argument, show that every continuous map $S^n -> T^k$ (with $n gt.eq 2$) is null-homotopic.

// ── 13. The Möbius band vs the annulus ──

#v(12pt)

*13.* Let $M$ be the Möbius band and $A = S^1 times [0, 1]$ the closed annulus.

+ Write down an explicit deformation retraction of $M$ onto its core circle, and deduce $pi_1(M) tilde.equiv ZZ$.

+ Show that $pi_1(A) tilde.equiv ZZ$ too, so $pi_1$ alone does not distinguish $M$ from $A$.

+ Show that $M$ and $A$ are *not* homeomorphic by the following argument: the boundary $partial M$ is a single circle, whereas $partial A$ is two disjoint circles. Any homeomorphism $M -> A$ would restrict to a homeomorphism of boundaries, giving a contradiction.

+ Are $M$ and $A$ homotopy equivalent? Justify your answer.

// ── 14. Classification of surfaces from polygon words ──

#v(12pt)

*14.* For each of the following polygon identifications, (i) determine whether the resulting surface is orientable, (ii) compute the Euler characteristic, and (iii) identify the surface up to homeomorphism.

+ The hexagon with symbol $a b a b c c$.

+ The octagon with symbol $a b c d a^(-1) b^(-1) c^(-1) d^(-1)$.

+ The $4 n$-gon with symbol $a_1 b_1 a_1^(-1) b_1^(-1) dots.c a_n b_n a_n^(-1) b_n^(-1)$.

  _For this part, take $n = 2$ and verify the Euler characteristic matches the classification theorem's prediction._

// ── 15. Free homotopy and conjugacy (Hatcher 1.1.6) ──

#v(12pt)

*15.* Let $X$ be a path-connected space with basepoint $x_0$. Let $[S^1, X]$ denote the set of free homotopy classes of maps $S^1 -> X$ (no basepoint condition).

+ Construct a surjection $Psi: pi_1(X, x_0) -> [S^1, X]$ that forgets the basepoint.

+ Prove that $Psi([gamma_1]) = Psi([gamma_2])$ if and only if $[gamma_1]$ and $[gamma_2]$ are conjugate in $pi_1(X, x_0)$.

+ Deduce that $[S^1, X]$ is in bijection with the set of conjugacy classes of $pi_1(X, x_0)$.

+ As an application, compute $|[S^1, RR P^2]|$ and $|[S^1, T^2]|$.
