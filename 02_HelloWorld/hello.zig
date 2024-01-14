const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("unistd.h");
});

const EOF: u8 = 0;
const BS: u8 = 0x08;
const CR: u8 = '\n';
const LF: u8 = '\r';

pub fn main() !void {
    var ch: u8 = 0;
    try stdout.print("Hello, {s}!\n", .{"world"});
    try stdout.writeByte('X');
    while (true) {
        ch = try smoni();
        if (ch == 'q') {
            break;
        }
        _ = c.sleep(1);
    }
}

pub fn smoni() !u8 {
    var ch: u8 = 0;
    ch = try stdin.readByte();
    if (ch == 0) {
        try stdout.writeByte('x');
        return 0;
    } else {
        try stdout.writeByte(ch);
        return ch;
    }
}
