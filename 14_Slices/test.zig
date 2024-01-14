const expect = @import("std").testing.expect;
const std = @import("std");
const print = std.debug.print;

test "basic slices" {
    var array = [_]i32{ 1, 2, 3, 4 };
    print("\n",.{});
    // A slice is a pointer and a length. The difference between an array and
    // a slice is that the array's length is part of the type and known at
    // compile-time, whereas the slice's length is known at runtime.
    // Both can be accessed with the `len` field.
    var known_at_runtime_zero: usize = 0;
    const slice = array[known_at_runtime_zero..array.len];
    try expect(&slice[0] == &array[0]);
    try expect(slice.len == array.len);
    print("array:{d}\n", .{array});
    print("slice({d}):{d}\n", .{slice.len, slice});
    print("@TypeOf(array):{}, @TypeOf(slice):{}\n", .{@TypeOf(array), @TypeOf(slice)});

    // Using the address-of operator on a slice gives a single-item pointer,
    // while using the `ptr` field gives a many-item pointer.
    try expect(@TypeOf(slice.ptr) == [*]i32);
    try expect(@TypeOf(&slice[0]) == *i32);
    try expect(@ptrToInt(slice.ptr) == @ptrToInt(&slice[0]));
    print("@TypeOf(slice.ptr):{},\n@TypeOf(&slice[0]):{},\ns@ptrToInt(slice.ptr):{x}\n", 
            .{@TypeOf(slice.ptr), @TypeOf(&slice[0]), @ptrToInt(slice.ptr)});
    // Slices have array bounds checking. If you try to access something out
    // of bounds, you'll get a safety check failure:
    //slice[10] += 1;

    // Note that `slice.ptr` does not invoke safety checking, while `&slice[0]`
    // asserts that the slice has len >= 1.
}
