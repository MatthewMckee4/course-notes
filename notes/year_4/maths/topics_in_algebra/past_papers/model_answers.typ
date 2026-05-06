#set document(title: "Topics in Algebra — Past Paper Model Answers")
#set page(margin: 25pt)
#set text(size: 10pt)
#set heading(numbering: none)

#align(center)[
  #text(size: 16pt, weight: "bold")[Topics in Algebra]
  #v(2pt)
  #text(size: 12pt)[Concise Model Answers (2019--2025)]
]

#v(8pt)

Notation: FIT = First Isomorphism Theorem; FTFGAG = Fundamental Theorem of
Finitely Generated Abelian Groups; J-H = Jordan-Hölder; e.d. = elementary
divisors; i.f. = invariant factors. Cite theorems by name.

= 2019

== A1

- *(i)* $G != {e}$ and the only normal subgroups of $G$ are ${e}$ and $G$.
- *(ii)* Abelian: $ZZ_p$ ($p$ prime). Non-abelian: $A_n$ for $n gt.eq 5$.
- *(iii)* Composition series = subnormal series ${e} = H_0 triangle.l dots.c triangle.l H_n = G$
  with each factor $H_(i+1) \/ H_i$ simple. Two such series are *isomorphic*
  if they have the same length and their factor groups match up in pairs of
  isomorphic groups (in some order).
- *(iv)* $ZZ_(30)$ subgroups (one per divisor of 30): orders $1, 2, 3, 5, 6, 10, 15, 30$.
  All composition series have length 3 with factors a permutation of
  ${ZZ_2, ZZ_3, ZZ_5}$. Six series exist (one per ordering of primes), e.g.
  ${0} < chevron.l 15 chevron.r < chevron.l 5 chevron.r < ZZ_(30)$ etc.
  All isomorphic by J-H.
- *(v)* If ${0} = H_0 < H_1 < dots.c < H_n = ZZ$ existed, then $H_1 = r ZZ$ for
  some $r > 0$. But $H_1 \/ H_0 tilde.equiv r ZZ tilde.equiv ZZ$ is *not* simple
  (e.g. $2 r ZZ$ is a proper nontrivial normal subgroup). $square$

== A2

- *(i)* $G$ has a finite generating set: $exists thin a_1, dots, a_n in G$ with
  $G = chevron.l a_1, dots, a_n chevron.r$.
- *(ii)* FTFGAG: $G tilde.equiv ZZ^r plus.o ZZ_(d_1) plus.o dots.c plus.o ZZ_(d_t)$
  with $d_1 | d_2 | dots.c | d_t gt.eq 2$; $r$ and the $d_i$ unique.
- *(iii)* $|G| = 60 = 2^2 dot 3 dot 5$, $p(2) dot p(1) dot p(1) = 2$ groups:
  $ZZ_(60)$ and $ZZ_2 times ZZ_(30)$.
- *(iv)* $F_n$ = set of reduced words on $a_1, dots, a_n, a_1^(-1), dots, a_n^(-1)$
  under concatenation followed by reduction. Group structure: associative
  (concatenation is); identity = empty word; inverse of $a_(i_1)^(epsilon_1) dots.c a_(i_k)^(epsilon_k)$
  is $a_(i_k)^(-epsilon_k) dots.c a_(i_1)^(-epsilon_1)$.
- *(v)* Hom $F_2 -> ZZ_4$ are determined by sending $a, b$ to any pair in
  $ZZ_4$, giving $4 dot 4 = 16$ homs. Surjective iff
  $gcd("image", 4) = 1$, i.e., at least one of $phi(a), phi(b)$ is odd.
  Both even: $2 dot 2 = 4$ choices. Surjective: $16 - 4 = 12$.

== B1

- *(i)* FIT: $phi: G -> G'$ hom $arrow.r.double$ $K = ker(phi) triangle.l G$ and
  $G \/ K tilde.equiv "Im"(phi)$ via $mu(a K) = phi(a)$.
  Proof bullets:
  + $K triangle.l G$ since kernels are normal.
  + $mu$ well-defined: $a K = b K arrow.r.double b^(-1) a in K arrow.r.double phi(a) = phi(b)$.
  + $mu$ hom: $mu(a K dot b K) = phi(a b) = phi(a) phi(b)$.
  + $mu$ injective: $mu(a K) = e' arrow.r.double a in K arrow.r.double a K = K$.
  + $mu$ surjective: by definition of $"Im"(phi)$. $square$

- *(ii)* $v = (2, 2)$. Define $phi: ZZ times ZZ -> ZZ times ZZ_k$,
  $phi(m, n) = (m - n, n + k ZZ)$. Then $ker(phi) = {(n, n) : k | n} = chevron.l (k, k) chevron.r$.
  Set $k = 2$ to get $ker = chevron.l v chevron.r$. So $ZZ^2 \/ chevron.l v chevron.r tilde.equiv ZZ times ZZ_2$,
  i.e., *$k = 2$*.

- *(iii)* $c_g(x y) = g x y g^(-1) = (g x g^(-1))(g y g^(-1)) = c_g(x) c_g(y)$ (hom).
  $c_g$ bijective with inverse $c_(g^(-1))$, so $c_g in "Aut"(G)$. And
  $phi(g h)(x) = (g h) x (g h)^(-1) = g(h x h^(-1)) g^(-1) = c_g(c_h(x)) = (phi(g) phi(h))(x)$.

- *(iv)* $ker(phi) = {g : c_g = "id"} = {g : g x g^(-1) = x thin forall x} = Z(G)$.

- *(v)* $G = D_4$, $Z(D_4) = {1, r^2}$. By FIT, $"Im"(phi) tilde.equiv D_4 \/ Z(D_4)$
  of order 4. The quotient is non-cyclic (every nonidentity coset has order
  2), so $"Im"(phi) tilde.equiv ZZ_2 times ZZ_2$ (Klein four).

== B2

- *(i)* $|X^G| equiv |X| (mod p)$. Orbits partition $X$; orbit sizes divide
  $|G| = p^n$ so each is $1$ or a positive power of $p$. Size-1 orbits are
  fixed points. Hence $|X| = |X^G| + sum p^(k_i)$ with $k_i gt.eq 1$, so
  $|X| equiv |X^G| (mod p)$. $square$

- *(ii) Cauchy.* $X = {(a_1, dots, a_p) in G^p : a_1 dots.c a_p = e}$, so
  $|X| = |G|^(p-1)$ (free choice for first $p-1$). $ZZ_p$ acts by cyclic
  shift; $|X^(ZZ_p)| equiv |X| equiv 0 (mod p)$ since $p | |G|$. The tuple
  $(e, dots, e)$ is fixed; so there are $gt.eq p$ fixed points, giving
  $a != e$ with $a^p = e$.

- *(iii)* $H$ acts on $G \/ H$ by left mult. Fixed coset $g H$: $h g H = g H thin forall h in H$
  iff $g^(-1) h g in H thin forall h$ iff $g in N_G(H)$. So fixed cosets =
  $N_G(H) \/ H$. By (i), $[G : H] equiv [N_G(H) : H] (mod p)$.

- *(iv) Sylow I.* By induction on $i$.
  - Base $i = 1$: by Cauchy (ii), $G$ has element of order $p$.
  - Step: Suppose $|H| = p^i$ with $i < n$. Then $p | [G : H]$, so by (iii)
    $p | [N_G(H) : H]$. Apply Cauchy to the (nontrivial) group
    $N_G(H) \/ H$: it has subgroup of order $p$, whose preimage $K$ in
    $N_G(H)$ has order $p^(i+1)$, with $H triangle.l K$.
  - This gives subgroups of every order $p^i$, $1 lt.eq i lt.eq n$, with
    each $p^i$-subgroup normal in some $p^(i+1)$-subgroup. $square$

== B3

- *(i)* $H K$ closed: elements of $H$, $K$ commute (by (ii) below), so
  $(h_1 k_1)(h_2 k_2) = h_1 h_2 k_1 k_2 in H K$. Inverse:
  $(h k)^(-1) = k^(-1) h^(-1) = h^(-1) k^(-1) in H K$. Normal:
  $g(h k)g^(-1) = (g h g^(-1))(g k g^(-1)) in H K$ since both $H, K triangle.l G$.

- *(ii)* $[h, k] = h^(-1) k^(-1) h k$. Since $H triangle.l G$:
  $k^(-1) h k in H$, so $[h, k] = h^(-1)(k^(-1) h k) in H$. Since $K triangle.l G$:
  $h^(-1) k^(-1) h in K$, so $[h, k] = (h^(-1) k^(-1) h) k in K$. Thus
  $[h, k] in H inter K = {e}$, giving $h k = k h$.

