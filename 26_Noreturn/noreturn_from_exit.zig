// Another use case for noreturn is the exit function:

const std = @import("std");
const builtin = @import("builtin");
const native_arch = builtin.cpu.arch;
const expect = std.testing.expect;

const WINAPI: std.builtin.CallingConvention = if (native_arch == .i386) .Stdcall else .C;
extern "kernel32" fn ExitProcess(exit_code: c_int) callconv(WINAPI) noreturn;

test "foo" {
    const value = bar() catch ExitProcess(1);
    try expect(value == 1234);
}

fn bar() anyerror!u32 {
    return 1234;
}

// zig test noreturn_from_exit.zig -target x86_64-windows --test-no-exec