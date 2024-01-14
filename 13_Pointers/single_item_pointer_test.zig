const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "address of syntax" {
    print("\n",.{});
    // Get the address of a variable
    const x: i32 = 1234;
    const x_ptr = &x;

    // Dereference a pointer:
    print("const x: i32 = 1234;\n",.{});
    print("const x_ptr = &x;\n",.{});
    print("      x_ptr.* --> {}\n", .{x_ptr.*});
    //try expect(x_ptr.* == 1234);
    print("     @TypeOf(x_ptr):{}\n", .{@TypeOf(x_ptr)});
    print("\n",.{});

    var y: i32 = 5678;
    var y_ptr = &y;
    print("@TypeOf(y_ptr): {} {x}\n", .{@TypeOf(y_ptr), y_ptr});
    y_ptr.* += 1;
    print("y_ptr.*:{}\n", .{y_ptr.*});
}

test "pointer array access" {
    // Taking an address of an individual element gives a
    // single-item pointer. This kind of pointer
    // does not support pointer arithmetic.
    print("\n",.{});
    var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    const ptr = &array[2];
    try expect(@TypeOf(ptr) == *u8);
    print("@TypeOf(ptr):{}\n", .{@TypeOf(ptr)});

    try expect(array[2] == 3);
    print("array[2]:{}\n", .{array[2]});
    ptr.* += 1;
    print("ptr.* += 1; array[2]:{}\n", .{array[2]});
    try expect(array[2] == 4);
}