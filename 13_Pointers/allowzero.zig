const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "allowzero" {
    var zero: usize = 0;
    var ptr = @intToPtr(*allowzero i32, zero);
    try expect(@ptrToInt(ptr) == 0);
    print("\nvar zero: usize = 0;\nvar ptr = @intToPtr(*allowzero i32, zero);\n", .{});
    print("@ptrToInt(ptr) : {}\n", .{@ptrToInt(ptr)});
}