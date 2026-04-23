= Lecture 1: Assets, odds, betting, hedging and arbitrage

== Assets

*Underlying assets* are not defined in terms of other traded assets.

- *Risk-free*: bank accounts (cash deposits), bonds.
- *Risky*: stocks, commodities (oil, gold, wheat), currencies, property.

*Derivative assets* are based on one or more underlying assets: forward contracts (agreement to buy/sell at a fixed price at a future date, themselves tradable), futures, options (European/American put/call), swaps.

== Odds and betting

Odds "$M$ to $N$ in favour" of event $A$: stake $N$, receive $M$ profit plus stake back ($M + N$ returned) if $A$ occurs. As _fractional odds_ $alpha : 1$ with $alpha = M slash N$, profit is $alpha$ per unit staked.

*Example.* Teams $A$ and $B$, exactly one wins. Bookmaker $X$ offers fractional odds $alpha$ _against_ $A$ (bet on $A$ losing: profit $alpha$ per unit if $B$ wins). Bookmaker $Y$ offers fractional odds $beta$ against $B$.

If you stake $x$ with $X$ on $A$-losing and $y = T - x$ with $Y$ on $B$-losing out of a total $T$, the payoff table is

#table(
  columns: 3,
  align: left,
  [], [$A$ wins ($B$ loses)], [$B$ wins ($A$ loses)],
  [Bet $x$ with $X$ that $A$ loses], [$0$], [$x + alpha x$],
  [Bet $y$ with $Y$ that $B$ loses], [$y + beta y$], [$0$],
  [Profit], [$y + beta y - T$], [$x + alpha x - T$],
  [Profit (in $x$)], [$beta T - (1 + beta) x$], [$(1 + alpha) x - T$],
)

== Hedging

#text(red)[*Hedging*]: control maximum loss. Tolerating loss at most $T' < T$ requires

$ -T' <= beta T - (1 + beta) x, quad -T' <= (alpha + 1) x - T $

i.e.

$ (T - T') / (1 + alpha) <= x <= (beta T + T') / (1 + beta). $

If such $x$ exists, loss is capped at $T'$ while upside is uncapped.

== Arbitrage

Write the two profits as $(1 + beta)(x_A - x)$ and $(1 + alpha)(x - x_B)$ with

$ x_A = (beta T) / (1 + beta), quad x_B = T / (1 + alpha). $

If $x_B < x_A$ there is a range of $x$ giving positive profit in both outcomes — an _arbitrage opportunity_ (guaranteed profit). The condition $x_B < x_A$ simplifies to

$ alpha beta > 1. $

The implied probabilities $alpha slash (1 + alpha)$ (X on $A$ winning) and $beta slash (1 + beta)$ (Y on $B$) are inconsistent if $alpha beta > 1$:

$ alpha / (1 + alpha) + beta / (1 + beta) = (alpha beta - 1) / (1 + alpha + beta + alpha beta) + 1 > 1. $

If arbitrage persists, bookmakers go out of business, so they adjust odds to eliminate it. The _efficient market hypothesis_: no arbitrage opportunities exist. We imagine an _arbitrageur_ with the resources to exploit any opportunity.

== Exchange rate example

Exchange $A$: #sym.pound $1 = $ \$ $alpha$. Exchange $B$: \$ $1 = $ #sym.pound $beta$. Show no arbitrage iff $alpha beta = 1$.

If $alpha beta > 1$: starting with #sym.pound $1000$, buy \$ $1000 alpha$ at $A$, sell at $B$ for #sym.pound $1000 alpha beta >$ #sym.pound $1000$. If $alpha beta < 1$: go the other way. Hence no arbitrage $<==> alpha beta = 1$.

In reality arbitrages exist but are small and fleeting.

== Bid-ask exchange rates

For pair CUR1/CUR2 quoted "Bid $x$, Ask $y$": trader _buys_ CUR1 from you at $x$ CUR2 per CUR1 (you sell at bid); trader _sells_ CUR1 to you at $y$ CUR2 per CUR1 (you buy at ask). Bid $x$, ask $y$ on CUR1/CUR2 equals bid $y^(-1)$, ask $x^(-1)$ on CUR2/CUR1.

Traders $A, B$ quote USD/GBP with bids $alpha_b, beta_b$ and asks $alpha_s, beta_s$. No-arbitrage requires

$ alpha_b <= alpha_s, quad beta_b <= beta_s, quad alpha_b <= beta_s, quad beta_b <= alpha_s. $

