#set page(margin: 30pt)
#set text(size: 11pt)

= Chapter 4 (§4.2 + §4.3) — Options and Trading Strategies

*Notation.* $S_0$ spot, $S_T$ price at maturity, $X$ strike, $T$ maturity, $r$ continuously-compounded risk-free rate, $I$ present value of dividends during $[0,T]$. $pi_C$, $pi_P$ are European call/put premia; $pi_(C_A)$, $pi_(P_A)$ American.

= §4.2 — Call and Put Options

== European options — no dividends

*4.2.1 Upper bound on a call.*
$ pi_C < S_0. $

*4.2.2 Upper bound on a put.*
$ pi_P <= X e^(-r T). $

*4.2.3 Lower bound on a call.*
$ pi_C >= max{S_0 - X e^(-r T), 0}. $
Proof: portfolio A (call + cash $X e^(-r T)$) pays $max{S_T, X} >= S_T$ = portfolio B (share) at $T$.

*4.2.4 Lower bound on a put.*
$ pi_P >= max{X e^(-r T) - S_0, 0}. $

*4.2.5 Put–call parity.*
$ pi_C - pi_P = S_0 - X e^(-r T), quad "equiv." quad pi_C + X e^(-r T) = pi_P + S_0. $
Portfolios "call + cash $X e^(-r T)$" and "put + share" both pay $max{S_T, X}$ at $T$.

== European options — with dividends (PV $I$)

*4.2.6* Replace $S_0 arrow.r S_0 - I$ everywhere:

$ pi_C >= max{S_0 - I - X e^(-r T), 0}, $
$ pi_P >= max{X e^(-r T) + I - S_0, 0}, $
$ pi_C - pi_P = S_0 - I - X e^(-r T), quad "i.e." quad pi_C + I + X e^(-r T) = pi_P + S_0. $

== American options

*4.2.7  $pi_(C_A) >= pi_C$*  — more rights is worth at least as much.

*4.2.8  $pi_(P_A) >= pi_P$*  — same reason.

*4.2.9  $pi_(P_A) >= X - S_0$*  — immediate-exercise value is a floor.

*4.2.10  $pi_(P_A) < X$*  — max payoff is $X$, cannot be worth more today.

*4.2.11  $pi_C = pi_(C_A)$ (no dividends).*  At $t < T$, $pi_(C_A, t) >= S_t - X e^(-r(T-t)) > S_t - X$, so selling beats exercising.

*4.2.12 American put–call parity.*
No dividends:
$ S_0 - X <= pi_(C_A) - pi_(P_A) <= S_0 - X e^(-r T). $
With dividends:
$ S_0 - I - X <= pi_(C_A) - pi_(P_A) <= S_0 - X e^(-r T). $

(Inequality, not equality: early-exercise feature breaks the replication.)

= §4.3 — Trading Strategies: Spreads and Combinations

== The six elementary positions

Short profit = $-$ (long profit) for the same $S_T$.

+ *Long stock:* $ "Profit" = S_T - S_0. $
+ *Short stock:* $ "Profit" = S_0 - S_T. $
+ *Long call:* $ "Profit" = cases(-pi_C\, & S_T <= X, S_T - X - pi_C\, & S_T >= X) $
+ *Short call:* $ "Profit" = cases(pi_C\, & S_T <= X, -S_T + X + pi_C\, & S_T >= X) $
+ *Long put:* $ "Profit" = cases(X - S_T - pi_P\, & S_T <= X, -pi_P\, & S_T >= X) $
+ *Short put:* $ "Profit" = cases(pi_P - (X - S_T)\, & S_T <= X, pi_P\, & S_T >= X) $

== Covered call

Long stock + short call. Downside not hedged, upside capped at $X$.

$ "Profit" = min{S_T, X} - S_0 + pi_C. $

By put-call parity $pi_C - S_0 = pi_P - X e^(-r T)$, the profit pattern matches a *short put* up to a constant.

== Protective put

Long stock + long put. Put floors the downside.

$ "Profit" = cases(X - S_0 - pi_P\, & S_T <= X, S_T - S_0 - pi_P\, & S_T >= X) $

== Spreads (two options of the same type)

*Bull call spread:* long call $X_1$, short call $X_2 > X_1$. Net premium $pi_(C_1) - pi_(C_2) > 0$.

$ "Profit" = cases(
  -(pi_(C_1) - pi_(C_2))\, & S_T <= X_1,
  S_T - X_1 - (pi_(C_1) - pi_(C_2))\, & X_1 <= S_T <= X_2,
  (X_2 - X_1) - (pi_(C_1) - pi_(C_2))\, & S_T >= X_2
) $

*Bull put spread:* same shape built from puts (long $X_1$, short $X_2 > X_1$), but nets a credit since $pi_(P_1) < pi_(P_2)$.

*Bear spread:* mirror of bull — short call $X_1$, long call $X_2 > X_1$. Profits if the stock falls.

== Combinations (calls + puts together)

*Straddle:* long call + long put at the same strike $X$ and maturity $T$.

$ "Profit" = |S_T - X| - (pi_C + pi_P). $

Pure volatility bet: profits from large moves in either direction.

= Master cheat sheet

#table(
  columns: (auto, 1fr),
  stroke: 0.4pt,
  align: (left, left),
  [*Euro, no div.*], [$max{S_0 - X e^(-r T), 0} <= pi_C < S_0$ \  $max{X e^(-r T) - S_0, 0} <= pi_P <= X e^(-r T)$ \  $pi_C - pi_P = S_0 - X e^(-r T)$],
  [*Euro, div. $I$*], [swap $S_0 arrow.r S_0 - I$: \  $pi_C - pi_P = S_0 - I - X e^(-r T)$],
  [*American*], [$pi_(C_A) >= pi_C$, $pi_(P_A) >= pi_P$, $X - S_0 <= pi_(P_A) < X$ \  $pi_C = pi_(C_A)$ (no div.) \  $S_0 - X <= pi_(C_A) - pi_(P_A) <= S_0 - X e^(-r T)$ (no div.) \  $S_0 - I - X <= pi_(C_A) - pi_(P_A) <= S_0 - X e^(-r T)$ (div.)],
  [*Covered call*], [$min{S_T, X} - S_0 + pi_C$ — mimics short put],
  [*Protective put*], [floor at $X - S_0 - pi_P$; keep upside],
  [*Bull call spread*], [long $X_1$, short $X_2 > X_1$; max gain $(X_2 - X_1)$ minus net premium],
  [*Bear spread*], [long $X_2$, short $X_1 < X_2$; mirror of bull],
  [*Straddle*], [$|S_T - X| - (pi_C + pi_P)$ — volatility bet],
)

== Unifying principle

The equality/inequality bounds in §4.2 all come from *no arbitrage between two replicating portfolios*. Every composite strategy in §4.3 is either (a) a manifestation of those same replications or (b) a direct rearrangement of put-call parity. If two strategies share a profit shape, parity is the reason.
