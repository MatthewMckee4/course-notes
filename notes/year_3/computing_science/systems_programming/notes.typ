#set document(title: "Systems Programming")
#set page(margin: 20pt)

#outline(title: none)

#pagebreak()

= Introduction to Systems Programming

== Compiling

To execute a C program we must first *compile* it into machine executable code.

The *compiler* translates the source code in multiple steps into machine executable code.
- The preprocessor expands macros and includes files (`-E`).
- In the compiling stage, the source code is a) parsed and turned into an intermediate representation, b) machine-specific assembly code is generated, and, finally, c) machine code is generated in an object file.
- The linker combines multiple object files into an executable
- Machine-specific assembly code is generated (`-S`).
- Machine code is generated in an object file (`-c`).

`clang -o hello hello.c`.
`-Werror` makes all warnings errors.
`-Wall` enables all warnings.

= The Basics of C

== Basic Program Structure and I/O

*Main function*
`int main (int argc, char* argv[])`.

*Basic I/O*
`printf` is part of the C standard library. It can be imported with `#include <stdio.h>`.

*Format specifiers*
- %d is a decimal integer.
- %s is a string.
- %c is a character.
- %f is a floating point number.
- %.f is a double-precision floating point number.

== Data Types

A bit-pattern by itself has no inherit meaning.

Data types offer meaning to bits, telling the program what the bits mean in memory represent.

Data types provide context to operations:
- The compiler ensures that the meaning of a data type is preserved.
- The compiler enforces that computations preserve the meaningful representation of our data.
- Bit patterns are modified according to the data type.

Every variable in C is stored at a fixed location in memory, the memory location does not change over the lifetime of the variable.

#table(
  columns: (auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Type name*], [*Size in bytes*], [*Value range*],
  ),
  [char / unsigned char], [1 byte], [[-127, +127] / [0, 255]],
  [short / unsigned short], [2 bytes], [[-32767, +32767] / [0, 65535]],
  [int / unsigned int], [4 bytes], [[-2147483647, +2147483647] / [0, 4294967295]],
  [long / unsigned long], [4 or 8 bytes], [at least the range of int],
  [long long / unsigned long long], [8 bytes], [[−2^63 − 1, +2^63 − 1] / [0, 2^64 − 1]],
  [float (IEEE-754)], [4 bytes], [$±1.2 dot 10^-38$ to $±3.4 dot 10^38$],
  [double (IEEE-754)], [8 bytes], [$±2.3 dot 10^-308$ to $±1.7 dot 10^308$],
)

Strings have a null terminator, one extra byte: "`\0`"
Use strcmp to compare strings.
include <stdbool.h> for bools.

== Scopes and Lifetimes
A pair of curly braces is a block, and introduces a lexical scope.
Variables declared inside a block are local to that block.

If multiple variables have the same name, the inner one *shadows* the outer one.

Lifetimes, automatic: ends at the end of the block, static: ends at the end of the program.

== Stack-based Memory Management

Automatically-managed variables are considered *stack objects*. When the lifetime of an automatically-managed variable ends, its memory is automatically deallocated, and can be reused.

The stack is Last In First Out (LIFO). When a block enters, its variables are allocated on the stack, when it exits, its variables are deallocated.

== Arrays

Arrays are a sequence of elements of the same type.
Elements are stored in contiguous memory locations.
Arrays stored on the stack must have a fixed size, so their memory can be automatically managed.

== Structs

Members are stored in contiguous memory locations, in the same order they are declared.

```c
struct point {
  int x;
  int y;
};
int main() {
  struct point p = {1, 2};
  printf("x = %d\ny = %d\n", p.x, p.y);
}
```
We can often use this:
```c
typedef struct {
  int x;
  int y;
} point;
int main() { point p = {1, 2}; /* ... */ }
```

== Strings

Strings are arrays of characters, terminated by a null character.

```c
char greeting[] = "Hello World";
```

This is the same as:
```c
char greeting[] = {'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd', '\0'};
```

We use double quotes " to write a (ASCII) string literal and single quotes ' to write a character literal.

== Functions

Function definition: fully specifies the behaviour of the function.
Function declaration: only specifies the interface -- how a function can be used.

== Call by Value and Call by Reference

All function arguments are passed by value.

Arrays are treated slightly differently: the address of the first element is passed by value.
Because of this, changes to the array elements are now visible to the caller (mutability).

== Stack and Heap Allocation
allocated on the stack, or heap, at runtime, using dynamic memory allocation (malloc).
Returning pointers to local variables is dangerous, as the local variable will go out of
scope when the function returns and the pointer will point to invalid memory.
Stack is last in first out. When a block enters, its variables are allocated on the stack,
When it exits, its variables are deallocated.
The stack is automatically managed by the compiler, the size of every variable is fixed at compile time.
Fixed size arrays are allocated on the stack.
Dynamic arrays are allocated on the heap, using malloc for allocation and free for deallocation.
Struct is sequence of members, passed by value.
Array, passed by reference.

