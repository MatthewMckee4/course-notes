#set document(title: "Advanced Systems Programming — Past Paper Answers")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none, depth: 2)

= 2025

== Question 1

=== (a)

Advantages of enums

Using enums mean each state (enum variant) has the same type, meaning we can use the state in
another struct without having to mess with traits. This makes sense, when we know some type
of object can only ever have a fixed set of possible values, they should be represented with
an enum. Representing the possible actions with an enum is also very clean, and allows for
easy matching.

All transition logic is in one place, meaning it is very clear how each state is transformed
into another, and clear to see what effect each action has on each state.

```rust
match (state, action) {
    (x, y) => {},
    _ => Failure,
}
```

Additionally, it is easy to validate against some specification or protocol which you might
be aiming to follow.

Disadvantages of enums

If we had hundreds of different states, or actions, our transition table in our match expression
would get extremely hard to read and understand, meaning you would maybe want to refactor, losing
the benefit of having all transition logic in one place.

Each state takes up the same amount of space in memory, determined by the size of the largest
variant.

Advantages of structs

Using structs allows for a good separation of concerns, each state has each transition defined as
a function, make it explicit and clear what states you can transition to. It also makes the flow
of the program/states much clearer.

Using Rust's ownership model, and one of its ownership rules, that a value can have only one owner,
we can consume `self` when transitioning to a new state, this means that the old state cannot be used
as the value was moved, and no longer exists, and unused resources are now freed.

Disadvantages of structs

It is hard to accept external actions and map them to an action between structs, the existing
action enum could easily be parse from json or some other text stream, then passed onto our
transition function, but with no way to easily change the state from an outside actor, this
leaves us quite restricted.

Conclusion

I think the enum approach is better. I believe it makes sense that all states are the same type,
that it is clearer to see all possible transitions, and that we can use a state object in a
larger struct easily.


=== (b)

C programmers are already familiar with the concepts of memory management, as they have to manually
allocate and deallocate objects in almost every program, so they have to be thinking about
references and mutability. Though, as we know one of Rust's ownership rules is that each object has
one owner, C programmers may not be familiar with this concept, as it is often we see a program
where two objects may be 'owners' of the same value.

Whereas Java programmers don't have to actively think about memory management
due to the fact that Java is garbage collected, meaning heap allocated objects are automatically
deallocated without the programmer having to do anything manual. Only a small subset of Java programmers
will be thinking about memory, when they are building performance critical applications.

Because of these reasons, it is clear that most C programmers will already be familiar with basic
memory management and possible basic ownership concepts, where most Java programmers may not be
familiar at all, so I agree that they will be able to understand the ownership and memory management
concepts in Rust easier. There is really no part of Java that would give them the upper hand at
understanding this.

=== (c)

This is a very interesting question, and people have been attempting to build operating systems,
albeit small ones, in Rust for years now. Operating systems are obviously very complex systems,
arguably the most complex systems in the world, so they must be very secure. Since people are
successfully building kernels in Rust, it is clearly possible to partially build an OS in a
memory safe language like Rust. This has clear benefits, like Rust's memory safety and ownership
rules, while they may be somewhat limiting in some situations, overall it is beneficial, and this
is supported by the fact Rust has been introduced as an official language in the linux kernel,
which is mostly written in C.

Some areas where this could prove to be challenging, are situations where you need fine grain
control over low level resources, Rust offloads to a malloc call when heap allocations happen
but when we are booting the kernel and this is not available, we would need some lower level
abstraction that allows us to setup the initial page table and the heap requires raw physical
addresses before any safe abstraction is available.

== Question 2

=== (a)

A buffer overflow happens when a program writes more data into a fixed-size buffer than it can
hold, and the excess spills into the adjacent memory, allowing the extra code to poison another
program, this is the attack.

To mitigate this, we could mark the stack as non-executable, meaning any code that was smashed
into the stack, wouldn't be able to have a negative effect, or cause any damage.
We could also randomise the top of stack address, so the attacker no longer knows where their
buffer lives.

But these are just ways to partially mitigate the possibility of buffer overflow attacks.

=== (b)

Postel's law assumes a cooperative network where malformed inputs is a peer's honest mistake.
On today's internet, most malformed input is adversarial, and being liberal in accepting it
expands attach surface by forcing the parse to handle inputs outside of the spec, produces
implementation specific ambiguity that attackers weaponise, as in HTTP request smuggling and
URL-parser differentials, this can also cause protocol ossification, because middleboxes that
liberally accept only what they've already seen block genuine extension.

=== (c)

One reason, which i have experience is using foreign function interfaces (FFI), where the
Rust program calls C code and sometimes raw pointers are returned. And we require unsafe
Rust to be able to use them in Rust. unsafe blocks to not silence all errors: lifetimes,
ownership, type checking still applies, but dereferencing raw points is one thing that
can only be done in unsafe blocks. Throughout the Rust standard library unsafe blocks are
used, like in `Vec::push`, it writes to initialized memory at a raw offset. Low level
things like this can only be done in unsafe Rust.

