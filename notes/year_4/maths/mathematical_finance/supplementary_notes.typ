#set document(title: "Financial Mathematics — Supplementary Notes")
#set page(margin: 20pt)
#set text(size: 10pt)

#import "@preview/cetz:0.4.2"

#let example-box(body) = block(
  width: 100%,
  inset: 10pt,
  fill: blue.lighten(92%),
  stroke: 0.5pt + blue.darken(20%),
  radius: 4pt,
  body,
)

#let key-box(body) = block(
  width: 100%,
  inset: 10pt,
  fill: orange.lighten(90%),
  stroke: 0.5pt + orange.darken(20%),
  radius: 4pt,
  body,
)

#let exercise-box(body) = block(
  width: 100%,
  inset: 10pt,
  fill: purple.lighten(92%),
  stroke: 0.5pt + purple.darken(20%),
  radius: 4pt,
  body,
)

#outline(title: none)
#pagebreak()

= Time Value of Money

It is better to have money now than later for three reasons:
- *Risk:* The party owing you may default.
- *Purchasing power:* Inflation erodes the value of future cash.
- *Opportunity cost:* Money received now can be invested immediately.

== Simple vs Compound Interest

With principal $P$, annual rate $r$, and time $T$ years:

#key-box[
  *Simple interest:* $P_T = P(1 + r T)$ — interest earned only on the original principal.

  *Compound interest:* $P_T = P(1 + r)^T$ — interest earned on accumulated interest.
]

*Proof that compound beats simple for $T >= 2$:* By the Binomial Theorem,

$ P(1 + r)^T = P sum_(i=0)^T binom(T, i) r^i = P(1 + T r) + P sum_(i=2)^T binom(T, i) r^i > P(1 + T r) $

since every term in the remaining sum is strictly positive for $r > 0$.

#example-box[
  *Example:* Invest £1000 at $r = 8%$ for 3 years.

  - Simple: $P_3 = 1000(1 + 0.08 times 3) = 1000 times 1.24 = £1240$
  - Compound: $P_3 = 1000(1.08)^3 = 1000 times 1.2597 = £1259.71$

  Compound interest earns £19.71 more — the "interest on interest."
]

The difference grows with time. Over 20 years at 8%:
- Simple: $1000(1 + 0.08 times 20) = £2600$
- Compound: $1000(1.08)^20 approx £4660.96$

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Axes
  line((-0.3, 0), (8.5, 0), stroke: 0.8pt)
  line((0, -0.3), (0, 5.5), stroke: 0.8pt)

  content((-0.5, 5.2), text(size: 8pt)[$P_T$])
  content((8.3, -0.4), text(size: 8pt)[$T$])

  // Y-axis labels
  for (val, label) in ((1, "1000"), (2, "2000"), (3, "3000"), (4, "4000"), (5, "5000")) {
    line((-0.1, val), (0.1, val), stroke: 0.5pt)
    content((-0.6, val), text(size: 7pt)[#label])
  }

  // X-axis labels
  for t in range(0, 9, step: 2) {
    let x = t
    line((x, -0.1), (x, 0.1), stroke: 0.5pt)
    content((x, -0.35), text(size: 7pt)[#t])
  }

  // Simple interest
  let simple-pts = ()
  for t in range(0, 81) {
    let time = t / 10
    let val = 1 + 0.08 * time
    simple-pts.push((time, val))
  }
  line(..simple-pts, stroke: 1.5pt + blue)

  // Compound interest
  let compound-pts = ()
  for t in range(0, 81) {
    let time = t / 10
    let val = calc.pow(1.08, time)
    compound-pts.push((time, val))
  }
  line(..compound-pts, stroke: 1.5pt + red)

  // Legend
  line((5, 4.8), (5.8, 4.8), stroke: 1.5pt + blue)
  content((7, 4.8), text(size: 8pt)[Simple])
  line((5, 4.3), (5.8, 4.3), stroke: 1.5pt + red)
  content((7.1, 4.3), text(size: 8pt)[Compound])
})

== Inverse Formulas for Compound Interest

Given $P_T = P(1+r)^T$, we can solve for any one unknown:

#key-box[
  $ P = P_T (1+r)^(-T), quad T = log(P_T \/ P) / log(1+r), quad r = (P_T \/ P)^(1\/T) - 1 $
]

*Basis points:* 1 basis point (bp) $= 0.01%$. So 50 bp $= 0.50%$.

== Compounding Frequency and Effective Rate

With nominal rate $r$ compounded $n$ times per year:

$ P_T = P(1 + r / n)^(T n), quad r_"eff" = (1 + r / n)^n - 1 $

#example-box[
  *Example:* Nominal rate $r = 12%$. Effective rate for different compounding:

  #table(
    columns: (auto, auto, auto),
    inset: 6pt,
    align: center,
    table.header([*Frequency*], [*$n$*], [*$r_"eff"$*]),
    [Annual], [1], [$12.000%$],
    [Semi-annual], [2], [$(1.06)^2 - 1 = 12.360%$],
    [Quarterly], [4], [$(1.03)^4 - 1 = 12.551%$],
    [Monthly], [12], [$(1.01)^12 - 1 = 12.683%$],
    [Daily], [365], [$(1 + 0.12/365)^365 - 1 = 12.747%$],
    [Continuous], [$infinity$], [$e^(0.12) - 1 = 12.750%$],
  )
]

== Continuous Compounding

$ P_T = P e^(r T), quad r_"eff" = e^r - 1 $

To convert between nominal rate $r_n$ (compounded $n$ times) and continuous rate $r_c$:

$ e^(r_c) = (1 + r_n / n)^n quad ==> quad r_c = n ln(1 + r_n / n) $

#example-box[
  *Example:* A bank offers 6% compounded monthly. What is the equivalent continuous rate?

  $ r_c = 12 ln(1 + 0.06 / 12) = 12 ln(1.005) = 12 times 0.004988 = 0.05985 = 5.985% $
]

== Force of Interest

When the interest rate varies with time, $r = r(t)$, the accumulation satisfies the ODE

$ P'(t) = P(t) r(t) $

Separating variables: $dif P \/ P = r(t) dif t$, and integrating from $0$ to $t$:

#key-box[
  $ P(t) = P(0) exp(integral_0^t r(s) dif s) $
]

When $r$ is constant this reduces to $P(t) = P(0) e^(r t)$.

#exercise-box[
  *Exercise 1.* You invest £5000 at a nominal rate of 9% compounded quarterly for 6 years. What is the final value?

  *Exercise 2.* A bank advertises 4.8% compounded monthly. What is the effective annual rate? What continuous rate gives the same return?

  *Exercise 3.* An investment doubles in value in 9 years under continuous compounding. What is the continuous rate $r$? What nominal rate compounded quarterly gives the same effective rate?

  *Exercise 4.* Show that for a fixed principal $P$ and rate $r > 0$, the effective annual rate $r_"eff" = (1 + r/n)^n - 1$ is strictly increasing in $n$, and that $lim_(n -> infinity) r_"eff" = e^r - 1$.

  *Exercise 5.* Suppose the force of interest is $r(t) = 0.04 + 0.005 t$. Find the accumulated value of £10,000 invested at time $t = 0$ after 5 years.
]

= Annuities and Mortgages

== Compounding and Discounting

*Compounding* moves a value forward in time: $"FV" = "PV" times (1+r)^T$.

*Discounting* moves a value backward in time: $"PV" = "FV" times (1+r)^(-T)$.

== Present Value Decision Rule

To compare investments with different cash-flow timings, discount all cash flows to time 0 at the prevailing interest rate. Choose the investment with the greater present value. If $"PV" > "cost"$, the investment is worth considering.

*Annual rate of return:* For an investment costing $P$ today that pays $X$ in one year, the annual rate of return is the rate $r$ satisfying $X \/ (1+r) = P$, i.e.

$ r = X / P - 1 $

== Present Value of an Annuity

A payment $A$ at the end of each period for $N$ periods at rate $i$ per period:

$ "PV" = A dot (1 - (1 + i)^(-N)) / i $

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Timeline
  line((-0.5, 0), (10, 0), stroke: 0.8pt, mark: (end: ">"))

  for k in range(0, 6) {
    let x = k * 2
    line((x, -0.15), (x, 0.15), stroke: 0.8pt)
    content((x, -0.45), text(size: 8pt)[#k])
  }

  // Payments
  for k in range(1, 6) {
    let x = k * 2
    line((x, 0.2), (x, 1.0), stroke: 1.5pt + blue, mark: (end: ">"))
    content((x, 1.3), text(size: 8pt, fill: blue)[$A$])
  }

  // Discount arrows
  for k in range(1, 6) {
    let x = k * 2
    let y = -0.8 - (k - 1) * 0.35
    bezier((x, -0.2), (0.15, y), (x - 0.5, y), (0.5, y - 0.2), stroke: (paint: red.lighten(30%), thickness: 0.6pt, dash: "dashed"), mark: (end: ">"))
    content((x + 0.1, y + 0.25), text(size: 6pt, fill: red.darken(20%))[$(1+i)^(-#k)$])
  }

  content((0, -3.3), text(size: 8pt)[PV $= A sum_(k=1)^N (1+i)^(-k)$])
})

#example-box[
  *Example:* A pension pays £2000 per month for 25 years. Interest rate is 5% per year, compounded monthly. What is the present value?

  Here $A = 2000$, $i = 0.05/12 approx 0.004167$, $N = 25 times 12 = 300$.

  $ "PV" = 2000 dot (1 - (1.004167)^(-300)) / 0.004167 = 2000 times 171.06 approx £342,120 $
]

#example-box[
  *Example (comparing cash flows):* An investor can choose between three payment sequences at $r = 5%$:

  - *A:* Receive £1100 in 1 year.
  - *B:* Receive £600 in 1 year and £600 in 2 years.
  - *C:* Receive £1200 in 2 years.

  $"PV"_A = 1100 / 1.05 = £1047.62$

  $"PV"_B = 600 / 1.05 + 600 / 1.05^2 = 571.43 + 544.22 = £1115.65$

  $"PV"_C = 1200 / 1.05^2 = £1088.44$

  Investment B has the greatest present value and is preferred.
]

== Mortgage Payments

A loan of $P$ at nominal rate $r$ compounded $n$ times per year over $T$ years:

$ A = (P r) / (n(1 - (1 + r / n)^(-T n))) $

#example-box[
  *Example:* A £250,000 mortgage at 4.5% nominal, compounded monthly, over 30 years.

  $i = 0.045/12 = 0.00375$, $N = 360$.

  $ A = (250000 times 0.00375) / (1 - (1.00375)^(-360)) = 937.50 / (1 - 0.2604) = 937.50 / 0.7396 approx £1267.15 $

  Total paid: $1267.15 times 360 = £456,174$. Total interest: £206,174.
]

#exercise-box[
  *Exercise 6.* A car loan of £20,000 is to be repaid in equal monthly payments over 5 years at a nominal rate of 7.2% compounded monthly. Find the monthly payment and the total interest paid.

  *Exercise 7.* A perpetuity pays £1000 per year. If the interest rate is 4%, what is its present value? What if it's an annuity lasting 30 years instead?

  *Exercise 8.* A graduate takes out a £45,000 student loan at a nominal rate of 6.3% compounded monthly. They can afford to pay £500 per month. How many months does it take to repay the loan? What is the total interest paid?

  *Exercise 9.* Show that the present value of an annuity paying $A$ per period for $N$ periods at rate $i$ satisfies $"PV" -> A / i$ as $N -> infinity$, and explain why this is the present value of a perpetuity.

  *Exercise 10.* An investor is offered a deferred annuity that pays £3000 per year for 20 years, with the first payment in 6 years. The annual interest rate is 5%. What is the present value?
]

= Bond Pricing and Bootstrapping

== Bond Cash Flows

