const std = @import("std");
const Vector = std.meta.Vector;
const expectEqual = std.testing.expectEqual;
const print = std.debug.print;

test "Basic vector usage" {
    // Vectors have a compile-time known length and base type,
    // and can be assigned to using array literal syntax
    const a: Vector(4, i32) = [_]i32{1, 2, 3, 4};
    const b: Vector(4, i32) = [_]i32{ 5, 6, 7, 8};

    const c = a + b;
    print("\na: {d}\n", .{a});
    print("b: {d}\n", .{b});

    print("a + b = c: {d}\n", .{c});
    try expectEqual(6,  c[0]);
    try expectEqual(8,  c[1]);
    try expectEqual(10, c[2]);
    try expectEqual(12, c[3]);
}

test "Conversion between vectors, arrays, and slices" {
    // Vector and fixed-length arrays can be automatically assigned back and forth
    var arr1: [4]f32 = [_]f32{ 1.1, 3.2, 4.5, 5.6};
    var vec: Vector(4, f32) = arr1;
    var arr2: [4]f32 = vec;
    
    print("\narr1({}): {d}\n", .{@TypeOf(arr1), arr1});
    print("vec({}):  {d}\n", .{@TypeOf(vec), vec});
    print("arr2({}): {d}\n", .{@TypeOf(arr2), arr2});

    try expectEqual(arr1, arr2);

    // You can also assign from a slice with comptime-known length to a vector using .*
    const vec2: Vector(2, f32) = arr1[1..3].*;
    print("\nconst vec2: Vector(2, f32) = arr1[1..3].*;", .{});
    print("-- vec2: {d}\n", .{vec2});
    var slice: []const f32 = &arr1;
    var offset: u32 = 1;
    //
    //
    //
    const vec3: Vector(2, f32) = slice[offset..][0..2].*;
    print("const vec3: Vector(2, f32) = slice[offset..][0..2].*;\n", .{});
    print("slice: {d}\n", .{slice});
    print("vec3: {d}\n", .{vec3});

    
}