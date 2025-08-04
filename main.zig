const std = @import("std");

// UART MMIO address
const UART_BASE: usize = 0x10000000;
const UART_TX: *volatile u8 = @ptrFromInt(UART_BASE);

// Entry point - called from assembly startup code
export fn kmain() noreturn {
    const message = "Hello world!\n";

    // Print the message
    for (message) |char| {
        putchar(char);
    }

    // Halt the CPU
    while (true) {
        asm volatile ("wfi");
    }
}

fn putchar(c: u8) void {
    UART_TX.* = c;
}

// Panic handler for runtime errors
pub fn panic(msg: []const u8, _: ?*std.builtin.StackTrace, _: ?usize) noreturn {
    // In bare metal, we can't do much - just print the panic message
    const panic_msg = "PANIC: ";
    for (panic_msg) |c| {
        putchar(c);
    }
    for (msg) |c| {
        putchar(c);
    }
    putchar('\n');

    // Halt
    while (true) {
        asm volatile ("wfi");
    }
}
