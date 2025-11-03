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

*Evaluation in Imperative vs Functional Languages*

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

#pagebreak()

= Recursion and Algebraic Datatypes

== Pattern matching

Case expression:

```hs
case list of
    [] -> "empty"
    [x] -> "one element"
    _ -> "more elements"
```

Pattern matching can also be done in function definitions

```hs
empty :: [a] -> Bool
empty [] = True
empty _ = False
```

== How are lists defined?

Lists are inductively-defined data structures

```hs
[] :: [a]
(:) :: a -> [a] -> [a]
```

== Tail Recursion

Haskell uses tail call optimisation.

All tail calls (where a call is the last part of an expression) can be implemented using constant stack space, since we stay in the same place in the stack.

== Mutual Recursion

Mutially recursive functions are functions that call each other.

Haskell allows us to do this since all other definitions are in scope

== Algebraic Datatypes

=== Sum Types

We can define `sum` types, it is like an enum.

Data constructors are a different way of creating values of this type (Spring, Summer, Autumn, Winter)

```hs
data Season = Spring | Summer | Autumn | Winter deriving (Show)
```

=== Product Types

Product types are like tuples, but with named fields.

Here, `Product` is the data constructor.

```hs
data Product = Product Int String
```

```hs
data Suit = Hearts | Diamonds | Clubs | Spades

data Card = King Suit | Queen Suit | Jack Suit | Ace Suit | Number Suit Int
```

We can pattern match on `sum` types.

We need brackets around compound values.

```hs
showCard :: Card -> String
showCard (King _) = "K"
showCard (Queen _) = "Q"
showCard (Number _ n) = (show n)
```

=== Recursive Types

```hs
data Tree = Leaf | Node Int Tree Tree
```

=== Parameterised Types

We can *parameterise* a data type by putting a type variable on the left hand side of the data declaration.

```hs
data BinaryTree a = Leaf | Node a (BinaryTree a) (BinaryTree a)
```

*Example: Inverting a binary tree*

```hs
invert :: BinaryTree a -> BinaryTree a
invert Leaf = Leaf
invert (Node x l r) = Node x (invert r) (invert l)
```

=== The Maybe Type

```hs
data Maybe a = Just a | Nothing

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x : _) = Just x
```

= Higher-Order Functions & Property-Based Testing

== Libraries

We can install libraries using `cabal` or `stack`.

```bash
cabal update
cabal install --lib library-name
```

== Higher-Order Functions

A higher-order function is a function which takes another function as an argument (`map` `filter`).

=== Folding

A fold is a way of reducing a list into a single value.

We have two types of folder, depending on the the associativity:

```hs
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl _ acc [] = acc
foldl f acc (x : xs) = foldl f (f acc x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f acc [] = acc
foldr f acc (x : xs) = f x (foldr f acc xs)
```

== Property-Based Testing

You specify some properties that should be true for that program, then run `QuickCheck` tool with your boolean predicates and it generates random inputs to test your program.

Program testing can be used to show the presence of bugs, but never show their absence.

This means passing property tests doesn't guarantee correctness, but failing tests do indicate a bug.

For testing the length function, we can define a property as `a list containing n elements has length n`.

```hs
let prop_len = \n -> (if n>=0 then length [1..n] == n else True)
```

Then we can run `quickCheck prop_len` to test the `length` function.

= Evaluation Strategies and Polymorphism

== Evaluation Strategies

Expressions are evaluated as a program runs. The order of expression evaluation depends on both the language semantics and the implementation pragmatics.

*Eager evaluation* also known as strict evaluation or call by value.

*Lazy evaluation* also known as non-strict evaluation or call by need.

== Polymorphism

In this case, polymorphism means we can operate over values from a variety of different types.

=== Parametric Polymorphism

Functions operate on the shape of the arguments rather than with the data, so we can operate on different types, and not care about the actual types.

For this we use type variables.

=== Ad-hoc Polymorphism

This is like method overriding, We have the same function but different implementations for different types.

This is about overloading (like using `@overload` in Python) functions.

In Haskell, this is achieved using typeclasses. A typeclass specifies a list of operations to be defined for a type.

