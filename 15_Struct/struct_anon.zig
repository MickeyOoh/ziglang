const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "fully anonymous struct" {
    const str = \\
    \\try dump(.{
    \\    .int = @as(u32, 1234),
    \\    .float = @as(f64, 12.34),
    \\    .b = true,
    \\    .s = "hi",
    \\});
    \\
    ;
    print("\n{s}\n", .{str});
    try dump(.{
        .int = @as(u32, 1234),
        .float = @as(f64, 12.34),
        .b = true,
        .s = "hi",
    });
}

fn dump(args: anytype) !void {
    print("args:{}\n", .{args});
    try expect(args.int == 1234);
    try expect(args.float == 12.34);
    try expect(args.b);
    try expect(args.s[0] == 'h');
    try expect(args.s[1] == 'i');
}
