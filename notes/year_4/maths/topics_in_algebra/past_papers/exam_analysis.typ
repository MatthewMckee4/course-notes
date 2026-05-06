#set document(title: "Topics in Algebra — Past Paper Analysis (2022-2025)")
#set page(margin: 30pt)
#set text(size: 11pt)
#set heading(numbering: none)

#align(center)[
  #text(size: 18pt, weight: "bold")[Topics in Algebra]
  #v(2pt)
  #text(size: 14pt)[Past Paper Analysis (2022--2025)]
]

#v(8pt)

= Will Definitely Come Up (4-for-4 across 2022--2025)

== 1. Sylow theorems applied to a specific group order

Every year has at least one Sylow computation question, usually on a
concrete order:

- *2022*: $|G| = 2600$ and general $p^2 q$
- *2023*: $|G| = 9045 = 3^3 dot 5 dot 67$
- *2024*: $|G| = 150 = 2 dot 3 dot 5^2$
- *2025*: order $p q$, plus $|G| = 5 dot 7 dot 59$

Tasks: compute possible $n_p$, find a normal Sylow subgroup, prove $G$ is
not simple, sometimes deduce the structure.

#strong[Practice the standard cases:] order $p q$, $p^2 q$, and
three-prime products.

== 2. Fundamental Theorem of Finitely Generated Abelian Groups

- *2022 A1*: invariant factors vs elementary divisors
- *2023 A2(ii) + B1(ii)*: state the theorem; apply Smith Normal Form to a
  matrix presentation
- *2024 A1(ii)*: count abelian groups of order 4
- *2025 A1(ii) + B2(i)*: count abelian groups of order 24; apply the
  structure theorem

Always-pattern: #emph["How many abelian groups of order $n$?"] or
#emph["Find invariant factors of this matrix."]

== 3. Group presentations (Section B, ~5--6 marks)

- *2022 B1(ii)*: bound the order from $chevron.l a, b | a^8, a^4 b^2, a b^(-1) a b chevron.r$
- *2023 B2(ii)*: show $|G| = 55$ from $chevron.l a, b | a^(11), b^5, b a b^(-1) = a^3 chevron.r$,
  identify as semidirect product
- *2024 B2(iii)*: Tietze-reduce a 4-generator presentation to 2 generators
- *2025 B2(iv)*: identify the familiar group from a presentation

#strong[Practice:] bounding $|G|$ via $a^k b^j$ normal form, Tietze
reductions, recognising semidirect products.

== 4. Subnormal / composition / principal series + Jordan-Hölder + Schreier

- *2022 A7*: principal series and refinements (MCQ)
- *2023 A1(ii)*: definitions
- *2024 A2(i) + B1(i)*: J-H statement; composition series of $ZZ_4 times ZZ_(10)$
- *2025 A2(ii) + B1(i)*: true/false on Schreier and J-H; refinements of a
  $ZZ_(90)$ series

#strong[Standard task:] build a composition series for a small abelian
group; refine two given series using Schreier.

== 5. Free and free abelian groups

There is always at least one part on these:

- Universal property (state it: *2023 A2(iii)*)
- Examples and non-examples (*2024 A1*, *2025 A1*)
- Counting homomorphisms $F(a, b) -> ZZ_n$ (*2024 B2(ii)*, *2025 B2(iii)*)
- $QQ$ or $S^1$ are not free abelian (*2024*, *2025*)

= Very Likely (3-of-4 or near-certain)

== 6. Solvable groups and the derived series

- *2022 B1(i)*: prove or disprove "$H$ and $G \/ H$ solvable $arrow.r.double$ $G$ solvable"
- *2023 A1(iii)*: characterise abelian / perfect / solvable via the derived
  series
- *2024 A1(i)(d)* and *2025 A1(i)(d)*: "give a solvable group" /
  "solvable but not abelian"

== 7. Cauchy's theorem and the $p$-group fixed-point lemma

- *2022 A6*: fixed points mod $p$
- *2023 B2(i)*: state-and-prove Cauchy's theorem; the lemma
  $|X^G| equiv |X| (mod p)$
- *2024 A2(iii)*: true/false on $p$-groups
- *2025 A2(ii)*: true/false on $|G| = p^2$

#strong[Memorise] the proof of Cauchy's theorem via the $ZZ_p$-action on
$p$-tuples with product $e$.

== 8. Examples / counterexamples opener (Section A, A1)

The 2024 and 2025 A1 questions are nearly identical:
#emph["Give a specific example of a free abelian group of rank 2 inside $ZZ^2$,
a group that is free and free abelian, a solvable group, a presentation of $ZZ_4$, $dots$"]

Expect 4--5 short examples for around 5 marks.

#strong[Have ready:] one example and one non-example for *every* term in
the glossary.

= Possible (rotating)

- *Specific dihedral / symmetric group analysis.* 2022 used $D_n$ for odd
  $n$; 2025 used $D_5$; 2024 used $S_3$. Expect at least one.
- *Universal property of quotients* (2023 A1(i)).
- *Automorphism groups / counting automorphisms* (2023 B2(ii)(d): bound
  $|"Aut"(G)|$).
- *Subgroup-of-$ZZ$-giving-a-quotient* — 2024 A1(iii) and 2025 A1(iii) are
  verbatim. Very likely to recur.

= Format Note

The *2022 paper used MCQ format* in Section A (with negative marking).
*2023, 2024, 2025 returned to traditional short-answer Section A.* Assume
the traditional format continues.

= Bottom Line — Drill These

#rect(inset: 10pt, stroke: 0.5pt, width: 100%)[
  + $n_p$-counting arguments for orders $p q$, $p^2 q$, and $p dot q dot r$.
  + Smith Normal Form on a $2 times 3$ or $3 times 3$ integer matrix.
  + Bounding $|G|$ from a presentation; identifying semidirect products.
  + Composition series and Schreier refinements on $ZZ_n$.
  + Statements of: Sylow I / II / III, Jordan-Hölder, FTFGAG, universal
    properties (free group, free abelian, quotient).
  + Proof of Cauchy's theorem.
  + Stockpile of examples for every glossary term.
]
