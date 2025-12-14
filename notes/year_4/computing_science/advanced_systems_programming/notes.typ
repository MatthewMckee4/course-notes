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

#pagebreak()

// 3b.

== Introducing Rust

Access environment variables

```rust
use std::env;

fn main() {
    for arg in env::args() {
        println!("{:?}", arg);
    }
}
```

```rust
let v: Vec<u8> = vec![1, 2, 3];
let v: Vec<u8> = Vec::new();
let v = Vec::<u8>::new();
```

*Type Conversion Table*

#grid(
  columns: (1fr, 1fr, 2fr),
  rows: (auto),
  grid.cell(table(
    columns: 2,
    [*C*], [*Rust*],
    [unsigned], [usize],
    [uint8_t, unsigned char], [u8],
    [uint16_t], [u16],
    [uint32_t], [u32],
    [uint64_t], [u64],
  )),
  grid.cell(table(
    columns: 2,
    [*C*], [*Rust*],
    [int], [isize],
    [int8_t, signed char], [i8],
    [int16_t], [i16],
    [int32_t], [i32],
    [int64_t], [i64],
    [float], [f32],
    [double], [f64],
    [int], [bool],
    [char], [char],
  ))
)

*Traits*

Traits describe functionality that types can implement.
Traits are an important tool for abstraction, similar role to sub-types in many languages.

```rust
trait Summary {
    fn summarise(self) -> String;
}

fn notify<T: Summary>(item: T) {
    println!("Breaking news! {}", item.summarise());
}
```

You can derive common traits using the `#[derive]` attribute, like `#[derive(Debug)]`.

Traits can also specify associated types, types that must be specified when a trait is implemented.

```rust
trait Iterator {
    type Item;

    fn next(&mut self) -> Option<Self::Item>;
}
```

*Enums*

There are several different kinds of enums in Rust:

- *Unit Enums*: Enums without any associated data.
- *Tuple Enums*: Enums with a fixed number of fields.
- *Struct Enums*: Enums with a struct-like syntax.

```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}
```

In Rust when looking up an item from a db for example, you can return Option, in C you can return a pointer to the item or NULL if not found.

This is dangerous in C because it can lead to null pointer dereferences and undefined behavior. In Rust, Option provides a safe way to handle the absence of a value, preventing such issues.

// 3d.

*References in Rust vs C*

References are explicit – like pointers in C

*Rust vs C Reference Comparison*

#grid(
  columns: (1.5fr, 2fr, 2fr),
  rows: (auto, auto, auto, auto, auto),
  gutter: 5pt,
  [*Operation*], [*Rust*], [*C*],
  [Create variable binding], [`let x = 10;`], [`int x = 10;`],
  [Take reference (pointer)], [`let r = &x;`], [`int *r = &x;`],
  [Dereference to access value], [`let s = *r;`], [`s = *r;`],
  [Function parameter by reference], [`fn calculate_length(b: &Buffer) -> usize`], [`int calculate_length(Buffer *b)`]
)

In Rust, references can never be null.

We can have multiple immutable references to the same data, but only one mutable reference, and not at the same time.

*Memory Allocation and Boxes*

A `Box<T>` is a smart pointer that refers to memory allocated on the heap. It provides automatic memory management and ensures that the memory is deallocated when the `Box` goes out of scope.

#grid(
  columns: (1fr, 2fr),
  rows: (auto, auto),
  gutter: 5pt,
  [*Rust*], [*C*],
  [`let b = Box::new(10);`], [`int *b = malloc(sizeof(int)); *b = 5;`],
)

Rust makes guarantees about memory allocation:
- The value returned by Box::new() is guaranteed to be initialised
- The allocated memory is guaranteed to match the size of the type it is to store
- Rust guarantees that the memory will be automatically deallocated when the box goes out of scope

Boxes do not implement the standard Copy trait; can pass boxes around, but only one copy of each box can exist – again, to avoid data races between threads
- A Box<T> is a pointer to the heap allocated memory; if it were possible to copy the box, we could get multiple mutable references to that memory

*Strings*

Strings are Unicode text encoded in UTF-8 format
- A str is an immutable string slice, always accessed via an &str reference
- The &str type is built-in to the language
- A String is a mutable string buffer type, implemented in the standard library
- The string type implements the `Deref<Target=str>` trait, so taking a reference to a String results actually returns an &str

