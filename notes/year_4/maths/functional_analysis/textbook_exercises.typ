#set document(title: "Functional Analysis — Textbook Exercises (Kreyszig)")
#set page(margin: 20pt)
#set text(size: 10pt)

#align(center)[#text(size: 14pt, weight: "bold")[Kreyszig — Textbook Exercises]\
#text(size: 9pt)[Problems from sections covered by the 2026 lecture schedule]]

#outline(title: none)
#pagebreak()

= Sec 1.4 — Convergence, Cauchy Sequence, Completeness

+ *(Subsequence)* If a sequence $(x_n)$ in a metric space $X$ is convergent and has limit $x$, show that every subsequence $(x_(n_k))$ of $(x_n)$ is convergent and has the same limit $x$.

+ If $(x_n)$ is Cauchy and has a convergent subsequence, say, $x_(n_k) -> x$, show that $(x_n)$ is convergent with the limit $x$.

+ Show that $x_n -> x$ if and only if for every neighborhood $V$ of $x$ there is an integer $n_0$ such that $x_n in V$ for all $n > n_0$.

+ *(Boundedness)* Show that a Cauchy sequence is bounded.

+ Is boundedness of a sequence in a metric space sufficient for the sequence to be Cauchy? Convergent?

+ If $(x_n)$ and $(y_n)$ are Cauchy sequences in a metric space $(X, d)$, show that $(a_n)$, where $a_n = d(x_n, y_n)$, converges. Give illustrative examples.

+ Give an indirect proof of Lemma 1.4-2(b).

+ If $d_1$ and $d_2$ are metrics on the same set $X$ and there are positive numbers $a$ and $b$ such that for all $x, y in X$, $a d_1(x,y) <= d_2(x,y) <= b d_1(x,y)$, show that the Cauchy sequences in $(X, d_1)$ and $(X, d_2)$ are the same.

+ Using Prob. 8, show that the metric spaces in Probs. 13 to 15, Sec. 1.2, have the same Cauchy sequences.

+ Using the completeness of $RR$, prove completeness of $CC$.

= Sec 1.5 — Examples. Completeness Proofs

+ Let $a, b in RR$ and $a < b$. Show that the open interval $(a, b)$ is an incomplete subspace of $RR$, whereas the closed interval $[a, b]$ is complete.

+ Let $X$ be the space of all ordered $n$-tuples $x = (xi_1, dots, xi_n)$ of real numbers and $d(x, y) = max_j |xi_j - eta_j|$ where $y = (eta_j)$. Show that $(X, d)$ is complete.

+ Let $M subset l^infinity$ be the subspace consisting of all sequences $x = (xi_j)$ with at most finitely many nonzero terms. Find a Cauchy sequence in $M$ which does not converge in $M$, so that $M$ is not complete.

+ Show that $M$ in Prob. 3 is not complete by applying Theorem 1.4-7.

+ Show that the set $X$ of all integers with metric $d$ defined by $d(m, n) = |m - n|$ is a complete metric space.

+ Show that the set of all real numbers constitutes an incomplete metric space if we choose $d(x, y) = |arctan x - arctan y|$.

+ Let $X$ be the set of all positive integers and $d(m, n) = |m^(-1) - n^(-1)|$. Show that $(X, d)$ is not complete.

+ *(Space $C[a, b]$)* Show that the subspace $Y subset C[a, b]$ consisting of all $x in C[a, b]$ such that $x(a) = x(b)$ is complete.

+ In 1.5-5 we referred to the following theorem of calculus. If a sequence $(x_m)$ of continuous functions on $[a, b]$ converges on $[a, b]$ and the convergence is uniform on $[a, b]$, then the limit function $x$ is continuous on $[a, b]$. Prove this theorem.

+ *(Discrete metric)* Show that a discrete metric space is complete.

+ *(Space $s$)* Show that in the space $s$ we have $x_n -> x$ if and only if $xi_j^((n)) -> xi_j$ for all $j = 1, 2, dots$, where $x_n = (xi_j^((n)))$ and $x = (xi_j)$.

+ Using Prob. 11, show that the sequence space $s$ in 1.2-1 is complete.

+ Show that in 1.5-9, another Cauchy sequence is $(x_n)$, where $x_n(t) = n$ if $0 <= t <= n^(-2)$, $x_n(t) = t^(-1\/2)$ if $n^(-2) <= t <= 1$.

+ Show that the Cauchy sequence in Prob. 13 does not converge.

+ Let $X$ be the metric space of all real sequences $x = (xi_j)$ each of which has only finitely many nonzero terms, and $d(x, y) = sum |xi_j - eta_j|$. Show that $(x_n)$ with $x_n = (xi_j^((n)))$ where $xi_j^((n)) = j^(-2)$ for $j = 1, dots, n$ and $xi_j^((n)) = 0$ for $j > n$, is Cauchy but does not converge.

= Sec 2.1 — Vector Space

+ Show that the set of all real numbers, with the usual addition and multiplication, constitutes a one-dimensional real vector space, and the set of all complex numbers a one-dimensional complex vector space.

+ Prove $0 x = theta$, $alpha theta = theta$, $(-1) x = -x$.

+ Describe the span of $M = {(1, 1, 1), (0, 0, 2)}$ in $RR^3$.

+ Which of the following subsets of $RR^3$ constitute a subspace of $RR^3$? *(a)* All $x$ with $xi_1 = xi_2$ and $xi_3 = 0$. *(b)* All $x$ with $xi_1 = xi_2 + 1$. *(c)* All $x$ with positive $xi_1, xi_2, xi_3$. *(d)* All $x$ with $xi_1 - xi_2 + xi_3 = k = "const"$.

+ Show that ${x_1, dots, x_n}$, where $x_j(t) = t^j$, is a linearly independent set in $C[a, b]$.

+ Show that in an $n$-dimensional vector space $X$, the representation of any $x$ as a linear combination of given basis vectors $e_1, dots, e_n$ is unique.

+ Let ${e_1, dots, e_n}$ be a basis for a complex vector space $X$. Find a basis for $X$ regarded as a real vector space. What is the dimension of $X$ in either case?

+ If $M$ is a linearly dependent set in a complex vector space $X$, is $M$ linearly dependent in $X$, regarded as a real vector space?

