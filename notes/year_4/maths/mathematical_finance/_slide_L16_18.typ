= Lecture 16: The Greeks

== Black-Scholes-Merton formula

Taking a limit of the multi-period binomial model, the asset price converges to

$ S_T = S_0 exp[(r - 1/2 sigma^2) T + sigma sqrt(T) N(0, 1)], $

with $N(0, 1)$ standard normal. Discounting is continuous at rate $r$, so the price of a path-independent claim $C = f(S_T)$ is

$ pi_C = e^(-r T) 1/sqrt(2 pi) integral_(-infinity)^(infinity) e^(-1/2 s^2) f(S_0 e^(r T - 1/2 sigma^2 T + sigma sqrt(T) s)) d s = e^(-r T) EE_Q [f(S_T)]. $

Parameters: $r$ risk-free rate, $T$ expiry, $S_0$ initial price, $sigma$ volatility (magnitude of random fluctuations).

== Black-Scholes-Merton: Value

For claim $C = f(S_T)$ the value at time $t$ is

$ V(t, S_t) = e^(-r(T - t)) 1/sqrt(2 pi) integral_(-infinity)^(infinity) e^(-1/2 s^2) f(S_t e^(r(T - t) - 1/2 sigma^2 (T - t) + sigma sqrt(T - t) s)) d s, $

the discounted value conditional on $S_t$. Then $V(0, S_0) = pi_C$ and $V(T, S_T) = f(S_T)$. $V$ is a function of $S_t$, $tau = T - t$, $sigma$ and $r$.

== Value of a call at time $t$

For a call with strike $X$, $f(S) = (S - X)^+$ and

$ V(t, S_t) = S_t Phi(d_+) - X e^(-r tau) Phi(d_-) $

where

$ d_-(S_t, t) = 1/(sigma sqrt(tau)) (log(S_t / X) + r tau - 1/2 sigma^2 tau), quad d_+ = d_- + sigma sqrt(tau), $

and $Phi(z) = 1/sqrt(2 pi) integral_(-infinity)^z e^(-1/2 s^2) d s$ is the standard normal CDF.

== The Greeks

*Definition (The Greeks).* The _Greeks_ are rates of change of the claim value with respect to parameters, others fixed:

$ Delta = (partial V) / (partial S_t), quad Theta = (partial V) / (partial t) = -(partial V) / (partial tau), quad Gamma = (partial Delta) / (partial S_t), quad rho = (partial V) / (partial r), quad nu = (partial V) / (partial sigma). $

== Greeks for a call option

We may differentiate under the integral sign. For $A(x, s)^+$ with $cal(A) = {A >= 0}$, boundary terms vanish:

$ partial / (partial x) integral_(-infinity)^(infinity) A^+ d s = integral_(cal(A)) (partial A) / (partial x) d s. $

Alternatively, using $V = S_t Phi(d_+) - X e^(-r tau) Phi(d_-)$,

$ (partial V) / (partial x) = (partial S_t) / (partial x) Phi(d_+) + S_t Phi'(d_+) (partial d_+) / (partial x) - partial / (partial x) (X e^(-r tau)) Phi(d_-) - X e^(-r tau) Phi'(d_-) (partial d_-) / (partial x), $

and the identity $S_t Phi'(d_+) - X e^(-r tau) Phi'(d_-) = 0$ often simplifies the result.

== Delta of a call option

$ Delta &= (partial V) / (partial S_t) = e^(-r tau) 1/sqrt(2 pi) integral_(-d_-)^(infinity) e^(-1/2 s^2) (partial) / (partial S_t) [S_t e^(r tau - 1/2 sigma^2 tau + sigma sqrt(tau) s) - X]^+ d s \
&= e^(-r tau) 1/sqrt(2 pi) integral_(-d_-)^(infinity) e^(-1/2 s^2 - 1/2 sigma^2 tau + sigma sqrt(tau) s + r tau) d s = Phi(d_+) >= 0, $

with $d_+ = 1/(sigma sqrt(tau)) (log(S_t / X) + r tau + 1/2 sigma^2 tau)$. $Delta$ measures sensitivity to the underlying.

== Theta for a call option

