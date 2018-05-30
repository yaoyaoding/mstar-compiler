





default rel

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
global main

extern strcmp
extern __sprintf_chk
extern memcpy
extern malloc
extern __isoc99_scanf
extern puts
extern __printf_chk


SECTION .text   6

__print:
        lea     rdx, [rdi+8H]
        mov     esi, L_017
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
        mov     esi, __buffer.3420
        mov     edi, L_017
        xor     eax, eax
        push    rbx
        mov     ebx, __buffer.3420
        sub     rsp, 8
        call    __isoc99_scanf
L_001:  mov     edx, dword [rbx]
        add     rbx, 4
        lea     eax, [rdx-1010101H]
        not     edx
        and     eax, edx
        and     eax, 80808080H
        jz      L_001
        mov     edx, eax
        shr     edx, 16
        test    eax, 8080H
        cmove   eax, edx
        lea     rdx, [rbx+2H]
        cmove   rbx, rdx
        add     al, al
        sbb     rbx, 3
        sub     rbx, __buffer.3420
        lea     edi, [rbx+8H]
        movsxd  rdi, edi
        call    malloc
        mov     rbp, rax
        lea     rdx, [rbx+1H]
        movsxd  rax, ebx
        lea     rdi, [rbp+8H]
        mov     qword [rbp], rax
        mov     esi, __buffer.3420
        call    memcpy
        add     rsp, 8
        mov     rax, rbp
        pop     rbx
        pop     rbp
        ret







ALIGN   16

__getInt:
        sub     rsp, 24
        mov     edi, L_018
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
        mov     ecx, L_018
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
        jle     L_003
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
        je      L_004
        cmp     ebx, 15
        jbe     L_004
        mov     esi, ebx
        xor     edx, edx
        xor     r8d, r8d
        shr     esi, 4
        mov     ecx, esi
        shl     ecx, 4
