%define NEWLINE 0x0a
%define DOUBLEQUOTES 0x22

%macro quine 0

        section .rodata
format: db      "%%define NEWLINE 0x0a%2$c%%define DOUBLEQUOTES 0x22%2$c%2$c%%macro quine 0%2$c%2$c        section .rodata%2$cformat: db      %3$c%1$s%3$c, 0%2$ctarget: db      %3$cGrace_kid.s%3$c, 0%2$c%2$c        section .text%2$c%2$c        global main%2$c        default rel%2$c        extern dprintf%2$c%2$cmain:%2$c        push    rbp%2$c        mov     rbp, rsp%2$c%2$c        mov     rax, 0x2%2$c        lea     rdi, [rel target]%2$c        mov     rsi, 0x241 ; O_WRONLY | O_TRUNC | O_CREAT%2$c        mov     rdx, 0q644%2$c        syscall%2$c%2$c        mov     rdi, rax%2$c        lea     rsi, [rel format]%2$c        lea     rdx, [rel format]%2$c        mov     rcx, NEWLINE%2$c        mov     r8, DOUBLEQUOTES%2$c        call    dprintf wrt ..plt%2$c%2$c        mov     rsp, rbp%2$c        pop     rbp%2$c        ret%2$c%2$c%%endmacro%2$c%2$cquine%2$c", 0
target: db      "Grace_kid.s", 0

        section .text

        global main
        default rel
        extern dprintf

main:
        push    rbp
        mov     rbp, rsp

        mov     rax, 0x2
        lea     rdi, [rel target]
        mov     rsi, 0x241 ; O_WRONLY | O_TRUNC | O_CREAT
        mov     rdx, 0q644
        syscall

        mov     rdi, rax
        lea     rsi, [rel format]
        lea     rdx, [rel format]
        mov     rcx, NEWLINE
        mov     r8, DOUBLEQUOTES
        call    dprintf wrt ..plt

        mov     rsp, rbp
        pop     rbp
        ret

%endmacro

quine