+ On a fixed interval $[a, b] subset RR$, consider the set $X$ consisting of all polynomials with real coefficients and of degree not exceeding a given $n$, and the polynomial $x = 0$. Show that $X$, with the usual addition and the usual multiplication by real numbers, is a real vector space of dimension $n + 1$. Find a basis for $X$.

+ If $Y$ and $Z$ are subspaces of a vector space $X$, show that $Y inter Z$ is a subspace of $X$, but $Y union Z$ need not be one. Give examples.

+ If $M != emptyset$ is any subset of a vector space $X$, show that $"span" M$ is a subspace of $X$.

+ Show that the set of all real two-rowed square matrices forms a vector space $X$. What is the zero vector in $X$? Determine $dim X$. Find a basis. Do the symmetric matrices $x in X$ form a subspace? The singular matrices?

+ *(Product)* Show that the Cartesian product $X = X_1 times X_2$ of two vector spaces over the same field becomes a vector space if we define $(x_1, x_2) + (y_1, y_2) = (x_1 + y_1, x_2 + y_2)$, $alpha(x_1, x_2) = (alpha x_1, alpha x_2)$.

+ *(Quotient space, codimension)* Let $Y$ be a subspace of a vector space $X$. The coset of $x in X$ w.r.t. $Y$ is $x + Y = {v | v = x + y, y in Y}$. Show that distinct cosets form a partition of $X$, and under $(w + Y) + (x + Y) = (w + x) + Y$, $alpha(x + Y) = alpha x + Y$, these cosets form a vector space $X\/Y$ (the _quotient space_), with $"codim" Y = dim(X\/Y)$.

+ Let $X = RR^3$ and $Y = {(xi_1, 0, 0) | xi_1 in RR}$. Find $X\/Y$, $X\/X$, $X\/{0}$.

= Sec 2.2 — Normed Spaces, Banach Spaces

+ Show that the norm $||x||$ of $x$ is the distance from $x$ to $0$.

+ Verify that the usual length of a vector in the plane or in three dimensional space has the properties (N1) to (N4) of a norm.

+ Prove $|||y|| - ||x||| <= ||y - x||$.

+ Show that we may replace (N2) by $||x|| = 0 ==> x = 0$ without altering the concept of a norm. Show that nonnegativity of a norm follows from (N3) and (N4).

+ Show that $||x|| = (sum_(j=1)^n |xi_j|^2)^(1\/2)$ defines a norm.

+ Let $X$ be the vector space of all ordered pairs $x = (xi_1, xi_2)$, $y = (eta_1, eta_2), dots$ of real numbers. Show that norms on $X$ are defined by $||x||_1 = |xi_1| + |xi_2|$, $||x||_2 = (xi_1^2 + xi_2^2)^(1\/2)$, $||x||_infinity = max{|xi_1|, |xi_2|}$.

+ Verify that $||x|| = (sum |xi_j|^p)^(1\/p)$ satisfies (N1) to (N4).

+ There are several norms of practical importance on the vector space of ordered $n$-tuples of numbers, notably $||x||_1 = sum |xi_j|$, $||x||_p = (sum |xi_j|^p)^(1\/p)$ ($1 < p < +infinity$), $||x||_infinity = max |xi_j|$. In each case, verify (N1) to (N4).

+ Verify that $||x|| = max_(t in [a,b]) |x(t)|$ defines a norm.

+ *(Unit sphere)* The sphere $S(0; 1) = {x in X | ||x|| = 1}$ in a normed space $X$ is called the _unit sphere_. Show that for the norms in Prob. 6 and for $||x||_4 = (xi_1^4 + xi_2^4)^(1\/4)$ the unit spheres look as shown in Fig. 16.

+ *(Convex set, segment)* A subset $A$ of a vector space $X$ is _convex_ if $x, y in A$ implies $M = {z in X | z = alpha x + (1 - alpha) y, 0 <= alpha <= 1} subset A$. Show that the closed unit ball $tilde(B)(0; 1) = {x in X | ||x|| <= 1}$ in a normed space $X$ is convex.

+ Using Prob. 11, show that $phi(x) = (sqrt(|xi_1|) + sqrt(|xi_2|))^2$ does not define a norm on the vector space of all ordered pairs $x = (xi_1, xi_2)$ of real numbers. Sketch the curve $phi(x) = 1$.

+ Show that the discrete metric on a vector space $X != {0}$ cannot be obtained from a norm.

+ If $d$ is a metric on a vector space $X != {0}$ which is obtained from a norm, and $tilde(d)$ is defined by $tilde(d)(x, x) = 0$, $tilde(d)(x, y) = d(x, y) + 1$ ($x != y$), show that $tilde(d)$ cannot be obtained from a norm.

+ *(Bounded set)* Show that a subset $M$ in a normed space $X$ is bounded if and only if there is a positive number $c$ such that $||x|| <= c$ for every $x in M$.

= Sec 2.3 — Further Properties of Normed Spaces

+ Show that $c subset l^infinity$ is a vector subspace of $l^infinity$ (cf. 1.5-3) and so is $c_0$, the space of all sequences of scalars converging to zero.

+ Show that $c_0$ in Prob. 1 is a closed subspace of $l^infinity$, so that $c_0$ is complete by 1.5-2 and 1.4-7.

+ In $l^infinity$, let $Y$ be the subset of all sequences with only finitely many nonzero terms. Show that $Y$ is a subspace of $l^infinity$ but not a closed subspace.

+ *(Continuity of vector space operations)* Show that in a normed space $X$, vector addition and multiplication by scalars are continuous; that is, $(x, y) |-> x + y$ and $(alpha, x) |-> alpha x$ are continuous.

+ Show that $x_n -> x$ and $y_n -> y$ implies $x_n + y_n -> x + y$. Show that $alpha_n -> alpha$ and $x_n -> x$ implies $alpha_n x_n -> alpha x$.

+ Show that the closure $overline(Y)$ of a subspace $Y$ of a normed space $X$ is again a vector subspace.

+ *(Absolute convergence)* Show that convergence of $||y_1|| + ||y_2|| + dots.c$ may not imply convergence of $y_1 + y_2 + dots.c$. _Hint._ Consider $Y$ in Prob. 3 and $(y_n)$, where $y_n = (eta_j^((n)))$, $eta_n^((n)) = 1\/n^2$, $eta_j^((n)) = 0$ for all $j != n$.

