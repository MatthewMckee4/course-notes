#set document(title: "Programming Languages")
#set page(margin: 20pt)

#outline(title: none)

#pagebreak()

// 1.

=  Introduction and Programming Paradigms

== Programming Paradigms

A Programming paradigm is a given style of programming that dictates the principles,
techniques and methods used to solves problems in that languages.

*Imperative Programming Languages*

Imperative languages have call stacks, and record their current position.

C, C++, Python, JS, Java

*Functional Programming Languages*

Everything is an expression. First class functions, evaluation is a reduction of a complex expression to a value.

Haskell, elixir, OCaml.

*Object-Oriented Programming Languages*

Key concept is an object.

Java, C`#`.

// 2.

= Syntax

== Regular Expressions

A regex is a pattern that can match strings. They can be used in recognizing tokens in program source.

- `a` matches character `a`
- `.` matches any character
- `*` matches zero or more of the preceding element
- `+` matches one or more of the preceding element
- `?` matches zero or one of the preceding element
- `|` matches either the preceding or the following element
- `()` matches the enclosed pattern
- `[]` matches any character in the set
- `[a-z]` matches any lowercase letter
- `[A-Z]` matches any uppercase letter
- `[0-9]` matches any digit
- `[a-zA-Z0-9]` matches any alphanumeric character

Regular expressions cannot handle nesting, so we cannot use them for most programming languages.

== Chomskys Hierarchy of Language

Chomsky's hierarchy of language is a classification of formal languages based on their generative power.

- Type 0: recursively enumerable
- Type 1: Context-sensitive
- Type 2: Context-free
- Type 3: Regular

Regular expressions are regular languages.
Context-free languages can be recognized by a push-down automation.
Context-sensitive languages and recursively enumerable languages require more interesting recognisers.

== Grammars

Regular expressions help, but don't cut it for describing the syntax of a programming language.

A grammar is a set of formal rules specifying how to construct a sentence in a language. It consists of:

- A set of *terminal symbols*: symbols that occur in a sentence
- A distinguished *sentence symbol* that stands for a complete sentence
- A set of *nonterminal symbols*, which each stand for part of a phrase
- A set of *production rules* that show how phrases can be made up from terminals and sub-phrases

== Backus-Naur Form

A BNF grammar consists of a series of productions that take the form:

```
<symbol> ::= <A> | <B> | <C> | ...
```

where A, B, C, ... are symbols that can be either terminal or non-terminal.

We can represent how a string corresponds to a grammar G using a parse tree or syntax tree.

Each terminal node is labeled by a terminal symbol, like digits and operators,
and each non-terminal node is labeled by a non-terminal symbol and can have children.

A grammar is ambiguous if we can derive two or more different parse trees for a string.

The syntax of a programming language should be unambiguous.

== Abstract Syntax

Abstract syntax allows us to abstract away irrelevant syntactic noise so we can
concentrate on the important parts of a program.

We can also write abstract syntax as a tree, this is how every parsed program is represented.

To parse text into an AST, we tokenise text into chunks using regular expressions, lexing.
And match token streams and convert these into AST nodes, parsing.

= Evaluation and Operational Semantics

== Compilers

For general-purpose hardware, a compile translates code into (often a series of) lower level languages, such that they can eventually be executed on hardware.
Often, even compiled code needs tobe supported by a runtime system

== Interpreters

An interpreter is a program that accepts a program written in a given programming language, and executes it directly, without generating a separate executable.

Interpreters work by fetching, analysing and executing instructions or evaluating subexpressions.

Generally, interpreters are easier to write but slower than compiled code.

== Virtual Machines

A physical machine runs machine coed directly. In contrast, a virtual machine evaluates instructions by an interpreter.
Some advantages of virtual machines are that they are platform independent, they can run compiled code on multiple platforms,
they have a common backend, so multiple (often quite different) languages can target the same backend, like .NET or JVM.

== Just-in-time Compilers

A JIT compiler is a middle-ground between compilers and interpreters, where code is compiled to native code at runtime.
JIT compilers operate selectively: they profile code and compile hot code. An example is Java's HotSpot JIT compiler for java.

== Operation Semantics

There are different approaches to programming languages semantics.
Operational: details reduction of an expression either to another expression or a value.
Denotational: maps expressions to semantic objects, are extremely powerful,
being particularly useful for proving complex properties such as program equivalence.
Axiomatic: describes evaluation in terms of pre and post conditions on the program state,
mostly used for verification of imperative programs, or describing the semantics of shared-memory concurrency.

We will only consider operational semantics. They are useful for seeing how the state of a system evolves,
especially for systems with side-effects or concurrency. However they can sometimes be verbose,
and reasoning about more intricate properties can be difficult.

=== Textual descriptions

We first write out textual descriptions for how to evaluate expressions in our language.
We have two types of expressions: integer literals and arithmetic operations.

Textual descriptions can be imprecise, the language designer might mean something different to whats understood by the language implementer.
We can't prove properties about textual descriptions: they are not mathematically defined.
Textual descriptions don't scale: more complex language features require lots of text to describe.
Textual descriptions leave room for edge cases due to ambiguity.

