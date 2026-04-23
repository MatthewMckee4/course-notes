#set document(title: "Topics in Algebra")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none)
#pagebreak()

= Lectures 1--2: Isomorphism Theorems (Chapter 34)

== The Three Isomorphism Theorems

=== 34.1 Definition (Cosets and Normal Subgroups)

Let $H$ be a subgroup of a group $G$. The *left cosets* of $H$ in $G$ are sets of the form $a H = {a h mid(|) h in H}$ for $a in G$. The *index* $[G : H]$ is the number of distinct left cosets.

$H$ is *normal* in $G$, written $H triangle.l G$, if $a H = H a$ for all $a in G$, equivalently if $a H a^(-1) = H$ for all $a in G$. When $H triangle.l G$, the cosets form a group $G \/ H$ under $(a H)(b H) = (a b) H$, called the *quotient group*.

=== 34.2 First Isomorphism Theorem

_Let $phi: G -> G'$ be a group homomorphism with kernel $K = ker(phi)$. Then $K triangle.l G$ and $G \/ K tilde.equiv phi(G)$ via the isomorphism $mu: G \/ K -> phi(G)$ defined by $mu(a K) = phi(a)$._

*Proof sketch.* $K triangle.l G$ since kernels are always normal. The map $mu$ is well-defined: if $a K = b K$ then $b^(-1) a in K$, so $phi(b^(-1) a) = e'$, giving $phi(a) = phi(b)$. It is a homomorphism since $mu((a K)(b K)) = mu((a b) K) = phi(a b) = phi(a) phi(b) = mu(a K) mu(b K)$. It is injective since $mu(a K) = e'$ implies $phi(a) = e'$ implies $a in K$, and surjective onto $phi(G)$ by construction.

=== 34.3 Lemma (Normal Subgroup Correspondence)

_Let $N triangle.l G$ and let $gamma: G -> G \/ N$ be the canonical homomorphism. The map $phi$ from the set of normal subgroups of $G$ containing $N$ to the set of normal subgroups of $G \/ N$ given by $phi(L) = gamma(L) = L \/ N$ is one-to-one and onto._

=== 34.4 Lemma (Products of Subgroups)

_If $N$ is a normal subgroup of $G$ and $H$ is any subgroup of $G$, then $H N = N H = H or.big N$ is a subgroup of $G$. Furthermore, if $H$ is also normal in $G$, then $H N$ is normal in $G$._

*Proof.* $H N$ is closed: if $h_1 n_1, h_2 n_2 in H N$, then $n_1 h_2 = h_2 n_3$ for some $n_3 in N$ (since $N$ is normal), so $(h_1 n_1)(h_2 n_2) = h_1 h_2 n_3 n_2 in H N$. Also $(h n)^(-1) = n^(-1) h^(-1) = h^(-1) n_4 in H N$, so $H N$ is a subgroup. If $H triangle.l G$ too, then $g(h n)g^(-1) = (g h g^(-1))(g n g^(-1)) in H N$.

=== 34.5 Second Isomorphism Theorem (Diamond Isomorphism Theorem)

_Let $H lt.eq G$ and $N triangle.l G$. Then $H N$ is a subgroup of $G$, $N triangle.l H N$, $H inter N triangle.l H$, and_
$ H N \/ N tilde.equiv H \/ (H inter N). $

*Proof sketch.* Define $phi: H -> H N \/ N$ by $phi(h) = h N$. This is a surjective homomorphism with $ker(phi) = H inter N$. Apply the First Isomorphism Theorem.

=== 34.6 Example

Let $G = ZZ times ZZ times ZZ$, $H = ZZ times ZZ times {0}$, and $N = {0} times ZZ times ZZ$. Then $H N = ZZ times ZZ times ZZ$ and $H inter N = {0} times ZZ times {0}$. We have $(H N) \/ N tilde.equiv ZZ$ and $H \/ (H inter N) tilde.equiv ZZ$.

=== 34.7 Third Isomorphism Theorem

_Let $N triangle.l G$ and $M triangle.l G$ with $N lt.eq M$. Then $M \/ N triangle.l G \/ N$ and_
$ (G \/ N) \/ (M \/ N) tilde.equiv G \/ M. $

*Proof sketch.* Define $phi: G \/ N -> G \/ M$ by $phi(g N) = g M$. This is a well-defined surjective homomorphism with $ker(phi) = M \/ N$. Apply the First Isomorphism Theorem.

=== 34.10 Example

Consider $K = 6 ZZ < H = 2 ZZ < G = ZZ$. Then $G \/ H = ZZ \/ 2 ZZ tilde.equiv ZZ_2$. Now $G \/ K = ZZ \/ 6 ZZ$ has elements $6 ZZ, 1 + 6 ZZ, dots, 5 + 6 ZZ$. Of these, $2 + 6 ZZ$ and $4 + 6 ZZ$ lie in $2 ZZ \/ 6 ZZ$. Thus $(ZZ \/ 6 ZZ) \/ (2 ZZ \/ 6 ZZ)$ has two elements and is isomorphic to $ZZ_2$, confirming $ZZ \/ 6 ZZ tilde.equiv ZZ_6$ and $(ZZ_6) \/ (ZZ_6 \/ (2)) tilde.equiv ZZ_2 tilde.equiv ZZ \/ 2 ZZ$.

=== 34.8 Correspondence Theorem

_Let $N triangle.l G$. There is a bijection between subgroups of $G$ containing $N$ and subgroups of $G \/ N$, given by $H arrow.r.bar H \/ N$. This bijection preserves normality: $H triangle.l G$ if and only if $H \/ N triangle.l G \/ N$._

== Examples and Applications

If $phi: ZZ -> ZZ_n$ is defined by $phi(m) = m mod n$, then $ker(phi) = n ZZ$ and $ZZ \/ n ZZ tilde.equiv ZZ_n$ by the First Isomorphism Theorem.

For $G = S_n$ and $N = A_n$ (alternating group), $[S_n : A_n] = 2$, so $A_n triangle.l S_n$ and $S_n \/ A_n tilde.equiv ZZ_2$.

= Lecture 3: Normal and Subnormal Series (Chapter 35 through Example 35.7)

== Series of Groups

=== 35.1 Definition (Subnormal and Normal Series)

A *subnormal series* of a group $G$ is a finite sequence of subgroups
$ {e} = H_0 triangle.l H_1 triangle.l H_2 triangle.l dots.c triangle.l H_n = G $
where each $H_i$ is normal in $H_(i+1)$. The *factor groups* (or *quotient groups*) of this series are $H_(i+1) \/ H_i$ for $i = 0, 1, dots, n-1$. The number $n$ is the *length* of the series.

A *normal series* is a subnormal series where each $H_i triangle.l G$ (not just in $H_(i+1)$).

Every normal series is subnormal, but not conversely. For abelian groups the two notions coincide, since every subgroup is normal.

=== 35.2 Example

Two normal series of $ZZ$ under addition are
$ {0} < 8 ZZ < 4 ZZ < ZZ quad "and" quad {0} < 9 ZZ < ZZ. $

=== 35.3 Example

Consider $D_4$ (symmetries of the square). The series
$ {rho_0} < {rho_0, mu_1} < {rho_0, rho_2, mu_1, mu_2} < D_4 $
is a subnormal series. It is not a normal series since ${rho_0, mu_1}$ is not normal in $D_4$.

=== 35.4 Definition (Refinement)

A *refinement* of a subnormal series $S$ is a subnormal series $S'$ obtained by inserting additional subgroups into $S$. Formally, $S'$ is a refinement of $S$ if every group in $S$ appears in $S'$.

=== 35.5 Example

The series
$ {0} < 72 ZZ < 24 ZZ < 8 ZZ < 4 ZZ < ZZ $
is a refinement of ${0} < 8 ZZ < 4 ZZ < ZZ$. Two new terms, $4 ZZ$ and $24 ZZ$, have been inserted.

=== 35.6 Definition (Isomorphic Series)

Two subnormal series are *isomorphic* (or *equivalent*) if they have the same length and their factor groups are isomorphic in some order (i.e., there is a bijection between the sets of factor groups such that corresponding factors are isomorphic).

