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

=== 34.3 Second Isomorphism Theorem (Diamond Isomorphism Theorem)

_Let $H leq G$ and $N triangle.l G$. Then $H N = {h n mid(|) h in H, n in N}$ is a subgroup of $G$, $N triangle.l H N$, $H sect N triangle.l H$, and_
$ H N \/ N tilde.equiv H \/ (H sect N). $

*Proof sketch.* Define $phi: H -> H N \/ N$ by $phi(h) = h N$. This is a surjective homomorphism with $ker(phi) = H sect N$. Apply the First Isomorphism Theorem.

=== 34.4 Third Isomorphism Theorem

_Let $N triangle.l G$ and $M triangle.l G$ with $N leq M$. Then $M \/ N triangle.l G \/ N$ and_
$ (G \/ N) \/ (M \/ N) tilde.equiv G \/ M. $

*Proof sketch.* Define $phi: G \/ N -> G \/ M$ by $phi(g N) = g M$. This is a well-defined surjective homomorphism with $ker(phi) = M \/ N$. Apply the First Isomorphism Theorem.

=== 34.5 Correspondence Theorem

_Let $N triangle.l G$. There is a bijection between subgroups of $G$ containing $N$ and subgroups of $G \/ N$, given by $H mapsto H \/ N$. This bijection preserves normality: $H triangle.l G$ if and only if $H \/ N triangle.l G \/ N$._

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

Every normal series is subnormal, but not conversely.

=== 35.2 Definition (Refinement)

A *refinement* of a subnormal series $S$ is a subnormal series $S'$ obtained by inserting additional subgroups into $S$. Formally, $S'$ is a refinement of $S$ if every group in $S$ appears in $S'$.

Two subnormal series are *equivalent* if they have the same length and their factor groups are isomorphic in some order (i.e., there is a bijection between the sets of factor groups such that corresponding factors are isomorphic).

=== 35.3 Example

For $G = ZZ_(18)$, the series
$ {0} < angle.l 9 angle.r < angle.l 3 angle.r < ZZ_(18) $
has factor groups $ZZ_3, ZZ_3, ZZ_2$, while
$ {0} < angle.l 6 angle.r < angle.l 2 angle.r < ZZ_(18) $
has factor groups $ZZ_3, ZZ_2, ZZ_3$. These are equivalent.

= Lecture 4: Zassenhaus Lemma and Schreier's Theorem

== Zassenhaus (Butterfly) Lemma

=== 35.7 Zassenhaus Lemma

_Let $H' triangle.l H leq G$ and $K' triangle.l K leq G$. Then:_
- _$H'(H sect K') triangle.l H'(H sect K)$_
- _$K'(K sect H') triangle.l K'(K sect H)$_
- _$H'(H sect K) \/ H'(H sect K') tilde.equiv K'(K sect H) \/ K'(K sect H')$_
- _$(H sect K) \/ (H sect K')(H' sect K) tilde.equiv (H sect K) \/ (H' sect K)(H sect K')$_

The name "butterfly" comes from the diamond-shaped diagram formed by the subgroups involved.

*Proof.* The key observation is that both quotients are isomorphic to $(H sect K) \/ ((H' sect K)(H sect K'))$. This follows by applying the Second Isomorphism Theorem carefully.

== Schreier's Theorem

=== 35.11 Schreier's Theorem

_Any two subnormal series of a group $G$ have equivalent refinements._

*Proof.* Let
$ {e} = H_0 triangle.l H_1 triangle.l dots.c triangle.l H_m = G $
and
$ {e} = K_0 triangle.l K_1 triangle.l dots.c triangle.l K_n = G $
be two subnormal series. Define
$ H_(i, j) = H_i (H_(i+1) sect K_j) $
for $0 leq i leq m-1$ and $0 leq j leq n$. Inserting these between $H_i$ and $H_(i+1)$ (using the Zassenhaus Lemma to verify each inclusion is normal) gives a refinement of the first series. Similarly define $K_(i,j) = K_j(K_(j+1) sect H_i)$ for the second. The Zassenhaus Lemma then gives $H_(i,j+1) \/ H_(i,j) tilde.equiv K_(j,i+1) \/ K_(j,i)$, establishing equivalence.

= Lecture 5: Jordan-Hölder Theorem and Commutator Subgroups

== Composition Series and the Jordan-Hölder Theorem

=== 35.12 Definition (Composition Series)

