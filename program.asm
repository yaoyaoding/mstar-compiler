





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
_getHash:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword [rbp - 8], rdi
	mov rcx, qword [rbp - 8]
	mov rax, rcx
	mov qword [rbp - 16], rax
	mov rax, 237
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 16]
	push rdx
	push rax
	imul rcx
	mov rcx, rax
	mov rax, rcx
	pop rax
	pop rdx
	mov qword [rbp - 16], rcx
	mov rax, qword [rbp - 16]
	mov rcx, rax
	mov qword [rbp - 32], rcx
	mov rax, qword [rbp - 32]
	mov rcx, qword [g_0]
	push rdx
	push rcx
	push rax
	push rcx
	pop rcx
	pop rax
	mov rdx, 0
	idiv rcx
	mov rax, rdx
	pop rcx
	pop rdx
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	leave
	ret 
_put:
	b1:
	push rbp
	mov rbp, rsp
	sub rsp, 160
	mov qword [rbp - 8], rdi
	mov qword [rbp - 16], rsi
	mov rax, 0
	mov qword [rbp - 96], rax
	mov rdi, qword [rbp - 8]
	call _getHash
	mov qword [rbp - 120], rax
	mov rax, qword [rbp - 120]
	mov rcx, rax
	mov qword [rbp - 72], rcx
	mov rax, qword [rbp - 72]
	mov rcx, qword [g_1]
	cmp qword [rcx + rax * 8 + 8], 0
	je b2
	jmp b3
	b2:
	mov rdi, 24
	call malloc
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 48]
	mov rcx, qword [rbp - 72]
	mov rdx, qword [g_1]
	mov qword [rdx + rcx * 8 + 8], rax
	mov rax, qword [rbp - 72]
	mov rdx, qword [g_1]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 80], rcx
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 80]
	mov qword [rcx], rax
	mov rax, qword [rbp - 72]
	mov rdx, qword [g_1]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 128], rcx
	mov rax, qword [rbp - 128]
	mov rcx, qword [rbp - 16]
	mov qword [rax + 8], rcx
	mov rcx, qword [rbp - 72]
	mov rdx, qword [g_1]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 112], rax
	mov rax, qword [rbp - 112]
	mov qword [rax + 16], 0
	jmp b4
	jmp b3
	b3:
	mov rax, qword [rbp - 72]
	mov rdx, qword [g_1]
	mov rcx, qword [rdx + rax * 8 + 8]
	mov qword [rbp - 96], rcx
	jmp b5
	b5:
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 152]
	mov rcx, qword [rbp - 8]
	cmp qword [rax], rcx
	jne b6
	jmp b7
	b6:
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 64]
	cmp qword [rax + 16], 0
	je b8
	jmp b9
	b7:
	mov rax, qword [rbp - 96]
	mov rcx, rax
	mov qword [rbp - 144], rcx
	mov rax, qword [rbp - 144]
	mov rcx, qword [rbp - 16]
	mov qword [rax + 8], rcx
	jmp b4
	b8:
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 136], rax
	mov rdi, 24
	call malloc
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 56]
	mov rcx, qword [rbp - 136]
	mov qword [rcx + 16], rax
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 104]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 24], rcx
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 8]
	mov qword [rax], rcx
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 88], rcx
	mov rax, qword [rbp - 88]
	mov qword [rax + 16], 0
	jmp b9
	b9:
	mov rcx, qword [rbp - 96]
	mov rax, rcx
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 40]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 96], rcx
	jmp b5
	b4:
	leave
	ret 
_get:
	b10:
	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov qword [rbp - 8], rdi
	mov rax, 0
	mov qword [rbp - 24], rax
	mov rdi, qword [rbp - 8]
	call _getHash
	mov qword [rbp - 40], rax
	mov rcx, qword [rbp - 40]
	mov rdx, qword [g_1]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 24], rax
	jmp b11
	b11:
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 16], rcx
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 8]
	cmp qword [rax], rcx
	jne b12
	jmp b13
	b12:
	mov rcx, qword [rbp - 24]
	mov rax, rcx
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rax + 16]
	mov qword [rbp - 24], rcx
	jmp b11
	b13:
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 48], rcx
	mov rax, qword [rbp - 48]
	mov rax, qword [rax + 8]
	leave
	ret 
