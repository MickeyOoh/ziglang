const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "inline for loop" {
    print("\n",.{});
    const nums = [_]i32{2, 4, 6};
    var sum: usize = 0;
    inline for (nums) |i| {
        const T = switch (i) {
            2 => f32,
            4 => i8,
            6 => bool,
            else => unreachable,
        };
        sum += typeNameLength(T);
        print("{}: {s} -> {}\n", .{i, @typeName(T), @typeName(T).len});
    }
    try expect(sum == 9);
}

fn typeNameLength(comptime T: type) usize {
    return @typeName(T).len;
}
