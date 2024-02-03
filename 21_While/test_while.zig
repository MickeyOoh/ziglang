const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "while basic" {
    print("\n", .{});
    var i: usize = 0;
    while (i < 10) {
        print(" {},", .{i});
        i += 1;
    }
    try expect(i == 10);
}

test "while break" {
    print("\n", .{});
    var i: usize = 0;
    while (true) {
        if (i == 10)
            break;
        print(" {},", .{i});
        i += 1;
    }
    try expect(i == 10);
}

test "while continue" {
    var i: usize = 0;
    while (true) {
        i += 1;
        if (i < 10)
            continue;
        break;
    }
    try expect(i == 10);
}

test "while loop continue expression" {
    var i: usize = 0;
    while (i < 10) : (i += 1) {}
    try expect(i == 10);
}

test "while loop continue expression, more complicated" {
    var i: usize = 1;
    var j: usize = 1;
    while (i * j < 2000) : ({
        i *= 2;
        j *= 3;
    }) {
        const my_ij = i * j;
        try expect(my_ij < 2000);
    }
}

test "while else" {
    print("\n", .{});
    try expect(rangeHasNumber(0, 10, 5));
    try expect(!rangeHasNumber(0, 10, 15));
}

fn rangeHasNumber(begin: usize, end: usize, number: usize) bool {
    var i = begin;
    print("rangeHasNumber(s:{}, e:{}, n:{}) -> ", .{ begin, end, number });
    return while (i < end) : (i += 1) {
        print(" {},", .{i});
        if (i == number) {
            print("\n", .{});
            break true;
        }
    } else false;
}

// 21.2. while with Optionals
// Just like `if` expressions, while loops can take an optional as the condition and capture the payload.
// When `null` is encountered the loop exits.
//
// When the `|x|` syntax is present on a `while` expression, the while condition must have an Optional Types.
// The `else` branch is allowed on optional iteration. In this case, it will be executed on the first
// null value encountered.
test "while null capture" {
    var sum1: u32 = 0;
    numbers_left = 3;
    while (eventuallyNullSequence()) |value| {
        sum1 += value;
    }
    try expect(sum1 == 3);

    var sum2: u32 = 0;
    numbers_left = 3;
    while (eventuallyNullSequence()) |value| {
        sum2 += value;
    } else {
        try expect(sum2 == 3);
    }
}

var numbers_left: u32 = undefined;
fn eventuallyNullSequence() ?u32 {
    return if (numbers_left == 0) null else blk: {
        numbers_left -= 1;
        break :blk numbers_left;
    };
}
