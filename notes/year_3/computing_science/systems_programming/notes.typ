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

*Pointers and NULL*

A pointer is supposed to stoer the address of a variable, but sometimes it doesn't point to anything.
When the pointers doesn't have a valid address, we set it to `NULL` or `0`.

Dereferencing a NULL pointer will crash your program.

*Pointers and const*

In C, every variable can be annotated with the type qualifier `const`. This indicates that the content of the variable cannot be changed. This is enforced by the compiler.

Pointers can be const
- `float * const ptr`: ptr is a constant pointer to a float.
- `const float * ptr`: ptr is a pointer to a constant float.
- `const float * const ptr`: ptr is a constant pointer to a constant float.

*Pointers and Arrays*

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

*Pointer Arithmetic*

We can use *pointer arithmetic* to modify the value of a pointer.
- Add/subtract a number to/from a pointer to get a new pointer.
- Subtract two pointers from each other to get a signed integer.
- Compare pointers

Pointers cannot be added or multiplied

*Pointers and Structs*

*Linked list* example

```c
struct node { int value; struct node *next; };
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

=== Stack Overflow

Trying to write more data than your allocated memory.
Often triggered by a recursion without a base case.

```c
void recurse(int n) { //Let's smash the stack
    char ptr[1024];
    recurse(n+1);
}
int main() {
    recurse(1);
}
```

=== Heap Overflow

```c
void recurse(int n) { // Let's smash the heap
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
It is good practice to assign the null value to pointers that have been freed but this does not prevent all *double free* errors.

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

#pagebreak()

= Concurrent Systems Programming #text(fill: gray, size: 10pt)[Week 6]

*What is concurrency?*

The ability of different program parts to be executed simultaneously.

There are many different methods to enable concurrent programs. We distinguish two classes:
- *Shared memory locations* are read and modified to communicate between concurrent components. Requires synchronization to ensure that communication happens safely.
- *Message passing* tends to be far easier to reason about than shared-memory concurrency, and is typically considered a more robust form of concurrent programming.


Concurrency is about dealing with lots of things at once.
Concurrency is a programming paradigm.
Parallelism is about doing lots of things at once.
Parallelism is about making programs faster.

== Threads and Processes

Processes
- Every C program we have written is executed as a process
- Multiple processes can be executed simultaneously
- Each process has its own memory address space

Threads
- A thread of execution is an independent sequence of program instructions
- Multiple threads can be executed simultaneously
- A process can have multiple threads sharing the same address space of the process
- We will use threads to implement concurrent programs

=== Creating a thread

To create a thread in C, we use the pthread library. Here's a basic example:

```c)
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <assert.h>

void * PrintHelloWorld(void*) {
    printf("Hello World from a thread!\n");
    return NULL;
}

int main() {
    pthread_t thread;
    int error = pthread_create(&thread, NULL, PrintHelloWorld, NULL);
    assert(error == 0);
    error = pthread_join(thread, NULL);
    assert(error == 0);
}
```

*Creating a thread*

`int pthread_create(pthread_t *thread, const pthread_attr_t *attr, void *(*start_routine)(void*), void *arg);`

It takes four arguments:
1. A thread identifier, i.e. a pointer to a memory location of type `pthread_t`.
2. Thread attributes which set properties such as scheduling policies or stack size.
    - Passing NULL results in default attributes.
3. A function pointer to the start_routine.
    - This function takes a single argument of type void* and returns a value of type void*.
4. The argument that is passed to start_routine.

*Joining a thread*

`int pthread_join(pthread_t thread, void **value_ptr);`

It takes two arguments:
1. A thread identifier.
2. A pointer to a memory location of type `void*`.
    - The return value of the start_routine passed to pthread_create will be copied to this location.

== Mutual Exclusion and Critical Regions
Mutual exclusion is the mechanism that ensures that only one thread can access a resource at a time.
Mutual exclusion is used to protect critical sections of code.
Example showing the need for mutual exclusion: removal of elements from a linked list.

== Critical Region

A *critical region* is a part of the code that updates some shared state.

Critical regions must be protected so that concurrent threads don't interfere with each other. *Mutual exclusion* means that only one thread executes a critical section.

A *race condition* occurs when the result of a program execution depends on the order in which threads are executed.

```
T0: register1 = count {T0 register1 = 5}
T0: register1 = register1 + 1 {T0 register1 = 6}
T0: count = register1 {count = 6}
T1: register1 = count {T1 register1 = 6}
T1: register1 = register1 + 1 {T1 register1 = 7}
T1: count = register1 {count = 7 }
```

== Locks and Deadlocks

Associate a *lock* (aka a *mutex*) with each critical section.

Before executing a critical section a thread must *acquire* the lock.
On leaving the critical section the thread must *release* the lock.

```c
acquire(theLock);
count++;
release(theLock);
```

If another thread owns the lock, the requesting thread is *blocked* until the owning thread releases the lock.
If the lock is not owned, the requesting thread is granted ownership.

On release of a lock, one of the threads blocked waiting for the lock will be granted ownership and continue executing.

*Bounded Buffer*

*Producers* insert elements into the start of the buffer, *consumers* remove elements from the end of the buffer.

We have to ensure that producers wait when the buffer is full, and consumers wait when the buffer is empty.


```c
Lock theLock;
int count = 0; int in = 0; int out = 0;
Type buffer[N];

for (;;) { // PRODUCER
  acquire(theLock);
  while (count == N);
  buffer [in] = nextProduced;
  in = (in + 1) % N;
  count++;
  release(theLock);
}

for (;;) { // CONSUMER
  acquire(theLock);
  while (count == 0);
  nextConsumed = buffer[out];
  out = (out + 1) % N;
  count--;
  release(theLock);
}

```

*Deadlock*: two threads are waiting for each other to release a lock.

Consider the situation where `count == 0` and the consumer executes `while (count == 0)`.

This results in a deadlock as neither thread can make progress.

We can avoid deadlock if when a thread must wait for some condition it releases the locks it owns

*Bust Waiting*: one thread is waiting for another thread to release a lock, wastes CPU cycles.
When a thread continuously checks a condition in a loop without releasing the CPU, waiting for some event to occur.

This is an example of busy waiting:
```c
while (!teaIsReady) {
  pthread_mutex_unlock(&m);
  printf("Me: (Unamused) // do nothing\n");
  pthread_mutex_lock(&m); }
```

== Condition Variables

Since Busy waiting wastes CPU cycles and energy, it would be better to block the thread seeking to acquire a lock, and wake it when it has a chance to proceed. We can achieve this with condition variables.


```c
pthread_mutex_lock(&m);
while (!teaIsReady) {
  pthread_cond_wait(&c, &m);
}
// Do something
pthread_mutex_unlock(&m);
```

`pthread_cond_wait` takes two arguments:
1. A condition variable.
2. A mutex.

In the function, the mutex is unlocked and the thread is blocked on the condition variable.
When the condition variable is signalled, the thread is awakened and the mutex is locked again.

== Coordination

A concurrent poses all of the challenges of sequential *Computation*: i.e. what to compute. A correct and efficient Algorithm, using appropriate data structures must be constructed.

A concurrent program must also specify a correct and effective strategy for *Coordination*: i.e. how threads should cooperate.

Important thread coordination aspects:
- *Partitioning*: determining what parts of the computation should be separately evaluated, e.g. a thread to serve each request, to render each frame of a film.
- *Data Sharing*: What data to share between threads, and when to acquire it e.g. film rendering threads may hold 2 frames: 1 being processed and another ready to go as soon as the current frame is complete
- *Synchronisation*: ensuring threads can cooperate without interference, e.g. if threads representing 2 players compete to get a single resource then only one succeeds

== Semaphores
A (counting) semaphore holds an integer counter and provides 2 operations:
- wait decrements the counter and blocks if it is less than zero
- signal increments the counter and wakes waiting threads

We can count how many items of a resource are used and block access if no resources are available.

A binary semaphore (with a count of 1)
- combines a mutex and a condition variable
- Allows a single thread into a critical section: blocking/reawakening threads

```c
sem_t sem;
sem_init(&sem, 0, 1); // initialise to 1
sem_wait(&sem); // decrement the counter
sem_post(&sem); // increment the counter
```

We must avoid problems of:
- *Deadlock*: a thread holds a lock and waits for another lock that is held by another thread
- *Livelock*: a thread repeatedly attempts to acquire a lock that is always held by another thread
- *Starvation*: a thread is perpetually denied access to a resource

= C++ Thread Management #text(fill: gray, size: 10pt)[Week 7]

== Auto Keyword and Lambda Functions
Auto keyword: auto keyword is used to let the compiler deduce the type of a variable from the initializer.

Lambda functions: `([capture] (parameters) -> return type { body })`.
- Pass by pointer: `([l_ptr = &l])`.
- Capture all variables by value: `([=] (parameters) -> return type { body })`.
- Capture all variables by reference: `([&] (parameters) -> return type { body })`.
- Capture a specific variable by value: `([x] (parameters) -> return type { body })`.
- Capture a specific variable by reference: `([&x] (parameters) -> return type { body })`.

== Mutual Exclusion in C++

C++ avoids the issue of forgetting to unlock a resource by
viewing locking mutex as owning a resource and applying
the RAII (Resource Acquisition Is Initialization) technique:
We create a local variable on the stack that locks the mutex

At the end of the lifetime the variable releases the lock automatically

```cpp
std::mutex m; // mutex variable; shared across threads
void foo() {
  std::unique_lock<std::mutex> lock(m); // acquire the mutex
// ... do some work
} // releases the mutex by calling m.unlock();
```

== Condition Variables in C++

Condition variables are a synchronisation mechanism to wait for conditions without busy waiting.

In C++ we directly provide the condition we are waiting for to the wait call.
```cpp
std::condition_variable cv;
std::mutex m;
void wait_for_event() {
  std::unique_lock<std::mutex> lock(m);
  cv.wait(lock, [] { return event_happened; });
}
```

This idiom checks the condition after the thread is woken up, guaranteeing that cond is true after the statement is executed.

== Asynchronous Programming

Async tasks are executed in a separate thread.
Std::async: `std::async(function, args...)`

Future is a promise to return a value later, a value that is not yet computed.
Std::future: `std::future<T> f = std::async(function, args...)`

future.get(): blocks until the future is ready.

Std::promise: `std::promise<T> p`
Promise is a container for a future value.

```cpp
void sum(
    std::vector<int>::iterator begin,
    std::vector<int>::iterator end,
    std::promise<int> sum_promise
  ) {
  int sum = std::accumulate(begin, end, 0);
  sum_promise.set_value(sum); // 4. write result
}
int main() {
  auto numbers = std::vector<int>{ 1, 2, 3, 4, 5, 6 };
  std::promise<int> sum_promise; // 1. create promise for an int
  std::future<int> sum_future = sum_promise.get_future(); // 2. get future from promise
  // 3. create thread that takes ownership of the promise (ownership transfer with std::move)
  auto t = std::thread(sum, numbers.begin(), numbers.end(), std::move(sum_promise) );
  printf("result = %d\n", sum_future.get() ); // 4. wait and then read result
  t.join();
}
```

A promise allows you to provide a value once it has been computed.

Without future and promise the value would have to be explicitly protected by a
mutex and a condition variable that could be used to wait for the value to be computed.

Usually we communicate data over a channel, e.g. the results of a computation
Sometimes we only want to synchronise tasks e.g. wait until all worker threads are ready before sending work We can achieve this with
- an std::promise<void>, a promise to produce nothing (but say when you're done)
- the std::future<T>::wait() method

```cpp
void do_work(std::promise<void> barrier) {
  std::this_thread::sleep_for(std::chrono::seconds(1)); // do something (like
  sleeping)
  barrier.set_value(); // 4. send signal to other thread
}
int main() {
  std::promise<void> barrier; // 1. create promise
  std::future<void> barrier_future = barrier.get_future(); // 2. get future from it
  auto t = std::thread(do_work, std::move(barrier) ); // 3. launch thread
}
```

Std::packaged_task: `std::packaged_task<T> pt(function)`
Packaged task is a task that can be executed later.

We can
- wrap up a task for future execution using std::packaged_task
- extract the value with task.get_future(

```cpp
int main() {
  auto task = std::packaged_task<int(int,int)>([](int a, int b) { return pow(a,
  b); }) ;
  std::future<int> result = task.get_future() ;
  // The task can now be stored, or passed as a parameter.
  // When we are ready to use it either
  // launch task in the same thread via:
  // task(2, 10);
  // or start a new thread:
  auto t = std::thread(std::move(task) , 2, 10);
  t.join();
  printf("task result: %d\n", result.get() );
}

```
#pagebreak()

= Code Examples

== Thread Safe Bounded Buffer in C

#text(size: 9pt)[
#grid(
  columns: (1fr, 1fr),
  rows: (auto),
  stroke: none,
  rect(stroke: none)[
```c
struct BoundedBuffer {
    int start;
    int end;
    int size;
    int* buffer;
    pthread_mutex_t m;
    pthread_cond_t add;
    pthread_cond_t remove;
};
typedef struct BoundedBuffer BoundedBuffer;

BoundedBuffer* createBoundedBuffer(int size) {
    BoundedBuffer* bb = malloc(sizeof(BoundedBuffer));
    bb->start = 0;
    bb->end = 0;
    bb->size = size;
    bb->buffer = malloc(size * sizeof(int));
    pthread_mutex_init(&bb->m, NULL);
    pthread_cond_init(&bb->add, NULL);
    pthread_cond_init(&bb->remove, NULL);
    return bb;
}

void destroyBoundedBuffer(BoundedBuffer* bb) {
    if (!bb) return;
    pthread_mutex_destroy(&bb->m);
    pthread_cond_destroy(&bb->add);
    pthread_cond_destroy(&bb->remove);
    free(bb->buffer);
    free(bb);
}

void addItem(BoundedBuffer* bb, int item) {
    if (!bb) return;
    pthread_mutex_lock(&bb->m);
    while (bb->start == bb->end) { // buffer is full
        printf("== Buffer is full ==\n");
        pthread_cond_wait(&bb->add, &bb->m);
    }
    // buffer is no longer full
    bb->buffer[bb->start] = item;
    bb->start = (bb->start + 1) % bb->size; // move start one forward
    pthread_mutex_unlock(&bb->m);
    pthread_cond_signal(&bb->remove);
}
```
  ],
  rect(stroke: none)[
```c
int removeItem(BoundedBuffer* bb) {
    if (!bb) assert(0);
    pthread_mutex_lock(&bb->m);
    while (((bb->end + 1) % bb->size) == bb->start) { // buffer is empty
        printf("== Buffer is empty ==\n");
        pthread_cond_wait(&bb->remove, &bb->m);
    }
    // buffer is no longer empty
    bb->end = (bb->end + 1) % bb->size; // move end one forward
    int item = bb->buffer[bb->end];
    pthread_mutex_unlock(&bb->m);
    pthread_cond_signal(&bb->add);
    return item;
}

void* producer(void* arg) {
    BoundedBuffer* bb = (BoundedBuffer*)arg;
    for (int i = 0; i < 10; i++) {
        int item = randInt();
        printf("produced item %d\n", item);
        addItem(bb, item);
        usleep(randInt());
    }
    return NULL;
}

void* consumer(void* arg) {
    BoundedBuffer* bb = (BoundedBuffer*)arg;
    for (int i = 0; i < 10; i++) {
        int item = removeItem(bb);
        printf(" consumed item %d\n", item);
        usleep(randInt());
    }
    return NULL;
}

int main() {
    pthread_t t1;
    pthread_t t2;
    int err;
    BoundedBuffer* bb = createBoundedBuffer(4);
    err = pthread_create(&t1, NULL, consumer, bb);
    assert(err == 0);
    err = pthread_create(&t2, NULL, producer, bb);
    assert(err == 0);
    err = pthread_join(t1, NULL);
    assert(err == 0);
    err = pthread_join(t2, NULL);
    assert(err == 0);
    destroyBoundedBuffer(bb);
    return 0;
}
```
  ],
)
]


#pagebreak()

== Thread Safe Bounded Buffer in C++

#text(size: 7pt)[
#grid(
  columns: (1fr, 1fr),
  rows: (auto),
  stroke: none,
  rect(stroke: none)[
```cpp
#include <iostream>
#include <thread>
#include <vector>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <random>

class BoundedBuffer {
private:
    std::size_t start   = 0;          // index of next item to remove
    std::size_t end     = 0;          // index of next slot to fill
    std::size_t count   = 0;          // current number of items
    const std::size_t capacity;       // max items allowed

    std::vector<int> buffer;          // underlying storage

    std::mutex m;
    std::condition_variable add_cv;    // signalled when space becomes available
    std::condition_variable remove_cv; // signalled when an item is available

public:
    explicit BoundedBuffer(std::size_t max_size)
        : capacity(max_size), buffer(max_size) {}

    // disable copying — the mutex/condvars cannot be copied safely
    BoundedBuffer(const BoundedBuffer&)            = delete;
    BoundedBuffer& operator=(const BoundedBuffer&) = delete;

    // Producer interface
    void addItem(int item) {
        std::unique_lock<std::mutex> lock(m);

        // Wait until there's at least one free slot
        add_cv.wait(lock, [this] { return count < capacity; });

        buffer[end] = item;
        end = (end + 1) % capacity;
        ++count;

        // Wake up *one* waiting consumer
        remove_cv.notify_one();
    }

    // Consumer interface
    int removeItem() {
        std::unique_lock<std::mutex> lock(m);

        // Wait until there's at least one item
        remove_cv.wait(lock, [this] { return count > 0; });

        int item = buffer[start];
        start = (start + 1) % capacity;
        --count;

        // Wake up *one* waiting producer
        add_cv.notify_one();
        return item;
    }
};


```
  ],
  rect(stroke: none)[
```c
void producer(BoundedBuffer& buf, int id, int total) {
    std::mt19937 rng(id * 1234);
    std::uniform_int_distribution<int> dist(10, 100);

    for (int i = 1; i <= total; ++i) {
        int value = id * 1000 + i;          // create something identifiable
        buf.addItem(value);
        std::cout << "Producer " << id << " pushed " << value << '\n';

        std::this_thread::sleep_for(std::chrono::milliseconds(dist(rng)));
    }
}

void consumer(BoundedBuffer& buf, int id, int total) {
    std::mt19937 rng(id * 5678);
    std::uniform_int_distribution<int> dist(20, 150);

    for (int i = 0; i < total; ++i) {
        int value = buf.removeItem();
        std::cout << "  Consumer " << id << " popped " << value << '\n';

        std::this_thread::sleep_for(std::chrono::milliseconds(dist(rng)));
    }
}

int main() {
    constexpr std::size_t capacity     = 5;   // size of the ring buffer
    constexpr int items_per_producer   = 10;
    constexpr int num_producers        = 2;
    constexpr int num_consumers        = 2;

    BoundedBuffer buf(capacity);

    std::vector<std::thread> threads;

    // launch producers
    for (int p = 0; p < num_producers; ++p) {
        threads.emplace_back(producer, std::ref(buf), p + 1, items_per_producer);
    }
    // launch consumers (each will consume the same total number of items)
    for (int c = 0; c < num_consumers; ++c) {
        threads.emplace_back(consumer, std::ref(buf), c + 1,
                             (num_producers * items_per_producer) / num_consumers);
    }

    for (auto& t : threads) t.join();
    std::cout << "\nAll work done — buffer is empty, threads exited cleanly.\n";
    return 0;
}

```
  ],
)
]