$ Theta &= -(partial V) / (partial tau) = r e^(-r tau) 1/sqrt(2 pi) integral_(-d_-)^(infinity) e^(-1/2 s^2) (S_t e^(r tau - 1/2 sigma^2 tau + sigma sqrt(tau) s) - X) d s \
&quad - e^(-r tau) 1/sqrt(2 pi) integral_(-d_-)^(infinity) e^(-1/2 s^2) S_t e^(r tau - 1/2 sigma^2 tau + sigma sqrt(tau) s) (r - 1/2 sigma^2 + 1/(2 sqrt(tau)) sigma s) d s \
&= -1/(2 sqrt(tau)) S_t sigma Phi'(d_+) - r X e^(-r tau) Phi(d_-). $

$Theta$ measures time decay.

== Rho for a call option

$ rho &= (partial V) / (partial r) = S_t Phi'(d_+) (partial d_+) / (partial r) + X tau e^(-r tau) Phi(d_-) - X e^(-r tau) Phi'(d_-) (partial d_-) / (partial r) \
&= sqrt(tau) / sigma [S_t Phi'(d_+) - X e^(-r tau) Phi'(d_-)] + X tau e^(-r tau) Phi(d_-) = X tau e^(-r tau) Phi(d_-). $

$rho$ measures sensitivity to the risk-free rate.

== Vega for a call option

$ nu &= (partial V) / (partial sigma) = S_t Phi'(d_+) (partial d_+) / (partial sigma) - X e^(-r tau) Phi'(d_-) (partial d_-) / (partial sigma) \
&= -1/(sigma^2 sqrt(tau)) (log(S_t / X) + r tau) [S_t Phi'(d_+) - X e^(-r tau) Phi'(d_-)] + 1/2 sqrt(tau) [S_t Phi'(d_+) + X e^(-r tau) Phi'(d_-)] \
&= S_t sqrt(tau) Phi'(d_+) >= 0. $

$nu$ measures sensitivity to volatility.

== Delta-hedging and self-financing

Selling one call at $t = 0$ and holding $Delta^*$ shares gives position value $-V(t, S_t) + Delta^* S_t$. For small changes $delta S_t$, $delta t$,

$ (-Delta + Delta^*) delta S_t - Theta delta t - 1/2 Gamma (delta S_t)^2. $

Setting $Delta^* = Delta$ continuously eliminates first-order price risk: _Delta-hedging_. Since $Theta < 0$ for calls, a Delta-hedged short call profits from time decay but loses on $-1/2 Gamma (delta S_t)^2 < 0$.

Purchases/sales of shares are financed from the risk-free bond, keeping the portfolio _self-financing_. In the BSM model $Theta$ and $Gamma$ contributions exactly balance so the perfectly hedged portfolio earns $r$. In practice _actual_ vs _implied_ volatility determines profitability — so Delta-hedging is a bet on volatility.

= Lecture 17: Exotic Options in CRR

== Option pricing in CRR model

Arbitrage-freeness gives _backward induction_: at each node list the risky asset price and the portfolio value.

$ V_t = 1/(1 + r) EE_Q [V_(t+1) | cal(F)_t]. $

For $T$ periods with rate $r$ and up/down factors $u, d$, the price of a path-independent claim $C(omega) = f(S_T(omega))$ is

$ pi_C = 1/(1 + r)^T sum_(k=0)^T binom(T, k) q^k (1 - q)^(T - k) f(S_0 u^k d^(T - k)), quad q = (1 + r - d) / (u - d). $

== American options

An _American call_ (resp. _put_) gives the right to buy (resp. sell) the underlying at any time up to and including expiry. For a non-dividend-paying asset it is never optimal to exercise an American call early; for puts, or calls on dividend-paying assets, early exercise is generally optimal at some time.

In the CRR model backward induction uses the risk-neutral measure, but the value is now the max of immediate pay-off and discounted expectation:

$ V_t = max(1/(1 + r) EE_Q [V_(t+1) | cal(F)_t], f(S_t)), $

with $f(S) = (S - X)^+$ (call) or $f(S) = (X - S)^+$ (put).

== American put option in the two-period model

Prices move by $u$ or $d$, rate $r$, $q = (1 + r - d) / (u - d)$. At $t = 2$:

$ (X - S_0 u^2)^+ "in" U U, quad (X - S_0 u d)^+ "in" U D "or" D U, quad (X - S_0 d^2)^+ "in" D D. $

At $t = 1$:

$ V_1(U) &= max((X - S_0 u)^+, 1/(1 + r) (q (X - S_0 u^2)^+ + (1 - q)(X - S_0 u d)^+)), \
V_1(D) &= max((X - S_0 d)^+, 1/(1 + r) (q(X - S_0 u d)^+ + (1 - q)(X - S_0 d^2)^+)). $

