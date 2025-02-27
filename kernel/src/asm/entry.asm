[BITS 64]

extern kernel_main
extern init_global_constructors

section .text
global _start

_start:
    mov rsp, stack_top

    cld

    call init_global_constructors
    call kernel_main

    cli
.hang:
    hlt
    jmp .hang

section .bss
align 16
stack_bottom:
    resb 65536
stack_top: