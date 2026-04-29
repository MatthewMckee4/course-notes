#set document(title: "Advanced Systems Programming — Past Paper Questions")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none, depth: 2)

#pagebreak()

= 2025

== Question 1

=== (a) [9 marks]

The lectures and laboratory exercises considered two ways of building state machines in
the Rust programming language, one using `enum` types to describe states and
transitions, the other using `struct` types to model states with functions implemented
on those structures to represent transitions. Describe the advantages and disadvantages
of the two approaches and discuss whether you think one approach or the other is
superior.

=== (b) [5 marks]

The type system of the Rust programming language tracks data ownership and ties memory
management to ownership. It has been suggested that this makes Rust easier for C
programmers to learn than for Java programmers. Discuss whether you agree that this
might be the case, explaining your reasoning.

=== (c) [6 marks]

Systems programs have generally been written in memory unsafe languages, such as C. It
is generally accepted that this is problematic, and that it's desirable to move to
memory safe languages where possible. Discuss whether it is possible to write an
operating system partially or entirely in a memory safe language. Give examples
highlighting areas where doing so would be difficult.

== Question 2

=== (a) [5 marks]

Studies have shown that most security vulnerabilities in deployed systems are due to a
lack of memory safety. The lectures described the classic, stack-smashing, buffer
overflow attack as an example of a memory safety vulnerability. Briefly describe how
this attack works and suggest ways in which it can be mitigated. Assume that it is not
possible to replace the vulnerable program with an implementation in a memory safe
language.

=== (b) [8 marks]

Postel's law states, in the context of network protocol implementation, "Be liberal in
what you accept, and conservative in what you send". Explain why Postel's law is no
longer appropriate in today's networks. Discuss how code that parses network data
should be organised, and how the use of strong types can aid such implementations.

=== (c) [7 marks]

The Rust programming language provides `unsafe` blocks, that allow certain aspects of
the type system to be circumvented. One of these aspects is the ability to dereference
raw pointers, that can provide unsafe memory access. Discuss, with examples, why Rust
provides for unsafe memory access in this way, and whether the presence of this feature
indicates a problem with the language.

== Question 3

=== (a) [4 marks]

Over the past decade, or so, processors have moved from emphasising single threaded
performance to supporting large numbers of concurrent threads, primarily by moving to
multicore processor designs. Explain why this transition has occurred.

=== (b) [5 marks]

Message passing systems are often said to avoid many of the problems inherent in
lock-based concurrency. However, message passing systems can still deadlock and race
conditions can still occur. Explain how deadlocks and race conditions can occur in
message passing systems and discuss whether you think they are more or less likely to
occur than in systems using lock-based synchronisation, justifying your answer.

=== (c) [6 marks]

Erlang is a message-passing concurrent language that adopts a "let-it-crash" approach
to error handling, where responsibility for handling failures in a task is given to a
separate supervisor task. Discuss whether the let-it-crash model is an appropriate way
of providing robustness in a massively concurrent system, or if in-process error
detection and recovery is more suitable. Your answer should include an explicit
discussion of the trade-offs between the two approaches.

=== (d) [5 marks]

One way of implementing asynchronous I/O operations is to structure the code as a set
of coroutines. In this model, operations that may block return a `Future<T>`
representing a value of type T that will become available at some later time. The
runtime system for such languages includes an `await` operation, that allows a function
to wait for a result to become available without blocking the thread, by passing
control to other coroutines while waiting. Discuss whether this is a good approach to
writing asynchronous code. Explain what are the strengths and weaknesses of this
approach to structuring code.
= 2024

== Question 1

=== (a) [10 marks]

The ubiquitous use of multithreading and multicore systems has forced programming
language designers to develop sophisticated memory models that describe in detail when
locked and unlocked writes to memory become visible to other threads. Outline the
benefits of having such a memory model in supporting legacy and new code. Discuss
whether you believe the use of shared memory, following the semantics defined in these
memory models, provides a suitable basis for future software development.

=== (b) [10 marks]

Garbage collection is widely used in applications programming but is generally not used
by systems programs. Discuss whether it would be possible, in principle, to implement
an operating system, including the device drivers and the network stack, in a garbage
collected language. Highlight areas of concern or where special treatment might be
needed.

== Question 2

=== (a) [5 marks]

