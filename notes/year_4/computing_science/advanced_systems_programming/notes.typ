#set document(title: "Advanced Systems Programming")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none)

#pagebreak()

= Systems Programming

// 2a.

== Systems Programming

Systems programs comprise infrastructure components: operating systems, device drivers, network protocols and services.
Constrained by *memory management*, *I/O operations* and management of *shared state*.

=== Memory Management and Data Representation

*Memory management* must be *predictable*: timing must be bounded for real-time applications, there must be bounds on memory usage.

*Data representation and locality* matters for performance. As the size of the objects being read increases, the read throughput drops. As the stripe increases, the read throughput drops. CPUs can read small and close together objects very quickly.
Systems must have exact bit level control over the data representation.

=== I/O Operations

Ethernet bit rate has grown near exponentially. MTU (maximum transmission unit) has remained constant, but packet rate has increased.
The I/O stack has become a bottleneck.

=== Management of Shared State

Systems programs are responsible for managing shared mutable state. Like state shared across layers/between kernel and applications.
Systems programs are often the bottleneck for performance. All higher-level applications depend on them.
That's why systems programing languages offer low-level control over memory and I/O.

// Readings:
// - https://dl.acm.org/doi/10.1145/1215995.1216004

// 2b.

== The State of the Art

Most devices run some variant of Unix and are programmed in C.


=== Unix and C: Strengths

Unix gained popularity due to portability and ease of source code access:
- Small, relatively consistent set of API calls.
- Low-level control.
- Robust and high performance.
- Easy to understand and extend.

Portability was due to the C programming language:
- Simple, easy to undestand, easy to port to new architectures.
- Explicit pointers, memory allocation, control of data representation.
- Uniform treatement of memory, device registers, and data structures.
- Easy access to write device drivers, network protocols and interface with external formats.
- Weak type system allows aliasing and sharing.

=== Unix and C: Weaknesses

Unix:
- Networking and filesystem APIs can be bottlenecks.
- Security architecture insufficiently flexible.
- No portable APIs for motibility, power management, etc.

C:
- Limited concurrency support.
- Undefined behaviour, buffer overflows.
- Weak type system - difficult to reason about correctness.

Unix has proven surprisingly resilient and portable.

C is increasingly a liability.
- Too easy to introduce security vulnerabilities.
- Too easy to trip over undefined behaviour.
- Insufficient abstractions.

// 2c.

== Challenges and Limitations

Moore's law: The number of transistors in a dense integrated circuit doubles approximately every two years.
Most vulnerabilities are due to weak typing and lack of memory safety.
Computing increasingly implies mobile devices, always on but constrained by battery life, always connected but constrained by heterogeneous networks.

#pagebreak()

// 2d.

== Next Steps in Systems Programming

Modern type systems and functional programming techniques can help to:
- Improve memory management and safety - while maintaining control of allocation and data representation.
- Improve security - elimenates common classes of vulnerabilities.
- Improve support for concurrency - elimenates race conditions.
- Improve correctness - elimenates common classes of bugs.

*What is a modern type system?*

Can provide useful gaurantees about program behaviour - prevent buffer overflows, use-after-free, race conditions.

Provide a model of the problem that prevents inconsistencies in the solution - no cost abstractions, describe constraints on program behaviour in the types.

*What is functional programming?*

Emphasises immutability and pure functions. Avoiding shared state and mutable state.
And so it is thread safe by default.

*How to Improve Memory Management and Safety?*

C has manual memory management through `malloc` and `free`. Arrays dont store length, so the runtime cannot check for out of bounds access. This was structured this way because memory used to be expensive.

Manual memory management leads to:
- Use-after-free bugs
- Memory leaks
- Buffer overflows
- Iterator invalidation

Modern machines have millions of times more memory and processors tens-of-thousands of times faster, making the old constraints less relevant. Compilers can now often remove unnecessary bounds checks through optimization.

*Security Impact*

