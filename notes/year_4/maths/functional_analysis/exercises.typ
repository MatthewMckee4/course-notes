#set document(title: "Functional Analysis Exercises")
#set page(margin: 20pt)
#set text(size: 10pt)

= Exercise Sheet 5: Hilbert Spaces

== Question 2(a)

Let $cal(H) = (H, chevron.l dot.c, dot.c chevron.r)$ be an inner-product space, let $cal(Y)$ be a vector subspace of $cal(H)$, and let $x, y in H$. Prove that

$ x perp y quad <==> quad ||x + alpha y|| >= ||x|| quad forall alpha in RR. $

*Proof.* $(==>)$ Assume $x perp y$, i.e. $chevron.l x, y chevron.r = 0$. Then for any $alpha in RR$:

$ ||x + alpha y||^2 = chevron.l x + alpha y, x + alpha y chevron.r = ||x||^2 + 2 alpha chevron.l x, y chevron.r + alpha^2 ||y||^2 = ||x||^2 + alpha^2 ||y||^2 >= ||x||^2. $

Taking square roots gives $||x + alpha y|| >= ||x||$.

$(arrow.l.double)$ Assume $||x + alpha y|| >= ||x||$ for all $alpha in RR$. Squaring:

$ ||x||^2 + 2 alpha chevron.l x, y chevron.r + alpha^2 ||y||^2 >= ||x||^2 $

so $2 alpha chevron.l x, y chevron.r + alpha^2 ||y||^2 >= 0$ for all $alpha in RR$.

If $y = 0$ then $chevron.l x, y chevron.r = 0$ and we are done. Otherwise, set $alpha = -t chevron.l x, y chevron.r$ for $t > 0$:

$ -2 t chevron.l x, y chevron.r^2 + t^2 chevron.l x, y chevron.r^2 ||y||^2 >= 0. $

Suppose for contradiction that $chevron.l x, y chevron.r != 0$. Then $chevron.l x, y chevron.r^2 > 0$, so dividing by $t chevron.l x, y chevron.r^2$:

$ -2 + t ||y||^2 >= 0. $

But choosing $t < 2 / (||y||^2)$ gives a contradiction. Hence $chevron.l x, y chevron.r = 0$. $square$

== Question 4

Let $cal(X) = (X, chevron.l dot.c, dot.c chevron.r)$ be an inner-product space, and let $cal(Y) < cal(X)$. Prove that

$ (overline(Y))^perp = Y^perp. $

*Proof.* $(supset.eq)$ Let $v in Y^perp$, so $chevron.l v, y chevron.r = 0$ for all $y in Y$. Let $z in overline(Y)$. Then there exists a sequence $(y_n)$ in $Y$ with $y_n -> z$. By continuity of the inner product:

$ chevron.l v, z chevron.r = chevron.l v, lim_(n -> infinity) y_n chevron.r = lim_(n -> infinity) chevron.l v, y_n chevron.r = lim_(n -> infinity) 0 = 0. $

So $v perp z$ for all $z in overline(Y)$, hence $v in (overline(Y))^perp$.

$(subset.eq)$ Let $v in (overline(Y))^perp$, so $chevron.l v, z chevron.r = 0$ for all $z in overline(Y)$. Since $Y subset.eq overline(Y)$, we have $chevron.l v, y chevron.r = 0$ for all $y in Y$, hence $v in Y^perp$. $square$