=== 35.7 Example

The two series of $ZZ_(15)$,
$ {0} < chevron.l 5 chevron.r < ZZ_(15) quad "and" quad {0} < chevron.l 3 chevron.r < ZZ_(15), $
are isomorphic. Both $ZZ_(15) \/ chevron.l 5 chevron.r$ and $chevron.l 3 chevron.r \/ {0}$ are isomorphic to $ZZ_5$, and $ZZ_(15) \/ chevron.l 3 chevron.r$ is isomorphic to $ZZ_3 tilde.equiv chevron.l 5 chevron.r \/ {0}$.

= Lecture 4: Zassenhaus Lemma and Schreier's Theorem

== Zassenhaus (Butterfly) Lemma

=== 35.10 Zassenhaus Lemma

_Let $H' triangle.l H lt.eq G$ and $K' triangle.l K lt.eq G$. Then:_
- _$H'(H inter K') triangle.l H'(H inter K)$_
- _$K'(K inter H') triangle.l K'(K inter H)$_
- _$H'(H inter K) \/ H'(H inter K') tilde.equiv K'(K inter H) \/ K'(K inter H')$_

_Both quotients are isomorphic to $(H inter K) \/ ((H' inter K)(H inter K'))$._

The name "butterfly" comes from the diamond-shaped diagram formed by the subgroups involved.

