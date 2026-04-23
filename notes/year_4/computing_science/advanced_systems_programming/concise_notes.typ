#set document(title: "Advanced Systems Programming (Concise)")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline(title: none)

#pagebreak()

= Systems Programming

Systems programs comprise infrastructure: operating systems, device drivers, network protocols.
Constrained by *memory management*, *I/O operations*, and *shared state*.

- *Memory management* must be predictable (bounded timing for real-time, bounded usage). Data representation and locality matter for performance -- CPUs read small, close-together objects quickly.
- *I/O* stack has become a bottleneck as packet rates increase while MTU stays constant.
- *Shared state* management across layers/between kernel and applications is often the performance bottleneck.

== The State of the Art

Most systems run Unix and are programmed in C. Unix is portable, has a small consistent API, and is robust. C offers explicit pointers, memory control, uniform memory treatment, and easy hardware access.

*Weaknesses:* C has limited concurrency support, undefined behaviour, buffer overflows, and a weak type system. ~70% of security vulnerabilities relate to memory safety issues (Microsoft, 2006-2018).

== Next Steps

Modern type systems and functional programming can improve memory safety, security, concurrency, and correctness -- while maintaining low-level control.

*Type systems* prove the absence of certain program behaviours (buffer overflows, use-after-free, race conditions). *Functional programming* emphasises immutability and pure functions, making code thread-safe by default.

*Type-driven design:* encode assumptions and constraints in types so the compiler checks consistency. E.g. use distinct `ListeningSocket`/`ConnectedSocket` types rather than plain integers.

*Concurrency:* two approaches to avoid problems with locks: (1) functional programming with immutable data, (2) ownership tracking where data is either mutable OR shared, never both.

#pagebreak()

= Types and Systems Programming

== Type Systems

A *type* describes what data represents. A *type system* constrains how types can be used and proves the absence of certain incorrect behaviours.

- *Static* types: fixed at compile time (may be inferred). *Dynamic* types: can change at runtime (store type alongside value, lower performance).
- *Strong* types: every operation must conform to type rules. *Weak* types: allow circumventing the type checker (e.g. implicit conversions).
- A *safe* language only allows legal operations on values. An *unsafe* language allows type circumvention.

Segmentation faults should never happen -- the compiler/runtime should enforce type rules. C has 193 kinds of undefined behaviour.

== Introducing Rust

Rust is a strongly-typed systems language with:
- No undefined behaviour, no buffer overflows, no dangling pointers, no null pointer dereferences
- Deterministic automatic memory management (prevents use-after-free, iterator invalidation, most memory leaks)
- Ownership rules prevent data races in concurrent code

*Basic types:* `u8`-`u64`, `i8`-`i64`, `f32`/`f64`, `bool`, `char`, `usize`/`isize`.

*Traits* describe shared functionality, similar to interfaces. Derived via `#[derive(Debug)]`. Can have associated types.

*Enums* can be unit, tuple, or struct variants. `Option<T>` (`Some(T)` / `None`) replaces null pointers safely. References can never be null.

*References:* `&T` (shared, immutable) and `&mut T` (unique, mutable). Multiple `&T` or exactly one `&mut T`, never both.

*`Box<T>`*: heap-allocated smart pointer, automatically deallocated when out of scope. Does not implement `Copy` -- only one owner exists.

*Strings:* `&str` is an immutable string slice (built-in), `String` is a mutable buffer (standard library, `Deref<Target=str>`).

=== Pattern Matching

`match` exhaustively pattern matches on values. The compiler enforces all cases are handled.
`if let` is a concise alternative when only one variant is of interest.

```rust
match msg {
    Message::Quit           => println!("quit"),
    Message::Move { x, y } => println!("move to ({}, {})", x, y),
    Message::Write(s)       => println!("{}", s),
}
```

=== Closures and Iterators

*Closures* are anonymous functions that capture variables from their enclosing scope.
By default they capture by reference; `move` closures take ownership (needed for threads).

```rust
let add = |x, y| x + y;
let name = String::from("Alice");
let greet = move || println!("Hello, {}!", name);
```

*Iterators* are lazy sequences with composable adapters (`filter`, `map`, `sum`, etc.).
They are *zero-cost abstractions* -- compiled to equivalent hand-written loops.
`.into_iter()` transfers ownership; `.iter()` borrows.

== Ownership