A subnormal series $\{e\} = H_0 triangle.l H_1 triangle.l dots.c triangle.l H_n = G$ is a *composition series* if each factor group $H_(i+1) \/ H_i$ is *simple* (has no proper nontrivial normal subgroups). The factor groups are called *composition factors*.

A group $G$ is *simple* if $G != \{e\}$ and the only normal subgroups are $\{e\}$ and $G$ itself.

Not every group has a composition series (e.g., $ZZ$ does not), but every finite group does.

=== Example: Using Schreier's Algorithm

To find equivalent refinements of
$ \{0\} < angle.l 6 angle.r < ZZ_(24) quad "and" quad \{0\} < angle.l 4 angle.r < ZZ_(24) $
insert subgroups $H_(0,j) = \{0\}(angle.l 6 angle.r sect K_j)$ and $K_(0,j) = \{0\}(angle.l 4 angle.r sect H_j)$ using the Zassenhaus construction.

=== 35.15 Jordan-Hölder Theorem

_If $G$ is a group with a composition series, then any two composition series of $G$ are equivalent (same length, same composition factors up to order and isomorphism)._

*Proof.* Any two composition series are subnormal series. By Schreier's Theorem they have equivalent refinements. But a refinement of a composition series can only introduce trivial factors $H \/ H tilde.equiv \{e\}$, so the refinement does not add new nontrivial factors. Hence the original series are already equivalent.

The Jordan-Hölder theorem says composition factors are intrinsic invariants of a group, analogous to prime factorisation for integers.

== Commutator Subgroups

=== Definition (Commutator)

For $a, b in G$, the *commutator* of $a$ and $b$ is $[a, b] = a^(-1) b^(-1) a b$. Note $[a, b] = e$ iff $a b = b a$.

The *commutator subgroup* (or *derived subgroup*) of $G$ is $[G, G] = G' = angle.l [a, b] mid(|) a, b in G angle.r$, the subgroup generated by all commutators. We have $G' triangle.l G$ and $G \/ G'$ is abelian. Moreover, $G \/ G'$ is the *largest abelian quotient* of $G$: if $N triangle.l G$ and $G \/ N$ is abelian, then $G' leq N$.

= Lecture 6: Solvable and Nilpotent Groups (End of Chapter 35)

== Solvable Groups

=== Definition (Solvable Group)

A group $G$ is *solvable* if it has a subnormal series with abelian factor groups, i.e., there exist subgroups
$ \{e\} = G_0 triangle.l G_1 triangle.l dots.c triangle.l G_n = G $
with each $G_(i+1) \/ G_i$ abelian.

Equivalently, $G$ is solvable iff its *derived series* $G^((0)) = G supset.eq G^((1)) = G' supset.eq G^((2)) = [G', G'] supset.eq dots.c$ eventually reaches $\{e\}$.

=== Examples

- Every abelian group is solvable (take $\{e\} triangle.l G$, with factor $G$ abelian).
- $S_3$ is solvable: $\{e\} triangle.l A_3 = ZZ_3 triangle.l S_3$, with factors $ZZ_3$ and $ZZ_2$.
- $S_4$ is solvable via $\{e\} triangle.l V_4 triangle.l A_4 triangle.l S_4$ where $V_4 = \{e, (12)(34), (13)(24), (14)(23)\}$.
- $S_n$ for $n geq 5$ is *not* solvable (since $A_n$ is simple and non-abelian for $n geq 5$).

=== Theorem

_Subgroups and quotient groups of solvable groups are solvable. An extension of solvable groups is solvable: if $N triangle.l G$ with $N$ and $G \/ N$ both solvable, then $G$ is solvable._

== Nilpotent Groups

=== Definition (Lower Central Series)

The *lower central series* of $G$ is defined by $G_0 = G$ and $G_(i+1) = [G, G_i] = angle.l [g, x] mid(|) g in G, x in G_i angle.r$.

A group $G$ is *nilpotent* if its lower central series reaches $\{e\}$, i.e., $G_c = \{e\}$ for some $c$ (called the *nilpotency class*).

=== Examples

- Every abelian group is nilpotent of class $leq 1$ (since $G_1 = [G, G] = \{e\}$ iff $G$ is abelian).
- Every nilpotent group is solvable (but not conversely: $S_3$ is solvable but not nilpotent).
- Every $p$-group (group of order $p^n$ for a prime $p$) is nilpotent.
- The quaternion group $Q_8$ is nilpotent of class 2.

