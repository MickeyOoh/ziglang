const std = @import("std");
const expect = std.testing.expect;
const mem = std.mem;
const print = std.debug.print;

test "cast *[1][*]const u8 to [*]const ?[*]const u8" {
    const window_name = [1][*]const u8{"window name"};
    const x: [*]const ?[*]const u8 = &window_name;
    try expect(mem.eql(u8, std.mem.sliceTo(@ptrCast([*:0]const u8, x[0].?), 0), "window name"));

    print("\nconst window_name = [1][*]const u8\"window name\";", .{});
    print(" --> @TypeOf(window_name):{}\n", .{@TypeOf(window_name)});
    //print("window_name[0]:{s}\n", .{x});
}
