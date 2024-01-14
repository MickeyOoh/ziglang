const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "null terminated slicing" {
    var array = [_]u8{ 3, 2, 1, 0, 3, 2, 1, 0};
    var runtime_length: usize = 3;
    const slice = array[0..runtime_length :0];
    print("\narray:{d}\n", .{array});
    print("slice = array[0..runtime_length :0]; --> slice: {d}\n", .{slice});
    try expect(@TypeOf(slice) == [:0]u8);
    try expect(slice.len == 3);
    print("@TypeOf(array):{}, @TypeOf(slice):{}\n", .{@TypeOf(array), @TypeOf(slice)});
}

test "sentinel mismatch" {
    var array = [_]u8{ 3, 2, 1, 0};


    var runtime_length: usize = 2;
    const slice = array[0..runtime_length :0];

    _ = slice;
}