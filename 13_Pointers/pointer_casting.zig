const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "pointer casting" {
    const bytes align(@alignOf(u32)) = [_]u8{ 0x12, 0x12, 0x12, 0x12 };
    const u32_ptr = @ptrCast(*const u32, &bytes);
    try expect(u32_ptr.* == 0x12121212);
    print("bytes({}):{d}\n", .{@TypeOf(bytes), bytes});
    print("const u32_ptr = @ptrCast(*const u32, &bytes);\n", .{});
    print("    u32_ptr.*:0x{x}\n", .{u32_ptr.*});
    // Even this example is contrived - there are better ways to do the above than
    // pointer casting. For example, using a slice narrowing cast:
    const u32_value = std.mem.bytesAsSlice(u32, bytes[0..])[0];
    try expect(u32_value == 0x12121212);

    // And even another way, the most straightforward way to do it:
    try expect(@bitCast(u32, bytes) == 0x12121212);
}

test "pointer child type" {
    // pointer types have a `child` field which tells you the type they point to.
    try expect(@typeInfo(*u32).Pointer.child == u32);
}