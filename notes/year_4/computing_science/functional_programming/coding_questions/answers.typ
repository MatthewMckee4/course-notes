#set document(title: "Functional Programming - Coding Answers")
#set page(margin: 20pt)
#set heading(numbering: "1.")

#align(center)[
  #text(20pt, weight: "bold")[Functional Programming]\
  #text(14pt)[Answers]
]

#outline(title: none)

#pagebreak()

= Basics: Expressions, Functions, Tuples

== A1. Double

```hs
double :: Int -> Int
double x = x * 2
```

== A2. Hello

```hs
greet :: String -> String
greet name = "Hello, " ++ name ++ "!"
```

== A3. Swap

```hs
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)
```

== A4. Distance

```hs
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1, y1) (x2, y2) = sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
```

== A5. Currying

```hs
add :: Int -> Int -> Int
add x y = x + y
```

== A6. Partial Application

```hs
addTen :: Int -> Int
addTen = add 10
```

#pagebreak()

= Lists, Comprehensions, Guards

== A7. Sum of Squares

```hs
sumSquares :: Int -> Int
sumSquares n = sum [x * x | x <- [1..n]]
```

== A8. Pythagorean Triples

```hs
pyths :: Int -> [(Int, Int, Int)]
pyths n =
  [ (a, b, c)
  | a <- [1..n], b <- [1..n], c <- [1..n]
  , a * a + b * b == c * c
  ]
```

== A9. Grade

```hs
grade :: Int -> String
grade m
  | m >= 70   = "A"
  | m >= 60   = "B"
  | m >= 50   = "C"
  | m >= 40   = "D"
  | otherwise = "F"
```

== A10. Roots of a Quadratic

```hs
roots :: Double -> Double -> Double -> [Double]
roots a b c
  | disc <  0 = []
  | disc == 0 = [-b / (2 * a)]
  | otherwise = [(-b - sq) / (2 * a), (-b + sq) / (2 * a)]
  where
    disc = b * b - 4 * a * c
    sq   = sqrt disc
```

#pagebreak()

= Recursion and Pattern Matching

== A11. Length

```hs
myLength :: [a] -> Int
myLength []     = 0
myLength (_:xs) = 1 + myLength xs
```

== A12. Reverse

```hs
myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]
```

A tail-recursive variant:

```hs
myReverse' :: [a] -> [a]
myReverse' = go []
  where
    go acc []     = acc
    go acc (x:xs) = go (x : acc) xs
```

== A13. Take and Drop

```hs
myTake :: Int -> [a] -> [a]
myTake n _ | n <= 0 = []
myTake _ []         = []
myTake n (x:xs)     = x : myTake (n - 1) xs

myDrop :: Int -> [a] -> [a]
myDrop n xs | n <= 0 = xs
myDrop _ []          = []
myDrop n (_:xs)      = myDrop (n - 1) xs
```

== A14. Safe Head

```hs
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x
```

== A15. Tail-Recursive Sum

```hs
sumTR :: [Int] -> Int
sumTR = go 0
  where
    go acc []     = acc
    go acc (x:xs) = go (acc + x) xs
```

#pagebreak()

= Algebraic Data Types

== A16. Days

```hs
data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Show, Eq)
```

== A17. Shape

```hs
data Shape = Circle Double
           | Rectangle Double Double
           | Triangle Double Double Double

area :: Shape -> Double
area (Circle r)        = pi * r * r
area (Rectangle w h)   = w * h
area (Triangle a b c)  = sqrt (s * (s - a) * (s - b) * (s - c))
  where s = (a + b + c) / 2
```

== A18. Binary Tree: size and depth

```hs
data Tree a = Leaf | Node a (Tree a) (Tree a)

size :: Tree a -> Int
size Leaf         = 0
size (Node _ l r) = 1 + size l + size r

depth :: Tree a -> Int
depth Leaf         = 0
depth (Node _ l r) = 1 + max (depth l) (depth r)
```

== A19. In-Order Flatten

```hs
flatten :: Tree a -> [a]
flatten Leaf         = []
flatten (Node x l r) = flatten l ++ [x] ++ flatten r
```

== A20. Insert into BST

```hs
insert :: Ord a => a -> Tree a -> Tree a
insert x Leaf = Node x Leaf Leaf
insert x t@(Node y l r)
  | x < y     = Node y (insert x l) r
  | x > y     = Node y l (insert x r)
  | otherwise = t
```

#pagebreak()

= Higher-Order Functions

== A21. `myMap`

