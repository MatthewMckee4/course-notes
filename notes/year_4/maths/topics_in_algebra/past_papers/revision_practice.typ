#set document(title: "Topics in Algebra — Revision Practice")
#set page(margin: 30pt)
#set text(size: 11pt)
#set heading(numbering: none)

#align(center)[
  #text(size: 18pt, weight: "bold")[Topics in Algebra]
  #v(2pt)
  #text(size: 14pt)[Targeted Revision Practice]
]

#v(8pt)

Practice problems aimed at the question types you struggled with on the 2025
paper. Question 6 below is taken directly from the paper because you flagged
it as something you did not know at all; everything else is a fresh question
of the same type.

= 1. Examples and Non-Examples (A1(i)-style)

For each of the following, give a specific example, or state that none
exists. You do not need to justify your answers.

+ An abelian group of order 12 that is not cyclic.
+ A free abelian subgroup of $ZZ times ZZ$ of rank 2 that is not equal to
  $ZZ times ZZ$.
+ A group that is free but not free abelian.
+ A group that is solvable but not nilpotent.
+ A finite nilpotent group that is not abelian.
+ A finitely generated abelian group of rank 2 that is not free abelian.
+ A presentation of the dihedral group $D_3$.
+ A non-trivial $p$-group that has a quotient which is not a $p$-group.
+ A non-abelian group of order 8 with at least one element of order 4.
+ A nontrivial group $G$ such that $G \/ [G, G] tilde.equiv ZZ_2$.

= 2. Counting Abelian Groups (A1(ii)-style)

For each $n$ below, use the Fundamental Theorem of Finitely Generated
Abelian Groups to determine the number of abelian groups of order $n$ up to
isomorphism, and list their invariant factor decompositions.

+ $n = 36$.
+ $n = 72$.
+ $n = 100$.
+ $n = 360$.
+ $n = p^4$ for an arbitrary prime $p$.

= 3. Subgroups of $ZZ$ Giving a Specified Quotient (A1(iii)-style)

For each of the following, find a subgroup $G < ZZ$ that makes the statement
true, and briefly explain why.

+ $(8 ZZ \/ 40 ZZ) \/ (G \/ 40 ZZ) tilde.equiv ZZ_2.$
+ $(4 ZZ \/ 60 ZZ) \/ (G \/ 60 ZZ) tilde.equiv ZZ_5.$
+ $(ZZ \/ 72 ZZ) \/ (G \/ 72 ZZ) tilde.equiv ZZ_2 times ZZ_2.$
+ $(3 ZZ \/ 90 ZZ) \/ (G \/ 90 ZZ) tilde.equiv ZZ_2 times ZZ_3 times ZZ_5.$
+ $(2 ZZ \/ 48 ZZ) \/ (G \/ 48 ZZ) tilde.equiv ZZ_8.$

= 4. True or False (A2(ii)-style)

State whether each of the following is true or false. (You do not need to
justify your answers.)

+ Every refinement of a normal series is itself a normal series.
+ Schreier's Theorem implies that any subnormal series and any composition
  series for the same group $G$ have isomorphic refinements as
  *composition* series.
+ The Jordan-Hölder Theorem applies to every group, not just to finite
  groups.
+ If $G$ is solvable then every subnormal series of $G$ has abelian factor
  groups.
+ Every group of order $p^k$ has a normal subgroup of every order $p^i$
  dividing $|G|$.
+ Two finite presentations $chevron.l A | R chevron.r$ and $chevron.l A' | R' chevron.r$
  define isomorphic groups if and only if $|A| = |A'|$ and $|R| = |R'|$.
+ A finite group $G$ is nilpotent if and only if every Sylow subgroup of
  $G$ is normal.
+ A subgroup of a free abelian group of rank $n$ has rank at most $n$, but
  the rank can equal $n$ only when the subgroup is the whole group.
+ Any quotient of a free group is again a free group.
+ Cauchy's Theorem requires the hypothesis that $G$ is abelian.

