const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "volatile" {
    const mmio_ptr = @intToPtr(*volatile u8, 0x12345678);
    print("\nconst mmio_ptr = @intToPtr(*volatile u8, 0x12345678);\n", .{});
    print("@TypeOf(mmio_ptr):{}\n", .{@TypeOf(mmio_ptr)});
    try expect(@TypeOf(mmio_ptr) == *volatile u8);
}