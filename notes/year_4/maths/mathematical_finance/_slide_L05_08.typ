= Lecture 5: Forward Contracts

== Spot price, delivery price, forward price

*Definition (Forward contract).* An agreement to buy or sell an asset at time $T$ years at a price (the _delivery price_) agreed at initiation. The _spot price_ is the current price.

Let $K$ be the delivery price per unit and $S_T$ the spot price at time $T$. Buyer's profit is $S_T - K$ (loss if $S_T < K$); seller's profit is $K - S_T$.

*Definition (Forward price).* The delivery price $F_0$ that applies to a $T$-year forward agreed _now_. In general $F_0 != S_T$.

== Pay-off

Long forward pay-off: $S_T - F_0$. Short forward pay-off: $F_0 - S_T$.

== Frictionless markets

Pricing assumes: continuous compounding; no transaction costs; uniform tax rate on trading profits; equal borrowing/lending rates; arbitrage opportunities exploited as they arise.

== Rational forward price

Spot price $S_0$, no income for $T$ years, risk-free rate $100 r %$ p.a. nominal. With continuous compounding the present value is $F_0 e^(-r T)$.

If $F_0 e^(-r T) < S_0$: owners prefer spot sale, buyers prefer forward. If $F_0 e^(-r T) > S_0$: owners prefer forward, buyers prefer spot. Equilibrium requires

$ F_0 = S_0 e^(r T). $

== Arbitrage argument

Suppose $F_0 > S_0 e^(r T)$:
- Borrow $S_0$, buy one unit, enter a short forward at $F_0$ (zero cost to enter).
- Initial cost $0$. At $T$: bank $-S_0 e^(r T)$, asset $S_T$, forward pay-off $F_0 - S_T$.
- Total: $S_T + (-S_0 e^(r T)) + (F_0 - S_T) = F_0 - S_0 e^(r T) > 0$, arbitrage.

Suppose $F_0 < S_0 e^(r T)$ (the seller will _short sell_ if they hold no asset):
- Borrow asset (ignoring collateral), sell for $S_0$, invest at $r$, enter long forward at $F_0$.
- At $T$: risk-free $S_0 e^(r T)$, short asset $-S_T$, long forward pay-off $S_T - F_0$, return asset.
- Total: $S_0 e^(r T) + (S_T - F_0) + (-S_T) = S_0 e^(r T) - F_0 > 0$, arbitrage.

By the Efficient Market Hypothesis the market forces $F_0 = S_0 e^(r T)$.

*Example.* Bond nominal pound 100, priced pound 130, $r = 6%$, $T = 4/12$, no interest payments: $F_0 = 130 e^(0.06 dot 4/12) = 130 e^(0.02) approx 132.63$.

== Forwards on income-generating assets

*Covered vs uncovered short.* A _covered short forward_ holds the asset throughout $[0, T]$; an _uncovered (naked) short_ acquires it at $T$. Only covered receives the income. The distinction affects cash flows but not the forward price.

*Proposition.* If the asset generates a cash flow with known present value $I$ over $[0, T]$, then

$ F_0 = (S_0 - I) e^(r T). $

(Note $0 < I <= S_0$ else arbitrage.)

*Proof.* Suppose $F_0 < (S_0 - I) e^(r T)$:
- Short sell asset ($S_0$), invest at $r$, enter long forward at $F_0$.
- Pay asset's cash flows to lender (present value $I$, value $I e^(r T)$ at $T$).
- At $T$ buy at $F_0$, return asset. Profit $(S_0 - I) e^(r T) - F_0 > 0$. #h(1fr) $square$

Exercise: construct the strategy for $F_0 > (S_0 - I) e^(r T)$.

*Example.* Bond pound 130, $r = 6%$, coupon $8%$ p.a. on pound 100, next payment in 3 months, $T = 4/12$. Single payment is pound 4, so

$ I = 4 e^(-0.06 dot 3/12) = 3.940, quad F_0 = (130 - 3.94) e^(0.06 dot 4/12) = 128.61. $

== Continuous dividend yield

An asset pays dividends continuously at instantaneous rate $q S_t$ (fixed proportion $q$ of current price). E.g. an index-tracking portfolio; if $q = 0.05$ and price is pound 100, dividends accrue at pound 5/yr; if price rises to pound 200, dividends rise to pound 10/yr. The no-arbitrage forward price is

$ F_0 = S_0 e^((r - q) T). $

