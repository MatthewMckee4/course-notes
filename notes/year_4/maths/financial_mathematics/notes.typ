#set document(title: "Financial Mathematics")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none)
#pagebreak()

// 1.
= Assets, Odds & Betting, Hedging, Arbitrage

== Assets

An *asset* is anything of value that can be owned or controlled. *Tangible assets* have physical form (real estate, machinery, commodities). *Financial assets* derive value from contractual claims (stocks, bonds, derivatives, currencies).

== Odds and Betting

*Fractional odds* $a:b$ mean a stake of $b$ yields profit $a$ if you win (total return $a + b$). *Decimal odds* $d$ give total return $d$ per unit staked, so profit is $d - 1$. Conversion: fractional $a:b$ gives decimal odds $d = (a + b) / b = a / b + 1$.

*Implied probability* from decimal odds $d$: $p = 1 / d$. From fractional odds $a:b$: $p = b / (a + b)$.

== Hedging

*Hedging* means betting on all outcomes to guarantee profit regardless of result. Consider two complementary bets with decimal odds $alpha$ and $beta$. Stake $1 / alpha$ on outcome 1 and $1 / beta$ on outcome 2, total stake $1 / alpha + 1 / beta$. Return is always 1, so guaranteed profit iff:

$ 1 / alpha + 1 / beta < 1 quad <==> quad alpha beta > alpha + beta $

Equivalently the condition is $alpha beta > 1$ after normalising stakes.

== Arbitrage

*Arbitrage* is exploiting price differences across markets for risk-free profit. *Currency arbitrage*: if exchange rates between two markets differ, buy in the cheaper market and sell in the more expensive one.

*Triangular arbitrage*: exploit inconsistencies in cross-rates among three currencies. Starting with currency A, convert $A -> B -> C -> A$. If the product of exchange rates along the cycle exceeds 1, there is an arbitrage opportunity.

== Frictionless Market Assumptions

A *frictionless market* assumes: no transaction costs, no bid-ask spread, unlimited borrowing/lending at the risk-free rate, no restrictions on short selling, and no taxes.

// 2.
= Time Value of Money

== Simple Interest

With principal $P$, annual rate $r$, and time $T$ years:

$ P_T = P(1 + r T) $

== Compound Interest

Compounding annually:

$ P_T = P(1 + r)^T $

*Rule of 72*: the doubling time is approximately $72 / r$ years (where $r$ is expressed as a percentage).

== Conversion Periods

Compounding $n$ times per year at nominal annual rate $r$:

$ P_T = P (1 + r / n)^(T n) $

== Continuous Compounding

Taking $n -> infinity$:

$ P_T = P e^(r T) $

== Effective Interest Rate

The *effective annual rate* $r_"eff"$ is the equivalent annual rate that gives the same return as compounding $n$ times per year:

$ r_"eff" = (1 + r / n)^n - 1 $

As $n -> infinity$: $r_"eff" = e^r - 1$.

== Force of Interest

For time-varying rate $r(t)$, the accumulated value is:

$ P(t) = P(0) exp(integral_0^t r(s) dif s) $

The *force of interest* $delta(t) = r(t)$ is the instantaneous rate of growth.

// 3.
= Mortgages, Annuities, Present Value

== Mortgage Payments

A loan of $P$ at nominal annual rate $r$ compounded $n$ times per year over $T$ years, with regular payment $A$. After each period, the outstanding balance $P_k$ satisfies:

$ P_(k+1) = P_k (1 + r / n) - A, quad P_0 = P $

Solving this recurrence (requiring $P_(T n) = 0$) gives:

$ A = (P r) / (n (1 - (1 + r / n)^(-T n))) $

== Annuities

An *annuity-immediate* pays $A$ at the end of each period. An *annuity-due* pays at the start. The present value of an annuity-immediate of $N$ payments at rate $i$ per period:

$ "PV" = A dot (1 - (1 + i)^(-N)) / i $

Using geometric series: $sum_(k=1)^N (1 + i)^(-k) = (1 - (1 + i)^(-N)) / i$.

== Present Value of a Cash-Flow

A cash-flow $(x_0, x_1, ..., x_N)$ received at times $0, 1/n, 2/n, ..., N/n$ has present value:

$ V = sum_(k=0)^N x_k (1 + r / n)^(-k) $

== Pensions with Salary Growth

Salary grows at rate $g$ per year, contribution fraction $c$, rate of return $r$ per year, $N$ years of contributions. If $r != g$:

$ G(r, g, N) = c dot "Salary" dot ((1 + r)^N - (1 + g)^N) / (r - g) $

If $r = g$: $G(r, g, N) = c dot "Salary" dot N(1 + r)^(N - 1)$.

== APR

The *Annual Percentage Rate* (APR) is the interest rate $r^*$ such that the present value of all payments equals the loan amount:

$ P = sum_(k=1)^N A_k (1 + r^* / n)^(-k) $