L_002:  movdqu  xmm0, oword [r13+rdx+8H]
        add     r8d, 1
        movdqu  oword [rax+rdx+8H], xmm0
        add     rdx, 16
        cmp     r8d, esi
        jc      L_002
        cmp     ebx, ecx
        je      L_003
        lea     edx, [rdi+rcx]
        lea     r13d, [rcx+8H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r13d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+1H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r11d, [rcx+9H]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r11d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+2H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r10d, [rcx+0AH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r10d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+3H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r9d, [rcx+0BH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r9d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+4H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     r8d, [rcx+0CH]
        movsxd  rdx, edx
        movzx   esi, byte [rbp+rdx]
        movsxd  rdx, r8d
        mov     byte [rax+rdx], sil
        lea     edx, [rcx+5H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        lea     esi, [rcx+0DH]
        movsxd  rdx, edx
        movzx   r14d, byte [rbp+rdx]
        movsxd  rdx, esi
        mov     byte [rax+rdx], r14b
        lea     edx, [rcx+6H]
        cmp     ebx, edx
        jle     L_003
        add     edx, edi
        movsxd  rdx, edx
        movzx   r15d, byte [rbp+rdx]
        lea     edx, [rcx+0EH]
        movsxd  r14, edx
        mov     byte [rax+r14], r15b
        lea     r14d, [rcx+7H]
        cmp     ebx, r14d
        jle     L_003
        add     r14d, edi
        cmp     ebx, r13d
        movsxd  r14, r14d
        movzx   r15d, byte [rbp+r14]
        lea     r14d, [rcx+0FH]
        movsxd  r14, r14d
        mov     byte [rax+r14], r15b
        jle     L_003
        add     r13d, edi
        cmp     ebx, r11d
        movsxd  r13, r13d
        movzx   r14d, byte [rbp+r13]
        lea     r13d, [rcx+10H]
        movsxd  r13, r13d
        mov     byte [rax+r13], r14b
        jle     L_003
        add     r11d, edi
        cmp     ebx, r10d
        movsxd  r11, r11d
        movzx   r13d, byte [rbp+r11]
        lea     r11d, [rcx+11H]
        movsxd  r11, r11d
        mov     byte [rax+r11], r13b
        jle     L_003
        add     r10d, edi
        cmp     ebx, r9d
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        lea     r10d, [rcx+12H]
        movsxd  r10, r10d
        mov     byte [rax+r10], r11b
        jle     L_003
        add     r9d, edi
        cmp     ebx, r8d
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        lea     r9d, [rcx+13H]
        movsxd  r9, r9d
        mov     byte [rax+r9], r10b
        jle     L_003
        add     r8d, edi
        cmp     ebx, esi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        lea     r8d, [rcx+14H]
        movsxd  r8, r8d
        mov     byte [rax+r8], r9b
        jle     L_003
        add     esi, edi
        cmp     ebx, edx
        movsxd  rsi, esi
        movzx   r8d, byte [rbp+rsi]
        lea     esi, [rcx+15H]
        movsxd  rsi, esi
        mov     byte [rax+rsi], r8b
        jle     L_003
        add     edx, edi
        add     ecx, 22
        movsxd  rdx, edx
        movsxd  rcx, ecx
        movzx   edx, byte [rbp+rdx]
        mov     byte [rax+rcx], dl
L_003:  add     r12d, 9
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
L_004:  movsxd  rdi, edi
        xor     ecx, ecx
        add     rbp, rdi




ALIGN   16
L_005:  movzx   edx, byte [rbp+rcx]
        mov     byte [rax+rcx+8H], dl
        add     rcx, 1
        cmp     ebx, ecx
        jg      L_005
        jmp     L_003







ALIGN   16

__string_parseInt:
        movsx   edx, byte [rdi+8H]
        cmp     dl, 45
        jz      L_009
        lea     rcx, [rdi+8H]
        xor     edi, edi
L_006:  lea     eax, [rdx-30H]
        cmp     al, 9
        mov     eax, 0
        ja      L_008




ALIGN   8
L_007:  sub     edx, 48
        lea     rax, [rax+rax*4]
        add     rcx, 1
        movsxd  rdx, edx
        lea     rax, [rdx+rax*2]
        movsx   edx, byte [rcx]
        lea     esi, [rdx-30H]
        cmp     sil, 9
        jbe     L_007
L_008:  mov     rdx, rax
        neg     rdx
        test    edi, edi
        cmovne  rax, rdx
        ret





ALIGN   8
L_009:  lea     rcx, [rdi+9H]
        movsx   edx, byte [rdi+9H]
        mov     edi, 1
        jmp     L_006


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
        jle     L_011
        lea     rcx, [rbp+8H]
        lea     rdx, [rax+18H]
        lea     rsi, [rbp+18H]
        cmp     rcx, rdx
        lea     rdx, [rax+8H]
        setae   cl
        cmp     rsi, rdx
        setbe   dl
        or      cl, dl
        je      L_014
        cmp     rbx, 15
        jbe     L_014
        mov     rsi, rbx
        xor     ecx, ecx
        xor     edi, edi
        shr     rsi, 4
        mov     rdx, rsi
        shl     rdx, 4
L_010:  movdqu  xmm0, oword [rbp+rcx+8H]
        add     rdi, 1
        movdqu  oword [rax+rcx+8H], xmm0
        add     rcx, 16
        cmp     rsi, rdi
        ja      L_010
        cmp     rbx, rdx
        je      L_011
        lea     r14d, [rdx+8H]
        movsxd  r14, r14d
        movzx   ecx, byte [rbp+r14]
        mov     byte [rax+r14], cl
        lea     ecx, [rdx+1H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     r10d, [rdx+9H]
        movsxd  rcx, r10d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+2H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     r9d, [rdx+0AH]
        movsxd  rcx, r9d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+3H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     r8d, [rdx+0BH]
        movsxd  rcx, r8d
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+4H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     edi, [rdx+0CH]
        movsxd  rcx, edi
        movzx   esi, byte [rbp+rcx]
        mov     byte [rax+rcx], sil
        lea     ecx, [rdx+5H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     esi, [rdx+0DH]
        movsxd  rcx, esi
        movzx   r11d, byte [rbp+rcx]
        mov     byte [rax+rcx], r11b
        lea     ecx, [rdx+6H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        jle     L_011
        lea     ecx, [rdx+0EH]
        movsxd  r11, ecx
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        lea     r11d, [rdx+7H]
        movsxd  r11, r11d
        cmp     rbx, r11
        jle     L_011
        lea     r11d, [rdx+0FH]
        cmp     rbx, r14
        movsxd  r11, r11d
        movzx   r15d, byte [rbp+r11]
        mov     byte [rax+r11], r15b
        jle     L_011
        lea     r11d, [rdx+10H]
        movsxd  r10, r10d
        cmp     rbx, r10
        movsxd  r11, r11d
        movzx   r14d, byte [rbp+r11]
        mov     byte [rax+r11], r14b
        jle     L_011
        lea     r10d, [rdx+11H]
        movsxd  r9, r9d
        cmp     rbx, r9
        movsxd  r10, r10d
        movzx   r11d, byte [rbp+r10]
        mov     byte [rax+r10], r11b
        jle     L_011
        lea     r9d, [rdx+12H]
        movsxd  r8, r8d
        cmp     rbx, r8
        movsxd  r9, r9d
        movzx   r10d, byte [rbp+r9]
        mov     byte [rax+r9], r10b
        jle     L_011
        lea     r8d, [rdx+13H]
        movsxd  rdi, edi
        cmp     rbx, rdi
        movsxd  r8, r8d
        movzx   r9d, byte [rbp+r8]
        mov     byte [rax+r8], r9b
        jle     L_011
        lea     edi, [rdx+14H]
        movsxd  rsi, esi
        cmp     rbx, rsi
        movsxd  rdi, edi
        movzx   r8d, byte [rbp+rdi]
        mov     byte [rax+rdi], r8b
        jle     L_011
        lea     esi, [rdx+15H]
        movsxd  rcx, ecx
        cmp     rbx, rcx
        movsxd  rsi, esi
        movzx   edi, byte [rbp+rsi]
        mov     byte [rax+rsi], dil
        jle     L_011
        add     edx, 22
        movsxd  rdx, edx
        movzx   ecx, byte [rbp+rdx]
        mov     byte [rax+rdx], cl
L_011:  test    r13, r13
        jle     L_016
        lea     rsi, [r13+1H]
        add     rbx, 8
        mov     edx, 1
        xor     ecx, ecx




ALIGN   8
L_012:  movzx   edi, byte [r12+rdx+7H]
        add     rcx, rax
        mov     byte [rcx+rbx], dil
        mov     rcx, rdx
        add     rdx, 1
        cmp     rdx, rsi
        jnz     L_012
L_013:  add     r13, rax
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
L_014:  xor     edx, edx




ALIGN   8
L_015:  movzx   ecx, byte [rbp+rdx+8H]
        mov     byte [rax+rdx+8H], cl
        add     rdx, 1
        cmp     rbx, rdx
        jnz     L_015
        jmp     L_011

L_016:  add     rbx, 8
        jmp     L_013







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

__buffer.3420:
        resb    1048576


SECTION .text.startup 6

main:
        xor     eax, eax
        jmp     __init



SECTION .rodata.str1.1 

L_017:
        db 25H, 73H, 00H

L_018:
        db 25H, 6CH, 64H, 00H


;=====================================================================
	 section .text
_hex2int:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 192
	mov qword [rbp - 120], rdi
	mov rbx, 0
	mov qword [rbp - 80], rbx
	mov rbx, 0
	mov qword [rbp - 16], rbx
	b1:
	mov r10, qword [rbp - 120]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rdi, qword [rbp - 24]
	call __string_length
	mov qword [rbp - 160], rax
	mov rbx, qword [rbp - 160]
	mov r10, qword [rbp - 16]
	cmp r10, rbx
	jl b2
	b3:
	mov rax, qword [rbp - 80]
	jmp b4
	b2:
	mov r10, qword [rbp - 120]
	mov rbx, r10
	mov qword [rbp - 88], rbx
	mov rsi, qword [rbp - 16]
	mov rdi, qword [rbp - 88]
	call __string_ord
	mov qword [rbp - 96], rax
	mov rbx, qword [rbp - 96]
	mov r10, rbx
	mov qword [rbp - 40], r10
	mov rbx, qword [rbp - 40]
	cmp rbx, 48
	jge b5
	jmp b6
	b5:
	mov rbx, qword [rbp - 40]
	cmp rbx, 57
	jle b7
	b6:
	mov rbx, qword [rbp - 40]
	cmp rbx, 65
	jge b8
	jmp b9
	b8:
	mov rbx, qword [rbp - 40]
	cmp rbx, 70
	jle b10
	b9:
	mov rbx, qword [rbp - 40]
	cmp rbx, 97
	jge b11
	jmp b12
	b11:
	mov rbx, qword [rbp - 40]
	cmp rbx, 102
	jle b13
	b12:
	mov rax, 0
	b4:
	leave
	ret 
	b13:
	mov rax, qword [rbp - 80]
	mov rbx, 16
	mov qword [rbp - 152], rbx
	mov rbx, qword [rbp - 152]
	imul rbx
	mov qword [rbp - 136], rax
	mov rbx, qword [rbp - 136]
	mov r10, rbx
	mov qword [rbp - 176], r10
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 176]
	add r10, rbx
	mov qword [rbp - 176], r10
	mov r10, qword [rbp - 176]
	mov rbx, r10
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	sub rbx, 97
	mov qword [rbp - 56], rbx
	mov r10, qword [rbp - 56]
	mov rbx, r10
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	add rbx, 10
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	mov r10, rbx
	mov qword [rbp - 80], r10
	b14:
	jmp b15
	b10:
	mov rax, qword [rbp - 80]
	mov rbx, 16
	mov qword [rbp - 72], rbx
	mov rbx, qword [rbp - 72]
	imul rbx
	mov qword [rbp - 104], rax
	mov r10, qword [rbp - 104]
	mov rbx, r10
	mov qword [rbp - 144], rbx
	mov rbx, qword [rbp - 144]
	mov r10, qword [rbp - 40]
	add rbx, r10
	mov qword [rbp - 144], rbx
	mov rbx, qword [rbp - 144]
	mov r10, rbx
	mov qword [rbp - 112], r10
	mov rbx, qword [rbp - 112]
	sub rbx, 65
	mov qword [rbp - 112], rbx
	mov r10, qword [rbp - 112]
	mov rbx, r10
	mov qword [rbp - 184], rbx
	mov rbx, qword [rbp - 184]
	add rbx, 10
	mov qword [rbp - 184], rbx
	mov rbx, qword [rbp - 184]
	mov r10, rbx
	mov qword [rbp - 80], r10
	b15:
	jmp b16
	b7:
	mov rax, qword [rbp - 80]
	mov rbx, 16
	mov qword [rbp - 48], rbx
	mov rbx, qword [rbp - 48]
	imul rbx
	mov qword [rbp - 8], rax
	mov rbx, qword [rbp - 8]
	mov r10, rbx
	mov qword [rbp - 168], r10
	mov rbx, qword [rbp - 168]
	mov r10, qword [rbp - 40]
	add rbx, r10
	mov qword [rbp - 168], rbx
	mov rbx, qword [rbp - 168]
	mov r10, rbx
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 32]
	sub rbx, 48
	mov qword [rbp - 32], rbx
	mov r10, qword [rbp - 32]
	mov rbx, r10
	mov qword [rbp - 80], rbx
	b16:
	b17:
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 128], r10
	mov rbx, qword [rbp - 16]
	inc rbx
	mov qword [rbp - 16], rbx
	jmp b1
_int2chr:
	b18:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov qword [rbp - 40], rdi
	mov rbx, qword [g_0]
	mov qword [g_0], rbx
	mov rbx, qword [rbp - 40]
	cmp rbx, 32
	jge b19
	jmp b20
	b19:
	mov rbx, qword [rbp - 40]
	cmp rbx, 126
	jle b21
	b20:
	mov rax, g_1
	jmp b22
	b21:
	mov r10, qword [g_0]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov rbx, qword [rbp - 8]
	sub rbx, 32
	mov qword [rbp - 8], rbx
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov rbx, qword [rbp - 16]
	sub rbx, 32
	mov qword [rbp - 16], rbx
	mov rdx, qword [rbp - 16]
	mov rsi, qword [rbp - 8]
	mov rdi, qword [rbp - 24]
	call __string_substring
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	b22:
	leave
	ret 
_toStringHex:
	b23:
	push rbp
	mov rbp, rsp
	sub rsp, 112
	mov qword [rbp - 8], rdi
	mov rbx, g_2
	mov qword [rbp - 104], rbx
	mov rbx, 28
	mov qword [rbp - 48], rbx
	b24:
	mov rbx, qword [rbp - 48]
	cmp rbx, 0
	jge b25
	b26:
	mov rax, qword [rbp - 104]
	leave
	ret 
	b25:
	mov rbx, qword [rbp - 8]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov rcx, qword [rbp - 48]
	mov rbx, qword [rbp - 16]
	sar rbx, cl
	mov qword [rbp - 16], rbx
	mov r10, qword [rbp - 16]
	mov rbx, r10
	mov qword [rbp - 96], rbx
	mov rbx, qword [rbp - 96]
	and rbx, 15
	mov qword [rbp - 96], rbx
	mov r10, qword [rbp - 96]
	mov rbx, r10
	mov qword [rbp - 40], rbx
	mov rbx, qword [rbp - 40]
	cmp rbx, 10
	jl b27
	b28:
	mov rbx, 65
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 64]
	add r10, rbx
	mov qword [rbp - 64], r10
	mov rbx, qword [rbp - 64]
	mov r10, rbx
	mov qword [rbp - 88], r10
	mov rbx, qword [rbp - 88]
	sub rbx, 10
	mov qword [rbp - 88], rbx
	mov rdi, qword [rbp - 88]
	call _int2chr
	mov qword [rbp - 112], rax
	mov rsi, qword [rbp - 112]
	mov rdi, qword [rbp - 104]
	call __stringConcate
	mov qword [rbp - 80], rax
	mov rbx, qword [rbp - 80]
	mov r10, rbx
	mov qword [rbp - 104], r10
	jmp b29
	b27:
	mov rbx, 48
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 56]
	add r10, rbx
	mov qword [rbp - 56], r10
	mov rdi, qword [rbp - 56]
	call _int2chr
	mov qword [rbp - 32], rax
	mov rsi, qword [rbp - 32]
	mov rdi, qword [rbp - 104]
	call __stringConcate
	mov qword [rbp - 72], rax
	mov rbx, qword [rbp - 72]
	mov r10, rbx
	mov qword [rbp - 104], r10
	b29:
	b30:
	mov r10, qword [rbp - 48]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 24]
	sub rbx, 4
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 24]
	mov r10, rbx
	mov qword [rbp - 48], r10
	jmp b24
