#set document(title: "Systems Programming")
#set page(margin: 20pt)

#outline(title: none)

#pagebreak()

= Introduction to Systems Programming #text(fill: gray, size: 10pt)[Week 1]

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

= The Basics of C #text(fill: gray, size: 10pt)[Week 2]

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

#pagebreak()

= Memory & Pointers #text(fill: gray, size: 10pt)[Week 3]

Each byte in memory has its own unique address.

On a 64-bit machine, addresses are 64-bit, in practice 48 bits are used.

We can get the address of a variable using the address-of operator `&`.

== Pointers

A pointer is a variable that stores the address of a memory location.

Dereferencing a pointer: Access the value stored at the memory address.

Every pointers has the same size, which is the size of the address of the machine.

A pointer has its space in memory.

=== Pointers and NULL

A pointer is supposed to stoer the address of a variable, but sometimes it doesn't point to anything.
When the pointers doesn't have a valid address, we set it to `NULL` or `0`.

Dereferencing a NULL pointer will crash your program.

=== Pointers and const

In C, every variable can be annotated with the type qualifier `const`. This indicates that the content of the variable cannot be changed. This is enforced by the compiler.

*Pointers can be const*
- `float * const ptr`: ptr is a constant pointer to a float.
- `const float * ptr`: ptr is a pointer to a constant float.
- `const float * const ptr`: ptr is a constant pointer to a constant float.

=== Pointers and Arrays

The name of an array is a pointer to the first element of the array.

`ptr[i]` is the same as `*(ptr + i)`.

Two important differences:
- sizeof returns different values (size of array vs. size of pointer)
```c
printf("%ld\n", sizeof(vector)); // prints '24' (== 6 * 4 bytes)
printf("%ld\n", sizeof(ptr)); // prints '8' (size of a pointer)
```
- We can not change a static array, only its elements
```c
vector = another_vector; // error: array type 'int [6]' is not assignable
```

=== Pointer Arithmetic

We can use *pointer arithmetic* to modify the value of a pointer.
- Add/subtract a number to/from a pointer to get a new pointer.
- Subtract two pointers from each other
- Compare pointers

Pointers cannot be added or multiplied

=== Pointers and Structs

*Linked list* example

```c
struct node { int value; struct node *next;
};
```

`ptr->m` is the *member access operation* to access a member `m` of a struct pointer `ptr`.

```c
struct node * ptr = &a;
while (ptr) {
    printf("%d\n", (*ptr).value);
    ptr = (*ptr).next;
}
```

*Binary Search Tree* example

```c
struct bst_node {
    int value;
    struct bst_node *left;
    struct bst_node *right;
};
```

We can search efficiently for a value in the tree using a pointer to the root of the tree.

```c
struct node * find(struct node *root, int value) {
    if (root == NULL || root->value == value) {
        return root;
    }
    if (value < root->value && root->left != NULL) {
        return find(root->left, value);
    }
    if (value > root->value && root->right != NULL) {
        return find(root->right, value);
    }
    return NULL;
}
```

== Writing Generic Code with `void *`

Sometimes we want to write code that can work with any type of data.

The special pointer of type `void *` is a generic pointer. Every pointer is automatically convertible to it.

We cannot access the value we are pointing to as we don't know what those bits mean. Hence, dereferencing a `void *` is forbidden.

== Stack and Heap Memory Regions

*Automatic variables are stored on the stack*.
The size of every variable on the stack has to be known statically.

*Allocated variables*: we manage the memory manually by dynamically requesting and releasing memory from *the heap*.

*The heap* is a part of memory reserved for dynamic memory allocation, it is managed by the programmer.

The stack and the heap share the same address space and grow with use towards each other.

== Dynamic memory management

*`malloc`* is used to request memory from the heap.
*`free`* is used to release memory back to the heap.

=== Allocating memory

We request a new chunk of memory from the heap using `malloc`.

```c
int *ptr = (int *)malloc(sizeof(int));
```

If `malloc` succeeds, it returns a void pointer to the first bytes of the un-initialized memory.

If `malloc` fails, it returns `NULL`, we should check for this.

=== Freeing memory

We release memory back to the heap using `free`.

```c
free(ptr);
```

It is a good practice to set the pointer to `NULL` after freeing it.

```c
ptr = NULL;
```

=== Memory Leaks

The heap has a finite amount of memory, if we continuously allocate memory without freeing it, we will run out of memory.

If *`free`* is not called, we *leak* the allocated memory.

Returning a pointer to a local variable is dangerous, as the local variable will go out of scope when the function returns and the pointer will point to invalid memory.

= Debugging and Development Tools #text(fill: gray, size: 10pt)[Week 4]

== Function Pointers
Function pointers `return_type (*func) (arg_types)`. A pointer to a function. Used in function arguments.

== Segmentation Faults

A *segmentation fault* is raised by the hardware notifying the operating system that your program has attempted to access a restricted area of memory.

The operating system will then immediately terminate your program. It is possible to catch the segmentation fault signal and handle it.

=== Dangling Pointers

A *dangling pointer* is a pointer that points to a memory location which has been de-allocated then allocated to another variable.
If you `NULL` after freeing, it is easier to check if this pointer is "active" or not.