// 4.
= Bonds, Perpetuities, Zero-Coupon Bonds

== APR via Newton-Raphson

When the APR equation $f(r) = 0$ has no closed-form solution, use Newton-Raphson iteration: $r_(n+1) = r_n - f(r_n) / f'(r_n)$.

== Asset Classes

- *Equities* (stocks): ownership shares in a company
- *Bonds* (fixed income): debt instruments paying periodic coupons
- *Commodities*: physical goods (gold, oil, wheat)
- *Currencies* (forex): foreign exchange
- *Derivatives*: contracts whose value depends on an underlying asset

== Bond Pricing

A bond has *nominal (face) value* $F$, *maturity* $T$, and *coupon rate* $c$ (usually paid semi-annually). The bond pays coupons $C = c F / 2$ every 6 months and returns $F$ at maturity.

The *dirty price* is the present value of all future cash flows. The *clean price* is the dirty price minus accrued interest. Quoted prices are usually clean prices.

*Gilt*: a UK government bond, considered risk-free.

== Perpetuity

A *perpetuity* pays $C$ per period forever. Its present value at rate $r$ per period is:

$ V = C / r $

The *running yield* of a bond trading at price $P$ with annual coupon $C$ is:

$ "RY" = C / P $

== Zero-Coupon Bonds

A *zero-coupon bond* (ZCB) pays only the face value at maturity, no coupons. The price of a ZCB with face value 1, maturity $T$, and continuously compounded zero rate $z(T)$:

$ P(T) = e^(-z(T) T) $

*Bootstrapping*: extract zero rates from observed bond prices sequentially. Use short-maturity instruments to find short-term zero rates, then work outward to longer maturities.

// 5.
= Forward Contracts

== Definition

A *forward contract* is an agreement to buy/sell an asset at a future time $T$ (delivery date) for a pre-agreed price $K$ (delivery price). The *spot price* at time $T$ is $S_T$.

*Payoff* at maturity: buyer (long) gets $S_T - K$; seller (short) gets $K - S_T$.

== Frictionless Market Assumptions

1. No transaction costs or taxes
2. Borrowing and lending at the same risk-free rate $r$
3. No restrictions on short selling
4. Assets are perfectly divisible
5. No arbitrage opportunities exist

== Rational Forward Price

*Proposition*: For a non-income-generating asset with spot price $S_0$ and continuously compounded risk-free rate $r$, the rational forward price is:

$ F_0 = S_0 e^(r T) $

*Proof*: If $F_0 > S_0 e^(r T)$: borrow $S_0$, buy asset, enter short forward. At $T$: deliver asset for $F_0$, repay $S_0 e^(r T)$, profit $F_0 - S_0 e^(r T) > 0$. If $F_0 < S_0 e^(r T)$: short sell asset, invest $S_0$, enter long forward. At $T$: collect $S_0 e^(r T)$, buy asset for $F_0$, return asset, profit $S_0 e^(r T) - F_0 > 0$. Both contradict no-arbitrage.

== Income-Generating Assets

If the asset generates known income with present value $I$ during the contract life:

$ F_0 = (S_0 - I) e^(r T) $

== Continuous Dividend Yield

If the asset pays a continuous dividend yield $q$:

$ F_0 = S_0 e^((r - q) T) $

== Portfolio Notation

A portfolio holding $xi_0$ units of asset 0 (at price $pi_0$) and $xi_1$ units of asset 1 (at price $pi_1$) has initial value $V_0 = xi_0 pi_0 + xi_1 pi_1$.

// 6.
= Options

== Definitions

A *European call option* gives the holder the right (not obligation) to *buy* the underlying asset at the *strike price* $X$ at maturity $T$. Payoff: $max{S_T - X, 0}$.

A *European put option* gives the right to *sell* at $X$ at $T$. Payoff: $max{X - S_T, 0}$.

*American options* can be exercised at any time up to $T$. The *premium* (price) of a call is $pi_C$, of a put is $pi_P$.

== Premium Necessity

The premium must be positive. If a call were free ($pi_C = 0$), the holder could profit if $S_T > X$ and lose nothing otherwise -- this is an arbitrage.

== Positions and Payoff

- *Long call*: pay $pi_C$, receive $max{S_T - X, 0}$. Profit: $max{S_T - X, 0} - pi_C e^(r T)$.
- *Short call*: receive $pi_C$, pay $max{S_T - X, 0}$. Profit: $pi_C e^(r T) - max{S_T - X, 0}$.
- *Long put*: pay $pi_P$, receive $max{X - S_T, 0}$. Profit: $max{X - S_T, 0} - pi_P e^(r T)$.
- *Short put*: receive $pi_P$, pay $max{X - S_T, 0}$. Profit: $pi_P e^(r T) - max{X - S_T, 0}$.

== Bounds on Option Prices

*Upper bounds*:

$ pi_C <= S_0, quad pi_P <= X e^(-r T) $