```hs
myMap :: (a -> b) -> [a] -> [b]
myMap _ []     = []
myMap f (x:xs) = f x : myMap f xs
```

== A22. `myFilter`

```hs
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter p (x:xs)
  | p x       = x : myFilter p xs
  | otherwise = myFilter p xs
```

== A23. `myFoldr` and `myFoldl`

```hs
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ z []     = z
myFoldr f z (x:xs) = f x (myFoldr f z xs)

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ z []     = z
myFoldl f z (x:xs) = myFoldl f (f z x) xs
```

== A24. Sum and Product via Folds

```hs
sum' :: Num a => [a] -> a
sum' = foldr (+) 0

product' :: Num a => [a] -> a
product' = foldr (*) 1
```

== A25. Reverse via Fold

```hs
reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []
```

== A26. Compose a List of Functions

```hs
composeAll :: [a -> a] -> a -> a
composeAll = foldr (.) id
```

#pagebreak()

= Sorting and More Recursion

== A27. Quicksort

```hs
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (p:xs) = qsort [x | x <- xs, x < p]
            ++ [p]
            ++ qsort [x | x <- xs, x >= p]
```

== A28. Merge Sort

```hs
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

mergeSort :: Ord a => [a] -> [a]
mergeSort []  = []
mergeSort [x] = [x]
mergeSort xs  = merge (mergeSort l) (mergeSort r)
  where
    n      = length xs `div` 2
    (l, r) = splitAt n xs
```

== A29. Run-Length Encoding

```hs
import Data.List (group)

rle :: Eq a => [a] -> [(a, Int)]
rle = map (\g -> (head g, length g)) . group
```

Manual version:

```hs
rle :: Eq a => [a] -> [(a, Int)]
rle [] = []
rle (x:xs) =
  let (run, rest) = span (== x) xs
  in (x, 1 + length run) : rle rest
```

#pagebreak()

= Typeclasses and Polymorphism

== A30. Show for Shape

```hs
instance Show Shape where
  show (Circle r)       = "Circle " ++ show r
  show (Rectangle w h)  = "Rectangle " ++ show w ++ " " ++ show h
  show (Triangle a b c) = "Triangle " ++ show a ++ " " ++ show b ++ " " ++ show c
```

== A31. Eq for Tree

```hs
instance Eq a => Eq (Tree a) where
  Leaf           == Leaf           = True
  Node x1 l1 r1  == Node x2 l2 r2  = x1 == x2 && l1 == l2 && r1 == r2
  _              == _              = False
```

== A32. Custom Typeclass

```hs
class Container f where
  empty  :: f a
  insert :: a -> f a -> f a

instance Container [] where
  empty       = []
  insert x xs = x : xs
```

#pagebreak()

= IO

== A33. Echo

```hs
echo :: IO ()
echo = do
  line <- getLine
  putStrLn line
```

== A34. Sum N Numbers

```hs
sumN :: Int -> IO Int
sumN 0 = return 0
sumN n = do
  line <- getLine
  rest <- sumN (n - 1)
  return (read line + rest)
```

== A35. Counter with `IORef`

```hs
import Data.IORef
import System.IO
import Control.Monad (unless)

main :: IO ()
main = do
  ref <- newIORef (0 :: Int)
  let loop = do
        eof <- isEOF
        unless eof $ do
          line <- getLine
          unless (null line) $ modifyIORef' ref (+ 1)
          loop
  loop
  n <- readIORef ref
  print n
```

#pagebreak()

= Monads, do-notation, Laws

== A36. Maybe Bind

```hs
bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe Nothing  _ = Nothing
bindMaybe (Just x) f = f x

-- with do-notation
addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes mx my = do
  x <- mx
  y <- my
  return (x + y)

-- with explicit bind
addMaybes' :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes' mx my = mx >>= \x -> my >>= \y -> return (x + y)
```

== A37. List Bind

```hs
pairs :: [(Int, Int)]
pairs = [(x, y) | x <- [1..3], y <- [1..3], x /= y]

-- equivalently using >>=
pairs' :: [(Int, Int)]
pairs' = [1..3] >>= \x ->
         [1..3] >>= \y ->
         if x /= y then return (x, y) else []
```

== A38. Monad Laws (Maybe), with `f x = Just (x + 1)`

Left identity: `return x >>= f`
$=$ `Just x >>= f`
$=$ `f x`. #h(1em) ✓

Right identity: `m >>= return`
- if `m = Nothing`: `Nothing >>= return = Nothing = m`. ✓
- if `m = Just x`: `Just x >>= return = return x = Just x = m`. ✓