= 5. Applying the Structure Theorem for Subgroups (B2(i)(b)-style)

In each problem, $F$ is a free abelian group of rank 2 with the basis
indicated, and $K$ is the subgroup indicated. Find a basis
${y_1, y_2}$ of $F$ and positive integers $d_1 | d_2$ such that
${d_1 y_1, d_2 y_2}$ is a basis for $K$, as in the structure theorem for
subgroups of free abelian groups.

+ $F = ZZ^2$ with basis ${(1, 0), (0, 1)}$, and $K = chevron.l (3, 1), (0, 2) chevron.r$.
+ $F = ZZ^2$ with basis ${x_1 = (1, 2), x_2 = (3, 1)}$, and $K = 6 ZZ times 4 ZZ$.
+ $F = ZZ^2$ with basis ${(1, 0), (0, 1)}$, and $K = chevron.l (4, 6), (6, 9) chevron.r$.
+ $F = ZZ^2$ with basis ${(1, 0), (0, 1)}$, and $K = chevron.l (2, 4), (3, 7), (5, 11) chevron.r$.

= 6. Direct Question (B2(i)(c) from the 2025 paper)

#rect(inset: 10pt, stroke: 0.5pt, width: 100%)[
  Prove that any finite abelian group $A$ is isomorphic to a group of the
  form
  $ ZZ_(m_1) times ZZ_(m_2) times dots.c times ZZ_(m_r) $
  where $m_i$ divides $m_(i+1)$ for each $i = 1, dots, r - 1$.

  Referring to the structure theorem for subgroups of free abelian groups
  (i.e., the existence of integers $d_1 | dots.c | d_s$ such that
  ${d_1 x_1, dots, d_s x_s}$ is a basis of $K$), what is the necessary
  condition on $d_1$ in order for $r$ to be strictly smaller than the rank
  of the surjection $ZZ^n -> A$?
]

#strong[Strategy reminder.] $A$ is finitely generated, so there is a
surjection $phi : ZZ^n -> A$. Let $K = ker(phi)$; by the structure theorem
for subgroups, choose a basis ${x_1, dots, x_n}$ of $ZZ^n$ and integers
$d_1 | d_2 | dots.c | d_s$ such that ${d_1 x_1, dots, d_s x_s}$ is a basis
for $K$. By the First Isomorphism Theorem,
$ A tilde.equiv ZZ^n \/ K tilde.equiv (ZZ \/ d_1 ZZ) plus.o dots.c plus.o (ZZ \/ d_s ZZ) plus.o ZZ^(n - s). $
Since $A$ is finite, $n - s = 0$. The factors with $d_i = 1$ are trivial,
so they drop out. Set $m_i = d_i$ for $d_i gt.eq 2$. The condition for $r$
to be strictly smaller than the rank of the surjection is precisely that
$d_1 = 1$ (so the first factor is trivial).

= 7. Tietze Reduction (B2(iv)-style)

For each of the following presentations, identify the familiar group to
which $G$ is isomorphic. Justify by reducing the presentation using
substitutions and Tietze transformations.

+ $G = chevron.l a, b, c | c = a b, c^2 = 1, a^2 = 1, b^2 = 1 chevron.r$.

+ $G = chevron.l a, b, c | b = a^2, c = b^3, a c = c a chevron.r$.

+ $G = chevron.l x, y, z, w | x = y z, w = z^2, y w = x^2, z = 1 chevron.r$.

+ $G = chevron.l a, b | a^2 = b^3, a b = b a chevron.r$.

+ $G = chevron.l a, b, c | a = b c, b = c a, c = a b chevron.r$.

+ $G = chevron.l a, b, c, d | a = b c d, b = a^2, c = b a, d = c b, b^2 = 1 chevron.r$.

+ $G = chevron.l a, b | a^4 = 1, b^2 = a^2, b a b^(-1) = a^(-1) chevron.r$.

