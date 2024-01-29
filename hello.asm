         global _main

         section .text
_main:   mov     rax, 0x02000004 ; system call for write
         mov     rdi, 1          ; file handle 1 is stdout
         mov     rsi, message    ; address of string to output
         mov     rdx, 13         ; number of bytes
         syscall
         mov     rax, 0x02000001 ; system call for exit
         xor     rdi, rdi        ; exit code 0
         syscall

         section .data ; stores variables, etc. - stuff we want in memory during the runtime of the program
message: db      "Hello, World", 10