Associativity: `(m >>= f) >>= g = m >>= (\x -> f x >>= g)`
- `Nothing` case: both sides reduce to `Nothing`. ✓
- `Just x` case: LHS $=$ `f x >>= g`, RHS $=$ `(\x -> f x >>= g) x = f x >>= g`. ✓

#pagebreak()

= Reader, Writer, State

== A39. Reader

```hs
import Control.Monad.Reader

doubleAndInc :: Reader Int Int
doubleAndInc = do
  e <- ask
  return (e * 2 + 1)

-- runReader doubleAndInc 5  ==> 11
```

== A40. Writer

```hs
import Control.Monad.Writer

logFact :: Int -> Writer [String] Int
logFact 0 = do
  tell ["fact 0 = 1"]
  return 1
logFact n = do
  r <- logFact (n - 1)
  let r' = n * r
  tell ["fact " ++ show n ++ " = " ++ show n ++ " * " ++ show r ++ " = " ++ show r']
  return r'
```

== A41. State Counter

```hs
import Control.Monad.State

tick :: State Int Int
tick = do
  n <- get
  let n' = n + 1
  put n'
  return n'

threeTicks :: State Int [Int]
threeTicks = do
  a <- tick
  b <- tick
  c <- tick
  return [a, b, c]

-- runState threeTicks 0  ==>  ([1, 2, 3], 3)
```

== A42. Stateful Stack

```hs
import Control.Monad.State

push :: a -> State [a] ()
push x = modify (x :)

pop :: State [a] (Maybe a)
pop = do
  xs <- get
  case xs of
    []     -> return Nothing
    (y:ys) -> do
      put ys
      return (Just y)
```

#pagebreak()

= Semigroups, Monoids, Functors, Applicatives

== A43. Sum Monoid

```hs
newtype Sum = Sum { getSum :: Int }

instance Semigroup Sum where
  Sum a <> Sum b = Sum (a + b)

instance Monoid Sum where
  mempty = Sum 0
```

== A44. Functor for Tree

```hs
instance Functor Tree where
  fmap _ Leaf         = Leaf
  fmap f (Node x l r) = Node (f x) (fmap f l) (fmap f r)
```

== A45. Applicative for Maybe

```hs
instance Applicative Maybe where
  pure                = Just
  Nothing  <*> _      = Nothing
  (Just f) <*> mx     = fmap f mx
```

== A46. Applicative Style

```hs
addMaybes :: Maybe Int -> Maybe Int -> Maybe Int
addMaybes mx my = (+) <$> mx <*> my
```

#pagebreak()

= Error Handling

== A47. Either-Based Division

```hs
safeDiv :: Int -> Int -> Either String Int
safeDiv _ 0 = Left "div by zero"
safeDiv x y = Right (x `div` y)
```

== A48. Sequence Either

```hs
sequenceE :: [Either e a] -> Either e [a]
sequenceE []           = Right []
sequenceE (Left e  : _)  = Left e
sequenceE (Right x : xs) = fmap (x :) (sequenceE xs)
```

== A49. Catch IO

```hs
import Control.Exception (try)
import System.IO.Error   (IOError)

safeRead :: FilePath -> IO (Either IOError String)
safeRead path = try (readFile path)
```

#pagebreak()

= Parser Combinators

== A50. Number Parser

```hs
import Text.Parsec
import Text.Parsec.String (Parser)

number :: Parser Int
number = read <$> many1 digit
```

== A51. Bracketed Number

```hs
bracketed :: Parser Int
bracketed = do
  _ <- char '['
  n <- number
  _ <- char ']'
  return n
```

== A52. CSV of Ints

```hs
csv :: Parser [Int]
csv = number `sepBy` char ','
```

== A53. Arithmetic Expression Parser

```hs
import Text.Parsec
import Text.Parsec.String (Parser)

-- expr   ::= term   (('+' | '-') term)*
-- term   ::= factor (('*' | '/') factor)*
-- factor ::= number | '(' expr ')'

expr :: Parser Int
expr = chainl1 term addOp
  where
    addOp = (char '+' >> return (+))
        <|> (char '-' >> return (-))

term :: Parser Int
term = chainl1 factor mulOp
  where
    mulOp = (char '*' >> return (*))
        <|> (char '/' >> return div)

factor :: Parser Int
factor = (between (char '(') (char ')') expr) <|> number

number :: Parser Int
number = read <$> many1 digit

evalString :: String -> Either ParseError Int
evalString = parse (expr <* eof) ""
```