*Why is Rust interesting?*

- No concept of undefined behaviour
- No buffer overflows
- No dangling pointers
- No null pointer dereferences
- Zero cost abstractions to model problem space
- Deterministic automatic memory management
  - Prevents iterator invalidation
  - Prevents use-after-free bugs
  - Prevents most memory leaks
- Rules around references and ownership prevent data races in concurrent code

#pagebreak()

= Type-based Modelling and Design

// 4a.

== Type-based Development

In a type driven development approach, rather than structuring code around control flow, you structure it first around the types.

First, define the types, think of the types you need to represent the problem domain.
- Data exchanged
- Data describing endpoints, interactors
- States

Make the behaviour obvious from the types, so the types constrain behaviour.
- Use `Username` rather than `String` for user names
- Encode states as types and state transitions as functions

Types and functions provide a model of the system.
- Interactive design using the compiler to check consistency

// 4b.

== Design Patterns

Represent units in the type system if numbers have extra context involved.

We can think of an example where we are working with degrees in celcius and fahrenheit.
We can naively just represent these with float values. This can easily result in incorrect calculations.
We should instead create new types that wrap float values.

```rust
struct Celsius(f32);
struct Fahrenheit(f32);

// impl add for each
```

Wrapping values inside struct adds zero runtime overhead in Rust.
- No information is added to the struct, it's just a wrapper around the float value
- Optimiser will recognise that the code collapses down to operations on primitive types, and generate code to do so
- All the additinos are a compile-time model of the way the data is used, they dont affect the compiled code
- Equivalent C++ code has the same properties

*Typing Anti-Patterns*

Method parameters that are strings rather than some more appropriate type.
Use `enum` to represent values that can be one of several alternatives.

Use of boolean flags. enums should be used instead of boolean flags.

Use the type system to describe features of the system design, so the compiler cancheck for correctness
There is an up-front cost: you must define the types
- The benefit is that fixing compilation errors is easier than fixing silent data corruption
  - For small systems, the cost may outweigh the benefit
  - For large systems, compiler enforced consistency checks due to use of types can be a significant win

// 4c.

== State Machines

System behaviour modelled as a finite state machine comprising:
- States that reflect the status of the system
- Events that trigger transitions between states
- State variables that hold system configuration

We can use enums to represent states and events, and structs to hold state variables. This is compact, makes states and events clear and has a clear states and transition table via mattern matching.
Relies on a type system with more powerful enums.

We can also use a struct based approach where struct methods are used to transition between states and update state variables. Less explicit as transitions are encoded in the return type of methods.
- Define a struct representing each state
- Model an event as a method call on a struct
- Model state transitions by returning a struct representing the new state

// 4d.

== Ownership

Rust tracks ownership of data - enforces that every value has a single owner.

= Resource Ownership and Memory Management

// 5a.

== Memory

#grid(
  columns: (5fr, 3fr),
  rows: (auto),
  [

To understand memory management, must understand what memory is to be managed:
- Program text, data, and global variables
- Heap allocated memory
- Stack
- Memory mapped files and shared libraries
- Operating system kernel

*Program Text* is compiled machine code of a program.

*Data Segment* is variables initialised in source code.
- String literals, initialised `static` global variables in C.
- Values known at compile time

],
grid.cell(image("assets/layout-of-a-process-in-memory.png", width: 70%))
)

*BSS Segment* reserved for uninitialised `static` global variables.
- "block started by symbol"
- Initialised to 0 by runtime when the program loads
- Size know at compile time
- In older OS, the program and data always started at a fixed location at the start of memory, in more modern system they are both started at the start of memory, but the starting address is randomized as a security mesure.
  It makes it harder for code executed as a buffer overflow attack to call into other parts of the program, since it can't be located in memory.

*The Stack* holds function parameters, return address, local variables.
- Function calls push data onto the stack, growing down
  - Parameters for the function; return address; pointer to previous stack frame; local variables.
  - Data removed, stack shrinks, when function returns - stack managed automatically.
    - Compiler generates code to manage the stack as part of the compiled program.
    - The calling convention for functions, how parameters are pushed onto the stack, standardised for given processor and programming language.
  - The operating system generates the stack frame for `main()` when the program starts.
- Ownership of stack memory follows function invocation.