#pagebreak()

== Thread Safe Linked List in C++

#text(size: 9pt)[
```cpp
#include <list>
#include <thread>
#include <optional>
#include <mutex>

struct list {
  private:
    std::list<int> list; std::mutex mutex; // mutex to protect critical section
  public:
  void append_to_list(int value) {
    std::unique_lock<std::mutex> lock(mutex); // lock mutex: enter critical section
    list.push_back(value);
  } // mutex will be automatically unlocked here
  std::optional<int> remove_from_list(int position) {
    std::unique_lock<std::mutex> lock(mutex); // lock mutex: enter critical section
    auto iter = list.begin();
    while (position > 0 && iter != list.end()) { iter++; position--; }
    if (position != 0 || iter == list.end()) { return {}; /* nothing to return */ }
    int value = *iter;
    list.erase(iter);
    return value;
  } // mutex will be automatically unlocked here
};

int main() {
  auto l = list{}; l.append_to_list('a'); l.append_to_list('b'); l.append_to_list('c');
  auto t1 = std::thread([l_ptr = &l](){ l_ptr->remove_from_list(1); });
  auto t2 = std::thread([l_ptr = &l](){ l_ptr->remove_from_list(1); });
  t1.join(); t2.join();
}
```
]


== Parallel Sum in C++

