#set document(title: "Topics in Algebra — Revision Practice Solutions")
#set page(margin: 30pt)
#set text(size: 11pt)
#set heading(numbering: none)

#align(center)[
  #text(size: 18pt, weight: "bold")[Topics in Algebra]
  #v(2pt)
  #text(size: 14pt)[Revision Practice — Worked Solutions]
]

#v(8pt)

= Section 1: Examples and Non-Examples

+ #strong[$ZZ_2 times ZZ_6$.] (Equivalently $ZZ_2 times ZZ_2 times ZZ_3$.)
  Cyclic of order 12 is just $ZZ_(12)$; the only other abelian group of
  order 12 is $ZZ_2 times ZZ_6$.

+ #strong[$2 ZZ times 3 ZZ$.] Has basis ${(2, 0), (0, 3)}$, free abelian of
  rank 2, properly contained in $ZZ times ZZ$ (the index is $6$).

+ #strong[The free group $F({a, b})$.] Every free group of rank $gt.eq 2$ is
  non-abelian, hence not free abelian.

+ #strong[$S_3$.] Solvable: ${e} triangle.l A_3 triangle.l S_3$ with abelian
  factors $ZZ_3$ and $ZZ_2$. Not nilpotent: $Z(S_3) = {e}$, so the upper
  central series stalls at the trivial subgroup.

+ #strong[$D_4$ or $Q_8$.] Order 8, non-abelian. $Z(D_4) = {1, r^2}$ has
  order 2; $D_4 \/ Z(D_4)$ has order 4 hence abelian; so the upper central
  series reaches $D_4$ at step 2 (nilpotency class 2).

+ #strong[$ZZ^2 plus.o ZZ_3$.] Has rank 2 (the rank of the torsion-free
  part), but it is not free abelian — it has torsion.

+ #strong[$chevron.l r, s | r^3 = s^2 = (s r)^2 = 1 chevron.r$.]
  Equivalently, $chevron.l r, s | r^3 = s^2 = 1, s r s^(-1) = r^(-1) chevron.r$.

+ #strong[None exists.] Every quotient of a $p$-group is a $p$-group: if
  $|G| = p^n$ then $|G \/ N|$ divides $p^n$, so it is a power of $p$.

+ #strong[$D_4 = chevron.l r, s | r^4 = s^2 = 1, s r s^(-1) = r^(-1) chevron.r$.]
  The rotation $r$ has order 4; $D_4$ is non-abelian.

+ #strong[$S_3$.] $[S_3, S_3] = A_3 tilde.equiv ZZ_3$, and $S_3 \/ A_3 tilde.equiv ZZ_2$.
  More generally any dihedral group $D_n$ with $n$ odd works.

= Section 2: Counting Abelian Groups

#strong[General formula:] the number of abelian groups of order
$p_1^(e_1) dots.c p_k^(e_k)$ equals $product_(i=1)^k p(e_i)$, where $p(e)$ is
the number of integer partitions of $e$. The relevant values are
$p(1) = 1$, $p(2) = 2$, $p(3) = 3$, $p(4) = 5$.

+ #strong[$n = 36 = 2^2 dot 3^2$.] Count $= p(2) dot p(2) = 4$.
  Invariant factor decompositions:
  - $ZZ_(36)$
  - $ZZ_2 times ZZ_(18)$
  - $ZZ_3 times ZZ_(12)$
  - $ZZ_6 times ZZ_6$

+ #strong[$n = 72 = 2^3 dot 3^2$.] Count $= p(3) dot p(2) = 6$.
  - $ZZ_(72)$
  - $ZZ_2 times ZZ_(36)$
  - $ZZ_2 times ZZ_2 times ZZ_(18)$
  - $ZZ_3 times ZZ_(24)$
  - $ZZ_6 times ZZ_(12)$
  - $ZZ_2 times ZZ_6 times ZZ_6$

+ #strong[$n = 100 = 2^2 dot 5^2$.] Count $= 2 dot 2 = 4$.
  - $ZZ_(100)$
  - $ZZ_2 times ZZ_(50)$
  - $ZZ_5 times ZZ_(20)$
  - $ZZ_(10) times ZZ_(10)$

