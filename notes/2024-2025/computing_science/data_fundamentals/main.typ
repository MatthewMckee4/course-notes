#set document(title: "Data Fundamentals")
#set page(margin: 20pt)
#set par(spacing: 0.55em)

// #######################################################################################################################################################

= Arrays #text(size: 10pt, gray)[Week 1]

*Basic Concepts*
2 × 3 means 2 rows, 3 columns.
Rank 1 tensor is 1D array.

*Concatenate* to join along existing dimension.

*Stack* to stack up arrays along new dimension.

*Tiling* to repeat an array.

- Starting with two 1D arrays of shape (3,)
- Concatenating them creates a single 1D array of shape (6,)
- Stacking them creates a 2D array of shape (2, 3)
- Stacking with axis = 1 creates a 2D array of shape (3, 2)

*Broadcasting*: You can broadcast an array of shape (x, y) with (x, y), (1, y), (x, 1), (y,).

*Reduction*: apply a function to reduce the array to a single value or with axis to reduce along a specific axis.

*Accumulate*: apply a function to reduce the array to a single value.

*NumPy Functions*
- `np.random.uniform`, `np.random.normal`, `np.random.randint`, `np.random.choice`, `np.random.permutation`
- `np.tile`, `np.stack`, `np.concatenate`, `np.squeeze`, `np.reshape`, `np.einsum`, `np.ravel`, `np.swapaxes`, `np.rollaxes`

// #######################################################################################################################################################

= Floats #text(size: 10pt, gray)[Week 2]

*Float Exceptions*

Invalid operation, divide by zero, overflow, underflow, inexact, invalid operation.

- inf - inf = nan (invalid operation)
- x+y will have large error if x and y have different magnitudes (magnitude error), loss of precision
- x-y will have large error if $x tilde.eq.rev y$ (cancellation error)

Use `np.allclose` to check if two floats are close.

*Representation*

$"float" = "sign" * 2^"exponent" * "mantissa"$

`float64`: 1 bit for sign, 11 bits for exponent, 52 bits for mantissa.

`float32`: 1 bit for sign, 8 bits for exponent, 23 bits for mantissa.

`inf` is represented with all 1s in the exponent and 0s in the mantissa.

`nan` is represented with all 1s in the exponent and non-zero in the mantissa.

Floating point numbers can be thought of as numbers between 1.0 and 2.0, that can be shifted and
stretched by doubling or halving repeatedly.
The advantage of this is that the for a relatively small number of digits, a very large range of numbers
can be represented. The precision, however, is variable, with very precise representation of small
numbers (close to zero) and coarser representation of numbers far from 0.

*Strides*

Stride: number of bytes between each element in an axis.

To find the element at index [i, j, k] in a numpy array, we need to know the shape of the array and the strides.

`strides = (shape[0] * itemsize, shape[1] * itemsize, shape[2] * itemsize)`

`element = base + i * strides[0] + j * strides[1] + k * strides[2]`

*Dope vectors*: Hold striding information.

*Illife vectors*: Holds nested pointers to other arrays / values.

To transpose a 2D array, we need to reverse the swap then dimensions and swap the strides.

*Rank and Dimensions*

*Add singleton dimensions*: `x[:, np.newaxis]` or `x[:, None]`

*Remove singleton dimensions*: `np.squeeze`

*Elided axes*: `[0, ..., 4]`

*Swapping and rearranging*: `np.swapaxes, np.rollaxis, np.moveaxis, np.transpose`

*Einsum*: Einstein summation convention. Used to reorder high-dimensional arrays.

#pagebreak()

// #######################################################################################################################################################

= Scientific Visualisation #text(size: 10pt, gray)[Week 3]

== Basic Terminology

A *stat* is a statistic computed from data, such as means (mean, median, max, min, etc.)

A *mapping* represents a transformation of data attributes to visual values. It maps stats using a scale to give units.

A *guide* is a visual reference which indicates the meaning of a mapping. Axes which are labeled are guides for the coordinate system.
Legend is a guide for the mapping. A grid is a guide for the coordinate system.

A *geom* is the geometric representation of data after it has been mapped. Lines, markers, patches, bars.

A *coord* is a coordinate system, which connects mapped data onto points on a plane.

A *layer* of a plot is one set of geoms, with one mapping on one coordinate system.

A *facet* is a different view on the same dataset, on a separate coordinate system.

A *figure* comprises a set of one or more facets

A *caption* explains the visualization to the reader.

A *scale* specifies how units are transformed.

== Stats

Avoid rescaled units. This can be misleading.

*Regression*: fit a line to the data.
*Smoothing*: fit a curve to the data.

*Aggregate summary statistics*: statistics which summarise some larger dataset compactly, like the mean.

*Smoothing and regression* finding simple, smooth functions which approximate observed data.

*Rank plot*: a plot of values arranged in rank order.

== Geoms

*Markers*: geoms that represent bare points, typically use as a visual record of a discrete. Can also be used to represent another variable, you
could modify the colour or scaling

*Colour changes*: percaptually uniform, monotonic brightness, consider if it will be seen in black and white.

Geometric representations, or *geoms*, that connect points together should be used if it makes sense to ask what is between two data points.
*Line styles* can have variable thickness, variable color, and dash patterns to enhance the visual representation of the data.

*Colour maps* should be perceptually linear, monotonic, and continuous.
If around zero, highlight zero, the sign of the error, and the magnitude of the error.
If your data is signed, use a colour map which diverges around 0, and is monotonic in brightness in each side of 0.

For example, the staircase plot is useful when we know that the value cannot have changed between measurements (e.g., in a coin toss scenario).
This type of plot connects points but keeps the value fixed until a new data point is observed.
Conversely, if measurements are naturally discrete, a bar chart may be more suitable to represent the data effectively.

*Alpha and transparency*

A *geom* can be rendered with different levels of transparency, referred to as *alpha* (equivalent to opacity) or
*transparency* (the inverse of opacity). This feature is particularly useful when dealing with a large number
of overlapping geoms, as it allows for the emphasis of certain geoms while maintaining visibility of others.
However, it is important to use transparency judiciously, as excessive transparency can make graphs difficult to read.

== Coords

*Aspect Ratio* can be very important, images should never be stretched or squashed.

*Log scales* can be useful when datasets span orders of magnitude.

*Symlog* modified logarithmic scale to allow for negative values.

*Polar coordinates* visual coordinates in terms of angle and distance.

*Double axes* two different y units overlaid on the same facet.

*Standard deviation* the average deviation from the average.

*Nonparametric intervals* intervals based on summary statistics of data, like the interquartile range.

== Facets and Layers

*Distinct layers* superimposed on the same set of coords.
*Distinct facets* on separate sets of coords.

#figure(
  image("assets/layered-faceted.png", width: 25%),
  caption: [Layered and Faceted]
)

