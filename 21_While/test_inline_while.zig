const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "inline while loop" {
    print("\n", .{});
    comptime var i = 0;
    var sum: usize = 0;
    inline while (i < 3) : (i += 1) {
        const T = switch (i) {
            0 => f32,
            1 => i8,
            2 => bool,
            else => unreachable,
        };
        sum += typeNameLength(T);
        print("{}: {s} -> {}\n", .{ i, @typeName(T), @typeName(T).len });
    }
    try expect(sum == 9);
}

fn typeNameLength(comptime T: type) usize {
    //print("{s}\n", .{@typeName(T)});
    return @typeName(T).len;
}
