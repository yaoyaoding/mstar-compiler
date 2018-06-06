





default rel

global __hasValue
global __getValue
global __setValue
global __print
global __println
global __getString
global __getInt
global __toString
global __string_length
global __string_substring
global __string_parseInt
global __string_ord
global __stringConcate
global __stringCompare
global __value
global __has
global __real_addr
global main

extern strcmp
extern __sprintf_chk
extern memcpy
extern malloc
extern __isoc99_scanf
extern puts
extern __printf_chk


SECTION .text   6

__hasValue:
        mov     rax, rdi
        mov     rdx, qword 1323E34A2B10BF67H
        imul    rdx
        mov     rax, rdi
        sar     rax, 63
        sar     rdx, 3
        sub     rdx, rax
        mov     eax, 107
        imul    rdx, rax
        mov     rax, rdi
        sub     rax, rdx
        mov     rdx, rax
        xor     eax, eax

        cmp     qword [abs __real_addr+rdx*8], rdi
        jz      L_002
L_001:

        ret





ALIGN   8
L_002:  cmp     rsi, 209
        ja      L_001
        imul    rdx, rdx, 210
        add     rsi, rdx

        mov     rax, qword [abs __has+rsi*8]
        ret






ALIGN   8

__getValue:
        mov     rax, rdi
        mov     rdx, qword 1323E34A2B10BF67H
        imul    rdx
        mov     rax, rdi
        sar     rax, 63
        sar     rdx, 3
        sub     rdx, rax
        mov     eax, 107
        imul    rdx, rax
        sub     rdi, rdx
        imul    rdi, rdi, 210
        add     rsi, rdi

        mov     rax, qword [abs __value+rsi*8]
        ret






ALIGN   8

__setValue:
        cmp     rsi, 209
        mov     r9, rdx
        ja      L_008
        mov     r8, qword 1323E34A2B10BF67H
        mov     rax, rdi
        mov     r10d, 107
        imul    r8
        mov     rax, rdi
        sar     rax, 63
        mov     r8, rdx
        sar     r8, 3
        sub     r8, rax
        mov     rax, rdi
        imul    r8, r10
        sub     rax, r8
        mov     r8, rax

        mov     rax, qword [abs __real_addr+rax*8]
        cmp     rax, rdi
        jz      L_007
        test    rax, rax
        je      L_012
        imul    rax, r8, 1680
        mov     edx, 1680

        lea     rdi, [abs __has+rax]
        test    dil, 01H
        jne     L_013
L_003:  test    dil, 02H
        jne     L_014
L_004:  test    dil, 04H
        jne     L_015
L_005:  mov     ecx, edx
        xor     eax, eax
        shr     ecx, 3
        test    dl, 04H
        rep stosq
        jnz     L_011
        test    dl, 02H
        jnz     L_010
L_006:  and     edx, 01H
        jnz     L_009




ALIGN   8
L_007:  mov     rax, r9
        imul    r8, r8, 210
        add     rsi, r8

        mov     qword [abs __has+rsi*8], 1

        mov     qword [abs __value+rsi*8], r9
        ret





ALIGN   8
L_008:

        ret





ALIGN   8
L_009:  mov     byte [rdi], 0
        jmp     L_007





ALIGN   8
L_010:  xor     eax, eax
        add     rdi, 2
        mov     word [rdi-2H], ax
        and     edx, 01H
        jz      L_007
        jmp     L_009





ALIGN   8
L_011:  mov     dword [rdi], 0
        add     rdi, 4
        test    dl, 02H
        jz      L_006
        jmp     L_010





ALIGN   8
L_012:

        mov     qword [abs __real_addr+r8*8], rdi
        jmp     L_007





ALIGN   8
L_013:

        mov     byte [abs __has+rax], 0
        add     rdi, 1
        mov     dl, -113
        jmp     L_003





ALIGN   8
L_014:  xor     ecx, ecx
        add     rdi, 2
        sub     edx, 2
        mov     word [rdi-2H], cx
        jmp     L_004





ALIGN   8
L_015:  mov     dword [rdi], 0
        sub     edx, 4
        add     rdi, 4
        jmp     L_005







ALIGN   16

__print:
        lea     rdx, [rdi+8H]
        mov     esi, L_032
        mov     edi, 1
        xor     eax, eax
        jmp     __printf_chk







ALIGN   16

__println:
        add     rdi, 8
        jmp     puts






ALIGN   8

__getString:
        push    rbp
        mov     esi, __buffer.3442
        mov     edi, L_032
        xor     eax, eax
        push    rbx
        mov     ebx, __buffer.3442
        sub     rsp, 8
        call    __isoc99_scanf
L_016:  mov     edx, dword [rbx]
        add     rbx, 4
        lea     eax, [rdx-1010101H]
        not     edx
        and     eax, edx
        and     eax, 80808080H
        jz      L_016
        mov     edx, eax
        shr     edx, 16
        test    eax, 8080H
        cmove   eax, edx
        lea     rdx, [rbx+2H]
        cmove   rbx, rdx
        add     al, al
        sbb     rbx, 3
        sub     rbx, __buffer.3442
        lea     edi, [rbx+8H]
        movsxd  rdi, edi
        call    malloc
        mov     rbp, rax
        lea     rdx, [rbx+1H]
        movsxd  rax, ebx
        lea     rdi, [rbp+8H]
        mov     qword [rbp], rax
        mov     esi, __buffer.3442
        call    memcpy
        add     rsp, 8
        mov     rax, rbp
        pop     rbx
        pop     rbp
        ret







ALIGN   16

__getInt:
        sub     rsp, 24
        mov     edi, L_033
        xor     eax, eax
        lea     rsi, [rsp+8H]
        call    __isoc99_scanf
        mov     rax, qword [rsp+8H]
        add     rsp, 24
        ret


        nop

ALIGN   16
__toString:
        push    rbp
        mov     rbp, rdi
        mov     edi, 32
        push    rbx
        sub     rsp, 8
        call    malloc
        lea     rdi, [rax+8H]
        mov     rbx, rax
        mov     r8, rbp
        mov     ecx, L_033
        mov     edx, 24
        mov     esi, 1
        xor     eax, eax
        call    __sprintf_chk
        cdqe
        mov     qword [rbx], rax
        add     rsp, 8
        mov     rax, rbx
        pop     rbx
        pop     rbp
        ret







ALIGN   16

__string_length:
        mov     rax, qword [rdi]
        ret







ALIGN   16

__string_substring:
        push    r15
        push    r14
        push    r13
        movsxd  r13, esi
        push    r12
        mov     r12d, edx
        sub     r12d, r13d
        push    rbp
        mov     rbp, rdi
        lea     edi, [r12+0AH]
        push    rbx
        lea     ebx, [r12+1H]
        movsxd  rdi, edi
        sub     rsp, 8
        call    malloc
        movsxd  rdx, ebx
        test    ebx, ebx
        mov     qword [rax], rdx
        jle     L_018
        lea     edi, [r13+8H]
        add     r13, rbp
        lea     rcx, [rax+18H]
        lea     rdx, [r13+8H]
        lea     rsi, [r13+18H]
        cmp     rcx, rdx
        lea     rdx, [rax+8H]
        setbe   cl
        cmp     rsi, rdx
        setbe   dl
        or      cl, dl
        je      L_019
        cmp     ebx, 15
        jbe     L_019
        mov     esi, ebx
        xor     edx, edx
        xor     r8d, r8d
        shr     esi, 4
        mov     ecx, esi
        shl     ecx, 4