*Error Bars* can be shown as the *standard deviation*, *standard error*, *confidence interval*, or *nonparametric interval*.

#pagebreak()

// #######################################################################################################################################################

= Linear Algebra  #text(size: 10pt, gray)[Week 4]

*Embedding* The representation of objects as points in a vector space.

*Linear interpolation*
$"lerp"(x_1, x_2, α) = (1 - α)x_1 + (α)x_2$

*Norms*
$‖x‖_p = (sum_(i=1)^n |x_i|^p)^(1/p)$
$‖x‖_infinity = max_(i=1)^n |x_i|$
$‖x‖_(-infinity) = min_(i=1)^n |x_i|$
*Normalisation* $x' = x/(‖x‖_p)$

*Feature Vectors* The representation of "features" which define properties as points
in a vector space; critical in machine learning.

*Cosine Distance*
$cos θ = (x · y)/(‖x‖ ‖y‖)$

*Covariance Matrices*

As well as the *mean vector* we saw earlier, we can also generalise the idea of *variance*,
which measures the spread of a dataset, to the multidimensional case. Variance is the sum of squared differences
of each element from the mean of the vector.

$ sigma^2 = 1/(N - 1) sum_(i=0)^(N-1) (x_i - μ)^2 $

This is a measure of how "spread out" a vector of values $x$ is. The *standard deviation* $sigma$
is the square root of the *variance* and is more often used because it is in the same units as the
elements of $x$.

In the multidimensional case, to get a useful measure of spread of the $N × d$ data matrix $X$, we need to
compute the *covariance* of every dimension with every other dimension. This is the average squared
difference of each column of data from the average of every column. This forms a 2D array $∑$, which
has entries in element i, j.

$ ∑_(i j) = 1/(N - 1) sum_(k=1)^N (X_(k i) - μ_i)(X_(k j) - μ_j) $

As we will discuss shortly, this is a *special form* of matrix: it is square symmetric and positive
semi-definite.

Interpretation of covariance matrix:
- Diagonal elements are variances of each dimension.
- Off-diagonal elements are covariances between dimensions.

We can also get it from using $"np"."cov"$.

*Covariance Ellipses*

This matrix captures the spread of data, including any correlations between dimensions.
It can be seen as capturing an ellipse that represents a dataset. The *mean vector* represents
the centre of the ellipse, and the covariance matrix represents the shape of the ellipse.
This ellipse is often called the error ellipse, and is a very useful summary of high-dimensional data.

The covariance matrix represents a (inverse) transformation of a unit sphere to an ellipse covering the data.

#pagebreak()

// #######################################################################################################################################################

= Linear Algebra 2 #text(size: 10pt, gray)[Week 5]

*Adjacency Matrices* square matrix of $|V| × |V|$ size where no edge from $V_i$ to $V_j$ means 0 and existing edges mean 1

*Computing graph properties*

There are some graph properties which we can compute easily from the adjacency matrix.
- *Out-degree* sum across the rows
- *In-degree* sum across the columns
- *Symmetric matrix* means an undirected graph
- directed graph can be turned into an undirected one using: $A' = A + A^T$.
- If there are non-zero elements on the diagonal, that means there are self-loops.

*Edge weighted graphs*

We can think of graphs as representing flows of mass through a network of verticies.

- If the total flow out of a vertex is $> 1$, i.e. Its row sums to $> 1$, then it is a source of mass; for example it is manufacturing things.
- If the total flow out of a vertex is $< 1$, i.e. Its row sums to $< 1$, then it is a sink; for example it is consuming things.
- If the total flow out of the vertex is exactly $1$, i.e. Its row sums to exactly $1$, then it conserves mass; it only ever re-routes things.

== The degree matrix and the Laplacian

The *degree matrix* $D$ is a diagonal matrix whose diagonal elements are the sum of the weights of the edges connected
to each vertex. That is, we compute the degree matrix by summing the rows of the adjacency matrix.

$ D_(i i) = sum_(j=1)^(|V|) A_(i j) $

The *Laplacian matrix* of a graph is defined as the difference betweent he degree matri and the adjacency matrix.
We usualy compute it for the undirected graphs, where the adjacency matrix is symmetric. The Laplacian matrix is defined as:

$ L = D - A $

It is of great importance in analysing the properties of graphs.
Subtracting the degree matrix adjusts the weighting so that a balance between the global and the local structure of the graph is achieved.
The Laplacian matrix is used in many graph algorithms, particularly when examining the flow of informatino or mass through a network.

*More matrix classes*
- *A Sparse Matrix* is a matrix with a large number of zero elements, the oppisite is a *Dense Matrix*.
- *A Stochastic Matrix* is a square matrix of non-negative numbers with each row summing to 1.
- *A Row-Stochastic Matrix* is a stochastic matrix where each row sums to 1.
- *A Column-Stochastic Matrix* is a stochastic matrix where each column sums to 1.
- *A Doubly Stochastic Matrix* is a square matrix of non-negative numbers with each row and column summing to 1.

== Eigenvectors and Eigenvalues

*Eigenvector* of A is a vector that is only scaled when is applied to it, not rotated.

*Eigenvalue* of A is how much the eigenvector is scaled by when is applied to it.
$A x = λ x$.

*Power Iteration*

We can simply apply the matrix repeatedly to a random initial vector and wait until the result converges to a steady state.
This may explode or converge to zero, so we normalise the vector each time.

$ x_n = (A x_(n-1))/(‖A x_(n-1)‖_infinity) $

The power iteration method enables us to calulate the leading eigenvector and eigenvalue of a matrix.

*Computing Eigenvalues and Eigenvectors in NumPy*

For symmetric matrices, we can use $"evals", "evecs" = "np"."linalg"."eigh"(A)$.

Otherwise, we can use $"evals", "evecs" = "np"."linalg"."eig"(A)$.

Eigenvectors are *orthogonal*.

*Formal definition of eigenvectors and eigenvalues*

An eigenvector of a square matrix $A$ is a non-zero vector $x$ such that when $A$ is applied to $x$, the result is a multiple of $x$.

The *eigendecomposition* of a matrix $A$ is a decomposition of the form $A = P Λ P^(-1)$ where $P$ is an invertible matrix of eigenvectors and $Λ$ is a diagonal matrix of eigenvalues.

The *eigenspectrum* is just the sequence of absolute eigenvalues, ordered by magnitude, $|λ_1| > |λ_2| > ... > |λ_n|$.

== Principle Components Analysis

The eigenvectors of the covariance matrix are called the *principal components*, and they tell us the
directions in which the data varies most.
The direction of principal component $i$ is given by the eigenvector $x_i$, and the length of the
component is given by $sqrt(λ_i)$.

*Dimensionality Reduction*