*Lower bounds* (no-arbitrage dominance principle):

$ pi_C >= max{S_0 - X e^(-r T), 0} $
$ pi_P >= max{X e^(-r T) - S_0, 0} $

*Proof of lower bound for calls*: Consider portfolio $A$: one call + $X e^(-r T)$ cash. Portfolio $B$: one share. At $T$: $A$ is worth $max{S_T, X} >= S_T = B$. By no-arbitrage, $pi_C + X e^(-r T) >= S_0$, so $pi_C >= S_0 - X e^(-r T)$. Since $pi_C >= 0$ always, $pi_C >= max{S_0 - X e^(-r T), 0}$.

== Put-Call Parity

For European options on a non-dividend-paying asset:

$ pi_C - pi_P = S_0 - X e^(-r T) $

*Proof*: Portfolio $A$: long call + $X e^(-r T)$ cash. Portfolio $B$: long put + one share. At $T$: both portfolios are worth $max{S_T, X}$. By no-arbitrage, $pi_C + X e^(-r T) = pi_P + S_0$.

== Summary of Bounds

$ max{S_0 - X e^(-r T), 0} <= pi_C <= S_0 $
$ max{X e^(-r T) - S_0, 0} <= pi_P <= X e^(-r T) $

== European Options with Dividends

If the asset pays known income with present value $I$ during the option's life:

$ pi_C >= max{S_0 - I - X e^(-r T), 0} $
$ pi_P >= max{X e^(-r T) - S_0 + I, 0} $

Put-call parity becomes: $pi_C - pi_P = S_0 - I - X e^(-r T)$.

*Proposition*: If dividends are paid, $pi_C <= S_0 - I$.

// 7.
= American Options & Trading Strategies

== American vs European Options

Since American options can be exercised at any time up to $T$, they are at least as valuable:

$ pi_(C_A) >= pi_C, quad pi_(P_A) >= pi_P $

== American Calls (No Dividends)

*Proposition*: If no dividends are paid, $pi_(C_A) = pi_C$.

*Proof*: We have $pi_(C_A) >= pi_C >= S_0 - X e^(-r T) > S_0 - X$ (since $e^(-r T) < 1$). Early exercise gives $S_0 - X$, which is less than the option's value, so early exercise is never optimal.

== American Put Bounds

$ X - S_0 <= pi_(P_A) < X $

The lower bound comes from immediate exercise. The upper bound: if $pi_(P_A) >= X$, we could sell the put and invest the premium risk-free, which dominates any payoff from the put.

== American Put-Call Parity

For American options on a non-dividend-paying asset:

$ S_0 - X <= pi_(C_A) - pi_(P_A) <= S_0 - X e^(-r T) $

== Trading Strategies

*Hedging*: reducing risk exposure. *Speculation*: taking on risk for potential profit.

- *Long call*: bullish, limited downside ($-pi_C e^(r T)$), unlimited upside
- *Short call*: bearish/neutral, profit capped at $pi_C e^(r T)$
- *Long put*: bearish, limited downside ($-pi_P e^(r T)$), large upside
- *Short put*: bullish/neutral, profit capped at $pi_P e^(r T)$

// 8.
= Trading Strategies: Spreads and Combinations

== Covered Call

Hold the asset and sell a call. Portfolio value at $T$:

$ V(T) = S_T - max{S_T - X, 0} = min{S_T, X} $

Caps upside at $X$ but generates premium income.

== Protective Put

Hold the asset and buy a put. Portfolio value at $T$:

$ V(T) = S_T + max{X - S_T, 0} = max{X, S_T} $

Provides a floor of $X$ on the portfolio value.

== Spreads

A *spread* combines options of the same type (all calls or all puts) with different strikes or maturities. *Vertical spread*: same maturity, different strikes. *Horizontal spread* (calendar): same strike, different maturities. *Diagonal spread*: different strikes and maturities.

=== Bull Call Spread

Buy call at $X_1$, sell call at $X_2$ ($X_1 < X_2$). Payoff:

$ V(T) = cases(
  0 & "if" S_T <= X_1,
  S_T - X_1 & "if" X_1 < S_T <= X_2,
  X_2 - X_1 & "if" S_T > X_2
) $

Net premium: $pi_(C_1) - pi_(C_2) > 0$ (since lower strike call costs more). Profit is bounded: $-(pi_(C_1) - pi_(C_2))e^(r T) <= "Profit" <= (X_2 - X_1) - (pi_(C_1) - pi_(C_2))e^(r T)$.

=== Bull Put Spread

Buy put at $X_1$, sell put at $X_2$ ($X_1 < X_2$). Generates net premium income $pi_(P_2) - pi_(P_1) > 0$. Maximum loss: $(X_2 - X_1) - (pi_(P_2) - pi_(P_1))e^(r T)$.

*Relationship*: Bull call spread + bull put spread = $(X_2 - X_1)e^(-r T) - (pi_(C_1) - pi_(C_2)) - (pi_(P_1) - pi_(P_2))$, which simplifies using put-call parity.

