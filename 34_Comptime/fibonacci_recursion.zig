const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

fn fibonacci(index: u32) u32 {
    if (index < 2) return index;
    //print("fibonacci:{}\n", .{index});
    return fibonacci(index - 1) + fibonacci(index - 2);
}

test "fibonacci" {
    print("\n",.{});
    // test fibonacci at run-time
    try expect(fibonacci(7) == 13);

    // test fibonacci at comp-time
    // comptime {
    //     try expect(fibonacci(7) == 13);
    // }
}