+ #strong[$n = 360 = 2^3 dot 3^2 dot 5$.] Count $= 3 dot 2 dot 1 = 6$.
  - $ZZ_(360)$
  - $ZZ_2 times ZZ_(180)$
  - $ZZ_2 times ZZ_2 times ZZ_(90)$
  - $ZZ_3 times ZZ_(120)$
  - $ZZ_6 times ZZ_(60)$
  - $ZZ_2 times ZZ_6 times ZZ_(30)$

+ #strong[$n = p^4$.] Count $= p(4) = 5$. The five groups, by partition of
  4: $ZZ_(p^4)$, $ZZ_p times ZZ_(p^3)$, $ZZ_(p^2) times ZZ_(p^2)$,
  $ZZ_p times ZZ_p times ZZ_(p^2)$, $ZZ_p^4$.

= Section 3: Subgroups of $ZZ$ Giving a Specified Quotient

#strong[Key principle.] For $G < ZZ$ with $N = n ZZ subset.eq G$, write
$G = m ZZ$ where $m | n$. By the Third Isomorphism Theorem,
$ (a ZZ \/ n ZZ) \/ (G \/ n ZZ) tilde.equiv a ZZ \/ G tilde.equiv ZZ_(m \/ a) $
(provided $a | m$). #emph[The quotient $a ZZ \/ G$ is always cyclic],
so the target must be cyclic for any $G$ to exist; and we need $m$ a multiple
of $a$ that also divides $n$.

+ Want $8 ZZ \/ G tilde.equiv ZZ_2$, so $G = 16 ZZ$. But $16 divides.not 40$,
  so $G = 16 ZZ$ does *not* contain $40 ZZ$. *No such $G$ exists* with
  $G supset.eq 40 ZZ$. (Possible fix in the problem: replace $40 ZZ$ by
  $48 ZZ$, then $G = 16 ZZ$ works.)

+ Want $4 ZZ \/ G tilde.equiv ZZ_5$, so $G = 20 ZZ$. Check $20 | 60$: yes. So
  *$G = 20 ZZ$* works. Verify: $4 ZZ \/ 20 ZZ$ has 5 elements, cyclic.

+ Want $ZZ \/ G tilde.equiv ZZ_2 times ZZ_2$. But $ZZ \/ G$ is always cyclic.
  $ZZ_2 times ZZ_2$ is *not* cyclic. *No such $G$ exists.*

+ Want $3 ZZ \/ G tilde.equiv ZZ_2 times ZZ_3 times ZZ_5$. By the Chinese
  Remainder Theorem this target is cyclic of order 30, $tilde.equiv ZZ_(30)$.
  So $G = 90 ZZ$. Check $90 | 90$: yes. *$G = 90 ZZ$* works.

+ Want $2 ZZ \/ G tilde.equiv ZZ_8$, so $G = 16 ZZ$. Check $16 | 48$: yes.
  *$G = 16 ZZ$* works.

= Section 4: True or False

+ *False.* A refinement of a normal series is by definition a chain of
  subgroups containing the original; the inserted groups need not be
  normal in $G$, only in their successors. (Distinguish: refinement as a
  chain of subgroups vs. as a normal series. Without an extra hypothesis,
  the inserted groups are subnormal in $G$, not necessarily normal.)

+ *False.* Schreier guarantees that any two subnormal series have isomorphic
  refinements *as subnormal series*. A composition series cannot be
  properly refined (its factors are simple), so the refinement coincides
  with the composition series. The refined subnormal series will then have
  the same composition factors, but the statement "refinements as
  composition series" is misleading because the subnormal refinement may
  contain repeats (trivial factors).

+ *False.* Jordan–Hölder applies only to groups that *have* a composition
  series. Examples without one: $ZZ$ (it has a strictly descending chain
  $ZZ > 2 ZZ > 4 ZZ > dots.c$, no maximal-normal-subgroup terminating
  process).