=== Theorem

_Subgroups, quotients, and finite direct products of nilpotent groups are nilpotent. A finite group is nilpotent iff it is a direct product of its Sylow $p$-subgroups._

= Lecture 7: Introduction to Sylow Theory — Group Actions (Chapter 36)

== Group Actions

=== Definition (Group Action)

A *group action* of a group $G$ on a set $S$ is a map $G times S -> S$, written $(g, s) mapsto g dot.c s$, such that:
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

=== Beginning of Cauchy's Theorem

*36.3 Cauchy's Theorem* states: _If $G$ is a finite group and $p$ is a prime dividing $|G|$, then $G$ has an element of order $p$._

*Proof setup.* Consider the set $S = \{(a_1, dots, a_p) in G^p mid(|) a_1 a_2 dots.c a_p = e\}$. Then $|S| = |G|^(p-1)$ since we may choose $a_1, dots, a_(p-1)$ freely and $a_p$ is determined. Let $ZZ_p$ act on $S$ by cyclic permutation: $1 dot.c (a_1, dots, a_p) = (a_2, dots, a_p, a_1)$.

= Lecture 8: Cauchy's Theorem, Normalisers, and the Very Useful Lemma

== Proof of Cauchy's Theorem

*Continuation.* The cyclic group $ZZ_p$ acts on $S = \{(a_1, dots, a_p) in G^p mid(|) a_1 dots.c a_p = e\}$ by cyclic shift. A tuple is fixed iff $a_1 = a_2 = dots.c = a_p$, i.e., $a_1^p = e$. Since $|S| = |G|^(p-1)$ and $p mid |G|$, we have $p mid |S|$. Orbits have size 1 or $p$ (sizes divide $|ZZ_p| = p$). The number of fixed points is $|S| - p dot.c("number of orbits of size" p)$, so $p$ divides the number of fixed points. The tuple $(e, dots, e) in S$ is always fixed, so there is at least one other fixed point $(a, a, dots, a)$ with $a != e$ and $a^p = e$. Thus $G$ has an element of order $p$. $square$

== Normalisers

=== Definition (Normaliser)

The *normaliser* of a subgroup $H$ in $G$ is
$ N_G(H) = \{g in G mid(|) g H g^(-1) = H\} = \{g in G mid(|) g H = H g\}. $
This is the largest subgroup of $G$ in which $H$ is normal. We have $H triangle.l N_G(H) leq G$.

=== 36.6 Very Useful Lemma

_Let $P$ be a $p$-subgroup of a finite group $G$ (i.e., $|P| = p^k$ for some $k geq 0$). Let $\mathcal{C}$ be the set of left cosets of a subgroup $H$ in $G$. Let $P$ act on $\mathcal{C}$ by left multiplication: $x dot.c (g H) = (x g) H$. If $g H$ is a fixed point of this action, then $g^(-1) P g leq H$. In particular, if $|\mathcal{C}|$ is not divisible by $p$, then $P$ is conjugate to a subgroup of $H$._

=== 36.7 Corollary

_If $P$ is a $p$-subgroup of $G$ and $P$ is not contained in the normaliser $N_G(P)$, then $p$ divides $[G : N_G(P)]$. The number of conjugates of $P$ in $G$ is $[G : N_G(P)]$._

= Lecture 9: First and Second Sylow Theorems

== Sylow Subgroups

=== Definition (Sylow $p$-subgroup)

Let $G$ be a finite group with $|G| = p^n m$ where $p$ is prime and $gcd(p, m) = 1$. A *Sylow $p$-subgroup* of $G$ is a subgroup of order $p^n$ (a maximal $p$-subgroup).

=== 36.8 First Sylow Theorem

_Let $G$ be a finite group with $|G| = p^n m$ and $gcd(p, m) = 1$. Then $G$ has at least one Sylow $p$-subgroup. Moreover, for each $0 leq k leq n$, $G$ has a subgroup of order $p^k$._

*Proof.* By induction on $|G|$. The class equation gives $|G| = |Z(G)| + sum [G : C_G(x)]$. If $p mid |Z(G)|$, then by Cauchy's theorem $Z(G)$ has an element $a$ of order $p$; $angle.l a angle.r triangle.l G$ and $|G \/ angle.l a angle.r| = |G| \/ p$, so by induction $G \/ angle.l a angle.r$ has a Sylow $p$-subgroup $P'$ of order $p^(n-1)$; the preimage in $G$ has order $p^n$. If $p nmid |Z(G)|$ then some term $[G : C_G(x)]$ is not divisible by $p$, so $p^n mid |C_G(x)|$; apply induction to $C_G(x)$.

