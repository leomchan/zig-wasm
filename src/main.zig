const std = @import("std");
const testing = std.testing;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

/// Returns a null-terminated string containing "hello".
export fn hello() [*:0]const u8 {
    return "hello";
}

/// Return the given input string
export fn echo(s: [*:0]const u8) [*:0]const u8 {
    return s;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

test "hello" {
    const h = hello();
    try testing.expect(std.mem.len(h) == 5);
    try testing.expect(std.mem.eql(u8, h[0..5], "hello"));
}

test "echo" {
    const e = echo("goodbye");
    try testing.expect(std.mem.len(e) == 7);
    try testing.expect(std.mem.eql(u8, e[0..7], "goodbye"));
}