A bond with face value $F$, coupon rate $c$ (paid semi-annually), and maturity $T$:

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Timeline
  line((-0.5, 0), (12, 0), stroke: 0.8pt, mark: (end: ">"))

  // Time labels
  content((0, -0.45), text(size: 8pt)[$0$])
  content((2, -0.45), text(size: 8pt)[$0.5$])
  content((4, -0.45), text(size: 8pt)[$1$])
  content((6, -0.45), text(size: 8pt)[$1.5$])
  content((8, -0.45), text(size: 7pt)[$dots.h.c$])
  content((10, -0.45), text(size: 8pt)[$T$])

  for x in (0, 2, 4, 6, 10) {
    line((x, -0.15), (x, 0.15), stroke: 0.8pt)
  }

  // Coupon payments
  for x in (2, 4, 6) {
    line((x, 0.2), (x, 1.2), stroke: 1.5pt + blue, mark: (end: ">"))
    content((x, 1.5), text(size: 8pt, fill: blue)[$C$])
  }

  // Final payment (coupon + face)
  line((10, 0.2), (10, 2.2), stroke: 1.5pt + red, mark: (end: ">"))
  content((10, 2.5), text(size: 8pt, fill: red)[$C + F$])

  // Price
  line((0, -0.2), (0, -1.0), stroke: 1.5pt + green.darken(20%), mark: (end: ">"))
  content((0, -1.3), text(size: 8pt, fill: green.darken(20%))[$-P$])

  content((5, -1.2), text(size: 8pt)[$C = c F \/ 2$ (semi-annual coupon)])
})

== Bond Yield

The *yield* (yield to maturity) of a bond is the rate $r$ such that the present value of all future cash flows equals the market price. For a bond with semi-annual coupon $C$, face value $F$, maturity of $n$ coupon periods, and price $P$:

$ P = C z (1 - z^n) / (1 - z) + F z^n, quad z = (1 + r\/2)^(-1) $

This is a polynomial in $z$ and is generally solved numerically.

#example-box[
  *Example:* A gilt with 6% coupon (semi-annual), 21 years to maturity, priced at £120.66. Each coupon is $C = 3$. Setting $n = 42$:

  $ 3 z (1 - z^42) / (1 - z) + 100 z^42 = 120.66 $

  Solving numerically gives $z approx 0.97808$, so $r\/2 = 1\/z - 1 approx 0.02241$, hence the yield is $r approx 4.47%$.
]

== Bond Prices and Interest Rates

Bond prices and interest rates are *inversely correlated*: when interest rates rise, bond prices fall, and when rates fall, bond prices rise. This follows directly from the discounting formula — higher rates mean future cash flows are worth less today.

*Gilt maturity categories:*
- *Shorts:* less than 7 years to maturity
- *Mediums:* 7 to 15 years to maturity
- *Longs:* more than 15 years to maturity

*Deep discounting:* Zero-coupon bonds (ZCBs) are issued below face value — the return comes entirely from the discount.

*PIBS* (Permanent Interest Bearing Shares) behave like perpetuities with call dates. They pay a fixed coupon indefinitely (or until called).

== Bootstrapping: Extracting Zero Rates

Use observed bond prices to build the zero-rate curve $z(T)$, where $P(T) = e^(-z(T) T)$.

#example-box[
  *Example:* Three bonds, face value 100, annual coupons:

  #table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    align: center,
    table.header([*Bond*], [*Maturity*], [*Coupon*], [*Price*]),
    [A], [1 yr (ZCB)], [0], [£97],
    [B], [2 yr], [5%], [£100],
    [C], [3 yr], [7%], [£103],
  )

  *Step 1:* $97 = 100 e^(-z(1)) ==> z(1) = -ln(0.97) = 3.046%$

  *Step 2:* $100 = 5 e^(-z(1)) + 105 e^(-2 z(2)) = 5 times 0.97 + 105 e^(-2 z(2))$

  $e^(-2 z(2)) = (100 - 4.85) / 105 = 0.9062 ==> z(2) = -ln(0.9062) / 2 = 4.926%$

  *Step 3:* $103 = 7 e^(-z(1)) + 7 e^(-2 z(2)) + 107 e^(-3 z(3))$

  $= 7 times 0.97 + 7 times 0.9062 + 107 e^(-3 z(3)) = 6.79 + 6.34 + 107 e^(-3 z(3))$

  $e^(-3 z(3)) = (103 - 13.13) / 107 = 0.8399 ==> z(3) = -ln(0.8399) / 3 = 5.815%$
]

#exercise-box[
  *Exercise 11.* A 3-year bond has face value £100, a 4% annual coupon, and is priced at £98. If $z(1) = 3%$ and $z(2) = 3.5%$, find $z(3)$ by bootstrapping.

  *Exercise 12.* A 1-year zero-coupon bond with face value £100 is priced at £96. A 2-year bond with face value £100 and a 5% annual coupon is priced at £99. Use these two bonds to find $z(1)$ and $z(2)$.

  *Exercise 13.* Show that if the zero-rate curve is flat at rate $z$, then a bond priced at par ($P = F$) must have coupon rate $c = e^z - 1$ (for annual coupons, continuous compounding).

  *Exercise 14.* A bond has face value £100, a 5% semi-annual coupon, and 10 years to maturity. If the yield to maturity is 4% (semi-annual compounding), find the bond price. Is this bond trading at a premium or discount? Explain why.
]

= Forward Contracts

== Payoff Diagrams

For a forward contract with delivery price $K$:

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Long forward
  line((-0.5, 0), (6, 0), stroke: 0.8pt)
  line((0, -2.5), (0, 2.5), stroke: 0.8pt)

  line((-0.3, -2.8), (5.5, 2.2), stroke: 2pt + blue)

  content((3, -0.4), text(size: 8pt)[$S_T$])
  content((-0.6, 2.2), text(size: 8pt)[Payoff])
  content((2.5, -0.4), text(size: 8pt, fill: red)[$K$])
  line((2.5, -0.1), (2.5, 0.1), stroke: 0.8pt + red)
  circle((2.5, 0), radius: 0.08, fill: red, stroke: none)

  content((4.5, 1.8), text(size: 8pt, fill: blue)[Long forward])
  content((4.5, 1.3), text(size: 8pt, fill: blue)[$S_T - K$])

  // Short forward
  let dx = 8
  line((dx - 0.5, 0), (dx + 6, 0), stroke: 0.8pt)
  line((dx, -2.5), (dx, 2.5), stroke: 0.8pt)

  line((dx - 0.3, 2.8), (dx + 5.5, -2.2), stroke: 2pt + red)

  content((dx + 3, -0.4), text(size: 8pt)[$S_T$])
  content((dx - 0.6, 2.2), text(size: 8pt)[Payoff])
  content((dx + 2.5, -0.4), text(size: 8pt, fill: blue)[$K$])
  line((dx + 2.5, -0.1), (dx + 2.5, 0.1), stroke: 0.8pt + blue)
  circle((dx + 2.5, 0), radius: 0.08, fill: blue, stroke: none)

  content((dx + 4.5, -1.3), text(size: 8pt, fill: red)[Short forward])
  content((dx + 4.5, -1.8), text(size: 8pt, fill: red)[$K - S_T$])
})

== Forward Price vs Spot Price

The *forward price* $F_0$ is the delivery price for contracts agreed now (at $t = 0$). In general $F_0 != S_T$: the forward price is determined by no-arbitrage arguments at inception, while $S_T$ is the (unknown) spot price at delivery.

*Covered vs uncovered (naked) short forward:*
- *Covered:* The short party owns the underlying asset throughout the life of the contract.
- *Uncovered (naked):* The short party acquires the asset at or near delivery.
The distinction affects the cash-flow timing but does _not_ affect the forward price.

== Forward Price by No-Arbitrage

#key-box[
  - *Non-income-generating asset:* $F_0 = S_0 e^(r T)$
  - *Known income (PV = $I$):* $F_0 = (S_0 - I) e^(r T)$
  - *Continuous dividend yield $q$:* $F_0 = S_0 e^((r - q) T)$
]

*Arbitrage proof that $F_0 = S_0 e^(r T)$:*

- *If $F_0 > S_0 e^(r T)$:* At $t = 0$, borrow $S_0$ at rate $r$, buy the asset, and enter a short forward at price $F_0$. At $t = T$, deliver the asset, receive $F_0$, and repay $S_0 e^(r T)$. Profit $= F_0 - S_0 e^(r T) > 0$. Arbitrage.

- *If $F_0 < S_0 e^(r T)$:* At $t = 0$, short-sell the asset for $S_0$, invest $S_0$ at rate $r$, and enter a long forward at price $F_0$. At $t = T$, collect $S_0 e^(r T)$, pay $F_0$ to receive the asset, and close the short. Profit $= S_0 e^(r T) - F_0 > 0$. Arbitrage.

Since both inequalities lead to arbitrage, we must have $F_0 = S_0 e^(r T)$.

#example-box[
  *Example:* A stock trades at £50, pays a dividend of £2 in 3 months. Risk-free rate $r = 6%$ (continuous). Forward contract expires in 6 months.

  $I = 2 e^(-0.06 times 0.25) = 2 times 0.9851 = £1.9701$

  $F_0 = (50 - 1.9701) e^(0.06 times 0.5) = 48.03 times 1.0305 = £49.49$
]

#exercise-box[
  *Exercise 15.* Gold trades at \$1800/oz. Storage costs \$5/oz per year paid continuously. Risk-free rate is 3% (continuous). What is the 1-year forward price?

  *Exercise 16.* A forward contract is written on a stock with continuous dividend yield $q = 3%$, spot price $S_0 = 200$, risk-free rate $r = 5%$ (continuous), and $T = 1$ year. Find the forward price.

  *Exercise 17.* A stock trades at £80 and pays dividends of £1.50 in 2 months and £1.50 in 5 months. The risk-free rate is 4% (continuous). A 6-month forward contract is written on this stock. Find the forward price, and determine the value of the contract to the long party if after 3 months the stock price is £85.

  *Exercise 18.* Show that for a non-income-generating asset, the value of a long forward contract entered at delivery price $K$ with time $tau$ remaining is $f = S_0 - K e^(-r tau)$. Hence deduce that at inception ($K = F_0$) the contract has zero value.
]

= Options

== Forwards vs Options

A forward contract is an _obligation_ to buy/sell at a fixed price; it costs nothing to enter. An option gives the holder the _right but not the obligation_ to buy/sell, and therefore has a non-zero price (the *premium*).

*Why the premium must be positive:* If a call option were free, the holder would profit whenever $S_T > X$ and lose nothing when $S_T <= X$. This is an arbitrage, so the premium must be strictly positive.

*Short selling:* Selling an asset you do not own. You borrow the asset from another party, sell it on the market, and commit to returning the asset later. You profit if the price falls, and lose if it rises.

== Payoff Diagrams

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Long Call
  line((-0.5, 0), (6, 0), stroke: 0.8pt)
  line((0, -1.5), (0, 3), stroke: 0.8pt)

  line((0, 0), (2.5, 0), stroke: 2pt + blue)
  line((2.5, 0), (5.5, 3), stroke: 2pt + blue)

  content((2.5, -0.4), text(size: 7pt, fill: red)[$X$])
  line((2.5, -0.1), (2.5, 0.1), stroke: 0.8pt)
  circle((2.5, 0), radius: 0.06, fill: red, stroke: none)

  content((3, 3), text(size: 8pt, fill: blue)[Long Call])
  content((5.5, -0.35), text(size: 7pt)[$S_T$])

  // Long Put
  let dx = 8
  line((dx - 0.5, 0), (dx + 6, 0), stroke: 0.8pt)
  line((dx, -1.5), (dx, 3), stroke: 0.8pt)

  line((dx, 2.5), (dx + 2.5, 0), stroke: 2pt + red)
  line((dx + 2.5, 0), (dx + 5.5, 0), stroke: 2pt + red)

  content((dx + 2.5, -0.4), text(size: 7pt, fill: blue)[$X$])
  line((dx + 2.5, -0.1), (dx + 2.5, 0.1), stroke: 0.8pt)
  circle((dx + 2.5, 0), radius: 0.06, fill: blue, stroke: none)

  content((dx + 3, 2.5), text(size: 8pt, fill: red)[Long Put])
  content((dx + 5.5, -0.35), text(size: 7pt)[$S_T$])
})

#key-box[
  - *Call payoff:* $max{S_T - X, 0}$, *profit:* $max{S_T - X, 0} - pi_C e^(r T)$
  - *Put payoff:* $max{X - S_T, 0}$, *profit:* $max{X - S_T, 0} - pi_P e^(r T)$
]

== Put-Call Parity

For European options on a non-dividend-paying asset:

$ pi_C - pi_P = S_0 - X e^(-r T) $

#example-box[
  *Example:* $S_0 = 42$, $X = 40$, $r = 0.10$, $T = 0.5$. A European call costs $pi_C = 4.50$. Find $pi_P$.

  $ pi_P = pi_C - S_0 + X e^(-r T) = 4.50 - 42 + 40 e^(-0.05) = 4.50 - 42 + 38.05 = £0.55 $
]

== Option Bounds