=== 36.10 Second Sylow Theorem

_Any two Sylow $p$-subgroups of $G$ are conjugate: if $P$ and $P'$ are both Sylow $p$-subgroups, then $P' = g P g^(-1)$ for some $g in G$._

*Proof.* Let $P$ act on the set of left cosets of $P'$ by left multiplication. The total number of cosets is $[G : P'] = m$, which is not divisible by $p$. So some coset $g P'$ is fixed by all of $P$, meaning $P leq g P' g^(-1)$. Since $|P| = |P'| = p^n$, we get $P = g P' g^(-1)$.

= Lecture 10: Third Sylow Theorem and Applications

== Third Sylow Theorem and Simplicity

=== 36.11 Third Sylow Theorem

_The number $n_p$ of Sylow $p$-subgroups of $G$ satisfies:_
- _$n_p equiv 1 pmod{p}$_
- _$n_p mid m$ (where $|G| = p^n m$, $gcd(p,m) = 1$)_

*Proof.* By the Second Sylow Theorem, $G$ acts transitively on the set of Sylow $p$-subgroups by conjugation, so $n_p = [G : N_G(P)]$. Since $P leq N_G(P)$, we have $n_p mid [G : P] = m$. For the congruence, let $P$ act on the set of Sylow $p$-subgroups by conjugation. The only fixed point is $P$ itself, so all other orbits have size divisible by $p$, giving $n_p equiv 1 pmod{p}$.

=== Applications: Groups That Cannot Be Simple

*Groups of order $p q$ (distinct primes $p < q$).* We have $n_q mid p$ and $n_q equiv 1 pmod{q}$. Since $p < q$, the only option is $n_q = 1$, so the Sylow $q$-subgroup is normal and $G$ is not simple.

*Groups of order $30$.* $n_5 in \{1, 6\}$ and $n_3 in \{1, 10\}$. If $n_5 = 6$ and $n_3 = 10$ then we would need $6 times 4 + 10 times 2 = 44 > 30$ elements, contradiction. So $n_5 = 1$ or $n_3 = 1$, hence $G$ is not simple.

*Groups of order 12.* $n_3 in \{1, 4\}$. If $n_3 = 4$, then $G$ acts on the 4 Sylow 3-subgroups giving a homomorphism $G -> S_4$ with $|G| = 12 mid 24 = |S_4|$; the kernel is a normal subgroup. Either way, $G$ has a proper nontrivial normal subgroup.

= Lecture 11: Applications of Sylow Theory (Chapter 37)

== Classifying Groups of Small Order

=== Strategy

To classify all groups of a given order $n$:
1. Use Sylow theorems to constrain $n_p$ for each prime $p mid n$.
2. If some $n_p = 1$, that Sylow subgroup is normal — use semidirect products.
3. If $G = H N$ with $H sect N = \{e\}$ and $N triangle.l G$, then $G$ is a *semidirect product* $N rtimes H$, determined by the action $phi: H -> "Aut"(N)$ via $phi(h)(n) = h n h^(-1)$.

=== Example: Groups of Order 6

$|G| = 6 = 2 dot.c 3$. $n_3 = 1$, so $P_3 triangle.l G$ with $P_3 tilde.equiv ZZ_3$. $n_2 in \{1, 3\}$. If $n_2 = 1$: $G tilde.equiv ZZ_2 times ZZ_3 tilde.equiv ZZ_6$. If $n_2 = 3$: $G tilde.equiv S_3$.

=== Example: Groups of Order $p^2$

Any group of order $p^2$ is abelian (since $Z(G) != \{e\}$ for $p$-groups, and if $G \/ Z(G)$ is cyclic then $G$ is abelian). Thus groups of order $p^2$ are exactly $ZZ_(p^2)$ and $ZZ_p times ZZ_p$.

=== Semi-direct Products

The *internal semidirect product* $N rtimes_phi H$ for $N triangle.l G$, $H leq G$, $N H = G$, $N sect H = \{e\}$ has the product formula $(n_1, h_1)(n_2, h_2) = (n_1 phi(h_1)(n_2), h_1 h_2)$.

=== Example: Groups of Order 12

