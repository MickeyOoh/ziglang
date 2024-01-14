Comptime
----


Introducing the Compile-Time Concept
----

#### Compile-Time Parameters
Compile-time parameters is how Zig implements generics. it is compile-time duck typing.
```test.zig
fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}
fn gimmeTheBiggerFloat(a: f32, b: f32) f32 {
    return max(f32, a, b);
}
fn gimmeTheBiggerInteger(a: u64, b: u64) u64 {
    return max(u64, a, b);
}
```
In Zig, types are first-class citizens. They can be assigned to variables, passed as parameters to functions, and returned from functions. However, they can only be used in expressions which are known at `compile-time`, which is why the parameter `T` in the above snippet must be marked with `comptime`.

A `comptime` parameters means that:
* At the callsite, the value must be known at compile-time, or it is a compile error.
* In the function definition, the value is known at compile-time.


[Compile-Time Variables]()
In Zig, the programmer can label variables as `comptime`. This guarantees to the compile that every load and store of the variable is performed at compile-time. Any violation of this results in a compile error.

[comptime_vars.zig](comptime_vars.zig)


Compile-Time Expressions
-----
In Zig, it matters whether a given expression is known at compile-time or run-time. A programmer can use a `comptime` expression to guarantee that expression will be evaluated at compile-time.


Within a `comptime` expression:
* All variables are `comptime` variables.
* All `if`, `while`, `for`, and `switch` expressions are evaluated at compile-time, emit a compile error if thisis not possible.
* All function calls cause the compiler to interpret the function at compile-time, emitting a compile error if the function tries to do something that has global run-time side effects.

[fiboancci_recursion.zig](fibonacci_recursion.zig)

Generic Data Structures
----