```c
int main() {
    int* ptr = (int*)malloc(sizeof(int));
    *ptr = 10;
    free(ptr);
    // ptr = NULL; we should do this
    printf(“%d\n”, *ptr); // ptr is now a dangling pointer
    return 0;
}
```

=== Dereferencing a NULL pointer

`NULL` is an invalid memory location.

```c
int main() {
    int* ptr = NULL;
    *ptr = 10; // dereferencing ptr will cause a segmentation fault
    return 0;
}
```

=== Buffer overflow

Accessing memory outside of allocated bounds, typically with arrays.
You can read the values in these extra locations, but this data would be corrupted.

```c
int main() {
    int arr[5] = {1, 2, 3, 4, 5};
    int* ptr = arr;
    printf("%d\n", ptr[5]); // accessing memory outside of allocated bounds
    return 0;
}
```

== Stack Overflow

Trying to write more data than your allocated memory.
Often triggered by a recursion without a base case.

```c
void recurse(int n) { //Let’s smash the stack
    char ptr[1024];
    recurse(n+1);
}
int main() {
    recurse(1);
}
```

== Heap Overflow

```c
void recurse(int n) { // Let’s smash the heap
    char *ptr = (char *)malloc(n);
    recurse(n+1);
}
int main() {
    recurse(1);
}
```

== The Debugger

The two popular debuggers are `gdb` and `lldb`.

We need to compile the program with the `-g` flag to include debugging information.

Inside the debugger, common commands are `run`, `b`, `n`, `s`, `bt`, `list`.


== Static Analysis

Static analysis tools are used to analyse the code without running it.
They are useful to find potential bugs and errors.

`clang --analyze --analyzer-output html program.c`

== Dynamic Analysis Tools

== Dynamic Analysis Tools

Dynamic analysis tools are used to analyse the code while it is running.
They can only detect bugs which are encountered during the execution of a particular test input.

The clang project provides several sanitizers:
- *AddressSanitizer*: detects memory errors like buffer overflows and use-after-free
- *MemorySanitizer*: detects uninitialized memory reads
- *LeakSanitizer*: detects memory leaks
- *UndefinedBehaviorSanitizer*: detects undefined behaviour

Later in the course, we will use:
- *ThreadSanitizer*: detects data races in concurrent programs

To use these tools, compile with the appropriate flags

#pagebreak()

= Memory Management and Ownership #text(fill: gray, size: 10pt)[Week 5]

== Challenges

When we allocate memory ourselves with `malloc`, we are responsible for calling `free`.
We must call `free` exactly once for each address we obtained from `malloc`.
It is good practice to assign the null value to pointers that have been freed but this does not prevent all double free errors.

== Ownership

To organise memory management we adopt the concept of *ownership*.
Ownership means tht we identify a single entity that is responsible for managing a location in memory.

== Differences between C and C++

C++ is a superset of C with almost double the keywords. The main difference is its focus on Object-Oriented Programming (OOP), where the focus is on objects rather than functions. Objects act as cookie cutters, with instances being the cookies. OOP principles include:
- Inheritance
- Encapsulation
- Abstraction
- Polymorphism

There are some library differences, for example using `<iostream.h>` instead of `<stdio.h>`. However, C libraries can still be imported using the `c` prefix, e.g. `<cstdio>`.

To compile C++ code, use `clang++` with the `-std` flag to specify the language standard:

== Ownership in C++

In C++, we can express the ownership of a heap memory location explicitly in the code.

*RAII*: Resource Acquisition Is Initialisation.

- We tie the management of a resource to the lifetime of a variable on the stack.
- The allocation of the resource is done when we create the variable, in the constructor.
- The deallocation of the resource is done when the variable goes out of scope, in the destructor.

```cpp
struct int_list_on_the_heap { // This is C++ code and not legal C!
    int * ptr; // dynamic array of ints
    // constructor
    int_list_on_the_heap(int size) {
        ptr = (int*)malloc(sizeof(int) * size);
    }
    // destructor
    ~int_list_on_the_heap() { free(ptr); }
};
typedef struct int_list_on_the_heap int_list_on_the_heap;
```

For storing a single value on the heap we should use one of two "smart" pointers:
- `unique_ptr` for unique ownership
- `shared_ptr` for shared ownership

Ownership is the concept of managing the lifecycle of resources, particularly memory.

*Binary Tree example*

```cpp
#include <memory>
struct node {
    const void * value_ptr;
    // The parent owns both children uniquely
    std::unique_ptr<struct node> left_child;
    std::unique_ptr<struct node> right_child;
    // Each child knows their parent, but doesn't own it
    struct node* parent;
    node(const void * value_ptr_) {
        value_ptr = value_ptr_;
        left_child = NULL; right_child = NULL; parent = NULL }
    // destructors of left/right_child are auto-called to free their heap memory
    ~node() { }
    void add_left_child(const void* value_ptr) {
        // make_unique allocates heap memory for 1 node and calls the node-constructor
        left_child = std::make_unique<struct node>(value_ptr); }
    void add_right_child(const void* value_ptr) {
        right_child = std::make_unique<struct node>(value_ptr); }
};
```

= Concurrent Systems Programming #text(fill: gray, size: 10pt)[Week 6]

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