_rotate_left:
	b31:
	push rbp
	mov rbp, rsp
	sub rsp, 192
	mov qword [rbp - 72], rdi
	mov qword [rbp - 96], rsi
	mov rbx, qword [rbp - 96]
	cmp rbx, 1
	je b32
	b33:
	mov rbx, qword [rbp - 96]
	cmp rbx, 31
	je b34
	b35:
	mov rbx, 32
	mov qword [rbp - 112], rbx
	mov rbx, qword [rbp - 96]
	mov r10, qword [rbp - 112]
	sub r10, rbx
	mov qword [rbp - 112], r10
	mov rbx, 1
	mov qword [rbp - 56], rbx
	mov rcx, qword [rbp - 112]
	mov rbx, qword [rbp - 56]
	sal rbx, cl
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	mov r10, rbx
	mov qword [rbp - 184], r10
	mov rbx, qword [rbp - 184]
	sub rbx, 1
	mov qword [rbp - 184], rbx
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 8], rbx
	mov rbx, qword [rbp - 184]
	mov r10, qword [rbp - 8]
	and r10, rbx
	mov qword [rbp - 8], r10
	mov rbx, qword [rbp - 8]
	mov r10, rbx
	mov qword [rbp - 144], r10
	mov rcx, qword [rbp - 96]
	mov rbx, qword [rbp - 144]
	sal rbx, cl
	mov qword [rbp - 144], rbx
	mov rbx, 32
	mov qword [rbp - 104], rbx
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 96]
	sub rbx, r10
	mov qword [rbp - 104], rbx
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 64], rbx
	mov rcx, qword [rbp - 104]
	mov rbx, qword [rbp - 64]
	sar rbx, cl
	mov qword [rbp - 64], rbx
	mov rbx, 1
	mov qword [rbp - 48], rbx
	mov rcx, qword [rbp - 96]
	mov rbx, qword [rbp - 48]
	sal rbx, cl
	mov qword [rbp - 48], rbx
	mov r10, qword [rbp - 48]
	mov rbx, r10
	mov qword [rbp - 16], rbx
	mov rbx, qword [rbp - 16]
	sub rbx, 1
	mov qword [rbp - 16], rbx
	mov rbx, qword [rbp - 64]
	mov r10, rbx
	mov qword [rbp - 24], r10
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 24]
	and r10, rbx
	mov qword [rbp - 24], r10
	mov r10, qword [rbp - 144]
	mov rbx, r10
	mov qword [rbp - 120], rbx
	mov rbx, qword [rbp - 120]
	mov r10, qword [rbp - 24]
	or rbx, r10
	mov qword [rbp - 120], rbx
	mov rax, qword [rbp - 120]
	jmp b36
	b34:
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 168], rbx
	mov rbx, qword [rbp - 168]
	and rbx, 1
	mov qword [rbp - 168], rbx
	mov rbx, qword [rbp - 168]
	mov r10, rbx
	mov qword [rbp - 128], r10
	mov rcx, 31
	mov rbx, qword [rbp - 128]
	sal rbx, cl
	mov qword [rbp - 128], rbx
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 176], rbx
	mov rcx, 1
	mov rbx, qword [rbp - 176]
	sar rbx, cl
	mov qword [rbp - 176], rbx
	mov rbx, qword [rbp - 176]
	mov r10, rbx
	mov qword [rbp - 88], r10
	mov rbx, qword [rbp - 88]
	and rbx, 2147483647
	mov qword [rbp - 88], rbx
	mov rbx, qword [rbp - 128]
	mov r10, rbx
	mov qword [rbp - 136], r10
	mov rbx, qword [rbp - 88]
	mov r10, qword [rbp - 136]
	or r10, rbx
	mov qword [rbp - 136], r10
	mov rax, qword [rbp - 136]
	jmp b36
	b32:
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 32], rbx
	mov rbx, qword [rbp - 32]
	and rbx, 2147483647
	mov qword [rbp - 32], rbx
	mov rbx, qword [rbp - 32]
	mov r10, rbx
	mov qword [rbp - 40], r10
	mov rcx, 1
	mov rbx, qword [rbp - 40]
	sal rbx, cl
	mov qword [rbp - 40], rbx
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 80], rbx
	mov rcx, 31
	mov rbx, qword [rbp - 80]
	sar rbx, cl
	mov qword [rbp - 80], rbx
	mov r10, qword [rbp - 80]
	mov rbx, r10
	mov qword [rbp - 152], rbx
	mov rbx, qword [rbp - 152]
	and rbx, 1
	mov qword [rbp - 152], rbx
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 160], rbx
	mov rbx, qword [rbp - 152]
	mov r10, qword [rbp - 160]
	or r10, rbx
	mov qword [rbp - 160], r10
	mov rax, qword [rbp - 160]
	b36:
	leave
	ret 
_add:
	b37:
	push rbp
	mov rbp, rsp
	sub rsp, 144
	mov qword [rbp - 128], rdi
	mov qword [rbp - 136], rsi
	mov r10, qword [rbp - 128]
	mov rbx, r10
	mov qword [rbp - 80], rbx
	mov rbx, qword [rbp - 80]
	and rbx, 65535
	mov qword [rbp - 80], rbx
	mov r10, qword [rbp - 136]
	mov rbx, r10
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	and rbx, 65535
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 80]
	mov r10, rbx
	mov qword [rbp - 48], r10
	mov rbx, qword [rbp - 64]
	mov r10, qword [rbp - 48]
	add r10, rbx
	mov qword [rbp - 48], r10
	mov rbx, qword [rbp - 48]
	mov r10, rbx
	mov qword [rbp - 112], r10
	mov rbx, qword [rbp - 128]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov rcx, 16
	mov rbx, qword [rbp - 16]
	sar rbx, cl
	mov qword [rbp - 16], rbx
	mov r10, qword [rbp - 16]
	mov rbx, r10
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	and rbx, 65535
	mov qword [rbp - 56], rbx
	mov r10, qword [rbp - 136]
	mov rbx, r10
	mov qword [rbp - 104], rbx
	mov rcx, 16
	mov rbx, qword [rbp - 104]
	sar rbx, cl
	mov qword [rbp - 104], rbx
	mov rbx, qword [rbp - 104]
	mov r10, rbx
	mov qword [rbp - 24], r10
	mov rbx, qword [rbp - 24]
	and rbx, 65535
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 56]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 24]
	add rbx, r10
	mov qword [rbp - 8], rbx
	mov r10, qword [rbp - 112]
	mov rbx, r10
	mov qword [rbp - 88], rbx
	mov rcx, 16
	mov rbx, qword [rbp - 88]
	sar rbx, cl
	mov qword [rbp - 88], rbx
	mov rbx, qword [rbp - 8]
	mov r10, rbx
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 88]
	mov r10, qword [rbp - 32]
	add r10, rbx
	mov qword [rbp - 32], r10
	mov r10, qword [rbp - 32]
	mov rbx, r10
	mov qword [rbp - 40], rbx
	mov rbx, qword [rbp - 40]
	and rbx, 65535
	mov qword [rbp - 40], rbx
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 72], r10
	mov r10, qword [rbp - 72]
	mov rbx, r10
	mov qword [rbp - 144], rbx
	mov rcx, 16
	mov rbx, qword [rbp - 144]
	sal rbx, cl
	mov qword [rbp - 144], rbx
	mov r10, qword [rbp - 112]
	mov rbx, r10
	mov qword [rbp - 96], rbx
	mov rbx, qword [rbp - 96]
	and rbx, 65535
	mov qword [rbp - 96], rbx
	mov rbx, qword [rbp - 144]
	mov r10, rbx
	mov qword [rbp - 120], r10
	mov rbx, qword [rbp - 96]
	mov r10, qword [rbp - 120]
	or r10, rbx
	mov qword [rbp - 120], r10
	mov rax, qword [rbp - 120]
	leave
	ret 
