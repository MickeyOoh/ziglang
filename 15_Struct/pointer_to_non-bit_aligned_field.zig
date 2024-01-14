const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const BitField = packed struct {
    a: u3,
    b: u3,
    c: u2,
    d: u7,
    e: u5,
};

var bit_field = BitField{
    .a = 1,
    .b = 2,
    .c = 3,
    .d = 7,
    .e = 5,
};

test "pointer to non-bit-aligned field" {
    print("\n",.{});
    try expect(@ptrToInt(&bit_field.a) == @ptrToInt(&bit_field.b));
    try expect(@ptrToInt(&bit_field.a) == @ptrToInt(&bit_field.c));
    print("@ptrToInt(&bit_field.a): 0x{x}\n", .{@ptrToInt(&bit_field.a)});
    print("@ptrToInt(&bit_field.b): 0x{x}\n", .{@ptrToInt(&bit_field.b)});
    print("@ptrToInt(&bit_field.c): 0x{x}\n", .{@ptrToInt(&bit_field.c)});
    print("@ptrToInt(&bit_field.d): 0x{x}\n", .{@ptrToInt(&bit_field.d)});
    print("@ptrToInt(&bit_field.e): 0x{x}\n", .{@ptrToInt(&bit_field.e)});
    print("bit_field.d:{}\n", .{bit_field.d});
    print("bit_field.e:{}\n", .{bit_field.e});
}