Zero Bit Types
-----

For some types, `@sizeOf` is 0:
* `void`
* The `Integers` u0 and i0
* `Arrays` and `Vectors` with len 0, or with an element type that is a zero bit type
* An `enum` with only 1 tag
* A `union` with only 1 field which is a zero bit bype
* `Pointer to Zero Bit Types` are themselves zero bit types

These types can only ever have one possible value, and thus require 0 bits to represent. Code that makes use of these types is not inlcuded in the final generated code:

```test.zig
export fn entry() void {
    var x: void = {};
    var y: void = {};
    x = y;
}
```

void
----
`void` can be useful for instantiating generic types. For example, given a `Map(key, Value)`, one can pass `void` for the `Value` type to make it into a `Set`:

```void_in_hashmap.zig
    var map = std.AutoHashMap(i32, void).init(std.testing.allocator);
    defer map.deinit();

    try map.put(1, {});
    try map.put(2, {});

    try expect(map.contains(2));
    try expect(!map.contains(3));
    _ = map.remove(2);
    try expect(!map.contains(2));
```

Note that this is different from a dummy value for the hash map value. By using `void` as the type of the value, the hash map entry type has no value field, and thus the hash map takes up less space. Further, all the code that deals with storing and loading the value is deleted, as seen above.

`void` is distinct from `anyopaque`. `void` has a known size of 0 bytes, and `anyopaque` has an unknown, but non-zero, size.

Expressions of type `void` are the only ones whoes value can be ignored. For example:

```test.zig
test "ignoring expression value" {
    foo();
}

fn foo() i32 {
    return 1234;
}
```

```Shell
$ zig test test.zig
./test.zig:2:8: error: expression value is ignored
    foo();
       ^
```

Pointers to Zero Bit Types 
----

Pointers to zero bit types also have zero bits. They always compare equal to each other:

[pointers_to_zero_bits.zig](pointers_to_zero_bits.zig)

