#set document(title: "Functional Programming")
#set page(margin: 20pt)

#outline(title: none)

#pagebreak()

= Introduction and Expressions

In functional programming, functions are first-class citizens.

Imperative languages (e.g., Java, Python) describe a sequence of steps to compute a result.

Functional languages describe how to reduce an expression to a value.

A *statement* is an instruction / computation step, it doesn't return anything.

A *expression* is a term in the language that eventually reduces to a value. It can be contained within a statement or another expression.

In a functional language, everything is an expression.

Haskell is statically typed: type errors are caught before a program is run.

Haskell can infer a type for most expressions, but it is good practice to add in a type signature for top-level functions.

*Evaluation in Imperitive vs Functional Languages*

Imperative languages we have program counter, call stack, state.
We record our current position in the program.
Statements can alter that position.
Variable assignments alter some store.

*Reduction*

Key point: Reduction takes an expression and eventually produces a value.

Church-Rosser: evaluation can be in any order
- In the context of abstract rewriting systems, reduction is confluent
- Useful for equational reasoning and functional parallelism

= Functions and Lists

== Tuples

```hs
(1, 2, "hello") :: (Int, Int, String)
(1.0, 1) :: (Float, Int)
() :: ()
```

We can deconstruct a pair by using the `fst` and `snd` functions.

```hs
fst (1, 2) -> 1
snd (1, 2) -> 2
```

We can also deconstruct by pattern matching.

```hs
let (x, y) = (1, 2) in x + y -> 3
```

== Functions

Below are examples of anonymous functions in Haskell:

```hs
\name -> "Hello, " ++ name
\n -> n + 5

(\name -> "Hello, " ++ name) "Matthew"
(\n -> n + 5) 10
```

In Haskell functions map one value to another. If we want to pass multiple arguments, we could use a tuple.

We can also use *currying* to create functions that take multiple arguments.

```hs
add :: Int -> Int -> Int
add x y = x + y

add 1 2 -> 3
```

Function application binds tightest left to right.

An advantage of currying is partial application.

```
addOne = add 1
addOne 2 -> 3
```

== Equations

An equation gives meaning to a name.

```
myNumber = 5
add = \x -> \y -> x + y
```

*Function Composition*

Function composition is used to write code in point-free style, which tries to avoid introducing variable names where possible

```hs
(.) :: (b -> c) -> (a -> b) -> (a -> c)
f (.) g = \x -> f(g(x))
```

*Parenthesis*

Parenthesis are required around negative numbers to disambiguate between subtraction.

*Reassignment*

In Haskell, variables are immutable. To change a value, we need to create a new variable.

```
let x = 5
let y = x + 1
```

If we have:

```
x = 1
x = x + 1
```

Haskell will try to define x as the successor of x, it will try to calculate it.

== Type Variables

Polymorphic functions have type variables to stand for types.

```
length' :: [a] -> Int
length' []     = 0
length' (_:xs) = 1 + length' xs
```

== Lists

A list is an ordered sequence of values of the same type

```hs
[1, 2, 3] :: [Int]
```

Haskell supports a concise notation for creating ordered lists.

```hs
[1..10]
['a'..'z']
[1..]
```

These are lazily constructed.

=== List Comprehensions

List comprehensions are a concise way to create lists.

```hs
doubleEvens = [x * 2 | x <- [1..], x `mod` 2 == 0]
```

=== Accessing Lists

List indexing, head, tail all potentially undefined.

```hs
head :: [a] -> a
tail :: [a] -> [a]
(!!) :: [a] -> Int -> a
```

=== Zipping Lists

script zip (length of the shortest list).

```hs
zip :: [a] -> [b] -> [(a, b)]

x = [1, 2, 3]
y = ["One", "Two", "Three"]
zip x y
```

Zipping with a function

```hs
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]

x = [1, 2, 3]
y = ["One", "Two", "Three"]
zipWith (+) x y
```

== Writing functions

Let bindings:

```hs
roots a b c =
    let
        det2 = b * b – 4 * a * c
        det = sqrt det2
        rootp = (-b + det)/ a / 2
        rootm = (-b - det)/ a / 2
    in
        [rootm, rootp]
```

Equivalenty:

```hs
roots a b c =
    let det2 = b * b – 4 * a * c in
    let det = sqrt det2 in
    let rootp = (-b + det)/ a / 2 in
    let rootm = (-b - det)/ a / 2 in
    [rootm, rootp]
```

Where bindings:

```hs
roots a b c = [rootm, rootp]
    where
        det2 = b * b – 4 * a * c
        det = sqrt det2
        rootp = (-b + det)/ a / 2
        rootm = (-b - det)/ a / 2
```

== Guards

```hs
gradeFromGPA :: Int -> String
gradeFromGPA gpa
    | gpa >= 18 = "A"
    | gpa >= 15 = "B"
    | gpa >= 12 = "C"
    | otherwise = "below C"
```
