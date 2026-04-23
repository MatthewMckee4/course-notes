= Lecture 9: One-period binomial model and Arrow-Debreu securities

== Trading strategies recap

A _spread_ takes positions in two or more options of the same type; a _combination_ takes positions in both call and put options on the same stock. Investors use options for _hedging_ (reduce risk) or _speculation_ (profit from expected moves). Examples of spreads: bull, bear, butterfly. Examples of combinations: straddles, strips, straps. Pay-offs and price bounds for such strategies follow from no-arbitrage dominance and law of one price arguments.

== One-period binomial model

*Definition (One-period binomial model).* A market with two securities (a risky stock and a riskless bond) and a single period $t in {0, 1}$. The state at $t = 0$ is fixed; at $t = 1$ there are two possible states $U$ (Up) and $D$ (Down).

Let $B : {U, D} arrow.r RR$ denote the bond price at $t = 1$ (price $pi_0 > 0$ at $t = 0$), $S : {U, D} arrow.r RR$ the stock price at $t = 1$ (price $pi_1 > 0$ at $t = 0$), and $r$ the risk-free rate.

Since the bond is riskless, $B(U) = B(D) = pi_0 (1 + r)$. Write $S(U) = pi_1 u$ and $S(D) = pi_1 d$, so
$ u = S(U) / pi_1, quad d = S(D) / pi_1, $
with convention $u >= d$. We assume
$ 0 < d <= 1 + r <= u. $

#table(columns: 3,
  [State $omega$], [Bond $B(omega)$], [Stock $S(omega)$],
  [$U$], [$pi_0 (1 + r)$], [$pi_1 u$],
  [$D$], [$pi_0 (1 + r)$], [$pi_1 d$],
)

A portfolio $(xi_0, xi_1)$ has values
$ V_0 = xi_0 pi_0 + xi_1 pi_1, quad V_1(omega) = xi_0 pi_0 (1 + r) + xi_1 S(omega). $

*Lemma.*
+ $V_1(U) = V_1(D)$ iff $u = d$.
+ If $u > d$, $V_1(U) = 1$, $V_1(D) = 0$ force $xi_1 = xi_(1,U) := 1 / (pi_1 (u - d))$ and $xi_0 = xi_(0,U) := -d / ((u - d)(1 + r) pi_0)$.
+ If $V_1(U) = 0$, $V_1(D) = 1$, then $xi_1 = xi_(1,D) := 1 / (pi_1 (d - u))$ and $xi_0 = xi_(0,D) := u / ((u - d)(1 + r) pi_0)$.

*Proof of 1.* $V_1(U) = V_1(D)$ gives $xi_1 (S(U) - S(D)) = 0$, so (for generic $xi_1$) $pi_1 u = pi_1 d$. Converse is immediate. #h(1fr) $square$

*Proof of 2.* The system
$ 1 = xi_0 pi_0 (1 + r) + xi_1 pi_1 u, quad 0 = xi_0 pi_0 (1 + r) + xi_1 pi_1 d $
gives $xi_1 pi_1 (u - d) = 1$ and then $xi_0 = -d / ((u - d)(1 + r) pi_0)$. Part 3 is analogous. #h(1fr) $square$

== Vocabulary

*Definition (Contingent claim).* A pay-off that depends on the realised state of the world.

*Definition (Derivative).* A financial contract whose pay-off is a function of underlying variables at a future date. All derivatives are contingent claims (e.g. forwards, calls, puts).

*Definition (Security).* A contingent claim traded in the market at a given price. Options are securities; forwards (privately negotiated) typically are not.

== Arrow-Debreu securities

*Definition (Arrow-Debreu).* A security with pay-off $1$ in one state of the world and $0$ in all others.

In the one-period binomial model the two A-D securities are
$ phi^U (omega) = cases(1\, quad omega = U, 0\, quad omega = D), quad phi^D (omega) = cases(0\, quad omega = U, 1\, quad omega = D). $

*Definition (Replicating portfolio).* A portfolio of traded assets that matches the pay-off of a target asset in all states. By the law of one price, its $t = 0$ value equals the target's $t = 0$ value.

To find A-D prices, solve
$ a = xi_0 pi_0 (1 + r) + xi_1 pi_1 u, quad b = xi_0 pi_0 (1 + r) + xi_1 pi_1 d $
for $(a, b) = (1, 0)$ and $(0, 1)$ using the lemma above.

*Proposition (A-D prices).*
$ pi_(phi^U) &= xi_(0,U) pi_0 + xi_(1,U) pi_1 = 1/(u - d) dot 1/(1 + r) (1 + r - d), \
pi_(phi^D) &= xi_(0,D) pi_0 + xi_(1,D) pi_1 = 1/(u - d) dot 1/(1 + r) (u - (1 + r)). $