+ *False.* Solvable means *some* subnormal series has abelian factors.
  General subnormal series may have non-abelian factors. Example: in $S_4$,
  the series ${e} triangle.l V_4 triangle.l S_4$ has factors $V_4$
  (abelian) and $S_3$ (non-abelian).

+ *True.* By the First Sylow Theorem (existence part), every $p$-group of
  order $p^n$ has a normal subgroup of order $p^i$ for each $0 lt.eq i lt.eq n$.

+ *False.* Tietze transformations change the number of generators and
  relations freely; e.g. $ZZ_6 = chevron.l a | a^6 chevron.r = chevron.l a, b | a^2, b^3, [a, b] chevron.r$.

+ *True.* This is the standard equivalent characterisation of finite
  nilpotent groups: $G$ finite is nilpotent iff $G$ is the direct product
  of its Sylow $p$-subgroups, equivalently iff every Sylow subgroup is
  normal.

+ *False.* The rank can equal $n$ for a proper subgroup. Example:
  $2 ZZ subset.eq ZZ$, both of rank 1.

+ *False.* Every group is a quotient of a free group; if every quotient
  were free then every group would be free. Counter-example: $ZZ_n$ is a
  quotient of $ZZ$ but not free.

+ *False.* Cauchy's Theorem holds for any finite group: if $p$ divides
  $|G|$, then $G$ has an element of order $p$. No abelianness needed.

= Section 5: Structure Theorem for Subgroups

#strong[Method.] Write generators of $K$ as rows of an integer matrix $A$.
Reduce $A$ to Smith Normal Form $D = "diag"(d_1, dots, d_s, 0, dots, 0)$
with $d_1 | d_2 | dots.c$ via integer row and column operations. Row ops
correspond to changing the generators of $K$; column ops correspond to
changing the basis of $F$.

+ $K = chevron.l (3, 1), (0, 2) chevron.r$, matrix
  $A = mat(3, 1; 0, 2)$.
  Swap columns: $mat(1, 3; 2, 0)$. Row 2 $-= 2 dot$ Row 1: $mat(1, 3; 0, -6)$.
  Column 2 $-= 3 dot$ Column 1: $mat(1, 0; 0, -6)$. So *$d_1 = 1$, $d_2 = 6$*.
  In particular $ZZ^2 \/ K tilde.equiv ZZ \/ 1 plus.o ZZ \/ 6 tilde.equiv ZZ_6$.

+ #emph[Note: ${(1, 2), (3, 1)}$ has determinant $1 - 6 = -5 != plus.minus 1$,
    so it is *not* a $ZZ$-basis of $ZZ^2$.] Skipping or replacing
  $x_2 = (3, 1)$ with $x_2 = (0, 1)$ (det $= 1$): then $K = 6 ZZ times 4 ZZ$
  in standard coordinates is generated by $(6, 0) = 6 x_1 - 12 x_2$ and
  $(0, 4) = 4 x_2$. Matrix in basis ${x_1, x_2}$: $mat(6, -12; 0, 4)$.
  Row 1 $+= 3 dot$ Row 2: $mat(6, 0; 0, 4)$. Swap rows: $mat(0, 4; 6, 0)$.
  Swap columns: $mat(4, 0; 0, 6)$. We need $d_1 | d_2$ but $4 divides.not 6$:
  apply $"gcd"$ trick — Row 1 $+= $ Row 2 gives $mat(4, 6; 0, 6)$, then
  column-reduce to extract $gcd(4, 6) = 2$. Final SNF: $mat(2, 0; 0, 12)$.
  So *$d_1 = 2, d_2 = 12$*. ($ZZ^2 \/ K$ has order $24 = 6 dot 4$.) ✓

+ $K = chevron.l (4, 6), (6, 9) chevron.r$, matrix
  $A = mat(4, 6; 6, 9)$.
  $det A = 36 - 36 = 0$, so $K$ has rank 1 (not 2). Reduce: Row 2 $-= $
  Row 1 gives $mat(4, 6; 2, 3)$. Swap rows: $mat(2, 3; 4, 6)$.
  Row 2 $-= 2 dot$ Row 1: $mat(2, 3; 0, 0)$. Column 2 $-= $ Column 1:
  $mat(2, 1; 0, 0)$. Swap columns: $mat(1, 2; 0, 0)$. Column 2 $-= 2 dot$
  Column 1: $mat(1, 0; 0, 0)$. So *$d_1 = 1$* and only one invariant —
  $K$ is rank 1, generated by some primitive vector.

