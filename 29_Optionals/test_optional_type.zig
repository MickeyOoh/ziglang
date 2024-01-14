const expect = @import("std").testing.expect;
const print = @import("std").debug.print;

test "optional type" {
    // Declare an optional and coerce from null:
    var foo: ?i32 = null;

    // Coerce from child type of an optional
    foo = 1234;
    const t = @TypeOf(foo);
    print("@TypeOf(foo):{}\n",.{t});
    print("@typeInfo(t):{}\n", .{@typeInfo(t)});

    // Use compile-time reflection to access the child type of the optional:
    comptime try expect(@typeInfo(@TypeOf(foo)).Optional.child == i32);
}