+ If in a normed space $X$, absolute convergence of any series always implies convergence of that series, show that $X$ is complete.

+ Show that in a Banach space, an absolutely convergent series is convergent.

+ *(Schauder basis)* Show that if a normed space has a Schauder basis, it is separable.

+ Show that $(e_n)$, where $e_n = (delta_(n j))$, is a Schauder basis for $l^p$, where $1 <= p < +infinity$.

+ *(Seminorm)* A _seminorm_ on a vector space $X$ is a mapping $p: X -> RR$ satisfying (N1), (N3), (N4) in Sec. 2.2. Show that $p(0) = 0$, $|p(y) - p(x)| <= p(y - x)$.

+ Show that in Prob. 12, the elements $x in X$ such that $p(x) = 0$ form a subspace $N$ of $X$ and a norm on $X\/N$ is defined by $||hat(x)||_0 = p(x)$, where $x in hat(x)$ and $hat(x) in X\/N$.

+ *(Quotient space)* Let $Y$ be a closed subspace of a normed space $(X, ||dot||)$. Show that a norm $||dot||_0$ on $X\/Y$ is defined by $||hat(x)||_0 = inf_(x in hat(x)) ||x||$.

+ *(Product of normed spaces)* If $(X_1, ||dot||_1)$ and $(X_2, ||dot||_2)$ are normed spaces, show that the product vector space $X = X_1 times X_2$ becomes a normed space if we define $||x|| = max(||x_1||_1, ||x_2||_2)$.

= Sec 2.6 — Linear Operators

+ Show that the operators in 2.6-2, 2.6-3 and 2.6-4 are linear.

+ Show that the operators $T_1, dots, T_4$ from $RR^2$ into $RR^2$ defined by $(xi_1, xi_2) |-> (xi_1, 0)$; $|-> (0, xi_2)$; $|-> (xi_2, xi_1)$; $|-> (gamma xi_1, gamma xi_2)$ respectively, are linear, and interpret these operators geometrically.

+ What are the domain, range and null space of $T_1, T_2, T_3$ in Prob. 2?

+ What is the null space of $T_4$ in Prob. 2? Of $T_1$ and $T_2$ in 2.6-7? Of $T$ in 2.6-4?

+ Let $T: X -> Y$ be a linear operator. Show that the image of a subspace $V$ of $X$ is a vector space, and so is the inverse image of a subspace $W$ of $Y$.

+ If the product (the composite) of two linear operators exists, show that it is linear.

+ *(Commutativity)* Let $X$ be any vector space and $S, T: X -> X$ any operators. $S$ and $T$ are said to _commute_ if $S T = T S$. Do $T_1$ and $T_3$ in Prob. 2 commute?

+ Write the operators in Prob. 2 using $2 times 2$ matrices.

+ In 2.6-8, write $y = A x$ in terms of components, show that $T$ is linear and give examples.

+ Formulate the condition in 2.6-10(a) in terms of the null space of $T$.

+ Let $X$ be the vector space of all complex $2 times 2$ matrices and define $T: X -> X$ by $T x = b x$, where $b in X$ is fixed. Show that $T$ is linear. Under what condition does $T^(-1)$ exist?

+ Does the inverse of $T$ in 2.6-4 exist?

+ Let $T: cal(D)(T) -> Y$ be a linear operator whose inverse exists. If ${x_1, dots, x_n}$ is a linearly independent set in $cal(D)(T)$, show that ${T x_1, dots, T x_n}$ is linearly independent.

+ Let $T: X -> Y$ be a linear operator and $dim X = dim Y = n < infinity$. Show that $cal(R)(T) = Y$ if and only if $T^(-1)$ exists.

+ Consider the vector space $X$ of all real-valued functions defined on $RR$ with derivatives of all orders. Define $T: X -> X$ by $y(t) = T x(t) = x'(t)$. Show that $cal(R)(T)$ is all of $X$ but $T^(-1)$ does not exist. Compare with Prob. 14 and comment.

= Sec 2.7 — Bounded and Continuous Linear Operators

+ Prove $||T_1 T_2|| <= ||T_1|| ||T_2||$, $||T^n|| <= ||T||^n$.

+ Let $X$ and $Y$ be normed spaces. Show that a linear operator $T: X -> Y$ is bounded if and only if $T$ maps bounded sets in $X$ into bounded sets in $Y$.

+ If $T != 0$ is a bounded linear operator, show that for any $x in cal(D)(T)$ such that $||x|| < 1$ we have the strict inequality $||T x|| < ||T||$.

+ Give a direct proof of 2.7-9(b), without using 2.7-9(a).

+ Show that the operator $T: l^infinity -> l^infinity$ defined by $y = (eta_j) = T x$, $eta_j = xi_j\/j$, $x = (xi_j)$, is linear and bounded.

+ *(Range)* Show that the range $cal(R)(T)$ of a bounded linear operator $T: X -> Y$ need not be closed in $Y$. _Hint._ Use $T$ in Prob. 5.

+ *(Inverse operator)* Let $T$ be a bounded linear operator from a normed space $X$ onto a normed space $Y$. If there is a positive $b$ such that $||T x|| >= b ||x||$ for all $x in X$, show that then $T^(-1): Y -> X$ exists and is bounded.

+ Show that the inverse $T^(-1): cal(R)(T) -> X$ of a bounded linear operator $T: X -> Y$ need not be bounded. _Hint._ Use $T$ in Prob. 5.

+ Let $T: C[0, 1] -> C[0, 1]$ be defined by $y(t) = integral_0^t x(tau) dif tau$. Find $cal(R)(T)$ and $T^(-1): cal(R)(T) -> C[0, 1]$. Is $T^(-1)$ linear and bounded?

+ On $C[0, 1]$ define $S$ and $T$ by $y(s) = s integral_0^1 x(t) dif t$, $y(s) = s x(s)$, respectively. Do $S$ and $T$ commute? Find $||S||$, $||T||$, $||S T||$ and $||T S||$.