Big step operational semantics involves showing how an expression evaluates to a value.

We then need inference rules to show how expressions evaluate: remember that an inference rule says that if the premises (P1, ...) hold,
then the conclusion (Q) holds.

*Integer values:*
$ n arrow.b.double n $

All integers are values and cannot reduce further, so we are done.

*Binary operations:*
$ (L arrow.b.double V quad M arrow.b.double W) / (L dot.o M arrow.b.double V dot.o W) $

First evaluate L to a value V, then evaluate M to a value W. The result is the actual integer operation on the two values V and W.

=== Booleans and Conditionals ($L_"If"$)

Boolean values are already values:
$ "true" arrow.b.double "true" #h(4em) "false" arrow.b.double "false" $

*If-then-else:*
$
  (L arrow.b.double "true" quad M arrow.b.double V) / ("if" L "then" M "else" N arrow.b.double V)
  #h(2em)
  (L arrow.b.double "false" quad N arrow.b.double V) / ("if" L "then" M "else" N arrow.b.double V)
$

= Parsing and ANTLR

== Tokens

A token is a string that some meaning in the program. Each token is given a name and an optional value.
Tokens are like identifiers, keywords, operators etc.

== Parsers

Parsers take unstructured text and turn it into a structured representation (parse tree) based on the rules of the grammar.

In practice, programming languages split this into two phases: lexing turns unstructured text into a stream of tokens.
Parsing matches the stream of tokens against the grammar, producing the parse tree.

== Lexing

Lexing is the process of turning unstructured text into a token stream, so that it can be more easily consumed by a parser.

== Parsing

There are several ways we can go about parsing.

=== Recursive Descent

Write mutually-recursive "consumption" functions for each grammar production.

=== Parser Combinators

Define smaller parsers and compose them, used in functional languages.

=== Parser Generators

Write a BNF grammar, and programmatically generate a lexer / parser automatically.

This means that a language implementer can concentrate on the design of the grammar.

For this, we need to use ANTLR grammar, like what follows.

```text
expr: expr DIV expr # Div
| expr MUL expr # Mul
| expr ADD expr # Add
| expr SUB expr # Sub
| INT # Int
| '(' expr ')' # Parens
;
INT : [0-9]+ ;
WS : [ \t\r\n]+ -> skip ;
MUL: '*' ;
DIV: '/' ;
SUB: '-' ;
ADD: '+' ;
```

== Visitor design pattern

The visitor pattern separate the operation on each element of a structure from the act of traversing it.
There is a `visit` method for each way of constructing a tree.

```java
public interface TreeVisitor {
  public void visitNode(Node n);
  public void visitLeaf(Leaf l);
}

public class BaseTreeVisitor implements TreeVisitor {
  public void visitNode(Node n) {
    n.getLeft().accept(this);
    n.getRight().accept(this);
  }
  public void visitLeaf(Leaf l) { }
}
```

The code below shows two visitor. We do not need to manually inspect the left and right subtrees,
only writing the logic for the leaves, the traversal logic is contained in `BaseTreeVisitor`.

```java
public class PrintLeafVisitor extends BaseTreeVisitor {
  @Override
  public void visitLeaf(Leaf l) {
    System.out.println(l.getValue());
  }
}
public class IncrementLeafVisitor extends BaseTreeVisitor {
  @Override
  public void visitLeaf(Leaf l) {
    l.setValue(l.getValue() + 1);
  }
}
```

ANTLR generates a base visitor class from the supplied grammar.
We can either use this to create instances of our AST nodes, or work directly with the generated visitors.

To write an interpreter, we need different cases based on each rule in the operational semantics.

For our language, we know that a number is already a value. For a binary operation, we need to evaluate
the left and right side, so they will evaluate down to an integer. Then we can do the appropriate operation
on the integers.

= Variables and Binding

== Let-bindings

$"let" x = M "in" N$ evaluates M to a value V, then evaluates N with x bound to V.

Let expressions act as a binder for a variable. All occurrences of x in N are bound occurrences.
A variable is *free* if it is not in the scope of a binder. A quantifier $forall x . P$ binds
all free occurrences of x in its body P.

=== Free Variables

$
"FV"(n) &= {} \
"FV"(x) &= {x} \
"FV"(M dot.circle N) &= "FV"(M) union "FV"(N) \
"FV"("if" L "then" M "else" N) &= "FV"(L) union "FV"(M) union "FV"(N) \
"FV"("let" x = M "in" N) &= "FV"(M) union ("FV"(N) backslash {x})
$

== Name Shadowing

An inner let can rebind a variable already in scope. The inner binding *shadows* the outer one
within its scope. E.g. in `let x = 1 in (let x = 2 in x) + x`, the inner x is 2, the outer x is 1.

== Substitution

$M {V \/ x}$ means replace all *free* occurrences of x in term M with value V.

