const std = @import("std");
const print = std.debug.print;

test "expectEqual demo" {
    const expected: i32 = 42;
    const actual = 42;
    // const debuglog = 
    // \\ The first argument to `expectEqual` is the known, expected, result.
    // \\ The second argument is the result of some expression.
    // \\ The actual's type is casted to be type of expected.
    // ;
    // print("{s}", .{debuglog});

    try std.testing.expectEqual(expected, actual);
}

test "expectError demo" {
    const expected_error = error.DemoError;
    const actual_error_union: anyerror!void = error.DemoError;


    try std.testing.expectError(expected_error, actual_error_union);
}