*Proposition (General pay-off).* The price of a claim with $V_1(U) = a$, $V_1(D) = b$ is
$ V_0 = a dot pi_(phi^U) + b dot pi_(phi^D) = 1/(u - d) dot 1/(1 + r) (a ((1 + r) - d) + b (u - (1 + r))). $

*Proof.* $V_1 = a phi^U + b phi^D$; apply law of one price. #h(1fr) $square$

== Pay-off matrix

*Definition.* With states $omega_1, dots, omega_n$ and $m + 1$ assets (1 riskless, $m$ risky), the _pay-off matrix_ is
$ X = mat(
  pi_0 (1 + r), S^1(omega_1), dots, S^m(omega_1);
  pi_0 (1 + r), S^1(omega_2), dots, S^m(omega_2);
  dots.v, dots.v, dots.down, dots.v;
  pi_0 (1 + r), S^1(omega_n), dots, S^m(omega_n);
). $
Columns = assets, rows = states.

In the one-period binomial model, $X = mat(pi_0 (1 + r), pi_1 u; pi_0 (1 + r), pi_1 d)$, so
$ mat(V_1(U); V_1(D)) = X mat(xi_0; xi_1). $

To replicate any pay-off we need $X$ invertible — the market is then _complete_. More generally, completeness holds if $"rank" X = n$.

*Example (Square $X$).* With price vector $p$ and pay-off vector $x$,
$ pi_x = p dot X^(-1) x = (X^(-T) p) dot x, $
and $X^(-T) p$ is the vector of A-D prices.

In the one-period binomial case,
$ X^(-T) p &= 1 / (pi_0 pi_1 (1 + r)(d - u)) mat(pi_1 d, -pi_0 (1 + r); -pi_1 u, pi_0 (1 + r)) mat(pi_0; pi_1) \
&= 1 / ((1 + r)(u - d)) mat(1 + r - d; u - (1 + r)) = mat(pi_(phi^U); pi_(phi^D)), $
recovering the earlier prices.

== Arrow-Debreu: worked examples

*Example.* Stock $pi_1 = 20$, $S(U) = 22$, $S(D) = 18$, $r = 0.04$. So $u = 1.1$, $d = 0.9$. A claim paying £100 if $U$ and £50 if $D$ (or $-50$ as in the original shorting example):
$ pi_phi = 100 times underbrace(0.14/(0.2 dot 1.04), pi_(phi^U)) - 50 times underbrace(0.06/(0.2 dot 1.04), pi_(phi^D)) approx 52.88. $

*Example.* $pi_1 = 300$, $S(U) = 360$, $S(D) = 270$, $r = 0.02$, so $u = 1.2$, $d = 0.9$. Pays £500 if $U$, £200 if $D$. Then
$ pi_(phi^U) = 0.12/0.306 approx 0.392, quad pi_(phi^D) = 0.18/0.306 approx 0.588, $
so $pi_phi approx 500 (0.392) + 200 (0.588) approx 313.65$.

== European call in the one-period binomial model

European call with strike $X$ and expiry at $t = 1$ has pay-off $C(omega) = max{S(omega) - X, 0}$.

*Example.* $pi_1 = £100$, $S(U) = £120$, $S(D) = £105$, $r = 8%$, $X = £110$. Then $a = 10$, $b = 0$, $u = 1.20$, $d = 1.05$, $1 + r = 1.08$, so
$ pi_(phi^U) = 0.03/(0.15 dot 1.08) = 0.1852, quad pi_(phi^D) = 0.12/(0.15 dot 1.08) = 0.7407, $
giving $pi_C = 10(0.1852) = 1.85$. The call costs £1.85. This is the no-arbitrage price — insensitive to the actual probabilities. (Exercise: price the put and verify put-call parity.)

== No arbitrage

If $d > 1 + r$, then $phi^U >= 0$ with $phi^U(U) > 0$ and yet $pi_(phi^U) < 0$ — arbitrage. So arbitrage-freeness forces $d <= 1 + r$; similarly $u >= 1 + r$ (using $phi^D$). This justifies the earlier assumption.

== Risk-neutral probabilities

A-D prices follow from the law of one price alone, not from any probabilities. However,
$ pi_(phi^U) + pi_(phi^D) = 1/(1 + r). $
Set $tilde(p) = (1 + r) pi_(phi^U)$, $tilde(q) = (1 + r) pi_(phi^D)$; then $tilde(p) + tilde(q) = 1$, so they form a probability.

