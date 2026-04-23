= Lecture 12

== One-period market model

*Definition (One-period market model).* A tuple $(Omega, cal(F), P, overline(pi), overline(S))$ where $(Omega, cal(F), P)$ is a probability space, $overline(pi) in RR^(d+1)$ a price system, and $overline(S)$ a $(d+1)$-tuple of random variables $(Omega, cal(F)) -> [0, infinity)$.

*Definition (Portfolios).* $overline(xi) = (xi_0, xi) = (xi_0, xi_1, dots, xi_d) in RR^(d+1)$ records quantities held. Values (with $pi_0 = 1$):
$ V_0 = overline(xi) dot overline(pi) = xi_0 + xi dot pi, quad V_1(omega) = overline(xi) dot overline(S)(omega) = xi_0 (1 + r) + xi dot S(omega). $

== Arbitrage opportunities

*Definition (Arbitrage portfolio).* $overline(xi) in RR^(d+1)$ is an *arbitrage opportunity* if
$ overline(xi) dot overline(pi) <= 0, quad overline(xi) dot overline(S) >= 0 quad P"-a.s.", quad P[overline(xi) dot overline(S) > 0] > 0. $
Non-negative payoff everywhere, positive payoff with positive probability, at non-positive cost. Absence of arbitrage is the *efficient market hypothesis*.

== Properties of an arbitrage-free market

Any risky investment beating the riskless asset with positive probability must also carry downside risk.

*Lemma.* Equivalent:
+ The market admits an arbitrage.
+ There exists $xi in RR^d$ with $xi dot S >= (1 + r) xi dot pi$ $P$-a.s. and $P(xi dot S > (1 + r) xi dot pi) > 0$.

*Proof.* $(1 => 2)$: Let $overline(xi)^* = (xi_0^*, xi^*)$ be arbitrage, $v = xi^* dot pi$. From $0 >= xi_0^* + v$ we get $-v >= xi_0^*$, so
$ xi^* dot S - (1 + r) v >= xi^* dot S + (1 + r) xi_0^* = overline(xi)^* dot overline(S), $
inheriting the sign properties.

$(2 => 1)$: Set $xi_0 := -xi dot pi$, then $overline(xi) dot overline(pi) = 0$ and $overline(xi) dot overline(S) = xi dot S - (1 + r) xi dot pi$ has the required sign properties. #h(1fr) $square$

== Risk-neutral measures

*Definition (Risk-neutral measure).* A probability measure $Q$ on $(Omega, cal(F))$ is *risk-neutral* (or a *martingale measure*) if for all $i = 0, dots, d$,
$ pi_i = EE_Q [S_i / (1 + r)]. $
Expected discounted price equals initial price.

*Example (Poisson).* If $S ~ "Poisson"(lambda)$ under $P$, i.e. $P(S = k) = lambda^k / k! e^(-lambda)$, then $P$ is risk-neutral iff $pi_1 = EE_P[S] / (1 + r) = lambda / (1 + r)$.

*Example (One-period binomial).* Risky asset takes $u pi_1$ or $d pi_1$ at $t=1$. With $Q({"up"}) = tilde(p)$, $Q({"down"}) = tilde(q)$:
$ tilde(p) (u pi_1) / (1 + r) + tilde(q) (d pi_1) / (1 + r) = pi_1, quad tilde(p) + tilde(q) = 1 ==> tilde(p) = (1 + r - d) / (u - d), quad tilde(q) = (u - 1 - r) / (u - d). $
These need not match the real probabilities.

== Equivalent probability measures

*Definition.* $P tilde Q$ on $(Omega, cal(F))$ if they share null sets: $P(A) = 0 <==> Q(A) = 0$ for all $A in cal(F)$.

*Lemma.* $tilde$ is an equivalence relation; write $[P] = {Q "prob. measure on" (Omega, cal(F)) : Q tilde P}$.

*Example (Finite $Omega$).* If $Omega = {omega_1, dots, omega_n}$, $cal(F) = cal(P)(Omega)$, then $P tilde Q$ iff $P({omega_i}) = 0 <==> Q({omega_i}) = 0$ for every $i$. All strictly positive measures are equivalent; e.g. for uniform $P$, $[P] = {Q : Q({omega_i}) > 0 forall i}$. Equivalence concerns null sets, not equal probabilities.