*Proof.* Suppose $F_0 > S_0 e^((r - q) T)$:
- Borrow $S_0$, buy asset, enter short forward at $F_0$.
- Reinvest dividends at $r$. Modelling $S_t = S_0 e^((r - q) t)$ deterministically,

$ integral_0^T q S_t e^(r(T - t)) d t = integral_0^T q S_0 e^((r - q) t) e^(r(T - t)) d t = S_0 e^(r T) (1 - e^(-q T)). $

(The forward price is model-independent but that needs more work.)
- At $T$ deliver for $F_0$, repay loan $S_0 e^(r T)$. Profit $F_0 + S_0 e^(r T)(1 - e^(-q T)) - S_0 e^(r T) = F_0 - S_0 e^((r - q) T) > 0$.

Suppose $F_0 < S_0 e^((r - q) T)$:
- Short sell, invest $S_0$ at $r$, enter long forward at $F_0$.
- Pay dividends $q S_t$ to lender, value at $T$: $integral_0^T q S_t e^(r(T - t)) d t = S_0 e^(r T)(1 - e^(-q T))$.
- At $T$ buy at $F_0$. Profit $-F_0 - S_0 e^(r T)(1 - e^(-q T)) + S_0 e^(r T) = S_0 e^((r - q) T) - F_0 > 0$. #h(1fr) $square$

*Example.* FTSE 100 tracker, $S_0 = 1000$, $q = 0.04$, $r = 0.05$, $T = 2$:

$ F_0 = 1000 e^(0.01 dot 2) approx 1020.20. $

== Portfolios

A _portfolio_ is a collection of asset holdings, described by the value of each asset at $t = 0$ or by the units held. For bond price $pi_0$ and share price $pi_1$, holding $xi_0$ bonds and $xi_1$ shares gives initial value

$ xi_0 pi_0 + xi_1 pi_1. $

By convention subscript $0$ is the riskless asset. $xi_0 < 0$: borrowing; $xi_0 > 0$: investing; $xi_1 < 0$: short position; $xi_1 > 0$: long position.

= Lecture 6: Options

== Forwards and futures

Forward and futures contracts: zero initial cost; forwards bespoke, futures regulated and exchange-traded; both _oblige_ delivery at the agreed price. No-arbitrage gives

$ F_0 = S_0 e^(r T) quad & "no income" \
F_0 = (S_0 - I) e^(r T) quad & "income with PV" I \
F_0 = S_0 e^((r - q) T) quad & "continuous dividend rate" q $

Long forward pay-off $S_T - F_0$; short forward pay-off $F_0 - S_T$.

== Basic terms

*Definition (Options).* A _call option_ confers the right but not the obligation to buy an asset on/by a certain date at the _strike price_ $X$; a _put option_ confers the right but not the obligation to sell. The date is the _expiration date_.

_American options_ may be exercised at any time up to expiry; _European options_ only on expiry.

Differences from forwards/futures: options have a premium (forwards cost nothing to enter); the option holder has the right, not the obligation, to exercise. Calls protect against rising prices, puts against falling prices.

== Necessity of a premium

A long call at zero cost would be arbitrage: if $S_T > X$ exercise and profit $S_T - X$; if $S_T <= X$ let expire. Zero cost, non-zero profit chance, no risk. The premium removes this arbitrage.

== Short and long

The premium is paid by the long holder to the short holder.

- _Long call_ (A): right to buy from B at $X$ at $T$; A pays $pi_C$.
- _Long put_ (A): right to sell to B at $X$ at $T$; A pays $pi_P$.
- _Short call_ (A): B has right to buy from A at $X$ at $T$; A receives $pi_C$.
- _Short put_ (A): B has right to sell to A at $X$ at $T$; A receives $pi_P$.

== Pay-off structure of options

#table(
  columns: 3,
  stroke: none,
  align: left,
  [*Option*], [*Pay-off (excl)*], [*Pay-off (incl)*],
  [Long call], [$max{S_T - X, 0}$], [$-pi_C + max{S_T - X, 0}$],
  [Long put], [$max{X - S_T, 0}$], [$-pi_P + max{X - S_T, 0}$],
  [Short call], [$-max{S_T - X, 0}$], [$pi_C - max{S_T - X, 0}$],
  [Short put], [$-max{X - S_T, 0}$], [$pi_P - max{X - S_T, 0}$],
)

Note $-max{x, y} = min{-x, -y}$.

== European options: Pricing and notation

Pricing depends on: spot and strike prices; time to expiration; volatility; risk-free rate; income.

