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

A vector is a group of booleans, `Integers`, `Floats`, or `Pointers` which are operated on in parallel, using SIMD instructions if possible. Vector types are created with the builtin function `@Vector`.

These operations are performed element-wise, and return a vector of the same length as the input vectors. This includes:
* Arithmetic (`+`,`-`,`/`,`*`,`@divFloor`,`@sqrt`, `@ceil`, `@log`, etc.)
* Bitwise operators(`>>`,`<<`,`&`,`|`, `~`, etc.)
* Comparison operators(`<`,`>`,`==`, etc.)

It is prohibited to use a math operator on a mixture of scalars (invidual numbers) and vectors. Zig provides the `@splat` builtin to easily convert from scalars to vectors, and it supports `@reduce` and array indexing syntax to convert from vectors to scalars.

13. Pointers
----
Zig has two kinds of pointers: single-item and many-item.
* `*T` - single-item pointer 
		Supports deref syntax: `ptr.*`
* `[*]T` - many-item pointer
		index syntax: `ptr[i]`
		slice syntax: `ptr[start..end]`
		pointer arithmetic: `ptr + x, ptr - x`
		`T` must have a known size, which means that it cannot be `anyopaque` or any other `opaque type`.

These types are closely related to `Arrays` and `Slices`:

13.1. volatile
----

13.2. Alignment
----
Each type has an alignment - a number of bytes such that, when a value of the type is loaded from or stored to memory,
the memory address must be evenly divisible by this number. You can use `@alignOf` to find out this value for any type.
Alignment depends on the CPU architecture, but is always a power of two, and less than


13.3. allowzero
----


13.4. Sentinel Terminal Pointers
----


14. Slices
---

14.1. Sentinel-Terminated Slices
-----
The syntax `[:x]T` is a slice which has a runtime-known length and also guarantees a sentinel value at the element indexed by the length. The type does not guarantee that there are no sentinel elements before that.
Sentinel-terminated slices allow element access to the `len` index.

```test_null_terminated_slice.zig

```

15. struct
----

```test_structs.zig

```

15.1. Default Field Values
----
Each struct field may have an expression indicating the default field value. Such expressions are executed at comptime, and allow the field to be omitted in a struct literal expression:

```test_struct_default_values.zig


```

15.2.  extern struct
----
An `extern struct` has in-memory layout guaranteed to match the C ABI for the target.
This kind of struct should only be used for compatiblilty with the C ABI. Every other use case should be solved with `packed struct` or normal `struct`.

15.3. packed struct
-----
`packed` structs have guaranteed in-memory layout:
* Field remain in the order declared.
* There is no padding between fields.
* Zig supports arbitrary width `integers` and although normally, integers with fewer than 8 bits will still use 1 byte of memory, in packed structs, they use exactly their bit width.
* `bool` fields use exactly 1 bit.
* An `enum` field uses exactly the bit width of its integer tag type.
* A `packed union` field uses exactly the bit width of the union field with the largest bit width.
* Non-ABI-aligned fields are packed into the smallest possible ABI-aligned integers in accordance with the target endianness.


```test_packed_structs.zig


```


15.4. struct Naming
-----
Since all structs are anonymous, Zig infers the type name based on a few rules.
* If the struct is in the initialization expression of a variable, it gets named after that variable.

15.5. Anonymous Struct Literals
----

15.6. Tuples
----

16. Enum
----

16.1. extern enum
----


16.2. Enum LIterals
----

16.3. Non-Exhaustive enum
----

17. union
----


17.1. Tagged union
----

17.2. extern union
---

17.3. packed union
----

17.4. Anonymous Union Literals
----

18. opaque
----
`opaque{}` declares a new type with an unknown (but non-zero) size and alignment. It can contain declarations the same as `struct`, `unions`, and `enums`.

This is thypically used for type safety when interacting with C code that does not expose struct details.
Example:
```
const Derp = opaque {};
const Wat = opaque {};

extern fn bar(d: *Derp) void;
fn foo(w: *Wat) callconv(.C) void {
    bar(w);
}

test "call foo" {
    foo(undefined);
}

$ zig test test_opaque.zig                                                                      ✘ 1
test_opaque.zig:6:9: error: expected type '*test_opaque.Derp', found '*test_opaque.Wat'
    bar(w);
        ^
test_opaque.zig:6:9: note: pointer type child 'test_opaque.Wat' cannot cast into pointer type child 'test_opaque.Derp'
test_opaque.zig:2:13: note: opaque declared here
const Wat = opaque {};
            ^~~~~~~~~
test_opaque.zig:1:14: note: opaque declared here
const Derp = opaque {};
             ^~~~~~~~~
test_opaque.zig:4:18: note: parameter type declared here
extern fn bar(d: *Derp) void;
                  ^~~~~
referenced by:
    test.call foo: test_opaque.zig:10:5
    remaining reference traces hidden; use '-freference-trace' to see all reference traces
```


19. Blocks
-----

Blocks are expressions. When labled, `break` can be used to return a value from the block:
```tset_labeled_break.zig
const std = @import("std");
const expect = std.testing.expect;

test "labeled break from labeled block expression" {
    var y: i32 = 123;

    const x = blk: {
        y += 1;
        break :blk y;
    };
    try expect(x == 124);
    try expect(y == 124);
}
```

19.1. Shadowing
----
Identifiers are never allowed to "hide" other idnetifiers by using the same name:
```test_shadowing.zig
const pi = 3.14;

test "inside test block" {
	// Let's even go inside another block
	{
		var pi: i32 = 1234;
	}
}
```
error: local variable shadows declaration of 
		var pi: i32 = 1234;

When you read Zig code you can always rely on an identifier to consistently mean the same thing within the scope it is defined. Note that you can use the same name if the scopes are separate:
```test_scopes.zig
test "separate scapes" {
    {
        const pi = 3.14;
        _ = pi;
    }
    {
        var pi: bool = true;
        _ = pi;
    }
}
```

19.2. Empty Blocks
----
An empty block is equivalent to `void()`:
```tset_empty_block.zig
const std = @import("std");
const expect = std.testing.expect;

test {
    const a = {};
    const b = void{};
    try expect(@TypeOf(a) == void);
    try expect(@TypeOf(b) == void);
    try expect(a == b);
}
```

20. switch
----

`switch` can be used to capture the field values of a Tagged union. Modifications to the field values can be done by placing a * before the capture variable name, turning it into a pointer.

```test_switch_tagged_union.zig

```

20.1. Exhaustive Switching
----
When a `switch` expression does not have an `else` clause, it must exhaustively list all the possible values.
Failure to do so is a compile error.

```test_unhandled_enumeration_value.zig

```

20.2. Switching with Enum Literals
----

20.3. Inline switch
---

Switch prongs can be marked as `inline` to generate the prong's body for each possible value it could have:
```test_inline_switch.zig

```

21. while
----
A while loop is used to repeatedly execute an expression until some condition is no longer true.

```test_while.zig

```