The Rust programming language uses a number of different pointer types and ownership
tracking to achieve memory safety and prevent data races. This provides stronger safety
guarantees than many other programming languages, but at the expense of adding
complexity to the language and limiting the range of data structures that can be
readily expressed. Is the incremental gain in safety worth the complexity? Briefly
discuss the trade-offs to justify your answer.

=== (b) [3 marks]

The C programming language permits data to be read from the network into a `char *`
buffer then cast to an appropriate type representing the packet format. State three
reasons why this is unsafe.

=== (c) [4 marks]

The safe subset of the Rust language doesn't have the concept of a null pointer, and
instead relies on use of the `Option<T>` to indicate missing data. Explain why the use
of Option types is, in principle, safer than the use of null pointers. Briefly discuss
whether it is safer in practice.

=== (d) [8 marks]

The lectures discussed two different ways of representing state machines in Rust. The
first uses `enum` types to represent states and events that cause state transitions
with a function to represent the event-action mapping. The second uses `struct` types
to represent the state machine, with the state transitions implemented as methods of
that `struct` that consume variables representing the previous state and return
representations of the new state. Discuss when you would prefer to use each approach.

== Question 3

=== (a) [10 marks]

To avoid the problems inherent in languages that use multiple threads with shared
mutable state protected by locks, some languages enable concurrency by isolating tasks
and providing explicit message passing features. Explain why this approach does not
protect from deadlocks and race conditions. Discuss whether you think deadlocks and
race conditions are more or less likely to occur than in systems using message passing
compared to those using lock-based synchronisation, justifying your answer.

=== (b) [10 marks]

The Rust programming language provides support for asynchronous programming using the
`async` and `await` syntax. Other languages implement similar features. With
appropriate runtime support, this aims to provide efficient support for concurrent task
execution. Describe, with justification, the types of task that this form of
asynchronous programming is intended to support and those that it does not support
effectively. Discuss to what extent you believe this style of programming fits with the
Rust approach of using strong typing and safe defaults to prevent run-time errors.

= 2023

== Question 1

=== (a) [5 marks]

In the early 2000s, processor design moved from emphasising single threaded performance
to emphasising support for parallelism. This led to the number of processors cores per
device increasing rapidly. Explain why this transition occurred.

=== (b) [5 marks]

The Rust programming language expresses the concept of ownership, and the ability to
transfer ownership of data, as part of its type system. This allows Rust programs to
safely pass mutable data between threads without race conditions. Other programming
languages, for example Erlang, avoid race conditions by only allowing immutable data to
be passed between threads. Discuss whether you think the benefit of being able to
safely pass mutable data between threads in Rust is worth the complexity introduced in
the type system.

=== (c) [10 marks]

The Erlang programming language adopts the "let-it-crash" approach to error handling,
where responsibility for handling failures in a task is pushed out to a separate
supervisor task. Discuss whether this approach to error handling is appropriate for use
in systems programs, or if in-process error detection and recovery is better suited to
handling errors in systems programs. Your answer should include an explicit discussion
of the trade-offs between the two approaches.

== Question 2

=== (a) [10 marks]

A common pattern in some C programs that process binary data, for example network
packet formats or compressed image or video file formats, is to write code similar to
the following example:

```c
struct rtp_packet {
    unsigned short v:2;   /* packet type            */
    unsigned short p:1;   /* padding flag           */
    unsigned short x:1;   /* header extension flag  */
    unsigned short cc:4;  /* CSRC count             */
    unsigned short m:1;   /* marker bit             */
    unsigned short pt:7;  /* payload type           */
    uint16_t       seq;   /* sequence number        */
    uint32_t       ts;    /* timestamp              */
    uint32_t       ssrc;  /* synchronisation source */
}
...
char *buffer = malloc(BUFLEN);
if (recvfrom(fd, buffer, BUFLEN, 0, &addr, &addrlen) > 0) {
    struct rtp_packet *pkt = (struct rtp_packet *) buffer;
    if (pkt->v == 2) {
        // Process packet
        ...
    } else {
        ...
    }
}
```

This example uses `recvfrom()` to read data from a UDP socket and stores it in
`buffer`, a heap allocated array of bytes. It then takes a pointer to a structure of
some different type, in this case `struct rtp_packet`, and uses a cast to make it
point to the contents of the buffer, allowing access as if the buffer was of that type.