=== Bear Spread

Reverse of a bull spread. Bear call spread: sell call at $X_1$, buy call at $X_2$ ($X_1 < X_2$). Profits when the price falls.

== Combinations

Combine calls and puts on the same underlying.

=== Straddle

Buy call and put at the same strike $X$. Payoff: $|S_T - X|$. Profits from large price moves in either direction.

=== Other Strategies

- *Strangle*: buy OTM call and OTM put (different strikes). Cheaper than straddle, needs larger move to profit.
- *Strap*: 2 calls + 1 put at same strike. Bullish bias.
- *Strip*: 1 call + 2 puts at same strike. Bearish bias.
- *Butterfly spread*: buy calls at $X_1$ and $X_3$, sell 2 calls at $X_2 = (X_1 + X_3) / 2$. Profits when price stays near $X_2$.
- *Iron condor*: sell OTM put and OTM call, buy further OTM put and call. Profits from low volatility.

// 9.
= One-Period Binomial Model

== Setup

Two time points $t = 0$ and $t = 1$, two states of the world $omega in {U, D}$ (up and down).

*Bond*: $B(U) = B(D) = pi_0 (1 + r)$ (deterministic payoff).

*Stock*: $S(U) = pi_1 u$, $S(D) = pi_1 d$ where $u > d > 0$.

*Convention*: $0 < d <= 1 + r <= u$ (to exclude trivial arbitrage).

== Portfolio Value

A portfolio $overline(xi) = (xi_0, xi_1)$ holding $xi_0$ bonds and $xi_1$ shares has:

$ V_0 = xi_0 pi_0 + xi_1 pi_1 $
$ V_1(omega) = xi_0 B(omega) + xi_1 S(omega) = xi_0 pi_0 (1 + r) + xi_1 S(omega) $

== Replication Lemma

*Lemma*: (i) $V_1(U) = V_1(D)$ iff $u = d$. (ii) If $u != d$, the unique portfolio replicating payoff $phi$ with $phi(U) = 1$, $phi(D) = 0$ has:

$ xi_1 = 1 / (pi_1 (u - d)), quad xi_0 = (-d) / ((u - d)(1 + r) pi_0) $

*Proof of (ii)*: Solve $xi_0 pi_0(1+r) + xi_1 pi_1 u = 1$ and $xi_0 pi_0(1+r) + xi_1 pi_1 d = 0$. Subtracting: $xi_1 pi_1(u - d) = 1$, giving $xi_1 = 1 / (pi_1(u-d))$. Then $xi_0 = -d / ((u-d)(1+r)pi_0)$.

== Arrow-Debreu Securities

*Contingent claim*: any payoff that depends on the state. A *security* has non-negative payoff. A *derivative* has payoff depending on the stock price.

*Arrow-Debreu securities*:

$ phi^U (omega) = cases(1 & "if" omega = U, 0 & "if" omega = D), quad phi^D (omega) = cases(0 & "if" omega = U, 1 & "if" omega = D) $

These form a basis: any payoff $phi$ with $phi(U) = a$, $phi(D) = b$ can be written $phi = a phi^U + b phi^D$.

== Arrow-Debreu Prices

$ pi_(phi^U) = (1 + r - d) / ((u - d)(1 + r)), quad pi_(phi^D) = (u - (1 + r)) / ((u - d)(1 + r)) $

Both are positive when $d < 1 + r < u$. They sum to $1 / (1 + r)$.

The price of any contingent claim with payoff $a$ in state $U$ and $b$ in state $D$:

$ V_0 = a dot pi_(phi^U) + b dot pi_(phi^D) $

== Risk-Neutral Probabilities

Define $tilde(p) = (1 + r) pi_(phi^U) = (1 + r - d) / (u - d)$ and $tilde(q) = (1 + r) pi_(phi^D) = (u - (1 + r)) / (u - d)$.

Then $tilde(p) + tilde(q) = 1$, $tilde(p), tilde(q) > 0$, so $(tilde(p), tilde(q))$ defines a probability measure. Under this measure:

$ EE(S / (1 + r)) = (tilde(p) dot pi_1 u + tilde(q) dot pi_1 d) / (1 + r) = pi_1 $

The stock's discounted expected value equals its current price.

== Pay-Off Matrix

The *pay-off matrix* $X$ has rows indexed by states and columns by assets. The market is *complete* iff $X$ is invertible (or has full rank if not square).

For the binomial model: $X = mat(pi_0(1+r), pi_1 u; pi_0(1+r), pi_1 d)$, which is invertible when $u != d$.

== Worked Examples

*Example 1*: $pi_1 = 20$, $S(U) = 22$, $S(D) = 18$, $r = 0.04$. Security pays 100 in state $U$, $-50$ in state $D$.

$pi_(phi^U) = (1.04 - 0.9) / ((1.1 - 0.9)(1.04)) = 0.14 / 0.208 approx 0.6731$