*Lemma.* Under $(tilde(p), tilde(q))$,
$ EE(S) &= tilde(p) pi_1 u + tilde(q) pi_1 d \
&= pi_1 u dot (1 + r - d)/(u - d) + pi_1 d dot (u - (1 + r))/(u - d) = pi_1 (1 + r). $

The expected stock price equals the riskless growth of $pi_1$; hence $tilde(p), tilde(q)$ are the _risk-neutral probabilities_.

= Lecture 10: Probability spaces

Under the risk-neutral probabilities, $EE(S/(1+r)) = pi_1$ — this observation generalises to the _Fundamental Theorem of Asset Pricing_.

== Probability theory

To build more sophisticated market models we need measure theory.

*Definition (Sample space).* A non-empty set $Omega$ whose elements $omega$ are _elementary outcomes_ (e.g. states of the economy).

*Example.* $Omega = {H, T}$; $Omega = {1, dots, 6}$; $Omega = {U U, U D, D U, D D}$; $Omega = NN$ (countably infinite); $Omega = {(x_n)_n | x_n in {U, D}}$ (uncountable); $Omega = RR$.

*Definition (Random event).* A subset $A subset.eq Omega$. Event $A$ _occurs_ if the realised $omega_0 in A$. Complement $A^c = Omega without A$ is the event "$A$ does not occur". For a family $(A_i)_(i in I)$, $union.big_i A_i$ is "at least one occurs" and $inter.big_i A_i$ is "every one occurs".

*Example.* $Omega = {1, dots, 6}$: $A = {1,3,5}$ is "odd"; $B = {2,3,5}$ is "prime"; $A union B = {1,2,3,5}$; $A inter B = {3, 5}$.

*Probability.* $P(A)$ measures the likelihood of $A$; $P(Omega) = 1$, $P(nothing) = 0$. Non-empty events can still satisfy $P(A) = 0$.

Ideally we'd assign a probability to every subset (i.e. use the power set $cal(P)(Omega)$), but for $Omega = [0,1]$ not every subset is measurable.

== $sigma$-algebras

*Definition.* Let $Omega != nothing$. A nonempty $cal(F) subset.eq cal(P)(Omega)$ is a $sigma$-_algebra_ if:
+ $nothing in cal(F)$;
+ $A in cal(F) arrow.double A^c in cal(F)$;
+ $(A_i)_(i in NN) subset cal(F) arrow.double union.big_i A_i in cal(F)$.

*Examples.* $cal(P)(Omega)$ (usable when $Omega$ finite/countable); the trivial ${nothing, Omega}$. On $Omega = {H, T}$ these are the only two $sigma$-algebras.

*Check.* On $Omega = {H H, H T, T H, T T}$, $cal(F) = {nothing, {H H}, {H T}, {T H}, {T T}, {H H, T T}, {H H, T T, H T}, {H H, T T, T H}, Omega}$ is _not_ a $sigma$-algebra: e.g. ${H H, T T}^c = {H T, T H} in.not cal(F)$, and ${H H} union {H T} = {H H, H T} in.not cal(F)$.

*Lemma ($sigma$-algebra generated).* For $cal(K) subset.eq cal(P)(Omega)$ there is a smallest $sigma$-algebra $sigma(cal(K))$ containing $cal(K)$.

*Proof.* Let $cal(S) = {cal(F) : cal(F) "is a" sigma"-alg.", cal(K) subset.eq cal(F)}$ and $sigma(cal(K)) = inter.big_(cal(F) in cal(S)) cal(F)$. Each axiom is preserved under intersection: $nothing in cal(F)$ for all $cal(F) in cal(S)$; $A in sigma(cal(K))$ means $A in$ every $cal(F)$, so $A^c in$ every $cal(F)$, so $A^c in sigma(cal(K))$; similarly for countable unions. Minimality is immediate. #h(1fr) $square$

== Borel $sigma$-algebra

Interval notation: $(a, b), [a, b), (a, b], [a, b]$ with $(a, a) = nothing$, $[a, a] = {a}$, and $(a, infinity), [a, infinity)$.

*Definition.* $cal(B)(RR) := sigma({(a, b] | a <= b})$, and $cal(B)([0, infinity)) = {A inter [0, infinity) | A in cal(B)(RR)}$.

Using De Morgan, a $sigma$-algebra is also closed under countable intersections. Hence singletons lie in $cal(B)(RR)$:
$ {a} = inter.big_(n in NN) (a - 1/n, a] in cal(B)(RR), $
and closed intervals $[a, b] = {a} union (a, b] in cal(B)(RR)$. Open intervals $(a, b)$ are similarly in $cal(B)(RR)$.

