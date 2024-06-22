const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const args = try std.process.argsAlloc(std.heap.page_allocator);
    defer std.process.argsFree(std.heap.page_allocator, args);

    if (args.len < 2) return error.ExpectedArgument;
    if (std.mem.eql(u8, args[1], "c2f")) {
        const c = try std.fmt.parseFloat(f32, args[2]);
        const f = (c * (9.0 / 5.0)) + 32;

        try stdout.print("{d:.2} F\n", .{f});
    } else if (std.mem.eql(u8, args[1], "f2c")) {
        const f = try std.fmt.parseFloat(f32, args[2]);
        const c = (f - 32) * (5.0 / 9.0);
        try stdout.print("{d:.2} C\n", .{c});
    } else {
        try stdout.print("Not C out", .{});
    }
}