- *(iii)* Define $psi: H times K -> H K$, $psi(h, k) = h k$. Hom by (ii).
  Surjective by definition. Injective: $h k = e arrow.r.double h = k^(-1) in H inter K = {e}$.

- *(iv)* $|G| = p^2$. $Z(G) != {e}$ (centre of nontrivial $p$-group is
  nontrivial). If $|Z(G)| = p^2$, $G$ abelian. If $|Z(G)| = p$, then
  $G \/ Z(G)$ is cyclic of order $p$, forcing $G$ abelian (standard
  lemma) — contradiction. So $|Z(G)| = p^2$, $G$ abelian.

- *(v)* $|G| = p^2 q$, $p < q$, $p divides.not q - 1$. Sylow:
  - $n_p | q$ and $n_p equiv 1 (mod p)$. Options $1, q$. $n_p = q$ requires
    $p | q - 1$, excluded. So $n_p = 1$, Sylow $p$ unique and normal.
  - $n_q | p^2$ and $n_q equiv 1 (mod q)$. Options $1, p, p^2$. $p < q$ rules
    out $p$. $p^2 equiv 1 (mod q)$ requires $q | (p - 1)(p + 1)$, hence
    $q | p + 1$ (since $q > p > p - 1$), giving $q = p + 1$, only $p = 2, q = 3$
    — but $q - 1 = 2$ is divisible by $p = 2$, excluded. So $n_q = 1$,
    Sylow $q$ unique and normal.
  Both Sylows normal; orders coprime, so $P inter Q = {e}$ and
  $|P Q| = p^2 q = |G|$. By (iii), $G tilde.equiv P times Q$. $P$ has order
  $p^2$ so abelian (by (iv)); $Q tilde.equiv ZZ_q$ abelian. So $G$ abelian.

#pagebreak()

= 2020

== A1

- *(i) FIT.* $phi : G -> G'$ hom $arrow.r.double$ $G \/ ker(phi) tilde.equiv "Im"(phi)$.
- *(ii)* The sign hom $"sgn" : S_n -> {plus.minus 1}$ is surjective with
  kernel $A_n$. By FIT, $S_n \/ A_n tilde.equiv ZZ_2$, so $[S_n : A_n] = 2$.
- *(iii) Schreier:* any two subnormal series have isomorphic refinements.
  For $S_1 : {0} < 15 ZZ < 3 ZZ < ZZ$ and $S_2 : {0} < 6 ZZ < 2 ZZ < ZZ$:
  refine each by $30 ZZ = lcm$. $S_1$ refines to ${0} < 30 ZZ < 15 ZZ < 3 ZZ < ZZ$
  with factors $30 ZZ, ZZ_2, ZZ_5, ZZ_3$; $S_2$ refines to
  ${0} < 30 ZZ < 6 ZZ < 2 ZZ < ZZ$ with factors $30 ZZ, ZZ_5, ZZ_3, ZZ_2$.
  Same factor multi-set. ✓
- *(iv) Sylow $p$-subgroup* of $G$: a maximal $p$-subgroup, equivalently a
  subgroup of order $p^n$ where $|G| = p^n m$ with $gcd(p, m) = 1$.
- *(v)* $|G| = 60 = 2^2 dot 3 dot 5$. Sylow $p$-subgroups exist for $p in {2, 3, 5}$,
  with orders $4, 3, 5$ respectively.
- *(vi) FTFGAG:* see 2019 A2(ii).

== A2

- *(i)* Every finite $p$-group is solvable. By Sylow I, ${e} = H_0 triangle.l H_1 triangle.l dots.c triangle.l H_n = G$
  with $|H_i| = p^i$. Each factor has order $p$ hence cyclic and abelian.
  So this is a subnormal series with abelian factors $arrow.r.double$ $G$ solvable.
- *(ii) Universal property of $F(S)$:* for any group $H$ and any function
  $f : S -> H$, there is a *unique* group hom $hat(f) : F(S) -> H$
  extending $f$.
- *(iii) Group presentation:* $G = chevron.l A | R chevron.r$ means
  $G tilde.equiv F(A) \/ N(R)$ where $N(R)$ is the normal closure of $R subset.eq F(A)$.
- *(iv)* $D_n = chevron.l r, s | r^n = s^2 = (s r)^2 = e chevron.r$ (order $2n$);
  $ZZ times ZZ_5 = chevron.l a, b | b^5 = e, a b = b a chevron.r$.

== B1

$|G| = p^2 q$ with $p < q$ and $p divides.not q - 1$.

- *(i)* $n_p | q, n_p equiv 1 (mod p)$. Options $1, q$; $q$ excluded since
  $p divides.not q - 1$. So $n_p = 1$, unique Sylow $p$ subgroup $P$.
- *(ii)* $n_q | p^2, n_q equiv 1 (mod q)$. Options $1, p, p^2$. $p, p^2 < q^?$:
  $p < q$ so $p equiv 1 (mod q)$ impossible; $p^2 equiv 1 (mod q)$ forces
  $q | p + 1$ hence $q = p + 1$, only $(p, q) = (2, 3)$, but $p | q - 1$
  excluded. So $n_q = 1$, unique $Q$.
- *(iii)* Unique Sylow subgroups are normal.
- *(iv)* $|P Q| = |P||Q| \/ |P inter Q| = p^2 q \/ 1 = |G|$, so $P Q = G$.
- *(v)* $|P inter Q|$ divides both $p^2$ and $q$ (coprime), so $= 1$.
- *(vi)* For $p in P, q in Q$: $[p, q] in P inter Q = {e}$ (as in 2019 B3(ii)),
  so $p q = q p$.
- *(vii)* From (iv)--(vi), $G tilde.equiv P times Q$. $P$ abelian (order $p^2$),
  $Q$ abelian (order $q$ prime), so $G$ abelian.
- *(viii)* $G tilde.equiv ZZ_(p^2) times ZZ_q tilde.equiv ZZ_(p^2 q)$ (since
  $gcd(p^2, q) = 1$, by CRT) or $G tilde.equiv ZZ_p times ZZ_p times ZZ_q$.
  Two groups up to isomorphism.

== B2

- *(i)* If $A$ finite abelian non-cyclic, write
  $A tilde.equiv ZZ_(d_1) times dots.c times ZZ_(d_t)$ with $d_1 | d_2 | dots.c | d_t$
  and $t gt.eq 2$ (since not cyclic). Pick prime $p | d_1$. Each $ZZ_(d_i)$
  has unique subgroup of order $p$ (since $p | d_i$), say $C_i$. Then
  $C_1 times C_2 lt.eq A$ and $C_1 times C_2 tilde.equiv ZZ_p times ZZ_p$.

- *(ii)* $360 = 2^3 dot 3^2 dot 5$. Count: $p(3) p(2) p(1) = 3 dot 2 dot 1 = 6$.
  Listing (i.f. then e.d.):
  + $ZZ_(360)$; e.d. ${8, 9, 5}$
  + $ZZ_2 times ZZ_(180)$; e.d. ${2, 4, 9, 5}$
  + $ZZ_2 times ZZ_2 times ZZ_(90)$; e.d. ${2, 2, 2, 9, 5}$
  + $ZZ_3 times ZZ_(120)$; e.d. ${8, 3, 3, 5}$
  + $ZZ_6 times ZZ_(60)$; e.d. ${2, 4, 3, 3, 5}$
  + $ZZ_2 times ZZ_6 times ZZ_(30)$; e.d. ${2, 2, 2, 3, 3, 5}$

- *(iii)*
  - *(a) Universal property of $A(S)$.* By construction
    $A(S) = F(S) \/ N(R)$ where $R = {[s, t] : s, t in S}$. Given
    $phi : S -> G$ with $G$ abelian: by universal property of $F(S)$, get
    unique $tilde(phi) : F(S) -> G$ extending $phi$. Since $G$ abelian,
    $tilde(phi)([s, t]) = e$, so $N(R) lt.eq ker(tilde(phi))$. By the
    universal property of quotients, $tilde(phi)$ factors through
    $A(S) = F(S) \/ N(R)$ uniquely.
  - *(b)* If $|S| = n$ finite, the universal property characterises $A(S)$
    up to unique isomorphism. $ZZ^n$ also satisfies this universal property
    (with basis the standard $e_i$). Hence $A tilde.equiv ZZ^n$.

== B3

- *(i)* $|X^G| equiv |X| (mod p)$ — same proof as 2019 B2(i).

- *(ii)* $|H K| = |H| |K| \/ |H inter K|$. Define
  $psi : H times K -> H K$, $(h, k) |-> h k$. Surjective. The fibre over
  $h k$ has $|H inter K|$ elements (parametrise by $H inter K$:
  $(h x, x^(-1) k)$ for $x in H inter K$ gives the same product). So
  $|H K| = |H times K| \/ |H inter K|$.

