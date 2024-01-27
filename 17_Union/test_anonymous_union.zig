const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

const Number = union {
    int: i32,
    float: f64,
};

test "anonymous union literal syntax" {
    print("\n", .{});
    var i: Number = .{ .int = 42 };
    var f = makeNumber();
    try expect(i.int == 42);
    try expect(f.float == 12.34);
    print("i.int:{}\n", .{i.int});
    //print("i.float:{}\n", .{i.float});
    print("f.float:{}\n", .{f.float});
}

fn makeNumber() Number {
    return .{ .float = 12.34 };
}
