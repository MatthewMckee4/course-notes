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
That's why systems programming languages offer low-level control over memory and I/O.

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
- Simple, easy to understand, easy to port to new architectures.
- Explicit pointers, memory allocation, control of data representation.
- Uniform treatment of memory, device registers, and data structures.
- Easy access to write device drivers, network protocols and interface with external formats.
- Weak type system allows aliasing and sharing.

=== Unix and C: Weaknesses

Unix:
- Networking and filesystem APIs can be bottlenecks.
- Security architecture insufficiently flexible.
- No portable APIs for mobility, power management, etc.

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
- Improve security - eliminates common classes of vulnerabilities.
- Improve support for concurrency - eliminates race conditions.
- Improve correctness - eliminates common classes of bugs.

*What is a modern type system?*

Can provide useful guarantees about program behaviour - prevent buffer overflows, use-after-free, race conditions.

Provide a model of the problem that prevents inconsistencies in the solution - no cost abstractions, describe constraints on program behaviour in the types.

*What is functional programming?*

Emphasises immutability and pure functions. Avoiding shared state and mutable state.
And so it is thread safe by default.

*How to Improve Memory Management and Safety?*

C has manual memory management through `malloc` and `free`. Arrays don't store length, so the runtime cannot check for out of bounds access. This was structured this way because memory used to be expensive.

Manual memory management leads to:
- Use-after-free bugs
- Memory leaks
- Buffer overflows
- Iterator invalidation

Modern machines have millions of times more memory and processors tens-of-thousands of times faster, making the old constraints less relevant.
Compilers can now often remove unnecessary bounds checks through optimisation.

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

This is dangerous in C because it can lead to null pointer dereferences and undefined behaviour. In Rust, Option provides a safe way to handle the absence of a value, preventing such issues.

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

We can think of an example where we are working with degrees in celsius and fahrenheit.
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
- All the additions are a compile-time model of the way the data is used, they don't affect the compiled code
- Equivalent C++ code has the same properties

*Typing Anti-Patterns*

Method parameters that are strings rather than some more appropriate type.
Use `enum` to represent values that can be one of several alternatives.

Use of boolean flags. enums should be used instead of boolean flags.

Use the type system to describe features of the system design, so the compiler can check for correctness
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

We can use enums to represent states and events, and structs to hold state variables. This is compact, makes states and events clear and has a clear states and transition table via pattern matching.
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
- In older OS, the program and data always started at a fixed location at the start of memory, in more modern system they are both started at the start of memory, but the starting address is randomised as a security measure.
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

Automatic memory management is often distrusted by systems programmers, there is a general believe that it has high overheads, is cpu hungry and wastes memory.

Common problems with memory management:
- Unpredictable performance
- Memory leaks
- Memory corruption and buffer overflows
- Use after free
- Iterator invalidation

New automatic memory management scheme solve many problems
- Garbage collectors have lower overhead and are more predictable.
- Region-based memory management, predictability and compile time guarantees

Systems programs traditionally use a mix of manual and automatic memory management.

The goal of automatic memory management is to manage the heap. To find memory that is no longer in use and make that memory free.
It is better to waste memory than deallocate an object that's in use.

=== Reference Counting

Allocations contain space for an additional reference count.
- An extra int is allocated along with every object.
  - Counts number of references to the object.
  - Increased when a new reference is made. (Arc::clone())
- If reference count reaches 0, the memory can be reclaimed.

The benefit of reference counting is predictable and understandable.

There are still some costs.
- Cyclic data structures contain mutual references. So, objects that reference each other aren't reclaimed, as reference counts don't go to 0.
- Stores reference count alongside each object
  - May need a mutex if concurrent access is possible.
  - Significant overhead for small objects.

Reference counting tends to be for large, long-lived data.

// 5c.

=== Region-based Memory Management

Reference counting has relatively high overhead.
Garbage collection has unpredictable timing and high overhead.

Region-based memory management aims for a middle ground
- Aims to be safe with predictable timing.
- Forces some changes to the way code is written.

