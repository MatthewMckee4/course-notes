= Lecture 14: Multi-period binomial model

== Recap: Arbitrage-free pricing in one-period models

Given an arbitrage-free market $(Omega, cal(F), P, overline(pi), overline(S))$, the set of risk-neutral measures $cal(Q)$ determines arbitrage-free prices of a derivative $C(omega) = f(S^1(omega), dots, S^d(omega))$ with $C >= 0$ $P$-a.s. Introducing $C$ as a tradeable asset at price $pi_C$ keeps the extended model arbitrage-free iff
$ pi_C in Pi(C) = { 1/(1+r) EE_Q (C) | Q in cal(Q) } $
where $cal(Q)$ consists of risk-neutral measures equivalent to $P$ with $EE_Q (C) < infinity$. If $cal(Q)$ is a singleton then $C$ is _replicable_ and the price is unique.

== Multi-period binomial model

At each of $T$ discrete times the price moves 'Up' or 'Down', so $omega in Omega = {U, D}^T$, $|Omega| = 2^T$. A riskless bond has price $pi_t = pi_0 (1+r)^t$; the risky asset is a process $(S_t)_(t=0)^T$, $S_t : Omega arrow.r RR$, with initial price $S_0$. Take $cal(F)_T = cal(P)(Omega)$.

*Definition (Filtration).* A sequence $cal(F)_(t-1) subset cal(F)_t$ with $cal(F)_0 = {nothing, Omega}$, $cal(F)_1 = {nothing, B_U, B_D, Omega}, dots$, where
$ B_U = {omega in Omega | "first element in sequence is" U}. $
$cal(F)_t$ contains events depending only on the first $t$ moves; $cal(F)_t$-measurable random variables depend only on those moves. For $T = 2$:
$ cal(F)_0 = {nothing, Omega}, quad cal(F)_1 = {nothing, {U U, U D}, {D U, D D}, Omega}, quad cal(F)_2 = cal(P)(Omega). $

*Cox-Ross-Rubinstein (CRR) model.* $S_(t+1)(omega) = Z_(t+1)(omega) S_t(omega)$ with
$ Z_(t+1)(omega) = cases(u\, quad "the" (t+1)"-th component of" omega "is" U, d\, quad "the" (t+1)"-th component of" omega "is" D). $
Each $S_t$ is $cal(F)_t$-measurable. E.g. $T = 2$: $S_2 in {u^2 S_0, u d S_0, d^2 S_0}$.

A recombining tree with $T = 20$, $u = 1.12$, $d = 0.89$ produces many histories; prices follow $S_t = S_0 u^k d^(t-k)$ with $k$ the number of Up moves. Tesla's 1-year share price (stockquote.io) is broadly consistent with such a model.

== Arbitrage-free condition and FTAP

The model is arbitrage-free iff there exists a risk-neutral measure $Q$ on $(Omega, cal(F)_T)$ with
$ EE_Q [S_(t+1)/(1+r) | S_t] = S_t, $
a conditional expectation: every one-step submodel is arbitrage-free. In the homogeneous CRR case this reduces to $d < 1 + r < u$.

*Theorem (FTAP, multi-period binomial).* Equivalent:
+ The model is arbitrage-free.
+ There exists a risk-neutral $Q$ on $(Omega, cal(F)_T)$, $Q tilde P$, such that $tilde(S)_t = S_t/(1+r)^t$ is a martingale: $EE_Q [tilde(S)_(t+1) | tilde(S)_t] = tilde(S)_t$.

== Pricing path-independent contingent claims

Consider $C(omega) = f(S_T (omega))$. Arbitrage-free prices are
$ Pi_C = { 1/(1+r)^T EE_Q [C] | Q "risk neutral", Q tilde P "and" EE[C] < infinity }. $
The risk-neutral measure is unique in the multi-period binomial model, so the price is unique.

*Risk-neutral measure in CRR.* With $q = (1 + r - d)/(u - d)$, for $omega$ with $k$ Ups and $T - k$ Downs,
$ Q({omega}) = q^k (1 - q)^(T - k). $
Since $S_T(omega) = S_0 u^k d^(T-k)$ has $binom(T,k)$ preimages,
$ Q(S_T = S_0 u^k d^(T-k)) = binom(T, k) q^k (1 - q)^(T - k) quad ("binomial"). $
Hence
$ pi_C = 1/(1+r)^T EE_Q [f(S_T)] = 1/(1+r)^T sum_(k=0)^T binom(T, k) q^k (1 - q)^(T - k) f(S_0 u^k d^(T-k)). $