+ $G = chevron.l a, b, c | a b = b a, b c = c b, a c = c a, a^3 = b^4 = c^5 = 1 chevron.r$.

#pagebreak()

= Hints / Answer Key

== Section 1

+ $ZZ_2 times ZZ_6$ (also $ZZ_2 times ZZ_2 times ZZ_3$).
+ $2 ZZ times 3 ZZ$ is rank 2, properly contained in $ZZ times ZZ$.
+ $F({a, b})$ — non-abelian free group is not free abelian.
+ $S_3$.
+ $D_4$ or $Q_8$.
+ #emph[None exists] — finitely generated abelian of rank 2 is
  $ZZ^2 plus.o T$ for some finite torsion $T$, and the rank-2 part is free
  abelian. If "rank 2" means torsion-free of rank 2, then $ZZ^2$ is the only
  one; if it includes torsion, then $ZZ^2 plus.o ZZ_n$ has rank 2 but is
  not free abelian for $n gt.eq 2$.
+ $chevron.l r, s | r^3 = s^2 = (s r)^2 = 1 chevron.r$.
+ #emph[None exists] — every quotient of a $p$-group is a $p$-group.
+ $D_4$ has $a$ of order 4 with $a^2$ central.
+ $S_3$ has commutator subgroup $A_3$ and $S_3 \/ A_3 tilde.equiv ZZ_2$.

== Section 2

The number of abelian groups of order $p_1^(e_1) dots.c p_k^(e_k)$ equals
$product_i p(e_i)$ where $p(e)$ is the number of partitions of $e$.

+ $36 = 2^2 dot 3^2$: $p(2) dot p(2) = 2 dot 2 = 4$ groups.
  Invariant factors: $ZZ_(36)$, $ZZ_2 times ZZ_(18)$, $ZZ_3 times ZZ_(12)$,
  $ZZ_6 times ZZ_6$.
+ $72 = 2^3 dot 3^2$: $p(3) dot p(2) = 3 dot 2 = 6$ groups.
+ $100 = 2^2 dot 5^2$: $2 dot 2 = 4$ groups.
+ $360 = 2^3 dot 3^2 dot 5$: $3 dot 2 dot 1 = 6$ groups.
+ $p^4$: $p(4) = 5$ groups.

== Section 3

Use the Third Isomorphism Theorem: $(a ZZ \/ N) \/ (G \/ N) tilde.equiv a ZZ \/ G$,
so we want $a ZZ \/ G$ to match the target.

+ $G = 16 ZZ$. Then $8 ZZ \/ 16 ZZ tilde.equiv ZZ_2$.
+ $G = 20 ZZ$. Then $4 ZZ \/ 20 ZZ tilde.equiv ZZ_5$.
+ $G = 4 ZZ$. Then $ZZ \/ 4 ZZ tilde.equiv ZZ_2 times ZZ_2$? No --- $ZZ_4 not tilde.equiv ZZ_2 times ZZ_2$.
  Use $G$ with $ZZ \/ G tilde.equiv ZZ_2 times ZZ_2$: this requires $G = (2 ZZ) inter (2 ZZ) = 2 ZZ$
  plus an extra prime relation; in fact no such $G$ inside $ZZ$ exists since
  $ZZ \/ G$ for $G < ZZ$ is always cyclic. *Answer: no such $G$ exists* ---
  any subgroup of $ZZ$ is $n ZZ$ and $ZZ \/ n ZZ tilde.equiv ZZ_n$ is cyclic.