*Proof.* Define $phi: H'(H inter K) -> (H inter K) \/ L$ where $L = (H' inter K)(H inter K')$. For $h in H'$ and $x in H inter K$, let $phi(h x) = x L$. This is well-defined: if $h_1 x_1 = h_2 x_2$ then $h_2^(-1) h_1 = x_2 x_1^(-1) in H' inter (H inter K) = H' inter K subset.eq L$, so $x_1 L = x_2 L$. It is a surjective homomorphism with $ker(phi) = H'(H inter K')$. By the First Isomorphism Theorem, $H'(H inter K) \/ H'(H inter K') tilde.equiv (H inter K) \/ L$. The result for $K'(K inter H)$ follows by symmetry.

== Schreier's Theorem

=== 35.8 Example

To find isomorphic refinements of
$ {0} < 8 ZZ < 4 ZZ < ZZ quad "and" quad {0} < 9 ZZ < ZZ, $
consider the refinement ${0} < 72 ZZ < 8 ZZ < 4 ZZ < ZZ$ of the first and ${0} < 72 ZZ < 18 ZZ < 9 ZZ < ZZ$ of the second. In both cases the refinements have four factor groups isomorphic to $ZZ_4, ZZ_2, ZZ_9$, and $72 ZZ$, though the order differs.

=== 35.11 Schreier's Theorem

_Any two subnormal series of a group $G$ have isomorphic refinements._

*Proof.* Let
$ {e} = H_0 triangle.l H_1 triangle.l dots.c triangle.l H_m = G $
and
$ {e} = K_0 triangle.l K_1 triangle.l dots.c triangle.l K_n = G $
be two subnormal series. Define
$ H_(i, j) = H_i (H_(i+1) inter K_j) $
for $0 lt.eq i lt.eq m-1$ and $0 lt.eq j lt.eq n$. Inserting these between $H_i$ and $H_(i+1)$ (using the Zassenhaus Lemma to verify each inclusion is normal) gives a refinement of the first series. Similarly define $K_(j,i) = K_j(K_(j+1) inter H_i)$ for the second. The Zassenhaus Lemma then gives $H_(i,j+1) \/ H_(i,j) tilde.equiv K_(j,i+1) \/ K_(j,i)$, establishing isomorphism.

= Lecture 5: Jordan-Hölder Theorem and Commutator Subgroups

== Composition Series and the Jordan-Hölder Theorem

=== Example: Using Schreier's Algorithm

To find isomorphic refinements of
$ \{0\} < chevron.l 6 chevron.r < ZZ_(24) quad "and" quad \{0\} < chevron.l 4 chevron.r < ZZ_(24), $
insert subgroups $H_(0,j) = \{0\}(chevron.l 6 chevron.r inter K_j)$ and $K_(0,j) = \{0\}(chevron.l 4 chevron.r inter H_j)$ using the Zassenhaus construction.

=== 35.12 Definition (Composition Series)

A subnormal series $\{e\} = H_0 triangle.l H_1 triangle.l dots.c triangle.l H_n = G$ is a *composition series* if each factor group $H_(i+1) \/ H_i$ is *simple* (has no proper nontrivial normal subgroups). The factor groups are called *composition factors*.

A group $G$ is *simple* if $G != \{e\}$ and the only normal subgroups are $\{e\}$ and $G$ itself.

For abelian groups, composition and principal series coincide (every subgroup is normal). For a composition series, each $H_i$ must be a maximal normal subgroup of $H_(i+1)$. To build one: find a maximal normal subgroup $H_(n-1)$ of $G$, then a maximal normal subgroup $H_(n-2)$ of $H_(n-1)$, and so on. If this terminates, we have a composition series.

=== 35.13 Example

$ZZ$ has no composition series. For if $\{0\} = H_0 < H_1 < dots.c < H_n = ZZ$ is a subnormal series, then $H_1 = r ZZ$ for some $r in ZZ^+$. But $H_1 \/ H_0 tilde.equiv r ZZ$ is infinite cyclic with many nontrivial proper normal subgroups (e.g. $2 r ZZ$), so not simple.

=== 35.14 Example

For $n gt.eq 5$, the series $\{e\} < A_n < S_n$ is a composition series (and also a principal series) of $S_n$, because $A_n \/ \{e\} tilde.equiv A_n$ is simple for $n gt.eq 5$, and $S_n \/ A_n tilde.equiv ZZ_2$ is simple.

=== 35.15 Jordan-Hölder Theorem

_If $G$ is a group with a composition series, then any two composition series of $G$ are isomorphic (same length, same composition factors up to order and isomorphism)._

*Proof.* Any two composition series are subnormal series. By Schreier's Theorem they have isomorphic refinements. But a composition series cannot be properly refined (its factors are simple), so any refinement can only introduce trivial factors $H \/ H tilde.equiv \{e\}$. Hence the original series are already isomorphic.

The Jordan-Hölder theorem says composition factors are intrinsic invariants of a group, analogous to prime factorisation for integers.

=== 35.16 Theorem

_If $G$ has a composition (principal) series, and if $N$ is a proper normal subgroup of $G$, then there exists a composition (principal) series containing $N$._

*Proof.* The series $\{e\} < N < G$ is both subnormal and normal. Since $G$ has a composition series $\{H_i\}$, by Schreier's Theorem $\{e\} < N < G$ has a refinement isomorphic to a refinement of $\{H_i\}$. But $\{H_i\}$ is a composition series with no proper refinement, so $\{e\} < N < G$ can be refined to a composition series through $N$.

=== 35.17 Example

A composition series of $ZZ_4 times ZZ_9$ containing $chevron.l (0, 1) chevron.r$ is
$ \{(0, 0)\} < chevron.l (0, 3) chevron.r < chevron.l (0, 1) chevron.r < chevron.l (2, 0), (0, 1) chevron.r < chevron.l (1, 0), (0, 1) chevron.r = ZZ_4 times ZZ_9. $

== Commutator Subgroups

=== Definition (Commutator)

For $a, b in G$, the *commutator* of $a$ and $b$ is $[a, b] = a^(-1) b^(-1) a b$. Note $[a, b] = e$ iff $a b = b a$.

The *commutator subgroup* (or *derived subgroup*) of $G$ is $[G, G] = G' = chevron.l [a, b] mid(|) a, b in G chevron.r$, the subgroup generated by all commutators. We have $G' triangle.l G$ and $G \/ G'$ is abelian. Moreover, $G \/ G'$ is the *largest abelian quotient* of $G$: if $N triangle.l G$ and $G \/ N$ is abelian, then $G' lt.eq N$.

= Lecture 6: Solvable and Nilpotent Groups (End of Chapter 35)

== Solvable Groups

=== 35.18 Definition (Solvable Group)

A group $G$ is *solvable* if it has a composition series with abelian factor groups, i.e., there exist subgroups
$ \{e\} = G_0 triangle.l G_1 triangle.l dots.c triangle.l G_n = G $
with each $G_(i+1) \/ G_i$ abelian.

By the Jordan-Hölder theorem, for a solvable group _every_ composition series has abelian factor groups.

=== Equivalence with the Derived Series

$G$ is solvable iff its *derived series* $G^((0)) = G supset.eq G^((1)) = G' supset.eq G^((2)) = [G', G'] supset.eq dots.c$ eventually reaches $\{e\}$.

*Proof of equivalence.* ($arrow.r.double$) If $\{e\} = G_0 triangle.l dots.c triangle.l G_n = G$ has abelian factors, then $G_(i+1) \/ G_i$ abelian implies $G'_(i+1) lt.eq G_i$. By induction $G^((k)) lt.eq G_(n-k)$, so $G^((n)) lt.eq G_0 = \{e\}$. ($arrow.l.double$) The derived series itself is a subnormal series with abelian factors: $G^((i)) \/ G^((i+1))$ is abelian since $[G^((i)), G^((i))] = G^((i+1))$.

=== 35.19 Examples

- Every abelian group is solvable (take $\{e\} triangle.l G$, with factor $G$ abelian).
- $S_3$ is solvable: $\{e\} triangle.l A_3 = ZZ_3 triangle.l S_3$, with factors $ZZ_3$ and $ZZ_2$.
- $S_4$ is solvable via $\{e\} triangle.l V_4 triangle.l A_4 triangle.l S_4$ where $V_4 = \{e, (12)(34), (13)(24), (14)(23)\}$.
- $S_5$ is *not* solvable: $\{e\} < A_5 < S_5$ is a composition series, and $A_5 \/ \{e\} tilde.equiv A_5$ is non-abelian. Since $A_5$ is simple and non-abelian, $S_5$ has no composition series with abelian factors.
- More generally, $S_n$ for $n gt.eq 5$ is not solvable (since $A_n$ is simple and non-abelian).

The fact that $A_5$ is the smallest simple group that is not solvable is connected to the fact that a polynomial equation of degree 5 is not in general solvable by radicals, but a polynomial equation of degree $lt.eq 4$ is.

=== Theorem (Closure Properties of Solvable Groups)

_Subgroups and quotient groups of solvable groups are solvable. An extension of solvable groups is solvable: if $N triangle.l G$ with $N$ and $G \/ N$ both solvable, then $G$ is solvable._

== Nilpotent Groups

=== Definition (Lower Central Series)

The *lower central series* of $G$ is defined by $G_0 = G$ and $G_(i+1) = [G, G_i] = chevron.l [g, x] mid(|) g in G, x in G_i chevron.r$.

A group $G$ is *nilpotent* if its lower central series reaches $\{e\}$, i.e., $G_c = \{e\}$ for some $c$ (called the *nilpotency class*).

=== 35.20 Definition (Ascending Central Series)

The *ascending central series* (or *upper central series*) of $G$ is
$ \{e\} lt.eq Z(G) lt.eq Z_1(G) lt.eq Z_2(G) lt.eq dots.c $
where $Z_0(G) = \{e\}$, $Z(G) = Z_1(G)$ is the centre of $G$, and $Z_(i+1)(G) \/ Z_i(G) = Z(G \/ Z_i(G))$ (i.e., $Z_(i+1)(G)$ is the preimage of the centre of $G \/ Z_i(G)$ under the canonical map).

$G$ is nilpotent iff its ascending central series reaches $G$.

=== 35.21 Example

The centre of $S_3$ is $\{rho_0\}$. Thus the ascending central series of $S_3$ is $\{rho_0\} lt.eq \{rho_0\} lt.eq dots.c$, which never reaches $S_3$. So $S_3$ is not nilpotent (but it is solvable).

The centre of $D_4$ is $\{rho_0, rho_2\}$. Since $D_4 \/ \{rho_0, rho_2\}$ is of order 4 and hence abelian, its centre is all of $D_4 \/ \{rho_0, rho_2\}$. So $Z_2(D_4) = D_4$ and $D_4$ is nilpotent of class 2.

=== Examples

- Every abelian group is nilpotent of class $lt.eq 1$ (since $G_1 = [G, G] = \{e\}$ iff $G$ is abelian).
- Every nilpotent group is solvable (but not conversely: $S_3$ is solvable but not nilpotent).
- Every $p$-group (group of order $p^n$ for a prime $p$) is nilpotent.
- The quaternion group $Q_8$ is nilpotent of class 2.

=== Theorem

_Subgroups, quotients, and finite direct products of nilpotent groups are nilpotent. A finite group is nilpotent iff it is a direct product of its Sylow $p$-subgroups._

= Lecture 7: Introduction to Sylow Theory — Group Actions (Chapter 36)

== Group Actions

=== Definition (Group Action)

A *group action* of a group $G$ on a set $S$ is a map $G times S -> S$, written $(g, s) arrow.r.bar g dot.c s$, such that:
- $e dot.c s = s$ for all $s in S$
- $(g_1 g_2) dot.c s = g_1 dot.c (g_2 dot.c s)$ for all $g_1, g_2 in G$, $s in S$

This is equivalent to a group homomorphism $phi: G -> "Sym"(S)$.

=== Definition (Orbits and Stabilisers)

The *orbit* of $s in S$ is $"Orb"(s) = G dot.c s = \{g dot.c s mid(|) g in G\}$.

The *stabiliser* of $s$ is $"Stab"(s) = G_s = \{g in G mid(|) g dot.c s = s\}$. This is a subgroup of $G$.

=== Orbit-Stabiliser Theorem

_$|"Orb"(s)| = [G : "Stab"(s)]$. In particular, if $G$ is finite, $|G| = |"Orb"(s)| dot.c |"Stab"(s)|$._

=== Burnside's Lemma / Class Equation

Let $G$ act on itself by conjugation: $g dot.c x = g x g^(-1)$. The orbits are *conjugacy classes* $"Cl"(x) = \{g x g^(-1) mid(|) g in G\}$. The *class equation* is
$ |G| = |Z(G)| + sum_("non-central orbits") [G : C_G(x)] $
where $C_G(x) = \{g in G mid(|) g x = x g\}$ is the *centraliser* of $x$.

== The Key Counting Theorem for $p$-Groups

=== 36.1 Theorem

_Let $G$ be a group of order $p^n$ and let $X$ be a finite $G$-set. Then $|X| equiv |X_G| (mod p)$, where $X_G = \{x in X mid(|) g dot.c x = x "for all" g in G\}$ is the set of fixed points._

*Proof.* The orbits partition $X$. Each orbit has size $|G dot.c x| = [G : "Stab"(x)]$, which divides $|G| = p^n$, so each orbit has size $1$ or a positive power of $p$. The one-element orbits are exactly the elements of $X_G$. Thus $|X| = |X_G| + sum p^(k_i)$ where $k_i gt.eq 1$, giving $|X| equiv |X_G| (mod p)$.

This is the fundamental tool behind Cauchy's Theorem and the Sylow theorems.

=== 36.2 Definition ($p$-groups)

A group $G$ is a *$p$-group* if every element of $G$ has order a power of $p$. A subgroup of $G$ is a *$p$-subgroup* of $G$ if it is itself a $p$-group.

=== 36.4 Corollary

_A finite group $G$ is a $p$-group if and only if $|G|$ is a power of $p$._

=== Beginning of Cauchy's Theorem

*36.3 Cauchy's Theorem* states: _If $G$ is a finite group and $p$ is a prime dividing $|G|$, then $G$ has an element of order $p$._

*Proof setup.* Consider the set $S = \{(a_1, dots, a_p) in G^p mid(|) a_1 a_2 dots.c a_p = e\}$. Then $|S| = |G|^(p-1)$ since we may choose $a_1, dots, a_(p-1)$ freely and $a_p$ is determined. Let $ZZ_p$ act on $S$ by cyclic permutation: $1 dot.c (a_1, dots, a_p) = (a_2, dots, a_p, a_1)$.

= Lecture 8: Cauchy's Theorem, Normalisers, and the Very Useful Lemma

== Proof of Cauchy's Theorem

*Continuation.* The cyclic group $ZZ_p$ acts on $S = \{(a_1, dots, a_p) in G^p mid(|) a_1 dots.c a_p = e\}$ by cyclic shift. A tuple is fixed iff $a_1 = a_2 = dots.c = a_p$, i.e., $a_1^p = e$. Since $|S| = |G|^(p-1)$ and $p mid |G|$, we have $p mid |S|$. By Theorem 36.1, $|S| equiv |S_(ZZ_p)| (mod p)$, so $p mid |S_(ZZ_p)|$. The tuple $(e, dots, e) in S$ is always fixed, so there is at least one other fixed point $(a, a, dots, a)$ with $a != e$ and $a^p = e$. Thus $G$ has an element of order $p$. $square$

== Normalisers

=== 36.5 Definition (Normaliser)

The *normaliser* of a subgroup $H$ in $G$ is
$ N_G(H) = \{g in G mid(|) g H g^(-1) = H\} = \{g in G mid(|) g H = H g\}. $
This is the largest subgroup of $G$ in which $H$ is normal. We have $H triangle.l N_G(H) lt.eq G$.

The number of conjugates of $H$ in $G$ is $[G : N_G(H)]$.

=== 36.6 Lemma

_Let $H$ be a $p$-subgroup of a finite group $G$. Then $(N_G(H) : H) equiv (G : H) (mod p)$._

*Proof.* Let $H$ act on $cal(L) = G \/ H$ (left cosets of $H$) by left multiplication. Since $H$ is a $p$-group, Theorem 36.1 gives $|cal(L)| equiv |cal(L)_H| (mod p)$. A coset $x H$ is fixed by all $h in H$ iff $h x H = x H$ iff $x^(-1) h x in H$ for all $h in H$ iff $x in N_G(H)$. Thus the fixed cosets are exactly the left cosets of $H$ within $N_G(H)$, so $|cal(L)_H| = (N_G(H) : H)$. Hence $(G : H) equiv (N_G(H) : H) (mod p)$.

=== 36.7 Corollary

_If $H$ is a $p$-subgroup of $G$ and $p$ divides $(G : H)$, then $N_G(H) != H$._

*Proof.* From Lemma 36.6, $p$ divides $(N_G(H) : H)$, which must then be different from 1.

= Lecture 9: First and Second Sylow Theorems

== Sylow Subgroups

=== 36.9 Definition (Sylow $p$-subgroup)

Let $G$ be a finite group with $|G| = p^n m$ where $p$ is prime and $gcd(p, m) = 1$. A *Sylow $p$-subgroup* of $G$ is a subgroup of order $p^n$ (a maximal $p$-subgroup).

=== 36.8 First Sylow Theorem

_Let $G$ be a finite group with $|G| = p^n m$ and $gcd(p, m) = 1$. Then:_
+ _$G$ contains a subgroup of order $p^i$ for each $i$ where $1 lt.eq i lt.eq n$._
+ _Every subgroup $H$ of $G$ of order $p^i$ is a normal subgroup of a subgroup of order $p^(i+1)$ for $1 lt.eq i < n$._

*Proof.* $G$ has a subgroup of order $p$ by Cauchy's theorem. By induction, suppose $H$ has order $p^i$ for $i < n$. Since $i < n$, $p$ divides $(G : H)$. By Lemma 36.6, $p$ divides $(N_G(H) : H)$. Since $H triangle.l N_G(H)$, the factor $N_G(H) \/ H$ has a subgroup $K$ of order $p$ by Cauchy's theorem. The preimage $gamma^(-1)(K)$ is a subgroup of $N_G(H) lt.eq G$ of order $p^(i+1)$ containing $H$ as a normal subgroup.

=== 36.10 Second Sylow Theorem

_Any two Sylow $p$-subgroups of $G$ are conjugate: if $P$ and $P'$ are both Sylow $p$-subgroups, then $P' = g P g^(-1)$ for some $g in G$._

*Proof.* Let $P_2$ act on the set of left cosets of $P_1$ by left multiplication. The total number of cosets is $[G : P_1] = m$, which is not divisible by $p$. By Theorem 36.1, $|cal(L)_(P_2)| equiv m (mod p)$, so $|cal(L)_(P_2)| != 0$: some coset $x P_1$ is fixed by all of $P_2$. This means $P_2 lt.eq x P_1 x^(-1)$. Since $|P_1| = |P_2| = p^n$, we get $P_2 = x P_1 x^(-1)$.

=== 36.12 Example

The Sylow 2-subgroups of $S_3$ have order 2. The subgroups of order 2 in $S_3$ are
$ \{rho_0, mu_1\}, quad \{rho_0, mu_2\}, quad \{rho_0, mu_3\}. $
Note there are three such subgroups and $3 equiv 1 (mod 2)$. Also, $3$ divides $6$, the order of $S_3$. We can verify they are all conjugate: $i_(rho_2)[\{rho_0, mu_1\}] = \{rho_0, mu_3\}$ and $i_(rho_1)[\{rho_0, mu_1\}] = \{rho_0, mu_2\}$.

= Lecture 10: Third Sylow Theorem and Applications

== Third Sylow Theorem and Simplicity

=== 36.11 Third Sylow Theorem

_The number $n_p$ of Sylow $p$-subgroups of $G$ satisfies:_
- _$n_p equiv 1 (mod p)$_
- _$n_p mid m$ (where $|G| = p^n m$, $gcd(p,m) = 1$)_

*Proof.* Let $P$ be one Sylow $p$-subgroup and let $cal(S)$ be the set of all Sylow $p$-subgroups. Let $P$ act on $cal(S)$ by conjugation. If $T in cal(S)$ is fixed by $P$, then $P lt.eq N_G(T)$. Since $P$ and $T$ are both Sylow $p$-subgroups of $N_G(T)$, they are conjugate in $N_G(T)$ by the Second Sylow Theorem. But $T triangle.l N_G(T)$, so $T$ is the only conjugate of $T$ in $N_G(T)$. Thus $P = T$. So $P$ is the only fixed point, giving $|cal(S)| equiv 1 (mod p)$, i.e., $n_p equiv 1 (mod p)$.

Now let $G$ act on $cal(S)$ by conjugation. By the Second Sylow Theorem all Sylow $p$-subgroups are conjugate, so there is one orbit: $|cal(S)| = [G : N_G(P)]$. Since $P lt.eq N_G(P)$, we have $n_p = [G : N_G(P)]$ divides $[G : P] = m$.

=== 36.13 Example

No group of order 15 is simple. Let $|G| = 15 = 3 dot.c 5$. By the Third Sylow Theorem, $n_5 equiv 1 (mod 5)$ and $n_5 mid 3$. The only positive divisors of 3 that are $equiv 1 (mod 5)$ are: $1, 6, 11, dots$ among $\{1, 3\}$, so $n_5 = 1$. Thus the unique Sylow 5-subgroup is normal. Hence $G$ is not simple.

=== Applications: Groups That Cannot Be Simple

*Groups of order $p q$ (distinct primes $p < q$).* We have $n_q mid p$ and $n_q equiv 1 (mod q)$. Since $p < q$, the only option is $n_q = 1$, so the Sylow $q$-subgroup is normal and $G$ is not simple.

*Groups of order $30$.* $n_5 in \{1, 6\}$ and $n_3 in \{1, 10\}$. If $n_5 = 6$ and $n_3 = 10$ then we would need $6 times 4 + 10 times 2 = 44 > 30$ elements, contradiction. So $n_5 = 1$ or $n_3 = 1$, hence $G$ is not simple.

*Groups of order 12.* $n_3 in \{1, 4\}$. If $n_3 = 4$, then $G$ acts on the 4 Sylow 3-subgroups giving a homomorphism $G -> S_4$ with $|G| = 12 mid 24 = |S_4|$; the kernel is a normal subgroup. Either way, $G$ has a proper nontrivial normal subgroup.

= Lecture 11: Applications of Sylow Theory (Chapter 37)

== Applications to $p$-Groups and the Class Equation

=== 37.1 Theorem

_Every group of prime-power order (i.e., every finite $p$-group) is solvable._

*Proof.* By the First Sylow Theorem, $G$ has subgroups $H_i$ of order $p^i$ with $H_i triangle.l H_(i+1)$ for $1 lt.eq i < n$ where $|G| = p^n$. Then $\{e\} = H_0 < H_1 < dots.c < H_n = G$ is a composition series with factors of order $p$, hence cyclic and abelian.

=== 37.2 Definition (Class Equation)

When $G$ acts on itself by conjugation, the class equation is
$ |G| = |Z(G)| + sum_(i=s+1)^r [G : C_G(x_i)] $
where each $[G : C_G(x_i)] > 1$.

=== 37.3 Example

The conjugacy classes of $S_3$ are $\{rho_0\}$, $\{rho_1, rho_2\}$, $\{mu_1, mu_2, mu_3\}$. The class equation is $6 = 1 + 2 + 3$.

=== 37.4 Theorem

_The centre of a finite nontrivial $p$-group $G$ is nontrivial._

*Proof.* In the class equation, $|G| = c + n_(c+1) + dots.c + n_r$ where $c = |Z(G)|$. Each $n_i = [G : C_G(x_i)]$ divides $|G|$, so $p mid n_i$ for each $i > s$. Since $p mid |G|$, we get $p mid c$. Since $c gt.eq 1$ (as $e in Z(G)$), we have $c gt.eq p$, so $Z(G)$ has more than one element.

== Direct Products and Classification

=== 37.5 Lemma

_Let $G$ be a group containing normal subgroups $H$ and $K$ such that $H inter K = \{e\}$ and $H or.big K = G$. Then $G tilde.equiv H times K$._

*Proof.* For $h in H$ and $k in K$, the commutator $h k h^(-1) k^(-1)$ is in both $H$ and $K$ (since both are normal), hence in $H inter K = \{e\}$. So $h k = k h$. Define $phi: H times K -> G$ by $phi(h, k) = h k$. This is a homomorphism (since elements of $H$ and $K$ commute), it is injective (if $h k = e$ then $h = k^(-1) in H inter K = \{e\}$), and surjective (since $H K = H or.big K = G$).

=== 37.6 Theorem

_For a prime $p$, every group $G$ of order $p^2$ is abelian._

*Proof.* If $G$ is not cyclic, every nonidentity element has order $p$. Pick $a$ with $|a| = p$ and $b in.not chevron.l a chevron.r$. Then $chevron.l a chevron.r inter chevron.l b chevron.r = \{e\}$. Since both have order $p$ and are normal (by Theorem 37.4, $Z(G)$ is nontrivial, so $|Z(G)| in \{p, p^2\}$; if $|Z(G)| = p^2$ we are done; if $|Z(G)| = p$ then $G \/ Z(G)$ is cyclic of order $p$ which forces $G$ abelian, contradiction). So $G tilde.equiv ZZ_p times ZZ_p$ by Lemma 37.5.

The only groups of order $p^2$ are $ZZ_(p^2)$ and $ZZ_p times ZZ_p$.

=== 37.7 Theorem (Groups of order $p q$)

_If $p$ and $q$ are distinct primes with $p < q$, then every group $G$ of order $p q$ has a single subgroup of order $q$ and this subgroup is normal. Hence $G$ is not simple. If $q equiv.not 1 (mod p)$, then $G$ is abelian and cyclic._

*Proof.* $n_q mid p$ and $n_q equiv 1 (mod q)$. Since $p < q$, we must have $n_q = 1$. If $q equiv.not 1 (mod p)$, then $n_p mid q$ and $n_p equiv 1 (mod p)$; since $q equiv.not 1 (mod p)$, we get $n_p = 1$. Both Sylow subgroups are normal with trivial intersection, so $G tilde.equiv ZZ_q times ZZ_p tilde.equiv ZZ_(p q)$ by Lemma 37.5.

=== 37.8 Lemma (Product Formula)

_If $H$ and $K$ are finite subgroups of a group $G$, then_ $|H K| = (|H| dot.c |K|) / |H inter K|.$

*Proof.* $H K$ has at most $|H| dot.c |K|$ elements. If $h_1 k_1 = h_2 k_2$, set $x = h_2^(-1) h_1 = k_2 k_1^(-1) in H inter K$. Each element $h k in H K$ is represented exactly $|H inter K|$ times as a product.

== Further Applications: Non-Simplicity

=== 37.9 Example

No group of order $p^r$ for $r > 1$ is simple. By the First Sylow Theorem, $G$ has a subgroup of order $p^(r-1)$ normal in a subgroup of order $p^r = |G|$, so $G$ has a normal subgroup of order $p^(r-1)$.

=== 37.10 Example

Every group of order 15 is cyclic. Since $15 = 3 dot.c 5$ and $5 equiv.not 1 (mod 3)$, Theorem 37.7 gives $G tilde.equiv ZZ_(15)$.

=== 37.11 Example

No group of order 20 is simple: $n_5 equiv 1 (mod 5)$ and $n_5 mid 4$, so $n_5 = 1$.

=== 37.12 Example

No group of order 30 is simple. If there is only one Sylow $p$-subgroup for some prime $p in \{2, 3, 5\}$, we are done. If $n_5 = 6$, each pair of Sylow 5-subgroups intersects in $\{e\}$, so we need $6 times 4 = 24$ elements of order 5. If also $n_3 = 10$, we need $10 times 2 = 20$ elements of order 3. But $24 + 20 = 44 > 30$, contradiction. So $n_5 = 1$ or $n_3 = 1$.

=== 37.13 Example

No group of order 48 is simple. $48 = 2^4 dot.c 3$, so $n_2 in \{1, 3\}$. If $n_2 = 1$, done. If $n_2 = 3$, let $H, K$ be two Sylow 2-subgroups. Then $H inter K$ has order $gt.eq 8$ by Lemma 37.8 (if $|H inter K| lt.eq 4$ then $|H K| gt.eq 16 dot.c 16 \/ 4 = 64 > 48$). So $|H inter K| = 8$. Since $H inter K$ has index 2 in both $H$ and $K$, it is normal in both. The normaliser $N_G(H inter K)$ contains both $H$ and $K$, has order a multiple of 16 and a divisor of 48, so $|N_G(H inter K)| = 48$, meaning $H inter K triangle.l G$.

=== 37.14 Example

No group of order 36 is simple. $36 = 2^2 dot.c 3^2$, so $n_3 in \{1, 4\}$. If $n_3 = 4$, let $H, K$ be two Sylow 3-subgroups. $|H inter K| gt.eq 3$ by Lemma 37.8 (if $|H inter K| = 1$ then $|H K| = 81 > 36$). The normaliser of $H inter K$ has order a multiple of 9 and a divisor of 36, so it is either 18 or 36. In either case, it gives a normal subgroup.

=== 37.15 Example

Every group of order 255 = $(3)(5)(17)$ is abelian (hence cyclic). $n_(17) in \{1\}$ (since $n_(17) mid 15$ and $n_(17) equiv 1 (mod 17)$), giving a normal subgroup $H$ of order 17. Then $G \/ H$ has order 15, which is cyclic by Example 37.10. The commutator subgroup $C = G'$ is contained in $H$ and has order 1 or 17. Since $n_3 in \{1, 85\}$ and $n_5 in \{1, 51\}$, counting elements shows we cannot have both $n_3 = 85$ and $n_5 = 51$. A careful analysis forces $C = \{e\}$, so $G$ is abelian.

== Classifying Groups of Small Order

=== Strategy

To classify all groups of a given order $n$:
1. Use Sylow theorems to constrain $n_p$ for each prime $p mid n$.
2. If some $n_p = 1$, that Sylow subgroup is normal — use semidirect products.
3. If $G = H N$ with $H inter N = \{e\}$ and $N triangle.l G$, then $G$ is a *semidirect product* $N ⋊ H$, determined by the action $phi: H -> "Aut"(N)$ via $phi(h)(n) = h n h^(-1)$.

=== Example: Groups of Order 6

$|G| = 6 = 2 dot.c 3$. $n_3 = 1$, so $P_3 triangle.l G$ with $P_3 tilde.equiv ZZ_3$. $n_2 in \{1, 3\}$. If $n_2 = 1$: $G tilde.equiv ZZ_2 times ZZ_3 tilde.equiv ZZ_6$. If $n_2 = 3$: $G tilde.equiv S_3$.

=== Semi-direct Products

The *internal semidirect product* $N ⋊_phi H$ for $N triangle.l G$, $H lt.eq G$, $N H = G$, $N inter H = \{e\}$ has the product formula $(n_1, h_1)(n_2, h_2) = (n_1 phi(h_1)(n_2), h_1 h_2)$.

=== Example: Groups of Order 12

$12 = 2^2 dot.c 3$. $n_3 in \{1, 4\}$, $n_2 in \{1, 3\}$. The groups of order 12 are: $ZZ_(12)$, $ZZ_2 times ZZ_6$, $A_4$, $D_6$ (dihedral), and $"Dic"_3$ (dicyclic group).

= Lecture 12: Free Abelian Groups (Chapter 38, Part 1)

== Free Abelian Groups

=== 38.1 Theorem (Characterisation of Free Abelian Groups)

_Let $X$ be a subset of a nonzero abelian group $G$. The following conditions on $X$ are equivalent:_
+ _Each nonzero element $a in G$ can be expressed *uniquely* (up to order of summands) in the form $a = n_1 x_1 + n_2 x_2 + dots.c + n_r x_r$ for $n_i != 0$ in $ZZ$ and distinct $x_i in X$._
+ _$X$ generates $G$, and $n_1 x_1 + n_2 x_2 + dots.c + n_r x_r = 0$ for $n_i in ZZ$ and distinct $x_i in X$ if and only if $n_1 = n_2 = dots.c = n_r = 0$._

_Condition 2 says $X$ generates $G$ and is $ZZ$-linearly independent._

=== 38.2 Definition (Free Abelian Group, Basis)

An abelian group having a generating set $X$ satisfying the conditions of Theorem 38.1 is a *free abelian group*, and $X$ is a *basis* for the group.

=== 38.3 Example

$ZZ times ZZ$ is free abelian with basis $\{(1, 0), (0, 1)\}$. Similarly $ZZ^n$ is free abelian of rank $n$ with standard basis $\{e_1, dots, e_n\}$. Any finite direct product of copies of $ZZ$ is free abelian.

=== 38.4 Example

$ZZ_n$ is *not* free abelian: for any $x in ZZ_n$ with $x != 0$, we have $n x = 0$, so $\{x\}$ fails Condition 2 of Theorem 38.1.

=== 38.5 Theorem

_If $G$ is a nonzero free abelian group with a basis of $r$ elements, then $G tilde.equiv ZZ times ZZ times dots.c times ZZ$ ($r$ factors)._

=== 38.6 Theorem (Rank is Well-Defined)

_Let $G != \{0\}$ be a free abelian group with a finite basis. Then every basis of $G$ is finite, and all bases have the same number of elements._

*Proof.* Let $X = \{x_1, dots, x_r\}$ be a basis, so $G tilde.equiv ZZ^r$. Consider $2 G = \{2 g mid(|) g in G\}$. Then $G \/ 2 G tilde.equiv ZZ_2^r$, which has $2^r$ elements. Since $|G \/ 2 G| = 2^r$, the number $r = log_2 |G \/ 2 G|$ is determined by $G$ alone. If $Y$ is any other basis, the same argument gives $|Y| = r$.

=== 38.7 Definition (Rank)

The *rank* of a free abelian group is the number of elements in a basis.

=== Universal Property

If $F$ is free abelian with basis $B$ and $A$ is any abelian group, then any function $f: B -> A$ extends uniquely to a group homomorphism $hat(f): F -> A$. This characterises free abelian groups up to isomorphism.

=== 38.8 Theorem (Surjection from Free Group)

_Let $G$ be a finitely generated abelian group with generating set $\{a_1, dots, a_n\}$. The map $phi: ZZ^n -> G$ defined by $phi(h_1, dots, h_n) = h_1 a_1 + dots.c + h_n a_n$ is a surjective homomorphism._

=== Subgroups of Free Abelian Groups

=== 38.6' Theorem (Subgroup Theorem, first part)

_Every subgroup of a free abelian group of rank $n$ is free abelian of rank $lt.eq n$._

*Proof (outline).* Let $F$ have basis $\{x_1, dots, x_n\}$ and let $H lt.eq F$. Define $H_k = H inter (ZZ x_1 plus.o dots.c plus.o ZZ x_k)$. The projection of $H_k$ to the $x_k$-coordinate gives a subgroup of $ZZ$, hence of the form $d_k ZZ$ for some $d_k gt.eq 0$. If $d_k > 0$, pick a preimage in $H_k$ to get a new basis element. By induction, $H$ is free abelian of rank $lt.eq n$.

= Lecture 13: Subgroup Structure and Theorem 38.11

== Completing the Subgroup Theorem

=== 38.9 Theorem (Basis Replacement)

_If $X = \{x_1, dots, x_r\}$ is a basis for a free abelian group $G$ and $t in ZZ$, then for $i != j$, the set $Y = \{x_1, dots, x_(j-1), x_j + t x_i, x_(j+1), dots, x_r\}$ is also a basis for $G$._

*Proof.* Since $x_j = (-t) x_i + (1)(x_j + t x_i)$, $x_j$ is recoverable from $Y$, so $Y$ generates $G$. If $n_1 x_1 + dots.c + n_j(x_j + t x_i) + dots.c + n_r x_r = 0$, then $(n_i + n_j t) x_i + dots.c + n_j x_j + dots.c + n_r x_r = 0$, and since $X$ is a basis, all coefficients are 0, so $n_j = 0$ and then $n_i = 0$, etc. Thus $Y$ satisfies Condition 2.

=== 38.10 Example

A basis for $ZZ times ZZ$ is $\{(1, 0), (0, 1)\}$. Another basis is $\{(1, 0), (4, 1)\}$ since $(4, 1) = 4(1, 0) + (0, 1)$. However, $\{(3, 0), (0, 1)\}$ is *not* a basis: we cannot express $(2, 0)$ in the form $n_1(3, 0) + n_2(0, 1)$ for integers $n_1, n_2$ (since $(2, 0) = (1, 0) + 2(1, 0)$ but $2\/3$ is not an integer). Here $(3, 0)$ is a multiple of $(1, 0)$ added to _itself_, violating the requirement $i != j$.

=== 38.11 Theorem

_Let $F$ be a nonzero free abelian group of finite rank $n$, and let $K$ be a nonzero subgroup. Then $K$ is free abelian of rank $s lt.eq n$. Furthermore, there exists a basis $\{x_1, dots, x_n\}$ for $F$ and positive integers $d_1, d_2, dots, d_s$ with $d_i mid d_(i+1)$ for $i = 1, dots, s-1$, such that $\{d_1 x_1, dots, d_s x_s\}$ is a basis for $K$._

*Proof idea.* Among all bases $Y$ for $F$, choose one that minimises the smallest nonzero coefficient $|k_i|$ appearing in any element of $K$ written in terms of $Y$. Call this minimal value $d_1$ and the corresponding basis element $x_1$. Using the basis replacement property (Theorem 38.9) and the division algorithm, show that every element of $K$ has its $x_1$-coefficient divisible by $d_1$, so $d_1 x_1 in K$. Repeat for the subgroup of $K$ whose elements have $x_1$-coefficient 0, obtaining $d_2, x_2$, etc. The minimality choices ensure $d_1 mid d_2 mid dots.c mid d_s$.

=== 38.9' Theorem (Smith Normal Form — statement)

_Any $m times n$ integer matrix $A$ can be reduced to *Smith normal form* $D = "diag"(d_1, d_2, dots, d_r, 0, dots, 0)$ by integer row and column operations (i.e., multiplying on left and right by invertible integer matrices), where $d_1 mid d_2 mid dots.c mid d_r > 0$._

=== Example

For $F = ZZ^2$ and $H = chevron.l (2, 0), (0, 6), (3, 3) chevron.r$, the matrix of generators is $mat(2, 0; 0, 6; 3, 3)$. Applying Smith Normal Form gives $d_1 = 1, d_2 = 6$, yielding a basis change making the structure apparent.

= Lecture 14: Proof of Theorem 38.11

== Full Proof of Theorem 38.11

=== Proof

By the basis $\{x_1, dots, x_n\}$ for $F$, generators of $K$ can be written as an $m times n$ integer matrix $A$ (rows = generators). Applying Smith Normal Form transformations corresponds to:
- *Row operations*: changing the generating set of $K$ (using invertible integer matrices in $"GL"_m(ZZ)$)
- *Column operations*: changing the basis of $F$ (using invertible integer matrices in $"GL"_n(ZZ)$)

After reduction, $K$ has generators $d_1 y_1, dots, d_r y_r$ where $\{y_i\}$ extends to a basis of $F$ and $d_1 mid dots.c mid d_r$. Since $K$ is generated by these elements (and they are independent as $d_i > 0$), they form a basis for $K$. $square$

= Lecture 15: Fundamental Theorem of Finitely Generated Abelian Groups and Introduction to Free Groups

== Fundamental Theorem

=== 38.12 Fundamental Theorem of Finitely Generated Abelian Groups

_Every finitely generated abelian group $G$ is isomorphic to a direct sum_
$ G tilde.equiv ZZ^r plus.o ZZ_(d_1) plus.o ZZ_(d_2) plus.o dots.c plus.o ZZ_(d_t) $
_where $r gt.eq 0$ (the *free rank* or *Betti number*) and $d_1 mid d_2 mid dots.c mid d_t gt.eq 2$. The integer $r$ and the sequence $d_1, dots, d_t$ are uniquely determined by $G$._

*Proof (existence).* Since $G$ is finitely generated abelian, there is a surjective homomorphism $phi: F -> G$ where $F = ZZ^n$ for some $n$ (Theorem 38.8). Let $K = ker(phi)$, so $G tilde.equiv F \/ K$ by the First Isomorphism Theorem. By Theorem 38.11, choose bases $\{y_1, dots, y_n\}$ for $F$ and $d_1 mid dots.c mid d_s$ such that $K = chevron.l d_1 y_1, dots, d_s y_s chevron.r$. Then
$ G tilde.equiv F \/ K tilde.equiv (ZZ \/ d_1 ZZ) plus.o dots.c plus.o (ZZ \/ d_s ZZ) plus.o ZZ^(n-s). $
Discarding $ZZ \/ 1 ZZ = \{0\}$ factors (those with $d_i = 1$) and separating the $ZZ^(n-s)$ gives the result.

*Uniqueness.* The rank $r$ is $"rank"(G \/ G_"tors")$ where $G_"tors"$ is the torsion subgroup. Uniqueness of $d_i$ uses the Smith Normal Form uniqueness (not proved in class; the uniqueness of the torsion part is left as exercises).

=== Alternative: Invariant Factor vs Primary Decomposition

Equivalently, each $ZZ_(d_i)$ can be decomposed by the Chinese Remainder Theorem into primary cyclic groups $ZZ_(p^k)$, giving the *primary decomposition*:
$ G tilde.equiv ZZ^r plus.o plus.o.big_p plus.o.big_k ZZ_(p^(a_(p,k))) $

== Introduction to Free Groups (Chapter 39)

=== Motivation

We want a group freely generated by a set — where the only relations are those forced by the group axioms.

=== 39.1 Definition (Words and Syllables)

Let $A = \{a_i mid(|) i in I\}$ be a set (the *alphabet*). A symbol $a_i^n$ with $n in ZZ$ is a *syllable*. A *word* on $A$ is a finite string of syllables written in juxtaposition. The *empty word* $1$ has no syllables.

=== 39.1 Example

On $A = \{a_1, a_2, a_3\}$: the expressions $a_1 a_3^(-4) a_2^2 a_3$, $a_2^3 a_2^(-1) a_3 a_1^2 a_1^(-7)$, and $a_3^2$ are all words.

=== Elementary Contractions and Reduced Words

An *elementary contraction* replaces $a_i^m a_i^n$ with $a_i^(m+n)$ (combining adjacent syllables of the same letter) or deletes $a_i^0$. A word is *reduced* if no elementary contractions are possible — equivalently, it contains no consecutive syllables $a a^(-1)$ or $a^(-1) a$ and no syllable with exponent 0.

=== 39.2 Example

The reduced form of the word $a_2^3 a_2^(-1) a_3 a_1^2 a_1^(-7)$ from Example 39.1 is $a_2^2 a_3 a_1^(-5)$.

=== 39.4 Definition (Free Group)

The set $F[A]$ of all reduced words on alphabet $A$ forms a group under concatenation followed by reduction. This is the *free group generated by $A$*.

=== 39.5 Definition (Free on $A$)

If $G$ is a group with a set of generators $A = \{a_i\}$, and $G$ is isomorphic to $F[A]$ under a map $phi$ with $phi(a_i) = a_i$, then $G$ is *free on $A$* and the $a_i$ are *free generators* of $G$.

=== 39.6 Example

$ZZ$ is the only free group that has occurred before; it is free on one generator. Every free group is infinite. $F[A]$ is non-abelian if $|A| gt.eq 2$ (e.g., $a b != b a$ in $F[\{a, b\}]$).

= Lecture 16: Free Groups and Group Presentations (Chapters 39--40)

== Free Groups

=== Properties

- $F(A)$ is infinite if $|A| gt.eq 1$.
- $F(\{a\}) tilde.equiv ZZ$ (infinite cyclic group).
- $F(A)$ is non-abelian if $|A| gt.eq 2$.

=== 39.7 Theorem (Rank Well-Defined)

_If $G$ is free on $A$ and also on $B$, then $|A| = |B|$; that is, any two sets of free generators of a free group have the same cardinality._

=== 39.8 Definition (Rank of a Free Group)

The *rank* of a free group $G$ free on $A$ is $|A|$.

=== 39.9 Theorem

_Two free groups are isomorphic if and only if they have the same rank._

=== 39.10 Theorem (Nielsen-Schreier)

_A nontrivial proper subgroup of a free group is free._

=== 39.11 Example

Let $F[\{x, y\}]$ be the free group on $\{x, y\}$. The elements $y_k = x^k y x^(-k)$ for $k gt.eq 0$ are free generators for the subgroup they generate. This illustrates that a subgroup of a free group can have rank *much larger* than the rank of the group itself.

== Homomorphisms of Free Groups

=== 39.12 Theorem (Universal Property)

_Let $G$ be generated by $A = \{a_i mid(|) i in I\}$ and let $G'$ be any group. If $a_i'$ are any elements of $G'$ (not necessarily distinct), then there is at most one homomorphism $phi: G -> G'$ such that $phi(a_i) = a_i'$. If $G$ is free on $A$, then there is exactly one such homomorphism._

This is the *universal property* of free groups: for any function $f: A -> G'$, there exists a unique group homomorphism $hat(f): F(A) -> G'$ extending $f$.

=== 39.13 Theorem

_Every group $G'$ is a homomorphic image of a free group $G$._

*Proof.* Let $A' = \{a_i' mid(|) i in I\}$ be a set with the same cardinality as $G'$ and let $A = \{a_i\}$. Set $G = F[A]$. By Theorem 39.12, the map $psi: G -> G'$ with $psi(a_i) = a_i'$ is a homomorphism, and it is clearly onto $G'$.

