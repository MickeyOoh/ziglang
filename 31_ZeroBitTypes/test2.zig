const Empty = struct {};

test "@ptrToInt for pointer to zero bit type" {
    var a = Empty{};
    _ = @ptrToInt(&a);
}

test "@intToPtr for pointer to zero bit type" {
    _ = @intToPtr(*Empty, 0x1);
}
