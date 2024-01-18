const std = @import("std");
const print = std.debug.print;

const inf = std.math.inf(f32);
const negative_inf = -std.math.inf(f64);
const nan = std.math.nan(f128);

test "infinitive number test" {
    print("std.math.inf(f32):{}\n", .{inf});
    print("std.math.inf(f64):{}\n", .{negative_inf});
    print("std.math.nan(f128):{}\n", .{nan});
}
