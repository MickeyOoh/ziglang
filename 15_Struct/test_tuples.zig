const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "tuple" {
    print("\n", .{});
    const values = .{
        @as(u32, 1234),
        @as(f64, 12.34),
        true,
        "hi",
    } ++ .{false} ** 2;
    try expect(values[0] == 1234);
    try expect(values[4] == false);
    inline for (values, 0..) |v, i| {
        if (i != 2) continue;
        try expect(v);
    }
    try expect(values.len == 6);
    try expect(values.@"3"[0] == 'h');
    print("values: {}\n", .{values});
    print("values.@\"3\"[0]: {c}\n", .{values.@"3"[0]});
}
