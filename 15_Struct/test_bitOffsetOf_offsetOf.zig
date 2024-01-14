const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const BitField = packed struct {
    a: u3,    b: u3,    c: u2,
};

test "pointer to non-bit-aligned field" {
    comptime {
        try expect(@bitOffsetOf(BitField, "a") == 0);
        try expect(@bitOffsetOf(BitField, "b") == 3);
        try expect(@bitOffsetOf(BitField, "c") == 6);

        try expect(@offsetOf(BitField, "a") == 0);
        try expect(@offsetOf(BitField, "b") == 0);
        try expect(@offsetOf(BitField, "c") == 0);
        //print("\n@bitOffsetOf(BitField, \"c\"):{}", .{@bitOffsetOf(BitField, "c")});

        //print("@offsetOf(BitField, \"c\"):{}\n", .{@offsetOf(BitField, "cs")});
    }
}