L_017:  movdqu  xmm0, oword [r13+rdx+8H]
        add     r8d, 1
        movdqu  oword [rax+rdx+8H], xmm0
        add     rdx, 16
        cmp     r8d, esi
        jc      L_017
        cmp     ebx, ecx
        je      L_018
        lea     edx, [rdi+rcx]
        lea     r13d, [rcx+8H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r13d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+1H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r11d, [rcx+9H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r11d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+2H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r10d, [rcx+0AH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r10d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+3H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r9d, [rcx+0BH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r9d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+4H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     r8d, [rcx+0CH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r8d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+5H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        lea     esi, [rcx+0DH]
        movsxd  rdx, edx
        movzx   r14d, byte [rbp+rdx]
        movsxd  rdx, esi
        mov     byte [rax+rdx], r14b
        lea     edx, [rcx+6H]
        cmp     ebx, edx
        jle     L_018
        add     edx, edi
        movsxd  rdx, edx
        movzx   r15d, byte [rbp+rdx]
        lea     edx, [rcx+0EH]
        movsxd  r14, edx
        mov     byte [rax+r14], r15b
        lea     r14d, [rcx+7H]
        cmp     ebx, r14d
        jle     L_018
        add     r14d, edi
        cmp     ebx, r13d
        movsxd  r14, r14d
        movzx   r15d, byte [rbp+r14]
        lea     r14d, [rcx+0FH]
        movsxd  r14, r14d
        mov     byte [rax+r14], r15b
        jle     L_018
        add     r13d, edi
        cmp     ebx, r11d
        movsxd  r13, r13d
        movzx   r14d, byte [rbp+r13]
        lea     r13d, [rcx+10H]
        movsxd  r13, r13d
        mov     byte [rax+r13], r14b
        jle     L_018
        add     r11d, edi
        cmp     ebx, r10d
        movsxd  r11, r11d
        movzx   r13d, byte [rbp+r11]
        lea     r11d, [rcx+11H]
        movsxd  r11, r11d
        mov     byte [rax+r11], r13b
        jle     L_018
        add     r10d, edi
        cmp     ebx, r9d
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        lea     r10d, [rcx+12H]
        movsxd  r10, r10d
        mov     byte [rax+r10], r11b
        jle     L_018
        add     r9d, edi
        cmp     ebx, r8d
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        lea     r9d, [rcx+13H]
        movsxd  r9, r9d
        mov     byte [rax+r9], r10b
        jle     L_018
        add     r8d, edi
        cmp     ebx, esi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        lea     r8d, [rcx+14H]
        movsxd  r8, r8d
        mov     byte [rax+r8], r9b
        jle     L_018
        add     esi, edi
        cmp     ebx, edx
        movsxd  rsi, esi
        movzx   r8d, byte [rbp+rsi]
        lea     esi, [rcx+15H]
        movsxd  rsi, esi
        mov     byte [rax+rsi], r8b
        jle     L_018
        add     edx, edi
        add     ecx, 22
        movsxd  rdx, edx
        movsxd  rcx, ecx
        movzx   edx, byte [rbp+rdx]
        mov     byte [rax+rcx], dl
L_018:  add     r12d, 9
        movsxd  r12, r12d
        mov     byte [rax+r12], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   16
L_019:  movsxd  rdi, edi
        xor     ecx, ecx
        add     rbp, rdi




ALIGN   16
L_020:  movzx   edx, byte [rbp+rcx]
        mov     byte [rax+rcx+8H], dl
        add     rcx, 1
        cmp     ebx, ecx
        jg      L_020
        jmp     L_018







ALIGN   16

__string_parseInt:
        movsx   edx, byte [rdi+8H]
        cmp     dl, 45
        jz      L_024
        lea     rcx, [rdi+8H]
        xor     edi, edi
L_021:  lea     eax, [rdx-30H]
        cmp     al, 9
        mov     eax, 0
        ja      L_023




ALIGN   8
L_022:  sub     edx, 48
        lea     rax, [rax+rax*4]
        add     rcx, 1
        movsxd  rdx, edx
        lea     rax, [rdx+rax*2]
        movsx   edx, byte [rcx]
        lea     esi, [rdx-30H]
        cmp     sil, 9
        jbe     L_022
L_023:  mov     rdx, rax
        neg     rdx
        test    edi, edi
        cmovne  rax, rdx
        ret





ALIGN   8
L_024:  lea     rcx, [rdi+9H]
        movsx   edx, byte [rdi+9H]
        mov     edi, 1
        jmp     L_021


        nop

ALIGN   16
__string_ord:
        movsx   rax, byte [rdi+rsi+8H]
        ret







ALIGN   16

__stringConcate:
        push    r15
        push    r14
        push    r13
        push    r12
        mov     r12, rsi
        push    rbp
        mov     rbp, rdi
        push    rbx
        sub     rsp, 8
        mov     rbx, qword [rdi]
        mov     r13, qword [rsi]
        lea     r14, [rbx+r13]
        lea     rdi, [r14+9H]
        call    malloc
        test    rbx, rbx
        mov     qword [rax], r14
        jle     L_026
        lea     rcx, [rbp+8H]
        lea     rdx, [rax+18H]
        lea     rsi, [rbp+18H]
        cmp     rcx, rdx
        lea     rdx, [rax+8H]
        setae   cl
        cmp     rsi, rdx
        setbe   dl
        or      cl, dl
        je      L_029
        cmp     rbx, 15
        jbe     L_029
        mov     rsi, rbx
        xor     ecx, ecx
        xor     edi, edi
        shr     rsi, 4
        mov     rdx, rsi
        shl     rdx, 4
L_025:  movdqu  xmm0, oword [rbp+rcx+8H]
        add     rdi, 1
        movdqu  oword [rax+rcx+8H], xmm0
        add     rcx, 16
        cmp     rsi, rdi
        ja      L_025
        cmp     rbx, rdx
        je      L_026
        lea     r14d, [rdx+8H]
        movsxd  r14, r14d
        movzx   ecx, byte [rbp+r14]
        mov     byte [rax+r14], cl
        lea     ecx, [rdx+1H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     r10d, [rdx+9H]
        movsxd  rcx, r10d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+2H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     r9d, [rdx+0AH]
        movsxd  rcx, r9d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+3H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     r8d, [rdx+0BH]
        movsxd  rcx, r8d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+4H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     edi, [rdx+0CH]
        movsxd  rcx, edi
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+5H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     esi, [rdx+0DH]
        movsxd  rcx, esi
        movzx   r11d, byte [rbp+rcx]
        mov     byte [rax+rcx], r11b
        lea     ecx, [rdx+6H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_026
        lea     ecx, [rdx+0EH]
        movsxd  r11, ecx
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        lea     r11d, [rdx+7H]
        movsxd  r11, r11d
        cmp     rbx, r11
        jle     L_026
        lea     r11d, [rdx+0FH]
        cmp     rbx, r14
        movsxd  r11, r11d
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        jle     L_026
        lea     r11d, [rdx+10H]
        movsxd  r10, r10d
        cmp     rbx, r10
        movsxd  r11, r11d
        movzx   r14d, byte [rbp+r11]
        mov     byte [rax+r11], r14b
        jle     L_026
        lea     r10d, [rdx+11H]
        movsxd  r9, r9d
        cmp     rbx, r9
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        mov     byte [rax+r10], r11b
        jle     L_026
        lea     r9d, [rdx+12H]
        movsxd  r8, r8d
        cmp     rbx, r8
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        mov     byte [rax+r9], r10b
        jle     L_026
        lea     r8d, [rdx+13H]
        movsxd  rdi, edi
        cmp     rbx, rdi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        mov     byte [rax+r8], r9b
        jle     L_026
        lea     edi, [rdx+14H]
        movsxd  rsi, esi
        cmp     rbx, rsi
        movsxd  rdi, edi
        movzx   r8d, byte [rbp+rdi]
        mov     byte [rax+rdi], r8b
        jle     L_026
        lea     esi, [rdx+15H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        movsxd  rsi, esi
        movzx   edi, byte [rbp+rsi]
        mov     byte [rax+rsi], dil
        jle     L_026
        add     edx, 22
        movsxd  rdx, edx
        movzx   ecx, byte [rbp+rdx]
        mov     byte [rax+rdx], cl
L_026:  test    r13, r13
        jle     L_031
        lea     rsi, [r13+1H]
        add     rbx, 8
        mov     edx, 1
        xor     ecx, ecx




ALIGN   8
L_027:  movzx   edi, byte [r12+rdx+7H]
        add     rcx, rax
        mov     byte [rcx+rbx], dil
        mov     rcx, rdx
        add     rdx, 1
        cmp     rdx, rsi
        jnz     L_027
L_028:  add     r13, rax
        mov     byte [r13+rbx], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret





ALIGN   8
L_029:  xor     edx, edx




ALIGN   8
L_030:  movzx   ecx, byte [rbp+rdx+8H]
        mov     byte [rax+rdx+8H], cl
        add     rdx, 1
        cmp     rbx, rdx
        jnz     L_030
        jmp     L_026

L_031:  add     rbx, 8
        jmp     L_028







ALIGN   16

__stringCompare:
        sub     rsp, 8
        add     rsi, 8
        add     rdi, 8
        call    strcmp
        add     rsp, 8
        cdqe
        ret



SECTION .data   


SECTION .bss    align=32

__value:
        resq    22472

__has:
        resq    22472

__real_addr:
        resq    108

__buffer.3442:
        resb    1048576


SECTION .text.startup 6

main:
        xor     eax, eax
        jmp     __init



SECTION .rodata.str1.1 

L_032:
        db 25H, 73H, 00H

L_033:
        db 25H, 6CH, 64H, 00H


;=====================================================================
	 section .text
_cd:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 1760
	push r15
	push rbx
	push r12
	push r14
	push r13
	mov rax, rdi
	mov qword [rbp - 328], rax
	mov rax, rsi
	mov qword [rbp - 88], rax
	mov rax, rdx
	mov qword [rbp - 1312], rax
	mov rax, rcx
	mov qword [rbp - 160], rax
	mov rcx, r8
	mov rax, qword [rbp - 328]
	cmp rax, 1
	je b1
	b2:
	mov rax, qword [rbp - 328]
	sub rax, 1
	mov qword [rbp - 1272], rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 416], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 1712], rax
	mov rax, qword [rbp - 1312]
	mov qword [rbp - 472], rax
	b3:
	mov rax, qword [rbp - 1272]
	cmp rax, 1
	je b4
	b5:
	mov rax, qword [rbp - 1272]
	sub rax, 1
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 1592], rax
	mov rax, qword [rbp - 472]
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 1712]
	mov qword [rbp - 1504], rax
	b6:
	mov rax, qword [rbp - 240]
	cmp rax, 1
	je b7
	b8:
	mov rax, qword [rbp - 240]
	sub rax, 1
	mov qword [rbp - 928], rax
	mov rax, qword [rbp - 1592]
	mov qword [rbp - 936], rax
	mov rax, qword [rbp - 1504]
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 336]
	mov qword [rbp - 1408], rax
	b9:
	mov rax, qword [rbp - 928]
	cmp rax, 1
	je b10
	b11:
	mov rax, qword [rbp - 928]
	sub rax, 1
	mov qword [rbp - 808], rax
	mov rax, qword [rbp - 936]
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 1408]
	mov qword [rbp - 976], rax
	mov rax, qword [rbp - 560]
	mov qword [rbp - 1472], rax
	b12:
	mov rax, qword [rbp - 808]
	cmp rax, 1
	je b13
	b14:
	mov rax, qword [rbp - 808]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 80]
	mov qword [rbp - 968], rax
	mov rax, qword [rbp - 1472]
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 976]
	mov qword [rbp - 840], rax
	mov rdx, rcx
	b15:
	cmp r14, 1
	je b16
	b17:
	mov rax, r14
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 968]
	mov r13, rax
	mov rax, qword [rbp - 840]
	mov r12, rax
	mov rax, qword [rbp - 96]
	mov rbx, rax
	mov rcx, rdx
	b18:
	cmp rsi, 1
	je b19
	b20:
	mov r15, rsi
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b21
	b19:
	inc rcx
	b21:
	mov rax, rcx
	b22:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 96]
	mov r13, rax
	mov rax, qword [rbp - 968]
	mov r12, rax
	mov rax, qword [rbp - 840]
	mov r14, rax
	mov rax, rdx
	b23:
	cmp rcx, 1
	je b24
	b25:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	call _cd
	inc rax
	jmp b26
	b24:
	inc rax
	b26:
	b27:
	mov rdx, rax
	inc rdx
	jmp b28
	b16:
	inc rdx
	b28:
	mov rax, rdx
	b29:
	mov rcx, rax
	mov rax, qword [rbp - 808]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 976]
	mov qword [rbp - 1296], rax
	mov rax, qword [rbp - 80]
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 1472]
	mov qword [rbp - 1528], rax
	b30:
	cmp r12, 1
	je b31
	b32:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1296]
	mov r14, rax
	mov rax, qword [rbp - 1528]
	mov r13, rax
	mov rax, qword [rbp - 8]
	mov rbx, rax
	mov rax, rcx
	b33:
	cmp rdx, 1
	je b34
	b35:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r13
	call _cd
	inc rax
	jmp b36
	b34:
	inc rax
	b36:
	b37:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 8]
	mov rbx, rax
	mov rax, qword [rbp - 1296]
	mov r13, rax
	mov rax, qword [rbp - 1528]
	mov r14, rax
	mov rax, rcx
	b38:
	cmp rdx, 1
	je b39
	b40:
	mov r12, rdx
	sub r12, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r12
	call _cd
	mov rdi, r12
	mov r8, rax
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r13
	call _cd
	inc rax
	jmp b41
	b39:
	inc rax
	b41:
	b42:
	mov rcx, rax
	inc rcx
	jmp b43
	b31:
	inc rcx
	b43:
	mov rax, rcx
	b44:
	mov rcx, rax
	inc rcx
	jmp b45
	b13:
	inc rcx
	b45:
	mov rax, rcx
	b46:
	mov rcx, rax
	mov rax, qword [rbp - 928]
	sub rax, 1
	mov qword [rbp - 1160], rax
	mov rax, qword [rbp - 560]
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 936]
	mov qword [rbp - 1064], rax
	mov rax, qword [rbp - 1408]
	mov qword [rbp - 1512], rax
	b47:
	mov rax, qword [rbp - 1160]
	cmp rax, 1
	je b48
	b49:
	mov rax, qword [rbp - 1160]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 272]
	mov qword [rbp - 1432], rax
	mov rax, qword [rbp - 1512]
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 1064]
	mov qword [rbp - 120], rax
	mov rdx, rcx
	b50:
	cmp r14, 1
	je b51
	b52:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 1432]
	mov r15, rax
	mov rax, qword [rbp - 120]
	mov rbx, rax
	mov rax, qword [rbp - 200]
	mov r12, rax
	mov rax, rdx
	b53:
	cmp rcx, 1
	je b54
	b55:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r12
	mov rdx, r15
	mov rsi, rbx
	call _cd
	inc rax
	jmp b56
	b54:
	inc rax
	b56:
	b57:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 200]
	mov rbx, rax
	mov rax, qword [rbp - 1432]
	mov r14, rax
	mov rax, qword [rbp - 120]
	mov r12, rax
	mov rax, rdx
	b58:
	cmp rcx, 1
	je b59
	b60:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	call _cd
	inc rax
	jmp b61
	b59:
	inc rax
	b61:
	b62:
	mov rdx, rax
	inc rdx
	jmp b63
	b51:
	inc rdx
	b63:
	mov rax, rdx
	b64:
	mov rcx, rax
	mov rax, qword [rbp - 1160]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1064]
	mov qword [rbp - 440], rax
	mov rax, qword [rbp - 272]
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 1512]
	mov qword [rbp - 880], rax
	mov rdx, rcx
	b65:
	cmp r15, 1
	je b66
	b67:
	mov rax, r15
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 440]
	mov r13, rax
	mov rax, qword [rbp - 880]
	mov r14, rax
	mov rax, qword [rbp - 128]
	mov r12, rax
	mov rax, rdx
	b68:
	cmp rcx, 1
	je b69
	b70:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	call _cd
	inc rax
	jmp b71
	b69:
	inc rax
	b71:
	b72:
	mov rdx, rax
	mov rax, r15
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 128]
	mov r13, rax
	mov rax, qword [rbp - 440]
	mov r12, rax
	mov rax, qword [rbp - 880]
	mov r14, rax
	b73:
	cmp rcx, 1
	je b74
	b75:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rdx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdx, rax
	mov rax, rbx
	mov r8, rdx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b76
	b74:
	inc rdx
	b76:
	mov rax, rdx
	b77:
	mov rdx, rax
	inc rdx
	jmp b78
	b66:
	inc rdx
	b78:
	mov rax, rdx
	b79:
	mov rcx, rax
	inc rcx
	jmp b80
	b48:
	inc rcx
	b80:
	mov rax, rcx
	b81:
	mov rcx, rax
	inc rcx
	jmp b82
	b10:
	inc rcx
	b82:
	mov rax, rcx
	b83:
	mov rcx, rax
	mov rax, qword [rbp - 240]
	sub rax, 1
	mov qword [rbp - 904], rax
	mov rax, qword [rbp - 336]
	mov qword [rbp - 1256], rax
	mov rax, qword [rbp - 1592]
	mov qword [rbp - 1176], rax
	mov rax, qword [rbp - 1504]
	mov qword [rbp - 280], rax
	b84:
	mov rax, qword [rbp - 904]
	cmp rax, 1
	je b85
	b86:
	mov rax, qword [rbp - 904]
	sub rax, 1
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 1256]
	mov qword [rbp - 1240], rax
	mov rax, qword [rbp - 280]
	mov qword [rbp - 584], rax
	mov rax, qword [rbp - 1176]
	mov qword [rbp - 1752], rax
	b87:
	mov rax, qword [rbp - 520]
	cmp rax, 1
	je b88
	b89:
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 712], rax
	mov rax, qword [rbp - 1752]
	mov qword [rbp - 1744], rax
	mov rax, qword [rbp - 584]
	mov qword [rbp - 1576], rax
	b90:
	cmp r13, 1
	je b91
	b92:
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 712]
	mov r14, rax
	mov rax, qword [rbp - 1576]
	mov r12, rax
	mov rax, qword [rbp - 1744]
	mov rbx, rax
	b93:
	cmp rdx, 1
	je b94
	b95:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b96
	b94:
	inc rcx
	b96:
	mov rax, rcx
	b97:
	mov rcx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, qword [rbp - 1744]
	mov r13, rdx
	mov rdx, qword [rbp - 712]
	mov r12, rdx
	mov rdx, qword [rbp - 1576]
	mov r14, rdx
	b98:
	cmp rax, 1
	je b99
	b100:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b101
	b99:
	inc rcx
	b101:
	mov rax, rcx
	b102:
	mov rcx, rax
	inc rcx
	jmp b103
	b91:
	inc rcx
	b103:
	mov rax, rcx
	b104:
	mov rcx, rax
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 584]
	mov qword [rbp - 1688], rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 1328], rax
	mov rax, qword [rbp - 1752]
	mov qword [rbp - 1424], rax
	b105:
	cmp r15, 1
	je b106
	b107:
	mov rax, r15
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1688]
	mov r14, rax
	mov rax, qword [rbp - 1424]
	mov r12, rax
	mov rax, qword [rbp - 1328]
	mov r13, rax
	mov rax, rcx
	b108:
	cmp rdx, 1
	je b109
	b110:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	call _cd
	inc rax
	jmp b111
	b109:
	inc rax
	b111:
	b112:
	mov rcx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1328]
	mov r13, rax
	mov rax, qword [rbp - 1688]
	mov r14, rax
	mov rax, qword [rbp - 1424]
	mov r12, rax
	b113:
	cmp rdx, 1
	je b114
	b115:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b116
	b114:
	inc rcx
	b116:
	mov rax, rcx
	b117:
	mov rcx, rax
	inc rcx
	jmp b118
	b106:
	inc rcx
	b118:
	mov rax, rcx
	b119:
	mov rcx, rax
	inc rcx
	jmp b120
	b88:
	inc rcx
	b120:
	mov rax, rcx
	b121:
	mov rcx, rax
	mov rax, qword [rbp - 904]
	sub rax, 1
	mov qword [rbp - 640], rax
	mov rax, qword [rbp - 1176]
	mov qword [rbp - 1088], rax
	mov rax, qword [rbp - 1256]
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 280]
	mov qword [rbp - 1464], rax
	b122:
	mov rax, qword [rbp - 640]
	cmp rax, 1
	je b123
	b124:
	mov rax, qword [rbp - 640]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1088]
	mov qword [rbp - 504], rax
	mov rax, qword [rbp - 1464]
	mov qword [rbp - 912], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 736], rax
	b125:
	cmp r12, 1
	je b126
	b127:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 504]
	mov rbx, rax
	mov rax, qword [rbp - 736]
	mov r14, rax
	mov rax, qword [rbp - 912]
	mov r15, rax
	mov rax, rcx
	b128:
	cmp rdx, 1
	je b129
	b130:
	mov r13, rdx
	sub r13, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r14
	call _cd
	inc rax
	jmp b131
	b129:
	inc rax
	b131:
	b132:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 912]
	mov r13, rax
	mov rax, qword [rbp - 504]
	mov r12, rax
	mov rax, qword [rbp - 736]
	mov r14, rax
	b133:
	cmp rdx, 1
	je b134
	b135:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b136
	b134:
	inc rcx
	b136:
	mov rax, rcx
	b137:
	mov rcx, rax
	inc rcx
	jmp b138
	b126:
	inc rcx
	b138:
	mov rax, rcx
	b139:
	mov rcx, rax
	mov rax, qword [rbp - 640]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 1248], rax
	mov rax, qword [rbp - 1088]
	mov qword [rbp - 744], rax
	mov rax, qword [rbp - 1464]
	mov qword [rbp - 1616], rax
	mov rdx, rcx
	b140:
	cmp r15, 1
	je b141
	b142:
	mov rax, r15
	sub rax, 1
	mov rcx, qword [rbp - 1248]
	mov rbx, rcx
	mov rcx, qword [rbp - 1616]
	mov r14, rcx
	mov rcx, qword [rbp - 744]
	mov r12, rcx
	mov rcx, rdx
	b143:
	cmp rax, 1
	je b144
	b145:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b146
	b144:
	inc rcx
	b146:
	mov rax, rcx
	b147:
	mov rdx, rax
	mov rax, r15
	sub rax, 1
	mov rcx, qword [rbp - 744]
	mov r13, rcx
	mov rcx, qword [rbp - 1248]
	mov r12, rcx
	mov rcx, qword [rbp - 1616]
	mov r14, rcx
	mov rcx, rdx
	b148:
	cmp rax, 1
	je b149
	b150:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b151
	b149:
	inc rcx
	b151:
	mov rax, rcx
	b152:
	mov rdx, rax
	inc rdx
	jmp b153
	b141:
	inc rdx
	b153:
	mov rax, rdx
	b154:
	mov rcx, rax
	inc rcx
	jmp b155
	b123:
	inc rcx
	b155:
	mov rax, rcx
	b156:
	mov rcx, rax
	inc rcx
	jmp b157
	b85:
	inc rcx
	b157:
	mov rax, rcx
	b158:
	mov rcx, rax
	inc rcx
	jmp b159
	b7:
	inc rcx
	b159:
	mov rax, rcx
	b160:
	mov rcx, rax
	mov rax, qword [rbp - 1272]
	sub rax, 1
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 1712]
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 792], rax
	mov rax, qword [rbp - 472]
	mov qword [rbp - 1136], rax
	b161:
	mov rax, qword [rbp - 72]
	cmp rax, 1
	je b162
	b163:
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov qword [rbp - 1360], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 1648], rax
	mov rax, qword [rbp - 1136]
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 792]
	mov qword [rbp - 1344], rax
	b164:
	mov rax, qword [rbp - 1360]
	cmp rax, 1
	je b165
	b166:
	mov rax, qword [rbp - 1360]
	sub rax, 1
	mov qword [rbp - 1728], rax
	mov rax, qword [rbp - 1648]
	mov qword [rbp - 1760], rax
	mov rax, qword [rbp - 1344]
	mov qword [rbp - 1672], rax
	mov rax, qword [rbp - 264]
	mov qword [rbp - 960], rax
	b167:
	mov rax, qword [rbp - 1728]
	cmp rax, 1
	je b168
	b169:
	mov rax, qword [rbp - 1728]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1760]
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 960]
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 1672]
	mov qword [rbp - 64], rax
	mov rdx, rcx
	b170:
	cmp r13, 1
	je b171
	b172:
	mov rax, r13
	sub rax, 1
	mov rcx, qword [rbp - 568]
	mov rbx, rcx
	mov rcx, qword [rbp - 64]
	mov r14, rcx
	mov rcx, qword [rbp - 376]
	mov r12, rcx
	mov rcx, rdx
	b173:
	cmp rax, 1
	je b174
	b175:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b176
	b174:
	inc rcx
	b176:
	mov rax, rcx
	b177:
	mov rdx, rax
	mov rax, r13
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 376]
	mov r12, rax
	mov rax, qword [rbp - 568]
	mov rbx, rax
	mov rax, qword [rbp - 64]
	mov r14, rax
	mov rax, rdx
	b178:
	cmp rcx, 1
	je b179
	b180:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	call _cd
	inc rax
	jmp b181
	b179:
	inc rax
	b181:
	b182:
	mov rdx, rax
	inc rdx
	jmp b183
	b171:
	inc rdx
	b183:
	mov rax, rdx
	b184:
	mov rcx, rax
	mov rax, qword [rbp - 1728]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1672]
	mov qword [rbp - 1200], rax
	mov rax, qword [rbp - 1760]
	mov qword [rbp - 544], rax
	mov rax, qword [rbp - 960]
	mov qword [rbp - 1040], rax
	mov rdx, rcx
	b185:
	cmp r14, 1
	je b186
	b187:
	mov rax, r14
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 1200]
	mov r15, rax
	mov rax, qword [rbp - 1040]
	mov r12, rax
	mov rax, qword [rbp - 544]
	mov rbx, rax
	mov rcx, rdx
	b188:
	cmp rsi, 1
	je b189
	b190:
	mov r13, rsi
	sub r13, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b191
	b189:
	inc rcx
	b191:
	mov rax, rcx
	b192:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 544]
	mov r13, rcx
	mov rcx, qword [rbp - 1200]
	mov r14, rcx
	mov rcx, qword [rbp - 1040]
	mov r12, rcx
	mov rcx, rdx
	b193:
	cmp rax, 1
	je b194
	b195:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b196
	b194:
	inc rcx
	b196:
	mov rax, rcx
	b197:
	mov rdx, rax
	inc rdx
	jmp b198
	b186:
	inc rdx
	b198:
	mov rax, rdx
	b199:
	mov rcx, rax
	inc rcx
	jmp b200
	b168:
	inc rcx
	b200:
	mov rax, rcx
	b201:
	mov rcx, rax
	mov rax, qword [rbp - 1360]
	sub rax, 1
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 264]
	mov qword [rbp - 1480], rax
	mov rax, qword [rbp - 1648]
	mov qword [rbp - 1552], rax
	mov rax, qword [rbp - 1344]
	mov qword [rbp - 1224], rax
	b202:
	mov rax, qword [rbp - 728]
	cmp rax, 1
	je b203
	b204:
	mov rax, qword [rbp - 728]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1480]
	mov qword [rbp - 1696], rax
	mov rax, qword [rbp - 1224]
	mov qword [rbp - 720], rax
	mov rax, qword [rbp - 1552]
	mov qword [rbp - 320], rax
	mov rax, rcx
	b205:
	cmp r14, 1
	je b206
	b207:
	mov rcx, r14
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 1696]
	mov r12, rcx
	mov rcx, qword [rbp - 320]
	mov r13, rcx
	mov rcx, qword [rbp - 720]
	mov rbx, rcx
	b208:
	cmp rdx, 1
	je b209
	b210:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	call _cd
	inc rax
	jmp b211
	b209:
	inc rax
	b211:
	b212:
	mov rcx, r14
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 720]
	mov r14, rcx
	mov rcx, qword [rbp - 1696]
	mov r13, rcx
	mov rcx, qword [rbp - 320]
	mov r12, rcx
	mov rcx, rax
	b213:
	cmp rdx, 1
	je b214
	b215:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b216
	b214:
	inc rcx
	b216:
	mov rax, rcx
	b217:
	inc rax
	jmp b218
	b206:
	inc rax
	b218:
	b219:
	mov rcx, rax
	mov rax, qword [rbp - 728]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1552]
	mov qword [rbp - 1416], rax
	mov rax, qword [rbp - 1480]
	mov qword [rbp - 824], rax
	mov rax, qword [rbp - 1224]
	mov qword [rbp - 632], rax
	mov rdx, rcx
	b220:
	cmp r12, 1
	je b221
	b222:
	mov rax, r12
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 1416]
	mov r13, rax
	mov rax, qword [rbp - 632]
	mov rbx, rax
	mov rax, qword [rbp - 824]
	mov r14, rax
	mov rcx, rdx
	b223:
	cmp rsi, 1
	je b224
	b225:
	mov r15, rsi
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b226
	b224:
	inc rcx
	b226:
	mov rax, rcx
	b227:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 824]
	mov r12, rcx
	mov rcx, qword [rbp - 1416]
	mov r14, rcx
	mov rcx, qword [rbp - 632]
	mov rbx, rcx
	mov rcx, rdx
	b228:
	cmp rax, 1
	je b229
	b230:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b231
	b229:
	inc rcx
	b231:
	mov rax, rcx
	b232:
	mov rdx, rax
	inc rdx
	jmp b233
	b221:
	inc rdx
	b233:
	mov rax, rdx
	b234:
	mov rcx, rax
	inc rcx
	jmp b235
	b203:
	inc rcx
	b235:
	mov rax, rcx
	b236:
	mov rcx, rax
	inc rcx
	jmp b237
	b165:
	inc rcx
	b237:
	mov rax, rcx
	b238:
	mov rcx, rax
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov qword [rbp - 1632], rax
	mov rax, qword [rbp - 792]
	mov qword [rbp - 176], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 1136]
	mov qword [rbp - 800], rax
	b239:
	mov rax, qword [rbp - 1632]
	cmp rax, 1
	je b240
	b241:
	mov rax, qword [rbp - 1632]
	sub rax, 1
	mov qword [rbp - 1000], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 1096], rax
	mov rax, qword [rbp - 800]
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 424]
	mov qword [rbp - 680], rax
	b242:
	mov rax, qword [rbp - 1000]
	cmp rax, 1
	je b243
	b244:
	mov rax, qword [rbp - 1000]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1096]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 1104], rax
	mov rax, qword [rbp - 696]
	mov qword [rbp - 856], rax
	b245:
	cmp r14, 1
	je b246
	b247:
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 224]
	mov r12, rax
	mov rax, qword [rbp - 856]
	mov rbx, rax
	mov rax, qword [rbp - 1104]
	mov r13, rax
	b248:
	cmp rdx, 1
	je b249
	b250:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b251
	b249:
	inc rcx
	b251:
	mov rax, rcx
	b252:
	mov rcx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1104]
	mov r12, rax
	mov rax, qword [rbp - 224]
	mov rbx, rax
	mov rax, qword [rbp - 856]
	mov r13, rax
	mov rax, rcx
	b253:
	cmp rdx, 1
	je b254
	b255:
	mov r14, rdx
	sub r14, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, rbx
	call _cd
	inc rax
	jmp b256
	b254:
	inc rax
	b256:
	b257:
	mov rcx, rax
	inc rcx
	jmp b258
	b246:
	inc rcx
	b258:
	mov rax, rcx
	b259:
	mov rcx, rax
	mov rax, qword [rbp - 1000]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 696]
	mov qword [rbp - 1168], rax
	mov rax, qword [rbp - 1096]
	mov qword [rbp - 1024], rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 1400], rax
	mov rdx, rcx
	b260:
	cmp r12, 1
	je b261
	b262:
	mov rax, r12
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 1168]
	mov r13, rax
	mov rax, qword [rbp - 1400]
	mov r14, rax
	mov rax, qword [rbp - 1024]
	mov rbx, rax
	b263:
	cmp rcx, 1
	je b264
	b265:
	mov r15, rcx
	sub r15, 1
	mov r8, rdx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rdx, rax
	mov rax, r15
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b266
	b264:
	inc rdx
	b266:
	mov rax, rdx
	b267:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 1024]
	mov r12, rcx
	mov rcx, qword [rbp - 1168]
	mov r14, rcx
	mov rcx, qword [rbp - 1400]
	mov r13, rcx
	mov rcx, rdx
	b268:
	cmp rax, 1
	je b269
	b270:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b271
	b269:
	inc rcx
	b271:
	mov rax, rcx
	b272:
	mov rdx, rax
	inc rdx
	jmp b273
	b261:
	inc rdx
	b273:
	mov rax, rdx
	b274:
	mov rcx, rax
	inc rcx
	jmp b275
	b243:
	inc rcx
	b275:
	mov rax, rcx
	b276:
	mov rcx, rax
	mov rax, qword [rbp - 1632]
	sub rax, 1
	mov qword [rbp - 488], rax
	mov rax, qword [rbp - 424]
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 176]
	mov qword [rbp - 1008], rax
	mov rax, qword [rbp - 800]
	mov qword [rbp - 776], rax
	b277:
	mov rax, qword [rbp - 488]
	cmp rax, 1
	je b278
	b279:
	mov rax, qword [rbp - 488]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 776]
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 1008]
	mov qword [rbp - 1080], rax
	b280:
	cmp r12, 1
	je b281
	b282:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 296]
	mov rbx, rax
	mov rax, qword [rbp - 1080]
	mov r14, rax
	mov rax, qword [rbp - 208]
	mov r13, rax
	b283:
	cmp rdx, 1
	je b284
	b285:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b286
	b284:
	inc rcx
	b286:
	mov rax, rcx
	b287:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 208]
	mov r13, rax
	mov rax, qword [rbp - 296]
	mov r12, rax
	mov rax, qword [rbp - 1080]
	mov rbx, rax
	b288:
	cmp rdx, 1
	je b289
	b290:
	mov r14, rdx
	sub r14, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b291
	b289:
	inc rcx
	b291:
	mov rax, rcx
	b292:
	mov rcx, rax
	inc rcx
	jmp b293
	b281:
	inc rcx
	b293:
	mov rax, rcx
	b294:
	mov rcx, rax
	mov rax, qword [rbp - 488]
	sub rax, 1
	mov qword [rbp - 1288], rax
	mov rax, qword [rbp - 1008]
	mov qword [rbp - 600], rax
	mov rax, qword [rbp - 16]
	mov r14, rax
	mov rax, qword [rbp - 776]
	mov qword [rbp - 1560], rax
	mov rdx, rcx
	b295:
	mov rax, qword [rbp - 1288]
	cmp rax, 1
	je b296
	b297:
	mov rax, qword [rbp - 1288]
	sub rax, 1
	mov rcx, qword [rbp - 600]
	mov r15, rcx
	mov rcx, qword [rbp - 1560]
	mov r13, rcx
	mov rbx, r14
	mov rcx, rdx
	b298:
	cmp rax, 1
	je b299
	b300:
	mov r12, rax
	sub r12, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r15
	mov rdi, r12
	call _cd
	mov rcx, rax
	mov rax, r12
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b301
	b299:
	inc rcx
	b301:
	mov rax, rcx
	b302:
	mov rdx, rax
	mov rax, qword [rbp - 1288]
	sub rax, 1
	mov rcx, qword [rbp - 600]
	mov r12, rcx
	mov rcx, qword [rbp - 1560]
	mov r13, rcx
	mov rcx, rdx
	b303:
	cmp rax, 1
	je b304
	b305:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b306
	b304:
	inc rcx
	b306:
	mov rax, rcx
	b307:
	mov rdx, rax
	inc rdx
	jmp b308
	b296:
	inc rdx
	b308:
	mov rax, rdx
	b309:
	mov rcx, rax
	inc rcx
	jmp b310
	b278:
	inc rcx
	b310:
	mov rax, rcx
	b311:
	mov rcx, rax
	inc rcx
	jmp b312
	b240:
	inc rcx
	b312:
	mov rax, rcx
	b313:
	mov rcx, rax
	inc rcx
	jmp b314
	b162:
	inc rcx
	b314:
	mov rax, rcx
	b315:
	mov rcx, rax
	inc rcx
	jmp b316
	b4:
	inc rcx
	b316:
	mov rax, rcx
	b317:
	mov rcx, rax
	mov rax, qword [rbp - 328]
	sub rax, 1
	mov qword [rbp - 624], rax
	mov rax, qword [rbp - 1312]
	mov qword [rbp - 1112], rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 1376], rax
	b318:
	mov rax, qword [rbp - 624]
	cmp rax, 1
	je b319
	b320:
	mov rax, qword [rbp - 624]
	sub rax, 1
	mov qword [rbp - 1336], rax
	mov rax, qword [rbp - 1112]
	mov qword [rbp - 1384], rax
	mov rax, qword [rbp - 1376]
	mov qword [rbp - 944], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 1656], rax
	b321:
	mov rax, qword [rbp - 1336]
	cmp rax, 1
	je b322
	b323:
	mov rax, qword [rbp - 1336]
	sub rax, 1
	mov qword [rbp - 1664], rax
	mov rax, qword [rbp - 1384]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 1656]
	mov qword [rbp - 1536], rax
	mov rax, qword [rbp - 944]
	mov qword [rbp - 1120], rax
	b324:
	mov rax, qword [rbp - 1664]
	cmp rax, 1
	je b325
	b326:
	mov rax, qword [rbp - 1664]
	sub rax, 1
	mov qword [rbp - 1072], rax
	mov rax, qword [rbp - 384]
	mov qword [rbp - 1624], rax
	mov rax, qword [rbp - 1120]
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 1536]
	mov qword [rbp - 992], rax
	b327:
	mov rax, qword [rbp - 1072]
	cmp rax, 1
	je b328
	b329:
	mov rax, qword [rbp - 1072]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1624]
	mov qword [rbp - 1184], rax
	mov rax, qword [rbp - 992]
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 288]
	mov qword [rbp - 1488], rax
	mov rdx, rcx
	b330:
	cmp r13, 1
	je b331
	b332:
	mov rax, r13
	sub rax, 1
	mov rcx, qword [rbp - 1184]
	mov rbx, rcx
	mov rcx, qword [rbp - 1488]
	mov r12, rcx
	mov rcx, qword [rbp - 400]
	mov r14, rcx
	mov rcx, rdx
	b333:
	cmp rax, 1
	je b334
	b335:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b336
	b334:
	inc rcx
	b336:
	mov rax, rcx
	b337:
	mov rdx, rax
	mov rax, r13
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 400]
	mov r12, rax
	mov rax, qword [rbp - 1184]
	mov r13, rax
	mov rax, qword [rbp - 1488]
	mov rbx, rax
	b338:
	cmp rcx, 1
	je b339
	b340:
	mov r14, rcx
	sub r14, 1
	mov r8, rdx
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rdx, rax
	mov rax, r14
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b341
	b339:
	inc rdx
	b341:
	mov rax, rdx
	b342:
	mov rdx, rax
	inc rdx
	jmp b343
	b331:
	inc rdx
	b343:
	mov rax, rdx
	b344:
	mov rcx, rax
	mov rax, qword [rbp - 1072]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 288]
	mov qword [rbp - 1048], rax
	mov rax, qword [rbp - 1624]
	mov qword [rbp - 984], rax
	mov rax, qword [rbp - 992]
	mov qword [rbp - 512], rax
	mov rdx, rcx
	b345:
	cmp r14, 1
	je b346
	b347:
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 1048]
	mov r13, rcx
	mov rcx, qword [rbp - 512]
	mov rbx, rcx
	mov rcx, qword [rbp - 984]
	mov r12, rcx
	mov rcx, rdx
	b348:
	cmp rax, 1
	je b349
	b350:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b351
	b349:
	inc rcx
	b351:
	mov rax, rcx
	b352:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 984]
	mov r13, rcx
	mov rcx, qword [rbp - 1048]
	mov r14, rcx
	mov rcx, qword [rbp - 512]
	mov r12, rcx
	mov rcx, rdx
	b353:
	cmp rax, 1
	je b354
	b355:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b356
	b354:
	inc rcx
	b356:
	mov rax, rcx
	b357:
	mov rdx, rax
	inc rdx
	jmp b358
	b346:
	inc rdx
	b358:
	mov rax, rdx
	b359:
	mov rcx, rax
	inc rcx
	jmp b360
	b328:
	inc rcx
	b360:
	mov rax, rcx
	b361:
	mov rcx, rax
	mov rax, qword [rbp - 1664]
	sub rax, 1
	mov qword [rbp - 848], rax
	mov rax, qword [rbp - 1536]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 384]
	mov qword [rbp - 1264], rax
	mov rax, qword [rbp - 1120]
	mov qword [rbp - 608], rax
	b362:
	mov rax, qword [rbp - 848]
	cmp rax, 1
	je b363
	b364:
	mov rax, qword [rbp - 848]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 552], rax
	mov rax, qword [rbp - 608]
	mov qword [rbp - 616], rax
	mov rax, qword [rbp - 1264]
	mov qword [rbp - 1016], rax
	mov rdx, rcx
	b365:
	cmp r14, 1
	je b366
	b367:
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 552]
	mov r15, rcx
	mov rcx, qword [rbp - 1016]
	mov rbx, rcx
	mov rcx, qword [rbp - 616]
	mov r13, rcx
	mov rcx, rdx
	b368:
	cmp rax, 1
	je b369
	b370:
	mov r12, rax
	sub r12, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r15
	mov rdi, r12
	call _cd
	mov rcx, rax
	mov rax, r12
	mov r8, rcx
	mov rcx, r13
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b371
	b369:
	inc rcx
	b371:
	mov rax, rcx
	b372:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 616]
	mov r14, rax
	mov rax, qword [rbp - 552]
	mov r12, rax
	mov rax, qword [rbp - 1016]
	mov rbx, rax
	mov rax, rdx
	b373:
	cmp rcx, 1
	je b374
	b375:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	call _cd
	inc rax
	jmp b376
	b374:
	inc rax
	b376:
	b377:
	mov rdx, rax
	inc rdx
	jmp b378
	b366:
	inc rdx
	b378:
	mov rax, rdx
	b379:
	mov rcx, rax
	mov rax, qword [rbp - 848]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1264]
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 608]
	mov qword [rbp - 888], rax
	b380:
	cmp r13, 1
	je b381
	b382:
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 104]
	mov r12, rax
	mov rax, qword [rbp - 888]
	mov rbx, rax
	mov rax, qword [rbp - 184]
	mov r15, rax
	b383:
	cmp rdx, 1
	je b384
	b385:
	mov r14, rdx
	sub r14, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r15
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b386
	b384:
	inc rcx
	b386:
	mov rax, rcx
	b387:
	mov rcx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, qword [rbp - 184]
	mov r13, rdx
	mov rdx, qword [rbp - 104]
	mov r12, rdx
	mov rdx, qword [rbp - 888]
	mov r14, rdx
	b388:
	cmp rax, 1
	je b389
	b390:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b391
	b389:
	inc rcx
	b391:
	mov rax, rcx
	b392:
	mov rcx, rax
	inc rcx
	jmp b393
	b381:
	inc rcx
	b393:
	mov rax, rcx
	b394:
	mov rcx, rax
	inc rcx
	jmp b395
	b363:
	inc rcx
	b395:
	mov rax, rcx
	b396:
	mov rcx, rax
	inc rcx
	jmp b397
	b325:
	inc rcx
	b397:
	mov rax, rcx
	b398:
	mov rcx, rax
	mov rax, qword [rbp - 1336]
	sub rax, 1
	mov qword [rbp - 1448], rax
	mov rax, qword [rbp - 944]
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 1384]
	mov qword [rbp - 688], rax
	mov rax, qword [rbp - 1656]
	mov qword [rbp - 1320], rax
	b399:
	mov rax, qword [rbp - 1448]
	cmp rax, 1
	je b400
	b401:
	mov rax, qword [rbp - 1448]
	sub rax, 1
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 360]
	mov qword [rbp - 592], rax
	mov rax, qword [rbp - 1320]
	mov qword [rbp - 1352], rax
	mov rax, qword [rbp - 688]
	mov qword [rbp - 1192], rax
	b402:
	mov rax, qword [rbp - 256]
	cmp rax, 1
	je b403
	b404:
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 592]
	mov qword [rbp - 952], rax
	mov rax, qword [rbp - 1192]
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 1352]
	mov qword [rbp - 192], rax
	mov rdx, rcx
	b405:
	cmp r13, 1
	je b406
	b407:
	mov rax, r13
	sub rax, 1
	mov rcx, qword [rbp - 952]
	mov r12, rcx
	mov rcx, qword [rbp - 192]
	mov rbx, rcx
	mov rcx, qword [rbp - 576]
	mov r14, rcx
	mov rcx, rdx
	b408:
	cmp rax, 1
	je b409
	b410:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b411
	b409:
	inc rcx
	b411:
	mov rax, rcx
	b412:
	mov rdx, rax
	mov rax, r13
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 576]
	mov r13, rax
	mov rax, qword [rbp - 952]
	mov r14, rax
	mov rax, qword [rbp - 192]
	mov r12, rax
	mov rcx, rdx
	b413:
	cmp rsi, 1
	je b414
	b415:
	mov rbx, rsi
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b416
	b414:
	inc rcx
	b416:
	mov rax, rcx
	b417:
	mov rdx, rax
	inc rdx
	jmp b418
	b406:
	inc rdx
	b418:
	mov rax, rdx
	b419:
	mov rcx, rax
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1352]
	mov qword [rbp - 1544], rax
	mov rax, qword [rbp - 592]
	mov qword [rbp - 1280], rax
	mov rax, qword [rbp - 1192]
	mov qword [rbp - 152], rax
	b420:
	cmp r14, 1
	je b421
	b422:
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1544]
	mov rbx, rax
	mov rax, qword [rbp - 152]
	mov r12, rax
	mov rax, qword [rbp - 1280]
	mov r13, rax
	mov rax, rcx
	b423:
	cmp rdx, 1
	je b424
	b425:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	call _cd
	inc rax
	jmp b426
	b424:
	inc rax
	b426:
	b427:
	mov rcx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1280]
	mov r12, rax
	mov rax, qword [rbp - 1544]
	mov r14, rax
	mov rax, qword [rbp - 152]
	mov r13, rax
	mov rax, rcx
	b428:
	cmp rdx, 1
	je b429
	b430:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	call _cd
	inc rax
	jmp b431
	b429:
	inc rax
	b431:
	b432:
	mov rcx, rax
	inc rcx
	jmp b433
	b421:
	inc rcx
	b433:
	mov rax, rcx
	b434:
	mov rcx, rax
	inc rcx
	jmp b435
	b403:
	inc rcx
	b435:
	mov rax, rcx
	b436:
	mov rcx, rax
	mov rax, qword [rbp - 1448]
	sub rax, 1
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 688]
	mov qword [rbp - 1440], rax
	mov rax, qword [rbp - 360]
	mov qword [rbp - 1600], rax
	mov rax, qword [rbp - 1320]
	mov qword [rbp - 1568], rax
	b437:
	mov rax, qword [rbp - 248]
	cmp rax, 1
	je b438
	b439:
	mov rax, qword [rbp - 248]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1440]
	mov qword [rbp - 1368], rax
	mov rax, qword [rbp - 1568]
	mov qword [rbp - 872], rax
	mov rax, qword [rbp - 1600]
	mov qword [rbp - 1392], rax
	mov rdx, rcx
	b440:
	cmp r14, 1
	je b441
	b442:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 1368]
	mov r12, rax
	mov rax, qword [rbp - 1392]
	mov rbx, rax
	mov rax, qword [rbp - 872]
	mov r13, rax
	b443:
	cmp rcx, 1
	je b444
	b445:
	mov r15, rcx
	sub r15, 1
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rdx, rax
	mov rax, r15
	mov r8, rdx
	mov rcx, r13
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b446
	b444:
	inc rdx
	b446:
	mov rax, rdx
	b447:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 872]
	mov r14, rcx
	mov rcx, qword [rbp - 1368]
	mov r12, rcx
	mov rcx, qword [rbp - 1392]
	mov r13, rcx
	mov rcx, rdx
	b448:
	cmp rax, 1
	je b449
	b450:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b451
	b449:
	inc rcx
	b451:
	mov rax, rcx
	b452:
	mov rdx, rax
	inc rdx
	jmp b453
	b441:
	inc rdx
	b453:
	mov rax, rdx
	b454:
	mov rcx, rax
	mov rax, qword [rbp - 248]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1600]
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 1440]
	mov qword [rbp - 448], rax
	mov rax, qword [rbp - 1568]
	mov qword [rbp - 32], rax
	b455:
	cmp r14, 1
	je b456
	b457:
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 216]
	mov r12, rax
	mov rax, qword [rbp - 32]
	mov r13, rax
	mov rax, qword [rbp - 448]
	mov rbx, rax
	mov rax, rcx
	b458:
	cmp rdx, 1
	je b459
	b460:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	call _cd
	inc rax
	jmp b461
	b459:
	inc rax
	b461:
	b462:
	mov rcx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 448]
	mov r14, rax
	mov rax, qword [rbp - 216]
	mov r13, rax
	mov rax, qword [rbp - 32]
	mov r12, rax
	b463:
	cmp rdx, 1
	je b464
	b465:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b466
	b464:
	inc rcx
	b466:
	mov rax, rcx
	b467:
	mov rcx, rax
	inc rcx
	jmp b468
	b456:
	inc rcx
	b468:
	mov rax, rcx
	b469:
	mov rcx, rax
	inc rcx
	jmp b470
	b438:
	inc rcx
	b470:
	mov rax, rcx
	b471:
	mov rcx, rax
	inc rcx
	jmp b472
	b400:
	inc rcx
	b472:
	mov rax, rcx
	b473:
	mov rcx, rax
	inc rcx
	jmp b474
	b322:
	inc rcx
	b474:
	mov rax, rcx
	b475:
	mov rcx, rax
	mov rax, qword [rbp - 624]
	sub rax, 1
	mov qword [rbp - 480], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 648], rax
	mov rax, qword [rbp - 1112]
	mov qword [rbp - 352], rax
	mov rax, qword [rbp - 1376]
	mov qword [rbp - 784], rax
	b476:
	mov rax, qword [rbp - 480]
	cmp rax, 1
	je b477
	b478:
	mov rax, qword [rbp - 480]
	sub rax, 1
	mov qword [rbp - 832], rax
	mov rax, qword [rbp - 648]
	mov qword [rbp - 1456], rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 1704], rax
	mov rax, qword [rbp - 352]
	mov qword [rbp - 1736], rax
	b479:
	mov rax, qword [rbp - 832]
	cmp rax, 1
	je b480
	b481:
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov qword [rbp - 672], rax
	mov rax, qword [rbp - 1456]
	mov qword [rbp - 704], rax
	mov rax, qword [rbp - 1736]
	mov qword [rbp - 896], rax
	mov rax, qword [rbp - 1704]
	mov qword [rbp - 1208], rax
	b482:
	mov rax, qword [rbp - 672]
	cmp rax, 1
	je b483
	b484:
	mov rax, qword [rbp - 672]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 1680], rax
	mov rax, qword [rbp - 1208]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 896]
	mov qword [rbp - 768], rax
	b485:
	cmp r13, 1
	je b486
	b487:
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1680]
	mov r12, rax
	mov rax, qword [rbp - 768]
	mov rbx, rax
	mov rax, qword [rbp - 168]
	mov r14, rax
	mov rax, rcx
	b488:
	cmp rdx, 1
	je b489
	b490:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	call _cd
	inc rax
	jmp b491
	b489:
	inc rax
	b491:
	b492:
	mov rcx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 168]
	mov r12, rax
	mov rax, qword [rbp - 1680]
	mov rbx, rax
	mov rax, qword [rbp - 768]
	mov r13, rax
	b493:
	cmp rdx, 1
	je b494
	b495:
	mov r14, rdx
	sub r14, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b496
	b494:
	inc rcx
	b496:
	mov rax, rcx
	b497:
	mov rcx, rax
	inc rcx
	jmp b498
	b486:
	inc rcx
	b498:
	mov rax, rcx
	b499:
	mov rcx, rax
	mov rax, qword [rbp - 672]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 896]
	mov qword [rbp - 1520], rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 536], rax
	mov rax, qword [rbp - 1208]
	mov qword [rbp - 1152], rax
	mov rdx, rcx
	b500:
	cmp r14, 1
	je b501
	b502:
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 1520]
	mov r13, rcx
	mov rcx, qword [rbp - 1152]
	mov rbx, rcx
	mov rcx, qword [rbp - 536]
	mov r12, rcx
	mov rcx, rdx
	b503:
	cmp rax, 1
	je b504
	b505:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b506
	b504:
	inc rcx
	b506:
	mov rax, rcx
	b507:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 536]
	mov r13, rax
	mov rax, qword [rbp - 1520]
	mov r12, rax
	mov rax, qword [rbp - 1152]
	mov rbx, rax
	mov rax, rdx
	b508:
	cmp rcx, 1
	je b509
	b510:
	mov r14, rcx
	sub r14, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	call _cd
	inc rax
	jmp b511
	b509:
	inc rax
	b511:
	b512:
	mov rdx, rax
	inc rdx
	jmp b513
	b501:
	inc rdx
	b513:
	mov rax, rdx
	b514:
	mov rcx, rax
	inc rcx
	jmp b515
	b483:
	inc rcx
	b515:
	mov rax, rcx
	b516:
	mov rcx, rax
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 1704]
	mov qword [rbp - 528], rax
	mov rax, qword [rbp - 1456]
	mov qword [rbp - 1304], rax
	mov rax, qword [rbp - 1736]
	mov qword [rbp - 664], rax
	b517:
	mov rax, qword [rbp - 408]
	cmp rax, 1
	je b518
	b519:
	mov rax, qword [rbp - 408]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 528]
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 664]
	mov qword [rbp - 1032], rax
	mov rax, qword [rbp - 1304]
	mov qword [rbp - 312], rax
	mov rdx, rcx
	b520:
	cmp r14, 1
	je b521
	b522:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 392]
	mov r13, rax
	mov rax, qword [rbp - 312]
	mov r12, rax
	mov rax, qword [rbp - 1032]
	mov rbx, rax
	mov rax, rdx
	b523:
	cmp rcx, 1
	je b524
	b525:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	call _cd
	inc rax
	jmp b526
	b524:
	inc rax
	b526:
	b527:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 1032]
	mov rbx, rax
	mov rax, qword [rbp - 392]
	mov r12, rax
	mov rax, qword [rbp - 312]
	mov r14, rax
	mov rax, rdx
	b528:
	cmp rcx, 1
	je b529
	b530:
	mov r13, rcx
	sub r13, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	call _cd
	inc rax
	jmp b531
	b529:
	inc rax
	b531:
	b532:
	mov rdx, rax
	inc rdx
	jmp b533
	b521:
	inc rdx
	b533:
	mov rax, rdx
	b534:
	mov rcx, rax
	mov rax, qword [rbp - 408]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1304]
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 528]
	mov qword [rbp - 1608], rax
	mov rax, qword [rbp - 664]
	mov qword [rbp - 432], rax
	mov rdx, rcx
	b535:
	cmp r13, 1
	je b536
	b537:
	mov rax, r13
	sub rax, 1
	mov rcx, qword [rbp - 136]
	mov r14, rcx
	mov rcx, qword [rbp - 432]
	mov r12, rcx
	mov rcx, qword [rbp - 1608]
	mov rbx, rcx
	mov rcx, rdx
	b538:
	cmp rax, 1
	je b539
	b540:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b541
	b539:
	inc rcx
	b541:
	mov rax, rcx
	b542:
	mov rdx, rax
	mov rax, r13
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 1608]
	mov r14, rax
	mov rax, qword [rbp - 136]
	mov r12, rax
	mov rax, qword [rbp - 432]
	mov r13, rax
	mov rax, rdx
	b543:
	cmp rcx, 1
	je b544
	b545:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	call _cd
	inc rax
	jmp b546
	b544:
	inc rax
	b546:
	b547:
	mov rdx, rax
	inc rdx
	jmp b548
	b536:
	inc rdx
	b548:
	mov rax, rdx
	b549:
	mov rcx, rax
	inc rcx
	jmp b550
	b518:
	inc rcx
	b550:
	mov rax, rcx
	b551:
	mov rcx, rax
	inc rcx
	jmp b552
	b480:
	inc rcx
	b552:
	mov rax, rcx
	b553:
	mov rcx, rax
	mov rax, qword [rbp - 480]
	sub rax, 1
	mov qword [rbp - 1056], rax
	mov rax, qword [rbp - 352]
	mov qword [rbp - 456], rax
	mov rax, qword [rbp - 648]
	mov qword [rbp - 1640], rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 1128], rax
	b554:
	mov rax, qword [rbp - 1056]
	cmp rax, 1
	je b555
	b556:
	mov rax, qword [rbp - 1056]
	sub rax, 1
	mov qword [rbp - 1584], rax
	mov rax, qword [rbp - 456]
	mov qword [rbp - 816], rax
	mov rax, qword [rbp - 1128]
	mov qword [rbp - 1496], rax
	mov rax, qword [rbp - 1640]
	mov qword [rbp - 752], rax
	b557:
	mov rax, qword [rbp - 1584]
	cmp rax, 1
	je b558
	b559:
	mov rax, qword [rbp - 1584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 816]
	mov qword [rbp - 496], rax
	mov rax, qword [rbp - 752]
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 1496]
	mov qword [rbp - 40], rax
	mov rdx, rcx
	b560:
	cmp r14, 1
	je b561
	b562:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 496]
	mov r12, rax
	mov rax, qword [rbp - 40]
	mov r13, rax
	mov rax, qword [rbp - 304]
	mov rbx, rax
	mov rax, rdx
	b563:
	cmp rcx, 1
	je b564
	b565:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	call _cd
	inc rax
	jmp b566
	b564:
	inc rax
	b566:
	b567:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 304]
	mov r12, rax
	mov rax, qword [rbp - 496]
	mov r14, rax
	mov rax, qword [rbp - 40]
	mov r13, rax
	b568:
	cmp rcx, 1
	je b569
	b570:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rdx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rdx, rax
	mov rax, rbx
	mov r8, rdx
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b571
	b569:
	inc rdx
	b571:
	mov rax, rdx
	b572:
	mov rdx, rax
	inc rdx
	jmp b573
	b561:
	inc rdx
	b573:
	mov rax, rdx
	b574:
	mov rcx, rax
	mov rax, qword [rbp - 1584]
	sub rax, 1
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 1496]
	mov qword [rbp - 1144], rax
	mov rax, qword [rbp - 816]
	mov r13, rax
	mov rax, qword [rbp - 752]
	mov qword [rbp - 1232], rax
	b575:
	mov rax, qword [rbp - 24]
	cmp rax, 1
	je b576
	b577:
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 1144]
	mov r12, rax
	mov rax, qword [rbp - 1232]
	mov rbx, rax
	mov r14, r13
	b578:
	cmp rdx, 1
	je b579
	b580:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b581
	b579:
	inc rcx
	b581:
	mov rax, rcx
	b582:
	mov rcx, rax
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov rdx, rax
	mov r14, r13
	mov rax, qword [rbp - 1144]
	mov r12, rax
	mov rax, qword [rbp - 1232]
	mov r13, rax
	b583:
	cmp rdx, 1
	je b584
	b585:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b586
	b584:
	inc rcx
	b586:
	mov rax, rcx
	b587:
	mov rcx, rax
	inc rcx
	jmp b588
	b576:
	inc rcx
	b588:
	mov rax, rcx
	b589:
	mov rcx, rax
	inc rcx
	jmp b590
	b558:
	inc rcx
	b590:
	mov rax, rcx
	b591:
	mov rcx, rax
	mov rax, qword [rbp - 1056]
	sub rax, 1
	mov qword [rbp - 232], rax
	mov rax, qword [rbp - 1640]
	mov qword [rbp - 1216], rax
	mov rax, qword [rbp - 456]
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 1128]
	mov qword [rbp - 1720], rax
	b592:
	mov rax, qword [rbp - 232]
	cmp rax, 1
	je b593
	b594:
	mov rax, qword [rbp - 232]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1216]
	mov qword [rbp - 368], rax
	mov rax, qword [rbp - 1720]
	mov r13, rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 464], rax
	mov rdx, rcx
	b595:
	cmp r14, 1
	je b596
	b597:
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 368]
	mov r12, rcx
	mov rcx, qword [rbp - 464]
	mov qword [rbp - 864], rcx
	mov rbx, r13
	mov rcx, rdx
	b598:
	cmp rax, 1
	je b599
	b600:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rax, qword [rbp - 864]
	mov rcx, rax
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rdi, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rax, qword [rbp - 864]
	mov rsi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b601
	b599:
	inc rcx
	b601:
	mov rax, rcx
	b602:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov r14, r13
	mov rax, qword [rbp - 368]
	mov r12, rax
	mov rax, qword [rbp - 464]
	mov rbx, rax
	b603:
	cmp rcx, 1
	je b604
	b605:
	mov r13, rcx
	sub r13, 1
	mov r8, rdx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r13
	call _cd
	mov rdx, rax
	mov rax, r13
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b606
	b604:
	inc rdx
	b606:
	mov rax, rdx
	b607:
	mov rdx, rax
	inc rdx
	jmp b608
	b596:
	inc rdx
	b608:
	mov rax, rdx
	b609:
	mov rcx, rax
	mov rax, qword [rbp - 232]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 48]
	mov r14, rax
	mov rax, qword [rbp - 1216]
	mov qword [rbp - 760], rax
	mov rax, qword [rbp - 1720]
	mov qword [rbp - 920], rax
	b610:
	cmp r12, 1
	je b611
	b612:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rbx, r14
	mov rax, qword [rbp - 920]
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 760]
	mov r15, rax
	mov rax, rcx
	b613:
	cmp rdx, 1
	je b614
	b615:
	mov r13, rdx
	sub r13, 1
	mov r8, rax
	mov rax, qword [rbp - 144]
	mov rcx, rax
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rdi, r13
	mov r8, rax
	mov rcx, r15
	mov rdx, rbx
	mov rax, qword [rbp - 144]
	mov rsi, rax
	call _cd
	inc rax
	jmp b616
	b614:
	inc rax
	b616:
	b617:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 760]
	mov r12, rax
	mov r13, r14
	mov rax, qword [rbp - 920]
	mov r14, rax
	mov rax, rcx
	b618:
	cmp rdx, 1
	je b619
	b620:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	call _cd
	inc rax
	jmp b621
	b619:
	inc rax
	b621:
	b622:
	mov rcx, rax
	inc rcx
	jmp b623
	b611:
	inc rcx
	b623:
	mov rax, rcx
	b624:
	mov rcx, rax
	inc rcx
	jmp b625
	b593:
	inc rcx
	b625:
	mov rax, rcx
	b626:
	mov rcx, rax
	inc rcx
	jmp b627
	b555:
	inc rcx
	b627:
	mov rax, rcx
	b628:
	mov rcx, rax
	inc rcx
	jmp b629
	b477:
	inc rcx
	b629:
	mov rax, rcx
	b630:
	mov rcx, rax
	inc rcx
	jmp b631
	b319:
	inc rcx
	b631:
	mov rax, rcx
	b632:
	mov rcx, rax
	inc rcx
	jmp b633
	b1:
	inc rcx
	b633:
	mov rax, rcx
	b634:
	pop r13
	pop r14
	pop r12
	pop rbx
	pop r15
	leave
	ret 