== Manual Memory Management Challenges
Challenges with manual memory management: double free errors, dangling pointers, memory leaks.
64-bit architecture: addresses are 64-bit. In practice, 48 bits are used.

== Pointers and Their Usage
Dereferencing a pointer: Access the value stored at the memory address.
Dereferencing a void pointer: Forbidden as the type of the pointer is unknown, the user must cast the pointer
to the correct type before dereferencing it.
Make a pointer `(int* p = &x)`.
`int param[]` and int `*param` are the same.
float `* const ptr`: ptr is a constant pointer to a float.
const float `* ptr`: ptr is a pointer to a constant float.
const float `* const ptr`: ptr is a constant pointer to a constant float.
ptr[i] and `* (ptr + i)` are the same.
`ptr->member` is the same as (`*ptr`).member.
Dereferencing a pointer is unsafe.
Dereferencing a void pointer is forbidden.
Heap is part of memory reserved for dynamic allocation.
It is safe to call free (NULL).
If we don't call free, we leak memory.
Returning a pointer to a local variable is dangerous.

== Function Pointers
Function pointers `(return type (*func) (arg_types))`.

= Errors

Segmentation faults: accessing memory that is not allocated, or accessing memory that is protected.
Causes for segmentation faults: Dangling pointers, dereferencing NULL, writing to read-only memory,
buffer overflow, stack/heap overflow.
Memory Sanitizer, Address Sanitizer, Leak Sanitizer.
To check where an error occurs, use GDB, use -g flag when compiling.

= Memory Management and Ownership

RAII: Resource Acquisition Is Initialisation.
Use constructor to allocate memory, destructor to free it.
For storing a value, use unique_ptr for unique ownership, shared_ptr for shared ownership.
Ownership is the concept of managing the lifecycle of resources, particularly memory.

= Concurrency

== Concurrency vs. Parallelism
Concurrency is about dealing with lots of things at once.
Concurrency is a programming paradigm.
Parallelism is about doing lots of things at once.
Parallelism is about making programs faster.

== Threads and Processes
Processes are instances of a program.
Threads are instances of a process.
Multiple threads can be executed simultaneously.
Threads share the same address space.
Processes have their own address space, the OS ensures this.

== Mutual Exclusion and Critical Regions
Mutual exclusion is the mechanism that ensures that only one thread can access a resource at a time.
Mutual exclusion is used to protect critical sections of code.
Example showing the need for mutual exclusion: removal of elements from a linked list.
Critical region is the part of the code that updates some shared state.

== Locks and Deadlocks
Locks: before entering a critical region, acquire a lock.
After leaving a critical region, release the lock.
Deadlock: two threads are waiting for each other to release a lock.
Bust Waiting: one thread is waiting for another thread to release a lock, wastes CPU cycles.

== Condition Variables and Coordination
use condition variables to wake up threads that are waiting for a condition to be true.
Important thread coordination aspects:
partitioning: what parts of the computation should be separatel evaluated,
data sharing: what data to share between threads,
synchronisation: ensuring threads can cooperate without interference.

== Semaphores
Semaphores: a semaphore is a variable that is used to control access to a shared resource.
A semaphore holds an integer counter and provides two atomic operations: wait and signal.

== Auto Keyword and Lambda Functions
Auto keyword: auto keyword is used to let the compiler deduce the type of a variable from the initializer.
Lambda functions: `([capture] (parameters) -> return type { body })`.
Pass by pointer: `([l_ptr = &l])`.
Capture all variables by value: `([=] (parameters) -> return type { body })`.
Capture all variables by reference: `([&] (parameters) -> return type { body })`.
Capture a specific variable by value: `([x] (parameters) -> return type { body })`.
Capture a specific variable by reference: `([&x] (parameters) -> return type { body })`.

== Asynchronous Programming (std::async, std::future, std::promise, std::packaged_task)
Std::async: `std::async(std::launch::async, function, args...)`
Async tasks are executed in a separate thread.

Std::future: `std::future<T> f = std::async(std::launch::async, function, args...)`
Future is a promise to return a value later, a value that is not yet computed.

future.get(): blocks until the future is ready.

Std::promise: `std::promise<T> p`
Promise is a container for a future value.

A promise allows you to provide a value once it has been computed.

Without future and promise the value would have to be explicitly protected by a
mutex and a condition variable that could be used to wait for the value to be computed.

Std::packaged_task: `std::packaged_task<T> pt(function)`
Packaged task is a task that can be executed later.