*Exercise.* For $N$ traders in CUR1/CUR2 with bids $b_k$ and asks $a_k$, no arbitrage iff

$ max_j b_j <= min_k a_k. $

== Triangular arbitrage

#table(
  columns: 4,
  align: left,
  [Trader], [Pair], [Bid], [Ask],
  [$A$], [USD/GBP], [$0.7900$], [$0.7920$],
  [$B$], [USD/EUR], [$0.9100$], [$0.9120$],
  [$C$], [GBP/EUR], [$1.1300$], [$1.1320$],
)

*Definition (Pair-wise arbitrage).* An arbitrage exchanging between two currencies (possibly using multiple traders) to end up with more of the original currency risk-free. Above there are no pair-wise opportunities (not possible with only two currencies).

Starting with \$ $1000$: sell to $B$ giving #sym.euro $910$; buy GBP from $C$ giving #sym.pound $803.89$ ($= 1000 times 0.9100 slash 1.1320$); buy USD from $A$ giving \$ $1015.01$. Risk-free profit \$ $15.01$.

If there are _no triangular arbitrage_ opportunities, there are no arbitrage opportunities at all. The _Bellman-Ford algorithm_ detects arbitrage by finding negative cycles in a directed graph with edge weights $-log("rate")$.

== Frictionless markets

Assumptions on a market model:
+ Liquid and divisible: trade any volume, arbitrarily small fractions, whenever.
+ No transaction fees, instantaneous transactions.
+ No bid-ask spread: buy and sell prices coincide.
+ Our actions don't affect prices.

Assumptions 2, 3 define a _frictionless market_.

= Lecture 2: Time value of money and interest

== Time value of money

It is better to have money now than in the future, due to (i) risk (may not be paid), (ii) inflation (purchasing power), (iii) opportunity cost (cannot invest). Interest compensates lenders for this.

== Basic notions

A borrower repays the _principal_ #sym.pound $P$ plus _interest_ by the end of the _term_ $T$ years. The _nominal rate_ $r$ is quoted p.a. Interest is paid at the end of set intervals (annual, semi-annual, quarterly, monthly, daily); partial intervals do not earn interest.

== Simple interest

*Definition (Simple interest).* Interest on principal $P$ over term $T$ at rate $r$ is $r T P$.

*Example.* #sym.pound $1000$ at $9%$ p.a. simple: after 2 years, $2 times 0.09 times 1000 = 180$, total #sym.pound $1180$. After half a year, #sym.pound $45$ interest, total #sym.pound $1045$.

With annual conversion, $P_k = P_(k-1) + P r$, $P_0 = P$, so $P_T = P(1 + r T)$.

*Problem.* Withdrawing and redepositing gains more: #sym.pound $1000$ at $9%$ for one year gives #sym.pound $1090$; a further year at $9%$ simple gives $#sym.pound 1090 dot 1.09 = #sym.pound 1188.10 > #sym.pound 1180$.

== Compound interest

With annual compounding, $P_k = (1 + r) P_(k-1)$, $P_0 = P$, so

*Definition (Compound interest).* $P_T = P(1 + r)^T$.

Splitting a term confers no advantage: $(1 + r)^S (1 + r)^T P = (1 + r)^(T+S) P$.

*Lemma (Compound $>=$ simple).* $P_T^c >= P_T^s$ for $T >= 1$.

*Proof.* $T = 1$: equal. $T > 1$: by the binomial theorem,

$ P(1 + r)^T = P sum_(i=0)^T binom(T,i) r^i = P(1 + T r) + P sum_(i=2)^T binom(T,i) r^i > P(1 + T r) = P_T^s. #h(1fr) square $

From $P_T = P(1 + r)^T$:

$ P = P_T (1 + r)^(-T), quad T = log(P_T slash P) / log(1 + r), quad r = (P_T slash P)^(1 slash T) - 1. $

*Example.* #sym.pound $500$ earns #sym.pound $150$ in $6$ years, so $P_6 = 650$.
- Compound: $r = (13 slash 10)^(1 slash 6) - 1 approx 0.04470$, i.e. $4.47%$ (to nearest _basis point_ $= 0.01%$).
- Simple: $r = 150 slash 3000 = 0.05 = 5%$.

*Example (doubling at $7.5%$).* Compound: $1.075^T >= 2 ==> T >= log 2 slash log 1.075 approx 9.58$, so $10$ years. Simple: $0.075 T >= 1 ==> T >= 40 slash 3 = 13 1 slash 3$ years.