== Probability measures

*Definition (Probability measure).* $P : cal(F) arrow.r [0, 1]$ with:
+ $P(Omega) = 1$, $P(nothing) = 0$;
+ countable additivity: for pairwise disjoint $(A_i) subset cal(F)$,
$ P(union.big_i A_i) = sum_i P(A_i). $
The triple $(Omega, cal(F), P)$ is a _probability space_.

*Example.* $Omega = {1, dots, n}$, $cal(F) = cal(P)(Omega)$, $P(A) = |A|/n$ (with $P(nothing) = 0$). Then $P(Omega) = 1$ and $P(union.big_i A_i) = (sum_i |A_i|)/n = sum_i P(A_i)$ for disjoint $A_i$ (the union is finite). #h(1fr) $square$

*Lemma.* For $(Omega, cal(F), P)$:
+ $P(A^c) = 1 - P(A)$;
+ $A subset.eq B arrow.double P(A) <= P(B)$;
+ $P(union.big_n A_n) <= sum_n P(A_n)$.

*Proof.*
+ $1 = P(Omega) = P(A) + P(A^c)$.
+ $P(B) = P(A) + P(B without A) >= P(A)$.
+ Set $B_1 = A_1$, $B_m = A_m without union.big_(i < m) B_i$. Then the $B_n$ are disjoint with $union.big_n B_n = union.big_n A_n$ and $B_n subset.eq A_n$, so $P(union.big_n A_n) = sum_n P(B_n) <= sum_n P(A_n)$. #h(1fr) $square$

*Intuition.* $Omega$ = elementary outcomes (possibly unobservable); $cal(F)$ = observable events; $P$ = consistent assignment of probabilities.

== Nullsets

*Definition.* $A subset.eq Omega$ is a $P$-_nullset_ if $A subset.eq B$ for some $B in cal(F)$ with $P(B) = 0$. A property holds $P$-_almost surely_ if its complement is a nullset. For $A in cal(F)$, $A$ holds a.s. iff $P(A) = 1$.

= Lecture 11: Random variables and one-period models

== Probability space example

$Omega = {U, D}$, $cal(F) = cal(P)(Omega)$, $P({U}) = p$. Then $P({D}) = 1 - p$, $P(nothing) = 0$, $P(Omega) = 1$.

== Random variables

Let $X : Omega arrow.r RR$ model an asset price. The _pre-image_
$ X^(-1)((a, b]) := {omega in Omega | X(omega) in (a, b]} $
is the event "$X in (a, b]$". We need $X^(-1)(B) in cal(F)$ for $B in cal(B)(RR)$.

*Definition (Random variable).* On $(Omega, cal(F), P)$, $X : Omega arrow.r RR$ (or $[0, infinity)$) with $X^(-1)(B) in cal(F)$ for all $B in cal(B)(RR)$. Equivalently, $X$ is _measurable_.

Shorthand: $P(X = k) = P(X^(-1)({k}))$, $P(X >= k) = P(X^(-1)([k, infinity)))$. This defines the _law_ or _distribution_ of $X$.

More generally $X : Omega arrow.r E$ for any measurable space $(E, cal(F)_E)$.

== Integration

Build the integral in three steps.

1. For $A in cal(F)$ the indicator $1_A$ is a r.v.; set
$ integral_Omega 1_A d P = P(A). $

2. For disjoint $A_1, dots, A_n in cal(F)$ and $a_i in RR$,
$ integral_Omega sum_i a_i 1_(A_i) d P = sum_i a_i P(A_i). $

3. For general $X : Omega arrow.r [0, infinity)$,
$ integral_Omega X d P := sup {integral Y d P : 0 <= Y <= X, Y "step"}, $
when this exists.

*Definition.* $EE_P (X) := integral_Omega X(omega) d P(omega)$ is the _expected value_ of $X$ — the probability-weighted average of values.

*Example (finite).* $Omega = {omega_1, dots, omega_n}$, full $sigma$-algebra:
$ EE_P (X) = sum_i X(omega_i) P({omega_i}). $

*Example.* $Omega = {U, D}$, $P({U}) = p$, $X(U) = 1$, $X(D) = -1$: $EE(X) = p - (1 - p) = 2p - 1$.

*Example (two coin flips).* $Omega = {H H, H T, T H, T T}$, fair so each $P({omega}) = 1/4$, with $X(H H) = 50$, $X(H T) = X(T H) = 100$, $X(T T) = -750$. Then
$ EE_P (X) = 1/4 (50 + 100 + 100 - 750) = -125 = 50 dot 1/4 + 100 dot 1/2 + (-750) dot 1/4. $

