const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "null terminated array" {
    const array = [_:0]u8 {1,2,3,4};

    print("\narray:{d}\n", .{array});
    print("@TypeOf(array): {}\n",.{@TypeOf(array)});
    print("array.len:{}\n",.{array.len});
    print("array[4]: {}\n", .{array[4]});

}