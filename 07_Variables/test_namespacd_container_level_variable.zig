const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

test "namespaced container level variable" {
    print("\nfoo(): {}\n", .{foo()});
    print("foo(): {}\n", .{foo()});
    try expect(foo() == 1237);
    try expect(foo() == 1238);
}

const S = struct {
    var x: i32 = 1234;
};

fn foo() i32 {
    S.x += 1;
    return S.x;
}