$ max{S_0 - X e^(-r T), 0} <= pi_C <= S_0 $
$ max{X e^(-r T) - S_0, 0} <= pi_P <= X e^(-r T) $

=== No-Arbitrage Dominance Principle

If portfolio A has value $V_A (T) >= V_B (T)$ in _every_ state at time $T$, then $V_A (0) >= V_B (0)$.

*Proof of lower call bound:* Consider Portfolio A = one call + $X e^(-r T)$ cash, and Portfolio B = one share.

At time $T$: Portfolio A is worth $max{S_T - X, 0} + X = max{S_T, X} >= S_T$, which is the value of Portfolio B.

By the dominance principle, $pi_C + X e^(-r T) >= S_0$, giving $pi_C >= S_0 - X e^(-r T)$.

=== Variation with Strike

For $X_2 > X_1$:
- $pi_C (X_2) <= pi_C (X_1)$: calls become less valuable as the strike increases.
- $pi_P (X_2) >= pi_P (X_1)$: puts become more valuable as the strike increases.

#exercise-box[
  *Exercise 19.* A European call with $X = 50$ costs £6. A European put with the same strike costs £3. $S_0 = 52$, $T = 0.5$. Find the implied risk-free rate using put-call parity.

  *Exercise 20.* A European call on a non-dividend-paying stock has $S_0 = 60$, $X = 55$, $r = 0.06$, $T = 1$. Verify that the lower bound for the call price is £8.20 (to 2 d.p.). If the call trades at £7, construct an explicit arbitrage strategy and compute the minimum profit.

  *Exercise 21.* Show that for European options on a non-dividend-paying asset, $pi_C - pi_P$ is a strictly increasing function of $S_0$ and a strictly decreasing function of $X$.

  *Exercise 22.* European calls with strikes $X_1 = 40$, $X_2 = 50$, $X_3 = 60$ have premiums $pi_1 = 12$, $pi_2 = 7$, $pi_3 = 4$. Show that the convexity condition $pi_2 <= 1/2 (pi_1 + pi_3)$ holds. Explain what arbitrage opportunity arises if it is violated.
]

= Trading Strategies

== Covered Call

Hold the asset and sell a call. You sacrifice upside beyond $X$ in exchange for premium income.

#key-box[
  $ "Profit" = min{S_T, X} - S_0 + pi_C $

  Maximum profit: $X - S_0 + pi_C$ (when $S_T >= X$). Maximum loss: $S_0 - pi_C$ (when $S_T = 0$).
]

This is a mildly *bullish* position: "I'd be happy to sell at this price, and I want income while I wait."

== Protective Put

Hold the asset and buy a put. The put acts as insurance against a price drop.

#key-box[
  $ "Profit" = max{X, S_T} - S_0 - pi_P $

  Maximum loss: $S_0 + pi_P - X$ (when $S_T <= X$).
]

This is a *bullish* position: "I want to hold this asset, but I'm concerned about a crash."

== Spread and Combination Payoffs

=== Bull Call Spread

Buy call at $X_1$, sell call at $X_2$ ($X_1 < X_2$):

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  line((-0.5, 0), (8, 0), stroke: 0.8pt)
  line((0, -1), (0, 3), stroke: 0.8pt)

  line((0, 0), (2, 0), stroke: 2pt + blue)
  line((2, 0), (5, 3), stroke: 2pt + blue)
  line((5, 3), (7.5, 3), stroke: 2pt + blue)

  content((2, -0.4), text(size: 7pt, fill: red)[$X_1$])
  content((5, -0.4), text(size: 7pt, fill: red)[$X_2$])
  line((2, -0.1), (2, 0.1), stroke: 0.5pt)
  line((5, -0.1), (5, 0.1), stroke: 0.5pt)

  line((5.2, 3), (6.5, 3), stroke: 0.4pt + gray, dash: "dashed")
  content((7.5, 3.3), text(size: 7pt, fill: blue)[$X_2 - X_1$])

  content((7, -0.35), text(size: 7pt)[$S_T$])
  content((4.5, 2), text(size: 8pt, fill: blue)[Bull Call Spread])
})

#key-box[
  *Bull call spread price bounds:* $0 <= pi_"bull call" <= (X_2 - X_1) e^(-r T)$

  *Bull call + bull put relationship:* By put-call parity applied to each leg,

  $ pi_"bull call" = pi_"bull put" + (X_2 - X_1) e^(-r T) $
]

=== Bear Spread

The reverse of a bull spread. A *bear call spread*: buy a call at $X_2$ and sell a call at $X_1 < X_2$. Profits when the asset price falls.

=== Straddle

Buy call and put at the same strike $X$. Payoff: $|S_T - X|$.

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  line((-0.5, 0), (8, 0), stroke: 0.8pt)
  line((0, -0.5), (0, 3.5), stroke: 0.8pt)

  line((0.5, 3), (3.5, 0), stroke: 2pt + purple)
  line((3.5, 0), (7, 3.5), stroke: 2pt + purple)

  content((3.5, -0.4), text(size: 7pt, fill: red)[$X$])
  line((3.5, -0.1), (3.5, 0.1), stroke: 0.5pt)
  circle((3.5, 0), radius: 0.06, fill: red, stroke: none)

  content((7, -0.35), text(size: 7pt)[$S_T$])
  content((5.5, 3), text(size: 8pt, fill: purple)[Straddle])
})

#key-box[
  $ "Straddle profit" = |S_T - X| - (pi_C + pi_P) $

  Break-even points: $S_T = X plus.minus (pi_C + pi_P)$.
]

=== Butterfly Spread

Buy calls at $X_1$ and $X_3$, sell 2 calls at $X_2 = (X_1 + X_3) / 2$:

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  line((-0.5, 0), (10, 0), stroke: 0.8pt)
  line((0, -0.5), (0, 2.5), stroke: 0.8pt)

  line((0, 0), (2, 0), stroke: 2pt + orange.darken(20%))
  line((2, 0), (4.5, 2), stroke: 2pt + orange.darken(20%))
  line((4.5, 2), (7, 0), stroke: 2pt + orange.darken(20%))
  line((7, 0), (9.5, 0), stroke: 2pt + orange.darken(20%))

  content((2, -0.4), text(size: 7pt, fill: red)[$X_1$])
  content((4.5, -0.4), text(size: 7pt, fill: red)[$X_2$])
  content((7, -0.4), text(size: 7pt, fill: red)[$X_3$])
  for x in (2, 4.5, 7) {
    line((x, -0.1), (x, 0.1), stroke: 0.5pt)
  }

  content((9.2, -0.35), text(size: 7pt)[$S_T$])
  content((6, 2.2), text(size: 8pt, fill: orange.darken(20%))[Butterfly Spread])
})

#exercise-box[
  *Exercise 23.* A stock trades at £100. A call with $X = 90$ costs £15 and a call with $X = 110$ costs £5. Construct a bull call spread and state the maximum profit and maximum loss (ignore discounting).

  *Exercise 24.* In a straddle with $X = 100$, $pi_C = 8$, $pi_P = 6$, find the break-even points and the maximum loss.

  *Exercise 25.* A stock trades at £50. You construct a butterfly spread using calls with $X_1 = 45$ (costs £8), $X_2 = 50$ (costs £5), and $X_3 = 55$ (costs £3). State the net cost and compute the profit for $S_T in {40, 45, 50, 55, 60}$.

  *Exercise 26.* Show that a covered call (long stock + short call) has the same profit diagram as a short put plus a constant. Identify the constant in terms of $X$, $S_0$, $pi_C$, $pi_P$ using put-call parity.

  *Exercise 27.* An investor creates a bear put spread by buying a put at $X_2 = 70$ for £8 and selling a put at $X_1 = 60$ for £3. What is the maximum profit, maximum loss, and break-even price?
]

= One-Period Binomial Model

== Tree Diagram

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let node-w = 1.2
  let node-h = 0.6

  rect((-node-w/2, -node-h/2), (node-w/2, node-h/2), fill: blue.lighten(85%), stroke: 0.8pt + blue, radius: 3pt)
  content((0, 0), text(size: 9pt, fill: blue.darken(30%))[$S_0 = pi_1$])

  let ux = 5
  let uy = 2
  rect((ux - node-w/2, uy - node-h/2), (ux + node-w/2, uy + node-h/2), fill: green.lighten(85%), stroke: 0.8pt + green.darken(20%), radius: 3pt)
  content((ux, uy), text(size: 9pt, fill: green.darken(30%))[$S(U) = pi_1 u$])

  let dx = 5
  let dy = -2
  rect((dx - node-w/2, dy - node-h/2), (dx + node-w/2, dy + node-h/2), fill: red.lighten(85%), stroke: 0.8pt + red.darken(20%), radius: 3pt)
  content((dx, dy), text(size: 9pt, fill: red.darken(30%))[$S(D) = pi_1 d$])

  line((node-w/2, 0.15), (ux - node-w/2, uy - 0.15), stroke: 1.2pt + green.darken(20%), mark: (end: ">"))
  line((node-w/2, -0.15), (dx - node-w/2, dy + 0.15), stroke: 1.2pt + red.darken(20%), mark: (end: ">"))

  content((2, 1.6), text(size: 8pt, fill: green.darken(20%))[$tilde(p) = (1+r-d)/(u-d)$])
  content((2, -1.6), text(size: 8pt, fill: red.darken(20%))[$tilde(q) = (u-(1+r))/(u-d)$])

  content((0, -3.2), text(size: 8pt)[$t = 0$])
  content((5, -3.2), text(size: 8pt)[$t = 1$])
})

*Convention:* We require $0 < d <= 1 + r <= u$ to exclude trivial arbitrage opportunities. If $1 + r > u$ or $d > 1 + r$, the riskless asset dominates in every state (or vice versa).

== Replication and Contingent Claims

A *contingent claim* is any state-dependent payoff. A *derivative* is a contingent claim whose payoff is a function of asset prices. A *security* is a non-negative contingent claim traded in the market.

*Replication:* We seek a portfolio with $xi_0$ units of the riskless asset (price $pi_0 = 1$) and $xi_1$ units of the risky asset (price $pi_1$) such that the portfolio matches the target payoff in every state:

$ xi_0 (1+r) + xi_1 pi_1 u = C_U, quad xi_0 (1+r) + xi_1 pi_1 d = C_D $

Solving: $xi_1 = (C_U - C_D) / (pi_1 (u - d))$ and $xi_0 = 1 / (1+r) (C_U - xi_1 pi_1 u)$.

== Market Completeness and the Pay-off Matrix

The *pay-off matrix* is

$ X = mat(pi_0 (1+r), pi_1 u; pi_0 (1+r), pi_1 d) $

The market is *complete* iff $X$ is invertible, which holds iff $u != d$. When the market is complete, every contingent claim can be replicated.

*Arrow-Debreu prices* are found via $psi = X^(-T) p$ where $p = (pi_0, pi_1)^T$.

== Arrow-Debreu Prices

$ pi_(phi^U) = (1 + r - d) / ((u - d)(1 + r)), quad pi_(phi^D) = (u - (1 + r)) / ((u - d)(1 + r)) $

Any contingent claim with payoff $a$ in state $U$ and $b$ in state $D$ has price $V_0 = a pi_(phi^U) + b pi_(phi^D)$.

#example-box[
  *Example:* $pi_1 = 50$, $S(U) = 60$, $S(D) = 45$, $r = 0.03$. Price a European call with $X = 52$.

  $u = 60/50 = 1.2$, $d = 45/50 = 0.9$. $tilde(p) = (1.03 - 0.9) / (1.2 - 0.9) = 0.13/0.30 = 13/30$.

  $C(U) = max{60 - 52, 0} = 8$, $C(D) = max{45 - 52, 0} = 0$.

  $pi_C = (tilde(p) dot 8 + tilde(q) dot 0) / (1.03) = (13/30 times 8) / 1.03 = 3.467 / 1.03 approx £3.37$
]

#exercise-box[
  *Exercise 28.* In a one-period binomial model: $pi_1 = 80$, $S(U) = 100$, $S(D) = 70$, $r = 0.05$. Price a European put with strike $X = 85$.

  *Exercise 29.* In a one-period binomial model with $pi_1 = 40$, $u = 1.3$, $d = 0.8$, $r = 0.06$: find the replicating portfolio $(xi_0, xi_1)$ for a European call with strike $X = 45$, and verify that the portfolio price equals the risk-neutral price.

  *Exercise 30.* Show that in the one-period binomial model, the Arrow-Debreu prices $pi_(phi^U)$ and $pi_(phi^D)$ satisfy $pi_(phi^U) + pi_(phi^D) = 1/(1+r)$. Interpret this result.

  *Exercise 31.* In a one-period model with $pi_1 = 100$, $S(U) = 130$, $S(D) = 80$, $r = 0.04$, price a derivative with payoff $C(U) = (S(U))^2 / 100 = 169$ and $C(D) = (S(D))^2 / 100 = 64$.
]