// https://learnyouahaskell.com/making-our-own-types-and-typeclasses

```hs
class Show a where
    show :: a -> String
```

We can specify that an algebraic data type belongs to a typeclass in two different ways.
- `instance` declaration - here, we specify the implementations using default behaviour.
- `deriving` clause - this will implement the typeclass using default behaviour.

==== Instances

```hs
data Insect = Spider | Centipede | Ant

class Eq a where
    (==) :: a -> a -> Bool

class Show a where
    show :: a -> String

instance Eq Insect where
    Spider == Spider = True
    Centipede == Centipede = True
    Ant == Ant = True
    _ == _ = False

instance Show Insect where
    show Spider = "Spider"
    show Centipede = "Centipede"
    show Ant = "Ant"
```

==== Deriving

```hs
data Insect = Spider | Centipede | Ant
        deriving (Show, Eq)
```

The `deriving` clause provides us with default implementations for the appropriate functions, here `show` and `==` and `/=`.

This is possible because we can derive a string by using the data constructor, and declare two insects equal if they use the same data constructor.
If the data constructors had associated data, in order to support deriving, their types would need to support Show/Eq too.

*The Read Typeclass*

`read` allows us to convert String values into other values.

```hs
data Insect = Spider | Centipede | Ant
    deriving (Read, Show, Eq)

(read "Centipede") :: Insect
```

Note that we must give an explicit type annotation.

= Introduction to IO

== Purity

Function purity means that a function always returns the same value for the same input.
It also means that a function has no side effects.

Though, our code needs to do IO, but these are externally visible operations, so they are not pure.

=== IO Types

each side-effecting operation is marked with a type constructor `IO` type.

```hs
putStrLn :: String -> IO ()
```

*Mixing pure functions and IO*

A `String` is not the same thing as an `IO String`.

A `String` is data, an `IO String` is an `IO` action that produces a `String`.

```hs
getAndPrintReverse :: IO ()
getAndPrintReverse = do
    str <- getLine
    let revStr = reverse str
    putStrLn revStr
```

Within a ‘do’ block, the `<-` operator allows us to give a name (str) to the result of an IO operation. Here str has type String

```hs
getAndReverse :: IO String
getAndReverse = do
    str <- getLine
    let revStr = reverse str
    return revStr
```

Note that we have to use the return function return :: a -> IO a -- roughly (since revStr is of type String, and we need an IO String)

Every Haskell program has an entry point, `main`

```hs
main :: IO ()
main = do
    line <- getLine
    putStrLn (makeUpper line)
```

Instead, think of IO as though you are using do-notation to build a bigger computation by stringing together smaller IO computations, with main as your entry point.


=== Trace Debugging

That said, it is sometimes useful to do ‘print debugging’ where we wish to print some program state to the console

```hs
import Debug.Trace
trace :: String -> a -> a

trace "returning 42" 42
```

=== Pseudo-Random Number Generation

Random number generation might seem to be an impure operation.

In fact, a pseudo-random number generator generates a random value, and a new generator.

Only seeding the PRNG is impure, generation is pure.

=== Reference Cells

With IO we can make use of mutable reference cells that store some data, and its contents can be changed

```hs
newIORef :: a -> IO (IORef a)
-- Creates a new IO reference with an initial value of type a
readIORef :: IORef a -> IO a
-- Reads the content of an IORef
writeIORef :: IORef a -> a -> IO ()
-- Writes to an IORef
```

= Introduction to Monads

== Nondeterministic Computations

Sometimes we might want to have a computation that returns multiple possible results, we call this a nondeterministic computation.

One example is coin tosses, we want to get a list of all possible outcomes of two coin tosses.

```hs
withEach :: [a] -> (a -> [b]) -> [b]
withEach [] _ = []
withEach (x:xs) f = f x ++ (withEach xs f)

twoCoinTosses :: [(CoinToss, CoinToss)]
twoCoinTosses =
    coinToss `withEach` (\x ->
    coinToss `withEach` (\y ->
    [(x, y)]))

twoCoinTosses :: [(CoinToss, CoinToss)]
twoCoinTosses = [ (x, y) | x <- coinToss,
    y <- coinToss ]
```

