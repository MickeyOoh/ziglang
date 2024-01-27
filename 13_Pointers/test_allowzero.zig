const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "allowzero" {
    var zero: usize = 0;
    var ptr: *allowzero i32 = @ptrFromInt(zero);
    try expect(@intFromPtr(ptr) == 0);
    print("\nvar zero: usize = 0;\nvar ptr: *allowzero i32 = @intFromPtr(zero);\n", .{});
    print("@ptrToInt(ptr) : {}\n", .{@intFromPtr(ptr)});
}