== Rule of 72

Compound doubling time: $T = log 2 slash log(1 + r) approx log 2 slash r approx 0.72 slash r$, i.e. $T approx 72 slash (100 r)$. Divide 72 by the percentage rate. E.g. $r = 3%$: $T approx 24$ years. Known since Pacioli's _Summa de Arithmetica_ (1494).

== Interest conversion periods

With $n$ equal conversion periods per year, the per-period rate is $r slash n$, so

$ P_k = P(1 + r slash n)^k, quad P_(T n) = P(1 + r slash n)^(T n). $

== Continuous compounding

As $n arrow.r infinity$,

$ lim_(n arrow.r infinity) P(1 + r slash n)^n = P e^r, quad "so" quad P_T = P e^(r T). $

== Effective interest rate (AER)

*Definition.* $r_"eff" = (P_1 - P) slash P$.

For annual compounding or simple interest, $r_"eff" = r$. For $n > 1$, $r_"eff" > r$ and increases in $n$.

*Example.* Credit card, #sym.pound $100$ at $18%$ p.a.:
- annual: $P_1 = 118.00$, $r_"eff" = 18%$.
- semi-annual: $100(1 + 0.09)^2 = 118.81$, $r_"eff" = 18.81%$.
- quarterly: $100(1.045)^4 = 119.26$, $r_"eff" = 19.26%$.
- monthly: $100(1 + 0.015)^(12) = 119.57$, $r_"eff" = 19.57%$.
- continuous: $100 e^(0.18) approx 119.73$, $r_"eff" = 19.73%$.

== Force of interest

The _spot interest rate_ $r(t)$ is the rate on a loan starting immediately at time $t$; for continuous compounding this is the _force of interest_. Let $P(t)$ be the balance at $t$. For small $h$,

$ P(t + h) approx P(t) + P(t) r(t) h ==> P'(t) = P(t) r(t). $

Solving $P' slash P = r(t)$:

$ P(t) = P(0) exp(integral_0^t r(s) dif s). $

Constant $r$ recovers $P(t) = P(0) e^(r t)$.

*Example (April 2008 FoA exam).*

$ r(t) = cases(
  0.06 &"if" 0 <= t <= 4,
  0.10 - 0.01 t &"if" 4 < t <= 7,
  0.01 t - 0.04 &"if" t > 7
) $

Value at $t = 7$ of #sym.pound $200$ invested at $t = 0$:

$ P(7) &= 200 exp(integral_0^4 0.06 dif s + integral_4^7 (0.1 - 0.01 s) dif s) \
&= 200 exp(0.24 + [0.1 s - 0.005 s^2]_4^7) = 200 exp(0.375) approx 290.99. $

== Forward interest rate

The $t$-year _forward rate_ applies to a loan beginning $t$ years from now. Implied forward rates can be read off spot rates.

*Example.* One-year rate $r = 0.65%$, two-year rate $s = 0.75%$ (annual compounding). Equate returns:

$ P(1 + r)(1 + f) = P(1 + s)^2 ==> f = (1 + s)^2 / (1 + r) - 1. $

Continuously compounded: $e^r e^f = e^(2s) ==> f = 2 s - r$.

= Lecture 3: Mortgages, annuities, present value, discounting, pensions, APR

== Annuities

An _annuity_ is a series of payments at fixed intervals (mortgages, regular savings deposits, insurance premiums).

== Mortgages

Principal $P$, term $T$ years, $n$ periods/year, nominal rate $r$, payment $A$ at end of each period. Balance $P_k$ satisfies

$ P_k = (1 + r slash n) P_(k-1) - A, quad P_0 = P. $

Setting $Q_k = P_k - A n slash r$ gives $Q_k = (1 + r slash n) Q_(k-1)$, $Q_k = Q_0 (1 + r slash n)^k$, hence

$ P_k = (A n) / r + (P - (A n) / r)(1 + r slash n)^k. $

Clearing the loan ($P_(n T) = 0$) gives

$ A = P r / (n (1 - (1 + r slash n)^(-T n))). $

*Example.* #sym.pound $200,000$ mortgage, $T = 25$, $r = 0.07$, $n = 12$:

$ A = 200000 dot 0.07 / (12(1 - (1 + 0.07 slash 12)^(-300))) = #sym.pound 1413.56, quad A T n = #sym.pound 424,068. $