== More on IO

So fare we've used do-notation to build up IO computations.

We can write them without do-notation though.

Take this previous example:

```hs
getAndPrintReverse :: IO ()
getAndPrintReverse = do
    str <- getLine
    let revStr = reverse str
    putStrLn revStr

getAndPrintReverse :: IO ()
getAndPrintReverse =
    getLine `withIOResult` (\str ->
    let revStr = reverse str in
    putStrLn revStr)
```

The implementation of `withIOResult` maps to a primitive and is handled by the runtime
system.

It runs the IO computation and applies the given function to the result.

== Monads

We have seen many patterns of functions that are of the form `a -> (a -> b) -> b`.

We can generalise the pattern we have seen so far.

To be a monad, a data type needs two things:
- A way of constructing a trivial computation from a value.
  - a -> Maybe a (we can use Just)
  - a -> [a] (we can use the singleton list constructor)
  - a -> IO a (it’s a library function, but it creates a pure computation without side
  effects)
- A way of building a larger computation from the result of a previous one.

The Monad type class is defined as:

```hs
class (Applicative m) => Monad m where
    return :: a -> m a
    (>>=) :: m a -> (a -> m b) -> m b
    (>>) :: m a -> m b -> m b
```

- `return` injects a pure value into the monad.
- `>>` (pronounced "sequence") runs but ignores first computation, returns result of second.
This is derivable from the definition of `>>=`:
- `>>=` (pronounced "bind") allows us to build up a computation. Takes a computation of type
`m a` and a function `a -> m b` to build a new computation `m b` and returns `m b`.

== do-notation

We introduced IO using do-notation to get across the intuition of building up IO computations.

Since IO is a monad, we can also write IO computations using explicit `>>=`:

```hs
greetReverse :: IO ()
greetReverse = do
    name <- getLine
    let reverseName = reverse name
    putStrLn “hello”
    putStrLn reverseName

-- Into

greetReverse :: IO ()
greetReverse =
    getLine >>= (\name ->
    let reverseName = reverse name in
    putStrLn “hello” >> putStrLn reverseName)
```

do-notation is syntactic sugar.

== do-Notation Summarized

The following table summarizes the translation between do-notation and monadic operations:

#table(
  columns: (auto, auto),
  inset: 10pt,
  align: (center, center),
  [*do-notation*], [*Monadic notation*],
  [`do x <- M
  N`], [`M >>= \x -> N`],
  [`do M
   N`], [`M >> N`],
  [`do let x = M
     N`], [`do let x = M in N`]
)

do-notation works for any data type that is a member of the monad typeclass.

#pagebreak()

= More Monads

== Other Monads

These three monads involve an environment, which we pass around, threading it from function context to function context. Typical use cases for each monad are as follows:
- Reader - shared environmental configuration
- Writer - logging operations
- State - computing a large value recursively

=== Reader Monad

Also known as the environment monad. It's useful for reading fixed values from a shared state environment, and for passing this shared state between multiple function calls in a sequence.

Here is a small example

```hs
import Control.Monad.Reader

hi = do
    name <- ask
    return ("hello " ++ name)

conversation = do
    start <- hi
    return (start ++ " ... ")

main = do
    putStrLn $ runReader conversation "jeremy"
```

The reader structure has two parameters, the environment type and the result type.

=== Writer Monad

The writer monad builds up a growing sequence of state, which can be used for logging operations or other purposes.

Here is a small example:

```hs
import Control.Monad.Writer

logMessage :: String -> Writer String ()
logMessage msg = tell $ msg ++ "\n"

main = do
    let log = runWriter $ do
            logMessage "Starting program"
            logMessage "Doing some work"
    putStrLn log
```

=== State Monad

The state monad is useful for computing a large value recursively, while maintaining a shared state between function calls.

Here is a small example:

```hs
import Control.Monad.State

factorial :: Int -> State Int Int
factorial n = do
    state <- get
    put (state + 1)
    if n == 0
        then return 1
        else do
            result <- factorial (n - 1)
            return (result * n)

main = do
    let (result, state) = runState factorial 0
    putStrLn $ "Result: " ++ show result ++ ", State: " ++ show state
```

== Semigroups

A semigroup is a set S with an associative binary operation.

There is a typeclass for this in haskell, but it does not and cannot enforce associativity.

```hs
class Semigroup m where
    (<>) :: m -> m -> m
```

=== Monoids

A monoid is a set S with an associative binary operation and an identity element.

There is a typeclass for this in haskell, but it does not and cannot enforce associativity or the existence of an identity element.

```hs
class Semigroup m => Monoid m where
    mempty :: m
    mappend :: m -> m -> m

    -- defining mconcat is optional, since it has the following default:
    mconcat :: [m] -> m
    mconcat = foldr mappend mempty
```

All instances of Monoid must satisfy the following laws:

```hs
-- left and right identity
x <> mempty == x
mempty <> x == x

-- Associativity
(x <> y) <> z == x <> (y <> z)
```

Writers also use monoids, when using the `tell` function, it accumulates via `mappend`.

Folders also use monoids, we can now see that we have a basic default value and accumulation function,
so we can now use the `fold` function:

```
fold :: (Foldable t, Monoid m) => t m -> m
foldMap :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
```

= Parser Combinators with Parsec

== What is Parsing?

A parser is a program that recognizes sentences from a grammar.

In Haskell, there is an alternative approach involving the use of a parser combinators,
whereby a parser can be constructed incrementally based on combining functions.

Informally, a combinator is a higher-order function that combines 'things' to create more complex 'things'.

In Haskell, we deal with the `Parser` type which has 3 type parameters:

- The first type parameter represents the type of the input stream to be parsed.
- The second type parameter represents the type of the user state.
- The third type parameter represents the type of the value recognized by the parser.

We can define a parser that recognizes and accepts String values containing 'c'.

```hs
firstParser = (char 'c') :: Parser String st Char

-- We can use this
parseTest firstParser "c"

parse firstParser "foo" "hello"
runParser firstParser () "foo" "cat"
```


== Parsers as Monads

Since parser values are monads, we can sequence their operation using monadic do notation in Haskell.

== Alternative typeclass

Sometimes we want to try a computation then if it fails, try something else.

The `Alternative` typeclass has `<|>` operator which means 'try the left side, if it fails, try the right side.

```hs
class Applicative f => Alternative f where
    empty :: f a
    (<|>) :: f a -> f a -> f a
```

= Monad Laws

== Defining Custom Data Types

We can model data in different ways:

```hs
type Student = (String, String, Int)

data Student = Student String String Int
```

== Records

Both of these solutions are not ideal, it is difficult to know which String is a name and which is an address.

We need to pattern match to deconstruct and get a relevant field.

We can instead use records, allowing us to have named fields.

```hs
data Student = Student { name :: String, address :: String, age :: Int }
```

We can construct a record as normal or by explicitly specifying the fields.

```hs
Student "John" "123 Main St" 25
Student { name = "John", address = "123 Main St", age = 25 }
```

We can get fields using the field names as functions:

```hs
s = Student { name = "John", address = "123 Main St", age = 25 }
name s
address s
age s
```

We can also update records without needing to specify all fields:

```hs
let s2 = s { age = 26 }
```

=== NewType

A newtype declaration is a special form of a data declaration where there is only one data constructor.

It can be used like a type alias, while ensureing that types are treated separately in the type system.

```hs
newtype Age = Age Int
```

== Laws

There are some laws for the map function:

1. Identity: map id = id
2. Composition: map (f . g) = map f . map g

There are also laws for the `Monoid` typeclass:

1. Identity: mempty <> x = x <> mempty = x
2. Associativity: (x <> y) <> z = x <> (y <> z)

Here are the `Monad` laws.

=== Left Identity
1. Left Identity: return x >>= f = f x

=== Right Identity
2. Right Identity: m >>= return = m

=== Associativity
3. Associativity: (m >>= f) >>= g = m >>= (\x -> f x >>= g)