_main:
	b635:
	push rbp
	mov rbp, rsp
	sub rsp, 864
	push r15
	push rbx
	push r12
	push r14
	push r13
	mov r14, g_0
	mov r13, g_1
	mov r12, g_2
	call __getInt
	mov qword [rbp - 176], rax
	mov rax, r14
	mov qword [rbp - 96], rax
	mov rax, r13
	mov qword [rbp - 744], rax
	mov rax, r12
	mov qword [rbp - 272], rax
	mov rcx, 0
	b636:
	mov rax, qword [rbp - 176]
	cmp rax, 1
	je b637
	b638:
	mov rax, qword [rbp - 176]
	sub rax, 1
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 96]
	mov qword [rbp - 480], rax
	mov rax, qword [rbp - 272]
	mov qword [rbp - 496], rax
	mov rax, qword [rbp - 744]
	mov qword [rbp - 344], rax
	b639:
	mov rax, qword [rbp - 576]
	cmp rax, 1
	je b640
	b641:
	mov rax, qword [rbp - 576]
	sub rax, 1
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 480]
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 416], rax
	mov rax, qword [rbp - 496]
	mov qword [rbp - 152], rax
	b642:
	mov rax, qword [rbp - 256]
	cmp rax, 1
	je b643
	b644:
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 240], rax
	b645:
	mov rax, qword [rbp - 664]
	cmp rax, 1
	je b646
	b647:
	mov rax, qword [rbp - 664]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 696]
	mov qword [rbp - 704], rax
	mov rax, qword [rbp - 240]
	mov qword [rbp - 528], rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 56], rax
	b648:
	cmp r12, 1
	je b649
	b650:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 704]
	mov rbx, rax
	mov rax, qword [rbp - 56]
	mov r13, rax
	mov rax, qword [rbp - 528]
	mov r14, rax
	mov rax, rcx
	b651:
	cmp rdx, 1
	je b652
	b653:
	mov r15, rdx
	sub r15, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r13
	call _cd
	inc rax
	jmp b654
	b652:
	inc rax
	b654:
	b655:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 528]
	mov r14, rax
	mov rax, qword [rbp - 704]
	mov r13, rax
	mov rax, qword [rbp - 56]
	mov r12, rax
	b656:
	cmp rdx, 1
	je b657
	b658:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b659
	b657:
	inc rcx
	b659:
	mov rax, rcx
	b660:
	mov rcx, rax
	inc rcx
	jmp b661
	b649:
	inc rcx
	b661:
	mov rax, rcx
	b662:
	mov rcx, rax
	mov rax, qword [rbp - 664]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 376]
	mov qword [rbp - 504], rax
	mov rax, qword [rbp - 696]
	mov qword [rbp - 816], rax
	mov rax, qword [rbp - 240]
	mov qword [rbp - 216], rax
	b663:
	cmp r13, 1
	je b664
	b665:
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 504]
	mov r14, rax
	mov rax, qword [rbp - 216]
	mov r12, rax
	mov rax, qword [rbp - 816]
	mov rbx, rax
	b666:
	cmp rdx, 1
	je b667
	b668:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b669
	b667:
	inc rcx
	b669:
	mov rax, rcx
	b670:
	mov rcx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 816]
	mov r14, rax
	mov rax, qword [rbp - 504]
	mov r12, rax
	mov rax, qword [rbp - 216]
	mov r13, rax
	b671:
	cmp rdx, 1
	je b672
	b673:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b674
	b672:
	inc rcx
	b674:
	mov rax, rcx
	b675:
	mov rcx, rax
	inc rcx
	jmp b676
	b664:
	inc rcx
	b676:
	mov rax, rcx
	b677:
	mov rcx, rax
	inc rcx
	jmp b678
	b646:
	inc rcx
	b678:
	mov rax, rcx
	b679:
	mov rcx, rax
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov qword [rbp - 512], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 760], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 328], rax
	b680:
	mov rax, qword [rbp - 512]
	cmp rax, 1
	je b681
	b682:
	mov rax, qword [rbp - 512]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 32]
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 328]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 760]
	mov qword [rbp - 552], rax
	mov rdx, rcx
	b683:
	cmp r13, 1
	je b684
	b685:
	mov rax, r13
	sub rax, 1
	mov rcx, qword [rbp - 104]
	mov r12, rcx
	mov rcx, qword [rbp - 552]
	mov r14, rcx
	mov rcx, qword [rbp - 112]
	mov rbx, rcx
	mov rcx, rdx
	b686:
	cmp rax, 1
	je b687
	b688:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b689
	b687:
	inc rcx
	b689:
	mov rax, rcx
	b690:
	mov rdx, rax
	mov rax, r13
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 112]
	mov r12, rax
	mov rax, qword [rbp - 104]
	mov r13, rax
	mov rax, qword [rbp - 552]
	mov rbx, rax
	mov rax, rdx
	b691:
	cmp rcx, 1
	je b692
	b693:
	mov r14, rcx
	sub r14, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	call _cd
	inc rax
	jmp b694
	b692:
	inc rax
	b694:
	b695:
	mov rdx, rax
	inc rdx
	jmp b696
	b684:
	inc rdx
	b696:
	mov rax, rdx
	b697:
	mov rcx, rax
	mov rax, qword [rbp - 512]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 760]
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 32]
	mov qword [rbp - 848], rax
	mov rax, qword [rbp - 328]
	mov qword [rbp - 608], rax
	mov rdx, rcx
	b698:
	cmp r12, 1
	je b699
	b700:
	mov rax, r12
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 120]
	mov r15, rax
	mov rax, qword [rbp - 608]
	mov r14, rax
	mov rax, qword [rbp - 848]
	mov rbx, rax
	b701:
	cmp rcx, 1
	je b702
	b703:
	mov r13, rcx
	sub r13, 1
	mov r8, rdx
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rdx, rax
	mov rax, r13
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b704
	b702:
	inc rdx
	b704:
	mov rax, rdx
	b705:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, qword [rbp - 848]
	mov r12, rcx
	mov rcx, qword [rbp - 120]
	mov r13, rcx
	mov rcx, qword [rbp - 608]
	mov r14, rcx
	mov rcx, rdx
	b706:
	cmp rax, 1
	je b707
	b708:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b709
	b707:
	inc rcx
	b709:
	mov rax, rcx
	b710:
	mov rdx, rax
	inc rdx
	jmp b711
	b699:
	inc rdx
	b711:
	mov rax, rdx
	b712:
	mov rcx, rax
	inc rcx
	jmp b713
	b681:
	inc rcx
	b713:
	mov rax, rcx
	b714:
	mov rcx, rax
	inc rcx
	jmp b715
	b643:
	inc rcx
	b715:
	mov rax, rcx
	b716:
	mov rcx, rax
	mov rax, qword [rbp - 576]
	sub rax, 1
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 496]
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 480]
	mov qword [rbp - 824], rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 232], rax
	b717:
	mov rax, qword [rbp - 208]
	cmp rax, 1
	je b718
	b719:
	mov rax, qword [rbp - 208]
	sub rax, 1
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 40]
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 232]
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 824]
	mov qword [rbp - 296], rax
	b720:
	mov rax, qword [rbp - 312]
	cmp rax, 1
	je b721
	b722:
	mov rax, qword [rbp - 312]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 392]
	mov qword [rbp - 592], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 160], rax
	mov rdx, rcx
	b723:
	cmp rbx, 1
	je b724
	b725:
	mov rax, rbx
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 592]
	mov r13, rax
	mov rax, qword [rbp - 160]
	mov r14, rax
	mov rax, qword [rbp - 304]
	mov r15, rax
	mov rcx, rdx
	b726:
	cmp rsi, 1
	je b727
	b728:
	mov r12, rsi
	sub r12, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r15
	mov rsi, r13
	mov rdi, r12
	call _cd
	mov rcx, rax
	mov rax, r12
	mov r8, rcx
	mov rcx, r15
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b729
	b727:
	inc rcx
	b729:
	mov rax, rcx
	b730:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, qword [rbp - 304]
	mov r14, rcx
	mov rcx, qword [rbp - 592]
	mov r12, rcx
	mov rcx, qword [rbp - 160]
	mov r13, rcx
	mov rcx, rdx
	b731:
	cmp rax, 1
	je b732
	b733:
	mov rbx, rax
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b734
	b732:
	inc rcx
	b734:
	mov rax, rcx
	b735:
	mov rdx, rax
	inc rdx
	jmp b736
	b724:
	inc rdx
	b736:
	mov rax, rdx
	b737:
	mov rcx, rax
	mov rax, qword [rbp - 312]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 392]
	mov qword [rbp - 472], rax
	mov rax, qword [rbp - 296]
	mov qword [rbp - 128], rax
	b738:
	cmp r13, 1
	je b739
	b740:
	mov rax, r13
	sub rax, 1
	mov rdx, qword [rbp - 264]
	mov r14, rdx
	mov rdx, qword [rbp - 128]
	mov rbx, rdx
	mov rdx, qword [rbp - 472]
	mov r12, rdx
	b741:
	cmp rax, 1
	je b742
	b743:
	mov r15, rax
	sub r15, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r14
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b744
	b742:
	inc rcx
	b744:
	mov rax, rcx
	b745:
	mov rcx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 472]
	mov rbx, rax
	mov rax, qword [rbp - 264]
	mov r14, rax
	mov rax, qword [rbp - 128]
	mov r12, rax
	b746:
	cmp rdx, 1
	je b747
	b748:
	mov r13, rdx
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b749
	b747:
	inc rcx
	b749:
	mov rax, rcx
	b750:
	mov rcx, rax
	inc rcx
	jmp b751
	b739:
	inc rcx
	b751:
	mov rax, rcx
	b752:
	mov rcx, rax
	inc rcx
	jmp b753
	b721:
	inc rcx
	b753:
	mov rax, rcx
	b754:
	mov rcx, rax
	mov rax, qword [rbp - 208]
	sub rax, 1
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 824]
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 40]
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 232]
	mov qword [rbp - 784], rax
	b755:
	mov rax, qword [rbp - 168]
	cmp rax, 1
	je b756
	b757:
	mov rax, qword [rbp - 168]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 24]
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 632], rax
	mov rax, qword [rbp - 408]
	mov qword [rbp - 720], rax
	b758:
	cmp r12, 1
	je b759
	b760:
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 400]
	mov r13, rax
	mov rax, qword [rbp - 720]
	mov r15, rax
	mov rax, qword [rbp - 632]
	mov r14, rax
	mov rax, rcx
	b761:
	cmp rdx, 1
	je b762
	b763:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r15
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r14
	mov rdx, r13
	mov rsi, r15
	call _cd
	inc rax
	jmp b764
	b762:
	inc rax
	b764:
	b765:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 632]
	mov r14, rax
	mov rax, qword [rbp - 400]
	mov r13, rax
	mov rax, qword [rbp - 720]
	mov r12, rax
	mov rax, rcx
	b766:
	cmp rdx, 1
	je b767
	b768:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	call _cd
	inc rax
	jmp b769
	b767:
	inc rax
	b769:
	b770:
	mov rcx, rax
	inc rcx
	jmp b771
	b759:
	inc rcx
	b771:
	mov rax, rcx
	b772:
	mov rcx, rax
	mov rax, qword [rbp - 168]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 408]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 24]
	mov qword [rbp - 464], rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 808], rax
	b773:
	cmp r12, 1
	je b774
	b775:
	mov rax, r12
	sub rax, 1
	mov rdx, qword [rbp - 224]
	mov r13, rdx
	mov rdx, qword [rbp - 808]
	mov rbx, rdx
	mov rdx, qword [rbp - 464]
	mov r15, rdx
	b776:
	cmp rax, 1
	je b777
	b778:
	mov r14, rax
	sub r14, 1
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r15
	mov rsi, r13
	mov rdi, r14
	call _cd
	mov rcx, rax
	mov rax, r14
	mov r8, rcx
	mov rcx, r15
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b779
	b777:
	inc rcx
	b779:
	mov rax, rcx
	b780:
	mov rcx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 464]
	mov r13, rax
	mov rax, qword [rbp - 224]
	mov r14, rax
	mov rax, qword [rbp - 808]
	mov r12, rax
	b781:
	cmp rdx, 1
	je b782
	b783:
	mov rbx, rdx
	sub rbx, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b784
	b782:
	inc rcx
	b784:
	mov rax, rcx
	b785:
	mov rcx, rax
	inc rcx
	jmp b786
	b774:
	inc rcx
	b786:
	mov rax, rcx
	b787:
	mov rcx, rax
	inc rcx
	jmp b788
	b756:
	inc rcx
	b788:
	mov rax, rcx
	b789:
	mov rcx, rax
	inc rcx
	jmp b790
	b718:
	inc rcx
	b790:
	mov rax, rcx
	b791:
	mov rcx, rax
	inc rcx
	jmp b792
	b640:
	inc rcx
	b792:
	mov rax, rcx
	b793:
	mov rcx, rax
	mov rax, qword [rbp - 176]
	sub rax, 1
	mov qword [rbp - 752], rax
	mov rax, qword [rbp - 744]
	mov qword [rbp - 624], rax
	mov rax, qword [rbp - 96]
	mov qword [rbp - 616], rax
	mov rax, qword [rbp - 272]
	mov qword [rbp - 560], rax
	b794:
	mov rax, qword [rbp - 752]
	cmp rax, 1
	je b795
	b796:
	mov rax, qword [rbp - 752]
	sub rax, 1
	mov qword [rbp - 536], rax
	mov rax, qword [rbp - 624]
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 560]
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 616]
	mov qword [rbp - 856], rax
	b797:
	mov rax, qword [rbp - 536]
	cmp rax, 1
	je b798
	b799:
	mov rax, qword [rbp - 536]
	sub rax, 1
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 80]
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 856]
	mov qword [rbp - 648], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 672], rax
	b800:
	mov rax, qword [rbp - 72]
	cmp rax, 1
	je b801
	b802:
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 424]
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 672]
	mov qword [rbp - 488], rax
	mov rax, qword [rbp - 648]
	mov qword [rbp - 768], rax
	mov rdx, rcx
	b803:
	cmp r14, 1
	je b804
	b805:
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 184]
	mov r15, rax
	mov rax, qword [rbp - 768]
	mov r12, rax
	mov rax, qword [rbp - 488]
	mov r13, rax
	b806:
	cmp rcx, 1
	je b807
	b808:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rdx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r15
	mov rdi, rbx
	call _cd
	mov rdx, rax
	mov rax, rbx
	mov r8, rdx
	mov rcx, r13
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b809
	b807:
	inc rdx
	b809:
	mov rax, rdx
	b810:
	mov rdx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 488]
	mov r14, rax
	mov rax, qword [rbp - 184]
	mov r12, rax
	mov rax, qword [rbp - 768]
	mov r13, rax
	b811:
	cmp rcx, 1
	je b812
	b813:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rdx
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdx, rax
	mov rax, rbx
	mov r8, rdx
	mov rcx, r13
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b814
	b812:
	inc rdx
	b814:
	mov rax, rdx
	b815:
	mov rdx, rax
	inc rdx
	jmp b816
	b804:
	inc rdx
	b816:
	mov rax, rdx
	b817:
	mov rcx, rax
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 648]
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 424]
	mov qword [rbp - 600], rax
	mov rax, qword [rbp - 672]
	mov qword [rbp - 368], rax
	mov rdx, rcx
	b818:
	cmp r13, 1
	je b819
	b820:
	mov rax, r13
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 88]
	mov rbx, rax
	mov rax, qword [rbp - 368]
	mov r12, rax
	mov rax, qword [rbp - 600]
	mov r14, rax
	mov rax, rdx
	b821:
	cmp rcx, 1
	je b822
	b823:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, rbx
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rcx, r14
	mov rdx, rbx
	mov rsi, r12
	call _cd
	inc rax
	jmp b824
	b822:
	inc rax
	b824:
	b825:
	mov rdx, rax
	mov rax, r13
	sub rax, 1
	mov rsi, rax
	mov rax, qword [rbp - 600]
	mov r13, rax
	mov rax, qword [rbp - 88]
	mov r12, rax
	mov rax, qword [rbp - 368]
	mov r14, rax
	mov rcx, rdx
	b826:
	cmp rsi, 1
	je b827
	b828:
	mov rbx, rsi
	sub rbx, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rcx, rax
	mov rax, rbx
	mov r8, rcx
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b829
	b827:
	inc rcx
	b829:
	mov rax, rcx
	b830:
	mov rdx, rax
	inc rdx
	jmp b831
	b819:
	inc rdx
	b831:
	mov rax, rdx
	b832:
	mov rcx, rax
	inc rcx
	jmp b833
	b801:
	inc rcx
	b833:
	mov rax, rcx
	b834:
	mov rcx, rax
	mov rax, qword [rbp - 536]
	sub rax, 1
	mov qword [rbp - 280], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 80]
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 856]
	mov qword [rbp - 432], rax
	b835:
	mov rax, qword [rbp - 280]
	cmp rax, 1
	je b836
	b837:
	mov rax, qword [rbp - 280]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 200]
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 432]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 640], rax
	mov rdx, rcx
	b838:
	cmp rbx, 1
	je b839
	b840:
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 192]
	mov r13, rax
	mov rax, qword [rbp - 640]
	mov r14, rax
	mov rax, qword [rbp - 384]
	mov r15, rax
	mov rax, rdx
	b841:
	cmp rcx, 1
	je b842
	b843:
	mov r12, rcx
	sub r12, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r15
	mov rsi, r13
	mov rdi, r12
	call _cd
	mov rdi, r12
	mov r8, rax
	mov rcx, r15
	mov rdx, r13
	mov rsi, r14
	call _cd
	inc rax
	jmp b844
	b842:
	inc rax
	b844:
	b845:
	mov rdx, rax
	mov rax, rbx
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 384]
	mov r14, rax
	mov rax, qword [rbp - 192]
	mov r13, rax
	mov rax, qword [rbp - 640]
	mov r12, rax
	mov rax, rdx
	b846:
	cmp rcx, 1
	je b847
	b848:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	call _cd
	inc rax
	jmp b849
	b847:
	inc rax
	b849:
	b850:
	mov rdx, rax
	inc rdx
	jmp b851
	b839:
	inc rdx
	b851:
	mov rax, rdx
	b852:
	mov rcx, rax
	mov rax, qword [rbp - 280]
	sub rax, 1
	mov qword [rbp - 712], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 200]
	mov r12, rax
	mov rax, qword [rbp - 432]
	mov qword [rbp - 440], rax
	mov rdx, rcx
	b853:
	mov rax, qword [rbp - 712]
	cmp rax, 1
	je b854
	b855:
	mov rax, qword [rbp - 712]
	sub rax, 1
	mov rcx, qword [rbp - 64]
	mov rbx, rcx
	mov rcx, qword [rbp - 440]
	mov r14, rcx
	mov r15, r12
	mov rcx, rdx
	b856:
	cmp rax, 1
	je b857
	b858:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r15
	mov rsi, rbx
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r15
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b859
	b857:
	inc rcx
	b859:
	mov rax, rcx
	b860:
	mov rdx, rax
	mov rax, qword [rbp - 712]
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 64]
	mov r14, rax
	mov rax, qword [rbp - 440]
	mov r13, rax
	mov rax, rdx
	b861:
	cmp rcx, 1
	je b862
	b863:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r13
	mov rsi, r12
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	call _cd
	inc rax
	jmp b864
	b862:
	inc rax
	b864:
	b865:
	mov rdx, rax
	inc rdx
	jmp b866
	b854:
	inc rdx
	b866:
	mov rax, rdx
	b867:
	mov rcx, rax
	inc rcx
	jmp b868
	b836:
	inc rcx
	b868:
	mov rax, rcx
	b869:
	mov rcx, rax
	inc rcx
	jmp b870
	b798:
	inc rcx
	b870:
	mov rax, rcx
	b871:
	mov rcx, rax
	mov rax, qword [rbp - 752]
	sub rax, 1
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 616]
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 624]
	mov qword [rbp - 800], rax
	mov rax, qword [rbp - 560]
	mov qword [rbp - 728], rax
	b872:
	mov rax, qword [rbp - 520]
	cmp rax, 1
	je b873
	b874:
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov qword [rbp - 832], rax
	mov rax, qword [rbp - 568]
	mov qword [rbp - 320], rax
	mov rax, qword [rbp - 728]
	mov qword [rbp - 736], rax
	mov rax, qword [rbp - 800]
	mov qword [rbp - 792], rax
	b875:
	mov rax, qword [rbp - 832]
	cmp rax, 1
	je b876
	b877:
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 320]
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 792]
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 736]
	mov qword [rbp - 864], rax
	mov rax, rcx
	b878:
	cmp r14, 1
	je b879
	b880:
	mov rcx, r14
	sub rcx, 1
	mov rdx, rcx
	mov rcx, qword [rbp - 16]
	mov r13, rcx
	mov rcx, qword [rbp - 864]
	mov r12, rcx
	mov rcx, qword [rbp - 8]
	mov rbx, rcx
	mov rcx, rax
	b881:
	cmp rdx, 1
	je b882
	b883:
	mov r15, rdx
	sub r15, 1
	mov r8, rcx
	mov rcx, r12
	mov rdx, rbx
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rcx, rax
	mov rax, r15
	mov r8, rcx
	mov rcx, rbx
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b884
	b882:
	inc rcx
	b884:
	mov rax, rcx
	b885:
	mov rcx, r14
	sub rcx, 1
	mov rdx, qword [rbp - 8]
	mov r14, rdx
	mov rdx, qword [rbp - 16]
	mov r13, rdx
	mov rdx, qword [rbp - 864]
	mov r12, rdx
	b886:
	cmp rcx, 1
	je b887
	b888:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	call _cd
	inc rax
	jmp b889
	b887:
	inc rax
	b889:
	b890:
	inc rax
	jmp b891
	b879:
	inc rax
	b891:
	b892:
	mov rcx, rax
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 736]
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 320]
	mov rbx, rax
	mov rax, qword [rbp - 792]
	mov qword [rbp - 840], rax
	mov rdx, rcx
	b893:
	mov rax, qword [rbp - 336]
	cmp rax, 1
	je b894
	b895:
	mov rax, qword [rbp - 336]
	sub rax, 1
	mov rcx, qword [rbp - 248]
	mov r15, rcx
	mov rcx, qword [rbp - 840]
	mov r14, rcx
	mov r12, rbx
	mov rcx, rdx
	b896:
	cmp rax, 1
	je b897
	b898:
	mov r13, rax
	sub r13, 1
	mov r8, rcx
	mov rcx, r14
	mov rdx, r12
	mov rsi, r15
	mov rdi, r13
	call _cd
	mov rcx, rax
	mov rax, r13
	mov r8, rcx
	mov rcx, r12
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _cd
	mov rcx, rax
	inc rcx
	jmp b899
	b897:
	inc rcx
	b899:
	mov rax, rcx
	b900:
	mov rdx, rax
	mov rax, qword [rbp - 336]
	sub rax, 1
	mov rcx, rax
	mov r12, rbx
	mov rax, qword [rbp - 248]
	mov r13, rax
	mov rax, qword [rbp - 840]
	mov rbx, rax
	b901:
	cmp rcx, 1
	je b902
	b903:
	mov r14, rcx
	sub r14, 1
	mov r8, rdx
	mov rcx, r13
	mov rdx, rbx
	mov rsi, r12
	mov rdi, r14
	call _cd
	mov rdx, rax
	mov rax, r14
	mov r8, rdx
	mov rcx, rbx
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _cd
	mov rdx, rax
	inc rdx
	jmp b904
	b902:
	inc rdx
	b904:
	mov rax, rdx
	b905:
	mov rdx, rax
	inc rdx
	jmp b906
	b894:
	inc rdx
	b906:
	mov rax, rdx
	b907:
	mov rcx, rax
	inc rcx
	jmp b908
	b876:
	inc rcx
	b908:
	mov rax, rcx
	b909:
	mov rcx, rax
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov qword [rbp - 544], rax
	mov rax, qword [rbp - 800]
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 568]
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 728]
	mov qword [rbp - 776], rax
	mov rax, rcx
	b910:
	mov rcx, qword [rbp - 544]
	cmp rcx, 1
	je b911
	b912:
	mov rcx, qword [rbp - 544]
	sub rcx, 1
	mov r12, rcx
	mov rcx, qword [rbp - 288]
	mov qword [rbp - 584], rcx
	mov rcx, qword [rbp - 776]
	mov r14, rcx
	mov rcx, qword [rbp - 360]
	mov qword [rbp - 456], rcx
	mov rdx, rax
	b913:
	cmp r12, 1
	je b914
	b915:
	mov rax, r12
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 584]
	mov r13, rax
	mov rax, qword [rbp - 456]
	mov rbx, rax
	mov rax, r14
	mov qword [rbp - 352], rax
	mov rax, rdx
	b916:
	cmp rcx, 1
	je b917
	b918:
	mov r15, rcx
	sub r15, 1
	mov r8, rax
	mov rcx, rbx
	mov rax, qword [rbp - 352]
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _cd
	mov rdi, r15
	mov r8, rax
	mov rax, qword [rbp - 352]
	mov rcx, rax
	mov rdx, r13
	mov rsi, rbx
	call _cd
	inc rax
	jmp b919
	b917:
	inc rax
	b919:
	b920:
	mov rdx, rax
	mov rax, r12
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 584]
	mov r13, rax
	mov rax, qword [rbp - 456]
	mov r12, rax
	mov rax, rdx
	b921:
	cmp rcx, 1
	je b922
	b923:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r13
	mov rdx, r12
	mov rsi, r14
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r14
	mov rsi, r13
	call _cd
	inc rax
	jmp b924
	b922:
	inc rax
	b924:
	b925:
	mov rdx, rax
	inc rdx
	jmp b926
	b914:
	inc rdx
	b926:
	mov rax, rdx
	b927:
	mov rcx, qword [rbp - 544]
	sub rcx, 1
	mov qword [rbp - 688], rcx
	mov rcx, qword [rbp - 360]
	mov qword [rbp - 448], rcx
	mov rcx, qword [rbp - 288]
	mov r15, rcx
	mov rcx, qword [rbp - 776]
	mov rbx, rcx
	mov rdx, rax
	b928:
	mov rax, qword [rbp - 688]
	cmp rax, 1
	je b929
	b930:
	mov rax, qword [rbp - 688]
	sub rax, 1
	mov rcx, rax
	mov rax, qword [rbp - 448]
	mov r13, rax
	mov r12, rbx
	mov rax, r15
	mov qword [rbp - 136], rax
	mov rax, rdx
	b931:
	cmp rcx, 1
	je b932
	b933:
	mov r14, rcx
	sub r14, 1
	mov r8, rax
	mov rcx, r12
	mov rax, qword [rbp - 136]
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _cd
	mov rdi, r14
	mov r8, rax
	mov rax, qword [rbp - 136]
	mov rcx, rax
	mov rdx, r13
	mov rsi, r12
	call _cd
	inc rax
	jmp b934
	b932:
	inc rax
	b934:
	b935:
	mov rdx, rax
	mov rax, qword [rbp - 688]
	sub rax, 1
	mov rcx, rax
	mov r13, r15
	mov rax, qword [rbp - 448]
	mov r14, rax
	mov r12, rbx
	mov rax, rdx
	b936:
	cmp rcx, 1
	je b937
	b938:
	mov rbx, rcx
	sub rbx, 1
	mov r8, rax
	mov rcx, r14
	mov rdx, r12
	mov rsi, r13
	mov rdi, rbx
	call _cd
	mov rdi, rbx
	mov r8, rax
	mov rcx, r12
	mov rdx, r13
	mov rsi, r14
	call _cd
	inc rax
	jmp b939
	b937:
	inc rax
	b939:
	b940:
	mov rdx, rax
	inc rdx
	jmp b941
	b929:
	inc rdx
	b941:
	mov rax, rdx
	b942:
	inc rax
	jmp b943
	b911:
	inc rax
	b943:
	b944:
	mov rcx, rax
	inc rcx
	jmp b945
	b873:
	inc rcx
	b945:
	mov rax, rcx
	b946:
	mov rcx, rax
	inc rcx
	jmp b947
	b795:
	inc rcx
	b947:
	mov rax, rcx
	b948:
	mov rcx, rax
	inc rcx
	jmp b949
	b637:
	inc rcx
	b949:
	mov rax, rcx
	b950:
	mov rdi, rax
	call __toString
	mov rdi, rax
	call __println
	mov rax, 0
	b951:
	pop r13
	pop r14
	pop r12
	pop rbx
	pop r15
	leave
	ret 
__init:
	b952:
	push rbp
	mov rbp, rsp
	call _main
	leave
	ret 
	section .data
g_0:
	dq 1
	db 41H, 00H
g_1:
	dq 1
	db 42H, 00H
g_2:
	dq 1
	db 43H, 00H