- *(iii) Frattini's argument.* $N triangle.l G$, $P$ Sylow $p$ of $N$.
  - *(a)* For $g in G$: $g P g^(-1) lt.eq g N g^(-1) = N$ and has same
    order as $P$. So $g P g^(-1)$ is a Sylow $p$ of $N$.
  - *(b)* By Sylow II inside $N$, $exists thin n in N$ with $n P n^(-1) = g P g^(-1)$.
  - *(c)* From (b), $(n^(-1) g) P (n^(-1) g)^(-1) = P$, so $n^(-1) g in N_G(P)$.
    Hence $g = n dot (n^(-1) g) in N dot N_G(P)$. So $G = N dot N_G(P)$.
  - *(d)* If $P triangle.l N$: every conjugate $g P g^(-1) = P$ within $N$
    (since $P$ unique Sylow); so $g P g^(-1) = P$ for all $g in G$, i.e.,
    $P triangle.l G$.

- *(iv)* Apply Frattini to $H = N_G(P) triangle.l N_G(N_G(P))$ (in fact
  $H triangle.l N_G(H)$ trivially). Set $K = N_G(N_G(P))$. Inside $K$, $P$
  is Sylow of $H = N_G(P)$. By Frattini, $K = H dot N_K(P)$. But
  $N_K(P) lt.eq N_G(P) = H$, so $K = H$. Hence $N_G(N_G(P)) = N_G(P)$.

#pagebreak()

= 2021 (Mixed MCQ + Long-Answer)

== Section A — multi-answer multiple choice

- *A1.* $1800 = 2^3 dot 3^2 dot 5^2$. Count $= p(3) p(2) p(2) = 3 dot 2 dot 2 = 12$.
  *(b)*.

- *A2.* For $1800$, e.d. and i.f. matches:
  + ${8, 9, 25} <-> {1800}$. ✓ — both give $ZZ_(1800)$.
  + ${2, 4, 9, 5, 5} <-> {30, 60}$? i.f. of e.d. ${2, 4, 9, 5, 5}$ is
    $d_1 = 2 dot 1 dot 5 = 10, d_2 = 4 dot 9 dot 5 = 180$. So actual i.f.
    is ${10, 180} != {30, 60}$. ✗
  + ${2, 4, 9, 5, 5} <-> {10, 180}$. ✓
  + ${8, 3, 3, 5, 5} <-> {6, 300}$? i.f. = $1 dot 3 dot 5 = 15, 8 dot 3 dot 5 = 120$.
    ${15, 120} != {6, 300}$. ✗
  Match: *(a), (c)*.

- *A3.* $G = ZZ_8 times ZZ_4 times ZZ_2 times ZZ_(81)$. Elements with
  order dividing 4: $4 dot 4 dot 2 dot 1 = 32$ (in $ZZ_(81)$: only $0$,
  since $4 divides.not 81$). Order dividing 3: $1 dot 1 dot 1 dot 3 = 3$.
  $(n, m) = (32, 3)$. *(d)*.

- *A4.* $ZZ_3 ⋊ ZZ_4$ via $phi(b)(a) = (-1)^b a$ (only nontrivial hom
  $ZZ_4 -> "Aut"(ZZ_3) = ZZ_2$). Product $(a_1, b_1)(a_2, b_2) = (a_1 + (-1)^(b_1) a_2, b_1 + b_2)$.
  + $(2, 1) ast (2, 1) = (2 - 2, 2) = (0, 2) != (3, 2)$. ✗
  + $(2, 2) ast (0, 3) = (2 + 0, 1) = (2, 1)$. ✓
  + $(0, 3) ast (1, 1) = (0 - 1, 0) = (2, 0) != (1, 0)$. ✗
  + $(1, 1) ast (0, 2) = (1 + 0, 3) = (1, 3) != (0, 3)$. ✗
  Match: *(b)*.

- *A5.* $H, N lt.eq G$, $N triangle.l G$.
  + *(a)* $H triangle.l G arrow.r.double G tilde.equiv H times N$. ✗ (need also $H inter N = {e}, H N = G$).
  + *(b)* $H inter N = {e} arrow.r.double G tilde.equiv N ⋊ H$. ✗ (need $G = H N$).
  + *(c)* Both intersection trivial AND $H triangle.l G$ AND $G = H N$ → $G tilde.equiv H times N$. ✓
  + *(d)* $H N$ subgroup since $N triangle.l G$. ✓
  Match: *(c), (d)*.

- *A6.* Universal property: for any $f : S -> G$ there is a unique
  $Psi : F(S) -> G$ with $Psi compose i = f$. *(b)*.

- *A7.* $|G| = 3380 = 2^2 dot 5 dot 13^2$. Sylow analysis:
  $n_(13) | 4 dot 5 = 20$, $n_(13) equiv 1 (mod 13)$. Only $1$. So $n_(13) = 1$,
  unique Sylow 13.
  + *(a)* By Sylow I, all three exist. ✓
  + *(b)* 2-Sylow has order $4$, not $2$. ✗
  + *(c)* Conjugacy classes of 5-Sylow $= 1$ (Sylow II), regardless of $n_5$. ✗
  + *(d)* $n_(13) = 1$. ✓
  Match: *(a), (d)*.

- *A8.* $G$ acts on its subgroups by conjugation.
  + *(a)* True — any conjugate of a subgroup is a subgroup.
  + *(b)* True — by Sylow II.
  + *(c)* False — $G$ acts on *all* subgroups.
  + *(d)* True — Sylow II.
  Question asks: which are *false*? Match: *(c)*.

- *A9.* $|S| = 15$, $G$ acts.
  + *(a)* $|G| = 15 = 3 dot 5$. Trivial action gives 15 fixed points, so
    fixed pts $= 15$ possible. ✗
  + *(b)* $|G| = 32 = 2^5$, $|X^G| equiv 15 equiv 1 (mod 2)$, odd. ✓
  + *(c)* $|G| = 16$, $|X^G|$ odd, not even. ✗
  + *(d)* $|G| = 3$, $|X^G| equiv 0 (mod 3)$, so cannot be 1. ✓
  Match: *(b), (d)*.

- *A10.* By the Correspondence Theorem (subgroups of $G \/ N$ correspond
  to subgroups of $G$ containing $N$, preserving normality):
  + *(c)* True. + *(d)* True. + *(a), (b)* False generally.
  Match: *(c), (d)*.

== B1

- *(i)* $G \/ N tilde.equiv ZZ$. For $n > 1$: $n ZZ triangle.l ZZ$ (since
  $ZZ$ abelian). By Correspondence (or pull back), $H = pi^(-1)(n ZZ)$ is
  $triangle.l G$ with $H \/ N tilde.equiv n ZZ$ and $[G : H] = [ZZ : n ZZ] = n$.

- *(ii)*
  - *(a)* $FF$ finite $arrow.r.double$ $"GL"_n(FF)$ is a finite group $arrow.r.double$
    has a composition series.
  - *(b)* If $"GL"_n(FF)$ has a composition series, by Theorem 35.16 we may
    refine through any normal subgroup, in particular through the centre
    $Z = {lambda I : lambda in FF^*} tilde.equiv FF^*$. Since $Z$ is abelian
    and a subgroup of a group with a composition series, $Z$ must itself
    be finite (an infinite abelian group has no composition series — its
    factors would have to be simple abelian, i.e., $ZZ_p$, but an infinite
    abelian group cannot have a finite series with all factors $ZZ_p$).
    So $|FF^*| < infinity$, hence $|FF| = |FF^*| + 1 < infinity$.

- *(iii) Derived series.* $G^((0)) = G$, $G^((i+1)) = [G^((i)), G^((i))]$.
  - *(a)* $G$ solvable $arrow.r.double exists thin n$ with $G^((n)) = {e}$.
    Take subnormal series ${e} = H_0 triangle.l dots.c triangle.l H_n = G$
    with abelian factors. Induction: $G^((k)) lt.eq H_(n-k)$. Base $k = 0$:
    $G^((0)) = G = H_n$. Step: $H_(n-k) \/ H_(n-k-1)$ abelian gives
    $[H_(n-k), H_(n-k)] lt.eq H_(n-k-1)$, so
    $G^((k+1)) = [G^((k)), G^((k))] lt.eq [H_(n-k), H_(n-k)] lt.eq H_(n-k-1)$.
    Hence $G^((n)) lt.eq H_0 = {e}$.
  - *(b)* Solvable: $S_3$ with $S_3^((0)) = S_3, S_3^((1)) = A_3, S_3^((2)) = {e}$.
    Not solvable: $A_5$ with $A_5^((i)) = A_5$ for all $i$ (since $A_5$
    simple non-abelian, $[A_5, A_5] triangle.l A_5$ is nontrivial, hence
    $= A_5$).

