const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const Number = enum(u8) {
    one,
    two,
    three,
    _,
};

test "switch on non-exhaustive enum" {
    print("\n",.{});
    // var i: usize = 0;
    // const len = @typeInfo(Number).Enum.fields.len;
    // while(i < len){
    //     print("{}: {}\n", .{i, @typeInfo(Number).Enum.fields[i].name});
    //     i += 1;
    // }
    const number = Number.one;
    const result = switch (number) {
        .one => true,
        .two,
        .three => false,
        _ => false,
    };
    try expect(result);
    const is_one = switch(number) {
        .one => true,
        else => false,
    };
    try expect(is_one);
}