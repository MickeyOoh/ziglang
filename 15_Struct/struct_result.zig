const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

const Point = struct {x: i32, y: i32};

test "anonymous struct literal" {
    print("\n", .{});
    var pt: Point = .{
        .x = 13,
        .y = 67,
    };
    try expect(pt.x == 13);
    try expect(pt.y == 67);
    print("pt:{}\n", .{pt});
    print("pt.x:{}, pt.y:{}\n", .{pt.x, pt.y});
}