With region-based memory management we can track the lifetime of data, values on the stack and references to the heap.

In Rust, a `Box<T>` is a value stored on the stack that holds a reference to data of type T allocated on the heap.
The heap allocated T has lifetime matching `Box<T>`, when the box goes out of scope, the reference heap memory is freed.
This is RAII.

Ownership of return value is moved to the calling function, the value is moved into the calling function's stack frame.

This prevents common lifetime errors (dangling references).

// 5d.

== Resource Management

Functions can take reference to data, this does not move ownership of the data, it borrows it. Functions can also return references to borrowed input parameters.

There are problems with naive borrowing, which can lead to iterator invalidation. If we were iterating over the contents of the vector, changing the contents
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
- Rust has `RefCell<T>` that dynamically enforces the borrowing rules.
- Rust forces consideration of object ownership early and explicitly.

Deterministic cleanup. You can implement the `Drop` trait in Rust to run some code when the struct is being freed.

#pagebreak()

= Garbage Collection

// 6a.

// Questions
// 1. How often does garbage collection happen on average?

== Basic Garbage Collection

It is important to acknowledge why garbage collection is not as suited for systems languages.
Since other memory managements strategies are still fairly new, we should still understand how garbage collection works.

=== Garbage Collection

The principle of garbage collection is to avoid some of the problems with reference counting and complexity of compile-time ownership tracking.

The collector traces through memory through all objects that have been allocated on the heap, recording which are in use and disposing of unused objects.

This moves garbage collection to be a separate phase of the program's execution, rather than an integrated part of the objects life cycle.
Operation of the program (the mutator) and the garbage collector is interleaved.

Many different algorithms exist:
- Basic
  - Mark-sweep
  - Mark-compact
  - Copying collectors
- Generational

=== Mark-Sweep Collectors

This is a two phase algorithm. First, distinguish live objects from garbage (mark) and the reclaim the garbage (sweep).
This is non-incremental: the program is paused to perform collection when memory becomes tight.

==== Marking Phase

Distinguishing live objects.

First, determine the root set of objects: global variables and variables allocated on the stack in any existing stack frame.
Then traverse the object graph starting at the root set to find other reachable objects, starting from the root set, follow pointers to other objects.
Follow every pointer in every object to systematically find all reachable objects (bfs or dfs). A cycle of objects that reference each other,
but are not reachable from the root set will not be marked.

To mark reachable objects as alive, set a bit in the object header, or in some separate table of live objects.
Stop traversal at previously seen objects to avoid cycles.

==== Sweep phase

Reclaiming objects that no longer live.

Pass through the entire heap once, looking at each object for liveness. If not alive, it reclaims the object's space and marks the memory as being available for use.
The system maintains a free list of blocks of unused memory. New objects are allocated in now unused memory if they fit, or in not yet used memory elsewhere on the heap.
Fragmentation is a potential concern, but no worse than using malloc/free.

==== Conclusion

this kind of collection is simple, but inefficient.

The program is stopped while the collector runs. The time to collect garbage is unpredictable, depends on the number of live objects, depends on size of the heap.

Passing through the entire heap in unpredictable order disrupts operation of cache and virtual memory subsystem.
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

This has some important implications. When the garbage collector runs, live objects will be in a minority.
Statistically, the longer an object has lived, the longer it is likely to live.

=== Copying Generational Collectors

In a generational garbage collector, the heap is split into regions for long-lived and youg objects.
Regions holding young objects are garbage collected more frequently.
Objects are moved to the region for long-lived objects if they're still alive after several collections.
More sophisticated approaches may have multiple generations, although the gains diminish rapidly with increasing numbers of generations.

When an object survives a garbage collection, the counter increments by 1.

Young generation must be collected independent of long-lived generation.
But, there may be references between generations.
For references from young objects to long-lived objects, this is usually fine because most young objects die before the
long-lived objects are collected.