Discuss what are the advantages and disadvantages of this approach, and state whether
you think it is an appropriate design pattern to use in modern systems. Your answer
should mention the type and memory safety implications of this technique.

=== (b) [10 marks]

It has been claimed that the use of modern programming languages, with expressive type
systems, can improve software security. Do you agree? Discuss and justify your answer,
giving examples to illustrate key points.

== Question 3

=== (a) [10 marks]

One of the key features of systems programming languages is that they provide control
over the layout of data in memory. Explain why this is important, and outline what
features of the C and Rust programming languages provide this control.

=== (b) [4 marks]

Rust distinguishes between shared immutable references to data (`&`) and uniquely owned
mutable references (`&mut`). Explain why this distinction is made, and what benefits it
provides.

=== (c) [6 marks]

The design of Rust encourages programming in a largely functional style, passing
immutable data and writing pure functions. Discuss whether you think a functional
programming style is appropriate for systems programming, highlighting both advantages
and disadvantages.

= 2022

== Question 1

=== (a) [7 marks]

Modern programming languages and runtime environments place a strong emphasis on
support for concurrent and distributed programming. With reference to trends in
computer systems design, and the environment in which systems programs operate, discuss
why this might be the case.

=== (b) [5 marks]

The lectures presented statistics showing that around two-thirds of reported software
security vulnerabilities relate to the lack of memory safety in certain programming
languages. Briefly explain what is memory safety, and discuss why lack of memory safety
can result in security vulnerabilities.

=== (c) [8 marks]

The Rust programming language uses a region-based approach for memory management. This
introduces complexity into the type system, since it must track ownership and borrowing
of data, and makes implementation of certain data structures problematic. In return, it
ensures predictable and safe memory management. Other programming languages make a
different trade-off, offering a simpler type system but providing fewer guarantees
around memory safety or less predictable memory management. Do you think Rust makes the
right trade-off for its intended uses cases and given the expected skills and
experience of developers? Justify your answer.

== Question 2

=== (a) [5 marks]

It's common for programming languages to support concurrency by providing multiple
threads of execution within a single address space, along with locks to control access
to shared mutable data. This is the model adopted by the C programming language with
the _pthreads_ library, and by Java with synchronised methods, for example. Discuss
what are the problems inherent in this programming model, considering in particular
correctness of the resulting code and composition of operations. Use pseudocode
fragments to provide examples that illustrate key points.

=== (b) [15 marks]

As an alternative to the thread-based programming model, some languages offer support
for concurrency via transactions with automatic roll-back and retry, or through message
passing. Systems that use message passing can be further subdivided into those that
avoid concerns about shared mutable state by making messages immutable, and those that
avoid such problems by tracking ownership to prevent shared access of mutable data.
Such languages and systems were discussed in the lectures, and in the recommended
reading for the course. Outline the advantages and disadvantages of each of these three
approaches for systems programming. Discuss, with justification, which approach you
consider to be the most promising approach for improving systems programming; if you
think none are promising, explain why.

== Question 3

=== (a) [10 marks]

A number of programming languages have invested significant effort to provide language
and runtime support for asynchronous programming. Describe what is asynchronous I/O and
how it differs from synchronous I/O. Discuss the advantages and disadvantages of
providing language and runtime support for asynchronous programming.

=== (b) [10 marks]

We discussed the concept of _type-driven development_ in the lectures. In this approach
to software development the initial focus is on defining appropriate types to model the
solution, then on writing the function prototypes for key type transformations and
major operations of the program, and only then refining and completing the
implementation. That is, the structure of the design and implementation is determined
by the type-level model of the solution space. This is at odds with certain other
implementation strategies, where the focus is first on the actions and operations,
treating the types as more of an implementation detail. Discuss whether you believe
type-driven development using a strongly typed language is a good approach to software
development or not. Justify your answer, highlighting both strengths and weaknesses of
the approach.

== Question 4

=== (a) [20 marks]

The recommended reading included Shapiro's paper entitled "Programming language
challenges in systems codes: why systems programmers still use C, and what to do about
it" (ACM Workshop on Programming Languages and Operating Systems, San Jose, CA, USA,
October 2006) and "The bugs we have to kill" by Bratus, Patterson, and Shubina (USENIX
;login:, August 2015). These papers suggest that the way we write systems programs has
to change if we are to successfully develop secure, highly concurrent, and networked
systems in the future. In particular, the authors suggest that we should use strongly
typed, memory safe, programming languages to improve overall robustness of the code,
that those languages need to give control over data layout and memory access, and that
we need to pay special attention to input parsing and handling of untrusted data.

