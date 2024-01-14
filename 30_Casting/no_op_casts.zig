const print = @import("std").debug.print;

test "type coercion - const qualification" {
    var a: i32 = 1;
    var b: *i32 = &a;
    foo(b);
    print("\nb:{}, foo(b):{}\n", .{b, foo(b)});
}
// non-const to const is allowed
fn foo(_: *const i32) void {}