For references from long-lived objects to young objects, it is a bit more problematic, since this requires scan of long-lived generation
to detect if we should collect it or not. We could store an indirection table (pointers to pointers) for references from long-lived
generation to young generation. The indirection table forms part of the root set of the younger generation.
Moving objects in younger generation requires updating indirecatoin table, but not long-lived objects.

This approach is very widely used. It can be very efficient

=== Incremental Garbage Collection

Incremental garbage collection algorithms try to spread the cost of garbage collection out and try to run the garbage collection in
a way so that the program doesn't need to be stopped for the garbage collector to run.
Important for real time applications where you don't want any delay of program execution.

It interleaves small amounts of garbage collection with small runs of program execution.

Need to track changes made to the heap between garbage collector runs; be conservative and don't collect objects that might be referenced,
can always collect on the next complete scan.

This can be done using an algorithm known as tricolor marking. Each object in the system is labelled with a color.
White - not yet checked, grey - live, but some direct children not yet checked, black - live and all children checked.

Garbage collection proceeds with a wavefront of grey objects, where the colector is checking them, or objects they reference, for liveness.
At the end anything which is still labelled white is unreachable and known to be garbage.
Any program operation that will create a direct pointer from a black object to a white object requires coordination with the collector.

The program and the collector need to coordinate.

Coordination strategies:

*Read barrier*

Trap attempts by the program to read poitners to white objects, colour those objects grey, and then let the program continue.
Makes it impossible for the program to get a white object, so it cannot make a black object point to a white object.

*Write barrier*

Trap attempts to change pointers from black objects to point to white objects.
Either then re-colour the black objects as grey, or re-colour the white object being referenced as grey.
The object coloured grey is moved onto the list of objects whose children must be checked.

Performance trade-off differs depending on hardware characteristics, and on the way pointers are represented.

Write barrier generally cheaper to implement than read barrier, as writes are less common in most code.

If the program tries to create too many new nreferences from black to white objects, requiring coordination with
the collector, the collection may never complete.

Resolve by forcing a complete stop-the-world collection is free memory is exhausted, or after a certain amount of time.

// 6c.

== Practical Factors

Real time collectors built from incremental collectors. Schedule an incremental collector as a periodic task.
Runtime allocated determins amount of garbage that can be collected in each period.
The amount of garbage that can be collected can be measured: how fast can the collector scan memory.

=== Memory Overheads

Garbage collection trades eas-of-use for predictability and overhead.

Garbage collected programs will use significantly more memory than correctly written programs with manual memory management.
Many copying collectors maintain two semispaces, so double memory usage. But many programs with manual memory management are not correct.

=== Garbage Collection for Weakly-typed Languages

Collectors rely on being able to identify and follow pointers, to determine what is a love object, they rely on strongly typed languages.
Weakly typed languages, such as C, can cast any integer to a pointer, and perform pointer arithmetic.
It is difficult, but not impossible, you need to be concervative such that you treat anything that could be a pointer, as a pointer.

Strongly typed, but dynamic languages would not face the same issues.

=== Memory Management Trade-offs

Rust pushes memory management complexity onto the programmer, this results in predictable run-time performance and low run-time overheads.
Garbage collection imposes run-time costs and complexity, but simpler to write code.

#pagebreak()

= Concurrency

// 7a.

== Implications of Multicore Systems

Systems with four or eight cores are now mainstream. The obvious consequence of this is that parallel computation is now the norm.

Each processor core has its own private cache that is not shared with other cores, and as a result, each processor has its own distinct view of memory.
And memory is not always equally accessible to all processor cores.

Memory access is no longer uniform. Different processor cores have a different view of the contents of memory, due to caching.

To ensure programs work protably accros different ypes of processors, programming languages define their memory model.
They need to define what gaurantees the language provides around concurrent memory accesses, and the compiler can turn this into machine code.

=== Memory Models: Java

Changes to a field are seen in program order within a thread.
If a single threads writes a value to memory and later reads it back and provided no other threads wrote to the same location,
then the value that the thread reads will be the same as it wrote.
Changes to a field made by one threads are visible to another thread as follows:

If a `volitile` field is changes, that change is done atomically and immediately becomes visible to other threads.