#text(size: 9pt)[
```cpp
int parallelSum(std::vector<int>::iterator begin, std::vector<int>::iterator end) {
  auto len = end - begin;
  // compute sequentially for small arrays
  if (len < 1000) { return std::accumulate(begin, end, 0); }
  auto mid = begin + len/2;
  // launch asynchronous task for the left half of the
  array
  auto left_side = std::async([=] { return parallelSum(begin, mid); });
  // compute right half of array recursively
  int right_side = parallelSum(mid, end);
  // block to wait for left side to finish
  return left_side.get() + right_side;
}
int main() {
  std::vector<int> vec = createLargeVector();
  auto sum = parallelSum(vec.begin(), vec.end());
  printf("sum: %d\n", sum);
}
```
]

Better parallel sum:

#text(size: 9pt)[
```cpp
int parallelSum(std::vector<int>::iterator begin, std::vector<int>::iterator
  end, int depth = 0 ) {
  auto len = end - begin;
  if (len < 1000 || depth > 3 ) { return std::accumulate(begin, end, 0); }
  auto mid = begin + len/2;
  auto left_side = std::async([=] { return parallelSum(begin, mid, depth +
  1 ); });
  int right_side = parallelSum(mid, end, depth + 1 );
  return left_side.get() + right_side;
}
```
]