At $t = 0$, $V_0 = max((X - S_0)^+, 1/(1 + r) (q V_1(U) + (1 - q) V_1(D)))$. Early exercise occurs whenever the immediate pay-off beats the discounted expectation.

*Example.* $S_0 = \$100$, $u = 1.2$, $d = 0.9$, $r = 5%$, $X = \$105$, $q = (1.05 - 0.9)/(1.2 - 0.9) = 0.5$.

Pay-offs at $t = 2$: $U U: (\$105 - \$144)^+ = \$0$; $U D / D U: (\$105 - \$108)^+ = \$0$; $D D: (\$105 - \$81)^+ = \$24$.

$ V_1(U) &= max((\$105 - \$120)^+, 1/1.05 (0.5 dot \$0 + 0.5 dot \$0)) = max(\$0, \$0) = \$0, \
V_1(D) &= max((\$105 - \$90)^+, 1/1.05 (0.5 dot \$0 + 0.5 dot \$24)) = max(\$15, \$11.429) = \$15 $

(early exercise Down at $t = 1$). Then

$ V_0 = max((\$105 - \$100)^+, 1/1.05 (0.5 dot \$0 + 0.5 dot \$15)) = max(\$5, \$7.143) = \$7.143. $

Up $=>$ worthless; Down $=>$ exercise at $t = 1$. Price $\$7.14$ (2 d.p.).

== Path-dependent claims

With no early exercise or dividends, the arbitrage-free price of pay-off $C(omega)$ is

$ pi_C = 1/(1 + r)^T sum_(omega in Omega) q^(hat(k)(omega)) (1 - q)^(T - hat(k)(omega)) C(omega) quad (dagger), $

$hat(k)(omega)$ = number of Up moves. Path-dependent pay-offs prevent tree recombination: path-independent CRR has $T + 1$ terminal states, path-dependent has up to $2^T$. For $T = 100$,

$ 2^100 = 1","267","650","600","228","229","401","496","703","205","376, $

a million times the estimated number of stars in the observable universe.

== Asian options

*Definition (Asian call option).* Pay-off with strike $X$, expiry $T$:

$ (overline(S) - X)^+, $

where $overline(S)$ is the average share price over the contract. Settled in cash. This is _path-dependent_.

== Asian call option in a two-period model

With $overline(S) = 1/3 (S_0 + S_1 + S_2)$,

$ omega = U U: & overline(S) = S_0 / 3 (1 + u + u^2), quad & omega = U D: & overline(S) = S_0 / 3 (1 + u + u d), \
omega = D U: & overline(S) = S_0 / 3 (1 + d + d u), quad & omega = D D: & overline(S) = S_0 / 3 (1 + d + d^2). $

Terminal pay-off $(overline(S)(omega) - X)^+$; price by backward induction or $(dagger)$.

*Example.* $S_0 = \$100$, $u = 1.2$, $d = 0.9$, $r = 5%$, $X = \$105$, $q = 0.5$.

Average prices and pay-offs at $t = 2$: $U U: \$121.333, \$16.333$; $U D: \$109.333, \$4.333$; $D U: \$99.333, \$0$; $D D: \$90.333, \$0$. Note $U D$ and $D U$ have the same terminal $S$ but different $overline(S)$.

$ V_1(U) = 1/1.05 (0.5 dot \$16.333 + 0.5 dot \$4.333) = \$9.841, quad V_1(D) = \$0, $
$ V_0 = 1/1.05 (0.5 dot \$9.8413 + 0.5 dot \$0) = \$4.69. $

== Look-back options

*Definition (Fixed-strike look-back).* Call pay-off $[max_(0 <= t <= T) S_t - X]^+$; put pay-off $[X - min_(0 <= t <= T) S_t]^+$.

*Definition (Floating-strike look-back).* Call pay-off $[S_T - min_(0 <= t <= T) S_t]^+$ (strike = running minimum); put pay-off $[max_(0 <= t <= T) S_t - S_T]^+$ (strike = running maximum).

Settled in cash.

== Fixed-strike look-back call option in three periods

*Example.* $S_0 = \$100$, $u = 1.2$, $d = 0.9$, $r = 5%$, $X = \$105$, $q = 0.5$.