+ Three rows in $ZZ^2$: $A = mat(2, 4; 3, 7; 5, 11)$.
  Row reduce: $R_2 -= R_1$: $mat(2, 4; 1, 3; 5, 11)$. $R_3 -= 2 R_1$:
  $mat(2, 4; 1, 3; 1, 3)$. $R_3 -= R_2$: $mat(2, 4; 1, 3; 0, 0)$. Drop zero
  row, swap remaining: $mat(1, 3; 2, 4)$. $R_2 -= 2 R_1$: $mat(1, 3; 0, -2)$.
  $C_2 -= 3 C_1$: $mat(1, 0; 0, -2)$. So *$d_1 = 1$, $d_2 = 2$*.
  $ZZ^2 \/ K tilde.equiv ZZ_2$.

= Section 6: Direct Question (B2(i)(c) from 2025)

#strong[Statement.] Any finite abelian group $A$ is isomorphic to
$ZZ_(m_1) times dots.c times ZZ_(m_r)$ with $m_i | m_(i+1)$.

#strong[Proof.]
+ #strong[Surjection from a free abelian group.] Since $A$ is finitely
  generated (it is finite), pick a generating set $a_1, dots, a_n$. Define
  $phi : ZZ^n -> A$ by $phi(c_1, dots, c_n) = sum c_i a_i$. This is a
  surjective homomorphism.

+ #strong[First Isomorphism Theorem.] Let $K = ker(phi)$. Then
  $A tilde.equiv ZZ^n \/ K$.

+ #strong[Apply the Subgroup Structure Theorem (Theorem 38.11).] $K$ is a
  subgroup of the free abelian group $ZZ^n$ of rank $n$, so $K$ is free
  abelian of some rank $s lt.eq n$, and there exists a basis
  ${x_1, dots, x_n}$ of $ZZ^n$ together with positive integers
  $d_1 | d_2 | dots.c | d_s$ such that ${d_1 x_1, dots, d_s x_s}$ is a
  basis of $K$.

+ #strong[Compute the quotient.] In the basis ${x_1, dots, x_n}$,
  $ ZZ^n \/ K tilde.equiv (ZZ x_1 \/ d_1 ZZ x_1) plus.o dots.c plus.o (ZZ x_s \/ d_s ZZ x_s) plus.o ZZ x_(s+1) plus.o dots.c plus.o ZZ x_n. $
  As abstract groups,
  $ A tilde.equiv ZZ_(d_1) plus.o ZZ_(d_2) plus.o dots.c plus.o ZZ_(d_s) plus.o ZZ^(n - s). $

+ #strong[Use finiteness.] $A$ is finite, so the free part $ZZ^(n - s)$
  must vanish: $n = s$.

+ #strong[Drop trivial factors.] If $d_i = 1$ then $ZZ_(d_i)$ is the trivial
  group; remove these. After removal, set $m_j$ equal to the remaining
  $d_i gt.eq 2$, in the same divisibility order. The result is
  $A tilde.equiv ZZ_(m_1) times dots.c times ZZ_(m_r)$ with
  $m_1 | m_2 | dots.c | m_r$, where $r$ is the number of $d_i gt.eq 2$.
  $square$

#strong[Final part:] for $r$ to be strictly smaller than the rank $n$ of
the surjection, we need at least one $d_i = 1$, and the smallest such must
be $d_1$ (since the $d_i$ are in divisibility order, $d_1 | d_2 | dots.c$).
So the necessary and sufficient condition is *$d_1 = 1$*.

= Section 7: Tietze Reductions