#pagebreak()

== Thread Safe Queue in C

#text(size: 9pt)[
```c
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#define QUEUE_CAPACITY 16

typedef struct {
    int data[QUEUE_CAPACITY];
    int front, rear, count;
    pthread_mutex_t mutex;
    pthread_cond_t not_empty, not_full;
} ThreadSafeQueue;

void queue_init(ThreadSafeQueue* q) {
    q->front = q->rear = q->count = 0;
    pthread_mutex_init(&q->mutex, NULL);
    pthread_cond_init(&q->not_empty, NULL);
    pthread_cond_init(&q->not_full, NULL);
}

void queue_destroy(ThreadSafeQueue* q) {
    pthread_mutex_destroy(&q->mutex);
    pthread_cond_destroy(&q->not_empty);
    pthread_cond_destroy(&q->not_full);
}

void enqueue(ThreadSafeQueue* q, int value) {
    pthread_mutex_lock(&q->mutex);
    while (q->count == QUEUE_CAPACITY)
        pthread_cond_wait(&q->not_full, &q->mutex);
    q->data[q->rear] = value;
    q->rear = (q->rear + 1) % QUEUE_CAPACITY;
    q->count++;
    pthread_cond_signal(&q->not_empty);
    pthread_mutex_unlock(&q->mutex);
}

int dequeue(ThreadSafeQueue* q) {
    pthread_mutex_lock(&q->mutex);
    while (q->count == 0)
        pthread_cond_wait(&q->not_empty, &q->mutex);
    int value = q->data[q->front];
    q->front = (q->front + 1) % QUEUE_CAPACITY;
    q->count--;
    pthread_cond_signal(&q->not_full);
    pthread_mutex_unlock(&q->mutex);
    return value;
}
```
]