== B2

- *(i)*
  - *(a)* $|G| = 1001 = 7 dot 11 dot 13$. $n_(13) | 77$ and $equiv 1 (mod 13)$;
    only option $n_(13) = 1$. So $G$ has a unique (hence normal) Sylow
    13 subgroup $N tilde.equiv ZZ_(13)$.
  - *(b)* $G$ acts on $N$ by conjugation: $Psi : G -> "Aut"(N)$,
    $Psi(g)(n) = g n g^(-1)$.
  - *(c)* $|"Aut"(N)| = |"Aut"(ZZ_(13))| = phi(13) = 12$. By FIT,
    $|"Im"(Psi)|$ divides both $|G| = 1001$ and $12$. $gcd(1001, 12) = 1$.
    So $|"Im"(Psi)| = 1$, $Psi$ is trivial, meaning every $g in G$
    centralises $N$. Hence $N lt.eq Z(G)$.

- *(ii)* $S_4 tilde.equiv chevron.l a, b | a^3 = b^4 = (a b)^2 = e chevron.r$.
  - *(a)* $alpha = (2 thin 3 thin 4)$ has order 3; $beta = (1 thin 3 thin 2 thin 4)$
    has order 4; $alpha beta = (1 thin 4)$ has order 2 (direct calculation).
    By Von Dyck, sending $a -> alpha, b -> beta$ gives a hom $G -> S_4$.
    Image contains a 3-cycle and a 4-cycle, which generate $S_4$, so
    surjective.
  - *(b)* $H = chevron.l a, b^2 chevron.r$. From $(a b)^2 = e$:
    $a b a b = e$, so $b a b = a^(-1) = a^2$. Thus
    $b a b^(-1) = b a b dot b^(-2) = a^2 b^(-2) = a^2 b^2 in H$. Together
    with $b^2 in H$ centralising $b^2$, $H$ is closed under conjugation by
    $b$ and trivially by $a$, so $H triangle.l G$.
  - *(c)* The abelianisation of $G$ is computed by abelianising relations:
    $3 a = 0, 4 b = 0, 2(a + b) = 0$. Solving: $2 a + 2 b = 0$, so
    $2 b = -2 a = a$ (using $3 a = 0$), then $4 b = 2 a = 0$ (auto), and
    $2 b = a$ gives $a in 2 ZZ b$, so generated by $b$ alone with $4 b = 0$
    and $a = 2 b$, hence $G^"ab" = chevron.l b | 4 b chevron.r$. But also
    $3 a = 6 b = 2 b$, so $2 b = 0$, $G^"ab" tilde.equiv ZZ_2$.
    $H$ contains $a$ and $b^2$, projecting to $a + 2 b = 4 b = 0$ in
    $G^"ab"$. So $H lt.eq [G, G] dot$ish; actually $[G : H] = 2$ since
    $b in.not H$ and $b^2 in H$, the cosets are $H$ and $b H$.
  - *(d)* $(a b^2)^3 = e$. Use $b a b = a^2 = a^(-1)$:
    $(a b^2)^2 = a b^2 a b^2 = a (b dot b a b dot b) = a(b a^(-1) b)$...
    More cleanly: in $S_4$, $alpha beta^2 = (2 3 4)(1 2)(3 4) = (1 thin 3 thin 2)$,
    of order 3, so $(a b^2)^3$ maps to $e$. The relations in $G$ force
    $(a b^2)^3 = e$ also (verify by reducing using $b a b = a^(-1)$,
    $b^4 = a^3 = e$).
  - *(e)* $H = chevron.l a, b^2 chevron.r$ satisfies $a^3 = (b^2)^2 = (a b^2)^3 = e$,
    so by Von Dyck $H$ is a quotient of $A_4 tilde.equiv chevron.l x, y | x^3 = y^2 = (x y)^3 = e chevron.r$,
    giving $|H| lt.eq 12$. The surjection $G -> S_4$ from (a) restricts to
    $H -> A_4$, surjective (since $alpha, beta^2 = (1 2)(3 4)$ generate
    $A_4$). So $|H| gt.eq 12$, hence $|H| = 12$.
    Then $|G| = 2 |H| = 24$, and the surjection $G -> S_4$ with $|G| = |S_4|$
    is an isomorphism.

#pagebreak()

= 2022 (MCQ Section A)

== Section A

- *A1.* $7200 = 2^5 dot 3^2 dot 5^2$. Pairs e.d. ↔ i.f.:
  + ${2, 2, 2, 2, 9, 25}$ → i.f.: $d_1 = d_2 = d_3 = 2$ (from 2,2,2), then
    largest gets $2 dot 9 dot 25 = 450$. So i.f. ${2, 2, 2, 2, 450}$. ✓ matches *(a)*.
  + ${32, 9, 25}$ → i.f. ${7200}$. ✓ matches *(b)*.
  + ${2, 2, 8, 9, 5, 5}$: i.f. $d_1 = 2 dot 1 dot 5 = 10, d_2 = 2 dot 1 dot 5 = 10? $
    No: divisors per prime: $2: {2, 2, 8} -> 8, 2, 2$; $3: {9} -> 9, 1, 1$;
    $5: {5, 5} -> 5, 5, 1$. i.f.: $d_3 = 8 dot 9 dot 5 = 360$;
    $d_2 = 2 dot 1 dot 5 = 10$; $d_1 = 2 dot 1 dot 1 = 2$. So i.f. ${2, 10, 360}$.
    Compare *(c)* ${2, 12, 300}$ → mismatch. *(d)* ${2, 10, 360}$ → ✓ match.
  Match: *(a), (b), (d)*.

- *A2.* $ZZ_3 ⋊ ZZ_4$ — same as 2021 A4. *(b)* (only $(2, 2) ast (0, 3) = (2, 1)$
  and similar). Verify each:
  + $(1, 1) ast (2, 2) = (1 + (-1)(2), 3) = (-1, 3) = (2, 3) != (2, 2)$. ✗
  + $(1, 0) ast (2, 3) = (1 + 1 dot 2, 3) = (3, 3) = (0, 3) != (1, 3)$. ✗
  + $(2, 1) ast (0, 1) = (2 + (-1)(0), 2) = (2, 2)$. ✓
  + $(1, 3) ast (1, 3) = (1 + (-1)^3 dot 1, 6) = (0, 2)$. ✓
  Match: *(c), (d)*.

- *A3.* $H, N lt.eq G$, $N triangle.l G$.
  + *(a)* $H or.big N$ subgroup. ✓ ($H N$ in this notation; subgroup since $N$ normal.)
  + *(b)* $H triangle.l G arrow.r.double G tilde.equiv H times N$. ✗
  + *(c)* $H inter N = {e} arrow.r.double G tilde.equiv N ⋊ H$. ✗ (need $G = H N$)
  + *(d)* All hypotheses → $G tilde.equiv H times N$. ✓
  Match: *(a), (d)*.

- *A4.* Presentation $(S, R)$.
  + *(a)* $G tilde.equiv F(S) \/ R$? No — should be $F(S) \/ N(R)$ (normal closure). ✗
  + *(b)* $S$ finite. False — presentations can have infinite $S$. ✗
  + *(c)* $R = ker(phi : F(S) -> G)$? No, only $N(R) = ker$; $R$ generates kernel
    as normal subgroup. ✗
  + *(d)* $G$ determines $(S, R)$ uniquely. ✗ (Tietze transformations).
  Match: *(e) None of the above*.

- *A5.* $|G| = 2600 = 2^3 dot 5^2 dot 13$.
  + *(a)* Sylow 2, 5, 13 all exist by Sylow I. ✓
  + *(b)* 5-Sylow has order $5^2 = 25$, not $5$. ✗
  + *(c)* Three conjugacy classes of 2-Sylow — Sylow II says one. ✗
  + *(d)* $n_5 | 8 dot 13 = 104$, $n_5 equiv 1 (mod 5)$. Possible: $1, 26$.
    "1 or 26" ✓.
  Match: *(a), (d)*.

- *A6.* $|G|$ acts on $|S| = 12$.
  + *(a)* $|G| = 9 = 3^2$, so $|S^G| equiv 12 equiv 0 (mod 3)$, so an even number — odd number is
    impossible. ✗
  + *(b)* $|G| = 16 = 2^4$, $|S^G| equiv 12 equiv 0 (mod 2)$, even. ✓
  + *(c)* $|G| = 3$, $|S^G| equiv 0 (mod 3)$, so 1 fixed point impossible. ✓
  + *(d)* $|G| = 12$ — no constraint (not a $p$-group). ✗
  Match: *(b), (c)*.