== Annuity-immediate vs annuity-due

*Definition (Annuity-immediate).* Payments at the _end_ of each period (as above).

*Definition (Annuity-due).* Payments at the _beginning_ of each period (e.g. regular savings schemes).

== Compounding vs discounting

_Compounding_ moves cash flows forward in time; _discounting_ moves them backward. _Present value_ lets us compare investments against a risk-free alternative (the bank, paying $r$ compounded $n$ times/year).

== Present value

A single payment #sym.pound $X$ at the end of $T$ years has present value

$ V = X / (1 + r slash n)^(T n), quad X = V(1 + r slash n)^(T n). $

Invest in the alternative iff its cost is less than $V$.

*Definition (Present value of a cash-flow sequence).* For payments $x_k$ at the end of period $k in {1, dots, T n}$,

$ V = sum_(k=1)^(T n) x_k (1 + r slash n)^(-k). $

Here $r$ is a _risk-free_ rate, the _numeraire_, not the rate of the investment.

== Present value examples

*Example.* Bank rate $10%$ annual. A 5-year investment requires #sym.pound $10000$, pays #sym.pound $500$ at end of years 1-4 and #sym.pound $14000$ at year 5. Then

$ V = 500 / 1.1 + 500 / 1.1^2 + 500 / 1.1^3 + 500 / 1.1^4 + 14000 / 1.1^5 = 10,277.83. $

Since $10000 < V$, the investment is worth considering.

*Example.* Five-year investments of #sym.pound $20000$, bank $5%$:

+ $800, 900, 1000, 1100, 1200 + 20000$: $V approx 19,957.80 < 20000$, bank preferred.
+ $1000, 1000, 1000, 1000, 1000 + 20000$: $V = 20000$, indifferent.
+ $1200, 1100, 1000, 900, 800 + 20000$: $V approx 20,042.20 > 20000$, investment preferred.

== Geometric series

Initial $a$, ratio $R$, $N$ terms:

$ S = a + a R + dots + a R^(N-1) = a (1 - R^N) / (1 - R). $

If $|R| < 1$ and $N arrow.r infinity$, $S = a slash (1 - R)$.

== Pensions example

After $N$ years' work, retire on fraction $lambda$ of final salary for $M$ years, with bank rate $r$ and salary growth $g$. Initial salary $S$, contribution fraction $x$; find $x$.

Contributions (end of year $k$) and pension payments:

$ underbrace(-C, k=1), underbrace(-C(1+g), k=2), dots, underbrace(-C(1+g)^(N-1), k=N), \
underbrace(lambda F(1+g), k=N+1), dots, underbrace(lambda F(1+g)^M, k=N+M) $

with $C = x S(1 + g)$ and final salary $F = S(1 + g)^N$. Requiring present value $V = 0$:

$ V = -x S G(r, g, N) + lambda F (1 + r)^(-N) G(r, g, M), $

where

$ G(r, g, N) = sum_(k=1)^N ((1 + g) / (1 + r))^k = (1 + g) / (r - g) (1 - ((1 + g) / (1 + r))^N). $

Solving $V = 0$:

$ x = lambda ((1 + g) / (1 + r))^N G(r, g, M) / G(r, g, N). $

#table(
  columns: 4,
  align: left,
  [$N = 40$, $M = 20$, $lambda = 1 slash 2$: $g arrow.b slash r arrow.r$], [$4%$], [$5%$], [$6%$],
  [$1%$], [$9.96%$], [$7.24%$], [$5.24%$],
  [$2%$], [$13.7%$], [$10.05%$], [$7.34%$],
  [$3%$], [$18.62%$], [$13.78%$], [$10.14%$],
)

#table(
  columns: 4,
  align: left,
  [$N = 50$: $g arrow.b slash r arrow.r$], [$4%$], [$5%$], [$6%$],
  [$1%$], [$6.67%$], [$4.52%$], [$3.04%$],
  [$2%$], [$9.81%$], [$6.75%$], [$4.59%$],
  [$3%$], [$14.15%$], [$9.88%$], [$6.82%$],
)

$x$ is sensitive to $g$; not very sensitive to $r - g$.

*Exercise.* Take $g arrow.r r$ using L'Hôpital's rule.

== Annual rate of return

*Definition.* For principal #sym.pound $P$ yielding #sym.pound $X$ after one year, the _annual rate of return_ $r$ satisfies $X slash (1 + r) = P$, i.e. $r = X slash P - 1$. For a cash-flow sequence:

$ P = sum_(k=1)^(T n) x_k (1 + r slash n)^(-k). $

If $P > 0$, $x_k >= 0$ and $x_(T n) > 0$, the RHS is strictly decreasing in $r > -1$, so there is a unique solution.

*Example.* #sym.pound $2000$ in: #sym.pound $200$ at year 1, #sym.pound $2400$ at year 2.

$ 2000 = 200 / (1 + r) + 2400 / (1 + r)^2. $

Let $z = 1 slash (1 + r)$: $z^2 + z slash 12 - 5 slash 6 = 0$, $z = -1 slash 24 + sqrt(481 slash 576) approx 0.8722$, so $r approx 14.66%$.

== Annual percentage rate

Different lenders levy interest plus additional fees. In the UK, lenders must advertise the _APR_.

*Definition (APR).* APR $= 100 a %$ where $a$ satisfies

$ sum_(k=0)^(T n) P_k (1 + a slash n)^(-k) = sum_(k=0)^(T n) A_k (1 + a slash n)^(-k), $

with $P_k, A_k$ the amounts borrowed/repaid (incl. charges) in period $k$. Solved iteratively (Newton-Raphson):

$ a_(j+1) = a_j - f(a_j) / f'(a_j). $

*Example.* #sym.pound $200,000$ mortgage at $7%$, $25$ years, monthly, equal repayments. $P_0 = 200000$, $P_k = 0$ for $k >= 1$, $A_k = A approx 1413.56$. Then

$ P_0 n/a (1 - (1 + a slash n)^(-T n)) dot r/n (1 - (1 + r slash n)^(-T n))^(-1) = P_0 $

reduces to $f(a) = f(r)$ where $f(x) = (1 slash x)(1 - (1 + x slash n)^(-T n))$ is monotone decreasing, so $a = r$: APR equals the nominal rate when there are no extra charges.