= Multi-Period Binomial Model

== Two-Period Tree

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let w = 1.5
  let h = 0.5

  rect((-w/2, -h/2), (w/2, h/2), fill: blue.lighten(85%), stroke: 0.8pt + blue, radius: 3pt)
  content((0, 0), text(size: 8pt, fill: blue.darken(30%))[$S_0$])

  let x1 = 4
  rect((x1 - w/2, 2 - h/2), (x1 + w/2, 2 + h/2), fill: green.lighten(85%), stroke: 0.8pt + green.darken(20%), radius: 3pt)
  content((x1, 2), text(size: 8pt, fill: green.darken(30%))[$S_0 u$])

  rect((x1 - w/2, -2 - h/2), (x1 + w/2, -2 + h/2), fill: red.lighten(85%), stroke: 0.8pt + red.darken(20%), radius: 3pt)
  content((x1, -2), text(size: 8pt, fill: red.darken(30%))[$S_0 d$])

  let x2 = 8
  rect((x2 - w/2, 3.5 - h/2), (x2 + w/2, 3.5 + h/2), fill: green.lighten(75%), stroke: 0.8pt + green.darken(20%), radius: 3pt)
  content((x2, 3.5), text(size: 8pt, fill: green.darken(30%))[$S_0 u^2$])

  rect((x2 - w/2, 0 - h/2), (x2 + w/2, 0 + h/2), fill: yellow.lighten(75%), stroke: 0.8pt + orange.darken(20%), radius: 3pt)
  content((x2, 0), text(size: 8pt, fill: orange.darken(30%))[$S_0 u d$])

  rect((x2 - w/2, -3.5 - h/2), (x2 + w/2, -3.5 + h/2), fill: red.lighten(75%), stroke: 0.8pt + red.darken(20%), radius: 3pt)
  content((x2, -3.5), text(size: 8pt, fill: red.darken(30%))[$S_0 d^2$])

  line((w/2, 0.15), (x1 - w/2, 1.75), stroke: 1pt + green.darken(20%), mark: (end: ">"))
  line((w/2, -0.15), (x1 - w/2, -1.75), stroke: 1pt + red.darken(20%), mark: (end: ">"))

  line((x1 + w/2, 2.15), (x2 - w/2, 3.25), stroke: 1pt + green.darken(20%), mark: (end: ">"))
  line((x1 + w/2, 1.85), (x2 - w/2, 0.25), stroke: 1pt + red.darken(20%), mark: (end: ">"))

  line((x1 + w/2, -1.85), (x2 - w/2, -0.25), stroke: 1pt + green.darken(20%), mark: (end: ">"))
  line((x1 + w/2, -2.15), (x2 - w/2, -3.25), stroke: 1pt + red.darken(20%), mark: (end: ">"))

  content((1.8, 1.5), text(size: 7pt, fill: green.darken(20%))[$q$])
  content((1.8, -1.5), text(size: 7pt, fill: red.darken(20%))[$1-q$])

  content((0, -4.5), text(size: 8pt)[$t = 0$])
  content((x1, -4.5), text(size: 8pt)[$t = 1$])
  content((x2, -4.5), text(size: 8pt)[$t = 2$])
})

== Filtrations and Information

The *filtration* $(cal(F)_t)_(t=0)^T$ models the information available at each time. $cal(F)_t$ contains events determined by the first $t$ coin tosses:

- $cal(F)_0 = {emptyset, Omega}$ (no information at time 0)
- $cal(F)_T = cal(P)(Omega)$ (full information at time $T$)

A process $(X_t)$ is *adapted* to the filtration if $X_t$ is determined by $cal(F)_t$ (i.e. it depends only on information available at time $t$).

== Martingale Property

The *discounted* asset price $tilde(S)_t = S_t \/ (1+r)^t$ is a martingale under the risk-neutral measure $QQ$:

$ EE_QQ [tilde(S)_(t+1) | cal(F)_t] = tilde(S)_t $

This is the mathematical content of "risk-neutral pricing": under $QQ$, discounted prices are fair games.

== Self-Financing Strategies

A trading strategy $(xi_0^t, xi_1^t)_(t=0)^(T-1)$ is *self-financing* if, at each rebalancing date, the portfolio value does not change:

$ xi_0^(t-1) (1+r) + xi_1^(t-1) S_t = xi_0^t + xi_1^t S_t $

The investor adjusts holdings between the risky and riskless assets but cannot inject or withdraw money.

== Pricing Formula

For a path-independent claim $C(omega) = f(S_T (omega))$ in the $T$-period model:

#key-box[
  $ pi_C = 1 / (1 + r)^T sum_(k=0)^T binom(T, k) q^k (1 - q)^(T - k) f(S_0 u^k d^(T - k)) $

  where $q = (1 + r - d) / (u - d)$.
]

*Path-independent vs path-dependent:*
- A *path-independent* claim depends only on $S_T$, so there are at most $T + 1$ distinct terminal values. The binomial formula above applies directly.
- A *path-dependent* claim (e.g. Asian, lookback, barrier options) depends on the full path $(S_0, S_1, dots, S_T)$. With $T$ periods there are $2^T$ distinct paths, and each must be evaluated separately.

#example-box[
  *Example:* European call, $S_0 = 100$, $u = 1.1$, $d = 0.9$, $r = 0.02$, $X = 100$, $T = 2$.

  $q = (1.02 - 0.9) / (1.1 - 0.9) = 0.12/0.2 = 0.6$.

  Terminal prices: $S_0 u^2 = 121$, $S_0 u d = 99$, $S_0 d^2 = 81$.

  Payoffs: $f(121) = 21$, $f(99) = 0$, $f(81) = 0$.

  $ pi_C = 1 / 1.02^2 [0.6^2 times 21 + 2 times 0.6 times 0.4 times 0 + 0.4^2 times 0] = 7.56 / 1.0404 approx £7.27 $
]

== Backward Induction

At each node: $V_t = 1 / (1 + r) (q V_(t+1)^U + (1 - q) V_(t+1)^D)$.

For *American options*, take the maximum of exercise and continuation:

$ V_t = max{f(S_t), 1 / (1 + r)(q V_(t+1)^U + (1 - q) V_(t+1)^D)} $

#exercise-box[
  *Exercise 32.* In a two-period model: $S_0 = 100$, $u = 1.15$, $d = 0.85$, $r = 0.05$. Price an American put with $X = 100$ using backward induction.

  *Exercise 33.* In a three-period binomial model with $S_0 = 50$, $u = 1.2$, $d = 0.9$, $r = 0.03$, price a European call with $X = 55$ using the binomial pricing formula.

  *Exercise 34.* Show that the multi-period binomial pricing formula $pi_C = (1+r)^(-T) sum_(k=0)^T binom(T,k) q^k (1-q)^(T-k) f(S_0 u^k d^(T-k))$ can be written as $pi_C = (1+r)^(-T) EE_QQ [f(S_T)]$, and explain why this is the discounted expected payoff under the risk-neutral measure.

  *Exercise 35.* In a two-period model with $S_0 = 80$, $u = 1.25$, $d = 0.8$, $r = 0.05$, price a European put with $X = 85$ using backward induction. Verify that the European price is less than or equal to the American price (you may quote the American price from your backward induction).
]

= Black-Scholes-Merton

== From Binomial to Continuous: the CRR Model

The Cox-Ross-Rubinstein (CRR) model sets $u = e^(sigma sqrt(Delta t))$ and $d = e^(-sigma sqrt(Delta t))$, where $Delta t = T \/ n$ and $n$ is the number of periods. As $n -> infinity$:

- $ln(S_T \/ S_0)$ converges (by the CLT) to a normal distribution.
- $S_T$ becomes *log-normally distributed*:

$ S_T = S_0 exp[(r - sigma^2 / 2) T + sigma sqrt(T) Z], quad Z tilde cal(N)(0, 1) $

== Volatility Estimation

From observed prices $S_0, S_delta, S_(2 delta), dots, S_(M delta)$, compute log-returns $R_i = ln(S_(i delta) \/ S_((i-1) delta))$. Then

$ hat(sigma)^2 = 1 / ((M - 1) delta) sum_(i=1)^M (R_i - macron(R))^2, quad macron(R) = 1 / M sum_(i=1)^M R_i $

== The Formula

For a European call with strike $X$, expiry $T$, on a stock with price $S_0$ and volatility $sigma$:

#key-box[
  $ pi_"call" = S_0 Phi(d_+) - X e^(-r T) Phi(d_-) $
  $ pi_"put" = X e^(-r T) Phi(-d_-) - S_0 Phi(-d_+) $

  where $d_- = 1 / (sigma sqrt(T)) (ln(S_0 / X) + r T - 1 / 2 sigma^2 T)$, $quad d_+ = d_- + sigma sqrt(T)$

  and $Phi(z) = 1 / sqrt(2 pi) integral_(-infinity)^z e^(-s^2 \/ 2) dif s$ is the standard normal CDF.
]

#example-box[
  *Example:* $S_0 = 100$, $X = 95$, $r = 0.05$, $sigma = 0.20$, $T = 1$.

  $ d_- = 1 / (0.20) (ln(100/95) + 0.05 - 0.02) = 1 / 0.20 (0.0513 + 0.03) = 0.4065 $

  $ d_+ = 0.4065 + 0.20 = 0.6065 $

  $ Phi(0.6065) approx 0.7279, quad Phi(0.4065) approx 0.6579 $

  $ pi_"call" = 100 times 0.7279 - 95 e^(-0.05) times 0.6579 = 72.79 - 59.48 = £13.31 $

  By put-call parity: $pi_"put" = 13.31 - 100 + 95 e^(-0.05) = 13.31 - 100 + 90.39 = £3.70$
]

== The Greeks

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: (left, center, left),
  table.header([*Greek*], [*Formula (Call)*], [*Interpretation*]),
  [Delta $Delta$], [$Phi(d_+)$], [Change in value per £1 move in $S_t$],
  [Theta $Theta$], [$-(S_t sigma Phi'(d_+)) / (2 sqrt(tau)) - r X e^(-r tau) Phi(d_-)$], [Daily time decay],
  [Gamma $Gamma$], [$Phi'(d_+) / (S_t sigma sqrt(tau))$], [Rate of change of Delta],
  [Vega $nu$], [$S_t sqrt(tau) Phi'(d_+)$], [Sensitivity to volatility],
  [Rho $rho$], [$X tau e^(-r tau) Phi(d_-)$], [Sensitivity to interest rate],
)

== Delta-Hedging

Sell one call, hold $Delta = Phi(d_+)$ shares. The position is locally risk-neutral: first-order price movements cancel. The residual P&L comes from the balance between theta (time decay, positive for the hedger) and gamma (convexity, negative for the hedger).

#exercise-box[
  *Exercise 36.* Using the Black-Scholes formula, price a European put with $S_0 = 40$, $X = 45$, $r = 0.03$, $sigma = 0.30$, $T = 0.5$.

  *Exercise 37.* Using the Black-Scholes formula, price a European call with $S_0 = 150$, $X = 140$, $r = 0.04$, $sigma = 0.25$, $T = 0.75$. Compute $Delta$ and $Gamma$ for this option.

  *Exercise 38.* Show that the Black-Scholes call price satisfies $pi_"call" -> S_0$ as $sigma -> infinity$, and $pi_"call" -> max{S_0 - X e^(-r T), 0}$ as $sigma -> 0$. Interpret both limits financially.

  *Exercise 39.* A stock has $S_0 = 100$, $sigma = 0.30$, $r = 0.05$. A trader sells a European call with $X = 100$, $T = 0.25$ for £5.76. What is the delta-hedge position? If the stock price moves to £102 the next day (assume $T$ decreases by $1/365$), estimate the P&L on the hedged position using the Greeks.
]

= Exotic Options

== Summary of Types

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  table.header([*Type*], [*Payoff*], [*Path-dependent?*]),
  [European Call], [$max{S_T - X, 0}$], [No],
  [European Put], [$max{X - S_T, 0}$], [No],
  [American Put], [$max{X - S_t, 0}$ (exercise any $t$)], [No (but early exercise)],
  [Asian Call], [$(macron(S) - X)^+$ where $macron(S) = 1/(T+1) sum S_t$], [Yes],
  [Lookback Call], [$(max_t S_t - X)^+$], [Yes],
  [Lookback Put], [$(X - min_t S_t)^+$], [Yes],
  [Barrier (Knock-in)], [Vanilla payoff if barrier crossed], [Yes],
  [Barrier (Knock-out)], [Vanilla payoff if barrier not crossed], [Yes],
)

Key identity: *Knock-in + Knock-out = European option* (for same barrier, strike, and expiry).

== American Options by Backward Induction

At each node in the binomial tree, the holder chooses between exercising now and continuing:

$ V_t = max{f(S_t), 1 / (1 + r) EE_QQ [V_(t+1) | cal(F)_t]} $

Early exercise is optimal when the exercise value exceeds the continuation value.

== Asian Options

An Asian option's payoff depends on the _average_ price over the life of the option. It is path-dependent because two paths with the same terminal price $S_T$ can have different averages.

== Barrier Options

A *knock-in* option comes into existence if the asset price hits a specified barrier. A *knock-out* option ceases to exist if the barrier is hit. The key identity Knock-in + Knock-out $=$ European option holds because exactly one of the two is active for any given path.

#exercise-box[
  *Exercise 40.* In a two-period model with $S_0 = 100$, $u = 1.2$, $d = 0.9$, $r = 0.05$, $X = 105$, price an Asian call option (payoff $(macron(S) - X)^+$ where $macron(S) = 1/3 (S_0 + S_1 + S_2)$).

  *Exercise 41.* In a two-period model with $S_0 = 100$, $u = 1.2$, $d = 0.9$, $r = 0.05$, price a lookback call option with payoff $(max{S_0, S_1, S_2} - X)^+$ where $X = 105$.

  *Exercise 42.* Using the same model as Exercise 41, price an up-and-in barrier call with barrier $B = 115$ and strike $X = 100$. The option knocks in if $S_t >= B$ at any $t in {0, 1, 2}$. Verify the knock-in/knock-out identity by computing the corresponding up-and-out call price.

  *Exercise 43.* Explain why an Asian call option is always cheaper than or equal to a European call option with the same strike and expiry. Construct a brief mathematical argument using Jensen's inequality.
]