We can also derive this via replication.

== Self-financing strategies and replication

*Definition (Trading strategy).* A sequence $(xi_0^t, xi_1^t)$ of bond/risky holdings on $(t, t+1]$. Portfolio value
$ V_t (omega) = xi_0^t (omega) dot B_t + xi_1^t (omega) dot S_t (omega), quad B_t = pi_0 (1+r)^t. $

*Definition (Self-financing).*
$ V_(t+1) = xi_0^t dot B_(t+1) + xi_1^t dot S_(t+1) = xi_0^(t+1) dot B_(t+1) + xi_1^(t+1) dot S_(t+1). $

*Definition (Replicable).* $C$ is replicable if some self-financing strategy has $V_T = C$. Every claim in the multi-period binomial model is replicable.

== Two-period replication

Take $T = 2$; outcomes are $C(U U), C(U D), C(D U), C(D D)$. Upper branch: solve
$ xi_0^1(U) pi_0 (1+r)^2 + xi_1^1(U) u S_1(U) = C(U U), $
$ xi_0^1(U) pi_0 (1+r)^2 + xi_1^1(U) d S_1(U) = C(U D) $
to obtain
$ V_1(U) = xi_0^1(U) pi_0 (1+r) + xi_1^1(U) S_1(U) = 1/(1+r) (q C(U U) + (1 - q) C(U D)), quad q = (1+r-d)/(u-d). $
Lower branch: analogously,
$ V_1(D) = 1/(1+r) (q C(D U) + (1 - q) C(D D)). $
Initial branch:
$ xi_0^0 pi_0 (1+r) + xi_1^0 u S_0 = V_1(U), quad xi_0^0 pi_0 (1+r) + xi_1^0 d S_0 = V_1(D), $
$ V_0 &= xi_0^0 pi_0 + xi_1^0 S_0 = 1/(1+r) (q V_1(U) + (1-q) V_1(D)) \
&= 1/(1+r)^2 [q^2 C(U U) + q(1-q)(C(U D) + C(D U)) + (1-q)^2 C(D D)] \
&= 1/(1+r)^2 sum_(k=0)^2 binom(2,k) q^k (1-q)^(2-k) f(S_0 u^k d^(2-k)). $

== Backward induction and general $T$-period formula

*Backward induction.* $V_t = 1/(1+r) EE_Q [V_(t+1) | cal(F)_t]$.

*Arbitrage-free price ($T$-period binomial).* The unique price of $C(omega) = f(S_T(omega))$ is
$ pi_C = 1/(1+r)^T sum_(k=0)^T binom(T, k) q^k (1 - q)^(T - k) f(S_0 u^k d^(T - k)), quad q = (1 + r - d)/(u - d). $

== Pricing example: straddle, $T = 2$

A straddle with strike $X$ pays $C = f(S_T) = (S_T - X)^+ + (X - S_T)^+ = |X - S_T|$, so
$ pi_C = 1/(1+r)^2 [q^2 |X - S_0 u^2| + 2 q (1 - q) |X - S_0 u d| + (1 - q)^2 |X - S_0 d^2|]. $
With $X = pound 95$, $S_0 = pound 100$, $r = 0.05$, $u = 1.2$, $d = 0.9$: $q = (1.05 - 0.90)/(1.20 - 0.90) = 0.5$. Pay-offs
$ C_(u u) = pound 49, quad C_(u d) = C_(d u) = pound 13, quad C_(d d) = pound 14, $
so
$ pi_C = 1/(1.05^2) (0.25 dot pound 49 + 0.5 dot pound 13 + 0.25 dot pound 14) approx pound 20.18. $
Buying this straddle loses unless the market moves Up twice.

= Lecture 15: Black-Scholes-Merton formula

== Limiting process