=== Free Abelian Groups via Free Groups

A free abelian group with basis $A$ can be constructed as $F[A] \/ C$ where $C = [F[A], F[A]]$ is the commutator subgroup of the free group on $A$. The cosets $a C$ for $a in A$ form a basis for the free abelian group.

== Group Presentations

=== 40.1 Example

Consider the group $G$ with generators $x, y$ that is free except for the relation $x y = y x$. This means $x y x^(-1) y^(-1) = 1$ is a relator. Thus $G tilde.equiv F[\{x, y\}] \/ N$ where $N$ is the normal closure of $x y x^(-1) y^(-1)$. This gives a free abelian group on two generators.

=== 40.2 Definition (Group Presentation)

A *presentation* of a group $G$ is an expression $G = chevron.l A mid R chevron.r$ where:
- $A$ is a set of *generators*
- $R subset F(A)$ is a set of *relators* (words that equal $e$ in $G$)

$G tilde.equiv F(A) \/ N(R)$ where $N(R)$ is the normal closure of $R$ in $F(A)$ (smallest normal subgroup containing $R$).

*Relations* are written as equations $r = e$ or equivalently $u = v$ (meaning $u v^(-1) in N(R)$). A *finite presentation* is one where both $A$ and $R$ are finite.

=== 40.3 Example (Isomorphic Presentations)

