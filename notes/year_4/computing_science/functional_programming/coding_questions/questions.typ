#set document(title: "Functional Programming - Coding Questions")
#set page(margin: 20pt)
#set heading(numbering: "1.")

#align(center)[
  #text(20pt, weight: "bold")[Functional Programming]\
  #text(14pt)[Coding Questions]
]

#outline(title: none)

#pagebreak()

= Basics: Expressions, Functions, Tuples

== Q1. Double

Write a function `double :: Int -> Int` that doubles an integer.

== Q2. Hello

Write a function `greet :: String -> String` that takes a name and returns `"Hello, <name>!"`.

== Q3. Swap

Write a function `swap :: (a, b) -> (b, a)` that swaps the elements of a pair.

== Q4. Distance

Write a function `dist :: (Double, Double) -> (Double, Double) -> Double` that computes the Euclidean distance between two 2D points.

== Q5. Currying

Rewrite the function below in curried form:

```hs
add :: (Int, Int) -> Int
add (x, y) = x + y
```

== Q6. Partial Application

Using your curried `add`, define `addTen :: Int -> Int` by partially applying `add`.

#pagebreak()

= Lists, Comprehensions, Guards

== Q7. Sum of Squares

Using a list comprehension, write `sumSquares :: Int -> Int` that returns the sum of squares of integers from `1` to `n`.

== Q8. Pythagorean Triples

Using a list comprehension, write `pyths :: Int -> [(Int, Int, Int)]` that returns all Pythagorean triples `(a, b, c)` with `a, b, c <= n` and $a^2 + b^2 = c^2$.

== Q9. Grade

Write `grade :: Int -> String` that returns:
- `"A"` if mark $>= 70$
- `"B"` if mark $>= 60$
- `"C"` if mark $>= 50$
- `"D"` if mark $>= 40$
- `"F"` otherwise

Use guards.

== Q10. Roots of a Quadratic

Using a `where` binding, write `roots :: Double -> Double -> Double -> [Double]` that returns the real roots of $a x^2 + b x + c = 0$. Return `[]` if there are no real roots.

#pagebreak()

= Recursion and Pattern Matching

== Q11. Length

Write `myLength :: [a] -> Int` from scratch using recursion.

== Q12. Reverse

Write `myReverse :: [a] -> [a]` from scratch using recursion.

== Q13. Take and Drop

Write `myTake :: Int -> [a] -> [a]` and `myDrop :: Int -> [a] -> [a]` from scratch.

== Q14. Safe Head

Write `safeHead :: [a] -> Maybe a` that returns `Nothing` for the empty list and `Just x` otherwise.

== Q15. Tail-Recursive Sum

Write `sumTR :: [Int] -> Int` using a tail-recursive accumulator.

#pagebreak()

= Algebraic Data Types

== Q16. Days

Define a sum type `Day` with constructors for the seven days of the week. Derive `Show` and `Eq`.

== Q17. Shape

