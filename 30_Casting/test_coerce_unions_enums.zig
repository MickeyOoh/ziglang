const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const E = enum {
    one,
    two,
    three,
};

const U = union(E) {
    one: i32,
    two: f32,
    three,
};

test "coercion between unions and enums" {
    var u = U{ .two = 12.34 };
    var e: E = u;
    try expect(e == E.two);
    print("\nu:{}, e:{}\n", .{u, e});

    const three = E.three;
    var another_u: U = three;
    try expect(another_u == E.three);
    print("three:{}, another_u:{}\n", .{three, another_u});
}