// const FileOpenError = error {
//     AccessDenied,
//     OutOfMemory,
//     FileNotFound,
// };

// const AllocationError = error {
//     OutOfMemory,
// };

// test "coerce superset to subset" {
//     foo(FileOpenError.OutOfMemory) catch {};
// }

// fn foo(err: FileOpenError) AllocationError {
//     return err;
// }

const parseU64 = @import("error_union_parsing_u64.zig").parseU64;

fn doAThing(str: []u8) void {
    const number = parseU64(str, 10) catch |err| return err;
    _ = number; // ...
}