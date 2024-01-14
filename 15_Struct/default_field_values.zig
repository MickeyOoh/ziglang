const print = @import("std").debug.print;

const Foo = struct {
    a: i32 = 1234,
    b: i32,
};

test "default struct initialization fields" {
    const f = Foo{.b = 0,};
    print("\nf: {}\n", .{f});
    const x = Foo{
        .b = 5,
    };
    if (x.a + x.b != 1239) {
        @compileError("it's even comptime known!");
    }
    print("x: {}\n", .{x});
}