The presentation $chevron.l a mid a^6 chevron.r$ gives $ZZ_6$. But also $chevron.l a, b mid a^2, b^3, a b a^(-1) b^(-1) chevron.r$ gives $ZZ_6$: the relation $a^2 = 1$ gives $a^(-1) = a$; $b^3 = 1$ gives $b^(-1) = b^2$; $a b = b a$ makes $G$ abelian. Every element is $a^m b^n$, and $a^2 = b^3 = 1$ gives six distinct elements $1, b, b^2, a, a b, a b^2$.

=== 40.4 Example (Trivial Group)

The presentation $chevron.l x, y mid y^2 x = y, y x^2 y = x chevron.r$ gives the trivial group. From $y^2 x = y$ we get $y x = 1$. From $y x^2 y = x$: substituting $y x = 1$ yields $y^(-1) = x$, $x y = 1$. Then $y = x^(-1)$ and $x = 1$, $y = 1$.

=== Examples of Standard Presentations

- $ZZ_n = chevron.l a mid a^n chevron.r$: cyclic group of order $n$.
- $ZZ = chevron.l a mid chevron.r$: infinite cyclic group (no relations).
- $S_3 = chevron.l a, b mid a^3 = e, b^2 = e, b a b^(-1) = a^(-1) chevron.r$: symmetric group on 3 elements.
- $D_n = chevron.l r, s mid r^n = e, s^2 = e, s r s^(-1) = r^(-1) chevron.r$: dihedral group of order $2n$.

