; Colleen!
        section .rodata
format: db      "; Colleen!%2$c        section .rodata%2$cformat: db      %3$c%1$s%3$c, 0%2$c%2$c        section .text%2$c%2$c        global main%2$c        default rel%2$c        extern printf%2$c%2$cmain:%2$c        ; :)%2$c        push   rbp%2$c        mov    rbp, rsp%2$c%2$c        lea    rdi, [rel format]%2$c        lea    rsi, [rel format]%2$c        mov    rdx, 0x0a%2$c        mov    rcx, 0x22%2$c%2$c        call   printf wrt ..plt%2$c        call   hello%2$c%2$c        mov    rsp, rbp%2$c        pop    rbp%2$c        ret%2$c%2$chello:%2$c        ret%2$c", 0

        section .text

        global main
        default rel
        extern printf

main:
        ; :)
        push   rbp
        mov    rbp, rsp

        lea    rdi, [rel format]
        lea    rsi, [rel format]
        mov    rdx, 0x0a
        mov    rcx, 0x22

        call   printf wrt ..plt
        call   hello

        mov    rsp, rbp
        pop    rbp
        ret

hello:
        ret