+ Let $X$ be the normed space of all bounded real-valued functions on $RR$ with $||x|| = sup_(t in RR) |x(t)|$, and let $T: X -> X$ be defined by $y(t) = T x(t) = x(t - Delta)$, where $Delta > 0$ is a constant. Is $T$ linear? Bounded?

+ *(Matrices)* From 2.7-7 we know that an $r times n$ matrix $A = (alpha_(j k))$ defines a linear operator from the vector space $X$ of all ordered $n$-tuples of numbers into the vector space $Y$ of all ordered $r$-tuples of numbers. Suppose any norm $||dot||_1$ is given on $X$ and any norm $||dot||_2$ on $Y$. A norm $||dot||$ on $Z$ is _compatible_ with $||dot||_1$ and $||dot||_2$ if $||A x||_2 <= ||A|| ||x||_1$. Show that $||A|| = sup_(x != 0) ||A x||_2 \/ ||x||_1$ is compatible. If $||x||_1 = max_j |xi_j|$ and $||y||_2 = max_i |eta_i|$, show that the natural norm is $||A|| = max_j sum_(k=1)^n |alpha_(j k)|$.

+ Show that in 2.7-7 with $r = n$, a compatible norm is $||A|| = (sum_(j,k) |alpha_(j k)|^2)^(1\/2)$, but for $n > 1$ this is _not_ the natural norm defined by the Euclidean norm on $RR^n$.

+ If in Prob. 12 we choose $||x||_1 = sum_(k=1)^n |xi_k|$, $||y||_2 = sum_(j=1)^r |eta_j|$, show that a compatible norm is $||A|| = max_k sum_(j=1)^r |alpha_(j k)|$.

+ Show that for $r = n$, the norm in Prob. 14 is the natural norm corresponding to $||dot||_1$ and $||dot||_2$ as defined in that problem.

= Sec 2.8 — Linear Functionals

+ Show that the functionals in 2.8-7 and 2.8-8 are linear.

+ Show that the functionals defined on $C[a, b]$ by $f_1(x) = integral_a^b x(t) y_0(t) dif t$ ($y_0 in C[a, b]$), $f_2(x) = alpha x(a) + beta x(b)$ ($alpha, beta$ fixed), are linear and bounded.

+ Find the norm of the linear functional $f$ defined on $C[-1, 1]$ by $f(x) = integral_(-1)^0 x(t) dif t - integral_0^1 x(t) dif t$.

+ Show that $f_1(x) = max_(t in J) x(t)$, $f_2(x) = min_(t in J) x(t)$ ($J = [a, b]$) define functionals on $C[a, b]$. Are they linear? Bounded?

+ Show that on any sequence space $X$ we can define a linear functional $f$ by setting $f(x) = xi_n$ ($n$ fixed), where $x = (xi_j)$. Is $f$ bounded if $X = l^infinity$?

