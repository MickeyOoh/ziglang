const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "pointer to empty struct" {
    const Empty = struct {};
    var a = Empty{};
    var b = Empty{};
    var ptr_a = &a;
    var ptr_b = &b;
    comptime try expect(ptr_a == ptr_b);
    print("@TypeOf(ptr_a):{}\n", .{@TypeOf(ptr_a)});
    print("ptr_a:{}\n", .{ptr_a});
}