We can reduce the dimensionality of our original dataset by projecting it onto the few principal components
of the covariance matrix that we've kept. We can do this by multiplying the dataset matrix by each component
and saving the projected data into a new lower-dimensional matrix.

*Uses of Eigendecomposition*

Matrix decomposition is an essential tool in data analysis. It can be expremely poweful and is efficient to implement.

*The Trace* of a matrix is the sum of its diagonal elements.

*The Determinant* of a matrix is the product of the eigenvalues: $det(A) = product_(i=1)^n λ_i$

*Positive Definite Matrices*
A matrix is positive definite if all its eigenvalues are greater than zero: $λ_i > 0$.

*Positive Semi-Definite Matrices*
A matrix is positive semi-definite if all its eigenvalues are non-negative: $λ_i ≥ 0$.

A positive definite mathrix has the property $x^T A x > 0$ for all nonzero vectors $x$.
This tells us that the dot product of $x$ with $A x$ must be positive
(N.B. $A x$ is the vector obtained by transforming $x$ with $A$).
This can only happen if the angle $θ$ between $x$ and $A x$ is less than $90°$,

*Summary of eigenproblems*:
- Eigenvectors exist only for square matrices.
- A matrix $A$ transforms a general vector by rotating and scaling it.
- However, the eigenvectors of $A$ are special because they can only be scaled, not rotated by the transform.
- The eigenvalues of $A$ are the scaling factors $λ_i$ that correspond to each unit eigenvector $x_i$.
- Eigendecomposition is the process of breaking a matrix down into its constituent eigenvalues and eigenvectors. These serve as a compact summary of the matrix.
- If we have a complete set of eigenvectors and eigenvalues, we can reconstruct the matrix.
- We can approximate a large matrix with a few leading eigenvectors; this is a simplified or truncated approximation to the original matrix.
- If we repeatedly apply a matrix to some vector, the vector will be stretched more and more along the largest eigenvectors.
- *An orthogonal matrix* is a square matrix with orthonormal columns, $A^T = A^(-1)$.

== Key Algorithm I: Singular Value Decomposition

Eigendecompositions only apply to diagonalizable matricies: which are a subset of square matricies.
But the ability to "factorise" matricies in the way eigendecomposotion does it is enormously powerful, and there are
many problems which have non-square matricies.

The *singular value decomposition* (SVD) is a general approach to decomposing any matrix A.
It is the powerhouse of computational linear algebra.

The SVD produces a decomposition which splits any matrix up into three matricies:

$ A = U Sigma V^T $

$U$ is a *square unitary $m * m$ matrix*, whose columns contain the left singular vectors

$V$ is an *square unitary $n * n$ matrix*, whose columns contain the right singular vectors

$Sigma$ is a *diagonal $m * n$ matrix*, whose diagonal contains the singular values

A *unitary matrix* is one whose conjugate transpose is equal to its inverse. $U^T U = I$

The SVD is the same as:
- Taking the eigenvectors of $A^T A$ to get $U$
- Taking the square root of the absolute value of the eigenvalues $λ_i$ of $A^T A$ to get $Σ_i = sqrt(λ_i)$
- Taking the eigenvectors of $A A^T$ to get $V^T$

For powers of $A$, we also have
$A^n = V Σ^n U^T$

*Pseudo-inverse*

We can also pseudo-inverse a matrix $A^+$ even if $A$ is not square.
$A^+ = V Σ^(-1) U^T$

The *Rank* of a matrix is the number of non-zero singular values, or the number of linearly independent rows or columns.

The *condition number* of a matrix is the ratio of the largest singular value to the smallest.

*Whitening* removes all linear correlations within a dataset. It is a normalizing step used to standardise data before analysis.
Given a dataset $X$, we can compute:
$X^w = (X - μ) Sigma^(-1/2)$
where $μ$ is the mean vector, i.e.
A row vector containing the mean of each column in $X$, and $Sigma$ is the covariance matrix. Whitening centers data around the mean,
squaresh the data so its distribution is spherical and has unit covariance.

#pagebreak()

// #######################################################################################################################################################

= Optimisation #text(size: 10pt, gray)[Week 6]

*Paremeters* are things we can adjust (inputs), they exist in a parameter space: the set of all possible values.

*Objective Function* (loss function) maps the parameters onto a single numerical measure of how good the configuration is.
The desired output of the optimisation algorithm is the parameter configuration that minimises the objective function.
$theta^* = arg min_(theta in Theta) L(theta)$

$L(theta) = ||f(x; theta) - y||$

*Constraints* are limitations on the parameters. This defines a region of the parameter space that is feasible,
the feasible set or region.

It is common to have express problems in a form where the objective function is a distance between an output
and a reference is measured.

*Evaluating the objective function* may be expensive, so a good optimisation algorithm will find the optimal
configuration with few queries.

*Discrete and continuous* optimisation are inferred based on the parameter space.


== Constrained Optimisation

A constrained optimisation might be written in terms of an equality constraint:

$ min_theta L(theta) "subject to" C(theta) = 0 $

or an inequality constraint:
$ min_theta L(theta) "subject to" C(theta) <= 0 $

where $c(theta)$ is a a function that represents the constraint.

*Common constraint types*:
- box constraint: $a_i <= theta_i <= b_i$
- convex constraint: $C(theta) <= 0$
- equality constraint: $C(theta) = 0$

*Constrained optimisation* could speed it up, though fewer algorithms are available for optimisation.
May be hard to specify feasible region, could be less efficient.

*Soft constraints* work by applying penalties to the objective function to "discourage" solutions that violate the constraints.

$ L(theta) = L(theta) + lambda C(theta) $

where $C(theta)$ is a penalty function with an increasing value as the
constraints are more egregiously violated. $lambda$ is a penalty coecient that controls how much the constraints are penalised.
This may not respect important constraints.

*Relaxation* is a technique where an algorithm tries to find a continuous or unconstrained
optimisation problem to solve instead of a discrete optimisation.

*Penalisation* refers to terms which augment an objective function to minimise some other property of
the solution, typically to approximate constrained optimisation.

*Properties of the objective function*. A local minimum is any point where the objective function
increases in every direction around that point. An objective function is *convex* if it has a single, global minimum.

== Algorithms

=== Direct convex optimisation techniques, least squares
Sometimes we have an optimisation problem which we can speficy such that the solution can be computed in one step.
An example is linear least squares, which solves objective functions of the form:

$ min_x L(x) = ||A x - b||_2^2 $

that is, it finds $x$ that is closest to the solution of $A x = b$. This equation is *convex* and has a single minimum.

We can solve this directly using the *psuedo-inverse* via the SVD.

=== Iterative optimisation

Iterative optimisation invloces making a seires of steps in a parameter space. There is a *current parameter vector*
which is adjusted at each iteration.

```
choose a starting point $x_0$
while objective function changing
    adjust parameters
    evaluate objective function
    if better solution found than any so far, record it
return best parameter set found

```

