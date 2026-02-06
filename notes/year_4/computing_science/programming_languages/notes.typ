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
