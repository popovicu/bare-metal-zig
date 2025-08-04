# bare-metal-zig

This project builds a bare-metal binary using Zig and assembly.

## Building

To build the binary, simply run `make`:

```bash
make
```

This will compile `main.zig` and `startup.S` into an executable named `kernel`.

## Running

You can run the compiled binary using QEMU:

```bash
qemu-system-riscv64 -machine virt -nographic -bios none -kernel kernel
```