+ $G = 30 ZZ$. Then $3 ZZ \/ 30 ZZ tilde.equiv ZZ_(10) tilde.equiv ZZ_2 times ZZ_5$,
  *not* $ZZ_2 times ZZ_3 times ZZ_5$. So *no such $G$* (the quotient
  $a ZZ \/ G$ is cyclic; $ZZ_2 times ZZ_3 times ZZ_5 tilde.equiv ZZ_(30)$ is
  cyclic, so try $G = 90 ZZ$: $3 ZZ \/ 90 ZZ tilde.equiv ZZ_(30)$. ✓
+ $G = 16 ZZ$. Then $2 ZZ \/ 16 ZZ tilde.equiv ZZ_8$.

(For (3) and (4) above: the lesson is that $ZZ \/ n ZZ$ is cyclic, so the
target *must* be cyclic.)

== Section 4

+ *True* (a refinement of a normal series is normal in $G$ at every step).
+ *False* — Schreier gives subnormal refinements. Composition refinements
  exist only if the original series can be refined to one with simple
  factors.
+ *False* — only groups that have a composition series (e.g. all finite
  groups, but not $ZZ$).
+ *False* — only some subnormal series (e.g. the derived series). General
  ones may have non-abelian factors.
+ *True* — by the First Sylow Theorem applied iteratively.
+ *False* — different presentations can have different numbers of
  generators and relations (Tietze transformations change both).
+ *True* — standard equivalent characterisation of finite nilpotent.
+ *False* — counter-example: $2 ZZ subset.eq ZZ$ both have rank 1 but $2 ZZ != ZZ$.
  The correct statement: rank $lt.eq n$, with no requirement that equality
  forces equality of subgroups.
+ *False* — $ZZ_n$ is a quotient of $ZZ$ but not free.
+ *False* — Cauchy's theorem holds for any finite group.

== Section 5

Use Smith Normal Form on the matrix whose rows generate $K$.

+ $mat(3, 1; 0, 2)$ has SNF $mat(1, 0; 0, 6)$. So $d_1 = 1$, $d_2 = 6$.
+ Express the standard basis of $6 ZZ times 4 ZZ$ in terms of $x_1, x_2$,
  reduce. Result depends on the change-of-basis matrix.
+ $mat(4, 6; 6, 9)$ has determinant $36 - 36 = 0$, so $K$ has rank 1.
  $gcd(4, 6, 6, 9) = 1$, so $d_1 = 1$ and the second invariant is 0
  (i.e., $K$ is rank 1).
+ Three generators in rank 2 reduce to at most 2; row-reduce to find SNF.

== Section 7

+ Substitute $c = a b$ into $c^2 = 1$: $(a b)^2 = 1$. With $a^2 = b^2 = 1$,
  this gives the *Klein four-group* $V_4 tilde.equiv ZZ_2 times ZZ_2$.
+ With $b = a^2$ and $c = b^3 = a^6$ and $a c = c a$ (automatic since
  cyclic in $a$), reduce to $chevron.l a chevron.r tilde.equiv ZZ$ (no
  relations on $a$). So $G tilde.equiv ZZ$.
+ $z = 1$, then $x = y$, $w = 1$, $y = x^2$ gives $x = x^2$ so $x = 1$.
  *Trivial group*.
+ Abelian since $a b = b a$. The relation $a^2 = b^3$ in an abelian group
  means $G tilde.equiv ZZ$ generated by some element of which $a$ is the
  cube and $b$ is the square. So $G tilde.equiv ZZ$.
+ $a = b c$, $b = c a = c b c$, so $c^(-1) b c = b c^2$ and we get a chain
  of substitutions; carefully, the system collapses to *trivial*.
+ Substitute backwards: $c = b a$, $d = c b = b a b$, so
  $a = b c d = b (b a)(b a b) = b^2 a b a b$. Combined with $b^2 = 1$,
  $a = a b a b$, hence $b a b = 1$ so $a = b^(-1) b^(-1) = 1$ (using $b^2 = 1$).
  Then everything trivial except $b$, giving $ZZ_2$.
+ This is the standard presentation of the *quaternion group $Q_8$*.
+ Three commuting generators, each of finite cyclic order: by CRT,
  $G tilde.equiv ZZ_3 times ZZ_4 times ZZ_5 tilde.equiv ZZ_(60)$.
