const std = @import("std");
const testing = std.testing;
const lib = @import("main.zig");

test "basic add functionality" {
    try testing.expect(lib.add(3, 7) == 10);
}

test "hello" {
    const h = lib.hello();
    try testing.expect(std.mem.len(h) == 5);
    try testing.expect(std.mem.eql(u8, h[0..5], "hello"));
}

test "echo" {
    const e = lib.echo("goodbye");
    try testing.expect(std.mem.len(e) == 7);
    try testing.expect(std.mem.eql(u8, e[0..5], "goodbye"));
}
