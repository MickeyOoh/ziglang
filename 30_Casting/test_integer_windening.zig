const std = @import("std");
const builtin = @import("builtin");
const expect = std.testing.expect;
const mem = std.mem;

test "integer widening" {
    var a: u8 = 250;
    var b: u16 = a;
    var c: u32 = b;
    var d: u64 = c;
    var e: u64 = d;
    var f: u128 = e;
    try expect(f == a);
}

test "implicit unsigned integer to signed integer" {
    var a: u8 = 250;
    var b: i16 = a;
    try expect(b == 250);
}

test "float widening" {
    // Note: there is an open issue preventing this from working on aarch64:
    // https://github.com/ziglang/zig/issues/3282
    if (builtin.target.cpu.arch == .aarch64) return error.SkipZigTest;

    var a: f16 = 12.34;
    var b: f32 = a;
    var c: f64 = b;
    var d: f128 = c;
    try expect(d == a);
}