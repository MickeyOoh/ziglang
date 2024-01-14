const @"identifier with spaces in it" = 0xff;
const @"ISmallStep4Man" = 112358;

const c = @import("std").c;

pub extern "C" fn @"error"() anyopaque;
pub extern "C" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.stat) c_int;

const Color = enum{
    red,
    @"really red",
};

const color: Color = .@"really red";

const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    print("color:{s}\n", .{color});
    print("red: {d}\n", .{Color.red});
}

