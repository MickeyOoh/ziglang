const expect = @import("std").testing.expect;

test "this will be skipped" {
    return error.SkipZigTest;
}

test "test result" {
    try expect(true);
}