== Thread Safe Stack in C

#text(size: 9pt)[
```c
#include <pthread.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

#define STACK_CAPACITY 32

typedef struct {
    int data[STACK_CAPACITY];
    int top;
    pthread_mutex_t mutex;
} ThreadSafeStack;

void stack_init(ThreadSafeStack* s) {
    s->top = -1;
    pthread_mutex_init(&s->mutex, NULL);
}

void stack_destroy(ThreadSafeStack* s) {
    pthread_mutex_destroy(&s->mutex);
}

bool stack_push(ThreadSafeStack* s, int value) {
    pthread_mutex_lock(&s->mutex);
    if (s->top == STACK_CAPACITY - 1) {
        pthread_mutex_unlock(&s->mutex);
        return false; // Stack full
    }
    s->data[++s->top] = value;
    pthread_mutex_unlock(&s->mutex);
    return true;
}

bool stack_pop(ThreadSafeStack* s, int* value) {
    pthread_mutex_lock(&s->mutex);
    if (s->top == -1) {
        pthread_mutex_unlock(&s->mutex);
        return false; // Stack empty
    }
    *value = s->data[s->top--];
    pthread_mutex_unlock(&s->mutex);
    return true;
}
```
]

== Thread Safe Binary Search Tree in C

#text(size: 9pt)[
```c
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct BSTNode {
    int value;
    struct BSTNode *left, *right;
} BSTNode;

typedef struct {
    BSTNode* root;
    pthread_mutex_t mutex;
} ThreadSafeBST;

void bst_init(ThreadSafeBST* bst) {
    bst->root = NULL;
    pthread_mutex_init(&bst->mutex, NULL);
}

void bst_destroy_nodes(BSTNode* node) {
    if (!node) return;
    bst_destroy_nodes(node->left);
    bst_destroy_nodes(node->right);
    free(node);
}

void bst_destroy(ThreadSafeBST* bst) {
    pthread_mutex_lock(&bst->mutex);
    bst_destroy_nodes(bst->root);
    pthread_mutex_unlock(&bst->mutex);
    pthread_mutex_destroy(&bst->mutex);
}

void bst_insert(ThreadSafeBST* bst, int value) {
    pthread_mutex_lock(&bst->mutex);
    BSTNode **cur = &bst->root;
    while (*cur) {
        if (value < (*cur)->value) cur = &(*cur)->left;
        else if (value > (*cur)->value) cur = &(*cur)->right;
        else { pthread_mutex_unlock(&bst->mutex); return; }
    }
    *cur = malloc(sizeof(BSTNode));
    (*cur)->value = value;
    (*cur)->left = (*cur)->right = NULL;
    pthread_mutex_unlock(&bst->mutex);
}

bool bst_search(ThreadSafeBST* bst, int value) {
    pthread_mutex_lock(&bst->mutex);
    BSTNode* cur = bst->root;
    while (cur) {
        if (value == cur->value) { pthread_mutex_unlock(&bst->mutex); return true; }
        cur = (value < cur->value) ? cur->left : cur->right;
    }
    pthread_mutex_unlock(&bst->mutex);
    return false;
}
```
]

== Thread Safe Binary Search Tree in C++

#text(size: 9pt)[
```cpp
#include <memory>
#include <mutex>
#include <optional>

class ThreadSafeBST {
    struct Node {
        int value;
        std::unique_ptr<Node> left, right;
        Node(int v) : value(v) {}
    };
    std::unique_ptr<Node> root;
    mutable std::mutex m;
public:
    void insert(int value) {
        std::lock_guard<std::mutex> lock(m);
        Node** cur = &root.get();
        while (*cur) {
            if (value < (*cur)->value) cur = &(*cur)->left.get();
            else if (value > (*cur)->value) cur = &(*cur)->right.get();
            else return;
        }
        if (cur == &root.get()) root = std::make_unique<Node>(value);
        else *cur = new Node(value);
    }
    bool search(int value) const {
        std::lock_guard<std::mutex> lock(m);
        Node* cur = root.get();
        while (cur) {
            if (value == cur->value) return true;
            cur = (value < cur->value) ? cur->left.get() : cur->right.get();
        }
        return false;
    }
};
```
]



