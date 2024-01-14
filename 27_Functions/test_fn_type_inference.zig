const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

fn addFortyTwo(x: anytype) @TypeOf(x) {
    if(@TypeOf(x) != comptime_int){
        print("x:{} @TypeOf(x):{}\n", .{x, @TypeOf(x)});
    }
    return x + 42;
}

test "fn type inference" {
    print("\n=={}== {}\n", .{123, @TypeOf(123)});
    try expect(addFortyTwo(1) == 43);
    try expect(@TypeOf(addFortyTwo(1)) == comptime_int);
    print("addFortyTwo(1):{}\n", .{addFortyTwo(1)});
    var y: i64 = 2;
    try expect(addFortyTwo(y) == 44);
    try expect(@TypeOf(addFortyTwo(y)) == i64);
}

test "fn reflection" {
    print("\n@TypeOf(expect):\n--> {}\n", .{@TypeOf(expect)});
    //print("@typeInfo(@TypeOf(expect)):{}\n", .{@typeInfo(@TypeOf(expect))});
    try expect(@typeInfo(@TypeOf(expect)).Fn.args[0].arg_type.? == bool);
    try expect(@typeInfo(@TypeOf(expect)).Fn.is_var_args == false);
}