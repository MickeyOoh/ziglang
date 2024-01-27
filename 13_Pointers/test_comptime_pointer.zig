const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "comptime pointers" {
    comptime {
        var x: i32 = 1;
        const ptr = &x;
        //print("Is it printable comptime x:{d}\n", .{x});
        ptr.* += 1;
        x += 1;
        try expect(ptr.* == 3);
        //print("ptr.* += 1;x += 1; ptr.* -> {d}\n", .{ptr.*});
    }
    //print("ptr.* += 1;x += 1; ptr.* -> {}\n", .{ptr.*});
}

test "comptime @ptrFromInt" {
    comptime {
        // Zig is able to be this at compile-time, as long as
        // ptr is never dereferenced.
        const ptr: *i32 = @ptrFromInt(0xdeadbee0);
        const addr = @intFromPtr(ptr);
        try expect(@TypeOf(addr) == usize);
        try expect(addr == 0xdeadbee0);
    }
}