$pi_(phi^D) = (1.1 - 1.04) / ((1.1 - 0.9)(1.04)) = 0.06 / 0.208 approx 0.2885$

Price $= 100 times 0.6731 + (-50) times 0.2885 approx 52.88$.

*Example 2*: $pi_1 = 300$, $S(U) = 360$, $S(D) = 270$, $r = 0.02$. Security pays 500 in $U$, 200 in $D$.

$u = 1.2$, $d = 0.9$. $pi_(phi^U) = (1.02 - 0.9) / (0.3 times 1.02) approx 0.3922$. $pi_(phi^D) = (1.2 - 1.02) / (0.3 times 1.02) approx 0.5882$.

Price $= 500 times 0.3922 + 200 times 0.5882 approx 313.73$.

== European Call in Binomial Model

A European call with strike $X$ has payoff $C(omega) = max{S(omega) - X, 0}$.

$ pi_C = max{S(U) - X, 0} dot pi_(phi^U) + max{S(D) - X, 0} dot pi_(phi^D) $

// 10.
= Probability Theory

== Sample Spaces and Events

A *sample space* $Omega != emptyset$ is the set of all possible outcomes of an experiment. A *random event* is a subset $A subset.eq Omega$.

*Examples*: coin flip $Omega = {H, T}$; die roll $Omega = {1,2,3,4,5,6}$; stock price $Omega = (0, infinity)$.

== Sigma-Algebras

A *$sigma$-algebra* $cal(F)$ on $Omega$ is a collection of subsets satisfying:
+ $emptyset in cal(F)$
+ If $A in cal(F)$ then $A^c in cal(F)$ (closed under complement)
+ If $A_1, A_2, ... in cal(F)$ then $union.big_(n=1)^infinity A_n in cal(F)$ (closed under countable union)

*Consequences*: $Omega in cal(F)$ (since $Omega = emptyset^c$). Closed under countable intersection (by De Morgan).

*Examples*:
- *Power set* $cal(P)(Omega) = {A : A subset.eq Omega}$ is the largest $sigma$-algebra
- *Trivial $sigma$-algebra* ${emptyset, Omega}$ is the smallest

*Non-example*: $Omega = {H H, H T, T H, T T}$, $cal(F) = {emptyset, {H H, H T}, {T H, T T}, Omega}$ is a $sigma$-algebra. But ${emptyset, {H H, H T}, {H H, T H}, Omega}$ is not (union ${H H, H T} union {H H, T H} = {H H, H T, T H} in.not cal(F)$).

== Generating Sigma-Algebras

For a collection $cal(K) subset.eq cal(P)(Omega)$, the *$sigma$-algebra generated by $cal(K)$* is:

$ sigma(cal(K)) = inter.big {cal(F) subset.eq cal(P)(Omega) : cal(F) "is a" sigma"-algebra", cal(K) subset.eq cal(F)} $

*Lemma*: $sigma(cal(K))$ is the smallest $sigma$-algebra containing $cal(K)$.

*Proof*: The power set $cal(P)(Omega)$ is a $sigma$-algebra containing $cal(K)$, so the intersection is over a non-empty family. The intersection of $sigma$-algebras is a $sigma$-algebra: $emptyset$ is in all of them; if $A$ is in all, so is $A^c$; countable unions are in each one, hence in the intersection. It contains $cal(K)$ since every $cal(F)$ in the intersection does. It is smallest since any $sigma$-algebra containing $cal(K)$ appears in the intersection.

== Borel Sigma-Algebra

$ cal(B)(RR) := sigma({(a, b] : a <= b}) $

The *Borel $sigma$-algebra* on $RR$ is generated by all half-open intervals.

*Singletons*: ${a} = inter.big_(n in NN) (a - 1 / n, a] in cal(B)(RR)$ (countable intersection of Borel sets).

*Closed intervals*: $[a, b] = {a} union (a, b] in cal(B)(RR)$.

== Probability Measure

A *probability measure* on $(Omega, cal(F))$ is a function $P: cal(F) -> [0, 1]$ satisfying:
+ $P(Omega) = 1$, $P(emptyset) = 0$
+ *Countable additivity*: for pairwise disjoint $A_1, A_2, ... in cal(F)$:

$ P(union.big_(n=1)^infinity A_n) = sum_(n=1)^infinity P(A_n) $

The triple $(Omega, cal(F), P)$ is a *probability space*.

*Example*: Finite $Omega = {omega_1, ..., omega_n}$ with uniform probability: $P({omega_i}) = 1 / n$.

== Properties

*Lemma*:
+ $P(A^c) = 1 - P(A)$
+ *Monotonicity*: $A subset.eq B => P(A) <= P(B)$
+ *Sub-additivity*: $P(A union B) <= P(A) + P(B)$

*Proof of (1)*: $Omega = A union.sq A^c$, so $1 = P(A) + P(A^c)$.

