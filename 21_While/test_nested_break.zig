// Labeled while 
// When a while loop is labeled, it can be referenced from a break or continue from within a nested loop:
const print = @import("std").debug.print;

test "nested break" {
    print("\nnested break start\n",.{});
    outer: while (true) {
        print("1 ->", .{});
        while (true) {
            print("2 ->",.{});
            break :outer;   // this means "break outer: while() loop"
        }
    }
    print("end\n", .{});
}

test "nested continue" {
    var i: usize = 0;
    outer: while (i < 10) : (i += 1) {
        while (true) {
            continue :outer;
        }
    }
}