=== Grid search

The parameter space is split equally in each dimension. This is very slow as it scales with more dimensions.
If the grid is not fine enough, minima can be missed. Trivial to implement. Requires no knowledge of the objective function.
Works for any continuous parameter space. Must specify search bounds in advance.

*Hyperparameters* are properties which affect the way in which the optimiser finds a solution.

=== Simple stochastic

The simplest such algorithm is, which makes no assumptions other than we can draw random samples from the parameters space,
is *random search*.

```
Guess a number $theta$
check the objective function,
if $L(theta) ≤ L(theta^*)$, then $theta^* = theta$.
```

*Pros*: Can get trapped in local minima. requires no knowledge of the objective function.
Very simple to implement. Better than grid search.

*Cons*: Extremely inefficient. Must be possible to draw random samples from the parameter space.
Results do not necessarily get better over time.




== Metaheuristics
There are a number of meta-heuristisc that can be used to improve random search.
- *Locality* which takes advantage of the fact the objective function is likely to have similar values for similar parameter configurations.
- *Temperature* which can change the rate of movement in the parameter space over the course of an optimisation.
- *Population* which can track multiple simultaneous parameter configurations and select among them
- *Memory* which can record good or bad steps in the last and avoid them.





=== Locality
Locla search refers to the class of algorithms that make incremental changes to a solution. These can be much more efficient than
random search or grid search. However, they are subject to becoming trapped in local minima, and not reaching the global minimum.

*Hill climbing*

Hill climbing is a modification of random search which assumes some toplogy of the parameter space,
so that there is a meaningful concept of a neighbourhood of a parameter vector; that we can make incremental
changes to it. Hill climbing that takes random samples near the current best parameter vector.
*Simple hill climbing* adjusts just one of the parameter vector elements at a time, examining each direction in turn.
*Stochastic hill climbing* makes a random adjustment to the parameter vector, then either accepts or rejects the step.

*Pros*: not much more complicated than random search. Can be much faster than random search.

*Cons*: hard to choose how much of an adjustment to make. Can get stuck in local minima.
Struggles with objective function regions that are flat. Requires approximately continous objective function.





=== Temperature

*Simulated annealing* extends hill-climbing with the ability to sometimes randomly go
uphill, instead of always going downhill. It uses a *temperature schedule* that allows more
uphill steps at the start of the optimisation and fewer ones later in the process. This is used
to overcome ridges and avoid getting stuck in local minima.

*Accepting you have to go uphill sometimes*

Simulated annealing uses the idea of *acceptance probability*. Instead of just accpeting any random change that decreases loss,
we randomly accept some proportion of jumps that might temporarily increase the loss, and slowly decrease the propoertion of these over time.
given the current loss $l = L(theta)$, and a proposed new loss $l' = L(theta + Delta theta)$ where $Delta theta$ is a random change,
we can define a probability $P(l, l', T(i))$ which is the probability of jumping from $l$ to $l'$ at step $i$.

A common rule is:
- $P(l, l', T(i)) = 1$ if $l' < l$
- $P(l, l', T(i)) = exp(-(l' - l) / T(i))$ if $l' > l$

$T(i)$ is typically an exponentially decaying function of $i$. For example, $T(i) = e^(-i/r)$ where $r$ is the cooling rate.

*Pros*: Much less sensitive to getting trapped in local minima. Easy to implement. Very effective.

*Cons*: No guarantee of convergence. Slow if the uphill steps are not needed.
Depends on good choice for the temperature schedule.














=== Population

Another nature-inspired variant of random search is to use a *population* of multiple competing potential solutions,
and to apply some analogue of *evolution* to solving optimisation.

This involves some of:

- *mutation* (random variables)
- *natural selection* (solution selection)
- *breeding* (interchange between solutions)

The class of algorithms are often called *genetic algorithms*. All genetic algorithms maintain some population of potential solutions
and some rule which is used to preserve some members of the population and cull others.

*Pros*: easy to understand and applicable to many problems. Requires only weak knowledge of the objective function.
Can be applied to problems with both discrete and continuous components.
*Cons*: many hyperparameters to tune. No guarantee of convergence. Very slow.



=== Memory
The optimisation algorithms so far have been *memoryless*. They make decisions based only on the current state of the parameter vector.
This inefficiency can be mitigated by using some form of memory, where the optimiser remembers where "good" and "bad" bits

=== Convergence
An optimisation algorithm is said to converge to a solution
What can go wrong? Slow progress. Noisy and diverging performance. Getting stuck






#pagebreak()

// #######################################################################################################################################################

= Optimisation 2 #text(size: 10pt, gray)[Week 7]

== Gradients of Vector-Valued Functions

=== Jacobian: matrix of partial derivatives.

If $f(x)$ is a scalar function of a scalar $x$, $f'(x)$ is the first derivative of $f$ w.r.t. $x$, i.e. $f'(x) = d/"dx" f(x)$. The second derivative is written
$f''(x) = d^2/"dx"^2 f(x)$.

If we generalise this to a vector function $y = f(x)$, then we have a rate of change (derivative) between every component of the input and every component of an
output at any specific input $x$. We can collect this derivative information into a matrix called the Jacobian matrix, which characterises the slope at a specific
point $x$. If the input $x in R^n$ and the output $y in R^m$, then we have an $m × n$ matrix:

$ f'(x) = J = mat(
  (partial y_0)/(partial x_0), (partial y_0)/(partial x_1), ..., (partial y_0)/(partial x_n);
  (partial y_1)/(partial x_0), (partial y_1)/(partial x_1), ..., (partial y_1)/(partial x_n);
  dots.v, dots.v, dots.down, dots.v;
  (partial y_m)/(partial x_0), (partial y_m)/(partial x_1), ..., (partial y_m)/(partial x_n)
) $

This simply tells us how much each component of the output changes as we change any component of the input — the generalised "slope" of a vector-valued function.
This is a very important way of characterising the variation of a vector function at a point $x$, and is widely used in many contexts. In the case where $f$ maps
$R^n -> R^n$ (from a vector space to the same vector space), then we have a square matrix with which we can do standard things like compute the determinant, take
the eigendecomposition or (in some cases invert).


=== Gradient Vector: one row of the Jacobian

The gradient vector of a scalar function $f: R^n -> R$ is a vector-valued function $∇f: R^n -> R^n$ that contains all the partial derivatives of $f$ with respect
to each input dimension. For a function $f(x_1, ..., x_n)$, the gradient is:

$gradient f = mat(
  (partial f)/(partial x_1);
  (partial f)/(partial x_2);
  dots.v;
  (partial f)/(partial x_n)
)$

This gradient vector tells us how much the function value changes when we make small changes to each input dimension independently. The magnitude of each component indicates the sensitivity of the function to changes in that particular dimension.

