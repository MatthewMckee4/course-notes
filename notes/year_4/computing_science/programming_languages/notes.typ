#set document(title: "Programming Languages")
#set page(margin: 20pt)

#outline(title: none)

#pagebreak()

= Programming Languages

// 1.

==  Introduction and Programming Paradigms

=== Programming Paradigms

A Programming paradigm is a given style of programming that dictates the principles,
techniques and methods used to solves proglems in that languages.

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

== Syntax

=== Regular Expressions

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

=== Chomskys Hierarchy of Language

Chomsky's hierarchy of language is a classification of formal languages based on their generative power.

- Type 0: recursively enumerable
- Type 1: Context-sensitive
- Type 2: Context-free
- Type 3: Regular

Regular expressions are regular languages.
Context-free languages can be recognized by a push-down automation.
Context-sensitive languages and recursively enumerable languages require more interesting recognisers.

=== Grammars

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

Each terminal node is labelled by a terminal symbol, like digits and operators,
and each non-terminal node is labelled by a non-terminal symbol and can have children.

A grammar is ambiguous if we can derive two or more different parse trees for a string.

The syntax of a programming language should be unambiguous.

=== Abstract Syntax

Abstract syntax allows us to abstract away irrelevant syntactic noise so we can
concentrate on the important parts of a program.

We can also write abstract syntax as a tree, this is how every parsed program is represented.

To parse text into an AST, we tokenise text into chunks using regular expressions, lexing.
And match token streams and convert these into AST nodes, parsing.