=== 40.5 Von Dyck's Theorem

_If $G = chevron.l A mid R chevron.r$ and $H$ is a group with a map $A -> H$ satisfying all relations in $R$, then there is a unique surjective homomorphism $G -> H$._

This gives a way to prove two groups are isomorphic: show each is a quotient of the other.

= Lecture 17: Completing Group Presentations (Section 40)

== Further Results on Presentations

=== The Word Problem

Given a presentation $G = chevron.l A mid R chevron.r$, the *word problem* asks: is there an algorithm to decide whether a word in $A union A^(-1)$ represents the identity in $G$? In general this is undecidable (Novikov 1955), but it is decidable for many specific classes.

=== Tietze Transformations

Two presentations give isomorphic groups iff one can be obtained from the other by *Tietze transformations*:
1. Add a new generator $c$ and a relation $c = w$ (where $w$ is a word in existing generators).
2. Remove a generator $c$ if a relation $c = w$ exists (substituting $w$ for $c$ everywhere).
3. Add a relation that is a consequence of the existing relations.
4. Remove a relation that is a consequence of others.

== Applications of Presentations

=== 40.5 Example: Groups of Order 10

All abelian groups of order 10 are isomorphic to $ZZ_(10)$. For nonabelian groups: $n_5 = 1$ (since $n_5 mid 2$ and $n_5 equiv 1 (mod 5)$), so there is a normal subgroup $H$ of order 5. Let $a$ generate $H$ and $b in.not H$ with $b^2 = 1$. Since $H triangle.l G$, $b a b^(-1) in H$, so $b a b^(-1) = a^i$ for some $i$. The three candidates are:
+ $chevron.l a, b mid a^5, b^2, b a = a^2 b chevron.r$: gives $G$ with $a = a^4$ so $a^3 = e$, but $a^5 = a^3 = e$ gives $a^2 = e$, then $a = e$. Collapses to $ZZ_2$.
+ $chevron.l a, b mid a^5, b^2, b a = a^3 b chevron.r$: similarly gives $ZZ_2$.
+ $chevron.l a, b mid a^5, b^2, b a = a^4 b chevron.r$: this gives 10 distinct elements $\{a^i b^j mid 0 lt.eq i lt.eq 4, 0 lt.eq j lt.eq 1\}$ and a nonabelian group isomorphic to $D_5$.

