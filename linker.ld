 MEMORY
 {
     RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128M
 }
 
 SECTIONS
 {
     . = 0x80000000;
     
     .text : {
         *(.text.init)
         *(.text .text.*)
     } > RAM
     
     .rodata : {
         *(.rodata .rodata.*)
     } > RAM
     
     .data : {
         *(.data .data.*)
     } > RAM
     
     .bss : {
         _bss_start = .;
         *(.bss .bss.*)
         *(COMMON)
         _bss_end = .;
     } > RAM
     
     . = ALIGN(16);
     _stack_bottom = .;
     . = . + 0x10000;  /* 64KB stack */
     _stack_top = .;
}