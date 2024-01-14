
test "type coercion - variable declaration" {
    var a: u8 = 1;
    var b: u16 = a;
    _ = b;
}

test "type coercion function call" {
    var a: u8 = 1;
    foo(a);
}

fn foo(b: u16) void {
    _ = b;
}

test "type coercion - @as builtin" {
    var a: u8 = 1;
    var b = @as(u16, a);
    _ = b;
}