If a `non-volatile` field is changed while holding a lock, and that lock is then released by the writing threads and acquired by the reading
thread, then the change becomes visible to the reading threads.

Access to all 32-bit fields is atomic, this does not hold for `long` or `double` fields which are 64 bits in size.

// TODO: Add more inforamation here.

=== Memory Models: Others

Java is unusual in having such a clearly specified memory model.

Other languages are less well specified, running the risk that new processor designs can subtly break previuosly working programs.

C and C++ have historically had very poorly specified memory models.

Rust also does not (yet) have a fully specified memory model.
Recognised as a limitation - research efforts underway to fix this.
Complicated by multiplicity of reference types and unsafe code.

=== Concurrency, Threads, and Locks

The memory model of a language is explicitly tied to the way it ties lock and communication between threads.

Processes are isolated from each other and don't share memory.
Threads within a process shared access to a common pool of memory and make use of synchronization to manage access to that shared memory.
How this is done depends on the language.

In Java, the locks are provided by the synchronized methods and statements.
In C, they are provided by the pthreads library, in the form of `pthreads_mutex_lock` and `pthread_mutex_unlock`.

Outside of locked regions there are very few gaurantees about access to shared memory.

=== Limitations of Lock-bases Concurrency

The approach of using multiple threads and using locks to provide access to shared memory is very common,
but it is alo problematic.

It is difficult to know when the locking is done correctly, incorrectly locked code tends to compile just fine.
Errors tend to manifest themselves under heavy load.

This makes such code hard to write and hard to debug.
It is easy to over or under lock programs.

=== Composition of Lock-base code

It is difficult to compose code which uses locks.

A common example of where the composition of two locking and safe operations is a banking system.
When transferring money from one account to another, we must ensure that the money is in one bank account or the other
at all times. There must never be a state where money is in both, or neither bank accounts.

=== Alternative Concurrency Models

Concurrency is increasingly important.

There are alternatives to lock base concurrency: transactions and message passing.

== Managing Concurrency Using Transactions

An alternateive to locking is to use atomic transactions.
Atomic actions either succeed or fail, and intermediate states are not visible to other threads.

The runtime must ensure actions have the usual ACID properties:

- Atomicity - all chanegs to the data are performed, or none are.
- Consistency - data is in a consistent state when a transaction starts, and when it ends.
- Isolation - intermediate states of a transaction are invisible to other transactions.
- Durability - once committed, results of a transaction persist.

Advantages of this are that atomic transactions can be composed arbitrarily, without affecting correctness,
unlike locking. This avoids deadlocks due to incorrect locking, since there are no locks.

=== Programming Model

Blocks of code can be labelled as `atomic`, and they can be run concurrently and atomically with respect to
every other `atomic` block.

They are implemented via optimistic transactions. A thread-local transaction log is maintained,
this records every memory read and write made inside the atomic block.
When the atomic block completes, the log is validated to check that it has seen a consistent view of memory.
If validation succeeds, the transaction commits its changes to memory; if not, the transaction is rolled
back and retried from scratch.
Progress may be slow if conflicting transactions cause repeated validation failures, but will eventually
occur.

// Question, why can we not "deadlock" with two transactions continuously failing and retrying.

==== Consequences

Transactions may be re-run automatically, this places restrictions on transaction behaviour.
They must be referentially transparent. They must do nothing irrevocable.

=== Controlling I/O

Unrestricted I/O breaks transaction isolation:

- Reading and writing files.
- Sending and receiving data over the network.

Sometimes the language makes global functions that perform I/O unavailable in atomic blocks.

Haskell has a great way of modelling this with the type system, via the IO Monad.

=== Controlling Side Effects

Code that has side effects must be controlled.

FUnctions that only perform memory actions can be executed normally, provided transaction log tracks the memory
access and validates them before the transaction commits, and can potentially roll them back.
Tracking memory actions can be done by language runtime (STM; software transactional memory), or via hardware
enforced transaction memory behaviour and rollback.