*Proof of (2)*: $B = A union.sq (B backslash A)$, so $P(B) = P(A) + P(B backslash A) >= P(A)$.

*Proof of (3)*: $A union B = A union.sq (B backslash A)$, so $P(A union B) = P(A) + P(B backslash A) <= P(A) + P(B)$.

== Nullsets and Almost Sure Events

A set $N in cal(F)$ is a *$P$-nullset* if $P(N) = 0$. An event holds *$P$-almost surely* ($P$-a.s.) if it holds on a set $A$ with $P(A) = 1$.

// 11.
= Random Variables & Expectation

== Random Variables

A *random variable* is a measurable function $X: Omega -> RR$. Measurability means: for every Borel set $B in cal(B)(RR)$,

$ X^(-1)(B) := {omega in Omega : X(omega) in B} in cal(F) $

It suffices to check this for sets of the form $(a, b]$.

== Integration

*Step 1 -- Characteristic functions*: For $A in cal(F)$, define $bold(1)_A (omega) = 1$ if $omega in A$, 0 otherwise.

$ integral_Omega bold(1)_A (omega) dif P(omega) = P(A) $

*Step 2 -- Step functions*: For $Y = a_1 bold(1)_(A_1) + ... + a_n bold(1)_(A_n)$ with $A_i$ pairwise disjoint:

$ integral_Omega Y dif P = a_1 P(A_1) + ... + a_n P(A_n) $

*Step 3 -- General non-negative RVs*:

$ integral_Omega X dif P := sup{integral_Omega Y dif P : 0 <= Y <= X, Y "step function"} $

== Expectation

The *expectation* of $X$ under $P$ is:

$ EE_P (X) := integral_Omega X(omega) dif P(omega) $

For finite $Omega = {omega_1, ..., omega_n}$:

$ EE_P (X) = sum_(i=1)^n X(omega_i) P({omega_i}) $

*Example*: $Omega = {U, D}$, $P({U}) = p$, $X(U) = 100$, $X(D) = -50$. Then $EE(X) = 100p - 50(1 - p) = 150p - 50$.

*Poisson distribution*: $X ~ "Poi"(lambda)$, $P(X = k) = e^(-lambda) lambda^k / k!$. Then $EE(X) = lambda$.

*Exponential distribution*: $X ~ "Exp"(lambda)$, $f(x) = lambda e^(-lambda x)$. Then $EE(X) = 1 / lambda$.

// 12 (part 1).
= One-Period Market Model

== Definition

A *one-period market model* is a tuple $(Omega, cal(F), P, overline(pi), overline(S))$ where:
- $(Omega, cal(F), P)$ is a probability space
- $overline(pi) = (pi_0, pi_1, ..., pi_d) in RR^(d+1)$ is the *price system* at $t = 0$
- $overline(S) = (S^0, S^1, ..., S^d)$ are the asset values at $t = 1$ (random variables on $Omega$)
- $S^0(omega) = 1 + r$ for all $omega$ (riskless asset), with $pi_0 = 1$

The one-period binomial model is the special case $Omega = {U, D}$, $d = 1$.

== Portfolios

A *portfolio* $overline(xi) = (xi_0, xi_1, ..., xi_d) in RR^(d+1)$. Value at $t = 0$:

$ V(0) = overline(xi) dot overline(pi) = sum_(i=0)^d xi_i pi_i $

Value at $t = 1$:

$ V_1(omega) = overline(xi) dot overline(S)(omega) = xi_0(1 + r) + sum_(i=1)^d xi_i S^i (omega) $

Negative $xi_0 < 0$ means borrowing. Negative $xi_i < 0$ ($i >= 1$) means short selling.

== Arbitrage

An *arbitrage portfolio* $overline(xi)$ satisfies:
+ $overline(xi) dot overline(pi) <= 0$ (zero or negative initial cost)
+ $overline(xi) dot overline(S)(omega) >= 0$ $P$-a.s. (non-negative payoff)
+ $P(overline(xi) dot overline(S) > 0) > 0$ (positive payoff with positive probability)

A market is *arbitrage-free* if no such portfolio exists.

*Lemma*: The market admits arbitrage iff there exists $xi in RR^d$ with $xi dot S >= (1 + r) xi dot pi$ $P$-a.s. and $P(xi dot S > (1 + r) xi dot pi) > 0$.

// 12 (part 2).
= FTAP, Law of One Price, Securities

== Risk-Neutral Measure

A probability measure $Q$ on $(Omega, cal(F))$ is *risk-neutral* if for every asset $i = 0, 1, ..., d$:

$ pi_i = EE_Q (S^i / (1 + r)) $

Equivalently, the discounted expected payoff under $Q$ equals the current price.

*Example (Binomial)*: The risk-neutral probabilities are $tilde(p) = (1 + r - d) / (u - d)$, $tilde(q) = (u - (1 + r)) / (u - d)$.

== Equivalent Probability Measures

