const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "labeled break from labeled block expression" {
    var y: i32 = 123;

    const x = blk: {
        y += 1;
        break :blk y;
    };
    try expect(x == 124);
    try expect(y == 124);
    print("x:{}\n", .{x});
}