const std = @import("std");
const print = std.debug.print;

const FileOpenError = error {
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};

const AllocationError = error {
    OutOfMemory,
};

test "coerce subset to superset" {
    print("\n", .{});
    const err = foo(AllocationError.OutOfMemory);
    try std.testing.expect(err == FileOpenError.OutOfMemory);
    print("err:{}\n", .{err});
}

fn foo(err: AllocationError) FileOpenError {
    return err;
}