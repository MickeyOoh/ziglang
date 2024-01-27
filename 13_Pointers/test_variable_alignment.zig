const std = @import("std");
const builtin = @import("builtin");
const expect = std.testing.expect;
const print  = std.debug.print;

test "variable alignment" {
    var x: i32 = 1234;
    const align_of_i32 = @alignOf(@TypeOf(x));
    try expect(@TypeOf(&x) == *i32);
    try expect(*i32 == *align(align_of_i32) i32);
    print("\n@TypeOf(&x): {}\n", .{@TypeOf(&x)});
    print("*aligne(align_of_i32) i32 --> {}\n", .{*align(align_of_i32) i32});

    if(builtin.target.cpu.arch == .x86_64) {
        try expect(@typeInfo(*i32).Pointer.alignment == 4);
        print("@typeInfo(*i32).Pointer.alignment --> {}\n", .{@typeInfo(*i32).Pointer.alignment});
    }
}