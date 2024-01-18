1. Introduction
-----

General Purpose programming
- Robust  Behavior is correct even for edge cases such as out of memory
- Optonal Write programs the best way they can behave and perform
- Reusable The same code works in many environments which have different constraints.
- Maintainable 
  Precisely communicate intent to the compiler and other programmers. language imposes a low overhead to rading code and is resilient to changing requirements and environments.


2. Zig Standard Library
---


4. Documents
----


4.1. Doc Comments
----

```
/// A structure for storing a timestamp, with nanosecond precision (this is a
/// multiline doc comment).
const Timestamp = struct {
    /// The number of seconds since the epoch (this is also a doc comment).
    seconds: i64, // signed so we can represent pre-1970 (not a doc comment)
    /// The number of nanoseconds past the second (doc comment again).
    nonos: u32,

    /// Returns a `Timestamp` struct representing the Unix epoch; that is, the
    /// moment of 1970 Jan 1 00:00:09 UTC (this is a doc comment too).
    pub fn unixEpoch() Timestamp {
        return Timestamp{
            .seconds = 0,
            .nanos = 0,
        };
    }
};
```

4.2. Top-Level Doc Comments
----


5. Values
----

5.1. Primitive Types
----


5.2. Primitive Values
----


5.3. String Literals and Unicode Code point Literals
----


6. Zig Test
----


6.1. Test Desclarations
----

Test declarations contain the keyword `test`, followed by an optional name written as a string litreal or identifier, followed by a block containing any valid Zig code that is allowed in a function.
> By convertion, non-named tests should only be used to make other tests run. Non-named tests cannot be filtered.

6.2. Nested Container Tests
----

6.3. Test Failure
----

6.4. Skip Tests
----

6.5. Report Memory Leaks
---

6.6. Detecting Test Build
---

6.7. Test Output and Logging
----


7. Variables
---

A variable is a unit of Memory storage.
It is generally preferable to use `const` rather than `var` when declaring a variable.


7.1. Identifiers
---
Variable identifiers are never allowed to shadow identifiers from an outer scope.

Identifiers must start with an alphabetic character or underscore and my be followed by any number of alphanumeric characters or underscores.

If a name is needed, such as for linking with exteranl libraries, the `@""` syntax may be used.

```
const @"identifier with spaces in it" = 0xff;
const @"1MsallStep4Man" = 112358;

const c = @import("std").c;
pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.stat) c_int;

const Color = enum {
	red,
	@"realy red",
};
const color: Color = .@"realy red";
```

7.2. Container Level Vairables
---
Container level variables have static lifetime and are order-independent and lazily analyzed.
The initialization value of container level variables is implicitly comptime. If a container level variable is `const` then its value is `comptime` -known, otherwise it is runtime-known.

```test_container_level_variables.zig

```

Container level variables may be declared inside a `struct`, `union`, `enum`, or `opaque`:
```test_namespaced_container_level_variable.zig

```

7.3. Static Local Variables
----
It is also possible to have local variables with static lifetime by using containers inside functions.

```test_static_local_varaiable.zig

```

The `extern` keyword or `@extern` builtin function can be used to link against a variable that is exported from another object.
The `export` keyword or `@export` builtin function can be used to make a variable available to other objects at link time. In both cases, the type of the variable must be C ABI compatible.


7.4. Thread Local variables
---
A variable may be specified to be a thread-local variable using the `threadlocal` keyword, which makes each thread workwith a separate instance of the variable:
```test_thread_local_variables.zig

```

7.5. Local Variables
----


8. Integers
----

8.1. Integet Literals
----

```
const decimal_int = 98222;
const hex_int = 0xff;
const another_hex_int = 0xff;
const octal_int = 0o755;
const binary_int = 0b11110000;

const one_billion = 1_000_000_000;
const binary_mask = 0b1_1111_1111;
const permissions = 0o7_5_5;
const big_address = 0xff80_0000_0000_0000;
```

8.2. Runtime integer Values
---
Ineger literals have no size limitation, and if any undefined behavior occurs, the compiler catches it.

```runtime_vs_comptime.zig
fn divide(a: i32, b: i32) i32 {
	return a / b;
}
```

9. Floats
----

Zig has the following floating point types:
* f16
* f32
* f64
* f80
* f128
* c_longdouble - matches `long double` for the target C ABI

9.1. Float Literals
---

```float_special_values.zig
const std = @import("std");
const print = std.debug.print;

const inf = std.math.inf(f32);
const negative_inf = -std.math.inf(f64);
const nan = std.math.nan(f128);

test "infinitive number test" {
    print("std.math.inf(f32):{}\n", .{inf});
    print("std.math.inf(f64):{}\n", .{negative_inf});
    print("std.math.nan(f128):{}\n", .{nan});
}
```

9.2. Floating Point Operations
---

10. Operators
---

There is no operator overloading. 

10.1. Table of Operators
---

```
a + b
a += b
--> 2 + 5 = 7
// Wrapping addition-- Guaranteed to have twos-complement wrapping behavior.
a +% b
a +%= b
--> @as(u32, std.math.maxInt(u32) +% 1 = 0
```

11. Arrays
----

```test_arrays.zig

```

11.1 Multidimensional Arrays
----

```test_multidimensional_arrays.zig


```

11.2. Sentinel Terminated Arrays
----

The syntax [N:x]T describes an array which has a sentinel element of value x at the index corresponding to `len`.


12. Vectors
----

A vector is a group of booleans, `Integers`, `Floats`, or `Pointers` which are operated on in parallel using SIMD instructions. Vector types are created with the builtin with the builtin function `@Type`, or using the shorthand function `std.meta.Vector`.

* Arithmetic (`+`,`-`,`/`,`*`,`@divFloor`,`@sqrt`, `@ceil`, `@log`, etc.)
* Bitwise operators(`>>`,`<<`,`&`,`|`, `~`, etc.)
* Comparison operators(`<`,`>`,`==`, etc.)


