// The code sample below uses the `std.testing.refAllDecls(@This())` function call to reference
// all of the containers that are in the file including the imported Zig source file.
// The code sample also shows an alternative way to reference containers using the `_ = C;`
// syntax. This syntax tells the compiler to ignore the result of the expression on the
// right side of the assignment operator.
const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;
// Imported source file tests will run when referenced from a top-level test declaration.
// The next line alone does not cause "introducing_zig_test.zig" tests to run.
const imported_file = @import("introducing_zig_test.zig");

test {
    // to run nested container tests, either, call `refAllDecls` which will
    // reference all declarations located in the given argument.
    // `@This()` is a builtin function that returns the innermost container it is called from.
    // in this example, the innermost container is this file (implicitly a struct).
    std.testing.refAllDecls(@This());

    // or, reference each container individually from a top-level test declaration.
    // The `_ = C;` syntax is a no-op reference to the idnetifier `C`.
    _ = S;
    _ = U;
    _ = @import("introducing_zig_test.zig");
    std.time.sleep(1000 * std.time.ns_per_ms);
}

const S = struct {
    test "S demo test" {
        try expect(true);
    }
    const SE = enum {
        V,

        test "This Test won't Run" {
            try expect(false);
        }
    };
};

const U = union {
    s: US,

    const US = struct {
        test "U.US demo test" {
            try expect(true);
        }
    };

    test "U demo test" {
        try expect(true);
    }
};