Rust tracks ownership, enforcing every value has a single owner. Three patterns for function calls:
- *Consume:* take ownership by value. Caller loses access; freed at end of function.
- *Borrow:* take a reference (`&T` or `&mut T`). Ownership stays with caller.
- *Return:* pass ownership of return value to caller (moved to caller's stack frame).

Returning a `Box<T>` moves the box; the heap-allocated `T` is not copied.

=== Guarantees from Ownership

- *No dangling references:* cannot return a reference to a local variable (compile error E0106).
- *No use-after-free:* cannot use a value after it has been moved (compile error E0382).
- *No iterator invalidation:* iterator holds `&T`, preventing mutable access to contents.

=== Safe Borrowing

`&T` -- shared reference to immutable data. `&mut T` -- unique reference to mutable data.
An object can have one or more `&T`, or exactly one `&mut T`, but not both simultaneously.
Existence of `&T` to mutable data makes it temporarily immutable.

=== Limitations

- Cannot express cyclic data structures (e.g. doubly linked list) in safe Rust. Escape hatch: `unsafe` and raw pointers.
- Cannot express shared ownership of mutable data. `RefCell<T>` dynamically enforces borrowing rules.

=== Lifetimes

Every reference has a *lifetime* -- the scope for which it is valid. Usually inferred, but sometimes must be annotated:

```rust
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}
```

`'a` means the returned reference lives at least as long as the shorter of the two inputs.
*Lifetime elision* rules handle common cases automatically (single input reference, `&self` methods).

Lifetimes prevent returning references to locals, references to freed data, and storing references that outlive their data.

=== Shared Ownership: `Rc<T>` and `Arc<T>`

When shared ownership is needed (single-owner rule is too restrictive):
- `Rc<T>` (*reference counted*): multiple owners in a single thread. Cheap, no atomics.
- `Arc<T>` (*atomically reference counted*): multiple owners across threads. Thread-safe, slightly more expensive.

For interior mutability with `Rc`, use `Rc<RefCell<T>>` -- defers borrow checks to runtime.

Rust's innovations: enumerated types with pattern matching (`Option`/`Result`), traits (from Haskell type classes), ownership (from Cyclone).

#pagebreak()

= Resource Ownership and Memory Management

== Memory Layout

A process in memory (low to high address):
- *Program text:* compiled machine code.
- *Data segment:* initialised globals, string literals. Values known at compile time.
- *BSS segment:* uninitialised static globals, zeroed at load time. Address randomised (ASLR) as a security measure.
- *Heap:* explicitly allocated memory (`malloc`/`calloc`). Grows upward. May be padded for alignment. Modern `malloc()` is thread-aware, splitting the heap per-thread to avoid cache sharing.
- *Stack:* function parameters, return address, pointer to previous stack frame, local variables. Grows downward, managed automatically by compiler-generated code. Calling convention standardised per processor/language. Ownership follows function invocation.
- *Memory-mapped files / shared libraries:* mapped via `mmap()`. Demand-paged from disk. Used for `.so`/`.dll` files.
- *Kernel:* top of address space, not directly accessible. `syscall` instruction calls into kernel.

*Buffer overflow attacks:* write past array bounds, overwrite return address with attacker code. Mitigations: non-executable stack, ASLR. Real solution: type-safe language with bounds checks.

== Automatic Memory Management

Goal: find heap memory no longer in use and reclaim it. Better to waste memory than deallocate a live object.

=== Reference Counting

Extra integer allocated alongside every object, counts references. Incremented on new reference, decremented on drop. If count reaches 0, memory reclaimed.

*Benefits:* predictable, understandable.
*Costs:* cyclic structures never reach count 0. Mutex needed for concurrent access. Significant overhead for small objects. Best suited for large, long-lived data.

=== Region-based Memory Management

Tracks lifetimes of stack values and heap references. In Rust, `Box<T>` on the stack references heap data; when the box goes out of scope, heap memory is freed (RAII). Prevents dangling references. Deterministic cleanup via the `Drop` trait.

#pagebreak()

= Garbage Collection

The principle of garbage collection is to avoid the problems of reference counting (cycles) and the complexity of compile-time ownership tracking. The collector traces through all heap-allocated objects, recording which are in use and disposing of the rest. This is a separate phase of execution -- the mutator (program) and collector are interleaved.

== Mark-Sweep

Two-phase algorithm. Non-incremental: the program is paused (stop-the-world) when memory becomes tight.

*Marking phase:* determine the *root set* -- global variables and variables on the stack in any existing stack frame. Traverse the object graph from the root set (BFS or DFS), following every pointer to find all reachable objects. Mark each as alive (set a bit in the object header or in a separate table). Stop at previously-seen objects to handle cycles. A cycle of objects not reachable from the root set will *not* be marked -- this is how GC handles cyclic garbage (unlike reference counting).

*Sweep phase:* pass through the entire heap. Reclaim any unmarked object's space and add it to a *free list*. New allocations are placed in free-list blocks where they fit, or in unused heap memory.

*Drawbacks:* stop-the-world pause is unpredictable (depends on live objects and heap size). Sweeping the entire heap in unpredictable order disrupts cache and virtual memory. Objects placed where they fit rather than where locality is maintained -- *fragmentation*.

== Mark-Compact

Three phases: mark (as above), sweep, then *compact* -- move all live objects to be contiguous, leaving one large block of free space.

*Advantages:* eliminates fragmentation. Allocation is very fast -- just increment the pointer to the start of free space (pointer bump).

*Disadvantages:* collection is slower (objects must be moved in memory, all pointers to moved objects must be updated). Poor locality during collection itself.

== Copying Collectors

Integrate marking and copying into a single pass. The heap is split into two equal *semispaces*. Allocations are made linearly from one semispace (fast, no fragmentation).

When the active semispace is full, the collector runs:
- *Cheney algorithm* (breadth-first copying): maintain a queue starting with the root set. For each object in the queue, copy it to the other semispace and mark the original as processed. Add any unprocessed objects it references to the queue. When the queue is empty, all live objects have been copied.
- Everything remaining in the old semispace is garbage.

Collection time depends on the amount of *live* data copied (not total heap size). Only half the heap is usable at any time. If most objects die young, increasing semispace size trades memory for less frequent collection.

== Generational Collection

*Generational hypothesis:* most objects have a short lifetime; a small percentage live much longer. The longer an object has lived, the longer it is likely to live.

The heap is split into regions for *young* and *old* objects. The young generation is collected frequently (cheap -- most objects are garbage). Objects surviving several collections are *promoted* to the old generation. Gains diminish rapidly with more than two or three generations.

*Inter-generational references:*
- Young $arrow.r$ old: usually fine, since most young objects die before the old objects are collected.
- Old $arrow.r$ young: problematic -- requires scanning the old generation to find these. Solved with an *indirection table* (pointers to pointers) for old-to-young references. This table is part of the young generation's root set. Moving objects in the young generation only requires updating the indirection table, not the old objects themselves.

== Incremental Collection

Spreads GC cost across program execution rather than stopping the world. Important for real-time applications.

Interleaves small amounts of GC with small runs of program execution. Uses *tricolour marking*:
- *White:* not yet checked. *Grey:* live, but children not yet checked. *Black:* live, all children checked.
- Collection proceeds as a wavefront of grey objects. At the end, anything still white is unreachable garbage.

*Key invariant:* a black object must never point directly to a white object (black means "fully checked", so a white child would be missed).

When the program creates a black-to-white pointer, coordination is needed:
- *Read barrier:* trap reads of white objects, colour them grey immediately. The program can never see a white object, so it cannot create a black-to-white pointer. More expensive (reads are frequent).
- *Write barrier:* trap pointer writes from black to white objects, recolour one of them grey. Generally cheaper since writes are less common than reads.

If the program creates too many new references requiring coordination, the collection may never complete. Resolved by forcing a stop-the-world collection when free memory is exhausted or after a timeout.

*Real-time collectors* are built by scheduling an incremental collector as a periodic task. The amount of garbage collectible per period can be measured based on how fast the collector can scan memory.

== Practical Factors

- GC programs use significantly more memory than correctly written manual management. Copying collectors specifically double memory usage (two semispaces).
- Weakly-typed languages (C) require *conservative collection*: the collector cannot reliably distinguish pointers from integers, so it treats anything that could be a pointer as one. Strongly-typed dynamic languages (e.g. Python) do not have this problem.
- Rust pushes complexity to the programmer for predictable performance; GC trades runtime cost for simpler code. Systems programs traditionally use a mix of manual and automatic memory management.

#pagebreak()

= Concurrency

== Memory Models

Each core has its own cache, so different cores can have different views of memory. Languages define *memory models* specifying guarantees around concurrent access.

*Java:* changes to `volatile` fields are atomic and immediately visible. Non-volatile changes become visible when locks are released/acquired. 32-bit field access is atomic.

*Others:* C/C++ historically poorly specified. Rust does not yet have a fully specified memory model.

== Threads and Locks

Threads share memory; synchronisation manages access. Java: `synchronized`. C: `pthread_mutex_lock`/`unlock`. Few guarantees outside locked regions. Problems: hard to verify correctness, errors appear under load, difficult to compose (e.g. bank transfer needs coordination beyond individual account locks).

== Transactions (STM)

Atomic transactions either succeed or fail entirely; intermediate states invisible. Usual ACID properties. Can be composed without affecting correctness (unlike locks).

*Implementation:* optimistic -- thread-local transaction log records reads/writes. On completion, validate consistency; if valid, commit; otherwise rollback and retry.

*Constraints:* transactions must be referentially transparent and do nothing irrevocable. I/O prohibited inside transactions. Side-effecting memory actions can be tracked by language runtime (software transactional memory) or via hardware transactional memory.

*Haskell STM Monad:* `TVar a` for transactional variables. `newTVar`, `readTVar`, `writeTVar` operate in `STM` context. `atomic :: STM a -> IO a` commits the transaction. I/O impossible inside `atomic` blocks since no `IO` context is available.

== Message Passing

System structured as communicating processes/actors with no shared mutable state. Messages must be immutable (or use linear types for safe transfer).

*Receivers* pattern match on messages. Messages queued, receivers single-threaded.

*Variants:* synchronous vs asynchronous; statically vs dynamically typed; direct (to actor mailbox) vs indirect (via channel).

- *Dynamic, direct:* Erlang, Scala. Messages sent directly to named actors.
- *Static, channels:* Rust. `mpsc::channel()` returns `(tx, rx)`. Statically typed, asynchronous.

== Race Conditions

*Message races:* messages arrive in unpredictable order. *Deadlock:* cycle of actors waiting for each other.

*Data races:* shared data modified without coordination. Two solutions:
- *Immutable data:* no modification, no race.
- *Ownership transfer:* `send` gives ownership, sender can no longer access the data.

=== Efficiency

With immutable messages or linear types, message passing is efficient:
- *Distributed systems:* copy message data
- *Shared memory systems:* pass a pointer (no copy needed)
- Neither case requires considering concurrent access to message data

== Robustness

Message passing decouples components, enabling proxies for system upgrades. Dynamic typing eases upgrades (new messages ignored by old components).

*Erlang's "let it crash":* processes are cheap; a failing process is killed and replaced. Supervision hierarchies: higher-level nodes monitor and restart lower-level processes.

#pagebreak()

= Coroutines and Asynchronous Programming

== Motivation

I/O operations are slow (millions of cycles). Blocking I/O wastes threads that spend most of their time waiting. Threads are resource-heavy (own stack, context switch overhead).

*Alternative:* multiplex I/O in a single thread using non-blocking I/O:
+ Start an I/O operation (non-blocking)
+ Periodically poll the kernel for I/O events
+ When data is available or an operation completes, invoke the handler

This is efficient but requires restructuring code around callbacks/event loops.

== async/await

Language support for I/O multiplexing in a natural style. Add `async` to a function, `.await` to blocking calls. Runtime schedules async functions, yielding to other code on `await`. Widely supported: Python, JavaScript, C\#, Rust.

=== Coroutines

A *generator* `yield`s a sequence of values, maintaining internal state between calls. A *coroutine* both consumes and yields values -- a function that executes concurrently (not in parallel) with the rest of the code.

An `async` function is a coroutine:
- `await` passes control to another coroutine while I/O completes
- Provides concurrency without parallelism (typically within a single thread)
- Compiles down to a state machine with calls to `select()` or similar

=== `await` Mechanics

An `await` operation:
+ Triggers the I/O operation and adds the file descriptor to the runtime's poll set
+ Puts the coroutine in a queue to be woken when the file descriptor becomes ready
+ If another coroutine is runnable, passes control to it; otherwise the runtime blocks until I/O is ready

The compiler and runtime work together to generate code that can be executed in fragments around I/O operations.

=== Futures

An `async fn` returning `T` compiles to a function returning `impl Future<Output=T>`. The runtime calls `poll()` on futures until all are `Ready` (vs `Pending` when blocked).

```rust
pub trait Future {
    type Output;
    fn poll(self: Pin<&mut Self>, lw: &LocalWaker) -> Poll<Self::Output>;
}
```

=== Design Patterns

- Async functions should be small, performing a single task.
- *Avoid blocking I/O:* a blocking `Future` blocks the entire runtime. Use `AsyncRead`/`AsyncWrite`.
- *Avoid long computations:* control only switches on `await`. Spawn separate threads for CPU-bound work.
- `async`/`await` is most natural for I/O-bound tasks. Threads are often sufficient -- choose async for the programming style, not necessarily performance.

#pagebreak()

= Type-based Modelling and Design

== Type-driven Development

Define types first, then write functions, then refine. Make behaviour obvious from types:
- Use `Username` rather than `String`
- Encode states as types, transitions as functions
- Compiler becomes a model checker: *correct by construction*

=== State as Types

Model connection states as distinct types. State transitions consume one type and return another:

```rust
fn connect(server: &str) -> UnauthenticatedConnection { /* ... */ }
fn authenticate(conn: UnauthenticatedConnection, creds: &Credentials)
    -> AuthenticatedConnection { /* ... */ }
fn send_email(conn: &AuthenticatedConnection, email: &Email) { /* ... */ }
```

Type system makes it impossible to send email without authenticating.

== Design Patterns

*Numeric types:* wrap values in newtypes (`Celsius(f32)`, `Fahrenheit(f32)`) to prevent unit confusion. Zero runtime overhead in Rust -- optimiser sees through the wrapper.

*`Option<T>`*: `Some(T)` or `None`. Compiler enforces both cases are handled. Replaces null pointers.

*`Result<T, E>`*: `Ok(T)` or `Err(E)`. The `?` operator propagates errors. Safer than C's signal values (-1, NULL).

*Anti-patterns:* string typing (use enums instead of strings for alternatives), boolean flags (use enums: `FileMode::Read` not `true`).

== State Machines

System behaviour modelled as states, events triggering transitions, and state variables.

=== Enum-based

States and events as enums, transition function via pattern matching. Compact, all transitions visible in one place.

```rust
enum State { Idle, Running, Paused }
enum Event { Start, Pause, Resume, Stop }

fn next(state: State, event: Event) -> State {
    match (state, event) {
        (State::Idle,    Event::Start)  => State::Running,
        (State::Running, Event::Pause)  => State::Paused,
        (State::Paused,  Event::Resume) => State::Running,
        (State::Running, Event::Stop)   => State::Idle,
        (state, _) => state,
    }
}
```

=== Struct-based

Each state is a struct, events are methods that consume the old state and return the new one. Ownership enforces that invalid transitions cannot occur (can't call `pause()` on `Idle`).

```rust
struct Idle;
struct Running;

impl Idle    { fn start(self) -> Running { Running } }
impl Running { fn pause(self) -> Paused  { Paused }
               fn stop(self) -> Idle     { Idle } }
```

Transition table is less explicit (spread across `impl` blocks), but type safety is stronger.

#pagebreak()

= Security Considerations

== Memory Safety

A *memory safe* language ensures only owned memory is accessed, consistent with declared types. Memory safe: Java, Rust, Go, Haskell, etc. Memory unsafe: C, C++.

Categories of undefined behaviour in C/C++:
- *Type-unsafe allocation:* `malloc()` size doesn't match type. Safe languages tie allocation to type.
- *Use before allocation / uninitialised memory:* safe languages require initialisation.
- *Use after free (explicit/implicit):* accessing freed heap memory or returned stack memory.
- *Wrong-type casts:* casting `char *` to a struct pointer; assumes layout. Safe languages disallow arbitrary casts.
- *String function misuse:* `read()` doesn't null-terminate; `strlen`/`strcpy` overflow.
- *Heap/array overflow:* writing past buffer bounds (e.g. `strcpy` into undersized `malloc`).
- *Arbitrary pointer arithmetic:* pointer math bypasses bounds checks.
- *Dangling/null pointers:* accessing through invalid or null pointers.

*Impact:* memory unsafety breaks the machine abstraction. Best case: segfault. Worst case: exploitable data corruption. ~70% of Microsoft security updates fix memory safety bugs.

== Parsing and Network Security

The *parser* is the security boundary: it takes untrusted network input and produces validated, strongly-typed data structures.

*Postel's Law* ("be liberal in what you accept") is increasingly seen as inappropriate -- being liberal increases the attack surface.

*Best practices:*
- Formally specify the protocol grammar, as restrictively as possible
- Auto-generate parsers (regex for regular, CFG for context-free)
- Generate strongly typed output structures
- Use well-tested parser libraries (`nom`, `combine` for Rust)
- Parse first, completely; rest of code uses only pre-parsed data

When *designing* protocols: minimise parsing state/look-ahead, prefer regular grammars over ones that save bits at the expense of complex parsing.

== Modern Type Systems and Security

Vulnerabilities come from violated assumptions. Strong typing makes assumptions explicit:
- Use explicit types (`StudentName` vs `String`) with safe conversion functions
- *Phantom types* add compile-time semantic tags without runtime cost:

```rust
struct UserInput;
struct Sanitised;
fn sanitise_html(html: Html<UserInput>) -> Html<Sanitised> { /* ... */ }
```

Memory safety and strong typing won't eliminate all vulnerabilities, but they eliminate entire classes and make hidden assumptions visible.