_main:
	b14:
	push rbp
	mov rbp, rsp
	sub rsp, 112
	mov rax, 100
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rbp - 8]
	lea rax, [rcx * 8 + 8]
	mov qword [rbp - 32], rax
	mov rdi, qword [rbp - 32]
	call malloc
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 8]
	mov rcx, qword [rbp - 64]
	mov qword [rcx], rax
	jmp b15
	b15:
	mov rax, qword [rbp - 8]
	cmp rax, 0
	jg b16
	jmp b17
	b16:
	mov rdi, 8
	call malloc
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 16]
	mov qword [rax], 0
	mov rax, qword [rbp - 16]
	mov rcx, qword [rbp - 8]
	mov rdx, qword [rbp - 64]
	mov qword [rdx + rcx * 8], rax
	mov rax, qword [rbp - 8]
	dec rax
	mov qword [rbp - 8], rax
	jmp b15
	b17:
	mov rax, qword [rbp - 64]
	mov rcx, rax
	mov qword [g_1], rcx
	mov rax, 0
	mov qword [rbp - 48], rax
	jmp b18
	b19:
	mov rax, qword [rbp - 48]
	mov rcx, qword [g_1]
	mov qword [rcx + rax * 8 + 8], 0
	jmp b20
	b21:
	mov rax, 0
	mov qword [rbp - 48], rax
	jmp b22
	b18:
	mov rax, qword [rbp - 48]
	mov rcx, qword [g_0]
	cmp rax, rcx
	jl b19
	jmp b21
	b20:
	mov rax, qword [rbp - 48]
	mov rcx, rax
	mov qword [rbp - 24], rcx
	mov rax, qword [rbp - 48]
	inc rax
	mov qword [rbp - 48], rax
	jmp b18
	b23:
	mov rdi, qword [rbp - 48]
	mov rsi, qword [rbp - 48]
	call _put
	jmp b24
	b25:
	mov rax, 0
	mov qword [rbp - 48], rax
	jmp b26
	b22:
	mov rax, qword [rbp - 48]
	cmp rax, 1000
	jl b23
	jmp b25
	b24:
	mov rax, qword [rbp - 48]
	mov rcx, rax
	mov qword [rbp - 72], rcx
	mov rax, qword [rbp - 48]
	inc rax
	mov qword [rbp - 48], rax
	jmp b22
	b27:
	mov rdi, qword [rbp - 48]
	call __toString
	mov qword [rbp - 88], rax
	mov rdi, qword [rbp - 88]
	mov rsi, g_2
	call __stringConcate
	mov qword [rbp - 56], rax
	mov rdi, qword [rbp - 48]
	call _get
	mov qword [rbp - 80], rax
	mov rdi, qword [rbp - 80]
	call __toString
	mov qword [rbp - 40], rax
	mov rdi, qword [rbp - 56]
	mov rsi, qword [rbp - 40]
	call __stringConcate
	mov qword [rbp - 104], rax
	mov rdi, qword [rbp - 104]
	call __println
	jmp b28
	b26:
	mov rax, qword [rbp - 48]
	cmp rax, 1000
	jl b27
	jmp b29
	b28:
	mov rcx, qword [rbp - 48]
	mov rax, rcx
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 48]
	inc rax
	mov qword [rbp - 48], rax
	jmp b26
	b29:
	mov rax, 0
	leave
	ret 
__init:
	b30:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword [g_0], 100
	call _main
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	leave
	ret 
	section .data
g_0:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_1:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_2:
	dq 1
	db 20H, 00H
