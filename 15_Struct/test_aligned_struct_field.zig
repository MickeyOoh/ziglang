const std = @import("std");
const expectEqual = std.testing.expectEqual;
const print = std.debug.print;

test "aligned struct fields" {
    const S = struct {
        a: u32 align(2),
        b: u32 align(64),
    };
    var foo = S{ .a = 1, .b = 2 };
    print("\nfoo:{}\n", .{foo});
    print("@alignOf(&foo.a):{}\n", .{@alignOf(S)});

    try expectEqual(64, @alignOf(S));
    try expectEqual(*align(2) u32, @TypeOf(&foo.a));
    try expectEqual(*align(64) u32, @TypeOf(&foo.b));
}