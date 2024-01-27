const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

var foo: u8 align(4) = 100;

test "global variable alignment" {
    print("\n", .{});
    print("@typeInfo(@TypeOf(&foo)).Pointer.alignment --> {}\n",
                         .{@typeInfo(@TypeOf(&foo)).Pointer.alignment});
    print("@TypeOf(&foo) --> {}, *align(4) u8 --> {}\n", .{@TypeOf(&foo), *align(4) u8});

    const as_pointer_to_array: *[1]u8 = &foo;
    const as_slice: []u8 = as_pointer_to_array;
    print("@TypeOf(as_slice) --> {}\n", .{@TypeOf(as_slice)});
}

fn derp() align(@sizeOf(usize) * 2) i32 { return 1234;}
fn noop1() align(1) void {}
fn noop4() align(4) void {}

test "function alignment" {
    print("\n", .{});
    print("fn derp() align(@sizeOf(usize) * 2) i32  return 1234;\n",.{});
    print("     derp() --> {}\n", .{derp()});
    print("fn noop1() align(1) void --> ", .{});
    print("@TypeOf(noop1): {}\n", .{@TypeOf(noop1)});
    print("fn noop1() align(4) void --> ", .{});
    print("@TypeOf(noop4): {}\n", .{@TypeOf(noop4)});
}