Note that while we only deal with scalar functions (outputs) in this course, the gradient concept can be extended to vector-valued functions, where the Jacobian matrix would contain the gradients of each output component.

=== Hessian: Jacobian of the gradient vector

The Hessian is the Jacobian of the gradient vector. It is a matrix of second partial derivatives.

$H = J(gradient f) = mat(
  (partial^2 f)/(partial x_1^2), (partial^2 f)/(partial x_1 partial x_2), ..., (partial^2 f)/(partial x_1 partial x_n);
  (partial^2 f)/(partial x_2 partial x_1), (partial^2 f)/(partial x_2^2), ..., (partial^2 f)/(partial x_2 partial x_n);
  dots.v, dots.v, dots.down, dots.v;
  (partial^2 f)/(partial x_n partial x_1), (partial^2 f)/(partial x_n partial x_2), ..., (partial^2 f)/(partial x_n^2)
)$

This is important, because we can see that the second derivative even of a scalar valued function scales quadratically with the dimension of its input.



== Optimisation with Derivatives

=== Conditions

*Differentiability*: a function is differentiable if it has a continuous derivative.

*Lipschitz continuous*: a function $f$ is Lipschitz continuous if there exists a constant $L$ such that for all $x$ and $y$, $|f(x) - f(y)| ≤ L |x - y|$.

*Lipschitz constant*: the smallest $L$ such that the function is Lipschitz continuous.




== Key Algorithm 2: Gradient Descent

The basic first-order algorithm is called gradient descent and it is very simple, starting from some initial guess $theta_0$:

$ theta_(t+1) = theta_t - delta gradient L(theta_t) $

where $delta$ is a scaling hyperparameter - the step size.

While gradient descent can be very fast, following the gradient is not necessarily the fastest route to a minimum.

=== Implementing Gradient Descent

We can use "schedules" step sizes, where the step size is reduced as the optimisation progresses. This can help to avoid overshooting the minimum.

- *Exponential decay*: $delta_t = delta_0 e^(-lambda/t)$
- *inverse decay*: $delta_t = delta_0/(t + 1)$

*Adaptive Step Sizes*:
*Line search*: Start with a big step, then reduce it if the gradient is not decreasing.
*Adagrad*: adapt the step size for each dimension based on the history of the gradient in that dimension.

== How do we get derivatives?

- *Symbolically* (analytically) — using computer algebra software, but not very flexible and awkward in practice
- *Numerically* (finite differences) — easy but slow for high dimensions and numerically unstable
- *Automatically* (automatic differentiation) — most flexible and efficient method, computing gradients "for free" at any point in parameter space

== Improving Gradient Descent

*Random restart*
*Momentum*

*Stochastic Gradient Descent*: If the objective function can be broken down into
small parts, then the gradient can be approximated by sampling the gradient at random points.

Take a subset of traning samples and outputs, computing the gradient for each sample, then make a move according to the computed gradient over the subsets.
Over time, the random subset selection will average out. Each subset is called a *minibatch*, and one run through the whole dataset is called an *epoch*.

SGD has major advantages in terms of memory consumption, because computations can be applied to a small number of samples in *minimatches*.
We just compute the gradient on a subsample, and move in that direaction. It won't be exactly the right derivative of the whole objective function,
but it will be a good approximation.

SGD can improve performance as the random partitioning of the objective function in each minibatch adds *noise* to the optimisation process.

While adding noise is a heuristic search approach, it is often very effective.

=== Random Restart

Gradient descent gets trapped in minima easily. Once it is in an *attractor basic* of a local minima it can't easily get out.
SGD can add a little bit of noise that might push the optimiser over small ridges and peaks, but not out of deep minima.

=== Simple memory: momentum terms

The idea of momentum is to add a term that remembers where the optimiser has been.

$ theta_(t+1) = theta_t - delta gradient L(theta_t) + alpha (theta_t - theta_(t-1)) $

== Types of critical points
*Plateau*: A region where the gradient is close to zero.
*Ridge*: A region where the gradient is close to zero, but the function is still decreasing.
*Local minimum*: A point where the gradient is zero and the Hessian is positive definite.
*Global minimum*: A point where the gradient is zero and the Hessian is positive definite, and there are no other local minima.



*Eigenvalues of the Hessian*: The Hessian matrix captures important properties about the type of critical
point that we saw in the previous lecture. In particular, the eigenvalues of the Hessian tell us what kind of point we have.
If all eigenvalues are strictly positive, the matrix is called positive definite and the point is a minimum. If all eigenvalues
are strictly negative, the matrix is called negative definite and the point is a maximum. If eigenvalues have mixed signs,
the point is a saddle point. If the eigenvalues are all positive or negative, but with some zeros, the matrix is semidefinite
and the point is a plateau or ridge.

== Other

- *Sub-objective functions*: Objective functions which contribute to an overall compromise objective function.
- *Convex linear sum*: A weighted sum of elements where all weights are positive.
- *Multiplicative interaction*: A nonlinear interaction between elements (sub-objective functions) where one sub-objective function has a multiplicative effect on another.
- *Dominance*: A solution dominates another solution if it is better or as good as measured by every sub-objective function.
- *Strictly dominates*: As dominates, but strictly better than.
- *Pareto optimal*: A Pareto optimal solution is a configuration where any change that would improve a sub-objective function would make at least one other sub-objective function worse.
- *Pareto front*: The set of Pareto optimal solutions for a multi-objective optimization problem.









// #######################################################################################################################################################

= Probability #text(size: 10pt, gray)[Week 8]

=== Probability Definitions

*Experiment/Trial*: An occurrence with an uncertain outcome (e.g., submarine location)

*Outcome*: Result of an experiment (e.g., submarine in grid [2,3])

*Sample Space*: Set of all possible outcomes

*Event*: Subset of possible outcomes with common property

*Probability*: Ratio of event outcomes to total outcomes (0 to 1)

*Probability Distribution*: Mapping of outcomes to probabilities that sum to 1

*Random Variable*: Variable representing unknown value with known probability distribution

*Probability Density/Mass Function*: Function defining probability distribution

*Observation*: Directly observed outcome (data)

*Likelihood*: How likely an observation is given a probability distribution

*Sample*: Simulated outcome from a probability distribution

*Expectation*: Average value of a random variable

=== In Prose

A random variable $X$ has a probability distribution $P(X)$ which assigns probabilities $0 lt.eq P(x) lt.eq 1$ to outcomes $x$ which belong to the sample space $X$.

That probability distribution is defined by a probability density/mass function $f_X(x)$ which assigns probabilities to outcomes such that the sum of the probabilities of all outcomes is 1.

=== Philosophy of Probability

*Bayesians* treat probability as a calculus of belief; in this model of thought, probabilities are measures of degrees of belief.