_lohi:
	b38:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword [rbp - 8], rdi
	mov qword [rbp - 16], rsi
	mov rbx, qword [g_3]
	mov qword [g_3], rbx
	mov rbx, qword [g_4]
	mov qword [g_4], rbx
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 24], r10
	mov rcx, 16
	mov rbx, qword [rbp - 24]
	sal rbx, cl
	mov qword [rbp - 24], rbx
	mov r10, qword [rbp - 8]
	mov rbx, r10
	mov qword [rbp - 32], rbx
	mov rbx, qword [rbp - 24]
	mov r10, qword [rbp - 32]
	or r10, rbx
	mov qword [rbp - 32], r10
	mov rax, qword [rbp - 32]
	leave
	ret 
_sha1:
	b39:
	push rbp
	mov rbp, rsp
	sub rsp, 992
	mov qword [rbp - 624], rdi
	mov qword [rbp - 896], rsi
	mov rbx, qword [g_5]
	mov qword [g_5], rbx
	mov rbx, qword [g_4]
	mov qword [g_4], rbx
	mov rbx, qword [g_6]
	mov qword [g_6], rbx
	mov rbx, qword [rbp - 896]
	mov r10, rbx
	mov qword [rbp - 376], r10
	mov rbx, qword [rbp - 376]
	add rbx, 64
	mov qword [rbp - 376], rbx
	mov rbx, qword [rbp - 376]
	mov r10, rbx
	mov qword [rbp - 600], r10
	mov rbx, qword [rbp - 600]
	sub rbx, 56
	mov qword [rbp - 600], rbx
	mov rax, qword [rbp - 600]
	cdq
	mov rbx, 64
	mov qword [rbp - 560], rbx
	mov rbx, qword [rbp - 560]
	idiv rbx
	mov qword [rbp - 616], rax
	mov rbx, qword [rbp - 616]
	mov r10, rbx
	mov qword [rbp - 288], r10
	mov rbx, qword [rbp - 288]
	add rbx, 1
	mov qword [rbp - 288], rbx
	mov r10, qword [rbp - 288]
	mov rbx, r10
	mov qword [rbp - 520], rbx
	mov rbx, qword [rbp - 520]
	mov r10, qword [g_4]
	cmp rbx, r10
	jg b40
	b41:
	mov rbx, 0
	mov qword [rbp - 152], rbx
	b42:
	mov rbx, qword [rbp - 520]
	mov r10, qword [rbp - 152]
	cmp r10, rbx
	jl b43
	b44:
	mov rbx, 0
	mov qword [rbp - 152], rbx
	b45:
	mov rbx, qword [rbp - 152]
	mov r10, qword [rbp - 896]
	cmp rbx, r10
	jl b46
	b47:
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 960], rbx
	mov rbx, qword [rbp - 960]
	idiv rbx
	mov qword [rbp - 240], rax
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 320], rbx
	mov rbx, qword [rbp - 320]
	idiv rbx
	mov qword [rbp - 712], rdx
	mov rax, qword [rbp - 712]
	cdq
	mov rbx, 4
	mov qword [rbp - 168], rbx
	mov rbx, qword [rbp - 168]
	idiv rbx
	mov qword [rbp - 736], rax
	mov rbx, qword [rbp - 240]
	mov r10, qword [g_5]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 264], r11
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 496], rbx
	mov rbx, qword [rbp - 496]
	idiv rbx
	mov qword [rbp - 568], rax
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 192], rbx
	mov rbx, qword [rbp - 192]
	idiv rbx
	mov qword [rbp - 248], rdx
	mov rax, qword [rbp - 248]
	cdq
	mov rbx, 4
	mov qword [rbp - 680], rbx
	mov rbx, qword [rbp - 680]
	idiv rbx
	mov qword [rbp - 848], rax
	mov r10, qword [rbp - 568]
	mov r11, qword [g_5]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 880], rbx
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 4
	mov qword [rbp - 768], rbx
	mov rbx, qword [rbp - 768]
	idiv rbx
	mov qword [rbp - 184], rdx
	mov rbx, 3
	mov qword [rbp - 368], rbx
	mov rbx, qword [rbp - 368]
	mov r10, qword [rbp - 184]
	sub rbx, r10
	mov qword [rbp - 368], rbx
	mov rax, qword [rbp - 368]
	mov rbx, 8
	mov qword [rbp - 144], rbx
	mov rbx, qword [rbp - 144]
	imul rbx
	mov qword [rbp - 80], rax
	mov rbx, 128
	mov qword [rbp - 840], rbx
	mov rcx, qword [rbp - 80]
	mov rbx, qword [rbp - 840]
	sal rbx, cl
	mov qword [rbp - 840], rbx
	mov rbx, qword [rbp - 880]
	mov r11, qword [rbp - 848]
	mov r10, qword [rbx + r11 * 8 + 8]
	mov qword [rbp - 232], r10
	mov rbx, qword [rbp - 840]
	mov r10, qword [rbp - 232]
	or r10, rbx
	mov qword [rbp - 232], r10
	mov rbx, qword [rbp - 736]
	mov r10, qword [rbp - 264]
	mov r11, qword [rbp - 232]
	mov qword [r10 + rbx * 8 + 8], r11
	mov r10, qword [rbp - 520]
	mov rbx, r10
	mov qword [rbp - 920], rbx
	mov rbx, qword [rbp - 920]
	sub rbx, 1
	mov qword [rbp - 920], rbx
	mov rbx, qword [rbp - 920]
	mov r10, qword [g_5]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 352], r11
	mov r10, qword [rbp - 896]
	mov rbx, r10
	mov qword [rbp - 800], rbx
	mov rcx, 3
	mov rbx, qword [rbp - 800]
	sal rbx, cl
	mov qword [rbp - 800], rbx
	mov rbx, qword [rbp - 352]
	mov r10, qword [rbp - 800]
	mov qword [rbx + 128], r10
	mov r10, qword [rbp - 520]
	mov rbx, r10
	mov qword [rbp - 176], rbx
	mov rbx, qword [rbp - 176]
	sub rbx, 1
	mov qword [rbp - 176], rbx
	mov rbx, qword [rbp - 176]
	mov r10, qword [g_5]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 24], r11
	mov rbx, qword [rbp - 896]
	mov r10, rbx
	mov qword [rbp - 696], r10
	mov rcx, 29
	mov rbx, qword [rbp - 696]
	sar rbx, cl
	mov qword [rbp - 696], rbx
	mov r10, qword [rbp - 696]
	mov rbx, r10
	mov qword [rbp - 672], rbx
	mov rbx, qword [rbp - 672]
	and rbx, 7
	mov qword [rbp - 672], rbx
	mov rbx, qword [rbp - 672]
	mov r10, qword [rbp - 24]
	mov qword [r10 + 120], rbx
	mov rbx, 1732584193
	mov qword [rbp - 784], rbx
	mov rsi, 61389
	mov rdi, 43913
	call _lohi
	mov qword [rbp - 744], rax
	mov rbx, qword [rbp - 744]
	mov r10, rbx
	mov qword [rbp - 72], r10
	mov rsi, 39098
	mov rdi, 56574
	call _lohi
	mov qword [rbp - 688], rax
	mov r10, qword [rbp - 688]
	mov rbx, r10
	mov qword [rbp - 480], rbx
	mov rbx, 271733878
	mov qword [rbp - 752], rbx
	mov rsi, 50130
	mov rdi, 57840
	call _lohi
	mov qword [rbp - 344], rax
	mov rbx, qword [rbp - 344]
	mov r10, rbx
	mov qword [rbp - 48], r10
	mov rbx, 0
	mov qword [rbp - 152], rbx
	b48:
	mov rbx, qword [rbp - 520]
	mov r10, qword [rbp - 152]
	cmp r10, rbx
	jl b49
	b50:
	mov rbx, qword [rbp - 784]
	mov r10, qword [g_6]
	mov qword [r10 + 8], rbx
	mov rbx, qword [rbp - 72]
	mov r10, qword [g_6]
	mov qword [r10 + 16], rbx
	mov rbx, qword [rbp - 480]
	mov r10, qword [g_6]
	mov qword [r10 + 24], rbx
	mov rbx, qword [rbp - 752]
	mov r10, qword [g_6]
	mov qword [r10 + 32], rbx
	mov rbx, qword [rbp - 48]
	mov r10, qword [g_6]
	mov qword [r10 + 40], rbx
	mov rax, qword [g_6]
	jmp b51
	b49:
	mov rbx, 16
	mov qword [rbp - 160], rbx
	b52:
	mov rbx, qword [rbp - 160]
	cmp rbx, 80
	jl b53
	b54:
	mov rbx, qword [rbp - 784]
	mov r10, rbx
	mov qword [rbp - 360], r10
	mov rbx, qword [rbp - 72]
	mov r10, rbx
	mov qword [rbp - 608], r10
	mov rbx, qword [rbp - 480]
	mov r10, rbx
	mov qword [rbp - 704], r10
	mov rbx, qword [rbp - 752]
	mov r10, rbx
	mov qword [rbp - 504], r10
	mov rbx, qword [rbp - 48]
	mov r10, rbx
	mov qword [rbp - 304], r10
	mov rbx, 0
	mov qword [rbp - 160], rbx
	b55:
	mov rbx, qword [rbp - 160]
	cmp rbx, 80
	jl b56
	b57:
	mov rsi, qword [rbp - 360]
	mov rdi, qword [rbp - 784]
	call _add
	mov qword [rbp - 104], rax
	mov rbx, qword [rbp - 104]
	mov r10, rbx
	mov qword [rbp - 784], r10
	mov rsi, qword [rbp - 608]
	mov rdi, qword [rbp - 72]
	call _add
	mov qword [rbp - 984], rax
	mov rbx, qword [rbp - 984]
	mov r10, rbx
	mov qword [rbp - 72], r10
	mov rsi, qword [rbp - 704]
	mov rdi, qword [rbp - 480]
	call _add
	mov qword [rbp - 456], rax
	mov r10, qword [rbp - 456]
	mov rbx, r10
	mov qword [rbp - 480], rbx
	mov rsi, qword [rbp - 504]
	mov rdi, qword [rbp - 752]
	call _add
	mov qword [rbp - 8], rax
	mov r10, qword [rbp - 8]
	mov rbx, r10
	mov qword [rbp - 752], rbx
	mov rsi, qword [rbp - 304]
	mov rdi, qword [rbp - 48]
	call _add
	mov qword [rbp - 120], rax
	mov r10, qword [rbp - 120]
	mov rbx, r10
	mov qword [rbp - 48], rbx
	b58:
	mov rbx, qword [rbp - 152]
	mov r10, rbx
	mov qword [rbp - 384], r10
	mov rbx, qword [rbp - 152]
	inc rbx
	mov qword [rbp - 152], rbx
	jmp b48
	b56:
	mov rbx, qword [rbp - 160]
	cmp rbx, 20
	jl b59
	b60:
	mov rbx, qword [rbp - 160]
	cmp rbx, 40
	jl b61
	b62:
	mov rbx, qword [rbp - 160]
	cmp rbx, 60
	jl b63
	b64:
	mov r10, qword [rbp - 608]
	mov rbx, r10
	mov qword [rbp - 592], rbx
	mov rbx, qword [rbp - 592]
	mov r10, qword [rbp - 704]
	xor rbx, r10
	mov qword [rbp - 592], rbx
	mov rbx, qword [rbp - 592]
	mov r10, rbx
	mov qword [rbp - 720], r10
	mov rbx, qword [rbp - 720]
	mov r10, qword [rbp - 504]
	xor rbx, r10
	mov qword [rbp - 720], rbx
	mov r10, qword [rbp - 720]
	mov rbx, r10
	mov qword [rbp - 440], rbx
	mov rsi, 51810
	mov rdi, 49622
	call _lohi
	mov qword [rbp - 528], rax
	mov rbx, qword [rbp - 528]
	mov r10, rbx
	mov qword [rbp - 96], r10
	jmp b65
	b63:
	mov rbx, qword [rbp - 608]
	mov r10, rbx
	mov qword [rbp - 912], r10
	mov rbx, qword [rbp - 704]
	mov r10, qword [rbp - 912]
	and r10, rbx
	mov qword [rbp - 912], r10
	mov rbx, qword [rbp - 608]
	mov r10, rbx
	mov qword [rbp - 208], r10
	mov rbx, qword [rbp - 208]
	mov r10, qword [rbp - 504]
	and rbx, r10
	mov qword [rbp - 208], rbx
	mov rbx, qword [rbp - 912]
	mov r10, rbx
	mov qword [rbp - 392], r10
	mov rbx, qword [rbp - 208]
	mov r10, qword [rbp - 392]
	or r10, rbx
	mov qword [rbp - 392], r10
	mov r10, qword [rbp - 704]
	mov rbx, r10
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbp - 504]
	and rbx, r10
	mov qword [rbp - 56], rbx
	mov r10, qword [rbp - 392]
	mov rbx, r10
	mov qword [rbp - 272], rbx
	mov rbx, qword [rbp - 272]
	mov r10, qword [rbp - 56]
	or rbx, r10
	mov qword [rbp - 272], rbx
	mov rbx, qword [rbp - 272]
	mov r10, rbx
	mov qword [rbp - 440], r10
	mov rsi, 36635
	mov rdi, 48348
	call _lohi
	mov qword [rbp - 816], rax
	mov r10, qword [rbp - 816]
	mov rbx, r10
	mov qword [rbp - 96], rbx
	b65:
	jmp b66
	b61:
	mov r10, qword [rbp - 608]
	mov rbx, r10
	mov qword [rbp - 280], rbx
	mov rbx, qword [rbp - 280]
	mov r10, qword [rbp - 704]
	xor rbx, r10
	mov qword [rbp - 280], rbx
	mov rbx, qword [rbp - 280]
	mov r10, rbx
	mov qword [rbp - 64], r10
	mov rbx, qword [rbp - 64]
	mov r10, qword [rbp - 504]
	xor rbx, r10
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	mov r10, rbx
	mov qword [rbp - 440], r10
	mov rbx, 1859775393
	mov qword [rbp - 96], rbx
	b66:
	jmp b67
	b59:
	mov r10, qword [rbp - 608]
	mov rbx, r10
	mov qword [rbp - 432], rbx
	mov rbx, qword [rbp - 432]
	mov r10, qword [rbp - 704]
	and rbx, r10
	mov qword [rbp - 432], rbx
	mov rbx, qword [rbp - 608]
	mov r10, rbx
	mov qword [rbp - 136], r10
	mov rbx, qword [rbp - 136]
	not rbx
	mov qword [rbp - 136], rbx
	mov r10, qword [rbp - 136]
	mov rbx, r10
	mov qword [rbp - 296], rbx
	mov rbx, qword [rbp - 296]
	mov r10, qword [rbp - 504]
	and rbx, r10
	mov qword [rbp - 296], rbx
	mov r10, qword [rbp - 432]
	mov rbx, r10
	mov qword [rbp - 824], rbx
	mov rbx, qword [rbp - 824]
	mov r10, qword [rbp - 296]
	or rbx, r10
	mov qword [rbp - 824], rbx
	mov rbx, qword [rbp - 824]
	mov r10, rbx
	mov qword [rbp - 440], r10
	mov rbx, 1518500249
	mov qword [rbp - 96], rbx
	b67:
	mov rsi, 5
	mov rdi, qword [rbp - 360]
	call _rotate_left
	mov qword [rbp - 416], rax
	mov rsi, qword [rbp - 304]
	mov rdi, qword [rbp - 416]
	call _add
	mov qword [rbp - 128], rax
	mov rsi, qword [rbp - 96]
	mov rdi, qword [rbp - 440]
	call _add
	mov qword [rbp - 512], rax
	mov rsi, qword [rbp - 512]
	mov rdi, qword [rbp - 128]
	call _add
	mov qword [rbp - 464], rax
	mov r10, qword [rbp - 152]
	mov r11, qword [g_5]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 760], rbx
	mov rbx, qword [rbp - 760]
	mov r10, qword [rbp - 160]
	mov r11, qword [rbx + r10 * 8 + 8]
	mov qword [rbp - 976], r11
	mov rsi, qword [rbp - 976]
	mov rdi, qword [rbp - 464]
	call _add
	mov qword [rbp - 88], rax
	mov r10, qword [rbp - 88]
	mov rbx, r10
	mov qword [rbp - 328], rbx
	mov rbx, qword [rbp - 504]
	mov r10, rbx
	mov qword [rbp - 304], r10
	mov rbx, qword [rbp - 704]
	mov r10, rbx
	mov qword [rbp - 504], r10
	mov rsi, 30
	mov rdi, qword [rbp - 608]
	call _rotate_left
	mov qword [rbp - 864], rax
	mov rbx, qword [rbp - 864]
	mov r10, rbx
	mov qword [rbp - 704], r10
	mov r10, qword [rbp - 360]
	mov rbx, r10
	mov qword [rbp - 608], rbx
	mov rbx, qword [rbp - 328]
	mov r10, rbx
	mov qword [rbp - 360], r10
	b68:
	mov rbx, qword [rbp - 160]
	mov r10, rbx
	mov qword [rbp - 536], r10
	mov rbx, qword [rbp - 160]
	inc rbx
	mov qword [rbp - 160], rbx
	jmp b55
	b53:
	mov rbx, qword [rbp - 152]
	mov r10, qword [g_5]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 632], r11
	mov r10, qword [rbp - 160]
	mov rbx, r10
	mov qword [rbp - 936], rbx
	mov rbx, qword [rbp - 936]
	sub rbx, 3
	mov qword [rbp - 936], rbx
	mov rbx, qword [rbp - 152]
	mov r10, qword [g_5]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 968], r11
	mov rbx, qword [rbp - 160]
	mov r10, rbx
	mov qword [rbp - 648], r10
	mov rbx, qword [rbp - 648]
	sub rbx, 8
	mov qword [rbp - 648], rbx
	mov r10, qword [rbp - 152]
	mov r11, qword [g_5]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 928], rbx
	mov rbx, qword [rbp - 936]
	mov r10, qword [rbp - 968]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 256], r11
	mov rbx, qword [rbp - 928]
	mov r10, qword [rbp - 648]
	mov r11, qword [rbp - 256]
	xor r11, qword [rbx + r10 * 8 + 8]
	mov qword [rbp - 256], r11
	mov r10, qword [rbp - 160]
	mov rbx, r10
	mov qword [rbp - 40], rbx
	mov rbx, qword [rbp - 40]
	sub rbx, 14
	mov qword [rbp - 40], rbx
	mov r10, qword [rbp - 152]
	mov r11, qword [g_5]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 544], rbx
	mov r10, qword [rbp - 256]
	mov rbx, r10
	mov qword [rbp - 576], rbx
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 544]
	mov r11, qword [rbp - 576]
	xor r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 576], r11
	mov rbx, qword [rbp - 160]
	mov r10, rbx
	mov qword [rbp - 200], r10
	mov rbx, qword [rbp - 200]
	sub rbx, 16
	mov qword [rbp - 200], rbx
	mov r10, qword [rbp - 152]
	mov r11, qword [g_5]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 216], rbx
	mov rbx, qword [rbp - 576]
	mov r10, rbx
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 216]
	mov r11, qword [rbp - 200]
	xor rbx, qword [r10 + r11 * 8 + 8]
	mov qword [rbp - 32], rbx
	mov rsi, 1
	mov rdi, qword [rbp - 32]
	call _rotate_left
	mov qword [rbp - 808], rax
	mov rbx, qword [rbp - 160]
	mov r10, qword [rbp - 808]
	mov r11, qword [rbp - 632]
	mov qword [r11 + rbx * 8 + 8], r10
	b69:
	mov r10, qword [rbp - 160]
	mov rbx, r10
	mov qword [rbp - 112], rbx
	mov rbx, qword [rbp - 160]
	inc rbx
	mov qword [rbp - 160], rbx
	jmp b52
	b46:
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 552], rbx
	mov rbx, qword [rbp - 552]
	idiv rbx
	mov qword [rbp - 872], rax
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 832], rbx
	mov rbx, qword [rbp - 832]
	idiv rbx
	mov qword [rbp - 856], rdx
	mov rax, qword [rbp - 856]
	cdq
	mov rbx, 4
	mov qword [rbp - 776], rbx
	mov rbx, qword [rbp - 776]
	idiv rbx
	mov qword [rbp - 944], rax
	mov r10, qword [g_5]
	mov r11, qword [rbp - 872]
	mov rbx, qword [r10 + r11 * 8 + 8]
	mov qword [rbp - 312], rbx
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 408], rbx
	mov rbx, qword [rbp - 408]
	idiv rbx
	mov qword [rbp - 728], rax
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 64
	mov qword [rbp - 640], rbx
	mov rbx, qword [rbp - 640]
	idiv rbx
	mov qword [rbp - 424], rdx
	mov rax, qword [rbp - 424]
	cdq
	mov rbx, 4
	mov qword [rbp - 400], rbx
	mov rbx, qword [rbp - 400]
	idiv rbx
	mov qword [rbp - 664], rax
	mov r10, qword [g_5]
	mov r11, qword [rbp - 728]
	mov rbx, qword [r10 + r11 * 8 + 8]
	mov qword [rbp - 584], rbx
	mov rax, qword [rbp - 152]
	cdq
	mov rbx, 4
	mov qword [rbp - 448], rbx
	mov rbx, qword [rbp - 448]
	idiv rbx
	mov qword [rbp - 952], rdx
	mov rbx, 3
	mov qword [rbp - 888], rbx
	mov rbx, qword [rbp - 952]
	mov r10, qword [rbp - 888]
	sub r10, rbx
	mov qword [rbp - 888], r10
	mov rax, qword [rbp - 888]
	mov rbx, 8
	mov qword [rbp - 488], rbx
	mov rbx, qword [rbp - 488]
	imul rbx
	mov qword [rbp - 792], rax
	mov rbx, qword [rbp - 152]
	mov r10, qword [rbp - 624]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 656], r11
	mov rcx, qword [rbp - 792]
	mov rbx, qword [rbp - 656]
	sal rbx, cl
	mov qword [rbp - 656], rbx
	mov rbx, qword [rbp - 584]
	mov r11, qword [rbp - 664]
	mov r10, qword [rbx + r11 * 8 + 8]
	mov qword [rbp - 472], r10
	mov rbx, qword [rbp - 472]
	mov r10, qword [rbp - 656]
	or rbx, r10
	mov qword [rbp - 472], rbx
	mov rbx, qword [rbp - 472]
	mov r10, qword [rbp - 312]
	mov r11, qword [rbp - 944]
	mov qword [r10 + r11 * 8 + 8], rbx
	b70:
	mov r10, qword [rbp - 152]
	mov rbx, r10
	mov qword [rbp - 16], rbx
	mov rbx, qword [rbp - 152]
	inc rbx
	mov qword [rbp - 152], rbx
	jmp b45
	b43:
	mov rbx, 0
	mov qword [rbp - 160], rbx
	b71:
	mov rbx, qword [rbp - 160]
	cmp rbx, 80
	jl b72
	b73:
	b74:
	mov r10, qword [rbp - 152]
	mov rbx, r10
	mov qword [rbp - 904], rbx
	mov rbx, qword [rbp - 152]
	inc rbx
	mov qword [rbp - 152], rbx
	jmp b42
	b72:
	mov rbx, qword [rbp - 152]
	mov r10, qword [g_5]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 336], r11
	mov rbx, qword [rbp - 160]
	mov r10, qword [rbp - 336]
	mov qword [r10 + rbx * 8 + 8], 0
	b75:
	mov rbx, qword [rbp - 160]
	mov r10, rbx
	mov qword [rbp - 224], r10
	mov rbx, qword [rbp - 160]
	inc rbx
	mov qword [rbp - 160], rbx
	jmp b71
	b40:
	mov rdi, g_7
	call __println
	mov rax, 0
	b51:
	leave
	ret 
