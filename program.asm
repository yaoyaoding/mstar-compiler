





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
_tak:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 3408
	push r13
	push r12
	push r14
	push r15
	push rbx
	mov rax, rdi
	mov qword [rbp - 2680], rax
	mov rax, rsi
	mov qword [rbp - 1992], rax
	mov rax, rdx
	mov qword [rbp - 3328], rax
	mov rcx, qword [rbp - 1992]
	mov rax, qword [rbp - 2680]
	cmp rcx, rax
	jl b1
	b2:
	mov rax, qword [rbp - 3328]
	jmp b3
	b1:
	mov rax, qword [rbp - 2680]
	sub rax, 1
	mov qword [rbp - 744], rax
	mov rax, qword [rbp - 1992]
	mov qword [rbp - 1128], rax
	mov rax, qword [rbp - 3328]
	mov qword [rbp - 2600], rax
	b4:
	mov rcx, qword [rbp - 1128]
	mov rax, qword [rbp - 744]
	cmp rcx, rax
	jl b5
	b6:
	mov rax, qword [rbp - 2600]
	jmp b7
	b5:
	mov rax, qword [rbp - 744]
	sub rax, 1
	mov qword [rbp - 768], rax
	mov rax, qword [rbp - 1128]
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 2600]
	mov qword [rbp - 1776], rax
	b8:
	mov rcx, qword [rbp - 48]
	mov rax, qword [rbp - 768]
	cmp rcx, rax
	jl b9
	b10:
	mov rax, qword [rbp - 1776]
	jmp b11
	b9:
	mov rax, qword [rbp - 768]
	sub rax, 1
	mov qword [rbp - 3144], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 3040], rax
	mov rax, qword [rbp - 1776]
	mov qword [rbp - 2440], rax
	b12:
	mov rax, qword [rbp - 3040]
	mov rcx, qword [rbp - 3144]
	cmp rax, rcx
	jl b13
	b14:
	mov rax, qword [rbp - 2440]
	jmp b15
	b13:
	mov rax, qword [rbp - 3144]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3040]
	mov r13, rax
	mov rax, qword [rbp - 2440]
	mov r12, rax
	b16:
	cmp r13, r15
	jl b17
	b18:
	mov rax, r12
	jmp b19
	b17:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b19:
	mov qword [rbp - 1816], rax
	mov rax, qword [rbp - 3040]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2440]
	mov r12, rax
	mov rax, qword [rbp - 3144]
	mov r13, rax
	b20:
	cmp r12, r14
	jl b21
	b22:
	mov rax, r13
	jmp b23
	b21:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b23:
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 2440]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3144]
	mov r15, rax
	mov rax, qword [rbp - 3040]
	mov r13, rax
	b24:
	cmp r15, r12
	jl b25
	b26:
	mov rax, r13
	jmp b27
	b25:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b27:
	mov rcx, rax
	mov rax, qword [rbp - 1816]
	mov rbx, rax
	mov rax, qword [rbp - 120]
	mov r12, rax
	mov r14, rcx
	b28:
	cmp r12, rbx
	jl b29
	b30:
	mov rax, r14
	jmp b31
	b29:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b31:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b15:
	mov qword [rbp - 440], rax
	mov rax, qword [rbp - 48]
	sub rax, 1
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 1776]
	mov qword [rbp - 3080], rax
	mov rax, qword [rbp - 768]
	mov qword [rbp - 88], rax
	b32:
	mov rcx, qword [rbp - 3080]
	mov rax, qword [rbp - 664]
	cmp rcx, rax
	jl b33
	b34:
	mov rax, qword [rbp - 88]
	jmp b35
	b33:
	mov rax, qword [rbp - 664]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3080]
	mov r14, rax
	mov rax, qword [rbp - 88]
	mov r15, rax
	b36:
	cmp r14, r12
	jl b37
	b38:
	mov rax, r15
	jmp b39
	b37:
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b39:
	mov qword [rbp - 2120], rax
	mov rax, qword [rbp - 3080]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 88]
	mov r15, rax
	mov rax, qword [rbp - 664]
	mov rbx, rax
	b40:
	cmp r15, r14
	jl b41
	b42:
	mov rax, rbx
	jmp b43
	b41:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b43:
	mov qword [rbp - 800], rax
	mov rax, qword [rbp - 88]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 664]
	mov r14, rax
	mov rax, qword [rbp - 3080]
	mov rbx, rax
	b44:
	cmp r14, r15
	jl b45
	b46:
	mov rax, rbx
	jmp b47
	b45:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b47:
	mov rcx, rax
	mov rax, qword [rbp - 2120]
	mov r15, rax
	mov rax, qword [rbp - 800]
	mov r14, rax
	mov r13, rcx
	b48:
	cmp r14, r15
	jl b49
	b50:
	mov rax, r13
	jmp b51
	b49:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b51:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b35:
	mov qword [rbp - 1280], rax
	mov rax, qword [rbp - 1776]
	sub rax, 1
	mov qword [rbp - 3120], rax
	mov rax, qword [rbp - 768]
	mov qword [rbp - 2752], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 2416], rax
	b52:
	mov rcx, qword [rbp - 2752]
	mov rax, qword [rbp - 3120]
	cmp rcx, rax
	jl b53
	b54:
	mov rax, qword [rbp - 2416]
	jmp b55
	b53:
	mov rax, qword [rbp - 3120]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2752]
	mov rbx, rax
	mov rax, qword [rbp - 2416]
	mov r14, rax
	b56:
	cmp rbx, r15
	jl b57
	b58:
	mov rax, r14
	jmp b59
	b57:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b59:
	mov qword [rbp - 2160], rax
	mov rax, qword [rbp - 2752]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2416]
	mov r14, rax
	mov rax, qword [rbp - 3120]
	mov rbx, rax
	b60:
	cmp r14, r15
	jl b61
	b62:
	mov rax, rbx
	jmp b63
	b61:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b63:
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 2416]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3120]
	mov r14, rax
	mov rax, qword [rbp - 2752]
	mov r13, rax
	b64:
	cmp r14, r15
	jl b65
	b66:
	mov rax, r13
	jmp b67
	b65:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b67:
	mov rcx, qword [rbp - 2160]
	mov r13, rcx
	mov rcx, qword [rbp - 192]
	mov r15, rcx
	mov rbx, rax
	b68:
	cmp r15, r13
	jl b69
	b70:
	mov rax, rbx
	jmp b71
	b69:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b71:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b55:
	mov rcx, rax
	mov rax, qword [rbp - 440]
	mov qword [rbp - 2736], rax
	mov rax, qword [rbp - 1280]
	mov qword [rbp - 3224], rax
	mov rax, rcx
	mov qword [rbp - 3256], rax
	b72:
	mov rcx, qword [rbp - 3224]
	mov rax, qword [rbp - 2736]
	cmp rcx, rax
	jl b73
	b74:
	mov rax, qword [rbp - 3256]
	jmp b75
	b73:
	mov rax, qword [rbp - 2736]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3224]
	mov rbx, rax
	mov rax, qword [rbp - 3256]
	mov r13, rax
	b76:
	cmp rbx, r15
	jl b77
	b78:
	mov rax, r13
	jmp b79
	b77:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b79:
	mov qword [rbp - 2096], rax
	mov rax, qword [rbp - 3224]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3256]
	mov r15, rax
	mov rax, qword [rbp - 2736]
	mov r14, rax
	b80:
	cmp r15, r12
	jl b81
	b82:
	mov rax, r14
	jmp b83
	b81:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b83:
	mov qword [rbp - 432], rax
	mov rax, qword [rbp - 3256]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2736]
	mov r12, rax
	mov rax, qword [rbp - 3224]
	mov r15, rax
	b84:
	cmp r12, r14
	jl b85
	b86:
	mov rax, r15
	jmp b87
	b85:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b87:
	mov rcx, rax
	mov rax, qword [rbp - 2096]
	mov r12, rax
	mov rax, qword [rbp - 432]
	mov r15, rax
	mov r13, rcx
	b88:
	cmp r15, r12
	jl b89
	b90:
	mov rax, r13
	jmp b91
	b89:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b91:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b75:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b11:
	mov qword [rbp - 2312], rax
	mov rax, qword [rbp - 1128]
	sub rax, 1
	mov qword [rbp - 3272], rax
	mov rax, qword [rbp - 2600]
	mov qword [rbp - 2928], rax
	mov rax, qword [rbp - 744]
	mov qword [rbp - 3280], rax
	b92:
	mov rcx, qword [rbp - 2928]
	mov rax, qword [rbp - 3272]
	cmp rcx, rax
	jl b93
	b94:
	mov rax, qword [rbp - 3280]
	jmp b95
	b93:
	mov rax, qword [rbp - 3272]
	sub rax, 1
	mov qword [rbp - 1144], rax
	mov rax, qword [rbp - 2928]
	mov qword [rbp - 544], rax
	mov rax, qword [rbp - 3280]
	mov qword [rbp - 144], rax
	b96:
	mov rax, qword [rbp - 544]
	mov rcx, qword [rbp - 1144]
	cmp rax, rcx
	jl b97
	b98:
	mov rax, qword [rbp - 144]
	jmp b99
	b97:
	mov rax, qword [rbp - 1144]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 544]
	mov r12, rax
	mov rax, qword [rbp - 144]
	mov r14, rax
	b100:
	cmp r12, rbx
	jl b101
	b102:
	mov rax, r14
	jmp b103
	b101:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b103:
	mov qword [rbp - 3152], rax
	mov rax, qword [rbp - 544]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 144]
	mov rbx, rax
	mov rax, qword [rbp - 1144]
	mov r15, rax
	b104:
	cmp rbx, r13
	jl b105
	b106:
	mov rax, r15
	jmp b107
	b105:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b107:
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 144]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1144]
	mov r13, rax
	mov rax, qword [rbp - 544]
	mov r14, rax
	b108:
	cmp r13, rbx
	jl b109
	b110:
	mov rax, r14
	jmp b111
	b109:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b111:
	mov rcx, rax
	mov rax, qword [rbp - 3152]
	mov r15, rax
	mov rax, qword [rbp - 408]
	mov rbx, rax
	mov r14, rcx
	b112:
	cmp rbx, r15
	jl b113
	b114:
	mov rax, r14
	jmp b115
	b113:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b115:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b99:
	mov qword [rbp - 3216], rax
	mov rax, qword [rbp - 2928]
	sub rax, 1
	mov qword [rbp - 1832], rax
	mov rax, qword [rbp - 3280]
	mov qword [rbp - 1000], rax
	mov rax, qword [rbp - 3272]
	mov qword [rbp - 1856], rax
	b116:
	mov rax, qword [rbp - 1000]
	mov rcx, qword [rbp - 1832]
	cmp rax, rcx
	jl b117
	b118:
	mov rax, qword [rbp - 1856]
	jmp b119
	b117:
	mov rax, qword [rbp - 1832]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1000]
	mov r14, rax
	mov rax, qword [rbp - 1856]
	mov r13, rax
	b120:
	cmp r14, r12
	jl b121
	b122:
	mov rax, r13
	jmp b123
	b121:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b123:
	mov qword [rbp - 1824], rax
	mov rax, qword [rbp - 1000]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1856]
	mov rbx, rax
	mov rax, qword [rbp - 1832]
	mov r13, rax
	b124:
	cmp rbx, r15
	jl b125
	b126:
	mov rax, r13
	jmp b127
	b125:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b127:
	mov qword [rbp - 712], rax
	mov rax, qword [rbp - 1856]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1832]
	mov r14, rax
	mov rax, qword [rbp - 1000]
	mov rbx, rax
	b128:
	cmp r14, r12
	jl b129
	b130:
	mov rax, rbx
	jmp b131
	b129:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b131:
	mov rcx, qword [rbp - 1824]
	mov r14, rcx
	mov rcx, qword [rbp - 712]
	mov r15, rcx
	mov r13, rax
	b132:
	cmp r15, r14
	jl b133
	b134:
	mov rax, r13
	jmp b135
	b133:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b135:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b119:
	mov qword [rbp - 3352], rax
	mov rax, qword [rbp - 3280]
	sub rax, 1
	mov qword [rbp - 1936], rax
	mov rax, qword [rbp - 3272]
	mov qword [rbp - 368], rax
	mov rax, qword [rbp - 2928]
	mov qword [rbp - 1848], rax
	b136:
	mov rax, qword [rbp - 368]
	mov rcx, qword [rbp - 1936]
	cmp rax, rcx
	jl b137
	b138:
	mov rax, qword [rbp - 1848]
	jmp b139
	b137:
	mov rax, qword [rbp - 1936]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 368]
	mov r15, rax
	mov rax, qword [rbp - 1848]
	mov r12, rax
	b140:
	cmp r15, r14
	jl b141
	b142:
	mov rax, r12
	jmp b143
	b141:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b143:
	mov qword [rbp - 2536], rax
	mov rax, qword [rbp - 368]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1848]
	mov rbx, rax
	mov rax, qword [rbp - 1936]
	mov r12, rax
	b144:
	cmp rbx, r14
	jl b145
	b146:
	mov rax, r12
	jmp b147
	b145:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b147:
	mov qword [rbp - 2104], rax
	mov rax, qword [rbp - 1848]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1936]
	mov rbx, rax
	mov rax, qword [rbp - 368]
	mov r13, rax
	b148:
	cmp rbx, r14
	jl b149
	b150:
	mov rax, r13
	jmp b151
	b149:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b151:
	mov rcx, rax
	mov rax, qword [rbp - 2536]
	mov r12, rax
	mov rax, qword [rbp - 2104]
	mov r14, rax
	mov rbx, rcx
	b152:
	cmp r14, r12
	jl b153
	b154:
	mov rax, rbx
	jmp b155
	b153:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b155:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b139:
	mov rcx, qword [rbp - 3216]
	mov qword [rbp - 1872], rcx
	mov rcx, qword [rbp - 3352]
	mov qword [rbp - 1664], rcx
	mov qword [rbp - 992], rax
	b156:
	mov rcx, qword [rbp - 1664]
	mov rax, qword [rbp - 1872]
	cmp rcx, rax
	jl b157
	b158:
	mov rax, qword [rbp - 992]
	jmp b159
	b157:
	mov rax, qword [rbp - 1872]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1664]
	mov r14, rax
	mov rax, qword [rbp - 992]
	mov r12, rax
	b160:
	cmp r14, r15
	jl b161
	b162:
	mov rax, r12
	jmp b163
	b161:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b163:
	mov qword [rbp - 3192], rax
	mov rax, qword [rbp - 1664]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 992]
	mov r14, rax
	mov rax, qword [rbp - 1872]
	mov rbx, rax
	b164:
	cmp r14, r15
	jl b165
	b166:
	mov rax, rbx
	jmp b167
	b165:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b167:
	mov qword [rbp - 1432], rax
	mov rax, qword [rbp - 992]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1872]
	mov r15, rax
	mov rax, qword [rbp - 1664]
	mov r13, rax
	b168:
	cmp r15, r14
	jl b169
	b170:
	mov rax, r13
	jmp b171
	b169:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b171:
	mov rcx, rax
	mov rax, qword [rbp - 3192]
	mov r12, rax
	mov rax, qword [rbp - 1432]
	mov r13, rax
	mov r15, rcx
	b172:
	cmp r13, r12
	jl b173
	b174:
	mov rax, r15
	jmp b175
	b173:
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b175:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b159:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b95:
	mov qword [rbp - 640], rax
	mov rax, qword [rbp - 2600]
	sub rax, 1
	mov qword [rbp - 2704], rax
	mov rax, qword [rbp - 744]
	mov qword [rbp - 2840], rax
	mov rax, qword [rbp - 1128]
	mov qword [rbp - 336], rax
	b176:
	mov rax, qword [rbp - 2840]
	mov rcx, qword [rbp - 2704]
	cmp rax, rcx
	jl b177
	b178:
	mov rax, qword [rbp - 336]
	jmp b179
	b177:
	mov rax, qword [rbp - 2704]
	sub rax, 1
	mov qword [rbp - 1680], rax
	mov rax, qword [rbp - 2840]
	mov qword [rbp - 2448], rax
	mov rax, qword [rbp - 336]
	mov qword [rbp - 40], rax
	b180:
	mov rax, qword [rbp - 2448]
	mov rcx, qword [rbp - 1680]
	cmp rax, rcx
	jl b181
	b182:
	mov rax, qword [rbp - 40]
	jmp b183
	b181:
	mov rax, qword [rbp - 1680]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2448]
	mov r12, rax
	mov rax, qword [rbp - 40]
	mov rbx, rax
	b184:
	cmp r12, r13
	jl b185
	b186:
	mov rax, rbx
	jmp b187
	b185:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b187:
	mov qword [rbp - 528], rax
	mov rax, qword [rbp - 2448]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 40]
	mov r12, rax
	mov rax, qword [rbp - 1680]
	mov r13, rax
	b188:
	cmp r12, r15
	jl b189
	b190:
	mov rax, r13
	jmp b191
	b189:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b191:
	mov qword [rbp - 1104], rax
	mov rax, qword [rbp - 40]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1680]
	mov r15, rax
	mov rax, qword [rbp - 2448]
	mov r12, rax
	b192:
	cmp r15, r14
	jl b193
	b194:
	mov rax, r12
	jmp b195
	b193:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b195:
	mov rcx, rax
	mov rax, qword [rbp - 528]
	mov r15, rax
	mov rax, qword [rbp - 1104]
	mov r13, rax
	mov r12, rcx
	b196:
	cmp r13, r15
	jl b197
	b198:
	mov rax, r12
	jmp b199
	b197:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b199:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b183:
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 2840]
	sub rax, 1
	mov qword [rbp - 2976], rax
	mov rax, qword [rbp - 336]
	mov qword [rbp - 2856], rax
	mov rax, qword [rbp - 2704]
	mov qword [rbp - 1592], rax
	b200:
	mov rax, qword [rbp - 2856]
	mov rcx, qword [rbp - 2976]
	cmp rax, rcx
	jl b201
	b202:
	mov rax, qword [rbp - 1592]
	jmp b203
	b201:
	mov rax, qword [rbp - 2976]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2856]
	mov r13, rax
	mov rax, qword [rbp - 1592]
	mov r12, rax
	b204:
	cmp r13, rbx
	jl b205
	b206:
	mov rax, r12
	jmp b207
	b205:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b207:
	mov qword [rbp - 1912], rax
	mov rax, qword [rbp - 2856]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1592]
	mov r13, rax
	mov rax, qword [rbp - 2976]
	mov r15, rax
	b208:
	cmp r13, rbx
	jl b209
	b210:
	mov rax, r15
	jmp b211
	b209:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b211:
	mov qword [rbp - 2648], rax
	mov rax, qword [rbp - 1592]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2976]
	mov r14, rax
	mov rax, qword [rbp - 2856]
	mov r15, rax
	b212:
	cmp r14, rbx
	jl b213
	b214:
	mov rax, r15
	jmp b215
	b213:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b215:
	mov rcx, rax
	mov rax, qword [rbp - 1912]
	mov r14, rax
	mov rax, qword [rbp - 2648]
	mov r12, rax
	mov rbx, rcx
	b216:
	cmp r12, r14
	jl b217
	b218:
	mov rax, rbx
	jmp b219
	b217:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b219:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b203:
	mov qword [rbp - 2168], rax
	mov rax, qword [rbp - 336]
	sub rax, 1
	mov qword [rbp - 672], rax
	mov rax, qword [rbp - 2704]
	mov qword [rbp - 1400], rax
	mov rax, qword [rbp - 2840]
	mov qword [rbp - 840], rax
	b220:
	mov rax, qword [rbp - 1400]
	mov rcx, qword [rbp - 672]
	cmp rax, rcx
	jl b221
	b222:
	mov rax, qword [rbp - 840]
	jmp b223
	b221:
	mov rax, qword [rbp - 672]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1400]
	mov r14, rax
	mov rax, qword [rbp - 840]
	mov r12, rax
	b224:
	cmp r14, r15
	jl b225
	b226:
	mov rax, r12
	jmp b227
	b225:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b227:
	mov qword [rbp - 1576], rax
	mov rax, qword [rbp - 1400]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 840]
	mov r15, rax
	mov rax, qword [rbp - 672]
	mov r14, rax
	b228:
	cmp r15, rbx
	jl b229
	b230:
	mov rax, r14
	jmp b231
	b229:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b231:
	mov qword [rbp - 1544], rax
	mov rax, qword [rbp - 840]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 672]
	mov r12, rax
	mov rax, qword [rbp - 1400]
	mov r13, rax
	b232:
	cmp r12, r14
	jl b233
	b234:
	mov rax, r13
	jmp b235
	b233:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b235:
	mov rcx, rax
	mov rax, qword [rbp - 1576]
	mov r14, rax
	mov rax, qword [rbp - 1544]
	mov rbx, rax
	mov r13, rcx
	b236:
	cmp rbx, r14
	jl b237
	b238:
	mov rax, r13
	jmp b239
	b237:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b239:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b223:
	mov rcx, rax
	mov rax, qword [rbp - 384]
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 2168]
	mov qword [rbp - 3296], rax
	mov rax, rcx
	mov qword [rbp - 2904], rax
	b240:
	mov rcx, qword [rbp - 3296]
	mov rax, qword [rbp - 56]
	cmp rcx, rax
	jl b241
	b242:
	mov rax, qword [rbp - 2904]
	jmp b243
	b241:
	mov rax, qword [rbp - 56]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3296]
	mov rbx, rax
	mov rax, qword [rbp - 2904]
	mov r14, rax
	b244:
	cmp rbx, r15
	jl b245
	b246:
	mov rax, r14
	jmp b247
	b245:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b247:
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 3296]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2904]
	mov r13, rax
	mov rax, qword [rbp - 56]
	mov r15, rax
	b248:
	cmp r13, r14
	jl b249
	b250:
	mov rax, r15
	jmp b251
	b249:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b251:
	mov qword [rbp - 1696], rax
	mov rax, qword [rbp - 2904]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 56]
	mov r12, rax
	mov rax, qword [rbp - 3296]
	mov r15, rax
	b252:
	cmp r12, rbx
	jl b253
	b254:
	mov rax, r15
	jmp b255
	b253:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b255:
	mov rcx, rax
	mov rax, qword [rbp - 168]
	mov r15, rax
	mov rax, qword [rbp - 1696]
	mov rbx, rax
	mov r14, rcx
	b256:
	cmp rbx, r15
	jl b257
	b258:
	mov rax, r14
	jmp b259
	b257:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b259:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b243:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b179:
	mov rcx, rax
	mov rax, qword [rbp - 2312]
	mov qword [rbp - 2672], rax
	mov rax, qword [rbp - 640]
	mov qword [rbp - 96], rax
	mov rax, rcx
	mov qword [rbp - 1008], rax
	b260:
	mov rcx, qword [rbp - 96]
	mov rax, qword [rbp - 2672]
	cmp rcx, rax
	jl b261
	b262:
	mov rax, qword [rbp - 1008]
	jmp b263
	b261:
	mov rax, qword [rbp - 2672]
	sub rax, 1
	mov qword [rbp - 488], rax
	mov rax, qword [rbp - 96]
	mov qword [rbp - 2216], rax
	mov rax, qword [rbp - 1008]
	mov qword [rbp - 3400], rax
	b264:
	mov rcx, qword [rbp - 2216]
	mov rax, qword [rbp - 488]
	cmp rcx, rax
	jl b265
	b266:
	mov rax, qword [rbp - 3400]
	jmp b267
	b265:
	mov rax, qword [rbp - 488]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2216]
	mov r15, rax
	mov rax, qword [rbp - 3400]
	mov rbx, rax
	b268:
	cmp r15, r13
	jl b269
	b270:
	mov rax, rbx
	jmp b271
	b269:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b271:
	mov qword [rbp - 1608], rax
	mov rax, qword [rbp - 2216]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3400]
	mov r14, rax
	mov rax, qword [rbp - 488]
	mov r12, rax
	b272:
	cmp r14, rbx
	jl b273
	b274:
	mov rax, r12
	jmp b275
	b273:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b275:
	mov qword [rbp - 1352], rax
	mov rax, qword [rbp - 3400]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 488]
	mov r12, rax
	mov rax, qword [rbp - 2216]
	mov r13, rax
	b276:
	cmp r12, r15
	jl b277
	b278:
	mov rax, r13
	jmp b279
	b277:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b279:
	mov rcx, qword [rbp - 1608]
	mov rbx, rcx
	mov rcx, qword [rbp - 1352]
	mov r12, rcx
	mov r13, rax
	b280:
	cmp r12, rbx
	jl b281
	b282:
	mov rax, r13
	jmp b283
	b281:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b283:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b267:
	mov qword [rbp - 984], rax
	mov rax, qword [rbp - 96]
	sub rax, 1
	mov qword [rbp - 1248], rax
	mov rax, qword [rbp - 1008]
	mov qword [rbp - 2544], rax
	mov rax, qword [rbp - 2672]
	mov qword [rbp - 264], rax
	b284:
	mov rax, qword [rbp - 2544]
	mov rcx, qword [rbp - 1248]
	cmp rax, rcx
	jl b285
	b286:
	mov rax, qword [rbp - 264]
	jmp b287
	b285:
	mov rax, qword [rbp - 1248]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2544]
	mov r12, rax
	mov rax, qword [rbp - 264]
	mov r13, rax
	b288:
	cmp r12, rbx
	jl b289
	b290:
	mov rax, r13
	jmp b291
	b289:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b291:
	mov qword [rbp - 2192], rax
	mov rax, qword [rbp - 2544]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 264]
	mov r12, rax
	mov rax, qword [rbp - 1248]
	mov r14, rax
	b292:
	cmp r12, rbx
	jl b293
	b294:
	mov rax, r14
	jmp b295
	b293:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b295:
	mov qword [rbp - 2656], rax
	mov rax, qword [rbp - 264]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1248]
	mov r15, rax
	mov rax, qword [rbp - 2544]
	mov r14, rax
	b296:
	cmp r15, r12
	jl b297
	b298:
	mov rax, r14
	jmp b299
	b297:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b299:
	mov rcx, rax
	mov rax, qword [rbp - 2192]
	mov r14, rax
	mov rax, qword [rbp - 2656]
	mov rbx, rax
	mov r13, rcx
	b300:
	cmp rbx, r14
	jl b301
	b302:
	mov rax, r13
	jmp b303
	b301:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b303:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b287:
	mov qword [rbp - 2640], rax
	mov rax, qword [rbp - 1008]
	sub rax, 1
	mov qword [rbp - 1888], rax
	mov rax, qword [rbp - 2672]
	mov qword [rbp - 536], rax
	mov rax, qword [rbp - 96]
	mov qword [rbp - 1672], rax
	b304:
	mov rcx, qword [rbp - 536]
	mov rax, qword [rbp - 1888]
	cmp rcx, rax
	jl b305
	b306:
	mov rax, qword [rbp - 1672]
	jmp b307
	b305:
	mov rax, qword [rbp - 1888]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 536]
	mov r14, rax
	mov rax, qword [rbp - 1672]
	mov r12, rax
	b308:
	cmp r14, r15
	jl b309
	b310:
	mov rax, r12
	jmp b311
	b309:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b311:
	mov qword [rbp - 2512], rax
	mov rax, qword [rbp - 536]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1672]
	mov r15, rax
	mov rax, qword [rbp - 1888]
	mov r14, rax
	b312:
	cmp r15, rbx
	jl b313
	b314:
	mov rax, r14
	jmp b315
	b313:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b315:
	mov qword [rbp - 2496], rax
	mov rax, qword [rbp - 1672]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1888]
	mov r12, rax
	mov rax, qword [rbp - 536]
	mov rbx, rax
	b316:
	cmp r12, r14
	jl b317
	b318:
	mov rax, rbx
	jmp b319
	b317:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b319:
	mov rcx, rax
	mov rax, qword [rbp - 2512]
	mov r12, rax
	mov rax, qword [rbp - 2496]
	mov r14, rax
	mov r13, rcx
	b320:
	cmp r14, r12
	jl b321
	b322:
	mov rax, r13
	jmp b323
	b321:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b323:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b307:
	mov rcx, rax
	mov rax, qword [rbp - 984]
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 2640]
	mov qword [rbp - 2136], rax
	mov rax, rcx
	mov qword [rbp - 2352], rax
	b324:
	mov rcx, qword [rbp - 2136]
	mov rax, qword [rbp - 200]
	cmp rcx, rax
	jl b325
	b326:
	mov rax, qword [rbp - 2352]
	jmp b327
	b325:
	mov rax, qword [rbp - 200]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2136]
	mov rbx, rax
	mov rax, qword [rbp - 2352]
	mov r12, rax
	b328:
	cmp rbx, r15
	jl b329
	b330:
	mov rax, r12
	jmp b331
	b329:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b331:
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 2136]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2352]
	mov r14, rax
	mov rax, qword [rbp - 200]
	mov r13, rax
	b332:
	cmp r14, rbx
	jl b333
	b334:
	mov rax, r13
	jmp b335
	b333:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b335:
	mov qword [rbp - 1840], rax
	mov rax, qword [rbp - 2352]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 200]
	mov r14, rax
	mov rax, qword [rbp - 2136]
	mov r12, rax
	b336:
	cmp r14, rbx
	jl b337
	b338:
	mov rax, r12
	jmp b339
	b337:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b339:
	mov rcx, qword [rbp - 104]
	mov r15, rcx
	mov rcx, qword [rbp - 1840]
	mov rbx, rcx
	mov r12, rax
	b340:
	cmp rbx, r15
	jl b341
	b342:
	mov rax, r12
	jmp b343
	b341:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b343:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b327:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b263:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b7:
	mov qword [rbp - 848], rax
	mov rax, qword [rbp - 1992]
	sub rax, 1
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 3328]
	mov qword [rbp - 808], rax
	mov rax, qword [rbp - 2680]
	mov qword [rbp - 1472], rax
	b344:
	mov rcx, qword [rbp - 808]
	mov rax, qword [rbp - 520]
	cmp rcx, rax
	jl b345
	b346:
	mov rax, qword [rbp - 1472]
	jmp b347
	b345:
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov qword [rbp - 1792], rax
	mov rax, qword [rbp - 808]
	mov qword [rbp - 2984], rax
	mov rax, qword [rbp - 1472]
	mov qword [rbp - 816], rax
	b348:
	mov rax, qword [rbp - 2984]
	mov rcx, qword [rbp - 1792]
	cmp rax, rcx
	jl b349
	b350:
	mov rax, qword [rbp - 816]
	jmp b351
	b349:
	mov rax, qword [rbp - 1792]
	sub rax, 1
	mov qword [rbp - 1584], rax
	mov rax, qword [rbp - 2984]
	mov qword [rbp - 584], rax
	mov rax, qword [rbp - 816]
	mov qword [rbp - 2032], rax
	b352:
	mov rcx, qword [rbp - 584]
	mov rax, qword [rbp - 1584]
	cmp rcx, rax
	jl b353
	b354:
	mov rax, qword [rbp - 2032]
	jmp b355
	b353:
	mov rax, qword [rbp - 1584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 584]
	mov r15, rax
	mov rax, qword [rbp - 2032]
	mov r12, rax
	b356:
	cmp r15, r14
	jl b357
	b358:
	mov rax, r12
	jmp b359
	b357:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b359:
	mov qword [rbp - 2944], rax
	mov rax, qword [rbp - 584]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2032]
	mov r13, rax
	mov rax, qword [rbp - 1584]
	mov rbx, rax
	b360:
	cmp r13, r15
	jl b361
	b362:
	mov rax, rbx
	jmp b363
	b361:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b363:
	mov qword [rbp - 880], rax
	mov rax, qword [rbp - 2032]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1584]
	mov r14, rax
	mov rax, qword [rbp - 584]
	mov rbx, rax
	b364:
	cmp r14, r15
	jl b365
	b366:
	mov rax, rbx
	jmp b367
	b365:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b367:
	mov rcx, rax
	mov rax, qword [rbp - 2944]
	mov r14, rax
	mov rax, qword [rbp - 880]
	mov r15, rax
	mov rbx, rcx
	b368:
	cmp r15, r14
	jl b369
	b370:
	mov rax, rbx
	jmp b371
	b369:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b371:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b355:
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 2984]
	sub rax, 1
	mov qword [rbp - 1256], rax
	mov rax, qword [rbp - 816]
	mov qword [rbp - 1344], rax
	mov rax, qword [rbp - 1792]
	mov qword [rbp - 1752], rax
	b372:
	mov rax, qword [rbp - 1344]
	mov rcx, qword [rbp - 1256]
	cmp rax, rcx
	jl b373
	b374:
	mov rax, qword [rbp - 1752]
	jmp b375
	b373:
	mov rax, qword [rbp - 1256]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1344]
	mov r13, rax
	mov rax, qword [rbp - 1752]
	mov rbx, rax
	b376:
	cmp r13, r12
	jl b377
	b378:
	mov rax, rbx
	jmp b379
	b377:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b379:
	mov qword [rbp - 3232], rax
	mov rax, qword [rbp - 1344]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1752]
	mov r15, rax
	mov rax, qword [rbp - 1256]
	mov r14, rax
	b380:
	cmp r15, r12
	jl b381
	b382:
	mov rax, r14
	jmp b383
	b381:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b383:
	mov qword [rbp - 448], rax
	mov rax, qword [rbp - 1752]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1256]
	mov r15, rax
	mov rax, qword [rbp - 1344]
	mov r14, rax
	b384:
	cmp r15, rbx
	jl b385
	b386:
	mov rax, r14
	jmp b387
	b385:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b387:
	mov rcx, rax
	mov rax, qword [rbp - 3232]
	mov r15, rax
	mov rax, qword [rbp - 448]
	mov r13, rax
	mov rbx, rcx
	b388:
	cmp r13, r15
	jl b389
	b390:
	mov rax, rbx
	jmp b391
	b389:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b391:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b375:
	mov qword [rbp - 832], rax
	mov rax, qword [rbp - 816]
	sub rax, 1
	mov qword [rbp - 2400], rax
	mov rax, qword [rbp - 1792]
	mov qword [rbp - 1928], rax
	mov rax, qword [rbp - 2984]
	mov qword [rbp - 1944], rax
	b392:
	mov rax, qword [rbp - 1928]
	mov rcx, qword [rbp - 2400]
	cmp rax, rcx
	jl b393
	b394:
	mov rax, qword [rbp - 1944]
	jmp b395
	b393:
	mov rax, qword [rbp - 2400]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1928]
	mov r14, rax
	mov rax, qword [rbp - 1944]
	mov rbx, rax
	b396:
	cmp r14, r12
	jl b397
	b398:
	mov rax, rbx
	jmp b399
	b397:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b399:
	mov qword [rbp - 1272], rax
	mov rax, qword [rbp - 1928]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1944]
	mov r15, rax
	mov rax, qword [rbp - 2400]
	mov r14, rax
	b400:
	cmp r15, rbx
	jl b401
	b402:
	mov rax, r14
	jmp b403
	b401:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b403:
	mov qword [rbp - 752], rax
	mov rax, qword [rbp - 1944]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2400]
	mov rbx, rax
	mov rax, qword [rbp - 1928]
	mov r13, rax
	b404:
	cmp rbx, r14
	jl b405
	b406:
	mov rax, r13
	jmp b407
	b405:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b407:
	mov rcx, rax
	mov rax, qword [rbp - 1272]
	mov rbx, rax
	mov rax, qword [rbp - 752]
	mov r14, rax
	mov r12, rcx
	b408:
	cmp r14, rbx
	jl b409
	b410:
	mov rax, r12
	jmp b411
	b409:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b411:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b395:
	mov rcx, rax
	mov rax, qword [rbp - 344]
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 904], rax
	mov rax, rcx
	mov qword [rbp - 1968], rax
	b412:
	mov rax, qword [rbp - 904]
	mov rcx, qword [rbp - 312]
	cmp rax, rcx
	jl b413
	b414:
	mov rax, qword [rbp - 1968]
	jmp b415
	b413:
	mov rax, qword [rbp - 312]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 904]
	mov r15, rax
	mov rax, qword [rbp - 1968]
	mov r12, rax
	b416:
	cmp r15, r14
	jl b417
	b418:
	mov rax, r12
	jmp b419
	b417:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b419:
	mov qword [rbp - 1376], rax
	mov rax, qword [rbp - 904]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1968]
	mov r12, rax
	mov rax, qword [rbp - 312]
	mov r13, rax
	b420:
	cmp r12, rbx
	jl b421
	b422:
	mov rax, r13
	jmp b423
	b421:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b423:
	mov qword [rbp - 1264], rax
	mov rax, qword [rbp - 1968]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 312]
	mov r13, rax
	mov rax, qword [rbp - 904]
	mov r15, rax
	b424:
	cmp r13, r14
	jl b425
	b426:
	mov rax, r15
	jmp b427
	b425:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b427:
	mov rcx, rax
	mov rax, qword [rbp - 1376]
	mov r14, rax
	mov rax, qword [rbp - 1264]
	mov r15, rax
	mov r13, rcx
	b428:
	cmp r15, r14
	jl b429
	b430:
	mov rax, r13
	jmp b431
	b429:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b431:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b415:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b351:
	mov qword [rbp - 3392], rax
	mov rax, qword [rbp - 808]
	sub rax, 1
	mov qword [rbp - 888], rax
	mov rax, qword [rbp - 1472]
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 520]
	mov qword [rbp - 1240], rax
	b432:
	mov rax, qword [rbp - 400]
	mov rcx, qword [rbp - 888]
	cmp rax, rcx
	jl b433
	b434:
	mov rax, qword [rbp - 1240]
	jmp b435
	b433:
	mov rax, qword [rbp - 888]
	sub rax, 1
	mov qword [rbp - 1528], rax
	mov rax, qword [rbp - 400]
	mov qword [rbp - 2272], rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 136], rax
	b436:
	mov rax, qword [rbp - 2272]
	mov rcx, qword [rbp - 1528]
	cmp rax, rcx
	jl b437
	b438:
	mov rax, qword [rbp - 136]
	jmp b439
	b437:
	mov rax, qword [rbp - 1528]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2272]
	mov r15, rax
	mov rax, qword [rbp - 136]
	mov r13, rax
	b440:
	cmp r15, rbx
	jl b441
	b442:
	mov rax, r13
	jmp b443
	b441:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b443:
	mov qword [rbp - 1392], rax
	mov rax, qword [rbp - 2272]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 136]
	mov r14, rax
	mov rax, qword [rbp - 1528]
	mov r13, rax
	b444:
	cmp r14, rbx
	jl b445
	b446:
	mov rax, r13
	jmp b447
	b445:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b447:
	mov qword [rbp - 2088], rax
	mov rax, qword [rbp - 136]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1528]
	mov rbx, rax
	mov rax, qword [rbp - 2272]
	mov r14, rax
	b448:
	cmp rbx, r15
	jl b449
	b450:
	mov rax, r14
	jmp b451
	b449:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b451:
	mov rcx, rax
	mov rax, qword [rbp - 1392]
	mov r12, rax
	mov rax, qword [rbp - 2088]
	mov r13, rax
	mov rbx, rcx
	b452:
	cmp r13, r12
	jl b453
	b454:
	mov rax, rbx
	jmp b455
	b453:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b455:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b439:
	mov qword [rbp - 1200], rax
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 1440], rax
	mov rax, qword [rbp - 888]
	mov qword [rbp - 464], rax
	b456:
	mov rax, qword [rbp - 1440]
	mov rcx, qword [rbp - 80]
	cmp rax, rcx
	jl b457
	b458:
	mov rax, qword [rbp - 464]
	jmp b459
	b457:
	mov rax, qword [rbp - 80]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1440]
	mov r12, rax
	mov rax, qword [rbp - 464]
	mov r13, rax
	b460:
	cmp r12, r14
	jl b461
	b462:
	mov rax, r13
	jmp b463
	b461:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b463:
	mov qword [rbp - 1176], rax
	mov rax, qword [rbp - 1440]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 464]
	mov r12, rax
	mov rax, qword [rbp - 80]
	mov r13, rax
	b464:
	cmp r12, r14
	jl b465
	b466:
	mov rax, r13
	jmp b467
	b465:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b467:
	mov qword [rbp - 472], rax
	mov rax, qword [rbp - 464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 80]
	mov r14, rax
	mov rax, qword [rbp - 1440]
	mov rbx, rax
	b468:
	cmp r14, r15
	jl b469
	b470:
	mov rax, rbx
	jmp b471
	b469:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b471:
	mov rcx, rax
	mov rax, qword [rbp - 1176]
	mov r15, rax
	mov rax, qword [rbp - 472]
	mov r12, rax
	mov rbx, rcx
	b472:
	cmp r12, r15
	jl b473
	b474:
	mov rax, rbx
	jmp b475
	b473:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b475:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b459:
	mov qword [rbp - 3016], rax
	mov rax, qword [rbp - 1240]
	sub rax, 1
	mov qword [rbp - 2280], rax
	mov rax, qword [rbp - 888]
	mov qword [rbp - 1976], rax
	mov rax, qword [rbp - 400]
	mov qword [rbp - 2152], rax
	b476:
	mov rax, qword [rbp - 1976]
	mov rcx, qword [rbp - 2280]
	cmp rax, rcx
	jl b477
	b478:
	mov rax, qword [rbp - 2152]
	jmp b479
	b477:
	mov rax, qword [rbp - 2280]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1976]
	mov r15, rax
	mov rax, qword [rbp - 2152]
	mov r13, rax
	b480:
	cmp r15, r14
	jl b481
	b482:
	mov rax, r13
	jmp b483
	b481:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b483:
	mov qword [rbp - 1088], rax
	mov rax, qword [rbp - 1976]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2152]
	mov r12, rax
	mov rax, qword [rbp - 2280]
	mov r13, rax
	b484:
	cmp r12, rbx
	jl b485
	b486:
	mov rax, r13
	jmp b487
	b485:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b487:
	mov qword [rbp - 3088], rax
	mov rax, qword [rbp - 2152]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2280]
	mov r12, rax
	mov rax, qword [rbp - 1976]
	mov r13, rax
	b488:
	cmp r12, r14
	jl b489
	b490:
	mov rax, r13
	jmp b491
	b489:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b491:
	mov rcx, rax
	mov rax, qword [rbp - 1088]
	mov rbx, rax
	mov rax, qword [rbp - 3088]
	mov r15, rax
	mov r14, rcx
	b492:
	cmp r15, rbx
	jl b493
	b494:
	mov rax, r14
	jmp b495
	b493:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b495:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b479:
	mov rcx, rax
	mov rax, qword [rbp - 1200]
	mov qword [rbp - 2408], rax
	mov rax, qword [rbp - 3016]
	mov qword [rbp - 2480], rax
	mov rax, rcx
	mov qword [rbp - 1072], rax
	b496:
	mov rax, qword [rbp - 2480]
	mov rcx, qword [rbp - 2408]
	cmp rax, rcx
	jl b497
	b498:
	mov rax, qword [rbp - 1072]
	jmp b499
	b497:
	mov rax, qword [rbp - 2408]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2480]
	mov rbx, rax
	mov rax, qword [rbp - 1072]
	mov r15, rax
	b500:
	cmp rbx, r13
	jl b501
	b502:
	mov rax, r15
	jmp b503
	b501:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b503:
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 2480]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1072]
	mov r15, rax
	mov rax, qword [rbp - 2408]
	mov r12, rax
	b504:
	cmp r15, r14
	jl b505
	b506:
	mov rax, r12
	jmp b507
	b505:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b507:
	mov qword [rbp - 3024], rax
	mov rax, qword [rbp - 1072]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2408]
	mov rbx, rax
	mov rax, qword [rbp - 2480]
	mov r14, rax
	b508:
	cmp rbx, r15
	jl b509
	b510:
	mov rax, r14
	jmp b511
	b509:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b511:
	mov rcx, rax
	mov rax, qword [rbp - 64]
	mov r12, rax
	mov rax, qword [rbp - 3024]
	mov rbx, rax
	mov r14, rcx
	b512:
	cmp rbx, r12
	jl b513
	b514:
	mov rax, r14
	jmp b515
	b513:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b515:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b499:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b435:
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 1472]
	sub rax, 1
	mov qword [rbp - 2552], rax
	mov rax, qword [rbp - 520]
	mov qword [rbp - 3160], rax
	mov rax, qword [rbp - 808]
	mov qword [rbp - 1712], rax
	b516:
	mov rax, qword [rbp - 3160]
	mov rcx, qword [rbp - 2552]
	cmp rax, rcx
	jl b517
	b518:
	mov rax, qword [rbp - 1712]
	jmp b519
	b517:
	mov rax, qword [rbp - 2552]
	sub rax, 1
	mov qword [rbp - 1496], rax
	mov rax, qword [rbp - 3160]
	mov qword [rbp - 1416], rax
	mov rax, qword [rbp - 1712]
	mov qword [rbp - 1728], rax
	b520:
	mov rcx, qword [rbp - 1416]
	mov rax, qword [rbp - 1496]
	cmp rcx, rax
	jl b521
	b522:
	mov rax, qword [rbp - 1728]
	jmp b523
	b521:
	mov rax, qword [rbp - 1496]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1416]
	mov r15, rax
	mov rax, qword [rbp - 1728]
	mov r14, rax
	b524:
	cmp r15, rbx
	jl b525
	b526:
	mov rax, r14
	jmp b527
	b525:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b527:
	mov qword [rbp - 1232], rax
	mov rax, qword [rbp - 1416]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1728]
	mov r15, rax
	mov rax, qword [rbp - 1496]
	mov r14, rax
	b528:
	cmp r15, r12
	jl b529
	b530:
	mov rax, r14
	jmp b531
	b529:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b531:
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 1728]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1496]
	mov r12, rax
	mov rax, qword [rbp - 1416]
	mov r13, rax
	b532:
	cmp r12, rbx
	jl b533
	b534:
	mov rax, r13
	jmp b535
	b533:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b535:
	mov rcx, rax
	mov rax, qword [rbp - 1232]
	mov rbx, rax
	mov rax, qword [rbp - 24]
	mov r12, rax
	mov r13, rcx
	b536:
	cmp r12, rbx
	jl b537
	b538:
	mov rax, r13
	jmp b539
	b537:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b539:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b523:
	mov qword [rbp - 1784], rax
	mov rax, qword [rbp - 3160]
	sub rax, 1
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 1712]
	mov qword [rbp - 2832], rax
	mov rax, qword [rbp - 2552]
	mov qword [rbp - 600], rax
	b540:
	mov rcx, qword [rbp - 2832]
	mov rax, qword [rbp - 656]
	cmp rcx, rax
	jl b541
	b542:
	mov rax, qword [rbp - 600]
	jmp b543
	b541:
	mov rax, qword [rbp - 656]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2832]
	mov r15, rax
	mov rax, qword [rbp - 600]
	mov r12, rax
	b544:
	cmp r15, r14
	jl b545
	b546:
	mov rax, r12
	jmp b547
	b545:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b547:
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 2832]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 600]
	mov r12, rax
	mov rax, qword [rbp - 656]
	mov r13, rax
	b548:
	cmp r12, rbx
	jl b549
	b550:
	mov rax, r13
	jmp b551
	b549:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b551:
	mov qword [rbp - 3368], rax
	mov rax, qword [rbp - 600]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 656]
	mov r12, rax
	mov rax, qword [rbp - 2832]
	mov r15, rax
	b552:
	cmp r12, rbx
	jl b553
	b554:
	mov rax, r15
	jmp b555
	b553:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b555:
	mov rcx, qword [rbp - 376]
	mov r14, rcx
	mov rcx, qword [rbp - 3368]
	mov r12, rcx
	mov r13, rax
	b556:
	cmp r12, r14
	jl b557
	b558:
	mov rax, r13
	jmp b559
	b557:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b559:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b543:
	mov qword [rbp - 3360], rax
	mov rax, qword [rbp - 1712]
	sub rax, 1
	mov qword [rbp - 2776], rax
	mov rax, qword [rbp - 2552]
	mov qword [rbp - 2072], rax
	mov rax, qword [rbp - 3160]
	mov qword [rbp - 2912], rax
	b560:
	mov rax, qword [rbp - 2072]
	mov rcx, qword [rbp - 2776]
	cmp rax, rcx
	jl b561
	b562:
	mov rax, qword [rbp - 2912]
	jmp b563
	b561:
	mov rax, qword [rbp - 2776]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2072]
	mov rbx, rax
	mov rax, qword [rbp - 2912]
	mov r13, rax
	b564:
	cmp rbx, r15
	jl b565
	b566:
	mov rax, r13
	jmp b567
	b565:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b567:
	mov qword [rbp - 504], rax
	mov rax, qword [rbp - 2072]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2912]
	mov rbx, rax
	mov rax, qword [rbp - 2776]
	mov r12, rax
	b568:
	cmp rbx, r14
	jl b569
	b570:
	mov rax, r12
	jmp b571
	b569:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b571:
	mov qword [rbp - 616], rax
	mov rax, qword [rbp - 2912]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2776]
	mov r14, rax
	mov rax, qword [rbp - 2072]
	mov r12, rax
	b572:
	cmp r14, r15
	jl b573
	b574:
	mov rax, r12
	jmp b575
	b573:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b575:
	mov rcx, rax
	mov rax, qword [rbp - 504]
	mov rbx, rax
	mov rax, qword [rbp - 616]
	mov r14, rax
	mov r13, rcx
	b576:
	cmp r14, rbx
	jl b577
	b578:
	mov rax, r13
	jmp b579
	b577:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b579:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b563:
	mov rcx, rax
	mov rax, qword [rbp - 1784]
	mov qword [rbp - 1184], rax
	mov rax, qword [rbp - 3360]
	mov qword [rbp - 216], rax
	mov rax, rcx
	mov qword [rbp - 1704], rax
	b580:
	mov rax, qword [rbp - 216]
	mov rcx, qword [rbp - 1184]
	cmp rax, rcx
	jl b581
	b582:
	mov rax, qword [rbp - 1704]
	jmp b583
	b581:
	mov rax, qword [rbp - 1184]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 216]
	mov rbx, rax
	mov rax, qword [rbp - 1704]
	mov r13, rax
	b584:
	cmp rbx, r12
	jl b585
	b586:
	mov rax, r13
	jmp b587
	b585:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b587:
	mov qword [rbp - 760], rax
	mov rax, qword [rbp - 216]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1704]
	mov r15, rax
	mov rax, qword [rbp - 1184]
	mov r13, rax
	b588:
	cmp r15, r12
	jl b589
	b590:
	mov rax, r13
	jmp b591
	b589:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b591:
	mov qword [rbp - 1624], rax
	mov rax, qword [rbp - 1704]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1184]
	mov rbx, rax
	mov rax, qword [rbp - 216]
	mov r13, rax
	b592:
	cmp rbx, r12
	jl b593
	b594:
	mov rax, r13
	jmp b595
	b593:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b595:
	mov rcx, qword [rbp - 760]
	mov rbx, rcx
	mov rcx, qword [rbp - 1624]
	mov r14, rcx
	mov r12, rax
	b596:
	cmp r14, rbx
	jl b597
	b598:
	mov rax, r12
	jmp b599
	b597:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b599:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b583:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b519:
	mov rcx, rax
	mov rax, qword [rbp - 3392]
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 72]
	mov qword [rbp - 944], rax
	mov rax, rcx
	mov qword [rbp - 920], rax
	b600:
	mov rax, qword [rbp - 944]
	mov rcx, qword [rbp - 696]
	cmp rax, rcx
	jl b601
	b602:
	mov rax, qword [rbp - 920]
	jmp b603
	b601:
	mov rax, qword [rbp - 696]
	sub rax, 1
	mov qword [rbp - 2464], rax
	mov rax, qword [rbp - 944]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 920]
	mov qword [rbp - 2144], rax
	b604:
	mov rax, qword [rbp - 296]
	mov rcx, qword [rbp - 2464]
	cmp rax, rcx
	jl b605
	b606:
	mov rax, qword [rbp - 2144]
	jmp b607
	b605:
	mov rax, qword [rbp - 2464]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 296]
	mov r13, rax
	mov rax, qword [rbp - 2144]
	mov r12, rax
	b608:
	cmp r13, r14
	jl b609
	b610:
	mov rax, r12
	jmp b611
	b609:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b611:
	mov qword [rbp - 3248], rax
	mov rax, qword [rbp - 296]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2144]
	mov r15, rax
	mov rax, qword [rbp - 2464]
	mov r12, rax
	b612:
	cmp r15, r14
	jl b613
	b614:
	mov rax, r12
	jmp b615
	b613:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b615:
	mov qword [rbp - 1320], rax
	mov rax, qword [rbp - 2144]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2464]
	mov r15, rax
	mov rax, qword [rbp - 296]
	mov r12, rax
	b616:
	cmp r15, rbx
	jl b617
	b618:
	mov rax, r12
	jmp b619
	b617:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b619:
	mov rcx, rax
	mov rax, qword [rbp - 3248]
	mov r15, rax
	mov rax, qword [rbp - 1320]
	mov rbx, rax
	mov r14, rcx
	b620:
	cmp rbx, r15
	jl b621
	b622:
	mov rax, r14
	jmp b623
	b621:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b623:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b607:
	mov qword [rbp - 1096], rax
	mov rax, qword [rbp - 944]
	sub rax, 1
	mov qword [rbp - 1360], rax
	mov rax, qword [rbp - 920]
	mov qword [rbp - 704], rax
	mov rax, qword [rbp - 696]
	mov qword [rbp - 2816], rax
	b624:
	mov rax, qword [rbp - 704]
	mov rcx, qword [rbp - 1360]
	cmp rax, rcx
	jl b625
	b626:
	mov rax, qword [rbp - 2816]
	jmp b627
	b625:
	mov rax, qword [rbp - 1360]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 704]
	mov r12, rax
	mov rax, qword [rbp - 2816]
	mov r13, rax
	b628:
	cmp r12, r15
	jl b629
	b630:
	mov rax, r13
	jmp b631
	b629:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b631:
	mov qword [rbp - 2560], rax
	mov rax, qword [rbp - 704]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2816]
	mov rbx, rax
	mov rax, qword [rbp - 1360]
	mov r12, rax
	b632:
	cmp rbx, r15
	jl b633
	b634:
	mov rax, r12
	jmp b635
	b633:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b635:
	mov qword [rbp - 856], rax
	mov rax, qword [rbp - 2816]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1360]
	mov r14, rax
	mov rax, qword [rbp - 704]
	mov r15, rax
	b636:
	cmp r14, rbx
	jl b637
	b638:
	mov rax, r15
	jmp b639
	b637:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b639:
	mov rcx, rax
	mov rax, qword [rbp - 2560]
	mov r12, rax
	mov rax, qword [rbp - 856]
	mov rbx, rax
	mov r13, rcx
	b640:
	cmp rbx, r12
	jl b641
	b642:
	mov rax, r13
	jmp b643
	b641:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b643:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b627:
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 920]
	sub rax, 1
	mov qword [rbp - 2968], rax
	mov rax, qword [rbp - 696]
	mov qword [rbp - 1512], rax
	mov rax, qword [rbp - 944]
	mov qword [rbp - 624], rax
	b644:
	mov rcx, qword [rbp - 1512]
	mov rax, qword [rbp - 2968]
	cmp rcx, rax
	jl b645
	b646:
	mov rax, qword [rbp - 624]
	jmp b647
	b645:
	mov rax, qword [rbp - 2968]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1512]
	mov r15, rax
	mov rax, qword [rbp - 624]
	mov rbx, rax
	b648:
	cmp r15, r13
	jl b649
	b650:
	mov rax, rbx
	jmp b651
	b649:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b651:
	mov qword [rbp - 2064], rax
	mov rax, qword [rbp - 1512]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 624]
	mov r14, rax
	mov rax, qword [rbp - 2968]
	mov r12, rax
	b652:
	cmp r14, r15
	jl b653
	b654:
	mov rax, r12
	jmp b655
	b653:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b655:
	mov qword [rbp - 1656], rax
	mov rax, qword [rbp - 624]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2968]
	mov r12, rax
	mov rax, qword [rbp - 1512]
	mov rbx, rax
	b656:
	cmp r12, r14
	jl b657
	b658:
	mov rax, rbx
	jmp b659
	b657:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b659:
	mov rcx, rax
	mov rax, qword [rbp - 2064]
	mov rbx, rax
	mov rax, qword [rbp - 1656]
	mov r13, rax
	mov r15, rcx
	b660:
	cmp r13, rbx
	jl b661
	b662:
	mov rax, r15
	jmp b663
	b661:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b663:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b647:
	mov rcx, qword [rbp - 1096]
	mov qword [rbp - 1080], rcx
	mov rcx, qword [rbp - 360]
	mov qword [rbp - 1208], rcx
	mov qword [rbp - 1136], rax
	b664:
	mov rcx, qword [rbp - 1208]
	mov rax, qword [rbp - 1080]
	cmp rcx, rax
	jl b665
	b666:
	mov rax, qword [rbp - 1136]
	jmp b667
	b665:
	mov rax, qword [rbp - 1080]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1208]
	mov r14, rax
	mov rax, qword [rbp - 1136]
	mov r13, rax
	b668:
	cmp r14, r15
	jl b669
	b670:
	mov rax, r13
	jmp b671
	b669:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b671:
	mov qword [rbp - 1064], rax
	mov rax, qword [rbp - 1208]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1136]
	mov r13, rax
	mov rax, qword [rbp - 1080]
	mov r12, rax
	b672:
	cmp r13, r15
	jl b673
	b674:
	mov rax, r12
	jmp b675
	b673:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b675:
	mov qword [rbp - 2488], rax
	mov rax, qword [rbp - 1136]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1080]
	mov r14, rax
	mov rax, qword [rbp - 1208]
	mov rbx, rax
	b676:
	cmp r14, r15
	jl b677
	b678:
	mov rax, rbx
	jmp b679
	b677:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b679:
	mov rcx, rax
	mov rax, qword [rbp - 1064]
	mov r14, rax
	mov rax, qword [rbp - 2488]
	mov r15, rax
	mov r12, rcx
	b680:
	cmp r15, r14
	jl b681
	b682:
	mov rax, r12
	jmp b683
	b681:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b683:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b667:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b603:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b347:
	mov qword [rbp - 2688], rax
	mov rax, qword [rbp - 3328]
	sub rax, 1
	mov qword [rbp - 784], rax
	mov rax, qword [rbp - 2680]
	mov qword [rbp - 1488], rax
	mov rax, qword [rbp - 1992]
	mov qword [rbp - 2456], rax
	b684:
	mov rax, qword [rbp - 1488]
	mov rcx, qword [rbp - 784]
	cmp rax, rcx
	jl b685
	b686:
	mov rax, qword [rbp - 2456]
	jmp b687
	b685:
	mov rax, qword [rbp - 784]
	sub rax, 1
	mov qword [rbp - 2824], rax
	mov rax, qword [rbp - 1488]
	mov qword [rbp - 1768], rax
	mov rax, qword [rbp - 2456]
	mov qword [rbp - 736], rax
	b688:
	mov rcx, qword [rbp - 1768]
	mov rax, qword [rbp - 2824]
	cmp rcx, rax
	jl b689
	b690:
	mov rax, qword [rbp - 736]
	jmp b691
	b689:
	mov rax, qword [rbp - 2824]
	sub rax, 1
	mov qword [rbp - 1408], rax
	mov rax, qword [rbp - 1768]
	mov qword [rbp - 1016], rax
	mov rax, qword [rbp - 736]
	mov qword [rbp - 3288], rax
	b692:
	mov rax, qword [rbp - 1016]
	mov rcx, qword [rbp - 1408]
	cmp rax, rcx
	jl b693
	b694:
	mov rax, qword [rbp - 3288]
	jmp b695
	b693:
	mov rax, qword [rbp - 1408]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1016]
	mov r13, rax
	mov rax, qword [rbp - 3288]
	mov r15, rax
	b696:
	cmp r13, r12
	jl b697
	b698:
	mov rax, r15
	jmp b699
	b697:
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b699:
	mov qword [rbp - 2784], rax
	mov rax, qword [rbp - 1016]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3288]
	mov r15, rax
	mov rax, qword [rbp - 1408]
	mov r13, rax
	b700:
	cmp r15, rbx
	jl b701
	b702:
	mov rax, r13
	jmp b703
	b701:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b703:
	mov qword [rbp - 2952], rax
	mov rax, qword [rbp - 3288]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1408]
	mov r14, rax
	mov rax, qword [rbp - 1016]
	mov r13, rax
	b704:
	cmp r14, r15
	jl b705
	b706:
	mov rax, r13
	jmp b707
	b705:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b707:
	mov rcx, qword [rbp - 2784]
	mov r15, rcx
	mov rcx, qword [rbp - 2952]
	mov rbx, rcx
	mov r12, rax
	b708:
	cmp rbx, r15
	jl b709
	b710:
	mov rax, r12
	jmp b711
	b709:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b711:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b695:
	mov qword [rbp - 960], rax
	mov rax, qword [rbp - 1768]
	sub rax, 1
	mov qword [rbp - 1736], rax
	mov rax, qword [rbp - 736]
	mov qword [rbp - 2360], rax
	mov rax, qword [rbp - 2824]
	mov qword [rbp - 1368], rax
	b712:
	mov rcx, qword [rbp - 2360]
	mov rax, qword [rbp - 1736]
	cmp rcx, rax
	jl b713
	b714:
	mov rax, qword [rbp - 1368]
	jmp b715
	b713:
	mov rax, qword [rbp - 1736]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2360]
	mov r12, rax
	mov rax, qword [rbp - 1368]
	mov r13, rax
	b716:
	cmp r12, r15
	jl b717
	b718:
	mov rax, r13
	jmp b719
	b717:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b719:
	mov qword [rbp - 3312], rax
	mov rax, qword [rbp - 2360]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1368]
	mov r12, rax
	mov rax, qword [rbp - 1736]
	mov r13, rax
	b720:
	cmp r12, r14
	jl b721
	b722:
	mov rax, r13
	jmp b723
	b721:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b723:
	mov qword [rbp - 1464], rax
	mov rax, qword [rbp - 1368]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1736]
	mov r15, rax
	mov rax, qword [rbp - 2360]
	mov rbx, rax
	b724:
	cmp r15, r14
	jl b725
	b726:
	mov rax, rbx
	jmp b727
	b725:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b727:
	mov rcx, qword [rbp - 3312]
	mov rbx, rcx
	mov rcx, qword [rbp - 1464]
	mov r15, rcx
	mov r13, rax
	b728:
	cmp r15, rbx
	jl b729
	b730:
	mov rax, r13
	jmp b731
	b729:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b731:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b715:
	mov qword [rbp - 2712], rax
	mov rax, qword [rbp - 736]
	sub rax, 1
	mov qword [rbp - 2568], rax
	mov rax, qword [rbp - 2824]
	mov qword [rbp - 2264], rax
	mov rax, qword [rbp - 1768]
	mov qword [rbp - 2296], rax
	b732:
	mov rax, qword [rbp - 2264]
	mov rcx, qword [rbp - 2568]
	cmp rax, rcx
	jl b733
	b734:
	mov rax, qword [rbp - 2296]
	jmp b735
	b733:
	mov rax, qword [rbp - 2568]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2264]
	mov r12, rax
	mov rax, qword [rbp - 2296]
	mov r14, rax
	b736:
	cmp r12, r15
	jl b737
	b738:
	mov rax, r14
	jmp b739
	b737:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b739:
	mov qword [rbp - 2808], rax
	mov rax, qword [rbp - 2264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2296]
	mov r12, rax
	mov rax, qword [rbp - 2568]
	mov r15, rax
	b740:
	cmp r12, r14
	jl b741
	b742:
	mov rax, r15
	jmp b743
	b741:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b743:
	mov qword [rbp - 2024], rax
	mov rax, qword [rbp - 2296]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2568]
	mov r15, rax
	mov rax, qword [rbp - 2264]
	mov r14, rax
	b744:
	cmp r15, rbx
	jl b745
	b746:
	mov rax, r14
	jmp b747
	b745:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b747:
	mov rcx, rax
	mov rax, qword [rbp - 2808]
	mov r14, rax
	mov rax, qword [rbp - 2024]
	mov r12, rax
	mov r13, rcx
	b748:
	cmp r12, r14
	jl b749
	b750:
	mov rax, r13
	jmp b751
	b749:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b751:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b735:
	mov rcx, rax
	mov rax, qword [rbp - 960]
	mov qword [rbp - 2200], rax
	mov rax, qword [rbp - 2712]
	mov qword [rbp - 1552], rax
	mov rax, rcx
	mov qword [rbp - 1112], rax
	b752:
	mov rax, qword [rbp - 1552]
	mov rcx, qword [rbp - 2200]
	cmp rax, rcx
	jl b753
	b754:
	mov rax, qword [rbp - 1112]
	jmp b755
	b753:
	mov rax, qword [rbp - 2200]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1552]
	mov rbx, rax
	mov rax, qword [rbp - 1112]
	mov r13, rax
	b756:
	cmp rbx, r14
	jl b757
	b758:
	mov rax, r13
	jmp b759
	b757:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b759:
	mov qword [rbp - 2008], rax
	mov rax, qword [rbp - 1552]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1112]
	mov rbx, rax
	mov rax, qword [rbp - 2200]
	mov r13, rax
	b760:
	cmp rbx, r15
	jl b761
	b762:
	mov rax, r13
	jmp b763
	b761:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b763:
	mov qword [rbp - 176], rax
	mov rax, qword [rbp - 1112]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2200]
	mov rbx, rax
	mov rax, qword [rbp - 1552]
	mov r12, rax
	b764:
	cmp rbx, r14
	jl b765
	b766:
	mov rax, r12
	jmp b767
	b765:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b767:
	mov rcx, rax
	mov rax, qword [rbp - 2008]
	mov r15, rax
	mov rax, qword [rbp - 176]
	mov r14, rax
	mov r12, rcx
	b768:
	cmp r14, r15
	jl b769
	b770:
	mov rax, r12
	jmp b771
	b769:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b771:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b755:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b691:
	mov qword [rbp - 2632], rax
	mov rax, qword [rbp - 1488]
	sub rax, 1
	mov qword [rbp - 2472], rax
	mov rax, qword [rbp - 2456]
	mov qword [rbp - 552], rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 3096], rax
	b772:
	mov rax, qword [rbp - 552]
	mov rcx, qword [rbp - 2472]
	cmp rax, rcx
	jl b773
	b774:
	mov rax, qword [rbp - 3096]
	jmp b775
	b773:
	mov rax, qword [rbp - 2472]
	sub rax, 1
	mov qword [rbp - 2000], rax
	mov rax, qword [rbp - 552]
	mov qword [rbp - 232], rax
	mov rax, qword [rbp - 3096]
	mov qword [rbp - 480], rax
	b776:
	mov rax, qword [rbp - 232]
	mov rcx, qword [rbp - 2000]
	cmp rax, rcx
	jl b777
	b778:
	mov rax, qword [rbp - 480]
	jmp b779
	b777:
	mov rax, qword [rbp - 2000]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 232]
	mov rbx, rax
	mov rax, qword [rbp - 480]
	mov r13, rax
	b780:
	cmp rbx, r14
	jl b781
	b782:
	mov rax, r13
	jmp b783
	b781:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b783:
	mov qword [rbp - 3176], rax
	mov rax, qword [rbp - 232]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 480]
	mov rbx, rax
	mov rax, qword [rbp - 2000]
	mov r13, rax
	b784:
	cmp rbx, r15
	jl b785
	b786:
	mov rax, r13
	jmp b787
	b785:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b787:
	mov qword [rbp - 2848], rax
	mov rax, qword [rbp - 480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2000]
	mov rbx, rax
	mov rax, qword [rbp - 232]
	mov r12, rax
	b788:
	cmp rbx, r15
	jl b789
	b790:
	mov rax, r12
	jmp b791
	b789:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b791:
	mov rcx, rax
	mov rax, qword [rbp - 3176]
	mov rbx, rax
	mov rax, qword [rbp - 2848]
	mov r15, rax
	mov r13, rcx
	b792:
	cmp r15, rbx
	jl b793
	b794:
	mov rax, r13
	jmp b795
	b793:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b795:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b779:
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 552]
	sub rax, 1
	mov qword [rbp - 2528], rax
	mov rax, qword [rbp - 3096]
	mov qword [rbp - 3136], rax
	mov rax, qword [rbp - 2472]
	mov qword [rbp - 648], rax
	b796:
	mov rax, qword [rbp - 3136]
	mov rcx, qword [rbp - 2528]
	cmp rax, rcx
	jl b797
	b798:
	mov rax, qword [rbp - 648]
	jmp b799
	b797:
	mov rax, qword [rbp - 2528]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3136]
	mov rbx, rax
	mov rax, qword [rbp - 648]
	mov r12, rax
	b800:
	cmp rbx, r15
	jl b801
	b802:
	mov rax, r12
	jmp b803
	b801:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b803:
	mov qword [rbp - 2936], rax
	mov rax, qword [rbp - 3136]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 648]
	mov r14, rax
	mov rax, qword [rbp - 2528]
	mov r13, rax
	b804:
	cmp r14, r15
	jl b805
	b806:
	mov rax, r13
	jmp b807
	b805:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b807:
	mov qword [rbp - 2760], rax
	mov rax, qword [rbp - 648]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2528]
	mov r14, rax
	mov rax, qword [rbp - 3136]
	mov rbx, rax
	b808:
	cmp r14, r13
	jl b809
	b810:
	mov rax, rbx
	jmp b811
	b809:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b811:
	mov rcx, rax
	mov rax, qword [rbp - 2936]
	mov r12, rax
	mov rax, qword [rbp - 2760]
	mov r14, rax
	mov rbx, rcx
	b812:
	cmp r14, r12
	jl b813
	b814:
	mov rax, rbx
	jmp b815
	b813:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b815:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b799:
	mov qword [rbp - 968], rax
	mov rax, qword [rbp - 3096]
	sub rax, 1
	mov qword [rbp - 3104], rax
	mov rax, qword [rbp - 2472]
	mov qword [rbp - 1152], rax
	mov rax, qword [rbp - 552]
	mov qword [rbp - 2176], rax
	b816:
	mov rcx, qword [rbp - 1152]
	mov rax, qword [rbp - 3104]
	cmp rcx, rax
	jl b817
	b818:
	mov rax, qword [rbp - 2176]
	jmp b819
	b817:
	mov rax, qword [rbp - 3104]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1152]
	mov r13, rax
	mov rax, qword [rbp - 2176]
	mov r12, rax
	b820:
	cmp r13, r15
	jl b821
	b822:
	mov rax, r12
	jmp b823
	b821:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b823:
	mov qword [rbp - 928], rax
	mov rax, qword [rbp - 1152]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2176]
	mov rbx, rax
	mov rax, qword [rbp - 3104]
	mov r15, rax
	b824:
	cmp rbx, r14
	jl b825
	b826:
	mov rax, r15
	jmp b827
	b825:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b827:
	mov qword [rbp - 3072], rax
	mov rax, qword [rbp - 2176]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3104]
	mov r14, rax
	mov rax, qword [rbp - 1152]
	mov rbx, rax
	b828:
	cmp r14, r15
	jl b829
	b830:
	mov rax, rbx
	jmp b831
	b829:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b831:
	mov rcx, rax
	mov rax, qword [rbp - 928]
	mov r12, rax
	mov rax, qword [rbp - 3072]
	mov r13, rax
	mov r15, rcx
	b832:
	cmp r13, r12
	jl b833
	b834:
	mov rax, r15
	jmp b835
	b833:
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b835:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b819:
	mov rcx, rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 3184], rax
	mov rax, qword [rbp - 968]
	mov qword [rbp - 1424], rax
	mov rax, rcx
	mov qword [rbp - 112], rax
	b836:
	mov rcx, qword [rbp - 1424]
	mov rax, qword [rbp - 3184]
	cmp rcx, rax
	jl b837
	b838:
	mov rax, qword [rbp - 112]
	jmp b839
	b837:
	mov rax, qword [rbp - 3184]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1424]
	mov rbx, rax
	mov rax, qword [rbp - 112]
	mov r13, rax
	b840:
	cmp rbx, r15
	jl b841
	b842:
	mov rax, r13
	jmp b843
	b841:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b843:
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 1424]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov r13, rax
	mov rax, qword [rbp - 3184]
	mov rbx, rax
	b844:
	cmp r13, r14
	jl b845
	b846:
	mov rax, rbx
	jmp b847
	b845:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b847:
	mov qword [rbp - 1952], rax
	mov rax, qword [rbp - 112]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3184]
	mov r15, rax
	mov rax, qword [rbp - 1424]
	mov r14, rax
	b848:
	cmp r15, rbx
	jl b849
	b850:
	mov rax, r14
	jmp b851
	b849:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b851:
	mov rcx, qword [rbp - 568]
	mov rbx, rcx
	mov rcx, qword [rbp - 1952]
	mov r12, rcx
	mov r13, rax
	b852:
	cmp r12, rbx
	jl b853
	b854:
	mov rax, r13
	jmp b855
	b853:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b855:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b839:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b775:
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 2456]
	sub rax, 1
	mov qword [rbp - 2792], rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 3264], rax
	mov rax, qword [rbp - 1488]
	mov qword [rbp - 416], rax
	b856:
	mov rax, qword [rbp - 3264]
	mov rcx, qword [rbp - 2792]
	cmp rax, rcx
	jl b857
	b858:
	mov rax, qword [rbp - 416]
	jmp b859
	b857:
	mov rax, qword [rbp - 2792]
	sub rax, 1
	mov qword [rbp - 2048], rax
	mov rax, qword [rbp - 3264]
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 1328], rax
	b860:
	mov rcx, qword [rbp - 272]
	mov rax, qword [rbp - 2048]
	cmp rcx, rax
	jl b861
	b862:
	mov rax, qword [rbp - 1328]
	jmp b863
	b861:
	mov rax, qword [rbp - 2048]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 272]
	mov rbx, rax
	mov rax, qword [rbp - 1328]
	mov r12, rax
	b864:
	cmp rbx, r14
	jl b865
	b866:
	mov rax, r12
	jmp b867
	b865:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b867:
	mov qword [rbp - 2256], rax
	mov rax, qword [rbp - 272]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1328]
	mov rbx, rax
	mov rax, qword [rbp - 2048]
	mov r12, rax
	b868:
	cmp rbx, r14
	jl b869
	b870:
	mov rax, r12
	jmp b871
	b869:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b871:
	mov qword [rbp - 2320], rax
	mov rax, qword [rbp - 1328]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2048]
	mov r12, rax
	mov rax, qword [rbp - 272]
	mov r13, rax
	b872:
	cmp r12, r14
	jl b873
	b874:
	mov rax, r13
	jmp b875
	b873:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b875:
	mov rcx, qword [rbp - 2256]
	mov r15, rcx
	mov rcx, qword [rbp - 2320]
	mov r14, rcx
	mov r12, rax
	b876:
	cmp r14, r15
	jl b877
	b878:
	mov rax, r12
	jmp b879
	b877:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b879:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b863:
	mov qword [rbp - 2664], rax
	mov rax, qword [rbp - 3264]
	sub rax, 1
	mov qword [rbp - 2056], rax
	mov rax, qword [rbp - 416]
	mov qword [rbp - 1448], rax
	mov rax, qword [rbp - 2792]
	mov qword [rbp - 2888], rax
	b880:
	mov rcx, qword [rbp - 1448]
	mov rax, qword [rbp - 2056]
	cmp rcx, rax
	jl b881
	b882:
	mov rax, qword [rbp - 2888]
	jmp b883
	b881:
	mov rax, qword [rbp - 2056]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1448]
	mov r14, rax
	mov rax, qword [rbp - 2888]
	mov r13, rax
	b884:
	cmp r14, r15
	jl b885
	b886:
	mov rax, r13
	jmp b887
	b885:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b887:
	mov qword [rbp - 2520], rax
	mov rax, qword [rbp - 1448]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2888]
	mov r15, rax
	mov rax, qword [rbp - 2056]
	mov rbx, rax
	b888:
	cmp r15, r13
	jl b889
	b890:
	mov rax, rbx
	jmp b891
	b889:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b891:
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 2888]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2056]
	mov r14, rax
	mov rax, qword [rbp - 1448]
	mov r13, rax
	b892:
	cmp r14, r15
	jl b893
	b894:
	mov rax, r13
	jmp b895
	b893:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b895:
	mov rcx, qword [rbp - 2520]
	mov r15, rcx
	mov rcx, qword [rbp - 184]
	mov r14, rcx
	mov r13, rax
	b896:
	cmp r14, r15
	jl b897
	b898:
	mov rax, r13
	jmp b899
	b897:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b899:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b883:
	mov qword [rbp - 3304], rax
	mov rax, qword [rbp - 416]
	sub rax, 1
	mov qword [rbp - 2184], rax
	mov rax, qword [rbp - 2792]
	mov qword [rbp - 2336], rax
	mov rax, qword [rbp - 3264]
	mov qword [rbp - 1056], rax
	b900:
	mov rax, qword [rbp - 2336]
	mov rcx, qword [rbp - 2184]
	cmp rax, rcx
	jl b901
	b902:
	mov rax, qword [rbp - 1056]
	jmp b903
	b901:
	mov rax, qword [rbp - 2184]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2336]
	mov rbx, rax
	mov rax, qword [rbp - 1056]
	mov r14, rax
	b904:
	cmp rbx, r15
	jl b905
	b906:
	mov rax, r14
	jmp b907
	b905:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b907:
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 2336]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1056]
	mov rbx, rax
	mov rax, qword [rbp - 2184]
	mov r15, rax
	b908:
	cmp rbx, r14
	jl b909
	b910:
	mov rax, r15
	jmp b911
	b909:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b911:
	mov qword [rbp - 2872], rax
	mov rax, qword [rbp - 1056]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2184]
	mov r14, rax
	mov rax, qword [rbp - 2336]
	mov rbx, rax
	b912:
	cmp r14, r15
	jl b913
	b914:
	mov rax, rbx
	jmp b915
	b913:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b915:
	mov rcx, rax
	mov rax, qword [rbp - 680]
	mov r15, rax
	mov rax, qword [rbp - 2872]
	mov r14, rax
	mov rbx, rcx
	b916:
	cmp r14, r15
	jl b917
	b918:
	mov rax, rbx
	jmp b919
	b917:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b919:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b903:
	mov rcx, rax
	mov rax, qword [rbp - 2664]
	mov qword [rbp - 1480], rax
	mov rax, qword [rbp - 3304]
	mov qword [rbp - 1800], rax
	mov rax, rcx
	mov qword [rbp - 496], rax
	b920:
	mov rax, qword [rbp - 1800]
	mov rcx, qword [rbp - 1480]
	cmp rax, rcx
	jl b921
	b922:
	mov rax, qword [rbp - 496]
	jmp b923
	b921:
	mov rax, qword [rbp - 1480]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1800]
	mov r12, rax
	mov rax, qword [rbp - 496]
	mov r15, rax
	b924:
	cmp r12, r14
	jl b925
	b926:
	mov rax, r15
	jmp b927
	b925:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b927:
	mov qword [rbp - 2896], rax
	mov rax, qword [rbp - 1800]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 496]
	mov r15, rax
	mov rax, qword [rbp - 1480]
	mov rbx, rax
	b928:
	cmp r15, r14
	jl b929
	b930:
	mov rax, rbx
	jmp b931
	b929:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b931:
	mov qword [rbp - 1688], rax
	mov rax, qword [rbp - 496]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1480]
	mov r12, rax
	mov rax, qword [rbp - 1800]
	mov r13, rax
	b932:
	cmp r12, r15
	jl b933
	b934:
	mov rax, r13
	jmp b935
	b933:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b935:
	mov rcx, qword [rbp - 2896]
	mov r15, rcx
	mov rcx, qword [rbp - 1688]
	mov r14, rcx
	mov r12, rax
	b936:
	cmp r14, r15
	jl b937
	b938:
	mov rax, r12
	jmp b939
	b937:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b939:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b923:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b859:
	mov rcx, rax
	mov rax, qword [rbp - 2632]
	mov qword [rbp - 1040], rax
	mov rax, qword [rbp - 424]
	mov qword [rbp - 2128], rax
	mov rax, rcx
	mov qword [rbp - 2576], rax
	b940:
	mov rax, qword [rbp - 2128]
	mov rcx, qword [rbp - 1040]
	cmp rax, rcx
	jl b941
	b942:
	mov rax, qword [rbp - 2576]
	jmp b943
	b941:
	mov rax, qword [rbp - 1040]
	sub rax, 1
	mov qword [rbp - 3384], rax
	mov rax, qword [rbp - 2128]
	mov qword [rbp - 3032], rax
	mov rax, qword [rbp - 2576]
	mov qword [rbp - 1896], rax
	b944:
	mov rax, qword [rbp - 3032]
	mov rcx, qword [rbp - 3384]
	cmp rax, rcx
	jl b945
	b946:
	mov rax, qword [rbp - 1896]
	jmp b947
	b945:
	mov rax, qword [rbp - 3384]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3032]
	mov rbx, rax
	mov rax, qword [rbp - 1896]
	mov r13, rax
	b948:
	cmp rbx, r12
	jl b949
	b950:
	mov rax, r13
	jmp b951
	b949:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b951:
	mov qword [rbp - 912], rax
	mov rax, qword [rbp - 3032]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1896]
	mov r15, rax
	mov rax, qword [rbp - 3384]
	mov rbx, rax
	b952:
	cmp r15, r14
	jl b953
	b954:
	mov rax, rbx
	jmp b955
	b953:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b955:
	mov qword [rbp - 2328], rax
	mov rax, qword [rbp - 1896]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 3384]
	mov rbx, rax
	mov rax, qword [rbp - 3032]
	mov r12, rax
	b956:
	cmp rbx, r13
	jl b957
	b958:
	mov rax, r12
	jmp b959
	b957:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b959:
	mov rcx, qword [rbp - 912]
	mov r15, rcx
	mov rcx, qword [rbp - 2328]
	mov rbx, rcx
	mov r14, rax
	b960:
	cmp rbx, r15
	jl b961
	b962:
	mov rax, r14
	jmp b963
	b961:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b963:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b947:
	mov qword [rbp - 1456], rax
	mov rax, qword [rbp - 2128]
	sub rax, 1
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 2576]
	mov qword [rbp - 2288], rax
	mov rax, qword [rbp - 1040]
	mov qword [rbp - 1288], rax
	b964:
	mov rcx, qword [rbp - 2288]
	mov rax, qword [rbp - 304]
	cmp rcx, rax
	jl b965
	b966:
	mov rax, qword [rbp - 1288]
	jmp b967
	b965:
	mov rax, qword [rbp - 304]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2288]
	mov r14, rax
	mov rax, qword [rbp - 1288]
	mov rbx, rax
	b968:
	cmp r14, r12
	jl b969
	b970:
	mov rax, rbx
	jmp b971
	b969:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b971:
	mov qword [rbp - 1120], rax
	mov rax, qword [rbp - 2288]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1288]
	mov r13, rax
	mov rax, qword [rbp - 304]
	mov rbx, rax
	b972:
	cmp r13, r15
	jl b973
	b974:
	mov rax, rbx
	jmp b975
	b973:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b975:
	mov qword [rbp - 1192], rax
	mov rax, qword [rbp - 1288]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 304]
	mov rbx, rax
	mov rax, qword [rbp - 2288]
	mov r12, rax
	b976:
	cmp rbx, r14
	jl b977
	b978:
	mov rax, r12
	jmp b979
	b977:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b979:
	mov rcx, qword [rbp - 1120]
	mov r15, rcx
	mov rcx, qword [rbp - 1192]
	mov r12, rcx
	mov rbx, rax
	b980:
	cmp r12, r15
	jl b981
	b982:
	mov rax, rbx
	jmp b983
	b981:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b983:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b967:
	mov qword [rbp - 3008], rax
	mov rax, qword [rbp - 2576]
	sub rax, 1
	mov qword [rbp - 2504], rax
	mov rax, qword [rbp - 1040]
	mov qword [rbp - 3000], rax
	mov rax, qword [rbp - 2128]
	mov qword [rbp - 32], rax
	b984:
	mov rcx, qword [rbp - 3000]
	mov rax, qword [rbp - 2504]
	cmp rcx, rax
	jl b985
	b986:
	mov rax, qword [rbp - 32]
	jmp b987
	b985:
	mov rax, qword [rbp - 2504]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3000]
	mov r14, rax
	mov rax, qword [rbp - 32]
	mov rbx, rax
	b988:
	cmp r14, r15
	jl b989
	b990:
	mov rax, rbx
	jmp b991
	b989:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b991:
	mov qword [rbp - 1632], rax
	mov rax, qword [rbp - 3000]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 32]
	mov r15, rax
	mov rax, qword [rbp - 2504]
	mov r13, rax
	b992:
	cmp r15, r14
	jl b993
	b994:
	mov rax, r13
	jmp b995
	b993:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b995:
	mov qword [rbp - 2240], rax
	mov rax, qword [rbp - 32]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2504]
	mov r14, rax
	mov rax, qword [rbp - 3000]
	mov rbx, rax
	b996:
	cmp r14, r15
	jl b997
	b998:
	mov rax, rbx
	jmp b999
	b997:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b999:
	mov rcx, rax
	mov rax, qword [rbp - 1632]
	mov r14, rax
	mov rax, qword [rbp - 2240]
	mov rbx, rax
	mov r15, rcx
	b1000:
	cmp rbx, r14
	jl b1001
	b1002:
	mov rax, r15
	jmp b1003
	b1001:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1003:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b987:
	mov rcx, rax
	mov rax, qword [rbp - 1456]
	mov qword [rbp - 1336], rax
	mov rax, qword [rbp - 3008]
	mov qword [rbp - 608], rax
	mov rax, rcx
	mov qword [rbp - 3112], rax
	b1004:
	mov rax, qword [rbp - 608]
	mov rcx, qword [rbp - 1336]
	cmp rax, rcx
	jl b1005
	b1006:
	mov rax, qword [rbp - 3112]
	jmp b1007
	b1005:
	mov rax, qword [rbp - 1336]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 608]
	mov r14, rax
	mov rax, qword [rbp - 3112]
	mov r13, rax
	b1008:
	cmp r14, r15
	jl b1009
	b1010:
	mov rax, r13
	jmp b1011
	b1009:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1011:
	mov qword [rbp - 2248], rax
	mov rax, qword [rbp - 608]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3112]
	mov rbx, rax
	mov rax, qword [rbp - 1336]
	mov r15, rax
	b1012:
	cmp rbx, r14
	jl b1013
	b1014:
	mov rax, r15
	jmp b1015
	b1013:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1015:
	mov qword [rbp - 3064], rax
	mov rax, qword [rbp - 3112]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1336]
	mov rbx, rax
	mov rax, qword [rbp - 608]
	mov r13, rax
	b1016:
	cmp rbx, r12
	jl b1017
	b1018:
	mov rax, r13
	jmp b1019
	b1017:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1019:
	mov rcx, qword [rbp - 2248]
	mov r15, rcx
	mov rcx, qword [rbp - 3064]
	mov r14, rcx
	mov rbx, rax
	b1020:
	cmp r14, r15
	jl b1021
	b1022:
	mov rax, rbx
	jmp b1023
	b1021:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1023:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1007:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b943:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b687:
	mov rcx, rax
	mov rax, qword [rbp - 848]
	mov qword [rbp - 2384], rax
	mov rax, qword [rbp - 2688]
	mov qword [rbp - 2768], rax
	mov rax, rcx
	mov qword [rbp - 1048], rax
	b1024:
	mov rax, qword [rbp - 2768]
	mov rcx, qword [rbp - 2384]
	cmp rax, rcx
	jl b1025
	b1026:
	mov rax, qword [rbp - 1048]
	jmp b1027
	b1025:
	mov rax, qword [rbp - 2384]
	sub rax, 1
	mov qword [rbp - 2040], rax
	mov rax, qword [rbp - 2768]
	mov qword [rbp - 976], rax
	mov rax, qword [rbp - 1048]
	mov qword [rbp - 1720], rax
	b1028:
	mov rax, qword [rbp - 976]
	mov rcx, qword [rbp - 2040]
	cmp rax, rcx
	jl b1029
	b1030:
	mov rax, qword [rbp - 1720]
	jmp b1031
	b1029:
	mov rax, qword [rbp - 2040]
	sub rax, 1
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 976]
	mov qword [rbp - 1520], rax
	mov rax, qword [rbp - 1720]
	mov qword [rbp - 456], rax
	b1032:
	mov rcx, qword [rbp - 1520]
	mov rax, qword [rbp - 288]
	cmp rcx, rax
	jl b1033
	b1034:
	mov rax, qword [rbp - 456]
	jmp b1035
	b1033:
	mov rax, qword [rbp - 288]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1520]
	mov r12, rax
	mov rax, qword [rbp - 456]
	mov r13, rax
	b1036:
	cmp r12, r15
	jl b1037
	b1038:
	mov rax, r13
	jmp b1039
	b1037:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1039:
	mov qword [rbp - 1296], rax
	mov rax, qword [rbp - 1520]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 456]
	mov r12, rax
	mov rax, qword [rbp - 288]
	mov r13, rax
	b1040:
	cmp r12, rbx
	jl b1041
	b1042:
	mov rax, r13
	jmp b1043
	b1041:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1043:
	mov qword [rbp - 3208], rax
	mov rax, qword [rbp - 456]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 288]
	mov r15, rax
	mov rax, qword [rbp - 1520]
	mov r12, rax
	b1044:
	cmp r15, r14
	jl b1045
	b1046:
	mov rax, r12
	jmp b1047
	b1045:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1047:
	mov rcx, rax
	mov rax, qword [rbp - 1296]
	mov r12, rax
	mov rax, qword [rbp - 3208]
	mov r14, rax
	mov r15, rcx
	b1048:
	cmp r14, r12
	jl b1049
	b1050:
	mov rax, r15
	jmp b1051
	b1049:
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1051:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1035:
	mov qword [rbp - 1304], rax
	mov rax, qword [rbp - 976]
	sub rax, 1
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 1720]
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 2040]
	mov qword [rbp - 2744], rax
	b1052:
	mov rcx, qword [rbp - 208]
	mov rax, qword [rbp - 576]
	cmp rcx, rax
	jl b1053
	b1054:
	mov rax, qword [rbp - 2744]
	jmp b1055
	b1053:
	mov rax, qword [rbp - 576]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 208]
	mov r13, rax
	mov rax, qword [rbp - 2744]
	mov rbx, rax
	b1056:
	cmp r13, r15
	jl b1057
	b1058:
	mov rax, rbx
	jmp b1059
	b1057:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1059:
	mov qword [rbp - 2432], rax
	mov rax, qword [rbp - 208]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2744]
	mov rbx, rax
	mov rax, qword [rbp - 576]
	mov r14, rax
	b1060:
	cmp rbx, r12
	jl b1061
	b1062:
	mov rax, r14
	jmp b1063
	b1061:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1063:
	mov qword [rbp - 1880], rax
	mov rax, qword [rbp - 2744]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 576]
	mov r14, rax
	mov rax, qword [rbp - 208]
	mov r12, rax
	b1064:
	cmp r14, r15
	jl b1065
	b1066:
	mov rax, r12
	jmp b1067
	b1065:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1067:
	mov rcx, rax
	mov rax, qword [rbp - 2432]
	mov r12, rax
	mov rax, qword [rbp - 1880]
	mov rbx, rax
	mov r13, rcx
	b1068:
	cmp rbx, r12
	jl b1069
	b1070:
	mov rax, r13
	jmp b1071
	b1069:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1071:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1055:
	mov qword [rbp - 2368], rax
	mov rax, qword [rbp - 1720]
	sub rax, 1
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 2040]
	mov qword [rbp - 1904], rax
	mov rax, qword [rbp - 976]
	mov qword [rbp - 688], rax
	b1072:
	mov rcx, qword [rbp - 1904]
	mov rax, qword [rbp - 728]
	cmp rcx, rax
	jl b1073
	b1074:
	mov rax, qword [rbp - 688]
	jmp b1075
	b1073:
	mov rax, qword [rbp - 728]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1904]
	mov r14, rax
	mov rax, qword [rbp - 688]
	mov r12, rax
	b1076:
	cmp r14, rbx
	jl b1077
	b1078:
	mov rax, r12
	jmp b1079
	b1077:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1079:
	mov qword [rbp - 776], rax
	mov rax, qword [rbp - 1904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 688]
	mov r12, rax
	mov rax, qword [rbp - 728]
	mov r15, rax
	b1080:
	cmp r12, r14
	jl b1081
	b1082:
	mov rax, r15
	jmp b1083
	b1081:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1083:
	mov qword [rbp - 1160], rax
	mov rax, qword [rbp - 688]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 728]
	mov r15, rax
	mov rax, qword [rbp - 1904]
	mov r13, rax
	b1084:
	cmp r15, r12
	jl b1085
	b1086:
	mov rax, r13
	jmp b1087
	b1085:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1087:
	mov rcx, qword [rbp - 776]
	mov r14, rcx
	mov rcx, qword [rbp - 1160]
	mov rbx, rcx
	mov r12, rax
	b1088:
	cmp rbx, r14
	jl b1089
	b1090:
	mov rax, r12
	jmp b1091
	b1089:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1091:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1075:
	mov rcx, rax
	mov rax, qword [rbp - 1304]
	mov qword [rbp - 1808], rax
	mov rax, qword [rbp - 2368]
	mov qword [rbp - 2800], rax
	mov rax, rcx
	mov qword [rbp - 320], rax
	b1092:
	mov rcx, qword [rbp - 2800]
	mov rax, qword [rbp - 1808]
	cmp rcx, rax
	jl b1093
	b1094:
	mov rax, qword [rbp - 320]
	jmp b1095
	b1093:
	mov rax, qword [rbp - 1808]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2800]
	mov r12, rax
	mov rax, qword [rbp - 320]
	mov r13, rax
	b1096:
	cmp r12, r14
	jl b1097
	b1098:
	mov rax, r13
	jmp b1099
	b1097:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1099:
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 2800]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 320]
	mov rbx, rax
	mov rax, qword [rbp - 1808]
	mov r14, rax
	b1100:
	cmp rbx, r12
	jl b1101
	b1102:
	mov rax, r14
	jmp b1103
	b1101:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1103:
	mov qword [rbp - 1536], rax
	mov rax, qword [rbp - 320]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1808]
	mov rbx, rax
	mov rax, qword [rbp - 2800]
	mov r12, rax
	b1104:
	cmp rbx, r15
	jl b1105
	b1106:
	mov rax, r12
	jmp b1107
	b1105:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1107:
	mov rcx, qword [rbp - 240]
	mov r14, rcx
	mov rcx, qword [rbp - 1536]
	mov r15, rcx
	mov rbx, rax
	b1108:
	cmp r15, r14
	jl b1109
	b1110:
	mov rax, rbx
	jmp b1111
	b1109:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1111:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1095:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1031:
	mov qword [rbp - 2616], rax
	mov rax, qword [rbp - 2768]
	sub rax, 1
	mov qword [rbp - 2224], rax
	mov rax, qword [rbp - 1048]
	mov qword [rbp - 2864], rax
	mov rax, qword [rbp - 2384]
	mov qword [rbp - 352], rax
	b1112:
	mov rcx, qword [rbp - 2864]
	mov rax, qword [rbp - 2224]
	cmp rcx, rax
	jl b1113
	b1114:
	mov rax, qword [rbp - 352]
	jmp b1115
	b1113:
	mov rax, qword [rbp - 2224]
	sub rax, 1
	mov qword [rbp - 1760], rax
	mov rax, qword [rbp - 2864]
	mov qword [rbp - 1648], rax
	mov rax, qword [rbp - 352]
	mov qword [rbp - 720], rax
	b1116:
	mov rax, qword [rbp - 1648]
	mov rcx, qword [rbp - 1760]
	cmp rax, rcx
	jl b1117
	b1118:
	mov rax, qword [rbp - 720]
	jmp b1119
	b1117:
	mov rax, qword [rbp - 1760]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1648]
	mov r14, rax
	mov rax, qword [rbp - 720]
	mov r12, rax
	b1120:
	cmp r14, r15
	jl b1121
	b1122:
	mov rax, r12
	jmp b1123
	b1121:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1123:
	mov qword [rbp - 1032], rax
	mov rax, qword [rbp - 1648]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 720]
	mov r15, rax
	mov rax, qword [rbp - 1760]
	mov rbx, rax
	b1124:
	cmp r15, r13
	jl b1125
	b1126:
	mov rax, rbx
	jmp b1127
	b1125:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1127:
	mov qword [rbp - 512], rax
	mov rax, qword [rbp - 720]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1760]
	mov r12, rax
	mov rax, qword [rbp - 1648]
	mov r13, rax
	b1128:
	cmp r12, rbx
	jl b1129
	b1130:
	mov rax, r13
	jmp b1131
	b1129:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1131:
	mov rcx, qword [rbp - 1032]
	mov rbx, rcx
	mov rcx, qword [rbp - 512]
	mov r15, rcx
	mov r13, rax
	b1132:
	cmp r15, rbx
	jl b1133
	b1134:
	mov rax, r13
	jmp b1135
	b1133:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1135:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1119:
	mov qword [rbp - 2112], rax
	mov rax, qword [rbp - 2864]
	sub rax, 1
	mov qword [rbp - 952], rax
	mov rax, qword [rbp - 352]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 2224]
	mov qword [rbp - 3336], rax
	b1136:
	mov rcx, qword [rbp - 224]
	mov rax, qword [rbp - 952]
	cmp rcx, rax
	jl b1137
	b1138:
	mov rax, qword [rbp - 3336]
	jmp b1139
	b1137:
	mov rax, qword [rbp - 952]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 224]
	mov r12, rax
	mov rax, qword [rbp - 3336]
	mov r13, rax
	b1140:
	cmp r12, rbx
	jl b1141
	b1142:
	mov rax, r13
	jmp b1143
	b1141:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1143:
	mov qword [rbp - 592], rax
	mov rax, qword [rbp - 224]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3336]
	mov r12, rax
	mov rax, qword [rbp - 952]
	mov r14, rax
	b1144:
	cmp r12, r15
	jl b1145
	b1146:
	mov rax, r14
	jmp b1147
	b1145:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1147:
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 3336]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 952]
	mov r15, rax
	mov rax, qword [rbp - 224]
	mov rbx, rax
	b1148:
	cmp r15, r14
	jl b1149
	b1150:
	mov rax, rbx
	jmp b1151
	b1149:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1151:
	mov rcx, qword [rbp - 592]
	mov r12, rcx
	mov rcx, qword [rbp - 16]
	mov r15, rcx
	mov r13, rax
	b1152:
	cmp r15, r12
	jl b1153
	b1154:
	mov rax, r13
	jmp b1155
	b1153:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1155:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1139:
	mov qword [rbp - 3240], rax
	mov rax, qword [rbp - 352]
	sub rax, 1
	mov qword [rbp - 2344], rax
	mov rax, qword [rbp - 2224]
	mov qword [rbp - 2424], rax
	mov rax, qword [rbp - 2864]
	mov qword [rbp - 1640], rax
	b1156:
	mov rax, qword [rbp - 2424]
	mov rcx, qword [rbp - 2344]
	cmp rax, rcx
	jl b1157
	b1158:
	mov rax, qword [rbp - 1640]
	jmp b1159
	b1157:
	mov rax, qword [rbp - 2344]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2424]
	mov r13, rax
	mov rax, qword [rbp - 1640]
	mov rbx, rax
	b1160:
	cmp r13, r14
	jl b1161
	b1162:
	mov rax, rbx
	jmp b1163
	b1161:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1163:
	mov qword [rbp - 3048], rax
	mov rax, qword [rbp - 2424]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1640]
	mov r14, rax
	mov rax, qword [rbp - 2344]
	mov r13, rax
	b1164:
	cmp r14, r12
	jl b1165
	b1166:
	mov rax, r13
	jmp b1167
	b1165:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1167:
	mov qword [rbp - 1744], rax
	mov rax, qword [rbp - 1640]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2344]
	mov r12, rax
	mov rax, qword [rbp - 2424]
	mov rbx, rax
	b1168:
	cmp r12, r14
	jl b1169
	b1170:
	mov rax, rbx
	jmp b1171
	b1169:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1171:
	mov rcx, rax
	mov rax, qword [rbp - 3048]
	mov r14, rax
	mov rax, qword [rbp - 1744]
	mov r13, rax
	mov rbx, rcx
	b1172:
	cmp r13, r14
	jl b1173
	b1174:
	mov rax, rbx
	jmp b1175
	b1173:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1175:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1159:
	mov rcx, rax
	mov rax, qword [rbp - 2112]
	mov qword [rbp - 2992], rax
	mov rax, qword [rbp - 3240]
	mov qword [rbp - 632], rax
	mov rax, rcx
	mov qword [rbp - 2696], rax
	b1176:
	mov rax, qword [rbp - 632]
	mov rcx, qword [rbp - 2992]
	cmp rax, rcx
	jl b1177
	b1178:
	mov rax, qword [rbp - 2696]
	jmp b1179
	b1177:
	mov rax, qword [rbp - 2992]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 632]
	mov r12, rax
	mov rax, qword [rbp - 2696]
	mov rbx, rax
	b1180:
	cmp r12, r15
	jl b1181
	b1182:
	mov rax, rbx
	jmp b1183
	b1181:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1183:
	mov qword [rbp - 2624], rax
	mov rax, qword [rbp - 632]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2696]
	mov r15, rax
	mov rax, qword [rbp - 2992]
	mov rbx, rax
	b1184:
	cmp r15, r14
	jl b1185
	b1186:
	mov rax, rbx
	jmp b1187
	b1185:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1187:
	mov qword [rbp - 328], rax
	mov rax, qword [rbp - 2696]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2992]
	mov r14, rax
	mov rax, qword [rbp - 632]
	mov r13, rax
	b1188:
	cmp r14, r15
	jl b1189
	b1190:
	mov rax, r13
	jmp b1191
	b1189:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1191:
	mov rcx, rax
	mov rax, qword [rbp - 2624]
	mov r15, rax
	mov rax, qword [rbp - 328]
	mov r12, rax
	mov r14, rcx
	b1192:
	cmp r12, r15
	jl b1193
	b1194:
	mov rax, r14
	jmp b1195
	b1193:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1195:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1179:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1115:
	mov qword [rbp - 1024], rax
	mov rax, qword [rbp - 1048]
	sub rax, 1
	mov qword [rbp - 896], rax
	mov rax, qword [rbp - 2384]
	mov qword [rbp - 1224], rax
	mov rax, qword [rbp - 2768]
	mov qword [rbp - 2232], rax
	b1196:
	mov rcx, qword [rbp - 1224]
	mov rax, qword [rbp - 896]
	cmp rcx, rax
	jl b1197
	b1198:
	mov rax, qword [rbp - 2232]
	jmp b1199
	b1197:
	mov rax, qword [rbp - 896]
	sub rax, 1
	mov qword [rbp - 3168], rax
	mov rax, qword [rbp - 1224]
	mov qword [rbp - 2592], rax
	mov rax, qword [rbp - 2232]
	mov qword [rbp - 2392], rax
	b1200:
	mov rcx, qword [rbp - 2592]
	mov rax, qword [rbp - 3168]
	cmp rcx, rax
	jl b1201
	b1202:
	mov rax, qword [rbp - 2392]
	jmp b1203
	b1201:
	mov rax, qword [rbp - 3168]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2592]
	mov r12, rax
	mov rax, qword [rbp - 2392]
	mov r15, rax
	b1204:
	cmp r12, r14
	jl b1205
	b1206:
	mov rax, r15
	jmp b1207
	b1205:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1207:
	mov qword [rbp - 1504], rax
	mov rax, qword [rbp - 2592]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2392]
	mov r14, rax
	mov rax, qword [rbp - 3168]
	mov r12, rax
	b1208:
	cmp r14, r13
	jl b1209
	b1210:
	mov rax, r12
	jmp b1211
	b1209:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1211:
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 2392]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3168]
	mov r14, rax
	mov rax, qword [rbp - 2592]
	mov r13, rax
	b1212:
	cmp r14, r15
	jl b1213
	b1214:
	mov rax, r13
	jmp b1215
	b1213:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1215:
	mov rcx, rax
	mov rax, qword [rbp - 1504]
	mov rbx, rax
	mov rax, qword [rbp - 248]
	mov r15, rax
	mov r14, rcx
	b1216:
	cmp r15, rbx
	jl b1217
	b1218:
	mov rax, r14
	jmp b1219
	b1217:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1219:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1203:
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 1224]
	sub rax, 1
	mov qword [rbp - 872], rax
	mov rax, qword [rbp - 2232]
	mov qword [rbp - 1568], rax
	mov rax, qword [rbp - 896]
	mov qword [rbp - 2080], rax
	b1220:
	mov rcx, qword [rbp - 1568]
	mov rax, qword [rbp - 872]
	cmp rcx, rax
	jl b1221
	b1222:
	mov rax, qword [rbp - 2080]
	jmp b1223
	b1221:
	mov rax, qword [rbp - 872]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1568]
	mov r14, rax
	mov rax, qword [rbp - 2080]
	mov rbx, rax
	b1224:
	cmp r14, r15
	jl b1225
	b1226:
	mov rax, rbx
	jmp b1227
	b1225:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1227:
	mov qword [rbp - 2304], rax
	mov rax, qword [rbp - 1568]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2080]
	mov r14, rax
	mov rax, qword [rbp - 872]
	mov r12, rax
	b1228:
	cmp r14, r15
	jl b1229
	b1230:
	mov rax, r12
	jmp b1231
	b1229:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1231:
	mov qword [rbp - 2608], rax
	mov rax, qword [rbp - 2080]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 872]
	mov r14, rax
	mov rax, qword [rbp - 1568]
	mov rbx, rax
	b1232:
	cmp r14, r15
	jl b1233
	b1234:
	mov rax, rbx
	jmp b1235
	b1233:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1235:
	mov rcx, qword [rbp - 2304]
	mov r14, rcx
	mov rcx, qword [rbp - 2608]
	mov rbx, rcx
	mov r13, rax
	b1236:
	cmp rbx, r14
	jl b1237
	b1238:
	mov rax, r13
	jmp b1239
	b1237:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1239:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1223:
	mov qword [rbp - 2960], rax
	mov rax, qword [rbp - 2232]
	sub rax, 1
	mov qword [rbp - 2016], rax
	mov rax, qword [rbp - 896]
	mov qword [rbp - 1168], rax
	mov rax, qword [rbp - 1224]
	mov qword [rbp - 2584], rax
	b1240:
	mov rcx, qword [rbp - 1168]
	mov rax, qword [rbp - 2016]
	cmp rcx, rax
	jl b1241
	b1242:
	mov rax, qword [rbp - 2584]
	jmp b1243
	b1241:
	mov rax, qword [rbp - 2016]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1168]
	mov r12, rax
	mov rax, qword [rbp - 2584]
	mov r15, rax
	b1244:
	cmp r12, r14
	jl b1245
	b1246:
	mov rax, r15
	jmp b1247
	b1245:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1247:
	mov qword [rbp - 936], rax
	mov rax, qword [rbp - 1168]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2584]
	mov r15, rax
	mov rax, qword [rbp - 2016]
	mov r12, rax
	b1248:
	cmp r15, r14
	jl b1249
	b1250:
	mov rax, r12
	jmp b1251
	b1249:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1251:
	mov qword [rbp - 1560], rax
	mov rax, qword [rbp - 2584]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2016]
	mov rbx, rax
	mov rax, qword [rbp - 1168]
	mov r12, rax
	b1252:
	cmp rbx, r15
	jl b1253
	b1254:
	mov rax, r12
	jmp b1255
	b1253:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1255:
	mov rcx, rax
	mov rax, qword [rbp - 936]
	mov rbx, rax
	mov rax, qword [rbp - 1560]
	mov r14, rax
	mov r15, rcx
	b1256:
	cmp r14, rbx
	jl b1257
	b1258:
	mov rax, r15
	jmp b1259
	b1257:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1259:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1243:
	mov rcx, rax
	mov rax, qword [rbp - 8]
	mov qword [rbp - 3344], rax
	mov rax, qword [rbp - 2960]
	mov qword [rbp - 392], rax
	mov rax, rcx
	mov qword [rbp - 3128], rax
	b1260:
	mov rax, qword [rbp - 392]
	mov rcx, qword [rbp - 3344]
	cmp rax, rcx
	jl b1261
	b1262:
	mov rax, qword [rbp - 3128]
	jmp b1263
	b1261:
	mov rax, qword [rbp - 3344]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 392]
	mov r12, rax
	mov rax, qword [rbp - 3128]
	mov r15, rax
	b1264:
	cmp r12, r14
	jl b1265
	b1266:
	mov rax, r15
	jmp b1267
	b1265:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1267:
	mov qword [rbp - 1600], rax
	mov rax, qword [rbp - 392]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3128]
	mov r12, rax
	mov rax, qword [rbp - 3344]
	mov r13, rax
	b1268:
	cmp r12, r15
	jl b1269
	b1270:
	mov rax, r13
	jmp b1271
	b1269:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1271:
	mov qword [rbp - 1216], rax
	mov rax, qword [rbp - 3128]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3344]
	mov r12, rax
	mov rax, qword [rbp - 392]
	mov r13, rax
	b1272:
	cmp r12, r15
	jl b1273
	b1274:
	mov rax, r13
	jmp b1275
	b1273:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1275:
	mov rcx, rax
	mov rax, qword [rbp - 1600]
	mov rbx, rax
	mov rax, qword [rbp - 1216]
	mov r15, rax
	mov r13, rcx
	b1276:
	cmp r15, rbx
	jl b1277
	b1278:
	mov rax, r13
	jmp b1279
	b1277:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1279:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1263:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1199:
	mov rcx, rax
	mov rax, qword [rbp - 2616]
	mov qword [rbp - 3376], rax
	mov rax, qword [rbp - 1024]
	mov qword [rbp - 1960], rax
	mov rax, rcx
	mov qword [rbp - 2376], rax
	b1280:
	mov rax, qword [rbp - 1960]
	mov rcx, qword [rbp - 3376]
	cmp rax, rcx
	jl b1281
	b1282:
	mov rax, qword [rbp - 2376]
	jmp b1283
	b1281:
	mov rax, qword [rbp - 3376]
	sub rax, 1
	mov qword [rbp - 792], rax
	mov rax, qword [rbp - 1960]
	mov qword [rbp - 824], rax
	mov rax, qword [rbp - 2376]
	mov qword [rbp - 2880], rax
	b1284:
	mov rax, qword [rbp - 824]
	mov rcx, qword [rbp - 792]
	cmp rax, rcx
	jl b1285
	b1286:
	mov rax, qword [rbp - 2880]
	jmp b1287
	b1285:
	mov rax, qword [rbp - 792]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 824]
	mov r12, rax
	mov rax, qword [rbp - 2880]
	mov r14, rax
	b1288:
	cmp r12, rbx
	jl b1289
	b1290:
	mov rax, r14
	jmp b1291
	b1289:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1291:
	mov qword [rbp - 2728], rax
	mov rax, qword [rbp - 824]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2880]
	mov r15, rax
	mov rax, qword [rbp - 792]
	mov r14, rax
	b1292:
	cmp r15, rbx
	jl b1293
	b1294:
	mov rax, r14
	jmp b1295
	b1293:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1295:
	mov qword [rbp - 1616], rax
	mov rax, qword [rbp - 2880]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 792]
	mov rbx, rax
	mov rax, qword [rbp - 824]
	mov r12, rax
	b1296:
	cmp rbx, r14
	jl b1297
	b1298:
	mov rax, r12
	jmp b1299
	b1297:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1299:
	mov rcx, rax
	mov rax, qword [rbp - 2728]
	mov r14, rax
	mov rax, qword [rbp - 1616]
	mov r12, rax
	mov r13, rcx
	b1300:
	cmp r12, r14
	jl b1301
	b1302:
	mov rax, r13
	jmp b1303
	b1301:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1303:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1287:
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 1960]
	sub rax, 1
	mov qword [rbp - 2920], rax
	mov rax, qword [rbp - 2376]
	mov qword [rbp - 1984], rax
	mov rax, qword [rbp - 3376]
	mov qword [rbp - 1384], rax
	b1304:
	mov rax, qword [rbp - 1984]
	mov rcx, qword [rbp - 2920]
	cmp rax, rcx
	jl b1305
	b1306:
	mov rax, qword [rbp - 1384]
	jmp b1307
	b1305:
	mov rax, qword [rbp - 2920]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1984]
	mov r14, rax
	mov rax, qword [rbp - 1384]
	mov r15, rax
	b1308:
	cmp r14, rbx
	jl b1309
	b1310:
	mov rax, r15
	jmp b1311
	b1309:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1311:
	mov qword [rbp - 3200], rax
	mov rax, qword [rbp - 1984]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1384]
	mov rbx, rax
	mov rax, qword [rbp - 2920]
	mov r12, rax
	b1312:
	cmp rbx, r14
	jl b1313
	b1314:
	mov rax, r12
	jmp b1315
	b1313:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1315:
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 1384]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2920]
	mov r15, rax
	mov rax, qword [rbp - 1984]
	mov rbx, rax
	b1316:
	cmp r15, r14
	jl b1317
	b1318:
	mov rax, rbx
	jmp b1319
	b1317:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1319:
	mov rcx, rax
	mov rax, qword [rbp - 3200]
	mov rbx, rax
	mov rax, qword [rbp - 152]
	mov r15, rax
	mov r12, rcx
	b1320:
	cmp r15, rbx
	jl b1321
	b1322:
	mov rax, r12
	jmp b1323
	b1321:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1323:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1307:
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 2376]
	sub rax, 1
	mov qword [rbp - 864], rax
	mov rax, qword [rbp - 3376]
	mov qword [rbp - 1312], rax
	mov rax, qword [rbp - 1960]
	mov qword [rbp - 280], rax
	b1324:
	mov rcx, qword [rbp - 1312]
	mov rax, qword [rbp - 864]
	cmp rcx, rax
	jl b1325
	b1326:
	mov rax, qword [rbp - 280]
	jmp b1327
	b1325:
	mov rax, qword [rbp - 864]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1312]
	mov r15, rax
	mov rax, qword [rbp - 280]
	mov r13, rax
	b1328:
	cmp r15, r14
	jl b1329
	b1330:
	mov rax, r13
	jmp b1331
	b1329:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1331:
	mov qword [rbp - 3056], rax
	mov rax, qword [rbp - 1312]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 280]
	mov rbx, rax
	mov rax, qword [rbp - 864]
	mov r13, rax
	b1332:
	cmp rbx, r15
	jl b1333
	b1334:
	mov rax, r13
	jmp b1335
	b1333:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1335:
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 280]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 864]
	mov r14, rax
	mov rax, qword [rbp - 1312]
	mov r13, rax
	b1336:
	cmp r14, rbx
	jl b1337
	b1338:
	mov rax, r13
	jmp b1339
	b1337:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1339:
	mov rcx, rax
	mov rax, qword [rbp - 3056]
	mov r15, rax
	mov rax, qword [rbp - 128]
	mov r14, rax
	mov rbx, rcx
	b1340:
	cmp r14, r15
	jl b1341
	b1342:
	mov rax, rbx
	jmp b1343
	b1341:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1343:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1327:
	mov rcx, rax
	mov rax, qword [rbp - 560]
	mov qword [rbp - 1920], rax
	mov rax, qword [rbp - 256]
	mov qword [rbp - 2720], rax
	mov rax, rcx
	mov qword [rbp - 3320], rax
	b1344:
	mov rax, qword [rbp - 2720]
	mov rcx, qword [rbp - 1920]
	cmp rax, rcx
	jl b1345
	b1346:
	mov rax, qword [rbp - 3320]
	jmp b1347
	b1345:
	mov rax, qword [rbp - 1920]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2720]
	mov r14, rax
	mov rax, qword [rbp - 3320]
	mov rbx, rax
	b1348:
	cmp r14, r13
	jl b1349
	b1350:
	mov rax, rbx
	jmp b1351
	b1349:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1351:
	mov qword [rbp - 1864], rax
	mov rax, qword [rbp - 2720]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3320]
	mov r15, rax
	mov rax, qword [rbp - 1920]
	mov r14, rax
	b1352:
	cmp r15, rbx
	jl b1353
	b1354:
	mov rax, r14
	jmp b1355
	b1353:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1355:
	mov r12, rax
	mov rax, qword [rbp - 3320]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1920]
	mov r15, rax
	mov rax, qword [rbp - 2720]
	mov qword [rbp - 2208], rax
	b1356:
	cmp r15, rbx
	jl b1357
	b1358:
	mov rax, qword [rbp - 2208]
	jmp b1359
	b1357:
	mov rax, rbx
	sub rax, 1
	mov rcx, qword [rbp - 2208]
	mov rdx, rcx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rcx, qword [rbp - 2208]
	mov rsi, rcx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, qword [rbp - 2208]
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1359:
	mov rcx, rax
	mov rax, qword [rbp - 1864]
	mov r14, rax
	mov r13, rcx
	b1360:
	cmp r12, r14
	jl b1361
	b1362:
	mov rax, r13
	jmp b1363
	b1361:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1363:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1347:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1283:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1027:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3:
	pop rbx
	pop r15
	pop r14
	pop r12
	pop r13
	leave
	ret 