Microsoft data (2006-2018) shows ~70% of security vulnerabilities relate to memory safety issues. Memory-safe languages could eliminate two-thirds of security vulnerabilities.

*Type Systems for Security*

Vulnerabilities often result from mismatched assumptions between code components. One part assumes a property is true, validation is supposed to happen elsewhere, but checks are missed.

Solution: Encode assumptions and constraints into types so compilers can automatically check consistency.

Example: Berkeley Sockets API uses simple integers for file descriptors, making it possible to mix up listening and connected sockets. Better design would use distinct `ListeningSocket` and `ConnectedSocket` types.

*Concurrency Improvements*

Traditional approach uses threads, locks, and shared mutable state (pthreads in C, synchronized methods in Java). Problems:
- Easy to get locking wrong (too many/few locks, wrong order)
- Locks don't compose well
- Example: Bank account transfers need additional locking beyond individual account locks

Two approaches to avoid concurrency problems:
1. Functional programming - no race conditions with immutable data
2. Ownership tracking - atomic data transfer, single owner, data either mutable OR visible to others, never both

*Type-Driven Design*

Use compiler as debugger for designs by:
- Defining domain-specific types (PersonID, Age, Temperature vs generic int)
- Encoding constraints in types (when objects can be used)
- Checking design consistency at compile time

Modern languages like Rust can detect iterator invalidation and use-after-free at compile time. Idris can detect buffer overflows at compile time.

*Key Principle*

Systems programs have reached complexity limits that humans can't manage. C gives precise control but exercising that control is too difficult. Strongly-typed languages provide same control with added safety, using type systems to eliminate bug classes and model problem spaces effectively.

= Types and Systems Programming

// 3a.

== Strongly Typed Languages

A *type* describes what an item of data represents

*What is a Type System?*

A type system is a set of rules constraining how types can be used.
- What operations can be performed on and with a type
- How does a type compose with other types of data

A type system proves the absence of certain program behaviours
- It doesn't guarantee the program is correct
- It does guarantee that some incorrect behaviours do not occur

We want a language where the type system is sophisticated enough to catch real problems, not just syntactic errors.

There are weak and strong, static and dynamic type systems. Weak type systems allow implicit conversions between types, while strong type systems enforce strict type checking. Static type systems check types at compile time, while dynamic type systems check types at runtime.

*Static and Dynamic Types*

In a language with static types, the type of a variable is fixed:
- Some required types to be explicitly declared, others can infer types from context
- Just because the language can infer the type does not mean the type is dynamic

In a language with dynamic types, the type of a variable can change.

Dynamically typed languages tend to be lower performance, but offer more flexibility
- They have to store the type as well as its value, which takes additional memory and processing time
- They can make fewer optimisations based on the type of a variable.

Systems languages generally have static types, and be compiled ahead of time, since they tend to be more performance sensitive.

*Strong and Weak Types*

In a language with *strong* types, every operation must conform to the type system,
Operations that cannot be proved to conform to the typing rules are not permitted.

Weakly types languages provide ways of circumventing the type checker. This might be automatic safe conversions between types:

```c
float x = 6.0;
double y = 5.0;
double z = x + y;
```

A *safe* language, whether static or dynamic, knows the types of all variables and only allows legal operations on those values.

An *unsafe* language allows the types to be circumvented to perform operations the programmer believes to be correct, but the type system can't prove to be so.

Why is Strong Typing Desirable?

Results of a program using only strong types are well-defined (a safe language), the program will only ever perform operations on a type that are legal.

*Segmentation faults*

Segmentation faults should never happen:
- Compiler and runtime should strongly enforce type rules
- If a program violates them, it should be terminated cleanly
- Security vulnerabilities come from undefined behaviour after type violations

The C programming language is very bad for undefined behaviour, it has 193 kinds of undefined behaviour.

Why is C weakly typed?

- The designers of C were not type theorists
- The original machines on which C was developed didn't have the resources to perform complex type checks