#pagebreak()

= Past Papers

== 2023/2024

1 a) The following variables are all pointers to the same data type: start, end, middle.
They point to different locations in an array whose elements are stored in contiguous memory locations.
`start` and `end` point to the first and last elements in an array, respectively. middle holds the address of
the element at the middle position in the array. Assume that the array has an odd number of elements.

i) Now consider the statement: `middle = (start + end) / 2;`
Explain why such pointer arithmetic statement is invalid in 10 words or fewer.

We cannot add pointers to each other.

ii) Write an alternative single statement of code that achieves the same objective of pointing to the
element in the middle of the array. You are not allowed to use `sizeof()`.
Also, explain why this would work, i.e. how the new code avoids the problem of the previous code.

`middle = (end - start) / 2 + start`

`end - start` returns returns a signed integer, we can then divide this by 2 to get the number of elements to the half way point, then add this to the pointer `start` as it is a number.

1 b) Consider the following declaration:

```c
struct node {
  char val;
  int min, max;
};

struct {
  struct node n;
  int count;
} v, *w = &v;

```

i) The following statement is invalid. Explain why.
`printf("%d", w->n->min);`

struct node in the second struct is not a pointer, so you cannot do n->min.

ii) Re-write the previous statement correctly.

`n.min`

iii)The following statement is also invalid. Explain why.
`w->max = 999;`

w is a pointer to v, but v does not have a member max.

iv) Re-write the previous statement correctly.

`w.n->max = 999;`

1 c) The following code segment has a bug.

```c
int* initaliseInteger(int val) {
  int x = val;
  int* ptr = &x;
  return ptr;
}
```

i) Name the memory management issue and describe why it occurs (in 30 words or fewer).

Dangling pointer. We create a pointer to a local variable `x`, so the local variable gets freed when the program is out of the function scope, so the returned pointer points to invalid memory.

ii) Will this bug be discovered at compile time (without any special compile flags) or at run time?
Explain why (in 30 words or fewer).

This will be discovered at run time when the program tries to dereference the returned pointer, this will result in undefined behaviour.

2 a) Using the following allocation: `foo *p = malloc(sizeof(foo))`; , In terms of memory spaces: Where is p stored? Where is the value it points to stored? 1-2 words per question would be sufficient.

p is stored on the stack, p points to a value stored on the heap.

b) Declare a function called str_seek that takes as arguments a string pointer and an integer. It returns a string pointer. There is no need to define the logic of the function.

```c
char * str_seek (char* str, int num) {...}
```

c) The following code segment attempts to implement a dynamic array using malloc(). A dynamic array is one that can be resized as needed during runtime. Although the code compiles without any errors, it does not achieve what is intended.

```c
#include <stdlib.h>

int* allocateArray(int arr[], int len) {
  if (arr) {
    free(arr);
    arr = NULL;
  }
  arr = (int *)malloc(len * sizeof(int));
  return arr;
}

int main() {
  int size = 8;
  int *array = allocateArray(NULL, size);

  // store some values in the array
  for (int i = 0; i < size; i++) {
    array[i] = i*i;
  }

  // attempt to change the array size
  size = 10;
  array = allocateArray(array, size);

  free(array);
  array = NULL;
}
```

i) If executed, this code will exhibit undefined behaviour. Identify the cause of this, the line number that is responsible, and explain why it happens (in 20 words or fewer).

Dangling pointer, line 18, accessing invalid memory.

ii) If the above runtime error is fixed, would the array keep the values stored in it before resizing (see lines 16-19)? Explain (in 30 words or fewer).

No it would not, because malloc allocates new space on the heap, it will create an empty array if integers.

iii) Again, ignoring the runtime error discussed in (i), suggest how you would modify the code in order to keep the original values stored in the array even after resizing. Please write code and indicate using line numbers where it would be placed and/or if it would replace any existing lines.

From line 8, replace with the following:
```c
int *array = (int *)malloc(len * sizeof(int));
int length = sizeof(arr) / sizeof(int);
for (int i = 0; i < length, i++) {
  array[i] = arr[i];
}
return array;
```

3 a) Writing concurrent code entails specifying both computation and coordination

i) Briefly define computation and concurrent coordination.

computation is what the program computes.
concurrent coordination is how threads cooperate

ii) Identify three aspects of coordination, and for each aspect state how it is controlled in either C with PThreads, or C++ with threads.

Partitioning: this is controlled by pthread_create where you separate functions into different threads.

Data Sharing: this is managed by shared variables or shared memory regions.

Synchronisation: this is controlled by locks that only allow one thread in a critical section. And condition variables.

3 b) Consider the following C with PThreads function awaitEvent() that is executed by a thread. It uses the
following shared variables to wait until some desirable event has occurred.
```c
bool teaIsReady = false \\ Indicates an event has occurred:
                        \\ tea is available
pthread_mutex_t m       \\ A lock or mutex that protects teaIsReady
```
For ease of reference the code has been annotated with line numbers.
```c
1 void *awaitEvent(void* arg) {
2   (void)arg;
3   printf("Me: Waiting for my tea ...\n");

4   pthread_mutex_lock(&m);
5   while (!teaIsReady) {
6     pthread_mutex_unlock(&m);
7     printf("Me: (Unamused) // do nothing\n");
8     pthread_mutex_lock(&m);}
9   pthread_mutex_unlock(&m);

10  printf("Me: (Happy) ... finished waiting.\n");
11  return NULL;
}
```