_main:
	b1364:
	push rbp
	mov rbp, rsp
	sub rsp, 848
	push r13
	push r12
	push r14
	push r15
	push rbx
	mov rax, 18
	mov qword [rbp - 136], rax
	mov rax, 12
	mov qword [rbp - 264], rax
	mov rax, 6
	mov qword [rbp - 832], rax
	b1365:
	mov rcx, qword [rbp - 264]
	mov rax, qword [rbp - 136]
	cmp rcx, rax
	jl b1366
	b1367:
	mov rax, qword [rbp - 832]
	jmp b1368
	b1366:
	mov rax, qword [rbp - 136]
	sub rax, 1
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 264]
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 48], rax
	b1369:
	mov rcx, qword [rbp - 8]
	mov rax, qword [rbp - 288]
	cmp rcx, rax
	jl b1370
	b1371:
	mov rax, qword [rbp - 48]
	jmp b1372
	b1370:
	mov rax, qword [rbp - 288]
	sub rax, 1
	mov qword [rbp - 456], rax
	mov rax, qword [rbp - 8]
	mov qword [rbp - 768], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 392], rax
	b1373:
	mov rcx, qword [rbp - 768]
	mov rax, qword [rbp - 456]
	cmp rcx, rax
	jl b1374
	b1375:
	mov rax, qword [rbp - 392]
	jmp b1376
	b1374:
	mov rax, qword [rbp - 456]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 768]
	mov rbx, rax
	mov rax, qword [rbp - 392]
	mov r13, rax
	b1377:
	cmp rbx, r14
	jl b1378
	b1379:
	mov rax, r13
	jmp b1380
	b1378:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1380:
	mov qword [rbp - 624], rax
	mov rax, qword [rbp - 768]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 392]
	mov r12, rax
	mov rax, qword [rbp - 456]
	mov r13, rax
	b1381:
	cmp r12, r14
	jl b1382
	b1383:
	mov rax, r13
	jmp b1384
	b1382:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1384:
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 392]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 456]
	mov r13, rax
	mov rax, qword [rbp - 768]
	mov r15, rax
	b1385:
	cmp r13, rbx
	jl b1386
	b1387:
	mov rax, r15
	jmp b1388
	b1386:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1388:
	mov rcx, rax
	mov rax, qword [rbp - 624]
	mov r14, rax
	mov rax, qword [rbp - 104]
	mov r12, rax
	mov r15, rcx
	b1389:
	cmp r12, r14
	jl b1390
	b1391:
	mov rax, r15
	jmp b1392
	b1390:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1392:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1376:
	mov qword [rbp - 736], rax
	mov rax, qword [rbp - 8]
	sub rax, 1
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 48]
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 288]
	mov qword [rbp - 248], rax
	b1393:
	mov rax, qword [rbp - 184]
	mov rcx, qword [rbp - 400]
	cmp rax, rcx
	jl b1394
	b1395:
	mov rax, qword [rbp - 248]
	jmp b1396
	b1394:
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 184]
	mov r12, rax
	mov rax, qword [rbp - 248]
	mov r15, rax
	b1397:
	cmp r12, rbx
	jl b1398
	b1399:
	mov rax, r15
	jmp b1400
	b1398:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1400:
	mov qword [rbp - 480], rax
	mov rax, qword [rbp - 184]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 248]
	mov rbx, rax
	mov rax, qword [rbp - 400]
	mov r13, rax
	b1401:
	cmp rbx, r14
	jl b1402
	b1403:
	mov rax, r13
	jmp b1404
	b1402:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1404:
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 248]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 400]
	mov rbx, rax
	mov rax, qword [rbp - 184]
	mov r12, rax
	b1405:
	cmp rbx, r15
	jl b1406
	b1407:
	mov rax, r12
	jmp b1408
	b1406:
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1408:
	mov rcx, rax
	mov rax, qword [rbp - 480]
	mov r14, rax
	mov rax, qword [rbp - 152]
	mov r12, rax
	mov r13, rcx
	b1409:
	cmp r12, r14
	jl b1410
	b1411:
	mov rax, r13
	jmp b1412
	b1410:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1412:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1396:
	mov qword [rbp - 472], rax
	mov rax, qword [rbp - 48]
	sub rax, 1
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 288]
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 8]
	mov qword [rbp - 680], rax
	b1413:
	mov rcx, qword [rbp - 72]
	mov rax, qword [rbp - 224]
	cmp rcx, rax
	jl b1414
	b1415:
	mov rax, qword [rbp - 680]
	jmp b1416
	b1414:
	mov rax, qword [rbp - 224]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 72]
	mov rbx, rax
	mov rax, qword [rbp - 680]
	mov r15, rax
	b1417:
	cmp rbx, r13
	jl b1418
	b1419:
	mov rax, r15
	jmp b1420
	b1418:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1420:
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 72]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 680]
	mov rbx, rax
	mov rax, qword [rbp - 224]
	mov r13, rax
	b1421:
	cmp rbx, r14
	jl b1422
	b1423:
	mov rax, r13
	jmp b1424
	b1422:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1424:
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 680]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 224]
	mov rbx, rax
	mov rax, qword [rbp - 72]
	mov r13, rax
	b1425:
	cmp rbx, r15
	jl b1426
	b1427:
	mov rax, r13
	jmp b1428
	b1426:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1428:
	mov rcx, rax
	mov rax, qword [rbp - 16]
	mov r12, rax
	mov rax, qword [rbp - 208]
	mov r13, rax
	mov r14, rcx
	b1429:
	cmp r13, r12
	jl b1430
	b1431:
	mov rax, r14
	jmp b1432
	b1430:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1432:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1416:
	mov rcx, rax
	mov rax, qword [rbp - 736]
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 472]
	mov qword [rbp - 752], rax
	mov rax, rcx
	mov qword [rbp - 616], rax
	b1433:
	mov rcx, qword [rbp - 752]
	mov rax, qword [rbp - 40]
	cmp rcx, rax
	jl b1434
	b1435:
	mov rax, qword [rbp - 616]
	jmp b1436
	b1434:
	mov rax, qword [rbp - 40]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 752]
	mov r14, rax
	mov rax, qword [rbp - 616]
	mov r15, rax
	b1437:
	cmp r14, rbx
	jl b1438
	b1439:
	mov rax, r15
	jmp b1440
	b1438:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1440:
	mov qword [rbp - 712], rax
	mov rax, qword [rbp - 752]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 616]
	mov r15, rax
	mov rax, qword [rbp - 40]
	mov r13, rax
	b1441:
	cmp r15, r14
	jl b1442
	b1443:
	mov rax, r13
	jmp b1444
	b1442:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1444:
	mov qword [rbp - 128], rax
	mov rax, qword [rbp - 616]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 40]
	mov r15, rax
	mov rax, qword [rbp - 752]
	mov r12, rax
	b1445:
	cmp r15, r14
	jl b1446
	b1447:
	mov rax, r12
	jmp b1448
	b1446:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1448:
	mov rcx, rax
	mov rax, qword [rbp - 712]
	mov r15, rax
	mov rax, qword [rbp - 128]
	mov r13, rax
	mov rbx, rcx
	b1449:
	cmp r13, r15
	jl b1450
	b1451:
	mov rax, rbx
	jmp b1452
	b1450:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1452:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1436:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1372:
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 264]
	sub rax, 1
	mov qword [rbp - 776], rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 512], rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 232], rax
	b1453:
	mov rcx, qword [rbp - 512]
	mov rax, qword [rbp - 776]
	cmp rcx, rax
	jl b1454
	b1455:
	mov rax, qword [rbp - 232]
	jmp b1456
	b1454:
	mov rax, qword [rbp - 776]
	sub rax, 1
	mov qword [rbp - 416], rax
	mov rax, qword [rbp - 512]
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 232]
	mov qword [rbp - 448], rax
	b1457:
	mov rax, qword [rbp - 256]
	mov rcx, qword [rbp - 416]
	cmp rax, rcx
	jl b1458
	b1459:
	mov rax, qword [rbp - 448]
	jmp b1460
	b1458:
	mov rax, qword [rbp - 416]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 256]
	mov r15, rax
	mov rax, qword [rbp - 448]
	mov r13, rax
	b1461:
	cmp r15, rbx
	jl b1462
	b1463:
	mov rax, r13
	jmp b1464
	b1462:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1464:
	mov qword [rbp - 496], rax
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 448]
	mov r12, rax
	mov rax, qword [rbp - 416]
	mov rbx, rax
	b1465:
	cmp r12, r13
	jl b1466
	b1467:
	mov rax, rbx
	jmp b1468
	b1466:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1468:
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 448]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 416]
	mov r12, rax
	mov rax, qword [rbp - 256]
	mov r15, rax
	b1469:
	cmp r12, r14
	jl b1470
	b1471:
	mov rax, r15
	jmp b1472
	b1470:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1472:
	mov rcx, rax
	mov rax, qword [rbp - 496]
	mov r14, rax
	mov rax, qword [rbp - 56]
	mov rbx, rax
	mov r13, rcx
	b1473:
	cmp rbx, r14
	jl b1474
	b1475:
	mov rax, r13
	jmp b1476
	b1474:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1476:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1460:
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 512]
	sub rax, 1
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 232]
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 776]
	mov qword [rbp - 176], rax
	b1477:
	mov rax, qword [rbp - 384]
	mov rcx, qword [rbp - 360]
	cmp rax, rcx
	jl b1478
	b1479:
	mov rax, qword [rbp - 176]
	jmp b1480
	b1478:
	mov rax, qword [rbp - 360]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 384]
	mov r14, rax
	mov rax, qword [rbp - 176]
	mov r15, rax
	b1481:
	cmp r14, rbx
	jl b1482
	b1483:
	mov rax, r15
	jmp b1484
	b1482:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1484:
	mov qword [rbp - 584], rax
	mov rax, qword [rbp - 384]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 176]
	mov r14, rax
	mov rax, qword [rbp - 360]
	mov r12, rax
	b1485:
	cmp r14, r13
	jl b1486
	b1487:
	mov rax, r12
	jmp b1488
	b1486:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1488:
	mov qword [rbp - 632], rax
	mov rax, qword [rbp - 176]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 360]
	mov rbx, rax
	mov rax, qword [rbp - 384]
	mov r15, rax
	b1489:
	cmp rbx, r13
	jl b1490
	b1491:
	mov rax, r15
	jmp b1492
	b1490:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1492:
	mov rcx, rax
	mov rax, qword [rbp - 584]
	mov r15, rax
	mov rax, qword [rbp - 632]
	mov r13, rax
	mov r14, rcx
	b1493:
	cmp r13, r15
	jl b1494
	b1495:
	mov rax, r14
	jmp b1496
	b1494:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1496:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1480:
	mov qword [rbp - 840], rax
	mov rax, qword [rbp - 232]
	sub rax, 1
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 776]
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 512]
	mov qword [rbp - 200], rax
	b1497:
	mov rcx, qword [rbp - 696]
	mov rax, qword [rbp - 296]
	cmp rcx, rax
	jl b1498
	b1499:
	mov rax, qword [rbp - 200]
	jmp b1500
	b1498:
	mov rax, qword [rbp - 296]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 696]
	mov r15, rax
	mov rax, qword [rbp - 200]
	mov rbx, rax
	b1501:
	cmp r15, r14
	jl b1502
	b1503:
	mov rax, rbx
	jmp b1504
	b1502:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1504:
	mov qword [rbp - 824], rax
	mov rax, qword [rbp - 696]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 200]
	mov r15, rax
	mov rax, qword [rbp - 296]
	mov r14, rax
	b1505:
	cmp r15, r12
	jl b1506
	b1507:
	mov rax, r14
	jmp b1508
	b1506:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1508:
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 200]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 296]
	mov r15, rax
	mov rax, qword [rbp - 696]
	mov r13, rax
	b1509:
	cmp r15, r12
	jl b1510
	b1511:
	mov rax, r13
	jmp b1512
	b1510:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1512:
	mov rcx, qword [rbp - 824]
	mov r12, rcx
	mov rcx, qword [rbp - 560]
	mov r14, rcx
	mov r13, rax
	b1513:
	cmp r14, r12
	jl b1514
	b1515:
	mov rax, r13
	jmp b1516
	b1514:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1516:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1500:
	mov rcx, rax
	mov rax, qword [rbp - 728]
	mov qword [rbp - 328], rax
	mov rax, qword [rbp - 840]
	mov qword [rbp - 720], rax
	mov rax, rcx
	mov qword [rbp - 192], rax
	b1517:
	mov rcx, qword [rbp - 720]
	mov rax, qword [rbp - 328]
	cmp rcx, rax
	jl b1518
	b1519:
	mov rax, qword [rbp - 192]
	jmp b1520
	b1518:
	mov rax, qword [rbp - 328]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 720]
	mov r15, rax
	mov rax, qword [rbp - 192]
	mov r13, rax
	b1521:
	cmp r15, r14
	jl b1522
	b1523:
	mov rax, r13
	jmp b1524
	b1522:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1524:
	mov qword [rbp - 792], rax
	mov rax, qword [rbp - 720]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 192]
	mov r15, rax
	mov rax, qword [rbp - 328]
	mov r14, rax
	b1525:
	cmp r15, rbx
	jl b1526
	b1527:
	mov rax, r14
	jmp b1528
	b1526:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1528:
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 192]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 328]
	mov r15, rax
	mov rax, qword [rbp - 720]
	mov r13, rax
	b1529:
	cmp r15, rbx
	jl b1530
	b1531:
	mov rax, r13
	jmp b1532
	b1530:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1532:
	mov rcx, qword [rbp - 792]
	mov rbx, rcx
	mov rcx, qword [rbp - 336]
	mov r14, rcx
	mov r13, rax
	b1533:
	cmp r14, rbx
	jl b1534
	b1535:
	mov rax, r13
	jmp b1536
	b1534:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1536:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1520:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1456:
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov qword [rbp - 504], rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 264]
	mov qword [rbp - 304], rax
	b1537:
	mov rcx, qword [rbp - 88]
	mov rax, qword [rbp - 504]
	cmp rcx, rax
	jl b1538
	b1539:
	mov rax, qword [rbp - 304]
	jmp b1540
	b1538:
	mov rax, qword [rbp - 504]
	sub rax, 1
	mov qword [rbp - 800], rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 304]
	mov qword [rbp - 80], rax
	b1541:
	mov rcx, qword [rbp - 312]
	mov rax, qword [rbp - 800]
	cmp rcx, rax
	jl b1542
	b1543:
	mov rax, qword [rbp - 80]
	jmp b1544
	b1542:
	mov rax, qword [rbp - 800]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 312]
	mov r15, rax
	mov rax, qword [rbp - 80]
	mov r13, rax
	b1545:
	cmp r15, r12
	jl b1546
	b1547:
	mov rax, r13
	jmp b1548
	b1546:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1548:
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 312]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 80]
	mov r12, rax
	mov rax, qword [rbp - 800]
	mov r15, rax
	b1549:
	cmp r12, r14
	jl b1550
	b1551:
	mov rax, r15
	jmp b1552
	b1550:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1552:
	mov qword [rbp - 536], rax
	mov rax, qword [rbp - 80]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 800]
	mov r14, rax
	mov rax, qword [rbp - 312]
	mov r13, rax
	b1553:
	cmp r14, r15
	jl b1554
	b1555:
	mov rax, r13
	jmp b1556
	b1554:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1556:
	mov rcx, qword [rbp - 568]
	mov r12, rcx
	mov rcx, qword [rbp - 536]
	mov r15, rcx
	mov r14, rax
	b1557:
	cmp r15, r12
	jl b1558
	b1559:
	mov rax, r14
	jmp b1560
	b1558:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1560:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1544:
	mov qword [rbp - 608], rax
	mov rax, qword [rbp - 88]
	sub rax, 1
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 304]
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 504]
	mov qword [rbp - 784], rax
	b1561:
	mov rax, qword [rbp - 520]
	mov rcx, qword [rbp - 376]
	cmp rax, rcx
	jl b1562
	b1563:
	mov rax, qword [rbp - 784]
	jmp b1564
	b1562:
	mov rax, qword [rbp - 376]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 520]
	mov r12, rax
	mov rax, qword [rbp - 784]
	mov r14, rax
	b1565:
	cmp r12, r15
	jl b1566
	b1567:
	mov rax, r14
	jmp b1568
	b1566:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1568:
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 784]
	mov rbx, rax
	mov rax, qword [rbp - 376]
	mov r15, rax
	b1569:
	cmp rbx, r13
	jl b1570
	b1571:
	mov rax, r15
	jmp b1572
	b1570:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1572:
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 784]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 376]
	mov r15, rax
	mov rax, qword [rbp - 520]
	mov r13, rax
	b1573:
	cmp r15, r14
	jl b1574
	b1575:
	mov rax, r13
	jmp b1576
	b1574:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1576:
	mov rcx, qword [rbp - 96]
	mov r15, rcx
	mov rcx, qword [rbp - 216]
	mov rbx, rcx
	mov r14, rax
	b1577:
	cmp rbx, r15
	jl b1578
	b1579:
	mov rax, r14
	jmp b1580
	b1578:
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1580:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1564:
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 304]
	sub rax, 1
	mov qword [rbp - 816], rax
	mov rax, qword [rbp - 504]
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 88]
	mov qword [rbp - 440], rax
	b1581:
	mov rcx, qword [rbp - 144]
	mov rax, qword [rbp - 816]
	cmp rcx, rax
	jl b1582
	b1583:
	mov rax, qword [rbp - 440]
	jmp b1584
	b1582:
	mov rax, qword [rbp - 816]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 144]
	mov r12, rax
	mov rax, qword [rbp - 440]
	mov rbx, rax
	b1585:
	cmp r12, r14
	jl b1586
	b1587:
	mov rax, rbx
	jmp b1588
	b1586:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1588:
	mov qword [rbp - 808], rax
	mov rax, qword [rbp - 144]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 440]
	mov r15, rax
	mov rax, qword [rbp - 816]
	mov r14, rax
	b1589:
	cmp r15, rbx
	jl b1590
	b1591:
	mov rax, r14
	jmp b1592
	b1590:
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1592:
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 440]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 816]
	mov r14, rax
	mov rax, qword [rbp - 144]
	mov rbx, rax
	b1593:
	cmp r14, r15
	jl b1594
	b1595:
	mov rax, rbx
	jmp b1596
	b1594:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1596:
	mov rcx, rax
	mov rax, qword [rbp - 808]
	mov rbx, rax
	mov rax, qword [rbp - 408]
	mov r15, rax
	mov r12, rcx
	b1597:
	cmp r15, rbx
	jl b1598
	b1599:
	mov rax, r12
	jmp b1600
	b1598:
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1600:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1584:
	mov rcx, rax
	mov rax, qword [rbp - 608]
	mov qword [rbp - 688], rax
	mov rax, qword [rbp - 656]
	mov qword [rbp - 672], rax
	mov rax, rcx
	mov qword [rbp - 272], rax
	b1601:
	mov rax, qword [rbp - 672]
	mov rcx, qword [rbp - 688]
	cmp rax, rcx
	jl b1602
	b1603:
	mov rax, qword [rbp - 272]
	jmp b1604
	b1602:
	mov rax, qword [rbp - 688]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 672]
	mov r14, rax
	mov rax, qword [rbp - 272]
	mov r15, rax
	b1605:
	cmp r14, rbx
	jl b1606
	b1607:
	mov rax, r15
	jmp b1608
	b1606:
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1608:
	mov qword [rbp - 528], rax
	mov rax, qword [rbp - 672]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 272]
	mov rbx, rax
	mov rax, qword [rbp - 688]
	mov r13, rax
	b1609:
	cmp rbx, r15
	jl b1610
	b1611:
	mov rax, r13
	jmp b1612
	b1610:
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1612:
	mov qword [rbp - 600], rax
	mov rax, qword [rbp - 272]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 688]
	mov rbx, rax
	mov rax, qword [rbp - 672]
	mov r14, rax
	b1613:
	cmp rbx, r12
	jl b1614
	b1615:
	mov rax, r14
	jmp b1616
	b1614:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1616:
	mov rcx, rax
	mov rax, qword [rbp - 528]
	mov r14, rax
	mov rax, qword [rbp - 600]
	mov rbx, rax
	mov r12, rcx
	b1617:
	cmp rbx, r14
	jl b1618
	b1619:
	mov rax, r12
	jmp b1620
	b1618:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1620:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1604:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1540:
	mov rcx, rax
	mov rax, qword [rbp - 112]
	mov qword [rbp - 432], rax
	mov rax, qword [rbp - 160]
	mov qword [rbp - 368], rax
	mov rax, rcx
	mov qword [rbp - 704], rax
	b1621:
	mov rax, qword [rbp - 368]
	mov rcx, qword [rbp - 432]
	cmp rax, rcx
	jl b1622
	b1623:
	mov rax, qword [rbp - 704]
	jmp b1624
	b1622:
	mov rax, qword [rbp - 432]
	sub rax, 1
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 168], rax
	b1625:
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 32]
	cmp rax, rcx
	jl b1626
	b1627:
	mov rax, qword [rbp - 168]
	jmp b1628
	b1626:
	mov rax, qword [rbp - 32]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 24]
	mov r12, rax
	mov rax, qword [rbp - 168]
	mov r15, rax
	b1629:
	cmp r12, r13
	jl b1630
	b1631:
	mov rax, r15
	jmp b1632
	b1630:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1632:
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 168]
	mov r14, rax
	mov rax, qword [rbp - 32]
	mov r15, rax
	b1633:
	cmp r14, r12
	jl b1634
	b1635:
	mov rax, r15
	jmp b1636
	b1634:
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1636:
	mov qword [rbp - 744], rax
	mov rax, qword [rbp - 168]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 32]
	mov r13, rax
	mov rax, qword [rbp - 24]
	mov rbx, rax
	b1637:
	cmp r13, r12
	jl b1638
	b1639:
	mov rax, rbx
	jmp b1640
	b1638:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1640:
	mov rcx, rax
	mov rax, qword [rbp - 576]
	mov r14, rax
	mov rax, qword [rbp - 744]
	mov rbx, rax
	mov r15, rcx
	b1641:
	cmp rbx, r14
	jl b1642
	b1643:
	mov rax, r15
	jmp b1644
	b1642:
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1644:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1628:
	mov qword [rbp - 320], rax
	mov rax, qword [rbp - 368]
	sub rax, 1
	mov qword [rbp - 464], rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 760], rax
	mov rax, qword [rbp - 432]
	mov qword [rbp - 64], rax
	b1645:
	mov rcx, qword [rbp - 760]
	mov rax, qword [rbp - 464]
	cmp rcx, rax
	jl b1646
	b1647:
	mov rax, qword [rbp - 64]
	jmp b1648
	b1646:
	mov rax, qword [rbp - 464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 760]
	mov r14, rax
	mov rax, qword [rbp - 64]
	mov rbx, rax
	b1649:
	cmp r14, r15
	jl b1650
	b1651:
	mov rax, rbx
	jmp b1652
	b1650:
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1652:
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 760]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 64]
	mov r14, rax
	mov rax, qword [rbp - 464]
	mov rbx, rax
	b1653:
	cmp r14, r12
	jl b1654
	b1655:
	mov rax, rbx
	jmp b1656
	b1654:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1656:
	mov qword [rbp - 640], rax
	mov rax, qword [rbp - 64]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 464]
	mov rbx, rax
	mov rax, qword [rbp - 760]
	mov r13, rax
	b1657:
	cmp rbx, r12
	jl b1658
	b1659:
	mov rax, r13
	jmp b1660
	b1658:
	mov rax, r12
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1660:
	mov rcx, qword [rbp - 664]
	mov rbx, rcx
	mov rcx, qword [rbp - 640]
	mov r12, rcx
	mov r13, rax
	b1661:
	cmp r12, rbx
	jl b1662
	b1663:
	mov rax, r13
	jmp b1664
	b1662:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1664:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1648:
	mov qword [rbp - 592], rax
	mov rax, qword [rbp - 704]
	sub rax, 1
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 432]
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 544], rax
	b1665:
	mov rax, qword [rbp - 344]
	mov rcx, qword [rbp - 240]
	cmp rax, rcx
	jl b1666
	b1667:
	mov rax, qword [rbp - 544]
	jmp b1668
	b1666:
	mov rax, qword [rbp - 240]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 344]
	mov r15, rax
	mov rax, qword [rbp - 544]
	mov r14, rax
	b1669:
	cmp r15, r12
	jl b1670
	b1671:
	mov rax, r14
	jmp b1672
	b1670:
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1672:
	mov qword [rbp - 648], rax
	mov rax, qword [rbp - 344]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 544]
	mov r12, rax
	mov rax, qword [rbp - 240]
	mov r13, rax
	b1673:
	cmp r12, rbx
	jl b1674
	b1675:
	mov rax, r13
	jmp b1676
	b1674:
	mov rax, rbx
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1676:
	mov qword [rbp - 488], rax
	mov rax, qword [rbp - 544]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 240]
	mov r15, rax
	mov rax, qword [rbp - 344]
	mov rbx, rax
	b1677:
	cmp r15, r13
	jl b1678
	b1679:
	mov rax, rbx
	jmp b1680
	b1678:
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1680:
	mov rcx, qword [rbp - 648]
	mov r14, rcx
	mov rcx, qword [rbp - 488]
	mov r15, rcx
	mov r12, rax
	b1681:
	cmp r15, r14
	jl b1682
	b1683:
	mov rax, r12
	jmp b1684
	b1682:
	mov rax, r14
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1684:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1668:
	mov rcx, rax
	mov rax, qword [rbp - 320]
	mov qword [rbp - 552], rax
	mov rax, qword [rbp - 592]
	mov qword [rbp - 352], rax
	mov rax, rcx
	mov qword [rbp - 280], rax
	b1685:
	mov rax, qword [rbp - 352]
	mov rcx, qword [rbp - 552]
	cmp rax, rcx
	jl b1686
	b1687:
	mov rax, qword [rbp - 280]
	jmp b1688
	b1686:
	mov rax, qword [rbp - 552]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 352]
	mov r15, rax
	mov rax, qword [rbp - 280]
	mov r13, rax
	b1689:
	cmp r15, r14
	jl b1690
	b1691:
	mov rax, r13
	jmp b1692
	b1690:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1692:
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 352]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 280]
	mov rbx, rax
	mov rax, qword [rbp - 552]
	mov r13, rax
	b1693:
	cmp rbx, r14
	jl b1694
	b1695:
	mov rax, r13
	jmp b1696
	b1694:
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r15, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r13
	sub rax, 1
	mov rdx, rbx
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1696:
	mov r15, rax
	mov rax, qword [rbp - 280]
	sub rax, 1
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 552]
	mov r14, rax
	mov rax, qword [rbp - 352]
	mov r12, rax
	b1697:
	mov rax, qword [rbp - 424]
	cmp r14, rax
	jl b1698
	b1699:
	mov rax, r12
	jmp b1700
	b1698:
	mov rax, qword [rbp - 424]
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rcx, qword [rbp - 424]
	mov rdx, rcx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r14
	mov rcx, qword [rbp - 424]
	mov rsi, rcx
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1700:
	mov rcx, qword [rbp - 120]
	mov r14, rcx
	mov rbx, rax
	b1701:
	cmp r15, r14
	jl b1702
	b1703:
	mov rax, rbx
	jmp b1704
	b1702:
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov r13, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1704:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1688:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1624:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1368:
	b1705:
	pop rbx
	pop r15
	pop r14
	pop r12
	pop r13
	leave
	ret 
__init:
	b1706:
	push rbp
	mov rbp, rsp
	call _main
	leave
	ret 
	section .data
