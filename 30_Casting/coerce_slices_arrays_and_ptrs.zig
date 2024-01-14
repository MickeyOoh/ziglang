const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

// You can assign constant pointers to arrays to a slice with
// const modifier on the element type. Useful in particular for
// String literals.
test "*const [N]T to []const T" {
    var x1: []const u8 = "hello";
    var x2: []const u8 = &[5]u8{ 'h', 'e', 'l', 'l', 0x6f };    // `o` 111-0x6f
    try expect(std.mem.eql(u8, x1, x2));
    print("\nx1: {s}, x2: {s}\n", .{x1, x2});

    var y: []const f32 = &[2]f32{ 1.2, 3.4 };
    try expect(y[0] == 1.2);
    print("y[0]:{}\n", .{y[0]});
}

// Likewise, it works when the destination type is an error union.
test "*const [N]T to E![]const T" {
    var x1: anyerror![]const u8 = "hello";
    var x2: anyerror![]const u8 = &[5]u8{ 'h', 'e', 'l', 'l', 111 };
    try expect(std.mem.eql(u8, try x1, try x2));

    var y: anyerror![]const f32 = &[2]f32{ 1.2, 3.4 };
    try expect((try y)[0] == 1.2);
}

// Likewise, it works when the destination type is an optional.
test "*const [N]T to ?[]const T" {
    var x1: ?[]const u8 = "hello";
    var x2: ?[]const u8 = &[5]u8{ 'h', 'e', 'l', 'l', 111 };
    try expect(std.mem.eql(u8, x1.?, x2.?));

    var y: ?[]const f32 = &[2]f32{ 1.2, 3.4 };
    try expect(y.?[0] == 1.2);
}

// In this cast, the array length becomes the slice length.
test "*[N]T to []T" {
    var buf: [5]u8 = "hello".*;
    const x: []u8 = &buf;
    try expect(std.mem.eql(u8, x, "hello"));

    const buf2 = [2]f32{ 1.2, 3.4 };
    const x2: []const f32 = &buf2;
    try expect(std.mem.eql(f32, x2, &[2]f32{ 1.2, 3.4 }));
}

// Single-item pointers to arrays can be coerced to many-item pointers.
test "*[N]T to [*]T" {
    var buf: [5]u8 = "hello".*;
    const x: [*]u8 = &buf;
    try expect(x[4] == 'o');
    // x[5] would be an uncaught out of bounds pointer dereference!
}

// Likewise, it works when the destination type is an optional.
test "*[N]T to ?[*]T" {
    var buf: [5]u8 = "hello".*;
    const x: ?[*]u8 = &buf;
    try expect(x.?[4] == 'o');
}

// Single-item pointers can be cast to len-1 single-item arrays.
test "*T to *[1]T" {
    var x: i32 = 1234;
    const y: *[1]i32 = &x;
    const z: [*]i32 = y;
    try expect(z[0] == 1234);
}