$12 = 2^2 dot.c 3$. $n_3 in \{1, 4\}$, $n_2 in \{1, 3\}$. The groups of order 12 are: $ZZ_(12)$, $ZZ_2 times ZZ_6$, $A_4$, $D_6$ (dihedral), and $"Dic"_3$ (dicyclic group).

= Lecture 12: Free Abelian Groups (Chapter 38, Part 1)

== Free Abelian Groups

=== 38.1 Definition (Free Abelian Group)

A group $F$ is a *free abelian group* with *basis* $B = \{a_i\}_(i in I)$ if every element of $F$ can be written uniquely as a finite sum $sum n_i a_i$ (with $n_i in ZZ$, almost all zero). Equivalently, $F tilde.equiv plus.circle.big_(i in I) ZZ$.

The *rank* of a free abelian group is the cardinality of a basis. The rank is well-defined (any two bases have the same cardinality).

=== Examples

$ZZ^n = ZZ times ZZ times dots.c times ZZ$ ($n$ copies) is a free abelian group of rank $n$ with basis $\{e_1, dots, e_n\}$ (standard basis vectors).

$ZZ_2$ is *not* free abelian: any generating set has the relation $2 dot.c [1] = 0$, so elements don't have unique representations over $ZZ$.

=== Universal Property

If $F$ is free abelian with basis $B$ and $A$ is any abelian group, then any function $f: B -> A$ extends uniquely to a group homomorphism $hat(f): F -> A$. This characterises free abelian groups up to isomorphism.

=== 38.6 Theorem (Subgroups of Free Abelian Groups)

_Every subgroup of a free abelian group of rank $n$ is free abelian of rank $leq n$._

*Proof (first part).* Let $F$ have basis $\{x_1, dots, x_n\}$ and let $H leq F$. Define $H_k = H sect (ZZ x_1 plus.circle dots.c plus.circle ZZ x_k)$. We proceed by induction, constructing a basis for $H$ by finding generators for each $H_k$ from $H_(k-1)$.

= Lecture 13: Subgroup Structure and Theorem 38.11

== Completing the Subgroup Theorem

=== 38.6 Theorem (completed)

_Every subgroup $H$ of a free abelian group $F$ of rank $n$ is itself free abelian of rank $m leq n$, and there exists a basis $\{y_1, dots, y_n\}$ of $F$ and positive integers $d_1 mid d_2 mid dots.c mid d_m$ such that $\{d_1 y_1, dots, d_m y_m\}$ is a basis for $H$._

The key step uses that if we project $H_k$ to the $x_k$-coordinate, the image is a subgroup of $ZZ$, hence of the form $d ZZ$ for some $d geq 0$; choosing a preimage of $d$ adds a new basis element.

=== 38.9 Theorem (Smith Normal Form — statement)

_Any $m times n$ integer matrix $A$ can be reduced to *Smith normal form* $D = "diag"(d_1, d_2, dots, d_r, 0, dots, 0)$ by integer row and column operations (i.e., multiplying on left and right by invertible integer matrices), where $d_1 mid d_2 mid dots.c mid d_r > 0$._

This is used in the proof of the Fundamental Theorem but we do not prove it here.

=== 38.11 Theorem

_Let $F$ be a finitely generated free abelian group and $H leq F$. Then there is a basis $\{y_1, dots, y_n\}$ for $F$ and $d_1 mid d_2 mid dots.c mid d_m$ (positive integers, $m leq n$) such that $\{d_1 y_1, dots, d_m y_m\}$ is a basis for $H$._

*Proof idea.* Write the inclusion $H -> F$ in terms of bases; this gives an integer matrix. Apply Smith Normal Form (Theorem 38.9) to simultaneously change the basis for $F$ and $H$ to achieve the diagonal form with divisibility.

=== Example

For $F = ZZ^2$ and $H = angle.l (2, 0), (0, 6), (3, 3) angle.r$, the matrix of generators is $mat(2, 0; 0, 6; 3, 3)$. Applying Smith Normal Form gives $d_1 = 1, d_2 = 6$ (or similar), yielding a basis change making the structure apparent.

= Lecture 14: Proof of Theorem 38.11

== Full Proof of Theorem 38.11

=== Proof

By the basis $\{x_1, dots, x_n\}$ for $F$, generators of $H$ can be written as an $m times n$ integer matrix $A$ (rows = generators). Applying Smith Normal Form transformations corresponds to:
- *Row operations*: changing the generating set of $H$ (using invertible integer matrices in $"GL"_m(ZZ)$)
- *Column operations*: changing the basis of $F$ (using invertible integer matrices in $"GL"_n(ZZ)$)

