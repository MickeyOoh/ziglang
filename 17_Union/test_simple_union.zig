const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const Payload = union {
    int: i64,
    float: f64,
    boolean: bool,
};
test "simple union" {
    print("\n", .{});
    var payload = Payload{ .int = 1234 };
    print("payload.int:{}\n", .{payload.int});
    try expect(payload.int == 1234);
    payload = Payload{ .float = 12.34 };
    print("payload.float:{}\n", .{payload.float});
    try expect(payload.float == 12.34);
}