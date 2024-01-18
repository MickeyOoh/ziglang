const std = @import("std");
const assert = std.debug.assert;
const print = std.debug.print;

threadlocal var x: i32 = 1234;

test "thread local storage" {
    const thread1 = try std.Thread.spawn(.{}, testTls, .{1});
    const thread2 = try std.Thread.spawn(.{}, testTls, .{2});
    testTls(3);
    thread1.join();
    thread2.join();
}

fn testTls(n: i32) void {
    print("{}:testTls() was called\n", .{n});
    assert(x == 1234);
    x += 1;
    assert(x == 1235);
}