= Probability Theory

== Probability Spaces

A *probability space* $(Omega, cal(F), P)$ consists of:
- A *sample space* $Omega != emptyset$: the set of all possible outcomes
- A *$sigma$-algebra* $cal(F)$ on $Omega$: a collection of subsets (events) satisfying: (i) $emptyset in cal(F)$, (ii) $A in cal(F) => A^c in cal(F)$, (iii) closed under countable unions
- A *probability measure* $P: cal(F) -> [0, 1]$ with $P(Omega) = 1$, $P(emptyset) = 0$, and countable additivity

#key-box[
  *Key properties:*
  - $P(A^c) = 1 - P(A)$
  - *Monotonicity:* $A subset.eq B => P(A) <= P(B)$
  - *Sub-additivity:* $P(A union B) <= P(A) + P(B)$
]

#example-box[
  *Example:* $Omega = {U, D}$, $cal(F) = cal(P)(Omega) = {emptyset, {U}, {D}, {U,D}}$. Define $P({U}) = p$. Then $P({D}) = 1 - p$ and $P(Omega) = 1$.
]

== Sigma-Algebras and Borel Sets

The *$sigma$-algebra generated by* $cal(K)$ is $sigma(cal(K)) = inter.big {cal(F) : cal(F) "is a" sigma"-algebra", cal(K) subset.eq cal(F)}$ — the smallest $sigma$-algebra containing $cal(K)$.

The *Borel $sigma$-algebra* on $RR$ is $cal(B)(RR) := sigma({(a, b] : a <= b})$. It contains all open, closed, and half-open intervals, and all singletons (since ${a} = inter.big_(n in NN) (a - 1/n, a] in cal(B)(RR)$).

== Random Variables and Expectation

A *random variable* $X: Omega -> RR$ is a measurable function ($X^(-1)(B) in cal(F)$ for all $B in cal(B)(RR)$).

The *expectation* is $EE_P (X) = integral_Omega X(omega) dif P(omega)$. For finite $Omega$:

$ EE_P (X) = sum_(i=1)^n X(omega_i) P({omega_i}) $

#example-box[
  *Example:* $Omega = {U, D}$, $P({U}) = p$, $X(U) = 100$, $X(D) = -50$.

  $EE(X) = 100 p + (-50)(1 - p) = 150 p - 50$.
]

#exercise-box[
  *Exercise 44.* Let $Omega = {H H, H T, T H, T T}$ with uniform probability $P({omega}) = 1/4$. Define $X(H H) = 50$, $X(H T) = 100$, $X(T H) = 100$, $X(T T) = -750$. Compute $EE(X)$.

  *Exercise 45.* Is $cal(F) = {emptyset, {H H, H T}, {T H, T T}, Omega}$ a valid $sigma$-algebra on the sample space above? What about ${emptyset, {H H, H T}, {H H, T H}, Omega}$?

  *Exercise 46.* Let $Omega = {a, b, c}$ and $cal(F) = cal(P)(Omega)$. Define $P({a}) = 1/2$, $P({b}) = 1/3$, $P({c}) = 1/6$. Let $X(a) = 6$, $X(b) = -3$, $X(c) = 12$. Compute $EE(X)$ and $"Var"(X)$.

  *Exercise 47.* Show that for any random variable $X$ on a probability space $(Omega, cal(F), P)$ with finite second moment, $"Var"(X) = EE(X^2) - (EE(X))^2 >= 0$, with equality iff $X$ is constant $P$-a.s.

  *Exercise 48.* Let $Omega = {omega_1, omega_2, omega_3, omega_4}$ with $P({omega_i}) = 1/4$. Let $cal(G) = {emptyset, {omega_1, omega_2}, {omega_3, omega_4}, Omega}$. If $X(omega_1) = 10$, $X(omega_2) = 6$, $X(omega_3) = 4$, $X(omega_4) = 8$, compute $EE(X | cal(G))$.
]

= One-Period Market Model and FTAP

== General Market Model

A *one-period market model* is a tuple $(Omega, cal(F), P, overline(pi), overline(S))$ where:
- $(Omega, cal(F), P)$ is a probability space
- $overline(pi) = (pi_0, pi_1, ..., pi_d)$ is the *price system* at $t = 0$ (with $pi_0 = 1$ for the bond)
- $overline(S) = (S^0, S^1, ..., S^d)$ are asset values at $t = 1$, with $S^0(omega) = 1 + r$ for all $omega$

A *portfolio* $overline(xi) = (xi_0, xi_1, ..., xi_d)$ has value $V_0 = sum xi_i pi_i$ at $t = 0$ and $V_1(omega) = xi_0(1+r) + sum_(i=1)^d xi_i S^i(omega)$ at $t = 1$.

== Arbitrage

An *arbitrage portfolio* $overline(xi)$ satisfies: $overline(xi) dot overline(pi) <= 0$, $overline(xi) dot overline(S)(omega) >= 0$ $P$-a.s., and $P(overline(xi) dot overline(S) > 0) > 0$. In words: *you never lose, you sometimes win, and you don't have to pay for it*.

== Risk-Neutral Measures

A probability measure $Q$ on $(Omega, cal(F))$ is *risk-neutral* if $pi_i = EE_Q (S^i / (1 + r))$ for every asset $i$. Two measures $P$ and $Q$ are *equivalent* ($P tilde Q$) iff they have the same nullsets.

#key-box[
  *First Fundamental Theorem of Asset Pricing (FTAP):*

  A market model is *arbitrage-free* $<==>$ there exists a risk-neutral measure $Q tilde P$.
]

#example-box[
  *Example (Binomial):* $Omega = {U, D}$, one risky asset. The risk-neutral condition $pi_1 = (tilde(p) dot pi_1 u + tilde(q) dot pi_1 d) / (1 + r)$ gives $tilde(p) = (1 + r - d) / (u - d)$. This is in $(0, 1)$ iff $d < 1 + r < u$, confirming the arbitrage-free condition.
]

#example-box[
  *Example ($n = 3$ states):* $pi_1 = 100$, $r = 0.05$, $S(omega_1) = 120$, $S(omega_2) = 100$, $S(omega_3) = 90$. Risk-neutral condition: $120 q_1 + 100 q_2 + 90 q_3 = 105$ with $q_1 + q_2 + q_3 = 1$. This gives a one-parameter family: $q_2 = 3/2 - 3q_1$, $q_3 = 2q_1 - 1/2$ for $q_1 in (1/6, 1/2)$.
]

== Law of One Price

If the market is arbitrage-free and two portfolios have the same payoff ($overline(xi) dot overline(S) = overline(eta) dot overline(S)$ $P$-a.s.), then they have the same price ($overline(xi) dot overline(pi) = overline(eta) dot overline(pi)$).

== Arbitrage-Free Pricing

For a security $C >= 0$, the set of arbitrage-free prices is:

$ Pi(C) = {EE_Q (C / (1 + r)) : Q "risk-neutral", Q tilde P} $

#key-box[
  - If $C$ is *replicable* (unique risk-neutral measure), $Pi(C)$ is a singleton — the price is unique
  - If $C$ is *not replicable*, $Pi(C)$ is an open interval
  - In the binomial model, every claim is replicable: $pi_C = (tilde(p) C(U) + tilde(q) C(D)) / (1 + r)$
]

#exercise-box[
  *Exercise 49.* In a 3-state model with $pi_1 = 100$, $r = 0.05$, $S(omega_1) = 120$, $S(omega_2) = 100$, $S(omega_3) = 90$, find the set of arbitrage-free prices for a European call with strike $X = 95$.

  *Exercise 50.* Using the FTAP, explain why a market with $d < 1 + r < u$ in the one-period binomial model is arbitrage-free, and why it fails if $1 + r > u$ or $1 + r < d$.

  *Exercise 51.* In a 3-state model with $pi_1 = 50$, $r = 0.04$, $S(omega_1) = 65$, $S(omega_2) = 50$, $S(omega_3) = 40$, find the set of risk-neutral measures. Then find the range of arbitrage-free prices for a European put with strike $X = 55$.

  *Exercise 52.* Show that in the general one-period model, if $Q$ is a risk-neutral measure and $C$ is a replicable contingent claim with replicating portfolio $overline(xi)$, then $overline(xi) dot overline(pi) = EE_Q (C / (1+r))$. Explain why this means the arbitrage-free price is unique.

  *Exercise 53.* Consider a one-period model with two risky assets and three states. $pi_1 = 10$, $pi_2 = 20$, $r = 0.05$. The payoffs are $S^1(omega_1) = 12$, $S^1(omega_2) = 11$, $S^1(omega_3) = 9$ and $S^2(omega_1) = 24$, $S^2(omega_2) = 22$, $S^2(omega_3) = 18$. Show that the market is arbitrage-free but incomplete.
]

#pagebreak()

= Solutions

== Exercise 1

$i = 0.09/4 = 0.0225$, $N = 24$.

$P_T = 5000(1.0225)^24 = 5000 times 1.7058 = £8529.00$

== Exercise 2

$r_"eff" = (1 + 0.048/12)^12 - 1 = (1.004)^12 - 1 = 1.04907 - 1 = 4.907%$

$r_c = ln(1.04907) = 4.790%$

== Exercise 3

$P_T = 2P$ under continuous compounding: $2P = P e^(9r)$, so $e^(9r) = 2$, giving $r = ln(2)/9 = 0.07702 = 7.702%$.

For the same effective rate with quarterly compounding: $e^r = (1 + r_4 / 4)^4$, so $r_4 = 4(e^(r\/4) - 1) = 4(e^(0.01925) - 1) = 4 times 0.01944 = 0.07776 = 7.776%$.

== Exercise 4

Let $f(n) = (1 + r/n)^n$. Taking logarithms: $ln f(n) = n ln(1 + r/n)$. Let $h = r/n$, so $ln f = (r/h) ln(1 + h)$. As $n$ increases, $h$ decreases. We show $g(h) = ln(1+h)/h$ is decreasing for $h > 0$:

$g'(h) = (h/(1+h) - ln(1+h)) / h^2$. Since $ln(1+h) > h/(1+h)$ for $h > 0$ (by concavity of $ln$), we have $g'(h) < 0$. Therefore $ln f(n)$ is increasing in $n$, so $r_"eff" = f(n) - 1$ is strictly increasing.

