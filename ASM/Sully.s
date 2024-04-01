        section .bss
tmpptr: resq    1

        section .data
i:      dd      5

        section .rodata
quine:  db      "        section .bss%3$ctmpptr: resq    1%3$c%3$c        section .data%3$ci:      dd      %2$d%3$c%3$c        section .rodata%3$cquine:  db      %4$c%1$s%4$c, 0%3$cfilefmt:db      %4$cSully_%%d.s%4$c, 0%3$ccompfmt:db      %4$cnasm -f elf64 -D DECREASE Sully_%%1$d.s ; cc -Wall -Werror -Wextra -Wpedantic -z noexecstack Sully_%%1$d.o -o Sully_%%1$d ; ./Sully_%%1$d%4$c, 0%3$c%3$c        section .text%3$c%3$c        global main%3$c        default rel%3$c        extern free%3$c        extern asprintf%3$c        extern dprintf%3$c        extern system%3$c%3$cmain:%3$c        ; Setup stack%3$c        push    rbp%3$c        mov     rbp, rsp%3$c%3$c        ; Check what value 'i' will have during this execution%3$c        lea     rdi, [rel i]%3$c%%ifdef  DECREASE%3$c        dec     dword [rdi]%3$c%%endif%3$c        cmp     dword [rdi], 0%3$c        jl      finish%3$c%3$c        ; Format the string with the file name%3$c        lea     rdi, [rel tmpptr]%3$c        lea     rsi, [rel filefmt]%3$c        mov     rdx, [rel i]%3$c        call    asprintf wrt ..plt%3$c        cmp     rax, 0%3$c        jl      finish%3$c%3$c        ; Open the new file%3$c        mov     rax, 0x2%3$c        mov     rdi, [rel tmpptr]%3$c        mov     rsi, 0x241 ; O_WRONLY | O_TRUNC | O_CREAT%3$c        mov     rdx, 0q644%3$c        syscall%3$c        cmp     eax, 0%3$c        jl      finish%3$c        push    rax%3$c%3$c        ; Free the file name format%3$c        mov     rdi, [rel tmpptr]%3$c        call    free wrt ..plt%3$c        cmp     rax, 0%3$c        jl      finish%3$c%3$c        ; Write the quine contents into tmpptr%3$c        ; Top of the stack has fd%3$c        mov     rdi, qword [rsp]%3$c        lea     rsi, [rel quine]%3$c        lea     rdx, [rel quine]%3$c        mov     rcx, [rel i]%3$c        mov     r8, 0x0a%3$c        mov     r9, 0x22%3$c        call    dprintf wrt ..plt%3$c        cmp     rax, 0%3$c        jl      finish%3$c%3$c        ; Close the file descriptor as its not longer needed%3$c        mov     rax, 0x3%3$c        pop     rdi%3$c        syscall%3$c        cmp     rax, 0%3$c        jl      finish%3$c%3$c        ; Format the compiling format string%3$c        lea     rdi, [rel tmpptr]%3$c        lea     rsi, [rel compfmt]%3$c        mov     rdx, [rel i]%3$c        call    asprintf wrt ..plt%3$c        cmp     rax, 0%3$c        jl      finish%3$c%3$c        ; Execute the next compiling and binary%3$c        mov     rdi, [rel tmpptr]%3$c        call    system wrt ..plt%3$c%3$c        ; Free the compiling format string%3$c        mov     rdi, [rel tmpptr]%3$c        call    free wrt ..plt%3$c%3$cfinish:%3$c        ; Return base pointer to previous function and discard stack%3$c        mov     rsp, rbp%3$c        pop     rbp%3$c        ret%3$c", 0
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
        push    rax

        ; Free the file name format
        mov     rdi, [rel tmpptr]
        call    free wrt ..plt
        cmp     rax, 0
        jl      finish

        ; Write the quine contents into tmpptr
        ; Top of the stack has fd
        mov     rdi, qword [rsp]
        lea     rsi, [rel quine]
        lea     rdx, [rel quine]
        mov     rcx, [rel i]
        mov     r8, 0x0a
        mov     r9, 0x22
        call    dprintf wrt ..plt
        cmp     rax, 0
        jl      finish

        ; Close the file descriptor as its not longer needed
        mov     rax, 0x3
        pop     rdi
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