$S_0, S_T$: asset price now and at $T$; $X$: strike; $pi_C, pi_P$: current European call/put prices. Rate $r$, no dividends (for now).

== Short selling

_Short selling_ is selling an asset you do not own (equivalent to a negative holding). Practically: borrow asset, commit to return (close out) by repurchase. Real costs: income due to original holder (dividends/coupons), margin account, borrowing fees. In a _frictionless market_ these are ignored.

== European options: upper bounds

*Proposition.* No arbitrage implies $pi_C <= S_0$.

*Proof.* If $pi_C > S_0$: sell call for $pi_C$, buy asset for $S_0$, invest $pi_C - S_0$ at $r$. At $T$, profit $(pi_C - S_0) e^(r T) + min(S_T, X) > 0$. Arbitrage. #h(1fr) $square$

*Proposition.* No arbitrage implies $pi_P <= X e^(-r T)$.

*Proof.* If $pi_P > X e^(-r T)$: sell put for $pi_P$, invest at $r$. If $S_T < X$ exercised: buy at $X$, sell at $S_T$, profit $pi_P e^(r T) - X + S_T = (pi_P - X e^(-r T)) e^(r T) + S_T > 0$. If $S_T >= X$: profit $pi_P e^(r T) > 0$. Arbitrage. #h(1fr) $square$

== No arbitrage dominance principle

If $V_A (T) >= V_B (T)$ in every state of the market, then $V_A (0) >= V_B (0)$. Otherwise, buy A and short sell B for initial cash flow $V_B (0) - V_A (0) > 0$, invest at $r$; at $T$ the A payoff covers the short in B, leaving risk-free profit.

== European options: lower bounds

*Proposition.* No arbitrage implies $pi_C >= max{S_0 - X e^(-r T), 0}$.

*Proof.* Portfolios A: one European call plus cash $X e^(-r T)$; B: one share. Cash grows to $X$ by $T$. If $S_T > X$ exercise, A is worth $S_T$; else A is worth $X$. So $V_A (T) = max{S_T, X} >= S_T = V_B (T)$. Dominance:

$ underbrace(pi_C + X e^(-r T), "PV of A") >= underbrace(S_0, "PV of B") ==> pi_C >= S_0 - X e^(-r T). $

Since an unexercised call is worthless, $pi_C >= 0$. #h(1fr) $square$

*Proposition.* No arbitrage implies $pi_P >= max{X e^(-r T) - S_0, 0}$.

*Proof.* Portfolios C: one European put plus one share; D: cash $X e^(-r T)$. If $S_T < X$, exercise put: C worth $X$; else C worth $S_T$. So $V_C (T) = max{X, S_T} >= X = V_D (T)$. Dominance:

$ underbrace(pi_P + S_0, "PV of C") >= underbrace(X e^(-r T), "PV of D") ==> pi_P >= X e^(-r T) - S_0. $

Since $pi_P >= 0$, done. #h(1fr) $square$

== Law of one price and put-call parity

*Law of one price.* If two portfolios have identical payoffs in every state at the same future time, their present prices are equal (apply dominance both ways).

*Proposition (Put-call parity).* No arbitrage implies

$ pi_C - pi_P = S_0 - X e^(-r T). $

*Proof.* Portfolios Y: put plus share; Z: call plus cash $X e^(-r T)$.

Y: if $S_T < X$ exercise put, worth $X$; else worth $S_T$. So $V_Y (T) = max{X, S_T}$.

Z: if $S_T < X$ call expires, worth $X$; else exercise call, worth $S_T$. So $V_Z (T) = max{X, S_T}$.

Identical payoffs, so $pi_P + S_0 = pi_C + X e^(-r T)$. #h(1fr) $square$

== European options: Summary of bounds

$ max{X e^(-r T) - S_0, 0} <= pi_P <= X e^(-r T) $
$ max{S_0 - X e^(-r T), 0} <= pi_C <= S_0 $
$ pi_C - pi_P = S_0 - X e^(-r T). $

*Example.* $S_0 = 38$, $X = 40$, $r = 0.1$, $T = 3/12 = 0.25$:

$ 0.00 <= pi_C <= 38.00, quad 1.01 <= pi_P <= 39.01, quad pi_C - pi_P = -1.01. $

== European options with dividends

If the asset generates income with present value $I$ over $[0, T]$:

$ max{X e^(-r T) - S_0 + I, 0} <= pi_P <= X e^(-r T) $
$ max{S_0 - I - X e^(-r T), 0} <= pi_C <= S_0 - I $
$ pi_C - pi_P = S_0 - I - X e^(-r T). $

