
Input file: test.o, output file: test.asm
Converting from ELF64 to Disassembly64

  0 Debug sections removed
  0 Exception sections removed
; Disassembly of file: test.o
; Sat May 26 19:17:50 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 80186, x64

default rel

global main

extern malloc                                           ; near


SECTION .text   align=1                                 ; section number 1, code

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 64                                 ; 0004 _ 48: 83. EC, 40
        mov     dword [rbp-34H], 1                      ; 0008 _ C7. 45, CC, 00000001
        mov     dword [rbp-30H], 2                      ; 000F _ C7. 45, D0, 00000002
        mov     dword [rbp-2CH], 3                      ; 0016 _ C7. 45, D4, 00000003
        mov     dword [rbp-28H], 4                      ; 001D _ C7. 45, D8, 00000004
        mov     dword [rbp-24H], 5                      ; 0024 _ C7. 45, DC, 00000005
        mov     dword [rbp-20H], 6                      ; 002B _ C7. 45, E0, 00000006
        mov     dword [rbp-1CH], 7                      ; 0032 _ C7. 45, E4, 00000007
        mov     dword [rbp-18H], 8                      ; 0039 _ C7. 45, E8, 00000008
        mov     eax, dword [rbp-30H]                    ; 0040 _ 8B. 45, D0
        mov     edx, dword [rbp-34H]                    ; 0043 _ 8B. 55, CC
        add     eax, edx                                ; 0046 _ 01. D0
        mov     dword [rbp-14H], eax                    ; 0048 _ 89. 45, EC
        mov     eax, dword [rbp-14H]                    ; 004B _ 8B. 45, EC
        imul    eax, dword [rbp-2CH]                    ; 004E _ 0F AF. 45, D4
        mov     dword [rbp-10H], eax                    ; 0052 _ 89. 45, F0
        mov     eax, dword [rbp-10H]                    ; 0055 _ 8B. 45, F0
        mov     edx, dword [rbp-14H]                    ; 0058 _ 8B. 55, EC
        add     edx, eax                                ; 005B _ 01. C2
        mov     eax, dword [rbp-28H]                    ; 005D _ 8B. 45, D8
        add     edx, eax                                ; 0060 _ 01. C2
        mov     eax, dword [rbp-24H]                    ; 0062 _ 8B. 45, DC
        add     edx, eax                                ; 0065 _ 01. C2
        mov     eax, dword [rbp-20H]                    ; 0067 _ 8B. 45, E0
        add     edx, eax                                ; 006A _ 01. C2
        mov     eax, dword [rbp-1CH]                    ; 006C _ 8B. 45, E4
        add     edx, eax                                ; 006F _ 01. C2
        mov     eax, dword [rbp-18H]                    ; 0071 _ 8B. 45, E8
        add     eax, edx                                ; 0074 _ 01. D0
        mov     dword [rbp-0CH], eax                    ; 0076 _ 89. 45, F4
        mov     eax, dword [rbp-0CH]                    ; 0079 _ 8B. 45, F4
        cdqe                                            ; 007C _ 48: 98
        shl     rax, 2                                  ; 007E _ 48: C1. E0, 02
        mov     rdi, rax                                ; 0082 _ 48: 89. C7
        call    malloc                                  ; 0085 _ E8, 00000000(rel)
        mov     qword [rbp-8H], rax                     ; 008A _ 48: 89. 45, F8
        mov     eax, 0                                  ; 008E _ B8, 00000000
        leave                                           ; 0093 _ C9
        ret                                             ; 0094 _ C3
; main End of function


SECTION .data   align=1                                 ; section number 2, data


SECTION .bss    align=1                                 ; section number 3, bss


