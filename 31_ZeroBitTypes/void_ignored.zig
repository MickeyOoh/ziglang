test "void is ignored" {
    returnsVoid();
}

test "explicityly ignoring expression value" {
    _ = foo();
}
fn returnsVoid() void {}

fn foo() i32 {
    return 1234;
}