*Example (Poisson).* $Omega = NN_0$, $cal(F) = cal(P)(Omega)$, $P({k}) = e^(-lambda) lambda^k / k!$, $X(k) = k$:
$ EE(X) = sum_(k = 0)^infinity k e^(-lambda) lambda^k / k! = lambda. $

*Example (Exponential).* $Omega = [0, infinity)$, $cal(F) = cal(B)([0, infinity))$, $P([t, infinity)) = e^(-lambda t)$ (extended via Carathéodory), $X(x) = x$:
$ EE(X) = integral_0^infinity P(X > t) d t = integral_0^infinity e^(-lambda t) d t = 1/lambda. $

== One-period models

*Definition (Price system).* With $d + 1$ assets, price at $t = 0$ is
$ overline(pi) = (pi_0, dots, pi_d) in RR^(d + 1), quad overline(pi) = (pi_0, pi), $
with $pi$ the risky assets and the $0$-th asset riskless.

Prices at $t = 1$ are r.v.s $S^0, dots, S^d$ on $(Omega, cal(F))$ into $[0, infinity)$.

*Riskless asset.* Fix $pi_0 = 1$ and $S^0(omega) = 1 + r$ for all $omega$, requiring $r > -1$ (so $S^0 > 0$). Write
$ overline(S) = (S^0, S), quad overline(pi) = (1, pi). $

*Definition (One-period market model).* $(Omega, cal(F), P, overline(pi), overline(S))$ where $(Omega, cal(F), P)$ is a probability space, $overline(pi) in RR^(d+1)$, and $overline(S)$ is a $(d+1)$-tuple of r.v.s to $[0, infinity)$.

*Example (binomial).* $Omega = {U, D}$, $cal(F) = cal(P)(Omega)$ with $P({U}), P({D}) > 0$ unspecified, $overline(pi) = (pi_0, pi_1)$, $overline(S) = (B, S)$ with $B(omega) = pi_0 (1 + r)$, $S(U) = u pi_1$, $S(D) = d pi_1$.

== Portfolios

A portfolio $overline(xi) = (xi_0, xi) = (xi_0, dots, xi_d) in RR^(d+1)$ has values
$ V(0) = overline(xi) dot overline(pi) = xi_0 + xi dot pi, quad V(omega) = overline(xi) dot overline(S)(omega) = xi_0 (1 + r) + xi dot S(omega). $

Components $xi_i$ may be negative: $xi_0 < 0$ is a loan (receive $|xi_0|$ now, repay $(1+r)|xi_0|$); $xi_i < 0$ for $i >= 1$ is short selling. In particular one can arrange $overline(xi) dot overline(pi) = 0$.

== Arbitrage

*Definition.* An _arbitrage opportunity_ is $overline(xi) in RR^(d+1)$ with
$ overline(xi) dot overline(pi) <= 0, quad overline(xi) dot overline(S) >= 0 space P"-a.s.", quad P(overline(xi) dot overline(S) > 0) > 0. $
Never lose, sometimes win, don't pay for it. Absence of arbitrage is the _efficient market hypothesis_. Absence of arbitrage implies $S^i = 0$ $P$-a.s. when $pi_i = 0$, so WLOG assume $pi_i > 0$ for $i >= 1$.

For countable $Omega$ with $P({omega}) > 0$ for all $omega$, arbitrage reduces to: $overline(xi) dot overline(pi) <= 0$, $overline(xi) dot overline(S)(omega) >= 0$ for all $omega$, and $> 0$ for some $omega_0$.

*Lemma.* The following are equivalent:
+ the market admits arbitrage;
+ there exists $xi in RR^d$ with $xi dot S >= (1 + r) xi dot pi$ $P$-a.s. and $P(xi dot S > (1 + r) xi dot pi) > 0$.

*Proof.* (1) $arrow.double$ (2): given arbitrage $overline(xi)^* = (xi_0^*, xi^*)$, $xi_0^* <= -xi^* dot pi$, so
$ xi^* dot S - (1 + r) xi^* dot pi >= xi^* dot S + (1 + r) xi_0^* = overline(xi)^* dot overline(S), $
inheriting the a.s. and positive-probability properties.

(2) $arrow.double$ (1): set $xi_0 = -xi dot pi$, so $overline(xi) dot overline(pi) = 0$ and
$ overline(xi) dot overline(S) = (-xi dot pi)(1 + r) + xi dot S = xi dot S - (1 + r) xi dot pi, $
which is an arbitrage by (2). #h(1fr) $square$