Define an ADT `Shape` with constructors `Circle Double`, `Rectangle Double Double`, and `Triangle Double Double Double`. Write `area :: Shape -> Double`. (Use Heron's formula for triangle area.)

== Q18. Binary Tree

Define a parameterised binary tree:

```hs
data Tree a = Leaf | Node a (Tree a) (Tree a)
```

Write `size :: Tree a -> Int` and `depth :: Tree a -> Int`.

== Q19. In-Order Flatten

Write `flatten :: Tree a -> [a]` that returns the elements of the tree by in-order traversal.

== Q20. Insert into BST

Write `insert :: Ord a => a -> Tree a -> Tree a` that inserts an element into a binary search tree.

#pagebreak()

= Higher-Order Functions

== Q21. Implement `myMap`

Write `myMap :: (a -> b) -> [a] -> [b]` from scratch.

== Q22. Implement `myFilter`

Write `myFilter :: (a -> Bool) -> [a] -> [a]` from scratch.

== Q23. Implement `myFoldr` and `myFoldl`

Give the type signatures and implementations of both folds from scratch.

== Q24. Sum and Product via Folds

Define `sum'` and `product'` using `foldr`.

== Q25. Reverse via Fold

Implement `reverse'` using `foldl`.

== Q26. Compose a List of Functions

Write `composeAll :: [(a -> a)] -> (a -> a)` that composes a list of functions left-to-right (so `composeAll [f, g, h] x = f (g (h x))`).

#pagebreak()

= Sorting and More Recursion

== Q27. Quicksort

Write a one-line(ish) `qsort :: Ord a => [a] -> [a]` using list comprehensions.

== Q28. Merge Sort

Write `merge :: Ord a => [a] -> [a] -> [a]` and `mergeSort :: Ord a => [a] -> [a]`.

== Q29. Run-Length Encoding

Write `rle :: Eq a => [a] -> [(a, Int)]` that converts a list into pairs of (element, count). Example: `rle "aaabbc" == [('a', 3), ('b', 2), ('c', 1)]`.

#pagebreak()

= Typeclasses and Polymorphism

== Q30. Show for Shape

Make the `Shape` type from Q17 an instance of `Show` (manually, not derived) producing strings like `"Circle 3.0"` or `"Rectangle 2.0 3.0"`.

== Q31. Eq for Tree

Make `Tree a` (Q18) an instance of `Eq` (assuming `a` is `Eq`), without using `deriving`.

== Q32. Custom Typeclass

Define a typeclass `Container f` with method `empty :: f a` and `insert :: a -> f a -> f a`. Make `[]` an instance of `Container`.

#pagebreak()

= IO

== Q33. Echo

Write `echo :: IO ()` that reads a line and prints it back.

== Q34. Sum N Numbers

Write `sumN :: Int -> IO Int` that reads `n` lines from stdin, parses each as an integer, and returns the sum.

== Q35. Counter with `IORef`

Write a program that uses an `IORef Int` to count the number of non-empty lines from stdin until EOF, then prints the count.

#pagebreak()

= Monads, do-notation, Laws

== Q36. Maybe Bind

Implement `(>>=)` for `Maybe` from scratch. Then rewrite the following function once with `do`-notation and once using `>>=` directly:

```hs
addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
```
which adds two `Maybe Int` values, propagating `Nothing`.

== Q37. List Bind

Use the list monad / list comprehension to compute all `(x, y)` with `x <- [1..3]`, `y <- [1..3]`, `x /= y`.

== Q38. Monad Laws (Maybe)

Show, on paper or in a comment, that the `Maybe` monad satisfies the three monad laws (left identity, right identity, associativity) for `f x = Just (x + 1)`.

#pagebreak()

= Reader, Writer, State

== Q39. Reader

Using the `Reader` monad with environment of type `Int`, write a computation that returns `env * 2 + 1`.

== Q40. Writer

Using the `Writer [String]` monad, write `logFact :: Int -> Writer [String] Int` that computes factorial and logs each multiplication.

== Q41. State Counter

Using the `State Int` monad, write `tick :: State Int Int` that increments the state and returns the new value. Then write a computation that runs `tick` three times and returns the resulting list.

== Q42. Stateful Stack

Using the `State [a]` monad, write `push :: a -> State [a] ()` and `pop :: State [a] (Maybe a)`.

#pagebreak()

= Semigroups, Monoids, Functors, Applicatives

== Q43. Sum Monoid

Define a `newtype Sum = Sum { getSum :: Int }` and make it an instance of `Semigroup` and `Monoid`.

== Q44. Functor for Tree

Make `Tree` (Q18) an instance of `Functor`.

== Q45. Applicative for Maybe

Implement `pure` and `<*>` for `Maybe` from scratch (without `deriving`).

== Q46. Applicative Style

Using `<$>` and `<*>`, rewrite this code in applicative style:

```hs
addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes mx my = do
  x <- mx
  y <- my
  return (x + y)
```

#pagebreak()

= Error Handling

== Q47. Either-Based Division

Write `safeDiv :: Int -> Int -> Either String Int` that returns `Left "div by zero"` for zero divisor.

== Q48. Sequence Either

Write `sequenceE :: [Either e a] -> Either e [a]` that returns the first `Left`, or `Right` of the collected values.

== Q49. Catch IO

Write `safeRead :: FilePath -> IO (Either IOError String)` that reads a file's contents and returns either the contents or the IO error.

#pagebreak()

= Parser Combinators (Parsec-style)

For these questions, assume `Text.Parsec` is imported. You can use `char`, `digit`, `many`, `many1`, `<|>`, `string`, `spaces`, etc.

== Q50. Number Parser

Write a parser `number :: Parser Int` that parses a non-negative integer.

== Q51. Bracketed Number

Write a parser that parses `[n]` for any integer `n` and returns `n`.

== Q52. CSV of Ints

Write a parser for a comma-separated list of integers, returning `[Int]`.

== Q53. Arithmetic Expression Parser

Write a parser for arithmetic expressions over integers with `+`, `-`, `*`, `/`, parentheses, and respecting standard precedence and left-associativity. Evaluate it to an `Int`.

#pagebreak()

= Monad Transformers

== Q54. MaybeT IO

Using `MaybeT IO`, write a program that reads two lines, parses each as an `Int`, and returns their sum, exiting early with `Nothing` if either parse fails.

== Q55. StateT IO

Using `StateT Int IO`, write a program that prompts the user repeatedly for numbers, accumulating their sum in the state, and stops when the user enters an empty line. Print the final sum.

#pagebreak()

= Lambda Calculus and Equational Reasoning

== Q56. Beta Reduce

Reduce the following expression to normal form by hand:

$ (lambda x. lambda y. x + y) thin 3 thin 5 $

== Q57. Church Encoding

In Haskell, encode the Church numerals `zero`, `one`, `two` as functions of type `forall a. (a -> a) -> a -> a`. Write `succ'` and a function `toInt :: ((Int -> Int) -> Int -> Int) -> Int`.

== Q58. Equational Proof

Prove (by equational reasoning, in comments or pseudo-code) that `map (f . g) = map f . map g` using the definition of `map`:

```hs
map _ []     = []
map f (x:xs) = f x : map f xs
```

#pagebreak()

= Putting It All Together

== Q59. Mini Interpreter

Define an AST for arithmetic expressions:

```hs
data Expr = Num Int
          | Var String
          | Add Expr Expr
          | Mul Expr Expr
          | Let String Expr Expr   -- let x = e1 in e2
```

Write `eval :: Expr -> Either String Int` using a `Reader` (or plain `Map String Int`) for the environment, returning `Left` for unbound variables.

== Q60. Property-Based Tests with QuickCheck

Write QuickCheck properties stating:

+ For all lists `xs`, `reverse (reverse xs) == xs`.
+ For all lists `xs`, `length (myMap f xs) == length xs`.
+ For your `mergeSort`, the output is sorted and is a permutation of the input.
