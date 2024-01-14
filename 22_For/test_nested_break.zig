const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "nested break" {
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
            count += 1;
            break :outer;
        }
    }
    try expect(count == 1);
}

test "nested continue" {
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
            count += 1;
            continue :outer;
        }
    }
    try expect(count == 8);
}

// inline for
test "inline for loop" {
    
}

