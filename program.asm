





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
	sub rsp, 13648
	push r13
	push r12
	push r14
	push r15
	push rbx
	mov rax, rdi
	mov qword [rbp - 9272], rax
	mov rax, rsi
	mov qword [rbp - 8144], rax
	mov rax, rdx
	mov qword [rbp - 13184], rax
	mov rcx, qword [rbp - 8144]
	mov rax, qword [rbp - 9272]
	cmp rcx, rax
	jl b1
	b2:
	mov rax, qword [rbp - 13184]
	jmp b3
	b1:
	mov rax, qword [rbp - 9272]
	sub rax, 1
	mov qword [rbp - 4472], rax
	mov rax, qword [rbp - 8144]
	mov qword [rbp - 9648], rax
	mov rax, qword [rbp - 13184]
	mov qword [rbp - 10304], rax
	b4:
	mov rcx, qword [rbp - 9648]
	mov rax, qword [rbp - 4472]
	cmp rcx, rax
	jl b5
	b6:
	mov rax, qword [rbp - 10304]
	jmp b7
	b5:
	mov rax, qword [rbp - 4472]
	sub rax, 1
	mov qword [rbp - 2016], rax
	mov rax, qword [rbp - 9648]
	mov qword [rbp - 9240], rax
	mov rax, qword [rbp - 10304]
	mov qword [rbp - 3608], rax
	b8:
	mov rax, qword [rbp - 9240]
	mov rcx, qword [rbp - 2016]
	cmp rax, rcx
	jl b9
	b10:
	mov rax, qword [rbp - 3608]
	jmp b11
	b9:
	mov rax, qword [rbp - 2016]
	sub rax, 1
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 9240]
	mov qword [rbp - 2776], rax
	mov rax, qword [rbp - 3608]
	mov qword [rbp - 9800], rax
	b12:
	mov rcx, qword [rbp - 2776]
	mov rax, qword [rbp - 256]
	cmp rcx, rax
	jl b13
	b14:
	mov rax, qword [rbp - 9800]
	jmp b15
	b13:
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov qword [rbp - 1168], rax
	mov rax, qword [rbp - 2776]
	mov qword [rbp - 7384], rax
	mov rax, qword [rbp - 9800]
	mov qword [rbp - 2672], rax
	b16:
	mov rcx, qword [rbp - 7384]
	mov rax, qword [rbp - 1168]
	cmp rcx, rax
	jl b17
	b18:
	mov rax, qword [rbp - 2672]
	jmp b19
	b17:
	mov rax, qword [rbp - 1168]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7384]
	mov r13, rax
	mov rax, qword [rbp - 2672]
	mov r14, rax
	b20:
	cmp r13, r12
	jl b21
	b22:
	mov rax, r14
	jmp b23
	b21:
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
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b23:
	mov qword [rbp - 6008], rax
	mov rax, qword [rbp - 7384]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2672]
	mov rbx, rax
	mov rax, qword [rbp - 1168]
	mov r13, rax
	b24:
	cmp rbx, r12
	jl b25
	b26:
	mov rax, r13
	jmp b27
	b25:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b27:
	mov qword [rbp - 13416], rax
	mov rax, qword [rbp - 2672]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1168]
	mov r12, rax
	mov rax, qword [rbp - 7384]
	mov rbx, rax
	b28:
	cmp r12, r14
	jl b29
	b30:
	mov rax, rbx
	jmp b31
	b29:
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
	b31:
	mov rcx, rax
	mov rax, qword [rbp - 6008]
	mov r12, rax
	mov rax, qword [rbp - 13416]
	mov rbx, rax
	mov r15, rcx
	b32:
	cmp rbx, r12
	jl b33
	b34:
	mov rax, r15
	jmp b35
	b33:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b35:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b19:
	mov qword [rbp - 704], rax
	mov rax, qword [rbp - 2776]
	sub rax, 1
	mov qword [rbp - 13440], rax
	mov rax, qword [rbp - 9800]
	mov qword [rbp - 9416], rax
	mov rax, qword [rbp - 256]
	mov qword [rbp - 10784], rax
	b36:
	mov rcx, qword [rbp - 9416]
	mov rax, qword [rbp - 13440]
	cmp rcx, rax
	jl b37
	b38:
	mov rax, qword [rbp - 10784]
	jmp b39
	b37:
	mov rax, qword [rbp - 13440]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9416]
	mov r12, rax
	mov rax, qword [rbp - 10784]
	mov r13, rax
	b40:
	cmp r12, r14
	jl b41
	b42:
	mov rax, r13
	jmp b43
	b41:
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
	b43:
	mov qword [rbp - 3936], rax
	mov rax, qword [rbp - 9416]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10784]
	mov r13, rax
	mov rax, qword [rbp - 13440]
	mov r15, rax
	b44:
	cmp r13, r14
	jl b45
	b46:
	mov rax, r15
	jmp b47
	b45:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
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
	b47:
	mov qword [rbp - 12320], rax
	mov rax, qword [rbp - 10784]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13440]
	mov rbx, rax
	mov rax, qword [rbp - 9416]
	mov r14, rax
	b48:
	cmp rbx, r15
	jl b49
	b50:
	mov rax, r14
	jmp b51
	b49:
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
	b51:
	mov rcx, rax
	mov rax, qword [rbp - 3936]
	mov r14, rax
	mov rax, qword [rbp - 12320]
	mov r12, rax
	mov r13, rcx
	b52:
	cmp r12, r14
	jl b53
	b54:
	mov rax, r13
	jmp b55
	b53:
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
	b55:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b39:
	mov qword [rbp - 7992], rax
	mov rax, qword [rbp - 9800]
	sub rax, 1
	mov qword [rbp - 9728], rax
	mov rax, qword [rbp - 256]
	mov qword [rbp - 11032], rax
	mov rax, qword [rbp - 2776]
	mov qword [rbp - 12112], rax
	b56:
	mov rax, qword [rbp - 11032]
	mov rcx, qword [rbp - 9728]
	cmp rax, rcx
	jl b57
	b58:
	mov rax, qword [rbp - 12112]
	jmp b59
	b57:
	mov rax, qword [rbp - 9728]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 11032]
	mov rbx, rax
	mov rax, qword [rbp - 12112]
	mov r13, rax
	b60:
	cmp rbx, r12
	jl b61
	b62:
	mov rax, r13
	jmp b63
	b61:
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
	b63:
	mov qword [rbp - 648], rax
	mov rax, qword [rbp - 11032]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12112]
	mov rbx, rax
	mov rax, qword [rbp - 9728]
	mov r12, rax
	b64:
	cmp rbx, r15
	jl b65
	b66:
	mov rax, r12
	jmp b67
	b65:
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
	b67:
	mov qword [rbp - 2176], rax
	mov rax, qword [rbp - 12112]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 9728]
	mov r15, rax
	mov rax, qword [rbp - 11032]
	mov r12, rax
	b68:
	cmp r15, r13
	jl b69
	b70:
	mov rax, r12
	jmp b71
	b69:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
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
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b71:
	mov rcx, qword [rbp - 648]
	mov r14, rcx
	mov rcx, qword [rbp - 2176]
	mov r15, rcx
	mov r13, rax
	b72:
	cmp r15, r14
	jl b73
	b74:
	mov rax, r13
	jmp b75
	b73:
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
	b75:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b59:
	mov rcx, rax
	mov rax, qword [rbp - 704]
	mov qword [rbp - 12888], rax
	mov rax, qword [rbp - 7992]
	mov qword [rbp - 8320], rax
	mov rax, rcx
	mov qword [rbp - 4344], rax
	b76:
	mov rcx, qword [rbp - 8320]
	mov rax, qword [rbp - 12888]
	cmp rcx, rax
	jl b77
	b78:
	mov rax, qword [rbp - 4344]
	jmp b79
	b77:
	mov rax, qword [rbp - 12888]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8320]
	mov r15, rax
	mov rax, qword [rbp - 4344]
	mov r13, rax
	b80:
	cmp r15, rbx
	jl b81
	b82:
	mov rax, r13
	jmp b83
	b81:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b83:
	mov qword [rbp - 6272], rax
	mov rax, qword [rbp - 8320]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4344]
	mov r15, rax
	mov rax, qword [rbp - 12888]
	mov r13, rax
	b84:
	cmp r15, r12
	jl b85
	b86:
	mov rax, r13
	jmp b87
	b85:
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
	b87:
	mov qword [rbp - 8480], rax
	mov rax, qword [rbp - 4344]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12888]
	mov r15, rax
	mov rax, qword [rbp - 8320]
	mov r12, rax
	b88:
	cmp r15, r14
	jl b89
	b90:
	mov rax, r12
	jmp b91
	b89:
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
	b91:
	mov rcx, qword [rbp - 6272]
	mov r13, rcx
	mov rcx, qword [rbp - 8480]
	mov rbx, rcx
	mov r15, rax
	b92:
	cmp rbx, r13
	jl b93
	b94:
	mov rax, r15
	jmp b95
	b93:
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
	b95:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b79:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b15:
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 9240]
	sub rax, 1
	mov qword [rbp - 1744], rax
	mov rax, qword [rbp - 3608]
	mov qword [rbp - 10472], rax
	mov rax, qword [rbp - 2016]
	mov qword [rbp - 12432], rax
	b96:
	mov rax, qword [rbp - 10472]
	mov rcx, qword [rbp - 1744]
	cmp rax, rcx
	jl b97
	b98:
	mov rax, qword [rbp - 12432]
	jmp b99
	b97:
	mov rax, qword [rbp - 1744]
	sub rax, 1
	mov qword [rbp - 6864], rax
	mov rax, qword [rbp - 10472]
	mov qword [rbp - 2288], rax
	mov rax, qword [rbp - 12432]
	mov qword [rbp - 96], rax
	b100:
	mov rax, qword [rbp - 2288]
	mov rcx, qword [rbp - 6864]
	cmp rax, rcx
	jl b101
	b102:
	mov rax, qword [rbp - 96]
	jmp b103
	b101:
	mov rax, qword [rbp - 6864]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2288]
	mov r15, rax
	mov rax, qword [rbp - 96]
	mov r12, rax
	b104:
	cmp r15, r14
	jl b105
	b106:
	mov rax, r12
	jmp b107
	b105:
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
	b107:
	mov qword [rbp - 2976], rax
	mov rax, qword [rbp - 2288]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 96]
	mov rbx, rax
	mov rax, qword [rbp - 6864]
	mov r12, rax
	b108:
	cmp rbx, r14
	jl b109
	b110:
	mov rax, r12
	jmp b111
	b109:
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
	b111:
	mov qword [rbp - 9072], rax
	mov rax, qword [rbp - 96]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6864]
	mov r15, rax
	mov rax, qword [rbp - 2288]
	mov r13, rax
	b112:
	cmp r15, rbx
	jl b113
	b114:
	mov rax, r13
	jmp b115
	b113:
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
	b115:
	mov rcx, qword [rbp - 2976]
	mov r12, rcx
	mov rcx, qword [rbp - 9072]
	mov r14, rcx
	mov rbx, rax
	b116:
	cmp r14, r12
	jl b117
	b118:
	mov rax, rbx
	jmp b119
	b117:
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
	b119:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b103:
	mov qword [rbp - 11760], rax
	mov rax, qword [rbp - 10472]
	sub rax, 1
	mov qword [rbp - 5128], rax
	mov rax, qword [rbp - 12432]
	mov qword [rbp - 3152], rax
	mov rax, qword [rbp - 1744]
	mov qword [rbp - 3672], rax
	b120:
	mov rax, qword [rbp - 3152]
	mov rcx, qword [rbp - 5128]
	cmp rax, rcx
	jl b121
	b122:
	mov rax, qword [rbp - 3672]
	jmp b123
	b121:
	mov rax, qword [rbp - 5128]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3152]
	mov rbx, rax
	mov rax, qword [rbp - 3672]
	mov r12, rax
	b124:
	cmp rbx, r14
	jl b125
	b126:
	mov rax, r12
	jmp b127
	b125:
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
	b127:
	mov qword [rbp - 12736], rax
	mov rax, qword [rbp - 3152]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3672]
	mov r15, rax
	mov rax, qword [rbp - 5128]
	mov r14, rax
	b128:
	cmp r15, rbx
	jl b129
	b130:
	mov rax, r14
	jmp b131
	b129:
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
	b131:
	mov qword [rbp - 1440], rax
	mov rax, qword [rbp - 3672]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5128]
	mov rbx, rax
	mov rax, qword [rbp - 3152]
	mov r14, rax
	b132:
	cmp rbx, r12
	jl b133
	b134:
	mov rax, r14
	jmp b135
	b133:
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
	b135:
	mov rcx, rax
	mov rax, qword [rbp - 12736]
	mov r15, rax
	mov rax, qword [rbp - 1440]
	mov rbx, rax
	mov r13, rcx
	b136:
	cmp rbx, r15
	jl b137
	b138:
	mov rax, r13
	jmp b139
	b137:
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
	b139:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b123:
	mov qword [rbp - 10824], rax
	mov rax, qword [rbp - 12432]
	sub rax, 1
	mov qword [rbp - 2192], rax
	mov rax, qword [rbp - 1744]
	mov qword [rbp - 5312], rax
	mov rax, qword [rbp - 10472]
	mov qword [rbp - 312], rax
	b140:
	mov rax, qword [rbp - 5312]
	mov rcx, qword [rbp - 2192]
	cmp rax, rcx
	jl b141
	b142:
	mov rax, qword [rbp - 312]
	jmp b143
	b141:
	mov rax, qword [rbp - 2192]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5312]
	mov r12, rax
	mov rax, qword [rbp - 312]
	mov r13, rax
	b144:
	cmp r12, r15
	jl b145
	b146:
	mov rax, r13
	jmp b147
	b145:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b147:
	mov qword [rbp - 8328], rax
	mov rax, qword [rbp - 5312]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 312]
	mov r12, rax
	mov rax, qword [rbp - 2192]
	mov r15, rax
	b148:
	cmp r12, rbx
	jl b149
	b150:
	mov rax, r15
	jmp b151
	b149:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b151:
	mov qword [rbp - 5104], rax
	mov rax, qword [rbp - 312]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2192]
	mov rbx, rax
	mov rax, qword [rbp - 5312]
	mov r14, rax
	b152:
	cmp rbx, r13
	jl b153
	b154:
	mov rax, r14
	jmp b155
	b153:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b155:
	mov rcx, rax
	mov rax, qword [rbp - 8328]
	mov r14, rax
	mov rax, qword [rbp - 5104]
	mov r12, rax
	mov rbx, rcx
	b156:
	cmp r12, r14
	jl b157
	b158:
	mov rax, rbx
	jmp b159
	b157:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b159:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b143:
	mov rcx, qword [rbp - 11760]
	mov qword [rbp - 9280], rcx
	mov rcx, qword [rbp - 10824]
	mov qword [rbp - 7320], rcx
	mov qword [rbp - 7848], rax
	b160:
	mov rax, qword [rbp - 7320]
	mov rcx, qword [rbp - 9280]
	cmp rax, rcx
	jl b161
	b162:
	mov rax, qword [rbp - 7848]
	jmp b163
	b161:
	mov rax, qword [rbp - 9280]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7320]
	mov r14, rax
	mov rax, qword [rbp - 7848]
	mov r15, rax
	b164:
	cmp r14, r12
	jl b165
	b166:
	mov rax, r15
	jmp b167
	b165:
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
	b167:
	mov qword [rbp - 816], rax
	mov rax, qword [rbp - 7320]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7848]
	mov rbx, rax
	mov rax, qword [rbp - 9280]
	mov r12, rax
	b168:
	cmp rbx, r14
	jl b169
	b170:
	mov rax, r12
	jmp b171
	b169:
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
	b171:
	mov qword [rbp - 12040], rax
	mov rax, qword [rbp - 7848]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9280]
	mov r12, rax
	mov rax, qword [rbp - 7320]
	mov r15, rax
	b172:
	cmp r12, r14
	jl b173
	b174:
	mov rax, r15
	jmp b175
	b173:
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
	b175:
	mov rcx, rax
	mov rax, qword [rbp - 816]
	mov r14, rax
	mov rax, qword [rbp - 12040]
	mov r15, rax
	mov rbx, rcx
	b176:
	cmp r15, r14
	jl b177
	b178:
	mov rax, rbx
	jmp b179
	b177:
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
	b179:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b163:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b99:
	mov qword [rbp - 9984], rax
	mov rax, qword [rbp - 3608]
	sub rax, 1
	mov qword [rbp - 5616], rax
	mov rax, qword [rbp - 2016]
	mov qword [rbp - 2616], rax
	mov rax, qword [rbp - 9240]
	mov qword [rbp - 7240], rax
	b180:
	mov rcx, qword [rbp - 2616]
	mov rax, qword [rbp - 5616]
	cmp rcx, rax
	jl b181
	b182:
	mov rax, qword [rbp - 7240]
	jmp b183
	b181:
	mov rax, qword [rbp - 5616]
	sub rax, 1
	mov qword [rbp - 4240], rax
	mov rax, qword [rbp - 2616]
	mov qword [rbp - 10064], rax
	mov rax, qword [rbp - 7240]
	mov qword [rbp - 10568], rax
	b184:
	mov rcx, qword [rbp - 10064]
	mov rax, qword [rbp - 4240]
	cmp rcx, rax
	jl b185
	b186:
	mov rax, qword [rbp - 10568]
	jmp b187
	b185:
	mov rax, qword [rbp - 4240]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10064]
	mov r12, rax
	mov rax, qword [rbp - 10568]
	mov r15, rax
	b188:
	cmp r12, r14
	jl b189
	b190:
	mov rax, r15
	jmp b191
	b189:
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
	b191:
	mov qword [rbp - 6168], rax
	mov rax, qword [rbp - 10064]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 10568]
	mov r12, rax
	mov rax, qword [rbp - 4240]
	mov r15, rax
	b192:
	cmp r12, r13
	jl b193
	b194:
	mov rax, r15
	jmp b195
	b193:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b195:
	mov qword [rbp - 5888], rax
	mov rax, qword [rbp - 10568]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4240]
	mov rbx, rax
	mov rax, qword [rbp - 10064]
	mov r13, rax
	b196:
	cmp rbx, r14
	jl b197
	b198:
	mov rax, r13
	jmp b199
	b197:
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
	b199:
	mov rcx, rax
	mov rax, qword [rbp - 6168]
	mov r15, rax
	mov rax, qword [rbp - 5888]
	mov r14, rax
	mov r12, rcx
	b200:
	cmp r14, r15
	jl b201
	b202:
	mov rax, r12
	jmp b203
	b201:
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
	b203:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b187:
	mov qword [rbp - 8632], rax
	mov rax, qword [rbp - 2616]
	sub rax, 1
	mov qword [rbp - 11184], rax
	mov rax, qword [rbp - 7240]
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 5616]
	mov qword [rbp - 13624], rax
	b204:
	mov rcx, qword [rbp - 664]
	mov rax, qword [rbp - 11184]
	cmp rcx, rax
	jl b205
	b206:
	mov rax, qword [rbp - 13624]
	jmp b207
	b205:
	mov rax, qword [rbp - 11184]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 664]
	mov r15, rax
	mov rax, qword [rbp - 13624]
	mov rbx, rax
	b208:
	cmp r15, r14
	jl b209
	b210:
	mov rax, rbx
	jmp b211
	b209:
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
	b211:
	mov qword [rbp - 12520], rax
	mov rax, qword [rbp - 664]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 13624]
	mov r14, rax
	mov rax, qword [rbp - 11184]
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
	mov qword [rbp - 2816], rax
	mov rax, qword [rbp - 13624]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11184]
	mov rbx, rax
	mov rax, qword [rbp - 664]
	mov r14, rax
	b216:
	cmp rbx, r15
	jl b217
	b218:
	mov rax, r14
	jmp b219
	b217:
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
	b219:
	mov rcx, rax
	mov rax, qword [rbp - 12520]
	mov r14, rax
	mov rax, qword [rbp - 2816]
	mov r15, rax
	mov rbx, rcx
	b220:
	cmp r15, r14
	jl b221
	b222:
	mov rax, rbx
	jmp b223
	b221:
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
	b223:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b207:
	mov qword [rbp - 1464], rax
	mov rax, qword [rbp - 7240]
	sub rax, 1
	mov qword [rbp - 13088], rax
	mov rax, qword [rbp - 5616]
	mov qword [rbp - 712], rax
	mov rax, qword [rbp - 2616]
	mov qword [rbp - 12744], rax
	b224:
	mov rcx, qword [rbp - 712]
	mov rax, qword [rbp - 13088]
	cmp rcx, rax
	jl b225
	b226:
	mov rax, qword [rbp - 12744]
	jmp b227
	b225:
	mov rax, qword [rbp - 13088]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 712]
	mov r14, rax
	mov rax, qword [rbp - 12744]
	mov r15, rax
	b228:
	cmp r14, r13
	jl b229
	b230:
	mov rax, r15
	jmp b231
	b229:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b231:
	mov qword [rbp - 3912], rax
	mov rax, qword [rbp - 712]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12744]
	mov rbx, rax
	mov rax, qword [rbp - 13088]
	mov r13, rax
	b232:
	cmp rbx, r12
	jl b233
	b234:
	mov rax, r13
	jmp b235
	b233:
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
	b235:
	mov qword [rbp - 6240], rax
	mov rax, qword [rbp - 12744]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 13088]
	mov r15, rax
	mov rax, qword [rbp - 712]
	mov r12, rax
	b236:
	cmp r15, r13
	jl b237
	b238:
	mov rax, r12
	jmp b239
	b237:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
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
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b239:
	mov rcx, rax
	mov rax, qword [rbp - 3912]
	mov rbx, rax
	mov rax, qword [rbp - 6240]
	mov r15, rax
	mov r13, rcx
	b240:
	cmp r15, rbx
	jl b241
	b242:
	mov rax, r13
	jmp b243
	b241:
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
	b243:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b227:
	mov rcx, rax
	mov rax, qword [rbp - 8632]
	mov qword [rbp - 9336], rax
	mov rax, qword [rbp - 1464]
	mov qword [rbp - 11208], rax
	mov rax, rcx
	mov qword [rbp - 6248], rax
	b244:
	mov rax, qword [rbp - 11208]
	mov rcx, qword [rbp - 9336]
	cmp rax, rcx
	jl b245
	b246:
	mov rax, qword [rbp - 6248]
	jmp b247
	b245:
	mov rax, qword [rbp - 9336]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11208]
	mov r14, rax
	mov rax, qword [rbp - 6248]
	mov r12, rax
	b248:
	cmp r14, r15
	jl b249
	b250:
	mov rax, r12
	jmp b251
	b249:
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
	b251:
	mov qword [rbp - 2064], rax
	mov rax, qword [rbp - 11208]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6248]
	mov r12, rax
	mov rax, qword [rbp - 9336]
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b255:
	mov qword [rbp - 4576], rax
	mov rax, qword [rbp - 6248]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9336]
	mov rbx, rax
	mov rax, qword [rbp - 11208]
	mov r13, rax
	b256:
	cmp rbx, r12
	jl b257
	b258:
	mov rax, r13
	jmp b259
	b257:
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
	b259:
	mov rcx, rax
	mov rax, qword [rbp - 2064]
	mov r15, rax
	mov rax, qword [rbp - 4576]
	mov r12, rax
	mov r13, rcx
	b260:
	cmp r12, r15
	jl b261
	b262:
	mov rax, r13
	jmp b263
	b261:
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
	b263:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b247:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b183:
	mov rcx, rax
	mov rax, qword [rbp - 680]
	mov qword [rbp - 7704], rax
	mov rax, qword [rbp - 9984]
	mov qword [rbp - 5704], rax
	mov rax, rcx
	mov qword [rbp - 10928], rax
	b264:
	mov rcx, qword [rbp - 5704]
	mov rax, qword [rbp - 7704]
	cmp rcx, rax
	jl b265
	b266:
	mov rax, qword [rbp - 10928]
	jmp b267
	b265:
	mov rax, qword [rbp - 7704]
	sub rax, 1
	mov qword [rbp - 2744], rax
	mov rax, qword [rbp - 5704]
	mov qword [rbp - 9824], rax
	mov rax, qword [rbp - 10928]
	mov qword [rbp - 10104], rax
	b268:
	mov rcx, qword [rbp - 9824]
	mov rax, qword [rbp - 2744]
	cmp rcx, rax
	jl b269
	b270:
	mov rax, qword [rbp - 10104]
	jmp b271
	b269:
	mov rax, qword [rbp - 2744]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9824]
	mov r15, rax
	mov rax, qword [rbp - 10104]
	mov r12, rax
	b272:
	cmp r15, r14
	jl b273
	b274:
	mov rax, r12
	jmp b275
	b273:
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
	b275:
	mov qword [rbp - 12200], rax
	mov rax, qword [rbp - 9824]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10104]
	mov r15, rax
	mov rax, qword [rbp - 2744]
	mov r13, rax
	b276:
	cmp r15, rbx
	jl b277
	b278:
	mov rax, r13
	jmp b279
	b277:
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
	b279:
	mov qword [rbp - 4600], rax
	mov rax, qword [rbp - 10104]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2744]
	mov r12, rax
	mov rax, qword [rbp - 9824]
	mov rbx, rax
	b280:
	cmp r12, r13
	jl b281
	b282:
	mov rax, rbx
	jmp b283
	b281:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b283:
	mov rcx, rax
	mov rax, qword [rbp - 12200]
	mov r12, rax
	mov rax, qword [rbp - 4600]
	mov r13, rax
	mov r15, rcx
	b284:
	cmp r13, r12
	jl b285
	b286:
	mov rax, r15
	jmp b287
	b285:
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
	b287:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b271:
	mov qword [rbp - 2088], rax
	mov rax, qword [rbp - 5704]
	sub rax, 1
	mov qword [rbp - 2656], rax
	mov rax, qword [rbp - 10928]
	mov qword [rbp - 6520], rax
	mov rax, qword [rbp - 7704]
	mov qword [rbp - 5952], rax
	b288:
	mov rcx, qword [rbp - 6520]
	mov rax, qword [rbp - 2656]
	cmp rcx, rax
	jl b289
	b290:
	mov rax, qword [rbp - 5952]
	jmp b291
	b289:
	mov rax, qword [rbp - 2656]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 6520]
	mov r14, rax
	mov rax, qword [rbp - 5952]
	mov rbx, rax
	b292:
	cmp r14, r13
	jl b293
	b294:
	mov rax, rbx
	jmp b295
	b293:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b295:
	mov qword [rbp - 10704], rax
	mov rax, qword [rbp - 6520]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5952]
	mov r13, rax
	mov rax, qword [rbp - 2656]
	mov r15, rax
	b296:
	cmp r13, r12
	jl b297
	b298:
	mov rax, r15
	jmp b299
	b297:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
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
	b299:
	mov qword [rbp - 7520], rax
	mov rax, qword [rbp - 5952]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2656]
	mov r14, rax
	mov rax, qword [rbp - 6520]
	mov rbx, rax
	b300:
	cmp r14, r15
	jl b301
	b302:
	mov rax, rbx
	jmp b303
	b301:
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
	b303:
	mov rcx, rax
	mov rax, qword [rbp - 10704]
	mov r12, rax
	mov rax, qword [rbp - 7520]
	mov r15, rax
	mov r14, rcx
	b304:
	cmp r15, r12
	jl b305
	b306:
	mov rax, r14
	jmp b307
	b305:
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
	b307:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b291:
	mov qword [rbp - 3032], rax
	mov rax, qword [rbp - 10928]
	sub rax, 1
	mov qword [rbp - 3592], rax
	mov rax, qword [rbp - 7704]
	mov qword [rbp - 6512], rax
	mov rax, qword [rbp - 5704]
	mov qword [rbp - 6816], rax
	b308:
	mov rax, qword [rbp - 6512]
	mov rcx, qword [rbp - 3592]
	cmp rax, rcx
	jl b309
	b310:
	mov rax, qword [rbp - 6816]
	jmp b311
	b309:
	mov rax, qword [rbp - 3592]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6512]
	mov r12, rax
	mov rax, qword [rbp - 6816]
	mov r13, rax
	b312:
	cmp r12, r14
	jl b313
	b314:
	mov rax, r13
	jmp b315
	b313:
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
	b315:
	mov qword [rbp - 10256], rax
	mov rax, qword [rbp - 6512]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6816]
	mov rbx, rax
	mov rax, qword [rbp - 3592]
	mov r15, rax
	b316:
	cmp rbx, r14
	jl b317
	b318:
	mov rax, r15
	jmp b319
	b317:
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
	b319:
	mov qword [rbp - 1712], rax
	mov rax, qword [rbp - 6816]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3592]
	mov r14, rax
	mov rax, qword [rbp - 6512]
	mov rbx, rax
	b320:
	cmp r14, r15
	jl b321
	b322:
	mov rax, rbx
	jmp b323
	b321:
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
	b323:
	mov rcx, rax
	mov rax, qword [rbp - 10256]
	mov r14, rax
	mov rax, qword [rbp - 1712]
	mov r15, rax
	mov r12, rcx
	b324:
	cmp r15, r14
	jl b325
	b326:
	mov rax, r12
	jmp b327
	b325:
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
	b327:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b311:
	mov rcx, rax
	mov rax, qword [rbp - 2088]
	mov qword [rbp - 10944], rax
	mov rax, qword [rbp - 3032]
	mov qword [rbp - 4320], rax
	mov rax, rcx
	mov qword [rbp - 1720], rax
	b328:
	mov rax, qword [rbp - 4320]
	mov rcx, qword [rbp - 10944]
	cmp rax, rcx
	jl b329
	b330:
	mov rax, qword [rbp - 1720]
	jmp b331
	b329:
	mov rax, qword [rbp - 10944]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4320]
	mov r14, rax
	mov rax, qword [rbp - 1720]
	mov r15, rax
	b332:
	cmp r14, rbx
	jl b333
	b334:
	mov rax, r15
	jmp b335
	b333:
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
	b335:
	mov qword [rbp - 5008], rax
	mov rax, qword [rbp - 4320]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1720]
	mov r14, rax
	mov rax, qword [rbp - 10944]
	mov r13, rax
	b336:
	cmp r14, r12
	jl b337
	b338:
	mov rax, r13
	jmp b339
	b337:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b339:
	mov qword [rbp - 9992], rax
	mov rax, qword [rbp - 1720]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10944]
	mov r12, rax
	mov rax, qword [rbp - 4320]
	mov r15, rax
	b340:
	cmp r12, r14
	jl b341
	b342:
	mov rax, r15
	jmp b343
	b341:
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
	b343:
	mov rcx, rax
	mov rax, qword [rbp - 5008]
	mov rbx, rax
	mov rax, qword [rbp - 9992]
	mov r15, rax
	mov r13, rcx
	b344:
	cmp r15, rbx
	jl b345
	b346:
	mov rax, r13
	jmp b347
	b345:
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
	b347:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b331:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b267:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b11:
	mov qword [rbp - 7280], rax
	mov rax, qword [rbp - 9648]
	sub rax, 1
	mov qword [rbp - 6056], rax
	mov rax, qword [rbp - 10304]
	mov qword [rbp - 9496], rax
	mov rax, qword [rbp - 4472]
	mov qword [rbp - 11872], rax
	b348:
	mov rcx, qword [rbp - 9496]
	mov rax, qword [rbp - 6056]
	cmp rcx, rax
	jl b349
	b350:
	mov rax, qword [rbp - 11872]
	jmp b351
	b349:
	mov rax, qword [rbp - 6056]
	sub rax, 1
	mov qword [rbp - 1392], rax
	mov rax, qword [rbp - 9496]
	mov qword [rbp - 11120], rax
	mov rax, qword [rbp - 11872]
	mov qword [rbp - 8792], rax
	b352:
	mov rax, qword [rbp - 11120]
	mov rcx, qword [rbp - 1392]
	cmp rax, rcx
	jl b353
	b354:
	mov rax, qword [rbp - 8792]
	jmp b355
	b353:
	mov rax, qword [rbp - 1392]
	sub rax, 1
	mov qword [rbp - 8152], rax
	mov rax, qword [rbp - 11120]
	mov qword [rbp - 5760], rax
	mov rax, qword [rbp - 8792]
	mov qword [rbp - 6256], rax
	b356:
	mov rcx, qword [rbp - 5760]
	mov rax, qword [rbp - 8152]
	cmp rcx, rax
	jl b357
	b358:
	mov rax, qword [rbp - 6256]
	jmp b359
	b357:
	mov rax, qword [rbp - 8152]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5760]
	mov rbx, rax
	mov rax, qword [rbp - 6256]
	mov r13, rax
	b360:
	cmp rbx, r14
	jl b361
	b362:
	mov rax, r13
	jmp b363
	b361:
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
	b363:
	mov qword [rbp - 9256], rax
	mov rax, qword [rbp - 5760]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6256]
	mov rbx, rax
	mov rax, qword [rbp - 8152]
	mov r12, rax
	b364:
	cmp rbx, r15
	jl b365
	b366:
	mov rax, r12
	jmp b367
	b365:
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
	b367:
	mov qword [rbp - 13224], rax
	mov rax, qword [rbp - 6256]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8152]
	mov r15, rax
	mov rax, qword [rbp - 5760]
	mov r13, rax
	b368:
	cmp r15, r14
	jl b369
	b370:
	mov rax, r13
	jmp b371
	b369:
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
	b371:
	mov rcx, rax
	mov rax, qword [rbp - 9256]
	mov r12, rax
	mov rax, qword [rbp - 13224]
	mov rbx, rax
	mov r13, rcx
	b372:
	cmp rbx, r12
	jl b373
	b374:
	mov rax, r13
	jmp b375
	b373:
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
	b375:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b359:
	mov qword [rbp - 1384], rax
	mov rax, qword [rbp - 11120]
	sub rax, 1
	mov qword [rbp - 6736], rax
	mov rax, qword [rbp - 8792]
	mov qword [rbp - 1584], rax
	mov rax, qword [rbp - 1392]
	mov qword [rbp - 13072], rax
	b376:
	mov rcx, qword [rbp - 1584]
	mov rax, qword [rbp - 6736]
	cmp rcx, rax
	jl b377
	b378:
	mov rax, qword [rbp - 13072]
	jmp b379
	b377:
	mov rax, qword [rbp - 6736]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1584]
	mov rbx, rax
	mov rax, qword [rbp - 13072]
	mov r15, rax
	b380:
	cmp rbx, r14
	jl b381
	b382:
	mov rax, r15
	jmp b383
	b381:
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
	b383:
	mov qword [rbp - 3040], rax
	mov rax, qword [rbp - 1584]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13072]
	mov rbx, rax
	mov rax, qword [rbp - 6736]
	mov r14, rax
	b384:
	cmp rbx, r15
	jl b385
	b386:
	mov rax, r14
	jmp b387
	b385:
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
	b387:
	mov qword [rbp - 4680], rax
	mov rax, qword [rbp - 13072]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6736]
	mov r12, rax
	mov rax, qword [rbp - 1584]
	mov r13, rax
	b388:
	cmp r12, r15
	jl b389
	b390:
	mov rax, r13
	jmp b391
	b389:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b391:
	mov rcx, rax
	mov rax, qword [rbp - 3040]
	mov rbx, rax
	mov rax, qword [rbp - 4680]
	mov r14, rax
	mov r12, rcx
	b392:
	cmp r14, rbx
	jl b393
	b394:
	mov rax, r12
	jmp b395
	b393:
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
	b395:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b379:
	mov qword [rbp - 12928], rax
	mov rax, qword [rbp - 8792]
	sub rax, 1
	mov qword [rbp - 6152], rax
	mov rax, qword [rbp - 1392]
	mov qword [rbp - 10288], rax
	mov rax, qword [rbp - 11120]
	mov qword [rbp - 2152], rax
	b396:
	mov rax, qword [rbp - 10288]
	mov rcx, qword [rbp - 6152]
	cmp rax, rcx
	jl b397
	b398:
	mov rax, qword [rbp - 2152]
	jmp b399
	b397:
	mov rax, qword [rbp - 6152]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10288]
	mov rbx, rax
	mov rax, qword [rbp - 2152]
	mov r13, rax
	b400:
	cmp rbx, r12
	jl b401
	b402:
	mov rax, r13
	jmp b403
	b401:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b403:
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 10288]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2152]
	mov r15, rax
	mov rax, qword [rbp - 6152]
	mov rbx, rax
	b404:
	cmp r15, r12
	jl b405
	b406:
	mov rax, rbx
	jmp b407
	b405:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b407:
	mov qword [rbp - 9424], rax
	mov rax, qword [rbp - 2152]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6152]
	mov r12, rax
	mov rax, qword [rbp - 10288]
	mov rbx, rax
	b408:
	cmp r12, r15
	jl b409
	b410:
	mov rax, rbx
	jmp b411
	b409:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b411:
	mov rcx, rax
	mov rax, qword [rbp - 184]
	mov r12, rax
	mov rax, qword [rbp - 9424]
	mov r13, rax
	mov r15, rcx
	b412:
	cmp r13, r12
	jl b413
	b414:
	mov rax, r15
	jmp b415
	b413:
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
	b415:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b399:
	mov rcx, rax
	mov rax, qword [rbp - 1384]
	mov qword [rbp - 2160], rax
	mov rax, qword [rbp - 12928]
	mov qword [rbp - 8640], rax
	mov rax, rcx
	mov qword [rbp - 8840], rax
	b416:
	mov rcx, qword [rbp - 8640]
	mov rax, qword [rbp - 2160]
	cmp rcx, rax
	jl b417
	b418:
	mov rax, qword [rbp - 8840]
	jmp b419
	b417:
	mov rax, qword [rbp - 2160]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8640]
	mov rbx, rax
	mov rax, qword [rbp - 8840]
	mov r15, rax
	b420:
	cmp rbx, r14
	jl b421
	b422:
	mov rax, r15
	jmp b423
	b421:
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
	b423:
	mov qword [rbp - 11256], rax
	mov rax, qword [rbp - 8640]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8840]
	mov r15, rax
	mov rax, qword [rbp - 2160]
	mov r14, rax
	b424:
	cmp r15, rbx
	jl b425
	b426:
	mov rax, r14
	jmp b427
	b425:
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
	b427:
	mov qword [rbp - 6848], rax
	mov rax, qword [rbp - 8840]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2160]
	mov rbx, rax
	mov rax, qword [rbp - 8640]
	mov r15, rax
	b428:
	cmp rbx, r14
	jl b429
	b430:
	mov rax, r15
	jmp b431
	b429:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b431:
	mov rcx, rax
	mov rax, qword [rbp - 11256]
	mov r14, rax
	mov rax, qword [rbp - 6848]
	mov rbx, rax
	mov r13, rcx
	b432:
	cmp rbx, r14
	jl b433
	b434:
	mov rax, r13
	jmp b435
	b433:
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
	b435:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b419:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b355:
	mov qword [rbp - 8184], rax
	mov rax, qword [rbp - 9496]
	sub rax, 1
	mov qword [rbp - 1560], rax
	mov rax, qword [rbp - 11872]
	mov qword [rbp - 12272], rax
	mov rax, qword [rbp - 6056]
	mov qword [rbp - 2880], rax
	b436:
	mov rax, qword [rbp - 12272]
	mov rcx, qword [rbp - 1560]
	cmp rax, rcx
	jl b437
	b438:
	mov rax, qword [rbp - 2880]
	jmp b439
	b437:
	mov rax, qword [rbp - 1560]
	sub rax, 1
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 12272]
	mov qword [rbp - 6648], rax
	mov rax, qword [rbp - 2880]
	mov qword [rbp - 10584], rax
	b440:
	mov rcx, qword [rbp - 6648]
	mov rax, qword [rbp - 56]
	cmp rcx, rax
	jl b441
	b442:
	mov rax, qword [rbp - 10584]
	jmp b443
	b441:
	mov rax, qword [rbp - 56]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6648]
	mov rbx, rax
	mov rax, qword [rbp - 10584]
	mov r13, rax
	b444:
	cmp rbx, r14
	jl b445
	b446:
	mov rax, r13
	jmp b447
	b445:
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
	b447:
	mov qword [rbp - 2280], rax
	mov rax, qword [rbp - 6648]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10584]
	mov r15, rax
	mov rax, qword [rbp - 56]
	mov rbx, rax
	b448:
	cmp r15, r14
	jl b449
	b450:
	mov rax, rbx
	jmp b451
	b449:
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
	b451:
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 10584]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 56]
	mov rbx, rax
	mov rax, qword [rbp - 6648]
	mov r12, rax
	b452:
	cmp rbx, r15
	jl b453
	b454:
	mov rax, r12
	jmp b455
	b453:
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
	b455:
	mov rcx, qword [rbp - 2280]
	mov rbx, rcx
	mov rcx, qword [rbp - 288]
	mov r15, rcx
	mov r14, rax
	b456:
	cmp r15, rbx
	jl b457
	b458:
	mov rax, r14
	jmp b459
	b457:
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
	b459:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b443:
	mov qword [rbp - 6776], rax
	mov rax, qword [rbp - 12272]
	sub rax, 1
	mov qword [rbp - 6896], rax
	mov rax, qword [rbp - 2880]
	mov qword [rbp - 8176], rax
	mov rax, qword [rbp - 1560]
	mov qword [rbp - 8304], rax
	b460:
	mov rax, qword [rbp - 8176]
	mov rcx, qword [rbp - 6896]
	cmp rax, rcx
	jl b461
	b462:
	mov rax, qword [rbp - 8304]
	jmp b463
	b461:
	mov rax, qword [rbp - 6896]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8176]
	mov r12, rax
	mov rax, qword [rbp - 8304]
	mov r15, rax
	b464:
	cmp r12, rbx
	jl b465
	b466:
	mov rax, r15
	jmp b467
	b465:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b467:
	mov qword [rbp - 7656], rax
	mov rax, qword [rbp - 8176]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8304]
	mov r12, rax
	mov rax, qword [rbp - 6896]
	mov r15, rax
	b468:
	cmp r12, r14
	jl b469
	b470:
	mov rax, r15
	jmp b471
	b469:
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
	b471:
	mov qword [rbp - 13496], rax
	mov rax, qword [rbp - 8304]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6896]
	mov r14, rax
	mov rax, qword [rbp - 8176]
	mov rbx, rax
	b472:
	cmp r14, r15
	jl b473
	b474:
	mov rax, rbx
	jmp b475
	b473:
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
	b475:
	mov rcx, qword [rbp - 7656]
	mov r12, rcx
	mov rcx, qword [rbp - 13496]
	mov r15, rcx
	mov r13, rax
	b476:
	cmp r15, r12
	jl b477
	b478:
	mov rax, r13
	jmp b479
	b477:
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
	b479:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b463:
	mov qword [rbp - 10888], rax
	mov rax, qword [rbp - 2880]
	sub rax, 1
	mov qword [rbp - 12848], rax
	mov rax, qword [rbp - 1560]
	mov qword [rbp - 1504], rax
	mov rax, qword [rbp - 12272]
	mov qword [rbp - 10624], rax
	b480:
	mov rcx, qword [rbp - 1504]
	mov rax, qword [rbp - 12848]
	cmp rcx, rax
	jl b481
	b482:
	mov rax, qword [rbp - 10624]
	jmp b483
	b481:
	mov rax, qword [rbp - 12848]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1504]
	mov r14, rax
	mov rax, qword [rbp - 10624]
	mov r12, rax
	b484:
	cmp r14, rbx
	jl b485
	b486:
	mov rax, r12
	jmp b487
	b485:
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
	b487:
	mov qword [rbp - 4424], rax
	mov rax, qword [rbp - 1504]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10624]
	mov r15, rax
	mov rax, qword [rbp - 12848]
	mov rbx, rax
	b488:
	cmp r15, r12
	jl b489
	b490:
	mov rax, rbx
	jmp b491
	b489:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b491:
	mov qword [rbp - 4880], rax
	mov rax, qword [rbp - 10624]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12848]
	mov r12, rax
	mov rax, qword [rbp - 1504]
	mov rbx, rax
	b492:
	cmp r12, r14
	jl b493
	b494:
	mov rax, rbx
	jmp b495
	b493:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b495:
	mov rcx, rax
	mov rax, qword [rbp - 4424]
	mov r14, rax
	mov rax, qword [rbp - 4880]
	mov r12, rax
	mov rbx, rcx
	b496:
	cmp r12, r14
	jl b497
	b498:
	mov rax, rbx
	jmp b499
	b497:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b499:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b483:
	mov rcx, qword [rbp - 6776]
	mov qword [rbp - 4968], rcx
	mov rcx, qword [rbp - 10888]
	mov qword [rbp - 12480], rcx
	mov qword [rbp - 2688], rax
	b500:
	mov rax, qword [rbp - 12480]
	mov rcx, qword [rbp - 4968]
	cmp rax, rcx
	jl b501
	b502:
	mov rax, qword [rbp - 2688]
	jmp b503
	b501:
	mov rax, qword [rbp - 4968]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12480]
	mov r12, rax
	mov rax, qword [rbp - 2688]
	mov r15, rax
	b504:
	cmp r12, rbx
	jl b505
	b506:
	mov rax, r15
	jmp b507
	b505:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b507:
	mov qword [rbp - 13032], rax
	mov rax, qword [rbp - 12480]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2688]
	mov r15, rax
	mov rax, qword [rbp - 4968]
	mov r12, rax
	b508:
	cmp r15, r14
	jl b509
	b510:
	mov rax, r12
	jmp b511
	b509:
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
	b511:
	mov qword [rbp - 13360], rax
	mov rax, qword [rbp - 2688]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4968]
	mov r15, rax
	mov rax, qword [rbp - 12480]
	mov r14, rax
	b512:
	cmp r15, r12
	jl b513
	b514:
	mov rax, r14
	jmp b515
	b513:
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
	b515:
	mov rcx, rax
	mov rax, qword [rbp - 13032]
	mov r15, rax
	mov rax, qword [rbp - 13360]
	mov r14, rax
	mov rbx, rcx
	b516:
	cmp r14, r15
	jl b517
	b518:
	mov rax, rbx
	jmp b519
	b517:
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
	b519:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b503:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b439:
	mov qword [rbp - 5208], rax
	mov rax, qword [rbp - 11872]
	sub rax, 1
	mov qword [rbp - 1816], rax
	mov rax, qword [rbp - 6056]
	mov qword [rbp - 6384], rax
	mov rax, qword [rbp - 9496]
	mov qword [rbp - 12640], rax
	b520:
	mov rax, qword [rbp - 6384]
	mov rcx, qword [rbp - 1816]
	cmp rax, rcx
	jl b521
	b522:
	mov rax, qword [rbp - 12640]
	jmp b523
	b521:
	mov rax, qword [rbp - 1816]
	sub rax, 1
	mov qword [rbp - 9488], rax
	mov rax, qword [rbp - 6384]
	mov qword [rbp - 1272], rax
	mov rax, qword [rbp - 12640]
	mov qword [rbp - 9328], rax
	b524:
	mov rax, qword [rbp - 1272]
	mov rcx, qword [rbp - 9488]
	cmp rax, rcx
	jl b525
	b526:
	mov rax, qword [rbp - 9328]
	jmp b527
	b525:
	mov rax, qword [rbp - 9488]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1272]
	mov r15, rax
	mov rax, qword [rbp - 9328]
	mov r13, rax
	b528:
	cmp r15, r14
	jl b529
	b530:
	mov rax, r13
	jmp b531
	b529:
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
	b531:
	mov qword [rbp - 12832], rax
	mov rax, qword [rbp - 1272]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9328]
	mov r14, rax
	mov rax, qword [rbp - 9488]
	mov r15, rax
	b532:
	cmp r14, rbx
	jl b533
	b534:
	mov rax, r15
	jmp b535
	b533:
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
	b535:
	mov qword [rbp - 7824], rax
	mov rax, qword [rbp - 9328]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9488]
	mov r15, rax
	mov rax, qword [rbp - 1272]
	mov r12, rax
	b536:
	cmp r15, r14
	jl b537
	b538:
	mov rax, r12
	jmp b539
	b537:
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
	b539:
	mov rcx, rax
	mov rax, qword [rbp - 12832]
	mov r14, rax
	mov rax, qword [rbp - 7824]
	mov r12, rax
	mov rbx, rcx
	b540:
	cmp r12, r14
	jl b541
	b542:
	mov rax, rbx
	jmp b543
	b541:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b543:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b527:
	mov qword [rbp - 8784], rax
	mov rax, qword [rbp - 6384]
	sub rax, 1
	mov qword [rbp - 9952], rax
	mov rax, qword [rbp - 12640]
	mov qword [rbp - 3968], rax
	mov rax, qword [rbp - 1816]
	mov qword [rbp - 7768], rax
	b544:
	mov rcx, qword [rbp - 3968]
	mov rax, qword [rbp - 9952]
	cmp rcx, rax
	jl b545
	b546:
	mov rax, qword [rbp - 7768]
	jmp b547
	b545:
	mov rax, qword [rbp - 9952]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3968]
	mov r12, rax
	mov rax, qword [rbp - 7768]
	mov rbx, rax
	b548:
	cmp r12, r15
	jl b549
	b550:
	mov rax, rbx
	jmp b551
	b549:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b551:
	mov qword [rbp - 1528], rax
	mov rax, qword [rbp - 3968]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7768]
	mov r15, rax
	mov rax, qword [rbp - 9952]
	mov r13, rax
	b552:
	cmp r15, rbx
	jl b553
	b554:
	mov rax, r13
	jmp b555
	b553:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b555:
	mov qword [rbp - 688], rax
	mov rax, qword [rbp - 7768]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9952]
	mov r12, rax
	mov rax, qword [rbp - 3968]
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b559:
	mov rcx, rax
	mov rax, qword [rbp - 1528]
	mov r12, rax
	mov rax, qword [rbp - 688]
	mov r15, rax
	mov r13, rcx
	b560:
	cmp r15, r12
	jl b561
	b562:
	mov rax, r13
	jmp b563
	b561:
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
	b563:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b547:
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 12640]
	sub rax, 1
	mov qword [rbp - 7896], rax
	mov rax, qword [rbp - 1816]
	mov qword [rbp - 8960], rax
	mov rax, qword [rbp - 6384]
	mov qword [rbp - 10616], rax
	b564:
	mov rcx, qword [rbp - 8960]
	mov rax, qword [rbp - 7896]
	cmp rcx, rax
	jl b565
	b566:
	mov rax, qword [rbp - 10616]
	jmp b567
	b565:
	mov rax, qword [rbp - 7896]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8960]
	mov r15, rax
	mov rax, qword [rbp - 10616]
	mov r12, rax
	b568:
	cmp r15, rbx
	jl b569
	b570:
	mov rax, r12
	jmp b571
	b569:
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
	b571:
	mov qword [rbp - 12696], rax
	mov rax, qword [rbp - 8960]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 10616]
	mov r15, rax
	mov rax, qword [rbp - 7896]
	mov rbx, rax
	b572:
	cmp r15, r13
	jl b573
	b574:
	mov rax, rbx
	jmp b575
	b573:
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
	b575:
	mov qword [rbp - 9224], rax
	mov rax, qword [rbp - 10616]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7896]
	mov r15, rax
	mov rax, qword [rbp - 8960]
	mov r13, rax
	b576:
	cmp r15, r14
	jl b577
	b578:
	mov rax, r13
	jmp b579
	b577:
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
	b579:
	mov rcx, rax
	mov rax, qword [rbp - 12696]
	mov r12, rax
	mov rax, qword [rbp - 9224]
	mov rbx, rax
	mov r14, rcx
	b580:
	cmp rbx, r12
	jl b581
	b582:
	mov rax, r14
	jmp b583
	b581:
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
	b583:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b567:
	mov rcx, rax
	mov rax, qword [rbp - 8784]
	mov qword [rbp - 12624], rax
	mov rax, qword [rbp - 144]
	mov qword [rbp - 3896], rax
	mov rax, rcx
	mov qword [rbp - 11192], rax
	b584:
	mov rcx, qword [rbp - 3896]
	mov rax, qword [rbp - 12624]
	cmp rcx, rax
	jl b585
	b586:
	mov rax, qword [rbp - 11192]
	jmp b587
	b585:
	mov rax, qword [rbp - 12624]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3896]
	mov r14, rax
	mov rax, qword [rbp - 11192]
	mov r13, rax
	b588:
	cmp r14, rbx
	jl b589
	b590:
	mov rax, r13
	jmp b591
	b589:
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
	b591:
	mov qword [rbp - 12128], rax
	mov rax, qword [rbp - 3896]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11192]
	mov r14, rax
	mov rax, qword [rbp - 12624]
	mov rbx, rax
	b592:
	cmp r14, r15
	jl b593
	b594:
	mov rax, rbx
	jmp b595
	b593:
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
	b595:
	mov qword [rbp - 7752], rax
	mov rax, qword [rbp - 11192]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12624]
	mov r14, rax
	mov rax, qword [rbp - 3896]
	mov r13, rax
	b596:
	cmp r14, r15
	jl b597
	b598:
	mov rax, r13
	jmp b599
	b597:
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
	b599:
	mov rcx, rax
	mov rax, qword [rbp - 12128]
	mov r14, rax
	mov rax, qword [rbp - 7752]
	mov rbx, rax
	mov r13, rcx
	b600:
	cmp rbx, r14
	jl b601
	b602:
	mov rax, r13
	jmp b603
	b601:
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
	b603:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b587:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b523:
	mov rcx, rax
	mov rax, qword [rbp - 8184]
	mov qword [rbp - 3864], rax
	mov rax, qword [rbp - 5208]
	mov qword [rbp - 12600], rax
	mov rax, rcx
	mov qword [rbp - 5288], rax
	b604:
	mov rax, qword [rbp - 12600]
	mov rcx, qword [rbp - 3864]
	cmp rax, rcx
	jl b605
	b606:
	mov rax, qword [rbp - 5288]
	jmp b607
	b605:
	mov rax, qword [rbp - 3864]
	sub rax, 1
	mov qword [rbp - 2480], rax
	mov rax, qword [rbp - 12600]
	mov qword [rbp - 10112], rax
	mov rax, qword [rbp - 5288]
	mov qword [rbp - 9904], rax
	b608:
	mov rax, qword [rbp - 10112]
	mov rcx, qword [rbp - 2480]
	cmp rax, rcx
	jl b609
	b610:
	mov rax, qword [rbp - 9904]
	jmp b611
	b609:
	mov rax, qword [rbp - 2480]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10112]
	mov rbx, rax
	mov rax, qword [rbp - 9904]
	mov r13, rax
	b612:
	cmp rbx, r12
	jl b613
	b614:
	mov rax, r13
	jmp b615
	b613:
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
	b615:
	mov qword [rbp - 3680], rax
	mov rax, qword [rbp - 10112]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9904]
	mov r15, rax
	mov rax, qword [rbp - 2480]
	mov rbx, rax
	b616:
	cmp r15, r12
	jl b617
	b618:
	mov rax, rbx
	jmp b619
	b617:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b619:
	mov qword [rbp - 2920], rax
	mov rax, qword [rbp - 9904]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2480]
	mov rbx, rax
	mov rax, qword [rbp - 10112]
	mov r13, rax
	b620:
	cmp rbx, r12
	jl b621
	b622:
	mov rax, r13
	jmp b623
	b621:
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
	b623:
	mov rcx, qword [rbp - 3680]
	mov rbx, rcx
	mov rcx, qword [rbp - 2920]
	mov r15, rcx
	mov r14, rax
	b624:
	cmp r15, rbx
	jl b625
	b626:
	mov rax, r14
	jmp b627
	b625:
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
	b627:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b611:
	mov qword [rbp - 11912], rax
	mov rax, qword [rbp - 12600]
	sub rax, 1
	mov qword [rbp - 6096], rax
	mov rax, qword [rbp - 5288]
	mov qword [rbp - 4536], rax
	mov rax, qword [rbp - 3864]
	mov qword [rbp - 4544], rax
	b628:
	mov rcx, qword [rbp - 4536]
	mov rax, qword [rbp - 6096]
	cmp rcx, rax
	jl b629
	b630:
	mov rax, qword [rbp - 4544]
	jmp b631
	b629:
	mov rax, qword [rbp - 6096]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4536]
	mov r13, rax
	mov rax, qword [rbp - 4544]
	mov rbx, rax
	b632:
	cmp r13, r14
	jl b633
	b634:
	mov rax, rbx
	jmp b635
	b633:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b635:
	mov qword [rbp - 11840], rax
	mov rax, qword [rbp - 4536]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4544]
	mov rbx, rax
	mov rax, qword [rbp - 6096]
	mov r13, rax
	b636:
	cmp rbx, r15
	jl b637
	b638:
	mov rax, r13
	jmp b639
	b637:
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
	b639:
	mov qword [rbp - 10312], rax
	mov rax, qword [rbp - 4544]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6096]
	mov r15, rax
	mov rax, qword [rbp - 4536]
	mov r13, rax
	b640:
	cmp r15, r14
	jl b641
	b642:
	mov rax, r13
	jmp b643
	b641:
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
	b643:
	mov rcx, rax
	mov rax, qword [rbp - 11840]
	mov r14, rax
	mov rax, qword [rbp - 10312]
	mov r12, rax
	mov r13, rcx
	b644:
	cmp r12, r14
	jl b645
	b646:
	mov rax, r13
	jmp b647
	b645:
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
	b647:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b631:
	mov qword [rbp - 13144], rax
	mov rax, qword [rbp - 5288]
	sub rax, 1
	mov qword [rbp - 4960], rax
	mov rax, qword [rbp - 3864]
	mov qword [rbp - 10792], rax
	mov rax, qword [rbp - 12600]
	mov qword [rbp - 11152], rax
	b648:
	mov rcx, qword [rbp - 10792]
	mov rax, qword [rbp - 4960]
	cmp rcx, rax
	jl b649
	b650:
	mov rax, qword [rbp - 11152]
	jmp b651
	b649:
	mov rax, qword [rbp - 4960]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10792]
	mov r14, rax
	mov rax, qword [rbp - 11152]
	mov r15, rax
	b652:
	cmp r14, r12
	jl b653
	b654:
	mov rax, r15
	jmp b655
	b653:
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
	b655:
	mov qword [rbp - 10968], rax
	mov rax, qword [rbp - 10792]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11152]
	mov r13, rax
	mov rax, qword [rbp - 4960]
	mov r14, rax
	b656:
	cmp r13, r15
	jl b657
	b658:
	mov rax, r14
	jmp b659
	b657:
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
	b659:
	mov qword [rbp - 11112], rax
	mov rax, qword [rbp - 11152]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4960]
	mov r15, rax
	mov rax, qword [rbp - 10792]
	mov r13, rax
	b660:
	cmp r15, r12
	jl b661
	b662:
	mov rax, r13
	jmp b663
	b661:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b663:
	mov rcx, rax
	mov rax, qword [rbp - 10968]
	mov r14, rax
	mov rax, qword [rbp - 11112]
	mov r15, rax
	mov r13, rcx
	b664:
	cmp r15, r14
	jl b665
	b666:
	mov rax, r13
	jmp b667
	b665:
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
	b667:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b651:
	mov rcx, rax
	mov rax, qword [rbp - 11912]
	mov qword [rbp - 12704], rax
	mov rax, qword [rbp - 13144]
	mov qword [rbp - 240], rax
	mov rax, rcx
	mov qword [rbp - 1952], rax
	b668:
	mov rcx, qword [rbp - 240]
	mov rax, qword [rbp - 12704]
	cmp rcx, rax
	jl b669
	b670:
	mov rax, qword [rbp - 1952]
	jmp b671
	b669:
	mov rax, qword [rbp - 12704]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 240]
	mov r14, rax
	mov rax, qword [rbp - 1952]
	mov rbx, rax
	b672:
	cmp r14, r15
	jl b673
	b674:
	mov rax, rbx
	jmp b675
	b673:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b675:
	mov qword [rbp - 6536], rax
	mov rax, qword [rbp - 240]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1952]
	mov r12, rax
	mov rax, qword [rbp - 12704]
	mov rbx, rax
	b676:
	cmp r12, r15
	jl b677
	b678:
	mov rax, rbx
	jmp b679
	b677:
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
	b679:
	mov qword [rbp - 8384], rax
	mov rax, qword [rbp - 1952]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12704]
	mov r14, rax
	mov rax, qword [rbp - 240]
	mov r12, rax
	b680:
	cmp r14, rbx
	jl b681
	b682:
	mov rax, r12
	jmp b683
	b681:
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
	b683:
	mov rcx, qword [rbp - 6536]
	mov r14, rcx
	mov rcx, qword [rbp - 8384]
	mov r12, rcx
	mov r13, rax
	b684:
	cmp r12, r14
	jl b685
	b686:
	mov rax, r13
	jmp b687
	b685:
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
	b687:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b671:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b607:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b351:
	mov qword [rbp - 11712], rax
	mov rax, qword [rbp - 10304]
	sub rax, 1
	mov qword [rbp - 1352], rax
	mov rax, qword [rbp - 4472]
	mov qword [rbp - 3624], rax
	mov rax, qword [rbp - 9648]
	mov qword [rbp - 7088], rax
	b688:
	mov rcx, qword [rbp - 3624]
	mov rax, qword [rbp - 1352]
	cmp rcx, rax
	jl b689
	b690:
	mov rax, qword [rbp - 7088]
	jmp b691
	b689:
	mov rax, qword [rbp - 1352]
	sub rax, 1
	mov qword [rbp - 1104], rax
	mov rax, qword [rbp - 3624]
	mov qword [rbp - 3320], rax
	mov rax, qword [rbp - 7088]
	mov qword [rbp - 1920], rax
	b692:
	mov rax, qword [rbp - 3320]
	mov rcx, qword [rbp - 1104]
	cmp rax, rcx
	jl b693
	b694:
	mov rax, qword [rbp - 1920]
	jmp b695
	b693:
	mov rax, qword [rbp - 1104]
	sub rax, 1
	mov qword [rbp - 5216], rax
	mov rax, qword [rbp - 3320]
	mov qword [rbp - 9584], rax
	mov rax, qword [rbp - 1920]
	mov qword [rbp - 9832], rax
	b696:
	mov rcx, qword [rbp - 9584]
	mov rax, qword [rbp - 5216]
	cmp rcx, rax
	jl b697
	b698:
	mov rax, qword [rbp - 9832]
	jmp b699
	b697:
	mov rax, qword [rbp - 5216]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9584]
	mov r12, rax
	mov rax, qword [rbp - 9832]
	mov r15, rax
	b700:
	cmp r12, rbx
	jl b701
	b702:
	mov rax, r15
	jmp b703
	b701:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b703:
	mov qword [rbp - 4048], rax
	mov rax, qword [rbp - 9584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9832]
	mov rbx, rax
	mov rax, qword [rbp - 5216]
	mov r15, rax
	b704:
	cmp rbx, r14
	jl b705
	b706:
	mov rax, r15
	jmp b707
	b705:
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
	b707:
	mov qword [rbp - 5464], rax
	mov rax, qword [rbp - 9832]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5216]
	mov r14, rax
	mov rax, qword [rbp - 9584]
	mov rbx, rax
	b708:
	cmp r14, r15
	jl b709
	b710:
	mov rax, rbx
	jmp b711
	b709:
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
	b711:
	mov rcx, rax
	mov rax, qword [rbp - 4048]
	mov r14, rax
	mov rax, qword [rbp - 5464]
	mov r12, rax
	mov r15, rcx
	b712:
	cmp r12, r14
	jl b713
	b714:
	mov rax, r15
	jmp b715
	b713:
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
	b715:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b699:
	mov qword [rbp - 13112], rax
	mov rax, qword [rbp - 3320]
	sub rax, 1
	mov qword [rbp - 4784], rax
	mov rax, qword [rbp - 1920]
	mov qword [rbp - 864], rax
	mov rax, qword [rbp - 1104]
	mov qword [rbp - 384], rax
	b716:
	mov rax, qword [rbp - 864]
	mov rcx, qword [rbp - 4784]
	cmp rax, rcx
	jl b717
	b718:
	mov rax, qword [rbp - 384]
	jmp b719
	b717:
	mov rax, qword [rbp - 4784]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 864]
	mov rbx, rax
	mov rax, qword [rbp - 384]
	mov r12, rax
	b720:
	cmp rbx, r14
	jl b721
	b722:
	mov rax, r12
	jmp b723
	b721:
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
	b723:
	mov qword [rbp - 10048], rax
	mov rax, qword [rbp - 864]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 384]
	mov r13, rax
	mov rax, qword [rbp - 4784]
	mov r14, rax
	b724:
	cmp r13, r12
	jl b725
	b726:
	mov rax, r14
	jmp b727
	b725:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b727:
	mov qword [rbp - 11016], rax
	mov rax, qword [rbp - 384]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4784]
	mov r14, rax
	mov rax, qword [rbp - 864]
	mov rbx, rax
	b728:
	cmp r14, r15
	jl b729
	b730:
	mov rax, rbx
	jmp b731
	b729:
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
	b731:
	mov rcx, rax
	mov rax, qword [rbp - 10048]
	mov r14, rax
	mov rax, qword [rbp - 11016]
	mov rbx, rax
	mov r12, rcx
	b732:
	cmp rbx, r14
	jl b733
	b734:
	mov rax, r12
	jmp b735
	b733:
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
	b735:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b719:
	mov qword [rbp - 2664], rax
	mov rax, qword [rbp - 1920]
	sub rax, 1
	mov qword [rbp - 232], rax
	mov rax, qword [rbp - 1104]
	mov qword [rbp - 4656], rax
	mov rax, qword [rbp - 3320]
	mov qword [rbp - 1112], rax
	b736:
	mov rax, qword [rbp - 4656]
	mov rcx, qword [rbp - 232]
	cmp rax, rcx
	jl b737
	b738:
	mov rax, qword [rbp - 1112]
	jmp b739
	b737:
	mov rax, qword [rbp - 232]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4656]
	mov r12, rax
	mov rax, qword [rbp - 1112]
	mov r13, rax
	b740:
	cmp r12, r15
	jl b741
	b742:
	mov rax, r13
	jmp b743
	b741:
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
	b743:
	mov qword [rbp - 3840], rax
	mov rax, qword [rbp - 4656]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1112]
	mov r14, rax
	mov rax, qword [rbp - 232]
	mov rbx, rax
	b744:
	cmp r14, r12
	jl b745
	b746:
	mov rax, rbx
	jmp b747
	b745:
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
	b747:
	mov qword [rbp - 2696], rax
	mov rax, qword [rbp - 1112]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 232]
	mov r14, rax
	mov rax, qword [rbp - 4656]
	mov r13, rax
	b748:
	cmp r14, r12
	jl b749
	b750:
	mov rax, r13
	jmp b751
	b749:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b751:
	mov rcx, qword [rbp - 3840]
	mov r12, rcx
	mov rcx, qword [rbp - 2696]
	mov r15, rcx
	mov r13, rax
	b752:
	cmp r15, r12
	jl b753
	b754:
	mov rax, r13
	jmp b755
	b753:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b755:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b739:
	mov rcx, qword [rbp - 13112]
	mov qword [rbp - 6544], rcx
	mov rcx, qword [rbp - 2664]
	mov qword [rbp - 3696], rcx
	mov qword [rbp - 12896], rax
	b756:
	mov rax, qword [rbp - 3696]
	mov rcx, qword [rbp - 6544]
	cmp rax, rcx
	jl b757
	b758:
	mov rax, qword [rbp - 12896]
	jmp b759
	b757:
	mov rax, qword [rbp - 6544]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3696]
	mov r14, rax
	mov rax, qword [rbp - 12896]
	mov rbx, rax
	b760:
	cmp r14, r15
	jl b761
	b762:
	mov rax, rbx
	jmp b763
	b761:
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
	b763:
	mov qword [rbp - 7872], rax
	mov rax, qword [rbp - 3696]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12896]
	mov rbx, rax
	mov rax, qword [rbp - 6544]
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
	b767:
	mov qword [rbp - 2256], rax
	mov rax, qword [rbp - 12896]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6544]
	mov r12, rax
	mov rax, qword [rbp - 3696]
	mov r13, rax
	b768:
	cmp r12, r14
	jl b769
	b770:
	mov rax, r13
	jmp b771
	b769:
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
	b771:
	mov rcx, rax
	mov rax, qword [rbp - 7872]
	mov r14, rax
	mov rax, qword [rbp - 2256]
	mov r13, rax
	mov r12, rcx
	b772:
	cmp r13, r14
	jl b773
	b774:
	mov rax, r12
	jmp b775
	b773:
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
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
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
	b775:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b759:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b695:
	mov qword [rbp - 11560], rax
	mov rax, qword [rbp - 3624]
	sub rax, 1
	mov qword [rbp - 3480], rax
	mov rax, qword [rbp - 7088]
	mov qword [rbp - 1960], rax
	mov rax, qword [rbp - 1352]
	mov qword [rbp - 10576], rax
	b776:
	mov rcx, qword [rbp - 1960]
	mov rax, qword [rbp - 3480]
	cmp rcx, rax
	jl b777
	b778:
	mov rax, qword [rbp - 10576]
	jmp b779
	b777:
	mov rax, qword [rbp - 3480]
	sub rax, 1
	mov qword [rbp - 2464], rax
	mov rax, qword [rbp - 1960]
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 10576]
	mov qword [rbp - 5488], rax
	b780:
	mov rcx, qword [rbp - 88]
	mov rax, qword [rbp - 2464]
	cmp rcx, rax
	jl b781
	b782:
	mov rax, qword [rbp - 5488]
	jmp b783
	b781:
	mov rax, qword [rbp - 2464]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 88]
	mov r15, rax
	mov rax, qword [rbp - 5488]
	mov r14, rax
	b784:
	cmp r15, rbx
	jl b785
	b786:
	mov rax, r14
	jmp b787
	b785:
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
	b787:
	mov qword [rbp - 10504], rax
	mov rax, qword [rbp - 88]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5488]
	mov r13, rax
	mov rax, qword [rbp - 2464]
	mov rbx, rax
	b788:
	cmp r13, r15
	jl b789
	b790:
	mov rax, rbx
	jmp b791
	b789:
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
	b791:
	mov qword [rbp - 10168], rax
	mov rax, qword [rbp - 5488]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2464]
	mov r14, rax
	mov rax, qword [rbp - 88]
	mov r12, rax
	b792:
	cmp r14, r15
	jl b793
	b794:
	mov rax, r12
	jmp b795
	b793:
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
	b795:
	mov rcx, qword [rbp - 10504]
	mov r15, rcx
	mov rcx, qword [rbp - 10168]
	mov r14, rcx
	mov rbx, rax
	b796:
	cmp r14, r15
	jl b797
	b798:
	mov rax, rbx
	jmp b799
	b797:
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
	b799:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b783:
	mov qword [rbp - 6456], rax
	mov rax, qword [rbp - 1960]
	sub rax, 1
	mov qword [rbp - 8544], rax
	mov rax, qword [rbp - 10576]
	mov qword [rbp - 4016], rax
	mov rax, qword [rbp - 3480]
	mov qword [rbp - 5664], rax
	b800:
	mov rcx, qword [rbp - 4016]
	mov rax, qword [rbp - 8544]
	cmp rcx, rax
	jl b801
	b802:
	mov rax, qword [rbp - 5664]
	jmp b803
	b801:
	mov rax, qword [rbp - 8544]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4016]
	mov r13, rax
	mov rax, qword [rbp - 5664]
	mov r14, rax
	b804:
	cmp r13, r15
	jl b805
	b806:
	mov rax, r14
	jmp b807
	b805:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b807:
	mov qword [rbp - 5504], rax
	mov rax, qword [rbp - 4016]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5664]
	mov r12, rax
	mov rax, qword [rbp - 8544]
	mov r13, rax
	b808:
	cmp r12, r15
	jl b809
	b810:
	mov rax, r13
	jmp b811
	b809:
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
	b811:
	mov qword [rbp - 7008], rax
	mov rax, qword [rbp - 5664]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8544]
	mov rbx, rax
	mov rax, qword [rbp - 4016]
	mov r15, rax
	b812:
	cmp rbx, r12
	jl b813
	b814:
	mov rax, r15
	jmp b815
	b813:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b815:
	mov rcx, rax
	mov rax, qword [rbp - 5504]
	mov r15, rax
	mov rax, qword [rbp - 7008]
	mov r14, rax
	mov r13, rcx
	b816:
	cmp r14, r15
	jl b817
	b818:
	mov rax, r13
	jmp b819
	b817:
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
	b819:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b803:
	mov qword [rbp - 11376], rax
	mov rax, qword [rbp - 10576]
	sub rax, 1
	mov qword [rbp - 6496], rax
	mov rax, qword [rbp - 3480]
	mov qword [rbp - 6048], rax
	mov rax, qword [rbp - 1960]
	mov qword [rbp - 4824], rax
	b820:
	mov rcx, qword [rbp - 6048]
	mov rax, qword [rbp - 6496]
	cmp rcx, rax
	jl b821
	b822:
	mov rax, qword [rbp - 4824]
	jmp b823
	b821:
	mov rax, qword [rbp - 6496]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6048]
	mov r15, rax
	mov rax, qword [rbp - 4824]
	mov r13, rax
	b824:
	cmp r15, r14
	jl b825
	b826:
	mov rax, r13
	jmp b827
	b825:
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
	b827:
	mov qword [rbp - 3944], rax
	mov rax, qword [rbp - 6048]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4824]
	mov rbx, rax
	mov rax, qword [rbp - 6496]
	mov r15, rax
	b828:
	cmp rbx, r14
	jl b829
	b830:
	mov rax, r15
	jmp b831
	b829:
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
	b831:
	mov qword [rbp - 880], rax
	mov rax, qword [rbp - 4824]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6496]
	mov r14, rax
	mov rax, qword [rbp - 6048]
	mov r13, rax
	b832:
	cmp r14, r15
	jl b833
	b834:
	mov rax, r13
	jmp b835
	b833:
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
	b835:
	mov rcx, qword [rbp - 3944]
	mov r12, rcx
	mov rcx, qword [rbp - 880]
	mov r15, rcx
	mov r14, rax
	b836:
	cmp r15, r12
	jl b837
	b838:
	mov rax, r14
	jmp b839
	b837:
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
	b839:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b823:
	mov rcx, rax
	mov rax, qword [rbp - 6456]
	mov qword [rbp - 10480], rax
	mov rax, qword [rbp - 11376]
	mov qword [rbp - 768], rax
	mov rax, rcx
	mov qword [rbp - 2000], rax
	b840:
	mov rax, qword [rbp - 768]
	mov rcx, qword [rbp - 10480]
	cmp rax, rcx
	jl b841
	b842:
	mov rax, qword [rbp - 2000]
	jmp b843
	b841:
	mov rax, qword [rbp - 10480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 768]
	mov r14, rax
	mov rax, qword [rbp - 2000]
	mov r12, rax
	b844:
	cmp r14, r15
	jl b845
	b846:
	mov rax, r12
	jmp b847
	b845:
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
	b847:
	mov qword [rbp - 11600], rax
	mov rax, qword [rbp - 768]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2000]
	mov r14, rax
	mov rax, qword [rbp - 10480]
	mov rbx, rax
	b848:
	cmp r14, r15
	jl b849
	b850:
	mov rax, rbx
	jmp b851
	b849:
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
	b851:
	mov qword [rbp - 752], rax
	mov rax, qword [rbp - 2000]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10480]
	mov r14, rax
	mov rax, qword [rbp - 768]
	mov r12, rax
	b852:
	cmp r14, rbx
	jl b853
	b854:
	mov rax, r12
	jmp b855
	b853:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b855:
	mov rcx, qword [rbp - 11600]
	mov r14, rcx
	mov rcx, qword [rbp - 752]
	mov r15, rcx
	mov rbx, rax
	b856:
	cmp r15, r14
	jl b857
	b858:
	mov rax, rbx
	jmp b859
	b857:
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
	b859:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b843:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b779:
	mov qword [rbp - 6832], rax
	mov rax, qword [rbp - 7088]
	sub rax, 1
	mov qword [rbp - 8536], rax
	mov rax, qword [rbp - 1352]
	mov qword [rbp - 8664], rax
	mov rax, qword [rbp - 3624]
	mov qword [rbp - 3088], rax
	b860:
	mov rax, qword [rbp - 8664]
	mov rcx, qword [rbp - 8536]
	cmp rax, rcx
	jl b861
	b862:
	mov rax, qword [rbp - 3088]
	jmp b863
	b861:
	mov rax, qword [rbp - 8536]
	sub rax, 1
	mov qword [rbp - 5096], rax
	mov rax, qword [rbp - 8664]
	mov qword [rbp - 11856], rax
	mov rax, qword [rbp - 3088]
	mov qword [rbp - 160], rax
	b864:
	mov rax, qword [rbp - 11856]
	mov rcx, qword [rbp - 5096]
	cmp rax, rcx
	jl b865
	b866:
	mov rax, qword [rbp - 160]
	jmp b867
	b865:
	mov rax, qword [rbp - 5096]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11856]
	mov r12, rax
	mov rax, qword [rbp - 160]
	mov r13, rax
	b868:
	cmp r12, r15
	jl b869
	b870:
	mov rax, r13
	jmp b871
	b869:
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
	b871:
	mov qword [rbp - 13400], rax
	mov rax, qword [rbp - 11856]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 160]
	mov r12, rax
	mov rax, qword [rbp - 5096]
	mov r15, rax
	b872:
	cmp r12, r14
	jl b873
	b874:
	mov rax, r15
	jmp b875
	b873:
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
	b875:
	mov qword [rbp - 12536], rax
	mov rax, qword [rbp - 160]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5096]
	mov r12, rax
	mov rax, qword [rbp - 11856]
	mov r15, rax
	b876:
	cmp r12, r14
	jl b877
	b878:
	mov rax, r15
	jmp b879
	b877:
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
	b879:
	mov rcx, rax
	mov rax, qword [rbp - 13400]
	mov r13, rax
	mov rax, qword [rbp - 12536]
	mov rbx, rax
	mov r14, rcx
	b880:
	cmp rbx, r13
	jl b881
	b882:
	mov rax, r14
	jmp b883
	b881:
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
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
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
	b883:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b867:
	mov qword [rbp - 1288], rax
	mov rax, qword [rbp - 8664]
	sub rax, 1
	mov qword [rbp - 208], rax
	mov rax, qword [rbp - 3088]
	mov qword [rbp - 8072], rax
	mov rax, qword [rbp - 8536]
	mov qword [rbp - 480], rax
	b884:
	mov rcx, qword [rbp - 8072]
	mov rax, qword [rbp - 208]
	cmp rcx, rax
	jl b885
	b886:
	mov rax, qword [rbp - 480]
	jmp b887
	b885:
	mov rax, qword [rbp - 208]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8072]
	mov rbx, rax
	mov rax, qword [rbp - 480]
	mov r13, rax
	b888:
	cmp rbx, r12
	jl b889
	b890:
	mov rax, r13
	jmp b891
	b889:
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
	b891:
	mov qword [rbp - 1424], rax
	mov rax, qword [rbp - 8072]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 480]
	mov rbx, rax
	mov rax, qword [rbp - 208]
	mov r15, rax
	b892:
	cmp rbx, r14
	jl b893
	b894:
	mov rax, r15
	jmp b895
	b893:
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
	b895:
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 208]
	mov r12, rax
	mov rax, qword [rbp - 8072]
	mov r13, rax
	b896:
	cmp r12, r15
	jl b897
	b898:
	mov rax, r13
	jmp b899
	b897:
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
	b899:
	mov rcx, rax
	mov rax, qword [rbp - 1424]
	mov rbx, rax
	mov rax, qword [rbp - 120]
	mov r12, rax
	mov r13, rcx
	b900:
	cmp r12, rbx
	jl b901
	b902:
	mov rax, r13
	jmp b903
	b901:
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
	b903:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b887:
	mov qword [rbp - 1192], rax
	mov rax, qword [rbp - 3088]
	sub rax, 1
	mov qword [rbp - 11464], rax
	mov rax, qword [rbp - 8536]
	mov qword [rbp - 4392], rax
	mov rax, qword [rbp - 8664]
	mov qword [rbp - 5040], rax
	b904:
	mov rax, qword [rbp - 4392]
	mov rcx, qword [rbp - 11464]
	cmp rax, rcx
	jl b905
	b906:
	mov rax, qword [rbp - 5040]
	jmp b907
	b905:
	mov rax, qword [rbp - 11464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4392]
	mov rbx, rax
	mov rax, qword [rbp - 5040]
	mov r12, rax
	b908:
	cmp rbx, r15
	jl b909
	b910:
	mov rax, r12
	jmp b911
	b909:
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
	b911:
	mov qword [rbp - 11040], rax
	mov rax, qword [rbp - 4392]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5040]
	mov r14, rax
	mov rax, qword [rbp - 11464]
	mov r12, rax
	b912:
	cmp r14, r15
	jl b913
	b914:
	mov rax, r12
	jmp b915
	b913:
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
	b915:
	mov qword [rbp - 10976], rax
	mov rax, qword [rbp - 5040]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11464]
	mov r12, rax
	mov rax, qword [rbp - 4392]
	mov r14, rax
	b916:
	cmp r12, rbx
	jl b917
	b918:
	mov rax, r14
	jmp b919
	b917:
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
	b919:
	mov rcx, qword [rbp - 11040]
	mov rbx, rcx
	mov rcx, qword [rbp - 10976]
	mov r12, rcx
	mov r13, rax
	b920:
	cmp r12, rbx
	jl b921
	b922:
	mov rax, r13
	jmp b923
	b921:
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
	b923:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b907:
	mov rcx, qword [rbp - 1288]
	mov qword [rbp - 6664], rcx
	mov rcx, qword [rbp - 1192]
	mov qword [rbp - 5320], rcx
	mov qword [rbp - 11776], rax
	b924:
	mov rax, qword [rbp - 5320]
	mov rcx, qword [rbp - 6664]
	cmp rax, rcx
	jl b925
	b926:
	mov rax, qword [rbp - 11776]
	jmp b927
	b925:
	mov rax, qword [rbp - 6664]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5320]
	mov r15, rax
	mov rax, qword [rbp - 11776]
	mov r13, rax
	b928:
	cmp r15, r12
	jl b929
	b930:
	mov rax, r13
	jmp b931
	b929:
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
	b931:
	mov qword [rbp - 1152], rax
	mov rax, qword [rbp - 5320]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11776]
	mov rbx, rax
	mov rax, qword [rbp - 6664]
	mov r14, rax
	b932:
	cmp rbx, r15
	jl b933
	b934:
	mov rax, r14
	jmp b935
	b933:
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
	b935:
	mov qword [rbp - 12192], rax
	mov rax, qword [rbp - 11776]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6664]
	mov r15, rax
	mov rax, qword [rbp - 5320]
	mov r14, rax
	b936:
	cmp r15, rbx
	jl b937
	b938:
	mov rax, r14
	jmp b939
	b937:
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
	b939:
	mov rcx, rax
	mov rax, qword [rbp - 1152]
	mov r14, rax
	mov rax, qword [rbp - 12192]
	mov rbx, rax
	mov r15, rcx
	b940:
	cmp rbx, r14
	jl b941
	b942:
	mov rax, r15
	jmp b943
	b941:
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
	b943:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b927:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b863:
	mov rcx, rax
	mov rax, qword [rbp - 11560]
	mov qword [rbp - 6992], rax
	mov rax, qword [rbp - 6832]
	mov qword [rbp - 7296], rax
	mov rax, rcx
	mov qword [rbp - 4800], rax
	b944:
	mov rax, qword [rbp - 7296]
	mov rcx, qword [rbp - 6992]
	cmp rax, rcx
	jl b945
	b946:
	mov rax, qword [rbp - 4800]
	jmp b947
	b945:
	mov rax, qword [rbp - 6992]
	sub rax, 1
	mov qword [rbp - 5392], rax
	mov rax, qword [rbp - 7296]
	mov qword [rbp - 11888], rax
	mov rax, qword [rbp - 4800]
	mov qword [rbp - 5728], rax
	b948:
	mov rax, qword [rbp - 11888]
	mov rcx, qword [rbp - 5392]
	cmp rax, rcx
	jl b949
	b950:
	mov rax, qword [rbp - 5728]
	jmp b951
	b949:
	mov rax, qword [rbp - 5392]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11888]
	mov r14, rax
	mov rax, qword [rbp - 5728]
	mov r13, rax
	b952:
	cmp r14, r15
	jl b953
	b954:
	mov rax, r13
	jmp b955
	b953:
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
	b955:
	mov qword [rbp - 1256], rax
	mov rax, qword [rbp - 11888]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 5728]
	mov r14, rax
	mov rax, qword [rbp - 5392]
	mov rbx, rax
	b956:
	cmp r14, r13
	jl b957
	b958:
	mov rax, rbx
	jmp b959
	b957:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b959:
	mov qword [rbp - 1928], rax
	mov rax, qword [rbp - 5728]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5392]
	mov r12, rax
	mov rax, qword [rbp - 11888]
	mov r13, rax
	b960:
	cmp r12, r14
	jl b961
	b962:
	mov rax, r13
	jmp b963
	b961:
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
	b963:
	mov rcx, qword [rbp - 1256]
	mov rbx, rcx
	mov rcx, qword [rbp - 1928]
	mov r12, rcx
	mov r13, rax
	b964:
	cmp r12, rbx
	jl b965
	b966:
	mov rax, r13
	jmp b967
	b965:
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
	b967:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b951:
	mov qword [rbp - 13152], rax
	mov rax, qword [rbp - 7296]
	sub rax, 1
	mov qword [rbp - 5144], rax
	mov rax, qword [rbp - 4800]
	mov qword [rbp - 5440], rax
	mov rax, qword [rbp - 6992]
	mov qword [rbp - 5512], rax
	b968:
	mov rcx, qword [rbp - 5440]
	mov rax, qword [rbp - 5144]
	cmp rcx, rax
	jl b969
	b970:
	mov rax, qword [rbp - 5512]
	jmp b971
	b969:
	mov rax, qword [rbp - 5144]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5440]
	mov r14, rax
	mov rax, qword [rbp - 5512]
	mov r12, rax
	b972:
	cmp r14, r15
	jl b973
	b974:
	mov rax, r12
	jmp b975
	b973:
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
	b975:
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 5440]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5512]
	mov rbx, rax
	mov rax, qword [rbp - 5144]
	mov r15, rax
	b976:
	cmp rbx, r14
	jl b977
	b978:
	mov rax, r15
	jmp b979
	b977:
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
	b979:
	mov qword [rbp - 12008], rax
	mov rax, qword [rbp - 5512]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5144]
	mov r12, rax
	mov rax, qword [rbp - 5440]
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b983:
	mov rcx, qword [rbp - 560]
	mov r12, rcx
	mov rcx, qword [rbp - 12008]
	mov r14, rcx
	mov rbx, rax
	b984:
	cmp r14, r12
	jl b985
	b986:
	mov rax, rbx
	jmp b987
	b985:
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
	b987:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b971:
	mov qword [rbp - 3792], rax
	mov rax, qword [rbp - 4800]
	sub rax, 1
	mov qword [rbp - 3848], rax
	mov rax, qword [rbp - 6992]
	mov qword [rbp - 10880], rax
	mov rax, qword [rbp - 7296]
	mov qword [rbp - 7712], rax
	b988:
	mov rcx, qword [rbp - 10880]
	mov rax, qword [rbp - 3848]
	cmp rcx, rax
	jl b989
	b990:
	mov rax, qword [rbp - 7712]
	jmp b991
	b989:
	mov rax, qword [rbp - 3848]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10880]
	mov rbx, rax
	mov rax, qword [rbp - 7712]
	mov r13, rax
	b992:
	cmp rbx, r12
	jl b993
	b994:
	mov rax, r13
	jmp b995
	b993:
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
	b995:
	mov qword [rbp - 3408], rax
	mov rax, qword [rbp - 10880]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7712]
	mov r15, rax
	mov rax, qword [rbp - 3848]
	mov r12, rax
	b996:
	cmp r15, r14
	jl b997
	b998:
	mov rax, r12
	jmp b999
	b997:
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
	b999:
	mov qword [rbp - 4184], rax
	mov rax, qword [rbp - 7712]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3848]
	mov r12, rax
	mov rax, qword [rbp - 10880]
	mov r14, rax
	b1000:
	cmp r12, rbx
	jl b1001
	b1002:
	mov rax, r14
	jmp b1003
	b1001:
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
	b1003:
	mov rcx, rax
	mov rax, qword [rbp - 3408]
	mov r15, rax
	mov rax, qword [rbp - 4184]
	mov r14, rax
	mov r12, rcx
	b1004:
	cmp r14, r15
	jl b1005
	b1006:
	mov rax, r12
	jmp b1007
	b1005:
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
	b1007:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b991:
	mov rcx, rax
	mov rax, qword [rbp - 13152]
	mov qword [rbp - 11360], rax
	mov rax, qword [rbp - 3792]
	mov qword [rbp - 7192], rax
	mov rax, rcx
	mov qword [rbp - 2680], rax
	b1008:
	mov rcx, qword [rbp - 7192]
	mov rax, qword [rbp - 11360]
	cmp rcx, rax
	jl b1009
	b1010:
	mov rax, qword [rbp - 2680]
	jmp b1011
	b1009:
	mov rax, qword [rbp - 11360]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7192]
	mov r13, rax
	mov rax, qword [rbp - 2680]
	mov rbx, rax
	b1012:
	cmp r13, r12
	jl b1013
	b1014:
	mov rax, rbx
	jmp b1015
	b1013:
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
	b1015:
	mov qword [rbp - 13488], rax
	mov rax, qword [rbp - 7192]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2680]
	mov rbx, rax
	mov rax, qword [rbp - 11360]
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
	mov qword [rbp - 8088], rax
	mov rax, qword [rbp - 2680]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11360]
	mov rbx, rax
	mov rax, qword [rbp - 7192]
	mov r13, rax
	b1020:
	cmp rbx, r15
	jl b1021
	b1022:
	mov rax, r13
	jmp b1023
	b1021:
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
	b1023:
	mov rcx, rax
	mov rax, qword [rbp - 13488]
	mov r12, rax
	mov rax, qword [rbp - 8088]
	mov r15, rax
	mov rbx, rcx
	b1024:
	cmp r15, r12
	jl b1025
	b1026:
	mov rax, rbx
	jmp b1027
	b1025:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1027:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1011:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b947:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b691:
	mov rcx, rax
	mov rax, qword [rbp - 7280]
	mov qword [rbp - 5536], rax
	mov rax, qword [rbp - 11712]
	mov qword [rbp - 10536], rax
	mov rax, rcx
	mov qword [rbp - 5832], rax
	b1028:
	mov rax, qword [rbp - 10536]
	mov rcx, qword [rbp - 5536]
	cmp rax, rcx
	jl b1029
	b1030:
	mov rax, qword [rbp - 5832]
	jmp b1031
	b1029:
	mov rax, qword [rbp - 5536]
	sub rax, 1
	mov qword [rbp - 11400], rax
	mov rax, qword [rbp - 10536]
	mov qword [rbp - 11024], rax
	mov rax, qword [rbp - 5832]
	mov qword [rbp - 12976], rax
	b1032:
	mov rcx, qword [rbp - 11024]
	mov rax, qword [rbp - 11400]
	cmp rcx, rax
	jl b1033
	b1034:
	mov rax, qword [rbp - 12976]
	jmp b1035
	b1033:
	mov rax, qword [rbp - 11400]
	sub rax, 1
	mov qword [rbp - 4408], rax
	mov rax, qword [rbp - 11024]
	mov qword [rbp - 2128], rax
	mov rax, qword [rbp - 12976]
	mov qword [rbp - 472], rax
	b1036:
	mov rax, qword [rbp - 2128]
	mov rcx, qword [rbp - 4408]
	cmp rax, rcx
	jl b1037
	b1038:
	mov rax, qword [rbp - 472]
	jmp b1039
	b1037:
	mov rax, qword [rbp - 4408]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2128]
	mov rbx, rax
	mov rax, qword [rbp - 472]
	mov r14, rax
	b1040:
	cmp rbx, r12
	jl b1041
	b1042:
	mov rax, r14
	jmp b1043
	b1041:
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
	b1043:
	mov qword [rbp - 5576], rax
	mov rax, qword [rbp - 2128]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 472]
	mov r14, rax
	mov rax, qword [rbp - 4408]
	mov r15, rax
	b1044:
	cmp r14, r12
	jl b1045
	b1046:
	mov rax, r15
	jmp b1047
	b1045:
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
	b1047:
	mov qword [rbp - 13536], rax
	mov rax, qword [rbp - 472]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4408]
	mov rbx, rax
	mov rax, qword [rbp - 2128]
	mov r12, rax
	b1048:
	cmp rbx, r14
	jl b1049
	b1050:
	mov rax, r12
	jmp b1051
	b1049:
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
	b1051:
	mov rcx, rax
	mov rax, qword [rbp - 5576]
	mov r12, rax
	mov rax, qword [rbp - 13536]
	mov r15, rax
	mov rbx, rcx
	b1052:
	cmp r15, r12
	jl b1053
	b1054:
	mov rax, rbx
	jmp b1055
	b1053:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1055:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1039:
	mov qword [rbp - 12360], rax
	mov rax, qword [rbp - 11024]
	sub rax, 1
	mov qword [rbp - 13016], rax
	mov rax, qword [rbp - 12976]
	mov qword [rbp - 528], rax
	mov rax, qword [rbp - 11400]
	mov qword [rbp - 1864], rax
	b1056:
	mov rcx, qword [rbp - 528]
	mov rax, qword [rbp - 13016]
	cmp rcx, rax
	jl b1057
	b1058:
	mov rax, qword [rbp - 1864]
	jmp b1059
	b1057:
	mov rax, qword [rbp - 13016]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 528]
	mov r12, rax
	mov rax, qword [rbp - 1864]
	mov r13, rax
	b1060:
	cmp r12, r14
	jl b1061
	b1062:
	mov rax, r13
	jmp b1063
	b1061:
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
	b1063:
	mov qword [rbp - 11552], rax
	mov rax, qword [rbp - 528]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1864]
	mov r14, rax
	mov rax, qword [rbp - 13016]
	mov rbx, rax
	b1064:
	cmp r14, r12
	jl b1065
	b1066:
	mov rax, rbx
	jmp b1067
	b1065:
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
	b1067:
	mov qword [rbp - 8376], rax
	mov rax, qword [rbp - 1864]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13016]
	mov rbx, rax
	mov rax, qword [rbp - 528]
	mov r13, rax
	b1068:
	cmp rbx, r15
	jl b1069
	b1070:
	mov rax, r13
	jmp b1071
	b1069:
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
	b1071:
	mov rcx, rax
	mov rax, qword [rbp - 11552]
	mov r14, rax
	mov rax, qword [rbp - 8376]
	mov r12, rax
	mov r13, rcx
	b1072:
	cmp r12, r14
	jl b1073
	b1074:
	mov rax, r13
	jmp b1075
	b1073:
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
	b1075:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1059:
	mov qword [rbp - 2896], rax
	mov rax, qword [rbp - 12976]
	sub rax, 1
	mov qword [rbp - 10088], rax
	mov rax, qword [rbp - 11400]
	mov qword [rbp - 9528], rax
	mov rax, qword [rbp - 11024]
	mov qword [rbp - 10744], rax
	b1076:
	mov rcx, qword [rbp - 9528]
	mov rax, qword [rbp - 10088]
	cmp rcx, rax
	jl b1077
	b1078:
	mov rax, qword [rbp - 10744]
	jmp b1079
	b1077:
	mov rax, qword [rbp - 10088]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9528]
	mov rbx, rax
	mov rax, qword [rbp - 10744]
	mov r13, rax
	b1080:
	cmp rbx, r14
	jl b1081
	b1082:
	mov rax, r13
	jmp b1083
	b1081:
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
	b1083:
	mov qword [rbp - 11432], rax
	mov rax, qword [rbp - 9528]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10744]
	mov r12, rax
	mov rax, qword [rbp - 10088]
	mov rbx, rax
	b1084:
	cmp r12, r15
	jl b1085
	b1086:
	mov rax, rbx
	jmp b1087
	b1085:
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
	b1087:
	mov qword [rbp - 4936], rax
	mov rax, qword [rbp - 10744]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10088]
	mov rbx, rax
	mov rax, qword [rbp - 9528]
	mov r15, rax
	b1088:
	cmp rbx, r14
	jl b1089
	b1090:
	mov rax, r15
	jmp b1091
	b1089:
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
	b1091:
	mov rcx, rax
	mov rax, qword [rbp - 11432]
	mov r15, rax
	mov rax, qword [rbp - 4936]
	mov rbx, rax
	mov r14, rcx
	b1092:
	cmp rbx, r15
	jl b1093
	b1094:
	mov rax, r14
	jmp b1095
	b1093:
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
	b1095:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1079:
	mov rcx, rax
	mov rax, qword [rbp - 12360]
	mov qword [rbp - 4304], rax
	mov rax, qword [rbp - 2896]
	mov qword [rbp - 8624], rax
	mov rax, rcx
	mov qword [rbp - 11640], rax
	b1096:
	mov rax, qword [rbp - 8624]
	mov rcx, qword [rbp - 4304]
	cmp rax, rcx
	jl b1097
	b1098:
	mov rax, qword [rbp - 11640]
	jmp b1099
	b1097:
	mov rax, qword [rbp - 4304]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8624]
	mov r12, rax
	mov rax, qword [rbp - 11640]
	mov rbx, rax
	b1100:
	cmp r12, r14
	jl b1101
	b1102:
	mov rax, rbx
	jmp b1103
	b1101:
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
	b1103:
	mov qword [rbp - 11960], rax
	mov rax, qword [rbp - 8624]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11640]
	mov r14, rax
	mov rax, qword [rbp - 4304]
	mov r12, rax
	b1104:
	cmp r14, r15
	jl b1105
	b1106:
	mov rax, r12
	jmp b1107
	b1105:
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
	b1107:
	mov qword [rbp - 2760], rax
	mov rax, qword [rbp - 11640]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4304]
	mov rbx, rax
	mov rax, qword [rbp - 8624]
	mov r13, rax
	b1108:
	cmp rbx, r12
	jl b1109
	b1110:
	mov rax, r13
	jmp b1111
	b1109:
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
	b1111:
	mov rcx, rax
	mov rax, qword [rbp - 11960]
	mov r14, rax
	mov rax, qword [rbp - 2760]
	mov r12, rax
	mov r13, rcx
	b1112:
	cmp r12, r14
	jl b1113
	b1114:
	mov rax, r13
	jmp b1115
	b1113:
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
	b1115:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1099:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1035:
	mov qword [rbp - 2264], rax
	mov rax, qword [rbp - 10536]
	sub rax, 1
	mov qword [rbp - 10424], rax
	mov rax, qword [rbp - 5832]
	mov qword [rbp - 13544], rax
	mov rax, qword [rbp - 5536]
	mov qword [rbp - 7624], rax
	b1116:
	mov rcx, qword [rbp - 13544]
	mov rax, qword [rbp - 10424]
	cmp rcx, rax
	jl b1117
	b1118:
	mov rax, qword [rbp - 7624]
	jmp b1119
	b1117:
	mov rax, qword [rbp - 10424]
	sub rax, 1
	mov qword [rbp - 7584], rax
	mov rax, qword [rbp - 13544]
	mov qword [rbp - 3360], rax
	mov rax, qword [rbp - 7624]
	mov qword [rbp - 872], rax
	b1120:
	mov rax, qword [rbp - 3360]
	mov rcx, qword [rbp - 7584]
	cmp rax, rcx
	jl b1121
	b1122:
	mov rax, qword [rbp - 872]
	jmp b1123
	b1121:
	mov rax, qword [rbp - 7584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3360]
	mov r12, rax
	mov rax, qword [rbp - 872]
	mov r13, rax
	b1124:
	cmp r12, r14
	jl b1125
	b1126:
	mov rax, r13
	jmp b1127
	b1125:
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
	b1127:
	mov qword [rbp - 5328], rax
	mov rax, qword [rbp - 3360]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 872]
	mov r13, rax
	mov rax, qword [rbp - 7584]
	mov rbx, rax
	b1128:
	cmp r13, r15
	jl b1129
	b1130:
	mov rax, rbx
	jmp b1131
	b1129:
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
	b1131:
	mov qword [rbp - 7576], rax
	mov rax, qword [rbp - 872]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7584]
	mov r14, rax
	mov rax, qword [rbp - 3360]
	mov r12, rax
	b1132:
	cmp r14, rbx
	jl b1133
	b1134:
	mov rax, r12
	jmp b1135
	b1133:
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
	b1135:
	mov rcx, rax
	mov rax, qword [rbp - 5328]
	mov r14, rax
	mov rax, qword [rbp - 7576]
	mov r12, rax
	mov r15, rcx
	b1136:
	cmp r12, r14
	jl b1137
	b1138:
	mov rax, r15
	jmp b1139
	b1137:
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
	b1139:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1123:
	mov qword [rbp - 2096], rax
	mov rax, qword [rbp - 13544]
	sub rax, 1
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 7624]
	mov qword [rbp - 7648], rax
	mov rax, qword [rbp - 10424]
	mov qword [rbp - 1936], rax
	b1140:
	mov rcx, qword [rbp - 7648]
	mov rax, qword [rbp - 296]
	cmp rcx, rax
	jl b1141
	b1142:
	mov rax, qword [rbp - 1936]
	jmp b1143
	b1141:
	mov rax, qword [rbp - 296]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7648]
	mov rbx, rax
	mov rax, qword [rbp - 1936]
	mov r14, rax
	b1144:
	cmp rbx, r15
	jl b1145
	b1146:
	mov rax, r14
	jmp b1147
	b1145:
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
	b1147:
	mov qword [rbp - 11632], rax
	mov rax, qword [rbp - 7648]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1936]
	mov r15, rax
	mov rax, qword [rbp - 296]
	mov r13, rax
	b1148:
	cmp r15, rbx
	jl b1149
	b1150:
	mov rax, r13
	jmp b1151
	b1149:
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
	b1151:
	mov qword [rbp - 5776], rax
	mov rax, qword [rbp - 1936]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 296]
	mov rbx, rax
	mov rax, qword [rbp - 7648]
	mov r14, rax
	b1152:
	cmp rbx, r15
	jl b1153
	b1154:
	mov rax, r14
	jmp b1155
	b1153:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
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
	b1155:
	mov rcx, rax
	mov rax, qword [rbp - 11632]
	mov r14, rax
	mov rax, qword [rbp - 5776]
	mov r12, rax
	mov rbx, rcx
	b1156:
	cmp r12, r14
	jl b1157
	b1158:
	mov rax, rbx
	jmp b1159
	b1157:
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
	b1159:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1143:
	mov qword [rbp - 8392], rax
	mov rax, qword [rbp - 7624]
	sub rax, 1
	mov qword [rbp - 11832], rax
	mov rax, qword [rbp - 10424]
	mov qword [rbp - 8696], rax
	mov rax, qword [rbp - 13544]
	mov qword [rbp - 13384], rax
	b1160:
	mov rax, qword [rbp - 8696]
	mov rcx, qword [rbp - 11832]
	cmp rax, rcx
	jl b1161
	b1162:
	mov rax, qword [rbp - 13384]
	jmp b1163
	b1161:
	mov rax, qword [rbp - 11832]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8696]
	mov r15, rax
	mov rax, qword [rbp - 13384]
	mov r13, rax
	b1164:
	cmp r15, r14
	jl b1165
	b1166:
	mov rax, r13
	jmp b1167
	b1165:
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
	b1167:
	mov qword [rbp - 7456], rax
	mov rax, qword [rbp - 8696]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13384]
	mov r15, rax
	mov rax, qword [rbp - 11832]
	mov r12, rax
	b1168:
	cmp r15, r14
	jl b1169
	b1170:
	mov rax, r12
	jmp b1171
	b1169:
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
	b1171:
	mov qword [rbp - 4088], rax
	mov rax, qword [rbp - 13384]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11832]
	mov r12, rax
	mov rax, qword [rbp - 8696]
	mov rbx, rax
	b1172:
	cmp r12, r14
	jl b1173
	b1174:
	mov rax, rbx
	jmp b1175
	b1173:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1175:
	mov rcx, rax
	mov rax, qword [rbp - 7456]
	mov rbx, rax
	mov rax, qword [rbp - 4088]
	mov r15, rax
	mov r13, rcx
	b1176:
	cmp r15, rbx
	jl b1177
	b1178:
	mov rax, r13
	jmp b1179
	b1177:
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
	b1179:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1163:
	mov rcx, rax
	mov rax, qword [rbp - 2096]
	mov qword [rbp - 12080], rax
	mov rax, qword [rbp - 8392]
	mov qword [rbp - 4744], rax
	mov rax, rcx
	mov qword [rbp - 8336], rax
	b1180:
	mov rax, qword [rbp - 4744]
	mov rcx, qword [rbp - 12080]
	cmp rax, rcx
	jl b1181
	b1182:
	mov rax, qword [rbp - 8336]
	jmp b1183
	b1181:
	mov rax, qword [rbp - 12080]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4744]
	mov rbx, rax
	mov rax, qword [rbp - 8336]
	mov r13, rax
	b1184:
	cmp rbx, r15
	jl b1185
	b1186:
	mov rax, r13
	jmp b1187
	b1185:
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
	b1187:
	mov qword [rbp - 10848], rax
	mov rax, qword [rbp - 4744]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8336]
	mov r15, rax
	mov rax, qword [rbp - 12080]
	mov r13, rax
	b1188:
	cmp r15, r12
	jl b1189
	b1190:
	mov rax, r13
	jmp b1191
	b1189:
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
	b1191:
	mov qword [rbp - 10184], rax
	mov rax, qword [rbp - 8336]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12080]
	mov r14, rax
	mov rax, qword [rbp - 4744]
	mov rbx, rax
	b1192:
	cmp r14, r12
	jl b1193
	b1194:
	mov rax, rbx
	jmp b1195
	b1193:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1195:
	mov rcx, rax
	mov rax, qword [rbp - 10848]
	mov r15, rax
	mov rax, qword [rbp - 10184]
	mov r14, rax
	mov r12, rcx
	b1196:
	cmp r14, r15
	jl b1197
	b1198:
	mov rax, r12
	jmp b1199
	b1197:
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
	b1199:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1183:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1119:
	mov qword [rbp - 6920], rax
	mov rax, qword [rbp - 5832]
	sub rax, 1
	mov qword [rbp - 720], rax
	mov rax, qword [rbp - 5536]
	mov qword [rbp - 11936], rax
	mov rax, qword [rbp - 10536]
	mov qword [rbp - 10072], rax
	b1200:
	mov rcx, qword [rbp - 11936]
	mov rax, qword [rbp - 720]
	cmp rcx, rax
	jl b1201
	b1202:
	mov rax, qword [rbp - 10072]
	jmp b1203
	b1201:
	mov rax, qword [rbp - 720]
	sub rax, 1
	mov qword [rbp - 3720], rax
	mov rax, qword [rbp - 11936]
	mov qword [rbp - 7600], rax
	mov rax, qword [rbp - 10072]
	mov qword [rbp - 10040], rax
	b1204:
	mov rcx, qword [rbp - 7600]
	mov rax, qword [rbp - 3720]
	cmp rcx, rax
	jl b1205
	b1206:
	mov rax, qword [rbp - 10040]
	jmp b1207
	b1205:
	mov rax, qword [rbp - 3720]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7600]
	mov r15, rax
	mov rax, qword [rbp - 10040]
	mov r12, rax
	b1208:
	cmp r15, r14
	jl b1209
	b1210:
	mov rax, r12
	jmp b1211
	b1209:
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
	b1211:
	mov qword [rbp - 2496], rax
	mov rax, qword [rbp - 7600]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10040]
	mov r12, rax
	mov rax, qword [rbp - 3720]
	mov r13, rax
	b1212:
	cmp r12, rbx
	jl b1213
	b1214:
	mov rax, r13
	jmp b1215
	b1213:
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
	b1215:
	mov qword [rbp - 6872], rax
	mov rax, qword [rbp - 10040]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3720]
	mov r14, rax
	mov rax, qword [rbp - 7600]
	mov rbx, rax
	b1216:
	cmp r14, r15
	jl b1217
	b1218:
	mov rax, rbx
	jmp b1219
	b1217:
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
	b1219:
	mov rcx, qword [rbp - 2496]
	mov r14, rcx
	mov rcx, qword [rbp - 6872]
	mov r12, rcx
	mov r13, rax
	b1220:
	cmp r12, r14
	jl b1221
	b1222:
	mov rax, r13
	jmp b1223
	b1221:
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
	b1223:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1207:
	mov qword [rbp - 408], rax
	mov rax, qword [rbp - 11936]
	sub rax, 1
	mov qword [rbp - 7640], rax
	mov rax, qword [rbp - 10072]
	mov qword [rbp - 6352], rax
	mov rax, qword [rbp - 720]
	mov qword [rbp - 7288], rax
	b1224:
	mov rax, qword [rbp - 6352]
	mov rcx, qword [rbp - 7640]
	cmp rax, rcx
	jl b1225
	b1226:
	mov rax, qword [rbp - 7288]
	jmp b1227
	b1225:
	mov rax, qword [rbp - 7640]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6352]
	mov r13, rax
	mov rax, qword [rbp - 7288]
	mov rbx, rax
	b1228:
	cmp r13, r14
	jl b1229
	b1230:
	mov rax, rbx
	jmp b1231
	b1229:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1231:
	mov qword [rbp - 6016], rax
	mov rax, qword [rbp - 6352]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7288]
	mov r15, rax
	mov rax, qword [rbp - 7640]
	mov r13, rax
	b1232:
	cmp r15, r14
	jl b1233
	b1234:
	mov rax, r13
	jmp b1235
	b1233:
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
	b1235:
	mov qword [rbp - 7224], rax
	mov rax, qword [rbp - 7288]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7640]
	mov r14, rax
	mov rax, qword [rbp - 6352]
	mov r15, rax
	b1236:
	cmp r14, rbx
	jl b1237
	b1238:
	mov rax, r15
	jmp b1239
	b1237:
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
	b1239:
	mov rcx, rax
	mov rax, qword [rbp - 6016]
	mov r14, rax
	mov rax, qword [rbp - 7224]
	mov rbx, rax
	mov r13, rcx
	b1240:
	cmp rbx, r14
	jl b1241
	b1242:
	mov rax, r13
	jmp b1243
	b1241:
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
	b1243:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1227:
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 10072]
	sub rax, 1
	mov qword [rbp - 8168], rax
	mov rax, qword [rbp - 720]
	mov qword [rbp - 2184], rax
	mov rax, qword [rbp - 11936]
	mov qword [rbp - 10000], rax
	b1244:
	mov rcx, qword [rbp - 2184]
	mov rax, qword [rbp - 8168]
	cmp rcx, rax
	jl b1245
	b1246:
	mov rax, qword [rbp - 10000]
	jmp b1247
	b1245:
	mov rax, qword [rbp - 8168]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2184]
	mov r14, rax
	mov rax, qword [rbp - 10000]
	mov rbx, rax
	b1248:
	cmp r14, r12
	jl b1249
	b1250:
	mov rax, rbx
	jmp b1251
	b1249:
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
	b1251:
	mov qword [rbp - 1856], rax
	mov rax, qword [rbp - 2184]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10000]
	mov r14, rax
	mov rax, qword [rbp - 8168]
	mov r13, rax
	b1252:
	cmp r14, r15
	jl b1253
	b1254:
	mov rax, r13
	jmp b1255
	b1253:
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
	b1255:
	mov qword [rbp - 6944], rax
	mov rax, qword [rbp - 10000]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8168]
	mov r13, rax
	mov rax, qword [rbp - 2184]
	mov r15, rax
	b1256:
	cmp r13, rbx
	jl b1257
	b1258:
	mov rax, r15
	jmp b1259
	b1257:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1259:
	mov rcx, qword [rbp - 1856]
	mov r14, rcx
	mov rcx, qword [rbp - 6944]
	mov rbx, rcx
	mov r13, rax
	b1260:
	cmp rbx, r14
	jl b1261
	b1262:
	mov rax, r13
	jmp b1263
	b1261:
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
	b1263:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1247:
	mov rcx, rax
	mov rax, qword [rbp - 408]
	mov qword [rbp - 10648], rax
	mov rax, qword [rbp - 136]
	mov qword [rbp - 3576], rax
	mov rax, rcx
	mov qword [rbp - 2248], rax
	b1264:
	mov rcx, qword [rbp - 3576]
	mov rax, qword [rbp - 10648]
	cmp rcx, rax
	jl b1265
	b1266:
	mov rax, qword [rbp - 2248]
	jmp b1267
	b1265:
	mov rax, qword [rbp - 10648]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3576]
	mov r12, rax
	mov rax, qword [rbp - 2248]
	mov r13, rax
	b1268:
	cmp r12, r14
	jl b1269
	b1270:
	mov rax, r13
	jmp b1271
	b1269:
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
	b1271:
	mov qword [rbp - 5064], rax
	mov rax, qword [rbp - 3576]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2248]
	mov rbx, rax
	mov rax, qword [rbp - 10648]
	mov r14, rax
	b1272:
	cmp rbx, r15
	jl b1273
	b1274:
	mov rax, r14
	jmp b1275
	b1273:
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
	b1275:
	mov qword [rbp - 9352], rax
	mov rax, qword [rbp - 2248]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10648]
	mov r14, rax
	mov rax, qword [rbp - 3576]
	mov rbx, rax
	b1276:
	cmp r14, r15
	jl b1277
	b1278:
	mov rax, rbx
	jmp b1279
	b1277:
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
	b1279:
	mov rcx, rax
	mov rax, qword [rbp - 5064]
	mov r15, rax
	mov rax, qword [rbp - 9352]
	mov r14, rax
	mov r12, rcx
	b1280:
	cmp r14, r15
	jl b1281
	b1282:
	mov rax, r12
	jmp b1283
	b1281:
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
	b1283:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1267:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1203:
	mov rcx, qword [rbp - 2264]
	mov qword [rbp - 3872], rcx
	mov rcx, qword [rbp - 6920]
	mov qword [rbp - 9632], rcx
	mov qword [rbp - 5016], rax
	b1284:
	mov rax, qword [rbp - 9632]
	mov rcx, qword [rbp - 3872]
	cmp rax, rcx
	jl b1285
	b1286:
	mov rax, qword [rbp - 5016]
	jmp b1287
	b1285:
	mov rax, qword [rbp - 3872]
	sub rax, 1
	mov qword [rbp - 3136], rax
	mov rax, qword [rbp - 9632]
	mov qword [rbp - 4664], rax
	mov rax, qword [rbp - 5016]
	mov qword [rbp - 1088], rax
	b1288:
	mov rax, qword [rbp - 4664]
	mov rcx, qword [rbp - 3136]
	cmp rax, rcx
	jl b1289
	b1290:
	mov rax, qword [rbp - 1088]
	jmp b1291
	b1289:
	mov rax, qword [rbp - 3136]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4664]
	mov r15, rax
	mov rax, qword [rbp - 1088]
	mov rbx, rax
	b1292:
	cmp r15, r14
	jl b1293
	b1294:
	mov rax, rbx
	jmp b1295
	b1293:
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
	b1295:
	mov qword [rbp - 8968], rax
	mov rax, qword [rbp - 4664]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1088]
	mov r14, rax
	mov rax, qword [rbp - 3136]
	mov r13, rax
	b1296:
	cmp r14, r15
	jl b1297
	b1298:
	mov rax, r13
	jmp b1299
	b1297:
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
	b1299:
	mov qword [rbp - 4976], rax
	mov rax, qword [rbp - 1088]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3136]
	mov r15, rax
	mov rax, qword [rbp - 4664]
	mov r12, rax
	b1300:
	cmp r15, r14
	jl b1301
	b1302:
	mov rax, r12
	jmp b1303
	b1301:
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
	b1303:
	mov rcx, rax
	mov rax, qword [rbp - 8968]
	mov r14, rax
	mov rax, qword [rbp - 4976]
	mov rbx, rax
	mov r13, rcx
	b1304:
	cmp rbx, r14
	jl b1305
	b1306:
	mov rax, r13
	jmp b1307
	b1305:
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
	b1307:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1291:
	mov qword [rbp - 7968], rax
	mov rax, qword [rbp - 9632]
	sub rax, 1
	mov qword [rbp - 7472], rax
	mov rax, qword [rbp - 5016]
	mov qword [rbp - 5792], rax
	mov rax, qword [rbp - 3872]
	mov qword [rbp - 7792], rax
	b1308:
	mov rcx, qword [rbp - 5792]
	mov rax, qword [rbp - 7472]
	cmp rcx, rax
	jl b1309
	b1310:
	mov rax, qword [rbp - 7792]
	jmp b1311
	b1309:
	mov rax, qword [rbp - 7472]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5792]
	mov r12, rax
	mov rax, qword [rbp - 7792]
	mov r14, rax
	b1312:
	cmp r12, r15
	jl b1313
	b1314:
	mov rax, r14
	jmp b1315
	b1313:
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
	b1315:
	mov qword [rbp - 9016], rax
	mov rax, qword [rbp - 5792]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7792]
	mov r14, rax
	mov rax, qword [rbp - 7472]
	mov r12, rax
	b1316:
	cmp r14, rbx
	jl b1317
	b1318:
	mov rax, r12
	jmp b1319
	b1317:
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
	b1319:
	mov qword [rbp - 1736], rax
	mov rax, qword [rbp - 7792]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7472]
	mov r14, rax
	mov rax, qword [rbp - 5792]
	mov r13, rax
	b1320:
	cmp r14, r12
	jl b1321
	b1322:
	mov rax, r13
	jmp b1323
	b1321:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1323:
	mov rcx, rax
	mov rax, qword [rbp - 9016]
	mov r14, rax
	mov rax, qword [rbp - 1736]
	mov r12, rax
	mov rbx, rcx
	b1324:
	cmp r12, r14
	jl b1325
	b1326:
	mov rax, rbx
	jmp b1327
	b1325:
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
	b1327:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1311:
	mov qword [rbp - 6232], rax
	mov rax, qword [rbp - 5016]
	sub rax, 1
	mov qword [rbp - 3288], rax
	mov rax, qword [rbp - 3872]
	mov qword [rbp - 4952], rax
	mov rax, qword [rbp - 9632]
	mov qword [rbp - 9536], rax
	b1328:
	mov rax, qword [rbp - 4952]
	mov rcx, qword [rbp - 3288]
	cmp rax, rcx
	jl b1329
	b1330:
	mov rax, qword [rbp - 9536]
	jmp b1331
	b1329:
	mov rax, qword [rbp - 3288]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4952]
	mov r15, rax
	mov rax, qword [rbp - 9536]
	mov r14, rax
	b1332:
	cmp r15, rbx
	jl b1333
	b1334:
	mov rax, r14
	jmp b1335
	b1333:
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
	b1335:
	mov qword [rbp - 1976], rax
	mov rax, qword [rbp - 4952]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9536]
	mov rbx, rax
	mov rax, qword [rbp - 3288]
	mov r13, rax
	b1336:
	cmp rbx, r14
	jl b1337
	b1338:
	mov rax, r13
	jmp b1339
	b1337:
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
	b1339:
	mov qword [rbp - 9408], rax
	mov rax, qword [rbp - 9536]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3288]
	mov r15, rax
	mov rax, qword [rbp - 4952]
	mov rbx, rax
	b1340:
	cmp r15, r14
	jl b1341
	b1342:
	mov rax, rbx
	jmp b1343
	b1341:
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
	b1343:
	mov rcx, rax
	mov rax, qword [rbp - 1976]
	mov r13, rax
	mov rax, qword [rbp - 9408]
	mov r14, rax
	mov rbx, rcx
	b1344:
	cmp r14, r13
	jl b1345
	b1346:
	mov rax, rbx
	jmp b1347
	b1345:
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
	b1347:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1331:
	mov rcx, rax
	mov rax, qword [rbp - 7968]
	mov qword [rbp - 12056], rax
	mov rax, qword [rbp - 6232]
	mov qword [rbp - 2904], rax
	mov rax, rcx
	mov qword [rbp - 13560], rax
	b1348:
	mov rcx, qword [rbp - 2904]
	mov rax, qword [rbp - 12056]
	cmp rcx, rax
	jl b1349
	b1350:
	mov rax, qword [rbp - 13560]
	jmp b1351
	b1349:
	mov rax, qword [rbp - 12056]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2904]
	mov r14, rax
	mov rax, qword [rbp - 13560]
	mov rbx, rax
	b1352:
	cmp r14, r15
	jl b1353
	b1354:
	mov rax, rbx
	jmp b1355
	b1353:
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
	b1355:
	mov qword [rbp - 7800], rax
	mov rax, qword [rbp - 2904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13560]
	mov r12, rax
	mov rax, qword [rbp - 12056]
	mov r13, rax
	b1356:
	cmp r12, r14
	jl b1357
	b1358:
	mov rax, r13
	jmp b1359
	b1357:
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
	b1359:
	mov qword [rbp - 7808], rax
	mov rax, qword [rbp - 13560]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12056]
	mov r12, rax
	mov rax, qword [rbp - 2904]
	mov r13, rax
	b1360:
	cmp r12, rbx
	jl b1361
	b1362:
	mov rax, r13
	jmp b1363
	b1361:
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
	b1363:
	mov rcx, rax
	mov rax, qword [rbp - 7800]
	mov r12, rax
	mov rax, qword [rbp - 7808]
	mov r15, rax
	mov r13, rcx
	b1364:
	cmp r15, r12
	jl b1365
	b1366:
	mov rax, r13
	jmp b1367
	b1365:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1367:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1351:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1287:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1031:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b7:
	mov qword [rbp - 1792], rax
	mov rax, qword [rbp - 8144]
	sub rax, 1
	mov qword [rbp - 11904], rax
	mov rax, qword [rbp - 13184]
	mov qword [rbp - 6528], rax
	mov rax, qword [rbp - 9272]
	mov qword [rbp - 5608], rax
	b1368:
	mov rcx, qword [rbp - 6528]
	mov rax, qword [rbp - 11904]
	cmp rcx, rax
	jl b1369
	b1370:
	mov rax, qword [rbp - 5608]
	jmp b1371
	b1369:
	mov rax, qword [rbp - 11904]
	sub rax, 1
	mov qword [rbp - 11672], rax
	mov rax, qword [rbp - 6528]
	mov qword [rbp - 3752], rax
	mov rax, qword [rbp - 5608]
	mov qword [rbp - 6432], rax
	b1372:
	mov rax, qword [rbp - 3752]
	mov rcx, qword [rbp - 11672]
	cmp rax, rcx
	jl b1373
	b1374:
	mov rax, qword [rbp - 6432]
	jmp b1375
	b1373:
	mov rax, qword [rbp - 11672]
	sub rax, 1
	mov qword [rbp - 11512], rax
	mov rax, qword [rbp - 3752]
	mov qword [rbp - 10808], rax
	mov rax, qword [rbp - 6432]
	mov qword [rbp - 8728], rax
	b1376:
	mov rcx, qword [rbp - 10808]
	mov rax, qword [rbp - 11512]
	cmp rcx, rax
	jl b1377
	b1378:
	mov rax, qword [rbp - 8728]
	jmp b1379
	b1377:
	mov rax, qword [rbp - 11512]
	sub rax, 1
	mov qword [rbp - 9176], rax
	mov rax, qword [rbp - 10808]
	mov qword [rbp - 13392], rax
	mov rax, qword [rbp - 8728]
	mov qword [rbp - 2448], rax
	b1380:
	mov rax, qword [rbp - 13392]
	mov rcx, qword [rbp - 9176]
	cmp rax, rcx
	jl b1381
	b1382:
	mov rax, qword [rbp - 2448]
	jmp b1383
	b1381:
	mov rax, qword [rbp - 9176]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 13392]
	mov r14, rax
	mov rax, qword [rbp - 2448]
	mov r13, rax
	b1384:
	cmp r14, rbx
	jl b1385
	b1386:
	mov rax, r13
	jmp b1387
	b1385:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1387:
	mov qword [rbp - 12384], rax
	mov rax, qword [rbp - 13392]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2448]
	mov rbx, rax
	mov rax, qword [rbp - 9176]
	mov r14, rax
	b1388:
	cmp rbx, r12
	jl b1389
	b1390:
	mov rax, r14
	jmp b1391
	b1389:
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
	b1391:
	mov qword [rbp - 8920], rax
	mov rax, qword [rbp - 2448]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9176]
	mov r12, rax
	mov rax, qword [rbp - 13392]
	mov rbx, rax
	b1392:
	cmp r12, r14
	jl b1393
	b1394:
	mov rax, rbx
	jmp b1395
	b1393:
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
	b1395:
	mov rcx, qword [rbp - 12384]
	mov r15, rcx
	mov rcx, qword [rbp - 8920]
	mov r14, rcx
	mov r13, rax
	b1396:
	cmp r14, r15
	jl b1397
	b1398:
	mov rax, r13
	jmp b1399
	b1397:
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
	b1399:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1383:
	mov qword [rbp - 4480], rax
	mov rax, qword [rbp - 10808]
	sub rax, 1
	mov qword [rbp - 1064], rax
	mov rax, qword [rbp - 8728]
	mov qword [rbp - 7760], rax
	mov rax, qword [rbp - 11512]
	mov qword [rbp - 2368], rax
	b1400:
	mov rcx, qword [rbp - 7760]
	mov rax, qword [rbp - 1064]
	cmp rcx, rax
	jl b1401
	b1402:
	mov rax, qword [rbp - 2368]
	jmp b1403
	b1401:
	mov rax, qword [rbp - 1064]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7760]
	mov rbx, rax
	mov rax, qword [rbp - 2368]
	mov r15, rax
	b1404:
	cmp rbx, r12
	jl b1405
	b1406:
	mov rax, r15
	jmp b1407
	b1405:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1407:
	mov qword [rbp - 2008], rax
	mov rax, qword [rbp - 7760]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2368]
	mov r15, rax
	mov rax, qword [rbp - 1064]
	mov r12, rax
	b1408:
	cmp r15, r14
	jl b1409
	b1410:
	mov rax, r12
	jmp b1411
	b1409:
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
	b1411:
	mov qword [rbp - 7960], rax
	mov rax, qword [rbp - 2368]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1064]
	mov r14, rax
	mov rax, qword [rbp - 7760]
	mov r15, rax
	b1412:
	cmp r14, rbx
	jl b1413
	b1414:
	mov rax, r15
	jmp b1415
	b1413:
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
	b1415:
	mov rcx, rax
	mov rax, qword [rbp - 2008]
	mov r15, rax
	mov rax, qword [rbp - 7960]
	mov r12, rax
	mov r14, rcx
	b1416:
	cmp r12, r15
	jl b1417
	b1418:
	mov rax, r14
	jmp b1419
	b1417:
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
	b1419:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1403:
	mov qword [rbp - 11424], rax
	mov rax, qword [rbp - 8728]
	sub rax, 1
	mov qword [rbp - 10552], rax
	mov rax, qword [rbp - 11512]
	mov qword [rbp - 6880], rax
	mov rax, qword [rbp - 10808]
	mov qword [rbp - 7664], rax
	b1420:
	mov rax, qword [rbp - 6880]
	mov rcx, qword [rbp - 10552]
	cmp rax, rcx
	jl b1421
	b1422:
	mov rax, qword [rbp - 7664]
	jmp b1423
	b1421:
	mov rax, qword [rbp - 10552]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6880]
	mov r13, rax
	mov rax, qword [rbp - 7664]
	mov rbx, rax
	b1424:
	cmp r13, r14
	jl b1425
	b1426:
	mov rax, rbx
	jmp b1427
	b1425:
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
	b1427:
	mov qword [rbp - 4264], rax
	mov rax, qword [rbp - 6880]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7664]
	mov r12, rax
	mov rax, qword [rbp - 10552]
	mov r15, rax
	b1428:
	cmp r12, r14
	jl b1429
	b1430:
	mov rax, r15
	jmp b1431
	b1429:
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
	b1431:
	mov qword [rbp - 8712], rax
	mov rax, qword [rbp - 7664]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10552]
	mov r12, rax
	mov rax, qword [rbp - 6880]
	mov r14, rax
	b1432:
	cmp r12, r15
	jl b1433
	b1434:
	mov rax, r14
	jmp b1435
	b1433:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b1435:
	mov rcx, qword [rbp - 4264]
	mov r15, rcx
	mov rcx, qword [rbp - 8712]
	mov r14, rcx
	mov rbx, rax
	b1436:
	cmp r14, r15
	jl b1437
	b1438:
	mov rax, rbx
	jmp b1439
	b1437:
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
	b1439:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1423:
	mov rcx, rax
	mov rax, qword [rbp - 4480]
	mov qword [rbp - 5720], rax
	mov rax, qword [rbp - 11424]
	mov qword [rbp - 7464], rax
	mov rax, rcx
	mov qword [rbp - 8312], rax
	b1440:
	mov rax, qword [rbp - 7464]
	mov rcx, qword [rbp - 5720]
	cmp rax, rcx
	jl b1441
	b1442:
	mov rax, qword [rbp - 8312]
	jmp b1443
	b1441:
	mov rax, qword [rbp - 5720]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7464]
	mov r15, rax
	mov rax, qword [rbp - 8312]
	mov r13, rax
	b1444:
	cmp r15, rbx
	jl b1445
	b1446:
	mov rax, r13
	jmp b1447
	b1445:
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
	b1447:
	mov qword [rbp - 5520], rax
	mov rax, qword [rbp - 7464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8312]
	mov rbx, rax
	mov rax, qword [rbp - 5720]
	mov r12, rax
	b1448:
	cmp rbx, r15
	jl b1449
	b1450:
	mov rax, r12
	jmp b1451
	b1449:
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
	b1451:
	mov qword [rbp - 1824], rax
	mov rax, qword [rbp - 8312]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5720]
	mov r14, rax
	mov rax, qword [rbp - 7464]
	mov r12, rax
	b1452:
	cmp r14, r15
	jl b1453
	b1454:
	mov rax, r12
	jmp b1455
	b1453:
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
	b1455:
	mov rcx, rax
	mov rax, qword [rbp - 5520]
	mov r14, rax
	mov rax, qword [rbp - 1824]
	mov r12, rax
	mov r15, rcx
	b1456:
	cmp r12, r14
	jl b1457
	b1458:
	mov rax, r15
	jmp b1459
	b1457:
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
	b1459:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1443:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1379:
	mov qword [rbp - 2328], rax
	mov rax, qword [rbp - 3752]
	sub rax, 1
	mov qword [rbp - 5304], rax
	mov rax, qword [rbp - 6432]
	mov qword [rbp - 776], rax
	mov rax, qword [rbp - 11672]
	mov qword [rbp - 9376], rax
	b1460:
	mov rax, qword [rbp - 776]
	mov rcx, qword [rbp - 5304]
	cmp rax, rcx
	jl b1461
	b1462:
	mov rax, qword [rbp - 9376]
	jmp b1463
	b1461:
	mov rax, qword [rbp - 5304]
	sub rax, 1
	mov qword [rbp - 12648], rax
	mov rax, qword [rbp - 776]
	mov qword [rbp - 1840], rax
	mov rax, qword [rbp - 9376]
	mov qword [rbp - 3488], rax
	b1464:
	mov rax, qword [rbp - 1840]
	mov rcx, qword [rbp - 12648]
	cmp rax, rcx
	jl b1465
	b1466:
	mov rax, qword [rbp - 3488]
	jmp b1467
	b1465:
	mov rax, qword [rbp - 12648]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1840]
	mov r12, rax
	mov rax, qword [rbp - 3488]
	mov r13, rax
	b1468:
	cmp r12, rbx
	jl b1469
	b1470:
	mov rax, r13
	jmp b1471
	b1469:
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
	b1471:
	mov qword [rbp - 5080], rax
	mov rax, qword [rbp - 1840]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3488]
	mov r14, rax
	mov rax, qword [rbp - 12648]
	mov rbx, rax
	b1472:
	cmp r14, r15
	jl b1473
	b1474:
	mov rax, rbx
	jmp b1475
	b1473:
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
	b1475:
	mov qword [rbp - 12000], rax
	mov rax, qword [rbp - 3488]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12648]
	mov rbx, rax
	mov rax, qword [rbp - 1840]
	mov r13, rax
	b1476:
	cmp rbx, r14
	jl b1477
	b1478:
	mov rax, r13
	jmp b1479
	b1477:
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
	b1479:
	mov rcx, rax
	mov rax, qword [rbp - 5080]
	mov r14, rax
	mov rax, qword [rbp - 12000]
	mov r12, rax
	mov r13, rcx
	b1480:
	cmp r12, r14
	jl b1481
	b1482:
	mov rax, r13
	jmp b1483
	b1481:
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
	b1483:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1467:
	mov qword [rbp - 8448], rax
	mov rax, qword [rbp - 776]
	sub rax, 1
	mov qword [rbp - 10128], rax
	mov rax, qword [rbp - 9376]
	mov qword [rbp - 12552], rax
	mov rax, qword [rbp - 5304]
	mov qword [rbp - 4440], rax
	b1484:
	mov rcx, qword [rbp - 12552]
	mov rax, qword [rbp - 10128]
	cmp rcx, rax
	jl b1485
	b1486:
	mov rax, qword [rbp - 4440]
	jmp b1487
	b1485:
	mov rax, qword [rbp - 10128]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12552]
	mov rbx, rax
	mov rax, qword [rbp - 4440]
	mov r12, rax
	b1488:
	cmp rbx, r15
	jl b1489
	b1490:
	mov rax, r12
	jmp b1491
	b1489:
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
	b1491:
	mov qword [rbp - 5424], rax
	mov rax, qword [rbp - 12552]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4440]
	mov r15, rax
	mov rax, qword [rbp - 10128]
	mov rbx, rax
	b1492:
	cmp r15, r14
	jl b1493
	b1494:
	mov rax, rbx
	jmp b1495
	b1493:
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
	b1495:
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 4440]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10128]
	mov r15, rax
	mov rax, qword [rbp - 12552]
	mov rbx, rax
	b1496:
	cmp r15, r12
	jl b1497
	b1498:
	mov rax, rbx
	jmp b1499
	b1497:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1499:
	mov rcx, rax
	mov rax, qword [rbp - 5424]
	mov r15, rax
	mov rax, qword [rbp - 80]
	mov r12, rax
	mov r13, rcx
	b1500:
	cmp r12, r15
	jl b1501
	b1502:
	mov rax, r13
	jmp b1503
	b1501:
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
	b1503:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1487:
	mov qword [rbp - 10232], rax
	mov rax, qword [rbp - 9376]
	sub rax, 1
	mov qword [rbp - 4920], rax
	mov rax, qword [rbp - 5304]
	mov qword [rbp - 176], rax
	mov rax, qword [rbp - 776]
	mov qword [rbp - 6552], rax
	b1504:
	mov rcx, qword [rbp - 176]
	mov rax, qword [rbp - 4920]
	cmp rcx, rax
	jl b1505
	b1506:
	mov rax, qword [rbp - 6552]
	jmp b1507
	b1505:
	mov rax, qword [rbp - 4920]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 176]
	mov rbx, rax
	mov rax, qword [rbp - 6552]
	mov r14, rax
	b1508:
	cmp rbx, r15
	jl b1509
	b1510:
	mov rax, r14
	jmp b1511
	b1509:
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
	b1511:
	mov qword [rbp - 4624], rax
	mov rax, qword [rbp - 176]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6552]
	mov r12, rax
	mov rax, qword [rbp - 4920]
	mov r13, rax
	b1512:
	cmp r12, r15
	jl b1513
	b1514:
	mov rax, r13
	jmp b1515
	b1513:
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
	b1515:
	mov qword [rbp - 5816], rax
	mov rax, qword [rbp - 6552]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 4920]
	mov r15, rax
	mov rax, qword [rbp - 176]
	mov r12, rax
	b1516:
	cmp r15, r13
	jl b1517
	b1518:
	mov rax, r12
	jmp b1519
	b1517:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
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
	mov rdx, rax
	mov rsi, r14
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1519:
	mov rcx, qword [rbp - 4624]
	mov r12, rcx
	mov rcx, qword [rbp - 5816]
	mov r15, rcx
	mov r14, rax
	b1520:
	cmp r15, r12
	jl b1521
	b1522:
	mov rax, r14
	jmp b1523
	b1521:
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
	b1523:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1507:
	mov rcx, rax
	mov rax, qword [rbp - 8448]
	mov qword [rbp - 3144], rax
	mov rax, qword [rbp - 10232]
	mov qword [rbp - 6712], rax
	mov rax, rcx
	mov qword [rbp - 1144], rax
	b1524:
	mov rax, qword [rbp - 6712]
	mov rcx, qword [rbp - 3144]
	cmp rax, rcx
	jl b1525
	b1526:
	mov rax, qword [rbp - 1144]
	jmp b1527
	b1525:
	mov rax, qword [rbp - 3144]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 6712]
	mov r12, rax
	mov rax, qword [rbp - 1144]
	mov rbx, rax
	b1528:
	cmp r12, r13
	jl b1529
	b1530:
	mov rax, rbx
	jmp b1531
	b1529:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1531:
	mov qword [rbp - 6616], rax
	mov rax, qword [rbp - 6712]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1144]
	mov r12, rax
	mov rax, qword [rbp - 3144]
	mov rbx, rax
	b1532:
	cmp r12, r14
	jl b1533
	b1534:
	mov rax, rbx
	jmp b1535
	b1533:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1535:
	mov qword [rbp - 10736], rax
	mov rax, qword [rbp - 1144]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3144]
	mov r12, rax
	mov rax, qword [rbp - 6712]
	mov r14, rax
	b1536:
	cmp r12, r15
	jl b1537
	b1538:
	mov rax, r14
	jmp b1539
	b1537:
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
	b1539:
	mov rcx, qword [rbp - 6616]
	mov r15, rcx
	mov rcx, qword [rbp - 10736]
	mov rbx, rcx
	mov r14, rax
	b1540:
	cmp rbx, r15
	jl b1541
	b1542:
	mov rax, r14
	jmp b1543
	b1541:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
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
	b1543:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1527:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1463:
	mov qword [rbp - 848], rax
	mov rax, qword [rbp - 6432]
	sub rax, 1
	mov qword [rbp - 5496], rax
	mov rax, qword [rbp - 11672]
	mov qword [rbp - 920], rax
	mov rax, qword [rbp - 3752]
	mov qword [rbp - 13136], rax
	b1544:
	mov rcx, qword [rbp - 920]
	mov rax, qword [rbp - 5496]
	cmp rcx, rax
	jl b1545
	b1546:
	mov rax, qword [rbp - 13136]
	jmp b1547
	b1545:
	mov rax, qword [rbp - 5496]
	sub rax, 1
	mov qword [rbp - 3856], rax
	mov rax, qword [rbp - 920]
	mov qword [rbp - 9056], rax
	mov rax, qword [rbp - 13136]
	mov qword [rbp - 3248], rax
	b1548:
	mov rax, qword [rbp - 9056]
	mov rcx, qword [rbp - 3856]
	cmp rax, rcx
	jl b1549
	b1550:
	mov rax, qword [rbp - 3248]
	jmp b1551
	b1549:
	mov rax, qword [rbp - 3856]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9056]
	mov r12, rax
	mov rax, qword [rbp - 3248]
	mov rbx, rax
	b1552:
	cmp r12, r15
	jl b1553
	b1554:
	mov rax, rbx
	jmp b1555
	b1553:
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
	b1555:
	mov qword [rbp - 10144], rax
	mov rax, qword [rbp - 9056]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3248]
	mov rbx, rax
	mov rax, qword [rbp - 3856]
	mov r13, rax
	b1556:
	cmp rbx, r15
	jl b1557
	b1558:
	mov rax, r13
	jmp b1559
	b1557:
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
	b1559:
	mov qword [rbp - 10008], rax
	mov rax, qword [rbp - 3248]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3856]
	mov r15, rax
	mov rax, qword [rbp - 9056]
	mov r14, rax
	b1560:
	cmp r15, rbx
	jl b1561
	b1562:
	mov rax, r14
	jmp b1563
	b1561:
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
	b1563:
	mov rcx, rax
	mov rax, qword [rbp - 10144]
	mov r14, rax
	mov rax, qword [rbp - 10008]
	mov rbx, rax
	mov r15, rcx
	b1564:
	cmp rbx, r14
	jl b1565
	b1566:
	mov rax, r15
	jmp b1567
	b1565:
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
	b1567:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1551:
	mov qword [rbp - 1880], rax
	mov rax, qword [rbp - 920]
	sub rax, 1
	mov qword [rbp - 8192], rax
	mov rax, qword [rbp - 13136]
	mov qword [rbp - 8552], rax
	mov rax, qword [rbp - 5496]
	mov qword [rbp - 4848], rax
	b1568:
	mov rcx, qword [rbp - 8552]
	mov rax, qword [rbp - 8192]
	cmp rcx, rax
	jl b1569
	b1570:
	mov rax, qword [rbp - 4848]
	jmp b1571
	b1569:
	mov rax, qword [rbp - 8192]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8552]
	mov rbx, rax
	mov rax, qword [rbp - 4848]
	mov r15, rax
	b1572:
	cmp rbx, r14
	jl b1573
	b1574:
	mov rax, r15
	jmp b1575
	b1573:
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
	b1575:
	mov qword [rbp - 5448], rax
	mov rax, qword [rbp - 8552]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4848]
	mov r15, rax
	mov rax, qword [rbp - 8192]
	mov r12, rax
	b1576:
	cmp r15, r14
	jl b1577
	b1578:
	mov rax, r12
	jmp b1579
	b1577:
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
	b1579:
	mov qword [rbp - 2416], rax
	mov rax, qword [rbp - 4848]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8192]
	mov r12, rax
	mov rax, qword [rbp - 8552]
	mov rbx, rax
	b1580:
	cmp r12, r15
	jl b1581
	b1582:
	mov rax, rbx
	jmp b1583
	b1581:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1583:
	mov rcx, rax
	mov rax, qword [rbp - 5448]
	mov r15, rax
	mov rax, qword [rbp - 2416]
	mov rbx, rax
	mov r13, rcx
	b1584:
	cmp rbx, r15
	jl b1585
	b1586:
	mov rax, r13
	jmp b1587
	b1585:
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
	b1587:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1571:
	mov qword [rbp - 10856], rax
	mov rax, qword [rbp - 13136]
	sub rax, 1
	mov qword [rbp - 6360], rax
	mov rax, qword [rbp - 5496]
	mov qword [rbp - 4568], rax
	mov rax, qword [rbp - 920]
	mov qword [rbp - 11000], rax
	b1588:
	mov rcx, qword [rbp - 4568]
	mov rax, qword [rbp - 6360]
	cmp rcx, rax
	jl b1589
	b1590:
	mov rax, qword [rbp - 11000]
	jmp b1591
	b1589:
	mov rax, qword [rbp - 6360]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4568]
	mov r14, rax
	mov rax, qword [rbp - 11000]
	mov r13, rax
	b1592:
	cmp r14, rbx
	jl b1593
	b1594:
	mov rax, r13
	jmp b1595
	b1593:
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
	b1595:
	mov qword [rbp - 11272], rax
	mov rax, qword [rbp - 4568]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11000]
	mov r12, rax
	mov rax, qword [rbp - 6360]
	mov r13, rax
	b1596:
	cmp r12, r15
	jl b1597
	b1598:
	mov rax, r13
	jmp b1599
	b1597:
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
	b1599:
	mov qword [rbp - 7328], rax
	mov rax, qword [rbp - 11000]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6360]
	mov r15, rax
	mov rax, qword [rbp - 4568]
	mov r12, rax
	b1600:
	cmp r15, r14
	jl b1601
	b1602:
	mov rax, r12
	jmp b1603
	b1601:
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
	b1603:
	mov rcx, rax
	mov rax, qword [rbp - 11272]
	mov r12, rax
	mov rax, qword [rbp - 7328]
	mov r15, rax
	mov rbx, rcx
	b1604:
	cmp r15, r12
	jl b1605
	b1606:
	mov rax, rbx
	jmp b1607
	b1605:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1607:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1591:
	mov rcx, rax
	mov rax, qword [rbp - 1880]
	mov qword [rbp - 1360], rax
	mov rax, qword [rbp - 10856]
	mov qword [rbp - 6728], rax
	mov rax, rcx
	mov qword [rbp - 624], rax
	b1608:
	mov rcx, qword [rbp - 6728]
	mov rax, qword [rbp - 1360]
	cmp rcx, rax
	jl b1609
	b1610:
	mov rax, qword [rbp - 624]
	jmp b1611
	b1609:
	mov rax, qword [rbp - 1360]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6728]
	mov r15, rax
	mov rax, qword [rbp - 624]
	mov r13, rax
	b1612:
	cmp r15, r14
	jl b1613
	b1614:
	mov rax, r13
	jmp b1615
	b1613:
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
	b1615:
	mov qword [rbp - 7592], rax
	mov rax, qword [rbp - 6728]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 624]
	mov r14, rax
	mov rax, qword [rbp - 1360]
	mov rbx, rax
	b1616:
	cmp r14, r12
	jl b1617
	b1618:
	mov rax, rbx
	jmp b1619
	b1617:
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
	b1619:
	mov qword [rbp - 11296], rax
	mov rax, qword [rbp - 624]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1360]
	mov rbx, rax
	mov rax, qword [rbp - 6728]
	mov r13, rax
	b1620:
	cmp rbx, r14
	jl b1621
	b1622:
	mov rax, r13
	jmp b1623
	b1621:
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
	b1623:
	mov rcx, rax
	mov rax, qword [rbp - 7592]
	mov r15, rax
	mov rax, qword [rbp - 11296]
	mov r12, rax
	mov r14, rcx
	b1624:
	cmp r12, r15
	jl b1625
	b1626:
	mov rax, r14
	jmp b1627
	b1625:
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
	b1627:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1611:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1547:
	mov rcx, qword [rbp - 2328]
	mov qword [rbp - 7144], rcx
	mov rcx, qword [rbp - 848]
	mov qword [rbp - 8720], rcx
	mov qword [rbp - 7168], rax
	b1628:
	mov rcx, qword [rbp - 8720]
	mov rax, qword [rbp - 7144]
	cmp rcx, rax
	jl b1629
	b1630:
	mov rax, qword [rbp - 7168]
	jmp b1631
	b1629:
	mov rax, qword [rbp - 7144]
	sub rax, 1
	mov qword [rbp - 4312], rax
	mov rax, qword [rbp - 8720]
	mov qword [rbp - 6336], rax
	mov rax, qword [rbp - 7168]
	mov qword [rbp - 5352], rax
	b1632:
	mov rcx, qword [rbp - 6336]
	mov rax, qword [rbp - 4312]
	cmp rcx, rax
	jl b1633
	b1634:
	mov rax, qword [rbp - 5352]
	jmp b1635
	b1633:
	mov rax, qword [rbp - 4312]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6336]
	mov r15, rax
	mov rax, qword [rbp - 5352]
	mov r13, rax
	b1636:
	cmp r15, rbx
	jl b1637
	b1638:
	mov rax, r13
	jmp b1639
	b1637:
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
	b1639:
	mov qword [rbp - 8464], rax
	mov rax, qword [rbp - 6336]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5352]
	mov r12, rax
	mov rax, qword [rbp - 4312]
	mov r14, rax
	b1640:
	cmp r12, r15
	jl b1641
	b1642:
	mov rax, r14
	jmp b1643
	b1641:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b1643:
	mov qword [rbp - 5752], rax
	mov rax, qword [rbp - 5352]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4312]
	mov r14, rax
	mov rax, qword [rbp - 6336]
	mov r15, rax
	b1644:
	cmp r14, r12
	jl b1645
	b1646:
	mov rax, r15
	jmp b1647
	b1645:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1647:
	mov rcx, qword [rbp - 8464]
	mov r12, rcx
	mov rcx, qword [rbp - 5752]
	mov r15, rcx
	mov r13, rax
	b1648:
	cmp r15, r12
	jl b1649
	b1650:
	mov rax, r13
	jmp b1651
	b1649:
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
	b1651:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1635:
	mov qword [rbp - 12808], rax
	mov rax, qword [rbp - 8720]
	sub rax, 1
	mov qword [rbp - 3552], rax
	mov rax, qword [rbp - 7168]
	mov qword [rbp - 10344], rax
	mov rax, qword [rbp - 7144]
	mov qword [rbp - 5136], rax
	b1652:
	mov rcx, qword [rbp - 10344]
	mov rax, qword [rbp - 3552]
	cmp rcx, rax
	jl b1653
	b1654:
	mov rax, qword [rbp - 5136]
	jmp b1655
	b1653:
	mov rax, qword [rbp - 3552]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10344]
	mov r14, rax
	mov rax, qword [rbp - 5136]
	mov r12, rax
	b1656:
	cmp r14, rbx
	jl b1657
	b1658:
	mov rax, r12
	jmp b1659
	b1657:
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
	b1659:
	mov qword [rbp - 11320], rax
	mov rax, qword [rbp - 10344]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5136]
	mov r15, rax
	mov rax, qword [rbp - 3552]
	mov r13, rax
	b1660:
	cmp r15, r12
	jl b1661
	b1662:
	mov rax, r13
	jmp b1663
	b1661:
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
	b1663:
	mov qword [rbp - 5688], rax
	mov rax, qword [rbp - 5136]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3552]
	mov r15, rax
	mov rax, qword [rbp - 10344]
	mov r14, rax
	b1664:
	cmp r15, rbx
	jl b1665
	b1666:
	mov rax, r14
	jmp b1667
	b1665:
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
	b1667:
	mov rcx, rax
	mov rax, qword [rbp - 11320]
	mov r15, rax
	mov rax, qword [rbp - 5688]
	mov r13, rax
	mov r12, rcx
	b1668:
	cmp r13, r15
	jl b1669
	b1670:
	mov rax, r12
	jmp b1671
	b1669:
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
	b1671:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1655:
	mov qword [rbp - 632], rax
	mov rax, qword [rbp - 7168]
	sub rax, 1
	mov qword [rbp - 448], rax
	mov rax, qword [rbp - 7144]
	mov qword [rbp - 3440], rax
	mov rax, qword [rbp - 8720]
	mov qword [rbp - 9688], rax
	b1672:
	mov rax, qword [rbp - 3440]
	mov rcx, qword [rbp - 448]
	cmp rax, rcx
	jl b1673
	b1674:
	mov rax, qword [rbp - 9688]
	jmp b1675
	b1673:
	mov rax, qword [rbp - 448]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3440]
	mov rbx, rax
	mov rax, qword [rbp - 9688]
	mov r12, rax
	b1676:
	cmp rbx, r15
	jl b1677
	b1678:
	mov rax, r12
	jmp b1679
	b1677:
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
	b1679:
	mov qword [rbp - 464], rax
	mov rax, qword [rbp - 3440]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9688]
	mov r14, rax
	mov rax, qword [rbp - 448]
	mov r15, rax
	b1680:
	cmp r14, r12
	jl b1681
	b1682:
	mov rax, r15
	jmp b1683
	b1681:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1683:
	mov qword [rbp - 2560], rax
	mov rax, qword [rbp - 9688]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 448]
	mov r12, rax
	mov rax, qword [rbp - 3440]
	mov r13, rax
	b1684:
	cmp r12, r15
	jl b1685
	b1686:
	mov rax, r13
	jmp b1687
	b1685:
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
	b1687:
	mov rcx, qword [rbp - 464]
	mov rbx, rcx
	mov rcx, qword [rbp - 2560]
	mov r12, rcx
	mov r13, rax
	b1688:
	cmp r12, rbx
	jl b1689
	b1690:
	mov rax, r13
	jmp b1691
	b1689:
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
	b1691:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1675:
	mov rcx, qword [rbp - 12808]
	mov qword [rbp - 12472], rcx
	mov rcx, qword [rbp - 632]
	mov qword [rbp - 1080], rcx
	mov qword [rbp - 2936], rax
	b1692:
	mov rcx, qword [rbp - 1080]
	mov rax, qword [rbp - 12472]
	cmp rcx, rax
	jl b1693
	b1694:
	mov rax, qword [rbp - 2936]
	jmp b1695
	b1693:
	mov rax, qword [rbp - 12472]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1080]
	mov r14, rax
	mov rax, qword [rbp - 2936]
	mov r12, rax
	b1696:
	cmp r14, r15
	jl b1697
	b1698:
	mov rax, r12
	jmp b1699
	b1697:
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
	b1699:
	mov qword [rbp - 10152], rax
	mov rax, qword [rbp - 1080]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2936]
	mov r15, rax
	mov rax, qword [rbp - 12472]
	mov r12, rax
	b1700:
	cmp r15, r14
	jl b1701
	b1702:
	mov rax, r12
	jmp b1703
	b1701:
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
	b1703:
	mov qword [rbp - 4816], rax
	mov rax, qword [rbp - 2936]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12472]
	mov r14, rax
	mov rax, qword [rbp - 1080]
	mov r12, rax
	b1704:
	cmp r14, rbx
	jl b1705
	b1706:
	mov rax, r12
	jmp b1707
	b1705:
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
	b1707:
	mov rcx, rax
	mov rax, qword [rbp - 10152]
	mov rbx, rax
	mov rax, qword [rbp - 4816]
	mov r14, rax
	mov r13, rcx
	b1708:
	cmp r14, rbx
	jl b1709
	b1710:
	mov rax, r13
	jmp b1711
	b1709:
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
	b1711:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1695:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1631:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1375:
	mov qword [rbp - 6184], rax
	mov rax, qword [rbp - 6528]
	sub rax, 1
	mov qword [rbp - 10400], rax
	mov rax, qword [rbp - 5608]
	mov qword [rbp - 1200], rax
	mov rax, qword [rbp - 11904]
	mov qword [rbp - 10696], rax
	b1712:
	mov rax, qword [rbp - 1200]
	mov rcx, qword [rbp - 10400]
	cmp rax, rcx
	jl b1713
	b1714:
	mov rax, qword [rbp - 10696]
	jmp b1715
	b1713:
	mov rax, qword [rbp - 10400]
	sub rax, 1
	mov qword [rbp - 11200], rax
	mov rax, qword [rbp - 1200]
	mov qword [rbp - 6632], rax
	mov rax, qword [rbp - 10696]
	mov qword [rbp - 1984], rax
	b1716:
	mov rax, qword [rbp - 6632]
	mov rcx, qword [rbp - 11200]
	cmp rax, rcx
	jl b1717
	b1718:
	mov rax, qword [rbp - 1984]
	jmp b1719
	b1717:
	mov rax, qword [rbp - 11200]
	sub rax, 1
	mov qword [rbp - 11136], rax
	mov rax, qword [rbp - 6632]
	mov qword [rbp - 5928], rax
	mov rax, qword [rbp - 1984]
	mov qword [rbp - 8], rax
	b1720:
	mov rax, qword [rbp - 5928]
	mov rcx, qword [rbp - 11136]
	cmp rax, rcx
	jl b1721
	b1722:
	mov rax, qword [rbp - 8]
	jmp b1723
	b1721:
	mov rax, qword [rbp - 11136]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5928]
	mov r15, rax
	mov rax, qword [rbp - 8]
	mov rbx, rax
	b1724:
	cmp r15, r14
	jl b1725
	b1726:
	mov rax, rbx
	jmp b1727
	b1725:
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
	b1727:
	mov qword [rbp - 3760], rax
	mov rax, qword [rbp - 5928]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8]
	mov r15, rax
	mov rax, qword [rbp - 11136]
	mov rbx, rax
	b1728:
	cmp r15, r14
	jl b1729
	b1730:
	mov rax, rbx
	jmp b1731
	b1729:
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
	b1731:
	mov qword [rbp - 7488], rax
	mov rax, qword [rbp - 8]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11136]
	mov r12, rax
	mov rax, qword [rbp - 5928]
	mov rbx, rax
	b1732:
	cmp r12, r15
	jl b1733
	b1734:
	mov rax, rbx
	jmp b1735
	b1733:
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
	b1735:
	mov rcx, rax
	mov rax, qword [rbp - 3760]
	mov r14, rax
	mov rax, qword [rbp - 7488]
	mov r15, rax
	mov rbx, rcx
	b1736:
	cmp r15, r14
	jl b1737
	b1738:
	mov rax, rbx
	jmp b1739
	b1737:
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
	b1739:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1723:
	mov qword [rbp - 3816], rax
	mov rax, qword [rbp - 6632]
	sub rax, 1
	mov qword [rbp - 7816], rax
	mov rax, qword [rbp - 1984]
	mov qword [rbp - 4736], rax
	mov rax, qword [rbp - 11200]
	mov qword [rbp - 12688], rax
	b1740:
	mov rcx, qword [rbp - 4736]
	mov rax, qword [rbp - 7816]
	cmp rcx, rax
	jl b1741
	b1742:
	mov rax, qword [rbp - 12688]
	jmp b1743
	b1741:
	mov rax, qword [rbp - 7816]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4736]
	mov r12, rax
	mov rax, qword [rbp - 12688]
	mov r13, rax
	b1744:
	cmp r12, r14
	jl b1745
	b1746:
	mov rax, r13
	jmp b1747
	b1745:
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
	b1747:
	mov qword [rbp - 7016], rax
	mov rax, qword [rbp - 4736]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12688]
	mov rbx, rax
	mov rax, qword [rbp - 7816]
	mov r15, rax
	b1748:
	cmp rbx, r14
	jl b1749
	b1750:
	mov rax, r15
	jmp b1751
	b1749:
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
	b1751:
	mov qword [rbp - 12088], rax
	mov rax, qword [rbp - 12688]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7816]
	mov r14, rax
	mov rax, qword [rbp - 4736]
	mov r12, rax
	b1752:
	cmp r14, r15
	jl b1753
	b1754:
	mov rax, r12
	jmp b1755
	b1753:
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
	b1755:
	mov rcx, rax
	mov rax, qword [rbp - 7016]
	mov r15, rax
	mov rax, qword [rbp - 12088]
	mov r13, rax
	mov r12, rcx
	b1756:
	cmp r13, r15
	jl b1757
	b1758:
	mov rax, r12
	jmp b1759
	b1757:
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
	b1759:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1743:
	mov qword [rbp - 13296], rax
	mov rax, qword [rbp - 1984]
	sub rax, 1
	mov qword [rbp - 9288], rax
	mov rax, qword [rbp - 11200]
	mov qword [rbp - 9248], rax
	mov rax, qword [rbp - 6632]
	mov qword [rbp - 7096], rax
	b1760:
	mov rcx, qword [rbp - 9248]
	mov rax, qword [rbp - 9288]
	cmp rcx, rax
	jl b1761
	b1762:
	mov rax, qword [rbp - 7096]
	jmp b1763
	b1761:
	mov rax, qword [rbp - 9288]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9248]
	mov r15, rax
	mov rax, qword [rbp - 7096]
	mov r13, rax
	b1764:
	cmp r15, r12
	jl b1765
	b1766:
	mov rax, r13
	jmp b1767
	b1765:
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
	b1767:
	mov qword [rbp - 9112], rax
	mov rax, qword [rbp - 9248]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7096]
	mov rbx, rax
	mov rax, qword [rbp - 9288]
	mov r13, rax
	b1768:
	cmp rbx, r12
	jl b1769
	b1770:
	mov rax, r13
	jmp b1771
	b1769:
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
	b1771:
	mov qword [rbp - 944], rax
	mov rax, qword [rbp - 7096]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9288]
	mov r13, rax
	mov rax, qword [rbp - 9248]
	mov r14, rax
	b1772:
	cmp r13, rbx
	jl b1773
	b1774:
	mov rax, r14
	jmp b1775
	b1773:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b1775:
	mov rcx, rax
	mov rax, qword [rbp - 9112]
	mov r14, rax
	mov rax, qword [rbp - 944]
	mov r12, rax
	mov r13, rcx
	b1776:
	cmp r12, r14
	jl b1777
	b1778:
	mov rax, r13
	jmp b1779
	b1777:
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
	b1779:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1763:
	mov rcx, rax
	mov rax, qword [rbp - 3816]
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 13296]
	mov qword [rbp - 7496], rax
	mov rax, rcx
	mov qword [rbp - 13328], rax
	b1780:
	mov rcx, qword [rbp - 7496]
	mov rax, qword [rbp - 64]
	cmp rcx, rax
	jl b1781
	b1782:
	mov rax, qword [rbp - 13328]
	jmp b1783
	b1781:
	mov rax, qword [rbp - 64]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7496]
	mov r13, rax
	mov rax, qword [rbp - 13328]
	mov rbx, rax
	b1784:
	cmp r13, r15
	jl b1785
	b1786:
	mov rax, rbx
	jmp b1787
	b1785:
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
	b1787:
	mov qword [rbp - 3120], rax
	mov rax, qword [rbp - 7496]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13328]
	mov rbx, rax
	mov rax, qword [rbp - 64]
	mov r15, rax
	b1788:
	cmp rbx, r12
	jl b1789
	b1790:
	mov rax, r15
	jmp b1791
	b1789:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1791:
	mov qword [rbp - 13320], rax
	mov rax, qword [rbp - 13328]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 64]
	mov r12, rax
	mov rax, qword [rbp - 7496]
	mov r15, rax
	b1792:
	cmp r12, r14
	jl b1793
	b1794:
	mov rax, r15
	jmp b1795
	b1793:
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
	b1795:
	mov rcx, qword [rbp - 3120]
	mov rbx, rcx
	mov rcx, qword [rbp - 13320]
	mov r14, rcx
	mov r13, rax
	b1796:
	cmp r14, rbx
	jl b1797
	b1798:
	mov rax, r13
	jmp b1799
	b1797:
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
	b1799:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1783:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1719:
	mov qword [rbp - 3240], rax
	mov rax, qword [rbp - 1200]
	sub rax, 1
	mov qword [rbp - 4256], rax
	mov rax, qword [rbp - 10696]
	mov qword [rbp - 13344], rax
	mov rax, qword [rbp - 10400]
	mov qword [rbp - 12336], rax
	b1800:
	mov rax, qword [rbp - 13344]
	mov rcx, qword [rbp - 4256]
	cmp rax, rcx
	jl b1801
	b1802:
	mov rax, qword [rbp - 12336]
	jmp b1803
	b1801:
	mov rax, qword [rbp - 4256]
	sub rax, 1
	mov qword [rbp - 2944], rax
	mov rax, qword [rbp - 13344]
	mov qword [rbp - 2472], rax
	mov rax, qword [rbp - 12336]
	mov qword [rbp - 2144], rax
	b1804:
	mov rax, qword [rbp - 2472]
	mov rcx, qword [rbp - 2944]
	cmp rax, rcx
	jl b1805
	b1806:
	mov rax, qword [rbp - 2144]
	jmp b1807
	b1805:
	mov rax, qword [rbp - 2944]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2472]
	mov r14, rax
	mov rax, qword [rbp - 2144]
	mov rbx, rax
	b1808:
	cmp r14, r13
	jl b1809
	b1810:
	mov rax, rbx
	jmp b1811
	b1809:
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
	b1811:
	mov qword [rbp - 12504], rax
	mov rax, qword [rbp - 2472]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2144]
	mov rbx, rax
	mov rax, qword [rbp - 2944]
	mov r12, rax
	b1812:
	cmp rbx, r15
	jl b1813
	b1814:
	mov rax, r12
	jmp b1815
	b1813:
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
	b1815:
	mov qword [rbp - 5432], rax
	mov rax, qword [rbp - 2144]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2944]
	mov r15, rax
	mov rax, qword [rbp - 2472]
	mov r12, rax
	b1816:
	cmp r15, r14
	jl b1817
	b1818:
	mov rax, r12
	jmp b1819
	b1817:
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
	b1819:
	mov rcx, rax
	mov rax, qword [rbp - 12504]
	mov r14, rax
	mov rax, qword [rbp - 5432]
	mov r12, rax
	mov r13, rcx
	b1820:
	cmp r12, r14
	jl b1821
	b1822:
	mov rax, r13
	jmp b1823
	b1821:
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
	b1823:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1807:
	mov qword [rbp - 7552], rax
	mov rax, qword [rbp - 13344]
	sub rax, 1
	mov qword [rbp - 7480], rax
	mov rax, qword [rbp - 12336]
	mov qword [rbp - 11896], rax
	mov rax, qword [rbp - 4256]
	mov qword [rbp - 9616], rax
	b1824:
	mov rcx, qword [rbp - 11896]
	mov rax, qword [rbp - 7480]
	cmp rcx, rax
	jl b1825
	b1826:
	mov rax, qword [rbp - 9616]
	jmp b1827
	b1825:
	mov rax, qword [rbp - 7480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11896]
	mov r14, rax
	mov rax, qword [rbp - 9616]
	mov r12, rax
	b1828:
	cmp r14, r15
	jl b1829
	b1830:
	mov rax, r12
	jmp b1831
	b1829:
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
	b1831:
	mov qword [rbp - 952], rax
	mov rax, qword [rbp - 11896]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9616]
	mov r13, rax
	mov rax, qword [rbp - 7480]
	mov r15, rax
	b1832:
	cmp r13, r12
	jl b1833
	b1834:
	mov rax, r15
	jmp b1835
	b1833:
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
	b1835:
	mov qword [rbp - 7184], rax
	mov rax, qword [rbp - 9616]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7480]
	mov r14, rax
	mov rax, qword [rbp - 11896]
	mov r13, rax
	b1836:
	cmp r14, rbx
	jl b1837
	b1838:
	mov rax, r13
	jmp b1839
	b1837:
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
	b1839:
	mov rcx, rax
	mov rax, qword [rbp - 952]
	mov r12, rax
	mov rax, qword [rbp - 7184]
	mov r15, rax
	mov rbx, rcx
	b1840:
	cmp r15, r12
	jl b1841
	b1842:
	mov rax, rbx
	jmp b1843
	b1841:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1843:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1827:
	mov qword [rbp - 2968], rax
	mov rax, qword [rbp - 12336]
	sub rax, 1
	mov qword [rbp - 8512], rax
	mov rax, qword [rbp - 4256]
	mov qword [rbp - 9136], rax
	mov rax, qword [rbp - 13344]
	mov qword [rbp - 3688], rax
	b1844:
	mov rax, qword [rbp - 9136]
	mov rcx, qword [rbp - 8512]
	cmp rax, rcx
	jl b1845
	b1846:
	mov rax, qword [rbp - 3688]
	jmp b1847
	b1845:
	mov rax, qword [rbp - 8512]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9136]
	mov rbx, rax
	mov rax, qword [rbp - 3688]
	mov r13, rax
	b1848:
	cmp rbx, r15
	jl b1849
	b1850:
	mov rax, r13
	jmp b1851
	b1849:
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
	b1851:
	mov qword [rbp - 8040], rax
	mov rax, qword [rbp - 9136]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3688]
	mov r14, rax
	mov rax, qword [rbp - 8512]
	mov r12, rax
	b1852:
	cmp r14, rbx
	jl b1853
	b1854:
	mov rax, r12
	jmp b1855
	b1853:
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
	b1855:
	mov qword [rbp - 3344], rax
	mov rax, qword [rbp - 3688]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8512]
	mov rbx, rax
	mov rax, qword [rbp - 9136]
	mov r14, rax
	b1856:
	cmp rbx, r15
	jl b1857
	b1858:
	mov rax, r14
	jmp b1859
	b1857:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1859:
	mov rcx, rax
	mov rax, qword [rbp - 8040]
	mov r14, rax
	mov rax, qword [rbp - 3344]
	mov rbx, rax
	mov r15, rcx
	b1860:
	cmp rbx, r14
	jl b1861
	b1862:
	mov rax, r15
	jmp b1863
	b1861:
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
	b1863:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1847:
	mov rcx, qword [rbp - 7552]
	mov qword [rbp - 11848], rcx
	mov rcx, qword [rbp - 2968]
	mov qword [rbp - 10176], rcx
	mov qword [rbp - 2336], rax
	b1864:
	mov rcx, qword [rbp - 10176]
	mov rax, qword [rbp - 11848]
	cmp rcx, rax
	jl b1865
	b1866:
	mov rax, qword [rbp - 2336]
	jmp b1867
	b1865:
	mov rax, qword [rbp - 11848]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10176]
	mov r12, rax
	mov rax, qword [rbp - 2336]
	mov r13, rax
	b1868:
	cmp r12, rbx
	jl b1869
	b1870:
	mov rax, r13
	jmp b1871
	b1869:
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
	b1871:
	mov qword [rbp - 3648], rax
	mov rax, qword [rbp - 10176]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2336]
	mov r14, rax
	mov rax, qword [rbp - 11848]
	mov r12, rax
	b1872:
	cmp r14, r15
	jl b1873
	b1874:
	mov rax, r12
	jmp b1875
	b1873:
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
	b1875:
	mov qword [rbp - 4024], rax
	mov rax, qword [rbp - 2336]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11848]
	mov r15, rax
	mov rax, qword [rbp - 10176]
	mov r13, rax
	b1876:
	cmp r15, r14
	jl b1877
	b1878:
	mov rax, r13
	jmp b1879
	b1877:
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
	b1879:
	mov rcx, rax
	mov rax, qword [rbp - 3648]
	mov r15, rax
	mov rax, qword [rbp - 4024]
	mov rbx, rax
	mov r12, rcx
	b1880:
	cmp rbx, r15
	jl b1881
	b1882:
	mov rax, r12
	jmp b1883
	b1881:
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
	b1883:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1867:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1803:
	mov qword [rbp - 3992], rax
	mov rax, qword [rbp - 10696]
	sub rax, 1
	mov qword [rbp - 9192], rax
	mov rax, qword [rbp - 10400]
	mov qword [rbp - 13120], rax
	mov rax, qword [rbp - 1200]
	mov qword [rbp - 512], rax
	b1884:
	mov rax, qword [rbp - 13120]
	mov rcx, qword [rbp - 9192]
	cmp rax, rcx
	jl b1885
	b1886:
	mov rax, qword [rbp - 512]
	jmp b1887
	b1885:
	mov rax, qword [rbp - 9192]
	sub rax, 1
	mov qword [rbp - 8272], rax
	mov rax, qword [rbp - 13120]
	mov qword [rbp - 10280], rax
	mov rax, qword [rbp - 512]
	mov qword [rbp - 2576], rax
	b1888:
	mov rcx, qword [rbp - 10280]
	mov rax, qword [rbp - 8272]
	cmp rcx, rax
	jl b1889
	b1890:
	mov rax, qword [rbp - 2576]
	jmp b1891
	b1889:
	mov rax, qword [rbp - 8272]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10280]
	mov r15, rax
	mov rax, qword [rbp - 2576]
	mov r13, rax
	b1892:
	cmp r15, r12
	jl b1893
	b1894:
	mov rax, r13
	jmp b1895
	b1893:
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
	b1895:
	mov qword [rbp - 6976], rax
	mov rax, qword [rbp - 10280]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2576]
	mov r12, rax
	mov rax, qword [rbp - 8272]
	mov r14, rax
	b1896:
	cmp r12, rbx
	jl b1897
	b1898:
	mov rax, r14
	jmp b1899
	b1897:
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
	b1899:
	mov qword [rbp - 7336], rax
	mov rax, qword [rbp - 2576]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8272]
	mov r12, rax
	mov rax, qword [rbp - 10280]
	mov r15, rax
	b1900:
	cmp r12, r14
	jl b1901
	b1902:
	mov rax, r15
	jmp b1903
	b1901:
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
	b1903:
	mov rcx, rax
	mov rax, qword [rbp - 6976]
	mov r14, rax
	mov rax, qword [rbp - 7336]
	mov r15, rax
	mov r12, rcx
	b1904:
	cmp r15, r14
	jl b1905
	b1906:
	mov rax, r12
	jmp b1907
	b1905:
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
	b1907:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1891:
	mov qword [rbp - 280], rax
	mov rax, qword [rbp - 13120]
	sub rax, 1
	mov qword [rbp - 6312], rax
	mov rax, qword [rbp - 512]
	mov qword [rbp - 1344], rax
	mov rax, qword [rbp - 9192]
	mov qword [rbp - 13264], rax
	b1908:
	mov rcx, qword [rbp - 1344]
	mov rax, qword [rbp - 6312]
	cmp rcx, rax
	jl b1909
	b1910:
	mov rax, qword [rbp - 13264]
	jmp b1911
	b1909:
	mov rax, qword [rbp - 6312]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1344]
	mov r15, rax
	mov rax, qword [rbp - 13264]
	mov r13, rax
	b1912:
	cmp r15, rbx
	jl b1913
	b1914:
	mov rax, r13
	jmp b1915
	b1913:
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
	b1915:
	mov qword [rbp - 6448], rax
	mov rax, qword [rbp - 1344]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13264]
	mov r15, rax
	mov rax, qword [rbp - 6312]
	mov r13, rax
	b1916:
	cmp r15, r12
	jl b1917
	b1918:
	mov rax, r13
	jmp b1919
	b1917:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1919:
	mov qword [rbp - 10760], rax
	mov rax, qword [rbp - 13264]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6312]
	mov r14, rax
	mov rax, qword [rbp - 1344]
	mov r12, rax
	b1920:
	cmp r14, r15
	jl b1921
	b1922:
	mov rax, r12
	jmp b1923
	b1921:
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
	b1923:
	mov rcx, rax
	mov rax, qword [rbp - 6448]
	mov r14, rax
	mov rax, qword [rbp - 10760]
	mov rbx, rax
	mov r12, rcx
	b1924:
	cmp rbx, r14
	jl b1925
	b1926:
	mov rax, r12
	jmp b1927
	b1925:
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
	b1927:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1911:
	mov qword [rbp - 3632], rax
	mov rax, qword [rbp - 512]
	sub rax, 1
	mov qword [rbp - 7560], rax
	mov rax, qword [rbp - 9192]
	mov qword [rbp - 3784], rax
	mov rax, qword [rbp - 13120]
	mov qword [rbp - 11792], rax
	b1928:
	mov rax, qword [rbp - 3784]
	mov rcx, qword [rbp - 7560]
	cmp rax, rcx
	jl b1929
	b1930:
	mov rax, qword [rbp - 11792]
	jmp b1931
	b1929:
	mov rax, qword [rbp - 7560]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3784]
	mov r15, rax
	mov rax, qword [rbp - 11792]
	mov r14, rax
	b1932:
	cmp r15, rbx
	jl b1933
	b1934:
	mov rax, r14
	jmp b1935
	b1933:
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
	b1935:
	mov qword [rbp - 4728], rax
	mov rax, qword [rbp - 3784]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 11792]
	mov rbx, rax
	mov rax, qword [rbp - 7560]
	mov r15, rax
	b1936:
	cmp rbx, r12
	jl b1937
	b1938:
	mov rax, r15
	jmp b1939
	b1937:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1939:
	mov qword [rbp - 8880], rax
	mov rax, qword [rbp - 11792]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7560]
	mov r14, rax
	mov rax, qword [rbp - 3784]
	mov r13, rax
	b1940:
	cmp r14, r12
	jl b1941
	b1942:
	mov rax, r13
	jmp b1943
	b1941:
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
	b1943:
	mov rcx, rax
	mov rax, qword [rbp - 4728]
	mov r14, rax
	mov rax, qword [rbp - 8880]
	mov r15, rax
	mov r13, rcx
	b1944:
	cmp r15, r14
	jl b1945
	b1946:
	mov rax, r13
	jmp b1947
	b1945:
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
	b1947:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1931:
	mov rcx, rax
	mov rax, qword [rbp - 280]
	mov qword [rbp - 11088], rax
	mov rax, qword [rbp - 3632]
	mov qword [rbp - 824], rax
	mov rax, rcx
	mov qword [rbp - 12256], rax
	b1948:
	mov rax, qword [rbp - 824]
	mov rcx, qword [rbp - 11088]
	cmp rax, rcx
	jl b1949
	b1950:
	mov rax, qword [rbp - 12256]
	jmp b1951
	b1949:
	mov rax, qword [rbp - 11088]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 824]
	mov r12, rax
	mov rax, qword [rbp - 12256]
	mov r13, rax
	b1952:
	cmp r12, rbx
	jl b1953
	b1954:
	mov rax, r13
	jmp b1955
	b1953:
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
	b1955:
	mov qword [rbp - 7784], rax
	mov rax, qword [rbp - 824]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12256]
	mov r12, rax
	mov rax, qword [rbp - 11088]
	mov r14, rax
	b1956:
	cmp r12, rbx
	jl b1957
	b1958:
	mov rax, r14
	jmp b1959
	b1957:
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
	b1959:
	mov qword [rbp - 3664], rax
	mov rax, qword [rbp - 12256]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11088]
	mov r12, rax
	mov rax, qword [rbp - 824]
	mov r15, rax
	b1960:
	cmp r12, r14
	jl b1961
	b1962:
	mov rax, r15
	jmp b1963
	b1961:
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
	b1963:
	mov rcx, rax
	mov rax, qword [rbp - 7784]
	mov r14, rax
	mov rax, qword [rbp - 3664]
	mov r13, rax
	mov r15, rcx
	b1964:
	cmp r13, r14
	jl b1965
	b1966:
	mov rax, r15
	jmp b1967
	b1965:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
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
	b1967:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1951:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1887:
	mov rcx, rax
	mov rax, qword [rbp - 3240]
	mov qword [rbp - 1544], rax
	mov rax, qword [rbp - 3992]
	mov qword [rbp - 4376], rax
	mov rax, rcx
	mov qword [rbp - 1776], rax
	b1968:
	mov rcx, qword [rbp - 4376]
	mov rax, qword [rbp - 1544]
	cmp rcx, rax
	jl b1969
	b1970:
	mov rax, qword [rbp - 1776]
	jmp b1971
	b1969:
	mov rax, qword [rbp - 1544]
	sub rax, 1
	mov qword [rbp - 10320], rax
	mov rax, qword [rbp - 4376]
	mov qword [rbp - 11504], rax
	mov rax, qword [rbp - 1776]
	mov qword [rbp - 584], rax
	b1972:
	mov rcx, qword [rbp - 11504]
	mov rax, qword [rbp - 10320]
	cmp rcx, rax
	jl b1973
	b1974:
	mov rax, qword [rbp - 584]
	jmp b1975
	b1973:
	mov rax, qword [rbp - 10320]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11504]
	mov rbx, rax
	mov rax, qword [rbp - 584]
	mov r13, rax
	b1976:
	cmp rbx, r14
	jl b1977
	b1978:
	mov rax, r13
	jmp b1979
	b1977:
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
	b1979:
	mov qword [rbp - 456], rax
	mov rax, qword [rbp - 11504]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 584]
	mov r14, rax
	mov rax, qword [rbp - 10320]
	mov rbx, rax
	b1980:
	cmp r14, r15
	jl b1981
	b1982:
	mov rax, rbx
	jmp b1983
	b1981:
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
	b1983:
	mov qword [rbp - 544], rax
	mov rax, qword [rbp - 584]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10320]
	mov r15, rax
	mov rax, qword [rbp - 11504]
	mov rbx, rax
	b1984:
	cmp r15, r12
	jl b1985
	b1986:
	mov rax, rbx
	jmp b1987
	b1985:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1987:
	mov rcx, rax
	mov rax, qword [rbp - 456]
	mov rbx, rax
	mov rax, qword [rbp - 544]
	mov r15, rax
	mov r13, rcx
	b1988:
	cmp r15, rbx
	jl b1989
	b1990:
	mov rax, r13
	jmp b1991
	b1989:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1991:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1975:
	mov qword [rbp - 2360], rax
	mov rax, qword [rbp - 4376]
	sub rax, 1
	mov qword [rbp - 488], rax
	mov rax, qword [rbp - 1776]
	mov qword [rbp - 8904], rax
	mov rax, qword [rbp - 1544]
	mov qword [rbp - 11592], rax
	b1992:
	mov rax, qword [rbp - 8904]
	mov rcx, qword [rbp - 488]
	cmp rax, rcx
	jl b1993
	b1994:
	mov rax, qword [rbp - 11592]
	jmp b1995
	b1993:
	mov rax, qword [rbp - 488]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8904]
	mov r12, rax
	mov rax, qword [rbp - 11592]
	mov rbx, rax
	b1996:
	cmp r12, r15
	jl b1997
	b1998:
	mov rax, rbx
	jmp b1999
	b1997:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1999:
	mov qword [rbp - 10720], rax
	mov rax, qword [rbp - 8904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11592]
	mov rbx, rax
	mov rax, qword [rbp - 488]
	mov r13, rax
	b2000:
	cmp rbx, r14
	jl b2001
	b2002:
	mov rax, r13
	jmp b2003
	b2001:
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
	b2003:
	mov qword [rbp - 13064], rax
	mov rax, qword [rbp - 11592]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 488]
	mov r14, rax
	mov rax, qword [rbp - 8904]
	mov r12, rax
	b2004:
	cmp r14, rbx
	jl b2005
	b2006:
	mov rax, r12
	jmp b2007
	b2005:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2007:
	mov rcx, rax
	mov rax, qword [rbp - 10720]
	mov r13, rax
	mov rax, qword [rbp - 13064]
	mov r12, rax
	mov r15, rcx
	b2008:
	cmp r12, r13
	jl b2009
	b2010:
	mov rax, r15
	jmp b2011
	b2009:
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
	b2011:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1995:
	mov qword [rbp - 2520], rax
	mov rax, qword [rbp - 1776]
	sub rax, 1
	mov qword [rbp - 13240], rax
	mov rax, qword [rbp - 1544]
	mov qword [rbp - 1016], rax
	mov rax, qword [rbp - 4376]
	mov qword [rbp - 11920], rax
	b2012:
	mov rax, qword [rbp - 1016]
	mov rcx, qword [rbp - 13240]
	cmp rax, rcx
	jl b2013
	b2014:
	mov rax, qword [rbp - 11920]
	jmp b2015
	b2013:
	mov rax, qword [rbp - 13240]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1016]
	mov rbx, rax
	mov rax, qword [rbp - 11920]
	mov r15, rax
	b2016:
	cmp rbx, r13
	jl b2017
	b2018:
	mov rax, r15
	jmp b2019
	b2017:
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
	b2019:
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 1016]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11920]
	mov r14, rax
	mov rax, qword [rbp - 13240]
	mov rbx, rax
	b2020:
	cmp r14, r15
	jl b2021
	b2022:
	mov rax, rbx
	jmp b2023
	b2021:
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
	b2023:
	mov qword [rbp - 10752], rax
	mov rax, qword [rbp - 11920]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13240]
	mov r15, rax
	mov rax, qword [rbp - 1016]
	mov r13, rax
	b2024:
	cmp r15, r12
	jl b2025
	b2026:
	mov rax, r13
	jmp b2027
	b2025:
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
	b2027:
	mov rcx, rax
	mov rax, qword [rbp - 392]
	mov rbx, rax
	mov rax, qword [rbp - 10752]
	mov r15, rax
	mov r13, rcx
	b2028:
	cmp r15, rbx
	jl b2029
	b2030:
	mov rax, r13
	jmp b2031
	b2029:
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
	b2031:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2015:
	mov rcx, rax
	mov rax, qword [rbp - 2360]
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 2520]
	mov qword [rbp - 11416], rax
	mov rax, rcx
	mov qword [rbp - 4192], rax
	b2032:
	mov rcx, qword [rbp - 11416]
	mov rax, qword [rbp - 576]
	cmp rcx, rax
	jl b2033
	b2034:
	mov rax, qword [rbp - 4192]
	jmp b2035
	b2033:
	mov rax, qword [rbp - 576]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11416]
	mov r12, rax
	mov rax, qword [rbp - 4192]
	mov rbx, rax
	b2036:
	cmp r12, r14
	jl b2037
	b2038:
	mov rax, rbx
	jmp b2039
	b2037:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2039:
	mov qword [rbp - 4592], rax
	mov rax, qword [rbp - 11416]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4192]
	mov r15, rax
	mov rax, qword [rbp - 576]
	mov r13, rax
	b2040:
	cmp r15, r12
	jl b2041
	b2042:
	mov rax, r13
	jmp b2043
	b2041:
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
	b2043:
	mov qword [rbp - 8592], rax
	mov rax, qword [rbp - 4192]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 576]
	mov rbx, rax
	mov rax, qword [rbp - 11416]
	mov r13, rax
	b2044:
	cmp rbx, r12
	jl b2045
	b2046:
	mov rax, r13
	jmp b2047
	b2045:
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
	b2047:
	mov rcx, rax
	mov rax, qword [rbp - 4592]
	mov r14, rax
	mov rax, qword [rbp - 8592]
	mov r12, rax
	mov r13, rcx
	b2048:
	cmp r12, r14
	jl b2049
	b2050:
	mov rax, r13
	jmp b2051
	b2049:
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
	b2051:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2035:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1971:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b1715:
	mov qword [rbp - 11944], rax
	mov rax, qword [rbp - 5608]
	sub rax, 1
	mov qword [rbp - 4032], rax
	mov rax, qword [rbp - 11904]
	mov qword [rbp - 5400], rax
	mov rax, qword [rbp - 6528]
	mov qword [rbp - 5048], rax
	b2052:
	mov rcx, qword [rbp - 5400]
	mov rax, qword [rbp - 4032]
	cmp rcx, rax
	jl b2053
	b2054:
	mov rax, qword [rbp - 5048]
	jmp b2055
	b2053:
	mov rax, qword [rbp - 4032]
	sub rax, 1
	mov qword [rbp - 3384], rax
	mov rax, qword [rbp - 5400]
	mov qword [rbp - 12488], rax
	mov rax, qword [rbp - 5048]
	mov qword [rbp - 4360], rax
	b2056:
	mov rcx, qword [rbp - 12488]
	mov rax, qword [rbp - 3384]
	cmp rcx, rax
	jl b2057
	b2058:
	mov rax, qword [rbp - 4360]
	jmp b2059
	b2057:
	mov rax, qword [rbp - 3384]
	sub rax, 1
	mov qword [rbp - 13632], rax
	mov rax, qword [rbp - 12488]
	mov qword [rbp - 640], rax
	mov rax, qword [rbp - 4360]
	mov qword [rbp - 7936], rax
	b2060:
	mov rcx, qword [rbp - 640]
	mov rax, qword [rbp - 13632]
	cmp rcx, rax
	jl b2061
	b2062:
	mov rax, qword [rbp - 7936]
	jmp b2063
	b2061:
	mov rax, qword [rbp - 13632]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 640]
	mov r15, rax
	mov rax, qword [rbp - 7936]
	mov r13, rax
	b2064:
	cmp r15, r14
	jl b2065
	b2066:
	mov rax, r13
	jmp b2067
	b2065:
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
	b2067:
	mov qword [rbp - 416], rax
	mov rax, qword [rbp - 640]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7936]
	mov r15, rax
	mov rax, qword [rbp - 13632]
	mov r12, rax
	b2068:
	cmp r15, r14
	jl b2069
	b2070:
	mov rax, r12
	jmp b2071
	b2069:
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
	b2071:
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 7936]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13632]
	mov rbx, rax
	mov rax, qword [rbp - 640]
	mov r12, rax
	b2072:
	cmp rbx, r15
	jl b2073
	b2074:
	mov rax, r12
	jmp b2075
	b2073:
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
	b2075:
	mov rcx, qword [rbp - 416]
	mov r14, rcx
	mov rcx, qword [rbp - 336]
	mov r12, rcx
	mov r13, rax
	b2076:
	cmp r12, r14
	jl b2077
	b2078:
	mov rax, r13
	jmp b2079
	b2077:
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
	b2079:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2063:
	mov qword [rbp - 4928], rax
	mov rax, qword [rbp - 12488]
	sub rax, 1
	mov qword [rbp - 5848], rax
	mov rax, qword [rbp - 4360]
	mov qword [rbp - 11736], rax
	mov rax, qword [rbp - 3384]
	mov qword [rbp - 2536], rax
	b2080:
	mov rax, qword [rbp - 11736]
	mov rcx, qword [rbp - 5848]
	cmp rax, rcx
	jl b2081
	b2082:
	mov rax, qword [rbp - 2536]
	jmp b2083
	b2081:
	mov rax, qword [rbp - 5848]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11736]
	mov r14, rax
	mov rax, qword [rbp - 2536]
	mov rbx, rax
	b2084:
	cmp r14, r15
	jl b2085
	b2086:
	mov rax, rbx
	jmp b2087
	b2085:
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
	b2087:
	mov qword [rbp - 6128], rax
	mov rax, qword [rbp - 11736]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2536]
	mov r12, rax
	mov rax, qword [rbp - 5848]
	mov r13, rax
	b2088:
	cmp r12, r15
	jl b2089
	b2090:
	mov rax, r13
	jmp b2091
	b2089:
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
	b2091:
	mov qword [rbp - 6176], rax
	mov rax, qword [rbp - 2536]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5848]
	mov r14, rax
	mov rax, qword [rbp - 11736]
	mov r13, rax
	b2092:
	cmp r14, r12
	jl b2093
	b2094:
	mov rax, r13
	jmp b2095
	b2093:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2095:
	mov rcx, qword [rbp - 6128]
	mov rbx, rcx
	mov rcx, qword [rbp - 6176]
	mov r12, rcx
	mov r13, rax
	b2096:
	cmp r12, rbx
	jl b2097
	b2098:
	mov rax, r13
	jmp b2099
	b2097:
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
	b2099:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2083:
	mov qword [rbp - 2112], rax
	mov rax, qword [rbp - 4360]
	sub rax, 1
	mov qword [rbp - 12944], rax
	mov rax, qword [rbp - 3384]
	mov qword [rbp - 4352], rax
	mov rax, qword [rbp - 12488]
	mov qword [rbp - 12544], rax
	b2100:
	mov rcx, qword [rbp - 4352]
	mov rax, qword [rbp - 12944]
	cmp rcx, rax
	jl b2101
	b2102:
	mov rax, qword [rbp - 12544]
	jmp b2103
	b2101:
	mov rax, qword [rbp - 12944]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4352]
	mov rbx, rax
	mov rax, qword [rbp - 12544]
	mov r13, rax
	b2104:
	cmp rbx, r12
	jl b2105
	b2106:
	mov rax, r13
	jmp b2107
	b2105:
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
	b2107:
	mov qword [rbp - 12144], rax
	mov rax, qword [rbp - 4352]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12544]
	mov r14, rax
	mov rax, qword [rbp - 12944]
	mov rbx, rax
	b2108:
	cmp r14, r12
	jl b2109
	b2110:
	mov rax, rbx
	jmp b2111
	b2109:
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
	b2111:
	mov qword [rbp - 12864], rax
	mov rax, qword [rbp - 12544]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12944]
	mov rbx, rax
	mov rax, qword [rbp - 4352]
	mov r13, rax
	b2112:
	cmp rbx, r14
	jl b2113
	b2114:
	mov rax, r13
	jmp b2115
	b2113:
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
	b2115:
	mov rcx, qword [rbp - 12144]
	mov r14, rcx
	mov rcx, qword [rbp - 12864]
	mov r12, rcx
	mov r13, rax
	b2116:
	cmp r12, r14
	jl b2117
	b2118:
	mov rax, r13
	jmp b2119
	b2117:
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
	b2119:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2103:
	mov rcx, rax
	mov rax, qword [rbp - 4928]
	mov qword [rbp - 13592], rax
	mov rax, qword [rbp - 2112]
	mov qword [rbp - 6264], rax
	mov rax, rcx
	mov qword [rbp - 6072], rax
	b2120:
	mov rcx, qword [rbp - 6264]
	mov rax, qword [rbp - 13592]
	cmp rcx, rax
	jl b2121
	b2122:
	mov rax, qword [rbp - 6072]
	jmp b2123
	b2121:
	mov rax, qword [rbp - 13592]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6264]
	mov r13, rax
	mov rax, qword [rbp - 6072]
	mov rbx, rax
	b2124:
	cmp r13, r14
	jl b2125
	b2126:
	mov rax, rbx
	jmp b2127
	b2125:
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
	b2127:
	mov qword [rbp - 5248], rax
	mov rax, qword [rbp - 6264]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6072]
	mov r14, rax
	mov rax, qword [rbp - 13592]
	mov r13, rax
	b2128:
	cmp r14, r15
	jl b2129
	b2130:
	mov rax, r13
	jmp b2131
	b2129:
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
	b2131:
	mov qword [rbp - 10392], rax
	mov rax, qword [rbp - 6072]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13592]
	mov rbx, rax
	mov rax, qword [rbp - 6264]
	mov r15, rax
	b2132:
	cmp rbx, r12
	jl b2133
	b2134:
	mov rax, r15
	jmp b2135
	b2133:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2135:
	mov rcx, rax
	mov rax, qword [rbp - 5248]
	mov rbx, rax
	mov rax, qword [rbp - 10392]
	mov r12, rax
	mov r13, rcx
	b2136:
	cmp r12, rbx
	jl b2137
	b2138:
	mov rax, r13
	jmp b2139
	b2137:
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
	b2139:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2123:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2059:
	mov qword [rbp - 5712], rax
	mov rax, qword [rbp - 5400]
	sub rax, 1
	mov qword [rbp - 6040], rax
	mov rax, qword [rbp - 5048]
	mov qword [rbp - 3112], rax
	mov rax, qword [rbp - 4032]
	mov qword [rbp - 12216], rax
	b2140:
	mov rcx, qword [rbp - 3112]
	mov rax, qword [rbp - 6040]
	cmp rcx, rax
	jl b2141
	b2142:
	mov rax, qword [rbp - 12216]
	jmp b2143
	b2141:
	mov rax, qword [rbp - 6040]
	sub rax, 1
	mov qword [rbp - 11008], rax
	mov rax, qword [rbp - 3112]
	mov qword [rbp - 10520], rax
	mov rax, qword [rbp - 12216]
	mov qword [rbp - 1048], rax
	b2144:
	mov rax, qword [rbp - 10520]
	mov rcx, qword [rbp - 11008]
	cmp rax, rcx
	jl b2145
	b2146:
	mov rax, qword [rbp - 1048]
	jmp b2147
	b2145:
	mov rax, qword [rbp - 11008]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10520]
	mov rbx, rax
	mov rax, qword [rbp - 1048]
	mov r13, rax
	b2148:
	cmp rbx, r14
	jl b2149
	b2150:
	mov rax, r13
	jmp b2151
	b2149:
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
	b2151:
	mov qword [rbp - 5264], rax
	mov rax, qword [rbp - 10520]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1048]
	mov r12, rax
	mov rax, qword [rbp - 11008]
	mov r13, rax
	b2152:
	cmp r12, r15
	jl b2153
	b2154:
	mov rax, r13
	jmp b2155
	b2153:
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
	b2155:
	mov qword [rbp - 9720], rax
	mov rax, qword [rbp - 1048]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11008]
	mov r12, rax
	mov rax, qword [rbp - 10520]
	mov r15, rax
	b2156:
	cmp r12, rbx
	jl b2157
	b2158:
	mov rax, r15
	jmp b2159
	b2157:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b2159:
	mov rcx, qword [rbp - 5264]
	mov rbx, rcx
	mov rcx, qword [rbp - 9720]
	mov r12, rcx
	mov r13, rax
	b2160:
	cmp r12, rbx
	jl b2161
	b2162:
	mov rax, r13
	jmp b2163
	b2161:
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
	b2163:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2147:
	mov qword [rbp - 12032], rax
	mov rax, qword [rbp - 3112]
	sub rax, 1
	mov qword [rbp - 10528], rax
	mov rax, qword [rbp - 12216]
	mov qword [rbp - 1472], rax
	mov rax, qword [rbp - 6040]
	mov qword [rbp - 7392], rax
	b2164:
	mov rcx, qword [rbp - 1472]
	mov rax, qword [rbp - 10528]
	cmp rcx, rax
	jl b2165
	b2166:
	mov rax, qword [rbp - 7392]
	jmp b2167
	b2165:
	mov rax, qword [rbp - 10528]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1472]
	mov rbx, rax
	mov rax, qword [rbp - 7392]
	mov r14, rax
	b2168:
	cmp rbx, r12
	jl b2169
	b2170:
	mov rax, r14
	jmp b2171
	b2169:
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
	b2171:
	mov qword [rbp - 5784], rax
	mov rax, qword [rbp - 1472]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7392]
	mov r12, rax
	mov rax, qword [rbp - 10528]
	mov r13, rax
	b2172:
	cmp r12, r15
	jl b2173
	b2174:
	mov rax, r13
	jmp b2175
	b2173:
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
	b2175:
	mov qword [rbp - 9560], rax
	mov rax, qword [rbp - 7392]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10528]
	mov r15, rax
	mov rax, qword [rbp - 1472]
	mov rbx, rax
	b2176:
	cmp r15, r14
	jl b2177
	b2178:
	mov rax, rbx
	jmp b2179
	b2177:
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
	b2179:
	mov rcx, qword [rbp - 5784]
	mov r15, rcx
	mov rcx, qword [rbp - 9560]
	mov r14, rcx
	mov rbx, rax
	b2180:
	cmp r14, r15
	jl b2181
	b2182:
	mov rax, rbx
	jmp b2183
	b2181:
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
	b2183:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2167:
	mov qword [rbp - 10656], rax
	mov rax, qword [rbp - 12216]
	sub rax, 1
	mov qword [rbp - 11264], rax
	mov rax, qword [rbp - 6040]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 3112]
	mov qword [rbp - 12208], rax
	b2184:
	mov rax, qword [rbp - 112]
	mov rcx, qword [rbp - 11264]
	cmp rax, rcx
	jl b2185
	b2186:
	mov rax, qword [rbp - 12208]
	jmp b2187
	b2185:
	mov rax, qword [rbp - 11264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov r12, rax
	mov rax, qword [rbp - 12208]
	mov r13, rax
	b2188:
	cmp r12, r14
	jl b2189
	b2190:
	mov rax, r13
	jmp b2191
	b2189:
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
	b2191:
	mov qword [rbp - 2208], rax
	mov rax, qword [rbp - 112]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12208]
	mov r15, rax
	mov rax, qword [rbp - 11264]
	mov r12, rax
	b2192:
	cmp r15, rbx
	jl b2193
	b2194:
	mov rax, r12
	jmp b2195
	b2193:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2195:
	mov qword [rbp - 10488], rax
	mov rax, qword [rbp - 12208]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11264]
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov rbx, rax
	b2196:
	cmp r14, r15
	jl b2197
	b2198:
	mov rax, rbx
	jmp b2199
	b2197:
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
	b2199:
	mov rcx, rax
	mov rax, qword [rbp - 2208]
	mov r12, rax
	mov rax, qword [rbp - 10488]
	mov r14, rax
	mov r13, rcx
	b2200:
	cmp r14, r12
	jl b2201
	b2202:
	mov rax, r13
	jmp b2203
	b2201:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2203:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2187:
	mov rcx, rax
	mov rax, qword [rbp - 12032]
	mov qword [rbp - 5672], rax
	mov rax, qword [rbp - 10656]
	mov qword [rbp - 10360], rax
	mov rax, rcx
	mov qword [rbp - 3008], rax
	b2204:
	mov rcx, qword [rbp - 10360]
	mov rax, qword [rbp - 5672]
	cmp rcx, rax
	jl b2205
	b2206:
	mov rax, qword [rbp - 3008]
	jmp b2207
	b2205:
	mov rax, qword [rbp - 5672]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10360]
	mov r14, rax
	mov rax, qword [rbp - 3008]
	mov r15, rax
	b2208:
	cmp r14, rbx
	jl b2209
	b2210:
	mov rax, r15
	jmp b2211
	b2209:
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
	b2211:
	mov qword [rbp - 7672], rax
	mov rax, qword [rbp - 10360]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3008]
	mov r15, rax
	mov rax, qword [rbp - 5672]
	mov r12, rax
	b2212:
	cmp r15, r14
	jl b2213
	b2214:
	mov rax, r12
	jmp b2215
	b2213:
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
	b2215:
	mov qword [rbp - 2752], rax
	mov rax, qword [rbp - 3008]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5672]
	mov r12, rax
	mov rax, qword [rbp - 10360]
	mov rbx, rax
	b2216:
	cmp r12, r15
	jl b2217
	b2218:
	mov rax, rbx
	jmp b2219
	b2217:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2219:
	mov rcx, rax
	mov rax, qword [rbp - 7672]
	mov r15, rax
	mov rax, qword [rbp - 2752]
	mov r14, rax
	mov r13, rcx
	b2220:
	cmp r14, r15
	jl b2221
	b2222:
	mov rax, r13
	jmp b2223
	b2221:
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
	b2223:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2207:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2143:
	mov qword [rbp - 12280], rax
	mov rax, qword [rbp - 5048]
	sub rax, 1
	mov qword [rbp - 2040], rax
	mov rax, qword [rbp - 4032]
	mov qword [rbp - 7616], rax
	mov rax, qword [rbp - 5400]
	mov qword [rbp - 2024], rax
	b2224:
	mov rcx, qword [rbp - 7616]
	mov rax, qword [rbp - 2040]
	cmp rcx, rax
	jl b2225
	b2226:
	mov rax, qword [rbp - 2024]
	jmp b2227
	b2225:
	mov rax, qword [rbp - 2040]
	sub rax, 1
	mov qword [rbp - 5936], rax
	mov rax, qword [rbp - 7616]
	mov qword [rbp - 4496], rax
	mov rax, qword [rbp - 2024]
	mov qword [rbp - 6032], rax
	b2228:
	mov rcx, qword [rbp - 4496]
	mov rax, qword [rbp - 5936]
	cmp rcx, rax
	jl b2229
	b2230:
	mov rax, qword [rbp - 6032]
	jmp b2231
	b2229:
	mov rax, qword [rbp - 5936]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4496]
	mov rbx, rax
	mov rax, qword [rbp - 6032]
	mov r13, rax
	b2232:
	cmp rbx, r12
	jl b2233
	b2234:
	mov rax, r13
	jmp b2235
	b2233:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2235:
	mov qword [rbp - 672], rax
	mov rax, qword [rbp - 4496]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6032]
	mov rbx, rax
	mov rax, qword [rbp - 5936]
	mov r15, rax
	b2236:
	cmp rbx, r14
	jl b2237
	b2238:
	mov rax, r15
	jmp b2239
	b2237:
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
	b2239:
	mov qword [rbp - 8432], rax
	mov rax, qword [rbp - 6032]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5936]
	mov r15, rax
	mov rax, qword [rbp - 4496]
	mov r12, rax
	b2240:
	cmp r15, rbx
	jl b2241
	b2242:
	mov rax, r12
	jmp b2243
	b2241:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2243:
	mov rcx, rax
	mov rax, qword [rbp - 672]
	mov rbx, rax
	mov rax, qword [rbp - 8432]
	mov r14, rax
	mov r12, rcx
	b2244:
	cmp r14, rbx
	jl b2245
	b2246:
	mov rax, r12
	jmp b2247
	b2245:
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
	b2247:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2231:
	mov qword [rbp - 12288], rax
	mov rax, qword [rbp - 7616]
	sub rax, 1
	mov qword [rbp - 4296], rax
	mov rax, qword [rbp - 2024]
	mov qword [rbp - 6160], rax
	mov rax, qword [rbp - 2040]
	mov qword [rbp - 5088], rax
	b2248:
	mov rcx, qword [rbp - 6160]
	mov rax, qword [rbp - 4296]
	cmp rcx, rax
	jl b2249
	b2250:
	mov rax, qword [rbp - 5088]
	jmp b2251
	b2249:
	mov rax, qword [rbp - 4296]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6160]
	mov r15, rax
	mov rax, qword [rbp - 5088]
	mov r13, rax
	b2252:
	cmp r15, rbx
	jl b2253
	b2254:
	mov rax, r13
	jmp b2255
	b2253:
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
	b2255:
	mov qword [rbp - 9080], rax
	mov rax, qword [rbp - 6160]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 5088]
	mov rbx, rax
	mov rax, qword [rbp - 4296]
	mov r14, rax
	b2256:
	cmp rbx, r13
	jl b2257
	b2258:
	mov rax, r14
	jmp b2259
	b2257:
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
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2259:
	mov qword [rbp - 4832], rax
	mov rax, qword [rbp - 5088]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 4296]
	mov r14, rax
	mov rax, qword [rbp - 6160]
	mov r15, rax
	b2260:
	cmp r14, r13
	jl b2261
	b2262:
	mov rax, r15
	jmp b2263
	b2261:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2263:
	mov rcx, rax
	mov rax, qword [rbp - 9080]
	mov r15, rax
	mov rax, qword [rbp - 4832]
	mov r12, rax
	mov r14, rcx
	b2264:
	cmp r12, r15
	jl b2265
	b2266:
	mov rax, r14
	jmp b2267
	b2265:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b2267:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2251:
	mov qword [rbp - 9760], rax
	mov rax, qword [rbp - 2024]
	sub rax, 1
	mov qword [rbp - 9640], rax
	mov rax, qword [rbp - 2040]
	mov qword [rbp - 1448], rax
	mov rax, qword [rbp - 7616]
	mov qword [rbp - 7424], rax
	b2268:
	mov rcx, qword [rbp - 1448]
	mov rax, qword [rbp - 9640]
	cmp rcx, rax
	jl b2269
	b2270:
	mov rax, qword [rbp - 7424]
	jmp b2271
	b2269:
	mov rax, qword [rbp - 9640]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1448]
	mov r14, rax
	mov rax, qword [rbp - 7424]
	mov r13, rax
	b2272:
	cmp r14, r15
	jl b2273
	b2274:
	mov rax, r13
	jmp b2275
	b2273:
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
	b2275:
	mov qword [rbp - 8944], rax
	mov rax, qword [rbp - 1448]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7424]
	mov r13, rax
	mov rax, qword [rbp - 9640]
	mov r14, rax
	b2276:
	cmp r13, r15
	jl b2277
	b2278:
	mov rax, r14
	jmp b2279
	b2277:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2279:
	mov qword [rbp - 10592], rax
	mov rax, qword [rbp - 7424]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9640]
	mov r14, rax
	mov rax, qword [rbp - 1448]
	mov r12, rax
	b2280:
	cmp r14, rbx
	jl b2281
	b2282:
	mov rax, r12
	jmp b2283
	b2281:
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
	b2283:
	mov rcx, rax
	mov rax, qword [rbp - 8944]
	mov rbx, rax
	mov rax, qword [rbp - 10592]
	mov r12, rax
	mov r14, rcx
	b2284:
	cmp r12, rbx
	jl b2285
	b2286:
	mov rax, r14
	jmp b2287
	b2285:
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
	b2287:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2271:
	mov rcx, rax
	mov rax, qword [rbp - 12288]
	mov qword [rbp - 9448], rax
	mov rax, qword [rbp - 9760]
	mov qword [rbp - 5768], rax
	mov rax, rcx
	mov qword [rbp - 11472], rax
	b2288:
	mov rax, qword [rbp - 5768]
	mov rcx, qword [rbp - 9448]
	cmp rax, rcx
	jl b2289
	b2290:
	mov rax, qword [rbp - 11472]
	jmp b2291
	b2289:
	mov rax, qword [rbp - 9448]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5768]
	mov r12, rax
	mov rax, qword [rbp - 11472]
	mov r13, rax
	b2292:
	cmp r12, r15
	jl b2293
	b2294:
	mov rax, r13
	jmp b2295
	b2293:
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
	b2295:
	mov qword [rbp - 888], rax
	mov rax, qword [rbp - 5768]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11472]
	mov r14, rax
	mov rax, qword [rbp - 9448]
	mov r13, rax
	b2296:
	cmp r14, r15
	jl b2297
	b2298:
	mov rax, r13
	jmp b2299
	b2297:
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
	b2299:
	mov qword [rbp - 8520], rax
	mov rax, qword [rbp - 11472]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9448]
	mov r15, rax
	mov rax, qword [rbp - 5768]
	mov r13, rax
	b2300:
	cmp r15, rbx
	jl b2301
	b2302:
	mov rax, r13
	jmp b2303
	b2301:
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
	b2303:
	mov rcx, rax
	mov rax, qword [rbp - 888]
	mov r15, rax
	mov rax, qword [rbp - 8520]
	mov r12, rax
	mov rbx, rcx
	b2304:
	cmp r12, r15
	jl b2305
	b2306:
	mov rax, rbx
	jmp b2307
	b2305:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2307:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2291:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2227:
	mov rcx, qword [rbp - 5712]
	mov qword [rbp - 10960], rcx
	mov rcx, qword [rbp - 12280]
	mov qword [rbp - 11312], rcx
	mov qword [rbp - 2800], rax
	b2308:
	mov rcx, qword [rbp - 11312]
	mov rax, qword [rbp - 10960]
	cmp rcx, rax
	jl b2309
	b2310:
	mov rax, qword [rbp - 2800]
	jmp b2311
	b2309:
	mov rax, qword [rbp - 10960]
	sub rax, 1
	mov qword [rbp - 616], rax
	mov rax, qword [rbp - 11312]
	mov qword [rbp - 7152], rax
	mov rax, qword [rbp - 2800]
	mov qword [rbp - 344], rax
	b2312:
	mov rax, qword [rbp - 7152]
	mov rcx, qword [rbp - 616]
	cmp rax, rcx
	jl b2313
	b2314:
	mov rax, qword [rbp - 344]
	jmp b2315
	b2313:
	mov rax, qword [rbp - 616]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7152]
	mov r14, rax
	mov rax, qword [rbp - 344]
	mov r12, rax
	b2316:
	cmp r14, rbx
	jl b2317
	b2318:
	mov rax, r12
	jmp b2319
	b2317:
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
	b2319:
	mov qword [rbp - 11368], rax
	mov rax, qword [rbp - 7152]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 344]
	mov r14, rax
	mov rax, qword [rbp - 616]
	mov r13, rax
	b2320:
	cmp r14, rbx
	jl b2321
	b2322:
	mov rax, r13
	jmp b2323
	b2321:
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
	b2323:
	mov qword [rbp - 1568], rax
	mov rax, qword [rbp - 344]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 616]
	mov r14, rax
	mov rax, qword [rbp - 7152]
	mov r15, rax
	b2324:
	cmp r14, r12
	jl b2325
	b2326:
	mov rax, r15
	jmp b2327
	b2325:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2327:
	mov rcx, rax
	mov rax, qword [rbp - 11368]
	mov r12, rax
	mov rax, qword [rbp - 1568]
	mov r14, rax
	mov r15, rcx
	b2328:
	cmp r14, r12
	jl b2329
	b2330:
	mov rax, r15
	jmp b2331
	b2329:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2331:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2315:
	mov qword [rbp - 10440], rax
	mov rax, qword [rbp - 11312]
	sub rax, 1
	mov qword [rbp - 2792], rax
	mov rax, qword [rbp - 2800]
	mov qword [rbp - 1264], rax
	mov rax, qword [rbp - 10960]
	mov qword [rbp - 8936], rax
	b2332:
	mov rcx, qword [rbp - 1264]
	mov rax, qword [rbp - 2792]
	cmp rcx, rax
	jl b2333
	b2334:
	mov rax, qword [rbp - 8936]
	jmp b2335
	b2333:
	mov rax, qword [rbp - 2792]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1264]
	mov r14, rax
	mov rax, qword [rbp - 8936]
	mov r13, rax
	b2336:
	cmp r14, r12
	jl b2337
	b2338:
	mov rax, r13
	jmp b2339
	b2337:
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
	b2339:
	mov qword [rbp - 12152], rax
	mov rax, qword [rbp - 1264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8936]
	mov rbx, rax
	mov rax, qword [rbp - 2792]
	mov r12, rax
	b2340:
	cmp rbx, r14
	jl b2341
	b2342:
	mov rax, r12
	jmp b2343
	b2341:
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
	b2343:
	mov qword [rbp - 10224], rax
	mov rax, qword [rbp - 8936]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2792]
	mov r15, rax
	mov rax, qword [rbp - 1264]
	mov r12, rax
	b2344:
	cmp r15, r14
	jl b2345
	b2346:
	mov rax, r12
	jmp b2347
	b2345:
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
	b2347:
	mov rcx, rax
	mov rax, qword [rbp - 12152]
	mov r15, rax
	mov rax, qword [rbp - 10224]
	mov rbx, rax
	mov r13, rcx
	b2348:
	cmp rbx, r15
	jl b2349
	b2350:
	mov rax, r13
	jmp b2351
	b2349:
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
	b2351:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2335:
	mov qword [rbp - 4200], rax
	mov rax, qword [rbp - 2800]
	sub rax, 1
	mov qword [rbp - 5864], rax
	mov rax, qword [rbp - 10960]
	mov qword [rbp - 3744], rax
	mov rax, qword [rbp - 11312]
	mov qword [rbp - 10608], rax
	b2352:
	mov rcx, qword [rbp - 3744]
	mov rax, qword [rbp - 5864]
	cmp rcx, rax
	jl b2353
	b2354:
	mov rax, qword [rbp - 10608]
	jmp b2355
	b2353:
	mov rax, qword [rbp - 5864]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3744]
	mov r12, rax
	mov rax, qword [rbp - 10608]
	mov r14, rax
	b2356:
	cmp r12, rbx
	jl b2357
	b2358:
	mov rax, r14
	jmp b2359
	b2357:
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
	b2359:
	mov qword [rbp - 1768], rax
	mov rax, qword [rbp - 3744]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10608]
	mov r15, rax
	mov rax, qword [rbp - 5864]
	mov r14, rax
	b2360:
	cmp r15, r12
	jl b2361
	b2362:
	mov rax, r14
	jmp b2363
	b2361:
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
	b2363:
	mov qword [rbp - 13472], rax
	mov rax, qword [rbp - 10608]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5864]
	mov r15, rax
	mov rax, qword [rbp - 3744]
	mov r14, rax
	b2364:
	cmp r15, rbx
	jl b2365
	b2366:
	mov rax, r14
	jmp b2367
	b2365:
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
	b2367:
	mov rcx, rax
	mov rax, qword [rbp - 1768]
	mov r15, rax
	mov rax, qword [rbp - 13472]
	mov r14, rax
	mov r13, rcx
	b2368:
	cmp r14, r15
	jl b2369
	b2370:
	mov rax, r13
	jmp b2371
	b2369:
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
	b2371:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2355:
	mov rcx, rax
	mov rax, qword [rbp - 10440]
	mov qword [rbp - 11744], rax
	mov rax, qword [rbp - 4200]
	mov qword [rbp - 592], rax
	mov rax, rcx
	mov qword [rbp - 6104], rax
	b2372:
	mov rax, qword [rbp - 592]
	mov rcx, qword [rbp - 11744]
	cmp rax, rcx
	jl b2373
	b2374:
	mov rax, qword [rbp - 6104]
	jmp b2375
	b2373:
	mov rax, qword [rbp - 11744]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 592]
	mov r14, rax
	mov rax, qword [rbp - 6104]
	mov r12, rax
	b2376:
	cmp r14, r15
	jl b2377
	b2378:
	mov rax, r12
	jmp b2379
	b2377:
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
	b2379:
	mov qword [rbp - 9200], rax
	mov rax, qword [rbp - 592]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6104]
	mov r15, rax
	mov rax, qword [rbp - 11744]
	mov r12, rax
	b2380:
	cmp r15, r14
	jl b2381
	b2382:
	mov rax, r12
	jmp b2383
	b2381:
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
	b2383:
	mov qword [rbp - 12232], rax
	mov rax, qword [rbp - 6104]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11744]
	mov r15, rax
	mov rax, qword [rbp - 592]
	mov r12, rax
	b2384:
	cmp r15, rbx
	jl b2385
	b2386:
	mov rax, r12
	jmp b2387
	b2385:
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
	b2387:
	mov rcx, rax
	mov rax, qword [rbp - 9200]
	mov r12, rax
	mov rax, qword [rbp - 12232]
	mov r15, rax
	mov r13, rcx
	b2388:
	cmp r15, r12
	jl b2389
	b2390:
	mov rax, r13
	jmp b2391
	b2389:
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
	b2391:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2375:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2311:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2055:
	mov rcx, rax
	mov rax, qword [rbp - 6184]
	mov qword [rbp - 12680], rax
	mov rax, qword [rbp - 11944]
	mov qword [rbp - 1968], rax
	mov rax, rcx
	mov qword [rbp - 8008], rax
	b2392:
	mov rax, qword [rbp - 1968]
	mov rcx, qword [rbp - 12680]
	cmp rax, rcx
	jl b2393
	b2394:
	mov rax, qword [rbp - 8008]
	jmp b2395
	b2393:
	mov rax, qword [rbp - 12680]
	sub rax, 1
	mov qword [rbp - 12800], rax
	mov rax, qword [rbp - 1968]
	mov qword [rbp - 5592], rax
	mov rax, qword [rbp - 8008]
	mov qword [rbp - 10920], rax
	b2396:
	mov rcx, qword [rbp - 5592]
	mov rax, qword [rbp - 12800]
	cmp rcx, rax
	jl b2397
	b2398:
	mov rax, qword [rbp - 10920]
	jmp b2399
	b2397:
	mov rax, qword [rbp - 12800]
	sub rax, 1
	mov qword [rbp - 6784], rax
	mov rax, qword [rbp - 5592]
	mov qword [rbp - 1608], rax
	mov rax, qword [rbp - 10920]
	mov qword [rbp - 2056], rax
	b2400:
	mov rax, qword [rbp - 1608]
	mov rcx, qword [rbp - 6784]
	cmp rax, rcx
	jl b2401
	b2402:
	mov rax, qword [rbp - 2056]
	jmp b2403
	b2401:
	mov rax, qword [rbp - 6784]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1608]
	mov r13, rax
	mov rax, qword [rbp - 2056]
	mov rbx, rax
	b2404:
	cmp r13, r12
	jl b2405
	b2406:
	mov rax, rbx
	jmp b2407
	b2405:
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
	b2407:
	mov qword [rbp - 6952], rax
	mov rax, qword [rbp - 1608]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2056]
	mov r14, rax
	mov rax, qword [rbp - 6784]
	mov rbx, rax
	b2408:
	cmp r14, r12
	jl b2409
	b2410:
	mov rax, rbx
	jmp b2411
	b2409:
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
	b2411:
	mov qword [rbp - 12840], rax
	mov rax, qword [rbp - 2056]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6784]
	mov r13, rax
	mov rax, qword [rbp - 1608]
	mov rbx, rax
	b2412:
	cmp r13, r15
	jl b2413
	b2414:
	mov rax, rbx
	jmp b2415
	b2413:
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
	b2415:
	mov rcx, rax
	mov rax, qword [rbp - 6952]
	mov r14, rax
	mov rax, qword [rbp - 12840]
	mov rbx, rax
	mov r13, rcx
	b2416:
	cmp rbx, r14
	jl b2417
	b2418:
	mov rax, r13
	jmp b2419
	b2417:
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
	b2419:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2403:
	mov qword [rbp - 6144], rax
	mov rax, qword [rbp - 5592]
	sub rax, 1
	mov qword [rbp - 7200], rax
	mov rax, qword [rbp - 10920]
	mov qword [rbp - 2856], rax
	mov rax, qword [rbp - 12800]
	mov qword [rbp - 128], rax
	b2420:
	mov rax, qword [rbp - 2856]
	mov rcx, qword [rbp - 7200]
	cmp rax, rcx
	jl b2421
	b2422:
	mov rax, qword [rbp - 128]
	jmp b2423
	b2421:
	mov rax, qword [rbp - 7200]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2856]
	mov r14, rax
	mov rax, qword [rbp - 128]
	mov r12, rax
	b2424:
	cmp r14, r15
	jl b2425
	b2426:
	mov rax, r12
	jmp b2427
	b2425:
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
	b2427:
	mov qword [rbp - 8704], rax
	mov rax, qword [rbp - 2856]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 128]
	mov r14, rax
	mov rax, qword [rbp - 7200]
	mov r13, rax
	b2428:
	cmp r14, r12
	jl b2429
	b2430:
	mov rax, r13
	jmp b2431
	b2429:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2431:
	mov qword [rbp - 600], rax
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7200]
	mov r14, rax
	mov rax, qword [rbp - 2856]
	mov r12, rax
	b2432:
	cmp r14, r15
	jl b2433
	b2434:
	mov rax, r12
	jmp b2435
	b2433:
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
	b2435:
	mov rcx, rax
	mov rax, qword [rbp - 8704]
	mov r14, rax
	mov rax, qword [rbp - 600]
	mov r15, rax
	mov r13, rcx
	b2436:
	cmp r15, r14
	jl b2437
	b2438:
	mov rax, r13
	jmp b2439
	b2437:
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
	b2439:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2423:
	mov qword [rbp - 3216], rax
	mov rax, qword [rbp - 10920]
	sub rax, 1
	mov qword [rbp - 10456], rax
	mov rax, qword [rbp - 12800]
	mov qword [rbp - 11520], rax
	mov rax, qword [rbp - 5592]
	mov qword [rbp - 5568], rax
	b2440:
	mov rcx, qword [rbp - 11520]
	mov rax, qword [rbp - 10456]
	cmp rcx, rax
	jl b2441
	b2442:
	mov rax, qword [rbp - 5568]
	jmp b2443
	b2441:
	mov rax, qword [rbp - 10456]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11520]
	mov r12, rax
	mov rax, qword [rbp - 5568]
	mov r13, rax
	b2444:
	cmp r12, r15
	jl b2445
	b2446:
	mov rax, r13
	jmp b2447
	b2445:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2447:
	mov qword [rbp - 7128], rax
	mov rax, qword [rbp - 11520]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5568]
	mov r14, rax
	mov rax, qword [rbp - 10456]
	mov r12, rax
	b2448:
	cmp r14, rbx
	jl b2449
	b2450:
	mov rax, r12
	jmp b2451
	b2449:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2451:
	mov qword [rbp - 9880], rax
	mov rax, qword [rbp - 5568]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10456]
	mov rbx, rax
	mov rax, qword [rbp - 11520]
	mov r13, rax
	b2452:
	cmp rbx, r12
	jl b2453
	b2454:
	mov rax, r13
	jmp b2455
	b2453:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2455:
	mov rcx, rax
	mov rax, qword [rbp - 7128]
	mov rbx, rax
	mov rax, qword [rbp - 9880]
	mov r12, rax
	mov r13, rcx
	b2456:
	cmp r12, rbx
	jl b2457
	b2458:
	mov rax, r13
	jmp b2459
	b2457:
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
	b2459:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2443:
	mov rcx, rax
	mov rax, qword [rbp - 6144]
	mov qword [rbp - 8752], rax
	mov rax, qword [rbp - 3216]
	mov qword [rbp - 1304], rax
	mov rax, rcx
	mov qword [rbp - 8984], rax
	b2460:
	mov rcx, qword [rbp - 1304]
	mov rax, qword [rbp - 8752]
	cmp rcx, rax
	jl b2461
	b2462:
	mov rax, qword [rbp - 8984]
	jmp b2463
	b2461:
	mov rax, qword [rbp - 8752]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1304]
	mov r13, rax
	mov rax, qword [rbp - 8984]
	mov r12, rax
	b2464:
	cmp r13, r15
	jl b2465
	b2466:
	mov rax, r12
	jmp b2467
	b2465:
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
	b2467:
	mov qword [rbp - 4416], rax
	mov rax, qword [rbp - 1304]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8984]
	mov r15, rax
	mov rax, qword [rbp - 8752]
	mov r13, rax
	b2468:
	cmp r15, rbx
	jl b2469
	b2470:
	mov rax, r13
	jmp b2471
	b2469:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2471:
	mov qword [rbp - 3416], rax
	mov rax, qword [rbp - 8984]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8752]
	mov r14, rax
	mov rax, qword [rbp - 1304]
	mov r13, rax
	b2472:
	cmp r14, r15
	jl b2473
	b2474:
	mov rax, r13
	jmp b2475
	b2473:
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
	b2475:
	mov rcx, rax
	mov rax, qword [rbp - 4416]
	mov rbx, rax
	mov rax, qword [rbp - 3416]
	mov r15, rax
	mov r13, rcx
	b2476:
	cmp r15, rbx
	jl b2477
	b2478:
	mov rax, r13
	jmp b2479
	b2477:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2479:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2463:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2399:
	mov qword [rbp - 7416], rax
	mov rax, qword [rbp - 1968]
	sub rax, 1
	mov qword [rbp - 8912], rax
	mov rax, qword [rbp - 8008]
	mov qword [rbp - 1240], rax
	mov rax, qword [rbp - 12680]
	mov qword [rbp - 1160], rax
	b2480:
	mov rax, qword [rbp - 1240]
	mov rcx, qword [rbp - 8912]
	cmp rax, rcx
	jl b2481
	b2482:
	mov rax, qword [rbp - 1160]
	jmp b2483
	b2481:
	mov rax, qword [rbp - 8912]
	sub rax, 1
	mov qword [rbp - 6080], rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 7904], rax
	mov rax, qword [rbp - 1160]
	mov qword [rbp - 9768], rax
	b2484:
	mov rax, qword [rbp - 7904]
	mov rcx, qword [rbp - 6080]
	cmp rax, rcx
	jl b2485
	b2486:
	mov rax, qword [rbp - 9768]
	jmp b2487
	b2485:
	mov rax, qword [rbp - 6080]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7904]
	mov r15, rax
	mov rax, qword [rbp - 9768]
	mov r12, rax
	b2488:
	cmp r15, rbx
	jl b2489
	b2490:
	mov rax, r12
	jmp b2491
	b2489:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2491:
	mov qword [rbp - 4488], rax
	mov rax, qword [rbp - 7904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9768]
	mov r12, rax
	mov rax, qword [rbp - 6080]
	mov r15, rax
	b2492:
	cmp r12, r14
	jl b2493
	b2494:
	mov rax, r15
	jmp b2495
	b2493:
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
	b2495:
	mov qword [rbp - 3736], rax
	mov rax, qword [rbp - 9768]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6080]
	mov r12, rax
	mov rax, qword [rbp - 7904]
	mov r15, rax
	b2496:
	cmp r12, rbx
	jl b2497
	b2498:
	mov rax, r15
	jmp b2499
	b2497:
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
	b2499:
	mov rcx, qword [rbp - 4488]
	mov rbx, rcx
	mov rcx, qword [rbp - 3736]
	mov r12, rcx
	mov r13, rax
	b2500:
	cmp r12, rbx
	jl b2501
	b2502:
	mov rax, r13
	jmp b2503
	b2501:
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
	b2503:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2487:
	mov qword [rbp - 5456], rax
	mov rax, qword [rbp - 1240]
	sub rax, 1
	mov qword [rbp - 9744], rax
	mov rax, qword [rbp - 1160]
	mov qword [rbp - 3096], rax
	mov rax, qword [rbp - 8912]
	mov qword [rbp - 12992], rax
	b2504:
	mov rcx, qword [rbp - 3096]
	mov rax, qword [rbp - 9744]
	cmp rcx, rax
	jl b2505
	b2506:
	mov rax, qword [rbp - 12992]
	jmp b2507
	b2505:
	mov rax, qword [rbp - 9744]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3096]
	mov r14, rax
	mov rax, qword [rbp - 12992]
	mov r12, rax
	b2508:
	cmp r14, r15
	jl b2509
	b2510:
	mov rax, r12
	jmp b2511
	b2509:
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
	b2511:
	mov qword [rbp - 3424], rax
	mov rax, qword [rbp - 3096]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12992]
	mov rbx, rax
	mov rax, qword [rbp - 9744]
	mov r13, rax
	b2512:
	cmp rbx, r15
	jl b2513
	b2514:
	mov rax, r13
	jmp b2515
	b2513:
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
	b2515:
	mov qword [rbp - 5176], rax
	mov rax, qword [rbp - 12992]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9744]
	mov r12, rax
	mov rax, qword [rbp - 3096]
	mov rbx, rax
	b2516:
	cmp r12, r14
	jl b2517
	b2518:
	mov rax, rbx
	jmp b2519
	b2517:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2519:
	mov rcx, qword [rbp - 3424]
	mov r14, rcx
	mov rcx, qword [rbp - 5176]
	mov r15, rcx
	mov r12, rax
	b2520:
	cmp r15, r14
	jl b2521
	b2522:
	mov rax, r12
	jmp b2523
	b2521:
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
	b2523:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2507:
	mov qword [rbp - 1992], rax
	mov rax, qword [rbp - 1160]
	sub rax, 1
	mov qword [rbp - 792], rax
	mov rax, qword [rbp - 8912]
	mov qword [rbp - 8600], rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 1696], rax
	b2524:
	mov rax, qword [rbp - 8600]
	mov rcx, qword [rbp - 792]
	cmp rax, rcx
	jl b2525
	b2526:
	mov rax, qword [rbp - 1696]
	jmp b2527
	b2525:
	mov rax, qword [rbp - 792]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8600]
	mov r14, rax
	mov rax, qword [rbp - 1696]
	mov r13, rax
	b2528:
	cmp r14, rbx
	jl b2529
	b2530:
	mov rax, r13
	jmp b2531
	b2529:
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
	b2531:
	mov qword [rbp - 9752], rax
	mov rax, qword [rbp - 8600]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1696]
	mov r14, rax
	mov rax, qword [rbp - 792]
	mov rbx, rax
	b2532:
	cmp r14, r12
	jl b2533
	b2534:
	mov rax, rbx
	jmp b2535
	b2533:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2535:
	mov qword [rbp - 2992], rax
	mov rax, qword [rbp - 1696]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 792]
	mov r14, rax
	mov rax, qword [rbp - 8600]
	mov r15, rax
	b2536:
	cmp r14, rbx
	jl b2537
	b2538:
	mov rax, r15
	jmp b2539
	b2537:
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
	b2539:
	mov rcx, rax
	mov rax, qword [rbp - 9752]
	mov r15, rax
	mov rax, qword [rbp - 2992]
	mov rbx, rax
	mov r14, rcx
	b2540:
	cmp rbx, r15
	jl b2541
	b2542:
	mov rax, r14
	jmp b2543
	b2541:
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
	b2543:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2527:
	mov rcx, rax
	mov rax, qword [rbp - 5456]
	mov qword [rbp - 2200], rax
	mov rax, qword [rbp - 1992]
	mov qword [rbp - 7528], rax
	mov rax, rcx
	mov qword [rbp - 9208], rax
	b2544:
	mov rax, qword [rbp - 7528]
	mov rcx, qword [rbp - 2200]
	cmp rax, rcx
	jl b2545
	b2546:
	mov rax, qword [rbp - 9208]
	jmp b2547
	b2545:
	mov rax, qword [rbp - 2200]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7528]
	mov r14, rax
	mov rax, qword [rbp - 9208]
	mov rbx, rax
	b2548:
	cmp r14, r15
	jl b2549
	b2550:
	mov rax, rbx
	jmp b2551
	b2549:
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
	b2551:
	mov qword [rbp - 6000], rax
	mov rax, qword [rbp - 7528]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9208]
	mov r14, rax
	mov rax, qword [rbp - 2200]
	mov r15, rax
	b2552:
	cmp r14, rbx
	jl b2553
	b2554:
	mov rax, r15
	jmp b2555
	b2553:
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
	b2555:
	mov qword [rbp - 13520], rax
	mov rax, qword [rbp - 9208]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2200]
	mov r13, rax
	mov rax, qword [rbp - 7528]
	mov r15, rax
	b2556:
	cmp r13, r12
	jl b2557
	b2558:
	mov rax, r15
	jmp b2559
	b2557:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2559:
	mov rcx, rax
	mov rax, qword [rbp - 6000]
	mov rbx, rax
	mov rax, qword [rbp - 13520]
	mov r12, rax
	mov r14, rcx
	b2560:
	cmp r12, rbx
	jl b2561
	b2562:
	mov rax, r14
	jmp b2563
	b2561:
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
	b2563:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2547:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2483:
	mov qword [rbp - 5000], rax
	mov rax, qword [rbp - 8008]
	sub rax, 1
	mov qword [rbp - 4168], rax
	mov rax, qword [rbp - 12680]
	mov qword [rbp - 2296], rax
	mov rax, qword [rbp - 1968]
	mov qword [rbp - 4688], rax
	b2564:
	mov rax, qword [rbp - 2296]
	mov rcx, qword [rbp - 4168]
	cmp rax, rcx
	jl b2565
	b2566:
	mov rax, qword [rbp - 4688]
	jmp b2567
	b2565:
	mov rax, qword [rbp - 4168]
	sub rax, 1
	mov qword [rbp - 9776], rax
	mov rax, qword [rbp - 2296]
	mov qword [rbp - 3000], rax
	mov rax, qword [rbp - 4688]
	mov qword [rbp - 8800], rax
	b2568:
	mov rax, qword [rbp - 3000]
	mov rcx, qword [rbp - 9776]
	cmp rax, rcx
	jl b2569
	b2570:
	mov rax, qword [rbp - 8800]
	jmp b2571
	b2569:
	mov rax, qword [rbp - 9776]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3000]
	mov rbx, rax
	mov rax, qword [rbp - 8800]
	mov r13, rax
	b2572:
	cmp rbx, r12
	jl b2573
	b2574:
	mov rax, r13
	jmp b2575
	b2573:
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
	b2575:
	mov qword [rbp - 3832], rax
	mov rax, qword [rbp - 3000]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8800]
	mov r15, rax
	mov rax, qword [rbp - 9776]
	mov r13, rax
	b2576:
	cmp r15, r14
	jl b2577
	b2578:
	mov rax, r13
	jmp b2579
	b2577:
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
	b2579:
	mov qword [rbp - 1576], rax
	mov rax, qword [rbp - 8800]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9776]
	mov r12, rax
	mov rax, qword [rbp - 3000]
	mov r14, rax
	b2580:
	cmp r12, rbx
	jl b2581
	b2582:
	mov rax, r14
	jmp b2583
	b2581:
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
	b2583:
	mov rcx, rax
	mov rax, qword [rbp - 3832]
	mov rbx, rax
	mov rax, qword [rbp - 1576]
	mov r13, rax
	mov r15, rcx
	b2584:
	cmp r13, rbx
	jl b2585
	b2586:
	mov rax, r15
	jmp b2587
	b2585:
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
	b2587:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2571:
	mov qword [rbp - 6024], rax
	mov rax, qword [rbp - 2296]
	sub rax, 1
	mov qword [rbp - 5032], rax
	mov rax, qword [rbp - 4688]
	mov qword [rbp - 10056], rax
	mov rax, qword [rbp - 4168]
	mov qword [rbp - 11160], rax
	b2588:
	mov rcx, qword [rbp - 10056]
	mov rax, qword [rbp - 5032]
	cmp rcx, rax
	jl b2589
	b2590:
	mov rax, qword [rbp - 11160]
	jmp b2591
	b2589:
	mov rax, qword [rbp - 5032]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10056]
	mov rbx, rax
	mov rax, qword [rbp - 11160]
	mov r15, rax
	b2592:
	cmp rbx, r14
	jl b2593
	b2594:
	mov rax, r15
	jmp b2595
	b2593:
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
	b2595:
	mov qword [rbp - 4104], rax
	mov rax, qword [rbp - 10056]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11160]
	mov r15, rax
	mov rax, qword [rbp - 5032]
	mov rbx, rax
	b2596:
	cmp r15, r14
	jl b2597
	b2598:
	mov rax, rbx
	jmp b2599
	b2597:
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
	b2599:
	mov qword [rbp - 4224], rax
	mov rax, qword [rbp - 11160]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5032]
	mov r14, rax
	mov rax, qword [rbp - 10056]
	mov r15, rax
	b2600:
	cmp r14, rbx
	jl b2601
	b2602:
	mov rax, r15
	jmp b2603
	b2601:
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
	b2603:
	mov rcx, qword [rbp - 4104]
	mov r14, rcx
	mov rcx, qword [rbp - 4224]
	mov r15, rcx
	mov rbx, rax
	b2604:
	cmp r15, r14
	jl b2605
	b2606:
	mov rax, rbx
	jmp b2607
	b2605:
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
	b2607:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2591:
	mov qword [rbp - 360], rax
	mov rax, qword [rbp - 4688]
	sub rax, 1
	mov qword [rbp - 8416], rax
	mov rax, qword [rbp - 4168]
	mov qword [rbp - 6064], rax
	mov rax, qword [rbp - 2296]
	mov qword [rbp - 3728], rax
	b2608:
	mov rcx, qword [rbp - 6064]
	mov rax, qword [rbp - 8416]
	cmp rcx, rax
	jl b2609
	b2610:
	mov rax, qword [rbp - 3728]
	jmp b2611
	b2609:
	mov rax, qword [rbp - 8416]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 6064]
	mov r15, rax
	mov rax, qword [rbp - 3728]
	mov rbx, rax
	b2612:
	cmp r15, r13
	jl b2613
	b2614:
	mov rax, rbx
	jmp b2615
	b2613:
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
	b2615:
	mov qword [rbp - 8848], rax
	mov rax, qword [rbp - 6064]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3728]
	mov r15, rax
	mov rax, qword [rbp - 8416]
	mov rbx, rax
	b2616:
	cmp r15, r12
	jl b2617
	b2618:
	mov rax, rbx
	jmp b2619
	b2617:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2619:
	mov qword [rbp - 4096], rax
	mov rax, qword [rbp - 3728]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8416]
	mov r14, rax
	mov rax, qword [rbp - 6064]
	mov r13, rax
	b2620:
	cmp r14, r12
	jl b2621
	b2622:
	mov rax, r13
	jmp b2623
	b2621:
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
	b2623:
	mov rcx, rax
	mov rax, qword [rbp - 8848]
	mov r15, rax
	mov rax, qword [rbp - 4096]
	mov r14, rax
	mov rbx, rcx
	b2624:
	cmp r14, r15
	jl b2625
	b2626:
	mov rax, rbx
	jmp b2627
	b2625:
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
	b2627:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2611:
	mov rcx, rax
	mov rax, qword [rbp - 6024]
	mov qword [rbp - 5600], rax
	mov rax, qword [rbp - 360]
	mov qword [rbp - 2808], rax
	mov rax, rcx
	mov qword [rbp - 2912], rax
	b2628:
	mov rcx, qword [rbp - 2808]
	mov rax, qword [rbp - 5600]
	cmp rcx, rax
	jl b2629
	b2630:
	mov rax, qword [rbp - 2912]
	jmp b2631
	b2629:
	mov rax, qword [rbp - 5600]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2808]
	mov r14, rax
	mov rax, qword [rbp - 2912]
	mov r12, rax
	b2632:
	cmp r14, rbx
	jl b2633
	b2634:
	mov rax, r12
	jmp b2635
	b2633:
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
	b2635:
	mov qword [rbp - 3456], rax
	mov rax, qword [rbp - 2808]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2912]
	mov r14, rax
	mov rax, qword [rbp - 5600]
	mov r15, rax
	b2636:
	cmp r14, rbx
	jl b2637
	b2638:
	mov rax, r15
	jmp b2639
	b2637:
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
	b2639:
	mov qword [rbp - 12872], rax
	mov rax, qword [rbp - 2912]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5600]
	mov r15, rax
	mov rax, qword [rbp - 2808]
	mov r12, rax
	b2640:
	cmp r15, r14
	jl b2641
	b2642:
	mov rax, r12
	jmp b2643
	b2641:
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
	b2643:
	mov rcx, rax
	mov rax, qword [rbp - 3456]
	mov r15, rax
	mov rax, qword [rbp - 12872]
	mov rbx, rax
	mov r13, rcx
	b2644:
	cmp rbx, r15
	jl b2645
	b2646:
	mov rax, r13
	jmp b2647
	b2645:
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
	b2647:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2631:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2567:
	mov rcx, qword [rbp - 7416]
	mov qword [rbp - 10272], rcx
	mov rcx, qword [rbp - 5000]
	mov qword [rbp - 11408], rcx
	mov qword [rbp - 1128], rax
	b2648:
	mov rcx, qword [rbp - 11408]
	mov rax, qword [rbp - 10272]
	cmp rcx, rax
	jl b2649
	b2650:
	mov rax, qword [rbp - 1128]
	jmp b2651
	b2649:
	mov rax, qword [rbp - 10272]
	sub rax, 1
	mov qword [rbp - 10992], rax
	mov rax, qword [rbp - 11408]
	mov qword [rbp - 7504], rax
	mov rax, qword [rbp - 1128]
	mov qword [rbp - 5872], rax
	b2652:
	mov rax, qword [rbp - 7504]
	mov rcx, qword [rbp - 10992]
	cmp rax, rcx
	jl b2653
	b2654:
	mov rax, qword [rbp - 5872]
	jmp b2655
	b2653:
	mov rax, qword [rbp - 10992]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7504]
	mov r14, rax
	mov rax, qword [rbp - 5872]
	mov r13, rax
	b2656:
	cmp r14, rbx
	jl b2657
	b2658:
	mov rax, r13
	jmp b2659
	b2657:
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
	b2659:
	mov qword [rbp - 6744], rax
	mov rax, qword [rbp - 7504]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5872]
	mov r12, rax
	mov rax, qword [rbp - 10992]
	mov r13, rax
	b2660:
	cmp r12, rbx
	jl b2661
	b2662:
	mov rax, r13
	jmp b2663
	b2661:
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
	b2663:
	mov qword [rbp - 1208], rax
	mov rax, qword [rbp - 5872]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10992]
	mov r12, rax
	mov rax, qword [rbp - 7504]
	mov rbx, rax
	b2664:
	cmp r12, r14
	jl b2665
	b2666:
	mov rax, rbx
	jmp b2667
	b2665:
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
	b2667:
	mov rcx, qword [rbp - 6744]
	mov r15, rcx
	mov rcx, qword [rbp - 1208]
	mov r14, rcx
	mov r12, rax
	b2668:
	cmp r14, r15
	jl b2669
	b2670:
	mov rax, r12
	jmp b2671
	b2669:
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
	b2671:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2655:
	mov qword [rbp - 8992], rax
	mov rax, qword [rbp - 11408]
	sub rax, 1
	mov qword [rbp - 12512], rax
	mov rax, qword [rbp - 1128]
	mov qword [rbp - 1312], rax
	mov rax, qword [rbp - 10272]
	mov qword [rbp - 2704], rax
	b2672:
	mov rax, qword [rbp - 1312]
	mov rcx, qword [rbp - 12512]
	cmp rax, rcx
	jl b2673
	b2674:
	mov rax, qword [rbp - 2704]
	jmp b2675
	b2673:
	mov rax, qword [rbp - 12512]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1312]
	mov r13, rax
	mov rax, qword [rbp - 2704]
	mov r12, rax
	b2676:
	cmp r13, r15
	jl b2677
	b2678:
	mov rax, r12
	jmp b2679
	b2677:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2679:
	mov qword [rbp - 12608], rax
	mov rax, qword [rbp - 1312]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2704]
	mov rbx, rax
	mov rax, qword [rbp - 12512]
	mov r13, rax
	b2680:
	cmp rbx, r15
	jl b2681
	b2682:
	mov rax, r13
	jmp b2683
	b2681:
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
	b2683:
	mov qword [rbp - 1096], rax
	mov rax, qword [rbp - 2704]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12512]
	mov rbx, rax
	mov rax, qword [rbp - 1312]
	mov r14, rax
	b2684:
	cmp rbx, r15
	jl b2685
	b2686:
	mov rax, r14
	jmp b2687
	b2685:
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
	b2687:
	mov rcx, rax
	mov rax, qword [rbp - 12608]
	mov r14, rax
	mov rax, qword [rbp - 1096]
	mov r12, rax
	mov rbx, rcx
	b2688:
	cmp r12, r14
	jl b2689
	b2690:
	mov rax, rbx
	jmp b2691
	b2689:
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
	b2691:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2675:
	mov qword [rbp - 11576], rax
	mov rax, qword [rbp - 1128]
	sub rax, 1
	mov qword [rbp - 1624], rax
	mov rax, qword [rbp - 10272]
	mov qword [rbp - 13616], rax
	mov rax, qword [rbp - 11408]
	mov qword [rbp - 9312], rax
	b2692:
	mov rax, qword [rbp - 13616]
	mov rcx, qword [rbp - 1624]
	cmp rax, rcx
	jl b2693
	b2694:
	mov rax, qword [rbp - 9312]
	jmp b2695
	b2693:
	mov rax, qword [rbp - 1624]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13616]
	mov r15, rax
	mov rax, qword [rbp - 9312]
	mov rbx, rax
	b2696:
	cmp r15, r14
	jl b2697
	b2698:
	mov rax, rbx
	jmp b2699
	b2697:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2699:
	mov qword [rbp - 7256], rax
	mov rax, qword [rbp - 13616]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9312]
	mov r15, rax
	mov rax, qword [rbp - 1624]
	mov r14, rax
	b2700:
	cmp r15, rbx
	jl b2701
	b2702:
	mov rax, r14
	jmp b2703
	b2701:
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
	b2703:
	mov qword [rbp - 7400], rax
	mov rax, qword [rbp - 9312]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1624]
	mov r15, rax
	mov rax, qword [rbp - 13616]
	mov r14, rax
	b2704:
	cmp r15, rbx
	jl b2705
	b2706:
	mov rax, r14
	jmp b2707
	b2705:
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
	b2707:
	mov rcx, rax
	mov rax, qword [rbp - 7256]
	mov r15, rax
	mov rax, qword [rbp - 7400]
	mov rbx, rax
	mov r12, rcx
	b2708:
	cmp rbx, r15
	jl b2709
	b2710:
	mov rax, r12
	jmp b2711
	b2709:
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
	b2711:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2695:
	mov rcx, qword [rbp - 8992]
	mov qword [rbp - 4904], rcx
	mov rcx, qword [rbp - 11576]
	mov qword [rbp - 3352], rcx
	mov qword [rbp - 11616], rax
	b2712:
	mov rcx, qword [rbp - 3352]
	mov rax, qword [rbp - 4904]
	cmp rcx, rax
	jl b2713
	b2714:
	mov rax, qword [rbp - 11616]
	jmp b2715
	b2713:
	mov rax, qword [rbp - 4904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3352]
	mov rbx, rax
	mov rax, qword [rbp - 11616]
	mov r15, rax
	b2716:
	cmp rbx, r14
	jl b2717
	b2718:
	mov rax, r15
	jmp b2719
	b2717:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2719:
	mov qword [rbp - 10432], rax
	mov rax, qword [rbp - 3352]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11616]
	mov r15, rax
	mov rax, qword [rbp - 4904]
	mov r13, rax
	b2720:
	cmp r15, rbx
	jl b2721
	b2722:
	mov rax, r13
	jmp b2723
	b2721:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2723:
	mov qword [rbp - 2240], rax
	mov rax, qword [rbp - 11616]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4904]
	mov r14, rax
	mov rax, qword [rbp - 3352]
	mov r12, rax
	b2724:
	cmp r14, r15
	jl b2725
	b2726:
	mov rax, r12
	jmp b2727
	b2725:
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
	b2727:
	mov rcx, rax
	mov rax, qword [rbp - 10432]
	mov r15, rax
	mov rax, qword [rbp - 2240]
	mov r13, rax
	mov rbx, rcx
	b2728:
	cmp r13, r15
	jl b2729
	b2730:
	mov rax, rbx
	jmp b2731
	b2729:
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
	b2731:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2715:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2651:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2395:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b1371:
	mov qword [rbp - 9320], rax
	mov rax, qword [rbp - 13184]
	sub rax, 1
	mov qword [rbp - 12496], rax
	mov rax, qword [rbp - 9272]
	mov qword [rbp - 13424], rax
	mov rax, qword [rbp - 8144]
	mov qword [rbp - 12304], rax
	b2732:
	mov rcx, qword [rbp - 13424]
	mov rax, qword [rbp - 12496]
	cmp rcx, rax
	jl b2733
	b2734:
	mov rax, qword [rbp - 12304]
	jmp b2735
	b2733:
	mov rax, qword [rbp - 12496]
	sub rax, 1
	mov qword [rbp - 3280], rax
	mov rax, qword [rbp - 13424]
	mov qword [rbp - 3768], rax
	mov rax, qword [rbp - 12304]
	mov qword [rbp - 7984], rax
	b2736:
	mov rax, qword [rbp - 3768]
	mov rcx, qword [rbp - 3280]
	cmp rax, rcx
	jl b2737
	b2738:
	mov rax, qword [rbp - 7984]
	jmp b2739
	b2737:
	mov rax, qword [rbp - 3280]
	sub rax, 1
	mov qword [rbp - 1552], rax
	mov rax, qword [rbp - 3768]
	mov qword [rbp - 13104], rax
	mov rax, qword [rbp - 7984]
	mov qword [rbp - 12416], rax
	b2740:
	mov rax, qword [rbp - 13104]
	mov rcx, qword [rbp - 1552]
	cmp rax, rcx
	jl b2741
	b2742:
	mov rax, qword [rbp - 12416]
	jmp b2743
	b2741:
	mov rax, qword [rbp - 1552]
	sub rax, 1
	mov qword [rbp - 3496], rax
	mov rax, qword [rbp - 13104]
	mov qword [rbp - 4432], rax
	mov rax, qword [rbp - 12416]
	mov qword [rbp - 2272], rax
	b2744:
	mov rax, qword [rbp - 4432]
	mov rcx, qword [rbp - 3496]
	cmp rax, rcx
	jl b2745
	b2746:
	mov rax, qword [rbp - 2272]
	jmp b2747
	b2745:
	mov rax, qword [rbp - 3496]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 4432]
	mov rbx, rax
	mov rax, qword [rbp - 2272]
	mov r15, rax
	b2748:
	cmp rbx, r13
	jl b2749
	b2750:
	mov rax, r15
	jmp b2751
	b2749:
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
	b2751:
	mov qword [rbp - 4000], rax
	mov rax, qword [rbp - 4432]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2272]
	mov r15, rax
	mov rax, qword [rbp - 3496]
	mov r13, rax
	b2752:
	cmp r15, r14
	jl b2753
	b2754:
	mov rax, r13
	jmp b2755
	b2753:
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
	b2755:
	mov qword [rbp - 2640], rax
	mov rax, qword [rbp - 2272]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3496]
	mov rbx, rax
	mov rax, qword [rbp - 4432]
	mov r13, rax
	b2756:
	cmp rbx, r14
	jl b2757
	b2758:
	mov rax, r13
	jmp b2759
	b2757:
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
	b2759:
	mov rcx, qword [rbp - 4000]
	mov r14, rcx
	mov rcx, qword [rbp - 2640]
	mov r12, rcx
	mov r15, rax
	b2760:
	cmp r12, r14
	jl b2761
	b2762:
	mov rax, r15
	jmp b2763
	b2761:
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
	b2763:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2747:
	mov qword [rbp - 9592], rax
	mov rax, qword [rbp - 13104]
	sub rax, 1
	mov qword [rbp - 3056], rax
	mov rax, qword [rbp - 12416]
	mov qword [rbp - 11072], rax
	mov rax, qword [rbp - 1552]
	mov qword [rbp - 984], rax
	b2764:
	mov rcx, qword [rbp - 11072]
	mov rax, qword [rbp - 3056]
	cmp rcx, rax
	jl b2765
	b2766:
	mov rax, qword [rbp - 984]
	jmp b2767
	b2765:
	mov rax, qword [rbp - 3056]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11072]
	mov r13, rax
	mov rax, qword [rbp - 984]
	mov r15, rax
	b2768:
	cmp r13, rbx
	jl b2769
	b2770:
	mov rax, r15
	jmp b2771
	b2769:
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
	b2771:
	mov qword [rbp - 12560], rax
	mov rax, qword [rbp - 11072]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 984]
	mov rbx, rax
	mov rax, qword [rbp - 3056]
	mov r15, rax
	b2772:
	cmp rbx, r12
	jl b2773
	b2774:
	mov rax, r15
	jmp b2775
	b2773:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2775:
	mov qword [rbp - 12160], rax
	mov rax, qword [rbp - 984]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3056]
	mov r15, rax
	mov rax, qword [rbp - 11072]
	mov r14, rax
	b2776:
	cmp r15, rbx
	jl b2777
	b2778:
	mov rax, r14
	jmp b2779
	b2777:
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
	b2779:
	mov rcx, rax
	mov rax, qword [rbp - 12560]
	mov r14, rax
	mov rax, qword [rbp - 12160]
	mov r12, rax
	mov r15, rcx
	b2780:
	cmp r12, r14
	jl b2781
	b2782:
	mov rax, r15
	jmp b2783
	b2781:
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
	b2783:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2767:
	mov qword [rbp - 12440], rax
	mov rax, qword [rbp - 12416]
	sub rax, 1
	mov qword [rbp - 11752], rax
	mov rax, qword [rbp - 1552]
	mov qword [rbp - 12584], rax
	mov rax, qword [rbp - 13104]
	mov qword [rbp - 11880], rax
	b2784:
	mov rax, qword [rbp - 12584]
	mov rcx, qword [rbp - 11752]
	cmp rax, rcx
	jl b2785
	b2786:
	mov rax, qword [rbp - 11880]
	jmp b2787
	b2785:
	mov rax, qword [rbp - 11752]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12584]
	mov rbx, rax
	mov rax, qword [rbp - 11880]
	mov r14, rax
	b2788:
	cmp rbx, r12
	jl b2789
	b2790:
	mov rax, r14
	jmp b2791
	b2789:
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
	b2791:
	mov qword [rbp - 12904], rax
	mov rax, qword [rbp - 12584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11880]
	mov r15, rax
	mov rax, qword [rbp - 11752]
	mov rbx, rax
	b2792:
	cmp r15, r14
	jl b2793
	b2794:
	mov rax, rbx
	jmp b2795
	b2793:
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
	b2795:
	mov qword [rbp - 6720], rax
	mov rax, qword [rbp - 11880]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11752]
	mov r12, rax
	mov rax, qword [rbp - 12584]
	mov r13, rax
	b2796:
	cmp r12, r14
	jl b2797
	b2798:
	mov rax, r13
	jmp b2799
	b2797:
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
	b2799:
	mov rcx, rax
	mov rax, qword [rbp - 12904]
	mov r15, rax
	mov rax, qword [rbp - 6720]
	mov r12, rax
	mov r13, rcx
	b2800:
	cmp r12, r15
	jl b2801
	b2802:
	mov rax, r13
	jmp b2803
	b2801:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2803:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2787:
	mov rcx, rax
	mov rax, qword [rbp - 9592]
	mov qword [rbp - 12448], rax
	mov rax, qword [rbp - 12440]
	mov qword [rbp - 11664], rax
	mov rax, rcx
	mov qword [rbp - 1688], rax
	b2804:
	mov rax, qword [rbp - 11664]
	mov rcx, qword [rbp - 12448]
	cmp rax, rcx
	jl b2805
	b2806:
	mov rax, qword [rbp - 1688]
	jmp b2807
	b2805:
	mov rax, qword [rbp - 12448]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11664]
	mov r12, rax
	mov rax, qword [rbp - 1688]
	mov r14, rax
	b2808:
	cmp r12, rbx
	jl b2809
	b2810:
	mov rax, r14
	jmp b2811
	b2809:
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
	b2811:
	mov qword [rbp - 2352], rax
	mov rax, qword [rbp - 11664]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1688]
	mov r13, rax
	mov rax, qword [rbp - 12448]
	mov r12, rax
	b2812:
	cmp r13, r14
	jl b2813
	b2814:
	mov rax, r12
	jmp b2815
	b2813:
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
	b2815:
	mov qword [rbp - 11784], rax
	mov rax, qword [rbp - 1688]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12448]
	mov r12, rax
	mov rax, qword [rbp - 11664]
	mov rbx, rax
	b2816:
	cmp r12, r15
	jl b2817
	b2818:
	mov rax, rbx
	jmp b2819
	b2817:
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
	b2819:
	mov rcx, rax
	mov rax, qword [rbp - 2352]
	mov r15, rax
	mov rax, qword [rbp - 11784]
	mov r14, rax
	mov r12, rcx
	b2820:
	cmp r14, r15
	jl b2821
	b2822:
	mov rax, r12
	jmp b2823
	b2821:
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
	b2823:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2807:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2743:
	mov qword [rbp - 3904], rax
	mov rax, qword [rbp - 3768]
	sub rax, 1
	mov qword [rbp - 1224], rax
	mov rax, qword [rbp - 7984]
	mov qword [rbp - 13256], rax
	mov rax, qword [rbp - 3280]
	mov qword [rbp - 2344], rax
	b2824:
	mov rcx, qword [rbp - 13256]
	mov rax, qword [rbp - 1224]
	cmp rcx, rax
	jl b2825
	b2826:
	mov rax, qword [rbp - 2344]
	jmp b2827
	b2825:
	mov rax, qword [rbp - 1224]
	sub rax, 1
	mov qword [rbp - 13480], rax
	mov rax, qword [rbp - 13256]
	mov qword [rbp - 608], rax
	mov rax, qword [rbp - 2344]
	mov qword [rbp - 11384], rax
	b2828:
	mov rax, qword [rbp - 608]
	mov rcx, qword [rbp - 13480]
	cmp rax, rcx
	jl b2829
	b2830:
	mov rax, qword [rbp - 11384]
	jmp b2831
	b2829:
	mov rax, qword [rbp - 13480]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 608]
	mov r15, rax
	mov rax, qword [rbp - 11384]
	mov r13, rax
	b2832:
	cmp r15, rbx
	jl b2833
	b2834:
	mov rax, r13
	jmp b2835
	b2833:
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
	b2835:
	mov qword [rbp - 4128], rax
	mov rax, qword [rbp - 608]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11384]
	mov r15, rax
	mov rax, qword [rbp - 13480]
	mov r13, rax
	b2836:
	cmp r15, rbx
	jl b2837
	b2838:
	mov rax, r13
	jmp b2839
	b2837:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2839:
	mov qword [rbp - 10896], rax
	mov rax, qword [rbp - 11384]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13480]
	mov r12, rax
	mov rax, qword [rbp - 608]
	mov r13, rax
	b2840:
	cmp r12, r14
	jl b2841
	b2842:
	mov rax, r13
	jmp b2843
	b2841:
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
	b2843:
	mov rcx, qword [rbp - 4128]
	mov r12, rcx
	mov rcx, qword [rbp - 10896]
	mov r13, rcx
	mov r15, rax
	b2844:
	cmp r13, r12
	jl b2845
	b2846:
	mov rax, r15
	jmp b2847
	b2845:
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
	b2847:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2831:
	mov qword [rbp - 1216], rax
	mov rax, qword [rbp - 13256]
	sub rax, 1
	mov qword [rbp - 9960], rax
	mov rax, qword [rbp - 2344]
	mov qword [rbp - 7736], rax
	mov rax, qword [rbp - 1224]
	mov qword [rbp - 9064], rax
	b2848:
	mov rcx, qword [rbp - 7736]
	mov rax, qword [rbp - 9960]
	cmp rcx, rax
	jl b2849
	b2850:
	mov rax, qword [rbp - 9064]
	jmp b2851
	b2849:
	mov rax, qword [rbp - 9960]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7736]
	mov r15, rax
	mov rax, qword [rbp - 9064]
	mov rbx, rax
	b2852:
	cmp r15, r14
	jl b2853
	b2854:
	mov rax, rbx
	jmp b2855
	b2853:
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
	b2855:
	mov qword [rbp - 1336], rax
	mov rax, qword [rbp - 7736]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9064]
	mov r15, rax
	mov rax, qword [rbp - 9960]
	mov rbx, rax
	b2856:
	cmp r15, r14
	jl b2857
	b2858:
	mov rax, rbx
	jmp b2859
	b2857:
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
	b2859:
	mov qword [rbp - 9696], rax
	mov rax, qword [rbp - 9064]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9960]
	mov r15, rax
	mov rax, qword [rbp - 7736]
	mov r13, rax
	b2860:
	cmp r15, rbx
	jl b2861
	b2862:
	mov rax, r13
	jmp b2863
	b2861:
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
	b2863:
	mov rcx, rax
	mov rax, qword [rbp - 1336]
	mov r14, rax
	mov rax, qword [rbp - 9696]
	mov r12, rax
	mov rbx, rcx
	b2864:
	cmp r12, r14
	jl b2865
	b2866:
	mov rax, rbx
	jmp b2867
	b2865:
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
	b2867:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2851:
	mov qword [rbp - 8440], rax
	mov rax, qword [rbp - 2344]
	sub rax, 1
	mov qword [rbp - 1136], rax
	mov rax, qword [rbp - 1224]
	mov qword [rbp - 2728], rax
	mov rax, qword [rbp - 13256]
	mov qword [rbp - 5912], rax
	b2868:
	mov rax, qword [rbp - 2728]
	mov rcx, qword [rbp - 1136]
	cmp rax, rcx
	jl b2869
	b2870:
	mov rax, qword [rbp - 5912]
	jmp b2871
	b2869:
	mov rax, qword [rbp - 1136]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2728]
	mov r15, rax
	mov rax, qword [rbp - 5912]
	mov r13, rax
	b2872:
	cmp r15, r14
	jl b2873
	b2874:
	mov rax, r13
	jmp b2875
	b2873:
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
	b2875:
	mov qword [rbp - 7776], rax
	mov rax, qword [rbp - 2728]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5912]
	mov r12, rax
	mov rax, qword [rbp - 1136]
	mov r15, rax
	b2876:
	cmp r12, rbx
	jl b2877
	b2878:
	mov rax, r15
	jmp b2879
	b2877:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b2879:
	mov qword [rbp - 992], rax
	mov rax, qword [rbp - 5912]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1136]
	mov r12, rax
	mov rax, qword [rbp - 2728]
	mov r13, rax
	b2880:
	cmp r12, rbx
	jl b2881
	b2882:
	mov rax, r13
	jmp b2883
	b2881:
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
	b2883:
	mov rcx, rax
	mov rax, qword [rbp - 7776]
	mov r14, rax
	mov rax, qword [rbp - 992]
	mov r12, rax
	mov rbx, rcx
	b2884:
	cmp r12, r14
	jl b2885
	b2886:
	mov rax, rbx
	jmp b2887
	b2885:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2887:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2871:
	mov rcx, qword [rbp - 1216]
	mov qword [rbp - 10768], rcx
	mov rcx, qword [rbp - 8440]
	mov qword [rbp - 8488], rcx
	mov qword [rbp - 10336], rax
	b2888:
	mov rcx, qword [rbp - 8488]
	mov rax, qword [rbp - 10768]
	cmp rcx, rax
	jl b2889
	b2890:
	mov rax, qword [rbp - 10336]
	jmp b2891
	b2889:
	mov rax, qword [rbp - 10768]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8488]
	mov r13, rax
	mov rax, qword [rbp - 10336]
	mov rbx, rax
	b2892:
	cmp r13, r12
	jl b2893
	b2894:
	mov rax, rbx
	jmp b2895
	b2893:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2895:
	mov qword [rbp - 1704], rax
	mov rax, qword [rbp - 8488]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10336]
	mov r14, rax
	mov rax, qword [rbp - 10768]
	mov r13, rax
	b2896:
	cmp r14, r15
	jl b2897
	b2898:
	mov rax, r13
	jmp b2899
	b2897:
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
	b2899:
	mov qword [rbp - 10864], rax
	mov rax, qword [rbp - 10336]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10768]
	mov r14, rax
	mov rax, qword [rbp - 8488]
	mov r13, rax
	b2900:
	cmp r14, r15
	jl b2901
	b2902:
	mov rax, r13
	jmp b2903
	b2901:
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
	b2903:
	mov rcx, rax
	mov rax, qword [rbp - 1704]
	mov r14, rax
	mov rax, qword [rbp - 10864]
	mov r13, rax
	mov r15, rcx
	b2904:
	cmp r13, r14
	jl b2905
	b2906:
	mov rax, r15
	jmp b2907
	b2905:
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
	b2907:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2891:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2827:
	mov qword [rbp - 3192], rax
	mov rax, qword [rbp - 7984]
	sub rax, 1
	mov qword [rbp - 12776], rax
	mov rax, qword [rbp - 3280]
	mov qword [rbp - 9392], rax
	mov rax, qword [rbp - 3768]
	mov qword [rbp - 9472], rax
	b2908:
	mov rcx, qword [rbp - 9392]
	mov rax, qword [rbp - 12776]
	cmp rcx, rax
	jl b2909
	b2910:
	mov rax, qword [rbp - 9472]
	jmp b2911
	b2909:
	mov rax, qword [rbp - 12776]
	sub rax, 1
	mov qword [rbp - 3544], rax
	mov rax, qword [rbp - 9392]
	mov qword [rbp - 9600], rax
	mov rax, qword [rbp - 9472]
	mov qword [rbp - 10912], rax
	b2912:
	mov rcx, qword [rbp - 9600]
	mov rax, qword [rbp - 3544]
	cmp rcx, rax
	jl b2913
	b2914:
	mov rax, qword [rbp - 10912]
	jmp b2915
	b2913:
	mov rax, qword [rbp - 3544]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9600]
	mov r12, rax
	mov rax, qword [rbp - 10912]
	mov r15, rax
	b2916:
	cmp r12, rbx
	jl b2917
	b2918:
	mov rax, r15
	jmp b2919
	b2917:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2919:
	mov qword [rbp - 12168], rax
	mov rax, qword [rbp - 9600]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10912]
	mov r12, rax
	mov rax, qword [rbp - 3544]
	mov r13, rax
	b2920:
	cmp r12, rbx
	jl b2921
	b2922:
	mov rax, r13
	jmp b2923
	b2921:
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
	b2923:
	mov qword [rbp - 11336], rax
	mov rax, qword [rbp - 10912]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3544]
	mov r14, rax
	mov rax, qword [rbp - 9600]
	mov r12, rax
	b2924:
	cmp r14, r15
	jl b2925
	b2926:
	mov rax, r12
	jmp b2927
	b2925:
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
	b2927:
	mov rcx, qword [rbp - 12168]
	mov rbx, rcx
	mov rcx, qword [rbp - 11336]
	mov r14, rcx
	mov r15, rax
	b2928:
	cmp r14, rbx
	jl b2929
	b2930:
	mov rax, r15
	jmp b2931
	b2929:
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
	b2931:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2915:
	mov qword [rbp - 5968], rax
	mov rax, qword [rbp - 9392]
	sub rax, 1
	mov qword [rbp - 7832], rax
	mov rax, qword [rbp - 9472]
	mov qword [rbp - 13192], rax
	mov rax, qword [rbp - 12776]
	mov qword [rbp - 1488], rax
	b2932:
	mov rax, qword [rbp - 13192]
	mov rcx, qword [rbp - 7832]
	cmp rax, rcx
	jl b2933
	b2934:
	mov rax, qword [rbp - 1488]
	jmp b2935
	b2933:
	mov rax, qword [rbp - 7832]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13192]
	mov r14, rax
	mov rax, qword [rbp - 1488]
	mov r13, rax
	b2936:
	cmp r14, r15
	jl b2937
	b2938:
	mov rax, r13
	jmp b2939
	b2937:
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
	b2939:
	mov qword [rbp - 7160], rax
	mov rax, qword [rbp - 13192]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1488]
	mov r12, rax
	mov rax, qword [rbp - 7832]
	mov r14, rax
	b2940:
	cmp r12, r15
	jl b2941
	b2942:
	mov rax, r14
	jmp b2943
	b2941:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b2943:
	mov qword [rbp - 9936], rax
	mov rax, qword [rbp - 1488]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7832]
	mov r12, rax
	mov rax, qword [rbp - 13192]
	mov r13, rax
	b2944:
	cmp r12, r15
	jl b2945
	b2946:
	mov rax, r13
	jmp b2947
	b2945:
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
	b2947:
	mov rcx, rax
	mov rax, qword [rbp - 7160]
	mov r14, rax
	mov rax, qword [rbp - 9936]
	mov r15, rax
	mov r12, rcx
	b2948:
	cmp r15, r14
	jl b2949
	b2950:
	mov rax, r12
	jmp b2951
	b2949:
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
	b2951:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2935:
	mov qword [rbp - 9088], rax
	mov rax, qword [rbp - 9472]
	sub rax, 1
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 12776]
	mov qword [rbp - 2504], rax
	mov rax, qword [rbp - 9392]
	mov qword [rbp - 432], rax
	b2952:
	mov rax, qword [rbp - 2504]
	mov rcx, qword [rbp - 376]
	cmp rax, rcx
	jl b2953
	b2954:
	mov rax, qword [rbp - 432]
	jmp b2955
	b2953:
	mov rax, qword [rbp - 376]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2504]
	mov r15, rax
	mov rax, qword [rbp - 432]
	mov r13, rax
	b2956:
	cmp r15, r14
	jl b2957
	b2958:
	mov rax, r13
	jmp b2959
	b2957:
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
	b2959:
	mov qword [rbp - 2552], rax
	mov rax, qword [rbp - 2504]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 432]
	mov r14, rax
	mov rax, qword [rbp - 376]
	mov rbx, rax
	b2960:
	cmp r14, r12
	jl b2961
	b2962:
	mov rax, rbx
	jmp b2963
	b2961:
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
	b2963:
	mov qword [rbp - 9920], rax
	mov rax, qword [rbp - 432]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 376]
	mov r14, rax
	mov rax, qword [rbp - 2504]
	mov r12, rax
	b2964:
	cmp r14, rbx
	jl b2965
	b2966:
	mov rax, r12
	jmp b2967
	b2965:
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
	b2967:
	mov rcx, qword [rbp - 2552]
	mov r14, rcx
	mov rcx, qword [rbp - 9920]
	mov r12, rcx
	mov rbx, rax
	b2968:
	cmp r12, r14
	jl b2969
	b2970:
	mov rax, rbx
	jmp b2971
	b2969:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2971:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2955:
	mov rcx, rax
	mov rax, qword [rbp - 5968]
	mov qword [rbp - 5120], rax
	mov rax, qword [rbp - 9088]
	mov qword [rbp - 13024], rax
	mov rax, rcx
	mov qword [rbp - 10512], rax
	b2972:
	mov rcx, qword [rbp - 13024]
	mov rax, qword [rbp - 5120]
	cmp rcx, rax
	jl b2973
	b2974:
	mov rax, qword [rbp - 10512]
	jmp b2975
	b2973:
	mov rax, qword [rbp - 5120]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13024]
	mov r12, rax
	mov rax, qword [rbp - 10512]
	mov r13, rax
	b2976:
	cmp r12, r15
	jl b2977
	b2978:
	mov rax, r13
	jmp b2979
	b2977:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2979:
	mov qword [rbp - 11608], rax
	mov rax, qword [rbp - 13024]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10512]
	mov r15, rax
	mov rax, qword [rbp - 5120]
	mov r13, rax
	b2980:
	cmp r15, r14
	jl b2981
	b2982:
	mov rax, r13
	jmp b2983
	b2981:
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
	b2983:
	mov qword [rbp - 8504], rax
	mov rax, qword [rbp - 10512]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5120]
	mov r12, rax
	mov rax, qword [rbp - 13024]
	mov r14, rax
	b2984:
	cmp r12, r15
	jl b2985
	b2986:
	mov rax, r14
	jmp b2987
	b2985:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b2987:
	mov rcx, rax
	mov rax, qword [rbp - 11608]
	mov r12, rax
	mov rax, qword [rbp - 8504]
	mov rbx, rax
	mov r15, rcx
	b2988:
	cmp rbx, r12
	jl b2989
	b2990:
	mov rax, r15
	jmp b2991
	b2989:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2991:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2975:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2911:
	mov rcx, qword [rbp - 3904]
	mov qword [rbp - 12784], rcx
	mov rcx, qword [rbp - 3192]
	mov qword [rbp - 6752], rcx
	mov qword [rbp - 4080], rax
	b2992:
	mov rcx, qword [rbp - 6752]
	mov rax, qword [rbp - 12784]
	cmp rcx, rax
	jl b2993
	b2994:
	mov rax, qword [rbp - 4080]
	jmp b2995
	b2993:
	mov rax, qword [rbp - 12784]
	sub rax, 1
	mov qword [rbp - 1872], rax
	mov rax, qword [rbp - 6752]
	mov qword [rbp - 9152], rax
	mov rax, qword [rbp - 4080]
	mov qword [rbp - 6840], rax
	b2996:
	mov rcx, qword [rbp - 9152]
	mov rax, qword [rbp - 1872]
	cmp rcx, rax
	jl b2997
	b2998:
	mov rax, qword [rbp - 6840]
	jmp b2999
	b2997:
	mov rax, qword [rbp - 1872]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9152]
	mov r15, rax
	mov rax, qword [rbp - 6840]
	mov rbx, rax
	b3000:
	cmp r15, r14
	jl b3001
	b3002:
	mov rax, rbx
	jmp b3003
	b3001:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3003:
	mov qword [rbp - 4512], rax
	mov rax, qword [rbp - 9152]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6840]
	mov rbx, rax
	mov rax, qword [rbp - 1872]
	mov r13, rax
	b3004:
	cmp rbx, r14
	jl b3005
	b3006:
	mov rax, r13
	jmp b3007
	b3005:
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
	b3007:
	mov qword [rbp - 9928], rax
	mov rax, qword [rbp - 6840]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1872]
	mov r14, rax
	mov rax, qword [rbp - 9152]
	mov r13, rax
	b3008:
	cmp r14, r12
	jl b3009
	b3010:
	mov rax, r13
	jmp b3011
	b3009:
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
	b3011:
	mov rcx, rax
	mov rax, qword [rbp - 4512]
	mov r12, rax
	mov rax, qword [rbp - 9928]
	mov r14, rax
	mov r13, rcx
	b3012:
	cmp r14, r12
	jl b3013
	b3014:
	mov rax, r13
	jmp b3015
	b3013:
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
	b3015:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b2999:
	mov qword [rbp - 4008], rax
	mov rax, qword [rbp - 6752]
	sub rax, 1
	mov qword [rbp - 6472], rax
	mov rax, qword [rbp - 4080]
	mov qword [rbp - 3808], rax
	mov rax, qword [rbp - 12784]
	mov qword [rbp - 7944], rax
	b3016:
	mov rcx, qword [rbp - 3808]
	mov rax, qword [rbp - 6472]
	cmp rcx, rax
	jl b3017
	b3018:
	mov rax, qword [rbp - 7944]
	jmp b3019
	b3017:
	mov rax, qword [rbp - 6472]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3808]
	mov rbx, rax
	mov rax, qword [rbp - 7944]
	mov r12, rax
	b3020:
	cmp rbx, r14
	jl b3021
	b3022:
	mov rax, r12
	jmp b3023
	b3021:
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
	b3023:
	mov qword [rbp - 12672], rax
	mov rax, qword [rbp - 3808]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7944]
	mov r13, rax
	mov rax, qword [rbp - 6472]
	mov r14, rax
	b3024:
	cmp r13, r15
	jl b3025
	b3026:
	mov rax, r14
	jmp b3027
	b3025:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3027:
	mov qword [rbp - 11648], rax
	mov rax, qword [rbp - 7944]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6472]
	mov r12, rax
	mov rax, qword [rbp - 3808]
	mov r13, rax
	b3028:
	cmp r12, rbx
	jl b3029
	b3030:
	mov rax, r13
	jmp b3031
	b3029:
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
	b3031:
	mov rcx, rax
	mov rax, qword [rbp - 12672]
	mov r12, rax
	mov rax, qword [rbp - 11648]
	mov r15, rax
	mov r13, rcx
	b3032:
	cmp r15, r12
	jl b3033
	b3034:
	mov rax, r13
	jmp b3035
	b3033:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3035:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3019:
	mov qword [rbp - 536], rax
	mov rax, qword [rbp - 4080]
	sub rax, 1
	mov qword [rbp - 6568], rax
	mov rax, qword [rbp - 12784]
	mov qword [rbp - 7176], rax
	mov rax, qword [rbp - 6752]
	mov qword [rbp - 4056], rax
	b3036:
	mov rax, qword [rbp - 7176]
	mov rcx, qword [rbp - 6568]
	cmp rax, rcx
	jl b3037
	b3038:
	mov rax, qword [rbp - 4056]
	jmp b3039
	b3037:
	mov rax, qword [rbp - 6568]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7176]
	mov r14, rax
	mov rax, qword [rbp - 4056]
	mov r12, rax
	b3040:
	cmp r14, r15
	jl b3041
	b3042:
	mov rax, r12
	jmp b3043
	b3041:
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
	b3043:
	mov qword [rbp - 5280], rax
	mov rax, qword [rbp - 7176]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4056]
	mov rbx, rax
	mov rax, qword [rbp - 6568]
	mov r13, rax
	b3044:
	cmp rbx, r14
	jl b3045
	b3046:
	mov rax, r13
	jmp b3047
	b3045:
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
	b3047:
	mov qword [rbp - 5632], rax
	mov rax, qword [rbp - 4056]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 6568]
	mov r15, rax
	mov rax, qword [rbp - 7176]
	mov rbx, rax
	b3048:
	cmp r15, r12
	jl b3049
	b3050:
	mov rax, rbx
	jmp b3051
	b3049:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3051:
	mov rcx, qword [rbp - 5280]
	mov rbx, rcx
	mov rcx, qword [rbp - 5632]
	mov r13, rcx
	mov r14, rax
	b3052:
	cmp r13, rbx
	jl b3053
	b3054:
	mov rax, r14
	jmp b3055
	b3053:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b3055:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3039:
	mov rcx, qword [rbp - 4008]
	mov qword [rbp - 12048], rcx
	mov rcx, qword [rbp - 536]
	mov qword [rbp - 7072], rcx
	mov qword [rbp - 9576], rax
	b3056:
	mov rax, qword [rbp - 7072]
	mov rcx, qword [rbp - 12048]
	cmp rax, rcx
	jl b3057
	b3058:
	mov rax, qword [rbp - 9576]
	jmp b3059
	b3057:
	mov rax, qword [rbp - 12048]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7072]
	mov r14, rax
	mov rax, qword [rbp - 9576]
	mov rbx, rax
	b3060:
	cmp r14, r15
	jl b3061
	b3062:
	mov rax, rbx
	jmp b3063
	b3061:
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
	b3063:
	mov qword [rbp - 12728], rax
	mov rax, qword [rbp - 7072]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9576]
	mov rbx, rax
	mov rax, qword [rbp - 12048]
	mov r13, rax
	b3064:
	cmp rbx, r15
	jl b3065
	b3066:
	mov rax, r13
	jmp b3067
	b3065:
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
	b3067:
	mov qword [rbp - 5920], rax
	mov rax, qword [rbp - 9576]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12048]
	mov r13, rax
	mov rax, qword [rbp - 7072]
	mov r14, rax
	b3068:
	cmp r13, rbx
	jl b3069
	b3070:
	mov rax, r14
	jmp b3071
	b3069:
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
	b3071:
	mov rcx, rax
	mov rax, qword [rbp - 12728]
	mov r14, rax
	mov rax, qword [rbp - 5920]
	mov rbx, rax
	mov r13, rcx
	b3072:
	cmp rbx, r14
	jl b3073
	b3074:
	mov rax, r13
	jmp b3075
	b3073:
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
	b3075:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3059:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2995:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2739:
	mov qword [rbp - 13000], rax
	mov rax, qword [rbp - 13424]
	sub rax, 1
	mov qword [rbp - 4696], rax
	mov rax, qword [rbp - 12304]
	mov qword [rbp - 12464], rax
	mov rax, qword [rbp - 12496]
	mov qword [rbp - 9568], rax
	b3076:
	mov rax, qword [rbp - 12464]
	mov rcx, qword [rbp - 4696]
	cmp rax, rcx
	jl b3077
	b3078:
	mov rax, qword [rbp - 9568]
	jmp b3079
	b3077:
	mov rax, qword [rbp - 4696]
	sub rax, 1
	mov qword [rbp - 8584], rax
	mov rax, qword [rbp - 12464]
	mov qword [rbp - 9848], rax
	mov rax, qword [rbp - 9568]
	mov qword [rbp - 4768], rax
	b3080:
	mov rcx, qword [rbp - 9848]
	mov rax, qword [rbp - 8584]
	cmp rcx, rax
	jl b3081
	b3082:
	mov rax, qword [rbp - 4768]
	jmp b3083
	b3081:
	mov rax, qword [rbp - 8584]
	sub rax, 1
	mov qword [rbp - 3256], rax
	mov rax, qword [rbp - 9848]
	mov qword [rbp - 904], rax
	mov rax, qword [rbp - 4768]
	mov qword [rbp - 7536], rax
	b3084:
	mov rax, qword [rbp - 904]
	mov rcx, qword [rbp - 3256]
	cmp rax, rcx
	jl b3085
	b3086:
	mov rax, qword [rbp - 7536]
	jmp b3087
	b3085:
	mov rax, qword [rbp - 3256]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 904]
	mov r12, rax
	mov rax, qword [rbp - 7536]
	mov r14, rax
	b3088:
	cmp r12, r15
	jl b3089
	b3090:
	mov rax, r14
	jmp b3091
	b3089:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b3091:
	mov qword [rbp - 9216], rax
	mov rax, qword [rbp - 904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7536]
	mov r12, rax
	mov rax, qword [rbp - 3256]
	mov r13, rax
	b3092:
	cmp r12, r14
	jl b3093
	b3094:
	mov rax, r13
	jmp b3095
	b3093:
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
	b3095:
	mov qword [rbp - 2168], rax
	mov rax, qword [rbp - 7536]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3256]
	mov r15, rax
	mov rax, qword [rbp - 904]
	mov r12, rax
	b3096:
	cmp r15, r14
	jl b3097
	b3098:
	mov rax, r12
	jmp b3099
	b3097:
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
	b3099:
	mov rcx, rax
	mov rax, qword [rbp - 9216]
	mov r15, rax
	mov rax, qword [rbp - 2168]
	mov r12, rax
	mov r13, rcx
	b3100:
	cmp r12, r15
	jl b3101
	b3102:
	mov rax, r13
	jmp b3103
	b3101:
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
	b3103:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3087:
	mov qword [rbp - 6344], rax
	mov rax, qword [rbp - 9848]
	sub rax, 1
	mov qword [rbp - 1376], rax
	mov rax, qword [rbp - 4768]
	mov qword [rbp - 7000], rax
	mov rax, qword [rbp - 8584]
	mov qword [rbp - 3432], rax
	b3104:
	mov rcx, qword [rbp - 7000]
	mov rax, qword [rbp - 1376]
	cmp rcx, rax
	jl b3105
	b3106:
	mov rax, qword [rbp - 3432]
	jmp b3107
	b3105:
	mov rax, qword [rbp - 1376]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7000]
	mov rbx, rax
	mov rax, qword [rbp - 3432]
	mov r14, rax
	b3108:
	cmp rbx, r15
	jl b3109
	b3110:
	mov rax, r14
	jmp b3111
	b3109:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3111:
	mov qword [rbp - 7304], rax
	mov rax, qword [rbp - 7000]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3432]
	mov r14, rax
	mov rax, qword [rbp - 1376]
	mov r13, rax
	b3112:
	cmp r14, r15
	jl b3113
	b3114:
	mov rax, r13
	jmp b3115
	b3113:
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
	b3115:
	mov qword [rbp - 13232], rax
	mov rax, qword [rbp - 3432]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1376]
	mov r13, rax
	mov rax, qword [rbp - 7000]
	mov r14, rax
	b3116:
	cmp r13, rbx
	jl b3117
	b3118:
	mov rax, r14
	jmp b3119
	b3117:
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
	b3119:
	mov rcx, rax
	mov rax, qword [rbp - 7304]
	mov r12, rax
	mov rax, qword [rbp - 13232]
	mov r14, rax
	mov r15, rcx
	b3120:
	cmp r14, r12
	jl b3121
	b3122:
	mov rax, r15
	jmp b3123
	b3121:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3123:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3107:
	mov qword [rbp - 13504], rax
	mov rax, qword [rbp - 4768]
	sub rax, 1
	mov qword [rbp - 6984], rax
	mov rax, qword [rbp - 8584]
	mov qword [rbp - 12880], rax
	mov rax, qword [rbp - 9848]
	mov qword [rbp - 12368], rax
	b3124:
	mov rax, qword [rbp - 12880]
	mov rcx, qword [rbp - 6984]
	cmp rax, rcx
	jl b3125
	b3126:
	mov rax, qword [rbp - 12368]
	jmp b3127
	b3125:
	mov rax, qword [rbp - 6984]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12880]
	mov r15, rax
	mov rax, qword [rbp - 12368]
	mov r13, rax
	b3128:
	cmp r15, r14
	jl b3129
	b3130:
	mov rax, r13
	jmp b3131
	b3129:
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
	b3131:
	mov qword [rbp - 2784], rax
	mov rax, qword [rbp - 12880]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12368]
	mov rbx, rax
	mov rax, qword [rbp - 6984]
	mov r14, rax
	b3132:
	cmp rbx, r12
	jl b3133
	b3134:
	mov rax, r14
	jmp b3135
	b3133:
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
	b3135:
	mov qword [rbp - 9160], rax
	mov rax, qword [rbp - 12368]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6984]
	mov r14, rax
	mov rax, qword [rbp - 12880]
	mov r15, rax
	b3136:
	cmp r14, rbx
	jl b3137
	b3138:
	mov rax, r15
	jmp b3139
	b3137:
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
	b3139:
	mov rcx, qword [rbp - 2784]
	mov r15, rcx
	mov rcx, qword [rbp - 9160]
	mov r12, rcx
	mov r13, rax
	b3140:
	cmp r12, r15
	jl b3141
	b3142:
	mov rax, r13
	jmp b3143
	b3141:
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
	b3143:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3127:
	mov rcx, rax
	mov rax, qword [rbp - 6344]
	mov qword [rbp - 2600], rax
	mov rax, qword [rbp - 13504]
	mov qword [rbp - 12352], rax
	mov rax, rcx
	mov qword [rbp - 3080], rax
	b3144:
	mov rcx, qword [rbp - 12352]
	mov rax, qword [rbp - 2600]
	cmp rcx, rax
	jl b3145
	b3146:
	mov rax, qword [rbp - 3080]
	jmp b3147
	b3145:
	mov rax, qword [rbp - 2600]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12352]
	mov rbx, rax
	mov rax, qword [rbp - 3080]
	mov r13, rax
	b3148:
	cmp rbx, r12
	jl b3149
	b3150:
	mov rax, r13
	jmp b3151
	b3149:
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
	b3151:
	mov qword [rbp - 13456], rax
	mov rax, qword [rbp - 12352]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3080]
	mov r13, rax
	mov rax, qword [rbp - 2600]
	mov r14, rax
	b3152:
	cmp r13, rbx
	jl b3153
	b3154:
	mov rax, r14
	jmp b3155
	b3153:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3155:
	mov qword [rbp - 10160], rax
	mov rax, qword [rbp - 3080]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2600]
	mov r15, rax
	mov rax, qword [rbp - 12352]
	mov r12, rax
	b3156:
	cmp r15, r14
	jl b3157
	b3158:
	mov rax, r12
	jmp b3159
	b3157:
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
	b3159:
	mov rcx, rax
	mov rax, qword [rbp - 13456]
	mov r15, rax
	mov rax, qword [rbp - 10160]
	mov r12, rax
	mov r14, rcx
	b3160:
	cmp r12, r15
	jl b3161
	b3162:
	mov rax, r14
	jmp b3163
	b3161:
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
	b3163:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3147:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3083:
	mov qword [rbp - 4864], rax
	mov rax, qword [rbp - 12464]
	sub rax, 1
	mov qword [rbp - 11816], rax
	mov rax, qword [rbp - 9568]
	mov qword [rbp - 8888], rax
	mov rax, qword [rbp - 4696]
	mov qword [rbp - 4216], rax
	b3164:
	mov rcx, qword [rbp - 8888]
	mov rax, qword [rbp - 11816]
	cmp rcx, rax
	jl b3165
	b3166:
	mov rax, qword [rbp - 4216]
	jmp b3167
	b3165:
	mov rax, qword [rbp - 11816]
	sub rax, 1
	mov qword [rbp - 10120], rax
	mov rax, qword [rbp - 8888]
	mov qword [rbp - 8248], rax
	mov rax, qword [rbp - 4216]
	mov qword [rbp - 1888], rax
	b3168:
	mov rax, qword [rbp - 8248]
	mov rcx, qword [rbp - 10120]
	cmp rax, rcx
	jl b3169
	b3170:
	mov rax, qword [rbp - 1888]
	jmp b3171
	b3169:
	mov rax, qword [rbp - 10120]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8248]
	mov r12, rax
	mov rax, qword [rbp - 1888]
	mov r13, rax
	b3172:
	cmp r12, r14
	jl b3173
	b3174:
	mov rax, r13
	jmp b3175
	b3173:
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
	b3175:
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 8248]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1888]
	mov r12, rax
	mov rax, qword [rbp - 10120]
	mov rbx, rax
	b3176:
	cmp r12, r13
	jl b3177
	b3178:
	mov rax, rbx
	jmp b3179
	b3177:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3179:
	mov qword [rbp - 7864], rax
	mov rax, qword [rbp - 1888]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10120]
	mov r14, rax
	mov rax, qword [rbp - 8248]
	mov rbx, rax
	b3180:
	cmp r14, r12
	jl b3181
	b3182:
	mov rax, rbx
	jmp b3183
	b3181:
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
	b3183:
	mov rcx, rax
	mov rax, qword [rbp - 16]
	mov r12, rax
	mov rax, qword [rbp - 7864]
	mov r14, rax
	mov r13, rcx
	b3184:
	cmp r14, r12
	jl b3185
	b3186:
	mov rax, r13
	jmp b3187
	b3185:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3187:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3171:
	mov qword [rbp - 5696], rax
	mov rax, qword [rbp - 8888]
	sub rax, 1
	mov qword [rbp - 5480], rax
	mov rax, qword [rbp - 4216]
	mov qword [rbp - 12960], rax
	mov rax, qword [rbp - 11816]
	mov qword [rbp - 5528], rax
	b3188:
	mov rcx, qword [rbp - 12960]
	mov rax, qword [rbp - 5480]
	cmp rcx, rax
	jl b3189
	b3190:
	mov rax, qword [rbp - 5528]
	jmp b3191
	b3189:
	mov rax, qword [rbp - 5480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12960]
	mov r14, rax
	mov rax, qword [rbp - 5528]
	mov r13, rax
	b3192:
	cmp r14, r15
	jl b3193
	b3194:
	mov rax, r13
	jmp b3195
	b3193:
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
	b3195:
	mov qword [rbp - 7408], rax
	mov rax, qword [rbp - 12960]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5528]
	mov r14, rax
	mov rax, qword [rbp - 5480]
	mov r13, rax
	b3196:
	cmp r14, rbx
	jl b3197
	b3198:
	mov rax, r13
	jmp b3199
	b3197:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3199:
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 5528]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5480]
	mov r14, rax
	mov rax, qword [rbp - 12960]
	mov r12, rax
	b3200:
	cmp r14, r15
	jl b3201
	b3202:
	mov rax, r12
	jmp b3203
	b3201:
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
	b3203:
	mov rcx, rax
	mov rax, qword [rbp - 7408]
	mov r15, rax
	mov rax, qword [rbp - 72]
	mov r12, rax
	mov r14, rcx
	b3204:
	cmp r12, r15
	jl b3205
	b3206:
	mov rax, r14
	jmp b3207
	b3205:
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
	b3207:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3191:
	mov qword [rbp - 4632], rax
	mov rax, qword [rbp - 4216]
	sub rax, 1
	mov qword [rbp - 8472], rax
	mov rax, qword [rbp - 11816]
	mov qword [rbp - 8856], rax
	mov rax, qword [rbp - 8888]
	mov qword [rbp - 7032], rax
	b3208:
	mov rax, qword [rbp - 8856]
	mov rcx, qword [rbp - 8472]
	cmp rax, rcx
	jl b3209
	b3210:
	mov rax, qword [rbp - 7032]
	jmp b3211
	b3209:
	mov rax, qword [rbp - 8472]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8856]
	mov rbx, rax
	mov rax, qword [rbp - 7032]
	mov r13, rax
	b3212:
	cmp rbx, r15
	jl b3213
	b3214:
	mov rax, r13
	jmp b3215
	b3213:
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
	b3215:
	mov qword [rbp - 6296], rax
	mov rax, qword [rbp - 8856]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7032]
	mov r14, rax
	mov rax, qword [rbp - 8472]
	mov rbx, rax
	b3216:
	cmp r14, r15
	jl b3217
	b3218:
	mov rax, rbx
	jmp b3219
	b3217:
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
	b3219:
	mov qword [rbp - 9096], rax
	mov rax, qword [rbp - 7032]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8472]
	mov rbx, rax
	mov rax, qword [rbp - 8856]
	mov r12, rax
	b3220:
	cmp rbx, r14
	jl b3221
	b3222:
	mov rax, r12
	jmp b3223
	b3221:
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
	b3223:
	mov rcx, rax
	mov rax, qword [rbp - 6296]
	mov r14, rax
	mov rax, qword [rbp - 9096]
	mov r12, rax
	mov r13, rcx
	b3224:
	cmp r12, r14
	jl b3225
	b3226:
	mov rax, r13
	jmp b3227
	b3225:
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
	b3227:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3211:
	mov rcx, rax
	mov rax, qword [rbp - 5696]
	mov qword [rbp - 7112], rax
	mov rax, qword [rbp - 4632]
	mov qword [rbp - 13040], rax
	mov rax, rcx
	mov qword [rbp - 10208], rax
	b3228:
	mov rcx, qword [rbp - 13040]
	mov rax, qword [rbp - 7112]
	cmp rcx, rax
	jl b3229
	b3230:
	mov rax, qword [rbp - 10208]
	jmp b3231
	b3229:
	mov rax, qword [rbp - 7112]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13040]
	mov rbx, rax
	mov rax, qword [rbp - 10208]
	mov r13, rax
	b3232:
	cmp rbx, r14
	jl b3233
	b3234:
	mov rax, r13
	jmp b3235
	b3233:
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
	b3235:
	mov qword [rbp - 8264], rax
	mov rax, qword [rbp - 13040]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10208]
	mov r14, rax
	mov rax, qword [rbp - 7112]
	mov r15, rax
	b3236:
	cmp r14, rbx
	jl b3237
	b3238:
	mov rax, r15
	jmp b3239
	b3237:
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
	b3239:
	mov qword [rbp - 11224], rax
	mov rax, qword [rbp - 10208]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7112]
	mov rbx, rax
	mov rax, qword [rbp - 13040]
	mov r13, rax
	b3240:
	cmp rbx, r15
	jl b3241
	b3242:
	mov rax, r13
	jmp b3243
	b3241:
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
	b3243:
	mov rcx, rax
	mov rax, qword [rbp - 8264]
	mov r12, rax
	mov rax, qword [rbp - 11224]
	mov r14, rax
	mov r15, rcx
	b3244:
	cmp r14, r12
	jl b3245
	b3246:
	mov rax, r15
	jmp b3247
	b3245:
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
	b3247:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3231:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3167:
	mov qword [rbp - 1592], rax
	mov rax, qword [rbp - 9568]
	sub rax, 1
	mov qword [rbp - 3064], rax
	mov rax, qword [rbp - 4696]
	mov qword [rbp - 8056], rax
	mov rax, qword [rbp - 12464]
	mov qword [rbp - 13576], rax
	b3248:
	mov rcx, qword [rbp - 8056]
	mov rax, qword [rbp - 3064]
	cmp rcx, rax
	jl b3249
	b3250:
	mov rax, qword [rbp - 13576]
	jmp b3251
	b3249:
	mov rax, qword [rbp - 3064]
	sub rax, 1
	mov qword [rbp - 4136], rax
	mov rax, qword [rbp - 8056]
	mov qword [rbp - 11288], rax
	mov rax, qword [rbp - 13576]
	mov qword [rbp - 7264], rax
	b3252:
	mov rax, qword [rbp - 11288]
	mov rcx, qword [rbp - 4136]
	cmp rax, rcx
	jl b3253
	b3254:
	mov rax, qword [rbp - 7264]
	jmp b3255
	b3253:
	mov rax, qword [rbp - 4136]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 11288]
	mov r15, rax
	mov rax, qword [rbp - 7264]
	mov r14, rax
	b3256:
	cmp r15, r12
	jl b3257
	b3258:
	mov rax, r14
	jmp b3259
	b3257:
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
	b3259:
	mov qword [rbp - 8768], rax
	mov rax, qword [rbp - 11288]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7264]
	mov r14, rax
	mov rax, qword [rbp - 4136]
	mov r13, rax
	b3260:
	cmp r14, r15
	jl b3261
	b3262:
	mov rax, r13
	jmp b3263
	b3261:
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
	b3263:
	mov qword [rbp - 1296], rax
	mov rax, qword [rbp - 7264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4136]
	mov r15, rax
	mov rax, qword [rbp - 11288]
	mov rbx, rax
	b3264:
	cmp r15, r14
	jl b3265
	b3266:
	mov rax, rbx
	jmp b3267
	b3265:
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
	b3267:
	mov rcx, rax
	mov rax, qword [rbp - 8768]
	mov r14, rax
	mov rax, qword [rbp - 1296]
	mov rbx, rax
	mov r12, rcx
	b3268:
	cmp rbx, r14
	jl b3269
	b3270:
	mov rax, r12
	jmp b3271
	b3269:
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
	b3271:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3255:
	mov qword [rbp - 4720], rax
	mov rax, qword [rbp - 8056]
	sub rax, 1
	mov qword [rbp - 11440], rax
	mov rax, qword [rbp - 13576]
	mov qword [rbp - 5744], rax
	mov rax, qword [rbp - 3064]
	mov qword [rbp - 912], rax
	b3272:
	mov rcx, qword [rbp - 5744]
	mov rax, qword [rbp - 11440]
	cmp rcx, rax
	jl b3273
	b3274:
	mov rax, qword [rbp - 912]
	jmp b3275
	b3273:
	mov rax, qword [rbp - 11440]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5744]
	mov r12, rax
	mov rax, qword [rbp - 912]
	mov r13, rax
	b3276:
	cmp r12, r15
	jl b3277
	b3278:
	mov rax, r13
	jmp b3279
	b3277:
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
	b3279:
	mov qword [rbp - 8368], rax
	mov rax, qword [rbp - 5744]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 912]
	mov r12, rax
	mov rax, qword [rbp - 11440]
	mov rbx, rax
	b3280:
	cmp r12, r15
	jl b3281
	b3282:
	mov rax, rbx
	jmp b3283
	b3281:
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
	b3283:
	mov qword [rbp - 9144], rax
	mov rax, qword [rbp - 912]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11440]
	mov r12, rax
	mov rax, qword [rbp - 5744]
	mov r13, rax
	b3284:
	cmp r12, r15
	jl b3285
	b3286:
	mov rax, r13
	jmp b3287
	b3285:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3287:
	mov rcx, rax
	mov rax, qword [rbp - 8368]
	mov r15, rax
	mov rax, qword [rbp - 9144]
	mov r14, rax
	mov r12, rcx
	b3288:
	cmp r14, r15
	jl b3289
	b3290:
	mov rax, r12
	jmp b3291
	b3289:
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
	b3291:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3275:
	mov qword [rbp - 6912], rax
	mov rax, qword [rbp - 13576]
	sub rax, 1
	mov qword [rbp - 9432], rax
	mov rax, qword [rbp - 3064]
	mov qword [rbp - 6600], rax
	mov rax, qword [rbp - 8056]
	mov qword [rbp - 5800], rax
	b3292:
	mov rax, qword [rbp - 6600]
	mov rcx, qword [rbp - 9432]
	cmp rax, rcx
	jl b3293
	b3294:
	mov rax, qword [rbp - 5800]
	jmp b3295
	b3293:
	mov rax, qword [rbp - 9432]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 6600]
	mov r13, rax
	mov rax, qword [rbp - 5800]
	mov r15, rax
	b3296:
	cmp r13, r12
	jl b3297
	b3298:
	mov rax, r15
	jmp b3299
	b3297:
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
	b3299:
	mov qword [rbp - 7880], rax
	mov rax, qword [rbp - 6600]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5800]
	mov r12, rax
	mov rax, qword [rbp - 9432]
	mov r14, rax
	b3300:
	cmp r12, r15
	jl b3301
	b3302:
	mov rax, r14
	jmp b3303
	b3301:
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
	b3303:
	mov qword [rbp - 8216], rax
	mov rax, qword [rbp - 5800]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9432]
	mov r14, rax
	mov rax, qword [rbp - 6600]
	mov rbx, rax
	b3304:
	cmp r14, r15
	jl b3305
	b3306:
	mov rax, rbx
	jmp b3307
	b3305:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3307:
	mov rcx, rax
	mov rax, qword [rbp - 7880]
	mov r15, rax
	mov rax, qword [rbp - 8216]
	mov r12, rax
	mov r13, rcx
	b3308:
	cmp r12, r15
	jl b3309
	b3310:
	mov rax, r13
	jmp b3311
	b3309:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3311:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3295:
	mov rcx, rax
	mov rax, qword [rbp - 4720]
	mov qword [rbp - 1616], rax
	mov rax, qword [rbp - 6912]
	mov qword [rbp - 3824], rax
	mov rax, rcx
	mov qword [rbp - 1656], rax
	b3312:
	mov rax, qword [rbp - 3824]
	mov rcx, qword [rbp - 1616]
	cmp rax, rcx
	jl b3313
	b3314:
	mov rax, qword [rbp - 1656]
	jmp b3315
	b3313:
	mov rax, qword [rbp - 1616]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3824]
	mov r14, rax
	mov rax, qword [rbp - 1656]
	mov r13, rax
	b3316:
	cmp r14, rbx
	jl b3317
	b3318:
	mov rax, r13
	jmp b3319
	b3317:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3319:
	mov qword [rbp - 960], rax
	mov rax, qword [rbp - 3824]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1656]
	mov r12, rax
	mov rax, qword [rbp - 1616]
	mov r14, rax
	b3320:
	cmp r12, r15
	jl b3321
	b3322:
	mov rax, r14
	jmp b3323
	b3321:
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
	b3323:
	mov qword [rbp - 1368], rax
	mov rax, qword [rbp - 1656]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1616]
	mov r15, rax
	mov rax, qword [rbp - 3824]
	mov r12, rax
	b3324:
	cmp r15, rbx
	jl b3325
	b3326:
	mov rax, r12
	jmp b3327
	b3325:
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
	b3327:
	mov rcx, qword [rbp - 960]
	mov r14, rcx
	mov rcx, qword [rbp - 1368]
	mov rbx, rcx
	mov r12, rax
	b3328:
	cmp rbx, r14
	jl b3329
	b3330:
	mov rax, r12
	jmp b3331
	b3329:
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
	b3331:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3315:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3251:
	mov rcx, rax
	mov rax, qword [rbp - 4864]
	mov qword [rbp - 10672], rax
	mov rax, qword [rbp - 1592]
	mov qword [rbp - 11480], rax
	mov rax, rcx
	mov qword [rbp - 6904], rax
	b3332:
	mov rax, qword [rbp - 11480]
	mov rcx, qword [rbp - 10672]
	cmp rax, rcx
	jl b3333
	b3334:
	mov rax, qword [rbp - 6904]
	jmp b3335
	b3333:
	mov rax, qword [rbp - 10672]
	sub rax, 1
	mov qword [rbp - 896], rax
	mov rax, qword [rbp - 11480]
	mov qword [rbp - 9624], rax
	mov rax, qword [rbp - 6904]
	mov qword [rbp - 11808], rax
	b3336:
	mov rcx, qword [rbp - 9624]
	mov rax, qword [rbp - 896]
	cmp rcx, rax
	jl b3337
	b3338:
	mov rax, qword [rbp - 11808]
	jmp b3339
	b3337:
	mov rax, qword [rbp - 896]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9624]
	mov r14, rax
	mov rax, qword [rbp - 11808]
	mov r15, rax
	b3340:
	cmp r14, rbx
	jl b3341
	b3342:
	mov rax, r15
	jmp b3343
	b3341:
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
	b3343:
	mov qword [rbp - 6888], rax
	mov rax, qword [rbp - 9624]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11808]
	mov r15, rax
	mov rax, qword [rbp - 896]
	mov r14, rax
	b3344:
	cmp r15, rbx
	jl b3345
	b3346:
	mov rax, r14
	jmp b3347
	b3345:
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
	b3347:
	mov qword [rbp - 1248], rax
	mov rax, qword [rbp - 11808]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 896]
	mov r14, rax
	mov rax, qword [rbp - 9624]
	mov r15, rax
	b3348:
	cmp r14, rbx
	jl b3349
	b3350:
	mov rax, r15
	jmp b3351
	b3349:
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
	b3351:
	mov rcx, qword [rbp - 6888]
	mov rbx, rcx
	mov rcx, qword [rbp - 1248]
	mov r15, rcx
	mov r12, rax
	b3352:
	cmp r15, rbx
	jl b3353
	b3354:
	mov rax, r12
	jmp b3355
	b3353:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3355:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3339:
	mov qword [rbp - 12024], rax
	mov rax, qword [rbp - 11480]
	sub rax, 1
	mov qword [rbp - 976], rax
	mov rax, qword [rbp - 6904]
	mov qword [rbp - 1600], rax
	mov rax, qword [rbp - 10672]
	mov qword [rbp - 3960], rax
	b3356:
	mov rax, qword [rbp - 1600]
	mov rcx, qword [rbp - 976]
	cmp rax, rcx
	jl b3357
	b3358:
	mov rax, qword [rbp - 3960]
	jmp b3359
	b3357:
	mov rax, qword [rbp - 976]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1600]
	mov rbx, rax
	mov rax, qword [rbp - 3960]
	mov r13, rax
	b3360:
	cmp rbx, r14
	jl b3361
	b3362:
	mov rax, r13
	jmp b3363
	b3361:
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
	b3363:
	mov qword [rbp - 2872], rax
	mov rax, qword [rbp - 1600]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3960]
	mov r13, rax
	mov rax, qword [rbp - 976]
	mov r14, rax
	b3364:
	cmp r13, rbx
	jl b3365
	b3366:
	mov rax, r14
	jmp b3367
	b3365:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b3367:
	mov qword [rbp - 4648], rax
	mov rax, qword [rbp - 3960]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 976]
	mov r14, rax
	mov rax, qword [rbp - 1600]
	mov rbx, rax
	b3368:
	cmp r14, r12
	jl b3369
	b3370:
	mov rax, rbx
	jmp b3371
	b3369:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3371:
	mov rcx, rax
	mov rax, qword [rbp - 2872]
	mov r12, rax
	mov rax, qword [rbp - 4648]
	mov r14, rax
	mov rbx, rcx
	b3372:
	cmp r14, r12
	jl b3373
	b3374:
	mov rax, rbx
	jmp b3375
	b3373:
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
	b3375:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3359:
	mov qword [rbp - 2392], rax
	mov rax, qword [rbp - 6904]
	sub rax, 1
	mov qword [rbp - 4888], rax
	mov rax, qword [rbp - 10672]
	mov qword [rbp - 6368], rax
	mov rax, qword [rbp - 11480]
	mov qword [rbp - 2488], rax
	b3376:
	mov rax, qword [rbp - 6368]
	mov rcx, qword [rbp - 4888]
	cmp rax, rcx
	jl b3377
	b3378:
	mov rax, qword [rbp - 2488]
	jmp b3379
	b3377:
	mov rax, qword [rbp - 4888]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6368]
	mov r13, rax
	mov rax, qword [rbp - 2488]
	mov r14, rax
	b3380:
	cmp r13, rbx
	jl b3381
	b3382:
	mov rax, r14
	jmp b3383
	b3381:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b3383:
	mov qword [rbp - 8576], rax
	mov rax, qword [rbp - 6368]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2488]
	mov r13, rax
	mov rax, qword [rbp - 4888]
	mov rbx, rax
	b3384:
	cmp r13, r15
	jl b3385
	b3386:
	mov rax, rbx
	jmp b3387
	b3385:
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
	b3387:
	mov qword [rbp - 5824], rax
	mov rax, qword [rbp - 2488]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4888]
	mov r12, rax
	mov rax, qword [rbp - 6368]
	mov r13, rax
	b3388:
	cmp r12, r15
	jl b3389
	b3390:
	mov rax, r13
	jmp b3391
	b3389:
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
	b3391:
	mov rcx, rax
	mov rax, qword [rbp - 8576]
	mov rbx, rax
	mov rax, qword [rbp - 5824]
	mov r12, rax
	mov r15, rcx
	b3392:
	cmp r12, rbx
	jl b3393
	b3394:
	mov rax, r15
	jmp b3395
	b3393:
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
	b3395:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3379:
	mov rcx, rax
	mov rax, qword [rbp - 12024]
	mov qword [rbp - 6792], rax
	mov rax, qword [rbp - 2392]
	mov qword [rbp - 8656], rax
	mov rax, rcx
	mov qword [rbp - 9840], rax
	b3396:
	mov rcx, qword [rbp - 8656]
	mov rax, qword [rbp - 6792]
	cmp rcx, rax
	jl b3397
	b3398:
	mov rax, qword [rbp - 9840]
	jmp b3399
	b3397:
	mov rax, qword [rbp - 6792]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8656]
	mov rbx, rax
	mov rax, qword [rbp - 9840]
	mov r13, rax
	b3400:
	cmp rbx, r12
	jl b3401
	b3402:
	mov rax, r13
	jmp b3403
	b3401:
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
	b3403:
	mov qword [rbp - 6672], rax
	mov rax, qword [rbp - 8656]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 9840]
	mov r15, rax
	mov rax, qword [rbp - 6792]
	mov rbx, rax
	b3404:
	cmp r15, r13
	jl b3405
	b3406:
	mov rax, rbx
	jmp b3407
	b3405:
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
	b3407:
	mov qword [rbp - 4528], rax
	mov rax, qword [rbp - 9840]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6792]
	mov r14, rax
	mov rax, qword [rbp - 8656]
	mov r12, rax
	b3408:
	cmp r14, rbx
	jl b3409
	b3410:
	mov rax, r12
	jmp b3411
	b3409:
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
	b3411:
	mov rcx, qword [rbp - 6672]
	mov rbx, rcx
	mov rcx, qword [rbp - 4528]
	mov r12, rcx
	mov r15, rax
	b3412:
	cmp r12, rbx
	jl b3413
	b3414:
	mov rax, r15
	jmp b3415
	b3413:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3415:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3399:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3335:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3079:
	mov qword [rbp - 10408], rax
	mov rax, qword [rbp - 12304]
	sub rax, 1
	mov qword [rbp - 8016], rax
	mov rax, qword [rbp - 12496]
	mov qword [rbp - 3016], rax
	mov rax, qword [rbp - 13424]
	mov qword [rbp - 2408], rax
	b3416:
	mov rax, qword [rbp - 3016]
	mov rcx, qword [rbp - 8016]
	cmp rax, rcx
	jl b3417
	b3418:
	mov rax, qword [rbp - 2408]
	jmp b3419
	b3417:
	mov rax, qword [rbp - 8016]
	sub rax, 1
	mov qword [rbp - 832], rax
	mov rax, qword [rbp - 3016]
	mov qword [rbp - 6800], rax
	mov rax, qword [rbp - 2408]
	mov qword [rbp - 10368], rax
	b3420:
	mov rcx, qword [rbp - 6800]
	mov rax, qword [rbp - 832]
	cmp rcx, rax
	jl b3421
	b3422:
	mov rax, qword [rbp - 10368]
	jmp b3423
	b3421:
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov qword [rbp - 6440], rax
	mov rax, qword [rbp - 6800]
	mov qword [rbp - 10816], rax
	mov rax, qword [rbp - 10368]
	mov qword [rbp - 13008], rax
	b3424:
	mov rcx, qword [rbp - 10816]
	mov rax, qword [rbp - 6440]
	cmp rcx, rax
	jl b3425
	b3426:
	mov rax, qword [rbp - 13008]
	jmp b3427
	b3425:
	mov rax, qword [rbp - 6440]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10816]
	mov r15, rax
	mov rax, qword [rbp - 13008]
	mov r14, rax
	b3428:
	cmp r15, rbx
	jl b3429
	b3430:
	mov rax, r14
	jmp b3431
	b3429:
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
	b3431:
	mov qword [rbp - 3160], rax
	mov rax, qword [rbp - 10816]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13008]
	mov r15, rax
	mov rax, qword [rbp - 6440]
	mov r12, rax
	b3432:
	cmp r15, r14
	jl b3433
	b3434:
	mov rax, r12
	jmp b3435
	b3433:
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
	b3435:
	mov qword [rbp - 2224], rax
	mov rax, qword [rbp - 13008]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 6440]
	mov rbx, rax
	mov rax, qword [rbp - 10816]
	mov r13, rax
	b3436:
	cmp rbx, r12
	jl b3437
	b3438:
	mov rax, r13
	jmp b3439
	b3437:
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
	b3439:
	mov rcx, qword [rbp - 3160]
	mov r14, rcx
	mov rcx, qword [rbp - 2224]
	mov r12, rcx
	mov r13, rax
	b3440:
	cmp r12, r14
	jl b3441
	b3442:
	mov rax, r13
	jmp b3443
	b3441:
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
	b3443:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3427:
	mov qword [rbp - 7368], rax
	mov rax, qword [rbp - 6800]
	sub rax, 1
	mov qword [rbp - 7104], rax
	mov rax, qword [rbp - 10368]
	mov qword [rbp - 11768], rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 1408], rax
	b3444:
	mov rcx, qword [rbp - 11768]
	mov rax, qword [rbp - 7104]
	cmp rcx, rax
	jl b3445
	b3446:
	mov rax, qword [rbp - 1408]
	jmp b3447
	b3445:
	mov rax, qword [rbp - 7104]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11768]
	mov rbx, rax
	mov rax, qword [rbp - 1408]
	mov r13, rax
	b3448:
	cmp rbx, r15
	jl b3449
	b3450:
	mov rax, r13
	jmp b3451
	b3449:
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
	b3451:
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 11768]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1408]
	mov r15, rax
	mov rax, qword [rbp - 7104]
	mov r13, rax
	b3452:
	cmp r15, r14
	jl b3453
	b3454:
	mov rax, r13
	jmp b3455
	b3453:
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
	b3455:
	mov qword [rbp - 6968], rax
	mov rax, qword [rbp - 1408]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7104]
	mov r12, rax
	mov rax, qword [rbp - 11768]
	mov r15, rax
	b3456:
	cmp r12, r14
	jl b3457
	b3458:
	mov rax, r15
	jmp b3459
	b3457:
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
	b3459:
	mov rcx, rax
	mov rax, qword [rbp - 216]
	mov rbx, rax
	mov rax, qword [rbp - 6968]
	mov r14, rax
	mov r12, rcx
	b3460:
	cmp r14, rbx
	jl b3461
	b3462:
	mov rax, r12
	jmp b3463
	b3461:
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
	b3463:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3447:
	mov qword [rbp - 12400], rax
	mov rax, qword [rbp - 10368]
	sub rax, 1
	mov qword [rbp - 5112], rax
	mov rax, qword [rbp - 832]
	mov qword [rbp - 6392], rax
	mov rax, qword [rbp - 6800]
	mov qword [rbp - 3072], rax
	b3464:
	mov rcx, qword [rbp - 6392]
	mov rax, qword [rbp - 5112]
	cmp rcx, rax
	jl b3465
	b3466:
	mov rax, qword [rbp - 3072]
	jmp b3467
	b3465:
	mov rax, qword [rbp - 5112]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6392]
	mov r12, rax
	mov rax, qword [rbp - 3072]
	mov r14, rax
	b3468:
	cmp r12, rbx
	jl b3469
	b3470:
	mov rax, r14
	jmp b3471
	b3469:
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
	b3471:
	mov qword [rbp - 9008], rax
	mov rax, qword [rbp - 6392]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3072]
	mov rbx, rax
	mov rax, qword [rbp - 5112]
	mov r13, rax
	b3472:
	cmp rbx, r12
	jl b3473
	b3474:
	mov rax, r13
	jmp b3475
	b3473:
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
	b3475:
	mov qword [rbp - 5240], rax
	mov rax, qword [rbp - 3072]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5112]
	mov r15, rax
	mov rax, qword [rbp - 6392]
	mov r14, rax
	b3476:
	cmp r15, rbx
	jl b3477
	b3478:
	mov rax, r14
	jmp b3479
	b3477:
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
	b3479:
	mov rcx, rax
	mov rax, qword [rbp - 9008]
	mov rbx, rax
	mov rax, qword [rbp - 5240]
	mov r14, rax
	mov r13, rcx
	b3480:
	cmp r14, rbx
	jl b3481
	b3482:
	mov rax, r13
	jmp b3483
	b3481:
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
	b3483:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3467:
	mov rcx, rax
	mov rax, qword [rbp - 7368]
	mov qword [rbp - 1480], rax
	mov rax, qword [rbp - 12400]
	mov qword [rbp - 8136], rax
	mov rax, rcx
	mov qword [rbp - 800], rax
	b3484:
	mov rcx, qword [rbp - 8136]
	mov rax, qword [rbp - 1480]
	cmp rcx, rax
	jl b3485
	b3486:
	mov rax, qword [rbp - 800]
	jmp b3487
	b3485:
	mov rax, qword [rbp - 1480]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8136]
	mov r15, rax
	mov rax, qword [rbp - 800]
	mov r12, rax
	b3488:
	cmp r15, rbx
	jl b3489
	b3490:
	mov rax, r12
	jmp b3491
	b3489:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3491:
	mov qword [rbp - 10544], rax
	mov rax, qword [rbp - 8136]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 800]
	mov r15, rax
	mov rax, qword [rbp - 1480]
	mov r13, rax
	b3492:
	cmp r15, rbx
	jl b3493
	b3494:
	mov rax, r13
	jmp b3495
	b3493:
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
	b3495:
	mov qword [rbp - 7376], rax
	mov rax, qword [rbp - 800]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1480]
	mov r15, rax
	mov rax, qword [rbp - 8136]
	mov r12, rax
	b3496:
	cmp r15, r14
	jl b3497
	b3498:
	mov rax, r12
	jmp b3499
	b3497:
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
	b3499:
	mov rcx, rax
	mov rax, qword [rbp - 10544]
	mov rbx, rax
	mov rax, qword [rbp - 7376]
	mov r14, rax
	mov r15, rcx
	b3500:
	cmp r14, rbx
	jl b3501
	b3502:
	mov rax, r15
	jmp b3503
	b3501:
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
	b3503:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3487:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3423:
	mov qword [rbp - 4704], rax
	mov rax, qword [rbp - 3016]
	sub rax, 1
	mov qword [rbp - 8352], rax
	mov rax, qword [rbp - 2408]
	mov qword [rbp - 5552], rax
	mov rax, qword [rbp - 8016]
	mov qword [rbp - 8736], rax
	b3504:
	mov rax, qword [rbp - 5552]
	mov rcx, qword [rbp - 8352]
	cmp rax, rcx
	jl b3505
	b3506:
	mov rax, qword [rbp - 8736]
	jmp b3507
	b3505:
	mov rax, qword [rbp - 8352]
	sub rax, 1
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 5552]
	mov qword [rbp - 9360], rax
	mov rax, qword [rbp - 8736]
	mov qword [rbp - 12816], rax
	b3508:
	mov rcx, qword [rbp - 9360]
	mov rax, qword [rbp - 424]
	cmp rcx, rax
	jl b3509
	b3510:
	mov rax, qword [rbp - 12816]
	jmp b3511
	b3509:
	mov rax, qword [rbp - 424]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9360]
	mov r12, rax
	mov rax, qword [rbp - 12816]
	mov r13, rax
	b3512:
	cmp r12, r15
	jl b3513
	b3514:
	mov rax, r13
	jmp b3515
	b3513:
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
	b3515:
	mov qword [rbp - 8000], rax
	mov rax, qword [rbp - 9360]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12816]
	mov r15, rax
	mov rax, qword [rbp - 424]
	mov r13, rax
	b3516:
	cmp r15, r14
	jl b3517
	b3518:
	mov rax, r13
	jmp b3519
	b3517:
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
	b3519:
	mov qword [rbp - 11448], rax
	mov rax, qword [rbp - 12816]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 424]
	mov rbx, rax
	mov rax, qword [rbp - 9360]
	mov r14, rax
	b3520:
	cmp rbx, r15
	jl b3521
	b3522:
	mov rax, r14
	jmp b3523
	b3521:
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
	b3523:
	mov rcx, rax
	mov rax, qword [rbp - 8000]
	mov r15, rax
	mov rax, qword [rbp - 11448]
	mov r12, rax
	mov r14, rcx
	b3524:
	cmp r12, r15
	jl b3525
	b3526:
	mov rax, r14
	jmp b3527
	b3525:
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
	b3527:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3511:
	mov qword [rbp - 928], rax
	mov rax, qword [rbp - 5552]
	sub rax, 1
	mov qword [rbp - 6416], rax
	mov rax, qword [rbp - 8736]
	mov qword [rbp - 7840], rax
	mov rax, qword [rbp - 8352]
	mov qword [rbp - 3776], rax
	b3528:
	mov rax, qword [rbp - 7840]
	mov rcx, qword [rbp - 6416]
	cmp rax, rcx
	jl b3529
	b3530:
	mov rax, qword [rbp - 3776]
	jmp b3531
	b3529:
	mov rax, qword [rbp - 6416]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7840]
	mov rbx, rax
	mov rax, qword [rbp - 3776]
	mov r13, rax
	b3532:
	cmp rbx, r12
	jl b3533
	b3534:
	mov rax, r13
	jmp b3535
	b3533:
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
	b3535:
	mov qword [rbp - 13304], rax
	mov rax, qword [rbp - 7840]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3776]
	mov r12, rax
	mov rax, qword [rbp - 6416]
	mov r14, rax
	b3536:
	cmp r12, rbx
	jl b3537
	b3538:
	mov rax, r14
	jmp b3539
	b3537:
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
	b3539:
	mov qword [rbp - 1680], rax
	mov rax, qword [rbp - 3776]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 6416]
	mov rbx, rax
	mov rax, qword [rbp - 7840]
	mov r12, rax
	b3540:
	cmp rbx, r13
	jl b3541
	b3542:
	mov rax, r12
	jmp b3543
	b3541:
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
	mov r14, rax
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3543:
	mov rcx, rax
	mov rax, qword [rbp - 13304]
	mov r12, rax
	mov rax, qword [rbp - 1680]
	mov r14, rax
	mov r13, rcx
	b3544:
	cmp r14, r12
	jl b3545
	b3546:
	mov rax, r13
	jmp b3547
	b3545:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3547:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3531:
	mov qword [rbp - 8832], rax
	mov rax, qword [rbp - 8736]
	sub rax, 1
	mov qword [rbp - 10024], rax
	mov rax, qword [rbp - 8352]
	mov qword [rbp - 3376], rax
	mov rax, qword [rbp - 5552]
	mov qword [rbp - 6608], rax
	b3548:
	mov rcx, qword [rbp - 3376]
	mov rax, qword [rbp - 10024]
	cmp rcx, rax
	jl b3549
	b3550:
	mov rax, qword [rbp - 6608]
	jmp b3551
	b3549:
	mov rax, qword [rbp - 10024]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3376]
	mov rbx, rax
	mov rax, qword [rbp - 6608]
	mov r14, rax
	b3552:
	cmp rbx, r15
	jl b3553
	b3554:
	mov rax, r14
	jmp b3555
	b3553:
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
	b3555:
	mov qword [rbp - 12824], rax
	mov rax, qword [rbp - 3376]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6608]
	mov r15, rax
	mov rax, qword [rbp - 10024]
	mov r13, rax
	b3556:
	cmp r15, r14
	jl b3557
	b3558:
	mov rax, r13
	jmp b3559
	b3557:
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
	b3559:
	mov qword [rbp - 5184], rax
	mov rax, qword [rbp - 6608]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10024]
	mov r14, rax
	mov rax, qword [rbp - 3376]
	mov rbx, rax
	b3560:
	cmp r14, r15
	jl b3561
	b3562:
	mov rax, rbx
	jmp b3563
	b3561:
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
	b3563:
	mov rcx, qword [rbp - 12824]
	mov r14, rcx
	mov rcx, qword [rbp - 5184]
	mov r15, rcx
	mov rbx, rax
	b3564:
	cmp r15, r14
	jl b3565
	b3566:
	mov rax, rbx
	jmp b3567
	b3565:
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
	b3567:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3551:
	mov rcx, rax
	mov rax, qword [rbp - 928]
	mov qword [rbp - 2832], rax
	mov rax, qword [rbp - 8832]
	mov qword [rbp - 10328], rax
	mov rax, rcx
	mov qword [rbp - 11488], rax
	b3568:
	mov rcx, qword [rbp - 10328]
	mov rax, qword [rbp - 2832]
	cmp rcx, rax
	jl b3569
	b3570:
	mov rax, qword [rbp - 11488]
	jmp b3571
	b3569:
	mov rax, qword [rbp - 2832]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10328]
	mov r14, rax
	mov rax, qword [rbp - 11488]
	mov r13, rax
	b3572:
	cmp r14, rbx
	jl b3573
	b3574:
	mov rax, r13
	jmp b3575
	b3573:
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
	b3575:
	mov qword [rbp - 8032], rax
	mov rax, qword [rbp - 10328]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11488]
	mov rbx, rax
	mov rax, qword [rbp - 2832]
	mov r12, rax
	b3576:
	cmp rbx, r14
	jl b3577
	b3578:
	mov rax, r12
	jmp b3579
	b3577:
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
	b3579:
	mov qword [rbp - 9048], rax
	mov rax, qword [rbp - 11488]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2832]
	mov r14, rax
	mov rax, qword [rbp - 10328]
	mov r13, rax
	b3580:
	cmp r14, rbx
	jl b3581
	b3582:
	mov rax, r13
	jmp b3583
	b3581:
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
	b3583:
	mov rcx, qword [rbp - 8032]
	mov r14, rcx
	mov rcx, qword [rbp - 9048]
	mov r12, rcx
	mov r13, rax
	b3584:
	cmp r12, r14
	jl b3585
	b3586:
	mov rax, r13
	jmp b3587
	b3585:
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
	b3587:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3571:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3507:
	mov qword [rbp - 8648], rax
	mov rax, qword [rbp - 2408]
	sub rax, 1
	mov qword [rbp - 3704], rax
	mov rax, qword [rbp - 8016]
	mov qword [rbp - 3512], rax
	mov rax, qword [rbp - 3016]
	mov qword [rbp - 8816], rax
	b3588:
	mov rax, qword [rbp - 3512]
	mov rcx, qword [rbp - 3704]
	cmp rax, rcx
	jl b3589
	b3590:
	mov rax, qword [rbp - 8816]
	jmp b3591
	b3589:
	mov rax, qword [rbp - 3704]
	sub rax, 1
	mov qword [rbp - 5408], rax
	mov rax, qword [rbp - 3512]
	mov qword [rbp - 5024], rax
	mov rax, qword [rbp - 8816]
	mov qword [rbp - 1000], rax
	b3592:
	mov rcx, qword [rbp - 5024]
	mov rax, qword [rbp - 5408]
	cmp rcx, rax
	jl b3593
	b3594:
	mov rax, qword [rbp - 1000]
	jmp b3595
	b3593:
	mov rax, qword [rbp - 5408]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5024]
	mov r15, rax
	mov rax, qword [rbp - 1000]
	mov rbx, rax
	b3596:
	cmp r15, r14
	jl b3597
	b3598:
	mov rax, rbx
	jmp b3599
	b3597:
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
	b3599:
	mov qword [rbp - 4064], rax
	mov rax, qword [rbp - 5024]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1000]
	mov r15, rax
	mov rax, qword [rbp - 5408]
	mov r13, rax
	b3600:
	cmp r15, r14
	jl b3601
	b3602:
	mov rax, r13
	jmp b3603
	b3601:
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
	b3603:
	mov qword [rbp - 1832], rax
	mov rax, qword [rbp - 1000]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5408]
	mov r15, rax
	mov rax, qword [rbp - 5024]
	mov r13, rax
	b3604:
	cmp r15, r12
	jl b3605
	b3606:
	mov rax, r13
	jmp b3607
	b3605:
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
	b3607:
	mov rcx, rax
	mov rax, qword [rbp - 4064]
	mov r14, rax
	mov rax, qword [rbp - 1832]
	mov r12, rax
	mov rbx, rcx
	b3608:
	cmp r12, r14
	jl b3609
	b3610:
	mov rax, rbx
	jmp b3611
	b3609:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3611:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3595:
	mov qword [rbp - 4160], rax
	mov rax, qword [rbp - 3512]
	sub rax, 1
	mov qword [rbp - 7352], rax
	mov rax, qword [rbp - 8816]
	mov qword [rbp - 2632], rax
	mov rax, qword [rbp - 3704]
	mov qword [rbp - 9864], rax
	b3612:
	mov rax, qword [rbp - 2632]
	mov rcx, qword [rbp - 7352]
	cmp rax, rcx
	jl b3613
	b3614:
	mov rax, qword [rbp - 9864]
	jmp b3615
	b3613:
	mov rax, qword [rbp - 7352]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2632]
	mov r15, rax
	mov rax, qword [rbp - 9864]
	mov r12, rax
	b3616:
	cmp r15, r14
	jl b3617
	b3618:
	mov rax, r12
	jmp b3619
	b3617:
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
	b3619:
	mov qword [rbp - 7696], rax
	mov rax, qword [rbp - 2632]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9864]
	mov r15, rax
	mov rax, qword [rbp - 7352]
	mov rbx, rax
	b3620:
	cmp r15, r12
	jl b3621
	b3622:
	mov rax, rbx
	jmp b3623
	b3621:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3623:
	mov qword [rbp - 12136], rax
	mov rax, qword [rbp - 9864]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7352]
	mov r14, rax
	mov rax, qword [rbp - 2632]
	mov rbx, rax
	b3624:
	cmp r14, r15
	jl b3625
	b3626:
	mov rax, rbx
	jmp b3627
	b3625:
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
	b3627:
	mov rcx, rax
	mov rax, qword [rbp - 7696]
	mov rbx, rax
	mov rax, qword [rbp - 12136]
	mov r15, rax
	mov r14, rcx
	b3628:
	cmp r15, rbx
	jl b3629
	b3630:
	mov rax, r14
	jmp b3631
	b3629:
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
	b3631:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3615:
	mov qword [rbp - 6224], rax
	mov rax, qword [rbp - 8816]
	sub rax, 1
	mov qword [rbp - 9784], rax
	mov rax, qword [rbp - 3704]
	mov qword [rbp - 440], rax
	mov rax, qword [rbp - 3512]
	mov qword [rbp - 12792], rax
	b3632:
	mov rcx, qword [rbp - 440]
	mov rax, qword [rbp - 9784]
	cmp rcx, rax
	jl b3633
	b3634:
	mov rax, qword [rbp - 12792]
	jmp b3635
	b3633:
	mov rax, qword [rbp - 9784]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 440]
	mov rbx, rax
	mov rax, qword [rbp - 12792]
	mov r13, rax
	b3636:
	cmp rbx, r15
	jl b3637
	b3638:
	mov rax, r13
	jmp b3639
	b3637:
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
	b3639:
	mov qword [rbp - 5944], rax
	mov rax, qword [rbp - 440]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12792]
	mov r12, rax
	mov rax, qword [rbp - 9784]
	mov r13, rax
	b3640:
	cmp r12, r14
	jl b3641
	b3642:
	mov rax, r13
	jmp b3643
	b3641:
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
	b3643:
	mov qword [rbp - 5984], rax
	mov rax, qword [rbp - 12792]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9784]
	mov r12, rax
	mov rax, qword [rbp - 440]
	mov rbx, rax
	b3644:
	cmp r12, r15
	jl b3645
	b3646:
	mov rax, rbx
	jmp b3647
	b3645:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3647:
	mov rcx, qword [rbp - 5944]
	mov r14, rcx
	mov rcx, qword [rbp - 5984]
	mov r15, rcx
	mov r13, rax
	b3648:
	cmp r15, r14
	jl b3649
	b3650:
	mov rax, r13
	jmp b3651
	b3649:
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
	b3651:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3635:
	mov rcx, rax
	mov rax, qword [rbp - 4160]
	mov qword [rbp - 7928], rax
	mov rax, qword [rbp - 6224]
	mov qword [rbp - 2376], rax
	mov rax, rcx
	mov qword [rbp - 8872], rax
	b3652:
	mov rax, qword [rbp - 2376]
	mov rcx, qword [rbp - 7928]
	cmp rax, rcx
	jl b3653
	b3654:
	mov rax, qword [rbp - 8872]
	jmp b3655
	b3653:
	mov rax, qword [rbp - 7928]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2376]
	mov rbx, rax
	mov rax, qword [rbp - 8872]
	mov r12, rax
	b3656:
	cmp rbx, r14
	jl b3657
	b3658:
	mov rax, r12
	jmp b3659
	b3657:
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
	b3659:
	mov qword [rbp - 2384], rax
	mov rax, qword [rbp - 2376]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8872]
	mov r12, rax
	mov rax, qword [rbp - 7928]
	mov r13, rax
	b3660:
	cmp r12, r15
	jl b3661
	b3662:
	mov rax, r13
	jmp b3663
	b3661:
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
	b3663:
	mov qword [rbp - 2592], rax
	mov rax, qword [rbp - 8872]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7928]
	mov rbx, rax
	mov rax, qword [rbp - 2376]
	mov r14, rax
	b3664:
	cmp rbx, r15
	jl b3665
	b3666:
	mov rax, r14
	jmp b3667
	b3665:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3667:
	mov rcx, rax
	mov rax, qword [rbp - 2384]
	mov rbx, rax
	mov rax, qword [rbp - 2592]
	mov r12, rax
	mov r15, rcx
	b3668:
	cmp r12, rbx
	jl b3669
	b3670:
	mov rax, r15
	jmp b3671
	b3669:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b3671:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3655:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3591:
	mov rcx, rax
	mov rax, qword [rbp - 4704]
	mov qword [rbp - 1512], rax
	mov rax, qword [rbp - 8648]
	mov qword [rbp - 12952], rax
	mov rax, rcx
	mov qword [rbp - 328], rax
	b3672:
	mov rax, qword [rbp - 12952]
	mov rcx, qword [rbp - 1512]
	cmp rax, rcx
	jl b3673
	b3674:
	mov rax, qword [rbp - 328]
	jmp b3675
	b3673:
	mov rax, qword [rbp - 1512]
	sub rax, 1
	mov qword [rbp - 8616], rax
	mov rax, qword [rbp - 12952]
	mov qword [rbp - 1848], rax
	mov rax, qword [rbp - 328]
	mov qword [rbp - 12968], rax
	b3676:
	mov rax, qword [rbp - 1848]
	mov rcx, qword [rbp - 8616]
	cmp rax, rcx
	jl b3677
	b3678:
	mov rax, qword [rbp - 12968]
	jmp b3679
	b3677:
	mov rax, qword [rbp - 8616]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1848]
	mov rbx, rax
	mov rax, qword [rbp - 12968]
	mov r12, rax
	b3680:
	cmp rbx, r14
	jl b3681
	b3682:
	mov rax, r12
	jmp b3683
	b3681:
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
	b3683:
	mov qword [rbp - 3176], rax
	mov rax, qword [rbp - 1848]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12968]
	mov r12, rax
	mov rax, qword [rbp - 8616]
	mov r13, rax
	b3684:
	cmp r12, rbx
	jl b3685
	b3686:
	mov rax, r13
	jmp b3687
	b3685:
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
	b3687:
	mov qword [rbp - 5472], rax
	mov rax, qword [rbp - 12968]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8616]
	mov rbx, rax
	mov rax, qword [rbp - 1848]
	mov r13, rax
	b3688:
	cmp rbx, r12
	jl b3689
	b3690:
	mov rax, r13
	jmp b3691
	b3689:
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
	b3691:
	mov rcx, rax
	mov rax, qword [rbp - 3176]
	mov r14, rax
	mov rax, qword [rbp - 5472]
	mov rbx, rax
	mov r15, rcx
	b3692:
	cmp rbx, r14
	jl b3693
	b3694:
	mov rax, r15
	jmp b3695
	b3693:
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
	b3695:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3679:
	mov qword [rbp - 12664], rax
	mov rax, qword [rbp - 12952]
	sub rax, 1
	mov qword [rbp - 1904], rax
	mov rax, qword [rbp - 328]
	mov qword [rbp - 8776], rax
	mov rax, qword [rbp - 1512]
	mov qword [rbp - 11584], rax
	b3696:
	mov rcx, qword [rbp - 8776]
	mov rax, qword [rbp - 1904]
	cmp rcx, rax
	jl b3697
	b3698:
	mov rax, qword [rbp - 11584]
	jmp b3699
	b3697:
	mov rax, qword [rbp - 1904]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 8776]
	mov r15, rax
	mov rax, qword [rbp - 11584]
	mov r14, rax
	b3700:
	cmp r15, r13
	jl b3701
	b3702:
	mov rax, r14
	jmp b3703
	b3701:
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rbx, rax
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
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3703:
	mov qword [rbp - 7744], rax
	mov rax, qword [rbp - 8776]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11584]
	mov r12, rax
	mov rax, qword [rbp - 1904]
	mov r15, rax
	b3704:
	cmp r12, r14
	jl b3705
	b3706:
	mov rax, r15
	jmp b3707
	b3705:
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
	b3707:
	mov qword [rbp - 4336], rax
	mov rax, qword [rbp - 11584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1904]
	mov r12, rax
	mov rax, qword [rbp - 8776]
	mov r15, rax
	b3708:
	cmp r12, r14
	jl b3709
	b3710:
	mov rax, r15
	jmp b3711
	b3709:
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
	b3711:
	mov rcx, rax
	mov rax, qword [rbp - 7744]
	mov r12, rax
	mov rax, qword [rbp - 4336]
	mov r14, rax
	mov rbx, rcx
	b3712:
	cmp r14, r12
	jl b3713
	b3714:
	mov rax, rbx
	jmp b3715
	b3713:
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
	b3715:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3699:
	mov qword [rbp - 4896], rax
	mov rax, qword [rbp - 328]
	sub rax, 1
	mov qword [rbp - 9456], rax
	mov rax, qword [rbp - 1512]
	mov qword [rbp - 12656], rax
	mov rax, qword [rbp - 12952]
	mov qword [rbp - 10136], rax
	b3716:
	mov rcx, qword [rbp - 12656]
	mov rax, qword [rbp - 9456]
	cmp rcx, rax
	jl b3717
	b3718:
	mov rax, qword [rbp - 10136]
	jmp b3719
	b3717:
	mov rax, qword [rbp - 9456]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12656]
	mov r15, rax
	mov rax, qword [rbp - 10136]
	mov r14, rax
	b3720:
	cmp r15, rbx
	jl b3721
	b3722:
	mov rax, r14
	jmp b3723
	b3721:
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
	b3723:
	mov qword [rbp - 8256], rax
	mov rax, qword [rbp - 12656]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10136]
	mov r14, rax
	mov rax, qword [rbp - 9456]
	mov r15, rax
	b3724:
	cmp r14, rbx
	jl b3725
	b3726:
	mov rax, r15
	jmp b3727
	b3725:
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
	b3727:
	mov qword [rbp - 7544], rax
	mov rax, qword [rbp - 10136]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9456]
	mov r15, rax
	mov rax, qword [rbp - 12656]
	mov rbx, rax
	b3728:
	cmp r15, r12
	jl b3729
	b3730:
	mov rax, rbx
	jmp b3731
	b3729:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3731:
	mov rcx, rax
	mov rax, qword [rbp - 8256]
	mov r15, rax
	mov rax, qword [rbp - 7544]
	mov r14, rax
	mov rbx, rcx
	b3732:
	cmp r14, r15
	jl b3733
	b3734:
	mov rax, rbx
	jmp b3735
	b3733:
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
	b3735:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3719:
	mov rcx, rax
	mov rax, qword [rbp - 12664]
	mov qword [rbp - 1520], rax
	mov rax, qword [rbp - 4896]
	mov qword [rbp - 4248], rax
	mov rax, rcx
	mov qword [rbp - 2456], rax
	b3736:
	mov rcx, qword [rbp - 4248]
	mov rax, qword [rbp - 1520]
	cmp rcx, rax
	jl b3737
	b3738:
	mov rax, qword [rbp - 2456]
	jmp b3739
	b3737:
	mov rax, qword [rbp - 1520]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4248]
	mov rbx, rax
	mov rax, qword [rbp - 2456]
	mov r15, rax
	b3740:
	cmp rbx, r14
	jl b3741
	b3742:
	mov rax, r15
	jmp b3743
	b3741:
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
	b3743:
	mov qword [rbp - 4280], rax
	mov rax, qword [rbp - 4248]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2456]
	mov r14, rax
	mov rax, qword [rbp - 1520]
	mov rbx, rax
	b3744:
	cmp r14, r12
	jl b3745
	b3746:
	mov rax, rbx
	jmp b3747
	b3745:
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
	b3747:
	mov qword [rbp - 10240], rax
	mov rax, qword [rbp - 2456]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1520]
	mov r14, rax
	mov rax, qword [rbp - 4248]
	mov r13, rax
	b3748:
	cmp r14, r12
	jl b3749
	b3750:
	mov rax, r13
	jmp b3751
	b3749:
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
	b3751:
	mov rcx, rax
	mov rax, qword [rbp - 4280]
	mov rbx, rax
	mov rax, qword [rbp - 10240]
	mov r13, rax
	mov r15, rcx
	b3752:
	cmp r13, rbx
	jl b3753
	b3754:
	mov rax, r15
	jmp b3755
	b3753:
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
	b3755:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3739:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3675:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3419:
	mov rcx, qword [rbp - 13000]
	mov qword [rbp - 1072], rcx
	mov rcx, qword [rbp - 10408]
	mov qword [rbp - 11248], rcx
	mov qword [rbp - 2136], rax
	b3756:
	mov rcx, qword [rbp - 11248]
	mov rax, qword [rbp - 1072]
	cmp rcx, rax
	jl b3757
	b3758:
	mov rax, qword [rbp - 2136]
	jmp b3759
	b3757:
	mov rax, qword [rbp - 1072]
	sub rax, 1
	mov qword [rbp - 5680], rax
	mov rax, qword [rbp - 11248]
	mov qword [rbp - 6808], rax
	mov rax, qword [rbp - 2136]
	mov qword [rbp - 4640], rax
	b3760:
	mov rax, qword [rbp - 6808]
	mov rcx, qword [rbp - 5680]
	cmp rax, rcx
	jl b3761
	b3762:
	mov rax, qword [rbp - 4640]
	jmp b3763
	b3761:
	mov rax, qword [rbp - 5680]
	sub rax, 1
	mov qword [rbp - 6656], rax
	mov rax, qword [rbp - 6808]
	mov qword [rbp - 12392], rax
	mov rax, qword [rbp - 4640]
	mov qword [rbp - 856], rax
	b3764:
	mov rax, qword [rbp - 12392]
	mov rcx, qword [rbp - 6656]
	cmp rax, rcx
	jl b3765
	b3766:
	mov rax, qword [rbp - 856]
	jmp b3767
	b3765:
	mov rax, qword [rbp - 6656]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12392]
	mov r12, rax
	mov rax, qword [rbp - 856]
	mov r15, rax
	b3768:
	cmp r12, rbx
	jl b3769
	b3770:
	mov rax, r15
	jmp b3771
	b3769:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b3771:
	mov qword [rbp - 5656], rax
	mov rax, qword [rbp - 12392]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 856]
	mov r12, rax
	mov rax, qword [rbp - 6656]
	mov rbx, rax
	b3772:
	cmp r12, r14
	jl b3773
	b3774:
	mov rax, rbx
	jmp b3775
	b3773:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3775:
	mov qword [rbp - 4520], rax
	mov rax, qword [rbp - 856]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6656]
	mov r15, rax
	mov rax, qword [rbp - 12392]
	mov r13, rax
	b3776:
	cmp r15, rbx
	jl b3777
	b3778:
	mov rax, r13
	jmp b3779
	b3777:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3779:
	mov rcx, rax
	mov rax, qword [rbp - 5656]
	mov r15, rax
	mov rax, qword [rbp - 4520]
	mov rbx, rax
	mov r13, rcx
	b3780:
	cmp rbx, r15
	jl b3781
	b3782:
	mov rax, r13
	jmp b3783
	b3781:
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
	b3783:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3767:
	mov qword [rbp - 2216], rax
	mov rax, qword [rbp - 6808]
	sub rax, 1
	mov qword [rbp - 13200], rax
	mov rax, qword [rbp - 4640]
	mov qword [rbp - 3888], rax
	mov rax, qword [rbp - 5680]
	mov qword [rbp - 13080], rax
	b3784:
	mov rax, qword [rbp - 3888]
	mov rcx, qword [rbp - 13200]
	cmp rax, rcx
	jl b3785
	b3786:
	mov rax, qword [rbp - 13080]
	jmp b3787
	b3785:
	mov rax, qword [rbp - 13200]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3888]
	mov r13, rax
	mov rax, qword [rbp - 13080]
	mov rbx, rax
	b3788:
	cmp r13, r12
	jl b3789
	b3790:
	mov rax, rbx
	jmp b3791
	b3789:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3791:
	mov qword [rbp - 3232], rax
	mov rax, qword [rbp - 3888]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 13080]
	mov r12, rax
	mov rax, qword [rbp - 13200]
	mov r13, rax
	b3792:
	cmp r12, rbx
	jl b3793
	b3794:
	mov rax, r13
	jmp b3795
	b3793:
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
	b3795:
	mov qword [rbp - 4912], rax
	mov rax, qword [rbp - 13080]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13200]
	mov rbx, rax
	mov rax, qword [rbp - 3888]
	mov r13, rax
	b3796:
	cmp rbx, r14
	jl b3797
	b3798:
	mov rax, r13
	jmp b3799
	b3797:
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
	b3799:
	mov rcx, rax
	mov rax, qword [rbp - 3232]
	mov r14, rax
	mov rax, qword [rbp - 4912]
	mov r15, rax
	mov rbx, rcx
	b3800:
	cmp r15, r14
	jl b3801
	b3802:
	mov rax, rbx
	jmp b3803
	b3801:
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
	b3803:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3787:
	mov qword [rbp - 10248], rax
	mov rax, qword [rbp - 4640]
	sub rax, 1
	mov qword [rbp - 9736], rax
	mov rax, qword [rbp - 5680]
	mov qword [rbp - 6192], rax
	mov rax, qword [rbp - 6808]
	mov qword [rbp - 11496], rax
	b3804:
	mov rcx, qword [rbp - 6192]
	mov rax, qword [rbp - 9736]
	cmp rcx, rax
	jl b3805
	b3806:
	mov rax, qword [rbp - 11496]
	jmp b3807
	b3805:
	mov rax, qword [rbp - 9736]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6192]
	mov r12, rax
	mov rax, qword [rbp - 11496]
	mov r13, rax
	b3808:
	cmp r12, r15
	jl b3809
	b3810:
	mov rax, r13
	jmp b3811
	b3809:
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
	b3811:
	mov qword [rbp - 6088], rax
	mov rax, qword [rbp - 6192]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11496]
	mov r15, rax
	mov rax, qword [rbp - 9736]
	mov r14, rax
	b3812:
	cmp r15, rbx
	jl b3813
	b3814:
	mov rax, r14
	jmp b3815
	b3813:
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
	b3815:
	mov qword [rbp - 5224], rax
	mov rax, qword [rbp - 11496]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9736]
	mov r14, rax
	mov rax, qword [rbp - 6192]
	mov r15, rax
	b3816:
	cmp r14, rbx
	jl b3817
	b3818:
	mov rax, r15
	jmp b3819
	b3817:
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
	b3819:
	mov rcx, rax
	mov rax, qword [rbp - 6088]
	mov r14, rax
	mov rax, qword [rbp - 5224]
	mov r12, rax
	mov r15, rcx
	b3820:
	cmp r12, r14
	jl b3821
	b3822:
	mov rax, r15
	jmp b3823
	b3821:
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
	b3823:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3807:
	mov rcx, rax
	mov rax, qword [rbp - 2216]
	mov qword [rbp - 1320], rax
	mov rax, qword [rbp - 10248]
	mov qword [rbp - 8824], rax
	mov rax, rcx
	mov qword [rbp - 12616], rax
	b3824:
	mov rcx, qword [rbp - 8824]
	mov rax, qword [rbp - 1320]
	cmp rcx, rax
	jl b3825
	b3826:
	mov rax, qword [rbp - 12616]
	jmp b3827
	b3825:
	mov rax, qword [rbp - 1320]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8824]
	mov rbx, rax
	mov rax, qword [rbp - 12616]
	mov r13, rax
	b3828:
	cmp rbx, r12
	jl b3829
	b3830:
	mov rax, r13
	jmp b3831
	b3829:
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
	b3831:
	mov qword [rbp - 6760], rax
	mov rax, qword [rbp - 8824]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12616]
	mov r15, rax
	mov rax, qword [rbp - 1320]
	mov r13, rax
	b3832:
	cmp r15, rbx
	jl b3833
	b3834:
	mov rax, r13
	jmp b3835
	b3833:
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
	b3835:
	mov qword [rbp - 6288], rax
	mov rax, qword [rbp - 12616]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1320]
	mov r14, rax
	mov rax, qword [rbp - 8824]
	mov r12, rax
	b3836:
	cmp r14, r15
	jl b3837
	b3838:
	mov rax, r12
	jmp b3839
	b3837:
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
	b3839:
	mov rcx, rax
	mov rax, qword [rbp - 6760]
	mov rbx, rax
	mov rax, qword [rbp - 6288]
	mov r15, rax
	mov r14, rcx
	b3840:
	cmp r15, rbx
	jl b3841
	b3842:
	mov rax, r14
	jmp b3843
	b3841:
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
	b3843:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3827:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3763:
	mov qword [rbp - 5360], rax
	mov rax, qword [rbp - 11248]
	sub rax, 1
	mov qword [rbp - 1400], rax
	mov rax, qword [rbp - 2136]
	mov qword [rbp - 2584], rax
	mov rax, qword [rbp - 1072]
	mov qword [rbp - 1632], rax
	b3844:
	mov rax, qword [rbp - 2584]
	mov rcx, qword [rbp - 1400]
	cmp rax, rcx
	jl b3845
	b3846:
	mov rax, qword [rbp - 1632]
	jmp b3847
	b3845:
	mov rax, qword [rbp - 1400]
	sub rax, 1
	mov qword [rbp - 10384], rax
	mov rax, qword [rbp - 2584]
	mov qword [rbp - 11968], rax
	mov rax, qword [rbp - 1632]
	mov qword [rbp - 8568], rax
	b3848:
	mov rax, qword [rbp - 11968]
	mov rcx, qword [rbp - 10384]
	cmp rax, rcx
	jl b3849
	b3850:
	mov rax, qword [rbp - 8568]
	jmp b3851
	b3849:
	mov rax, qword [rbp - 10384]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11968]
	mov r15, rax
	mov rax, qword [rbp - 8568]
	mov r12, rax
	b3852:
	cmp r15, r14
	jl b3853
	b3854:
	mov rax, r12
	jmp b3855
	b3853:
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
	b3855:
	mov qword [rbp - 2840], rax
	mov rax, qword [rbp - 11968]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8568]
	mov r15, rax
	mov rax, qword [rbp - 10384]
	mov r13, rax
	b3856:
	cmp r15, rbx
	jl b3857
	b3858:
	mov rax, r13
	jmp b3859
	b3857:
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
	b3859:
	mov qword [rbp - 12264], rax
	mov rax, qword [rbp - 8568]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10384]
	mov r12, rax
	mov rax, qword [rbp - 11968]
	mov rbx, rax
	b3860:
	cmp r12, r14
	jl b3861
	b3862:
	mov rax, rbx
	jmp b3863
	b3861:
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
	b3863:
	mov rcx, rax
	mov rax, qword [rbp - 2840]
	mov r15, rax
	mov rax, qword [rbp - 12264]
	mov rbx, rax
	mov r14, rcx
	b3864:
	cmp rbx, r15
	jl b3865
	b3866:
	mov rax, r14
	jmp b3867
	b3865:
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
	b3867:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3851:
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 2584]
	sub rax, 1
	mov qword [rbp - 2720], rax
	mov rax, qword [rbp - 1632]
	mov qword [rbp - 3560], rax
	mov rax, qword [rbp - 1400]
	mov qword [rbp - 12424], rax
	b3868:
	mov rax, qword [rbp - 3560]
	mov rcx, qword [rbp - 2720]
	cmp rax, rcx
	jl b3869
	b3870:
	mov rax, qword [rbp - 12424]
	jmp b3871
	b3869:
	mov rax, qword [rbp - 2720]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3560]
	mov r14, rax
	mov rax, qword [rbp - 12424]
	mov rbx, rax
	b3872:
	cmp r14, r15
	jl b3873
	b3874:
	mov rax, rbx
	jmp b3875
	b3873:
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
	b3875:
	mov qword [rbp - 5336], rax
	mov rax, qword [rbp - 3560]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12424]
	mov r12, rax
	mov rax, qword [rbp - 2720]
	mov r13, rax
	b3876:
	cmp r12, r14
	jl b3877
	b3878:
	mov rax, r13
	jmp b3879
	b3877:
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
	b3879:
	mov qword [rbp - 9296], rax
	mov rax, qword [rbp - 12424]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2720]
	mov r14, rax
	mov rax, qword [rbp - 3560]
	mov rbx, rax
	b3880:
	cmp r14, r12
	jl b3881
	b3882:
	mov rax, rbx
	jmp b3883
	b3881:
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
	b3883:
	mov rcx, qword [rbp - 5336]
	mov r15, rcx
	mov rcx, qword [rbp - 9296]
	mov r14, rcx
	mov rbx, rax
	b3884:
	cmp r14, r15
	jl b3885
	b3886:
	mov rax, rbx
	jmp b3887
	b3885:
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
	b3887:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3871:
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 1632]
	sub rax, 1
	mov qword [rbp - 2312], rax
	mov rax, qword [rbp - 1400]
	mov qword [rbp - 4040], rax
	mov rax, qword [rbp - 2584]
	mov qword [rbp - 9480], rax
	b3888:
	mov rcx, qword [rbp - 4040]
	mov rax, qword [rbp - 2312]
	cmp rcx, rax
	jl b3889
	b3890:
	mov rax, qword [rbp - 9480]
	jmp b3891
	b3889:
	mov rax, qword [rbp - 2312]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4040]
	mov rbx, rax
	mov rax, qword [rbp - 9480]
	mov r13, rax
	b3892:
	cmp rbx, r12
	jl b3893
	b3894:
	mov rax, r13
	jmp b3895
	b3893:
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
	b3895:
	mov qword [rbp - 6320], rax
	mov rax, qword [rbp - 4040]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9480]
	mov r14, rax
	mov rax, qword [rbp - 2312]
	mov r12, rax
	b3896:
	cmp r14, rbx
	jl b3897
	b3898:
	mov rax, r12
	jmp b3899
	b3897:
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
	b3899:
	mov qword [rbp - 10952], rax
	mov rax, qword [rbp - 9480]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2312]
	mov r13, rax
	mov rax, qword [rbp - 4040]
	mov r14, rax
	b3900:
	cmp r13, r12
	jl b3901
	b3902:
	mov rax, r14
	jmp b3903
	b3901:
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
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r15
	mov rdi, rbx
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3903:
	mov rcx, qword [rbp - 6320]
	mov r12, rcx
	mov rcx, qword [rbp - 10952]
	mov r13, rcx
	mov r15, rax
	b3904:
	cmp r13, r12
	jl b3905
	b3906:
	mov rax, r15
	jmp b3907
	b3905:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
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
	b3907:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3891:
	mov rcx, rax
	mov rax, qword [rbp - 304]
	mov qword [rbp - 3200], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 2424], rax
	mov rax, rcx
	mov qword [rbp - 5896], rax
	b3908:
	mov rax, qword [rbp - 2424]
	mov rcx, qword [rbp - 3200]
	cmp rax, rcx
	jl b3909
	b3910:
	mov rax, qword [rbp - 5896]
	jmp b3911
	b3909:
	mov rax, qword [rbp - 3200]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2424]
	mov r14, rax
	mov rax, qword [rbp - 5896]
	mov r15, rax
	b3912:
	cmp r14, r13
	jl b3913
	b3914:
	mov rax, r15
	jmp b3915
	b3913:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3915:
	mov qword [rbp - 8456], rax
	mov rax, qword [rbp - 2424]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5896]
	mov r12, rax
	mov rax, qword [rbp - 3200]
	mov r13, rax
	b3916:
	cmp r12, r15
	jl b3917
	b3918:
	mov rax, r13
	jmp b3919
	b3917:
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
	b3919:
	mov qword [rbp - 2120], rax
	mov rax, qword [rbp - 5896]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3200]
	mov r12, rax
	mov rax, qword [rbp - 2424]
	mov r15, rax
	b3920:
	cmp r12, r14
	jl b3921
	b3922:
	mov rax, r15
	jmp b3923
	b3921:
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
	b3923:
	mov rcx, qword [rbp - 8456]
	mov r14, rcx
	mov rcx, qword [rbp - 2120]
	mov r15, rcx
	mov rbx, rax
	b3924:
	cmp r15, r14
	jl b3925
	b3926:
	mov rax, rbx
	jmp b3927
	b3925:
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
	b3927:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3911:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3847:
	mov qword [rbp - 5384], rax
	mov rax, qword [rbp - 2136]
	sub rax, 1
	mov qword [rbp - 4456], rax
	mov rax, qword [rbp - 1072]
	mov qword [rbp - 9792], rax
	mov rax, qword [rbp - 11248]
	mov qword [rbp - 7720], rax
	b3928:
	mov rcx, qword [rbp - 9792]
	mov rax, qword [rbp - 4456]
	cmp rcx, rax
	jl b3929
	b3930:
	mov rax, qword [rbp - 7720]
	jmp b3931
	b3929:
	mov rax, qword [rbp - 4456]
	sub rax, 1
	mov qword [rbp - 6112], rax
	mov rax, qword [rbp - 9792]
	mov qword [rbp - 3520], rax
	mov rax, qword [rbp - 7720]
	mov qword [rbp - 13216], rax
	b3932:
	mov rax, qword [rbp - 3520]
	mov rcx, qword [rbp - 6112]
	cmp rax, rcx
	jl b3933
	b3934:
	mov rax, qword [rbp - 13216]
	jmp b3935
	b3933:
	mov rax, qword [rbp - 6112]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3520]
	mov r15, rax
	mov rax, qword [rbp - 13216]
	mov r14, rax
	b3936:
	cmp r15, r12
	jl b3937
	b3938:
	mov rax, r14
	jmp b3939
	b3937:
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
	b3939:
	mov qword [rbp - 9664], rax
	mov rax, qword [rbp - 3520]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 13216]
	mov r12, rax
	mov rax, qword [rbp - 6112]
	mov r15, rax
	b3940:
	cmp r12, rbx
	jl b3941
	b3942:
	mov rax, r15
	jmp b3943
	b3941:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b3943:
	mov qword [rbp - 7344], rax
	mov rax, qword [rbp - 13216]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6112]
	mov r15, rax
	mov rax, qword [rbp - 3520]
	mov r13, rax
	b3944:
	cmp r15, rbx
	jl b3945
	b3946:
	mov rax, r13
	jmp b3947
	b3945:
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
	b3947:
	mov rcx, rax
	mov rax, qword [rbp - 9664]
	mov r15, rax
	mov rax, qword [rbp - 7344]
	mov r13, rax
	mov rbx, rcx
	b3948:
	cmp r13, r15
	jl b3949
	b3950:
	mov rax, rbx
	jmp b3951
	b3949:
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
	b3951:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3935:
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 9792]
	sub rax, 1
	mov qword [rbp - 5648], rax
	mov rax, qword [rbp - 7720]
	mov qword [rbp - 3184], rax
	mov rax, qword [rbp - 4456]
	mov qword [rbp - 6768], rax
	b3952:
	mov rax, qword [rbp - 3184]
	mov rcx, qword [rbp - 5648]
	cmp rax, rcx
	jl b3953
	b3954:
	mov rax, qword [rbp - 6768]
	jmp b3955
	b3953:
	mov rax, qword [rbp - 5648]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3184]
	mov r14, rax
	mov rax, qword [rbp - 6768]
	mov rbx, rax
	b3956:
	cmp r14, r15
	jl b3957
	b3958:
	mov rax, rbx
	jmp b3959
	b3957:
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
	b3959:
	mov qword [rbp - 11232], rax
	mov rax, qword [rbp - 3184]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6768]
	mov r15, rax
	mov rax, qword [rbp - 5648]
	mov r12, rax
	b3960:
	cmp r15, r14
	jl b3961
	b3962:
	mov rax, r12
	jmp b3963
	b3961:
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
	b3963:
	mov qword [rbp - 10640], rax
	mov rax, qword [rbp - 6768]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5648]
	mov rbx, rax
	mov rax, qword [rbp - 3184]
	mov r13, rax
	b3964:
	cmp rbx, r12
	jl b3965
	b3966:
	mov rax, r13
	jmp b3967
	b3965:
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
	b3967:
	mov rcx, rax
	mov rax, qword [rbp - 11232]
	mov r15, rax
	mov rax, qword [rbp - 10640]
	mov r12, rax
	mov r14, rcx
	b3968:
	cmp r12, r15
	jl b3969
	b3970:
	mov rax, r14
	jmp b3971
	b3969:
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
	b3971:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3955:
	mov qword [rbp - 10840], rax
	mov rax, qword [rbp - 7720]
	sub rax, 1
	mov qword [rbp - 5272], rax
	mov rax, qword [rbp - 4456]
	mov qword [rbp - 6304], rax
	mov rax, qword [rbp - 9792]
	mov qword [rbp - 12296], rax
	b3972:
	mov rcx, qword [rbp - 6304]
	mov rax, qword [rbp - 5272]
	cmp rcx, rax
	jl b3973
	b3974:
	mov rax, qword [rbp - 12296]
	jmp b3975
	b3973:
	mov rax, qword [rbp - 5272]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6304]
	mov r15, rax
	mov rax, qword [rbp - 12296]
	mov r13, rax
	b3976:
	cmp r15, rbx
	jl b3977
	b3978:
	mov rax, r13
	jmp b3979
	b3977:
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
	b3979:
	mov qword [rbp - 7080], rax
	mov rax, qword [rbp - 6304]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12296]
	mov r14, rax
	mov rax, qword [rbp - 5272]
	mov rbx, rax
	b3980:
	cmp r14, r15
	jl b3981
	b3982:
	mov rax, rbx
	jmp b3983
	b3981:
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
	b3983:
	mov qword [rbp - 3584], rax
	mov rax, qword [rbp - 12296]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5272]
	mov r14, rax
	mov rax, qword [rbp - 6304]
	mov r13, rax
	b3984:
	cmp r14, r12
	jl b3985
	b3986:
	mov rax, r13
	jmp b3987
	b3985:
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
	b3987:
	mov rcx, rax
	mov rax, qword [rbp - 7080]
	mov rbx, rax
	mov rax, qword [rbp - 3584]
	mov r12, rax
	mov r14, rcx
	b3988:
	cmp r12, rbx
	jl b3989
	b3990:
	mov rax, r14
	jmp b3991
	b3989:
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
	b3991:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3975:
	mov rcx, rax
	mov rax, qword [rbp - 192]
	mov qword [rbp - 12408], rax
	mov rax, qword [rbp - 10840]
	mov qword [rbp - 4448], rax
	mov rax, rcx
	mov qword [rbp - 1328], rax
	b3992:
	mov rax, qword [rbp - 4448]
	mov rcx, qword [rbp - 12408]
	cmp rax, rcx
	jl b3993
	b3994:
	mov rax, qword [rbp - 1328]
	jmp b3995
	b3993:
	mov rax, qword [rbp - 12408]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4448]
	mov r12, rax
	mov rax, qword [rbp - 1328]
	mov r15, rax
	b3996:
	cmp r12, rbx
	jl b3997
	b3998:
	mov rax, r15
	jmp b3999
	b3997:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3999:
	mov qword [rbp - 2072], rax
	mov rax, qword [rbp - 4448]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1328]
	mov r14, rax
	mov rax, qword [rbp - 12408]
	mov rbx, rax
	b4000:
	cmp r14, r15
	jl b4001
	b4002:
	mov rax, rbx
	jmp b4003
	b4001:
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
	b4003:
	mov qword [rbp - 6936], rax
	mov rax, qword [rbp - 1328]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12408]
	mov r12, rax
	mov rax, qword [rbp - 4448]
	mov r13, rax
	b4004:
	cmp r12, r15
	jl b4005
	b4006:
	mov rax, r13
	jmp b4007
	b4005:
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
	b4007:
	mov rcx, qword [rbp - 2072]
	mov r15, rcx
	mov rcx, qword [rbp - 6936]
	mov rbx, rcx
	mov r13, rax
	b4008:
	cmp rbx, r15
	jl b4009
	b4010:
	mov rax, r13
	jmp b4011
	b4009:
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
	b4011:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b3995:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3931:
	mov rcx, qword [rbp - 5360]
	mov qword [rbp - 264], rcx
	mov rcx, qword [rbp - 5384]
	mov qword [rbp - 7136], rcx
	mov qword [rbp - 5544], rax
	b4012:
	mov rax, qword [rbp - 7136]
	mov rcx, qword [rbp - 264]
	cmp rax, rcx
	jl b4013
	b4014:
	mov rax, qword [rbp - 5544]
	jmp b4015
	b4013:
	mov rax, qword [rbp - 264]
	sub rax, 1
	mov qword [rbp - 2104], rax
	mov rax, qword [rbp - 7136]
	mov qword [rbp - 10688], rax
	mov rax, qword [rbp - 5544]
	mov qword [rbp - 7048], rax
	b4016:
	mov rcx, qword [rbp - 10688]
	mov rax, qword [rbp - 2104]
	cmp rcx, rax
	jl b4017
	b4018:
	mov rax, qword [rbp - 7048]
	jmp b4019
	b4017:
	mov rax, qword [rbp - 2104]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10688]
	mov r14, rax
	mov rax, qword [rbp - 7048]
	mov rbx, rax
	b4020:
	cmp r14, r15
	jl b4021
	b4022:
	mov rax, rbx
	jmp b4023
	b4021:
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
	b4023:
	mov qword [rbp - 6328], rax
	mov rax, qword [rbp - 10688]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7048]
	mov r14, rax
	mov rax, qword [rbp - 2104]
	mov r13, rax
	b4024:
	cmp r14, rbx
	jl b4025
	b4026:
	mov rax, r13
	jmp b4027
	b4025:
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
	b4027:
	mov qword [rbp - 3208], rax
	mov rax, qword [rbp - 7048]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2104]
	mov r12, rax
	mov rax, qword [rbp - 10688]
	mov r15, rax
	b4028:
	cmp r12, rbx
	jl b4029
	b4030:
	mov rax, r15
	jmp b4031
	b4029:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b4031:
	mov rcx, rax
	mov rax, qword [rbp - 6328]
	mov r15, rax
	mov rax, qword [rbp - 3208]
	mov r14, rax
	mov r13, rcx
	b4032:
	cmp r14, r15
	jl b4033
	b4034:
	mov rax, r13
	jmp b4035
	b4033:
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
	b4035:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4019:
	mov qword [rbp - 8096], rax
	mov rax, qword [rbp - 7136]
	sub rax, 1
	mov qword [rbp - 3336], rax
	mov rax, qword [rbp - 5544]
	mov qword [rbp - 6216], rax
	mov rax, qword [rbp - 264]
	mov qword [rbp - 6400], rax
	b4036:
	mov rcx, qword [rbp - 6216]
	mov rax, qword [rbp - 3336]
	cmp rcx, rax
	jl b4037
	b4038:
	mov rax, qword [rbp - 6400]
	jmp b4039
	b4037:
	mov rax, qword [rbp - 3336]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6216]
	mov r12, rax
	mov rax, qword [rbp - 6400]
	mov r15, rax
	b4040:
	cmp r12, rbx
	jl b4041
	b4042:
	mov rax, r15
	jmp b4043
	b4041:
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
	b4043:
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 6216]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6400]
	mov rbx, rax
	mov rax, qword [rbp - 3336]
	mov r12, rax
	b4044:
	cmp rbx, r14
	jl b4045
	b4046:
	mov rax, r12
	jmp b4047
	b4045:
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
	b4047:
	mov qword [rbp - 1760], rax
	mov rax, qword [rbp - 6400]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3336]
	mov r14, rax
	mov rax, qword [rbp - 6216]
	mov r12, rax
	b4048:
	cmp r14, rbx
	jl b4049
	b4050:
	mov rax, r12
	jmp b4051
	b4049:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4051:
	mov rcx, rax
	mov rax, qword [rbp - 168]
	mov r15, rax
	mov rax, qword [rbp - 1760]
	mov rbx, rax
	mov r13, rcx
	b4052:
	cmp rbx, r15
	jl b4053
	b4054:
	mov rax, r13
	jmp b4055
	b4053:
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
	b4055:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4039:
	mov qword [rbp - 7432], rax
	mov rax, qword [rbp - 5544]
	sub rax, 1
	mov qword [rbp - 1752], rax
	mov rax, qword [rbp - 264]
	mov qword [rbp - 5560], rax
	mov rax, qword [rbp - 7136]
	mov qword [rbp - 2432], rax
	b4056:
	mov rcx, qword [rbp - 5560]
	mov rax, qword [rbp - 1752]
	cmp rcx, rax
	jl b4057
	b4058:
	mov rax, qword [rbp - 2432]
	jmp b4059
	b4057:
	mov rax, qword [rbp - 1752]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5560]
	mov r14, rax
	mov rax, qword [rbp - 2432]
	mov r13, rax
	b4060:
	cmp r14, rbx
	jl b4061
	b4062:
	mov rax, r13
	jmp b4063
	b4061:
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
	b4063:
	mov qword [rbp - 3048], rax
	mov rax, qword [rbp - 5560]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2432]
	mov r12, rax
	mov rax, qword [rbp - 1752]
	mov r14, rax
	b4064:
	cmp r12, r15
	jl b4065
	b4066:
	mov rax, r14
	jmp b4067
	b4065:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b4067:
	mov qword [rbp - 1120], rax
	mov rax, qword [rbp - 2432]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1752]
	mov r12, rax
	mov rax, qword [rbp - 5560]
	mov rbx, rax
	b4068:
	cmp r12, r15
	jl b4069
	b4070:
	mov rax, rbx
	jmp b4071
	b4069:
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
	b4071:
	mov rcx, rax
	mov rax, qword [rbp - 3048]
	mov rbx, rax
	mov rax, qword [rbp - 1120]
	mov r14, rax
	mov r12, rcx
	b4072:
	cmp r14, rbx
	jl b4073
	b4074:
	mov rax, r12
	jmp b4075
	b4073:
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
	b4075:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4059:
	mov rcx, qword [rbp - 8096]
	mov qword [rbp - 11528], rcx
	mov rcx, qword [rbp - 7432]
	mov qword [rbp - 4232], rcx
	mov qword [rbp - 10200], rax
	b4076:
	mov rcx, qword [rbp - 4232]
	mov rax, qword [rbp - 11528]
	cmp rcx, rax
	jl b4077
	b4078:
	mov rax, qword [rbp - 10200]
	jmp b4079
	b4077:
	mov rax, qword [rbp - 11528]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4232]
	mov r13, rax
	mov rax, qword [rbp - 10200]
	mov r15, rax
	b4080:
	cmp r13, rbx
	jl b4081
	b4082:
	mov rax, r15
	jmp b4083
	b4081:
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
	b4083:
	mov qword [rbp - 13640], rax
	mov rax, qword [rbp - 4232]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10200]
	mov r14, rax
	mov rax, qword [rbp - 11528]
	mov r15, rax
	b4084:
	cmp r14, rbx
	jl b4085
	b4086:
	mov rax, r15
	jmp b4087
	b4085:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4087:
	mov qword [rbp - 3984], rax
	mov rax, qword [rbp - 10200]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11528]
	mov rbx, rax
	mov rax, qword [rbp - 4232]
	mov r15, rax
	b4088:
	cmp rbx, r14
	jl b4089
	b4090:
	mov rax, r15
	jmp b4091
	b4089:
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
	b4091:
	mov rcx, rax
	mov rax, qword [rbp - 13640]
	mov r15, rax
	mov rax, qword [rbp - 3984]
	mov r12, rax
	mov r14, rcx
	b4092:
	cmp r12, r15
	jl b4093
	b4094:
	mov rax, r14
	jmp b4095
	b4093:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b4095:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4079:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4015:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b3759:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b2735:
	mov rcx, rax
	mov rax, qword [rbp - 1792]
	mov qword [rbp - 9944], rax
	mov rax, qword [rbp - 9320]
	mov qword [rbp - 11064], rax
	mov rax, rcx
	mov qword [rbp - 10192], rax
	b4096:
	mov rax, qword [rbp - 11064]
	mov rcx, qword [rbp - 9944]
	cmp rax, rcx
	jl b4097
	b4098:
	mov rax, qword [rbp - 10192]
	jmp b4099
	b4097:
	mov rax, qword [rbp - 9944]
	sub rax, 1
	mov qword [rbp - 6136], rax
	mov rax, qword [rbp - 11064]
	mov qword [rbp - 9816], rax
	mov rax, qword [rbp - 10192]
	mov qword [rbp - 4144], rax
	b4100:
	mov rax, qword [rbp - 9816]
	mov rcx, qword [rbp - 6136]
	cmp rax, rcx
	jl b4101
	b4102:
	mov rax, qword [rbp - 4144]
	jmp b4103
	b4101:
	mov rax, qword [rbp - 6136]
	sub rax, 1
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 9816]
	mov qword [rbp - 3328], rax
	mov rax, qword [rbp - 4144]
	mov qword [rbp - 11328], rax
	b4104:
	mov rax, qword [rbp - 3328]
	mov rcx, qword [rbp - 400]
	cmp rax, rcx
	jl b4105
	b4106:
	mov rax, qword [rbp - 11328]
	jmp b4107
	b4105:
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov qword [rbp - 12064], rax
	mov rax, qword [rbp - 3328]
	mov qword [rbp - 11216], rax
	mov rax, qword [rbp - 11328]
	mov qword [rbp - 8080], rax
	b4108:
	mov rcx, qword [rbp - 11216]
	mov rax, qword [rbp - 12064]
	cmp rcx, rax
	jl b4109
	b4110:
	mov rax, qword [rbp - 8080]
	jmp b4111
	b4109:
	mov rax, qword [rbp - 12064]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11216]
	mov r12, rax
	mov rax, qword [rbp - 8080]
	mov rbx, rax
	b4112:
	cmp r12, r15
	jl b4113
	b4114:
	mov rax, rbx
	jmp b4115
	b4113:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4115:
	mov qword [rbp - 744], rax
	mov rax, qword [rbp - 11216]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 8080]
	mov r12, rax
	mov rax, qword [rbp - 12064]
	mov rbx, rax
	b4116:
	cmp r12, r13
	jl b4117
	b4118:
	mov rax, rbx
	jmp b4119
	b4117:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4119:
	mov qword [rbp - 12456], rax
	mov rax, qword [rbp - 8080]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12064]
	mov r15, rax
	mov rax, qword [rbp - 11216]
	mov rbx, rax
	b4120:
	cmp r15, r12
	jl b4121
	b4122:
	mov rax, rbx
	jmp b4123
	b4121:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4123:
	mov rcx, rax
	mov rax, qword [rbp - 744]
	mov r14, rax
	mov rax, qword [rbp - 12456]
	mov r12, rax
	mov r13, rcx
	b4124:
	cmp r12, r14
	jl b4125
	b4126:
	mov rax, r13
	jmp b4127
	b4125:
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
	b4127:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4111:
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 3328]
	sub rax, 1
	mov qword [rbp - 4712], rax
	mov rax, qword [rbp - 11328]
	mov qword [rbp - 9672], rax
	mov rax, qword [rbp - 400]
	mov qword [rbp - 4272], rax
	b4128:
	mov rcx, qword [rbp - 9672]
	mov rax, qword [rbp - 4712]
	cmp rcx, rax
	jl b4129
	b4130:
	mov rax, qword [rbp - 4272]
	jmp b4131
	b4129:
	mov rax, qword [rbp - 4712]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9672]
	mov r13, rax
	mov rax, qword [rbp - 4272]
	mov rbx, rax
	b4132:
	cmp r13, r12
	jl b4133
	b4134:
	mov rax, rbx
	jmp b4135
	b4133:
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
	b4135:
	mov qword [rbp - 5056], rax
	mov rax, qword [rbp - 9672]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4272]
	mov r15, rax
	mov rax, qword [rbp - 4712]
	mov r13, rax
	b4136:
	cmp r15, r14
	jl b4137
	b4138:
	mov rax, r13
	jmp b4139
	b4137:
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
	b4139:
	mov qword [rbp - 7856], rax
	mov rax, qword [rbp - 4272]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4712]
	mov rbx, rax
	mov rax, qword [rbp - 9672]
	mov r15, rax
	b4140:
	cmp rbx, r14
	jl b4141
	b4142:
	mov rax, r15
	jmp b4143
	b4141:
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
	b4143:
	mov rcx, rax
	mov rax, qword [rbp - 5056]
	mov r15, rax
	mov rax, qword [rbp - 7856]
	mov rbx, rax
	mov r13, rcx
	b4144:
	cmp rbx, r15
	jl b4145
	b4146:
	mov rax, r13
	jmp b4147
	b4145:
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
	b4147:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4131:
	mov qword [rbp - 10296], rax
	mov rax, qword [rbp - 11328]
	sub rax, 1
	mov qword [rbp - 8200], rax
	mov rax, qword [rbp - 400]
	mov qword [rbp - 11168], rax
	mov rax, qword [rbp - 3328]
	mov qword [rbp - 9512], rax
	b4148:
	mov rcx, qword [rbp - 11168]
	mov rax, qword [rbp - 8200]
	cmp rcx, rax
	jl b4149
	b4150:
	mov rax, qword [rbp - 9512]
	jmp b4151
	b4149:
	mov rax, qword [rbp - 8200]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11168]
	mov r13, rax
	mov rax, qword [rbp - 9512]
	mov rbx, rax
	b4152:
	cmp r13, r14
	jl b4153
	b4154:
	mov rax, rbx
	jmp b4155
	b4153:
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
	b4155:
	mov qword [rbp - 12856], rax
	mov rax, qword [rbp - 11168]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9512]
	mov r15, rax
	mov rax, qword [rbp - 8200]
	mov rbx, rax
	b4156:
	cmp r15, r14
	jl b4157
	b4158:
	mov rax, rbx
	jmp b4159
	b4157:
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
	b4159:
	mov qword [rbp - 4072], rax
	mov rax, qword [rbp - 9512]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8200]
	mov r15, rax
	mov rax, qword [rbp - 11168]
	mov r13, rax
	b4160:
	cmp r15, rbx
	jl b4161
	b4162:
	mov rax, r13
	jmp b4163
	b4161:
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
	b4163:
	mov rcx, rax
	mov rax, qword [rbp - 12856]
	mov r12, rax
	mov rax, qword [rbp - 4072]
	mov rbx, rax
	mov r13, rcx
	b4164:
	cmp rbx, r12
	jl b4165
	b4166:
	mov rax, r13
	jmp b4167
	b4165:
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
	b4167:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4151:
	mov rcx, rax
	mov rax, qword [rbp - 728]
	mov qword [rbp - 8864], rax
	mov rax, qword [rbp - 10296]
	mov qword [rbp - 3536], rax
	mov rax, rcx
	mov qword [rbp - 2304], rax
	b4168:
	mov rax, qword [rbp - 3536]
	mov rcx, qword [rbp - 8864]
	cmp rax, rcx
	jl b4169
	b4170:
	mov rax, qword [rbp - 2304]
	jmp b4171
	b4169:
	mov rax, qword [rbp - 8864]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3536]
	mov r15, rax
	mov rax, qword [rbp - 2304]
	mov r12, rax
	b4172:
	cmp r15, rbx
	jl b4173
	b4174:
	mov rax, r12
	jmp b4175
	b4173:
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
	b4175:
	mov qword [rbp - 2568], rax
	mov rax, qword [rbp - 3536]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2304]
	mov rbx, rax
	mov rax, qword [rbp - 8864]
	mov r15, rax
	b4176:
	cmp rbx, r12
	jl b4177
	b4178:
	mov rax, r15
	jmp b4179
	b4177:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4179:
	mov qword [rbp - 11456], rax
	mov rax, qword [rbp - 2304]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8864]
	mov r12, rax
	mov rax, qword [rbp - 3536]
	mov r13, rax
	b4180:
	cmp r12, r15
	jl b4181
	b4182:
	mov rax, r13
	jmp b4183
	b4181:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4183:
	mov rcx, rax
	mov rax, qword [rbp - 2568]
	mov r13, rax
	mov rax, qword [rbp - 11456]
	mov r14, rax
	mov r15, rcx
	b4184:
	cmp r14, r13
	jl b4185
	b4186:
	mov rax, r15
	jmp b4187
	b4185:
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
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4187:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4171:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4107:
	mov qword [rbp - 1416], rax
	mov rax, qword [rbp - 9816]
	sub rax, 1
	mov qword [rbp - 3104], rax
	mov rax, qword [rbp - 4144]
	mov qword [rbp - 11544], rax
	mov rax, qword [rbp - 6136]
	mov qword [rbp - 11144], rax
	b4188:
	mov rax, qword [rbp - 11544]
	mov rcx, qword [rbp - 3104]
	cmp rax, rcx
	jl b4189
	b4190:
	mov rax, qword [rbp - 11144]
	jmp b4191
	b4189:
	mov rax, qword [rbp - 3104]
	sub rax, 1
	mov qword [rbp - 1496], rax
	mov rax, qword [rbp - 11544]
	mov qword [rbp - 7976], rax
	mov rax, qword [rbp - 11144]
	mov qword [rbp - 9656], rax
	b4192:
	mov rax, qword [rbp - 7976]
	mov rcx, qword [rbp - 1496]
	cmp rax, rcx
	jl b4193
	b4194:
	mov rax, qword [rbp - 9656]
	jmp b4195
	b4193:
	mov rax, qword [rbp - 1496]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7976]
	mov rbx, rax
	mov rax, qword [rbp - 9656]
	mov r13, rax
	b4196:
	cmp rbx, r14
	jl b4197
	b4198:
	mov rax, r13
	jmp b4199
	b4197:
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
	b4199:
	mov qword [rbp - 13280], rax
	mov rax, qword [rbp - 7976]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9656]
	mov rbx, rax
	mov rax, qword [rbp - 1496]
	mov r13, rax
	b4200:
	cmp rbx, r15
	jl b4201
	b4202:
	mov rax, r13
	jmp b4203
	b4201:
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
	b4203:
	mov qword [rbp - 12104], rax
	mov rax, qword [rbp - 9656]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1496]
	mov r14, rax
	mov rax, qword [rbp - 7976]
	mov r13, rax
	b4204:
	cmp r14, r12
	jl b4205
	b4206:
	mov rax, r13
	jmp b4207
	b4205:
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
	b4207:
	mov rcx, rax
	mov rax, qword [rbp - 13280]
	mov r14, rax
	mov rax, qword [rbp - 12104]
	mov r15, rax
	mov r13, rcx
	b4208:
	cmp r15, r14
	jl b4209
	b4210:
	mov rax, r13
	jmp b4211
	b4209:
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
	b4211:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4195:
	mov qword [rbp - 8048], rax
	mov rax, qword [rbp - 11544]
	sub rax, 1
	mov qword [rbp - 5072], rax
	mov rax, qword [rbp - 11144]
	mov qword [rbp - 10936], rax
	mov rax, qword [rbp - 3104]
	mov qword [rbp - 11728], rax
	b4212:
	mov rax, qword [rbp - 10936]
	mov rcx, qword [rbp - 5072]
	cmp rax, rcx
	jl b4213
	b4214:
	mov rax, qword [rbp - 11728]
	jmp b4215
	b4213:
	mov rax, qword [rbp - 5072]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10936]
	mov rbx, rax
	mov rax, qword [rbp - 11728]
	mov r13, rax
	b4216:
	cmp rbx, r14
	jl b4217
	b4218:
	mov rax, r13
	jmp b4219
	b4217:
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
	b4219:
	mov qword [rbp - 10416], rax
	mov rax, qword [rbp - 10936]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11728]
	mov r14, rax
	mov rax, qword [rbp - 5072]
	mov rbx, rax
	b4220:
	cmp r14, r15
	jl b4221
	b4222:
	mov rax, rbx
	jmp b4223
	b4221:
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
	b4223:
	mov qword [rbp - 7912], rax
	mov rax, qword [rbp - 11728]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 5072]
	mov r15, rax
	mov rax, qword [rbp - 10936]
	mov r14, rax
	b4224:
	cmp r15, r12
	jl b4225
	b4226:
	mov rax, r14
	jmp b4227
	b4225:
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
	b4227:
	mov rcx, rax
	mov rax, qword [rbp - 10416]
	mov r12, rax
	mov rax, qword [rbp - 7912]
	mov rbx, rax
	mov r13, rcx
	b4228:
	cmp rbx, r12
	jl b4229
	b4230:
	mov rax, r13
	jmp b4231
	b4229:
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
	b4231:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4215:
	mov qword [rbp - 10872], rax
	mov rax, qword [rbp - 11144]
	sub rax, 1
	mov qword [rbp - 5840], rax
	mov rax, qword [rbp - 3104]
	mov qword [rbp - 3504], rax
	mov rax, qword [rbp - 11544]
	mov qword [rbp - 12344], rax
	b4232:
	mov rax, qword [rbp - 3504]
	mov rcx, qword [rbp - 5840]
	cmp rax, rcx
	jl b4233
	b4234:
	mov rax, qword [rbp - 12344]
	jmp b4235
	b4233:
	mov rax, qword [rbp - 5840]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3504]
	mov r14, rax
	mov rax, qword [rbp - 12344]
	mov r13, rax
	b4236:
	cmp r14, r12
	jl b4237
	b4238:
	mov rax, r13
	jmp b4239
	b4237:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4239:
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 3504]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 12344]
	mov r14, rax
	mov rax, qword [rbp - 5840]
	mov rbx, rax
	b4240:
	cmp r14, r12
	jl b4241
	b4242:
	mov rax, rbx
	jmp b4243
	b4241:
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
	b4243:
	mov qword [rbp - 12176], rax
	mov rax, qword [rbp - 12344]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5840]
	mov r15, rax
	mov rax, qword [rbp - 3504]
	mov r14, rax
	b4244:
	cmp r15, rbx
	jl b4245
	b4246:
	mov rax, r14
	jmp b4247
	b4245:
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
	b4247:
	mov rcx, rax
	mov rax, qword [rbp - 696]
	mov r14, rax
	mov rax, qword [rbp - 12176]
	mov r15, rax
	mov r13, rcx
	b4248:
	cmp r15, r14
	jl b4249
	b4250:
	mov rax, r13
	jmp b4251
	b4249:
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
	b4251:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4235:
	mov rcx, rax
	mov rax, qword [rbp - 8048]
	mov qword [rbp - 7568], rax
	mov rax, qword [rbp - 10872]
	mov qword [rbp - 7608], rax
	mov rax, rcx
	mov qword [rbp - 8280], rax
	b4252:
	mov rax, qword [rbp - 7608]
	mov rcx, qword [rbp - 7568]
	cmp rax, rcx
	jl b4253
	b4254:
	mov rax, qword [rbp - 8280]
	jmp b4255
	b4253:
	mov rax, qword [rbp - 7568]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 7608]
	mov rbx, rax
	mov rax, qword [rbp - 8280]
	mov r13, rax
	b4256:
	cmp rbx, r12
	jl b4257
	b4258:
	mov rax, r13
	jmp b4259
	b4257:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4259:
	mov qword [rbp - 4984], rax
	mov rax, qword [rbp - 7608]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8280]
	mov r13, rax
	mov rax, qword [rbp - 7568]
	mov rbx, rax
	b4260:
	cmp r13, r12
	jl b4261
	b4262:
	mov rax, rbx
	jmp b4263
	b4261:
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
	b4263:
	mov qword [rbp - 12768], rax
	mov rax, qword [rbp - 8280]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7568]
	mov r15, rax
	mov rax, qword [rbp - 7608]
	mov r14, rax
	b4264:
	cmp r15, rbx
	jl b4265
	b4266:
	mov rax, r14
	jmp b4267
	b4265:
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
	b4267:
	mov rcx, rax
	mov rax, qword [rbp - 4984]
	mov r15, rax
	mov rax, qword [rbp - 12768]
	mov r14, rax
	mov r13, rcx
	b4268:
	cmp r14, r15
	jl b4269
	b4270:
	mov rax, r13
	jmp b4271
	b4269:
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
	b4271:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4255:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4191:
	mov qword [rbp - 8024], rax
	mov rax, qword [rbp - 4144]
	sub rax, 1
	mov qword [rbp - 12568], rax
	mov rax, qword [rbp - 6136]
	mov qword [rbp - 13312], rax
	mov rax, qword [rbp - 9816]
	mov qword [rbp - 12984], rax
	b4272:
	mov rcx, qword [rbp - 13312]
	mov rax, qword [rbp - 12568]
	cmp rcx, rax
	jl b4273
	b4274:
	mov rax, qword [rbp - 12984]
	jmp b4275
	b4273:
	mov rax, qword [rbp - 12568]
	sub rax, 1
	mov qword [rbp - 5200], rax
	mov rax, qword [rbp - 13312]
	mov qword [rbp - 7216], rax
	mov rax, qword [rbp - 12984]
	mov qword [rbp - 11696], rax
	b4276:
	mov rax, qword [rbp - 7216]
	mov rcx, qword [rbp - 5200]
	cmp rax, rcx
	jl b4277
	b4278:
	mov rax, qword [rbp - 11696]
	jmp b4279
	b4277:
	mov rax, qword [rbp - 5200]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7216]
	mov r15, rax
	mov rax, qword [rbp - 11696]
	mov r13, rax
	b4280:
	cmp r15, r14
	jl b4281
	b4282:
	mov rax, r13
	jmp b4283
	b4281:
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
	b4283:
	mov qword [rbp - 13336], rax
	mov rax, qword [rbp - 7216]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11696]
	mov r12, rax
	mov rax, qword [rbp - 5200]
	mov rbx, rax
	b4284:
	cmp r12, r15
	jl b4285
	b4286:
	mov rax, rbx
	jmp b4287
	b4285:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4287:
	mov qword [rbp - 2528], rax
	mov rax, qword [rbp - 11696]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5200]
	mov r12, rax
	mov rax, qword [rbp - 7216]
	mov r13, rax
	b4288:
	cmp r12, rbx
	jl b4289
	b4290:
	mov rax, r13
	jmp b4291
	b4289:
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
	b4291:
	mov rcx, qword [rbp - 13336]
	mov r14, rcx
	mov rcx, qword [rbp - 2528]
	mov r12, rcx
	mov r15, rax
	b4292:
	cmp r12, r14
	jl b4293
	b4294:
	mov rax, r15
	jmp b4295
	b4293:
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
	b4295:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4279:
	mov qword [rbp - 3880], rax
	mov rax, qword [rbp - 13312]
	sub rax, 1
	mov qword [rbp - 13464], rax
	mov rax, qword [rbp - 12984]
	mov qword [rbp - 9120], rax
	mov rax, qword [rbp - 12568]
	mov qword [rbp - 4152], rax
	b4296:
	mov rax, qword [rbp - 9120]
	mov rcx, qword [rbp - 13464]
	cmp rax, rcx
	jl b4297
	b4298:
	mov rax, qword [rbp - 4152]
	jmp b4299
	b4297:
	mov rax, qword [rbp - 13464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9120]
	mov r14, rax
	mov rax, qword [rbp - 4152]
	mov r13, rax
	b4300:
	cmp r14, r15
	jl b4301
	b4302:
	mov rax, r13
	jmp b4303
	b4301:
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
	b4303:
	mov qword [rbp - 1912], rax
	mov rax, qword [rbp - 9120]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4152]
	mov r14, rax
	mov rax, qword [rbp - 13464]
	mov r12, rax
	b4304:
	cmp r14, rbx
	jl b4305
	b4306:
	mov rax, r12
	jmp b4307
	b4305:
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
	b4307:
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 4152]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13464]
	mov r15, rax
	mov rax, qword [rbp - 9120]
	mov r13, rax
	b4308:
	cmp r15, r12
	jl b4309
	b4310:
	mov rax, r13
	jmp b4311
	b4309:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4311:
	mov rcx, rax
	mov rax, qword [rbp - 1912]
	mov r15, rax
	mov rax, qword [rbp - 40]
	mov r14, rax
	mov r12, rcx
	b4312:
	cmp r14, r15
	jl b4313
	b4314:
	mov rax, r12
	jmp b4315
	b4313:
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
	b4315:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4299:
	mov qword [rbp - 6560], rax
	mov rax, qword [rbp - 12984]
	sub rax, 1
	mov qword [rbp - 12632], rax
	mov rax, qword [rbp - 12568]
	mov qword [rbp - 8160], rax
	mov rax, qword [rbp - 13312]
	mov qword [rbp - 6208], rax
	b4316:
	mov rcx, qword [rbp - 8160]
	mov rax, qword [rbp - 12632]
	cmp rcx, rax
	jl b4317
	b4318:
	mov rax, qword [rbp - 6208]
	jmp b4319
	b4317:
	mov rax, qword [rbp - 12632]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8160]
	mov rbx, rax
	mov rax, qword [rbp - 6208]
	mov r13, rax
	b4320:
	cmp rbx, r14
	jl b4321
	b4322:
	mov rax, r13
	jmp b4323
	b4321:
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
	b4323:
	mov qword [rbp - 7680], rax
	mov rax, qword [rbp - 8160]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 6208]
	mov r15, rax
	mov rax, qword [rbp - 12632]
	mov rbx, rax
	b4324:
	cmp r15, r12
	jl b4325
	b4326:
	mov rax, rbx
	jmp b4327
	b4325:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4327:
	mov qword [rbp - 8896], rax
	mov rax, qword [rbp - 6208]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 12632]
	mov r12, rax
	mov rax, qword [rbp - 8160]
	mov rbx, rax
	b4328:
	cmp r12, r13
	jl b4329
	b4330:
	mov rax, rbx
	jmp b4331
	b4329:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4331:
	mov rcx, rax
	mov rax, qword [rbp - 7680]
	mov r15, rax
	mov rax, qword [rbp - 8896]
	mov r14, rax
	mov rbx, rcx
	b4332:
	cmp r14, r15
	jl b4333
	b4334:
	mov rax, rbx
	jmp b4335
	b4333:
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
	b4335:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4319:
	mov rcx, rax
	mov rax, qword [rbp - 3880]
	mov qword [rbp - 11680], rax
	mov rax, qword [rbp - 6560]
	mov qword [rbp - 1640], rax
	mov rax, rcx
	mov qword [rbp - 3600], rax
	b4336:
	mov rax, qword [rbp - 1640]
	mov rcx, qword [rbp - 11680]
	cmp rax, rcx
	jl b4337
	b4338:
	mov rax, qword [rbp - 3600]
	jmp b4339
	b4337:
	mov rax, qword [rbp - 11680]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1640]
	mov r15, rax
	mov rax, qword [rbp - 3600]
	mov rbx, rax
	b4340:
	cmp r15, r14
	jl b4341
	b4342:
	mov rax, rbx
	jmp b4343
	b4341:
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
	b4343:
	mov qword [rbp - 1176], rax
	mov rax, qword [rbp - 1640]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3600]
	mov r12, rax
	mov rax, qword [rbp - 11680]
	mov r13, rax
	b4344:
	cmp r12, r15
	jl b4345
	b4346:
	mov rax, r13
	jmp b4347
	b4345:
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
	b4347:
	mov qword [rbp - 12712], rax
	mov rax, qword [rbp - 3600]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11680]
	mov r15, rax
	mov rax, qword [rbp - 1640]
	mov rbx, rax
	b4348:
	cmp r15, r14
	jl b4349
	b4350:
	mov rax, rbx
	jmp b4351
	b4349:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4351:
	mov rcx, qword [rbp - 1176]
	mov r15, rcx
	mov rcx, qword [rbp - 12712]
	mov rbx, rcx
	mov r12, rax
	b4352:
	cmp rbx, r15
	jl b4353
	b4354:
	mov rax, r12
	jmp b4355
	b4353:
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
	b4355:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4339:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4275:
	mov rcx, rax
	mov rax, qword [rbp - 1416]
	mov qword [rbp - 11952], rax
	mov rax, qword [rbp - 8024]
	mov qword [rbp - 11304], rax
	mov rax, rcx
	mov qword [rbp - 9976], rax
	b4356:
	mov rax, qword [rbp - 11304]
	mov rcx, qword [rbp - 11952]
	cmp rax, rcx
	jl b4357
	b4358:
	mov rax, qword [rbp - 9976]
	jmp b4359
	b4357:
	mov rax, qword [rbp - 11952]
	sub rax, 1
	mov qword [rbp - 8928], rax
	mov rax, qword [rbp - 11304]
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 9976]
	mov qword [rbp - 3976], rax
	b4360:
	mov rax, qword [rbp - 224]
	mov rcx, qword [rbp - 8928]
	cmp rax, rcx
	jl b4361
	b4362:
	mov rax, qword [rbp - 3976]
	jmp b4363
	b4361:
	mov rax, qword [rbp - 8928]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 224]
	mov r12, rax
	mov rax, qword [rbp - 3976]
	mov rbx, rax
	b4364:
	cmp r12, r13
	jl b4365
	b4366:
	mov rax, rbx
	jmp b4367
	b4365:
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
	b4367:
	mov qword [rbp - 1280], rax
	mov rax, qword [rbp - 224]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3976]
	mov rbx, rax
	mov rax, qword [rbp - 8928]
	mov r13, rax
	b4368:
	cmp rbx, r15
	jl b4369
	b4370:
	mov rax, r13
	jmp b4371
	b4369:
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
	b4371:
	mov qword [rbp - 6376], rax
	mov rax, qword [rbp - 3976]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8928]
	mov rbx, rax
	mov rax, qword [rbp - 224]
	mov r13, rax
	b4372:
	cmp rbx, r12
	jl b4373
	b4374:
	mov rax, r13
	jmp b4375
	b4373:
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
	b4375:
	mov rcx, qword [rbp - 1280]
	mov r15, rcx
	mov rcx, qword [rbp - 6376]
	mov r14, rcx
	mov r12, rax
	b4376:
	cmp r14, r15
	jl b4377
	b4378:
	mov rax, r12
	jmp b4379
	b4377:
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
	b4379:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4363:
	mov qword [rbp - 5808], rax
	mov rax, qword [rbp - 11304]
	sub rax, 1
	mov qword [rbp - 4368], rax
	mov rax, qword [rbp - 9976]
	mov qword [rbp - 2888], rax
	mov rax, qword [rbp - 11952]
	mov qword [rbp - 496], rax
	b4380:
	mov rax, qword [rbp - 2888]
	mov rcx, qword [rbp - 4368]
	cmp rax, rcx
	jl b4381
	b4382:
	mov rax, qword [rbp - 496]
	jmp b4383
	b4381:
	mov rax, qword [rbp - 4368]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2888]
	mov r14, rax
	mov rax, qword [rbp - 496]
	mov r12, rax
	b4384:
	cmp r14, rbx
	jl b4385
	b4386:
	mov rax, r12
	jmp b4387
	b4385:
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
	b4387:
	mov qword [rbp - 8760], rax
	mov rax, qword [rbp - 2888]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 496]
	mov r12, rax
	mov rax, qword [rbp - 4368]
	mov r14, rax
	b4388:
	cmp r12, r15
	jl b4389
	b4390:
	mov rax, r14
	jmp b4391
	b4389:
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
	b4391:
	mov qword [rbp - 2232], rax
	mov rax, qword [rbp - 496]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4368]
	mov r13, rax
	mov rax, qword [rbp - 2888]
	mov r12, rax
	b4392:
	cmp r13, r15
	jl b4393
	b4394:
	mov rax, r12
	jmp b4395
	b4393:
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
	b4395:
	mov rcx, rax
	mov rax, qword [rbp - 8760]
	mov r15, rax
	mov rax, qword [rbp - 2232]
	mov r12, rax
	mov r13, rcx
	b4396:
	cmp r12, r15
	jl b4397
	b4398:
	mov rax, r13
	jmp b4399
	b4397:
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
	b4399:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4383:
	mov qword [rbp - 11864], rax
	mov rax, qword [rbp - 9976]
	sub rax, 1
	mov qword [rbp - 10464], rax
	mov rax, qword [rbp - 11952]
	mov qword [rbp - 6504], rax
	mov rax, qword [rbp - 11304]
	mov qword [rbp - 10080], rax
	b4400:
	mov rax, qword [rbp - 6504]
	mov rcx, qword [rbp - 10464]
	cmp rax, rcx
	jl b4401
	b4402:
	mov rax, qword [rbp - 10080]
	jmp b4403
	b4401:
	mov rax, qword [rbp - 10464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6504]
	mov r14, rax
	mov rax, qword [rbp - 10080]
	mov r13, rax
	b4404:
	cmp r14, r15
	jl b4405
	b4406:
	mov rax, r13
	jmp b4407
	b4405:
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
	b4407:
	mov qword [rbp - 13552], rax
	mov rax, qword [rbp - 6504]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10080]
	mov rbx, rax
	mov rax, qword [rbp - 10464]
	mov r12, rax
	b4408:
	cmp rbx, r14
	jl b4409
	b4410:
	mov rax, r12
	jmp b4411
	b4409:
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
	b4411:
	mov qword [rbp - 6424], rax
	mov rax, qword [rbp - 10080]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10464]
	mov r14, rax
	mov rax, qword [rbp - 6504]
	mov rbx, rax
	b4412:
	cmp r14, r15
	jl b4413
	b4414:
	mov rax, rbx
	jmp b4415
	b4413:
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
	b4415:
	mov rcx, rax
	mov rax, qword [rbp - 13552]
	mov rbx, rax
	mov rax, qword [rbp - 6424]
	mov r12, rax
	mov r13, rcx
	b4416:
	cmp r12, rbx
	jl b4417
	b4418:
	mov rax, r13
	jmp b4419
	b4417:
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
	b4419:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4403:
	mov rcx, rax
	mov rax, qword [rbp - 5808]
	mov qword [rbp - 9368], rax
	mov rax, qword [rbp - 11864]
	mov qword [rbp - 8112], rax
	mov rax, rcx
	mov qword [rbp - 3272], rax
	b4420:
	mov rcx, qword [rbp - 8112]
	mov rax, qword [rbp - 9368]
	cmp rcx, rax
	jl b4421
	b4422:
	mov rax, qword [rbp - 3272]
	jmp b4423
	b4421:
	mov rax, qword [rbp - 9368]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8112]
	mov r14, rax
	mov rax, qword [rbp - 3272]
	mov r15, rax
	b4424:
	cmp r14, rbx
	jl b4425
	b4426:
	mov rax, r15
	jmp b4427
	b4425:
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
	b4427:
	mov qword [rbp - 11992], rax
	mov rax, qword [rbp - 8112]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3272]
	mov rbx, rax
	mov rax, qword [rbp - 9368]
	mov r13, rax
	b4428:
	cmp rbx, r14
	jl b4429
	b4430:
	mov rax, r13
	jmp b4431
	b4429:
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
	b4431:
	mov qword [rbp - 9704], rax
	mov rax, qword [rbp - 3272]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9368]
	mov rbx, rax
	mov rax, qword [rbp - 8112]
	mov r13, rax
	b4432:
	cmp rbx, r14
	jl b4433
	b4434:
	mov rax, r13
	jmp b4435
	b4433:
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
	b4435:
	mov rcx, rax
	mov rax, qword [rbp - 11992]
	mov r15, rax
	mov rax, qword [rbp - 9704]
	mov rbx, rax
	mov r13, rcx
	b4436:
	cmp rbx, r15
	jl b4437
	b4438:
	mov rax, r13
	jmp b4439
	b4437:
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
	b4439:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4423:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4359:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4103:
	mov qword [rbp - 2032], rax
	mov rax, qword [rbp - 11064]
	sub rax, 1
	mov qword [rbp - 2952], rax
	mov rax, qword [rbp - 10192]
	mov qword [rbp - 2648], rax
	mov rax, qword [rbp - 9944]
	mov qword [rbp - 9464], rax
	b4440:
	mov rax, qword [rbp - 2648]
	mov rcx, qword [rbp - 2952]
	cmp rax, rcx
	jl b4441
	b4442:
	mov rax, qword [rbp - 9464]
	jmp b4443
	b4441:
	mov rax, qword [rbp - 2952]
	sub rax, 1
	mov qword [rbp - 13056], rax
	mov rax, qword [rbp - 2648]
	mov qword [rbp - 3928], rax
	mov rax, qword [rbp - 9464]
	mov qword [rbp - 552], rax
	b4444:
	mov rcx, qword [rbp - 3928]
	mov rax, qword [rbp - 13056]
	cmp rcx, rax
	jl b4445
	b4446:
	mov rax, qword [rbp - 552]
	jmp b4447
	b4445:
	mov rax, qword [rbp - 13056]
	sub rax, 1
	mov qword [rbp - 13048], rax
	mov rax, qword [rbp - 3928]
	mov qword [rbp - 1008], rax
	mov rax, qword [rbp - 552]
	mov qword [rbp - 13128], rax
	b4448:
	mov rcx, qword [rbp - 1008]
	mov rax, qword [rbp - 13048]
	cmp rcx, rax
	jl b4449
	b4450:
	mov rax, qword [rbp - 13128]
	jmp b4451
	b4449:
	mov rax, qword [rbp - 13048]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1008]
	mov r14, rax
	mov rax, qword [rbp - 13128]
	mov rbx, rax
	b4452:
	cmp r14, r12
	jl b4453
	b4454:
	mov rax, rbx
	jmp b4455
	b4453:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4455:
	mov qword [rbp - 4584], rax
	mov rax, qword [rbp - 1008]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13128]
	mov r12, rax
	mov rax, qword [rbp - 13048]
	mov r13, rax
	b4456:
	cmp r12, r14
	jl b4457
	b4458:
	mov rax, r13
	jmp b4459
	b4457:
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
	b4459:
	mov qword [rbp - 8608], rax
	mov rax, qword [rbp - 13128]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13048]
	mov r14, rax
	mov rax, qword [rbp - 1008]
	mov rbx, rax
	b4460:
	cmp r14, r15
	jl b4461
	b4462:
	mov rax, rbx
	jmp b4463
	b4461:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4463:
	mov rcx, rax
	mov rax, qword [rbp - 4584]
	mov rbx, rax
	mov rax, qword [rbp - 8608]
	mov r14, rax
	mov r13, rcx
	b4464:
	cmp r14, rbx
	jl b4465
	b4466:
	mov rax, r13
	jmp b4467
	b4465:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4467:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4451:
	mov qword [rbp - 7360], rax
	mov rax, qword [rbp - 3928]
	sub rax, 1
	mov qword [rbp - 12752], rax
	mov rax, qword [rbp - 552]
	mov qword [rbp - 12592], rax
	mov rax, qword [rbp - 13056]
	mov qword [rbp - 8976], rax
	b4468:
	mov rcx, qword [rbp - 12592]
	mov rax, qword [rbp - 12752]
	cmp rcx, rax
	jl b4469
	b4470:
	mov rax, qword [rbp - 8976]
	jmp b4471
	b4469:
	mov rax, qword [rbp - 12752]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12592]
	mov r14, rax
	mov rax, qword [rbp - 8976]
	mov rbx, rax
	b4472:
	cmp r14, r15
	jl b4473
	b4474:
	mov rax, rbx
	jmp b4475
	b4473:
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
	b4475:
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 12592]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8976]
	mov r12, rax
	mov rax, qword [rbp - 12752]
	mov rbx, rax
	b4476:
	cmp r12, r15
	jl b4477
	b4478:
	mov rax, rbx
	jmp b4479
	b4477:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4479:
	mov qword [rbp - 13448], rax
	mov rax, qword [rbp - 8976]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 12752]
	mov r15, rax
	mov rax, qword [rbp - 12592]
	mov r12, rax
	b4480:
	cmp r15, r14
	jl b4481
	b4482:
	mov rax, r12
	jmp b4483
	b4481:
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
	b4483:
	mov rcx, rax
	mov rax, qword [rbp - 568]
	mov rbx, rax
	mov rax, qword [rbp - 13448]
	mov r15, rax
	mov r14, rcx
	b4484:
	cmp r15, rbx
	jl b4485
	b4486:
	mov rax, r14
	jmp b4487
	b4485:
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
	b4487:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4471:
	mov qword [rbp - 10216], rax
	mov rax, qword [rbp - 552]
	sub rax, 1
	mov qword [rbp - 3528], rax
	mov rax, qword [rbp - 13056]
	mov qword [rbp - 9024], rax
	mov rax, qword [rbp - 3928]
	mov qword [rbp - 4840], rax
	b4488:
	mov rcx, qword [rbp - 9024]
	mov rax, qword [rbp - 3528]
	cmp rcx, rax
	jl b4489
	b4490:
	mov rax, qword [rbp - 4840]
	jmp b4491
	b4489:
	mov rax, qword [rbp - 3528]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9024]
	mov r14, rax
	mov rax, qword [rbp - 4840]
	mov r12, rax
	b4492:
	cmp r14, rbx
	jl b4493
	b4494:
	mov rax, r12
	jmp b4495
	b4493:
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
	b4495:
	mov qword [rbp - 6640], rax
	mov rax, qword [rbp - 9024]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4840]
	mov r12, rax
	mov rax, qword [rbp - 3528]
	mov r13, rax
	b4496:
	cmp r12, rbx
	jl b4497
	b4498:
	mov rax, r13
	jmp b4499
	b4497:
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
	b4499:
	mov qword [rbp - 2736], rax
	mov rax, qword [rbp - 4840]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3528]
	mov r14, rax
	mov rax, qword [rbp - 9024]
	mov r13, rax
	b4500:
	cmp r14, r15
	jl b4501
	b4502:
	mov rax, r13
	jmp b4503
	b4501:
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
	b4503:
	mov rcx, qword [rbp - 6640]
	mov r15, rcx
	mov rcx, qword [rbp - 2736]
	mov rbx, rcx
	mov r12, rax
	b4504:
	cmp rbx, r15
	jl b4505
	b4506:
	mov rax, r12
	jmp b4507
	b4505:
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
	b4507:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4491:
	mov rcx, rax
	mov rax, qword [rbp - 7360]
	mov qword [rbp - 9504], rax
	mov rax, qword [rbp - 10216]
	mov qword [rbp - 1056], rax
	mov rax, rcx
	mov qword [rbp - 1944], rax
	b4508:
	mov rcx, qword [rbp - 1056]
	mov rax, qword [rbp - 9504]
	cmp rcx, rax
	jl b4509
	b4510:
	mov rax, qword [rbp - 1944]
	jmp b4511
	b4509:
	mov rax, qword [rbp - 9504]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1056]
	mov r12, rax
	mov rax, qword [rbp - 1944]
	mov rbx, rax
	b4512:
	cmp r12, r15
	jl b4513
	b4514:
	mov rax, rbx
	jmp b4515
	b4513:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4515:
	mov qword [rbp - 4992], rax
	mov rax, qword [rbp - 1056]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1944]
	mov r14, rax
	mov rax, qword [rbp - 9504]
	mov r12, rax
	b4516:
	cmp r14, rbx
	jl b4517
	b4518:
	mov rax, r12
	jmp b4519
	b4517:
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
	b4519:
	mov qword [rbp - 9184], rax
	mov rax, qword [rbp - 1944]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9504]
	mov rbx, rax
	mov rax, qword [rbp - 1056]
	mov r13, rax
	b4520:
	cmp rbx, r12
	jl b4521
	b4522:
	mov rax, r13
	jmp b4523
	b4521:
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
	b4523:
	mov rcx, rax
	mov rax, qword [rbp - 4992]
	mov r15, rax
	mov rax, qword [rbp - 9184]
	mov r12, rax
	mov r13, rcx
	b4524:
	cmp r12, r15
	jl b4525
	b4526:
	mov rax, r13
	jmp b4527
	b4525:
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
	b4527:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4511:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4447:
	mov qword [rbp - 8744], rax
	mov rax, qword [rbp - 2648]
	sub rax, 1
	mov qword [rbp - 4608], rax
	mov rax, qword [rbp - 9464]
	mov qword [rbp - 5376], rax
	mov rax, qword [rbp - 2952]
	mov qword [rbp - 3024], rax
	b4528:
	mov rcx, qword [rbp - 5376]
	mov rax, qword [rbp - 4608]
	cmp rcx, rax
	jl b4529
	b4530:
	mov rax, qword [rbp - 3024]
	jmp b4531
	b4529:
	mov rax, qword [rbp - 4608]
	sub rax, 1
	mov qword [rbp - 9000], rax
	mov rax, qword [rbp - 5376]
	mov qword [rbp - 9264], rax
	mov rax, qword [rbp - 3024]
	mov qword [rbp - 2400], rax
	b4532:
	mov rax, qword [rbp - 9264]
	mov rcx, qword [rbp - 9000]
	cmp rax, rcx
	jl b4533
	b4534:
	mov rax, qword [rbp - 2400]
	jmp b4535
	b4533:
	mov rax, qword [rbp - 9000]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9264]
	mov r12, rax
	mov rax, qword [rbp - 2400]
	mov r13, rax
	b4536:
	cmp r12, rbx
	jl b4537
	b4538:
	mov rax, r13
	jmp b4539
	b4537:
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
	b4539:
	mov qword [rbp - 5856], rax
	mov rax, qword [rbp - 9264]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2400]
	mov r14, rax
	mov rax, qword [rbp - 9000]
	mov r13, rax
	b4540:
	cmp r14, rbx
	jl b4541
	b4542:
	mov rax, r13
	jmp b4543
	b4541:
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
	b4543:
	mov qword [rbp - 9608], rax
	mov rax, qword [rbp - 2400]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 9000]
	mov r14, rax
	mov rax, qword [rbp - 9264]
	mov r12, rax
	b4544:
	cmp r14, r13
	jl b4545
	b4546:
	mov rax, r12
	jmp b4547
	b4545:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4547:
	mov rcx, rax
	mov rax, qword [rbp - 5856]
	mov r12, rax
	mov rax, qword [rbp - 9608]
	mov r14, rax
	mov r15, rcx
	b4548:
	cmp r14, r12
	jl b4549
	b4550:
	mov rax, r15
	jmp b4551
	b4549:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4551:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4535:
	mov qword [rbp - 10352], rax
	mov rax, qword [rbp - 5376]
	sub rax, 1
	mov qword [rbp - 2320], rax
	mov rax, qword [rbp - 3024]
	mov qword [rbp - 11704], rax
	mov rax, qword [rbp - 4608]
	mov qword [rbp - 4384], rax
	b4552:
	mov rcx, qword [rbp - 11704]
	mov rax, qword [rbp - 2320]
	cmp rcx, rax
	jl b4553
	b4554:
	mov rax, qword [rbp - 4384]
	jmp b4555
	b4553:
	mov rax, qword [rbp - 2320]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11704]
	mov r14, rax
	mov rax, qword [rbp - 4384]
	mov r12, rax
	b4556:
	cmp r14, r15
	jl b4557
	b4558:
	mov rax, r12
	jmp b4559
	b4557:
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
	b4559:
	mov qword [rbp - 1536], rax
	mov rax, qword [rbp - 11704]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4384]
	mov rbx, rax
	mov rax, qword [rbp - 2320]
	mov r12, rax
	b4560:
	cmp rbx, r15
	jl b4561
	b4562:
	mov rax, r12
	jmp b4563
	b4561:
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
	b4563:
	mov qword [rbp - 9232], rax
	mov rax, qword [rbp - 4384]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2320]
	mov r12, rax
	mov rax, qword [rbp - 11704]
	mov r15, rax
	b4564:
	cmp r12, r14
	jl b4565
	b4566:
	mov rax, r15
	jmp b4567
	b4565:
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
	b4567:
	mov rcx, rax
	mov rax, qword [rbp - 1536]
	mov r14, rax
	mov rax, qword [rbp - 9232]
	mov rbx, rax
	mov r15, rcx
	b4568:
	cmp rbx, r14
	jl b4569
	b4570:
	mov rax, r15
	jmp b4571
	b4569:
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
	b4571:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4555:
	mov qword [rbp - 1032], rax
	mov rax, qword [rbp - 3024]
	sub rax, 1
	mov qword [rbp - 2824], rax
	mov rax, qword [rbp - 4608]
	mov qword [rbp - 1432], rax
	mov rax, qword [rbp - 5376]
	mov qword [rbp - 13352], rax
	b4572:
	mov rcx, qword [rbp - 1432]
	mov rax, qword [rbp - 2824]
	cmp rcx, rax
	jl b4573
	b4574:
	mov rax, qword [rbp - 13352]
	jmp b4575
	b4573:
	mov rax, qword [rbp - 2824]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1432]
	mov r12, rax
	mov rax, qword [rbp - 13352]
	mov r13, rax
	b4576:
	cmp r12, r14
	jl b4577
	b4578:
	mov rax, r13
	jmp b4579
	b4577:
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
	b4579:
	mov qword [rbp - 10776], rax
	mov rax, qword [rbp - 1432]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13352]
	mov r12, rax
	mov rax, qword [rbp - 2824]
	mov r15, rax
	b4580:
	cmp r12, r14
	jl b4581
	b4582:
	mov rax, r15
	jmp b4583
	b4581:
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
	b4583:
	mov qword [rbp - 1664], rax
	mov rax, qword [rbp - 13352]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2824]
	mov r15, rax
	mov rax, qword [rbp - 1432]
	mov r13, rax
	b4584:
	cmp r15, rbx
	jl b4585
	b4586:
	mov rax, r13
	jmp b4587
	b4585:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4587:
	mov rcx, rax
	mov rax, qword [rbp - 10776]
	mov r15, rax
	mov rax, qword [rbp - 1664]
	mov rbx, rax
	mov r13, rcx
	b4588:
	cmp rbx, r15
	jl b4589
	b4590:
	mov rax, r13
	jmp b4591
	b4589:
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
	b4591:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4575:
	mov rcx, rax
	mov rax, qword [rbp - 10352]
	mov qword [rbp - 10032], rax
	mov rax, qword [rbp - 1032]
	mov qword [rbp - 3952], rax
	mov rax, rcx
	mov qword [rbp - 248], rax
	b4592:
	mov rax, qword [rbp - 3952]
	mov rcx, qword [rbp - 10032]
	cmp rax, rcx
	jl b4593
	b4594:
	mov rax, qword [rbp - 248]
	jmp b4595
	b4593:
	mov rax, qword [rbp - 10032]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3952]
	mov r14, rax
	mov rax, qword [rbp - 248]
	mov rbx, rax
	b4596:
	cmp r14, r12
	jl b4597
	b4598:
	mov rax, rbx
	jmp b4599
	b4597:
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
	b4599:
	mov qword [rbp - 8952], rax
	mov rax, qword [rbp - 3952]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 248]
	mov rbx, rax
	mov rax, qword [rbp - 10032]
	mov r13, rax
	b4600:
	cmp rbx, r12
	jl b4601
	b4602:
	mov rax, r13
	jmp b4603
	b4601:
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
	b4603:
	mov qword [rbp - 840], rax
	mov rax, qword [rbp - 248]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10032]
	mov r14, rax
	mov rax, qword [rbp - 3952]
	mov r15, rax
	b4604:
	cmp r14, rbx
	jl b4605
	b4606:
	mov rax, r15
	jmp b4607
	b4605:
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
	b4607:
	mov rcx, qword [rbp - 8952]
	mov r14, rcx
	mov rcx, qword [rbp - 840]
	mov r15, rcx
	mov r13, rax
	b4608:
	cmp r15, r14
	jl b4609
	b4610:
	mov rax, r13
	jmp b4611
	b4609:
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
	b4611:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4595:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4531:
	mov qword [rbp - 6280], rax
	mov rax, qword [rbp - 9464]
	sub rax, 1
	mov qword [rbp - 4400], rax
	mov rax, qword [rbp - 2952]
	mov qword [rbp - 11984], rax
	mov rax, qword [rbp - 2648]
	mov qword [rbp - 1896], rax
	b4612:
	mov rax, qword [rbp - 11984]
	mov rcx, qword [rbp - 4400]
	cmp rax, rcx
	jl b4613
	b4614:
	mov rax, qword [rbp - 1896]
	jmp b4615
	b4613:
	mov rax, qword [rbp - 4400]
	sub rax, 1
	mov qword [rbp - 1800], rax
	mov rax, qword [rbp - 11984]
	mov qword [rbp - 11128], rax
	mov rax, qword [rbp - 1896]
	mov qword [rbp - 10016], rax
	b4616:
	mov rax, qword [rbp - 11128]
	mov rcx, qword [rbp - 1800]
	cmp rax, rcx
	jl b4617
	b4618:
	mov rax, qword [rbp - 10016]
	jmp b4619
	b4617:
	mov rax, qword [rbp - 1800]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 11128]
	mov r15, rax
	mov rax, qword [rbp - 10016]
	mov r13, rax
	b4620:
	cmp r15, r12
	jl b4621
	b4622:
	mov rax, r13
	jmp b4623
	b4621:
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
	b4623:
	mov qword [rbp - 11344], rax
	mov rax, qword [rbp - 11128]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10016]
	mov r12, rax
	mov rax, qword [rbp - 1800]
	mov r15, rax
	b4624:
	cmp r12, rbx
	jl b4625
	b4626:
	mov rax, r15
	jmp b4627
	b4625:
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
	mov r14, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r12
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
	b4627:
	mov qword [rbp - 8560], rax
	mov rax, qword [rbp - 10016]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1800]
	mov rbx, rax
	mov rax, qword [rbp - 11128]
	mov r15, rax
	b4628:
	cmp rbx, r13
	jl b4629
	b4630:
	mov rax, r15
	jmp b4631
	b4629:
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
	b4631:
	mov rcx, rax
	mov rax, qword [rbp - 11344]
	mov rbx, rax
	mov rax, qword [rbp - 8560]
	mov r12, rax
	mov r13, rcx
	b4632:
	cmp r12, rbx
	jl b4633
	b4634:
	mov rax, r13
	jmp b4635
	b4633:
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
	b4635:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4619:
	mov qword [rbp - 12576], rax
	mov rax, qword [rbp - 11984]
	sub rax, 1
	mov qword [rbp - 11624], rax
	mov rax, qword [rbp - 1896]
	mov qword [rbp - 13288], rax
	mov rax, qword [rbp - 4400]
	mov qword [rbp - 7888], rax
	b4636:
	mov rax, qword [rbp - 13288]
	mov rcx, qword [rbp - 11624]
	cmp rax, rcx
	jl b4637
	b4638:
	mov rax, qword [rbp - 7888]
	jmp b4639
	b4637:
	mov rax, qword [rbp - 11624]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13288]
	mov rbx, rax
	mov rax, qword [rbp - 7888]
	mov r13, rax
	b4640:
	cmp rbx, r14
	jl b4641
	b4642:
	mov rax, r13
	jmp b4643
	b4641:
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
	b4643:
	mov qword [rbp - 11240], rax
	mov rax, qword [rbp - 13288]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 7888]
	mov r13, rax
	mov rax, qword [rbp - 11624]
	mov r15, rax
	b4644:
	cmp r13, rbx
	jl b4645
	b4646:
	mov rax, r15
	jmp b4647
	b4645:
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
	b4647:
	mov qword [rbp - 2544], rax
	mov rax, qword [rbp - 7888]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 11624]
	mov r14, rax
	mov rax, qword [rbp - 13288]
	mov r15, rax
	b4648:
	cmp r14, rbx
	jl b4649
	b4650:
	mov rax, r15
	jmp b4651
	b4649:
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
	b4651:
	mov rcx, qword [rbp - 11240]
	mov r15, rcx
	mov rcx, qword [rbp - 2544]
	mov r13, rcx
	mov rbx, rax
	b4652:
	cmp r13, r15
	jl b4653
	b4654:
	mov rax, rbx
	jmp b4655
	b4653:
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
	b4655:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4639:
	mov qword [rbp - 3464], rax
	mov rax, qword [rbp - 1896]
	sub rax, 1
	mov qword [rbp - 7064], rax
	mov rax, qword [rbp - 4400]
	mov qword [rbp - 2960], rax
	mov rax, qword [rbp - 11984]
	mov qword [rbp - 6200], rax
	b4656:
	mov rcx, qword [rbp - 2960]
	mov rax, qword [rbp - 7064]
	cmp rcx, rax
	jl b4657
	b4658:
	mov rax, qword [rbp - 6200]
	jmp b4659
	b4657:
	mov rax, qword [rbp - 7064]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2960]
	mov r15, rax
	mov rax, qword [rbp - 6200]
	mov r13, rax
	b4660:
	cmp r15, r12
	jl b4661
	b4662:
	mov rax, r13
	jmp b4663
	b4661:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4663:
	mov qword [rbp - 10496], rax
	mov rax, qword [rbp - 2960]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6200]
	mov rbx, rax
	mov rax, qword [rbp - 7064]
	mov r13, rax
	b4664:
	cmp rbx, r15
	jl b4665
	b4666:
	mov rax, r13
	jmp b4667
	b4665:
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
	b4667:
	mov qword [rbp - 2848], rax
	mov rax, qword [rbp - 6200]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7064]
	mov r14, rax
	mov rax, qword [rbp - 2960]
	mov r13, rax
	b4668:
	cmp r14, r15
	jl b4669
	b4670:
	mov rax, r13
	jmp b4671
	b4669:
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
	b4671:
	mov rcx, rax
	mov rax, qword [rbp - 10496]
	mov r12, rax
	mov rax, qword [rbp - 2848]
	mov r15, rax
	mov r14, rcx
	b4672:
	cmp r15, r12
	jl b4673
	b4674:
	mov rax, r14
	jmp b4675
	b4673:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4675:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4659:
	mov rcx, rax
	mov rax, qword [rbp - 12576]
	mov qword [rbp - 13600], rax
	mov rax, qword [rbp - 3464]
	mov qword [rbp - 8232], rax
	mov rax, rcx
	mov qword [rbp - 9712], rax
	b4676:
	mov rax, qword [rbp - 8232]
	mov rcx, qword [rbp - 13600]
	cmp rax, rcx
	jl b4677
	b4678:
	mov rax, qword [rbp - 9712]
	jmp b4679
	b4677:
	mov rax, qword [rbp - 13600]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 8232]
	mov r13, rax
	mov rax, qword [rbp - 9712]
	mov r15, rax
	b4680:
	cmp r13, r12
	jl b4681
	b4682:
	mov rax, r15
	jmp b4683
	b4681:
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
	b4683:
	mov qword [rbp - 11392], rax
	mov rax, qword [rbp - 8232]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9712]
	mov r15, rax
	mov rax, qword [rbp - 13600]
	mov rbx, rax
	b4684:
	cmp r15, r12
	jl b4685
	b4686:
	mov rax, rbx
	jmp b4687
	b4685:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4687:
	mov qword [rbp - 8400], rax
	mov rax, qword [rbp - 9712]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13600]
	mov r14, rax
	mov rax, qword [rbp - 8232]
	mov r12, rax
	b4688:
	cmp r14, r15
	jl b4689
	b4690:
	mov rax, r12
	jmp b4691
	b4689:
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
	b4691:
	mov rcx, rax
	mov rax, qword [rbp - 11392]
	mov r14, rax
	mov rax, qword [rbp - 8400]
	mov r12, rax
	mov r13, rcx
	b4692:
	cmp r12, r14
	jl b4693
	b4694:
	mov rax, r13
	jmp b4695
	b4693:
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
	b4695:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4679:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4615:
	mov rcx, qword [rbp - 8744]
	mov qword [rbp - 12184], rcx
	mov rcx, qword [rbp - 6280]
	mov qword [rbp - 12912], rcx
	mov qword [rbp - 7272], rax
	b4696:
	mov rcx, qword [rbp - 12912]
	mov rax, qword [rbp - 12184]
	cmp rcx, rax
	jl b4697
	b4698:
	mov rax, qword [rbp - 7272]
	jmp b4699
	b4697:
	mov rax, qword [rbp - 12184]
	sub rax, 1
	mov qword [rbp - 8408], rax
	mov rax, qword [rbp - 12912]
	mov qword [rbp - 3616], rax
	mov rax, qword [rbp - 7272]
	mov qword [rbp - 1672], rax
	b4700:
	mov rax, qword [rbp - 3616]
	mov rcx, qword [rbp - 8408]
	cmp rax, rcx
	jl b4701
	b4702:
	mov rax, qword [rbp - 1672]
	jmp b4703
	b4701:
	mov rax, qword [rbp - 8408]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3616]
	mov r12, rax
	mov rax, qword [rbp - 1672]
	mov r15, rax
	b4704:
	cmp r12, r14
	jl b4705
	b4706:
	mov rax, r15
	jmp b4707
	b4705:
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
	b4707:
	mov qword [rbp - 10680], rax
	mov rax, qword [rbp - 3616]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1672]
	mov rbx, rax
	mov rax, qword [rbp - 8408]
	mov r13, rax
	b4708:
	cmp rbx, r15
	jl b4709
	b4710:
	mov rax, r13
	jmp b4711
	b4709:
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
	b4711:
	mov qword [rbp - 9544], rax
	mov rax, qword [rbp - 1672]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8408]
	mov rbx, rax
	mov rax, qword [rbp - 3616]
	mov r12, rax
	b4712:
	cmp rbx, r15
	jl b4713
	b4714:
	mov rax, r12
	jmp b4715
	b4713:
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
	b4715:
	mov rcx, qword [rbp - 10680]
	mov rbx, rcx
	mov rcx, qword [rbp - 9544]
	mov r15, rcx
	mov r13, rax
	b4716:
	cmp r15, rbx
	jl b4717
	b4718:
	mov rax, r13
	jmp b4719
	b4717:
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
	b4719:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4703:
	mov qword [rbp - 368], rax
	mov rax, qword [rbp - 12912]
	sub rax, 1
	mov qword [rbp - 12528], rax
	mov rax, qword [rbp - 7272]
	mov qword [rbp - 9304], rax
	mov rax, qword [rbp - 12184]
	mov qword [rbp - 3368], rax
	b4720:
	mov rax, qword [rbp - 9304]
	mov rcx, qword [rbp - 12528]
	cmp rax, rcx
	jl b4721
	b4722:
	mov rax, qword [rbp - 3368]
	jmp b4723
	b4721:
	mov rax, qword [rbp - 12528]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9304]
	mov r12, rax
	mov rax, qword [rbp - 3368]
	mov r13, rax
	b4724:
	cmp r12, r14
	jl b4725
	b4726:
	mov rax, r13
	jmp b4727
	b4725:
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
	b4727:
	mov qword [rbp - 12096], rax
	mov rax, qword [rbp - 9304]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3368]
	mov r15, rax
	mov rax, qword [rbp - 12528]
	mov r13, rax
	b4728:
	cmp r15, r14
	jl b4729
	b4730:
	mov rax, r13
	jmp b4731
	b4729:
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
	b4731:
	mov qword [rbp - 5192], rax
	mov rax, qword [rbp - 3368]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12528]
	mov r14, rax
	mov rax, qword [rbp - 9304]
	mov r12, rax
	b4732:
	cmp r14, r15
	jl b4733
	b4734:
	mov rax, r12
	jmp b4735
	b4733:
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
	b4735:
	mov rcx, rax
	mov rax, qword [rbp - 12096]
	mov r15, rax
	mov rax, qword [rbp - 5192]
	mov r12, rax
	mov rbx, rcx
	b4736:
	cmp r12, r15
	jl b4737
	b4738:
	mov rax, rbx
	jmp b4739
	b4737:
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
	b4739:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4723:
	mov qword [rbp - 11176], rax
	mov rax, qword [rbp - 7272]
	sub rax, 1
	mov qword [rbp - 13568], rax
	mov rax, qword [rbp - 12184]
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 12912]
	mov qword [rbp - 9040], rax
	b4740:
	mov rcx, qword [rbp - 656]
	mov rax, qword [rbp - 13568]
	cmp rcx, rax
	jl b4741
	b4742:
	mov rax, qword [rbp - 9040]
	jmp b4743
	b4741:
	mov rax, qword [rbp - 13568]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 656]
	mov r15, rax
	mov rax, qword [rbp - 9040]
	mov r13, rax
	b4744:
	cmp r15, r14
	jl b4745
	b4746:
	mov rax, r13
	jmp b4747
	b4745:
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
	b4747:
	mov qword [rbp - 7040], rax
	mov rax, qword [rbp - 656]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9040]
	mov rbx, rax
	mov rax, qword [rbp - 13568]
	mov r13, rax
	b4748:
	cmp rbx, r14
	jl b4749
	b4750:
	mov rax, r13
	jmp b4751
	b4749:
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
	b4751:
	mov qword [rbp - 13248], rax
	mov rax, qword [rbp - 9040]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13568]
	mov r12, rax
	mov rax, qword [rbp - 656]
	mov rbx, rax
	b4752:
	cmp r12, r15
	jl b4753
	b4754:
	mov rax, rbx
	jmp b4755
	b4753:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4755:
	mov rcx, qword [rbp - 7040]
	mov r15, rcx
	mov rcx, qword [rbp - 13248]
	mov r14, rcx
	mov rbx, rax
	b4756:
	cmp r14, r15
	jl b4757
	b4758:
	mov rax, rbx
	jmp b4759
	b4757:
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
	b4759:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4743:
	mov rcx, rax
	mov rax, qword [rbp - 368]
	mov qword [rbp - 1024], rax
	mov rax, qword [rbp - 11176]
	mov qword [rbp - 12312], rax
	mov rax, rcx
	mov qword [rbp - 13408], rax
	b4760:
	mov rcx, qword [rbp - 12312]
	mov rax, qword [rbp - 1024]
	cmp rcx, rax
	jl b4761
	b4762:
	mov rax, qword [rbp - 13408]
	jmp b4763
	b4761:
	mov rax, qword [rbp - 1024]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12312]
	mov r15, rax
	mov rax, qword [rbp - 13408]
	mov r13, rax
	b4764:
	cmp r15, rbx
	jl b4765
	b4766:
	mov rax, r13
	jmp b4767
	b4765:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4767:
	mov qword [rbp - 8064], rax
	mov rax, qword [rbp - 12312]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13408]
	mov r14, rax
	mov rax, qword [rbp - 1024]
	mov r12, rax
	b4768:
	cmp r14, r15
	jl b4769
	b4770:
	mov rax, r12
	jmp b4771
	b4769:
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
	b4771:
	mov qword [rbp - 4560], rax
	mov rax, qword [rbp - 13408]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1024]
	mov r14, rax
	mov rax, qword [rbp - 12312]
	mov r12, rax
	b4772:
	cmp r14, r15
	jl b4773
	b4774:
	mov rax, r12
	jmp b4775
	b4773:
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
	b4775:
	mov rcx, rax
	mov rax, qword [rbp - 8064]
	mov r15, rax
	mov rax, qword [rbp - 4560]
	mov r14, rax
	mov rbx, rcx
	b4776:
	cmp r14, r15
	jl b4777
	b4778:
	mov rax, rbx
	jmp b4779
	b4777:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4779:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4763:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4699:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4443:
	mov qword [rbp - 12248], rax
	mov rax, qword [rbp - 10192]
	sub rax, 1
	mov qword [rbp - 12016], rax
	mov rax, qword [rbp - 9944]
	mov qword [rbp - 11352], rax
	mov rax, qword [rbp - 11064]
	mov qword [rbp - 8808], rax
	b4780:
	mov rcx, qword [rbp - 11352]
	mov rax, qword [rbp - 12016]
	cmp rcx, rax
	jl b4781
	b4782:
	mov rax, qword [rbp - 8808]
	jmp b4783
	b4781:
	mov rax, qword [rbp - 12016]
	sub rax, 1
	mov qword [rbp - 5232], rax
	mov rax, qword [rbp - 11352]
	mov qword [rbp - 3448], rax
	mov rax, qword [rbp - 8808]
	mov qword [rbp - 760], rax
	b4784:
	mov rcx, qword [rbp - 3448]
	mov rax, qword [rbp - 5232]
	cmp rcx, rax
	jl b4785
	b4786:
	mov rax, qword [rbp - 760]
	jmp b4787
	b4785:
	mov rax, qword [rbp - 5232]
	sub rax, 1
	mov qword [rbp - 6576], rax
	mov rax, qword [rbp - 3448]
	mov qword [rbp - 5152], rax
	mov rax, qword [rbp - 760]
	mov qword [rbp - 1456], rax
	b4788:
	mov rcx, qword [rbp - 5152]
	mov rax, qword [rbp - 6576]
	cmp rcx, rax
	jl b4789
	b4790:
	mov rax, qword [rbp - 1456]
	jmp b4791
	b4789:
	mov rax, qword [rbp - 6576]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5152]
	mov r12, rax
	mov rax, qword [rbp - 1456]
	mov r13, rax
	b4792:
	cmp r12, r15
	jl b4793
	b4794:
	mov rax, r13
	jmp b4795
	b4793:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4795:
	mov qword [rbp - 13208], rax
	mov rax, qword [rbp - 5152]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1456]
	mov r12, rax
	mov rax, qword [rbp - 6576]
	mov r13, rax
	b4796:
	cmp r12, r14
	jl b4797
	b4798:
	mov rax, r13
	jmp b4799
	b4797:
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
	b4799:
	mov qword [rbp - 3296], rax
	mov rax, qword [rbp - 1456]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6576]
	mov rbx, rax
	mov rax, qword [rbp - 5152]
	mov r12, rax
	b4800:
	cmp rbx, r15
	jl b4801
	b4802:
	mov rax, r12
	jmp b4803
	b4801:
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
	b4803:
	mov rcx, qword [rbp - 13208]
	mov rbx, rcx
	mov rcx, qword [rbp - 3296]
	mov r14, rcx
	mov r13, rax
	b4804:
	cmp r14, rbx
	jl b4805
	b4806:
	mov rax, r13
	jmp b4807
	b4805:
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
	b4807:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4791:
	mov qword [rbp - 10832], rax
	mov rax, qword [rbp - 3448]
	sub rax, 1
	mov qword [rbp - 6408], rax
	mov rax, qword [rbp - 760]
	mov qword [rbp - 2712], rax
	mov rax, qword [rbp - 5232]
	mov qword [rbp - 8344], rax
	b4808:
	mov rcx, qword [rbp - 2712]
	mov rax, qword [rbp - 6408]
	cmp rcx, rax
	jl b4809
	b4810:
	mov rax, qword [rbp - 8344]
	jmp b4811
	b4809:
	mov rax, qword [rbp - 6408]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2712]
	mov r15, rax
	mov rax, qword [rbp - 8344]
	mov r12, rax
	b4812:
	cmp r15, r14
	jl b4813
	b4814:
	mov rax, r12
	jmp b4815
	b4813:
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
	b4815:
	mov qword [rbp - 2080], rax
	mov rax, qword [rbp - 2712]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8344]
	mov r12, rax
	mov rax, qword [rbp - 6408]
	mov r13, rax
	b4816:
	cmp r12, r14
	jl b4817
	b4818:
	mov rax, r13
	jmp b4819
	b4817:
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
	b4819:
	mov qword [rbp - 8528], rax
	mov rax, qword [rbp - 8344]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 6408]
	mov r15, rax
	mov rax, qword [rbp - 2712]
	mov rbx, rax
	b4820:
	cmp r15, r14
	jl b4821
	b4822:
	mov rax, rbx
	jmp b4823
	b4821:
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
	b4823:
	mov rcx, qword [rbp - 2080]
	mov r14, rcx
	mov rcx, qword [rbp - 8528]
	mov rbx, rcx
	mov r13, rax
	b4824:
	cmp rbx, r14
	jl b4825
	b4826:
	mov rax, r13
	jmp b4827
	b4825:
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
	b4827:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4811:
	mov qword [rbp - 6120], rax
	mov rax, qword [rbp - 760]
	sub rax, 1
	mov qword [rbp - 504], rax
	mov rax, qword [rbp - 5232]
	mov qword [rbp - 7632], rax
	mov rax, qword [rbp - 3448]
	mov qword [rbp - 5344], rax
	b4828:
	mov rcx, qword [rbp - 7632]
	mov rax, qword [rbp - 504]
	cmp rcx, rax
	jl b4829
	b4830:
	mov rax, qword [rbp - 5344]
	jmp b4831
	b4829:
	mov rax, qword [rbp - 504]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7632]
	mov r12, rax
	mov rax, qword [rbp - 5344]
	mov rbx, rax
	b4832:
	cmp r12, r14
	jl b4833
	b4834:
	mov rax, rbx
	jmp b4835
	b4833:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4835:
	mov qword [rbp - 8496], rax
	mov rax, qword [rbp - 7632]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 5344]
	mov r14, rax
	mov rax, qword [rbp - 504]
	mov rbx, rax
	b4836:
	cmp r14, r13
	jl b4837
	b4838:
	mov rax, rbx
	jmp b4839
	b4837:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4839:
	mov qword [rbp - 8224], rax
	mov rax, qword [rbp - 5344]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 504]
	mov r15, rax
	mov rax, qword [rbp - 7632]
	mov r12, rax
	b4840:
	cmp r15, r14
	jl b4841
	b4842:
	mov rax, r12
	jmp b4843
	b4841:
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
	b4843:
	mov rcx, rax
	mov rax, qword [rbp - 8496]
	mov r12, rax
	mov rax, qword [rbp - 8224]
	mov rbx, rax
	mov r14, rcx
	b4844:
	cmp rbx, r12
	jl b4845
	b4846:
	mov rax, r14
	jmp b4847
	b4845:
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
	b4847:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4831:
	mov rcx, rax
	mov rax, qword [rbp - 10832]
	mov qword [rbp - 10904], rax
	mov rax, qword [rbp - 6120]
	mov qword [rbp - 10712], rax
	mov rax, rcx
	mov qword [rbp - 10448], rax
	b4848:
	mov rax, qword [rbp - 10712]
	mov rcx, qword [rbp - 10904]
	cmp rax, rcx
	jl b4849
	b4850:
	mov rax, qword [rbp - 10448]
	jmp b4851
	b4849:
	mov rax, qword [rbp - 10904]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10712]
	mov r15, rax
	mov rax, qword [rbp - 10448]
	mov r13, rax
	b4852:
	cmp r15, r14
	jl b4853
	b4854:
	mov rax, r13
	jmp b4855
	b4853:
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
	b4855:
	mov qword [rbp - 7248], rax
	mov rax, qword [rbp - 10712]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10448]
	mov r15, rax
	mov rax, qword [rbp - 10904]
	mov r13, rax
	b4856:
	cmp r15, r14
	jl b4857
	b4858:
	mov rax, r13
	jmp b4859
	b4857:
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
	b4859:
	mov qword [rbp - 6688], rax
	mov rax, qword [rbp - 10448]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10904]
	mov r14, rax
	mov rax, qword [rbp - 10712]
	mov r13, rax
	b4860:
	cmp r14, rbx
	jl b4861
	b4862:
	mov rax, r13
	jmp b4863
	b4861:
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
	b4863:
	mov rcx, qword [rbp - 7248]
	mov r14, rcx
	mov rcx, qword [rbp - 6688]
	mov r12, rcx
	mov rbx, rax
	b4864:
	cmp r12, r14
	jl b4865
	b4866:
	mov rax, rbx
	jmp b4867
	b4865:
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
	b4867:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4851:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4787:
	mov qword [rbp - 2048], rax
	mov rax, qword [rbp - 11352]
	sub rax, 1
	mov qword [rbp - 5624], rax
	mov rax, qword [rbp - 8808]
	mov qword [rbp - 12920], rax
	mov rax, qword [rbp - 12016]
	mov qword [rbp - 8680], rax
	b4868:
	mov rcx, qword [rbp - 12920]
	mov rax, qword [rbp - 5624]
	cmp rcx, rax
	jl b4869
	b4870:
	mov rax, qword [rbp - 8680]
	jmp b4871
	b4869:
	mov rax, qword [rbp - 5624]
	sub rax, 1
	mov qword [rbp - 10376], rax
	mov rax, qword [rbp - 12920]
	mov qword [rbp - 7728], rax
	mov rax, qword [rbp - 8680]
	mov qword [rbp - 4752], rax
	b4872:
	mov rcx, qword [rbp - 7728]
	mov rax, qword [rbp - 10376]
	cmp rcx, rax
	jl b4873
	b4874:
	mov rax, qword [rbp - 4752]
	jmp b4875
	b4873:
	mov rax, qword [rbp - 10376]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 7728]
	mov r12, rax
	mov rax, qword [rbp - 4752]
	mov r13, rax
	b4876:
	cmp r12, r15
	jl b4877
	b4878:
	mov rax, r13
	jmp b4879
	b4877:
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
	b4879:
	mov qword [rbp - 6584], rax
	mov rax, qword [rbp - 7728]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 4752]
	mov r12, rax
	mov rax, qword [rbp - 10376]
	mov rbx, rax
	b4880:
	cmp r12, r14
	jl b4881
	b4882:
	mov rax, rbx
	jmp b4883
	b4881:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4883:
	mov qword [rbp - 808], rax
	mov rax, qword [rbp - 4752]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10376]
	mov rbx, rax
	mov rax, qword [rbp - 7728]
	mov r15, rax
	b4884:
	cmp rbx, r14
	jl b4885
	b4886:
	mov rax, r15
	jmp b4887
	b4885:
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
	b4887:
	mov rcx, rax
	mov rax, qword [rbp - 6584]
	mov r14, rax
	mov rax, qword [rbp - 808]
	mov r15, rax
	mov rbx, rcx
	b4888:
	cmp r15, r14
	jl b4889
	b4890:
	mov rax, rbx
	jmp b4891
	b4889:
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
	b4891:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4875:
	mov qword [rbp - 11568], rax
	mov rax, qword [rbp - 12920]
	sub rax, 1
	mov qword [rbp - 13160], rax
	mov rax, qword [rbp - 8680]
	mov qword [rbp - 3472], rax
	mov rax, qword [rbp - 5624]
	mov qword [rbp - 9968], rax
	b4892:
	mov rax, qword [rbp - 3472]
	mov rcx, qword [rbp - 13160]
	cmp rax, rcx
	jl b4893
	b4894:
	mov rax, qword [rbp - 9968]
	jmp b4895
	b4893:
	mov rax, qword [rbp - 13160]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 3472]
	mov r14, rax
	mov rax, qword [rbp - 9968]
	mov r12, rax
	b4896:
	cmp r14, r13
	jl b4897
	b4898:
	mov rax, r12
	jmp b4899
	b4897:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r15, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4899:
	mov qword [rbp - 10664], rax
	mov rax, qword [rbp - 3472]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9968]
	mov r14, rax
	mov rax, qword [rbp - 13160]
	mov r12, rax
	b4900:
	cmp r14, r15
	jl b4901
	b4902:
	mov rax, r12
	jmp b4903
	b4901:
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
	b4903:
	mov qword [rbp - 1784], rax
	mov rax, qword [rbp - 9968]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13160]
	mov rbx, rax
	mov rax, qword [rbp - 3472]
	mov r14, rax
	b4904:
	cmp rbx, r12
	jl b4905
	b4906:
	mov rax, r14
	jmp b4907
	b4905:
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
	b4907:
	mov rcx, rax
	mov rax, qword [rbp - 10664]
	mov r15, rax
	mov rax, qword [rbp - 1784]
	mov r13, rax
	mov r12, rcx
	b4908:
	cmp r13, r15
	jl b4909
	b4910:
	mov rax, r12
	jmp b4911
	b4909:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4911:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4895:
	mov qword [rbp - 9888], rax
	mov rax, qword [rbp - 8680]
	sub rax, 1
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 5624]
	mov qword [rbp - 11056], rax
	mov rax, qword [rbp - 12920]
	mov qword [rbp - 11048], rax
	b4912:
	mov rax, qword [rbp - 11056]
	mov rcx, qword [rbp - 520]
	cmp rax, rcx
	jl b4913
	b4914:
	mov rax, qword [rbp - 11048]
	jmp b4915
	b4913:
	mov rax, qword [rbp - 520]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11056]
	mov r14, rax
	mov rax, qword [rbp - 11048]
	mov r13, rax
	b4916:
	cmp r14, r15
	jl b4917
	b4918:
	mov rax, r13
	jmp b4919
	b4917:
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
	b4919:
	mov qword [rbp - 320], rax
	mov rax, qword [rbp - 11056]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11048]
	mov r12, rax
	mov rax, qword [rbp - 520]
	mov r15, rax
	b4920:
	cmp r12, r14
	jl b4921
	b4922:
	mov rax, r15
	jmp b4923
	b4921:
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
	b4923:
	mov qword [rbp - 5368], rax
	mov rax, qword [rbp - 11048]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 520]
	mov r12, rax
	mov rax, qword [rbp - 11056]
	mov r13, rax
	b4924:
	cmp r12, rbx
	jl b4925
	b4926:
	mov rax, r13
	jmp b4927
	b4925:
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
	b4927:
	mov rcx, qword [rbp - 320]
	mov r12, rcx
	mov rcx, qword [rbp - 5368]
	mov r15, rcx
	mov r14, rax
	b4928:
	cmp r15, r12
	jl b4929
	b4930:
	mov rax, r14
	jmp b4931
	b4929:
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
	b4931:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4915:
	mov rcx, rax
	mov rax, qword [rbp - 11568]
	mov qword [rbp - 6488], rax
	mov rax, qword [rbp - 9888]
	mov qword [rbp - 968], rax
	mov rax, rcx
	mov qword [rbp - 3168], rax
	b4932:
	mov rcx, qword [rbp - 968]
	mov rax, qword [rbp - 6488]
	cmp rcx, rax
	jl b4933
	b4934:
	mov rax, qword [rbp - 3168]
	jmp b4935
	b4933:
	mov rax, qword [rbp - 6488]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 968]
	mov rbx, rax
	mov rax, qword [rbp - 3168]
	mov r13, rax
	b4936:
	cmp rbx, r12
	jl b4937
	b4938:
	mov rax, r13
	jmp b4939
	b4937:
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
	b4939:
	mov qword [rbp - 13432], rax
	mov rax, qword [rbp - 968]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3168]
	mov r12, rax
	mov rax, qword [rbp - 6488]
	mov r13, rax
	b4940:
	cmp r12, r15
	jl b4941
	b4942:
	mov rax, r13
	jmp b4943
	b4941:
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
	b4943:
	mov qword [rbp - 352], rax
	mov rax, qword [rbp - 3168]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6488]
	mov r15, rax
	mov rax, qword [rbp - 968]
	mov r14, rax
	b4944:
	cmp r15, rbx
	jl b4945
	b4946:
	mov rax, r14
	jmp b4947
	b4945:
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
	b4947:
	mov rcx, qword [rbp - 13432]
	mov r14, rcx
	mov rcx, qword [rbp - 352]
	mov rbx, rcx
	mov r15, rax
	b4948:
	cmp rbx, r14
	jl b4949
	b4950:
	mov rax, r15
	jmp b4951
	b4949:
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
	b4951:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4935:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4871:
	mov qword [rbp - 5880], rax
	mov rax, qword [rbp - 8808]
	sub rax, 1
	mov qword [rbp - 8672], rax
	mov rax, qword [rbp - 12016]
	mov qword [rbp - 7208], rax
	mov rax, qword [rbp - 11352]
	mov qword [rbp - 8288], rax
	b4952:
	mov rax, qword [rbp - 7208]
	mov rcx, qword [rbp - 8672]
	cmp rax, rcx
	jl b4953
	b4954:
	mov rax, qword [rbp - 8288]
	jmp b4955
	b4953:
	mov rax, qword [rbp - 8672]
	sub rax, 1
	mov qword [rbp - 13176], rax
	mov rax, qword [rbp - 7208]
	mov qword [rbp - 6928], rax
	mov rax, qword [rbp - 8288]
	mov qword [rbp - 1808], rax
	b4956:
	mov rax, qword [rbp - 6928]
	mov rcx, qword [rbp - 13176]
	cmp rax, rcx
	jl b4957
	b4958:
	mov rax, qword [rbp - 1808]
	jmp b4959
	b4957:
	mov rax, qword [rbp - 13176]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6928]
	mov r14, rax
	mov rax, qword [rbp - 1808]
	mov r12, rax
	b4960:
	cmp r14, rbx
	jl b4961
	b4962:
	mov rax, r12
	jmp b4963
	b4961:
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
	b4963:
	mov qword [rbp - 12328], rax
	mov rax, qword [rbp - 6928]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1808]
	mov r12, rax
	mov rax, qword [rbp - 13176]
	mov r13, rax
	b4964:
	cmp r12, r14
	jl b4965
	b4966:
	mov rax, r13
	jmp b4967
	b4965:
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
	b4967:
	mov qword [rbp - 9344], rax
	mov rax, qword [rbp - 1808]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 13176]
	mov r15, rax
	mov rax, qword [rbp - 6928]
	mov rbx, rax
	b4968:
	cmp r15, r12
	jl b4969
	b4970:
	mov rax, rbx
	jmp b4971
	b4969:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4971:
	mov rcx, rax
	mov rax, qword [rbp - 12328]
	mov r14, rax
	mov rax, qword [rbp - 9344]
	mov r12, rax
	mov r13, rcx
	b4972:
	cmp r12, r14
	jl b4973
	b4974:
	mov rax, r13
	jmp b4975
	b4973:
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
	b4975:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4959:
	mov qword [rbp - 5960], rax
	mov rax, qword [rbp - 7208]
	sub rax, 1
	mov qword [rbp - 4288], rax
	mov rax, qword [rbp - 8288]
	mov qword [rbp - 3712], rax
	mov rax, qword [rbp - 8672]
	mov qword [rbp - 7512], rax
	b4976:
	mov rax, qword [rbp - 3712]
	mov rcx, qword [rbp - 4288]
	cmp rax, rcx
	jl b4977
	b4978:
	mov rax, qword [rbp - 7512]
	jmp b4979
	b4977:
	mov rax, qword [rbp - 4288]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3712]
	mov r12, rax
	mov rax, qword [rbp - 7512]
	mov r13, rax
	b4980:
	cmp r12, rbx
	jl b4981
	b4982:
	mov rax, r13
	jmp b4983
	b4981:
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
	b4983:
	mov qword [rbp - 4464], rax
	mov rax, qword [rbp - 3712]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7512]
	mov r15, rax
	mov rax, qword [rbp - 4288]
	mov r12, rax
	b4984:
	cmp r15, r14
	jl b4985
	b4986:
	mov rax, r12
	jmp b4987
	b4985:
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
	b4987:
	mov qword [rbp - 10728], rax
	mov rax, qword [rbp - 7512]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4288]
	mov r14, rax
	mov rax, qword [rbp - 3712]
	mov r12, rax
	b4988:
	cmp r14, rbx
	jl b4989
	b4990:
	mov rax, r12
	jmp b4991
	b4989:
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
	b4991:
	mov rcx, qword [rbp - 4464]
	mov r12, rcx
	mov rcx, qword [rbp - 10728]
	mov rbx, rcx
	mov r15, rax
	b4992:
	cmp rbx, r12
	jl b4993
	b4994:
	mov rax, r15
	jmp b4995
	b4993:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b4995:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4979:
	mov qword [rbp - 3656], rax
	mov rax, qword [rbp - 8288]
	sub rax, 1
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 8672]
	mov qword [rbp - 13376], rax
	mov rax, qword [rbp - 7208]
	mov qword [rbp - 6624], rax
	b4996:
	mov rax, qword [rbp - 13376]
	mov rcx, qword [rbp - 272]
	cmp rax, rcx
	jl b4997
	b4998:
	mov rax, qword [rbp - 6624]
	jmp b4999
	b4997:
	mov rax, qword [rbp - 272]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 13376]
	mov rbx, rax
	mov rax, qword [rbp - 6624]
	mov r14, rax
	b5000:
	cmp rbx, r15
	jl b5001
	b5002:
	mov rax, r14
	jmp b5003
	b5001:
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
	b5003:
	mov qword [rbp - 936], rax
	mov rax, qword [rbp - 13376]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 6624]
	mov r14, rax
	mov rax, qword [rbp - 272]
	mov r13, rax
	b5004:
	cmp r14, r15
	jl b5005
	b5006:
	mov rax, r13
	jmp b5007
	b5005:
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
	b5007:
	mov qword [rbp - 3400], rax
	mov rax, qword [rbp - 6624]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 272]
	mov rbx, rax
	mov rax, qword [rbp - 13376]
	mov r13, rax
	b5008:
	cmp rbx, r15
	jl b5009
	b5010:
	mov rax, r13
	jmp b5011
	b5009:
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
	b5011:
	mov rcx, rax
	mov rax, qword [rbp - 936]
	mov rbx, rax
	mov rax, qword [rbp - 3400]
	mov r14, rax
	mov r15, rcx
	b5012:
	cmp r14, rbx
	jl b5013
	b5014:
	mov rax, r15
	jmp b5015
	b5013:
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
	b5015:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4999:
	mov rcx, rax
	mov rax, qword [rbp - 5960]
	mov qword [rbp - 1040], rax
	mov rax, qword [rbp - 3656]
	mov qword [rbp - 8208], rax
	mov rax, rcx
	mov qword [rbp - 1648], rax
	b5016:
	mov rcx, qword [rbp - 8208]
	mov rax, qword [rbp - 1040]
	cmp rcx, rax
	jl b5017
	b5018:
	mov rax, qword [rbp - 1648]
	jmp b5019
	b5017:
	mov rax, qword [rbp - 1040]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8208]
	mov r14, rax
	mov rax, qword [rbp - 1648]
	mov r13, rax
	b5020:
	cmp r14, rbx
	jl b5021
	b5022:
	mov rax, r13
	jmp b5023
	b5021:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5023:
	mov qword [rbp - 12120], rax
	mov rax, qword [rbp - 8208]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1648]
	mov r15, rax
	mov rax, qword [rbp - 1040]
	mov r13, rax
	b5024:
	cmp r15, rbx
	jl b5025
	b5026:
	mov rax, r13
	jmp b5027
	b5025:
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
	b5027:
	mov qword [rbp - 4856], rax
	mov rax, qword [rbp - 1648]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1040]
	mov r13, rax
	mov rax, qword [rbp - 8208]
	mov r12, rax
	b5028:
	cmp r13, r14
	jl b5029
	b5030:
	mov rax, r12
	jmp b5031
	b5029:
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
	b5031:
	mov rcx, rax
	mov rax, qword [rbp - 12120]
	mov r15, rax
	mov rax, qword [rbp - 4856]
	mov rbx, rax
	mov r12, rcx
	b5032:
	cmp rbx, r15
	jl b5033
	b5034:
	mov rax, r12
	jmp b5035
	b5033:
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
	b5035:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5019:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4955:
	mov rcx, qword [rbp - 2048]
	mov qword [rbp - 11824], rcx
	mov rcx, qword [rbp - 5880]
	mov qword [rbp - 5584], rcx
	mov qword [rbp - 5416], rax
	b5036:
	mov rcx, qword [rbp - 5584]
	mov rax, qword [rbp - 11824]
	cmp rcx, rax
	jl b5037
	b5038:
	mov rax, qword [rbp - 5416]
	jmp b5039
	b5037:
	mov rax, qword [rbp - 11824]
	sub rax, 1
	mov qword [rbp - 11688], rax
	mov rax, qword [rbp - 5584]
	mov qword [rbp - 8104], rax
	mov rax, qword [rbp - 5416]
	mov qword [rbp - 9872], rax
	b5040:
	mov rcx, qword [rbp - 8104]
	mov rax, qword [rbp - 11688]
	cmp rcx, rax
	jl b5041
	b5042:
	mov rax, qword [rbp - 9872]
	jmp b5043
	b5041:
	mov rax, qword [rbp - 11688]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8104]
	mov r15, rax
	mov rax, qword [rbp - 9872]
	mov r14, rax
	b5044:
	cmp r15, rbx
	jl b5045
	b5046:
	mov rax, r14
	jmp b5047
	b5045:
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
	b5047:
	mov qword [rbp - 2768], rax
	mov rax, qword [rbp - 8104]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9872]
	mov r15, rax
	mov rax, qword [rbp - 11688]
	mov r13, rax
	b5048:
	cmp r15, r12
	jl b5049
	b5050:
	mov rax, r13
	jmp b5051
	b5049:
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
	b5051:
	mov qword [rbp - 7232], rax
	mov rax, qword [rbp - 9872]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11688]
	mov r14, rax
	mov rax, qword [rbp - 8104]
	mov r12, rax
	b5052:
	cmp r14, r15
	jl b5053
	b5054:
	mov rax, r12
	jmp b5055
	b5053:
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
	b5055:
	mov rcx, qword [rbp - 2768]
	mov rbx, rcx
	mov rcx, qword [rbp - 7232]
	mov r14, rcx
	mov r13, rax
	b5056:
	cmp r14, rbx
	jl b5057
	b5058:
	mov rax, r13
	jmp b5059
	b5057:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5059:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5043:
	mov qword [rbp - 3128], rax
	mov rax, qword [rbp - 5584]
	sub rax, 1
	mov qword [rbp - 3568], rax
	mov rax, qword [rbp - 5416]
	mov qword [rbp - 10632], rax
	mov rax, qword [rbp - 11824]
	mov qword [rbp - 2440], rax
	b5060:
	mov rcx, qword [rbp - 10632]
	mov rax, qword [rbp - 3568]
	cmp rcx, rax
	jl b5061
	b5062:
	mov rax, qword [rbp - 2440]
	jmp b5063
	b5061:
	mov rax, qword [rbp - 3568]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 10632]
	mov r14, rax
	mov rax, qword [rbp - 2440]
	mov r13, rax
	b5064:
	cmp r14, r15
	jl b5065
	b5066:
	mov rax, r13
	jmp b5067
	b5065:
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
	b5067:
	mov qword [rbp - 7448], rax
	mov rax, qword [rbp - 10632]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2440]
	mov r12, rax
	mov rax, qword [rbp - 3568]
	mov r13, rax
	b5068:
	cmp r12, r14
	jl b5069
	b5070:
	mov rax, r13
	jmp b5071
	b5069:
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
	b5071:
	mov qword [rbp - 9032], rax
	mov rax, qword [rbp - 2440]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3568]
	mov rbx, rax
	mov rax, qword [rbp - 10632]
	mov r13, rax
	b5072:
	cmp rbx, r15
	jl b5073
	b5074:
	mov rax, r13
	jmp b5075
	b5073:
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
	b5075:
	mov rcx, qword [rbp - 7448]
	mov rbx, rcx
	mov rcx, qword [rbp - 9032]
	mov r12, rcx
	mov r14, rax
	b5076:
	cmp r12, rbx
	jl b5077
	b5078:
	mov rax, r14
	jmp b5079
	b5077:
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
	b5079:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5063:
	mov qword [rbp - 5904], rax
	mov rax, qword [rbp - 5416]
	sub rax, 1
	mov qword [rbp - 12224], rax
	mov rax, qword [rbp - 11824]
	mov qword [rbp - 5640], rax
	mov rax, qword [rbp - 5584]
	mov qword [rbp - 4808], rax
	b5080:
	mov rax, qword [rbp - 5640]
	mov rcx, qword [rbp - 12224]
	cmp rax, rcx
	jl b5081
	b5082:
	mov rax, qword [rbp - 4808]
	jmp b5083
	b5081:
	mov rax, qword [rbp - 12224]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 5640]
	mov r12, rax
	mov rax, qword [rbp - 4808]
	mov rbx, rax
	b5084:
	cmp r12, r13
	jl b5085
	b5086:
	mov rax, rbx
	jmp b5087
	b5085:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5087:
	mov qword [rbp - 4616], rax
	mov rax, qword [rbp - 5640]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4808]
	mov r14, rax
	mov rax, qword [rbp - 12224]
	mov r12, rax
	b5088:
	cmp r14, r15
	jl b5089
	b5090:
	mov rax, r12
	jmp b5091
	b5089:
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
	b5091:
	mov qword [rbp - 11928], rax
	mov rax, qword [rbp - 4808]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 12224]
	mov r15, rax
	mov rax, qword [rbp - 5640]
	mov r14, rax
	b5092:
	cmp r15, rbx
	jl b5093
	b5094:
	mov rax, r14
	jmp b5095
	b5093:
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
	b5095:
	mov rcx, rax
	mov rax, qword [rbp - 4616]
	mov r15, rax
	mov rax, qword [rbp - 11928]
	mov r14, rax
	mov rbx, rcx
	b5096:
	cmp r14, r15
	jl b5097
	b5098:
	mov rax, rbx
	jmp b5099
	b5097:
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
	b5099:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5083:
	mov rcx, rax
	mov rax, qword [rbp - 3128]
	mov qword [rbp - 4944], rax
	mov rax, qword [rbp - 5904]
	mov qword [rbp - 8360], rax
	mov rax, rcx
	mov qword [rbp - 3392], rax
	b5100:
	mov rcx, qword [rbp - 8360]
	mov rax, qword [rbp - 4944]
	cmp rcx, rax
	jl b5101
	b5102:
	mov rax, qword [rbp - 3392]
	jmp b5103
	b5101:
	mov rax, qword [rbp - 4944]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8360]
	mov rbx, rax
	mov rax, qword [rbp - 3392]
	mov r13, rax
	b5104:
	cmp rbx, r15
	jl b5105
	b5106:
	mov rax, r13
	jmp b5107
	b5105:
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
	b5107:
	mov qword [rbp - 7312], rax
	mov rax, qword [rbp - 8360]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3392]
	mov r15, rax
	mov rax, qword [rbp - 4944]
	mov r13, rax
	b5108:
	cmp r15, rbx
	jl b5109
	b5110:
	mov rax, r13
	jmp b5111
	b5109:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5111:
	mov qword [rbp - 4120], rax
	mov rax, qword [rbp - 3392]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4944]
	mov r14, rax
	mov rax, qword [rbp - 8360]
	mov rbx, rax
	b5112:
	cmp r14, r15
	jl b5113
	b5114:
	mov rax, rbx
	jmp b5115
	b5113:
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
	b5115:
	mov rcx, rax
	mov rax, qword [rbp - 7312]
	mov r15, rax
	mov rax, qword [rbp - 4120]
	mov r13, rax
	mov r12, rcx
	b5116:
	cmp r13, r15
	jl b5117
	b5118:
	mov rax, r12
	jmp b5119
	b5117:
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
	b5119:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5103:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5039:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4783:
	mov rcx, rax
	mov rax, qword [rbp - 2032]
	mov qword [rbp - 3312], rax
	mov rax, qword [rbp - 12248]
	mov qword [rbp - 7688], rax
	mov rax, rcx
	mov qword [rbp - 7952], rax
	b5120:
	mov rcx, qword [rbp - 7688]
	mov rax, qword [rbp - 3312]
	cmp rcx, rax
	jl b5121
	b5122:
	mov rax, qword [rbp - 7952]
	jmp b5123
	b5121:
	mov rax, qword [rbp - 3312]
	sub rax, 1
	mov qword [rbp - 12760], rax
	mov rax, qword [rbp - 7688]
	mov qword [rbp - 5256], rax
	mov rax, qword [rbp - 7952]
	mov qword [rbp - 104], rax
	b5124:
	mov rax, qword [rbp - 5256]
	mov rcx, qword [rbp - 12760]
	cmp rax, rcx
	jl b5125
	b5126:
	mov rax, qword [rbp - 104]
	jmp b5127
	b5125:
	mov rax, qword [rbp - 12760]
	sub rax, 1
	mov qword [rbp - 1728], rax
	mov rax, qword [rbp - 5256]
	mov qword [rbp - 9440], rax
	mov rax, qword [rbp - 104]
	mov qword [rbp - 736], rax
	b5128:
	mov rax, qword [rbp - 9440]
	mov rcx, qword [rbp - 1728]
	cmp rax, rcx
	jl b5129
	b5130:
	mov rax, qword [rbp - 736]
	jmp b5131
	b5129:
	mov rax, qword [rbp - 1728]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9440]
	mov rbx, rax
	mov rax, qword [rbp - 736]
	mov r13, rax
	b5132:
	cmp rbx, r12
	jl b5133
	b5134:
	mov rax, r13
	jmp b5135
	b5133:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5135:
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 9440]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 736]
	mov r15, rax
	mov rax, qword [rbp - 1728]
	mov r13, rax
	b5136:
	cmp r15, r14
	jl b5137
	b5138:
	mov rax, r13
	jmp b5139
	b5137:
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
	b5139:
	mov qword [rbp - 1184], rax
	mov rax, qword [rbp - 736]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1728]
	mov r13, rax
	mov rax, qword [rbp - 9440]
	mov r15, rax
	b5140:
	cmp r13, r12
	jl b5141
	b5142:
	mov rax, r15
	jmp b5143
	b5141:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5143:
	mov rcx, qword [rbp - 24]
	mov r15, rcx
	mov rcx, qword [rbp - 1184]
	mov r13, rcx
	mov rbx, rax
	b5144:
	cmp r13, r15
	jl b5145
	b5146:
	mov rax, rbx
	jmp b5147
	b5145:
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
	b5147:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5131:
	mov qword [rbp - 10600], rax
	mov rax, qword [rbp - 5256]
	sub rax, 1
	mov qword [rbp - 9856], rax
	mov rax, qword [rbp - 104]
	mov qword [rbp - 11096], rax
	mov rax, qword [rbp - 12760]
	mov qword [rbp - 8120], rax
	b5148:
	mov rax, qword [rbp - 11096]
	mov rcx, qword [rbp - 9856]
	cmp rax, rcx
	jl b5149
	b5150:
	mov rax, qword [rbp - 8120]
	jmp b5151
	b5149:
	mov rax, qword [rbp - 9856]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 11096]
	mov r13, rax
	mov rax, qword [rbp - 8120]
	mov r14, rax
	b5152:
	cmp r13, r15
	jl b5153
	b5154:
	mov rax, r14
	jmp b5155
	b5153:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5155:
	mov qword [rbp - 3224], rax
	mov rax, qword [rbp - 11096]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8120]
	mov r12, rax
	mov rax, qword [rbp - 9856]
	mov rbx, rax
	b5156:
	cmp r12, r14
	jl b5157
	b5158:
	mov rax, rbx
	jmp b5159
	b5157:
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
	b5159:
	mov qword [rbp - 4872], rax
	mov rax, qword [rbp - 8120]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9856]
	mov rbx, rax
	mov rax, qword [rbp - 11096]
	mov r12, rax
	b5160:
	cmp rbx, r14
	jl b5161
	b5162:
	mov rax, r12
	jmp b5163
	b5161:
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
	b5163:
	mov rcx, qword [rbp - 3224]
	mov rbx, rcx
	mov rcx, qword [rbp - 4872]
	mov r14, rcx
	mov r12, rax
	b5164:
	cmp r14, rbx
	jl b5165
	b5166:
	mov rax, r12
	jmp b5167
	b5165:
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
	b5167:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5151:
	mov qword [rbp - 7920], rax
	mov rax, qword [rbp - 104]
	sub rax, 1
	mov qword [rbp - 13272], rax
	mov rax, qword [rbp - 12760]
	mov qword [rbp - 2928], rax
	mov rax, qword [rbp - 5256]
	mov qword [rbp - 9552], rax
	b5168:
	mov rax, qword [rbp - 2928]
	mov rcx, qword [rbp - 13272]
	cmp rax, rcx
	jl b5169
	b5170:
	mov rax, qword [rbp - 9552]
	jmp b5171
	b5169:
	mov rax, qword [rbp - 13272]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2928]
	mov r13, rax
	mov rax, qword [rbp - 9552]
	mov rbx, rax
	b5172:
	cmp r13, r15
	jl b5173
	b5174:
	mov rax, rbx
	jmp b5175
	b5173:
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
	b5175:
	mov qword [rbp - 13512], rax
	mov rax, qword [rbp - 2928]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9552]
	mov rbx, rax
	mov rax, qword [rbp - 13272]
	mov r14, rax
	b5176:
	cmp rbx, r15
	jl b5177
	b5178:
	mov rax, r14
	jmp b5179
	b5177:
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
	b5179:
	mov qword [rbp - 3640], rax
	mov rax, qword [rbp - 9552]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 13272]
	mov r15, rax
	mov rax, qword [rbp - 2928]
	mov r12, rax
	b5180:
	cmp r15, r14
	jl b5181
	b5182:
	mov rax, r12
	jmp b5183
	b5181:
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
	b5183:
	mov rcx, qword [rbp - 13512]
	mov r14, rcx
	mov rcx, qword [rbp - 3640]
	mov r12, rcx
	mov r13, rax
	b5184:
	cmp r12, r14
	jl b5185
	b5186:
	mov rax, r13
	jmp b5187
	b5185:
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
	b5187:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5171:
	mov rcx, rax
	mov rax, qword [rbp - 10600]
	mov qword [rbp - 2512], rax
	mov rax, qword [rbp - 7920]
	mov qword [rbp - 9104], rax
	mov rax, rcx
	mov qword [rbp - 9168], rax
	b5188:
	mov rcx, qword [rbp - 9104]
	mov rax, qword [rbp - 2512]
	cmp rcx, rax
	jl b5189
	b5190:
	mov rax, qword [rbp - 9168]
	jmp b5191
	b5189:
	mov rax, qword [rbp - 2512]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9104]
	mov r14, rax
	mov rax, qword [rbp - 9168]
	mov r12, rax
	b5192:
	cmp r14, r15
	jl b5193
	b5194:
	mov rax, r12
	jmp b5195
	b5193:
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
	b5195:
	mov qword [rbp - 11104], rax
	mov rax, qword [rbp - 9104]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9168]
	mov rbx, rax
	mov rax, qword [rbp - 2512]
	mov r13, rax
	b5196:
	cmp rbx, r12
	jl b5197
	b5198:
	mov rax, r13
	jmp b5199
	b5197:
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
	b5199:
	mov qword [rbp - 784], rax
	mov rax, qword [rbp - 9168]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2512]
	mov rbx, rax
	mov rax, qword [rbp - 9104]
	mov r12, rax
	b5200:
	cmp rbx, r13
	jl b5201
	b5202:
	mov rax, r12
	jmp b5203
	b5201:
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
	b5203:
	mov rcx, rax
	mov rax, qword [rbp - 11104]
	mov r14, rax
	mov rax, qword [rbp - 784]
	mov rbx, rax
	mov r12, rcx
	b5204:
	cmp rbx, r14
	jl b5205
	b5206:
	mov rax, r12
	jmp b5207
	b5205:
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
	b5207:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5191:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5127:
	mov qword [rbp - 6680], rax
	mov rax, qword [rbp - 7688]
	sub rax, 1
	mov qword [rbp - 6960], rax
	mov rax, qword [rbp - 7952]
	mov qword [rbp - 12720], rax
	mov rax, qword [rbp - 3312]
	mov qword [rbp - 6856], rax
	b5208:
	mov rcx, qword [rbp - 12720]
	mov rax, qword [rbp - 6960]
	cmp rcx, rax
	jl b5209
	b5210:
	mov rax, qword [rbp - 6856]
	jmp b5211
	b5209:
	mov rax, qword [rbp - 6960]
	sub rax, 1
	mov qword [rbp - 4552], rax
	mov rax, qword [rbp - 12720]
	mov qword [rbp - 6824], rax
	mov rax, qword [rbp - 6856]
	mov qword [rbp - 10096], rax
	b5212:
	mov rcx, qword [rbp - 6824]
	mov rax, qword [rbp - 4552]
	cmp rcx, rax
	jl b5213
	b5214:
	mov rax, qword [rbp - 10096]
	jmp b5215
	b5213:
	mov rax, qword [rbp - 4552]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 6824]
	mov r15, rax
	mov rax, qword [rbp - 10096]
	mov r13, rax
	b5216:
	cmp r15, rbx
	jl b5217
	b5218:
	mov rax, r13
	jmp b5219
	b5217:
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
	b5219:
	mov qword [rbp - 12240], rax
	mov rax, qword [rbp - 6824]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 10096]
	mov rbx, rax
	mov rax, qword [rbp - 4552]
	mov r13, rax
	b5220:
	cmp rbx, r12
	jl b5221
	b5222:
	mov rax, r13
	jmp b5223
	b5221:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5223:
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 10096]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 4552]
	mov r14, rax
	mov rax, qword [rbp - 6824]
	mov r13, rax
	b5224:
	cmp r14, r12
	jl b5225
	b5226:
	mov rax, r13
	jmp b5227
	b5225:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5227:
	mov rcx, rax
	mov rax, qword [rbp - 12240]
	mov r13, rax
	mov rax, qword [rbp - 200]
	mov r14, rax
	mov r15, rcx
	b5228:
	cmp r14, r13
	jl b5229
	b5230:
	mov rax, r15
	jmp b5231
	b5229:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5231:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5215:
	mov qword [rbp - 12936], rax
	mov rax, qword [rbp - 12720]
	sub rax, 1
	mov qword [rbp - 5976], rax
	mov rax, qword [rbp - 6856]
	mov qword [rbp - 2624], rax
	mov rax, qword [rbp - 6960]
	mov qword [rbp - 4176], rax
	b5232:
	mov rax, qword [rbp - 2624]
	mov rcx, qword [rbp - 5976]
	cmp rax, rcx
	jl b5233
	b5234:
	mov rax, qword [rbp - 4176]
	jmp b5235
	b5233:
	mov rax, qword [rbp - 5976]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2624]
	mov r15, rax
	mov rax, qword [rbp - 4176]
	mov rbx, rax
	b5236:
	cmp r15, r13
	jl b5237
	b5238:
	mov rax, rbx
	jmp b5239
	b5237:
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
	b5239:
	mov qword [rbp - 8688], rax
	mov rax, qword [rbp - 2624]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4176]
	mov rbx, rax
	mov rax, qword [rbp - 5976]
	mov r14, rax
	b5240:
	cmp rbx, r15
	jl b5241
	b5242:
	mov rax, r14
	jmp b5243
	b5241:
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
	b5243:
	mov qword [rbp - 6696], rax
	mov rax, qword [rbp - 4176]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5976]
	mov r15, rax
	mov rax, qword [rbp - 2624]
	mov r12, rax
	b5244:
	cmp r15, rbx
	jl b5245
	b5246:
	mov rax, r12
	jmp b5247
	b5245:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5247:
	mov rcx, qword [rbp - 8688]
	mov rbx, rcx
	mov rcx, qword [rbp - 6696]
	mov r12, rcx
	mov r13, rax
	b5248:
	cmp r12, rbx
	jl b5249
	b5250:
	mov rax, r13
	jmp b5251
	b5249:
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
	b5251:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5235:
	mov qword [rbp - 3304], rax
	mov rax, qword [rbp - 6856]
	sub rax, 1
	mov qword [rbp - 7440], rax
	mov rax, qword [rbp - 6960]
	mov qword [rbp - 10800], rax
	mov rax, qword [rbp - 12720]
	mov qword [rbp - 5992], rax
	b5252:
	mov rcx, qword [rbp - 10800]
	mov rax, qword [rbp - 7440]
	cmp rcx, rax
	jl b5253
	b5254:
	mov rax, qword [rbp - 5992]
	jmp b5255
	b5253:
	mov rax, qword [rbp - 7440]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 10800]
	mov r15, rax
	mov rax, qword [rbp - 5992]
	mov r13, rax
	b5256:
	cmp r15, r14
	jl b5257
	b5258:
	mov rax, r13
	jmp b5259
	b5257:
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
	b5259:
	mov qword [rbp - 6464], rax
	mov rax, qword [rbp - 10800]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 5992]
	mov r12, rax
	mov rax, qword [rbp - 7440]
	mov r13, rax
	b5260:
	cmp r12, r15
	jl b5261
	b5262:
	mov rax, r13
	jmp b5263
	b5261:
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
	b5263:
	mov qword [rbp - 8240], rax
	mov rax, qword [rbp - 5992]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7440]
	mov r13, rax
	mov rax, qword [rbp - 10800]
	mov r15, rax
	b5264:
	cmp r13, r14
	jl b5265
	b5266:
	mov rax, r15
	jmp b5267
	b5265:
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
	b5267:
	mov rcx, rax
	mov rax, qword [rbp - 6464]
	mov r15, rax
	mov rax, qword [rbp - 8240]
	mov rbx, rax
	mov r12, rcx
	b5268:
	cmp rbx, r15
	jl b5269
	b5270:
	mov rax, r12
	jmp b5271
	b5269:
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
	b5271:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5255:
	mov rcx, rax
	mov rax, qword [rbp - 12936]
	mov qword [rbp - 5160], rax
	mov rax, qword [rbp - 3304]
	mov qword [rbp - 4504], rax
	mov rax, rcx
	mov qword [rbp - 3264], rax
	b5272:
	mov rcx, qword [rbp - 4504]
	mov rax, qword [rbp - 5160]
	cmp rcx, rax
	jl b5273
	b5274:
	mov rax, qword [rbp - 3264]
	jmp b5275
	b5273:
	mov rax, qword [rbp - 5160]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 4504]
	mov r14, rax
	mov rax, qword [rbp - 3264]
	mov r12, rax
	b5276:
	cmp r14, r15
	jl b5277
	b5278:
	mov rax, r12
	jmp b5279
	b5277:
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
	b5279:
	mov qword [rbp - 4672], rax
	mov rax, qword [rbp - 4504]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3264]
	mov rbx, rax
	mov rax, qword [rbp - 5160]
	mov r13, rax
	b5280:
	cmp rbx, r12
	jl b5281
	b5282:
	mov rax, r13
	jmp b5283
	b5281:
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
	b5283:
	mov qword [rbp - 9400], rax
	mov rax, qword [rbp - 3264]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 5160]
	mov r15, rax
	mov rax, qword [rbp - 4504]
	mov r13, rax
	b5284:
	cmp r15, rbx
	jl b5285
	b5286:
	mov rax, r13
	jmp b5287
	b5285:
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
	b5287:
	mov rcx, qword [rbp - 4672]
	mov r14, rcx
	mov rcx, qword [rbp - 9400]
	mov r15, rcx
	mov r12, rax
	b5288:
	cmp r15, r14
	jl b5289
	b5290:
	mov rax, r12
	jmp b5291
	b5289:
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
	b5291:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5275:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5211:
	mov qword [rbp - 11656], rax
	mov rax, qword [rbp - 7952]
	sub rax, 1
	mov qword [rbp - 4112], rax
	mov rax, qword [rbp - 3312]
	mov qword [rbp - 5168], rax
	mov rax, qword [rbp - 7688]
	mov qword [rbp - 11976], rax
	b5292:
	mov rcx, qword [rbp - 5168]
	mov rax, qword [rbp - 4112]
	cmp rcx, rax
	jl b5293
	b5294:
	mov rax, qword [rbp - 11976]
	jmp b5295
	b5293:
	mov rax, qword [rbp - 4112]
	sub rax, 1
	mov qword [rbp - 9680], rax
	mov rax, qword [rbp - 5168]
	mov qword [rbp - 9128], rax
	mov rax, qword [rbp - 11976]
	mov qword [rbp - 7024], rax
	b5296:
	mov rcx, qword [rbp - 9128]
	mov rax, qword [rbp - 9680]
	cmp rcx, rax
	jl b5297
	b5298:
	mov rax, qword [rbp - 7024]
	jmp b5299
	b5297:
	mov rax, qword [rbp - 9680]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 9128]
	mov r15, rax
	mov rax, qword [rbp - 7024]
	mov r14, rax
	b5300:
	cmp r15, r12
	jl b5301
	b5302:
	mov rax, r14
	jmp b5303
	b5301:
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
	b5303:
	mov qword [rbp - 1232], rax
	mov rax, qword [rbp - 9128]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7024]
	mov rbx, rax
	mov rax, qword [rbp - 9680]
	mov r12, rax
	b5304:
	cmp rbx, r14
	jl b5305
	b5306:
	mov rax, r12
	jmp b5307
	b5305:
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
	b5307:
	mov qword [rbp - 9520], rax
	mov rax, qword [rbp - 7024]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 9680]
	mov r15, rax
	mov rax, qword [rbp - 9128]
	mov r14, rax
	b5308:
	cmp r15, rbx
	jl b5309
	b5310:
	mov rax, r14
	jmp b5311
	b5309:
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
	b5311:
	mov rcx, rax
	mov rax, qword [rbp - 1232]
	mov r14, rax
	mov rax, qword [rbp - 9520]
	mov rbx, rax
	mov r13, rcx
	b5312:
	cmp rbx, r14
	jl b5313
	b5314:
	mov rax, r13
	jmp b5315
	b5313:
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
	b5315:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5299:
	mov qword [rbp - 5736], rax
	mov rax, qword [rbp - 5168]
	sub rax, 1
	mov qword [rbp - 8424], rax
	mov rax, qword [rbp - 11976]
	mov qword [rbp - 9896], rax
	mov rax, qword [rbp - 4112]
	mov qword [rbp - 8296], rax
	b5316:
	mov rax, qword [rbp - 9896]
	mov rcx, qword [rbp - 8424]
	cmp rax, rcx
	jl b5317
	b5318:
	mov rax, qword [rbp - 8296]
	jmp b5319
	b5317:
	mov rax, qword [rbp - 8424]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 9896]
	mov r12, rax
	mov rax, qword [rbp - 8296]
	mov rbx, rax
	b5320:
	cmp r12, r15
	jl b5321
	b5322:
	mov rax, rbx
	jmp b5323
	b5321:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5323:
	mov qword [rbp - 7056], rax
	mov rax, qword [rbp - 9896]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 8296]
	mov r12, rax
	mov rax, qword [rbp - 8424]
	mov r13, rax
	b5324:
	cmp r12, r15
	jl b5325
	b5326:
	mov rax, r13
	jmp b5327
	b5325:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5327:
	mov qword [rbp - 4760], rax
	mov rax, qword [rbp - 8296]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 8424]
	mov r14, rax
	mov rax, qword [rbp - 9896]
	mov r15, rax
	b5328:
	cmp r14, rbx
	jl b5329
	b5330:
	mov rax, r15
	jmp b5331
	b5329:
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
	b5331:
	mov rcx, rax
	mov rax, qword [rbp - 7056]
	mov rbx, rax
	mov rax, qword [rbp - 4760]
	mov r15, rax
	mov r13, rcx
	b5332:
	cmp r15, rbx
	jl b5333
	b5334:
	mov rax, r13
	jmp b5335
	b5333:
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
	b5335:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5319:
	mov qword [rbp - 10984], rax
	mov rax, qword [rbp - 11976]
	sub rax, 1
	mov qword [rbp - 10560], rax
	mov rax, qword [rbp - 4112]
	mov qword [rbp - 5296], rax
	mov rax, qword [rbp - 5168]
	mov qword [rbp - 3800], rax
	b5336:
	mov rcx, qword [rbp - 5296]
	mov rax, qword [rbp - 10560]
	cmp rcx, rax
	jl b5337
	b5338:
	mov rax, qword [rbp - 3800]
	jmp b5339
	b5337:
	mov rax, qword [rbp - 10560]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 5296]
	mov r15, rax
	mov rax, qword [rbp - 3800]
	mov r13, rax
	b5340:
	cmp r15, r14
	jl b5341
	b5342:
	mov rax, r13
	jmp b5343
	b5341:
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
	b5343:
	mov qword [rbp - 13528], rax
	mov rax, qword [rbp - 5296]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3800]
	mov r15, rax
	mov rax, qword [rbp - 10560]
	mov rbx, rax
	b5344:
	cmp r15, r14
	jl b5345
	b5346:
	mov rax, rbx
	jmp b5347
	b5345:
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
	b5347:
	mov qword [rbp - 12072], rax
	mov rax, qword [rbp - 3800]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 10560]
	mov r14, rax
	mov rax, qword [rbp - 5296]
	mov r13, rax
	b5348:
	cmp r14, rbx
	jl b5349
	b5350:
	mov rax, r13
	jmp b5351
	b5349:
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
	b5351:
	mov rcx, rax
	mov rax, qword [rbp - 13528]
	mov r14, rax
	mov rax, qword [rbp - 12072]
	mov r12, rax
	mov rbx, rcx
	b5352:
	cmp r12, r14
	jl b5353
	b5354:
	mov rax, rbx
	jmp b5355
	b5353:
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
	b5355:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5339:
	mov rcx, qword [rbp - 5736]
	mov qword [rbp - 4208], rcx
	mov rcx, qword [rbp - 10984]
	mov qword [rbp - 6704], rcx
	mov qword [rbp - 12376], rax
	b5356:
	mov rax, qword [rbp - 6704]
	mov rcx, qword [rbp - 4208]
	cmp rax, rcx
	jl b5357
	b5358:
	mov rax, qword [rbp - 12376]
	jmp b5359
	b5357:
	mov rax, qword [rbp - 4208]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 6704]
	mov r13, rax
	mov rax, qword [rbp - 12376]
	mov r15, rax
	b5360:
	cmp r13, r12
	jl b5361
	b5362:
	mov rax, r15
	jmp b5363
	b5361:
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
	b5363:
	mov qword [rbp - 13168], rax
	mov rax, qword [rbp - 6704]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 12376]
	mov r14, rax
	mov rax, qword [rbp - 4208]
	mov r12, rax
	b5364:
	cmp r14, r15
	jl b5365
	b5366:
	mov rax, r12
	jmp b5367
	b5365:
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
	b5367:
	mov qword [rbp - 2864], rax
	mov rax, qword [rbp - 12376]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4208]
	mov r12, rax
	mov rax, qword [rbp - 6704]
	mov r13, rax
	b5368:
	cmp r12, rbx
	jl b5369
	b5370:
	mov rax, r13
	jmp b5371
	b5369:
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
	b5371:
	mov rcx, rax
	mov rax, qword [rbp - 13168]
	mov r14, rax
	mov rax, qword [rbp - 2864]
	mov r12, rax
	mov r13, rcx
	b5372:
	cmp r12, r14
	jl b5373
	b5374:
	mov rax, r13
	jmp b5375
	b5373:
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
	b5375:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5359:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5295:
	mov rcx, rax
	mov rax, qword [rbp - 6680]
	mov qword [rbp - 6480], rax
	mov rax, qword [rbp - 11656]
	mov qword [rbp - 11720], rax
	mov rax, rcx
	mov qword [rbp - 10264], rax
	b5376:
	mov rcx, qword [rbp - 11720]
	mov rax, qword [rbp - 6480]
	cmp rcx, rax
	jl b5377
	b5378:
	mov rax, qword [rbp - 10264]
	jmp b5379
	b5377:
	mov rax, qword [rbp - 6480]
	sub rax, 1
	mov qword [rbp - 4776], rax
	mov rax, qword [rbp - 11720]
	mov qword [rbp - 11800], rax
	mov rax, qword [rbp - 10264]
	mov qword [rbp - 3920], rax
	b5380:
	mov rax, qword [rbp - 11800]
	mov rcx, qword [rbp - 4776]
	cmp rax, rcx
	jl b5381
	b5382:
	mov rax, qword [rbp - 3920]
	jmp b5383
	b5381:
	mov rax, qword [rbp - 4776]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 11800]
	mov rbx, rax
	mov rax, qword [rbp - 3920]
	mov r15, rax
	b5384:
	cmp rbx, r14
	jl b5385
	b5386:
	mov rax, r15
	jmp b5387
	b5385:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5387:
	mov qword [rbp - 9808], rax
	mov rax, qword [rbp - 11800]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3920]
	mov r13, rax
	mov rax, qword [rbp - 4776]
	mov r14, rax
	b5388:
	cmp r13, rbx
	jl b5389
	b5390:
	mov rax, r14
	jmp b5391
	b5389:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b5391:
	mov qword [rbp - 11280], rax
	mov rax, qword [rbp - 3920]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4776]
	mov r14, rax
	mov rax, qword [rbp - 11800]
	mov r13, rax
	b5392:
	cmp r14, rbx
	jl b5393
	b5394:
	mov rax, r13
	jmp b5395
	b5393:
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
	b5395:
	mov rcx, rax
	mov rax, qword [rbp - 9808]
	mov r15, rax
	mov rax, qword [rbp - 11280]
	mov rbx, rax
	mov r13, rcx
	b5396:
	cmp rbx, r15
	jl b5397
	b5398:
	mov rax, r13
	jmp b5399
	b5397:
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
	b5399:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5383:
	mov qword [rbp - 6592], rax
	mov rax, qword [rbp - 11720]
	sub rax, 1
	mov qword [rbp - 13368], rax
	mov rax, qword [rbp - 10264]
	mov qword [rbp - 9912], rax
	mov rax, qword [rbp - 6480]
	mov qword [rbp - 48], rax
	b5400:
	mov rax, qword [rbp - 9912]
	mov rcx, qword [rbp - 13368]
	cmp rax, rcx
	jl b5401
	b5402:
	mov rax, qword [rbp - 48]
	jmp b5403
	b5401:
	mov rax, qword [rbp - 13368]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 9912]
	mov rbx, rax
	mov rax, qword [rbp - 48]
	mov r15, rax
	b5404:
	cmp rbx, r14
	jl b5405
	b5406:
	mov rax, r15
	jmp b5407
	b5405:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5407:
	mov qword [rbp - 9384], rax
	mov rax, qword [rbp - 9912]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 48]
	mov r15, rax
	mov rax, qword [rbp - 13368]
	mov r12, rax
	b5408:
	cmp r15, r14
	jl b5409
	b5410:
	mov rax, r12
	jmp b5411
	b5409:
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
	b5411:
	mov qword [rbp - 13608], rax
	mov rax, qword [rbp - 48]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 13368]
	mov r15, rax
	mov rax, qword [rbp - 9912]
	mov r12, rax
	b5412:
	cmp r15, rbx
	jl b5413
	b5414:
	mov rax, r12
	jmp b5415
	b5413:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5415:
	mov rcx, rax
	mov rax, qword [rbp - 9384]
	mov r15, rax
	mov rax, qword [rbp - 13608]
	mov r12, rax
	mov r13, rcx
	b5416:
	cmp r12, r15
	jl b5417
	b5418:
	mov rax, r13
	jmp b5419
	b5417:
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
	b5419:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5403:
	mov qword [rbp - 2608], rax
	mov rax, qword [rbp - 10264]
	sub rax, 1
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 6480]
	mov qword [rbp - 4792], rax
	mov rax, qword [rbp - 11720]
	mov qword [rbp - 4328], rax
	b5420:
	mov rax, qword [rbp - 4792]
	mov rcx, qword [rbp - 32]
	cmp rax, rcx
	jl b5421
	b5422:
	mov rax, qword [rbp - 4328]
	jmp b5423
	b5421:
	mov rax, qword [rbp - 32]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4792]
	mov r12, rax
	mov rax, qword [rbp - 4328]
	mov r14, rax
	b5424:
	cmp r12, rbx
	jl b5425
	b5426:
	mov rax, r14
	jmp b5427
	b5425:
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
	b5427:
	mov qword [rbp - 11080], rax
	mov rax, qword [rbp - 4792]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 4328]
	mov r14, rax
	mov rax, qword [rbp - 32]
	mov r13, rax
	b5428:
	cmp r14, rbx
	jl b5429
	b5430:
	mov rax, r13
	jmp b5431
	b5429:
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
	b5431:
	mov qword [rbp - 11536], rax
	mov rax, qword [rbp - 4328]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 32]
	mov r12, rax
	mov rax, qword [rbp - 4792]
	mov r13, rax
	b5432:
	cmp r12, r14
	jl b5433
	b5434:
	mov rax, r13
	jmp b5435
	b5433:
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
	b5435:
	mov rcx, qword [rbp - 11080]
	mov r12, rcx
	mov rcx, qword [rbp - 11536]
	mov r15, rcx
	mov r13, rax
	b5436:
	cmp r15, r12
	jl b5437
	b5438:
	mov rax, r13
	jmp b5439
	b5437:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5439:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5423:
	mov rcx, qword [rbp - 6592]
	mov qword [rbp - 13096], rcx
	mov rcx, qword [rbp - 2608]
	mov qword [rbp - 7120], rcx
	mov qword [rbp - 13584], rax
	b5440:
	mov rcx, qword [rbp - 7120]
	mov rax, qword [rbp - 13096]
	cmp rcx, rax
	jl b5441
	b5442:
	mov rax, qword [rbp - 13584]
	jmp b5443
	b5441:
	mov rax, qword [rbp - 13096]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 7120]
	mov rbx, rax
	mov rax, qword [rbp - 13584]
	mov r15, rax
	b5444:
	cmp rbx, r14
	jl b5445
	b5446:
	mov rax, r15
	jmp b5447
	b5445:
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
	b5447:
	mov qword [rbp - 8128], rax
	mov rax, qword [rbp - 7120]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 13584]
	mov r15, rax
	mov rax, qword [rbp - 13096]
	mov r13, rax
	b5448:
	cmp r15, rbx
	jl b5449
	b5450:
	mov rax, r13
	jmp b5451
	b5449:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5451:
	mov r15, rax
	mov rax, qword [rbp - 13584]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 13096]
	mov rbx, rax
	mov rax, qword [rbp - 7120]
	mov r12, rax
	b5452:
	cmp rbx, r13
	jl b5453
	b5454:
	mov rax, r12
	jmp b5455
	b5453:
	mov rax, r13
	sub rax, 1
	mov rdx, r12
	mov rsi, rbx
	mov rdi, rax
	call _tak
	mov qword [rbp - 2984], rax
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
	mov rdx, rax
	mov rsi, r14
	mov rax, qword [rbp - 2984]
	mov rdi, rax
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5455:
	mov rcx, qword [rbp - 8128]
	mov r13, rcx
	mov r14, r15
	mov r15, rax
	b5456:
	cmp r14, r13
	jl b5457
	b5458:
	mov rax, r15
	jmp b5459
	b5457:
	mov rax, r13
	sub rax, 1
	mov rdx, r15
	mov rsi, r14
	mov rdi, rax
	call _tak
	mov r12, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5459:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5443:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5379:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5123:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b4099:
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
	b5460:
	push rbp
	mov rbp, rsp
	sub rsp, 3408
	push r13
	push r12
	push r14
	push r15
	push rbx
	mov rax, 18
	mov qword [rbp - 2168], rax
	mov rax, 12
	mov qword [rbp - 2944], rax
	mov rax, 6
	mov qword [rbp - 1152], rax
	b5461:
	mov rax, qword [rbp - 2944]
	mov rcx, qword [rbp - 2168]
	cmp rax, rcx
	jl b5462
	b5463:
	mov rax, qword [rbp - 1152]
	jmp b5464
	b5462:
	mov rax, qword [rbp - 2168]
	sub rax, 1
	mov qword [rbp - 1512], rax
	mov rax, qword [rbp - 2944]
	mov qword [rbp - 1432], rax
	mov rax, qword [rbp - 1152]
	mov qword [rbp - 1272], rax
	b5465:
	mov rax, qword [rbp - 1432]
	mov rcx, qword [rbp - 1512]
	cmp rax, rcx
	jl b5466
	b5467:
	mov rax, qword [rbp - 1272]
	jmp b5468
	b5466:
	mov rax, qword [rbp - 1512]
	sub rax, 1
	mov qword [rbp - 1696], rax
	mov rax, qword [rbp - 1432]
	mov qword [rbp - 2928], rax
	mov rax, qword [rbp - 1272]
	mov qword [rbp - 904], rax
	b5469:
	mov rcx, qword [rbp - 2928]
	mov rax, qword [rbp - 1696]
	cmp rcx, rax
	jl b5470
	b5471:
	mov rax, qword [rbp - 904]
	jmp b5472
	b5470:
	mov rax, qword [rbp - 1696]
	sub rax, 1
	mov qword [rbp - 2832], rax
	mov rax, qword [rbp - 2928]
	mov qword [rbp - 2984], rax
	mov rax, qword [rbp - 904]
	mov qword [rbp - 1208], rax
	b5473:
	mov rcx, qword [rbp - 2984]
	mov rax, qword [rbp - 2832]
	cmp rcx, rax
	jl b5474
	b5475:
	mov rax, qword [rbp - 1208]
	jmp b5476
	b5474:
	mov rax, qword [rbp - 2832]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2984]
	mov r12, rax
	mov rax, qword [rbp - 1208]
	mov r14, rax
	b5477:
	cmp r12, rbx
	jl b5478
	b5479:
	mov rax, r14
	jmp b5480
	b5478:
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
	b5480:
	mov qword [rbp - 2160], rax
	mov rax, qword [rbp - 2984]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1208]
	mov r12, rax
	mov rax, qword [rbp - 2832]
	mov rbx, rax
	b5481:
	cmp r12, r14
	jl b5482
	b5483:
	mov rax, rbx
	jmp b5484
	b5482:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5484:
	mov qword [rbp - 3224], rax
	mov rax, qword [rbp - 1208]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2832]
	mov r15, rax
	mov rax, qword [rbp - 2984]
	mov r13, rax
	b5485:
	cmp r15, r14
	jl b5486
	b5487:
	mov rax, r13
	jmp b5488
	b5486:
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
	b5488:
	mov rcx, rax
	mov rax, qword [rbp - 2160]
	mov r15, rax
	mov rax, qword [rbp - 3224]
	mov rbx, rax
	mov r13, rcx
	b5489:
	cmp rbx, r15
	jl b5490
	b5491:
	mov rax, r13
	jmp b5492
	b5490:
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
	b5492:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5476:
	mov qword [rbp - 1624], rax
	mov rax, qword [rbp - 2928]
	sub rax, 1
	mov qword [rbp - 856], rax
	mov rax, qword [rbp - 904]
	mov qword [rbp - 512], rax
	mov rax, qword [rbp - 1696]
	mov qword [rbp - 3008], rax
	b5493:
	mov rcx, qword [rbp - 512]
	mov rax, qword [rbp - 856]
	cmp rcx, rax
	jl b5494
	b5495:
	mov rax, qword [rbp - 3008]
	jmp b5496
	b5494:
	mov rax, qword [rbp - 856]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 512]
	mov r15, rax
	mov rax, qword [rbp - 3008]
	mov r13, rax
	b5497:
	cmp r15, rbx
	jl b5498
	b5499:
	mov rax, r13
	jmp b5500
	b5498:
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
	b5500:
	mov qword [rbp - 1328], rax
	mov rax, qword [rbp - 512]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3008]
	mov r15, rax
	mov rax, qword [rbp - 856]
	mov r12, rax
	b5501:
	cmp r15, r14
	jl b5502
	b5503:
	mov rax, r12
	jmp b5504
	b5502:
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
	b5504:
	mov qword [rbp - 1736], rax
	mov rax, qword [rbp - 3008]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 856]
	mov rbx, rax
	mov rax, qword [rbp - 512]
	mov r14, rax
	b5505:
	cmp rbx, r12
	jl b5506
	b5507:
	mov rax, r14
	jmp b5508
	b5506:
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
	b5508:
	mov rcx, rax
	mov rax, qword [rbp - 1328]
	mov r14, rax
	mov rax, qword [rbp - 1736]
	mov rbx, rax
	mov r12, rcx
	b5509:
	cmp rbx, r14
	jl b5510
	b5511:
	mov rax, r12
	jmp b5512
	b5510:
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
	b5512:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5496:
	mov qword [rbp - 1016], rax
	mov rax, qword [rbp - 904]
	sub rax, 1
	mov qword [rbp - 288], rax
	mov rax, qword [rbp - 1696]
	mov qword [rbp - 944], rax
	mov rax, qword [rbp - 2928]
	mov qword [rbp - 1112], rax
	b5513:
	mov rcx, qword [rbp - 944]
	mov rax, qword [rbp - 288]
	cmp rcx, rax
	jl b5514
	b5515:
	mov rax, qword [rbp - 1112]
	jmp b5516
	b5514:
	mov rax, qword [rbp - 288]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 944]
	mov rbx, rax
	mov rax, qword [rbp - 1112]
	mov r14, rax
	b5517:
	cmp rbx, r15
	jl b5518
	b5519:
	mov rax, r14
	jmp b5520
	b5518:
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
	b5520:
	mov qword [rbp - 2800], rax
	mov rax, qword [rbp - 944]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1112]
	mov r14, rax
	mov rax, qword [rbp - 288]
	mov r12, rax
	b5521:
	cmp r14, rbx
	jl b5522
	b5523:
	mov rax, r12
	jmp b5524
	b5522:
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
	b5524:
	mov qword [rbp - 2720], rax
	mov rax, qword [rbp - 1112]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 288]
	mov r15, rax
	mov rax, qword [rbp - 944]
	mov r13, rax
	b5525:
	cmp r15, r14
	jl b5526
	b5527:
	mov rax, r13
	jmp b5528
	b5526:
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
	b5528:
	mov rcx, rax
	mov rax, qword [rbp - 2800]
	mov r15, rax
	mov rax, qword [rbp - 2720]
	mov rbx, rax
	mov r14, rcx
	b5529:
	cmp rbx, r15
	jl b5530
	b5531:
	mov rax, r14
	jmp b5532
	b5530:
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
	b5532:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5516:
	mov rcx, rax
	mov rax, qword [rbp - 1624]
	mov qword [rbp - 432], rax
	mov rax, qword [rbp - 1016]
	mov qword [rbp - 2552], rax
	mov rax, rcx
	mov qword [rbp - 1216], rax
	b5533:
	mov rax, qword [rbp - 2552]
	mov rcx, qword [rbp - 432]
	cmp rax, rcx
	jl b5534
	b5535:
	mov rax, qword [rbp - 1216]
	jmp b5536
	b5534:
	mov rax, qword [rbp - 432]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2552]
	mov rbx, rax
	mov rax, qword [rbp - 1216]
	mov r13, rax
	b5537:
	cmp rbx, r14
	jl b5538
	b5539:
	mov rax, r13
	jmp b5540
	b5538:
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
	b5540:
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 2552]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1216]
	mov rbx, rax
	mov rax, qword [rbp - 432]
	mov r15, rax
	b5541:
	cmp rbx, r14
	jl b5542
	b5543:
	mov rax, r15
	jmp b5544
	b5542:
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
	b5544:
	mov qword [rbp - 3192], rax
	mov rax, qword [rbp - 1216]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 432]
	mov r14, rax
	mov rax, qword [rbp - 2552]
	mov r13, rax
	b5545:
	cmp r14, r12
	jl b5546
	b5547:
	mov rax, r13
	jmp b5548
	b5546:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5548:
	mov rcx, rax
	mov rax, qword [rbp - 96]
	mov rbx, rax
	mov rax, qword [rbp - 3192]
	mov r15, rax
	mov r14, rcx
	b5549:
	cmp r15, rbx
	jl b5550
	b5551:
	mov rax, r14
	jmp b5552
	b5550:
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
	b5552:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5536:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5472:
	mov qword [rbp - 2088], rax
	mov rax, qword [rbp - 1432]
	sub rax, 1
	mov qword [rbp - 1968], rax
	mov rax, qword [rbp - 1272]
	mov qword [rbp - 864], rax
	mov rax, qword [rbp - 1512]
	mov qword [rbp - 2816], rax
	b5553:
	mov rax, qword [rbp - 864]
	mov rcx, qword [rbp - 1968]
	cmp rax, rcx
	jl b5554
	b5555:
	mov rax, qword [rbp - 2816]
	jmp b5556
	b5554:
	mov rax, qword [rbp - 1968]
	sub rax, 1
	mov qword [rbp - 2480], rax
	mov rax, qword [rbp - 864]
	mov qword [rbp - 2416], rax
	mov rax, qword [rbp - 2816]
	mov qword [rbp - 2656], rax
	b5557:
	mov rax, qword [rbp - 2416]
	mov rcx, qword [rbp - 2480]
	cmp rax, rcx
	jl b5558
	b5559:
	mov rax, qword [rbp - 2656]
	jmp b5560
	b5558:
	mov rax, qword [rbp - 2480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2416]
	mov r14, rax
	mov rax, qword [rbp - 2656]
	mov r12, rax
	b5561:
	cmp r14, r15
	jl b5562
	b5563:
	mov rax, r12
	jmp b5564
	b5562:
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
	b5564:
	mov qword [rbp - 1056], rax
	mov rax, qword [rbp - 2416]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2656]
	mov rbx, rax
	mov rax, qword [rbp - 2480]
	mov r13, rax
	b5565:
	cmp rbx, r15
	jl b5566
	b5567:
	mov rax, r13
	jmp b5568
	b5566:
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
	b5568:
	mov qword [rbp - 384], rax
	mov rax, qword [rbp - 2656]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2480]
	mov r12, rax
	mov rax, qword [rbp - 2416]
	mov r15, rax
	b5569:
	cmp r12, r14
	jl b5570
	b5571:
	mov rax, r15
	jmp b5572
	b5570:
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
	b5572:
	mov rcx, qword [rbp - 1056]
	mov r14, rcx
	mov rcx, qword [rbp - 384]
	mov r15, rcx
	mov r13, rax
	b5573:
	cmp r15, r14
	jl b5574
	b5575:
	mov rax, r13
	jmp b5576
	b5574:
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
	b5576:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5560:
	mov qword [rbp - 1904], rax
	mov rax, qword [rbp - 864]
	sub rax, 1
	mov qword [rbp - 2080], rax
	mov rax, qword [rbp - 2816]
	mov qword [rbp - 2664], rax
	mov rax, qword [rbp - 1968]
	mov qword [rbp - 2344], rax
	b5577:
	mov rcx, qword [rbp - 2664]
	mov rax, qword [rbp - 2080]
	cmp rcx, rax
	jl b5578
	b5579:
	mov rax, qword [rbp - 2344]
	jmp b5580
	b5578:
	mov rax, qword [rbp - 2080]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2664]
	mov r15, rax
	mov rax, qword [rbp - 2344]
	mov rbx, rax
	b5581:
	cmp r15, r14
	jl b5582
	b5583:
	mov rax, rbx
	jmp b5584
	b5582:
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
	b5584:
	mov qword [rbp - 2304], rax
	mov rax, qword [rbp - 2664]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2344]
	mov rbx, rax
	mov rax, qword [rbp - 2080]
	mov r15, rax
	b5585:
	cmp rbx, r13
	jl b5586
	b5587:
	mov rax, r15
	jmp b5588
	b5586:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5588:
	mov qword [rbp - 1840], rax
	mov rax, qword [rbp - 2344]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2080]
	mov r15, rax
	mov rax, qword [rbp - 2664]
	mov r13, rax
	b5589:
	cmp r15, r14
	jl b5590
	b5591:
	mov rax, r13
	jmp b5592
	b5590:
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
	b5592:
	mov rcx, rax
	mov rax, qword [rbp - 2304]
	mov rbx, rax
	mov rax, qword [rbp - 1840]
	mov r15, rax
	mov r13, rcx
	b5593:
	cmp r15, rbx
	jl b5594
	b5595:
	mov rax, r13
	jmp b5596
	b5594:
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
	b5596:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5580:
	mov qword [rbp - 3208], rax
	mov rax, qword [rbp - 2816]
	sub rax, 1
	mov qword [rbp - 224], rax
	mov rax, qword [rbp - 1968]
	mov qword [rbp - 2488], rax
	mov rax, qword [rbp - 864]
	mov qword [rbp - 1032], rax
	b5597:
	mov rax, qword [rbp - 2488]
	mov rcx, qword [rbp - 224]
	cmp rax, rcx
	jl b5598
	b5599:
	mov rax, qword [rbp - 1032]
	jmp b5600
	b5598:
	mov rax, qword [rbp - 224]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2488]
	mov rbx, rax
	mov rax, qword [rbp - 1032]
	mov r15, rax
	b5601:
	cmp rbx, r14
	jl b5602
	b5603:
	mov rax, r15
	jmp b5604
	b5602:
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
	b5604:
	mov qword [rbp - 2704], rax
	mov rax, qword [rbp - 2488]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1032]
	mov rbx, rax
	mov rax, qword [rbp - 224]
	mov r15, rax
	b5605:
	cmp rbx, r14
	jl b5606
	b5607:
	mov rax, r15
	jmp b5608
	b5606:
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
	b5608:
	mov qword [rbp - 2752], rax
	mov rax, qword [rbp - 1032]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 224]
	mov rbx, rax
	mov rax, qword [rbp - 2488]
	mov r12, rax
	b5609:
	cmp rbx, r15
	jl b5610
	b5611:
	mov rax, r12
	jmp b5612
	b5610:
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
	b5612:
	mov rcx, rax
	mov rax, qword [rbp - 2704]
	mov r12, rax
	mov rax, qword [rbp - 2752]
	mov r14, rax
	mov rbx, rcx
	b5613:
	cmp r14, r12
	jl b5614
	b5615:
	mov rax, rbx
	jmp b5616
	b5614:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5616:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5600:
	mov rcx, qword [rbp - 1904]
	mov qword [rbp - 2248], rcx
	mov rcx, qword [rbp - 3208]
	mov qword [rbp - 1720], rcx
	mov qword [rbp - 2896], rax
	b5617:
	mov rax, qword [rbp - 1720]
	mov rcx, qword [rbp - 2248]
	cmp rax, rcx
	jl b5618
	b5619:
	mov rax, qword [rbp - 2896]
	jmp b5620
	b5618:
	mov rax, qword [rbp - 2248]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1720]
	mov r15, rax
	mov rax, qword [rbp - 2896]
	mov r13, rax
	b5621:
	cmp r15, rbx
	jl b5622
	b5623:
	mov rax, r13
	jmp b5624
	b5622:
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
	b5624:
	mov qword [rbp - 1776], rax
	mov rax, qword [rbp - 1720]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2896]
	mov rbx, rax
	mov rax, qword [rbp - 2248]
	mov r15, rax
	b5625:
	cmp rbx, r14
	jl b5626
	b5627:
	mov rax, r15
	jmp b5628
	b5626:
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
	b5628:
	mov qword [rbp - 192], rax
	mov rax, qword [rbp - 2896]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2248]
	mov r14, rax
	mov rax, qword [rbp - 1720]
	mov r12, rax
	b5629:
	cmp r14, r15
	jl b5630
	b5631:
	mov rax, r12
	jmp b5632
	b5630:
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
	b5632:
	mov rcx, rax
	mov rax, qword [rbp - 1776]
	mov rbx, rax
	mov rax, qword [rbp - 192]
	mov r14, rax
	mov r13, rcx
	b5633:
	cmp r14, rbx
	jl b5634
	b5635:
	mov rax, r13
	jmp b5636
	b5634:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5636:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5620:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5556:
	mov qword [rbp - 1320], rax
	mov rax, qword [rbp - 1272]
	sub rax, 1
	mov qword [rbp - 3344], rax
	mov rax, qword [rbp - 1512]
	mov qword [rbp - 3040], rax
	mov rax, qword [rbp - 1432]
	mov qword [rbp - 3080], rax
	b5637:
	mov rcx, qword [rbp - 3040]
	mov rax, qword [rbp - 3344]
	cmp rcx, rax
	jl b5638
	b5639:
	mov rax, qword [rbp - 3080]
	jmp b5640
	b5638:
	mov rax, qword [rbp - 3344]
	sub rax, 1
	mov qword [rbp - 1816], rax
	mov rax, qword [rbp - 3040]
	mov qword [rbp - 3248], rax
	mov rax, qword [rbp - 3080]
	mov qword [rbp - 2464], rax
	b5641:
	mov rax, qword [rbp - 3248]
	mov rcx, qword [rbp - 1816]
	cmp rax, rcx
	jl b5642
	b5643:
	mov rax, qword [rbp - 2464]
	jmp b5644
	b5642:
	mov rax, qword [rbp - 1816]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3248]
	mov r15, rax
	mov rax, qword [rbp - 2464]
	mov r13, rax
	b5645:
	cmp r15, r14
	jl b5646
	b5647:
	mov rax, r13
	jmp b5648
	b5646:
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
	b5648:
	mov qword [rbp - 2144], rax
	mov rax, qword [rbp - 3248]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2464]
	mov r14, rax
	mov rax, qword [rbp - 1816]
	mov rbx, rax
	b5649:
	cmp r14, r12
	jl b5650
	b5651:
	mov rax, rbx
	jmp b5652
	b5650:
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
	b5652:
	mov qword [rbp - 688], rax
	mov rax, qword [rbp - 2464]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1816]
	mov r13, rax
	mov rax, qword [rbp - 3248]
	mov rbx, rax
	b5653:
	cmp r13, r15
	jl b5654
	b5655:
	mov rax, rbx
	jmp b5656
	b5654:
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
	b5656:
	mov rcx, rax
	mov rax, qword [rbp - 2144]
	mov r12, rax
	mov rax, qword [rbp - 688]
	mov rbx, rax
	mov r13, rcx
	b5657:
	cmp rbx, r12
	jl b5658
	b5659:
	mov rax, r13
	jmp b5660
	b5658:
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
	b5660:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5644:
	mov qword [rbp - 2808], rax
	mov rax, qword [rbp - 3040]
	sub rax, 1
	mov qword [rbp - 584], rax
	mov rax, qword [rbp - 3080]
	mov qword [rbp - 928], rax
	mov rax, qword [rbp - 3344]
	mov qword [rbp - 1576], rax
	b5661:
	mov rcx, qword [rbp - 928]
	mov rax, qword [rbp - 584]
	cmp rcx, rax
	jl b5662
	b5663:
	mov rax, qword [rbp - 1576]
	jmp b5664
	b5662:
	mov rax, qword [rbp - 584]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 928]
	mov r14, rax
	mov rax, qword [rbp - 1576]
	mov rbx, rax
	b5665:
	cmp r14, r15
	jl b5666
	b5667:
	mov rax, rbx
	jmp b5668
	b5666:
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
	b5668:
	mov qword [rbp - 1792], rax
	mov rax, qword [rbp - 928]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1576]
	mov r14, rax
	mov rax, qword [rbp - 584]
	mov rbx, rax
	b5669:
	cmp r14, r15
	jl b5670
	b5671:
	mov rax, rbx
	jmp b5672
	b5670:
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
	b5672:
	mov qword [rbp - 2352], rax
	mov rax, qword [rbp - 1576]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 584]
	mov rbx, rax
	mov rax, qword [rbp - 928]
	mov r15, rax
	b5673:
	cmp rbx, r12
	jl b5674
	b5675:
	mov rax, r15
	jmp b5676
	b5674:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5676:
	mov rcx, qword [rbp - 1792]
	mov rbx, rcx
	mov rcx, qword [rbp - 2352]
	mov r12, rcx
	mov r13, rax
	b5677:
	cmp r12, rbx
	jl b5678
	b5679:
	mov rax, r13
	jmp b5680
	b5678:
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
	b5680:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5664:
	mov qword [rbp - 616], rax
	mov rax, qword [rbp - 3080]
	sub rax, 1
	mov qword [rbp - 2216], rax
	mov rax, qword [rbp - 3344]
	mov qword [rbp - 1504], rax
	mov rax, qword [rbp - 3040]
	mov qword [rbp - 248], rax
	b5681:
	mov rax, qword [rbp - 1504]
	mov rcx, qword [rbp - 2216]
	cmp rax, rcx
	jl b5682
	b5683:
	mov rax, qword [rbp - 248]
	jmp b5684
	b5682:
	mov rax, qword [rbp - 2216]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1504]
	mov r14, rax
	mov rax, qword [rbp - 248]
	mov rbx, rax
	b5685:
	cmp r14, r15
	jl b5686
	b5687:
	mov rax, rbx
	jmp b5688
	b5686:
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
	b5688:
	mov qword [rbp - 3392], rax
	mov rax, qword [rbp - 1504]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 248]
	mov r13, rax
	mov rax, qword [rbp - 2216]
	mov r15, rax
	b5689:
	cmp r13, r12
	jl b5690
	b5691:
	mov rax, r15
	jmp b5692
	b5690:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5692:
	mov qword [rbp - 2616], rax
	mov rax, qword [rbp - 248]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2216]
	mov r15, rax
	mov rax, qword [rbp - 1504]
	mov r14, rax
	b5693:
	cmp r15, r12
	jl b5694
	b5695:
	mov rax, r14
	jmp b5696
	b5694:
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
	b5696:
	mov rcx, rax
	mov rax, qword [rbp - 3392]
	mov r13, rax
	mov rax, qword [rbp - 2616]
	mov r12, rax
	mov rbx, rcx
	b5697:
	cmp r12, r13
	jl b5698
	b5699:
	mov rax, rbx
	jmp b5700
	b5698:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5700:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5684:
	mov rcx, rax
	mov rax, qword [rbp - 2808]
	mov qword [rbp - 1176], rax
	mov rax, qword [rbp - 616]
	mov qword [rbp - 360], rax
	mov rax, rcx
	mov qword [rbp - 3088], rax
	b5701:
	mov rax, qword [rbp - 360]
	mov rcx, qword [rbp - 1176]
	cmp rax, rcx
	jl b5702
	b5703:
	mov rax, qword [rbp - 3088]
	jmp b5704
	b5702:
	mov rax, qword [rbp - 1176]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 360]
	mov r12, rax
	mov rax, qword [rbp - 3088]
	mov r13, rax
	b5705:
	cmp r12, r15
	jl b5706
	b5707:
	mov rax, r13
	jmp b5708
	b5706:
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
	b5708:
	mov qword [rbp - 272], rax
	mov rax, qword [rbp - 360]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3088]
	mov rbx, rax
	mov rax, qword [rbp - 1176]
	mov r13, rax
	b5709:
	cmp rbx, r14
	jl b5710
	b5711:
	mov rax, r13
	jmp b5712
	b5710:
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
	b5712:
	mov qword [rbp - 200], rax
	mov rax, qword [rbp - 3088]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1176]
	mov r14, rax
	mov rax, qword [rbp - 360]
	mov r13, rax
	b5713:
	cmp r14, r15
	jl b5714
	b5715:
	mov rax, r13
	jmp b5716
	b5714:
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
	b5716:
	mov rcx, rax
	mov rax, qword [rbp - 272]
	mov r14, rax
	mov rax, qword [rbp - 200]
	mov r12, rax
	mov rbx, rcx
	b5717:
	cmp r12, r14
	jl b5718
	b5719:
	mov rax, rbx
	jmp b5720
	b5718:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5720:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5704:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5640:
	mov rcx, rax
	mov rax, qword [rbp - 2088]
	mov qword [rbp - 2576], rax
	mov rax, qword [rbp - 1320]
	mov qword [rbp - 1544], rax
	mov rax, rcx
	mov qword [rbp - 3232], rax
	b5721:
	mov rax, qword [rbp - 1544]
	mov rcx, qword [rbp - 2576]
	cmp rax, rcx
	jl b5722
	b5723:
	mov rax, qword [rbp - 3232]
	jmp b5724
	b5722:
	mov rax, qword [rbp - 2576]
	sub rax, 1
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 1544]
	mov qword [rbp - 1800], rax
	mov rax, qword [rbp - 3232]
	mov qword [rbp - 3352], rax
	b5725:
	mov rcx, qword [rbp - 1800]
	mov rax, qword [rbp - 728]
	cmp rcx, rax
	jl b5726
	b5727:
	mov rax, qword [rbp - 3352]
	jmp b5728
	b5726:
	mov rax, qword [rbp - 728]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1800]
	mov r14, rax
	mov rax, qword [rbp - 3352]
	mov r13, rax
	b5729:
	cmp r14, rbx
	jl b5730
	b5731:
	mov rax, r13
	jmp b5732
	b5730:
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
	b5732:
	mov qword [rbp - 3136], rax
	mov rax, qword [rbp - 1800]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3352]
	mov r12, rax
	mov rax, qword [rbp - 728]
	mov r13, rax
	b5733:
	cmp r12, rbx
	jl b5734
	b5735:
	mov rax, r13
	jmp b5736
	b5734:
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
	b5736:
	mov qword [rbp - 704], rax
	mov rax, qword [rbp - 3352]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 728]
	mov r13, rax
	mov rax, qword [rbp - 1800]
	mov rbx, rax
	b5737:
	cmp r13, r12
	jl b5738
	b5739:
	mov rax, rbx
	jmp b5740
	b5738:
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
	b5740:
	mov rcx, rax
	mov rax, qword [rbp - 3136]
	mov r14, rax
	mov rax, qword [rbp - 704]
	mov r15, rax
	mov rbx, rcx
	b5741:
	cmp r15, r14
	jl b5742
	b5743:
	mov rax, rbx
	jmp b5744
	b5742:
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
	b5744:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5728:
	mov qword [rbp - 2536], rax
	mov rax, qword [rbp - 1544]
	sub rax, 1
	mov qword [rbp - 1256], rax
	mov rax, qword [rbp - 3232]
	mov qword [rbp - 2936], rax
	mov rax, qword [rbp - 2576]
	mov qword [rbp - 1160], rax
	b5745:
	mov rcx, qword [rbp - 2936]
	mov rax, qword [rbp - 1256]
	cmp rcx, rax
	jl b5746
	b5747:
	mov rax, qword [rbp - 1160]
	jmp b5748
	b5746:
	mov rax, qword [rbp - 1256]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2936]
	mov r12, rax
	mov rax, qword [rbp - 1160]
	mov r13, rax
	b5749:
	cmp r12, r15
	jl b5750
	b5751:
	mov rax, r13
	jmp b5752
	b5750:
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
	b5752:
	mov qword [rbp - 1704], rax
	mov rax, qword [rbp - 2936]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1160]
	mov rbx, rax
	mov rax, qword [rbp - 1256]
	mov r12, rax
	b5753:
	cmp rbx, r14
	jl b5754
	b5755:
	mov rax, r12
	jmp b5756
	b5754:
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
	b5756:
	mov qword [rbp - 2256], rax
	mov rax, qword [rbp - 1160]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1256]
	mov r13, rax
	mov rax, qword [rbp - 2936]
	mov rbx, rax
	b5757:
	cmp r13, r12
	jl b5758
	b5759:
	mov rax, rbx
	jmp b5760
	b5758:
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
	b5760:
	mov rcx, qword [rbp - 1704]
	mov rbx, rcx
	mov rcx, qword [rbp - 2256]
	mov r14, rcx
	mov r15, rax
	b5761:
	cmp r14, rbx
	jl b5762
	b5763:
	mov rax, r15
	jmp b5764
	b5762:
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
	b5764:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5748:
	mov qword [rbp - 3024], rax
	mov rax, qword [rbp - 3232]
	sub rax, 1
	mov qword [rbp - 1568], rax
	mov rax, qword [rbp - 2576]
	mov qword [rbp - 1224], rax
	mov rax, qword [rbp - 1544]
	mov qword [rbp - 2744], rax
	b5765:
	mov rcx, qword [rbp - 1224]
	mov rax, qword [rbp - 1568]
	cmp rcx, rax
	jl b5766
	b5767:
	mov rax, qword [rbp - 2744]
	jmp b5768
	b5766:
	mov rax, qword [rbp - 1568]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1224]
	mov r14, rax
	mov rax, qword [rbp - 2744]
	mov r13, rax
	b5769:
	cmp r14, r15
	jl b5770
	b5771:
	mov rax, r13
	jmp b5772
	b5770:
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
	b5772:
	mov qword [rbp - 2360], rax
	mov rax, qword [rbp - 1224]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2744]
	mov r13, rax
	mov rax, qword [rbp - 1568]
	mov r14, rax
	b5773:
	cmp r13, r12
	jl b5774
	b5775:
	mov rax, r14
	jmp b5776
	b5774:
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
	b5776:
	mov qword [rbp - 344], rax
	mov rax, qword [rbp - 2744]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1568]
	mov rbx, rax
	mov rax, qword [rbp - 1224]
	mov r12, rax
	b5777:
	cmp rbx, r14
	jl b5778
	b5779:
	mov rax, r12
	jmp b5780
	b5778:
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
	b5780:
	mov rcx, rax
	mov rax, qword [rbp - 2360]
	mov r12, rax
	mov rax, qword [rbp - 344]
	mov r13, rax
	mov r15, rcx
	b5781:
	cmp r13, r12
	jl b5782
	b5783:
	mov rax, r15
	jmp b5784
	b5782:
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
	mov rbx, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r13
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5784:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5768:
	mov rcx, rax
	mov rax, qword [rbp - 2536]
	mov qword [rbp - 296], rax
	mov rax, qword [rbp - 3024]
	mov qword [rbp - 128], rax
	mov rax, rcx
	mov qword [rbp - 1040], rax
	b5785:
	mov rax, qword [rbp - 128]
	mov rcx, qword [rbp - 296]
	cmp rax, rcx
	jl b5786
	b5787:
	mov rax, qword [rbp - 1040]
	jmp b5788
	b5786:
	mov rax, qword [rbp - 296]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 128]
	mov r13, rax
	mov rax, qword [rbp - 1040]
	mov rbx, rax
	b5789:
	cmp r13, r12
	jl b5790
	b5791:
	mov rax, rbx
	jmp b5792
	b5790:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5792:
	mov qword [rbp - 2952], rax
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1040]
	mov r13, rax
	mov rax, qword [rbp - 296]
	mov rbx, rax
	b5793:
	cmp r13, r12
	jl b5794
	b5795:
	mov rax, rbx
	jmp b5796
	b5794:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5796:
	mov qword [rbp - 2824], rax
	mov rax, qword [rbp - 1040]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 296]
	mov rbx, rax
	mov rax, qword [rbp - 128]
	mov r14, rax
	b5797:
	cmp rbx, r13
	jl b5798
	b5799:
	mov rax, r14
	jmp b5800
	b5798:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
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
	b5800:
	mov rcx, qword [rbp - 2952]
	mov r14, rcx
	mov rcx, qword [rbp - 2824]
	mov r15, rcx
	mov r12, rax
	b5801:
	cmp r15, r14
	jl b5802
	b5803:
	mov rax, r12
	jmp b5804
	b5802:
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
	b5804:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5788:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5724:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5468:
	mov qword [rbp - 1000], rax
	mov rax, qword [rbp - 2944]
	sub rax, 1
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 1152]
	mov qword [rbp - 1976], rax
	mov rax, qword [rbp - 2168]
	mov qword [rbp - 2232], rax
	b5805:
	mov rax, qword [rbp - 1976]
	mov rcx, qword [rbp - 56]
	cmp rax, rcx
	jl b5806
	b5807:
	mov rax, qword [rbp - 2232]
	jmp b5808
	b5806:
	mov rax, qword [rbp - 56]
	sub rax, 1
	mov qword [rbp - 2680], rax
	mov rax, qword [rbp - 1976]
	mov qword [rbp - 2688], rax
	mov rax, qword [rbp - 2232]
	mov qword [rbp - 816], rax
	b5809:
	mov rax, qword [rbp - 2688]
	mov rcx, qword [rbp - 2680]
	cmp rax, rcx
	jl b5810
	b5811:
	mov rax, qword [rbp - 816]
	jmp b5812
	b5810:
	mov rax, qword [rbp - 2680]
	sub rax, 1
	mov qword [rbp - 2264], rax
	mov rax, qword [rbp - 2688]
	mov qword [rbp - 3120], rax
	mov rax, qword [rbp - 816]
	mov qword [rbp - 208], rax
	b5813:
	mov rcx, qword [rbp - 3120]
	mov rax, qword [rbp - 2264]
	cmp rcx, rax
	jl b5814
	b5815:
	mov rax, qword [rbp - 208]
	jmp b5816
	b5814:
	mov rax, qword [rbp - 2264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3120]
	mov r12, rax
	mov rax, qword [rbp - 208]
	mov r13, rax
	b5817:
	cmp r12, r14
	jl b5818
	b5819:
	mov rax, r13
	jmp b5820
	b5818:
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
	b5820:
	mov qword [rbp - 1728], rax
	mov rax, qword [rbp - 3120]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 208]
	mov r15, rax
	mov rax, qword [rbp - 2264]
	mov r14, rax
	b5821:
	cmp r15, r12
	jl b5822
	b5823:
	mov rax, r14
	jmp b5824
	b5822:
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
	b5824:
	mov qword [rbp - 1392], rax
	mov rax, qword [rbp - 208]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2264]
	mov r12, rax
	mov rax, qword [rbp - 3120]
	mov rbx, rax
	b5825:
	cmp r12, r14
	jl b5826
	b5827:
	mov rax, rbx
	jmp b5828
	b5826:
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
	b5828:
	mov rcx, rax
	mov rax, qword [rbp - 1728]
	mov r15, rax
	mov rax, qword [rbp - 1392]
	mov r14, rax
	mov r13, rcx
	b5829:
	cmp r14, r15
	jl b5830
	b5831:
	mov rax, r13
	jmp b5832
	b5830:
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
	b5832:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5816:
	mov qword [rbp - 2712], rax
	mov rax, qword [rbp - 2688]
	sub rax, 1
	mov qword [rbp - 2608], rax
	mov rax, qword [rbp - 816]
	mov qword [rbp - 2064], rax
	mov rax, qword [rbp - 2680]
	mov qword [rbp - 2224], rax
	b5833:
	mov rcx, qword [rbp - 2064]
	mov rax, qword [rbp - 2608]
	cmp rcx, rax
	jl b5834
	b5835:
	mov rax, qword [rbp - 2224]
	jmp b5836
	b5834:
	mov rax, qword [rbp - 2608]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2064]
	mov r15, rax
	mov rax, qword [rbp - 2224]
	mov r13, rax
	b5837:
	cmp r15, r14
	jl b5838
	b5839:
	mov rax, r13
	jmp b5840
	b5838:
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
	b5840:
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 2064]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2224]
	mov r12, rax
	mov rax, qword [rbp - 2608]
	mov r13, rax
	b5841:
	cmp r12, r15
	jl b5842
	b5843:
	mov rax, r13
	jmp b5844
	b5842:
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
	b5844:
	mov qword [rbp - 1384], rax
	mov rax, qword [rbp - 2224]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2608]
	mov r15, rax
	mov rax, qword [rbp - 2064]
	mov r14, rax
	b5845:
	cmp r15, r12
	jl b5846
	b5847:
	mov rax, r14
	jmp b5848
	b5846:
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
	b5848:
	mov rcx, rax
	mov rax, qword [rbp - 80]
	mov r15, rax
	mov rax, qword [rbp - 1384]
	mov rbx, rax
	mov r14, rcx
	b5849:
	cmp rbx, r15
	jl b5850
	b5851:
	mov rax, r14
	jmp b5852
	b5850:
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
	b5852:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5836:
	mov qword [rbp - 3200], rax
	mov rax, qword [rbp - 816]
	sub rax, 1
	mov qword [rbp - 1856], rax
	mov rax, qword [rbp - 2680]
	mov qword [rbp - 2976], rax
	mov rax, qword [rbp - 2688]
	mov qword [rbp - 976], rax
	b5853:
	mov rcx, qword [rbp - 2976]
	mov rax, qword [rbp - 1856]
	cmp rcx, rax
	jl b5854
	b5855:
	mov rax, qword [rbp - 976]
	jmp b5856
	b5854:
	mov rax, qword [rbp - 1856]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2976]
	mov rbx, rax
	mov rax, qword [rbp - 976]
	mov r12, rax
	b5857:
	cmp rbx, r15
	jl b5858
	b5859:
	mov rax, r12
	jmp b5860
	b5858:
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
	b5860:
	mov qword [rbp - 464], rax
	mov rax, qword [rbp - 2976]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 976]
	mov r15, rax
	mov rax, qword [rbp - 1856]
	mov rbx, rax
	b5861:
	cmp r15, r13
	jl b5862
	b5863:
	mov rax, rbx
	jmp b5864
	b5862:
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
	b5864:
	mov qword [rbp - 1472], rax
	mov rax, qword [rbp - 976]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1856]
	mov r14, rax
	mov rax, qword [rbp - 2976]
	mov r13, rax
	b5865:
	cmp r14, r12
	jl b5866
	b5867:
	mov rax, r13
	jmp b5868
	b5866:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5868:
	mov rcx, qword [rbp - 464]
	mov r14, rcx
	mov rcx, qword [rbp - 1472]
	mov r15, rcx
	mov rbx, rax
	b5869:
	cmp r15, r14
	jl b5870
	b5871:
	mov rax, rbx
	jmp b5872
	b5870:
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
	b5872:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5856:
	mov rcx, rax
	mov rax, qword [rbp - 2712]
	mov qword [rbp - 880], rax
	mov rax, qword [rbp - 3200]
	mov qword [rbp - 760], rax
	mov rax, rcx
	mov qword [rbp - 712], rax
	b5873:
	mov rcx, qword [rbp - 760]
	mov rax, qword [rbp - 880]
	cmp rcx, rax
	jl b5874
	b5875:
	mov rax, qword [rbp - 712]
	jmp b5876
	b5874:
	mov rax, qword [rbp - 880]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 760]
	mov r15, rax
	mov rax, qword [rbp - 712]
	mov rbx, rax
	b5877:
	cmp r15, r14
	jl b5878
	b5879:
	mov rax, rbx
	jmp b5880
	b5878:
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
	b5880:
	mov qword [rbp - 2856], rax
	mov rax, qword [rbp - 760]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 712]
	mov r12, rax
	mov rax, qword [rbp - 880]
	mov r13, rax
	b5881:
	cmp r12, rbx
	jl b5882
	b5883:
	mov rax, r13
	jmp b5884
	b5882:
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
	b5884:
	mov qword [rbp - 1744], rax
	mov rax, qword [rbp - 712]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 880]
	mov rbx, rax
	mov rax, qword [rbp - 760]
	mov r12, rax
	b5885:
	cmp rbx, r15
	jl b5886
	b5887:
	mov rax, r12
	jmp b5888
	b5886:
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
	b5888:
	mov rcx, rax
	mov rax, qword [rbp - 2856]
	mov r12, rax
	mov rax, qword [rbp - 1744]
	mov r15, rax
	mov rbx, rcx
	b5889:
	cmp r15, r12
	jl b5890
	b5891:
	mov rax, rbx
	jmp b5892
	b5890:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5892:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5876:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5812:
	mov qword [rbp - 1520], rax
	mov rax, qword [rbp - 1976]
	sub rax, 1
	mov qword [rbp - 1168], rax
	mov rax, qword [rbp - 2232]
	mov qword [rbp - 2024], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 960], rax
	b5893:
	mov rax, qword [rbp - 2024]
	mov rcx, qword [rbp - 1168]
	cmp rax, rcx
	jl b5894
	b5895:
	mov rax, qword [rbp - 960]
	jmp b5896
	b5894:
	mov rax, qword [rbp - 1168]
	sub rax, 1
	mov qword [rbp - 1552], rax
	mov rax, qword [rbp - 2024]
	mov qword [rbp - 3112], rax
	mov rax, qword [rbp - 960]
	mov qword [rbp - 416], rax
	b5897:
	mov rax, qword [rbp - 3112]
	mov rcx, qword [rbp - 1552]
	cmp rax, rcx
	jl b5898
	b5899:
	mov rax, qword [rbp - 416]
	jmp b5900
	b5898:
	mov rax, qword [rbp - 1552]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3112]
	mov r15, rax
	mov rax, qword [rbp - 416]
	mov r14, rax
	b5901:
	cmp r15, rbx
	jl b5902
	b5903:
	mov rax, r14
	jmp b5904
	b5902:
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
	b5904:
	mov qword [rbp - 2600], rax
	mov rax, qword [rbp - 3112]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 416]
	mov r14, rax
	mov rax, qword [rbp - 1552]
	mov r13, rax
	b5905:
	cmp r14, r15
	jl b5906
	b5907:
	mov rax, r13
	jmp b5908
	b5906:
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
	b5908:
	mov qword [rbp - 2496], rax
	mov rax, qword [rbp - 416]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1552]
	mov rbx, rax
	mov rax, qword [rbp - 3112]
	mov r13, rax
	b5909:
	cmp rbx, r14
	jl b5910
	b5911:
	mov rax, r13
	jmp b5912
	b5910:
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
	b5912:
	mov rcx, rax
	mov rax, qword [rbp - 2600]
	mov r12, rax
	mov rax, qword [rbp - 2496]
	mov r15, rax
	mov r14, rcx
	b5913:
	cmp r15, r12
	jl b5914
	b5915:
	mov rax, r14
	jmp b5916
	b5914:
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
	b5916:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5900:
	mov qword [rbp - 784], rax
	mov rax, qword [rbp - 2024]
	sub rax, 1
	mov qword [rbp - 1928], rax
	mov rax, qword [rbp - 960]
	mov qword [rbp - 1752], rax
	mov rax, qword [rbp - 1168]
	mov qword [rbp - 408], rax
	b5917:
	mov rcx, qword [rbp - 1752]
	mov rax, qword [rbp - 1928]
	cmp rcx, rax
	jl b5918
	b5919:
	mov rax, qword [rbp - 408]
	jmp b5920
	b5918:
	mov rax, qword [rbp - 1928]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1752]
	mov r12, rax
	mov rax, qword [rbp - 408]
	mov r13, rax
	b5921:
	cmp r12, r14
	jl b5922
	b5923:
	mov rax, r13
	jmp b5924
	b5922:
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
	b5924:
	mov qword [rbp - 1456], rax
	mov rax, qword [rbp - 1752]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 408]
	mov r12, rax
	mov rax, qword [rbp - 1928]
	mov r15, rax
	b5925:
	cmp r12, r14
	jl b5926
	b5927:
	mov rax, r15
	jmp b5928
	b5926:
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
	b5928:
	mov qword [rbp - 3360], rax
	mov rax, qword [rbp - 408]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1928]
	mov r12, rax
	mov rax, qword [rbp - 1752]
	mov rbx, rax
	b5929:
	cmp r12, r14
	jl b5930
	b5931:
	mov rax, rbx
	jmp b5932
	b5930:
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
	b5932:
	mov rcx, qword [rbp - 1456]
	mov rbx, rcx
	mov rcx, qword [rbp - 3360]
	mov r12, rcx
	mov r14, rax
	b5933:
	cmp r12, rbx
	jl b5934
	b5935:
	mov rax, r14
	jmp b5936
	b5934:
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
	b5936:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5920:
	mov qword [rbp - 2336], rax
	mov rax, qword [rbp - 960]
	sub rax, 1
	mov qword [rbp - 1824], rax
	mov rax, qword [rbp - 1168]
	mov qword [rbp - 3320], rax
	mov rax, qword [rbp - 2024]
	mov qword [rbp - 232], rax
	b5937:
	mov rcx, qword [rbp - 3320]
	mov rax, qword [rbp - 1824]
	cmp rcx, rax
	jl b5938
	b5939:
	mov rax, qword [rbp - 232]
	jmp b5940
	b5938:
	mov rax, qword [rbp - 1824]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3320]
	mov r12, rax
	mov rax, qword [rbp - 232]
	mov r13, rax
	b5941:
	cmp r12, rbx
	jl b5942
	b5943:
	mov rax, r13
	jmp b5944
	b5942:
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
	b5944:
	mov qword [rbp - 1480], rax
	mov rax, qword [rbp - 3320]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 232]
	mov r14, rax
	mov rax, qword [rbp - 1824]
	mov r15, rax
	b5945:
	cmp r14, r12
	jl b5946
	b5947:
	mov rax, r15
	jmp b5948
	b5946:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5948:
	mov qword [rbp - 2472], rax
	mov rax, qword [rbp - 232]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1824]
	mov r15, rax
	mov rax, qword [rbp - 3320]
	mov r12, rax
	b5949:
	cmp r15, rbx
	jl b5950
	b5951:
	mov rax, r12
	jmp b5952
	b5950:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5952:
	mov rcx, rax
	mov rax, qword [rbp - 1480]
	mov rbx, rax
	mov rax, qword [rbp - 2472]
	mov r14, rax
	mov r12, rcx
	b5953:
	cmp r14, rbx
	jl b5954
	b5955:
	mov rax, r12
	jmp b5956
	b5954:
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
	b5956:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5940:
	mov rcx, rax
	mov rax, qword [rbp - 784]
	mov qword [rbp - 1304], rax
	mov rax, qword [rbp - 2336]
	mov qword [rbp - 1080], rax
	mov rax, rcx
	mov qword [rbp - 2368], rax
	b5957:
	mov rcx, qword [rbp - 1080]
	mov rax, qword [rbp - 1304]
	cmp rcx, rax
	jl b5958
	b5959:
	mov rax, qword [rbp - 2368]
	jmp b5960
	b5958:
	mov rax, qword [rbp - 1304]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1080]
	mov r13, rax
	mov rax, qword [rbp - 2368]
	mov r12, rax
	b5961:
	cmp r13, rbx
	jl b5962
	b5963:
	mov rax, r12
	jmp b5964
	b5962:
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
	mov r15, rax
	mov rax, r12
	sub rax, 1
	mov rdx, r13
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
	b5964:
	mov qword [rbp - 1232], rax
	mov rax, qword [rbp - 1080]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2368]
	mov r15, rax
	mov rax, qword [rbp - 1304]
	mov r14, rax
	b5965:
	cmp r15, r13
	jl b5966
	b5967:
	mov rax, r14
	jmp b5968
	b5966:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5968:
	mov qword [rbp - 1296], rax
	mov rax, qword [rbp - 2368]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1304]
	mov r15, rax
	mov rax, qword [rbp - 1080]
	mov r12, rax
	b5969:
	cmp r15, r14
	jl b5970
	b5971:
	mov rax, r12
	jmp b5972
	b5970:
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
	b5972:
	mov rcx, rax
	mov rax, qword [rbp - 1232]
	mov r15, rax
	mov rax, qword [rbp - 1296]
	mov r12, rax
	mov r13, rcx
	b5973:
	cmp r12, r15
	jl b5974
	b5975:
	mov rax, r13
	jmp b5976
	b5974:
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
	b5976:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5960:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5896:
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 2232]
	sub rax, 1
	mov qword [rbp - 896], rax
	mov rax, qword [rbp - 56]
	mov qword [rbp - 1048], rax
	mov rax, qword [rbp - 1976]
	mov qword [rbp - 3288], rax
	b5977:
	mov rax, qword [rbp - 1048]
	mov rcx, qword [rbp - 896]
	cmp rax, rcx
	jl b5978
	b5979:
	mov rax, qword [rbp - 3288]
	jmp b5980
	b5978:
	mov rax, qword [rbp - 896]
	sub rax, 1
	mov qword [rbp - 1952], rax
	mov rax, qword [rbp - 1048]
	mov qword [rbp - 2560], rax
	mov rax, qword [rbp - 3288]
	mov qword [rbp - 1136], rax
	b5981:
	mov rax, qword [rbp - 2560]
	mov rcx, qword [rbp - 1952]
	cmp rax, rcx
	jl b5982
	b5983:
	mov rax, qword [rbp - 1136]
	jmp b5984
	b5982:
	mov rax, qword [rbp - 1952]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2560]
	mov r12, rax
	mov rax, qword [rbp - 1136]
	mov r13, rax
	b5985:
	cmp r12, r15
	jl b5986
	b5987:
	mov rax, r13
	jmp b5988
	b5986:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5988:
	mov qword [rbp - 808], rax
	mov rax, qword [rbp - 2560]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1136]
	mov r12, rax
	mov rax, qword [rbp - 1952]
	mov r13, rax
	b5989:
	cmp r12, r14
	jl b5990
	b5991:
	mov rax, r13
	jmp b5992
	b5990:
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
	b5992:
	mov qword [rbp - 2432], rax
	mov rax, qword [rbp - 1136]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1952]
	mov r15, rax
	mov rax, qword [rbp - 2560]
	mov rbx, rax
	b5993:
	cmp r15, r14
	jl b5994
	b5995:
	mov rax, rbx
	jmp b5996
	b5994:
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
	b5996:
	mov rcx, qword [rbp - 808]
	mov r15, rcx
	mov rcx, qword [rbp - 2432]
	mov r12, rcx
	mov r14, rax
	b5997:
	cmp r12, r15
	jl b5998
	b5999:
	mov rax, r14
	jmp b6000
	b5998:
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
	b6000:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5984:
	mov qword [rbp - 1312], rax
	mov rax, qword [rbp - 1048]
	sub rax, 1
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 3288]
	mov qword [rbp - 368], rax
	mov rax, qword [rbp - 896]
	mov qword [rbp - 2864], rax
	b6001:
	mov rax, qword [rbp - 368]
	mov rcx, qword [rbp - 264]
	cmp rax, rcx
	jl b6002
	b6003:
	mov rax, qword [rbp - 2864]
	jmp b6004
	b6002:
	mov rax, qword [rbp - 264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 368]
	mov r15, rax
	mov rax, qword [rbp - 2864]
	mov r12, rax
	b6005:
	cmp r15, r14
	jl b6006
	b6007:
	mov rax, r12
	jmp b6008
	b6006:
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
	b6008:
	mov qword [rbp - 472], rax
	mov rax, qword [rbp - 368]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2864]
	mov r14, rax
	mov rax, qword [rbp - 264]
	mov r12, rax
	b6009:
	cmp r14, r15
	jl b6010
	b6011:
	mov rax, r12
	jmp b6012
	b6010:
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
	b6012:
	mov qword [rbp - 2240], rax
	mov rax, qword [rbp - 2864]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 264]
	mov r14, rax
	mov rax, qword [rbp - 368]
	mov r12, rax
	b6013:
	cmp r14, rbx
	jl b6014
	b6015:
	mov rax, r12
	jmp b6016
	b6014:
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
	b6016:
	mov rcx, rax
	mov rax, qword [rbp - 472]
	mov r12, rax
	mov rax, qword [rbp - 2240]
	mov r15, rax
	mov rbx, rcx
	b6017:
	cmp r15, r12
	jl b6018
	b6019:
	mov rax, rbx
	jmp b6020
	b6018:
	mov rax, r12
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov r14, rax
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
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6020:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6004:
	mov qword [rbp - 2312], rax
	mov rax, qword [rbp - 3288]
	sub rax, 1
	mov qword [rbp - 480], rax
	mov rax, qword [rbp - 896]
	mov qword [rbp - 1488], rax
	mov rax, qword [rbp - 1048]
	mov qword [rbp - 2136], rax
	b6021:
	mov rax, qword [rbp - 1488]
	mov rcx, qword [rbp - 480]
	cmp rax, rcx
	jl b6022
	b6023:
	mov rax, qword [rbp - 2136]
	jmp b6024
	b6022:
	mov rax, qword [rbp - 480]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1488]
	mov r14, rax
	mov rax, qword [rbp - 2136]
	mov r12, rax
	b6025:
	cmp r14, r15
	jl b6026
	b6027:
	mov rax, r12
	jmp b6028
	b6026:
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
	b6028:
	mov qword [rbp - 2000], rax
	mov rax, qword [rbp - 1488]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2136]
	mov r14, rax
	mov rax, qword [rbp - 480]
	mov r12, rax
	b6029:
	cmp r14, r15
	jl b6030
	b6031:
	mov rax, r12
	jmp b6032
	b6030:
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
	b6032:
	mov qword [rbp - 1712], rax
	mov rax, qword [rbp - 2136]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 480]
	mov r14, rax
	mov rax, qword [rbp - 1488]
	mov rbx, rax
	b6033:
	cmp r14, r15
	jl b6034
	b6035:
	mov rax, rbx
	jmp b6036
	b6034:
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
	b6036:
	mov rcx, qword [rbp - 2000]
	mov r12, rcx
	mov rcx, qword [rbp - 1712]
	mov r15, rcx
	mov rbx, rax
	b6037:
	cmp r15, r12
	jl b6038
	b6039:
	mov rax, rbx
	jmp b6040
	b6038:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6040:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6024:
	mov rcx, qword [rbp - 1312]
	mov qword [rbp - 912], rcx
	mov rcx, qword [rbp - 2312]
	mov qword [rbp - 3128], rcx
	mov qword [rbp - 1184], rax
	b6041:
	mov rax, qword [rbp - 3128]
	mov rcx, qword [rbp - 912]
	cmp rax, rcx
	jl b6042
	b6043:
	mov rax, qword [rbp - 1184]
	jmp b6044
	b6042:
	mov rax, qword [rbp - 912]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3128]
	mov rbx, rax
	mov rax, qword [rbp - 1184]
	mov r12, rax
	b6045:
	cmp rbx, r15
	jl b6046
	b6047:
	mov rax, r12
	jmp b6048
	b6046:
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
	b6048:
	mov qword [rbp - 176], rax
	mov rax, qword [rbp - 3128]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1184]
	mov r13, rax
	mov rax, qword [rbp - 912]
	mov r15, rax
	b6049:
	cmp r13, rbx
	jl b6050
	b6051:
	mov rax, r15
	jmp b6052
	b6050:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6052:
	mov qword [rbp - 648], rax
	mov rax, qword [rbp - 1184]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 912]
	mov r14, rax
	mov rax, qword [rbp - 3128]
	mov rbx, rax
	b6053:
	cmp r14, r15
	jl b6054
	b6055:
	mov rax, rbx
	jmp b6056
	b6054:
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
	b6056:
	mov rcx, rax
	mov rax, qword [rbp - 176]
	mov r12, rax
	mov rax, qword [rbp - 648]
	mov rbx, rax
	mov r15, rcx
	b6057:
	cmp rbx, r12
	jl b6058
	b6059:
	mov rax, r15
	jmp b6060
	b6058:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6060:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6044:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5980:
	mov rcx, rax
	mov rax, qword [rbp - 1520]
	mov qword [rbp - 1656], rax
	mov rax, qword [rbp - 240]
	mov qword [rbp - 2624], rax
	mov rax, rcx
	mov qword [rbp - 824], rax
	b6061:
	mov rax, qword [rbp - 2624]
	mov rcx, qword [rbp - 1656]
	cmp rax, rcx
	jl b6062
	b6063:
	mov rax, qword [rbp - 824]
	jmp b6064
	b6062:
	mov rax, qword [rbp - 1656]
	sub rax, 1
	mov qword [rbp - 2208], rax
	mov rax, qword [rbp - 2624]
	mov qword [rbp - 3400], rax
	mov rax, qword [rbp - 824]
	mov qword [rbp - 2320], rax
	b6065:
	mov rcx, qword [rbp - 3400]
	mov rax, qword [rbp - 2208]
	cmp rcx, rax
	jl b6066
	b6067:
	mov rax, qword [rbp - 2320]
	jmp b6068
	b6066:
	mov rax, qword [rbp - 2208]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3400]
	mov r12, rax
	mov rax, qword [rbp - 2320]
	mov r13, rax
	b6069:
	cmp r12, r15
	jl b6070
	b6071:
	mov rax, r13
	jmp b6072
	b6070:
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
	b6072:
	mov qword [rbp - 392], rax
	mov rax, qword [rbp - 3400]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2320]
	mov rbx, rax
	mov rax, qword [rbp - 2208]
	mov r13, rax
	b6073:
	cmp rbx, r12
	jl b6074
	b6075:
	mov rax, r13
	jmp b6076
	b6074:
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
	b6076:
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 2320]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2208]
	mov rbx, rax
	mov rax, qword [rbp - 3400]
	mov r13, rax
	b6077:
	cmp rbx, r14
	jl b6078
	b6079:
	mov rax, r13
	jmp b6080
	b6078:
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
	b6080:
	mov rcx, qword [rbp - 392]
	mov r15, rcx
	mov rcx, qword [rbp - 184]
	mov rbx, rcx
	mov r14, rax
	b6081:
	cmp rbx, r15
	jl b6082
	b6083:
	mov rax, r14
	jmp b6084
	b6082:
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
	b6084:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6068:
	mov qword [rbp - 1496], rax
	mov rax, qword [rbp - 2624]
	sub rax, 1
	mov qword [rbp - 3048], rax
	mov rax, qword [rbp - 824]
	mov qword [rbp - 1416], rax
	mov rax, qword [rbp - 1656]
	mov qword [rbp - 3296], rax
	b6085:
	mov rcx, qword [rbp - 1416]
	mov rax, qword [rbp - 3048]
	cmp rcx, rax
	jl b6086
	b6087:
	mov rax, qword [rbp - 3296]
	jmp b6088
	b6086:
	mov rax, qword [rbp - 3048]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1416]
	mov rbx, rax
	mov rax, qword [rbp - 3296]
	mov r13, rax
	b6089:
	cmp rbx, r12
	jl b6090
	b6091:
	mov rax, r13
	jmp b6092
	b6090:
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
	b6092:
	mov qword [rbp - 576], rax
	mov rax, qword [rbp - 1416]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3296]
	mov r15, rax
	mov rax, qword [rbp - 3048]
	mov r13, rax
	b6093:
	cmp r15, r14
	jl b6094
	b6095:
	mov rax, r13
	jmp b6096
	b6094:
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
	b6096:
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 3296]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3048]
	mov r14, rax
	mov rax, qword [rbp - 1416]
	mov r12, rax
	b6097:
	cmp r14, r15
	jl b6098
	b6099:
	mov rax, r12
	jmp b6100
	b6098:
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
	b6100:
	mov rcx, rax
	mov rax, qword [rbp - 576]
	mov r15, rax
	mov rax, qword [rbp - 64]
	mov r14, rax
	mov r12, rcx
	b6101:
	cmp r14, r15
	jl b6102
	b6103:
	mov rax, r12
	jmp b6104
	b6102:
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
	b6104:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6088:
	mov qword [rbp - 3160], rax
	mov rax, qword [rbp - 824]
	sub rax, 1
	mov qword [rbp - 1664], rax
	mov rax, qword [rbp - 1656]
	mov qword [rbp - 3184], rax
	mov rax, qword [rbp - 2624]
	mov qword [rbp - 1464], rax
	b6105:
	mov rax, qword [rbp - 3184]
	mov rcx, qword [rbp - 1664]
	cmp rax, rcx
	jl b6106
	b6107:
	mov rax, qword [rbp - 1464]
	jmp b6108
	b6106:
	mov rax, qword [rbp - 1664]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3184]
	mov r15, rax
	mov rax, qword [rbp - 1464]
	mov r14, rax
	b6109:
	cmp r15, rbx
	jl b6110
	b6111:
	mov rax, r14
	jmp b6112
	b6110:
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
	b6112:
	mov qword [rbp - 304], rax
	mov rax, qword [rbp - 3184]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1464]
	mov r12, rax
	mov rax, qword [rbp - 1664]
	mov rbx, rax
	b6113:
	cmp r12, r14
	jl b6114
	b6115:
	mov rax, rbx
	jmp b6116
	b6114:
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
	b6116:
	mov qword [rbp - 376], rax
	mov rax, qword [rbp - 1464]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1664]
	mov r15, rax
	mov rax, qword [rbp - 3184]
	mov r14, rax
	b6117:
	cmp r15, r12
	jl b6118
	b6119:
	mov rax, r14
	jmp b6120
	b6118:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6120:
	mov rcx, rax
	mov rax, qword [rbp - 304]
	mov r15, rax
	mov rax, qword [rbp - 376]
	mov rbx, rax
	mov r14, rcx
	b6121:
	cmp rbx, r15
	jl b6122
	b6123:
	mov rax, r14
	jmp b6124
	b6122:
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
	mov r12, rax
	mov rax, r14
	sub rax, 1
	mov rdx, rbx
	mov rsi, r15
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, r13
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6124:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6108:
	mov rcx, rax
	mov rax, qword [rbp - 1496]
	mov qword [rbp - 2632], rax
	mov rax, qword [rbp - 3160]
	mov qword [rbp - 1528], rax
	mov rax, rcx
	mov qword [rbp - 2176], rax
	b6125:
	mov rcx, qword [rbp - 1528]
	mov rax, qword [rbp - 2632]
	cmp rcx, rax
	jl b6126
	b6127:
	mov rax, qword [rbp - 2176]
	jmp b6128
	b6126:
	mov rax, qword [rbp - 2632]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1528]
	mov r15, rax
	mov rax, qword [rbp - 2176]
	mov r13, rax
	b6129:
	cmp r15, r14
	jl b6130
	b6131:
	mov rax, r13
	jmp b6132
	b6130:
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
	b6132:
	mov qword [rbp - 3056], rax
	mov rax, qword [rbp - 1528]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2176]
	mov r14, rax
	mov rax, qword [rbp - 2632]
	mov rbx, rax
	b6133:
	cmp r14, r15
	jl b6134
	b6135:
	mov rax, rbx
	jmp b6136
	b6134:
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
	b6136:
	mov qword [rbp - 2736], rax
	mov rax, qword [rbp - 2176]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2632]
	mov r12, rax
	mov rax, qword [rbp - 1528]
	mov rbx, rax
	b6137:
	cmp r12, r15
	jl b6138
	b6139:
	mov rax, rbx
	jmp b6140
	b6138:
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
	b6140:
	mov rcx, qword [rbp - 3056]
	mov r15, rcx
	mov rcx, qword [rbp - 2736]
	mov r12, rcx
	mov r13, rax
	b6141:
	cmp r12, r15
	jl b6142
	b6143:
	mov rax, r13
	jmp b6144
	b6142:
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
	b6144:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6128:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6064:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b5808:
	mov qword [rbp - 3104], rax
	mov rax, qword [rbp - 1152]
	sub rax, 1
	mov qword [rbp - 2840], rax
	mov rax, qword [rbp - 2168]
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 2944]
	mov qword [rbp - 1192], rax
	b6145:
	mov rax, qword [rbp - 216]
	mov rcx, qword [rbp - 2840]
	cmp rax, rcx
	jl b6146
	b6147:
	mov rax, qword [rbp - 1192]
	jmp b6148
	b6146:
	mov rax, qword [rbp - 2840]
	sub rax, 1
	mov qword [rbp - 544], rax
	mov rax, qword [rbp - 216]
	mov qword [rbp - 2784], rax
	mov rax, qword [rbp - 1192]
	mov qword [rbp - 328], rax
	b6149:
	mov rcx, qword [rbp - 2784]
	mov rax, qword [rbp - 544]
	cmp rcx, rax
	jl b6150
	b6151:
	mov rax, qword [rbp - 328]
	jmp b6152
	b6150:
	mov rax, qword [rbp - 544]
	sub rax, 1
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 2784]
	mov qword [rbp - 640], rax
	mov rax, qword [rbp - 328]
	mov qword [rbp - 3336], rax
	b6153:
	mov rax, qword [rbp - 640]
	mov rcx, qword [rbp - 24]
	cmp rax, rcx
	jl b6154
	b6155:
	mov rax, qword [rbp - 3336]
	jmp b6156
	b6154:
	mov rax, qword [rbp - 24]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 640]
	mov r13, rax
	mov rax, qword [rbp - 3336]
	mov r14, rax
	b6157:
	cmp r13, rbx
	jl b6158
	b6159:
	mov rax, r14
	jmp b6160
	b6158:
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
	b6160:
	mov qword [rbp - 1376], rax
	mov rax, qword [rbp - 640]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3336]
	mov r12, rax
	mov rax, qword [rbp - 24]
	mov r14, rax
	b6161:
	cmp r12, r15
	jl b6162
	b6163:
	mov rax, r14
	jmp b6164
	b6162:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b6164:
	mov qword [rbp - 1592], rax
	mov rax, qword [rbp - 3336]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 24]
	mov rbx, rax
	mov rax, qword [rbp - 640]
	mov r15, rax
	b6165:
	cmp rbx, r14
	jl b6166
	b6167:
	mov rax, r15
	jmp b6168
	b6166:
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
	b6168:
	mov rcx, qword [rbp - 1376]
	mov r15, rcx
	mov rcx, qword [rbp - 1592]
	mov r12, rcx
	mov r13, rax
	b6169:
	cmp r12, r15
	jl b6170
	b6171:
	mov rax, r13
	jmp b6172
	b6170:
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
	b6172:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6156:
	mov qword [rbp - 1336], rax
	mov rax, qword [rbp - 2784]
	sub rax, 1
	mov qword [rbp - 608], rax
	mov rax, qword [rbp - 328]
	mov qword [rbp - 1640], rax
	mov rax, qword [rbp - 544]
	mov qword [rbp - 2296], rax
	b6173:
	mov rax, qword [rbp - 1640]
	mov rcx, qword [rbp - 608]
	cmp rax, rcx
	jl b6174
	b6175:
	mov rax, qword [rbp - 2296]
	jmp b6176
	b6174:
	mov rax, qword [rbp - 608]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1640]
	mov rbx, rax
	mov rax, qword [rbp - 2296]
	mov r14, rax
	b6177:
	cmp rbx, r15
	jl b6178
	b6179:
	mov rax, r14
	jmp b6180
	b6178:
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
	b6180:
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 1640]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2296]
	mov r14, rax
	mov rax, qword [rbp - 608]
	mov r13, rax
	b6181:
	cmp r14, rbx
	jl b6182
	b6183:
	mov rax, r13
	jmp b6184
	b6182:
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
	b6184:
	mov qword [rbp - 280], rax
	mov rax, qword [rbp - 2296]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 608]
	mov r12, rax
	mov rax, qword [rbp - 1640]
	mov r15, rax
	b6185:
	cmp r12, r14
	jl b6186
	b6187:
	mov rax, r15
	jmp b6188
	b6186:
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
	b6188:
	mov rcx, rax
	mov rax, qword [rbp - 48]
	mov r15, rax
	mov rax, qword [rbp - 280]
	mov rbx, rax
	mov r14, rcx
	b6189:
	cmp rbx, r15
	jl b6190
	b6191:
	mov rax, r14
	jmp b6192
	b6190:
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
	b6192:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6176:
	mov qword [rbp - 1240], rax
	mov rax, qword [rbp - 328]
	sub rax, 1
	mov qword [rbp - 792], rax
	mov rax, qword [rbp - 544]
	mov qword [rbp - 400], rax
	mov rax, qword [rbp - 2784]
	mov qword [rbp - 2848], rax
	b6193:
	mov rcx, qword [rbp - 400]
	mov rax, qword [rbp - 792]
	cmp rcx, rax
	jl b6194
	b6195:
	mov rax, qword [rbp - 2848]
	jmp b6196
	b6194:
	mov rax, qword [rbp - 792]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 400]
	mov r12, rax
	mov rax, qword [rbp - 2848]
	mov r14, rax
	b6197:
	cmp r12, r15
	jl b6198
	b6199:
	mov rax, r14
	jmp b6200
	b6198:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r12
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
	b6200:
	mov qword [rbp - 3280], rax
	mov rax, qword [rbp - 400]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2848]
	mov r13, rax
	mov rax, qword [rbp - 792]
	mov r14, rax
	b6201:
	cmp r13, r12
	jl b6202
	b6203:
	mov rax, r14
	jmp b6204
	b6202:
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
	mov r15, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r13
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
	b6204:
	mov qword [rbp - 352], rax
	mov rax, qword [rbp - 2848]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 792]
	mov rbx, rax
	mov rax, qword [rbp - 400]
	mov r13, rax
	b6205:
	cmp rbx, r14
	jl b6206
	b6207:
	mov rax, r13
	jmp b6208
	b6206:
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
	b6208:
	mov rcx, qword [rbp - 3280]
	mov r14, rcx
	mov rcx, qword [rbp - 352]
	mov r15, rcx
	mov r13, rax
	b6209:
	cmp r15, r14
	jl b6210
	b6211:
	mov rax, r13
	jmp b6212
	b6210:
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
	b6212:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6196:
	mov rcx, rax
	mov rax, qword [rbp - 1336]
	mov qword [rbp - 2440], rax
	mov rax, qword [rbp - 1240]
	mov qword [rbp - 2912], rax
	mov rax, rcx
	mov qword [rbp - 1280], rax
	b6213:
	mov rcx, qword [rbp - 2912]
	mov rax, qword [rbp - 2440]
	cmp rcx, rax
	jl b6214
	b6215:
	mov rax, qword [rbp - 1280]
	jmp b6216
	b6214:
	mov rax, qword [rbp - 2440]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2912]
	mov r12, rax
	mov rax, qword [rbp - 1280]
	mov r13, rax
	b6217:
	cmp r12, rbx
	jl b6218
	b6219:
	mov rax, r13
	jmp b6220
	b6218:
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
	b6220:
	mov qword [rbp - 336], rax
	mov rax, qword [rbp - 2912]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1280]
	mov r12, rax
	mov rax, qword [rbp - 2440]
	mov r13, rax
	b6221:
	cmp r12, rbx
	jl b6222
	b6223:
	mov rax, r13
	jmp b6224
	b6222:
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
	b6224:
	mov qword [rbp - 2112], rax
	mov rax, qword [rbp - 1280]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2440]
	mov r14, rax
	mov rax, qword [rbp - 2912]
	mov r12, rax
	b6225:
	cmp r14, rbx
	jl b6226
	b6227:
	mov rax, r12
	jmp b6228
	b6226:
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
	b6228:
	mov rcx, rax
	mov rax, qword [rbp - 336]
	mov rbx, rax
	mov rax, qword [rbp - 2112]
	mov r14, rax
	mov r13, rcx
	b6229:
	cmp r14, rbx
	jl b6230
	b6231:
	mov rax, r13
	jmp b6232
	b6230:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6232:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6216:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6152:
	mov qword [rbp - 448], rax
	mov rax, qword [rbp - 216]
	sub rax, 1
	mov qword [rbp - 2152], rax
	mov rax, qword [rbp - 1192]
	mov qword [rbp - 2040], rax
	mov rax, qword [rbp - 2840]
	mov qword [rbp - 2792], rax
	b6233:
	mov rax, qword [rbp - 2040]
	mov rcx, qword [rbp - 2152]
	cmp rax, rcx
	jl b6234
	b6235:
	mov rax, qword [rbp - 2792]
	jmp b6236
	b6234:
	mov rax, qword [rbp - 2152]
	sub rax, 1
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 2040]
	mov qword [rbp - 2888], rax
	mov rax, qword [rbp - 2792]
	mov qword [rbp - 1584], rax
	b6237:
	mov rax, qword [rbp - 2888]
	mov rcx, qword [rbp - 8]
	cmp rax, rcx
	jl b6238
	b6239:
	mov rax, qword [rbp - 1584]
	jmp b6240
	b6238:
	mov rax, qword [rbp - 8]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2888]
	mov r13, rax
	mov rax, qword [rbp - 1584]
	mov r15, rax
	b6241:
	cmp r13, rbx
	jl b6242
	b6243:
	mov rax, r15
	jmp b6244
	b6242:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6244:
	mov qword [rbp - 3168], rax
	mov rax, qword [rbp - 2888]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1584]
	mov r12, rax
	mov rax, qword [rbp - 8]
	mov r14, rax
	b6245:
	cmp r12, r13
	jl b6246
	b6247:
	mov rax, r14
	jmp b6248
	b6246:
	mov rax, r13
	sub rax, 1
	mov rdx, r14
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r15, rax
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
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r15
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6248:
	mov qword [rbp - 2184], rax
	mov rax, qword [rbp - 1584]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 8]
	mov r15, rax
	mov rax, qword [rbp - 2888]
	mov rbx, rax
	b6249:
	cmp r15, r14
	jl b6250
	b6251:
	mov rax, rbx
	jmp b6252
	b6250:
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
	b6252:
	mov rcx, rax
	mov rax, qword [rbp - 3168]
	mov r12, rax
	mov rax, qword [rbp - 2184]
	mov r15, rax
	mov r14, rcx
	b6253:
	cmp r15, r12
	jl b6254
	b6255:
	mov rax, r14
	jmp b6256
	b6254:
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
	b6256:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6240:
	mov qword [rbp - 1888], rax
	mov rax, qword [rbp - 2040]
	sub rax, 1
	mov qword [rbp - 2328], rax
	mov rax, qword [rbp - 2792]
	mov qword [rbp - 2768], rax
	mov rax, qword [rbp - 2152]
	mov qword [rbp - 2512], rax
	b6257:
	mov rax, qword [rbp - 2768]
	mov rcx, qword [rbp - 2328]
	cmp rax, rcx
	jl b6258
	b6259:
	mov rax, qword [rbp - 2512]
	jmp b6260
	b6258:
	mov rax, qword [rbp - 2328]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2768]
	mov r15, rax
	mov rax, qword [rbp - 2512]
	mov r12, rax
	b6261:
	cmp r15, rbx
	jl b6262
	b6263:
	mov rax, r12
	jmp b6264
	b6262:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6264:
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 2768]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2512]
	mov r12, rax
	mov rax, qword [rbp - 2328]
	mov r15, rax
	b6265:
	cmp r12, r14
	jl b6266
	b6267:
	mov rax, r15
	jmp b6268
	b6266:
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
	b6268:
	mov qword [rbp - 2584], rax
	mov rax, qword [rbp - 2512]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2328]
	mov r15, rax
	mov rax, qword [rbp - 2768]
	mov r13, rax
	b6269:
	cmp r15, r14
	jl b6270
	b6271:
	mov rax, r13
	jmp b6272
	b6270:
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
	b6272:
	mov rcx, rax
	mov rax, qword [rbp - 160]
	mov rbx, rax
	mov rax, qword [rbp - 2584]
	mov r12, rax
	mov r14, rcx
	b6273:
	cmp r12, rbx
	jl b6274
	b6275:
	mov rax, r14
	jmp b6276
	b6274:
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
	b6276:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6260:
	mov qword [rbp - 1288], rax
	mov rax, qword [rbp - 2792]
	sub rax, 1
	mov qword [rbp - 456], rax
	mov rax, qword [rbp - 2152]
	mov qword [rbp - 2280], rax
	mov rax, qword [rbp - 2040]
	mov qword [rbp - 1088], rax
	b6277:
	mov rax, qword [rbp - 2280]
	mov rcx, qword [rbp - 456]
	cmp rax, rcx
	jl b6278
	b6279:
	mov rax, qword [rbp - 1088]
	jmp b6280
	b6278:
	mov rax, qword [rbp - 456]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2280]
	mov rbx, rax
	mov rax, qword [rbp - 1088]
	mov r12, rax
	b6281:
	cmp rbx, r14
	jl b6282
	b6283:
	mov rax, r12
	jmp b6284
	b6282:
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
	b6284:
	mov qword [rbp - 3368], rax
	mov rax, qword [rbp - 2280]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1088]
	mov r12, rax
	mov rax, qword [rbp - 456]
	mov r13, rax
	b6285:
	cmp r12, r14
	jl b6286
	b6287:
	mov rax, r13
	jmp b6288
	b6286:
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
	b6288:
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 1088]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 456]
	mov r12, rax
	mov rax, qword [rbp - 2280]
	mov r14, rax
	b6289:
	cmp r12, r15
	jl b6290
	b6291:
	mov rax, r14
	jmp b6292
	b6290:
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
	b6292:
	mov rcx, rax
	mov rax, qword [rbp - 3368]
	mov r15, rax
	mov rax, qword [rbp - 120]
	mov r14, rax
	mov r12, rcx
	b6293:
	cmp r14, r15
	jl b6294
	b6295:
	mov rax, r12
	jmp b6296
	b6294:
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
	b6296:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6280:
	mov rcx, rax
	mov rax, qword [rbp - 1888]
	mov qword [rbp - 1992], rax
	mov rax, qword [rbp - 1288]
	mov qword [rbp - 2392], rax
	mov rax, rcx
	mov qword [rbp - 2648], rax
	b6297:
	mov rax, qword [rbp - 2392]
	mov rcx, qword [rbp - 1992]
	cmp rax, rcx
	jl b6298
	b6299:
	mov rax, qword [rbp - 2648]
	jmp b6300
	b6298:
	mov rax, qword [rbp - 1992]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2392]
	mov r15, rax
	mov rax, qword [rbp - 2648]
	mov rbx, rax
	b6301:
	cmp r15, r13
	jl b6302
	b6303:
	mov rax, rbx
	jmp b6304
	b6302:
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
	b6304:
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 2392]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2648]
	mov r15, rax
	mov rax, qword [rbp - 1992]
	mov r13, rax
	b6305:
	cmp r15, r12
	jl b6306
	b6307:
	mov rax, r13
	jmp b6308
	b6306:
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
	b6308:
	mov qword [rbp - 1848], rax
	mov rax, qword [rbp - 2648]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1992]
	mov r12, rax
	mov rax, qword [rbp - 2392]
	mov r13, rax
	b6309:
	cmp r12, rbx
	jl b6310
	b6311:
	mov rax, r13
	jmp b6312
	b6310:
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
	b6312:
	mov rcx, rax
	mov rax, qword [rbp - 312]
	mov r14, rax
	mov rax, qword [rbp - 1848]
	mov r12, rax
	mov rbx, rcx
	b6313:
	cmp r12, r14
	jl b6314
	b6315:
	mov rax, rbx
	jmp b6316
	b6314:
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
	b6316:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6300:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6236:
	mov qword [rbp - 3144], rax
	mov rax, qword [rbp - 1192]
	sub rax, 1
	mov qword [rbp - 2096], rax
	mov rax, qword [rbp - 2840]
	mov qword [rbp - 2920], rax
	mov rax, qword [rbp - 216]
	mov qword [rbp - 2408], rax
	b6317:
	mov rax, qword [rbp - 2920]
	mov rcx, qword [rbp - 2096]
	cmp rax, rcx
	jl b6318
	b6319:
	mov rax, qword [rbp - 2408]
	jmp b6320
	b6318:
	mov rax, qword [rbp - 2096]
	sub rax, 1
	mov qword [rbp - 632], rax
	mov rax, qword [rbp - 2920]
	mov qword [rbp - 1360], rax
	mov rax, qword [rbp - 2408]
	mov qword [rbp - 2456], rax
	b6321:
	mov rax, qword [rbp - 1360]
	mov rcx, qword [rbp - 632]
	cmp rax, rcx
	jl b6322
	b6323:
	mov rax, qword [rbp - 2456]
	jmp b6324
	b6322:
	mov rax, qword [rbp - 632]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1360]
	mov r13, rax
	mov rax, qword [rbp - 2456]
	mov rbx, rax
	b6325:
	cmp r13, r12
	jl b6326
	b6327:
	mov rax, rbx
	jmp b6328
	b6326:
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
	b6328:
	mov qword [rbp - 840], rax
	mov rax, qword [rbp - 1360]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2456]
	mov r12, rax
	mov rax, qword [rbp - 632]
	mov rbx, rax
	b6329:
	cmp r12, r15
	jl b6330
	b6331:
	mov rax, rbx
	jmp b6332
	b6330:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6332:
	mov qword [rbp - 656], rax
	mov rax, qword [rbp - 2456]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 632]
	mov r14, rax
	mov rax, qword [rbp - 1360]
	mov r13, rax
	b6333:
	cmp r14, r12
	jl b6334
	b6335:
	mov rax, r13
	jmp b6336
	b6334:
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
	b6336:
	mov rcx, rax
	mov rax, qword [rbp - 840]
	mov r12, rax
	mov rax, qword [rbp - 656]
	mov r14, rax
	mov rbx, rcx
	b6337:
	cmp r14, r12
	jl b6338
	b6339:
	mov rax, rbx
	jmp b6340
	b6338:
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
	b6340:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6324:
	mov qword [rbp - 3064], rax
	mov rax, qword [rbp - 2920]
	sub rax, 1
	mov qword [rbp - 1448], rax
	mov rax, qword [rbp - 2408]
	mov qword [rbp - 3384], rax
	mov rax, qword [rbp - 2096]
	mov qword [rbp - 2424], rax
	b6341:
	mov rax, qword [rbp - 3384]
	mov rcx, qword [rbp - 1448]
	cmp rax, rcx
	jl b6342
	b6343:
	mov rax, qword [rbp - 2424]
	jmp b6344
	b6342:
	mov rax, qword [rbp - 1448]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3384]
	mov r14, rax
	mov rax, qword [rbp - 2424]
	mov r13, rax
	b6345:
	cmp r14, rbx
	jl b6346
	b6347:
	mov rax, r13
	jmp b6348
	b6346:
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
	b6348:
	mov qword [rbp - 936], rax
	mov rax, qword [rbp - 3384]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2424]
	mov r14, rax
	mov rax, qword [rbp - 1448]
	mov r15, rax
	b6349:
	cmp r14, r12
	jl b6350
	b6351:
	mov rax, r15
	jmp b6352
	b6350:
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
	b6352:
	mov qword [rbp - 1920], rax
	mov rax, qword [rbp - 2424]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1448]
	mov r13, rax
	mov rax, qword [rbp - 3384]
	mov rbx, rax
	b6353:
	cmp r13, r14
	jl b6354
	b6355:
	mov rax, rbx
	jmp b6356
	b6354:
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
	b6356:
	mov rcx, rax
	mov rax, qword [rbp - 936]
	mov r14, rax
	mov rax, qword [rbp - 1920]
	mov rbx, rax
	mov r15, rcx
	b6357:
	cmp rbx, r14
	jl b6358
	b6359:
	mov rax, r15
	jmp b6360
	b6358:
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
	b6360:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6344:
	mov qword [rbp - 1864], rax
	mov rax, qword [rbp - 2408]
	sub rax, 1
	mov qword [rbp - 2728], rax
	mov rax, qword [rbp - 2096]
	mov qword [rbp - 3264], rax
	mov rax, qword [rbp - 2920]
	mov qword [rbp - 2880], rax
	b6361:
	mov rcx, qword [rbp - 3264]
	mov rax, qword [rbp - 2728]
	cmp rcx, rax
	jl b6362
	b6363:
	mov rax, qword [rbp - 2880]
	jmp b6364
	b6362:
	mov rax, qword [rbp - 2728]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3264]
	mov rbx, rax
	mov rax, qword [rbp - 2880]
	mov r12, rax
	b6365:
	cmp rbx, r15
	jl b6366
	b6367:
	mov rax, r12
	jmp b6368
	b6366:
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
	b6368:
	mov qword [rbp - 1872], rax
	mov rax, qword [rbp - 3264]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2880]
	mov rbx, rax
	mov rax, qword [rbp - 2728]
	mov r13, rax
	b6369:
	cmp rbx, r14
	jl b6370
	b6371:
	mov rax, r13
	jmp b6372
	b6370:
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
	b6372:
	mov qword [rbp - 1144], rax
	mov rax, qword [rbp - 2880]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2728]
	mov r12, rax
	mov rax, qword [rbp - 3264]
	mov r13, rax
	b6373:
	cmp r12, r14
	jl b6374
	b6375:
	mov rax, r13
	jmp b6376
	b6374:
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
	b6376:
	mov rcx, qword [rbp - 1872]
	mov r14, rcx
	mov rcx, qword [rbp - 1144]
	mov r13, rcx
	mov r12, rax
	b6377:
	cmp r13, r14
	jl b6378
	b6379:
	mov rax, r12
	jmp b6380
	b6378:
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
	b6380:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6364:
	mov rcx, rax
	mov rax, qword [rbp - 3064]
	mov qword [rbp - 3096], rax
	mov rax, qword [rbp - 1864]
	mov qword [rbp - 88], rax
	mov rax, rcx
	mov qword [rbp - 40], rax
	b6381:
	mov rax, qword [rbp - 88]
	mov rcx, qword [rbp - 3096]
	cmp rax, rcx
	jl b6382
	b6383:
	mov rax, qword [rbp - 40]
	jmp b6384
	b6382:
	mov rax, qword [rbp - 3096]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 88]
	mov r15, rax
	mov rax, qword [rbp - 40]
	mov r14, rax
	b6385:
	cmp r15, rbx
	jl b6386
	b6387:
	mov rax, r14
	jmp b6388
	b6386:
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
	b6388:
	mov qword [rbp - 2192], rax
	mov rax, qword [rbp - 88]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 40]
	mov rbx, rax
	mov rax, qword [rbp - 3096]
	mov r15, rax
	b6389:
	cmp rbx, r14
	jl b6390
	b6391:
	mov rax, r15
	jmp b6392
	b6390:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6392:
	mov qword [rbp - 2032], rax
	mov rax, qword [rbp - 40]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3096]
	mov r12, rax
	mov rax, qword [rbp - 88]
	mov r13, rax
	b6393:
	cmp r12, r14
	jl b6394
	b6395:
	mov rax, r13
	jmp b6396
	b6394:
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
	b6396:
	mov rcx, rax
	mov rax, qword [rbp - 2192]
	mov r14, rax
	mov rax, qword [rbp - 2032]
	mov r12, rax
	mov r13, rcx
	b6397:
	cmp r12, r14
	jl b6398
	b6399:
	mov rax, r13
	jmp b6400
	b6398:
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
	b6400:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6384:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6320:
	mov rcx, rax
	mov rax, qword [rbp - 448]
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 3144]
	mov qword [rbp - 752], rax
	mov rax, rcx
	mov qword [rbp - 800], rax
	b6401:
	mov rcx, qword [rbp - 752]
	mov rax, qword [rbp - 152]
	cmp rcx, rax
	jl b6402
	b6403:
	mov rax, qword [rbp - 800]
	jmp b6404
	b6402:
	mov rax, qword [rbp - 152]
	sub rax, 1
	mov qword [rbp - 2072], rax
	mov rax, qword [rbp - 752]
	mov qword [rbp - 1600], rax
	mov rax, qword [rbp - 800]
	mov qword [rbp - 2776], rax
	b6405:
	mov rcx, qword [rbp - 1600]
	mov rax, qword [rbp - 2072]
	cmp rcx, rax
	jl b6406
	b6407:
	mov rax, qword [rbp - 2776]
	jmp b6408
	b6406:
	mov rax, qword [rbp - 2072]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1600]
	mov rbx, rax
	mov rax, qword [rbp - 2776]
	mov r14, rax
	b6409:
	cmp rbx, r15
	jl b6410
	b6411:
	mov rax, r14
	jmp b6412
	b6410:
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
	b6412:
	mov qword [rbp - 1832], rax
	mov rax, qword [rbp - 1600]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 2776]
	mov r15, rax
	mov rax, qword [rbp - 2072]
	mov r14, rax
	b6413:
	cmp r15, r13
	jl b6414
	b6415:
	mov rax, r14
	jmp b6416
	b6414:
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
	mov rbx, rax
	mov rax, r14
	sub rax, 1
	mov rdx, r15
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, rbx
	mov rdi, r12
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6416:
	mov qword [rbp - 968], rax
	mov rax, qword [rbp - 2776]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2072]
	mov r13, rax
	mov rax, qword [rbp - 1600]
	mov r15, rax
	b6417:
	cmp r13, rbx
	jl b6418
	b6419:
	mov rax, r15
	jmp b6420
	b6418:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6420:
	mov rcx, rax
	mov rax, qword [rbp - 1832]
	mov rbx, rax
	mov rax, qword [rbp - 968]
	mov r14, rax
	mov r13, rcx
	b6421:
	cmp r14, rbx
	jl b6422
	b6423:
	mov rax, r13
	jmp b6424
	b6422:
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
	b6424:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6408:
	mov qword [rbp - 1672], rax
	mov rax, qword [rbp - 752]
	sub rax, 1
	mov qword [rbp - 920], rax
	mov rax, qword [rbp - 800]
	mov qword [rbp - 3256], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 832], rax
	b6425:
	mov rax, qword [rbp - 3256]
	mov rcx, qword [rbp - 920]
	cmp rax, rcx
	jl b6426
	b6427:
	mov rax, qword [rbp - 832]
	jmp b6428
	b6426:
	mov rax, qword [rbp - 920]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3256]
	mov r14, rax
	mov rax, qword [rbp - 832]
	mov r12, rax
	b6429:
	cmp r14, r15
	jl b6430
	b6431:
	mov rax, r12
	jmp b6432
	b6430:
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
	b6432:
	mov qword [rbp - 1120], rax
	mov rax, qword [rbp - 3256]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 832]
	mov r12, rax
	mov rax, qword [rbp - 920]
	mov r13, rax
	b6433:
	cmp r12, rbx
	jl b6434
	b6435:
	mov rax, r13
	jmp b6436
	b6434:
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
	b6436:
	mov qword [rbp - 1760], rax
	mov rax, qword [rbp - 832]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 920]
	mov r15, rax
	mov rax, qword [rbp - 3256]
	mov r14, rax
	b6437:
	cmp r15, rbx
	jl b6438
	b6439:
	mov rax, r14
	jmp b6440
	b6438:
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
	b6440:
	mov rcx, qword [rbp - 1120]
	mov r15, rcx
	mov rcx, qword [rbp - 1760]
	mov r14, rcx
	mov rbx, rax
	b6441:
	cmp r14, r15
	jl b6442
	b6443:
	mov rax, rbx
	jmp b6444
	b6442:
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
	b6444:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6428:
	mov qword [rbp - 664], rax
	mov rax, qword [rbp - 800]
	sub rax, 1
	mov qword [rbp - 2008], rax
	mov rax, qword [rbp - 152]
	mov qword [rbp - 992], rax
	mov rax, qword [rbp - 752]
	mov qword [rbp - 256], rax
	b6445:
	mov rcx, qword [rbp - 992]
	mov rax, qword [rbp - 2008]
	cmp rcx, rax
	jl b6446
	b6447:
	mov rax, qword [rbp - 256]
	jmp b6448
	b6446:
	mov rax, qword [rbp - 2008]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 992]
	mov r12, rax
	mov rax, qword [rbp - 256]
	mov rbx, rax
	b6449:
	cmp r12, r14
	jl b6450
	b6451:
	mov rax, rbx
	jmp b6452
	b6450:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6452:
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 992]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 256]
	mov r12, rax
	mov rax, qword [rbp - 2008]
	mov r13, rax
	b6453:
	cmp r12, rbx
	jl b6454
	b6455:
	mov rax, r13
	jmp b6456
	b6454:
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
	b6456:
	mov qword [rbp - 2272], rax
	mov rax, qword [rbp - 256]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2008]
	mov r12, rax
	mov rax, qword [rbp - 992]
	mov r14, rax
	b6457:
	cmp r12, rbx
	jl b6458
	b6459:
	mov rax, r14
	jmp b6460
	b6458:
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
	b6460:
	mov rcx, rax
	mov rax, qword [rbp - 32]
	mov r14, rax
	mov rax, qword [rbp - 2272]
	mov rbx, rax
	mov r12, rcx
	b6461:
	cmp rbx, r14
	jl b6462
	b6463:
	mov rax, r12
	jmp b6464
	b6462:
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
	b6464:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6448:
	mov rcx, rax
	mov rax, qword [rbp - 1672]
	mov qword [rbp - 672], rax
	mov rax, qword [rbp - 664]
	mov qword [rbp - 3240], rax
	mov rax, rcx
	mov qword [rbp - 3376], rax
	b6465:
	mov rcx, qword [rbp - 3240]
	mov rax, qword [rbp - 672]
	cmp rcx, rax
	jl b6466
	b6467:
	mov rax, qword [rbp - 3376]
	jmp b6468
	b6466:
	mov rax, qword [rbp - 672]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3240]
	mov rbx, rax
	mov rax, qword [rbp - 3376]
	mov r13, rax
	b6469:
	cmp rbx, r15
	jl b6470
	b6471:
	mov rax, r13
	jmp b6472
	b6470:
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
	b6472:
	mov qword [rbp - 1536], rax
	mov rax, qword [rbp - 3240]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 3376]
	mov rbx, rax
	mov rax, qword [rbp - 672]
	mov r14, rax
	b6473:
	cmp rbx, r15
	jl b6474
	b6475:
	mov rax, r14
	jmp b6476
	b6474:
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
	b6476:
	mov qword [rbp - 1944], rax
	mov rax, qword [rbp - 3376]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 672]
	mov r15, rax
	mov rax, qword [rbp - 3240]
	mov rbx, rax
	b6477:
	cmp r15, r12
	jl b6478
	b6479:
	mov rax, rbx
	jmp b6480
	b6478:
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
	mov r14, rax
	mov rax, rbx
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r14
	mov rdi, r13
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6480:
	mov rcx, qword [rbp - 1536]
	mov r14, rcx
	mov rcx, qword [rbp - 1944]
	mov rbx, rcx
	mov r13, rax
	b6481:
	cmp rbx, r14
	jl b6482
	b6483:
	mov rax, r13
	jmp b6484
	b6482:
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
	b6484:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6468:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6404:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6148:
	mov rcx, qword [rbp - 1000]
	mov qword [rbp - 1264], rcx
	mov rcx, qword [rbp - 3104]
	mov qword [rbp - 2120], rcx
	mov qword [rbp - 2672], rax
	b6485:
	mov rax, qword [rbp - 2120]
	mov rcx, qword [rbp - 1264]
	cmp rax, rcx
	jl b6486
	b6487:
	mov rax, qword [rbp - 2672]
	jmp b6488
	b6486:
	mov rax, qword [rbp - 1264]
	sub rax, 1
	mov qword [rbp - 1400], rax
	mov rax, qword [rbp - 2120]
	mov qword [rbp - 168], rax
	mov rax, qword [rbp - 2672]
	mov qword [rbp - 1064], rax
	b6489:
	mov rcx, qword [rbp - 168]
	mov rax, qword [rbp - 1400]
	cmp rcx, rax
	jl b6490
	b6491:
	mov rax, qword [rbp - 1064]
	jmp b6492
	b6490:
	mov rax, qword [rbp - 1400]
	sub rax, 1
	mov qword [rbp - 1648], rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 768], rax
	mov rax, qword [rbp - 1064]
	mov qword [rbp - 2528], rax
	b6493:
	mov rcx, qword [rbp - 768]
	mov rax, qword [rbp - 1648]
	cmp rcx, rax
	jl b6494
	b6495:
	mov rax, qword [rbp - 2528]
	jmp b6496
	b6494:
	mov rax, qword [rbp - 1648]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 768]
	mov rbx, rax
	mov rax, qword [rbp - 2528]
	mov r13, rax
	b6497:
	cmp rbx, r14
	jl b6498
	b6499:
	mov rax, r13
	jmp b6500
	b6498:
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
	b6500:
	mov qword [rbp - 952], rax
	mov rax, qword [rbp - 768]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2528]
	mov r12, rax
	mov rax, qword [rbp - 1648]
	mov r15, rax
	b6501:
	cmp r12, r14
	jl b6502
	b6503:
	mov rax, r15
	jmp b6504
	b6502:
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
	b6504:
	mov qword [rbp - 72], rax
	mov rax, qword [rbp - 2528]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1648]
	mov r15, rax
	mov rax, qword [rbp - 768]
	mov r12, rax
	b6505:
	cmp r15, r14
	jl b6506
	b6507:
	mov rax, r12
	jmp b6508
	b6506:
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
	b6508:
	mov rcx, rax
	mov rax, qword [rbp - 952]
	mov r15, rax
	mov rax, qword [rbp - 72]
	mov r14, rax
	mov r12, rcx
	b6509:
	cmp r14, r15
	jl b6510
	b6511:
	mov rax, r12
	jmp b6512
	b6510:
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
	b6512:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6496:
	mov qword [rbp - 3312], rax
	mov rax, qword [rbp - 168]
	sub rax, 1
	mov qword [rbp - 2104], rax
	mov rax, qword [rbp - 1064]
	mov qword [rbp - 1368], rax
	mov rax, qword [rbp - 1400]
	mov qword [rbp - 2872], rax
	b6513:
	mov rcx, qword [rbp - 1368]
	mov rax, qword [rbp - 2104]
	cmp rcx, rax
	jl b6514
	b6515:
	mov rax, qword [rbp - 2872]
	jmp b6516
	b6514:
	mov rax, qword [rbp - 2104]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1368]
	mov r15, rax
	mov rax, qword [rbp - 2872]
	mov r13, rax
	b6517:
	cmp r15, r14
	jl b6518
	b6519:
	mov rax, r13
	jmp b6520
	b6518:
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
	b6520:
	mov qword [rbp - 2992], rax
	mov rax, qword [rbp - 1368]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2872]
	mov rbx, rax
	mov rax, qword [rbp - 2104]
	mov r14, rax
	b6521:
	cmp rbx, r15
	jl b6522
	b6523:
	mov rax, r14
	jmp b6524
	b6522:
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
	b6524:
	mov qword [rbp - 2568], rax
	mov rax, qword [rbp - 2872]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2104]
	mov r13, rax
	mov rax, qword [rbp - 1368]
	mov rbx, rax
	b6525:
	cmp r13, r12
	jl b6526
	b6527:
	mov rax, rbx
	jmp b6528
	b6526:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6528:
	mov rcx, rax
	mov rax, qword [rbp - 2992]
	mov r15, rax
	mov rax, qword [rbp - 2568]
	mov r14, rax
	mov rbx, rcx
	b6529:
	cmp r14, r15
	jl b6530
	b6531:
	mov rax, rbx
	jmp b6532
	b6530:
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
	b6532:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6516:
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 1064]
	sub rax, 1
	mov qword [rbp - 2640], rax
	mov rax, qword [rbp - 1400]
	mov qword [rbp - 2128], rax
	mov rax, qword [rbp - 168]
	mov qword [rbp - 1200], rax
	b6533:
	mov rcx, qword [rbp - 2128]
	mov rax, qword [rbp - 2640]
	cmp rcx, rax
	jl b6534
	b6535:
	mov rax, qword [rbp - 1200]
	jmp b6536
	b6534:
	mov rax, qword [rbp - 2640]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2128]
	mov r12, rax
	mov rax, qword [rbp - 1200]
	mov r14, rax
	b6537:
	cmp r12, rbx
	jl b6538
	b6539:
	mov rax, r14
	jmp b6540
	b6538:
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
	b6540:
	mov qword [rbp - 888], rax
	mov rax, qword [rbp - 2128]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1200]
	mov r12, rax
	mov rax, qword [rbp - 2640]
	mov rbx, rax
	b6541:
	cmp r12, r13
	jl b6542
	b6543:
	mov rax, rbx
	jmp b6544
	b6542:
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
	b6544:
	mov qword [rbp - 3328], rax
	mov rax, qword [rbp - 1200]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2640]
	mov r13, rax
	mov rax, qword [rbp - 2128]
	mov r15, rax
	b6545:
	cmp r13, r12
	jl b6546
	b6547:
	mov rax, r15
	jmp b6548
	b6546:
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
	b6548:
	mov rcx, rax
	mov rax, qword [rbp - 888]
	mov r15, rax
	mov rax, qword [rbp - 3328]
	mov r12, rax
	mov r13, rcx
	b6549:
	cmp r12, r15
	jl b6550
	b6551:
	mov rax, r13
	jmp b6552
	b6550:
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
	b6552:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6536:
	mov rcx, rax
	mov rax, qword [rbp - 3312]
	mov qword [rbp - 496], rax
	mov rax, qword [rbp - 16]
	mov qword [rbp - 1440], rax
	mov rax, rcx
	mov qword [rbp - 136], rax
	b6553:
	mov rax, qword [rbp - 1440]
	mov rcx, qword [rbp - 496]
	cmp rax, rcx
	jl b6554
	b6555:
	mov rax, qword [rbp - 136]
	jmp b6556
	b6554:
	mov rax, qword [rbp - 496]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1440]
	mov r14, rax
	mov rax, qword [rbp - 136]
	mov rbx, rax
	b6557:
	cmp r14, r15
	jl b6558
	b6559:
	mov rax, rbx
	jmp b6560
	b6558:
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
	b6560:
	mov qword [rbp - 552], rax
	mov rax, qword [rbp - 1440]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 136]
	mov r14, rax
	mov rax, qword [rbp - 496]
	mov r15, rax
	b6561:
	cmp r14, r12
	jl b6562
	b6563:
	mov rax, r15
	jmp b6564
	b6562:
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
	b6564:
	mov qword [rbp - 1024], rax
	mov rax, qword [rbp - 136]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 496]
	mov rbx, rax
	mov rax, qword [rbp - 1440]
	mov r13, rax
	b6565:
	cmp rbx, r14
	jl b6566
	b6567:
	mov rax, r13
	jmp b6568
	b6566:
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
	b6568:
	mov rcx, rax
	mov rax, qword [rbp - 552]
	mov r14, rax
	mov rax, qword [rbp - 1024]
	mov r15, rax
	mov rbx, rcx
	b6569:
	cmp r15, r14
	jl b6570
	b6571:
	mov rax, rbx
	jmp b6572
	b6570:
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
	b6572:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6556:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6492:
	mov qword [rbp - 736], rax
	mov rax, qword [rbp - 2120]
	sub rax, 1
	mov qword [rbp - 2376], rax
	mov rax, qword [rbp - 2672]
	mov qword [rbp - 1688], rax
	mov rax, qword [rbp - 1264]
	mov qword [rbp - 2520], rax
	b6573:
	mov rax, qword [rbp - 1688]
	mov rcx, qword [rbp - 2376]
	cmp rax, rcx
	jl b6574
	b6575:
	mov rax, qword [rbp - 2520]
	jmp b6576
	b6574:
	mov rax, qword [rbp - 2376]
	sub rax, 1
	mov qword [rbp - 3176], rax
	mov rax, qword [rbp - 1688]
	mov qword [rbp - 3304], rax
	mov rax, qword [rbp - 2520]
	mov qword [rbp - 3000], rax
	b6577:
	mov rcx, qword [rbp - 3304]
	mov rax, qword [rbp - 3176]
	cmp rcx, rax
	jl b6578
	b6579:
	mov rax, qword [rbp - 3000]
	jmp b6580
	b6578:
	mov rax, qword [rbp - 3176]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3304]
	mov r15, rax
	mov rax, qword [rbp - 3000]
	mov r12, rax
	b6581:
	cmp r15, r14
	jl b6582
	b6583:
	mov rax, r12
	jmp b6584
	b6582:
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
	b6584:
	mov qword [rbp - 1768], rax
	mov rax, qword [rbp - 3304]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 3000]
	mov r12, rax
	mov rax, qword [rbp - 3176]
	mov r13, rax
	b6585:
	cmp r12, r14
	jl b6586
	b6587:
	mov rax, r13
	jmp b6588
	b6586:
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
	b6588:
	mov qword [rbp - 2904], rax
	mov rax, qword [rbp - 3000]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3176]
	mov r15, rax
	mov rax, qword [rbp - 3304]
	mov r12, rax
	b6589:
	cmp r15, rbx
	jl b6590
	b6591:
	mov rax, r12
	jmp b6592
	b6590:
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
	b6592:
	mov rcx, rax
	mov rax, qword [rbp - 1768]
	mov r15, rax
	mov rax, qword [rbp - 2904]
	mov r14, rax
	mov rbx, rcx
	b6593:
	cmp r14, r15
	jl b6594
	b6595:
	mov rax, rbx
	jmp b6596
	b6594:
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
	b6596:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6580:
	mov qword [rbp - 600], rax
	mov rax, qword [rbp - 1688]
	sub rax, 1
	mov qword [rbp - 1072], rax
	mov rax, qword [rbp - 2520]
	mov qword [rbp - 1912], rax
	mov rax, qword [rbp - 2376]
	mov qword [rbp - 1784], rax
	b6597:
	mov rcx, qword [rbp - 1912]
	mov rax, qword [rbp - 1072]
	cmp rcx, rax
	jl b6598
	b6599:
	mov rax, qword [rbp - 1784]
	jmp b6600
	b6598:
	mov rax, qword [rbp - 1072]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1912]
	mov rbx, rax
	mov rax, qword [rbp - 1784]
	mov r14, rax
	b6601:
	cmp rbx, r15
	jl b6602
	b6603:
	mov rax, r14
	jmp b6604
	b6602:
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
	b6604:
	mov qword [rbp - 2056], rax
	mov rax, qword [rbp - 1912]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1784]
	mov r15, rax
	mov rax, qword [rbp - 1072]
	mov rbx, rax
	b6605:
	cmp r15, r14
	jl b6606
	b6607:
	mov rax, rbx
	jmp b6608
	b6606:
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
	b6608:
	mov qword [rbp - 744], rax
	mov rax, qword [rbp - 1784]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1072]
	mov r14, rax
	mov rax, qword [rbp - 1912]
	mov r13, rax
	b6609:
	cmp r14, r15
	jl b6610
	b6611:
	mov rax, r13
	jmp b6612
	b6610:
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
	b6612:
	mov rcx, rax
	mov rax, qword [rbp - 2056]
	mov rbx, rax
	mov rax, qword [rbp - 744]
	mov r14, rax
	mov r15, rcx
	b6613:
	cmp r14, rbx
	jl b6614
	b6615:
	mov rax, r15
	jmp b6616
	b6614:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6616:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6600:
	mov qword [rbp - 1680], rax
	mov rax, qword [rbp - 2520]
	sub rax, 1
	mov qword [rbp - 560], rax
	mov rax, qword [rbp - 2376]
	mov qword [rbp - 2200], rax
	mov rax, qword [rbp - 1688]
	mov qword [rbp - 592], rax
	b6617:
	mov rax, qword [rbp - 2200]
	mov rcx, qword [rbp - 560]
	cmp rax, rcx
	jl b6618
	b6619:
	mov rax, qword [rbp - 592]
	jmp b6620
	b6618:
	mov rax, qword [rbp - 560]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2200]
	mov r15, rax
	mov rax, qword [rbp - 592]
	mov r12, rax
	b6621:
	cmp r15, r14
	jl b6622
	b6623:
	mov rax, r12
	jmp b6624
	b6622:
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
	b6624:
	mov qword [rbp - 3032], rax
	mov rax, qword [rbp - 2200]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 592]
	mov r12, rax
	mov rax, qword [rbp - 560]
	mov r13, rax
	b6625:
	cmp r12, r15
	jl b6626
	b6627:
	mov rax, r13
	jmp b6628
	b6626:
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
	b6628:
	mov qword [rbp - 1896], rax
	mov rax, qword [rbp - 592]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 560]
	mov r15, rax
	mov rax, qword [rbp - 2200]
	mov rbx, rax
	b6629:
	cmp r15, r13
	jl b6630
	b6631:
	mov rax, rbx
	jmp b6632
	b6630:
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
	b6632:
	mov rcx, qword [rbp - 3032]
	mov rbx, rcx
	mov rcx, qword [rbp - 1896]
	mov r15, rcx
	mov r13, rax
	b6633:
	cmp r15, rbx
	jl b6634
	b6635:
	mov rax, r13
	jmp b6636
	b6634:
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
	b6636:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6620:
	mov rcx, rax
	mov rax, qword [rbp - 600]
	mov qword [rbp - 424], rax
	mov rax, qword [rbp - 1680]
	mov qword [rbp - 2384], rax
	mov rax, rcx
	mov qword [rbp - 2960], rax
	b6637:
	mov rax, qword [rbp - 2384]
	mov rcx, qword [rbp - 424]
	cmp rax, rcx
	jl b6638
	b6639:
	mov rax, qword [rbp - 2960]
	jmp b6640
	b6638:
	mov rax, qword [rbp - 424]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2384]
	mov r12, rax
	mov rax, qword [rbp - 2960]
	mov r13, rax
	b6641:
	cmp r12, r15
	jl b6642
	b6643:
	mov rax, r13
	jmp b6644
	b6642:
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
	b6644:
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 2384]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 2960]
	mov rbx, rax
	mov rax, qword [rbp - 424]
	mov r12, rax
	b6645:
	cmp rbx, r14
	jl b6646
	b6647:
	mov rax, r12
	jmp b6648
	b6646:
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
	b6648:
	mov qword [rbp - 848], rax
	mov rax, qword [rbp - 2960]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 424]
	mov r12, rax
	mov rax, qword [rbp - 2384]
	mov r15, rax
	b6649:
	cmp r12, r14
	jl b6650
	b6651:
	mov rax, r15
	jmp b6652
	b6650:
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
	b6652:
	mov rcx, rax
	mov rax, qword [rbp - 104]
	mov r15, rax
	mov rax, qword [rbp - 848]
	mov r12, rax
	mov r14, rcx
	b6653:
	cmp r12, r15
	jl b6654
	b6655:
	mov rax, r14
	jmp b6656
	b6654:
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
	b6656:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6640:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6576:
	mov qword [rbp - 2760], rax
	mov rax, qword [rbp - 2672]
	sub rax, 1
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 1264]
	mov qword [rbp - 624], rax
	mov rax, qword [rbp - 2120]
	mov qword [rbp - 440], rax
	b6657:
	mov rax, qword [rbp - 624]
	mov rcx, qword [rbp - 568]
	cmp rax, rcx
	jl b6658
	b6659:
	mov rax, qword [rbp - 440]
	jmp b6660
	b6658:
	mov rax, qword [rbp - 568]
	sub rax, 1
	mov qword [rbp - 1960], rax
	mov rax, qword [rbp - 624]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 440]
	mov qword [rbp - 1128], rax
	b6661:
	mov rcx, qword [rbp - 112]
	mov rax, qword [rbp - 1960]
	cmp rcx, rax
	jl b6662
	b6663:
	mov rax, qword [rbp - 1128]
	jmp b6664
	b6662:
	mov rax, qword [rbp - 1960]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov r12, rax
	mov rax, qword [rbp - 1128]
	mov r13, rax
	b6665:
	cmp r12, r14
	jl b6666
	b6667:
	mov rax, r13
	jmp b6668
	b6666:
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
	b6668:
	mov qword [rbp - 2400], rax
	mov rax, qword [rbp - 112]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1128]
	mov r15, rax
	mov rax, qword [rbp - 1960]
	mov r13, rax
	b6669:
	cmp r15, r14
	jl b6670
	b6671:
	mov rax, r13
	jmp b6672
	b6670:
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
	b6672:
	mov qword [rbp - 1008], rax
	mov rax, qword [rbp - 1128]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1960]
	mov r14, rax
	mov rax, qword [rbp - 112]
	mov r12, rax
	b6673:
	cmp r14, rbx
	jl b6674
	b6675:
	mov rax, r12
	jmp b6676
	b6674:
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
	b6676:
	mov rcx, rax
	mov rax, qword [rbp - 2400]
	mov r15, rax
	mov rax, qword [rbp - 1008]
	mov r13, rax
	mov r14, rcx
	b6677:
	cmp r13, r15
	jl b6678
	b6679:
	mov rax, r14
	jmp b6680
	b6678:
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
	b6680:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6664:
	mov qword [rbp - 1424], rax
	mov rax, qword [rbp - 624]
	sub rax, 1
	mov qword [rbp - 984], rax
	mov rax, qword [rbp - 440]
	mov qword [rbp - 2048], rax
	mov rax, qword [rbp - 568]
	mov qword [rbp - 320], rax
	b6681:
	mov rcx, qword [rbp - 2048]
	mov rax, qword [rbp - 984]
	cmp rcx, rax
	jl b6682
	b6683:
	mov rax, qword [rbp - 320]
	jmp b6684
	b6682:
	mov rax, qword [rbp - 984]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 2048]
	mov r13, rax
	mov rax, qword [rbp - 320]
	mov r14, rax
	b6685:
	cmp r13, r15
	jl b6686
	b6687:
	mov rax, r14
	jmp b6688
	b6686:
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
	b6688:
	mov qword [rbp - 696], rax
	mov rax, qword [rbp - 2048]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 320]
	mov r15, rax
	mov rax, qword [rbp - 984]
	mov r12, rax
	b6689:
	cmp r15, r14
	jl b6690
	b6691:
	mov rax, r12
	jmp b6692
	b6690:
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
	b6692:
	mov qword [rbp - 2544], rax
	mov rax, qword [rbp - 320]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 984]
	mov r15, rax
	mov rax, qword [rbp - 2048]
	mov r13, rax
	b6693:
	cmp r15, rbx
	jl b6694
	b6695:
	mov rax, r13
	jmp b6696
	b6694:
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
	b6696:
	mov rcx, rax
	mov rax, qword [rbp - 696]
	mov r14, rax
	mov rax, qword [rbp - 2544]
	mov rbx, rax
	mov r13, rcx
	b6697:
	cmp rbx, r14
	jl b6698
	b6699:
	mov rax, r13
	jmp b6700
	b6698:
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
	b6700:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6684:
	mov qword [rbp - 872], rax
	mov rax, qword [rbp - 440]
	sub rax, 1
	mov qword [rbp - 1608], rax
	mov rax, qword [rbp - 568]
	mov qword [rbp - 2696], rax
	mov rax, qword [rbp - 624]
	mov qword [rbp - 1808], rax
	b6701:
	mov rcx, qword [rbp - 2696]
	mov rax, qword [rbp - 1608]
	cmp rcx, rax
	jl b6702
	b6703:
	mov rax, qword [rbp - 1808]
	jmp b6704
	b6702:
	mov rax, qword [rbp - 1608]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2696]
	mov r14, rax
	mov rax, qword [rbp - 1808]
	mov r15, rax
	b6705:
	cmp r14, rbx
	jl b6706
	b6707:
	mov rax, r15
	jmp b6708
	b6706:
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
	b6708:
	mov qword [rbp - 1616], rax
	mov rax, qword [rbp - 2696]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1808]
	mov r14, rax
	mov rax, qword [rbp - 1608]
	mov r15, rax
	b6709:
	cmp r14, r13
	jl b6710
	b6711:
	mov rax, r15
	jmp b6712
	b6710:
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
	mov r12, rax
	mov rax, r15
	sub rax, 1
	mov rdx, r14
	mov rsi, r13
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r12
	mov rdi, rbx
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6712:
	mov qword [rbp - 1352], rax
	mov rax, qword [rbp - 1808]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 1608]
	mov r12, rax
	mov rax, qword [rbp - 2696]
	mov rbx, rax
	b6713:
	cmp r12, r13
	jl b6714
	b6715:
	mov rax, rbx
	jmp b6716
	b6714:
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
	b6716:
	mov rcx, rax
	mov rax, qword [rbp - 1616]
	mov r15, rax
	mov rax, qword [rbp - 1352]
	mov r13, rax
	mov r12, rcx
	b6717:
	cmp r13, r15
	jl b6718
	b6719:
	mov rax, r12
	jmp b6720
	b6718:
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
	b6720:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6704:
	mov rcx, rax
	mov rax, qword [rbp - 1424]
	mov qword [rbp - 1344], rax
	mov rax, qword [rbp - 872]
	mov qword [rbp - 3152], rax
	mov rax, rcx
	mov qword [rbp - 776], rax
	b6721:
	mov rcx, qword [rbp - 3152]
	mov rax, qword [rbp - 1344]
	cmp rcx, rax
	jl b6722
	b6723:
	mov rax, qword [rbp - 776]
	jmp b6724
	b6722:
	mov rax, qword [rbp - 1344]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 3152]
	mov r15, rax
	mov rax, qword [rbp - 776]
	mov r13, rax
	b6725:
	cmp r15, rbx
	jl b6726
	b6727:
	mov rax, r13
	jmp b6728
	b6726:
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
	b6728:
	mov qword [rbp - 1248], rax
	mov rax, qword [rbp - 3152]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 776]
	mov r15, rax
	mov rax, qword [rbp - 1344]
	mov rbx, rax
	b6729:
	cmp r15, r14
	jl b6730
	b6731:
	mov rax, rbx
	jmp b6732
	b6730:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6732:
	mov qword [rbp - 3072], rax
	mov rax, qword [rbp - 776]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 1344]
	mov r14, rax
	mov rax, qword [rbp - 3152]
	mov r13, rax
	b6733:
	cmp r14, r12
	jl b6734
	b6735:
	mov rax, r13
	jmp b6736
	b6734:
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
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6736:
	mov rcx, rax
	mov rax, qword [rbp - 1248]
	mov r14, rax
	mov rax, qword [rbp - 3072]
	mov rbx, rax
	mov r12, rcx
	b6737:
	cmp rbx, r14
	jl b6738
	b6739:
	mov rax, r12
	jmp b6740
	b6738:
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
	b6740:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6724:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6660:
	mov rcx, rax
	mov rax, qword [rbp - 736]
	mov qword [rbp - 2448], rax
	mov rax, qword [rbp - 2760]
	mov qword [rbp - 2016], rax
	mov rax, rcx
	mov qword [rbp - 1984], rax
	b6741:
	mov rax, qword [rbp - 2016]
	mov rcx, qword [rbp - 2448]
	cmp rax, rcx
	jl b6742
	b6743:
	mov rax, qword [rbp - 1984]
	jmp b6744
	b6742:
	mov rax, qword [rbp - 2448]
	sub rax, 1
	mov qword [rbp - 1408], rax
	mov rax, qword [rbp - 2016]
	mov qword [rbp - 3016], rax
	mov rax, qword [rbp - 1984]
	mov qword [rbp - 1936], rax
	b6745:
	mov rax, qword [rbp - 3016]
	mov rcx, qword [rbp - 1408]
	cmp rax, rcx
	jl b6746
	b6747:
	mov rax, qword [rbp - 1936]
	jmp b6748
	b6746:
	mov rax, qword [rbp - 1408]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 3016]
	mov r14, rax
	mov rax, qword [rbp - 1936]
	mov r15, rax
	b6749:
	cmp r14, r12
	jl b6750
	b6751:
	mov rax, r15
	jmp b6752
	b6750:
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
	b6752:
	mov qword [rbp - 2968], rax
	mov rax, qword [rbp - 3016]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1936]
	mov r15, rax
	mov rax, qword [rbp - 1408]
	mov r14, rax
	b6753:
	cmp r15, rbx
	jl b6754
	b6755:
	mov rax, r14
	jmp b6756
	b6754:
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
	b6756:
	mov qword [rbp - 520], rax
	mov rax, qword [rbp - 1936]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 1408]
	mov r13, rax
	mov rax, qword [rbp - 3016]
	mov rbx, rax
	b6757:
	cmp r13, r15
	jl b6758
	b6759:
	mov rax, rbx
	jmp b6760
	b6758:
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
	b6760:
	mov rcx, rax
	mov rax, qword [rbp - 2968]
	mov r12, rax
	mov rax, qword [rbp - 520]
	mov r14, rax
	mov rbx, rcx
	b6761:
	cmp r14, r12
	jl b6762
	b6763:
	mov rax, rbx
	jmp b6764
	b6762:
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
	b6764:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6748:
	mov qword [rbp - 1104], rax
	mov rax, qword [rbp - 2016]
	sub rax, 1
	mov qword [rbp - 2592], rax
	mov rax, qword [rbp - 1984]
	mov qword [rbp - 680], rax
	mov rax, qword [rbp - 2448]
	mov qword [rbp - 488], rax
	b6765:
	mov rax, qword [rbp - 680]
	mov rcx, qword [rbp - 2592]
	cmp rax, rcx
	jl b6766
	b6767:
	mov rax, qword [rbp - 488]
	jmp b6768
	b6766:
	mov rax, qword [rbp - 2592]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 680]
	mov r14, rax
	mov rax, qword [rbp - 488]
	mov r12, rax
	b6769:
	cmp r14, rbx
	jl b6770
	b6771:
	mov rax, r12
	jmp b6772
	b6770:
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
	b6772:
	mov qword [rbp - 1096], rax
	mov rax, qword [rbp - 680]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 488]
	mov r14, rax
	mov rax, qword [rbp - 2592]
	mov r15, rax
	b6773:
	cmp r14, rbx
	jl b6774
	b6775:
	mov rax, r15
	jmp b6776
	b6774:
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
	b6776:
	mov qword [rbp - 3216], rax
	mov rax, qword [rbp - 488]
	sub rax, 1
	mov r12, rax
	mov rax, qword [rbp - 2592]
	mov r15, rax
	mov rax, qword [rbp - 680]
	mov r14, rax
	b6777:
	cmp r15, r12
	jl b6778
	b6779:
	mov rax, r14
	jmp b6780
	b6778:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6780:
	mov rcx, rax
	mov rax, qword [rbp - 1096]
	mov r14, rax
	mov rax, qword [rbp - 3216]
	mov r12, rax
	mov rbx, rcx
	b6781:
	cmp r12, r14
	jl b6782
	b6783:
	mov rax, rbx
	jmp b6784
	b6782:
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
	b6784:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6768:
	mov qword [rbp - 3272], rax
	mov rax, qword [rbp - 1984]
	sub rax, 1
	mov qword [rbp - 2504], rax
	mov rax, qword [rbp - 2448]
	mov qword [rbp - 720], rax
	mov rax, qword [rbp - 2016]
	mov qword [rbp - 1880], rax
	b6785:
	mov rax, qword [rbp - 720]
	mov rcx, qword [rbp - 2504]
	cmp rax, rcx
	jl b6786
	b6787:
	mov rax, qword [rbp - 1880]
	jmp b6788
	b6786:
	mov rax, qword [rbp - 2504]
	sub rax, 1
	mov r15, rax
	mov rax, qword [rbp - 720]
	mov r14, rax
	mov rax, qword [rbp - 1880]
	mov r13, rax
	b6789:
	cmp r14, r15
	jl b6790
	b6791:
	mov rax, r13
	jmp b6792
	b6790:
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
	b6792:
	mov qword [rbp - 536], rax
	mov rax, qword [rbp - 720]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 1880]
	mov r14, rax
	mov rax, qword [rbp - 2504]
	mov r13, rax
	b6793:
	cmp r14, rbx
	jl b6794
	b6795:
	mov rax, r13
	jmp b6796
	b6794:
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
	b6796:
	mov qword [rbp - 1560], rax
	mov rax, qword [rbp - 1880]
	sub rax, 1
	mov rbx, rax
	mov rax, qword [rbp - 2504]
	mov r14, rax
	mov rax, qword [rbp - 720]
	mov r13, rax
	b6797:
	cmp r14, rbx
	jl b6798
	b6799:
	mov rax, r13
	jmp b6800
	b6798:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6800:
	mov rcx, rax
	mov rax, qword [rbp - 536]
	mov r12, rax
	mov rax, qword [rbp - 1560]
	mov rbx, rax
	mov r15, rcx
	b6801:
	cmp rbx, r12
	jl b6802
	b6803:
	mov rax, r15
	jmp b6804
	b6802:
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
	mov r13, rax
	mov rax, r15
	sub rax, 1
	mov rdx, rbx
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6804:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6788:
	mov rcx, qword [rbp - 1104]
	mov qword [rbp - 504], rcx
	mov rcx, qword [rbp - 3272]
	mov qword [rbp - 528], rcx
	mov qword [rbp - 1632], rax
	b6805:
	mov rcx, qword [rbp - 528]
	mov rax, qword [rbp - 504]
	cmp rcx, rax
	jl b6806
	b6807:
	mov rax, qword [rbp - 1632]
	jmp b6808
	b6806:
	mov rax, qword [rbp - 504]
	sub rax, 1
	mov r13, rax
	mov rax, qword [rbp - 528]
	mov r14, rax
	mov rax, qword [rbp - 1632]
	mov rbx, rax
	b6809:
	cmp r14, r13
	jl b6810
	b6811:
	mov rax, rbx
	jmp b6812
	b6810:
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
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b6812:
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 528]
	sub rax, 1
	mov r14, rax
	mov rax, qword [rbp - 1632]
	mov r12, rax
	mov rax, qword [rbp - 504]
	mov r13, rax
	b6813:
	cmp r12, r14
	jl b6814
	b6815:
	mov rax, r13
	jmp b6816
	b6814:
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
	b6816:
	mov rbx, rax
	mov rax, qword [rbp - 1632]
	sub rax, 1
	mov qword [rbp - 2288], rax
	mov rax, qword [rbp - 504]
	mov r12, rax
	mov rax, qword [rbp - 528]
	mov r15, rax
	b6817:
	mov rax, qword [rbp - 2288]
	cmp r12, rax
	jl b6818
	b6819:
	mov rax, r15
	jmp b6820
	b6818:
	mov rax, qword [rbp - 2288]
	sub rax, 1
	mov rdx, r15
	mov rsi, r12
	mov rdi, rax
	call _tak
	mov r14, rax
	mov rcx, r12
	sub rcx, 1
	mov rax, qword [rbp - 2288]
	mov rdx, rax
	mov rsi, r15
	mov rdi, rcx
	call _tak
	mov r13, rax
	mov rcx, r15
	sub rcx, 1
	mov rdx, r12
	mov rax, qword [rbp - 2288]
	mov rsi, rax
	mov rdi, rcx
	call _tak
	mov rdx, rax
	mov rsi, r13
	mov rdi, r14
	call _tak
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6820:
	mov rcx, qword [rbp - 144]
	mov r15, rcx
	mov r14, rbx
	mov r12, rax
	b6821:
	cmp r14, r15
	jl b6822
	b6823:
	mov rax, r12
	jmp b6824
	b6822:
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
	b6824:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6808:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6744:
	mov rcx, rax
	mov rax, 1
	add rax, rcx
	b6488:
	mov rcx, 1
	add rcx, rax
	mov rax, rcx
	b5464:
	b6825:
	pop rbx
	pop r15
	pop r14
	pop r12
	pop r13
	leave
	ret 
__init:
	b6826:
	push rbp
	mov rbp, rsp
	call _main
	leave
	ret 
	section .data
