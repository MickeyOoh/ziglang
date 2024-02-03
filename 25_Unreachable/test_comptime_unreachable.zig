const assert = @import("std").debug.assert;

test "type of unreachable" {
    comptime {
        // The type of unreahable is noreturn.

        // However this assertion will still fail to compile because
        // unreachable expressions are compile erros.

        assert(@TypeOf(unreachable) == noreturn);
    }
}