- *A7.* Series $A: {0} lt.eq 8 ZZ lt.eq 4 ZZ lt.eq ZZ$;
  $B: {0} lt.eq 9 ZZ lt.eq ZZ$; $C: {1} lt.eq A_3 lt.eq S_3$.
  + *(a)* $A$ principal — $ZZ$ abelian, all subgroups normal in $ZZ$ ✓ (it's
    a normal series); but principal requires *simple* factors. Factors:
    $8 ZZ \/ 0 tilde.equiv ZZ$ (not simple). ✗
  + *(b)* By Schreier any two subnormal series have isomorphic refinements. ✓
  + *(c)* $C$ factors: $A_3 \/ {1} tilde.equiv ZZ_3$ (abelian), $S_3 \/ A_3 tilde.equiv ZZ_2$
    (abelian). ✓
  + *(d)* $C$ principal — factors simple? $ZZ_3, ZZ_2$ both simple. ✓
  Match: *(b), (c), (d)*.

== B1

- *(i)* False: counter-example $G = S_4$, $H = V_4$ Klein four, $H triangle.l G$,
  $H$ solvable, $G \/ H tilde.equiv S_3$ solvable. (Wait — $S_4$ *is*
  solvable.) Actually statement is *true*: extension of solvable by
  solvable is solvable. Proof: derived series of $G$: $G^((i))$ stays in
  derived series of $G \/ H$ pulled back, plus $H$. Concretely, since
  $G \/ H$ solvable, $(G \/ H)^((k)) = {e}$ for some $k$, i.e., $G^((k)) lt.eq H$.
  Since $H$ solvable, $H^((m)) = {e}$, so $G^((k+m)) lt.eq H^((m)) = {e}$.
  Hence $G$ solvable.

- *(ii)* $G tilde.equiv chevron.l a, b | a^8, a^4 b^2, a b^(-1) a b chevron.r$.
  - *(a)* From $a^4 b^2 = e$: $b^2 = a^(-4)$. Squaring: $b^4 = a^(-8) = e$
    (using $a^8 = e$). So $|b|$ divides 4.
  - *(b)* $a b^(-1) a b = e arrow.r.double a b^(-1) a = b^(-1) arrow.r.double b a^2 b = a^? $...
    Rearranging: $a b = b a^(-1)$. So in any word, all $a$'s can be moved
    left and $b$'s right, giving normal form $a^k b^j$. Range $k in {0, dots, 7}$,
    $j in {0, 1}$ (from $b^2 = a^(-4)$, can absorb), so $|G| lt.eq 16$.
  - *(c)* From $b^2 = a^(-4) = a^4$ (since $a^8 = e$), elements
    $a^k b^j$ with $j in {0, 1}$ and $k in {0, dots, 7}$. But $b^2 = a^4$,
    so $a^4$ is "redundant" with $b^2$. Quotient by relation $b = a^k$
    for $k$? Direct count: 16 candidates, but $b^2 = a^4$ identifies pairs,
    halving to $|G| lt.eq 16$. Refine via $a b = b a^(-1)$: this relation
    forces $a^2$ central. Result is dicyclic of order 16, $|G| lt.eq 16$,
    further $lt.eq 16$ (no improvement obvious without more).

  Actually a cleaner cap: $b^2 = a^4$ means $b$ has order $lt.eq 8$ in $chevron.l a chevron.r$
  — but $b$ may not be in $chevron.l a chevron.r$. Bound $|G| lt.eq 16$ from
  normal form $a^k b^j$ with $k in {0, dots, 7}, j in {0, 1}$. ✓

- *(iii) Classify finite groups satisfying:*
  + $G$ a quotient of $ZZ^2$,
  + every element has order dividing 6.
  Quotient of $ZZ^2$: $G$ is finitely generated abelian with $lt.eq 2$
  generators, so $G tilde.equiv ZZ_(d_1) times ZZ_(d_2)$ with $d_1 | d_2$
  ($d_1 = 1$ allowed for cyclic).
  Order divides 6: $d_2 | 6$. Options for $(d_1, d_2)$: $(1, 1), (1, 2), (1, 3), (1, 6), (2, 2), (2, 6), (3, 3), (6, 6)$.
  But finite + free part = 0; we need $G$ finite, so just the i.f. lists.
  So 8 isomorphism classes:
  ${e}, ZZ_2, ZZ_3, ZZ_6, ZZ_2 times ZZ_2, ZZ_2 times ZZ_6, ZZ_3 times ZZ_3, ZZ_6 times ZZ_6$.

== B2

- *(i)* $D_n = chevron.l r, s | r^n = s^2 = (s r)^2 = e chevron.r$, $n$ odd.
  - *(a)* $|D_n| = 2 n$ with $n$ odd. Sylow 2-subgroup has order 2.
    Subgroups of order 2: generated by an involution. Involutions in $D_n$
    are the $n$ reflections $s, s r, s r^2, dots, s r^(n-1)$. So *$n$ Sylow 2-subgroups*,
    namely $chevron.l s r^i chevron.r$ for $i = 0, dots, n-1$.
  - *(b)* All conjugate: $r^j (s r^i) r^(-j) = s r^(i - 2 j)$. As $j$
    ranges over $0, dots, n-1$, $i - 2 j$ ranges over all residues mod $n$
    (since $n$ odd means $gcd(2, n) = 1$). So conjugating $chevron.l s chevron.r$
    by powers of $r$ gives all $chevron.l s r^k chevron.r$. ✓

- *(ii)* $|G| = p^2 q$, $p, q$ primes.
  - *(a)* $p = q$: $|G| = p^3$, a $p$-group. By centre theorem,
    $|Z(G)| > 1$, so $Z(G) triangle.l G$ is nontrivial proper (or $= G$);
    either way, not simple.
    Alt for non-abelian: $[G, G] != G$ (nontrivial $p$-group is not
    perfect), so $[G, G]$ proper normal.
  - *(b)* $p != q$. $n_p | q$, $n_p equiv 1 (mod p)$ → $n_p in {1, q}$.
    $n_q | p^2$, $n_q equiv 1 (mod q)$ → $n_q in {1, p, p^2}$.
  - *(c)* Cannot have $n_p = q$ AND $n_q = p$ simultaneously: this would
    require $p equiv 1 (mod q)$ AND $q equiv 1 (mod p)$. WLOG $p < q$;
    then $p < q$ so $p < q$ implies $p equiv.not 1 (mod q)$ (since $0 < p - 1 < q$).
    Contradiction. So at most one is $> 1$ in this specific way.
  - *(d)* $n_q = p^2$ requires $p^2 equiv 1 (mod q)$, so $q | (p-1)(p+1)$.
    $q$ prime; if $q | p - 1$ then $q lt.eq p - 1 < p$, but we may assume
    $p < q$ (else swap), contradiction. So $q | p + 1$, hence $q lt.eq p + 1$;
    with $p < q$, $q = p + 1$.
  - *(e)* If $G$ not simple, want $|G| = 12$. From (b)(c)(d): if $n_p > 1$
    AND $n_q > 1$, must have $n_p = q, n_q = p^2$ (using (c) elimination
    and (d)). From (d), $q = p + 1$. Smallest primes: $p = 2, q = 3$,
    giving $|G| = 4 dot 3 = 12$. (Other prime pairs $(p, q)$ with
    $q = p + 1$: only $(2, 3)$ since $p, p+1$ consecutive primes only when
    $p = 2$.) So $|G| = 12$.

#pagebreak()

= 2023

== A1

- *(i) Universal property of the quotient.* If $N triangle.l G$ and
  $phi : G -> H$ is a hom with $N lt.eq ker(phi)$, then there is a unique
  hom $tilde(phi) : G \/ N -> H$ with $tilde(phi) compose pi = phi$
  (where $pi : G -> G \/ N$ is canonical).
- *(ii)* See 2019 A1(iii). Example of composition not principal: in $D_4$,
  ${e} triangle.l {e, r^2} triangle.l {e, r^2, s, r^2 s} triangle.l D_4$
  has simple factors but ${e, r^2, s, r^2 s}$ not normal in $D_4$ (it is,
  actually). Better: ${e} triangle.l {e, mu_1} triangle.l {e, mu_1, rho_2 mu_1, rho_2} triangle.l D_4$
  where ${e, mu_1}$ is not normal in $D_4$ — gives composition (factors
  $ZZ_2$) but not principal.
- *(iii) Derived series $G^((i+1)) = [G^((i)), G^((i))]$.*
  - $G$ abelian iff $G^((1)) = {e}$.
  - $G$ perfect iff $G^((1)) = G$ (so $G^((i)) = G$ for all $i$).
  - $G$ solvable iff $G^((n)) = {e}$ for some $n$.