#pagebreak()

= Monad Transformers

== A54. MaybeT IO

```hs
import Control.Monad.Trans.Maybe
import Control.Monad.IO.Class (liftIO)
import Text.Read              (readMaybe)

readSum :: MaybeT IO Int
readSum = do
  a <- MaybeT $ readMaybe <$> getLine
  b <- MaybeT $ readMaybe <$> getLine
  return (a + b)

main :: IO ()
main = do
  result <- runMaybeT readSum
  case result of
    Just n  -> putStrLn ("Sum is " ++ show n)
    Nothing -> putStrLn "Parse failed"
```

== A55. StateT IO

```hs
import Control.Monad.State
import Text.Read (readMaybe)

loop :: StateT Int IO ()
loop = do
  line <- liftIO getLine
  if null line
    then return ()
    else do
      case readMaybe line of
        Just n  -> modify (+ n)
        Nothing -> liftIO (putStrLn "ignored, not a number")
      loop

main :: IO ()
main = do
  (_, total) <- runStateT loop 0
  putStrLn ("Total: " ++ show total)
```

#pagebreak()

= Lambda Calculus and Equational Reasoning

== A56. Beta Reduce

$ (lambda x. lambda y. x + y) thin 3 thin 5 $
$arrow.r.long_beta (lambda y. 3 + y) thin 5$
$arrow.r.long_beta 3 + 5$
$arrow.r.long 8$

== A57. Church Encoding

```hs
type Church a = (a -> a) -> a -> a

zero :: Church a
zero _ z = z

one :: Church a
one f z = f z

two :: Church a
two f z = f (f z)

succ' :: Church a -> Church a
succ' n f z = f (n f z)

toInt :: ((Int -> Int) -> Int -> Int) -> Int
toInt n = n (+ 1) 0

-- toInt zero       == 0
-- toInt (succ' two) == 3
```

== A58. Equational Proof: `map (f . g) = map f . map g`

By induction on the list argument.

Base case `xs = []`:

`map (f . g) []`
$=$ `[]` (def. of map)
$=$ `map f []`
$=$ `map f (map g [])`
$=$ `(map f . map g) []`. ✓

Inductive case `xs = (x : xs')`, assuming the property holds for `xs'`:

`map (f . g) (x : xs')`
$=$ `(f . g) x : map (f . g) xs'` (def. of map)
$=$ `f (g x) : map (f . g) xs'` (def. of `.`)
$=$ `f (g x) : (map f . map g) xs'` (IH)
$=$ `f (g x) : map f (map g xs')`
$=$ `map f (g x : map g xs')` (def. of map, in reverse)
$=$ `map f (map g (x : xs'))` (def. of map, in reverse)
$=$ `(map f . map g) (x : xs')`. ✓

#pagebreak()

= Putting It All Together

== A59. Mini Interpreter

```hs
import qualified Data.Map.Strict as Map

data Expr = Num Int
          | Var String
          | Add Expr Expr
          | Mul Expr Expr
          | Let String Expr Expr

type Env = Map.Map String Int

eval :: Expr -> Either String Int
eval = go Map.empty
  where
    go _ (Num n)     = Right n
    go env (Var x)   = case Map.lookup x env of
                         Just v  -> Right v
                         Nothing -> Left ("unbound variable: " ++ x)
    go env (Add a b) = (+) <$> go env a <*> go env b
    go env (Mul a b) = (*) <$> go env a <*> go env b
    go env (Let x e body) = do
      v <- go env e
      go (Map.insert x v env) body
```

== A60. Property-Based Tests with QuickCheck

```hs
import Test.QuickCheck
import Data.List (sort)

prop_revrev :: [Int] -> Bool
prop_revrev xs = reverse (reverse xs) == xs

prop_mapLength :: [Int] -> Bool
prop_mapLength xs = length (myMap (+ 1) xs) == length xs

prop_mergeSortSorted :: [Int] -> Bool
prop_mergeSortSorted xs = isSorted (mergeSort xs)
  where
    isSorted ys = and (zipWith (<=) ys (drop 1 ys))

prop_mergeSortPerm :: [Int] -> Bool
prop_mergeSortPerm xs = sort (mergeSort xs) == sort xs

main :: IO ()
main = do
  quickCheck prop_revrev
  quickCheck prop_mapLength
  quickCheck prop_mergeSortSorted
  quickCheck prop_mergeSortPerm
```
