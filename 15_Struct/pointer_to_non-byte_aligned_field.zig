const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const BitField = packed struct {
    a: u3,
    b: u3,
    c: u2,
};

var foo = BitField{
    .a = 1,
    .b = 2,
    .c = 3,
};

test "pointer to non-byte-aligned field" {
    const ptr = &foo.b;
    try expect(ptr.* == 2);
    print("\nfoo:{}\n", .{foo});
    print("const ptr = &foo.b\n", .{});
    print("ptr.* -> {}\n", .{ptr.*});
    print("foo.a:{}, foo.c:{}\n", .{foo.a, foo.c});
}