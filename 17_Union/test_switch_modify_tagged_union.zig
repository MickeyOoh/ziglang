const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const ComplexTypeTag = enum {
    ok,
    not_ok,
};
const ComplexType = union(ComplexTypeTag) {
    ok: u8,
    not_ok: void,
};

test "modify tagged union in switch" {
    print("\n", .{});
    var c = ComplexType{ .ok = 42 };
    try expect(@as(ComplexTypeTag, c) == ComplexTypeTag.ok);
    print("c:{}\n", .{c});
    print("ComplexTypeTag.ok:{}\n", .{ComplexTypeTag.ok});
    switch (c) {
        ComplexTypeTag.ok => |*value| value.* += 1,
        ComplexTypeTag.not_ok => unreachable,
    }

    try expect(c.ok == 43);
}