With additional #sym.pound $5000$ charges:
+ Paid up front ($A_0 = 5000$): solve $200000 = 5000 + 1413.54 z(1 - z^(300)) slash (1 - z)$ with $z = (1 + a slash n)$, giving $z approx 0.993968$, $a approx 7.28%$.
+ Added to loan (now repay on #sym.pound $205,000$): $A approx 1448.90$; solve $200000 = 1448.90 z(1 - z^(300)) slash (1 - z)$, giving $z approx 0.993974$, $a approx 7.275%$.

== Discounting with variable rate

For annual rates $r_i$ and cash flow $x_1, dots, x_T$:

$ V = x_1 / (1 + r_1) + x_2 / ((1 + r_1)(1 + r_2)) + dots + x_T / ((1 + r_1) dots (1 + r_T)). $

Continuous compounding with force of interest $r(t)$:

$ V = X exp(- integral_0^T r(s) dif s), quad V = integral_0^T x(t) exp(- integral_0^t r(s) dif s) dif t. $

*Example.* Same $r(t)$ as before. Value at $t = 5$ of #sym.pound $1000$ due at $t = 10$:

$ V_5 &= 1000 exp(- integral_5^7 (0.1 - 0.01 s) dif s - integral_7^10 (0.01 s - 0.04) dif s) \
&= 1000 exp(-[0.1 s - 0.005 s^2]_5^7 - [0.005 s^2 - 0.04 s]_7^10) \
&= 1000 e^(-0.215) approx 806.54. $

= Lecture 4: Review of asset classes, bonds

== Assets

An _asset_ is a resource with economic value owned or controlled with the expectation of a future benefit. _Investing_ means purchasing an asset for a return. Most assets yield regular income (interest, dividends, coupons) and can rise or fall in value, giving capital gains or losses.

Four main private classes: cash deposits, property, shares, bonds. Also foreign currency, commodities (gold, oil); goods like art or classic cars are hard to value.

== Property

Investors seek rent and capital growth. Risks: price falls; illiquidity (slow to sell); vacancies, defaulting tenants, damage, repair bills, interest rate rises.

== Shares

Shares (_equities_, _stocks_) are fractional ownership of a company, bought at IPO or on the stock market. Shareholders receive _dividends_ from profits.

== Bonds

A _bond_ is a loan to a government, authority or company. The _nominal_ (_face_) value is what is repaid at _maturity_; usually #sym.pound $100$ in the UK. The first holder pays the _issue price_ (may be above/below/equal to face). _Zero-coupon bonds_ always issue below face. The bondholder receives regular interest (the _coupon rate_ or _coupon_) on the face value until maturity.

*Example.* #sym.pound $100$ bond, $6%$ coupon, matures 7th Dec 2028: on that date holder gets #sym.pound $100$ and the bond is cancelled; up to and including that date, #sym.pound $3$ interest every six months on 7th Dec and 7th June.

Bonds can be sold on the open market before maturity at fluctuating prices. Bond prices are inversely correlated with interest rates: rising rates make the coupon less attractive, so price falls. Market price does not affect payouts to the holder.

_Government bonds_ (UK _gilts_, US _Treasuries_) are low risk. In the UK: _shorts_ (< 7 years), _mediums_ (7-15 years), _longs_ (> 15 years).

== Bond pricing example

On 8th Dec 2007, gilts of #sym.pound $100$ face value:

#table(
  columns: 3,
  align: left,
  [Matures], [Coupon], [Price],
  [7th Dec 2028], [$6%$], [#sym.pound $120.66$],
  [7th Jun 2021], [$8%$], [#sym.pound $134.70$],
)

First gilt: #sym.pound $3$ every 6 months for 42 periods plus #sym.pound $100$ at end. Setting $z = (1 + r slash 2)^(-1)$,

$ V = 3 z (1 - z^(42)) / (1 - z) + 100 z^(42) = 120.66, $

i.e. $103 z^(43) - 100 z^(42) - 123.66 z + 120.66 = 0$. Newton-Raphson gives $z = 0.9781$, so $r = 2(1 - z) slash z approx 4.47%$.

Second gilt: #sym.pound $4$ every 6 months for 27 periods:

$ 134.7 = 4 z (1 - z^(27)) / (1 - z) + 100 z^(27), quad r approx 4.53%. $

Slightly higher yield; tiny difference, so choice depends on other factors (term).

== Perpetuity

*Definition.* A _perpetuity_ is a bond with no maturity: interest forever.

True perpetuities are rare in the UK; building societies issue _PIBS_ (permanent interest-bearing shares). PIBS have a _call date_: the society may buy back at face, otherwise the coupon often drops (making the bond less attractive and its price fall).

*Example (PIBS).* Halifax $12%$ PIBS, interest 1st Mar/Sep. On 2nd Sep 2018 a #sym.pound $100$ unit sold for #sym.pound $125$. Yield (perpetuity assumption):

$ 125 = sum_(k=1)^infinity 6 (1 + r slash 2)^(-k) = 6 / ((1 + r slash 2) - 1) = 12 / r, $

so $r = 12 slash 125 = 9.6%$. This is the _Running Yield_; treating a PIBS as a perpetuity over-values it, since it has a call date.

== Zero-coupon bonds

A _zero-coupon bond_ has a maturity date but pays no interim interest. Issued at _deep discount_ to face; holder's return is the face-issue price gap.

*Example.* 4-year zero-coupon bond, desired yield $6%$, semi-annual compounding. Issue price per #sym.pound $100$ face:

$ 100 / (1 + 0.06 slash 2)^8 = 100 / 1.03^8 = #sym.pound 78.94. $

== Implied interest rate

Let $B(t, T)$ be the time-$t$ price of a unit zero-coupon bond ($B(T, T) = 1$) maturing at $T$. The _implied rate_ solves

$ B(t, T) &= (1 + r)^(-(T - t)), \
B(t, T) &= (1 + r slash m)^(-m(T - t)), \
B(t, T) &= exp(-r(T - t)). $

== Short selling

*Short selling* is selling an asset you do not own: theoretically holding a negative quantity. In practice you borrow the asset with a commitment to return it (_closing out_), usually by repurchase. Costs: the lender must receive any cash flows (dividends, coupons); the short-seller maintains a margin account and pays borrowing fees. In a _frictionless market_ these costs vanish.

*Example.* Shares trade at #sym.pound $120$ in January, pay #sym.pound $1$ dividend in February. Buying 500 shares: pay #sym.pound $60000$, receive #sym.pound $500$ dividend; if price falls to #sym.pound $100$ and you sell in March for #sym.pound $50000$, net _loss_ #sym.pound $9500$.

Instead short 500 shares in January: borrow and sell for #sym.pound $60000$; pay #sym.pound $500$ dividend to the original holder. If price falls to #sym.pound $100$, buy back for #sym.pound $50000$ and return, net _profit_ #sym.pound $9500$.
