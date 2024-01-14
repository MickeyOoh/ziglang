var y: i32 = add(10, x);
const x: i32 = add(12, 34);

test "container level variable" {
    print("\nx {}: {}\n", .{@typeInfo(x), x});
    print("y {}: {}\n", .{@TypeOf(y), y});

    try expect(x == 46);
    try expect(y == 56);
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;