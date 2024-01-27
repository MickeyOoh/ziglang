const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const Foo = struct {};
    print("variable: {s}\n", .{@typeName(Foo)});
    print("anonymous: {s}\n", .{@typeName(struct {})});
    print("function: {s}\n", .{@typeName(List(i32))});
}

fn List(comptime T: type) type {
    return struct {
        x: T,
    };
}
