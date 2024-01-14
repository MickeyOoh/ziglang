[Casting](https://ziglang.org/documentation/master/#Casting)
----

Type Coercion: Coercion Float to Int
----
A compiler error is approrpiate because this ambiguous expression leaves the compiler two choices about the coercion.

* Cast `54.0` to `comptime_int` resulting in `@as(comptime_int, 10)`, which is casted to `@as(f32, 10)`
* Cast `5` to `comptime_float` resulting in `@as(comptime_float, 10.8)`, which is casted to `@as(f32, 10.8)`.
  

Type Coercion: Slices, Arrays and Pointers
----

[coerce_slices_arrays_and_ptrs.zig](coerce_slices_arrays_and_ptrs.zig)


Type Coercion: Optionals
-----
The payload type of `Optionals`, as well as `null` coerce to the optional type.
```
const x: ?i32 = 1234;
const y: ?i32 = null;

try expect(x.? == 1234);
try expext(y == null);
```

It works nested inside the `Error Union Type`, too:
```
const x: anyerror!?i32 = 1234;
const y: anyerror!?i32 = null;

try expect((try x).? == 1234);
try expect((try y) == null);
```

Type Coercion: Error Unions
------
The payload type of an `Error Union Types` as well as the `Error Set Type` coerce to the error union type:


Type Coercion: Compile-Time Known Numbers
----
When a number is `comptime`-known to be representable in the destination type, it may be coerced:
```test_coerce_large_to_small.zig
    const x: u64 = 255;
    const y: u8  = x;
    try expect(y == 255);
```

Type Coercion: unions and enums
-----
Tagged unions can be coerced to enums, and enums can be coerced to tagged unions when they are `comptime`-known to be a field of the union that has only one possible valu, such as `void`:
```test_coerce_unions_enums.zig

```

Type Coercion: Zero Bit Types
-----

```coerce_zero_bit_types.zig
var x: void  = {};
var y: *void = x;
_ = y;
```

Explicit Casts
----
Explicit casts are performed via `Builtin Function`. Some explicit casts are safe; some are not. Some explicit casts perform language-level assertion; some do not. Some explicit casts are no-ops at runtime; some are not.

* @bitCast - change type but maintain bit representation
* 





Peer Type Resolution 
----
Peer Type Resolution occurs in these place.

* `switch` expression
* `if` expression
* `while`
* `for`
* Multiple break statements in a block
* Some `binary operations`

