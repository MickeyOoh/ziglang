const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;

// defer will execute an expression at the end of the current scope.
fn deferExample() !usize {
    var a: usize = 1;

    {
        defer a = 2;
        a = 1;
    }
    try expect(a == 2);

    a = 5;
    return a;
}

test "defer basics" {
    try expect((try deferExample()) == 5);
}

// If multiple defer statements are specified, they will be executed in
// the reverse order they were run.
fn deferUnwindExample() void {
    print("\n", .{});

    defer {
        print("1 \n", .{});
    }
    defer {
        print("2 \n", .{});
    }
    if (false) {
        // defers are not run if they are never executed.
        defer {
            print("3 \n", .{});
        }
    }
}

test "defer unwinding" {
    print("\ndefer unwinding test\n", .{});
    deferUnwindExample();
}

// The errdefer keyword is similar to defer, but will only execute if the
// scope returns with an error.
//
// This is especially useful in allowing a function to clean up properly
// on error, and replaces goto error handling tactics as seen in c.
fn deferErrorExample(is_error: bool) !void {
    print("\nstart of function\n", .{});

    // This will always be executed on exit
    defer {
        print("end of function\n", .{});
    }

    errdefer {
        print("encountered an error!\n", .{});
    }

    if (is_error) {
        return error.DeferError;
    }
}

test "errdefer unwinding" {
    deferErrorExample(false) catch {};
    deferErrorExample(true) catch {};
}