_computeSHA1:
	b76:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov qword [rbp - 40], rdi
	mov rbx, qword [g_8]
	mov qword [g_8], rbx
	mov rbx, 0
	mov qword [rbp - 72], rbx
	b77:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 80], rbx
	mov rdi, qword [rbp - 80]
	call __string_length
	mov qword [rbp - 96], rax
	mov rbx, qword [rbp - 72]
	mov r10, qword [rbp - 96]
	cmp rbx, r10
	jl b78
	b79:
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov rdi, qword [rbp - 8]
	call __string_length
	mov qword [rbp - 64], rax
	mov rsi, qword [rbp - 64]
	mov rdi, qword [g_8]
	call _sha1
	mov qword [rbp - 112], rax
	mov r10, qword [rbp - 112]
	mov rbx, r10
	mov qword [rbp - 32], rbx
	mov rbx, 0
	mov qword [rbp - 72], rbx
	b80:
	mov rbx, qword [rbp - 32]
	mov r10, rbx
	mov qword [rbp - 56], r10
	mov rbx, qword [rbp - 72]
	mov r10, qword [rbp - 56]
	cmp rbx, qword [r10]
	jl b81
	b82:
	mov rdi, g_9
	call __println
	leave
	ret 
	b81:
	mov rbx, qword [rbp - 72]
	mov r10, qword [rbp - 32]
	mov r11, qword [r10 + rbx * 8 + 8]
	mov qword [rbp - 120], r11
	mov rdi, qword [rbp - 120]
	call _toStringHex
	mov qword [rbp - 24], rax
	mov rdi, qword [rbp - 24]
	call __print
	b83:
	mov rbx, qword [rbp - 72]
	mov r10, rbx
	mov qword [rbp - 104], r10
	mov rbx, qword [rbp - 72]
	inc rbx
	mov qword [rbp - 72], rbx
	jmp b80
	b78:
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 48], r10
	mov rsi, qword [rbp - 72]
	mov rdi, qword [rbp - 48]
	call __string_ord
	mov qword [rbp - 16], rax
	mov rbx, qword [rbp - 72]
	mov r10, qword [g_8]
	mov r11, qword [rbp - 16]
	mov qword [r10 + rbx * 8 + 8], r11
	b84:
	mov rbx, qword [rbp - 72]
	mov r10, rbx
	mov qword [rbp - 88], r10
	mov rbx, qword [rbp - 72]
	inc rbx
	mov qword [rbp - 72], rbx
	jmp b77
