fn foo(condition: bool, b: u32) void {
    const a = if (condition) b else return;
    _ = a;
    @panic("do something witha a");
}

test "coreturn" {
    foo(false, 1);
}