global _start

section .data
nl db 0x0A 

section .text
_start:

    mov rsi, [rsp+16]
    test rsi, rsi
    jz no_arg


    xor rcx, rcx
.len:
    cmp byte [rsi+rcx], 0
    je .have_len
    inc rcx
    jmp .len
.have_len:


    mov rax, 1
    mov rdi, 1
    mov rdx, rcx
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, nl
    mov rdx, 1
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall

no_arg:
    mov rax, 60
    mov rdi, 1
    syscall
