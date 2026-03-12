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

A grammar is a set of format rules specifying how to construct a sentence in a language.
This consists of a set of terminal symbols that occur in a sentence, a distinguished
sentence symbol that stands for a complete sentence, a set of non-terminal symbols,
which each stand for part of a phrase and a set of production rules that specify how
to construct a phrase from other phrases.

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

An example of a let binding in our language is

```
let x = (5 + 10) in x * x
let x = M in N
```

Let expressions act as a binder for a variable. All occurrences of x here are bound occurences.
A variable is free if it is not in the scope of a quantifier. A quantifier $forall x . P$ binds
all free occurrences of x in its body P.

For example c is free in $"isFriday" -> "Rainy"(c)$,
but bound in $exists c in "Cities", "isFriday" -> "Rainy"(c)$

Free variables in our language formally

== Name Shadowing

Scopes of variables inside "in" inside a let binding.

== Substitution

We can define a substitution operation like

$
M {V \/ x}
$

This means, replace all free occurrences of x in term M with value V.

== Alpha Equivalence

Two terms are alpha equivalent if they are the same up to renaming of bound variables.

= Functions and Recursion

== Lambdas

We can use lambdas with currying to act like normal functions.

$lambda x . M$

Let and let fun are syntactic sugar, we can do everything with lambdas

== Semantics

A function on its own shouldn't reduce further.

To evaluate a function application "M N" we evaluate the function down
to a lambda expression. evaluate the argument down to a value V.
Then replace all occurrences of x in M with V, and evaluate the result.

== Variable Capture

Substitution can capture variables, but this is not intended.
Whenever we need to substitute under a binding, if we pick fresh names (unused elsewhere)
for each of the binders, to generate an alpha equivalence.

Let "M(x <-> y)" be a swapping operation that renames x to y, and y to x, in M.

We define "subst(M, N, x)" as the operation to substitute N for x in M,
freshening variables where required.

= Types and Typechecking

== Types

Types classify terms. Let's begin by considering base types.

$
  "Types" "A", "B" := "Int" | "Bool"
$

$ (tack M : "Int" quad tack N : "Int") / (tack M + N : "Int") $

=== Generalising to other binary operations.

We can specify meta-level functions: a function wh'er defining when describing our language.

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
  (x : A in tack M : B) / (Gamma ⊢ lambda x^A . M : A -> B)
$

= Data Types

== Product Types

It is often useful to have pairs of values. We say that pairs have a product type A x B.

This can be thought of as the cartesian product of types.
tuples of (A, B) is a product type.

== Record Types

We often want to give labels to values inside data.

== Sum Types

Can be thought of as enums.

To construct a sum type A + B, we use sum injection functions to say whether we're
providing a value of type A or B.

To use a sum type, we need to analyse it to determine whether it was constructing
using the left or right injection. We can match over it.

=== Variant Types

A sum type with more than two values. can also be encoded via nested sum types.

Enums can be encoded as a variant type and then can be encoded as a sum type.

== Recursive Types

We can define lists as having a default case '[]' and then [1,2,3] is syntactic sugar for
1 :: (2 :: (3 :: []))).

```
type IntList = [ ]
  | Int :: IntList
```

= Imperative Programming

Statements do not evaluate, they affect a state and return a new state.

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

=== Variables

An *address table* maps variable names to (locale, address) pairs, where locale is `GLOBAL` or `LOCAL`.
A variable reference compiles to `LOADG a` or `LOADL o` depending on locale.

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

Native code is register-based, architecture-specific (RISC vs CISC), with no interpretation overhead.

== Compilation Pipeline

Frontend (parsing/typechecking) $arrow.r$ Compilation to IR $arrow.r$ Instruction Selection $arrow.r$ Control Flow Graph $arrow.r$ Liveness Analysis $arrow.r$ Register Allocation.

== Intermediate Representations

It is better to compile to an IR first rather than directly to native code. A classic example is LLVM. This allows many frontends to share the same backend pipeline. Many compilers use multiple IRs.

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
