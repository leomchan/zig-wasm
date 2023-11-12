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