=== 40.6 Example: Groups of Order 8

The three abelian groups: $ZZ_8$, $ZZ_2 times ZZ_4$, $ZZ_2 times ZZ_2 times ZZ_2$.

For nonabelian: $G$ must have an element of order 4 (if all nonidentity elements had order 2, then $(a b)^2 = e$ gives $a b = b a$ and $G$ would be abelian). Let $chevron.l a chevron.r$ have order 4 with $b in.not chevron.l a chevron.r$. Since $chevron.l a chevron.r triangle.l G$ (index 2), $b a b^(-1) = a$ or $a^3$. If $b a b^(-1) = a$ then $G$ is abelian, so $b a b^(-1) = a^3 = a^(-1)$. Since $b^2 in chevron.l a chevron.r$, either $b^2 = 1$ or $b^2 = a^2$:

- $G_1 = chevron.l a, b mid a^4, b^2, b a = a^3 b chevron.r$: the *octic group*, isomorphic to $D_4$ (symmetries of the square).
- $G_2 = chevron.l a, b mid a^4, b^2 = a^2, b a = a^3 b chevron.r$: the *quaternion group* $Q_8$, isomorphic to $\{plus.minus 1, plus.minus i, plus.minus j, plus.minus k\}$ under quaternion multiplication.

Both have 8 elements $1, a, a^2, a^3, b, a b, a^2 b, a^3 b$, but $D_4$ has only two elements of order 4 ($a$ and $a^3$) while $Q_8$ has six ($a, a^3, b, a b, a^2 b, a^3 b$ — all but $1, a^2$ have order 4).

