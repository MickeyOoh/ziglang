const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "anonymous list literal syntax" {
    var array: [4]u8 = .{11, 22, 33, 44};
    print("\narray: {d}\n", .{array});
    try expect(array[0] == 11);
    try expect(array[1] == 22);
    try expect(array[2] == 33);
    try expect(array[3] == 44);
}