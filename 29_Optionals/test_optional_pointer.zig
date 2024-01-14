const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "optional pointers" {
    // pointers cannot be null. If you want a null pointer, uset he optional 
    // prefix `?` to make the pointer type optional.
    var ptr: ?*i32 = null;

    var x: i32 = 1;
    ptr = &x;

    try expect(ptr.?.* == 1);

    // Optional pointers are the same size as normal pointers, because pointer
    // value 0 is used as the null value.
    try expect(@sizeOf(?*i32) == @sizeOf(*i32));
    print("\n@TypeOf(ptr):{}\n", .{@TypeOf(ptr)});
    print("@sizeOf(x: i32):{}, @sizeOf(ptr):{}\n", .{@sizeOf(@TypeOf(x)), @sizeOf(@TypeOf(ptr))});
}