_nextLetter:
	b85:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword [rbp - 16], rdi
	mov rbx, qword [rbp - 16]
	cmp rbx, 122
	je b86
	b87:
	mov rbx, qword [rbp - 16]
	cmp rbx, 90
	je b88
	b89:
	mov rbx, qword [rbp - 16]
	cmp rbx, 57
	je b90
	b91:
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov rbx, qword [rbp - 8]
	add rbx, 1
	mov qword [rbp - 8], rbx
	mov rax, qword [rbp - 8]
	jmp b92
	b90:
	mov rax, 65
	jmp b92
	b88:
	mov rax, 97
	jmp b92
	b86:
	mov rbx, 1
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 24]
	neg rbx
	mov qword [rbp - 24], rbx
	mov rax, qword [rbp - 24]
	b92:
	leave
	ret 
_nextText:
	b93:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov qword [rbp - 48], rdi
	mov qword [rbp - 32], rsi
	mov rbx, qword [rbp - 32]
	mov r10, rbx
	mov qword [rbp - 40], r10
	mov rbx, qword [rbp - 40]
	sub rbx, 1
	mov qword [rbp - 40], rbx
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 16], rbx
	b94:
	mov rbx, qword [rbp - 16]
	cmp rbx, 0
	jge b95
	b96:
	b97:
	mov rax, 0
	b98:
	jmp b99
	b95:
	mov r10, qword [rbp - 16]
	mov r11, qword [rbp - 48]
	mov rbx, qword [r11 + r10 * 8 + 8]
	mov qword [rbp - 64], rbx
	mov rdi, qword [rbp - 64]
	call _nextLetter
	mov qword [rbp - 8], rax
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 16]
	mov r11, qword [rbp - 48]
	mov qword [r11 + r10 * 8 + 8], rbx
	mov rbx, 1
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	neg rbx
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	mov r10, qword [rbp - 16]
	mov r11, qword [rbp - 48]
	cmp qword [r11 + r10 * 8 + 8], rbx
	je b100
	b101:
	b102:
	mov rax, 1
	b103:
	b99:
	leave
	ret 
	b100:
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 48]
	mov qword [r10 + rbx * 8 + 8], 48
	b104:
	b105:
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 24], r10
	mov rbx, qword [rbp - 16]
	dec rbx
	mov qword [rbp - 16], rbx
	jmp b94
