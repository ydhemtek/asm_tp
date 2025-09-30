global _start

section .bss
buffer resb 32

section .text
_start:


    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 32
    syscall 


    movzx rbx, byte [buffer]

    cmp rbx, '0'
    jl not_number
    cmp rbx, '9'
    jg not_number
    

    sub rbx, '0'


    test rbx, 1
    jz is_even
    jmp is_odd

is_even:
    mov rax, 60
    xor rdi, rdi
    syscall

is_odd:
    mov rax, 60
    mov rdi, 1
    syscall

not_number:
    mov rax, 60
    mov rdi, 2
    syscall