After reduction, $H$ has generators $d_1 y_1, dots, d_r y_r$ where $\{y_i\}$ extends to a basis of $F$ and $d_1 mid dots.c mid d_r$. Since $H$ is generated by these elements (and they are independent as $d_i > 0$), they form a basis for $H$. $square$

= Lecture 15: Fundamental Theorem of Finitely Generated Abelian Groups and Introduction to Free Groups

== Fundamental Theorem

=== 38.12 Fundamental Theorem of Finitely Generated Abelian Groups

_Every finitely generated abelian group $G$ is isomorphic to a direct sum_
$ G tilde.equiv ZZ^r plus.circle ZZ_(d_1) plus.circle ZZ_(d_2) plus.circle dots.c plus.circle ZZ_(d_t) $
_where $r geq 0$ (the *free rank* or *Betti number*) and $d_1 mid d_2 mid dots.c mid d_t geq 2$. The integer $r$ and the sequence $d_1, dots, d_t$ are uniquely determined by $G$._

*Proof (existence).* Since $G$ is finitely generated abelian, there is a surjective homomorphism $phi: F -> G$ where $F = ZZ^n$ for some $n$. Let $H = ker(phi)$, so $G tilde.equiv F \/ H$ by the First Isomorphism Theorem. By Theorem 38.11, choose bases $\{y_1, dots, y_n\}$ for $F$ and $d_1 mid dots.c mid d_m$ such that $H = angle.l d_1 y_1, dots, d_m y_m angle.r$. Then
$ G tilde.equiv F \/ H tilde.equiv (ZZ \/ d_1 ZZ) plus.circle dots.c plus.circle (ZZ \/ d_m ZZ) plus.circle ZZ^(n-m). $
Discarding $ZZ \/ 1 ZZ = \{0\}$ factors (those with $d_i = 1$) and separating the $ZZ^(n-m)$ gives the result.

*Uniqueness.* The rank $r$ is $"rank"(G \/ G_"tors")$ where $G_"tors"$ is the torsion subgroup. Uniqueness of $d_i$ uses the Smith Normal Form uniqueness (not proved).

=== Alternative: Invariant Factor vs Primary Decomposition

Equivalently, each $ZZ_(d_i)$ can be decomposed by the Chinese Remainder Theorem into primary cyclic groups $ZZ_(p^k)$, giving the *primary decomposition*:
$ G tilde.equiv ZZ^r plus.circle plus.circle.big_p plus.circle.big_k ZZ_(p^(a_(p,k))) $

== Introduction to Free Groups (Chapter 39)

=== Motivation

We want a group freely generated by a set — where the only relations are those forced by the group axioms.

=== 39.1 Definition (Words)

Let $A$ be a set (the *alphabet*). Form the set $A union A^(-1)$ where $A^(-1) = \{a^(-1) mid a in A\}$ is a disjoint copy. A *word* on $A$ is a finite sequence $(a_1^(epsilon_1), dots, a_n^(epsilon_n))$ with $a_i in A$ and $epsilon_i = plus.minus 1$, including the empty word $e$.

A word is *reduced* if it contains no consecutive letters $a a^(-1)$ or $a^(-1) a$.

=== 39.6 Example

On $A = \{a, b\}$: the word $a b b^(-1) a^(-1) a$ reduces to $a$ (cancel $b b^(-1)$, then $a^(-1) a$). Two words represent the same element of the free group iff one reduces to the other.

= Lecture 16: Free Groups and Group Presentations (Chapters 39--40)

== Free Groups

=== 39.7 Definition (Free Group)

The *free group* $F(A)$ on a set $A$ is the group of reduced words on $A union A^(-1)$, with multiplication by concatenation followed by reduction. The identity is the empty word.

$F(A)$ has the *universal property*: for any group $G$ and any function $f: A -> G$, there is a unique group homomorphism $hat(f): F(A) -> G$ extending $f$.

Free groups are characterised up to isomorphism by this universal property. The *rank* of $F(A)$ is $|A|$.

=== Properties