=== Free Products

The *free product* $G * H$ has presentation $chevron.l A_G union A_H mid R_G union R_H chevron.r$ where $A_G, A_H$ are disjoint generators and $R_G, R_H$ are the respective relators.

A *free product with amalgamation* $G *_K H$ amalgamates over a common subgroup $K$, identifying the images of $K$ in $G$ and $H$.

=== Further Examples of Presentations

*Quaternion group $Q_8$:* $chevron.l i, j mid i^4 = e, j^4 = e, i^2 = j^2, i j i^(-1) = j^(-1) chevron.r$.

*Trefoil knot group:* $chevron.l a, b mid a^2 = b^3 chevron.r$ — fundamental group of the complement of the trefoil knot in $RR^3$.

*Finite presentations of infinite groups:* $ZZ^2 = chevron.l a, b mid a b a^(-1) b^(-1) chevron.r$ (abelian group, one commutator relation).

=== Abelianisation

The *abelianisation* of $G = chevron.l A mid R chevron.r$ is $G^"ab" = G \/ [G, G]$. It is obtained by adding all commutator relations $[a_i, a_j] = e$ to the presentation:
$ G^"ab" = chevron.l A mid R union \{[a_i, a_j] mid a_i, a_j in A\} chevron.r. $
The abelianisation is the largest abelian quotient of $G$.

=== Summary of Key Themes

The course has explored the structure of groups through:
- *Quotient constructions* (Isomorphism Theorems, normal series)
- *Composition structure* (Jordan-Hölder: composition factors are intrinsic)
- *Structural properties* (solvable, nilpotent groups — links to Galois theory)
- *Sylow theory* (Sylow $p$-subgroups, applications to simplicity and classification)
- *Free constructions* (free abelian groups, free groups, presentations)
- *Fundamental Theorem of Finitely Generated Abelian Groups* (complete classification)