== First Fundamental Theorem of Asset Pricing (FTAP)

*Theorem (FTAP).* $(Omega, cal(F), P, overline(pi), overline(S))$ is arbitrage-free iff $[P]$ contains a risk-neutral measure.

*Proof ($Q$ exists $=>$ arbitrage-free).* Let $Q tilde P$ be risk-neutral and suppose $overline(xi) dot overline(S) >= 0$ $P$-a.s. with $P(overline(xi) dot overline(S) > 0) > 0$. Equivalence transfers both to $Q$, so $EE_Q[overline(xi) dot overline(S)] > 0$. Then
$ overline(pi) dot overline(xi) = sum_(i=0)^d EE_Q [S_i / (1 + r)] xi_i = 1 / (1 + r) EE_Q [overline(xi) dot overline(S)] > 0, $
ruling out arbitrage. The converse is not in the course. #h(1fr) $square$

== FTAP examples

*Example (Finite $Omega$, single risky asset).* $Omega = {omega_1, dots, omega_n}$, $P({omega_i}) > 0$, $s_i = S^1(omega_i)$ distinct. By FTAP, arbitrage-free iff $exists q_i > 0$ with $sum q_i = 1$ and
$ pi_0 = EE_Q [S^0 / (1 + r)], quad pi_1 = EE_Q [S^1 / (1 + r)]. $
The first is automatic since $EE_Q[S^0 / (1+r)] = pi_0 sum q_i = pi_0$. Remaining condition:
$ (1 + r) pi_1 = s_1 q_1 + dots + s_n q_n, quad sum q_i = 1, quad q_i in (0, 1). $

*Example ($n = 2$).* With $s_1 > s_2$, $q_2 = 1 - q_1$: $q_1 = ((1+r) pi_1 - s_2)/(s_1 - s_2) in (0,1)$ iff $s_2 < (1 + r) pi_1 < s_1$. Writing $s_1 = pi_1 u$, $s_2 = pi_1 d$: $d < 1 + r < u$.

*Example ($n = 3$ generic).* $q_1 = 1 - q_2 - q_3$ gives
$ q_2 = ((1 + r) pi_1 - s_1 - q_3 (s_3 - s_1)) / (s_2 - s_1). $
Any $q_3 in (0,1)$ yielding $q_1, q_2 in (0,1)$ gives a risk-neutral measure.

*Example ($n = 3$ concrete).* $pi_1 = 100$, $r = 0.05$, $s_1 = 120$, $s_2 = 100$, $s_3 = 90$:
$ q_2 = 3/4 - 3 q_3 / 2, quad q_1 = 1/4 + q_3 / 2. $
$q_1 in (0,1)$ always; $q_2 > 0$ needs $q_3 < 1/2$. Hence
$ {(1/4 + q_3/2, 3/4 - 3q_3/2, q_3) | q_3 in (0, 1/2)}. $

== Law of one price

Let $cal(V) = {overline(S) dot overline(xi) | overline(xi) in RR^(d+1)}$, the space of *attainable payoffs*.

*Lemma (Law of one price).* In an arbitrage-free market, if $overline(xi) dot overline(S) = overline(zeta) dot overline(S)$ $P$-a.s. then $overline(xi) dot overline(pi) = overline(zeta) dot overline(pi)$.

*Proof.* $(overline(xi) - overline(zeta)) dot overline(S) = 0$ $P$-a.s. hence also $Q$-a.s. for any $Q tilde P$. Take risk-neutral $Q tilde P$:
$ (overline(xi) - overline(zeta)) dot overline(pi) = EE_Q [((overline(xi) - overline(zeta)) dot overline(S)) / (1 + r)] = 0. $
#h(1fr) $square$

== Securities and derivatives

*Definition (Security).* A random variable $C : Omega -> RR$ with $0 <= C < infinity$ $P$-a.s. $C$ is a *derivative* of $S_0, dots, S_d$ if $C(omega) = f(S_0(omega), dots, S_d(omega))$ for some Borel $f : RR^(d+1) -> RR$.

