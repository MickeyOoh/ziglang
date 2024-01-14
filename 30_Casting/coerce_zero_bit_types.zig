const print = @import("std").debug.print;

test "coercion of zero bit types" {
    var x: void = {};
    var y: *void = x;
    _ = y;
    print("\nx:{}\n", .{ x });
    //print("y:{d}\n", .{ y });
}