#table(
  columns: 7,
  [$omega$], [$S_0$], [$S_1$], [$S_2$], [$S_3$], [max], [$C(omega)$],
  [$U U U$], [100.00], [120.00], [144.00], [172.80], [172.80], [67.80],
  [$U U D$], [100.00], [120.00], [144.00], [129.60], [144.00], [39.00],
  [$U D U$], [100.00], [120.00], [108.00], [129.60], [129.60], [24.60],
  [$U D D$], [100.00], [120.00], [108.00], [97.20], [120.00], [15.00],
  [$D U U$], [100.00], [90.00], [108.00], [129.60], [129.60], [24.60],
  [$D U D$], [100.00], [90.00], [108.00], [97.20], [108.00], [3.00],
  [$D D U$], [100.00], [90.00], [81.00], [97.20], [100.00], [0.00],
  [$D D D$], [100.00], [90.00], [81.00], [72.90], [100.00], [0.00],
)

$ pi = 1/1.05^3 dot 1/8 dot sum_omega C(omega) = \$18.79. $

== Floating-strike look-back put option in three periods

*Example.* $S_0 = \$100$, $u = 1.2$, $d = 0.9$, $r = 5%$, $q = 0.5$.

#table(
  columns: 7,
  [$omega$], [$S_0$], [$S_1$], [$S_2$], [$S_3$], [Strike], [$C(omega)$],
  [$U U U$], [100.00], [120.00], [144.00], [172.80], [172.80], [0.00],
  [$U U D$], [100.00], [120.00], [144.00], [129.60], [144.00], [14.40],
  [$U D U$], [100.00], [120.00], [108.00], [129.60], [129.60], [0.00],
  [$U D D$], [100.00], [120.00], [108.00], [97.20], [120.00], [22.80],
  [$D U U$], [100.00], [90.00], [108.00], [129.60], [129.60], [0.00],
  [$D U D$], [100.00], [90.00], [108.00], [97.20], [108.00], [10.80],
  [$D D U$], [100.00], [90.00], [81.00], [97.20], [100.00], [2.80],
  [$D D D$], [100.00], [90.00], [81.00], [72.90], [100.00], [27.10],
)

$ pi = 1/1.05^3 dot 1/8 dot sum_omega C(omega) = \$8.41. $

== Barrier options

*Definition (Barrier options).* Pay-off depends on whether the price crosses a barrier $B$. _Knock-in_: activates on crossing; _Knock-out_: deactivates on crossing. Un-activated/deactivated $=>$ pay-off $0$. _Up_ if $B > S_0$, _down_ if $B < S_0$. There are $8$ types: (In/Out)$times$(Up/Down)$times$(Call/Put). Settled in cash. Note

$ "Knock-in" + "Knock-out" = "European", $

so barrier options cost less than European ones.

*Example (Down and in call).* Barrier $B < S_0$, strike $X$:

$ bb(1)_(min_(0 <= t <= T) S_t <= B) (S_T - X)^+. $

Path-dependent.

*Example (Down and in put).* $S_0 = \$100$, $u = 1.2$, $d = 0.9$, $r = 5%$, $q = 0.5$, $X = \$105$, $B = \$95$.

#table(
  columns: 8,
  [$omega$], [$S_0$], [$S_1$], [$S_2$], [$S_3$], [min], [Activated], [$C(omega)$],
  [$U U U$], [100.00], [120.00], [144.00], [172.80], [100.00], [0], [0.00],
  [$U U D$], [100.00], [120.00], [144.00], [129.60], [100.00], [0], [0.00],
  [$U D U$], [100.00], [120.00], [108.00], [129.60], [100.00], [0], [0.00],
  [$U D D$], [100.00], [120.00], [108.00], [97.20], [97.20], [0], [0.00],
  [$D U U$], [100.00], [90.00], [108.00], [129.60], [90.00], [1], [0.00],
  [$D U D$], [100.00], [90.00], [108.00], [97.20], [90.00], [1], [7.80],
  [$D D U$], [100.00], [90.00], [81.00], [97.20], [81.00], [1], [7.80],
  [$D D D$], [100.00], [90.00], [81.00], [72.90], [72.90], [1], [32.10],
)

$ pi = 1/1.05^3 dot 1/8 dot sum_omega C(omega) = \$5.15. $

== Options on dividend-paying assets

With dividends $D_t$ at $t = 0, 1, dots, T$, asset prices are adjusted at each period:

$ S_(t+1)(omega) = Z_(t+1)(omega) S_t (omega) - D_t, $

where $Z_(t+1) in {u, d}$. If $D_t = D$ then at $t = 1$ prices are $(S_0 - D) u - D$ and $(S_0 - D) d - D$. In two periods:

$ omega = U U: & S_T = S_0 u^2 - D(1 + u + u^2), \
omega = U D: & S_T = S_0 u d - D(1 + u + u d), \
omega = D U: & S_T = S_0 d u - D(1 + d + d u), \
omega = D D: & S_T = S_0 d^2 - D(1 + d + d^2), $

so $S_T(U D) != S_T(D U)$ — tree does not recombine. But the transformation

$ tilde(S)_0 = S_0 - "PV"({D_t}) $

maps to a recombining tree, giving

$ pi_C = 1/(1 + r)^T sum_(k=0)^T binom(T, k) q^k (1 - q)^(T - k) f(tilde(S)_0 u^k d^(T - k)). $

== Option(al)

- _Digital/binary options_: pay-off fixed if in the money: $B dot bb(1)_(S_T >= X)$ (call), $B dot bb(1)_(X >= S_T)$ (put).
- _Rainbow options_: two or more underlyings.
- _Compound options_: options on options.
- _Chooser options_: at $T_c < T$ choose call or put.
- _Bermudan options_: early exercise allowed only on a pre-set set of dates.

The goal is efficient pricing via analysis, numerics and algorithms.

= Lecture 18: Arbitrage arguments and American option bounds

== A1(iii) 2023-24 5E Exam

Given nominal rate $100 r%$ paid in $n > 1$ instalments, show AER is increasing in $n$. For $a > b$,

$ (a^n - b^n) / (a - b) = sum_(k=0)^(n-1) a^k b^(n - 1 - k) < n a^(n - 1), $

so $b^n > a^(n - 1) (n b - a(n - 1))$. Set $b = 1 + r/n$, $a = 1 + r/(n - 1) > b$; then $n b - a(n - 1) = n + r - (n - 1 + r) = 1$, hence

$ (1 + r/n)^n > (1 + r/(n - 1))^(n - 1). $

The AER $R_n$ satisfies $1 + R_n = (1 + r/n)^n$, so $R_n > R_m$ for $n > m$: increasing. As $n arrow.r infinity$, $1 + R_n arrow.r e^r$. Same nominal rate $=>$ prefer more conversion periods.

== A2(iii) 2023-24 5E Exam: Straddle

To exploit volatility, need a pay-off that grows as $S_T$ moves away from some value. A _straddle_ = long European call + long European put, same strike $X$, same expiry $T$. Pay-off

$ (S_T - X)^+ + (X - S_T)^+ = |S_T - X|. $

If $S_T < X$ exercise the put; if $S_T > X$ exercise the call. Cost $pi_C + pi_P$, profit

$ |S_T - X| - pi_P - pi_C, $

a V-shape centred at $X$ with break-evens on each side — loss near $X$, large gains far from $X$.

== American call options

Assuming no dividends, $pi_(C_A) = pi_(C_E)$.

Assume $pi_(C_A) > pi_(C_E)$. Buy European call, sell American call, invest $pi_(C_A) - pi_(C_E) > 0$ at rate $r$. If the American is exercised at $t$, borrow the asset, sell for $X$, invest at rate $r$. At $T$ close the short at cost $min(X, S_T)$. Final value at least

$ (pi_(C_A) - pi_(C_E)) e^(r T) + min(X(e^(r(T - t)) - 1), 0) > 0, $

arbitrage. Portfolio form:

#table(
  columns: 5,
  [], [Stock], [Bond], [E-Call], [A-Call],
  [$pi$], [$S_0$], [$1$], [$pi_(C_E)$], [$pi_(C_A)$],
  [$xi$], [$0$], [$pi_(C_A) - pi_(C_E)$], [$1$], [$-1$],
)

initially $0$. If A-call unexercised at $T$:

#table(
  columns: 5,
  [], [Stock], [Bond], [E-Call], [A-Call],
  [$S$], [$S_T$], [$e^(r T)$], [$(S_T - X)^+$], [$0$],
  [$xi$], [$0$], [$pi_(C_A) - pi_(C_E)$], [$1$], [$-1$],
)