Two probability measures $P$ and $Q$ on $(Omega, cal(F))$ are *equivalent* ($P tilde Q$) iff they have the same nullsets: $P(A) = 0 <=> Q(A) = 0$ for all $A in cal(F)$.

*Lemma*: Equivalence of measures is an equivalence relation (reflexive, symmetric, transitive).

For finite sample spaces, all measures $P$ with $P({omega_i}) > 0$ for every $omega_i$ are equivalent.

We write $[P]$ for the equivalence class of $P$.

== First Fundamental Theorem of Asset Pricing (FTAP)

*Theorem*: A one-period market model is arbitrage-free if and only if there exists a risk-neutral measure $Q$ with $Q tilde P$ (i.e., $[P]$ contains a risk-neutral measure).

*Proof ($arrow.l.double$)*: Suppose $Q tilde P$ is risk-neutral and $overline(xi)$ is a portfolio with $overline(xi) dot overline(pi) <= 0$. Then:

$ overline(xi) dot overline(pi) = sum_(i=0)^d xi_i pi_i = sum_(i=0)^d xi_i EE_Q (S^i / (1+r)) = EE_Q (overline(xi) dot overline(S) / (1+r)) $

So $EE_Q (overline(xi) dot overline(S)) = (1+r) overline(xi) dot overline(pi) <= 0$. If also $overline(xi) dot overline(S) >= 0$ $Q$-a.s. (equivalently $P$-a.s. since $Q tilde P$), then $EE_Q (overline(xi) dot overline(S)) >= 0$. Combined: $EE_Q (overline(xi) dot overline(S)) = 0$. Since $overline(xi) dot overline(S) >= 0$ $Q$-a.s. with expectation 0, we get $overline(xi) dot overline(S) = 0$ $Q$-a.s., hence $P$-a.s. So $P(overline(xi) dot overline(S) > 0) = 0$, and $overline(xi)$ is not an arbitrage.

== FTAP Applications

*$n = 2$ (Binomial)*: $Omega = {omega_1, omega_2}$, one risky asset. Risk-neutral $Q$: $Q({omega_1}) = tilde(p)$, $Q({omega_2}) = tilde(q)$. Condition $pi_1 = EE_Q (S^1 / (1+r))$ gives $tilde(p) = (pi_1(1+r) - S(omega_2)) / (S(omega_1) - S(omega_2))$. Equivalent to $P$ iff $tilde(p) in (0,1)$, i.e., $d < 1+r < u$.

*$n = 3$*: $Omega = {omega_1, omega_2, omega_3}$, one risky asset. Risk-neutral condition gives one equation in two unknowns ($q_1, q_2$ with $q_3 = 1 - q_1 - q_2$), yielding a one-parameter family. Arbitrage-free iff this family contains a strictly positive solution.

*Example*: $pi_1 = 100$, $r = 0.05$, $S(omega_1) = 120$, $S(omega_2) = 100$, $S(omega_3) = 90$. Risk-neutral condition: $120 q_1 + 100 q_2 + 90(1 - q_1 - q_2) = 105$, giving $30 q_1 + 10 q_2 = 15$, so $q_2 = 3/2 - 3 q_1$. For all $q_i > 0$: $q_1 in (1/6, 1/2)$, confirming arbitrage-free.

== Law of One Price

*Proposition*: In an arbitrage-free market, if two portfolios have the same payoff ($overline(xi) dot overline(S) = overline(eta) dot overline(S)$ $P$-a.s.), they have the same price ($overline(xi) dot overline(pi) = overline(eta) dot overline(pi)$).

*Proof*: By FTAP, $exists Q tilde P$ risk-neutral. $overline(xi) dot overline(pi) = EE_Q (overline(xi) dot overline(S) / (1+r)) = EE_Q (overline(eta) dot overline(S) / (1+r)) = overline(eta) dot overline(pi)$.

== Securities and Derivatives

A *security* is a random variable $C: Omega -> RR$ with $0 <= C < infinity$ $P$-a.s. A *derivative* (or *contingent claim*) is a security of the form $C(omega) = f(S^0(omega), ..., S^d(omega))$.

*Examples*: European call $C = max{S - X, 0}$, European put $C = max{X - S, 0}$.

A forward contract ($C = S - K$) is a derivative but not a security (payoff can be negative).

// 13.
= Arbitrage-Free Pricing

== Extended Market Model

Given a security $C$, define the *extended market* by adding $C$ as a new asset: $S^(d+1) := C$, $pi_(d+1) := pi_C$. The *set of arbitrage-free prices* for $C$ is:

$ Pi(C) = {pi_C in RR : "the extended market is arbitrage-free"} $

== Main Pricing Theorem

*Theorem*: $Pi(C) = {EE_Q (C / (1 + r)) : Q "is risk-neutral", Q tilde P, EE_Q |C| < infinity}$.