$
n{V \/ x} &= n \
x{V \/ x} &= V \
y{V \/ x} &= y #h(4em) (y eq.not x) \
(L dot.circle M){V \/ x} &= L{V \/ x} dot.circle M{V \/ x} \
("let" x = M "in" N){V \/ x} &= "let" x = M{V \/ x} "in" N \
("let" y = M "in" N){V \/ x} &= "let" y = M{V \/ x} "in" N{V \/ x} #h(2em) (y eq.not x)
$

=== Big-Step Semantics for Let

$ (M arrow.b.double V quad N{V \/ x} arrow.b.double W) / ("let" x = M "in" N arrow.b.double W) $

== Alpha Equivalence

Two terms are *alpha equivalent* if they are the same up to renaming of bound variables.
E.g. $"let" x = 1 "in" x + x$ is alpha equivalent to $"let" y = 1 "in" y + y$.

= Functions and Recursion

== Lambdas

$lambda x . M$ introduces an anonymous function with parameter x and body M.

Lambdas are values: they do not reduce further on their own.

*Currying:* a multi-argument function $f(x, y) = M$ is encoded as $lambda x . lambda y . M$,
applied as $(f "  " 3) "  " 4$.

`let fun f(x) = M in N` is syntactic sugar for `let f = λx.M in N`.

== Semantics

$
(M arrow.b.double lambda x . M' quad N arrow.b.double V quad M'{V \/ x} arrow.b.double W) / (M "  " N arrow.b.double W)
$

Evaluate M to a lambda, evaluate the argument N to a value V,
substitute V for x in the body, then evaluate the result.

== Recursion

With `let fun` (or plain lambdas), a function cannot refer to itself in its own body -- there is
no way to write recursive functions like factorial. We need a new construct.

`rec f(x). M` defines an anonymous recursive function where both $f$ (the function itself)
and $x$ (the parameter) are bound in the body M. Like lambdas, `rec f(x). M` is a value.

`let rec f x = M in N` is syntactic sugar for `let f = rec f(x). M in N`.

