const std = @import("std");
const expect = std.testing.expect;
const print  = std.debug.print;

test "fully annoymous list literal" {
    try dump(.{ @as(u32, 1234), @as(f64, 12.34), true, "hi"});
}

fn dump(args: anytype) !void {
    print("\nargs: {}", .{args});
    print("args.@\"0\":{}\n", .{args.@"0"});
    print("args.@\"1\":{}\n", .{args.@"1"});
    print("args.@\"2\":{}\n", .{args.@"2"});
    print("args.@\"3\"[0]:{c}\n", .{args.@"3"[0]});
    print("args.@\"3\"[1]:{c}\n", .{args.@"3"[1]});


    try expect(args.@"0" == 1234);

}