Disallow unrestricted heap access.
Pass transaction context explicitly to transactions; this has operations to perform transactional memory operations,
and rollback if the transaction fails to commit.

=== Monadic STM Implementation

The definition of the I/O monad type ensure that a function that is not passed the IO context
cannot perform IO operations.

How to track side-effecting memory actions?

In Haskell, we can define a STM monad to wrap transactions.

Based on the state monad; manages side-effects via a `TVar` type

```hs
newTVar :: a -> STM (TVar a)
readTVar :: TVar a -> STM a
writeTVar :: TVar a -> a -> STM ()
```

- The `newTVar` function takes a value of type a, returns new
`TVar` to hold the value, wrapped in an STM monad
- `readTVar` takes a `TVar` and returns an STM context; when performed this returns the value of that
`TVar`; `writeTVar` function takes a `TVar` and a value, returns an STM context that can validate the
transaction and commit the value to the `TVar`
The `atomic {…}` function operates in an STM context and returns an IO context that performs the operations needed
to validate and commit the transaction.

```hs
atomic :: STM a -> IO a
```

- The newTVar, readTVar, and writeTVar functions need an STM action, and so can only run in the
context of an atomic block that provides such an action
- I/O prohibited within transactions, since operations in atomic {…} don’t have access to I/O context

// Look more into this lecture.

// 7c.

== Message Passing Systems

The goal of a message passing system is that the system is structured as a set of communication processes, actors, with
no mutable state. Message are required to be immutable.
Some systems use linear types to ensure emssages are not references after they are sent, alowing mutable data to be safely
transferred.

Imlpementation of such a system is usually built with shared memory and locks.
This is trivial to distribute, but the application can be unaware that the system is distributed.

=== Message Handling

Recievers pattern match against message. Type system can ensure an exhaustive match.
Messages queued for processing. Receivers operate in message processing loop, single threaded.
Sent messages enqueued for processing by other actors.

=== Types of Message Passing

Synchronous or asynchronous. Statically or dynamically typed. Direct or indirect message delivery

==== Interaction Models

Message passing can incolve rendezvous between sender and receiver.
A synchronous message passing model, sender waits for receiver.

Alternatively, communication may be asynchronous. The sender continues immediately after sending a message.
Message is buffered for later delivery to the receiver.

==== Typed Communication

Statically-typed communication, used to explicitly define the types of message that can be transferred.
Compiler checks that the reciever can handle all messages it can receive.

Dynamically-typed communication, receiver uses pattern matching on the received message types to determine
if it can respond to the message.

==== Naming

Are messages sent between named processes or indirectly via channel?

Some systems directly send messages to actors, each of which has its own mailbox, others use explicit
channels, with messages being sent indirectly to a mailbox via a channel.

Explicit channels require more plumbing, bit the extra level of indirection between sender and receiver
may be useful for evolving systems.
Explicit channels are a natural place to define a communications protocol for statically typed
messages.

=== Implementations

Two most common architectures

==== Dynamically typed with direct delivery

Erlang, Scala.

Dynamically typed messages sent directly to named actors, not via channels.

==== Statically typed, with explicit channels

Rust.

Uses asynchronous statically typed messages passed via explicit channels.

=== Example: Scala

```scala
import akka.actor.Actor
import akka.actor.ActorSystem
import akka.actor.Props

class HelloActor extends Actor {
  def receive = {
    case "hello" => println("hello back at you")
    case _ => println("huh?")
  }
}

object Main extends App {
  // Initialise actor runtime
  val runtime = ActorSystem("HelloSystem")

  // Create an actor, running concurrently
  val helloActor = runtime.actorOf(Props[HelloActor], name = "helloactor")

  // Send it some messages
  helloActor ! "hello"
  helloActor ! "buenos dias"
}
```

=== Example: Rust

```rs
use std::sync::mpsc::channel;
use std::thread;

fn main() {
    let (tx, rx) = channel();

    thread::spawn(move|| {
        let _ = tx.send(42);
    });

    match rx.recv() {
        Ok(value) => {
            println!("Got {}", value);
        }
        Err(error) => {
            // An error occurred…
        }
    }
}
```