Fix terminal time $T$, partition into $n$ intervals of length $Delta t = T/n$, and take $n arrow.r infinity$. Use $u = e^(sigma sqrt(Delta t))$, $d = e^(-sigma sqrt(Delta t))$, continuous risk-free rate $r$ (compounding factor $e^(r Delta t)$). Then
$ q = (e^(r Delta t) - d)/(u - d) = (e^(r Delta t) - e^(-sigma sqrt(Delta t)))/(e^(sigma sqrt(Delta t)) - e^(-sigma sqrt(Delta t))) approx 1/2 + 1/(2 sigma) (r - 1/2 sigma^2) sqrt(Delta t) + O(Delta t). $
After $n$ moves with $k$ Ups,
$ S_T = S_0 u^k d^(n - k) = S_0 exp[sigma sqrt(Delta t) (2k - n)], quad k tilde "Binom"(n, q). $
The CRR distribution (with $S_0 = 100$, $sigma = 0.2$, $r = 0.05$) converges to the Black-Scholes lognormal as $n arrow.r infinity$.

== Central limit theorem

Write $S_T = S_0 exp[sigma sqrt(T) (2k - n)/sqrt(n)]$. By the CLT,
$ (2k - n)/sqrt(n) arrow.r.long^("dist.") N((r - 1/2 sigma^2)/sigma sqrt(T), 1), $
since
$ EE[(2k - n)/sqrt(n)] = (2 q n - n)/sqrt(n) arrow.r.long^(n arrow.r infinity) (r - 1/2 sigma^2)/sigma sqrt(T), quad "Var"[(2k - n)/sqrt(n)] = 4 q (1 - q) arrow.r.long^(n arrow.r infinity) 1. $

== Black-Scholes-Merton formula

The limiting distribution is lognormal:
$ S_T = S_0 exp[(r - 1/2 sigma^2) T + sigma sqrt(T) N(0, 1)]. $
With discount $e^(-r T)$, the price of $C = f(S_T)$ is
$ pi_C = e^(-r T) 1/sqrt(2 pi) integral_(-infinity)^infinity e^(-1/2 s^2) f(S_0 e^(r T - 1/2 sigma^2 T + sigma sqrt(T) s)) d s = e^(-r T) EE_Q [f(S_T)]. $
Parameters: $r$ risk-free rate, $T$ expiry, $S_0$ initial price, $sigma$ volatility (magnitude of random fluctuations).

== Pricing call and put options

*Example (Call).* $f(s) = (s - X)^+$, so
$ pi_"call" &= e^(-r T) 1/sqrt(2 pi) integral_(-infinity)^infinity e^(-1/2 s^2) (S_0 e^(r T - 1/2 sigma^2 T + sigma sqrt(T) s) - X)^+ d s \
&= e^(-r T) 1/sqrt(2 pi) integral_(y^*)^infinity e^(-1/2 s^2) (S_0 e^(r T - 1/2 sigma^2 T + sigma sqrt(T) s) - X) d s, $
where $S_0 e^(r T - 1/2 sigma^2 T + sigma sqrt(T) y^*) = X$ (for $s <= y^*$ the call expires worthless). Setting $y^* = -d_-(S_0, T)$ with
$ d_- (S_0, T) = 1/(sigma sqrt(T)) (log(S_0/X) + r T - 1/2 sigma^2 T), quad d_+ (S_0, T) = d_- (S_0, T) + sigma sqrt(T), $
and completing the square:
$ pi_"call" &= S_0 1/sqrt(2 pi) integral_(-d_-)^infinity e^(-1/2 (s - sigma sqrt(T))^2) d s - X e^(-r T) 1/sqrt(2 pi) integral_(-d_-)^infinity e^(-1/2 s^2) d s \
&= S_0 1/sqrt(2 pi) integral_(-d_+)^infinity e^(-1/2 s^2) d s - X e^(-r T) 1/sqrt(2 pi) integral_(-d_-)^infinity e^(-1/2 s^2) d s. $
With $Phi(z) = 1/sqrt(2 pi) integral_(-infinity)^z e^(-1/2 s^2) d s$, $Phi(-z) = 1 - Phi(z)$:
$ pi_"call" = S_0 Phi(d_+) - X e^(-r T) Phi(d_-). $
($log$ is the natural logarithm.)