Exercise: establish these via arbitrage, noting $S_0 >= I$.

*Example.* Previous example plus dividend with present value pound 4: $S_0 - I - X e^(-r T) = 38 - 4 - 40 e^(-1/120) approx -5.01$, so

$ 0 <= pi_C <= 34.00, quad 5.01 <= pi_P <= 39.01, quad pi_C = pi_P - 5.01. $

== Proof of call upper bound with dividends

*Proposition.* No arbitrage implies $pi_C <= S_0 - I$.

*Proof.* Portfolios E: one call; F: hold asset, short the income. F has pay-off $S_T$ (income obligations discharged); E has pay-off $max{S_T - X, 0} <= S_T$. Dominance gives $S_0 - I >= pi_C$. #h(1fr) $square$

*Other bounds (asset generating income).*

Lower bound for call — G: call; H: asset, short income ($-I$), borrow $X e^(-r T)$.

Upper bound for put — I: put; J: risk-free bond paying $X$ at $T$.

Lower bound for put — K: put; L: short asset, risk-free bond paying $X$, liability for income (present value $I$, contributing $+I$ at $t = 0$).

Exercise: construct portfolios yielding put-call parity with income.

= Lecture 7: American Options and Trading Strategies

== Recall: European bounds

No-arbitrage bounds when no income:

$ max{S_0 - X e^(-r T), 0} <= pi_C <= S_0 \
max{X e^(-r T) - S_0, 0} <= pi_P <= X e^(-r T) \
pi_C - pi_P = S_0 - X e^(-r T) quad "put-call parity" $

With income of PV $I$: replace $S_0$ by $S_0 - I$; $S_0 >= I$.

== Price, pay-off and profit

In a frictionless market the portfolio _value_ $V(0)$ is the market price (cash flow to acquire is $-V(0)$). With no intermediate cash flows, _pay-off_ at $T$ is $V(T)$ and _profit_ is $V(T) - V(0)$.

For assets indexed $i = 1, dots, N$ with unit prices $pi_i$ and holdings $xi_i$, plus riskless bond ($i = 0$, $pi_0 = 1$),

$ V(0) = underbrace(xi_0 pi_0, "riskless") + underbrace(sum_(i=1)^N xi_i pi_i, "other"). $

*Example (Short call plus share).* $xi_1 = -1$ (short call), $xi_2 = 1$ (long share). $V(0) = S_0 - pi_C$. A short position ($xi_i < 0$) contributes negatively: you are paid to acquire it. At $T$:

$ V(T) = S_T - max{S_T - X, 0} = min{S_T, X}, quad "Profit" = min{S_T, X} + pi_C - S_0. $

== American options

Let $pi_(C_A), pi_(P_A)$ be American call/put prices (same $X, T$ as their European counterparts $pi_C, pi_P$). American flexibility suggests $pi_(C_A) >= pi_C$, $pi_(P_A) >= pi_P$.

*Proposition.* $pi_(C_A) >= pi_C$.

*Proof.* If $pi_(C_A) < pi_C$: buy American, sell European, invest $pi_C - pi_(C_A) > 0$ at $r$. At $T$, if $S_T > X$ European exercised; exercise American to meet obligation. Either way profit $(pi_C - pi_(C_A)) e^(r T) > 0$. Arbitrage. #h(1fr) $square$

By similar argument $pi_(P_A) >= pi_P$.

*Example (portfolio formulation).* Take $xi_1 = -1$ European call, $xi_2 = 1$ American call, $xi_0 = pi_C - pi_(C_A)$. Then $V(0) = 0$. At $T$, $V(T) = (pi_C - pi_(C_A)) e^(r T) + (-1 + 1) max{S_T - X, 0} = (pi_C - pi_(C_A)) e^(r T) > 0$. Arbitrage.

== American puts: bounds

*Proposition.* $X - S_0 <= pi_(P_A) < X$.

*Proof.*
- If $pi_(P_A) < X - S_0$: buy put and stock, exercise immediately, profit $X - pi_(P_A) - S_0 > 0$.
- If $pi_(P_A) >= X$: sell put, invest. If exercised at $t in (0, T)$: buy at $X$, sell at $S_t$, profit $pi_(P_A) e^(r t) - X + S_t >= (e^(r t) - 1) X + S_t > 0$. Else profit $pi_(P_A) e^(r T) > 0$. #h(1fr) $square$

