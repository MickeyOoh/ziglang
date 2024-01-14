const std = @import("std");
const expect = std.testing.expect;

test "print test result" {
    const v = 3;
    try expect(v == 3);
    std.time.sleep(3000 * std.time.ns_per_ms);
}
