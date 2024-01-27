const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "@intFromPtr and @ptrFromInt" {
    const ptr: *i32 = @ptrFromInt(0xdeadbee0);
    const addr = @intFromPtr(ptr);
    print("\nconst ptr = @ptrFromInt(0xdeadbee0); --> ", .{});
    print("@TypeOf(ptr):{}, ptr:{}\n", .{ @TypeOf(ptr), ptr });
    print("const addr = @intFromPtr(ptr); --> ", .{});
    print("@TypeOf(addr):{}, addr:{x}\n", .{ @TypeOf(addr), addr });
    try expect(@TypeOf(addr) == usize);
    try expect(addr == 0xdeadbee0);
}
