ZIG ?= zig

.PHONY: all clean

all: kernel

kernel: main.zig startup.S linker.ld
	$(ZIG) build-exe main.zig startup.S -mcmodel=medium \
		-target riscv64-freestanding-none \
		-O ReleaseSmall \
		-T linker.ld \
		--name kernel

clean:
	rm -f kernel
