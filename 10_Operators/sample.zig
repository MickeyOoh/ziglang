const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    print("3 +  4 = {}\n", .{3 + 4});
    print("3 +% 4 = {}\n", .{3 +% 4});
    print("@as(u32, std.math.maxInt(u32)):{}\n", .{@as(u32, std.math.maxInt(u32)) });

}