*Exercise (Put).* By similar working, or put-call parity,
$ pi_"put" = X e^(-r T) Phi(-d_-) - S_0 Phi(-d_+) = X e^(-r T) (1 - Phi(d_-)) - S_0 (1 - Phi(d_+)). $

== Estimating volatility

In geometric Brownian motion the _log-returns_ over interval $delta$ satisfy
$ R_t = log(S_t / S_(t - delta)) tilde N((r - 1/2 sigma^2) delta, sigma^2 delta). $
From $M$ daily samples $R_i$ (so $delta = 1$ day), an unbiased estimator is
$ hat(sigma)^2 = 1/((M - 1) delta) sum_(i=1)^M (R_i - overline(R))^2, quad overline(R) = 1/M sum_(i=1)^M R_i. $
Constant volatility is unrealistic over long periods. For Tesla we take $sigma = 0.025 "day"^(-1/2)$.

== Pricing a put option on Tesla stock

*Example.* On close of 31st December 2025, $S_0 = \$449.72$; $sigma = 0.025 "day"^(-1/2)$. The Treasury bill annual yield was $R = 3.7%$ p.a., giving continuous rate $r = log(1 + R) = 3.6%$ p.a. or $r = 9.95 times 10^(-5)$ p.day. Price a put with $X = \$440$, $T = 10$ days:
$ d_- = 1/(sigma sqrt(T)) (log(S_0 / X) + r T - 1/2 sigma^2 T) approx 0.2495, quad d_+ = d_- + sigma sqrt(T) approx 0.3285, $
$ pi_"put" = X e^(-r T) Phi(-d_-) - S_0 Phi(-d_+) = \$440.00 dot 0.9990 dot 0.5985 - \$449.72 dot 0.6287 approx \$9.52. $
At expiry $S_T = \$438.57$, so exercising gives only $\$440.00 - \$438.57 = \$1.43$, not enough to offset $pi_"put"$. With low volatility a _butterfly spread_ might instead profit from stability.

== Put-call parity

For European calls and puts with initial price $S_0$, strike $X$, expiry $T$:
$ pi_C - pi_P = S_0 - X e^(-r T). $
Derivation from Black-Scholes: since $(A)^+ - (-A)^+ = A$, we have $(S_T - X)^+ - (X - S_T)^+ = S_T - X$, so
$ pi_C - pi_P = 1/sqrt(2 pi) S_0 integral_(-infinity)^infinity e^(-1/2 s^2 + s sigma sqrt(T) - 1/2 sigma^2 T) d s - 1/sqrt(2 pi) X e^(-r T) integral_(-infinity)^infinity e^(-1/2 s^2) d s. $
Substituting $y = s - sigma sqrt(T)$ in the first integral, both become $1$, giving $pi_C - pi_P = S_0 - X e^(-r T)$ as in the model-free no-arbitrage argument.

*Exercise.* Which strike makes $pi_C = pi_P$? What is a long call + short put (same counter-party) when $S_T >= X$ vs $S_T <= X$?

== Pricing trading strategies

*Example (Short straddle).* Sell a put and a call on the same asset, strike $X$, expiry $T$. Premium received:
$ "premium" = -pi_("RS") = pi_C + pi_P = 2 pi_P + S_0 - X e^(-r T). $
Pay-off at expiry is $-|S_T - X|$ (buy at $X$, sell at $S_T$ if put exercised; buy at $S_T$, sell at $X$ if call exercised). For Tesla, $pi_P = \$9.52$, $S_0 = \$449.72$, $X = \$440$, $X e^(-r T) = \$439.56$, so $-pi_("RS") = \$29.20$. With $S_T = \$438.57$, loss is $|S_T - X| = \$1.43$, giving profit $\$27.77$ per share, or $\$2,777$ per 100-share unit.

== Value of a contingent claim at general time

At $t in [0, T]$,
$ V(t, S_t) = e^(-r(T - t)) EE_Q [f(S_T) | S_t], $
which in Black-Scholes becomes
$ V(t, S_t) = e^(-r(T - t)) 1/sqrt(2 pi) integral_(-infinity)^infinity e^(-1/2 s^2) f(S_t e^(r(T - t) - 1/2 sigma^2 (T - t) + sigma sqrt(T - t) s)) d s. $
Note $V(0, S_0) = pi_C$ and $V(T, S_T) = f(S_T)$.