i) State the number of lines that specify coordination, and give the line numbers of that code.

4 lines of code:
4, 6, 8, 9

ii) State the number of lines that specify computation, and give the line numbers of that code.

1 line:
7

iii) The teaIsReady variable is shared by multiple threads. Briefly explain how shared variables are used to communicate between threads.

Shared variables can be used to signal that a thread needs to wait.
They can also be used to tell a thread to proceed with some task.

iv) The mutex m is also shared by multiple threads. Briefly explain how it is used to synchronise interaction between the threads.

It ensure that two threads do not access a critical section at the same time, this ensure no race conditions and less random results.

3 c) Concurrent programming is considered more difficult than sequential programming. Give the correct technical name for 6 challenges facing developers of concurrent code that are not encountered by developers of sequential code. Briefly describe, and give an example of, each of the 6 challenges.

- Deadlock: a thread holds a lock and waits for another lock that is held by another thread. Two threads waiting on each other.
- Livelock: a thread repeatedly attempts to acquire a lock that is always help by another thread.
- Starvation: a thread is perpetually denied access to a resource.
- Busy waiting: while a thread waits for a resource it continues to use CPU power.
- Race conditions: when the result of a program execution depends on the order in which threads are executed.
- Memory consistency: one threads writes are not seen by another thread.

d) PThreads provide low-level coordination in the form of locks & condition variables. Name some higher-level coordination construct, and briefly outline how to implement that construct using locks & condition variables.

Synchronisation ensure threads can cooperate without interference. We can implement this by protecting a critical section in the following way: first, acquire the lock, then enter a while(condition) loop, inside that call pthread_cond_wait to wait on a condition variable to indicate you can proceed.

== 2022/2023

1 a)

i) int

ii)

double, floats only support up to 7 decimal places.

```c
double pi = 3.14159
```

1 b) How many bytes of memory does the string literal "Systems" require in a C program? Show your working.

8 bytes, all characters in the string plus the null terminator byte.

1 c) Consider the following struct definition use.

```c
struct actor {
    char* name;
    int age;
    char* famous_for;
}

struct actor guy = {"Guy Pearce", 55, "Memento"};
struct actor brad = {"Brad Pitt", 58, "Seven"};
```

How many bytes of memory in total will the data stored in each of the guy and brad variables occupy?
Explain how you calculated your answers.

guy: 24 bytes
brad: 24 bytes

8 + 4 + 8 = 20 bytes, plus padding to make it 24 bytes.

1 d) The following program takes two command-line arguments: a character and a filename, respectively. The program should print all the lines in the given file that contain the given character at least once.

```c
#include <stdio.h>
#include <stdlib.h>
#define BUF 256

int main(int argc, char *argv[]) {
    FILE *fp;
    char ch;
    char line[BUF];

    if (argc != 3) {
        printf("Usage: %s character filename\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    ch = argv[1][0];
    if ((fp = fopen(argv[2], "r")) == NULL) {
        printf("Error: Cannot open %s\n", argv[2]);
        exit(EXIT_FAILURE);
    }
    while (fgets(line, BUF, fp) != NULL) {
        if (has_ch(ch, line)) {
            fputs(line, stdout);
        }
    }
    fclose(fp);
    return 0;
}
```

```c
int has_ch(char ch, char line[BUF]) {
    for (int i = 0; line[i] != '\0'; i++) {
        if (ch == line[i]) {
            return 1;
        }
    }
    return 0;
}
```

2 a) Consider the following allocation: `foo * x = malloc(sizeof(foo));`
Where is x stored?
Where is the value it points to stored?

x is stored on the stack,
the value x points to is on the heap.

2 b) Consider the following declaration:
`int matrix[40][20];`
Express the address of the first element in the 20th row in two different ways.

&matrix[19][0]
&matrix[0][0] + 380

2 c) Declare a function called sub_str that returns a pointer to a string, and takes as arguments a string and an
integer. There is no need to define the logic of the function.

```c
char* sub_str(char* str, int i) {...}
```

2 d) Consider the following code that traverses a block of memory pointed to by buf.
```c
int traverse(char buf[], int n){
    int ok = 1;
    int i;
    for (i = 0; i<=n-1; i++) {
        if (buf[i]!=buf[n-1-i])
            ok = 0;
        }
    return ok;
}
```
Explain in your own words the aim of this code.

Explain how this aim is achieved.

Give one example of an input buf that would mean the function returns the value 1.

This function checks if the given buf is a palindrome.

It uses a sort of two pointer approach where we start from 0, n-1, then move up the first value and move back the last value. This will then check if every value is equal to is respective "mirrored" value.

buf = "a"

2 e) The program fragments below contain some error(s). For each fragment, name the type of error(s) and give a brief technical explanation of how it arises.

i)
```c
node * some_node = create_node(...);
node * other_node = create_node(..., some_node, ...);
free(some_node);
```

This will leave you with a dangling pointer to some_node inside other_node
We have a use-after-free error.

ii)
```c
int s = 3;
void *p = malloc(sizeof(int)*s);
void *q = p;
free(p);
free(q);
```

This results in a double free error, which causes undefined behaviour, usually a program crash or memory corruption.