*Example (Forward).* Buy asset $i$ at time $1$ for delivery price $F_0$: payoff $C^"fw"(omega) = S_i(omega) - F_0$. Not a security unless $S_i >= F_0$ $P$-a.s.

*Example (Call/put).* European call/put on asset $i$ with strike $X$:
$ C^"call"(omega) = (S_i(omega) - X)^+, quad C^"put"(omega) = (X - S_i(omega))^+. $
Both non-negative derivative securities.

== Arbitrage-free prices for securities

Trading $C$ at $t=0$ for price $pi_C$ is modelled by adding $S_(d+1) := C$, $pi_(d+1) := pi_C$.

*Definition.* $pi_C >= 0$ is an *arbitrage-free price* of $C$ if the extended model is arbitrage-free. Set of such prices: $Pi(C) subset RR$.

*Theorem.* For arbitrage-free $(Omega, cal(F), P, overline(pi), overline(S))$,
$ Pi(C) = {EE_Q [C / (1 + r)] | Q tilde P "risk-neutral", EE_Q [C] < infinity}, $
nonempty. On finite $Omega$, finiteness is automatic.

*Proof.* Arbitrage-free gives risk-neutral $Q tilde P$; this $Q$ remains risk-neutral for the extended model when $pi_C = EE_Q[C/(1+r)]$, so the RHS is $subset Pi(C)$. Conversely, any $pi_C in Pi(C)$ yields, via FTAP applied to the extended model, a risk-neutral $Q tilde P$ with $pi_C = EE_Q[C/(1+r)]$. #h(1fr) $square$

#pagebreak()

= Lecture 13

== Arbitrage-free pricing of derivative securities

Assume $(Omega, cal(F), P, overline(pi), overline(S))$ arbitrage-free. A derivative $C(omega) = f(S^1(omega), dots, S^d(omega))$ with $C >= 0$ $P$-a.s. at price $pi_C$ gives an *extended market model*. To stay arbitrage-free,
$ pi_C in Pi(C) = {1 / (1 + r) EE_Q [C] | Q in cal(Q)}, $
where $cal(Q)$ is the set of risk-neutral $Q tilde P$ with finite expectation. Pricing: find $cal(Q)$, integrate discounted payoff. If $|cal(Q)| = 1$ the derivative is *replicable* with unique price.

*Corollary.* In an arbitrage-free market with security $C$:
+ $C$ is replicable $<==>$ $|Pi(C)| = 1$.
+ Otherwise $Pi(C) = (pi_inf (C), pi_sup (C))$ (open interval).

== Binomial model revisited

$Omega = {U, D}$, $p = P({U}) in (0,1)$, riskless bond $B$ and one risky $S$ with $S(U) > S(D)$. The unique risk-neutral measure has
$ q = Q({U}) = ((1 + r) pi_1 - S(D)) / (S(U) - S(D)), $
and arbitrage-free iff $S(D) < (1 + r) pi_1 < S(U)$. Every security has unique price
$ pi_C = 1 / (1 + r) (q C(U) + (1 - q) C(D)) = pi_U C(U) + pi_D C(D), $
with *Arrow-Debreu prices*
$ pi_U = ((1 + r) pi_1 - S(D)) / ((1 + r)(S(U) - S(D))), quad pi_D = (S(U) - (1 + r) pi_1) / ((1 + r)(S(U) - S(D))). $
With $S(U) = pi_1 u$, $S(D) = pi_1 d$, $a = C(U)$, $b = C(D)$, this matches the replicating portfolio formula
$ pi_C = a ((1 + r) - d) / ((1 + r)(u - d)) + b (u - (1 + r)) / ((1 + r)(u - d)). $

== Put and call options in the binomial model

European put, strike $X in [S(D), S(U)]$:
$ pi_(C^"put") = (X - S(D)) / (1 + r) dot (S(U) - (1 + r) pi_1) / (S(U) - S(D)). $
European call:
$ pi_(C^"call") = (S(U) - X) / (1 + r) dot ((1 + r) pi_1 - S(D)) / (S(U) - S(D)). $
Prices are independent of the real measure $P$.

== Using options to modify risk