The key process in bayesian logic is updating of beliefs. Given some:
- *prior* belief and some
- new *evidence* we can
- update our belief to calculate the *posterior*

*Frequentist view of probability* considers probability as the long-run frequency of outcomes of repeated events.
Also doesn't consider prior beliefs.

== A Formal Basis for Probability Theory

- Bounded by 0 and 1
- Unitary $sum_x P(x) = 1$
- Sum rule $P(A or B) = P(A) + P(B) - P(A and B)$
- Conditional probability (probability of A given B) $P(A bar.v B) = P(A and B)/P(B)$


== Random Variables and Distributions

=== Discrete and continuous

*Discrete variables*: The distribution of a discrete random variable is described with a *probability mass function* (PMF) which gives each outcome a specific value.

*Continuous variables*: The distribution of a continuous variable has a *probability density function* (PDF) which specifies the spread of the probability over outcomes as a continuous function.
It is not the case that $P(X = x) = f_X(x)$ for PDFs.

*Integration to unity*

$sum_x P(x) = 1$

$integral_(x) f_X(x) "dx" = 1$

== Expectation

If a random variable takes on numerical values, then we can define the expectation or expected value as:

$ E[X] = sum_x x · P(x) $
for a discrete random variable, and
$ E[X] = integral_(x) x · f(x) "dx" $
for a continuous random variable.

=== Expectation and means

*Variance*: A measure of the spread of a random variable's values. For a random variable $X$ with expected value $E[X]$, the variance is defined as:
$"Var"(X) = E[(X - E[X])^2]$

*Expectations of functions of X*

$ E[g(X)] = sum_x g(x) · P(x) $
$ E[g(X)] = integral_(x) g(x) · f(x) "dx" $

=== Samples and sampling

*Samples* are observed outcomes of an experiment; we will use the term observations synonymously, though samples usually refer to
simulations and observations to concrete real data.

We can *sample* from a distribution; this means simulating outcomes according to the probability distribution of those variables.

The *empirical distribution* of a sample is the probability distribution that would be expected if we were to repeat the experiment many times.

For discrete random variables, we can always compuite the empirical distribution from a series of observations.

$P(X = x) = n_x/N$

where $n_x$ is the number of time outcome $x$ was observerd and $N$ is the total number of observations.


*Joint Probability*: The probability of two events occurring together. For events $A$ and $B$, the joint probability is:
$P(A, B) = P(A) and P(B)$

*Marginal Probability*: The probability of an event occurring, ignoring any other events. For event $A$, the marginal probability is:
$P(A) = sum_B P(A, B)$,
$P(A) = integral_B P(A, B) "dB"$

*Marginalisation* just means integration over one or more variables from a joint distribution: it removes those variables from the distribution.

Two random variables are *independent* if the probability of one is not affected by the probability of the other.
$P(A, B) = P(A) · P(B)$

*Conditional Probability*: The probability of an event given that another event has occurred. For events $A$ and $B$, the conditional probability of $A$ given $B$ is:
$P(A|B) = (P(A, B))/(P(B))$

=== Bigrams

A *bigram model* estimates the liklihood of a word given the previous word.

The joint distribution of bigrams $P(C_i = c_i, C_(i-1) = c_(i-1))$ is given by the normalized count of each character pair.

The marginal distribution of $P(C_i = c_i)$ can be computed from the joint distribution by marginalisation.

$P(C_i = c_i) = sum_(c_(i-1)) P(C_i = c_i, C_(i-1) = c_(i-1))$


=== Odds

The ratio of the probability of an event occurring to the probability of it not occurring. For event $A$, the odds are:
$"odds"(A) = (P(A))/(1 - P(A))$.
*Log-odds* are particularly useful for very unlikely scenarios. $log("odds"(A)) = log(P(A)/(1 - P(A)))$

== Bayes' Rule

*Bayes' Theorem*: A fundamental theorem in probability that describes how to update the probabilities of hypotheses when given evidence. The theorem is stated as:
$P(A|B) = (P(B|A) · P(A))/(P(B))$.

- *Posterior*: What we want to know after computation $P(A|B)$
- *Likelihood*: Probability of evidence given the event $P(B|A)$
- *Prior*: Probability of event before evidence $P(A)$
- *Evidence*: Probability of evidence occurring $P(B)$

== Integration over the evidence

$P(A) = integral P(A|B) · P(B) "dB"$,
$P(A) = sum_B P(A|B) · P(B)$

$P("Test") = P("Test" | "not Plague") P("not Plague") + P("Test" | "Plague") P("Plague")$
$P(H = 1|D) = (P(D|H = 1)P(H = 1))/(P(D|H = 1)P(H = 1) + P(D|H = 0)P(H = 0))$


== Entropy
A key property of a probability distribution is the *entropy*. Intuitively, this is a meausre of the "surprise" an observer would have
when obsersving draws from the distribution, or altrenatively the measure of number of distinct "states" a distribution can take.


#pagebreak()

// #######################################################################################################################################################

= Probability 2 #text(size: 10pt, gray)[Week 9]

== Monte Carlo

It is a way of approximating the expected value of a random variable by sampling from it.

*Problems of Continuous Random Variables*:
Probability of an exact value is 0.
Unlike with discrete variables, you can't estimate the probability density function (PDF) from simple counts,
since each observation has no width and doesn't "fill in" the distribution.
Bayes' Rule is easy to apply to discrete problems but not continuous

The *support* of a PDF is the domain it maps from where the density is non-zero.

- *infinite support* -infinity to infinity
- *compact support* finite range
- *semi-infinite support* -infinity to a finite value or a finite value to infinity


The *cumulative distribution function* (CDF) is the integral of the PDF.

$F_X(x) = P(X lt.eq x) = integral_(-infinity)^x f_X "dx"$

*Normal Distribution* is a continuous probability distribution that is symmetric and bell-shaped.
It is defined by its mean and standard deviation, and is given by the formula:
$f(x) = 1/(sigma sqrt(2pi)) e^(-((x-mu)^2)/(2sigma^2))$

where $mu$ is the mean and $sigma$ is the standard deviation.

*Multivariate Distributions* generalise discrete variables to continuous spaces via probability density functions.

The *multivariate uniform distribution* is particularly simple to understand, it assigns equal density to all points in a region of a space.

=== Transformed uniform distribution

If we want to define a distribution over any box, we can simpley transform the random uniform unit vercors with a matrix A and shift
by adding an offset $b$.

$X = A z + b$

where $z$ is a vector of random uniform variables.



=== Normal Distribution

We previously saw the idea of a *mean vector* $mu$ and a *covariance matrix* $Sigma$ for a multivariate normal distribution.
A multivariate normal is fully specified by these two parameters. $X ~ N(mu, Sigma)$

We can sample n times from a unit normal distribution in each dimension then transform the sample back using $Sigma$ and $mu$.

