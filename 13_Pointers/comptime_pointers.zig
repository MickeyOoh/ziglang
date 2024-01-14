const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

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