value $e^(r T)(pi_(C_A) - pi_(C_E)) + (S_T - X)^+ > 0$. If A-call exercised at $t$, short-sell to deliver and invest $X$:

#table(
  columns: 5,
  [], [Stock], [Bond], [E-Call], [A-Call],
  [$S$], [$S_t$], [$e^(r t)$], [$V_E (t)$], [$S_t - X$],
  [$xi$], [$0$], [$pi_(C_A) - pi_(C_E)$], [$1$], [$-1$],
)

after exercise:

#table(
  columns: 5,
  [], [Stock], [Bond], [E-Call], [A-Call],
  [$S$], [$S_t$], [$e^(r t)$], [$V_E (t)$], [],
  [$xi$], [$-1$], [$pi_(C_A) - pi_(C_E) + X e^(-r t)$], [$1$], [],
)

self-financing with value $V_E (t) + X - S_t + (pi_(C_A) - pi_(C_E)) e^(r t) >= 0$ since $V_E(t) >= S_t - X e^(-r(T - t))$. At expiry

#table(
  columns: 4,
  [], [Stock], [Bond], [E-Call],
  [$S$], [$S_T$], [$e^(r T)$], [$max(S_T - X, 0)$],
  [$xi$], [$-1$], [$pi_(C_A) - pi_(C_E) + X e^(-r t)$], [$1$],
)

value $(pi_(C_A) - pi_(C_E)) e^(r T) + X e^(r(T - t)) - min(S_T, X) > 0$ — arbitrage.

Conversely, if $pi_(C_A) < pi_(C_E)$: sell E-call, buy A-call, invest $pi_(C_E) - pi_(C_A) > 0$. At expiry both pay equally, so net $(pi_(C_E) - pi_(C_A)) e^(r T) > 0$ — arbitrage. Hence $pi_(C_A) = pi_(C_E)$.

== American put options

*Claim:* $pi_(P_A) <= X$. If $pi_(P_A) > X$, sell a put, invest at rate $r$. Exercised at $t$: pay-off $S_T - X > -X$, value $>= (pi_(P_A) - X) e^(r T) + S_t e^(r(T - t)) > 0$. Not exercised: $pi_(P_A) e^(r T) > 0$. Arbitrage.

*Claim:* $pi_(P_A) >= (X - S_0)^+$. If $<$, buy and exercise immediately for $(X - S_0)^+ - pi_(P_A) > 0$. Arbitrage. Flexibility also gives $pi_(P_A) >= pi_(P_E)$, so

$ max(pi_(P_E), X - S_0) <= pi_(P_A) <= X. $

== Arbitrage in general: Portfolios

_Dominating portfolios._ If $V_B (T) >= V_A (T)$ in every state then $pi_B >= pi_A$. Proof: if $pi_A > pi_B$, long $B$, short $A$, invest $pi_A - pi_B > 0$; initial value $0$; at $T$ value $V_B(T) - V_A(T) + (pi_A - pi_B) e^(r T) > 0$, arbitrage.

_Law of one price._ Equal pay-offs in all states $=>$ equal prices (two applications of dominance).

== Arbitrage in general: Arbitrageur

To show $pi_B >= pi_A$, assume $pi_A > pi_B$: _buy low, sell high_ — long $B$, short $A$, invest difference at rate $r$; initial value $0$; show value at $T$ is $>= 0$ always and $> 0$ somewhere — arbitrage contradicts the efficient market hypothesis.

== Arbitrage example: Put-call parity

Establish $pi_C - pi_P = S_0 - X e^(-r T)$. Rearrange to

$ pi_C + X e^(-r T) = pi_P + S_0. $

*A:* European call plus $X e^(-r T)$ at rate $r$. *B:* European put plus share.

$ V_A (T) = (S_T - X)^+ + X = max(S_T, X), quad V_B (T) = S_T + (X - S_T)^+ = max(X, S_T). $

Equal pay-offs, so law of one price gives the result.

== Arbitrage example: Forward contract delivery price

Show $F_0 = S_0 e^(r T)$. Assume $F_0 < S_0 e^(r T)$: enter the forward with delivery $F_0$, short sell the asset for $S_0$, invest at rate $r$. Initial cost $0$. At $T$ buy via the forward for $F_0$ and close the short, using $S_0 e^(r T)$, leaving $S_0 e^(r T) - F_0 > 0$ — arbitrage. (The reverse case rules out $F_0 > S_0 e^(r T)$.)
