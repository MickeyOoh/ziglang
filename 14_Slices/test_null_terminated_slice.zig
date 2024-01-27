const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "null terminated slice" {
    const slice: [:0]const u8 = "hello";
    print("\nconst slice: [:0]const u8 = \"hello\";\n", .{});
    try expect(slice.len == 5);
    try expect(slice[5] == 0);
    print("   slice.len:{}, slice[5]:{}\n", .{ slice.len, slice[5] });
}