Address of the previous stack frame is stored for ease of debugging, so stack trace can be printed, so it can easily be restored when function returns.

*Buffer Overflow Attacks*
- Language not type safe, doesn't enforce abstractions.
- Write past array bounds - overflows space allocated to local variables, overwrite return address and following data.
- Contents valid machine code; the overwritten function return address is made to point to that code.
- When function returns code written during overflow is executed.

Some workarounds
- Mark stack as non-executable.
- Randomise top of stack address each program run.
- Various more complex buffer overflow attacks still possible.

The solution is using a language that is type safe and enforces array bounds checks.

*The Heap* holds explicitly allocated memory.
- In C using `malloc()` and `calloc()`.
- Starts at a low address in memory; later allocations follow in consecutive addresses.
  - Sometimes padding to align to a 32 or 64-bit boundary.
  - Modern `malloc()` implementations are thread aware, split heap into different parts, different threads to avoid cache sharing.
- Memory management primarily concerned with reclaiming heap memory.
  - Manually using `free()`.
  - Automatically via reference counting / garbage collection.
  - Automatically based on regions and lifetime analysis.

*Memory Mapped Files and Shared Libraries*
Memory mapped files allow data on disk to be directly mapped into address space.
- Mappings created using `mmap()` system call.
  - Returns a pointer to a memory address that acts as a proxy for the start of the file.
  - Reads from/writes to subsequent address acts on the underlying file.
  - File is demand pages from/to disk as needed - only the parts of the file that are accessed are read into memory.
  - Useful for random access to parts of files.
- Used to map shared libraries into memory.
  - `.so` files on unix and `.dll` files on windows.

*The Kernel*
Operating system *kernel* resides at the top of the address space.
  - Not directly accessible to user-space programs.
    - Attempt to access kernel - segmentation violation.
    - The `syscall` instruction x86_64 assembler calls into the kernel after permission check.
  - Kernel can read/write memory of user processes.


// 5b.

== Automatic Memory Management

Automatic memory management is often distrusted by systems programmers, there is a genaral believe that it has high overheads, is cpu hungry and wastes memory.

Common problems with memory management:
- Unpredictle performance
- Memory leaks
- Memory corruption and buffer overflows
- Use after free
- Iterator invalidation

New automatic memory management schesm solve many problems
- Garbage collectors have lower overhead and are more predictable.
- Region-based memory management, predictibilty and compile time guarantees

Systems programs traditionaly use a mix of manual and automatic memory management.

The goal of automatic memory management is to manage the heap. To find memory that is no longer in use and make that memory free.
It is better to waste memory than deallocate an object that's in use.

=== Reference Counting

Allocations contain space for an additional reference count.
- An extra int is allocated along with every object.
  - Counts number of refences to the object.
  - Increased when a new reference is made. (Arc::clone())
- If reference count reaches 0, the memory can be reclaimed.

The benefit of reference counting is predictable and understandable.

There are still some costs.
- Cyclic data structures contain mutual references. So, objects that reference each other aren't reclaimed, as reference counts dont go to 0.
- Stores reference count alongside each object
  - May need a mutex if concurrent access is possible.
  - Significant overhead for small objects.

Reference counting tends to be for large, long-lived data.

// 5c.

=== Region-based Memory Management

Reference counting has relatively high overhead.
Garbage collection has unpredictable timing and high overhead.

Region-based memory management ains for a middle ground
- Aims to be safe with predictable timing.
- Forces some changes to the way code is written.

With region-based memory management we can track the lifetime of data, values on the stack and references to the heap.

In Rust, a `Box<T>` is a value stored on the stack that holds a reference to data of type T allocated on the heap.
The heap allocated T has lifetime mathcing `Box<T>`, when the box goes out of scope, the reference heap memory is freed.
This is RAII.

Ownership of return value is moved to the calling function, the value is moved into the calling function's stack frame.

This prevents common lifetime errors (dangling references).

// 5d.

== Resource Management

Functions can take reference to data, this does not move ownership of the data, it borrows it. Functions can also return references to borrowed input parameters.

There are problems with naive borrowing, which can lead to iterator invalidation. If we were iteratoring over the contents of the vector, changing the contents
might lead to elements being skipped or duplicated.

=== Safe Borrowing

Rust has two kinds of pointers, immutable and mutable.

