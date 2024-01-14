const std = @import("std");

const hello_world_in_c =
    \\#include <stdio.h>
    \\
    \\int main(int argc, char **argv) {
    \\      printf("hello world\n");
    \\      return 0;
    \\}
;

test "string of comments" {
    std.debug.print("\nhello_world_in_c: {s}\n", .{hello_world_in_c});
}