$
(M arrow.b.double "rec" f(x) . M' quad N arrow.b.double V quad M'{"rec" f(x).M' \/ f, V \/ x} arrow.b.double W) / (M "  " N arrow.b.double W)
$

The key difference from lambda application is that a *copy of the rec function itself* is
substituted for $f$ in the body, allowing self-reference.

=== Nontermination

Recursion introduces the possibility of nontermination. For example,
`(rec f(x). f x) true` loops forever: each step substitutes the rec function back in,
producing the same application again.

== Variable Capture

Variable capture occurs when a free variable becomes bound after substitution, changing the meaning
of the expression. Consider:

$ (lambda f . lambda "myInt" . f) #h(1em) (lambda x . x + "myInt") $

Here `myInt` is free in the argument. Naively substituting gives
$lambda "myInt" . (lambda x . x + "myInt")$, where `myInt` in the body now refers to the
binder's parameter instead of the original free variable. The meaning has changed.

=== Avoiding Capture

Whenever we substitute under a binder, we first rename the binder to a *fresh name*
(one not free in the substituted term), producing an alpha-equivalent expression.

E.g. rename `myInt` to `roger`:
$ (lambda "bob" . lambda "roger" . "bob") #h(1em) (lambda x . x + "myInt") arrow.b.double lambda "roger" . (lambda x . x + "myInt") $

Since `roger` is fresh, it cannot appear free in the argument, so no capture occurs.

=== Capture-Avoiding Substitution (Function Cases)

$(lambda x . M){N \/ x} = lambda x . M$

Since $x$ is bound by the lambda, there are no free occurrences of $x$ in the body to replace.

$(lambda x . M){N \/ y} = lambda x . (M{N \/ y}) #h(2em) "if" x eq.not y "and" x in.not "FV"(N)$

We only substitute into the body if the binder $x$ would not capture any free variable in $N$.
If $x in "FV"(N)$, we must first alpha-rename $x$ to a fresh name before substituting.

=== Formal Definition Using Swapping

Let $M(x arrow.l.r y)$ be a *swapping* operation that renames x to y and y to x in M.

We define $"subst"(M, N, x)$ as the operation to substitute N for x in M,
freshening variables where required.

= Types and Typechecking

== Types

Types classify terms. Let's begin by considering base types.

$
  "Types" "A", "B" := "Int" | "Bool"
$

$ (tack M : "Int" quad tack N : "Int") / (tack M + N : "Int") $

=== Generalising to other binary operations.

We can specify meta-level functions: a function over types defined when describing our language.

$
  "ty"(compose) = A -> B -> C
$

$
  (tack M : A quad tack N : B) / (tack M compose N ∶ C)
$

=== Conditionals

$
  (tack L : "Bool" quad tack M : A quad tack N : A) / (tack "if" L "then" M "else" N ∶ C)
$

=== Functions

$
  A, B := A -> B | "Int" | "Bool"
$

$
  L, M, N := x | lambda x^A . M | M N
$

=== Type Environment

To handle variables, we need to store their types in a type environment (or typing context).

A type environment is a mapping from variables to types.

$
  Gamma := dot | Gamma, x : A
$

==== Typing Rules for variables and functions

$
  (x : A in Gamma) / (Gamma ⊢ x : A)
$

$
  (Gamma, x : A ⊢ M : B) / (Gamma ⊢ lambda x^A . M : A -> B)
$

==== Typing Rules for application, let, and recursion

$
  (Gamma ⊢ M : A -> B quad Gamma ⊢ N : A) / (Gamma ⊢ M "  " N : B)
$

$
  (Gamma ⊢ M : A quad Gamma, x : A ⊢ N : B) / (Gamma ⊢ "let" x = M "in" N : B)
$

$
  (Gamma, f : A -> B, x : A ⊢ M : B) / (Gamma ⊢ "rec" f(x) . M : A -> B)
$

= Data Types

Many data types can be *encoded* into a small set of core types: products, sums, and recursive types.

== Product Types

Pairs have a *product type* $A times B$, named after the cartesian product:
$"values"(A times B) = {(x, y) | x in "values"(A), y in "values"(B)}$.

Constructed with $(M, N)$, eliminated with `fst` and `snd`.

$
  (Gamma tack M : A quad Gamma tack N : B) / (Gamma tack (M, N) : A times B)
  #h(2em)
  (Gamma tack M : A times B) / (Gamma tack "fst" M : A)
  #h(2em)
  (Gamma tack M : A times B) / (Gamma tack "snd" M : B)
$

Semantics: $(M, N) arrow.b.double (V, W)$ if $M arrow.b.double V$ and $N arrow.b.double W$.
$"fst"(V, W) arrow.b.double V$ and $"snd"(V, W) arrow.b.double W$.

=== Tuples

$n$-ary tuples are encoded by nesting pairs.
E.g. a 4-tuple $(a, b, c, d)$ becomes $(a, (b, (c, d)))$.
Elements are accessed via chains of `fst`/`snd` projections.

=== Unit Type

The *unit type* has exactly one value: `()`. It is the zero-element tuple.

$ () / (Gamma tack () : "Unit") $

Useful as the return type of side-effecting operations in expression-based languages
(which have no `void`), e.g. `printLine : String -> Unit`.

== Record Types

Records are product types with *named fields*: accessed by field name rather than position.
They can be encoded as nested pairs with named projection functions.

== Sum Types

A *sum type* $A + B$ represents a value that is *either* of type A or type B.

Constructed using *injection functions*: $"inl"(M)$ for a value of type A, $"inr"(M)$ for type B.

$
  (Gamma tack M : A) / (Gamma tack "inl" M : A + B)
  #h(2em)
  (Gamma tack M : B) / (Gamma tack "inr" M : A + B)
$

Eliminated by *case analysis*: determine which injection was used and evaluate the corresponding branch.

$
  (Gamma tack L : A + B quad Gamma, x : A tack M : C quad Gamma, y : B tack N : C) / (Gamma tack "case" L "of" { "inl" x |-> M ; "inr" y |-> N } : C)
$

*Semantics:*
$ (M arrow.b.double V) / ("inl" M arrow.b.double "inl" V)
  #h(2em)
  (L arrow.b.double "inl" V quad M{V \/ x} arrow.b.double W) / ("case" L "of" { "inl" x |-> M ; "inr" y |-> N } arrow.b.double W)
$

(Symmetric rules for `inr`.)

=== Encoding Booleans as Sums

With sum types and unit: $"true" equiv "inl" ()$ and $"false" equiv "inr" ()$ (type $"Unit" + "Unit"$).
Conditionals become case analysis with fresh binders.

=== Variant Types

A *variant type* is a sum with more than two alternatives, each with a named constructor and a payload type.
Constructors without data use `Unit` as payload.
Eliminated by case analysis with a branch per constructor.
Variants can be encoded as nested sum types using `inl`/`inr`.

== Recursive Types

A *recursive type* is a type defined in terms of itself. Lists are the canonical example:
an `IntList` is either empty (`[]`) or a head element consed onto another list (`Int :: IntList`).

```
type IntList = [ ]
  | Int :: IntList
```

`[1,2,3]` is syntactic sugar for `1 :: (2 :: (3 :: []))`.

=== Typing Rules for Lists

$
  () / (Gamma tack [] : "IntList")
  #h(2em)
  (Gamma tack M : "Int" quad Gamma tack N : "IntList") / (Gamma tack M :: N : "IntList")
$

$
  (Gamma tack L : "IntList" quad Gamma tack M : A quad Gamma, x : "Int", "xs" : "IntList" tack N : A) / (Gamma tack "case" L "of" { [] |-> M ; x :: "xs" |-> N } : A)
$

=== Formal Recursive Types

The $mu$ operator allows a type to refer to itself: $mu X . A$ binds recursive type variable $X$ in type $A$.

$"IntList" equiv mu X . "Unit" + ("Int" times X)$

== Algebraic Data Types

Products, sums, and recursive types together form *algebraic data types* (ADTs), the foundation
of data in functional languages (e.g. Haskell, OCaml). Imperative languages also benefit from
these building blocks, with mutability enabling additional structures like arrays.

= Imperative Programming

Unlike expression-based (functional) languages, *imperative* languages allow mutable variables
and modify program state. An imperative program has a program counter, call stack, and state.

== Expressions vs Statements

A *statement* is an instruction that performs a computation but does not return a value.
An *expression* is a term that reduces to a value and can be contained within a statement.

== $L_"While"$: A Core Imperative Language

=== Syntax

$
"Constants" c &:= n | b \
"Values" V, W &:= n | b \
"Expressions" L, M, N &:= x | c | M dot.circle N \
"Statements" s, t &:= s; t | "skip" | x := M | "if" M "then" s "else" t | "while" M { s }
$

- $s; t$: statement sequencing (run s then t)
- `skip`: no-op ($"skip"; s = s = s; "skip"$)
- $x := M$: variable assignment
- `if M then s else t`: conditional statement
- `while M { s }`: loop until M evaluates to false

=== Expression Semantics

Expressions now evaluate under a state $sigma$ (a mapping from variables to values):
$sigma, M arrow.b.double V$ means "under state $sigma$, expression $M$ evaluates to value $V$".

$
  (x |-> V in sigma) / (sigma, x arrow.b.double V)
  #h(2em)
  () / (sigma, c arrow.b.double c)
  #h(2em)
  (sigma, L arrow.b.double V quad sigma, M arrow.b.double W) / (sigma, L dot.circle M arrow.b.double V hat(dot.circle) W)
$

=== Statement Semantics

$sigma, s arrow.b.double sigma'$ means "given input state $sigma$, executing statement $s$ produces updated state $sigma'$".

*Skip:*
$ () / (sigma, "skip" arrow.b.double sigma) $

*Sequencing:*
$ (sigma, s arrow.b.double sigma' quad sigma', t arrow.b.double sigma'') / (sigma, s; t arrow.b.double sigma'') $

*Assignment:*
$ (sigma, M arrow.b.double V) / (sigma, x := M arrow.b.double sigma[x |-> V]) $

*If-then-else:*
$
  (sigma, M arrow.b.double "true" quad sigma, s arrow.b.double sigma') / (sigma, "if" M "then" s "else" t arrow.b.double sigma')
  #h(2em)
  (sigma, M arrow.b.double "false" quad sigma, t arrow.b.double sigma') / (sigma, "if" M "then" s "else" t arrow.b.double sigma')
$

*While (false):*
$ (sigma, M arrow.b.double "false") / (sigma, "while" M { s } arrow.b.double sigma) $

*While (true):*
$ (sigma, M arrow.b.double "true" quad sigma, s arrow.b.double sigma' quad sigma', "while" M { s } arrow.b.double sigma'') / (sigma, "while" M { s } arrow.b.double sigma'') $

= Small-step Semantics and Type Soundness

== Limitations of Big-Step Semantics

Big-step soundness: if $dot tack M : A$ then there exists some $V$ such that $M arrow.b.double V$ and $dot tack V : A$.

This does not hold for $L_"Rec"$ since it requires every term terminates (e.g. `(rec f(x). f x) true` loops forever). Also fails with division by zero: $(1 + 2) / 0$ does not evaluate to a value.

The answer: reason about evaluation step-by-step.

== Small-Step Operational Semantics

$M arrow.long N$ -- expression $M$ takes a single reduction step to expression $N$.
$M arrow.long^* N$ -- zero or more reduction steps.

Each language construct has a *reduction rule* (performs the actual computation on values) and *congruence rules* (reduce subexpressions to values). Congruence rules enforce *left-to-right evaluation order*.

=== Rules for $L_"Arith"$

$
  (V "and" W "are values") / (V dot.o W arrow.long V hat(dot.o) W)
  #h(2em)
  (M arrow.long M') / (M dot.o N arrow.long M' dot.o N)
  #h(2em)
  (M arrow.long M') / (V dot.o M arrow.long V dot.o M')
$

=== Rules for $L_"If"$

$
  () / ("if" "true" "then" M "else" N arrow.long M)
  #h(2em)
  () / ("if" "false" "then" M "else" N arrow.long N)
  #h(2em)
  (L arrow.long L') / ("if" L "then" M "else" N arrow.long "if" L' "then" M "else" N)
$

=== Rules for $L_"Rec"$

$
  () / ((lambda x . M) V arrow.long M {V \/ x})
  #h(2em)
  () / (("rec" f(x) . M) V arrow.long M {"rec" f(x) . M \/ f, V \/ x})
$

$
  (M arrow.long M') / (M N arrow.long M' N)
  #h(2em)
  (M arrow.long M') / (V M arrow.long V M')
$

=== Equivalence of Big- and Small-Step

The two styles are equivalent:
- If $M arrow.b.double V$, then $M arrow.long^* V$.
- If $M arrow.long^* V$, then $M arrow.b.double V$.

Big-step is closer to interpreters but can't reason about nontermination. Small-step gives finer-grained reasoning.

== Type Soundness

If a program is well typed, then it is either already a value, or it can take a step while staying well typed. Proved via two properties:

*Preservation*: if $Gamma tack M : A$ and $M arrow.long N$, then $Gamma tack N : A$.

*Progress*: if $dot tack M : A$, then either $M$ is a value, or there exists some $N$ such that $M arrow.long N$.

=== Violating Preservation

Consider $M lt.tri N$ that evaluates $M$ then $N$, returning the result of $M$. The typing rule gives it type $B$ (from $N$), but $V lt.tri W arrow.long V$ returns type $A$ -- preservation violated.

=== Violating Progress

$L_"Arith"$ with division: $5 \/ 0$ is well typed ($"Int"$) but is not a value and cannot reduce further.

=== Proving Preservation and Progress

- *Preservation*: rule induction on $M arrow.long N$.
- *Progress*: rule induction on $dot tack M : A$.

For $L_"Lam"$ / $L_"Rec"$, proofs additionally require a *substitution lemma*:
if $Gamma, x : A tack M : B$ and $Gamma tack V : A$, then $Gamma tack M {V \/ x} : B$.

Some languages (e.g. Python, TypeScript) are *deliberately unsound* -- typable programs may still raise runtime errors.

= VM Code Generation

== Tree-Walk vs Bytecode Interpreters

A *tree-walk interpreter* traverses the AST directly. This is simple but slow due to pointer chasing and poor cache locality.

A *bytecode interpreter* compiles to a flat array of bytecode instructions (1-byte opcode + optional arguments), then executes via a fetch-decode-execute loop. Faster due to data locality and simpler dispatch.

== Stack Machines

A *stack machine* uses a stack for operands rather than registers. Examples: JVM, .NET CLR, WebAssembly.
Advantages: simple code generation (no register allocation), compact bytecode.

== SVM (Simple Virtual Machine)

SVM state consists of:
- *Code store*: array of instructions. `pc` (program counter) points to next instruction, `cl` (code length) is the total number of instructions.
- *Data store*: stack-based. `sp` (stack pointer) points to the top.
- *Status register*: `RUNNING` or `HALTED`.

=== Instruction Set

Arithmetic: `ADD`, `SUB`, `MUL`, `DIV` -- pop two operands, push result.

Comparison: `CMPEQ`, `CMPLT` -- pop two, push boolean (0/1).

Logic: `INV` -- pop boolean, push negation.

Memory: `LOADC n` (push constant), `LOADG a` / `STOREG a` (global), `LOADL o` / `STOREL o` (local, relative to frame).

Control: `HALT`, `JUMP a`, `JUMPF a` (jump if false), `JUMPT a` (jump if true).

=== Fetch-Decode-Execute Loop

```
while status == RUNNING:
  instruction = code[pc]
  pc += 1
  execute(instruction)
```

== Compiling Fun to SVM

=== Constants and Binary Operations

A constant $n$ compiles to `LOADC n`. A binary operation $M dot.o N$ compiles by: compile $M$, compile $N$, emit the corresponding instruction.

=== Variable Storage

Variables in imperative languages fall into three categories:

- *Global*: in scope across all functions, allocated at declaration, remain until program terminates.
- *Local*: in scope for a single function call, allocated on the *variable stack*, deallocated on return.
- *Heap*: allocated on demand (e.g. `malloc`), persist across function calls, deallocated explicitly or by a garbage collector.

An *address table* maps variable names to (locale, address) pairs, where locale is `GLOBAL` or `LOCAL`.
A variable reference compiles to `LOADG a` or `LOADL o` depending on locale.

=== Assignments

An assignment $x := M$ compiles by: compile $M$ (pushes value onto stack), then emit `STOREG a` or `STOREL o` to pop and store the value.

=== Conditionals (Back-Patching)

For `if L then M`:
+ Compile $L$
+ Emit `JUMPF ?` (placeholder address)
+ Compile $M$
+ *Back-patch*: fill in the `?` with the current `pc`

For `if L then M else N`:
+ Compile $L$
+ Emit `JUMPF ?` (placeholder $p_1$)
+ Compile $M$
+ Emit `JUMP ?` (placeholder $p_2$)
+ Back-patch $p_1$ to current `pc`
+ Compile $N$
+ Back-patch $p_2$ to current `pc`

=== While Loops (Back-Patching)

+ Record current `pc` as $l$
+ Compile test expression
+ Emit `JUMPF ?` (placeholder $p$)
+ Compile loop body
+ Emit `JUMP l` (jump back to test)
+ Back-patch $p$ to current `pc`

= Native Code Generation (1)

== Why Compile to Native Code

- *Performance*: no interpretation overhead, code runs directly on hardware. Can exploit architecture-specific optimisations.
- *Bootstrapping*: bytecode interpreters themselves must be written in a compiled language.
- *Systems programming*: low-level code requiring system calls or inline assembly.
- *JIT compilers*: can compile hot code to native code based on profiling.

== Virtual Machines vs Physical Machines

Bytecode VMs are stack-based, have simple instruction sets, are portable, but have interpretation overhead.

Native code is register-based, architecture-specific, with no interpretation overhead.

=== RISC vs CISC

*CISC* (Complex Instruction Set Computer, e.g. x86): many instructions that can perform multiple operations at once.

*RISC* (Reduced Instruction Set Computer, e.g. RISC-V, ARM): simpler, fewer instructions; generated code may be larger but each instruction is fast and uniform.

Registers are a finite set of fast storage locations on the CPU. Native instruction sets expect arguments in registers
rather than on a stack. Computing with registers is fast; reading/writing memory is much more expensive.

== Compilation Pipeline

Frontend (parsing/typechecking) $arrow.r$ Compilation to IR $arrow.r$ Instruction Selection $arrow.r$ Control Flow Graph $arrow.r$ Liveness Analysis $arrow.r$ Register Allocation.

== Intermediate Representations

It is better to compile to an IR first rather than directly to native code. A classic example is LLVM. This allows many frontends to share the same backend pipeline. Many compilers use multiple IRs.

=== IR Lowering Chain

The IR is progressively lowered through several representations:

Tree-based IR (close to source) $arrow.r$ Linearised sequence with two-way conditional jumps $arrow.r$ Three-address code with one-way jumps and fall-through (close to assembly).

=== Tree-Based IR

Our IR forms a single tree with two entities: expressions (return a value) and statements (perform side-effects). Labels name program locations for jumps. All flow-control constructs are compiled to explicit labels and jumps.

*IR Expressions:*
- `Local(var)`: reference to a local variable
- `Name(labelName)`: reference to a code location
- `Const(n)`: integer constant
- `BinOp(op, e1, e2)`: binary operation on subexpressions

*IR Statements:*
- `Seq(s1, s2)`: s1 followed by s2
- `Label(labelName)`: define a named location
- `Move(e1, e2)`: assign e2 to the variable in e1
- `Jump(e)`: unconditional jump
- `CJump(e, l1, l2)`: if e is true jump to l1, else l2
- `Return(e)`: return expression to caller

=== Translating Fun to IR

Expressions translate directly: integer constants to `Const(n)`, `true`/`false` to `Const(1)`/`Const(0)`, binary operators recursively to `BinOp`. Assignments become `Move` instructions.

*Conditionals:* generate labels for thenBlock, elseBlock, and afterBlock. Compile the test as a `CJump` to thenBlock or elseBlock, and emit an unconditional `Jump` to afterBlock at the end of thenBlock.

*While loops:* generate labels for whileCond, bodyBlock, and afterWhile. Compile the test as a `CJump` to bodyBlock or afterWhile. Emit an unconditional `Jump` back to whileCond at the end of the body.

=== Linearisation

Most generated IR is a right-leaning tree of `Seq` nodes. Linearisation flattens this into a sequence of non-`Seq` instructions.

== Three-Address Code

Three-address code breaks complex expressions into smaller assignments to temporary variables. Each assignment has at most one operation on variables or values. Instructions: `v <- e` (assign), `jump label`, `jump if v label`, `return v`.

For example, `a = (b + c) * (d - e)` becomes:
```
t1 <- b + c
t2 <- d - e
a <- t1 * t2
```

== Basic Blocks

A *basic block* is a straight-line sequence of instructions where:
- Other blocks can only jump to the first instruction
- There is only one (potentially conditional) jump at the end
- If a conditional jump is not taken, control falls through to the next block

== Control-Flow Graphs

A *control-flow graph* (CFG) represents the control flow of a program:
- Each node is a basic block
- Each edge is a jump (explicit, conditional, or fall-through)
- One BB is marked as entry, one as exit

= Native Code Generation (2)

== Liveness Analysis

The IR and three-address code assume an infinite number of registers, but CPUs only have a limited number. We can re-use a register for two separate variables as long as the variables are not "in use" at the same time. Liveness analysis gives us the information to allocate variables to physical registers.

=== Liveness Within a Basic Block

A variable is *live* at a location if it may be inspected at a later point. We want to know the range of locations between when a variable is assigned and when it is last used. Variables with non-overlapping liveness ranges can be assigned to the same register.

*Example:* For `int s = (a+b+c)/2; return s*(s-a)*(s-b)*(s-c);` compiled to three-address code:

```
1: t1 <- a + b     5: t4 <- s * t3
2: t2 <- t1 + c    6: t5 <- s - b
3: s  <- t2 / 2    7: t6 <- t4 * t5
4: t3 <- s - a     8: t7 <- s - c
                    9: t8 <- t6 * t7
                   10: return t8
```

Variable `a` is live from location 1 (first use) to 4 (last use). Variable `s` is live from 3 (definition) to 8 (last use). Variable `t8` is live only from 9 to 10. Since `a` and `t8` have non-overlapping ranges, they can share the same register.

=== Liveness with Control Flow

With control flow (e.g. loops), liveness ranges can span across jumps. A variable may be live on paths that loop back to its use site. Since basic blocks have multiple instructions and no intermediate control flow, we can group instructions and compute liveness on basic blocks directly.

=== Flow Graph Definitions

- A node has *out-edges* that lead to *successor nodes*: $"succ"(n)$ is the set of successors of node $n$.
- A node has *in-edges* that come from *predecessor nodes*: $"pred"(n)$ is the set of predecessors of node $n$.
- An assignment to a variable in a node *defines* that variable: $"def"(n)$ is the set of variables defined in node $n$.
- A node *uses* a variable if it appears on the right-hand side of an assignment: $"use"(n)$ is the set of variables used in node $n$.

=== Dataflow Equations

$
  "in"[b] = "use"[b] union ("out"[b] backslash "def"[b])
$

The live-in variables of block $b$ are all of the variables it uses, along with its live-out variables (except for any variables it defines). Defining a variable makes its previous value irrelevant.

$
  "out"[b] = "in"[b_1] union "in"[b_2] union dots union "in"[b_n]
$

where $b_1, dots, b_n$ are *successors* of $b$. The live-out variables of block $b$ are the union of live-in sets of $b$'s successors.

Once we have calculated the out-sets, the live variables of a block $b$ are:

$
  "live"[b] = "out"[b] union "def"[b]
$

=== Solving Dataflow Equations

We can iteratively compute the in and out sets by starting from empty sets and repeatedly applying the dataflow equations until we reach a *fixpoint* (future iterations do not change the sets). Since we are tracing how data flows from its uses to its definitions, it is more efficient to process the CFG *backwards*.

```
for each basic block n:
  in[n] <- { }
  out[n] <- { }
repeat for each n:
  old_in[n] <- in[n]
  old_out[n] <- out[n]
  in[n] <- use[n] U (out[n] \ def[n])
  out[n] <- U_{s in succ(n)} in[s]
until for all n: old_in[n] = in[n]
                  and old_out[n] = out[n]
```

== Register Allocation

Once we have performed liveness analysis, we can use the liveness information to construct an *interference graph*:
- Every variable is a vertex / node in the graph
- We add an edge between two variables if they are live at the same time

We then allocate registers by *colouring the graph*: no adjacent node can be given the same colour. Each colour corresponds to a register.

=== Graph Colouring

Graph colouring is an NP-complete problem. However, there is a *linear time heuristic* that works well in practice:

+ Find a node with fewer than $k$ neighbours (where $k$ = number of available registers).
+ Remove it from the graph and push it onto a stack.
+ Repeat until the graph is empty (or no such node exists -- then a variable must be *spilled*).
+ Pop nodes from the stack, assigning each a colour different from its already-coloured neighbours.

Since each removed node had fewer than $k$ neighbours, a valid colour is always available.

*Spilling:* if at any point every remaining node has $gt.eq k$ neighbours, we cannot guarantee a colouring.
The variable is *spilled* to memory: the compiler inserts load/store instructions around its uses.

== Instruction Selection

=== Refining the IR

The `Local("var")` instruction is replaced with more concrete representations since CPUs do not have a concept of variables. Each local variable is stored at an offset from the frame pointer on the stack.

- `Mem(e)`: a reference to memory at address $e$
- `Temp(t)`: a temporary variable $t$ created to hold intermediate results, eventually mapped to a register
- `Move(e_1, e_2)`: copy the result of evaluating $e_2$ into $e_1$ (a `Temp` or memory address)

=== Tree Pattern Matching

We have a tree-based IR where nodes have subtrees. The key idea for instruction selection is to match subtrees against patterns, and use these to guide how we emit code. When compiling, we create a `Temp` to store the output, emit code that writes to the temporary variable, and return the `Temp`, allowing us to recursively emit code for subtrees.

=== Binary Operations

If one subtree is a constant (fitting in a machine word), we can emit an immediate instruction (e.g. `addi tmpOut, tmp, c`). Otherwise, we recursively emit code for both subtrees and emit a register-register instruction (e.g. `add tmpOut, tmp1, tmp2`).

=== Load and Store Operations

A common pattern is loading memory at a given offset (e.g. loading a local variable from the stack frame). If the address is a base plus constant offset, we can use offset notation: `lw tmpOut, tmp(c)`. Otherwise we fall back to `lw tmpOut, tmp`. Move statements (stores) follow a similar pattern.

=== Control Flow: Jumps

There are two types of unconditional jumps: a *direct jump* to a name (`j lbl`), or an *indirect jump* to the address contained in a register (`jr tmp`). Conditional jumps are similar: we match on the binary operator and generate the corresponding branch instruction.

=== Maximal Munch

To minimise the number of instructions, a simple greedy algorithm called *maximal munch* suffices. It selects the locally best (largest) pattern match at each step.

```
maximalMunch(t, ps):
  p = largest pattern in ps that covers the top of t
  uncoveredSubtrees = subtrees of t not covered by p
  for s in uncoveredSubtrees:
    maximalMunch(s, ps)
  emit(t, p)
```

The algorithm is linear in the size of the tree and produces a minimal number of instructions for the given pattern set. For other definitions of "best" (e.g. applying cost heuristics), dynamic programming techniques may be necessary.