+ *(Space $C'[a, b]$)* The space $C^1[a, b]$ or $C'[a, b]$ is the normed space of all continuously differentiable functions on $J = [a, b]$ with norm $||x|| = max_(t in J) |x(t)| + max_(t in J) |x'(t)|$. Show that the axioms of a norm are satisfied. Show that $f(x) = x'(c)$, $c = (a + b)\/2$, defines a bounded linear functional on $C'[a, b]$. Show that $f$ is not bounded, considered as a functional on the subspace of $C[a, b]$ which consists of all continuously differentiable functions.

+ If $f$ is a bounded linear functional on a complex normed space, is $overline(f)$ bounded? Linear? (The bar denotes the complex conjugate.)

+ *(Null space)* The _null space_ $N(M^*)$ of a set $M^* subset X^*$ is defined to be the set of all $x in X$ such that $f(x) = 0$ for all $f in M^*$. Show that $N(M^*)$ is a vector space.

+ Let $f != 0$ be any linear functional on a vector space $X$ and $x_0$ any fixed element of $X - cal(N)(f)$, where $cal(N)(f)$ is the null space of $f$. Show that any $x in X$ has a unique representation $x = alpha x_0 + y$, where $y in cal(N)(f)$.

+ Show that in Prob. 9, two elements $x_1, x_2 in X$ belong to the same element of the quotient space $X\/cal(N)(f)$ if and only if $f(x_1) = f(x_2)$; show that $"codim" cal(N)(f) = 1$.

+ Show that two linear functionals $f_1 != 0$ and $f_2 != 0$ which are defined on the same vector space and have the same null space are proportional.

+ *(Hyperplane)* If $Y$ is a subspace of a vector space $X$ and $"codim" Y = 1$, then every element of $X\/Y$ is called a _hyperplane parallel to_ $Y$. Show that for any linear functional $f != 0$ on $X$, the set $H_1 = {x in X | f(x) = 1}$ is a hyperplane parallel to the null space $cal(N)(f)$ of $f$.

+ If $Y$ is a subspace of a vector space $X$ and $f$ is a linear functional on $X$ such that $f(Y)$ is not the whole scalar field of $X$, show that $f(y) = 0$ for all $y in Y$.

+ Show that the norm $||f||$ of a bounded linear functional $f != 0$ on a normed space $X$ can be interpreted geometrically as the reciprocal of the distance $tilde(d) = inf{||x|| | f(x) = 1}$ of the hyperplane $H_1 = {x in X | f(x) = 1}$ from the origin.

+ *(Half space)* Let $f != 0$ be a bounded linear functional on a real normed space $X$. Then for any scalar $c$ we have a hyperplane $H_c = {x in X | f(x) = c}$, and $H_c$ determines the two _half spaces_ $X_(c 1) = {x | f(x) <= c}$ and $X_(c 2) = {x | f(x) >= c}$. Show that the closed unit ball lies in $X_(c 1)$ where $c = ||f||$, but for no $epsilon > 0$, the half space $X_(c 1)$ with $c = ||f|| - epsilon$ contains that ball.

= Sec 2.10 — Normed Spaces of Operators. Dual Space

+ What is the zero element of the vector space $B(X, Y)$? The inverse of a $T in B(X, Y)$ in the sense of Def. 2.1-1?

+ The operators and functionals considered in the text are defined on the entire space $X$. Show that without that assumption, in the case of functionals we still have the following theorem. If $f$ and $g$ are bounded linear functionals with domains in a normed space $X$, then for any nonzero scalars $alpha$ and $beta$ the linear combination $h = alpha f + beta g$ is a bounded linear functional with domain $cal(D)(h) = cal(D)(f) inter cal(D)(g)$.

+ Extend the theorem in Prob. 2 to bounded linear operators $T_1$ and $T_2$.

+ Let $X$ and $Y$ be normed spaces and $T_n: X -> Y$ ($n = 1, 2, dots$) bounded linear operators. Show that convergence $T_n -> T$ implies that for every $epsilon > 0$ there is an $N$ such that for all $n > N$ and all $x$ in any given closed ball we have $||T_n x - T x|| < epsilon$.

+ Show that 2.8-5 is in agreement with 2.10-5.

+ If $X$ is the space of ordered $n$-tuples of real numbers and $||x|| = max_j |xi_j|$, what is the corresponding norm on the dual space $X'$?

+ What conclusion can we draw from 2.10-6 with respect to the space $X$ of all ordered $n$-tuples of real numbers?

+ Show that the dual space of the space $c_0$ is $l^1$.

+ Show that a linear functional $f$ on a vector space $X$ is uniquely determined by its values on a Hamel basis for $X$.

+ Let $X$ and $Y != {0}$ be normed spaces, where $dim X = infinity$. Show that there is at least one unbounded linear operator $T: X -> Y$. (Use a Hamel basis.)

+ If $X$ is a normed space and $dim X = infinity$, show that the dual space $X'$ is not identical with the algebraic dual space $X^*$.

+ *(Completeness)* The examples in the text can be used to prove completeness of certain spaces. How? For what spaces?

+ *(Annihilator)* Let $M != emptyset$ be any subset of a normed space $X$. The _annihilator_ $M^a$ of $M$ is the set of all bounded linear functionals on $X$ which are zero everywhere on $M$. Thus $M^a subset X'$. Show that $M^a$ is a vector subspace of $X'$ and is closed. What are $X^a$ and ${0}^a$?

+ If $M$ is an $m$-dimensional subspace of an $n$-dimensional normed space $X$, show that $M^a$ is an $(n - m)$-dimensional subspace of $X'$. Formulate this as a theorem about solutions of a system of linear equations.

+ Let $M = {(1, 0, -1), (1, -1, 0), (0, 1, -1)} subset RR^3$. Find a basis for $M^a$.

= Sec 3.1 — Inner Product Space. Hilbert Space

+ Prove the parallelogram equality $||x + y||^2 + ||x - y||^2 = 2(||x||^2 + ||y||^2)$.

+ *(Pythagorean theorem)* If $x perp y$ in an inner product space $X$, show that $||x + y||^2 = ||x||^2 + ||y||^2$. Extend the formula to $m$ mutually orthogonal vectors.

+ If $X$ in Prob. 2 is real, show that, conversely, the given relation implies that $x perp y$. Show that this may not hold if $X$ is complex.

+ If an inner product space $X$ is real, show that $||x|| = ||y||$ implies $chevron.l x + y, x - y chevron.r = 0$. What does this mean geometrically if $X = RR^2$? What does the condition imply if $X$ is complex?

+ *(Apollonius' identity)* Verify by direct calculation that $||z - x||^2 + ||z - y||^2 = 1\/2 ||x - y||^2 + 2||z - 1\/2(x + y)||^2$. Show that this identity can also be obtained from the parallelogram equality.

+ Let $x != 0$ and $y != 0$. *(a)* If $x perp y$, show that ${x, y}$ is linearly independent. *(b)* Extend the result to mutually orthogonal nonzero vectors $x_1, dots, x_m$.

+ If in an inner product space, $chevron.l x, u chevron.r = chevron.l x, v chevron.r$ for all $x$, show that $u = v$.

+ Prove the polarization identity (real case).

+ Prove the polarization identity (complex case).

+ Let $z_1$ and $z_2$ denote complex numbers. Show that $chevron.l z_1, z_2 chevron.r = z_1 overline(z)_2$ defines an inner product, which yields the usual metric on the complex plane. Under what condition do we have orthogonality?

+ Let $X$ be the vector space of all ordered pairs of complex numbers. Can we obtain the norm defined on $X$ by $||x|| = |xi_1| + |xi_2|$ ($x = (xi_1, xi_2)$) from an inner product?

+ What is $||x||$ in 3.1-6 if $x = (xi_1, xi_2, dots)$, where *(a)* $xi_n = 2^(-n\/2)$, *(b)* $xi_n = 1\/n$?

+ Verify that for continuous functions the inner product in 3.1-5 satisfies (IP1) to (IP4).

+ Show that the norm on $C[a, b]$ is invariant under a linear transformation $t = alpha tau + beta$. Use this to prove the statement in 3.1-8 by mapping $[a, b]$ onto $[0, 1]$ and then considering $tilde(x)(tau) = 1$, $tilde(y)(tau) = tau$, $tau in [0, 1]$.

+ If $X$ is a finite dimensional vector space and $(e_j)$ is a basis for $X$, show that an inner product on $X$ is completely determined by its values $gamma_(j k) = chevron.l e_j, e_k chevron.r$. Can we choose such scalars $gamma_(j k)$ in a completely arbitrary fashion?

= Sec 3.2 — Further Properties of Inner Product Spaces

+ What is the Schwarz inequality in $RR^2$ or $RR^3$? Give another proof of it in these cases.

+ Give examples of subspaces of $l^2$.

+ Let $X$ be the inner product space consisting of the polynomial $x = 0$ and all real polynomials in $t$, of degree not exceeding 2, considered for real $t in [a, b]$, with inner product defined by (7), Sec. 3.1. Show that $X$ is complete. Let $Y$ consist of all $x in X$ such that $x(a) = 0$. Is $Y$ a subspace of $X$? Do all $x in X$ of degree 2 form a subspace of $X$?

+ Show that $y perp x_n$ and $x_n -> x$ together imply $x perp y$.

+ Show that for a sequence $(x_n)$ in an inner product space the conditions $||x_n|| -> ||x||$ and $chevron.l x_n, x chevron.r -> chevron.l x, x chevron.r$ imply convergence $x_n -> x$.

+ Prove the statement in Prob. 5 for the special case of the complex plane.

+ Show that in an inner product space, $x perp y$ if and only if we have $||x + alpha y|| = ||x - alpha y||$ for all scalars $alpha$.

+ Show that in an inner product space, $x perp y$ if and only if $||x + alpha y|| >= ||x||$ for all scalars $alpha$.

+ Let $V$ be the vector space of all continuous complex-valued functions on $J = [a, b]$. Let $X_1 = (V, ||dot||_infinity)$, where $||x||_infinity = max_(t in J) |x(t)|$; and let $X_2 = (V, ||dot||_2)$, where $||x||_2 = chevron.l x, x chevron.r^(1\/2)$, $chevron.l x, y chevron.r = integral_a^b x(t) overline(y(t)) dif t$. Show that the identity mapping $x |-> x$ of $X_1$ onto $X_2$ is continuous. (It is not a homeomorphism. $X_2$ is not complete.)

+ *(Zero operator)* Let $T: X -> X$ be a bounded linear operator on a complex inner product space $X$. If $chevron.l T x, x chevron.r = 0$ for all $x in X$, show that $T = 0$. Show that this does not hold in the case of a real inner product space. _Hint._ Consider a rotation of the Euclidean plane.

= Sec 3.3 — Orthogonal Complements and Direct Sums

+ Let $H$ be a Hilbert space, $M subset H$ a convex subset, and $(x_n)$ a sequence in $M$ such that $||x_n|| -> d$, where $d = inf_(x in M) ||x||$. Show that $(x_n)$ converges in $H$. Give an illustrative example in $RR^2$ or $RR^3$.

+ Show that the subset $M = {y = (eta_j) | sum eta_j = 1}$ of complex space $CC^n$ is complete and convex. Find the vector of minimum norm in $M$.

+ *(a)* Show that the vector space $X$ of all real-valued continuous functions on $[-1, 1]$ is the direct sum of the set of all even continuous functions and the set of all odd continuous functions on $[-1, 1]$. *(b)* Give examples of representations of $RR^3$ as a direct sum *(i)* of a subspace and its orthogonal complement, *(ii)* of any complementary pair of subspaces.

+ *(a)* Show that the conclusion of Theorem 3.3-1 also holds if $X$ is a Hilbert space and $M subset X$ is a closed subspace. *(b)* How could we use Apollonius' identity (Sec. 3.1, Prob. 5) in the proof of Theorem 3.3-1?

+ Let $X = RR^2$. Find $M^perp$ if $M$ is *(a)* ${x}$, where $x = (xi_1, xi_2) != 0$, *(b)* a linearly independent set ${x_1, x_2} subset X$.

+ Show that $Y = {x | x = (xi_j) in l^2, xi_(2n) = 0, n in NN}$ is a closed subspace of $l^2$ and find $Y^perp$. What is $Y^perp$ if $Y = "span"{e_1, dots, e_n} subset l^2$, where $e_j = (delta_(j k))$?

+ Let $A$ and $B supset A$ be nonempty subsets of an inner product space $X$. Show that *(a)* $A subset A^(perp perp)$, *(b)* $B^perp subset A^perp$, *(c)* $A^(perp perp perp) = A^perp$.

+ Show that the annihilator $M^perp$ of a set $M != emptyset$ in an inner product space $X$ is a closed subspace of $X$.

+ Show that a subspace $Y$ of a Hilbert space $H$ is closed in $H$ if and only if $Y = Y^(perp perp)$.

+ If $M != emptyset$ is any subset of a Hilbert space $H$, show that $M^(perp perp)$ is the smallest closed subspace of $H$ which contains $M$.

= Sec 3.4 — Orthonormal Sets and Sequences

+ Show that an inner product space of finite dimension $n$ has a basis ${b_1, dots, b_n}$ of orthonormal vectors.

+ How can we interpret $sum_(k=1)^n |chevron.l x, e_k chevron.r|^2 <= ||x||^2$ geometrically in $RR^r$, where $r >= n$?

+ Obtain the Schwarz inequality (Sec. 3.2) from Bessel's inequality.

+ Give an example of an $x in l^2$ such that we have strict inequality in Bessel's inequality.

+ If $(e_k)$ is an orthonormal sequence in an inner product space $X$, and $x in X$, show that $x - y$ with $y = sum_(k=1)^n alpha_k e_k$, $alpha_k = chevron.l x, e_k chevron.r$, is orthogonal to the subspace $Y_n = "span"{e_1, dots, e_n}$.

+ *(Minimum property of Fourier coefficients)* Let ${e_1, dots, e_n}$ be an orthonormal set in an inner product space $X$, where $n$ is fixed. Let $x in X$ and $y = beta_1 e_1 + dots.c + beta_n e_n$. Then $||x - y||$ depends on $beta_1, dots, beta_n$. Show by direct calculation that $||x - y||$ is minimum if and only if $beta_j = chevron.l x, e_j chevron.r$.

+ Let $(e_k)$ be any orthonormal sequence in an inner product space $X$. Show that for any $x, y in X$, $sum_(k=1)^infinity |chevron.l x, e_k chevron.r chevron.l y, e_k chevron.r| <= ||x|| ||y||$.

+ Show that an element $x$ of an inner product space $X$ cannot have "too many" Fourier coefficients $chevron.l x, e_k chevron.r$ which are "big"; here $(e_k)$ is a given orthonormal sequence; more precisely, show that the number $n_m$ of $chevron.l x, e_k chevron.r$ such that $|chevron.l x, e_k chevron.r| > 1\/m$ must satisfy $n_m < m^2 ||x||^2$.

+ Orthonormalize the first three terms of the sequence $(x_0, x_1, x_2, dots)$, where $x_j(t) = t^j$, on the interval $[-1, 1]$, where $chevron.l x, y chevron.r = integral_(-1)^1 x(t) y(t) dif t$.

+ Let $x_1(t) = t^2$, $x_2(t) = t$ and $x_3(t) = 1$. Orthonormalize $x_1, x_2, x_3$, in this order, on the interval $[-1, 1]$ with respect to the inner product given in Prob. 9. Compare with Prob. 9 and comment.

= Sec 3.5 — Series Related to Orthonormal Sequences and Sets

+ If $sum_(k=1)^infinity alpha_k e_k$ converges with sum $x$, show that $sum_(k=1)^infinity |alpha_k|^2$ has the sum $||x||^2$.

+ Derive from (1) and (2) a Fourier series representation of a function $tilde(x)$ (function of $tau$) of arbitrary period $p$.

+ Illustrate with an example that a convergent series $sum chevron.l x, e_k chevron.r e_k$ need not have the sum $x$.

+ If $(x_j)$ is a sequence in an inner product space $X$ such that the series $||x_1|| + ||x_2|| + dots.c$ converges, show that $(s_n)$ is a Cauchy sequence, where $s_n = x_1 + dots.c + x_n$.

+ Show that in a Hilbert space $H$, convergence of $sum ||x_j||$ implies convergence of $sum x_j$.

+ Let $(e_j)$ be an orthonormal sequence in a Hilbert space $H$. Show that if $x = sum_(j=1)^infinity alpha_j e_j$, $y = sum_(j=1)^infinity beta_j e_j$, then $chevron.l x, y chevron.r = sum_(j=1)^infinity alpha_j overline(beta_j)$, the series being absolutely convergent.

+ Let $(e_k)$ be an orthonormal sequence in a Hilbert space $H$. Show that for every $x in H$, the vector $y = sum_(k=1)^infinity chevron.l x, e_k chevron.r e_k$ exists in $H$ and $x - y$ is orthogonal to every $e_k$.

+ Let $(e_k)$ be an orthonormal sequence in a Hilbert space $H$, and let $M = "span"(e_k)$. Show that for any $x in H$ we have $x in overline(M)$ if and only if $x$ can be represented by $sum alpha_k e_k$ with coefficients $alpha_k = chevron.l x, e_k chevron.r$.

+ Let $(e_n)$ and $(tilde(e)_n)$ be orthonormal sequences in a Hilbert space $H$, and let $M_1 = "span"(e_n)$ and $M_2 = "span"(tilde(e)_n)$. Using Prob. 8, show that $overline(M)_1 = overline(M)_2$ if and only if *(a)* $e_n = sum alpha_(n m) tilde(e)_m$, *(b)* $tilde(e)_n = sum overline(alpha)_(m n) e_m$, $alpha_(n m) = chevron.l e_n, tilde(e)_m chevron.r$.

+ Work out the details of the proof of Lemma 3.5-3.

= Sec 3.6 — Total Orthonormal Sets and Sequences

+ If $F$ is an orthonormal basis in an inner product space $X$, can we represent every $x in X$ as a linear combination of elements of $F$? (By definition, a linear combination consists of finitely many terms.)

+ Show that if the orthogonal dimension of a Hilbert space $H$ is finite, it equals the dimension of $H$ regarded as a vector space; conversely, if the latter is finite, show that so is the former.

+ From what theorem of elementary geometry does the Parseval relation follow in the case of Euclidean $n$-space?

+ Derive from the Parseval relation the formula (often called the _Parseval relation_) $chevron.l x, y chevron.r = sum_k chevron.l x, e_k chevron.r #math.overline($chevron.l y, e_k chevron.r$)$.

+ Show that an orthonormal family $(e_kappa)$, $kappa in I$, in a Hilbert space $H$ is total if and only if the relation in Prob. 4 holds for every $x$ and $y$ in $H$.

+ Let $H$ be a separable Hilbert space and $M$ a countable dense subset of $H$. Show that $H$ contains a total orthonormal sequence which can be obtained from $M$ by the Gram-Schmidt process.

+ Show that if a Hilbert space $H$ is separable, the existence of a total orthonormal set in $H$ can be proved without the use of Zorn's lemma.

+ Show that for any orthonormal sequence $F$ in a separable Hilbert space $H$ there is a total orthonormal sequence $tilde(F)$ which contains $F$.

+ Let $M$ be a total set in an inner product space $X$. If $chevron.l v, x chevron.r = chevron.l w, x chevron.r$ for all $x in M$, show that $v = w$.

+ Let $M$ be a subset of a Hilbert space $H$, and let $v, w in H$. Suppose that $chevron.l v, x chevron.r = chevron.l w, x chevron.r$ for all $x in M$ implies $v = w$. If this holds for all $v, w in H$, show that $M$ is total in $H$.

= Sec 3.8 — Representation of Functionals on Hilbert Spaces

+ *(Space $RR^3$)* Show that any linear functional $f$ on $RR^3$ can be represented by a dot product: $f(x) = x dot z = xi_1 zeta_1 + xi_2 zeta_2 + xi_3 zeta_3$.

+ *(Space $l^2$)* Show that every bounded linear functional $f$ on $l^2$ can be represented in the form $f(x) = sum_(j=1)^infinity xi_j overline(zeta_j)$ ($z = (zeta_j) in l^2$).

+ If $z$ is any fixed element of an inner product space $X$, show that $f(x) = chevron.l x, z chevron.r$ defines a bounded linear functional $f$ on $X$, of norm $||z||$.

+ Consider Prob. 3. If the mapping $X -> X'$ given by $z |-> f$ is surjective, show that $X$ must be a Hilbert space.

+ Show that the dual space of the real space $l^2$ is $l^2$. (Use 3.8-1.)

+ Show that Theorem 3.8-1 defines an isometric bijection $T: H -> H'$, $z |-> f_z = chevron.l dot, z chevron.r$ which is not linear but conjugate linear, that is, $alpha z + beta v |-> overline(alpha) f_z + overline(beta) f_v$.

+ Show that the dual space $H'$ of a Hilbert space $H$ is a Hilbert space with inner product $chevron.l dot, dot chevron.r_1$ defined by $chevron.l f_z, f_v chevron.r_1 = #math.overline($chevron.l z, v chevron.r$) = chevron.l v, z chevron.r$, where $f_z(x) = chevron.l x, z chevron.r$, etc.

+ Show that any Hilbert space $H$ is isomorphic with its second dual space $H'' = (H')'$. (This property is called _reflexivity_ of $H$.)

+ *(Annihilator)* Explain the relation between $M^a$ in Prob. 13, Sec. 2.10, and $M^perp$ in Sec. 3.3 in the case of a subset $M != emptyset$ of a Hilbert space $H$.

+ Show that the inner product $chevron.l dot, dot chevron.r$ on an inner product space $X$ is a bounded sesquilinear form $h$. What is $||h||$ in this case?

+ If $X$ is a vector space and $h$ a sesquilinear form on $X times X$, show that $f_1(x) = h(x, y_0)$ with fixed $y_0$ defines a linear functional $f_1$ on $X$, and so does $f_2(y) = overline(h(x_0, y))$ with fixed $x_0$.

+ Let $X$ and $Y$ be normed spaces. Show that a bounded sesquilinear form $h$ on $X times Y$ is jointly continuous in both variables.

+ *(Hermitian form)* Let $X$ be a vector space over a field $K$. A _Hermitian sesquilinear form_ or, simply, _Hermitian form_ $h$ on $X times X$ is a mapping $h: X times X -> K$ such that for all $x, y, z in X$ and $alpha in K$, $h(x + y, z) = h(x, z) + h(y, z)$, $h(alpha x, y) = alpha h(x, y)$, $h(x, y) = overline(h(y, x))$. What is the last condition if $K = RR$? What condition must be added for $h$ to be an inner product on $X$?

+ *(Schwarz inequality)* Let $X$ be a vector space and $h$ a Hermitian form on $X times X$. This form is said to be _positive semidefinite_ if $h(x, x) >= 0$ for all $x in X$. Show that then $h$ satisfies $|h(x, y)|^2 <= h(x, x) h(y, y)$.

+ *(Seminorm)* If $h$ satisfies the conditions in Prob. 14, show that $p(x) = sqrt(h(x, x))$ defines a seminorm on $X$.

= Sec 3.9 — Hilbert-Adjoint Operator

+ Show that $0^* = 0$, $I^* = I$.

+ Let $H$ be a Hilbert space and $T: H -> H$ a bijective bounded linear operator whose inverse is bounded. Show that $(T^*)^(-1)$ exists and $(T^*)^(-1) = (T^(-1))^*$.

+ If $(T_n)$ is a sequence of bounded linear operators on a Hilbert space and $T_n -> T$, show that $T_n^* -> T^*$.

+ Let $H_1$ and $H_2$ be Hilbert spaces and $T: H_1 -> H_2$ a bounded linear operator. If $M_1 subset H_1$ and $M_2 subset H_2$ are such that $T(M_1) subset M_2$, show that $M_1^perp supset T^*(M_2^perp)$.

+ Let $M_1$ and $M_2$ in Prob. 4 be closed subspaces. Show that then $T(M_1) subset M_2$ if and only if $M_1^perp supset T^*(M_2^perp)$.

+ If $M_1 = cal(N)(T) = {x | T x = 0}$ in Prob. 4, show that *(a)* $T^*(H_2) subset M_1^perp$, *(b)* $[T(H_1)]^perp subset cal(N)(T^*)$, *(c)* $M_1 = [T^*(H_2)]^perp$.

+ Let $T_1, T_2$ be bounded linear operators on a complex Hilbert space $H$ into itself. If $chevron.l T_1 x, x chevron.r = chevron.l T_2 x, x chevron.r$ for all $x in H$, show that $T_1 = T_2$.

+ Let $S = I + T^* T: H -> H$, where $T$ is linear and bounded. Show that $S^(-1): S(H) -> H$ exists.

+ Show that a bounded linear operator $T: H -> H$ on a Hilbert space $H$ has a finite dimensional range if and only if $T$ can be represented in the form $T x = sum_(j=1)^n chevron.l x, v_j chevron.r w_j$ ($v_j, w_j in H$).

+ *(Right shift operator)* Let $(e_n)$ be a total orthonormal sequence in a separable Hilbert space $H$ and define the _right shift operator_ to be the linear operator $T: H -> H$ such that $T e_n = e_(n+1)$ for $n = 1, 2, dots$. Explain the name. Find the range, null space, norm and Hilbert-adjoint operator of $T$.

= Sec 3.10 — Self-Adjoint, Unitary and Normal Operators

+ If $S$ and $T$ are bounded self-adjoint linear operators on a Hilbert space $H$ and $alpha, beta$ are real, show that $tilde(T) = alpha S + beta T$ is self-adjoint.

+ How could we use Theorem 3.10-3 to prove Theorem 3.10-5 for a complex Hilbert space $H$?

+ Show that if $T: H -> H$ is a bounded self-adjoint linear operator, so is $T^n$, where $n$ is a positive integer.

+ Show that for any bounded linear operator $T$ on $H$, the operators $T_1 = 1/2 (T + T^*)$ and $T_2 = 1/(2 i)(T - T^*)$ are self-adjoint. Show that $T = T_1 + i T_2$, $T^* = T_1 - i T_2$. Show uniqueness, that is, $T_1 + i T_2 = S_1 + i S_2$ implies $S_1 = T_1$ and $S_2 = T_2$ ($S_1, S_2$ self-adjoint).

+ On $CC^2$ let the operator $T: CC^2 -> CC^2$ be defined by $T x = (xi_1 + i xi_2, xi_1 - i xi_2)$, where $x = (xi_1, xi_2)$. Find $T^*$. Show that we have $T^* T = T T^* = 2 I$. Find $T_1$ and $T_2$ as defined in Prob. 4.

+ If $T: H -> H$ is a bounded self-adjoint linear operator and $T != 0$, then $T^n != 0$. Prove this *(a)* for $n = 2, 4, 8, 16, dots$, *(b)* for every $n in NN$.

+ Show that the column vectors of a unitary matrix constitute an orthonormal set with respect to the inner product on $CC^n$.

+ Show that an isometric linear operator $T: H -> H$ satisfies $T^* T = I$, where $I$ is the identity operator on $H$.

+ Show that an isometric linear operator $T: H -> H$ which is not unitary maps the Hilbert space $H$ onto a proper closed subspace of $H$.

+ Let $X$ be an inner product space and $T: X -> X$ an isometric linear operator. If $dim X < infinity$, show that $T$ is unitary.

+ *(Unitary equivalence)* Let $S$ and $T$ be linear operators on a Hilbert space $H$. The operator $S$ is said to be _unitarily equivalent_ to $T$ if there is a unitary operator $U$ on $H$ such that $S = U T U^(-1) = U T U^*$.
