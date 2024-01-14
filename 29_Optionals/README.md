Optionals
----
One area that Zig provides safety without compromising efficiency or radability is with the optional type.

The question mark symbolizes the optional type. You can convert a type to an optional type by putting a question mark in front of it, like this:
```test.zig
// normal integer
const normal_int: i32 = 1234;

// optional integer
const optional_int: ?i32 = 5678;
```
* Now the variable `optional_int` could be an `i32`, or `null`.


Optional Type
----
An optional is created by putting `?` in front of a type. You can use compile-time reflection to access the child type of an optional:

```

var foo: ?i32 = null;
```
null
just like `undefined`, `null` has its own type, and the only way to use it is to cast it to a different type:
```const optional_value: ?i32 = null;```

Optional Pointers
----
An optional pointer is guaranteed to be the same size as a pointer. The `null` of the optional is guaranteed to be address 0.

Casting
----
A type cast converts a value of one type to another. Zig has Type Coercion for conversions that are known to be completely safe and unambiguous, and Explicit Casts for conversions that one would not want to happen on accident.
There si also a third kind of type conversion called Peer Type Resolution for the case when a result type must be decided given multiple operand types.


Type Coercion: Stricter Qualification
----
Values which have the same representation at runtime can be cast to increase the strictness of the qualifiers, no matter how nested the qualifiers are:
* `const` - non-const to const is allowed
* `volatile` - non-volatile to volatile is allowed
* `align`  - bigger to smaller alignment is allowed
* `error sets to supersets is allowed
These casts are no-ops at runtime since the value representation does not change.

```
test "type coercion - const qualification" {
    var a: i32 = 1;
    var b: *i32 = &a;
    foo(b);
}

fn foo(_: *const i32) void {}
```