_array_equal:
	b106:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov qword [rbp - 24], rdi
	mov qword [rbp - 32], rsi
	mov rbx, qword [rbp - 24]
	mov r10, rbx
	mov qword [rbp - 16], r10
	mov r10, qword [rbp - 32]
	mov rbx, r10
	mov qword [rbp - 8], rbx
	mov r10, qword [rbp - 16]
	mov rbx, qword [r10]
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	mov r10, qword [rbp - 8]
	cmp rbx, qword [r10]
	jne b107
	b108:
	mov rbx, 0
	mov qword [rbp - 40], rbx
	b109:
	mov r10, qword [rbp - 24]
	mov rbx, r10
	mov qword [rbp - 72], rbx
	mov rbx, qword [rbp - 72]
	mov r10, qword [rbp - 40]
	cmp r10, qword [rbx]
	jl b110
	b111:
	b112:
	mov rax, 1
	b113:
	jmp b114
	b110:
	mov r10, qword [rbp - 24]
	mov r11, qword [rbp - 40]
	mov rbx, qword [r10 + r11 * 8 + 8]
	mov qword [rbp - 48], rbx
	mov rbx, qword [rbp - 48]
	mov r10, qword [rbp - 40]
	mov r11, qword [rbp - 32]
	cmp rbx, qword [r11 + r10 * 8 + 8]
	jne b115
	b116:
	b117:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 40]
	inc rbx
	mov qword [rbp - 40], rbx
	jmp b109
	b115:
	b118:
	mov rax, 0
	b119:
	jmp b114
	b107:
	b120:
	mov rax, 0
	b121:
	b114:
	leave
	ret 
_crackSHA1:
	b122:
	push rbp
	mov rbp, rsp
	sub rsp, 288
	mov qword [rbp - 120], rdi
	mov rbx, qword [g_8]
	mov qword [g_8], rbx
	mov rbx, 5
	mov qword [rbp - 32], rbx
	mov rbx, qword [rbp - 200]
	mov r10, qword [rbp - 32]
	lea rbx, [r10 * 8 + 8]
	mov qword [rbp - 200], rbx
	mov rdi, qword [rbp - 200]
	call malloc
	mov qword [rbp - 104], rax
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 32]
	mov qword [rbx], r10
	b123:
	mov rbx, qword [rbp - 32]
	cmp rbx, 0
	jg b124
	b125:
	mov rbx, qword [rbp - 104]
	mov r10, rbx
	mov qword [rbp - 88], r10
	mov r10, qword [rbp - 120]
	mov rbx, r10
	mov qword [rbp - 248], rbx
	mov rdi, qword [rbp - 248]
	call __string_length
	mov qword [rbp - 48], rax
	mov rbx, qword [rbp - 48]
	cmp rbx, 40
	jne b126
	b127:
	mov rbx, 0
	mov qword [rbp - 40], rbx
	b128:
	mov rbx, qword [rbp - 40]
	cmp rbx, 5
	jl b129
	b130:
	mov rbx, 0
	mov qword [rbp - 40], rbx
	b131:
	mov rbx, qword [rbp - 40]
	cmp rbx, 40
	jl b132
	b133:
	mov rbx, 4
	mov qword [rbp - 160], rbx
	mov rbx, 1
	mov qword [rbp - 16], rbx
	b134:
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 160]
	cmp rbx, r10
	jle b135
	b136:
	mov rdi, g_10
	call __println
	jmp b137
	b135:
	mov rbx, 0
	mov qword [rbp - 40], rbx
	b138:
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 40]
	cmp r10, rbx
	jl b139
	b140:
	b141:
	b142:
	mov rsi, qword [rbp - 16]
	mov rdi, qword [g_8]
	call _sha1
	mov qword [rbp - 136], rax
	mov rbx, qword [rbp - 136]
	mov r10, rbx
	mov qword [rbp - 128], r10
	mov rsi, qword [rbp - 88]
	mov rdi, qword [rbp - 128]
	call _array_equal
	cmp rax, 0
	jne b143
	b144:
	mov rsi, qword [rbp - 16]
	mov rdi, qword [g_8]
	call _nextText
	cmp rax, 0
	jne b145
	b146:
	b147:
	b148:
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 168], r10
	mov rbx, qword [rbp - 16]
	inc rbx
	mov qword [rbp - 16], rbx
	jmp b134
	b145:
	jmp b141
	b143:
	mov rbx, 0
	mov qword [rbp - 40], rbx
	b149:
	mov rbx, qword [rbp - 16]
	mov r10, qword [rbp - 40]
	cmp r10, rbx
	jl b150
	b151:
	mov rdi, g_11
	call __println
	jmp b137
	b150:
	mov rbx, qword [g_8]
	mov r10, qword [rbp - 40]
	mov r11, qword [rbx + r10 * 8 + 8]
	mov qword [rbp - 240], r11
	mov rdi, qword [rbp - 240]
	call _int2chr
	mov qword [rbp - 256], rax
	mov rdi, qword [rbp - 256]
	call __print
	b152:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 264], rbx
	mov rbx, qword [rbp - 40]
	inc rbx
	mov qword [rbp - 40], rbx
	jmp b149
	b139:
	mov rbx, qword [g_8]
	mov r10, qword [rbp - 40]
	mov qword [rbx + r10 * 8 + 8], 48
	b153:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 216], rbx
	mov rbx, qword [rbp - 40]
	inc rbx
	mov qword [rbp - 40], rbx
	jmp b138
	b132:
	mov rax, qword [rbp - 40]
	cdq
	mov rbx, 8
	mov qword [rbp - 208], rbx
	mov rbx, qword [rbp - 208]
	idiv rbx
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 40]
	cdq
	mov rbx, 8
	mov qword [rbp - 56], rbx
	mov rbx, qword [rbp - 56]
	idiv rbx
	mov qword [rbp - 96], rax
	mov r10, qword [rbp - 120]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 192], r10
	mov rbx, qword [rbp - 192]
	add rbx, 3
	mov qword [rbp - 192], rbx
	mov rdx, qword [rbp - 192]
	mov rsi, qword [rbp - 40]
	mov rdi, qword [rbp - 24]
	call __string_substring
	mov qword [rbp - 144], rax
	mov rdi, qword [rbp - 144]
	call _hex2int
	mov qword [rbp - 176], rax
	mov rax, qword [rbp - 40]
	cdq
	mov rbx, 4
	mov qword [rbp - 64], rbx
	mov rbx, qword [rbp - 64]
	idiv rbx
	mov qword [rbp - 80], rax
	mov rax, qword [rbp - 80]
	cdq
	mov rbx, 2
	mov qword [rbp - 272], rbx
	mov rbx, qword [rbp - 272]
	idiv rbx
	mov qword [rbp - 8], rdx
	mov rbx, 1
	mov qword [rbp - 288], rbx
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 288]
	sub r10, rbx
	mov qword [rbp - 288], r10
	mov rax, qword [rbp - 288]
	mov rbx, 16
	mov qword [rbp - 224], rbx
	mov rbx, qword [rbp - 224]
	imul rbx
	mov qword [rbp - 232], rax
	mov r10, qword [rbp - 176]
	mov rbx, r10
	mov qword [rbp - 112], rbx
	mov rcx, qword [rbp - 232]
	mov rbx, qword [rbp - 112]
	sal rbx, cl
	mov qword [rbp - 112], rbx
	mov rbx, qword [rbp - 88]
	mov r10, qword [rbp - 96]
	mov r11, qword [rbx + r10 * 8 + 8]
	mov qword [rbp - 152], r11
	mov rbx, qword [rbp - 112]
	mov r10, qword [rbp - 152]
	or r10, rbx
	mov qword [rbp - 152], r10
	mov rbx, qword [rbp - 88]
	mov r10, qword [rbp - 184]
	mov r11, qword [rbp - 152]
	mov qword [rbx + r10 * 8 + 8], r11
	b154:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 280], rbx
	mov rbx, qword [rbp - 280]
	add rbx, 4
	mov qword [rbp - 280], rbx
	mov rbx, qword [rbp - 280]
	mov r10, rbx
	mov qword [rbp - 40], r10
	jmp b131
	b129:
	mov rbx, qword [rbp - 88]
	mov r10, qword [rbp - 40]
	mov qword [rbx + r10 * 8 + 8], 0
	b155:
	mov r10, qword [rbp - 40]
	mov rbx, r10
	mov qword [rbp - 72], rbx
	mov rbx, qword [rbp - 40]
	inc rbx
	mov qword [rbp - 40], rbx
	jmp b128
	b126:
	mov rdi, g_12
	call __println
	b137:
	leave
	ret 
	b124:
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 32]
	mov qword [rbx + r10 * 8], 0
	mov rbx, qword [rbp - 32]
	dec rbx
	mov qword [rbp - 32], rbx
	jmp b123