*Proof sketch*: ($subset.eq$) If $pi_C in Pi(C)$, the extended market is arbitrage-free. By FTAP, $exists Q tilde P$ risk-neutral for the extended market, so $pi_C = EE_Q (C / (1+r))$. ($supset.eq$) If $Q tilde P$ is risk-neutral for the original market, setting $pi_C = EE_Q (C / (1+r))$ makes $Q$ risk-neutral for the extended market, so by FTAP the extended market is arbitrage-free.

== Corollary

- If $C$ is *replicable* (there exists $overline(xi)$ with $overline(xi) dot overline(S) = C$ $P$-a.s.), then $Pi(C)$ is a singleton: $Pi(C) = {overline(xi) dot overline(pi)}$. The price is unique.
- If $C$ is *not replicable*, $Pi(C)$ is an open interval.

== Binomial Model Pricing

The binomial model has a unique risk-neutral measure, so every security has a unique arbitrage-free price.

*Replicating portfolio*: Solve $xi_0(1 + r) + xi_1 S(U) = C(U)$ and $xi_0(1 + r) + xi_1 S(D) = C(D)$.

$ xi_1 = (C(U) - C(D)) / (S(U) - S(D)), quad xi_0 = (C(D) dot S(U) - C(U) dot S(D)) / ((1 + r)(S(U) - S(D))) $

The price is:

$ pi_C = (C(D)) / (1 + r) dot (S(U) - pi_1(1 + r)) / (S(U) - S(D)) + (C(U)) / (1 + r) dot (pi_1(1 + r) - S(D)) / (S(U) - S(D)) $

Or equivalently: $pi_C = (tilde(p) C(U) + tilde(q) C(D)) / (1 + r)$.

=== European Call Price

$ pi_(C_"call") = (S(U) - X) / (1 + r) dot (pi_1(1 + r) - S(D)) / (S(U) - S(D)) $

(assuming $S(U) > X > S(D)$ so only state $U$ pays).

=== European Put Price

$ pi_(C_"put") = (X - S(D)) / (1 + r) dot (S(U) - pi_1(1 + r)) / (S(U) - S(D)) $

== Worked Example

$pi_1 = 100$, $S(U) = 120$, $S(D) = 90$, $X = 100$, $r = 0.05$.

$tilde(p) = (105 - 90) / (120 - 90) = 1/2$, $tilde(q) = 1/2$.

*Call*: $C(U) = 20$, $C(D) = 0$. $pi_C = (20 times 1/2) / 1.05 approx 9.52$.

Returns: $R[C](U) = 20 / 9.52 - 1 approx 110%$, $R[C](D) = -100%$ (total loss).

*Protective put*: $tilde(C) = max{X - S, 0} + S$. $tilde(C)(U) = 0 + 120 = 120$, $tilde(C)(D) = 10 + 90 = 100$. $pi_(tilde(C)) = (120 / 2 + 100 / 2) / 1.05 approx 104.76$.

Returns: $R[tilde(C)](U) = 120 / 104.76 - 1 approx 14.5%$, $R[tilde(C)](D) = 100 / 104.76 - 1 approx -4.5%$.

The protective put reduces both upside and downside compared to holding the stock alone.

== 3-State Model Example

$pi_1 = 100$, $r = 0.05$, $S(omega_1) = 120$, $S(omega_2) = 100$, $S(omega_3) = 90$, call with strike $X = 95$.

$C(omega_1) = 25$, $C(omega_2) = 5$, $C(omega_3) = 0$.

From the FTAP analysis: $q_1 in (1/6, 1/2)$, $q_2 = 3/2 - 3q_1$, $q_3 = 2q_1 - 1/2$.

$ pi_C = (25 q_1 + 5(3/2 - 3q_1)) / 1.05 = (10 q_1 + 15/2) / 1.05 = (20 q_1 + 15) / 2.1 $

As $q_1$ ranges over $(1/6, 1/2)$: $pi_C in (200/21, 250/21) approx (9.52, 11.90)$.

Any price in this open interval is arbitrage-free; the call is not replicable.

== 4-State Butterfly Spread

$Omega = {omega_1, omega_2, omega_3, omega_4}$ with $S(omega_k) = X + (3 - 2k)a$ (symmetrically spaced around $X$).

Butterfly payoff: $f(S_T) = cases(0 & "if" |S_T - X| >= a, a - |S_T - X| & "if" |S_T - X| <= a)$.

So $C(omega_1) = 0$, $C(omega_2) = a$, $C(omega_3) = a$, $C(omega_4) = 0$.

Parameterise risk-neutral measures: $q_1 = q - Delta/2$, $q_2 = 1/2 - q + Delta$, $q_3 = 1/2 - q - Delta$, $q_4 = q + Delta/2$, with feasible region $cal(B)$ ensuring all $q_i > 0$.

$ pi_C = (a(1 - 2q)) / (2(1 + r)) $

The set of arbitrage-free prices is $Pi(C) = (0, a / (2(1 + r)))$.
