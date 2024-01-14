const assert = @import("std").debug.assert;

comptime {
    assert(@TypeOf(foo) == fn()void);
    assert(@sizeOf(fn()void) == @sizeOf(?fn()void));
}

fn foo() void { }