This is not a problem with Rust, every safe language has an equivalent escape hatch:
Haskell's unsafePerformIO for example. A language without one cannot implement low level
core features so it cannot be used as a systems language at all.

== Question 3

=== (a)

Single-threaded performance stopped scaling around 2005 because the physical mechanisms
that delivered it ran into hard limits. Through the 1990s, Dennard scaling let supply
voltage drop with each process shrink, so rising clock frequencies didn't increase
power density. Around 2005 Dennard scaling ended - leakage current stopped voltage
from falling further - and clock speeds plateaued because higher frequencies blew the
thermal budget. At the same time, instruction-level parallelism had reached
diminishing returns: deeper pipelines and wider issue (e.g. Pentium 4) cost
disproportionately more transistors and power for shrinking gains. Moore's law
continued, so architects still had more transistors every generation, but the only
profitable way to spend them was replication — multiple simpler, cooler cores rather
than one faster core. Multicore was therefore forced by physics, not chosen for
elegance.

=== (b)

Deadlock. Imagine two actors A and B, each using blocking (synchronous) send/receive.
A sends a message to B and then blocks waiting for B's reply; at the same time B sends
to A and blocks waiting for A's reply. Neither actor ever reaches the code that would
consume the other's message, so both wait forever. The same pattern appears with
bounded mailboxes: if A's and B's mailboxes are both full and each actor only drains
its own mailbox after completing a send to the other, they deadlock. The cause is a
circular wait on communication, analogous to a circular wait on locks.

Race. With two clients and one bank actor, each client sends GetBalance, receives the
reply, checks balance >= 80, then sends Withdraw(80). If both clients read a balance
of £100 before either withdrawal is processed, both pass the check and the account
ends up overdrawn. Note that nothing is actually shared — the balance is owned by
the bank actor — so this is not a data race but a logical / protocol race: a TOCTOU
between the check (in the client, based on a stale reply) and the act (the withdraw
message arriving at the bank).

Comparison. Message passing eliminates the entire class of low-level data races,
because there is no shared mutable state for threads to tear or lose updates on —
this is a genuine and significant reduction. Deadlocks, however, are roughly as
likely as in lock-based code: the wait-for graph simply moves from locks to channels,
and blocking send/receive plus bounded mailboxes reintroduce the same circular-wait
hazards. Logical races like the bank example also persist, and are arguably harder
to catch than data races because standard race detectors don't see them. So: data
races — much less likely; deadlocks and protocol-level races — comparable, just
relocated.

=== (c)

Let-it-crash is appropriate when the enabling conditions hold: process isolation
(a crash can't corrupt another process's state), lightweight processes (restart in
microseconds), supervision trees that restart into a known-good state, and no shared
mutable state. In a massively concurrent system built on these — Erlang/OTP — it
is strictly better than defensive in-process handling for unexpected failures, because
restart is cheap and crashes are contained.

Armstrong's core argument: in-process recovery cannot handle the failures that matter.
If a process reaches a state you didn't anticipate, no if-branch recovers it — defensive
code only guards against imagined failures, and often hides real bugs. The trade-off:
let-it-crash keeps the happy path clean and handles unknown states, but requires
cheap restart and rebuildable state; in-process detection avoids restart latency
but adds defensive code everywhere, handles only enumerated failures, and risks running
on corrupted state. In a shared-memory system it isn't even safely available — killing
a thread mid-critical-section leaves torn invariants.

The two are not alternatives but handle different categories. Expected outcomes that
are really control flow (missing file, validation failure) should be `{ok, _}` |
`{error, _}` returns pattern-matched on; unexpected failures (bugs, unanticipated
state) should crash and be recovered by a supervisor. In-process detection remains
the right choice for processes with expensive non-resettable state, hard real-time
paths, and system boundaries returning specific errors. Otherwise, in a supervised
massively concurrent system, let-it-crash is the appropriate default.

=== (d)

Async code runs in an event loop, where there is a queue for what code should
be ran next. This means when something (a coroutine) in the event loop begins
IO or some async operation, and uses the `await` keyword, then it passes control
to the next item in the event loop queue, which then continues until it hits an
IO operation and this continues. This ensure, when done correctly, that we can
always be progressing and not waiting for IO, which is out of our control.

Advantages.

async IO can give a significant performance benefit. The
async/await structure of code is natural and relatively easy to understand,
meaning developers don't have much of a learning curve, and could add this to
their program at any time. There useful composition language specific features
that allow you to work with these coroutines in a natural way.

Disadvantages.