For the limit: $lim_(n->infinity) (1 + r/n)^n = e^r$ (standard result), so $lim_(n->infinity) r_"eff" = e^r - 1$.

== Exercise 5

$P(5) = 10000 exp(integral_0^5 (0.04 + 0.005 s) dif s) = 10000 exp[0.04 s + 0.0025 s^2]_0^5$

$= 10000 exp(0.20 + 0.0625) = 10000 e^(0.2625) = 10000 times 1.3001 = £13,001$

== Exercise 6

$i = 0.072/12 = 0.006$, $N = 60$.

$A = (20000 times 0.006) / (1 - (1.006)^(-60)) = 120 / (1 - 0.6983) = 120 / 0.3017 = £397.73$

Total paid: $397.73 times 60 = £23,863.80$. Interest: $£3,863.80$.

== Exercise 7

Perpetuity: $"PV" = 1000 / 0.04 = £25,000$.

Annuity: $"PV" = 1000 dot (1 - (1.04)^(-30)) / 0.04 = 1000 times 17.292 = £17,292$.

== Exercise 8

$i = 0.063/12 = 0.00525$. Solve $45000 = 500 dot (1 - (1.00525)^(-N)) / 0.00525$.

$(1.00525)^(-N) = 1 - 45000 times 0.00525 / 500 = 1 - 0.4725 = 0.5275$

$-N ln(1.00525) = ln(0.5275)$, so $N = -ln(0.5275) / ln(1.00525) = 0.6397 / 0.005236 = 122.2$.

So $N = 123$ months (rounding up since the last payment is partial). Total paid $approx 122 times 500 + "small final" approx £61,500$. Total interest $approx 61,500 - 45,000 = £16,500$.

== Exercise 9

$"PV" = A dot (1 - (1+i)^(-N)) / i$. As $N -> infinity$, $(1+i)^(-N) -> 0$ since $i > 0$, so $"PV" -> A dot 1/i = A/i$.

This is the present value of a perpetuity because a perpetuity is the limit of an $N$-period annuity as $N -> infinity$. Equivalently, a perpetuity paying $A$ per period is worth $"PV"$ today where the interest on $"PV"$ exactly equals $A$: $"PV" times i = A$, giving $"PV" = A/i$.

== Exercise 10

The annuity begins at $t = 6$ (first payment at $t = 6$, last at $t = 25$). The value at $t = 5$ (one period before the first payment) is:

$"PV"_5 = 3000 dot (1 - (1.05)^(-20)) / 0.05 = 3000 times 12.4622 = £37,386.60$

Discounting to $t = 0$: $"PV"_0 = 37386.60 / (1.05)^5 = 37386.60 / 1.27628 = £29,293.10$

== Exercise 11

$ 98 = 4 e^(-0.03) + 4 e^(-0.07) + 104 e^(-3 z(3)) $

$ = 4 times 0.9704 + 4 times 0.9324 + 104 e^(-3 z(3)) = 3.881 + 3.730 + 104 e^(-3 z(3)) $

$ e^(-3 z(3)) = (98 - 7.611) / 104 = 90.389 / 104 = 0.8691 $

$ z(3) = -ln(0.8691) / 3 = 0.1403 / 3 = 4.677% $

== Exercise 12

From the 1-year ZCB: $96 = 100 e^(-z(1))$, so $e^(-z(1)) = 0.96$ and $z(1) = -ln(0.96) = 4.082%$.

From the 2-year coupon bond: $99 = 5 e^(-z(1)) + 105 e^(-2 z(2)) = 5 times 0.96 + 105 e^(-2 z(2)) = 4.80 + 105 e^(-2 z(2))$.

$105 e^(-2 z(2)) = 99 - 4.80 = 94.20$, so $e^(-2 z(2)) = 94.20/105 = 0.8971$.

$z(2) = -ln(0.8971)/2 = 0.1086/2 = 5.430%$.

== Exercise 13

For a bond at par with annual coupons and continuous compounding: $F = c F e^(-z) + c F e^(-2z) + dots.h.c + c F e^(-T z) + F e^(-T z)$.

Dividing by $F$: $1 = c sum_(k=1)^T e^(-k z) + e^(-T z) = c dot (e^(-z)(1 - e^(-T z))) / (1 - e^(-z)) + e^(-T z)$.

$1 - e^(-T z) = c dot (e^(-z)(1 - e^(-T z))) / (1 - e^(-z))$

$1 = c dot e^(-z) / (1 - e^(-z)) = c / (e^z - 1)$

Therefore $c = e^z - 1$.

== Exercise 14

Semi-annual coupon $C = 100 times 0.05 / 2 = 2.50$, $n = 20$ periods, $i = 0.04/2 = 0.02$.

$P = 2.50 dot (1 - (1.02)^(-20)) / 0.02 + 100 (1.02)^(-20) = 2.50 times 16.3514 + 100 times 0.6730$

$= 40.88 + 67.30 = £108.18$

The bond trades at a *premium* ($P > F$) because the coupon rate (5%) exceeds the yield (4%). Investors are willing to pay above par for the higher-than-market coupon payments.

== Exercise 15

Storage is like a negative dividend yield, so $F_0 = S_0 e^((r + c) T)$ where $c = 5/1800$.

$F_0 = 1800 e^((0.03 + 0.002778) times 1) = 1800 e^(0.03278) = 1800 times 1.03332 = \$1859.98$

== Exercise 16

$F_0 = S_0 e^((r - q) T) = 200 e^((0.05 - 0.03) times 1) = 200 e^(0.02) = 200 times 1.02020 = \$204.04$

== Exercise 17

Present value of dividends: $I = 1.50 e^(-0.04 times 2/12) + 1.50 e^(-0.04 times 5/12) = 1.50 times 0.9934 + 1.50 times 0.9834 = 1.4901 + 1.4751 = £2.9652$.

Forward price: $F_0 = (80 - 2.9652) e^(0.04 times 0.5) = 77.0348 times 1.02020 = £78.59$.

After 3 months ($tau = 3/12 = 0.25$ remaining), only the second dividend (in 2 months) has PV $I' = 1.50 e^(-0.04 times 2/12) = 1.50 times 0.9934 = £1.4901$.

Value of long forward: $f = S_(0.25) - I' - K e^(-r tau) = 85 - 1.4901 - 78.59 e^(-0.04 times 0.25) = 85 - 1.4901 - 78.59 times 0.9900 = 85 - 1.49 - 77.80 = £5.71$.

== Exercise 18

A long forward with delivery price $K$ has payoff $S_T - K$ at time $T$. Its time-0 value is the present value of this payoff. Consider two portfolios:

- *Portfolio A:* Long forward + cash $K e^(-r tau)$
- *Portfolio B:* One share

At time $T$: Portfolio A is worth $(S_T - K) + K = S_T$, which equals Portfolio B.

By no-arbitrage: $f + K e^(-r tau) = S_0$, giving $f = S_0 - K e^(-r tau)$.

At inception, $K = F_0 = S_0 e^(r T)$, so $f = S_0 - S_0 e^(r T) e^(-r T) = S_0 - S_0 = 0$. $square$

== Exercise 19

$pi_C - pi_P = S_0 - X e^(-r T)$

$6 - 3 = 52 - 50 e^(-0.5 r)$

$50 e^(-0.5 r) = 49$

$e^(-0.5 r) = 0.98$

$r = -2 ln(0.98) = 2 times 0.02020 = 4.04%$

== Exercise 20

Lower bound: $S_0 - X e^(-r T) = 60 - 55 e^(-0.06) = 60 - 55 times 0.9418 = 60 - 51.80 = £8.20$. $checkmark$

If the call trades at £7 $< 8.20$, we have arbitrage. Strategy at $t = 0$: buy the call for £7, short-sell the stock for £60, invest £53 at rate $r = 6%$.

At $t = T = 1$: the investment grows to $53 e^(0.06) = 53 times 1.0618 = £56.28$.

- If $S_T > 55$: exercise the call, pay £55 for the stock to close the short. Profit $= 56.28 - 55 = £1.28$.
- If $S_T <= 55$: let the call expire, buy the stock at $S_T$ to close the short. Profit $= 56.28 - S_T >= 56.28 - 55 = £1.28$.

Minimum profit $= £1.28 > 0$. (More precisely: $S_0 - X e^(-r T) - pi_C = 8.20 - 7 = £1.20$ compounded to $1.20 e^(0.06) = £1.27$.)

== Exercise 21

From put-call parity: $pi_C - pi_P = S_0 - X e^(-r T)$.

$partial / (partial S_0) (pi_C - pi_P) = 1 > 0$, so $pi_C - pi_P$ is strictly increasing in $S_0$.

$partial / (partial X) (pi_C - pi_P) = -e^(-r T) < 0$, so $pi_C - pi_P$ is strictly decreasing in $X$. $square$

== Exercise 22

Check: $1/2(pi_1 + pi_3) = 1/2(12 + 4) = 8 >= 7 = pi_2$. $checkmark$

If violated (say $pi_2 > 1/2(pi_1 + pi_3)$): construct a butterfly spread — buy one call at $X_1$, buy one call at $X_3$, sell two calls at $X_2$. The cost is $pi_1 + pi_3 - 2 pi_2 < 0$ (a net credit). But the butterfly payoff is always $>= 0$. This is an arbitrage: non-positive cost, non-negative payoff, strictly positive payoff when $S_T$ is between $X_1$ and $X_3$.

== Exercise 23

Buy call at $X_1 = 90$ for £15, sell call at $X_2 = 110$ for £5. Net cost: $15 - 5 = £10$.

Maximum profit: $(X_2 - X_1) - "cost" = (110 - 90) - 10 = £10$ (when $S_T >= 110$).

Maximum loss: $£10$ (the net premium paid, when $S_T <= 90$).

== Exercise 24

Break-even points: $S_T = X plus.minus (pi_C + pi_P) = 100 plus.minus (8 + 6) = 100 plus.minus 14$.

So break-even at $S_T = 86$ and $S_T = 114$.

Maximum loss occurs when $S_T = X = 100$, where the payoff is zero and the total premium is lost:

Maximum loss $= pi_C + pi_P = 8 + 6 = £14$.

== Exercise 25

Net cost: $8 - 2 times 5 + 3 = £1$ (buy wings, sell body).

Payoff of butterfly: buy call at 45, sell 2 calls at 50, buy call at 55.

- $S_T = 40$: all expire worthless. Payoff $= 0$. Profit $= 0 - 1 = -£1$.
- $S_T = 45$: all expire worthless. Payoff $= 0$. Profit $= -£1$.
- $S_T = 50$: long 45-call pays 5, others worthless. Payoff $= 5$. Profit $= 5 - 1 = £4$.
- $S_T = 55$: long 45-call pays 10, short 50-calls pay $-2 times 5 = -10$, long 55-call pays 0. Payoff $= 0$. Profit $= -£1$.
- $S_T = 60$: long 45-call pays 15, short 50-calls pay $-20$, long 55-call pays 5. Payoff $= 0$. Profit $= -£1$.

== Exercise 26

Covered call profit: $S_T - S_0 - max{S_T - X, 0} + pi_C = min{S_T, X} - S_0 + pi_C$.

Short put profit: $-max{X - S_T, 0} + pi_P = min{S_T - X, 0} + pi_P = min{S_T, X} - X + pi_P$.

So covered call profit $= $ short put profit $+ (X - S_0 + pi_C - pi_P)$.

By put-call parity, $pi_C - pi_P = S_0 - X e^(-r T)$, so the constant is $X - S_0 + S_0 - X e^(-r T) = X(1 - e^(-r T))$.

== Exercise 27

Net cost: $8 - 3 = £5$.

- If $S_T <= 60$: both puts exercised. Payoff $= (70 - S_T) - (60 - S_T) = 10$. Profit $= 10 - 5 = £5$.
- If $60 < S_T < 70$: only the 70-put exercised. Payoff $= 70 - S_T$. Profit $= 70 - S_T - 5$.
- If $S_T >= 70$: both expire worthless. Profit $= -£5$.

Maximum profit: $£5$ (when $S_T <= 60$). Maximum loss: $£5$ (when $S_T >= 70$). Break-even: $70 - S_T - 5 = 0$, so $S_T = £65$.

== Exercise 28

$u = 100/80 = 1.25$, $d = 70/80 = 0.875$.

$tilde(p) = (1.05 - 0.875) / (1.25 - 0.875) = 0.175 / 0.375 = 7/15$

