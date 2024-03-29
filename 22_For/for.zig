const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "for basics" {
    const items = [_]i32 { 4, 5, 3, 4, 0 };
    var sum: i32 = 0;

    for (items) |value| {
        if ( value == 0 ) {
            continue;
        }
        sum += value;
    }
    try expect(sum == 16);

    // To iterate over a portion of a slice, reslice.
    for (items[0..1]) |value| {
        sum += value;
    }
    try expect(sum == 20);

    // To access the indx of iteration
    var sum2: i32 = 0;
    for(items) |_, i| {
        try expect(@TypeOf(i) == usize);
        sum2 += @intCast(i32, i);
    }
    try expect(sum2 == 10);
}

test "for reference" {
    var items = [_]i32 {3, 4, 2};

    for(items) |*value| {
        value.* += 1;
    }

    try expect(items[0] == 4);
    try expect(items[1] == 5);
    try expect(items[2] == 3);
}

test "for else" {
    // For allows an else attached to it, the same as a while loop.
    var items = [_]?i32 {3, 4, null, 5};

    // For loops can also be used expression.
    // Similar to while loops, when you break from a for loop, the else branch is not eavluated.
    var sum: i32 = 0;
    const result = for(items) |value| {
        if (value != null) {
            sum += value.?;
        }
    } else blk: {
        try expect(sum == 12);
        break :blk sum;
    };
    try expect(result == 12);
}