Do you agree with the thesis of these papers? Discuss the extent to which you believe
that changing the programming language, and using better tools to parse and process
untrusted input, will help to address the challenges inherent in building secure,
highly concurrent, networked systems. Discuss what programming language and runtime
features, and what features of parsing tools, you consider important to support secure
systems programming, and what are harmful. Give examples to illustrate key points.

= 2021

== Question 1

=== (a) [12 marks]

A common approach to concurrent programming is to use multiple threads of execution,
with locks protecting concurrent access to shared state. As an alternative, some
languages offer support for concurrency via transactions with automatic roll-back and
retry, while others support a concurrent actor model with message passing
communications. Discuss the advantages and disadvantages of these approaches, when
applied to developing operating systems code and device drivers. State which you think
is most suitable for this problem domain. Justify your answer.

=== (b) [8 marks]

Message passing systems with synchronous communication force the message sender and
receiver to rendezvous to exchange a message. In asynchronous message passing systems,
the sender continues after sending the message, that is buffered for later delivery.
Discuss how these two different approaches affect the concurrency and reliability of a
message passing system.

== Question 2

=== (a) [6 marks]

Operating systems typically organise the virtual address space used by a process so
that the memory used by the stack is separate to the memory used by the heap. Outline
what data is stored on the stack and what is stored on the heap. Explain why the stack
and the heap need to be separate regions of memory.

=== (b) [10 marks]

The C programming language provides low-level control over data layout, allowing the
programmer to precisely control how data structures are represented in memory. It is
also not a memory safe language, permitting arbitrary pointer arithmetic and casts
between data types, and allowing a program to interpret a region of memory as many
different types. Considering the implementation of operating systems and device
drivers, highlight areas where this combination of precise control over data layout and
weak type checking is a strength of C, and areas where it is a weakness. Discuss
whether you believe C makes the right trade-off between safety and control.

=== (c) [4 marks]

The Rust programming language provides `unsafe` blocks, that allow certain aspects of
the type system to be circumvented. One of these aspects is the ability to dereference
raw pointers, that can provide unsafe memory access. Discuss why Rust provides for
unsafe memory access in this way, and whether the presence of this feature indicates a
problem with the language.

== Question 3

=== (a) [3 marks]

Studies have shown that most security vulnerabilities in deployed systems are due to a
lack of memory safety. The lectures described the classic, stack-smashing, buffer
overflow attack as an example of a memory safety vulnerability. Briefly describe how
this buffer overflow attack works.

=== (b) [3 marks]

Two mitigations for the classic buffer overflow attack are to randomise the location of
the top of the stack, and to randomise the addresses at which shared libraries are
loaded. Explain how these changes reduce the effectiveness of buffer overflow attacks,
and why such mitigations are more effective on 64-bit systems than on 32-bit systems.

=== (c) [8 marks]

Safely parsing protocol data units is one of the key challenges in building secure
networked systems. A long-standing principle when designing parsing code in such
systems is expressed in Postel's law, that states "Be liberal in what you accept, and
conservative in what you send". Discuss to what extent Postel's law is still applicable
to modern networked systems.

=== (d) [6 marks]

In addition to memory safety, a key benefit of modern systems programming languages is
that they have expressive type systems, capable of modelling features of the problem
domain. Discuss to what extent the principle of type-driven development can help to
improve the security of networked systems, giving examples to illustrate such
approaches.

== Question 4

=== (a) [12 marks]

It has been suggested that the C programming language is no longer appropriate for
writing systems code, and that new programming languages can improve systems
programming. Discuss the extent to which you believe that changing the programming
language will help to address the challenges in building secure, high performance, and
robust systems programs, and to what extent the challenges of building systems programs
are inherent in the problem domain. Give examples to show what features of modern
programming languages are beneficial for systems programs, and what are harmful.

=== (b) [8 marks]

Briefly describe what is meant by a _type-driven development_ approach to designing and
implementing programs. Discuss whether the level of abstraction of operating systems
and device driver code is such that type-driven approaches to development are likely to
offer benefits compared to more traditional approaches, or will result in excessive
cognitive overhead in designing types.