+ $G = chevron.l a, b, c | c = a b, c^2 = 1, a^2 = 1, b^2 = 1 chevron.r$.
  Eliminate $c$: $c = a b$ and $(a b)^2 = 1$. Combined with $a^2 = b^2 = 1$:
  $a b a b = 1$ implies $a b = (a b)^(-1) = b^(-1) a^(-1) = b a$. So $a, b$
  commute. Result: $G = chevron.l a, b | a^2, b^2, [a, b] chevron.r tilde.equiv$
  *$ZZ_2 times ZZ_2$* (Klein four-group).

+ $G = chevron.l a, b, c | b = a^2, c = b^3, a c = c a chevron.r$.
  Eliminate $b = a^2$ and $c = b^3 = a^6$. The relation $a c = c a$ becomes
  $a^7 = a^7$, trivially true. No further relations on $a$. Result:
  $G = chevron.l a | thin chevron.r tilde.equiv$ *$ZZ$* (free of rank 1 = infinite cyclic).

+ $G = chevron.l x, y, z, w | x = y z, w = z^2, y w = x^2, z = 1 chevron.r$.
  $z = 1$, so $w = 1$, $x = y$, $y = x^2 = y^2$, hence $y = 1$. All
  generators are 1. *Trivial group.*

+ $G = chevron.l a, b | a^2 = b^3, a b = b a chevron.r$. Abelian.
  Additively: $2 a - 3 b = 0$. The matrix $(2, -3)$ has Smith Normal Form
  $(1, 0)$ (since $gcd(2, 3) = 1$). Hence
  *$G tilde.equiv ZZ$* (the relation has rank 1; one $ZZ$ factor remains).
  Concretely, $u = a - b$ generates $G$, with $a = 3 u$ and $b = 2 u$.

+ $G = chevron.l a, b, c | a = b c, b = c a, c = a b chevron.r$.
  Eliminate $c = a b$. Then $a = b c = b a b$ gives $b a b = a$, i.e.
  $a b = b a^(-1)$. And $b = c a = (a b) a$ gives $a b a = b$, i.e.
  $b a = a b^(-1)$. From these two: $a b = b a^(-1)$ and $b a = a b^(-1)$
  combine to give $(a b)(b a) = a b^2 a$ and also
  $(b a^(-1))(a b^(-1)) = b b^(-1) = 1$, so $a b^2 a = 1$, $b^2 = a^(-2)$.
  Combined with the conjugation $a^(-1) b a = b^(-1)$ (from $b a = a b^(-1)$),
  one shows $a^4 = 1$ and the resulting group is *$Q_8$* (the quaternion
  group of order 8), with $c = a b$ the third generator pair.

+ $G = chevron.l a, b, c, d | a = b c d, b = a^2, c = b a, d = c b, b^2 = 1 chevron.r$.
  Substitute progressively: $b = a^2$, $c = b a = a^3$, $d = c b = a^5$.
  Then $a = b c d = a^2 dot a^3 dot a^5 = a^(10)$, so $a^9 = 1$. The
  remaining relation $b^2 = 1$ gives $a^4 = 1$. Combined: $a^(gcd(9, 4)) = a^1 = 1$,
  so $a = 1$. *Trivial group.*

+ $G = chevron.l a, b | a^4 = 1, b^2 = a^2, b a b^(-1) = a^(-1) chevron.r$.
  This is the standard presentation of *$Q_8$*. Elements:
  $1, a, a^2, a^3, b, a b, a^2 b, a^3 b$ (all 8 distinct).
  Identifications: $b^2 = a^2 != 1$, so $b$ has order 4 (not 2), and
  $a^2$ is the unique element of order 2 (the centre).

+ $G = chevron.l a, b, c | a b = b a, b c = c b, a c = c a, a^3 = b^4 = c^5 = 1 chevron.r$.
  Three pairwise-commuting generators of orders 3, 4, 5. Abelian, so
  $G tilde.equiv ZZ_3 times ZZ_4 times ZZ_5$. By the Chinese Remainder
  Theorem (gcd 60 = $3 dot 4 dot 5$ pairwise coprime),
  *$G tilde.equiv ZZ_(60)$* (cyclic of order 60).