$x = Sigma^(-1/2)z + mu$ where $z ~ N(0, I)$




== Inference

*Inferenctial statistics* is concerned with estimating the properties of an unobserved "global" population of values from a limited
set of observed samples.
*Inference* is the process of determining parameters of the function generating data by looking at the aftermath.
Different approaches are direct estimation: define functions of observations that will estimate the values of parameters
of distributions directly.

*Direct estimation* of parameters, where we define functions of observations that will estimate the values of parameters of distributions directly.
This requires we assume the form of the distribution governing the data. It is very efficient, but only works for very particular distributions.

*Maximum Likelihood Estimation* of parameters, where we use optimisation to find parameter settings that make the observations appear as likely as possible.
We can see this as tweaking the parameters of some predefined module until it best matches the observations.

*Bayesian Inference* approaches explicitly encode belief about the behaviour of the mysterious entity using probability distributions.
In Bayesian models, we assume a distribution over the parameters themselves, and consider the parameters to be random variables.

*Population*: The complete set of individuals or items of interest.
*Parameters*: Numerical characteristics of the population.
*Statistics*: Functions of the sample data used to estimate parameters.
*Sample*: A subset of the population used to make inferences.

*Parameter Estimation*: Using sample data to estimate population parameters.

*Estimators*: Functions of the sample data used to estimate parameters.

== Linear Regression

Linear regression is the fitting of a line to observed data. It assumes the musterisous entyt generates data where one of the observed variables is scaled
and shifted version of anothert observed varible.

$ y = m x + c $

where $m$ is the slope and $c$ is the intercept.

We assume that we will fit a line to noisy data. That is the proess that we assume that is generating the data is:

$ y = m x + c + epsilon $

where $epsilon$ is noise. Our simple assumption is that

$ epsilon ~ N(0, sigma^2) $

or equivalently, putting the $m x + c$ in the exponent,

$ y ~ N(m x + c, sigma^2) $

```python
m, c, sigma = theta
y = np.random.normal(x * m + c, sigma)
```

Our problem is: given just the inputs $x$ and outputs $y$, what are the values of the other argument $theta$? This is *inference*.

== Direct Estimation

For many continuous distributions statisticians have developed estimators; functions that can be applied to sets of observations to
estimate the most likely parameters of a probability density function defining a distribution that might have generated them.

=== Standard Estimators

*Mean*: The arithmetic mean is sum of sample values divided by the number of samples.

*Sample Mean*. The population mean is $mu = E[X]$ for a random variable $X$. It turns out the arithmetic mean of the observed samples or sample mean,
which we write with a little hat $hat(mu)$ is a good estimator of the true popuilation mean $mu$.
The sample mean $hat(mu)$ is just the aruthmetic average of samples we have seen.

*Variance and Standard Deviation*. The sample variance is the squared difference of eahc value of a sequence from the mean of that sequence,

$ sigma^2 = 1/(N) sum_(i=1)^N (x_i - hat(mu))^2 $

It is an estimator of the population variance $sigma^2 = E[(X - mu)^2]$.

The sample standard deviation is the square root of the sample variance.

$ hat(sigma) = sqrt(hat(sigma)^2) $

The variance and the standard deviation emausre the spread of a collection of values. The *covariance matrix* $Sigma$ generalises this idea to
higher dimensions.

$ hat(Sigma) = 1/(N) sum_(i=1)^N (x_i - hat(mu))(x_i - hat(mu))^T $

*Linear regression via direct estimation*

We can fnd a closed form solution to this problem, without doing any
iterative optimisation. This is because we have an estimator that gives us
an estimate of the parameters of the line fit directly from observations.
We already know how to directly solve least squares problems: use the
pseudo-inverse of the matrix $X$ to solve the linear system $X theta = y$.

```python
A = np.stack([line_x ** 0, line_x ** 1]).T
A_plus = np.linalg.pinv(A)
theta = A_plus @ line_y
c, m = theta
# compute std. dev. of "residual" left over error
sigma = np.std(line_y - (m*line_x+c))
print(m, c, sigma)
```


=== Direct Estimation Summary

- We wish to infer population parameters from a sample of observations.
- We have known functions that take observations and return estimates of these parameters.
- These functions are called estimators.
- We can use these estimators to fit models to data, and to make predictions about new data.
- We can use these estimators to generate samples from our model, and to assess the quality of our model.





*Maximum Likelihood Estimation Algorithm*:
When no closed-form solution exists for parameter estimation, we use optimization to find the parameters that maximize the likelihood of the observed data.
The likelihood function $L(θ|x)$ depends on the distribution parameters $θ$.
To perform the optimization, we convert this to a negative log-likelihood function where $θ^* = arg min_θ L(θ)$ and $L(θ) = -log L(θ|x_1,...,x_n) = -sum_i log f_X(x_i;θ)$.
For mixture models such as Gaussian mixtures, the probability density function (PDF) is a weighted combination of N normal distributions.
The PDF is given by $f_X(x) = sum_i λ_i n_X(x;μ_i,σ_i)$ where the weights $λ_i$ sum to 1.
When fitting these mixtures, we compute the likelihood for each observation by summing the weighted PDFs from each component of the mixture.

*Bayesian Inference* involves inferring a distribution over possible parameter settings that are compatible with the data, rather than seeking the most likely parameter setting.
It works by inferring a posterior distribution using Bayes' Rule: $P(θ|D) = (P(D|θ)P(θ))/(P(D))$.
Here, $P(D)$ is the prior belief, $P(θ)$ is the evidence, and $P(D|θ)$ is the likelihood function.
The posterior distribution $P(θ|D)$ needs to be computed for a distribution over $θ$, not just specific values.
The normalizing constant $P(D) = integral_θ P(D|θ)P(θ)$ is often intractable to compute directly.
To make Bayesian inference tractable, we can use sampling methods or work with relative probabilities only, where $P(θ|D) ∝ P(D|θ)P(θ)$.
Bayesian inference can be applied to both continuous and discrete distributions.
However, closed-form computations are typically much more challenging for continuous distributions.

*Markov Chain Monte Carlo (MCMC)* samples from difficult probability distributions via random walks in parameter space. It accepts changes that improve likelihood, sometimes accepting worse changes with probability proportional to the likelihood change.
MCMC's key advantage is working with relative probabilities, avoiding normalization constants and complex integrals. It only needs prior and likelihood evaluation for any parameter setting, enabling sampling from any evaluable distribution.
MCMC enables direct model inference without complex approximations or analytical solutions, working purely algorithmically.
However, MCMC has limitations. While asymptotically correct, sampling strategy choice significantly impacts practical performance. Bayesian inference should depend only on priors and evidence, but MCMC results also depend on the sampling strategy.