*Setup.* $pi_1 = 100$, $S(U) = 120$, $S(D) = 90$, $r = 0.05$. Rate of return $R[C](omega) = (C(omega) - pi_C) / pi_C$; stock: $R[S](U) = 20%$, $R[S](D) = -10%$.

Call with $X = 100$:
$ pi_(C^"call") = 100 dot 20/30 - 1/1.05 dot (20 dot 90)/30 approx 9.52. $
$ R[C^"call"](U) = (20 - 9.52)/9.52 approx 110%, quad R[C^"call"](D) = -100%. $
Calls amplify both gain and loss.

*Protective put:* $tilde(C) = (X - S)^+ + S$. By put-call parity
$ pi_(C^"put") = pi_(C^"call") - pi_1 + X / (1 + r) approx 4.76, quad pi_(tilde(C)) approx 104.76. $
$ R[tilde(C)](U) approx 14.5%, quad R[tilde(C)](D) approx -4.5%. $
Downside reduced at cost of a slightly higher price.

== 3-state market example

$Omega = {omega_1, omega_2, omega_3}$, $P({omega_i}) > 0$, $s_i = S(omega_i)$, rate $r$. For a security $C$,
$ 1/(1 + r) EE_Q [C] = 1/(1 + r) (q_1 C(omega_1) + q_2 C(omega_2) + q_3 C(omega_3)). $

*Numerical.* $s_1 = 120$, $s_2 = 100$, $s_3 = 90$, $pi_1 = 100$, $r = 0.05$, risk-neutral set
$ {(1/4 + q_3/2, 3/4 - 3q_3/2, q_3) | q_3 in (0, 1/2)}. $

Call $C = (S - X)^+$, $X = 95$: $(C_1, C_2, C_3) = (25, 5, 0)$.
$ EE_Q[C] = 5 q_3 + 10 ==> Pi(C) = ((5 q_3 + 10)/1.05 : q_3 in (0, 1/2)) = (200/21, 250/21) approx (9.53, 11.90). $

*Bull spread* (long call $X_1 = 95$, short call $X_2 = 105$): $(C_1, C_2, C_3) = (10, 5, 0)$.
$ EE_Q[C] = 25/4 - 5 q_3 / 2 ==> Pi(C) = (200/42, 250/42) approx (4.76, 5.95). $

== Butterfly spread in a 4-state market

Payoff $f(S_T) = cases(0\, & |S_T - X| >= a, a - |S_T - X|\, & |S_T - X| <= a)$, width $0 < a < X$.

$Omega = {omega_1, dots, omega_4}$, $cal(F) = cal(P)(Omega)$, $P({omega_i}) > 0$; bond $pi_0$ and stock $pi_1 = X/(1 + r)$ with
$ S(omega_1) = X - a, quad S(omega_2) = X - a/2, quad S(omega_3) = X + a/2, quad S(omega_4) = X + a. $

*Risk-neutral measures* satisfy $EE_Q[S/(1+r)] = pi_1$ and $sum q_i = 1$, i.e.
$ 2 (q_4 - q_1) + (q_3 - q_2) = 0, quad q_1 + q_2 + q_3 + q_4 = 1, quad q_i in (0,1). $
A codimension-2 set; parameterise
$ q_1 = q - Delta/2, quad q_2 = 1/2 - q + Delta, quad q_3 = 1/2 - q - Delta, quad q_4 = q + Delta/2, $
with $(q, Delta)$ in the diamond $cal(B) subset (0,1)^2$ making each $q_i in (0,1)$.

*Butterfly price.* $(C(omega_i)) = (0, a/2, a/2, 0)$:
$ Pi(C) = {a / (2(1 + r)) (1 - 2 q) | (q, Delta) in cal(B)} = (0, a / (2(1 + r))). $

== Exercise: straddle in a 3-state model

A *straddle* = long call + long put, same $X$ and expiry; payoff $f(S_T) = |S_T - X|$.

Setup: $Omega = {U, N, D}$, $cal(F) = cal(P)(Omega)$, $P({omega_i}) > 0$, $S(U) = X + sigma$, $S(N) = X$, $S(D) = X - sigma$ with $0 < sigma < X$, and $pi_1 = X/(1 + r)$. Find the risk-neutral set and $Pi(C)$.
