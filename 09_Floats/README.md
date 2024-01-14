Floating Point Operations
-----
By default floating point operations use `Strict` mode, but you can switch to `Otimized` mode on a per-block basis:
```
const std = @import("std");
const big = @as(f64, 1 << 40);
export fn foo_strict(x: f64) f64 {
    return x + big - big;
}
export fn foo_optimized(x: f64) f64 {
    @setFloatMode(.Optimized);
    return x + big - big;
}
```

```
$ zig build-obj foo.zig -O ReleaseFast
```

For this test we have to separate code into two object files - otherwise the optimizer figures out all the values at compile-time, which operates in strict mode.

```
const print = @import("std").debug.print;
extern fn foo_strict(x: f64) f64;
extern fn foo_optimized(x: f64) f64;
pub fn main() void {
    const x = 0.001;
    print("optimized = {}\n", .{foo_optimized(x)});
    print("strict = {}\n", .{foo_strict(x)});
}
```

```
$ zig build-exe float_mode.zig foo.o

$ ./float_mode
optimized = 1.0e-03
strict = 9.765625e-04
```