- $F(A)$ is infinite if $|A| geq 1$ (the word $a, a^2, a^3, dots$ are all distinct).
- $F(\{a\}) tilde.equiv ZZ$ (infinite cyclic group).
- $F(A)$ is non-abelian if $|A| geq 2$ (e.g., $a b != b a$ in $F(\{a,b\})$).
- Every group is a quotient of a free group (every group is finitely generated, map $F(A) -> G$ surjectively).
- Subgroups of free groups are free (Nielsen-Schreier theorem).

=== 39.12 Theorem

_If $|A| = |A'|$ then $F(A) tilde.equiv F(A')$; the rank is well-defined._

== Group Presentations

=== 40.1 Definition (Group Presentation)

A *presentation* of a group $G$ is an expression $G = angle.l A mid R angle.r$ where:
- $A$ is a set of *generators*
- $R subset F(A)$ is a set of *relators* (words that equal $e$ in $G$)

$G tilde.equiv F(A) \/ N(R)$ where $N(R)$ is the normal closure of $R$ in $F(A)$ (smallest normal subgroup containing $R$).

*Relations* are written as equations $r = e$ or equivalently $u = v$ (meaning $u v^(-1) in N(R)$).

=== Examples

- $ZZ_n = angle.l a mid a^n angle.r$: cyclic group of order $n$.
- $ZZ = angle.l a mid angle.r$: infinite cyclic group (no relations).
- $S_3 = angle.l a, b mid a^3 = e, b^2 = e, b a b^(-1) = a^(-1) angle.r$: symmetric group on 3 elements.
- $D_n = angle.l r, s mid r^n = e, s^2 = e, s r s^(-1) = r^(-1) angle.r$: dihedral group of order $2n$.

=== 40.5 Von Dyck's Theorem

_If $G = angle.l A mid R angle.r$ and $H$ is a group with a map $A -> H$ satisfying all relations in $R$, then there is a unique surjective homomorphism $G -> H$._

This gives a way to prove two groups are isomorphic: show each is a quotient of the other.

= Lecture 17: Completing Group Presentations (Section 40)

== Further Results on Presentations

=== The Word Problem

Given a presentation $G = angle.l A mid R angle.r$, the *word problem* asks: is there an algorithm to decide whether a word in $A union A^(-1)$ represents the identity in $G$? In general this is undecidable (Novikov 1955), but it is decidable for many specific classes.

=== Tietze Transformations

Two presentations give isomorphic groups iff one can be obtained from the other by *Tietze transformations*:
1. Add a new generator $c$ and a relation $c = w$ (where $w$ is a word in existing generators).
2. Remove a generator $c$ if a relation $c = w$ exists (substituting $w$ for $c$ everywhere).
3. Add a relation that is a consequence of the existing relations.
4. Remove a relation that is a consequence of others.

=== 40.11 Example: Free Products with Amalgamation

The *free product* $G * H$ has presentation $angle.l A_G union A_H mid R_G union R_H angle.r$ where $A_G, A_H$ are disjoint generators and $R_G, R_H$ are the respective relators.

A *free product with amalgamation* $G *_K H$ amalgamates over a common subgroup $K$, identifying the images of $K$ in $G$ and $H$.

=== Further Examples of Presentations

*Quaternion group $Q_8$:* $angle.l i, j mid i^4 = e, j^4 = e, i^2 = j^2, i j i^(-1) = j^(-1) angle.r$.

*Trefoil knot group:* $angle.l a, b mid a^2 = b^3 angle.r$ — fundamental group of the complement of the trefoil knot in $RR^3$.

*Finite presentations of infinite groups:* $ZZ^2 = angle.l a, b mid a b a^(-1) b^(-1) angle.r$ (abelian group, one commutator relation).

=== Abelianisation

The *abelianisation* of $G = angle.l A mid R angle.r$ is $G^"ab" = G \/ [G, G]$. It is obtained by adding all commutator relations $[a_i, a_j] = e$ to the presentation:
$ G^"ab" = angle.l A mid R union \{[a_i, a_j] mid a_i, a_j in A\} angle.r. $
The abelianisation is the largest abelian quotient of $G$.

=== Summary of Key Themes

The course has explored the structure of groups through:
- *Quotient constructions* (Isomorphism Theorems, normal series)
- *Composition structure* (Jordan-Hölder: composition factors are intrinsic)
- *Structural properties* (solvable, nilpotent groups — links to Galois theory)
- *Sylow theory* (Sylow $p$-subgroups, applications to simplicity and classification)
- *Free constructions* (free abelian groups, free groups, presentations)
- *Fundamental Theorem of Finitely Generated Abelian Groups* (complete classification)
