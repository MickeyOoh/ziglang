const expect = std.testing.expect;
const std = @import("std");
const print = std.debug.print;

test "pointer slicing" {
    var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    const slice = array[2..4];
    try expect(slice.len == 2);
    print("\nvar array:{d}\n", .{array});
    print("@TypeOf(array):{}\n", .{@TypeOf(array)});
    print("@TypeOf(slice):{}\n", .{@TypeOf(slice)});
    print("slice = array[2..4] --> {d}\n", .{slice.*});

    try expect(array[3] == 4);
    slice[1] += 1;
    try expect(array[3] == 5);
    print("slice[1] += 1; --> array[3]:{d}\n", .{array[3]});
}