3
```c
1. pthread_mutex_t m;
2. bool delivered = false;
3. void *homeOwner(void* arg)
4.      {
5.      printf("HomeOwner: Awaiting delivery ...\n");
6.      pthread_mutex_lock(&m);
7.      while (!delivered) {
8.          pthread_mutex_unlock(&m);
9.          printf("HomeOwner: Still waiting\n");
10.         pthread_mutex_lock(&m);
11.     }
12.     pthread_mutex_unlock(&m);
13.     printf("HomeOwner: Enjoying my new item.\n");
14.     return NULL;
15.     }
16. void *deliveryDriver(void* arg)
17. {
18.     printf("Delivery Driver: out making deliveries ...\n");
19.     usleep(randomSleepTime());
20.     printf("Delivery Driver: arrived at address\n");
21.     pthread_mutex_lock(&m);
22.     delivered = true;
23.     pthread_mutex_unlock(&m);
24.     printf("Delivery Driver: package delivered\n");
25.     return NULL;
26. }
27. int main()
28. {
29.     /* Perform some initialisation */
30.     pthread_t t1;
31.     pthread_t t2;
32.     pthread_mutex_init(&m, NULL);
33.     pthread_create(&t1, NULL, homeOwner, NULL);
34.     pthread_create(&t2, NULL, deliveryDriver, NULL);
35.     pthread_join(t1, NULL);
36.     pthread_join(t2, NULL);
37.     pthread_mutex_destroy(&m);
38. }
```

a) Is the program parallel or concurrent, as defined in the course?

This is concurrent

b) Identify the state shared by the two threads.

The `delivered` variable.

c) Use the program line numbers to identify any critical section(s) in the program fragment.

lines 7, 22.

d) Is the program fragment thread safe? If not, carefully explain how an inconsistent state may arise. If so, carefully explain how this is achieved.

This is thread safe, because in homeOwner, we release the lock after checking the condition, this allows the deliveryDriver function to acquire the lock and set delivered to true then releasing the lock, allowing the homeOwner thread acquire the lock and recheck the while condition, and progress.

e)
i) Briefly outline any other concurrency issues you identify with the program fragment.

The homeOwner function uses busy waiting — repeatedly locking and unlocking the mutex to check if the delivery has occurred. This wastes CPU cycles because the thread is actively polling instead of sleeping when the condition is false.

ii) Explain the implications of the concurrency issue(s) you identify.

Busy waiting leads to inefficient CPU usage. The thread continuously acquires and releases the mutex and uses CPU time even though it can't make progress until the delivery is complete. On systems with many threads or limited CPU cores, this reduces overall performance and responsiveness.

iii) Explain how the program can be adapted to avoid the concurrency issue(s) you have identified, and explain how this addresses the implications you have identified.

The program can be adapted using condition variables (pthread_cond_t). Instead of repeatedly polling, the homeOwner thread can wait on the condition variable when delivered is false. When the deliveryDriver thread sets delivered = true, it then signals the condition variable to wake the waiting thread. This avoids wasting CPU time and allows the homeOwner to sleep until notified.

iv) Adapt the program fragment to avoid the concurrency issue(s) you have identified. Write out the complete program fragment, and provide comments explaining the purpose of each line you add.

#text(size: 9pt)[
```c
#include <stdio.h>
#include <stdbool.h>
#include <pthread.h>
#include <unistd.h>

// Shared resources
pthread_mutex_t m;
pthread_cond_t deliveredCond;
bool delivered = false;

// Simulates a random delivery delay
int randomSleepTime() {
    return 500000 + rand() % 1000000; // 0.5 to 1.5 seconds
}

void *homeOwner(void* arg) {
    printf("HomeOwner: Awaiting delivery ...\n");

    pthread_mutex_lock(&m);
    while (!delivered) {
        // Wait on the condition variable — this releases the mutex and sleeps
        pthread_cond_wait(&deliveredCond, &m);
    }
    pthread_mutex_unlock(&m);

    printf("HomeOwner: Enjoying my new item.\n");
    return NULL;
}

void *deliveryDriver(void* arg) {
    printf("Delivery Driver: out making deliveries ...\n");
    usleep(randomSleepTime()); // Simulate delivery delay
    printf("Delivery Driver: arrived at address\n");

    pthread_mutex_lock(&m);
    delivered = true;
    // Notify the waiting thread that delivery is complete
    pthread_cond_signal(&deliveredCond);
    pthread_mutex_unlock(&m);

    printf("Delivery Driver: package delivered\n");
    return NULL;
}

int main() {
    pthread_t t1, t2;

    // Initialize mutex and condition variable
    pthread_mutex_init(&m, NULL);
    pthread_cond_init(&deliveredCond, NULL);

    // Create threads
    pthread_create(&t1, NULL, homeOwner, NULL);
    pthread_create(&t2, NULL, deliveryDriver, NULL);

    // Wait for threads to finish
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    // Clean up
    pthread_mutex_destroy(&m);
    pthread_cond_destroy(&deliveredCond);

    return 0;
}
```
]

#pagebreak()

== 2020/2021

```c
auto size = 1 * 1024 * 1024;
auto vec = std::vector<int>(size);

int sumChunk(int lower, int upper) {
  int sum = 0;
  for (int i = lower; i < upper; i++)
    sum += vec[i];
  return sum;
}

int main2() {
  std::vector<std::thread> threads;
  for (int i = 0; i < 9; i++) {
    threads.emplace_back(sumChunk, i * size / 10, (i + 1) * size / 10);
  }

  int sum = sumChunk(9 * size / 10, size);
  for (auto &thread : threads) {
    thread.join();
  }
  return sum;
}

int main() {
  std::generate(vec.begin(), vec.end(), randInt);
  std::thread thread(sumChunk, 0, size / 2);
  int sum = sumChunk(size / 2, size);
  thread.join();
  return sum;
}
```