_main:
	b156:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	b157:
	b158:
	call __getInt
	mov qword [rbp - 24], rax
	mov rbx, qword [rbp - 24]
	mov r10, rbx
	mov qword [rbp - 32], r10
	mov rbx, qword [rbp - 32]
	cmp rbx, 0
	je b159
	b160:
	mov rbx, qword [rbp - 32]
	cmp rbx, 1
	je b161
	b162:
	mov rbx, qword [rbp - 32]
	cmp rbx, 2
	je b163
	jmp b164
	b163:
	call __getString
	mov qword [rbp - 16], rax
	mov rbx, qword [rbp - 16]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov rdi, qword [rbp - 8]
	call _crackSHA1
	b164:
	jmp b165
	b161:
	call __getString
	mov qword [rbp - 40], rax
	mov rbx, qword [rbp - 40]
	mov r10, rbx
	mov qword [rbp - 8], r10
	mov rdi, qword [rbp - 8]
	call _computeSHA1
	b165:
	jmp b157
	b159:
	b166:
	mov rax, 0
	leave
	ret 
__init:
	b167:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov qword [g_0], g_13
	mov qword [g_4], 100
	mov r10, qword [g_4]
	mov rbx, r10
	mov qword [rbp - 16], rbx
	mov rbx, qword [rbp - 16]
	sub rbx, 1
	mov qword [rbp - 16], rbx
	mov rax, qword [rbp - 16]
	mov rbx, 64
	mov qword [rbp - 112], rbx
	mov rbx, qword [rbp - 112]
	imul rbx
	mov qword [rbp - 120], rax
	mov r10, qword [rbp - 120]
	mov rbx, r10
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 24]
	sub rbx, 16
	mov qword [rbp - 24], rbx
	mov rbx, qword [rbp - 24]
	mov qword [g_3], rbx
	mov rbx, qword [g_4]
	mov r10, rbx
	mov qword [rbp - 128], r10
	mov rbx, qword [rbp - 48]
	mov r10, qword [rbp - 128]
	lea rbx, [r10 * 8 + 8]
	mov qword [rbp - 48], rbx
	mov rdi, qword [rbp - 48]
	call malloc
	mov qword [rbp - 32], rax
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 128]
	mov qword [rbx], r10
	b168:
	mov rbx, qword [rbp - 128]
	cmp rbx, 0
	jg b169
	b170:
	mov rbx, qword [rbp - 32]
	mov qword [g_5], rbx
	mov r10, qword [g_3]
	mov rbx, r10
	mov qword [rbp - 104], rbx
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 64]
	lea r10, [rbx * 8 + 8]
	mov qword [rbp - 64], r10
	mov rdi, qword [rbp - 64]
	call malloc
	mov qword [rbp - 56], rax
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 56]
	mov qword [r10], rbx
	b171:
	mov rbx, qword [rbp - 104]
	cmp rbx, 0
	jg b172
	b173:
	mov rbx, qword [rbp - 56]
	mov qword [g_8], rbx
	mov rbx, 5
	mov qword [rbp - 40], rbx
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 80]
	lea r10, [rbx * 8 + 8]
	mov qword [rbp - 80], r10
	mov rdi, qword [rbp - 80]
	call malloc
	mov qword [rbp - 96], rax
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 96]
	mov qword [r10], rbx
	b174:
	mov rbx, qword [rbp - 40]
	cmp rbx, 0
	jg b175
	b176:
	mov rbx, qword [rbp - 96]
	mov qword [g_6], rbx
	mov rbx, qword [g_4]
	mov qword [g_4], rbx
	call _main
	mov rbx, qword [g_4]
	mov qword [g_4], rbx
	leave
	ret 
	b175:
	mov rbx, qword [rbp - 40]
	mov r10, qword [rbp - 96]
	mov qword [r10 + rbx * 8], 0
	mov rbx, qword [rbp - 40]
	dec rbx
	mov qword [rbp - 40], rbx
	jmp b174
	b172:
	mov rbx, qword [rbp - 104]
	mov r10, qword [rbp - 56]
	mov qword [r10 + rbx * 8], 0
	mov rbx, qword [rbp - 104]
	dec rbx
	mov qword [rbp - 104], rbx
	jmp b171
	b169:
	mov rbx, 80
	mov qword [rbp - 72], rbx
	mov rbx, qword [rbp - 88]
	mov r10, qword [rbp - 72]
	lea rbx, [r10 * 8 + 8]
	mov qword [rbp - 88], rbx
	mov rdi, qword [rbp - 88]
	call malloc
	mov qword [rbp - 8], rax
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 72]
	mov qword [rbx], r10
	b177:
	mov rbx, qword [rbp - 72]
	cmp rbx, 0
	jg b178
	b179:
	mov rbx, qword [rbp - 32]
	mov r10, qword [rbp - 8]
	mov r11, qword [rbp - 128]
	mov qword [rbx + r11 * 8], r10
	mov rbx, qword [rbp - 128]
	dec rbx
	mov qword [rbp - 128], rbx
	jmp b168
	b178:
	mov rbx, qword [rbp - 8]
	mov r10, qword [rbp - 72]
	mov qword [rbx + r10 * 8], 0
	mov rbx, qword [rbp - 72]
	dec rbx
	mov qword [rbp - 72], rbx
	jmp b177
	section .data
g_0:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_4:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_3:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_5:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_8:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_6:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_1:
	dq 0
	db 00H
g_2:
	dq 0
	db 00H
g_7:
	dq 18
	db 6EH, 43H, 68H, 75H, 6EH, 6BH, 20H, 3EH, 20H, 4DH, 41H, 58H, 43H, 48H, 55H, 4EH, 4BH, 21H, 00H
g_9:
	dq 0
	db 00H
g_12:
	dq 13
	db 49H, 6EH, 76H, 61H, 6CH, 69H, 64H, 20H, 69H, 6EH, 70H, 75H, 74H, 00H
g_11:
	dq 0
	db 00H
g_10:
	dq 10
	db 4EH, 6FH, 74H, 20H, 46H, 6FH, 75H, 6EH, 64H, 21H, 00H
g_13:
	dq 95
	db 20H, 21H, 22H, 23H, 24H, 25H, 26H, 27H, 28H, 29H, 2AH, 2BH, 2CH, 2DH, 2EH, 2FH, 30H, 31H, 32H, 33H, 34H, 35H, 36H, 37H, 38H, 39H, 3AH, 3BH, 3CH, 3DH, 3EH, 3FH, 40H, 41H, 42H, 43H, 44H, 45H, 46H, 47H, 48H, 49H, 4AH, 4BH, 4CH, 4DH, 4EH, 4FH, 50H, 51H, 52H, 53H, 54H, 55H, 56H, 57H, 58H, 59H, 5AH, 5BH, 5CH, 5DH, 5EH, 5FH, 60H, 61H, 62H, 63H, 64H, 65H, 66H, 67H, 68H, 69H, 6AH, 6BH, 6CH, 6DH, 6EH, 6FH, 70H, 71H, 72H, 73H, 74H, 75H, 76H, 77H, 78H, 79H, 7AH, 7BH, 7CH, 7DH, 7EH, 00H
