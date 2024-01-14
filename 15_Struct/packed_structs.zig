const std = @import("std");
const native_endian = @import("builtin").target.cpu.arch.endian();
const expect = std.testing.expect;
const print  = std.debug.print;

const Full = packed struct {
    number: u16,
};
const Divided = packed struct {
    half1: u8,
    quarter3: u4,
    quarter4: u4,
};

test "@bitCast between packed structs" {
    print("\n", .{});
    try doTheTest();
    //comptime try doTheTest();
}

fn doTheTest() !void {
    try expect(@sizeOf(Full) == 2);
    //try expect()
    //print("{}",.{@sizeOf(Full)});
    try expect(@sizeOf(Divided) == 2);
    var full = Full{ .number = 0x1234};
    var divided = @bitCast(Divided, full);
    print("native_endian:{}\n", .{native_endian});
    switch (native_endian) {
        .Big => {
            print(".Big: {}\n", .{divided});
            try expect(divided.half1 == 0x12);
            try expect(divided.quarter3 == 0x3);
            try expect(divided.quarter4 == 0x4);
        },
        .Little => {
            print("Little: {x}\n", .{divided});
            try expect(divided.half1 == 0x34);
            try expect(divided.quarter3 == 0x2);
            try expect(divided.quarter4 == 0x1);
        },
    }

}