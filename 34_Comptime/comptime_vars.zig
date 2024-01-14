const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

const CmdFn = struct {
    name: []const u8,
    func: fn(i32) i32,
};

const cmd_fns = [_]CmdFn{
    CmdFn {.name = "one", .func = one},
    CmdFn {.name = "two", .func = two},
    CmdFn {.name = "three", .func = three},
};
fn one(value: i32) i32 { return value + 1; }
fn two(value: i32) i32 { return value + 2; }
fn three(value: i32) i32 { return value + 3; }

fn performFn(comptime prefix_char: u8, start_value: i32) i32 {
    var result: i32 = start_value;
    print("input:{}\n", .{result});
    comptime var i = 0;
    inline while (i < cmd_fns.len) : (i += 1) {
        if (cmd_fns[i].name[0] == prefix_char) {
            print("{s}({d})", .{cmd_fns[i].name, result});
            result = cmd_fns[i].func(result);
            print("-> {}\n", .{result});
        }
    }
    print("result:{}\n", .{result});
    return result;
}

test "perform fn" {
    print("\n", .{});
    // for(cmd_fns) |fns, i|{
    //     print("cmd_fns({}): name:{s} ->fns:{}\n", .{i, fns.name, fns.func});
    // }
    try expect(performFn('t', 1) == 6);
    try expect(performFn('o', 0) == 1);
    try expect(performFn('w', 99) == 99);
}
