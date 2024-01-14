const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "@ptrToInt and @intToPtr" {
    const ptr = @intToPtr(*i32, 0xdeadbee0);
    const addr = @ptrToInt(ptr);
    print("\nconst ptr = @intToPtr(*i32, 0xdeadbee0); --> ", .{});
    print("@TypeOf(ptr):{}, ptr:{}\n", .{@TypeOf(ptr), ptr});
    print("const addr = @ptrToInt(ptr); --> ", .{});
    print("@TypeOf(addr):{}, addr:{x}\n", .{@TypeOf(addr), addr});
    try expect(@TypeOf(addr) == usize);
    try expect(addr == 0xdeadbee0);
}