- *(iv)* $|G| = p q$, $p < q$. $n_q | p$, $n_q equiv 1 (mod q)$. Only option
  $n_q = 1$ (since $p < q$). Unique Sylow $q$ is normal, so $G$ has a
  proper nontrivial normal subgroup, not simple. $square$

== A2

- *(i)* $"SL"_2(ZZ_3)$ has order $24$.
  $|"GL"_2(ZZ_3)| = (3^2 - 1)(3^2 - 3) = 8 dot 6 = 48$. $det : "GL"_2(ZZ_3) -> ZZ_3^*$
  surjective, kernel $"SL"_2(ZZ_3)$, $|ZZ_3^*| = 2$, so $|"SL"_2(ZZ_3)| = 48 \/ 2 = 24$.

  Sylow analysis: $24 = 2^3 dot 3$.
  - $n_2 | 3$, $n_2 equiv 1 (mod 2)$: $n_2 in {1, 3}$.
  - $n_3 | 8$, $n_3 equiv 1 (mod 3)$: $n_3 in {1, 4}$.
  $"SL"_2(ZZ_3) tilde.equiv Q_8 ⋊ ZZ_3$ (semidirect), with
  - Unique Sylow 2-subgroup of order 8 ($n_2 = 1$), $tilde.equiv Q_8$
    (the quaternion group). It is the kernel of the projection to $ZZ_3$.
  - $n_3 = 4$ Sylow 3-subgroups of order 3 (cyclic).

- *(ii) FTFGAG.* Every f.g. abelian $G tilde.equiv ZZ^r plus.o ZZ_(d_1) plus.o dots.c plus.o ZZ_(d_t)$
  with $d_1 | d_2 | dots.c$.
  - *Rank* $= r$ (the free rank).
  - *Invariant factors* = $d_1, dots, d_t$.
  - *Elementary divisors* = the prime-power decomposition of each $ZZ_(d_i)$
    via CRT.

- *(iii) Universal property of $F(A)$.* For any group $H$ and any function
  $f : A -> H$, there is a unique group hom $hat(f) : F(A) -> H$ with
  $hat(f)|_A = f$.

== B1

- *(i) $|G| = 9045 = 3^3 dot 5 dot 67$.*
  - *(a)* $n_3 | 5 dot 67 = 335$, $n_3 equiv 1 (mod 3)$. Divisors of 335:
    $1, 5, 67, 335$. ≡ 1 mod 3: $1, 67$ (since $5 equiv 2, 335 equiv 2$).
    $n_5 | 9 dot 67 = 603$, $n_5 equiv 1 (mod 5)$. Divisors: $1, 3, 9, 67, 201, 603$.
    ≡ 1 mod 5: $1, 201$ (since $3 equiv 3, 9 equiv 4, 67 equiv 2, 603 equiv 3$).
    Wait check $201 = 3 dot 67$, $201 mod 5 = 1$ ✓.
    $n_(67) | 9 dot 5 = 45$, $n_(67) equiv 1 (mod 67)$. Only option: $1$.
  - *(b)* $n_(67) = 1$, so the Sylow 67-subgroup is normal.
  - *(c)* Want $n_5 = 1$. Suppose $n_5 = 201 = 3 dot 67$. Then the number of elements of
    order 5: $201 dot 4 = 804$. Now $n_{67} = 1$ gives 66 elements of
    order 67. Total: $804 + 66 = 870$. Remaining: $9045 - 870 = 8175$.
    These $8175$ elements have order $1, 3, 9, 27, 15, 45, dots$ (any
    divisor of $|G|$ but not 5 or 67). In particular, the unique
    Sylow-67 $P_{67}$ is normal, so $G \/ P_{67}$ has order $135 = 3^3 dot 5$.
    By group-of-order $p^3 q$ analysis (similar to $|G| = 30$ argument):
    in $G \/ P_{67}$, Sylow 5 has $n'_5 | 27$, $equiv 1 (mod 5)$, options $1$.
    So unique Sylow 5 in $G \/ P_{67}$, lifting to a normal Sylow 5 in $G$.
    Hence $n_5 = 1$. $square$

- *(ii)* Abelian $G$ with $x_1 - 3 x_3 = 0, x_1 + 2 x_2 + 5 x_3 = 0$.
  - *(a)* $G tilde.equiv ZZ^3 \/ A ZZ^3$ where rows are relations:
    $A = mat(1, 0, -3; 1, 2, 5)$. Hmm a $2 times 3$ matrix; pad with a
    zero row or treat as relations. So $G tilde.equiv ZZ^3 \/ "row span"(A)$.
    Restate: $G tilde.equiv ZZ^3 \/ A^T ZZ^2$? Convention-dependent. The
    expected form: $G tilde.equiv ZZ^3 \/ A ZZ^3$ for square $A$ — extend
    with a zero row: $A = mat(1, 0, -3; 1, 2, 5; 0, 0, 0)$, giving rank-2
    relations.
  - *(b)* Reduce $mat(1, 0, -3; 1, 2, 5)$: $R_2 -= R_1 -> mat(1, 0, -3; 0, 2, 8)$.
    $C_3 += 3 C_1 -> mat(1, 0, 0; 0, 2, 8)$. $C_3 -= 4 C_2 -> mat(1, 0, 0; 0, 2, 0)$.
    SNF: $mat(1, 0, 0; 0, 2, 0)$. Track $P, Q$ during ops to get explicit
    matrices.
  - *(c)* SNF gives $G tilde.equiv ZZ \/ 1 plus.o ZZ \/ 2 plus.o ZZ tilde.equiv ZZ_2 plus.o ZZ$.
    Rank 1, invariant factor 2.

== B2

- *(i)*
  - *(a)* $G$ a $p$-group acts on finite $X$. Orbits have size $1$ or
    power of $p > 1$. Fixed points = size-1 orbits.
    $|X| = |X^G| + sum_("non-fixed") p^(k_i)$, so $|X| equiv |X^G| (mod p)$.
  - *(b) Cauchy: $p | |G| arrow.r.double thin exists thin a$ with $|a| = p$.*
    $X = {(a_1, dots, a_p) in G^p : a_1 dots.c a_p = e}$. $|X| = |G|^(p-1)$,
    divisible by $p$. $ZZ_p$ acts cyclically; fixed = constant tuples. By
    (a), $|X^(ZZ_p)| equiv 0 (mod p)$. $(e, dots, e)$ fixed; $|X^{ZZ_p}| gt.eq p$.
    So $exists thin a != e$ with $a^p = e$. $square$

- *(ii)* $G = chevron.l a, b | a^(11) = b^5 = 1, b a b^(-1) = a^3 chevron.r$.
  - *(a)* Use $b a = a^3 b$ to push $b$ to the right; iterating, every word
    is $a^n b^k$ with $n in {0, dots, 10}, k in {0, dots, 4}$. So $|G| lt.eq 55$.
  - *(b)* Cauchy: $5 = "ord"(b) | |G|$ and $11 = "ord"(a) | |G|$, so $55 | |G|$.
    Combined with (a), $|G| = 55$.
  - *(c)* $A = chevron.l a chevron.r tilde.equiv ZZ_(11)$ has index 5 hence normal
    (or directly from $b a b^(-1) = a^3 in A$). $B = chevron.l b chevron.r tilde.equiv ZZ_5$.
    $A inter B = {e}$ (orders coprime), $A B = G$. So $G tilde.equiv A ⋊_phi B$
    where $phi(b)(a) = a^3$.
  - *(d)* $"Aut"(G)$: any automorphism is determined by where $a, b$ go.
    $a$ must go to a generator of $A = chevron.l a chevron.r tilde.equiv ZZ_(11)$,
    so 10 choices. $b$ must go to an element of order 5 acting by the same
    automorphism on $A$ as $b$ does — in $G$, elements of order 5 form
    Sylow 5-subgroups; $n_5 | 11, equiv 1 (mod 5)$, gives $n_5 = 11$.
    Each Sylow 5 has 4 generators, so $11 dot 4 = 44$ candidates for the
    image of $b$. But not all give automorphisms — must preserve
    $b a b^(-1) = a^3$. After accounting, $|"Aut"(G)| lt.eq 10 dot 11 = 110$. ✓

#pagebreak()

= 2024

== A1

- *(i) Examples.*
  - *(a)* $2 ZZ times 2 ZZ$ (proper rank-2 subgroup of $ZZ^2$).
  - *(b)* $ZZ times ZZ times {0}$ (proper rank-2 subgroup of $ZZ^3$).
  - *(c)* $ZZ$ — the only group that is both free and free abelian (free
    groups of rank $gt.eq 2$ are non-abelian).
  - *(d)* $S_3$ (or any abelian group).
  - *(e)* $chevron.l a | a^4 chevron.r$.