== American call = European call (no dividends)

*Proposition.* Without dividends, $pi_(C_A) = pi_C$.

*Proof.* Given $pi_(C_A) >= pi_C$, assume $pi_(C_A) > pi_C$. Sell American for $pi_(C_A)$, buy European for $pi_C$, invest $pi_(C_A) - pi_C$ at $r$. If American is exercised at $t$: borrow a share, sell at $X$, invest. At $T$ exercise European, buy at $X$, return share. Profit $(pi_(C_A) - pi_C) e^(r T) + X(e^(r(T - t)) - 1) > 0$. If not exercised: profit $(pi_(C_A) - pi_C) e^(r T) > 0$. Arbitrage. #h(1fr) $square$

== American put-call parity

*Proposition.*

$ S_0 - X <= pi_(C_A) - pi_(P_A) <= S_0 - X e^(-r T). $

*Example.* $S_0 = 19$, $X = 20$, $r = 0.06$, $T = 1/2$:

$ 1 <= pi_(P_A) < 20, quad S_0 - X e^(-r T) = 19 - 20 e^(-0.03) approx -0.41 $
$ -1 <= pi_(C_A) - pi_(P_A) <= -0.41. $

== Trading strategies

Derivatives are used for _hedging_ (reducing risk) or _speculation_ (profiting on expected moves).

- Long call: profit $-pi_C + max{S_T - X, 0}$; loss limited, unlimited upside.
- Long put: profit $-pi_P + max{X - S_T, 0}$; loss limited, upside as $S_T$ falls below $X$.
- Short call: profit $pi_C - max{S_T - X, 0}$; profit capped, unlimited loss.
- Short put: profit $pi_P - max{X - S_T, 0}$; profit capped, unlimited loss.

== Strike-price monotonicity

*Proposition.* For $X_2 > X_1$: $pi_C (X_2) <= pi_C (X_1)$ (calls non-increasing); $pi_P (X_2) >= pi_P (X_1)$ (puts non-decreasing).

*Proof.* Portfolios A: short call at $X_1$ plus share; B: short call at $X_2$ plus share. $V_A (T) = min{S_T, X_1}$, $V_B (T) = min{S_T, X_2} >= V_A (T)$. Values at $0$: $S_0 - pi_C (X_1), S_0 - pi_C (X_2)$. Dominance: $S_0 - pi_C (X_2) >= S_0 - pi_C (X_1)$, so $pi_C (X_2) <= pi_C (X_1)$. #h(1fr) $square$

= Lecture 8: Trading Strategies, Spreads, Combinations

== Covered call

*Definition.* Long asset plus short call on the same asset. $pi_1 = S_0$, $pi_2 = pi_C$, $xi_1 = 1$, $xi_2 = -1$:

$ V(0) = S_0 - pi_C, quad V(T) = S_T - max{S_T - X, 0} = min{S_T, X}. $

$ "Profit" = underbrace((S_T - S_0), "stock") + underbrace(cases(pi_C\, & S_T <= X, -S_T + X + pi_C\, & S_T >= X), "short call") = min{X, S_T} - S_0 + pi_C. $

Recall $pi_C <= S_0$. Limited profit $X - (S_0 - pi_C)$; worst case $pi_C - S_0$ (loss $S_0 - pi_C$), vs just holding the asset (unbounded gain, max loss $S_0$). A _bullish_ position with reduced downside — "I'd be happy to sell at this price, and want income while I wait."

== Protective put

*Definition.* Long asset plus long put on the same asset.

$ "Profit" = (S_T - S_0) + cases(-pi_P + X - S_T\, & S_T <= X, -pi_P\, & S_T >= X) = max{X, S_T} - S_0 - pi_P. $

$pi_P <= X$. Unlimited gain, max loss $S_0 - (X - pi_P)$. _Bullish_ with insurance premium — "I want to hold this, but fear a crash."

== Spreads and combinations

*Definition (Spread).* Taking positions in two or more options of the same type on the same asset. _Vertical_: same expiry, different strikes. _Horizontal (calendar)_: same strike, different expiries. _Diagonal_: differ in both.

*Definition (Combination).* Positions in both calls and puts on the same asset.

== Bull spread

*Definition.* Constructed from two calls or two puts, same expiry $T$.

_Bull call spread_: long call at $X_1$ for $pi_C (X_1)$, short call at $X_2 > X_1$ for $pi_C (X_2)$.

