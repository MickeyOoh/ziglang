const std = @import("std");

// test "pointer alignment safety" {
//     var array align(4) = [_]u32{ 0x11111111, 0x11111111 };
//     const bytes = std.mem.sliceAsBytes(array[0..]);
//     try std.testing.expect(foo(bytes) == 0x11111111);
// }
// fn foo(bytes: []u8) u32 {
//     const slice4 = bytes[1..5];
//     const int_slice = std.mem.bytesAsSlice(u32, @alignCast(4, slice4));
//     return int_slice[0];
// }

// This is also available as `std.c.printf`.
pub extern "C" fn printf(format: [*:0]const u8, ...) c_int;

pub fn main() anyerror!void {
    _ = printf("Hello, world!\n");  // ok

    const msg = "Hello, world!\n";
    const non_null_terminated_msg: [msg.len]u8 = msg.*;
    _ = printf(&non_null_terminated_msg);
}