$C(U) = max{85 - 100, 0} = 0$, $C(D) = max{85 - 70, 0} = 15$.

$pi_P = (7/15 times 0 + 8/15 times 15) / 1.05 = 8 / 1.05 approx £7.62$

== Exercise 29

$u = 1.3$, $d = 0.8$, $pi_1 = 40$, $r = 0.06$, $X = 45$.

$S(U) = 40 times 1.3 = 52$, $S(D) = 40 times 0.8 = 32$.

$C(U) = max{52 - 45, 0} = 7$, $C(D) = max{32 - 45, 0} = 0$.

Replicating portfolio: $xi_1 = (C(U) - C(D)) / (pi_1(u - d)) = (7 - 0) / (40 times 0.5) = 7/20 = 0.35$.

$xi_0 = (C(U) - xi_1 pi_1 u) / (1 + r) = (7 - 0.35 times 52) / 1.06 = (7 - 18.2) / 1.06 = -11.2 / 1.06 = -10.566$.

Portfolio price: $V_0 = xi_0 + xi_1 pi_1 = -10.566 + 0.35 times 40 = -10.566 + 14 = £3.434$.

Risk-neutral price: $tilde(p) = (1.06 - 0.8) / (1.3 - 0.8) = 0.26/0.50 = 0.52$.

$pi_C = (0.52 times 7 + 0.48 times 0) / 1.06 = 3.64 / 1.06 = £3.434$. $checkmark$

== Exercise 30

$pi_(phi^U) + pi_(phi^D) = (1 + r - d) / ((u - d)(1+r)) + (u - (1+r)) / ((u - d)(1+r))$

$= (1 + r - d + u - 1 - r) / ((u-d)(1+r)) = (u - d) / ((u-d)(1+r)) = 1/(1+r)$. $square$

Interpretation: the sum of the Arrow-Debreu prices equals the price of the riskless bond (which pays 1 in every state). Equivalently, the present value of a certain payment of £1 at $t = 1$ is $1/(1+r)$.

== Exercise 31

$u = 130/100 = 1.3$, $d = 80/100 = 0.8$, $r = 0.04$.

$tilde(p) = (1.04 - 0.8) / (1.3 - 0.8) = 0.24/0.50 = 0.48$.

$pi = (0.48 times 169 + 0.52 times 64) / 1.04 = (81.12 + 33.28) / 1.04 = 114.40 / 1.04 = £110.00$.

== Exercise 32

$q = (1.05 - 0.85) / (1.15 - 0.85) = 0.20/0.30 = 2/3$.

Terminal prices: $S_0 u^2 = 132.25$, $S_0 u d = 97.75$, $S_0 d^2 = 72.25$.

Terminal payoffs: $C_(U U) = 0$, $C_(U D) = 2.25$, $C_(D D) = 27.75$.

*At $t = 1$, up node* ($S_1 = 115$): continuation $= (2/3 times 0 + 1/3 times 2.25) / 1.05 = 0.714$. Exercise $= max{100 - 115, 0} = 0$. $V_1(U) = 0.714$.

*At $t = 1$, down node* ($S_1 = 85$): continuation $= (2/3 times 2.25 + 1/3 times 27.75) / 1.05 = 10.71$. Exercise $= max{100 - 85, 0} = 15$. $V_1(D) = 15$ (early exercise).

*At $t = 0$*: continuation $= (2/3 times 0.714 + 1/3 times 15) / 1.05 = 5.226 / 1.05 = 4.977$. Exercise $= 0$. $V_0 = £4.98$.

== Exercise 33

$q = (1.03 - 0.9) / (1.2 - 0.9) = 0.13/0.30 = 13/30$.

Terminal prices after 3 periods: $S_0 u^3 = 50 times 1.728 = 86.4$, $S_0 u^2 d = 50 times 1.296 = 64.8$, $S_0 u d^2 = 50 times 0.972 = 48.6$, $S_0 d^3 = 50 times 0.729 = 36.45$.

Payoffs ($X = 55$): $f(86.4) = 31.4$, $f(64.8) = 9.8$, $f(48.6) = 0$, $f(36.45) = 0$.

$pi_C = 1/(1.03)^3 [binom(3,3) (13/30)^3 times 31.4 + binom(3,2) (13/30)^2 (17/30) times 9.8 + 0 + 0]$

$= 1/1.0927 [(0.08144) times 31.4 + 3 times (0.18789) times (0.56667) times 9.8]$

$(13/30)^3 = 2197/27000 = 0.08137$. $quad (13/30)^2 (17/30) = 169/900 times 17/30 = 2873/27000 = 0.10641$.

$pi_C = 1/1.0927 [0.08137 times 31.4 + 3 times 0.10641 times 9.8] = 1/1.0927 [2.555 + 3.128] = 5.683/1.0927 = £5.20$.

== Exercise 34

In the $T$-period binomial model under the risk-neutral measure $QQ$, the terminal price is $S_T = S_0 u^k d^(T-k)$ where $k$ counts the number of up-moves. Under $QQ$, each move is independently up with probability $q = (1+r-d)/(u-d)$, so $k tilde "Bin"(T, q)$ and $QQ(k "up-moves") = binom(T,k) q^k (1-q)^(T-k)$.

Therefore $EE_QQ [f(S_T)] = sum_(k=0)^T binom(T,k) q^k (1-q)^(T-k) f(S_0 u^k d^(T-k))$, and the pricing formula becomes $pi_C = (1+r)^(-T) EE_QQ [f(S_T)]$.

This is the discounted expected payoff under $QQ$: the risk-neutral measure ensures that the discount rate for all cash flows is the risk-free rate, regardless of the actual probabilities or risk preferences.

== Exercise 35

$u = 1.25$, $d = 0.8$, $r = 0.05$, $S_0 = 80$, $X = 85$.

$q = (1.05 - 0.8) / (1.25 - 0.8) = 0.25/0.45 = 5/9$.

Terminal prices: $S_0 u^2 = 125$, $S_0 u d = 80$, $S_0 d^2 = 51.2$.

Terminal put payoffs: $P_(U U) = 0$, $P_(U D) = 5$, $P_(D D) = 33.8$.

*At $t = 1$, up node* ($S_1 = 100$): European continuation $= (5/9 times 0 + 4/9 times 5)/1.05 = 2.222/1.05 = 2.116$. American exercise $= max{85 - 100, 0} = 0$. $V_1^"Eur"(U) = 2.116$, $V_1^"Am"(U) = 2.116$.

*At $t = 1$, down node* ($S_1 = 64$): European continuation $= (5/9 times 5 + 4/9 times 33.8)/1.05 = (2.778 + 15.022)/1.05 = 16.952$. American exercise $= max{85 - 64, 0} = 21$. $V_1^"Eur"(D) = 16.952$, $V_1^"Am"(D) = 21$ (early exercise).

*At $t = 0$, European:* $V_0^"Eur" = (5/9 times 2.116 + 4/9 times 16.952)/1.05 = (1.176 + 7.534)/1.05 = 8.710/1.05 = £8.30$.

*At $t = 0$, American:* $V_0^"Am" = (5/9 times 2.116 + 4/9 times 21)/1.05 = (1.176 + 9.333)/1.05 = 10.509/1.05 = £10.01$.

European exercise $= max{85 - 80, 0} = 5 < 10.01$, so no early exercise at $t = 0$.

Indeed $V_0^"Eur" = 8.30 <= 10.01 = V_0^"Am"$. $checkmark$

== Exercise 36

$d_- = 1 / (0.30 sqrt(0.5)) (ln(40/45) + 0.03 times 0.5 - 0.5 times 0.09 times 0.5) = 1 / 0.2121 (-0.1178 + 0.015 - 0.0225)$

$= (-0.1253) / 0.2121 = -0.5908$

$d_+ = -0.5908 + 0.2121 = -0.3787$

$Phi(-d_-) = Phi(0.5908) approx 0.7227$, $quad Phi(-d_+) = Phi(0.3787) approx 0.6475$

$pi_"put" = 45 e^(-0.015) times 0.7227 - 40 times 0.6475 = 44.33 times 0.7227 - 25.90 = 32.04 - 25.90 = £6.14$

== Exercise 37

$S_0 = 150$, $X = 140$, $r = 0.04$, $sigma = 0.25$, $T = 0.75$.

$d_- = 1/(0.25 sqrt(0.75)) (ln(150/140) + 0.04 times 0.75 - 0.5 times 0.0625 times 0.75) = 1/0.2165 (0.06899 + 0.03 - 0.02344)$

$= 0.07555/0.2165 = 0.3490$

$d_+ = 0.3490 + 0.2165 = 0.5655$

$Phi(0.5655) approx 0.7142$, $quad Phi(0.3490) approx 0.6364$

$pi_"call" = 150 times 0.7142 - 140 e^(-0.03) times 0.6364 = 107.13 - 140 times 0.9704 times 0.6364 = 107.13 - 86.42 = £20.71$

$Delta = Phi(d_+) = 0.7142$

$Gamma = Phi'(d_+) / (S_0 sigma sqrt(T)) = phi(0.5655) / (150 times 0.2165)$, where $phi(0.5655) = 1/sqrt(2pi) e^(-0.5655^2\/2) = 0.3389/e^(0.1599) = 0.3389/1.1733 = 0.2889$.

$Gamma = 0.2889/32.48 = 0.00890$.

== Exercise 38

*As $sigma -> infinity$:* $d_+ = 1/(sigma sqrt(T))(ln(S_0/X) + r T) + sigma sqrt(T)/2 -> +infinity$ since the $sigma sqrt(T)/2$ term dominates. Also $d_- = d_+ - sigma sqrt(T) -> -infinity$. So $Phi(d_+) -> 1$ and $Phi(d_-) -> 0$.

Therefore $pi_"call" -> S_0 times 1 - X e^(-r T) times 0 = S_0$.

Interpretation: when volatility is extreme, the option is almost certain to end deep in the money, so it is worth as much as the stock itself.

*As $sigma -> 0$:* If $S_0 > X e^(-r T)$ (i.e. $ln(S_0/X) + r T > 0$), then $d_+, d_- -> +infinity$, so $Phi(d_+), Phi(d_-) -> 1$ and $pi_"call" -> S_0 - X e^(-r T)$.

If $S_0 < X e^(-r T)$, then $d_+, d_- -> -infinity$, so $pi_"call" -> 0$.

Therefore $pi_"call" -> max{S_0 - X e^(-r T), 0}$.

Interpretation: with no volatility, the stock price grows deterministically at rate $r$, and the option value equals its discounted intrinsic value.

== Exercise 39

First compute $d_+$: $d_- = 1/(0.30 sqrt(0.25))(ln(100/100) + 0.05 times 0.25 - 0.5 times 0.09 times 0.25) = 1/0.15 (0 + 0.0125 - 0.01125) = 0.00833$.

$d_+ = 0.00833 + 0.15 = 0.1583$.

$Delta = Phi(0.1583) approx 0.5629$. The delta-hedge: hold 0.5629 shares per call sold.

$Gamma = phi(0.1583)/(100 times 0.15) = 0.3936/15 = 0.02624$.

$Theta = -(100 times 0.30 times 0.3936)/(2 sqrt(0.25)) - 0.05 times 100 e^(-0.0125) times Phi(0.00833) = -(11.808)/1 - 5 times 0.9876 times 0.5033 = -11.808 - 2.486 = -14.294$ (per year), or $-14.294/365 = -0.03916$ per day.

When $S$ moves from 100 to 102 ($Delta S = 2$), over one day ($Delta t = 1/365$):

P&L on hedged position (short call + $Delta$ shares):

$"P&L" approx -Delta times Delta S - 1/2 Gamma (Delta S)^2 + "call theta" times Delta t + Delta times Delta S$

Wait — the hedged position P&L is: change in call value $approx Delta times 2 + 1/2 Gamma times 4 + Theta times (1/365)$ = $0.5629 times 2 + 0.5 times 0.02624 times 4 + (-0.03916)$ $= 1.126 + 0.0525 - 0.039 = 1.139$.

Short call loses $-1.139$, long $0.5629$ shares gains $0.5629 times 2 = 1.126$.

Net P&L $approx 1.126 - 1.139 = -£0.013$ (a small loss from the gamma effect exceeding the theta gain).

== Exercise 40

$q = (1.05 - 0.9) / (1.2 - 0.9) = 0.5$. Paths and average prices:

- $U U$: $S_1 = 120$, $S_2 = 144$. $macron(S) = (100 + 120 + 144)/3 = 121.33$. $C = 16.33$.
- $U D$: $S_1 = 120$, $S_2 = 108$. $macron(S) = (100 + 120 + 108)/3 = 109.33$. $C = 4.33$.
- $D U$: $S_1 = 90$, $S_2 = 108$. $macron(S) = (100 + 90 + 108)/3 = 99.33$. $C = 0$.
- $D D$: $S_1 = 90$, $S_2 = 81$. $macron(S) = (100 + 90 + 81)/3 = 90.33$. $C = 0$.

$pi_C = 1 / 1.05^2 (0.25 times 16.33 + 0.25 times 4.33 + 0.25 times 0 + 0.25 times 0) = 5.165 / 1.1025 approx £4.69$

== Exercise 41

$q = (1.05 - 0.9)/(1.2 - 0.9) = 0.5$. Enumerate all paths and track the running maximum:

- $U U$: $S_0 = 100$, $S_1 = 120$, $S_2 = 144$. $max = 144$. $C = max{144 - 105, 0} = 39$.
- $U D$: $S_0 = 100$, $S_1 = 120$, $S_2 = 108$. $max = 120$. $C = max{120 - 105, 0} = 15$.
- $D U$: $S_0 = 100$, $S_1 = 90$, $S_2 = 108$. $max = 108$. $C = max{108 - 105, 0} = 3$.
- $D D$: $S_0 = 100$, $S_1 = 90$, $S_2 = 81$. $max = 100$. $C = max{100 - 105, 0} = 0$.

$pi_C = 1/1.05^2 (0.25 times 39 + 0.25 times 15 + 0.25 times 3 + 0.25 times 0) = 14.25/1.1025 = £12.93$.

== Exercise 42

Barrier $B = 115$. The option knocks in if $S_t >= 115$ at any time.

- $U U$: $S_1 = 120 >= 115$. Knocked in. Payoff $= max{144 - 100, 0} = 44$.
- $U D$: $S_1 = 120 >= 115$. Knocked in. Payoff $= max{108 - 100, 0} = 8$.
- $D U$: $S_1 = 90 < 115$, $S_2 = 108 < 115$. Not knocked in. Payoff $= 0$.
- $D D$: $S_1 = 90 < 115$, $S_2 = 81 < 115$. Not knocked in. Payoff $= 0$.

$pi_"in" = 1/1.05^2 (0.25 times 44 + 0.25 times 8 + 0 + 0) = 13/1.1025 = £11.79$.

European call payoffs with $X = 100$: $C_(U U) = 44$, $C_(U D) = 8$, $C_(D U) = 8$, $C_(D D) = 0$.

$pi_"Eur" = 1/1.05^2 (0.25 times 44 + 0.25 times 8 + 0.25 times 8 + 0) = 15/1.1025 = £13.61$.

Up-and-out price: $pi_"out" = pi_"Eur" - pi_"in" = 13.61 - 11.79 = £1.82$. $checkmark$

This corresponds to the DU path being the only one where the knock-out survives: $1/1.05^2 times 0.25 times 8 = 2/1.1025 = £1.81$ (rounding).

== Exercise 43

The Asian call payoff is $(macron(S) - X)^+$ where $macron(S) = 1/(T+1) sum_(t=0)^T S_t$. The European call payoff is $(S_T - X)^+$.

Since $f(x) = (x - X)^+$ is convex and $macron(S)$ is a weighted average of the $S_t$ values, we have by Jensen's inequality:

$EE_QQ [(macron(S) - X)^+] <= EE_QQ [(S_T - X)^+]$ does not follow directly from Jensen. Instead, we use the fact that $macron(S)$ has lower variance than $S_T$ (averaging smooths out fluctuations), so the distribution of $macron(S)$ is more concentrated around its mean.

More precisely: under the risk-neutral measure, $EE_QQ [macron(S)] <= EE_QQ [S_T] times (T+1)^(-1) sum_(t=0)^T e^(-(T-t) r)$, which is generally less than $EE_QQ [S_T]$ when $r > 0$.

The key financial argument: the averaging reduces the effective volatility, and since option values increase with volatility (for European options), the Asian option must be cheaper. Formally, $"Var"(macron(S)) < "Var"(S_T)$, and for a convex payoff function, lower variance of the underlying leads to a lower expected payoff, hence a lower price.

== Exercise 44

$EE(X) = sum_(omega in Omega) X(omega) P({omega}) = 1/4 (50 + 100 + 100 + (-750)) = 1/4 (-500) = -125$

== Exercise 45

$cal(F) = {emptyset, {H H, H T}, {T H, T T}, Omega}$: *Yes*, it is a valid $sigma$-algebra. ${H H, H T}^c = {T H, T T} in cal(F)$, and all unions of elements are in $cal(F)$.

${emptyset, {H H, H T}, {H H, T H}, Omega}$: *No*. The complement ${H H, H T}^c = {T H, T T}$ is not in this collection. Also ${H H, H T} union {H H, T H} = {H H, H T, T H}$ is not in it, violating closure under union.

== Exercise 46

$EE(X) = X(a) P({a}) + X(b) P({b}) + X(c) P({c}) = 6 times 1/2 + (-3) times 1/3 + 12 times 1/6 = 3 - 1 + 2 = 4$.

$EE(X^2) = 36 times 1/2 + 9 times 1/3 + 144 times 1/6 = 18 + 3 + 24 = 45$.

$"Var"(X) = EE(X^2) - (EE(X))^2 = 45 - 16 = 29$.

== Exercise 47

$"Var"(X) = EE((X - EE(X))^2) = EE(X^2 - 2X dot EE(X) + (EE(X))^2) = EE(X^2) - 2(EE(X))^2 + (EE(X))^2 = EE(X^2) - (EE(X))^2$.

Since $(X - EE(X))^2 >= 0$ everywhere, $"Var"(X) = EE((X - EE(X))^2) >= 0$.

Equality holds iff $(X(omega) - EE(X))^2 = 0$ $P$-a.s., i.e. $X(omega) = EE(X)$ for $P$-almost every $omega$. This means $X$ is constant $P$-a.s. $square$

== Exercise 48

$EE(X | cal(G))$ is $cal(G)$-measurable, so it is constant on the atoms of $cal(G)$.

On ${omega_1, omega_2}$: $EE(X | cal(G)) = EE(X | {omega_1, omega_2}) = (X(omega_1) P({omega_1}) + X(omega_2) P({omega_2})) / P({omega_1, omega_2})$

$= (10 times 1/4 + 6 times 1/4) / (1/2) = (4) / (1/2) = 8$.

On ${omega_3, omega_4}$: $EE(X | cal(G)) = (4 times 1/4 + 8 times 1/4) / (1/2) = (3) / (1/2) = 6$.

So $EE(X | cal(G))(omega) = 8$ if $omega in {omega_1, omega_2}$ and $6$ if $omega in {omega_3, omega_4}$.

== Exercise 49

Risk-neutral measures: $q_1 in (1/6, 1/2)$, $q_2 = 3/2 - 3 q_1$, $q_3 = 2 q_1 - 1/2$.

$C(omega_1) = 25$, $C(omega_2) = 5$, $C(omega_3) = 0$.

$EE_Q(C) = 25 q_1 + 5(3/2 - 3 q_1) + 0 = 25 q_1 + 15/2 - 15 q_1 = 10 q_1 + 15/2$.

$pi_C = (10 q_1 + 15/2) / 1.05 = (20 q_1 + 15) / 2.1$.

As $q_1$ ranges over $(1/6, 1/2)$: $pi_C in (200/21, 250/21) approx (9.52, 11.90)$.

== Exercise 50

The FTAP says the market is arbitrage-free iff a risk-neutral measure $Q tilde P$ exists. In the binomial model, $tilde(p) = (1 + r - d) / (u - d)$. For $Q$ to be a valid equivalent probability we need $tilde(p) in (0, 1)$.

$tilde(p) > 0 <==> 1 + r > d$ and $tilde(p) < 1 <==> 1 + r < u$, so the condition is $d < 1 + r < u$.

If $1 + r >= u$: the riskless bond always beats or matches the stock even in the "up" state. Shorting the stock and investing in the bond is an arbitrage.

If $1 + r <= d$: the stock always beats or matches the bond even in the "down" state. Borrowing to buy the stock is an arbitrage.

== Exercise 51

Risk-neutral condition: $65 q_1 + 50 q_2 + 40 q_3 = 50 times 1.04 = 52$ with $q_1 + q_2 + q_3 = 1$.

From the constraint: $q_3 = 1 - q_1 - q_2$. Substituting: $65 q_1 + 50 q_2 + 40(1 - q_1 - q_2) = 52$.

$25 q_1 + 10 q_2 = 12$, so $q_2 = (12 - 25 q_1)/10$.

For positivity: $q_1 > 0$, $q_2 = (12 - 25 q_1)/10 > 0 => q_1 < 12/25$, $q_3 = 1 - q_1 - (12 - 25 q_1)/10 = (10 - 10 q_1 - 12 + 25 q_1)/10 = (15 q_1 - 2)/10 > 0 => q_1 > 2/15$.

So $q_1 in (2/15, 12/25)$.

European put with $X = 55$: $P(omega_1) = 0$, $P(omega_2) = 5$, $P(omega_3) = 15$.

$EE_Q(P) = 5 q_2 + 15 q_3 = 5(12 - 25 q_1)/10 + 15(15 q_1 - 2)/10 = (60 - 125 q_1 + 225 q_1 - 30)/10 = (30 + 100 q_1)/10$.

$pi_P = (30 + 100 q_1) / (10 times 1.04) = (30 + 100 q_1) / 10.4$.

At $q_1 = 2/15$: $pi_P = (30 + 200/15)/10.4 = (30 + 13.33)/10.4 = 43.33/10.4 = 4.17$.

At $q_1 = 12/25$: $pi_P = (30 + 48)/10.4 = 78/10.4 = 7.50$.

$Pi(P) = (4.17, 7.50)$.

== Exercise 52

Let $overline(xi)$ replicate $C$: $overline(xi) dot overline(S)(omega) = C(omega)$ for all $omega$. Then:

$EE_Q(C/(1+r)) = EE_Q(overline(xi) dot overline(S) / (1+r)) = sum_(i=0)^d xi_i EE_Q(S^i / (1+r))$

$= sum_(i=0)^d xi_i pi_i = overline(xi) dot overline(pi)$

where the second equality uses linearity of expectation and the third uses the risk-neutral pricing condition $pi_i = EE_Q(S^i / (1+r))$.

Since the replicating portfolio price $overline(xi) dot overline(pi)$ is uniquely determined (by the law of one price in an arbitrage-free market), the arbitrage-free price $EE_Q(C/(1+r))$ is the same for every risk-neutral measure $Q$. Hence the price is unique. $square$

== Exercise 53

Risk-neutral conditions: $12 q_1 + 11 q_2 + 9 q_3 = 10 times 1.05 = 10.5$ and $24 q_1 + 22 q_2 + 18 q_3 = 20 times 1.05 = 21$, with $q_1 + q_2 + q_3 = 1$.

From $q_3 = 1 - q_1 - q_2$:

Equation 1: $12 q_1 + 11 q_2 + 9(1 - q_1 - q_2) = 10.5 => 3 q_1 + 2 q_2 = 1.5$.

Equation 2: $24 q_1 + 22 q_2 + 18(1 - q_1 - q_2) = 21 => 6 q_1 + 4 q_2 = 3$.

Equation 2 is $2 times$ Equation 1, so the two pricing conditions are linearly dependent. This gives a one-parameter family of risk-neutral measures: $q_2 = (1.5 - 3 q_1)/2 = 0.75 - 1.5 q_1$, $q_3 = 1 - q_1 - 0.75 + 1.5 q_1 = 0.25 + 0.5 q_1$.

Positivity: $q_1 > 0$, $q_2 > 0 => q_1 < 1/2$, $q_3 > 0$ (always, since $q_1 > 0$). So $q_1 in (0, 1/2)$.

Since at least one risk-neutral measure exists (e.g. $q_1 = 1/4$, $q_2 = 3/8$, $q_3 = 3/8$), the market is *arbitrage-free*.

Since the risk-neutral measure is *not unique* (there is a one-parameter family), the market is *incomplete*. This is consistent with the rank condition: the payoff matrix

$X = mat(1.05, 12, 24; 1.05, 11, 22; 1.05, 9, 18)$

has $det(X) = 0$ since the third column is $2 times$ the second column. The matrix has rank 2 $< 3$ (the number of states), so the traded assets cannot span every contingent claim.