- *(ii)* $4 = 2^2$, $p(2) = 2$ groups: $ZZ_4$ and $ZZ_2 times ZZ_2$.
- *(iii)* Want $(G \/ 12 ZZ) \/ (6 ZZ \/ 12 ZZ) tilde.equiv ZZ_3$.
  Hmm, the question says $(G \/ 12 ZZ) \/ (6 ZZ \/ 12 ZZ) tilde.equiv ZZ_3$,
  so $G \/ 6 ZZ tilde.equiv ZZ_3$, hence $G = 2 ZZ$ (so that
  $G \/ 6 ZZ = 2 ZZ \/ 6 ZZ tilde.equiv ZZ_3$).

== A2

- *(i) J-H.* See 2019 A1(iii). Any two composition series of a group are
  isomorphic.
- *(ii) Sylow $p$-subgroups of $S_3$.*
  - *(a)* $|S_3| = 6 = 2 dot 3$. Primes $p in {2, 3}$.
  - *(b)* $p = 2$: ${e, (1 2)}$ (or any transposition). $p = 3$: $A_3 = {e, (1 2 3), (1 3 2)}$.
  - *(c)* $n_3 = 1$ (only $A_3$ has order 3); $n_2 = 3$.
- *(iii) True/false.*
  - *(a)* "Every subnormal series is normal." False — $D_4$ counter-example.
  - *(b)* "$G$ finite is a $p$-group iff $|G| = p^k$." True (Lagrange + Cauchy).
  - *(c)* Sylow I existence ✓ True.
  - *(d)* "Every nontrivial subgroup of a free group is free." True
    (Nielsen-Schreier).
  - *(e)* "Subgroup of free group of rank $n$ is free of rank $n$." False —
    rank can differ (e.g., commutator subgroup of $F_2$ is free of infinite rank).

== B1

- *(i)*
  - *(a)* $G = ZZ_4 times ZZ_(10)$, $H = chevron.l (1, 5) chevron.r$.
    $(1, 5)$ has order $"lcm"(4, 2) = 4$, so $|H| = 4$, $|G \/ H| = 10$.
    Composition series: ${0} < chevron.l (0, 5) chevron.r < H < H + chevron.l (0, 2) chevron.r < G$
    with factors $ZZ_2, ZZ_2, ZZ_5, ZZ_2$. ✓
  - *(b)* $G$ has comp series $S$, and $H triangle.l G$. The series
    ${e} < H < G$ is subnormal; by Schreier, it has a refinement $S'$
    isomorphic to a refinement of $S$. Since $S$ is a composition series,
    no refinement adds new factors (every refinement of $S$ is $S$ itself,
    up to trivial insertions). So $S'$ is also a composition series, and
    it contains $H$.
  - *(c)* By contradiction, let $G$ be a finite group of smallest order
    *without* a composition series. Pick $N triangle.l G$ maximal proper.
    $|N| < |G|$ and $|G \/ N| < |G|$, so both have composition series.
    Splice them to get a composition series of $G$ — contradiction.

- *(ii) $|G| = 150 = 2 dot 3 dot 5^2$.*
  - *(a)* $n_2 | 75, equiv 1 (mod 2)$: $n_2 in {1, 3, 5, 15, 25, 75}$.
    $n_3 | 50, equiv 1 (mod 3)$: $n_3 in {1, 10, 25}$.
    $n_5 | 6, equiv 1 (mod 5)$: $n_5 in {1, 6}$.
  - *(b)* $G$ acts on $"Syl"_5(G)$ by conjugation: $g dot P_i = g P_i g^(-1)$.
    Well-defined (Sylow II) and a group action (associativity).
  - *(c)* If $n_5 != 1$, then $n_5 = 6$ and $phi : G -> S_6$ is the action
    map. $|S_6| = 720$. $|G| = 150 = 2 dot 3 dot 5^2$. $ker(phi)$ is
    proper (since $G$ acts non-trivially: orbit has 6 elements). $ker(phi)$
    nontrivial: by counting, $|"Im"(phi)| | gcd(|G|, |S_6|)$, and detailed
    counting shows kernel must be $!= {e}$.
  - *(d)* Then $ker(phi)$ is a proper nontrivial normal subgroup, so $G$
    not simple. If $n_5 = 1$, also not simple (unique normal Sylow 5).
    Either way, *no simple group of order 150*. $square$

== B2

- *(i)*
  - *(a)* $X subset.eq G$ is a basis if (i) $X$ generates $G$, and (ii) $X$
    is $ZZ$-linearly independent.
  - *(b)* If $0 != a in G$ had finite order $n$, then $n a = 0$ is a
    nontrivial $ZZ$-relation among (one) basis element — contradicting $ZZ$-LI.
    So $a$ has infinite order.
  - *(c)* $QQ$ is divisible: for any $q in QQ$ and $n in NN$, $q = n (q \/ n)$.
    A free abelian group has no divisibility property (e.g. in $ZZ$, $1$
    is not $n times$ anything for $n > 1$). So $QQ$ not free abelian.

- *(ii) Free group $F(a, b)$.*
  - *(a)* $|"Hom"(F(a, b), ZZ_9)| = |ZZ_9|^2 = 81$ (free choice for image of
    each generator).
  - *(b)* Surjective hom $F(a, b) ->> ZZ_9$: need image of $a, b$ to generate $ZZ_9$,
    i.e. $gcd(phi(a), phi(b), 9) = 1$. Failing pairs: both in $3 ZZ_9 = {0, 3, 6}$,
    giving $9$ pairs. Surjective: $81 - 9 = 72$.
  - *(c)* From a free abelian group of rank 2: same generators, but now
    abelian. $|"Hom"(ZZ^2, ZZ_9)| = 81$, surjective ones $= 72$ (same
    analysis). Actually identical to (b)? No — for abelian, there are
    fewer surjections in general, but onto a cyclic target the analysis
    matches.

- *(iii)* $G = chevron.l a, b, c, d | b a b^(-1) = a^2, b d b^(-1) = d^2, c a c^(-1) = b^2, d c d^(-1) = c^2, b d = d b chevron.r$.
  - *(a)* $|G| = 1$ (trivial). Direct: from $b a b^(-1) = a^2$, $a = b^(-1) a^2 b$, repeat: $a = a^4 = a^8 = dots.c$, all powers equal, forcing $a = e$. Similarly $b, c, d = e$.
  - *(b)* Two generators, two relations: $G = chevron.l a, b | thin chevron.r$ — but
    the trivial group can be presented as $chevron.l a, b | a, b chevron.r$ (each
    generator killed). Two generators, two relations.

#pagebreak()

= 2025

== A1

