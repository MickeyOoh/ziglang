const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "coercion to error unions" {
    const x: anyerror!i32 = 1234;
    const y: anyerror!i32 = error.Failure;

    try expect((try x) == 1234);
    try std.testing.expectError(error.Failure, y);
    print("\nx:{}\n", .{x});
    print("y:{}\n", .{y});
}