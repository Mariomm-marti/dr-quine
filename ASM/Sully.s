        section .bss
tmpptr: resq    1

        section .data
i:      dd      5

        section .rodata
quine:  db      "        section .bss%2$ctmpptr: resq    1%2$c%2$c        section .data%2$ci:      dd      %1$d%2$c%2$c        section .rodata%2$cquine:  db      %3$c%4$s%3$c, 0%2$cfilefmt:db      %3$cSully_%%d.s%3$c, 0%2$ccompfmt:db      %3$cnasm -f elf64 -D DECREASE Sully_%%1$d.s ; cc -Wall -Werror -Wextra -Wpedantic -z noexecstack Sully_%%1$d.o -o Sully_%%1$d ; ./Sully_%%1$d%3$c, 0%2$c%2$c        section .text%2$c%2$c        global main%2$c        default rel%2$c        extern free%2$c        extern asprintf%2$c        extern dprintf%2$c        extern system%2$c%2$cmain:%2$c        ; Setup stack%2$c        push    rbp%2$c        mov     rbp, rsp%2$c%2$c        ; Check what value 'i' will have during this execution%2$c        lea     rdi, [rel i]%2$c%%ifdef  DECREASE%2$c        dec     dword [rdi]%2$c%%endif%2$c        cmp     dword [rdi], 0%2$c        jl      finish%2$c%2$c        ; Format the string with the file name%2$c        lea     rdi, [rel tmpptr]%2$c        lea     rsi, [rel filefmt]%2$c        mov     rdx, [rel i]%2$c        call    asprintf wrt ..plt%2$c        cmp     rax, 0%2$c        jl      finish%2$c%2$c        ; Open the new file%2$c        mov     rax, 0x2%2$c        mov     rdi, [rel tmpptr]%2$c        mov     rsi, 0x241 ; O_WRONLY | O_TRUNC | O_CREAT%2$c        mov     rdx, 0q644%2$c        syscall%2$c        cmp     eax, 0%2$c        jl      finish%2$c        mov     r15d, eax%2$c%2$c        ; Free the file name format%2$c        mov     rdi, [rel tmpptr]%2$c        call    free wrt ..plt%2$c        cmp     rax, 0%2$c        jl      finish%2$c%2$c        ; Write the quine contents into tmpptr%2$c        ; Top of the stack has fd%2$c        mov     edi, r15d%2$c        lea     rsi, [rel quine]%2$c        mov     rdx, [rel i]%2$c        mov     rcx, 0x0a%2$c        mov     r8, 0x22%2$c        lea     r9, [rel quine]%2$c        call    dprintf wrt ..plt%2$c        cmp     rax, 0%2$c        jl      finish%2$c%2$c        ; Close the file descriptor as its not longer needed%2$c        mov     rax, 0x3%2$c        mov     edi, r15d%2$c        syscall%2$c        cmp     rax, 0%2$c        jl      finish%2$c%2$c        ; Format the compiling format string%2$c        lea     rdi, [rel tmpptr]%2$c        lea     rsi, [rel compfmt]%2$c        mov     rdx, [rel i]%2$c        call    asprintf wrt ..plt%2$c        cmp     rax, 0%2$c        jl      finish%2$c%2$c        ; Execute the next compiling and binary%2$c        mov     rdi, [rel tmpptr]%2$c        call    system wrt ..plt%2$c%2$c        ; Free the compiling format string%2$c        mov     rdi, [rel tmpptr]%2$c        call    free wrt ..plt%2$c%2$cfinish:%2$c        ; Return base pointer to previous function and discard stack%2$c        mov     rsp, rbp%2$c        pop     rbp%2$c        ret%2$c", 0
filefmt:db      "Sully_%d.s", 0
compfmt:db      "nasm -f elf64 -D DECREASE Sully_%1$d.s ; cc -Wall -Werror -Wextra -Wpedantic -z noexecstack Sully_%1$d.o -o Sully_%1$d ; ./Sully_%1$d", 0

        section .text

        global main
        default rel
        extern free
        extern asprintf
        extern dprintf
        extern system

main:
        ; Setup stack
        push    rbp
        mov     rbp, rsp

        ; Check what value 'i' will have during this execution
        lea     rdi, [rel i]
%ifdef  DECREASE
        dec     dword [rdi]
%endif
        cmp     dword [rdi], 0
        jl      finish

        ; Format the string with the file name
        lea     rdi, [rel tmpptr]
        lea     rsi, [rel filefmt]
        mov     rdx, [rel i]
        call    asprintf wrt ..plt
        cmp     rax, 0
        jl      finish

        ; Open the new file
        mov     rax, 0x2
        mov     rdi, [rel tmpptr]
        mov     rsi, 0x241 ; O_WRONLY | O_TRUNC | O_CREAT
        mov     rdx, 0q644
        syscall
        cmp     eax, 0
        jl      finish
        mov     r15d, eax

        ; Free the file name format
        mov     rdi, [rel tmpptr]
        call    free wrt ..plt
        cmp     rax, 0
        jl      finish

        ; Write the quine contents into tmpptr
        ; Top of the stack has fd
        mov     edi, r15d
        lea     rsi, [rel quine]
        mov     rdx, [rel i]
        mov     rcx, 0x0a
        mov     r8, 0x22
        lea     r9, [rel quine]
        call    dprintf wrt ..plt
        cmp     rax, 0
        jl      finish

        ; Close the file descriptor as its not longer needed
        mov     rax, 0x3
        mov     edi, r15d
        syscall
        cmp     rax, 0
        jl      finish

        ; Format the compiling format string
        lea     rdi, [rel tmpptr]
        lea     rsi, [rel compfmt]
        mov     rdx, [rel i]
        call    asprintf wrt ..plt
        cmp     rax, 0
        jl      finish

        ; Execute the next compiling and binary
        mov     rdi, [rel tmpptr]
        call    system wrt ..plt

        ; Free the compiling format string
        mov     rdi, [rel tmpptr]
        call    free wrt ..plt

finish:
        ; Return base pointer to previous function and discard stack
        mov     rsp, rbp
        pop     rbp
        ret
