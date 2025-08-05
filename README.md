# bare-metal-zig

This project builds a bare-metal binary using Zig and assembly.

## Building

To build the binary, simply run `make`:

```bash
make
```

This will compile `main.zig` and `startup.S` into an executable named `kernel`.

If you don't have `zig` on your `PATH`, you can specify the full path to your `zig` binary like this:

```
make ZIG=/tmp/zig/zig-x86_64-linux-0.15.0-dev.1283+1fcaf90dd/zig
```

## Running

You can run the compiled binary using QEMU:

```bash
qemu-system-riscv64 -machine virt -nographic -bios none -kernel kernel
```