_Bull put spread_: long put at $X_1$ for $pi_P (X_1)$, short put at $X_2 > X_1$ for $pi_P (X_2)$.

Bull call pay-off:

$ V(T) = max{S_T - X_1, 0} - max{S_T - X_2, 0} = cases(
  0\, quad & S_T <= X_1,
  S_T - X_1\, quad & X_1 <= S_T <= X_2,
  X_2 - X_1\, quad & X_2 <= S_T
). $

$V(0) = pi_("bull call") (X_1, X_2) = pi_C (X_1) - pi_C (X_2) > 0$.

Bull put pay-off:

$ V(T) = max{X_1 - S_T, 0} - max{X_2 - S_T, 0} = cases(
  X_1 - X_2\, quad & S_T <= X_1,
  S_T - X_2\, quad & X_1 <= S_T <= X_2,
  0\, quad & X_2 <= S_T
). $

$V(0) = pi_("bull put") (X_1, X_2) = pi_P (X_1) - pi_P (X_2) < 0$.

== Price of a bull spread

Compare portfolio A (bull call) with B (bull put plus cash $(X_2 - X_1) e^(-r T)$ at $r$); identical payoffs in all states. Law of one price:

$ pi_("bull call") (X_1, X_2) = pi_("bull put") (X_1, X_2) + (X_2 - X_1) e^(-r T). $

Bull call: pay premium, gain if price rises and both calls exercised, lose premium if both expire. Bull put: receive premium, gain if both puts expire, lose some credit if both exercised.

Pay-off is at most $X_2 - X_1$, dominated by a risk-free bond paying $X_2 - X_1$ at $T$:

$ 0 <= pi_("bull call") (X_1, X_2) <= (X_2 - X_1) e^(-r T). $

The spread price is usually well below this cap, offering a higher potential return than the risk-free rate with capped loss.

*Example (Gold).* September 2025: bull call spread on 10 oz of gold, $X_1 = "pound" 25,000$, $X_2 = "pound" 30,000$, $T = 4$ months, $r = 4%$. Price pound 1000. January 2026 gold: pound 4000/oz. Annual rate of return $r = 482%$.

== Bear spread

*Definition.* Constructed from two calls or two puts, same expiry $T$.

_Bear call spread_: long call at $X_2$, short call at $X_1 < X_2$; net premium received $pi_C (X_1) - pi_C (X_2)$.

_Bear put spread_: long put at $X_1$, short put at $X_2 > X_1$; net premium paid $pi_P (X_2) - pi_P (X_1) > 0$.

A bear spread profits from a _fall_ in asset value.

*Exercise.* Repeat the bull-spread analysis: compute and sketch the payoff; use law of one price to connect the two constructions; bound the bear put spread via no-arbitrage dominance.

== Combinations

*Example (Straddle).* Long call and long put, same $T$ and strike $X$ (asset pays no income). If $S_T approx X$ small loss; if $S_T$ moves far from $X$ in either direction, substantial profit.

$ V(T) = max{S_T - X, 0} + max{X - S_T, 0} = |S_T - X|. $

$ V(T) - V(0) = |S_T - X| - pi_("straddle") = cases(
  X - S_T - pi_("straddle") (X)\, quad & S_T <= X "(put exercised)",
  S_T - X - pi_("straddle") (X)\, quad & S_T >= X "(call exercised)"
). $

== Other strategies

All options with expiry $T$, asset generates no income.

#table(
  columns: 3,
  stroke: none,
  align: left,
  [*Strategy*], [*Count*], [*Construction*],
  [Strangle], [$2$], [Buy 1 call at strike $X_2$ and 1 put at strike $X_1 < X_2$.],
  [Strap], [$3$], [Buy 2 calls and 1 put all at strike $X$.],
  [Strip], [$3$], [Buy 1 call and 2 puts all at strike $X$.],
  [Butterfly], [$4$], [Buy 1 call at $X - a$, sell 2 calls at $X$, buy 1 call at $X + a$, $a > 0$.],
  [Iron Condor], [$4$], [Buy 1 call at $X_2 + a$, sell 1 call at $X_2$, sell 1 put at $X_1$, buy 1 put at $X_1 - a$, with $X_2 > X_1$, $a > 0$.],
)

Others: Christmas Tree, Iron Butterfly, Jade Lizard.

*Exercise.* Pick a strategy, compute the payoff, bound its price by no-arbitrage dominance, and sketch the profit curve.

Combinations of calls and puts approximate any pay-off curve (Carr-Madan formula).