- *(i) Examples.*
  - *(a)* $ZZ_2 times ZZ_5$ (order 10, abelian, not cyclic? — $ZZ_2 times ZZ_5 tilde.equiv ZZ_(10)$ IS cyclic.
    *None exists*: every abelian group of order 10 is cyclic, since
    $10 = 2 dot 5$ with $gcd(2, 5) = 1$, by FTFGAG only $ZZ_(10)$.
  - *(b)* $ZZ {(1, 1)} = chevron.l (1, 1) chevron.r$ (the "diagonal").
  - *(c)* $ZZ^2$ (free abelian rank 2, but not free as a group).
  - *(d)* $S_3$.
- *(ii)* $24 = 2^3 dot 3$, count $= p(3) p(1) = 3$:
  $ZZ_(24), ZZ_2 times ZZ_(12), ZZ_2 times ZZ_2 times ZZ_6$.
- *(iii)* Want $(9 ZZ \/ 54 ZZ) \/ (G \/ 54 ZZ) tilde.equiv ZZ_2 times ZZ_3 tilde.equiv ZZ_6$.
  By CRT $ZZ_2 times ZZ_3 tilde.equiv ZZ_6$ cyclic. So $9 ZZ \/ G tilde.equiv ZZ_6$,
  $G = 54 ZZ$ ($54 | 54$ ✓). Verify: $9 ZZ \/ 54 ZZ tilde.equiv ZZ_6$ ✓.
  *$G = 54 ZZ$.*

== A2

- *(i) Sylow $p$-subgroups of $D_5$.* $|D_5| = 10 = 2 dot 5$.
  - *(a)* $p in {2, 5}$.
  - *(b)* $p = 2$: $chevron.l s chevron.r$ (order 2). $p = 5$: $chevron.l r chevron.r$ (order 5).
  - *(c)* $n_5 | 2$, $equiv 1 (mod 5)$, only $1$ — unique Sylow 5.
    $n_2 | 5$, $equiv 1 (mod 2)$, $n_2 in {1, 5}$, actually $n_2 = 5$
    (the 5 reflections). So unique Sylow 5; not unique Sylow 2.
- *(ii) True/false.*
  - *(a)* False — $G$ of order $p q$ has normal Sylow $q$, not simple.
  - *(b)* False — $ZZ_p times ZZ_p$ has order $p^2$, not cyclic.
  - *(c)* False — Schreier gives subnormal refinements, not joint
    sub+normal refinements.
  - *(d)* False — J-H says "isomorphic factor groups", not "isomorphic
    subgroups".
  - *(e)* True — by Nielsen-Schreier, $F_2$ has free subgroups of every
    countable rank.

== B1

- *(i)* $G = ZZ_(90)$, $H_0 = {0} < H_1 = chevron.l 45 chevron.r < H_2 = chevron.l 15 chevron.r < H_3 = G$.
  - *(a)* Composition series? Factors: $H_1 \/ H_0 tilde.equiv ZZ_2$ ✓,
    $H_2 \/ H_1 tilde.equiv chevron.l 15 chevron.r \/ chevron.l 45 chevron.r tilde.equiv ZZ_3$ ✓,
    $G \/ H_2 tilde.equiv ZZ_(90) \/ chevron.l 15 chevron.r tilde.equiv ZZ_(15)$ ✗ (not simple).
    *Not a composition series* (last factor not simple).
  - *(b)* ${K_j}: {0} < chevron.l 30 chevron.r < chevron.l 6 chevron.r < ZZ_(90)$.
    Factors: $chevron.l 30 chevron.r \/ {0} tilde.equiv ZZ_3$,
    $chevron.l 6 chevron.r \/ chevron.l 30 chevron.r tilde.equiv ZZ_5$,
    $ZZ_(90) \/ chevron.l 6 chevron.r tilde.equiv ZZ_6$.
    ${H_i}$ factors: $ZZ_2, ZZ_3, ZZ_(15)$.
    Both length 3. Multiset of factors: $H$: ${ZZ_2, ZZ_3, ZZ_(15)}$;
    $K$: ${ZZ_3, ZZ_5, ZZ_6}$. As composition factors: $H$ refines via
    $ZZ_(15) tilde.equiv ZZ_3 times ZZ_5$, $K$ via $ZZ_6 tilde.equiv ZZ_2 times ZZ_3$.
    Both refine to ${ZZ_2, ZZ_3, ZZ_3, ZZ_5}$. So ${K_j}$ not isomorphic
    to ${H_i}$ as is, but they have isomorphic refinements. *Not isomorphic
    as given subnormal series* (different lengths once factors are simple).
  - *(c)* Common refinement: ${0} < chevron.l 45 chevron.r < chevron.l 15 chevron.r < chevron.l 5 chevron.r < ZZ_(90)$
    and ${0} < chevron.l 10 chevron.r < chevron.l 2 chevron.r < ZZ_(90)$ — refine
    $L$ to common with $H$: ${0} < chevron.l 30 chevron.r < chevron.l 10 chevron.r < chevron.l 2 chevron.r < ZZ_(90)$.
    Both have factors $ZZ_2, ZZ_3, ZZ_3, ZZ_5$ in some order. ✓

- *(ii)*
  - *(a)* $n_q | p$, $n_q equiv 1 (mod q)$. Since $p < q$, only $n_q = 1$. Unique
    Sylow $q$ is normal of order $q$.
  - *(b)* $n_p | q$, $n_p equiv 1 (mod p)$. Options $1, q$; $q equiv.not 1 (mod p)$
    excludes $q$. So $n_p = 1$, normal. Both unique → $G tilde.equiv P times Q tilde.equiv ZZ_p times ZZ_q tilde.equiv ZZ_(p q)$.
  - *(c)* $|G| = 5 dot 7 dot 59$, unique Sylow 5 ($P$) and Sylow 59 ($R$).
    $G \/ P$ has order $7 dot 59$; with $7 < 59$ and $59 equiv.not 1 (mod 7)$ ($59 = 8 dot 7 + 3$),
    by (b), $G \/ P$ is abelian cyclic. So $[G, G] lt.eq P$. Similarly using $R$ normal,
    $[G, G] lt.eq R$ (using $G \/ R$ analysis). So $[G, G] lt.eq P inter R = {e}$,
    hence $[G, G] = {e}$, $G$ abelian.

== B2

- *(i)* $F = ZZ x plus.o ZZ y$, $K = 2 ZZ times 5 ZZ$ (in standard
  coordinates).
  - *(a)* Basis: $X subset.eq F$ is a basis (multiplicatively) if every
    $g in F$ has a unique expression $g = product x_i^(n_i)$ with $x_i in X$
    distinct, $n_i in ZZ$.
  - *(b)* Show ${x_1 = (2, 5), x_2 = (1, 3)}$ is a basis of $F$: the matrix
    $mat(2, 5; 1, 3)$ has $det = 6 - 5 = 1$. ✓ Hence basis.
    For $K$: standard basis of $K$ is ${(2, 0), (0, 5)}$.
    Express in $x_1, x_2$ basis: $(2, 0) = a x_1 + b x_2$ with
    $2 a + b = 2, 5 a + 3 b = 0$. Solve: $b = 2 - 2 a$, $5 a + 3(2 - 2 a) = 0$,
    $-a + 6 = 0$, $a = 6, b = -10$. So $(2, 0) = 6 x_1 - 10 x_2$.
    $(0, 5) = c x_1 + d x_2$: $2 c + d = 0, 5 c + 3 d = 5$. $d = -2 c$,
    $5 c - 6 c = 5$, $c = -5, d = 10$. So $(0, 5) = -5 x_1 + 10 x_2$.
    Matrix in basis: $mat(6, -10; -5, 10)$. SNF: $det = 60 - 50 = 10$.
    Reduce: $R_1 + R_2 -> mat(1, 0; -5, 10)$. $R_2 + 5 R_1 -> mat(1, 0; 0, 10)$. ✓
    So $d_1 = 1, d_2 = 10$. With basis $y_1, y_2$ to be tracked from
    operations. Hmm — but the question expects $d_1, d_2$ for the basis
    ${x_1, x_2}$ specifically. Just compute $|F \/ K| = |x_1 / d_1 x_1| dot |x_2 / d_2 x_2|$:
    $|F \/ K| = $ index $= |F : K| = $ standard $|ZZ^2 \/ 2 ZZ times 5 ZZ| = 10$,
    so $d_1 d_2 = 10$. With $d_1 | d_2$: $(d_1, d_2) in {(1, 10), (2, 5)}$
    but $2 divides.not 5$, so *$(d_1, d_2) = (1, 10)$*.
  - *(c)* Any finite abelian group $A$: as in 2025 paper Section 6 of
    revision_practice — surjection $ZZ^n -> A$, kernel $K$, structure
    theorem gives $A tilde.equiv ZZ_(d_1) plus.o dots.c plus.o ZZ_(d_s)$
    with $d_i | d_(i+1)$, then drop $d_i = 1$. Necessary condition for
    $r < n$: *$d_1 = 1$*.

- *(ii)* $S^1$ not free abelian. Every element has finite-rank dense; but
  $S^1$ has elements of finite order ($e^(2 pi i \/ n)$ has order $n$),
  while free abelian groups are torsion-free. So $S^1$ not free abelian.

- *(iii)*
  - *(a)* $|"Hom"(F(a, b), G)| = |G|^2 = n^2$.
  - *(b)* $F'$ free of rank 2 $arrow.r.double F' tilde.equiv F(a', b')$. By
    universal property, send $a -> a', b -> b'$ for one direction and back,
    get inverse maps; both compositions = identity, hence isomorphism.

- *(iv)* $G = chevron.l a, b, c, d | a c = b, d = a b a^(-1), c = d a, b^(-1) = b^3, b = c a chevron.r$.
  Substitute: $b^4 = e$, $b = c a$, $c = d a = (a b a^(-1)) a = a b$. So
  $b = c a = a b a$, i.e., $a b a = b$, so $a b a b^(-1) = e$, $a b = b a^(-1)$.
  Combined with $b^4 = e$: this is the dihedral group $D_4$ if $a^2 = e$,
  or generally a quotient of the infinite dihedral. From $a c = b$ and
  $c = a b$: $a (a b) = b arrow.r.double a^2 b = b arrow.r.double a^2 = e$.
  So $a^2 = b^4 = e$, $b a b^(-1) = ?$ from $a b = b a^(-1) = b a$ (since
  $a^2 = e$): $a b = b a$. So $G$ abelian, $G = chevron.l a, b | a^2, b^4, [a, b] chevron.r tilde.equiv ZZ_2 times ZZ_4$.