=== Tradeoffs

In Scala, with dynamic typing, we can easily upgrade the system.
Checking happens at runtime. Robust framework for error handling via separate processes.

In Rust, we have static typing, so we can be sure of the type of the result.
Requires more plumbing.

// 7d.

== Race Conditions

A race condition can occur when the behaviour of a system depends on the relative timing of different actions,
or when a shared value is modified without coordination.

Introduces non-deterministic behaviour and hard-to-debug problems.
Difficult to predict exact timing of program behaviour.

=== Message Races

In message passing systems, messages can be received from multiple senders.
Runtime ensure receiver processes messages sequentiall, in the order they are received, but order of receipt can vary due
to system and network load, external events.

A *race condition* occurs when messages arrive in an unpredictable order.
A *deadlock* occurs when a cycle forms, with actors waiting for messages from each other.

=== Data Races

In shared memory systems, data is conceptually moved from sender to receiver.
A data race condition occurs if the data is modified after it is sent, and the modification is visible to the receiver via
the reference.
This is unpredictable if the receiver sees the old or new version.
Two approaches to avoid this: immutable data or ownership tracking.

==== Avoiding Data Races: Immutable Data

Race conditions cannot occur if data is not modified.

==== Avoiding Data Races: Ownership Transfer

Race conditions cannot occur if data is not shared.
Ensure ownership of an object is transferred, so the sender cannot access the object after it has been sent.
Suitable for Rust. The `send` function gives ownership of the data. The `recv` function takes ownership of
the received data.

=== Aside: Efficiency of Message Passing

Assuming immutable message or linear types, message passing has efficient implementation.
- Copy messages data in distributed systems
- Pass pointer to data in shared memory systems
- Neither case needs to consider shared access to message data

Garbage collected systems often allocate nmessages from a shared exchange heap.
This is expensive to collect, since data in exchange heap is owned by multiple threads.
Though, we can use a per-preocess heap that can be collected independently and concurrently,
ensuring good performance.

// 7e.

== Robustness of Message Passing Systems

=== System Upgrade and Evolution

One of the key features of message passing systems is that the messages decouple different component of the system.
There's an abstraction representing a channel or a mailbox that allows them to be teased apart a little.

One advantage of this approach is that it makes it possible to insert a proxy into the message passing path.
Message are then passed to the proxy and then onto the relevant server process.

A proxy could handle migrating to a new version of a server.

Use of dynamic typing may make upgrades easier.
New components of the system can generate additional messages, which are ignored by old components.
Supervisor hierarchy allows system to notice if components fail, and fallback to known good version.

=== Error Handling

This approach leads to one of the more interesting design decisions in Erlang.
The Erlang language and runtime assume the system is massively concurrent.
It's normal for Erlang systems to comprise of thousands of communicating processes.

A consequence of this is that Erlang can handle errors differently.
Erlang doesn't have a concept of error handling, if they encounter problems, they crash.

The idea is that processes are cheap and plentiful, and that a process that's encountered an error
is no longer trustworthy. So, we let the failing process die and replace it with another.

We should be concerned with the overall system reliability, not the reliability of any one component.

=== Let it Crash

In a single-process system, that process must be responsible for handling errors, if it fails, the entire
application fails.

In a multi-process system, each individual process is less precious.

=== Remote Error Handling

Isolate the problem, let an unaffected process be responsible for recovery, don't trust the faulty component.

=== Supervision Hierarchies

Erlang applications are structured into tree-structured groups of processes, where the higher-level nodes in the tree
supervise and correct errors in the low-level processes.

They have direct supervisor processes that monitor their correct operation, and restart them if they fail.

And the supervisor processes themselves tend to have higher-level managers that acount for failures of smaller
components in the system. Either restart them on failure or handle problems by running multuple disparate versions
of the subsystem, comparing results to pick the majority correct answer.

// https://dl.acm.org/doi/10.1145/1810891.1810910