*Benefits*
Type system tracks ownership, turning run-time bugs into compile-time errors.
- Prevents use-after-free bugs
- Prevents iterator invalidation
- Prevents race conditions with multiple threads.

*Limitations*
- Can't express cyclic data structures
- Can't express shared ownership of mutable data.
- Rust has `RefCell<T>` that dynamically enforces the borwowing rules.
- Rust forces consideration of object ownership early and explicitly.

Deterministic cleanup. You can implement the `Drop` trait in Rust to run some code when the struct is being freed.

= Garbage Collection

// 6a.

== Basic Garbage Collection

It is important to acknowledge why garbage collection is not as suited for systems languages.
Since other memory managements trategies are still fairly new, we should still understand how garbage collection works.

=== Garbage Collection

The principle of garbage collection is to avoid some of the problems with reference counting and complexity of compile-time ownership tracking.

The collector traces through memory through all objects that have been allocated on the heap, recording which are in use and disposing of unsued objects.

This moves garbage collection to be a separate phase of the progrm's execution, rather than an integrated part of the objects lifecycle.
Operation of the program (the mutator) and the garbage colector is interleaved.

Many different algorithms exist:
- Basic
  - Mark-sweep
  - Mark-compact
  - Copying collectors
- Generational

=== Mark-Sweep Collectors

This is a two phase algorithm. First, distinguish live objects from garbage (mark) and the reclaim the garbage (sweep).
This is non-incremental: the program is paused to perform colection when memory becomes tight.

==== Marking Phase

Distinguishing live objects.

First, determine the root set of objects: global variables and variables allocated on the stack in any existing stack frame.
Then traverse the object graph starting at the root set to find other reachable objects, starting from the root set, follow pointers to other objects.
FOllow every pointer in everh object to systematically find all reachable objects (bfs or dfs). A cycle of objects that reference each other,
but are not reachable from the root set will not be marked.

To mark reachable objects as alive, set a bit in the object header, or in some separate table of live objects.
Stop traversal at previously seen objects to avoid cycles.

==== Sweek phase

Reclaiming objects that no longer live.

Pass through the entire heap once, looking at each object for liveness. If not alive, it reclaims the object's space and marks the memory as being available for use.
The system maintains a free list of blocks of unused memory. New objects are allcated in now unused memory if they fit, or in not yet used memory elsewhere on the heap.
Fragmentation is a potential concern, but no worse than using malloc/free.

==== Conclusion

this kind of collection is simple, but inefficient.

The program is stopped while the collector runs. The time to collect garbage is unpredictable, depends on the number of live objects, depends on size of the heap.

Passing through the entire heap in unpredictable order distrupts operation of cache and virtual memory subsystem.
Objects located where they fit, rather than where maintains locality of reference.

=== Mark-Compact Collector

This is a three phase algorithm. First, mark live objects, then reclaim unreachable objects (just like mark-sweep), and finally, compace live objects,
moving them to leave contiguous free space.

*Advantages*

Solves fragmentation problems, all free space is in one contiguous block.
Allocation is very fast, always allocating from the start of the free block, so allocation is just incrementing pointer to start of free space.

*Disadvantages*

Collection is slow, due to moving objects in memory, and time taken is unpredictable.
Collection has poor locality of reference. Colelction is complex, needs to update all pointers to moved objects.

=== Copying Collectors

Integrate traversal (marking) and copying phases into one pass. All live data is copied into one region of memory, all remaining memory contains garbage.

Split the heap into two halves. Allocations made linearly from one half of the heap. Memory is allocated contiguously, so allocation is fast.
No problems with fragmentation when allocating data.

The program only uses half of the heap. Then the collector runs and copies into the other half of the heap.

The Cheney algorithm, breadth-first copying.
A queue of objects is maintained, start with looking at the root set of objects.
Any unprocessed objects they reference are added to the end of the queue.
The object in the queue is then copied into the other esmispace, and the original is marked as having been processed.
One the end of the queue is reached, all live obejcts have been copied.

The time taken depends on te amount of data copied which depends on the number of live objects.
Collection only happens when a semispace is full.

If most objects die young, can trade-off collection time vs memory usage by increasing the size of the semi spaces.

// 6b.

== Generational and Incremental Garbage Collection

Most objects have a short lifetime, a small percentage live much longer.
