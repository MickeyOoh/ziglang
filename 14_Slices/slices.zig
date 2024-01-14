const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;
const mem = std.mem;
const fmt = std.fmt;

test "using slices for strings" {
    // Zig has no concept of strings. String literals are const pointers
    // to null-terminated arrays of u8, and by convention parameters
    // that are "strings" are expected to be UTF-8 encoded slices of u8.
    // Here we coerce *const [5:0]u8 and *const [6:0]u8 to []const u8
    const hello: []const u8 = "hello";
    const world: []const u8 = "世界";

    var all_together: [100]u8 = undefined;
    // You can use slice syntax on an array to convert an array into a slice.
    const all_together_slice = all_together[0..];
    // String concatenation example.
    const hello_world = try fmt.bufPrint(all_together_slice, "{s} {s}", .{ hello, world });

    // Generally, you can use UTF-8 and not worry about whether something is a
    // string. If you don't need to deal with individual characters, no need
    // to decode.
    try expect(mem.eql(u8, hello_world, "hello 世界"));
    print("hello_world:{s}\n", .{hello_world});
}

test "slice pointer" {
    var array: [10]u8 = undefined;
    const ptr = &array;

    // You can use slicing syntax to convert a pointer into a slice:
    const slice = ptr[0..5];
    slice[2] = 3;
    try expect(slice[2] == 3);
    print("slice: {s}, slice[2]:{}\n", .{slice, slice[2]});
    // The slice is mutable because we sliced a mutable pointer.
    // Furthermore, it is actually a pointer to an array, since the start
    // and end indexes were both comptime-known.
    try expect(@TypeOf(slice) == *[5]u8);
    print("@TypeOf(slice):{}\n", .{@TypeOf(slice)});

    // You can also slice a slice:()
    const slice2 = slice[2..3];
    try expect(slice2.len == 1);
    try expect(slice2[0] == 3);
    print("const slice2 = slice[2..3];\n",.{});
    print("slice2.len:{}, slice2[0]:{}\n", .{slice2.len, slice2[0]});
}