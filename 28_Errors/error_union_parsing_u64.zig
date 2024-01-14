const std = @import("std");
const maxInt = std.math.maxInt;
const print  = std.debug.print;

pub fn parseU64(buf: []const u8, radix: u8) !u64 {
    var x: u64 = 0;
    print("buf:\"{s}\", radix:{}\n", .{buf, radix});
    for (buf) |c| {
        const digit = charToDigit(c);
        print("digit:{}\n", .{digit});
        if (digit >= radix) {
            return error.InvalidChar;
        }

        // x *= radix
        if (@mulWithOverflow(u64, x, radix, &x)) {
            return error.Overflow;
        }
        print("@mulWithOverflow(u64, x, radix, &x):{}\n", .{x});
        // x += digit
        if (@addWithOverflow(u64, x, digit, &x)) {
            return error.Overflow;
        }
        print("@addWithOverflow(u64, x, {}, &x):{}\n", .{digit, x});

    }

    return x;
}

fn charToDigit(c: u8) u8 {
    return switch (c) {
        '0' ... '9' => c - '0',
        'A' ... 'Z' => c - 'A' + 10,
        'a' ... 'z' => c - 'a' + 10,
        else => maxInt(u8),
    };
}

test "parse u64" {
    print("\n", .{});
    const result = try parseU64("1234", 10);
    try std.testing.expect(result == 1234);
}