*Metropolis-Hastings Algorithm*:
The Metropolis-Hastings algorithm is a MCMC method that uses a proposal distribution to generate candidate samples.
It accepts moves that increase the likelihood, and sometimes accepts moves that decrease likelihood with probability
proportional to the likelihood ratio.

*Posterior Distribution*:
The posterior distribution is the distribution of the parameters given the data.

*Predictive Distribution*:
The predictive distribution is the distribution of the data given the parameters.

// #######################################################################################################################################################

= Digital Signals and Time Series #text(size: 10pt, gray)[Week 10]

*Sampling* is the process of taking measurements of a continuous signal at discrete points in time.
*Quantisation* means to force something to a discrete set of values.

*Amplitude Quantisation* is the process of converting a continuous amplitude into a discrete set of values.

*Sampling Rate*: how frequently we have sampled the original data.
*Nyquist Limit*: the maximum frequency that can be represented in a signal without aliasing.
Usually
$ f_n = f_s/2 $
 where $f_s$ is the sampling rate.

*Aliasing* is the phenomenon where high frequencies are misinterpreted as lower frequencies.

*Noise* is unwanted information in a signal.
*Signal-to-Noise Ratio (SNR)* is the ratio of the power of the signal to the power of the noise.

*Filtering* takes advantage of the fact that we we have temporal structure.
Real signals cannot have arbitrary changes.

== Moving Average

A moving average equation is:
$ y[t] = 1/K sum_(i=0)^(K-1) x[t + i - K/2] $

== Sliding Window

This idea of a sliding window is critical in digital signal processing. A
sliding window takes a sampled signal of unbounded length, and reduces
it to a collection of fixed length vectors. We break the signal up into
exactly equally spaced chunks or windows, of a common length . We
can then process these as an $N x K$ data matrix: $N$ windows of $K$ samples.
If we have vector valued measurements, like stereo audio, we would have a $N x K x C$ tensor;
$N$ windows of $K$ samples from $C$ channels.

*Median Filtering* is a non-linear filtering technique that replaces each pixel with the median value of the pixels in a neighborhood.

*Linear Filtering* is a filtering technique that uses a linear combination of the pixels in a neighborhood to produce a new pixel.

=== Convolution

This process of taking weighted sums of neighbouring values is called *convolution*. It is a hugely important operation on signals.

$f * g$ is the convolution of $f$ and $g$. Convolution is defined for continous functions.

For two samples signal vectors $x$ and $y$, of length $N$ and $M$ respectively, the convolution is defined as:

$ (x * y)[n] = sum_(m=-M)^M x[n - m]y[m] $

This is convolution of samples signals.

Convolution is a very powerful operator for sampled data. It is extremely
general, and effects like blurring and sharpening images, filtering audio
and many forms of processing scientific data all boil down to applications
of convolution. It is as important for signals as multiplication is for
matrices.

convolution of any function with the delta function does not change
the original function:

$ f * delta = f $

*Smoothing* is a type of convolution that uses a Gaussian kernel to blur the image.


== Frequency Domain
We can view signals in two ways:
- as a sequence of amplitude measurements over time: *the time domain*
- as a sum of oscillations with different frequencies: *the frequency domain*

The Fourier Transform is a mathematical operation that decomposes a signal into its constituent frequencies.

Convolution is the process of taking weighted sums of neighbouring values.
The Fourier Transform can be used to predict the behaviour of convolutions.

A pure oscillation is represented by a sine wave:
$x(t) = A sin("2πω" t + θ)$
where $ω$ represents the frequency, $θ$ represents the phase (time offset), and $A$ represents the magnitude.

=== Fourier Transform

*Sine wave decomposition*

The Fourier Transform decomposes any repeating continuous function into sine waves. It expresses signals as a sum of sinusoidal functions:
$ x(t) = sum_i A_i sin(omega_i 2pi t + theta_i) $

=== Correlation

The correlation between signals is calculated as:
$ c = sum_t a[t]b[t] $
When signals are unrelated, $c$ is approximately 0. For similar signals, $c$ is large and positive, while for inverse signals, $c$ is large and negative.

The phase can be calculated using:
$ theta = tan^(-1)((c(omega))/(c'(omega))) $

to get the magnutude ignoring the phase, we can compute the L2 norm:

$ A = sqrt(c(omega)^2 + c'(omega)^2) $

*Fourier transform equation*

The Fourier transform allows us to write any (periodic) function as
an (infinite) sum of sinusoids; simple waves with distinct frequencies,
amplitudes and phases.
The Fourier transform is formally defined as:
$ hat(f)(omega) = integral_(-infinity)^infinity f(x)e^(-2 pi x i omega)"dx" $

It gives a complex value $hat(f)(omega)$ for each frequency $omega$.
Using Euler's formula, we can split this into a real and imaginary part:

$ e^(-2 pi x i omega) = cos(-2 pi x omega) + i sin(-2 pi x omega) $

For real signals, we only need to consider the real part of the complex output.

== Implementing the DFT

*Linearity of the DFT*

The DFT is a linear operation. We can see it as constructing a matrix $D_f$ which the jth row being $e^(-2 pi x i omega_j)$.
And multiplying this matrix by the vector $x$.

$ f(omega) = D_f x[t] $

*Discrete Fourier Transform (DFT)*

The Discrete Fourier Transform works on discrete measurements. It has complex components representing phase and magnitude. The frequency is calculated as $"freq" = (f_N k)/N$. In terms of computational complexity, the DFT requires $O(N^2)$ operations, while the Fast Fourier Transform (FFT) requires only $O(N log N)$ operations when N is a power of 2.


*Filter Types*

There are several types of filters. A lowpass filter reduces high frequencies, while a highpass filter reduces low frequencies. A bandpass filter reduces frequencies outside a specific band, and a notch/bandstop filter reduces frequencies inside a band.

*Median filter* is not a linear filter.

Linear filters can only modify existing frequencies, not introduce new ones.

== Fast Fourier Transform (FFT)

The DFT is very expensive to compute with lots of expenseive point operations like exponentation. Luckily, there is a much faster
algortithm, which uses divide-and-conquer to speed up the operation. This is the Fast Fourier Transform (FFT). It runs in $O(N log N)$ time.

*Convolution Theorem*

There is a very important property of convolutions which explains why we
took this tangent through the Fourier transform.

The convolution theorem states that the Fourier transform of the
convolution of two signals is equal to the (elementwise-)product of the
Fourier transform of two signals.

Writing $"FT"$ to mean the Fourier transform of and $"IFT"$ to mean the inverse Fourier transform of :

$ "FT"(f(x) * g(x)) = "FT"(f(x))"FT"(g(x)) $

This means we can compiute the convolution by taking products in the frequency/spacial domain, and then transforming back to the
time or spatial domain.

$ f(x) * g(x) = "IFT"("FT"(f(x))"FT"(g(x))) $











