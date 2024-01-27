const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

const Small2 = union(enum) {
    a: i32,
    b: bool,
    c: u8,
};
test "@tagName" {
    print("\n", .{});
    try expect(std.mem.eql(u8, @tagName(Small2.a), "a"));
    print("@tagName(Small2.a):{s}\n", .{@tagName(Small2.a)});
    print("@tagName(Small2.b):{s}\n", .{@tagName(Small2.b)});
    print("@tagName(Small2.c):{s}\n", .{@tagName(Small2.c)});
}