Programming language designers need to create async versions of common traits, or
functions, like `AsyncRead` for `Read` etc. Related to that, if you accidentally
use the wrong io function, like read instead of async read, this will block the
entire runtime, so you must ensure all code is acync friendly. This inconsistency
is usually mitigated in strictly typed languages, where using `await` on a non-
awaitable function would cause a type error, or you may have a linter that can
pick up on unused async results, but there's still always a change something could
fall through and ruin the performance of the program.

Threads are usually cheap, and modern machines can run thousands of threads. Unless
you are doing something very unusual, you can likely just spawn a thread, or use a
thread pool, and perform blocking IO.

Another note is that some languages actually are async first, so everything runs in
an event loop and io functions are async by default, restricting the user to work
with async/await, I think this is a good idea that could be useful for IO heavy
systems, but for applications where the interaction with the outside word is minimal
the async approach would not be too useful.

Finally, I think that it really depends what your program is trying to do, but as
mentioned before, using this async model would be ideal when working with heavy IO,
so making lots of http/https requests. But otherwise it is probably not worth it.

= 2024

== Question 1

=== (a)

Java's memory model states the following things:

- If a single thread writes a value to memory and later reads it back and
provided no other threads wrote to the same location, then the value that the
read reads will be the same as it wrote.
- changes to fields labeled with volatile are done atomically and automatically
visible to all threads
- access and changes to fields which are 32-bit in size, are atomic.
- if a non-volatile field is changes while holding a lock, and that lock is then
released by the writing threads and acquired by the reading thread, then the
change becomes visible to the reading threads.

This gives programmers certain guarantees about their program, allowing for more
confidence in production systems.

Depending on how old some legacy code, this may not have much of an effect.
Code that is very old, may not use multiple threads, and so a memory model
would not provide much benefit. For newer code, which does run in multiple
threads, one of the most common worries about multithreading is data races,
and memory models define what a data race is, though it does not help to
mitigate the chances of a data race.

One benefit of a memory model in general is more consistency across different
hardware, the memory model acts as an abstraction over the cpu, allowing code
to work the same over different machines.

Though, not all programs have a defined memory model, Rust and C for example,
I do think the work of defining a memory model, helps other languages, for
example, in Rust, there is no memory model, but there are traits like `Send`
and `Sync` that can help prevent data races, at compile time. This work
will have built on top of previous work around shared memory, in previous
languages.

= 2021

== Question 1

=== (a)

Threads are a good approach for concurrent systems, as they allow for multiple tasks or functions to run
at the same time, this means isolated parts of operating systems can run simultaneously. This is what is
done in most operating systems right now, more than 4,000 threads can be active at the one time.
This does not mean they are all running as we cannot have more threads running that we have cpu cores.
But this allows us to be weaving in and out of each thread, giving execution to each thread when another
thread is done, or can wait. This is especially advantageous for operating systems, as we may have to
wait on IO for example. Though, one disadvantage of using threads is having to deal with shared memory.
This could mean access to RAM, or the file system. These are shared resources that multiple threads will
want to access, possibly at the same time. This introduces a problem, that is usually solved with mutexes.
Mutexes are used to enforce mutual exclusion - at most one thread inside a critical section, writing to
a file for example. This means threads have to wait for resources and can't progress until they have access
to a given resource. This has the possibility of creating deadlocks, where threads are waiting on each
other, and both cannot progress.

So threads, are a good option for when you don't have to work with shared resources, or you can add mutexes
to shared resources, and have a way to recover from deadlocks and similar problems.

Transactions are very useful when you want to perform one more operations at the same time, and do not want
to have a state in the system where there are inconsistencies. By inconsistencies i mean, for example, if
you were writing a command to move a file from one place to another, like `mv`, then you would not want a
possibility of those files existing at the original place and the target, at the same time, as this would
create an invalid view of the system. So with transactions, you could ensure that this file only exists
at one place at any given time during this command. The main issue with transactions is that it is hard to
guarantee the ACID properties: atomicity, consistency, isolation, durability. This means it is hard to
restrict IO and other side effecting operations during transactions, and therefor hard to revert transactions
after then have executed, with a failure. Haskell does a great job of this, where you have to explicitly
label a function that requires IO, with the IO monad wrapping the return type. Though, this has not
propagated to other programming languages, making it hard to manage.

Transactions are a good option when you can guarantee the ACID properties,

Finally, message passing is great as it removed the need for shared state, all threads have their own thread-
local state, and any data that needs to be passed between threads goes through a message channel. There are
two main types of messaging channels: dynamically typed, and statically typed. These are useful for different
cases, but, this sort of depends on the language, so in Rust, we are required to fully type the send and
receive data, but in other dynamically typed languages, we may opt for a more dynamic approach, perhaps if we
do not plan to do anything with parts of the data, it may not be worth it to maintain those extra types.
In terms of operating systems,


Frankly I wouldn't say any specific approach for concurrent programming is the best. There are such a wide
range of challenges in the OS and device driver domain, so I think that anyone developing these would use
threads, transactions, and message passing.
