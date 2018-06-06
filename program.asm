





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
_check:
	b0:
	push rbp
	mov rbp, rsp
	mov rcx, rdi
	mov rax, rsi
	cmp rcx, rax
	jge b1
	b2:
	cmp rcx, 0
	jl b1
	jmp b3
	b1:
	mov rax, 0
	jmp b4
	b3:
	mov rax, 1
	b4:
	b5:
	leave
	ret 
_main:
	b6:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	push r12
	push r14
	push rbx
	push r13
	call __getInt
	mov qword [rbp - 8], rax
	mov rax, 0
	mov qword [rbp - 24], rax
	mov rax, 0
	mov qword [rbp - 80], rax
	mov rax, 0
	mov qword [rbp - 56], rax
	mov rax, 0
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 8]
	mov rcx, rax
	sub rcx, 1
	mov rax, rcx
	mov qword [rbp - 40], rax
	mov rax, rcx
	mov qword [rbp - 72], rax
	mov rax, 0
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 8]
	imul rcx
	mov r12, rax
	lea rbx, [r12 * 8 + 8]
	mov rdi, rbx
	call malloc
	mov qword [rax], r12
	b7:
	cmp r12, 0
	jg b8
	b9:
	mov qword [rbp - 32], rax
	mov r12, 0
	b10:
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 8]
	imul rcx
	cmp r12, rax
	jl b11
	b12:
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 8]
	imul rcx
	mov rbx, rax
	lea r13, [rbx * 8 + 8]
	mov rdi, r13
	call malloc
	mov qword [rax], rbx
	b13:
	cmp rbx, 0
	jg b14
	b15:
	mov rbx, rax
	mov r12, 0
	b16:
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 8]
	imul rcx
	cmp r12, rax
	jl b17
	b18:
	mov rax, qword [rbp - 8]
	mov r13, rax
	lea r14, [r13 * 8 + 8]
	mov rdi, r14
	call malloc
	mov qword [rax], r13
	b19:
	cmp r13, 0
	jg b20
	b21:
	mov r13, rax
	mov r12, 0
	b22:
	mov rax, qword [rbp - 8]
	cmp r12, rax
	jl b23
	b24:
	mov rax, qword [rbp - 32]
	mov rcx, qword [rbp - 56]
	mov qword [rax + 8], rcx
	mov rax, qword [rbp - 64]
	mov qword [rbx + 8], rax
	mov rax, qword [rbp - 56]
	mov rax, qword [r13 + rax * 8 + 8]
	mov rcx, qword [rbp - 64]
	mov qword [rax + rcx * 8 + 8], 0
	b25:
	mov rcx, qword [rbp - 24]
	mov rax, qword [rbp - 80]
	cmp rcx, rax
	jg b26
	b27:
	mov rax, qword [rbp - 32]
	mov rcx, qword [rbp - 24]
	mov rax, qword [rax + rcx * 8 + 8]
	mov rax, qword [r13 + rax * 8 + 8]
	mov rcx, qword [rbp - 24]
	mov rcx, qword [rbx + rcx * 8 + 8]
	mov rcx, qword [rax + rcx * 8 + 8]
	mov rax, qword [rbp - 32]
	mov rdx, qword [rbp - 24]
	mov rax, qword [rax + rdx * 8 + 8]
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	sub rax, 2
	mov rsi, rax
	mov rdi, rdx
	mov rax, qword [rbp - 8]
	b28:
	cmp rdi, rax
	jge b29
	b30:
	cmp rdi, 0
	jl b29
	jmp b31
	b29:
	mov rax, 0
	jmp b32
	b31:
	mov rax, 1
	b32:
	b33:
	cmp rax, 0
	je b34
	b35:
	mov rdi, rsi
	mov rax, qword [rbp - 8]
	b36:
	cmp rdi, rax
	jge b37
	b38:
	cmp rdi, 0
	jl b37
	jmp b39
	b37:
	mov rax, 0
	jmp b40
	b39:
	mov rax, 1
	b40:
	b41:
	cmp rax, 0
	je b34
	b42:
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, -1
	cmp qword [rdi + rsi * 8 + 8], rax
	jne b34
	b43:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 32]
	mov rdi, qword [rbp - 80]
	mov qword [rax + rdi * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, rcx
	add rax, 1
	mov qword [rdi + rsi * 8 + 8], rax
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b44
	b45:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b44
	b46:
	mov rax, 1
	mov qword [rbp - 48], rax
	b44:
	b34:
	mov rax, qword [rbp - 32]
	mov rdx, qword [rbp - 24]
	mov rax, qword [rax + rdx * 8 + 8]
	sub rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	add rax, 2
	mov rsi, rax
	mov rdi, rdx
	mov rax, qword [rbp - 8]
	b47:
	cmp rdi, rax
	jge b48
	b49:
	cmp rdi, 0
	jl b48
	jmp b50
	b48:
	mov rax, 0
	jmp b51
	b50:
	mov rax, 1
	b51:
	b52:
	cmp rax, 0
	je b53
	b54:
	mov rax, rsi
	mov rdi, qword [rbp - 8]
	b55:
	cmp rax, rdi
	jge b56
	b57:
	cmp rax, 0
	jl b56
	jmp b58
	b56:
	mov rax, 0
	jmp b59
	b58:
	mov rax, 1
	b59:
	b60:
	cmp rax, 0
	je b53
	b61:
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, -1
	cmp qword [rax + rsi * 8 + 8], rdi
	jne b53
	b62:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 32]
	mov rdi, qword [rbp - 80]
	mov qword [rax + rdi * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, rcx
	add rax, 1
	mov qword [rdi + rsi * 8 + 8], rax
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b63
	b64:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b63
	b65:
	mov rax, 1
	mov qword [rbp - 48], rax
	b63:
	b53:
	mov rax, qword [rbp - 32]
	mov rdx, qword [rbp - 24]
	mov rax, qword [rax + rdx * 8 + 8]
	add rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	sub rax, 2
	mov rsi, rax
	mov rdi, rdx
	mov rax, qword [rbp - 8]
	b66:
	cmp rdi, rax
	jge b67
	b68:
	cmp rdi, 0
	jl b67
	jmp b69
	b67:
	mov rax, 0
	jmp b70
	b69:
	mov rax, 1
	b70:
	b71:
	cmp rax, 0
	je b72
	b73:
	mov rdi, rsi
	mov rax, qword [rbp - 8]
	b74:
	cmp rdi, rax
	jge b75
	b76:
	cmp rdi, 0
	jl b75
	jmp b77
	b75:
	mov rax, 0
	jmp b78
	b77:
	mov rax, 1
	b78:
	b79:
	cmp rax, 0
	je b72
	b80:
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, -1
	cmp qword [rdi + rsi * 8 + 8], rax
	jne b72
	b81:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 32]
	mov rax, qword [rbp - 80]
	mov qword [rdi + rax * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, rcx
	add rdi, 1
	mov qword [rax + rsi * 8 + 8], rdi
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b82
	b83:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b82
	b84:
	mov rax, 1
	mov qword [rbp - 48], rax
	b82:
	b72:
	mov rdx, qword [rbp - 32]
	mov rax, qword [rbp - 24]
	mov rax, qword [rdx + rax * 8 + 8]
	add rax, 1
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	add rax, 2
	mov rsi, rax
	mov rax, rdx
	mov rdi, qword [rbp - 8]
	b85:
	cmp rax, rdi
	jge b86
	b87:
	cmp rax, 0
	jl b86
	jmp b88
	b86:
	mov rax, 0
	jmp b89
	b88:
	mov rax, 1
	b89:
	b90:
	cmp rax, 0
	je b91
	b92:
	mov rdi, rsi
	mov rax, qword [rbp - 8]
	b93:
	cmp rdi, rax
	jge b94
	b95:
	cmp rdi, 0
	jl b94
	jmp b96
	b94:
	mov rax, 0
	jmp b97
	b96:
	mov rax, 1
	b97:
	b98:
	cmp rax, 0
	je b91
	b99:
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, -1
	cmp qword [rdi + rsi * 8 + 8], rax
	jne b91
	b100:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 32]
	mov rax, qword [rbp - 80]
	mov qword [rdi + rax * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, rcx
	add rax, 1
	mov qword [rdi + rsi * 8 + 8], rax
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b101
	b102:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b101
	b103:
	mov rax, 1
	mov qword [rbp - 48], rax
	b101:
	b91:
	mov rax, qword [rbp - 32]
	mov rdx, qword [rbp - 24]
	mov rax, qword [rax + rdx * 8 + 8]
	sub rax, 2
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	sub rax, 1
	mov rsi, rax
	mov rdi, rdx
	mov rax, qword [rbp - 8]
	b104:
	cmp rdi, rax
	jge b105
	b106:
	cmp rdi, 0
	jl b105
	jmp b107
	b105:
	mov rax, 0
	jmp b108
	b107:
	mov rax, 1
	b108:
	b109:
	cmp rax, 0
	je b110
	b111:
	mov rdi, rsi
	mov rax, qword [rbp - 8]
	b112:
	cmp rdi, rax
	jge b113
	b114:
	cmp rdi, 0
	jl b113
	jmp b115
	b113:
	mov rax, 0
	jmp b116
	b115:
	mov rax, 1
	b116:
	b117:
	cmp rax, 0
	je b110
	b118:
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, -1
	cmp qword [rax + rsi * 8 + 8], rdi
	jne b110
	b119:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 32]
	mov rax, qword [rbp - 80]
	mov qword [rdi + rax * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, rcx
	add rdi, 1
	mov qword [rax + rsi * 8 + 8], rdi
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b120
	b121:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b120
	b122:
	mov rax, 1
	mov qword [rbp - 48], rax
	b120:
	b110:
	mov rdx, qword [rbp - 32]
	mov rax, qword [rbp - 24]
	mov rax, qword [rdx + rax * 8 + 8]
	sub rax, 2
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	add rax, 1
	mov rsi, rax
	mov rdi, rdx
	mov rax, qword [rbp - 8]
	b123:
	cmp rdi, rax
	jge b124
	b125:
	cmp rdi, 0
	jl b124
	jmp b126
	b124:
	mov rax, 0
	jmp b127
	b126:
	mov rax, 1
	b127:
	b128:
	cmp rax, 0
	je b129
	b130:
	mov rax, rsi
	mov rdi, qword [rbp - 8]
	b131:
	cmp rax, rdi
	jge b132
	b133:
	cmp rax, 0
	jl b132
	jmp b134
	b132:
	mov rax, 0
	jmp b135
	b134:
	mov rax, 1
	b135:
	b136:
	cmp rax, 0
	je b129
	b137:
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, -1
	cmp qword [rdi + rsi * 8 + 8], rax
	jne b129
	b138:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 32]
	mov rdi, qword [rbp - 80]
	mov qword [rax + rdi * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, rcx
	add rax, 1
	mov qword [rdi + rsi * 8 + 8], rax
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b139
	b140:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b139
	b141:
	mov rax, 1
	mov qword [rbp - 48], rax
	b139:
	b129:
	mov rdx, qword [rbp - 32]
	mov rax, qword [rbp - 24]
	mov rax, qword [rdx + rax * 8 + 8]
	add rax, 2
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	sub rax, 1
	mov rsi, rax
	mov rax, rdx
	mov rdi, qword [rbp - 8]
	b142:
	cmp rax, rdi
	jge b143
	b144:
	cmp rax, 0
	jl b143
	jmp b145
	b143:
	mov rax, 0
	jmp b146
	b145:
	mov rax, 1
	b146:
	b147:
	cmp rax, 0
	je b148
	b149:
	mov rdi, rsi
	mov rax, qword [rbp - 8]
	b150:
	cmp rdi, rax
	jge b151
	b152:
	cmp rdi, 0
	jl b151
	jmp b153
	b151:
	mov rax, 0
	jmp b154
	b153:
	mov rax, 1
	b154:
	b155:
	cmp rax, 0
	je b148
	b156:
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, -1
	cmp qword [rax + rsi * 8 + 8], rdi
	jne b148
	b157:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 32]
	mov rax, qword [rbp - 80]
	mov qword [rdi + rax * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, rcx
	add rdi, 1
	mov qword [rax + rsi * 8 + 8], rdi
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b158
	b159:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b158
	b160:
	mov rax, 1
	mov qword [rbp - 48], rax
	b158:
	b148:
	mov rdx, qword [rbp - 32]
	mov rax, qword [rbp - 24]
	mov rax, qword [rdx + rax * 8 + 8]
	add rax, 2
	mov rdx, rax
	mov rax, qword [rbp - 24]
	mov rax, qword [rbx + rax * 8 + 8]
	add rax, 1
	mov rsi, rax
	mov rax, rdx
	mov rdi, qword [rbp - 8]
	b161:
	cmp rax, rdi
	jge b162
	b163:
	cmp rax, 0
	jl b162
	jmp b164
	b162:
	mov rax, 0
	jmp b165
	b164:
	mov rax, 1
	b165:
	b166:
	cmp rax, 0
	je b167
	b168:
	mov rax, rsi
	mov rdi, qword [rbp - 8]
	b169:
	cmp rax, rdi
	jge b170
	b171:
	cmp rax, 0
	jl b170
	jmp b172
	b170:
	mov rax, 0
	jmp b173
	b172:
	mov rax, 1
	b173:
	b174:
	cmp rax, 0
	je b167
	b175:
	mov rax, qword [r13 + rdx * 8 + 8]
	mov rdi, -1
	cmp qword [rax + rsi * 8 + 8], rdi
	jne b167
	b176:
	mov rax, qword [rbp - 80]
	add rax, 1
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 32]
	mov rax, qword [rbp - 80]
	mov qword [rdi + rax * 8 + 8], rdx
	mov rax, qword [rbp - 80]
	mov qword [rbx + rax * 8 + 8], rsi
	mov rdi, qword [r13 + rdx * 8 + 8]
	mov rax, rcx
	add rax, 1
	mov qword [rdi + rsi * 8 + 8], rax
	mov rax, qword [rbp - 40]
	cmp rdx, rax
	jne b177
	b178:
	mov rax, qword [rbp - 72]
	cmp rsi, rax
	jne b177
	b179:
	mov rax, 1
	mov qword [rbp - 48], rax
	b177:
	b167:
	mov rax, qword [rbp - 48]
	cmp rax, 1
	je b180
	b181:
	mov rax, qword [rbp - 24]
	add rax, 1
	mov qword [rbp - 24], rax
	jmp b25
	b180:
	b26:
	mov rax, qword [rbp - 48]
	cmp rax, 1
	je b182
	b183:
	mov rdi, g_0
	call __print
	jmp b184
	b182:
	mov rax, qword [rbp - 40]
	mov rcx, qword [r13 + rax * 8 + 8]
	mov rax, qword [rbp - 72]
	mov rdi, qword [rcx + rax * 8 + 8]
	call __toString
	mov rdi, rax
	call __println
	b184:
	mov rax, 0
	b185:
	pop r13
	pop rbx
	pop r14
	pop r12
	leave
	ret 
	b23:
	mov rax, qword [rbp - 8]
	mov r14, rax
	mov rax, qword [rbp - 16]
	lea rax, [r14 * 8 + 8]
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 16]
	mov rdi, rax
	call malloc
	mov qword [rax], r14
	b186:
	cmp r14, 0
	jg b187
	b188:
	mov qword [r13 + r12 * 8 + 8], rax
	mov rcx, 0
	b189:
	mov rax, qword [rbp - 8]
	cmp rcx, rax
	jl b190
	b191:
	b192:
	inc r12
	jmp b22
	b190:
	mov rdx, qword [r13 + r12 * 8 + 8]
	mov rax, -1
	mov qword [rdx + rcx * 8 + 8], rax
	b193:
	inc rcx
	jmp b189
	b187:
	mov qword [rax + r14 * 8], 0
	dec r14
	jmp b186
	b20:
	mov qword [rax + r13 * 8], 0
	dec r13
	jmp b19
	b17:
	mov qword [rbx + r12 * 8 + 8], 0
	b194:
	inc r12
	jmp b16
	b14:
	mov qword [rax + rbx * 8], 0
	dec rbx
	jmp b13
	b11:
	mov rax, qword [rbp - 32]
	mov qword [rax + r12 * 8 + 8], 0
	b195:
	inc r12
	jmp b10
	b8:
	mov qword [rax + r12 * 8], 0
	dec r12
	jmp b7
__init:
	b196:
	push rbp
	mov rbp, rsp
	call _main
	leave
	ret 
	section .data
g_0:
	dq 13
	db 6EH, 6FH, 20H, 73H, 6FH, 6CH, 75H, 74H, 69H, 6FH, 6EH, 21H, 0AH, 00H
