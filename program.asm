default rel

global main
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

extern strcmp
extern sprintf
extern strcpy
extern malloc
extern strlen
extern __isoc99_scanf
extern puts
extern printf


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        call    __init
        pop     rbp
        ret


__print:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rax
        mov     edi, L_012
        mov     eax, 0
        call    printf
        leave
        ret


__println:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rdi, rax
        call    puts
        leave
        ret


__getString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     esi, __buffer.2866
        mov     edi, L_012
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, __buffer.2866
        call    strlen
        mov     dword [rbp-0CH], eax
        mov     eax, dword [rbp-0CH]
        add     eax, 8
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     esi, __buffer.2866
        mov     rdi, rax
        call    strcpy
        mov     rax, qword [rbp-8H]
        leave
        ret


__getInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, [rbp-8H]
        mov     rsi, rax
        mov     edi, L_013
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, qword [rbp-8H]
        leave
        ret


__toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     edi, 32
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+8H]
        mov     rax, qword [rbp-18H]
        mov     rdx, rax
        mov     esi, L_013
        mov     rdi, rcx
        mov     eax, 0
        call    sprintf
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
        ret


__string_length:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        mov     rax, qword [rax]
        pop     rbp
        ret


__string_substring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     dword [rbp-1CH], esi
        mov     dword [rbp-20H], edx
        mov     eax, dword [rbp-1CH]
        mov     edx, dword [rbp-20H]
        sub     edx, eax
        mov     eax, edx
        add     eax, 1
        mov     dword [rbp-0CH], eax
        mov     eax, dword [rbp-0CH]
        add     eax, 9
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     eax, dword [rbp-0CH]
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     dword [rbp-10H], 0
        jmp     L_002

L_001:  mov     eax, dword [rbp-10H]
        add     eax, 8
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-1CH]
        lea     ecx, [rax+8H]
        mov     eax, dword [rbp-10H]
        add     eax, ecx
        movsxd  rcx, eax
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-10H], 1
L_002:  mov     eax, dword [rbp-10H]
        cmp     eax, dword [rbp-0CH]
        jl      L_001
        mov     eax, dword [rbp-0CH]
        add     eax, 8
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-8H]
        leave
        ret


__string_parseInt:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-8H], 0
        mov     dword [rbp-0CH], 0
        add     qword [rbp-18H], 8
        mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        cmp     al, 45
        jnz     L_003
        mov     dword [rbp-0CH], 1
        add     qword [rbp-18H], 1
        jmp     L_005

L_003:  jmp     L_005

L_004:  mov     rdx, qword [rbp-8H]
        mov     rax, rdx
        shl     rax, 2
        add     rax, rdx
        add     rax, rax
        mov     rdx, rax
        mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        movsx   eax, al
        sub     eax, 48
        cdqe
        add     rax, rdx
        mov     qword [rbp-8H], rax
        add     qword [rbp-18H], 1
L_005:  mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        test    al, al
        jnz     L_004
        cmp     dword [rbp-0CH], 0
        jz      L_006
        mov     rax, qword [rbp-8H]
        neg     rax
        jmp     L_007

L_006:  mov     rax, qword [rbp-8H]
L_007:  pop     rbp
        ret


__string_ord:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        add     rax, 8
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movsx   rax, al
        pop     rbp
        ret


__stringConcate:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     rax, qword [rbp-28H]
        mov     rax, qword [rax]
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-30H]
        mov     rax, qword [rax]
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-18H]
        add     rax, rdx
        add     rax, 9
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-10H]
        mov     rdx, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        mov     qword [rax], rdx
        mov     dword [rbp-1CH], 0
        jmp     L_009

L_008:  mov     eax, dword [rbp-1CH]
        add     eax, 8
        movsxd  rdx, eax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-1CH]
        add     eax, 8
        movsxd  rcx, eax
        mov     rax, qword [rbp-28H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-1CH], 1
L_009:  mov     eax, dword [rbp-1CH]
        cdqe
        cmp     rax, qword [rbp-18H]
        jl      L_008
        mov     dword [rbp-1CH], 0
        jmp     L_011

L_010:  mov     rax, qword [rbp-18H]
        lea     rdx, [rax+8H]
        mov     eax, dword [rbp-1CH]
        cdqe
        add     rax, rdx
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rdx, rax
        mov     eax, dword [rbp-1CH]
        add     eax, 8
        movsxd  rcx, eax
        mov     rax, qword [rbp-30H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     dword [rbp-1CH], 1
L_011:  mov     eax, dword [rbp-1CH]
        cdqe
        cmp     rax, qword [rbp-10H]
        jl      L_010
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-10H]
        add     rax, rdx
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-8H]
        leave
        ret


__stringCompare:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+8H]
        mov     rax, qword [rbp-8H]
        add     rax, 8
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        cdqe
        leave
        ret



SECTION .data   


SECTION .bss    align=32

__buffer.2866:
        resb    1048576


SECTION .rodata 

L_012:
        db 25H, 73H, 00H

L_013:
        db 25H, 6CH, 64H, 00H


;=====================================================================
	 section .text
_random:
	b0:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov rax, qword [g_0]
	mov rcx, rax
	mov qword [rbp - 32], rcx
	mov rax, qword [rbp - 32]
	mov rcx, qword [g_1]
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
	mov rcx, qword [g_2]
	mov rax, rcx
	mov qword [rbp - 56], rax
	mov rax, qword [rbp - 56]
	mov rcx, qword [rbp - 32]
	push rdx
	imul rcx
	pop rdx
	mov qword [rbp - 56], rax
	mov rax, qword [g_0]
	mov rcx, rax
	mov qword [rbp - 24], rcx
	mov rax, qword [rbp - 24]
	mov rcx, qword [g_1]
	push rdx
	push rcx
	push rax
	push rcx
	pop rcx
	pop rax
	mov rdx, 0
	idiv rcx
	pop rcx
	pop rdx
	mov qword [rbp - 24], rax
	mov rcx, qword [g_3]
	mov rax, rcx
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 48]
	mov rcx, qword [rbp - 24]
	push rdx
	imul rcx
	pop rdx
	mov qword [rbp - 48], rax
	mov rcx, qword [rbp - 56]
	mov rax, rcx
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 40]
	mov rcx, qword [rbp - 48]
	sub rax, rcx
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 40]
	mov rcx, rax
	mov qword [rbp - 8], rcx
	mov rax, qword [rbp - 8]
	cmp rax, 0
	jge b1
	jmp b2
	b1:
	mov rcx, qword [rbp - 8]
	mov rax, rcx
	mov qword [g_0], rax
	jmp b3
	b2:
	mov rcx, qword [rbp - 8]
	mov rax, rcx
	mov qword [rbp - 16], rax
	mov rax, qword [g_4]
	mov rcx, qword [rbp - 16]
	add rcx, rax
	mov qword [rbp - 16], rcx
	mov rcx, qword [rbp - 16]
	mov rax, rcx
	mov qword [g_0], rax
	jmp b3
	b3:
	mov rax, qword [g_0]
	leave
	ret 
_initialize:
	b4:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword [rbp - 8], rdi
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [g_0], rcx
	leave
	ret 
_swap:
	b5:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov qword [rbp - 8], rdi
	mov qword [rbp - 16], rsi
	mov rax, qword [g_5]
	mov rdx, qword [rbp - 8]
	mov rcx, qword [rax + rdx * 8 + 8]
	mov qword [rbp - 24], rcx
	mov rcx, qword [g_5]
	mov rdx, qword [rbp - 16]
	mov rax, qword [rcx + rdx * 8 + 8]
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [g_5]
	mov rdx, qword [rbp - 8]
	mov qword [rcx + rdx * 8 + 8], rax
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 24]
	mov rdx, qword [rbp - 16]
	mov qword [rax + rdx * 8 + 8], rcx
	leave
	ret 
_pd:
	b6:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov qword [rbp - 8], rdi
	jmp b7
	b8:
	mov rax, qword [g_6]
	mov rcx, rax
	mov qword [rbp - 64], rcx
	mov rax, qword [rbp - 64]
	add rax, 1
	mov qword [rbp - 64], rax
	mov rax, qword [g_6]
	mov rcx, rax
	mov qword [rbp - 56], rcx
	mov rax, qword [rbp - 64]
	mov rcx, qword [rbp - 56]
	push rdx
	push rax
	imul rcx
	mov rcx, rax
	mov rax, rcx
	pop rax
	pop rdx
	mov qword [rbp - 56], rcx
	mov rcx, qword [rbp - 56]
	mov rax, rcx
	mov qword [rbp - 40], rax
	mov rax, 2
	mov qword [rbp - 48], rax
	mov rax, qword [rbp - 40]
	mov rcx, qword [rbp - 48]
	push rdx
	push rcx
	push rax
	push rcx
	pop rcx
	pop rax
	mov rdx, 0
	idiv rcx
	pop rcx
	pop rdx
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 40]
	mov rcx, qword [rbp - 8]
	cmp rcx, rax
	je b9
	jmp b10
	b11:
	jmp b12
	b7:
	mov rax, qword [g_6]
	mov rcx, qword [rbp - 8]
	cmp rax, rcx
	jle b8
	jmp b11
	b13:
	mov rax, qword [g_6]
	inc rax
	mov qword [g_6], rax
	jmp b7
	b9:
	jmp b14
	b10:
	jmp b13
	b14:
	mov rax, 1
	mov qword [rbp - 24], rax
	jmp b15
	b16:
	mov rax, 0
	mov qword [rbp - 24], rax
	jmp b15
	b15:
	mov rax, qword [rbp - 24]
	mov rcx, rax
	mov qword [rbp - 16], rcx
	jmp b17
	jmp b10
	b18:
	mov rax, 1
	mov qword [rbp - 32], rax
	jmp b19
	b12:
	mov rax, 0
	mov qword [rbp - 32], rax
	jmp b19
	b19:
	mov rax, qword [rbp - 32]
	mov rcx, rax
	mov qword [rbp - 16], rcx
	jmp b17
	b17:
	mov rax, qword [rbp - 16]
	leave
	ret 
_show:
	b20:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, 0
	mov qword [rbp - 32], rax
	jmp b21
	b22:
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 32]
	mov rdx, qword [rax + rcx * 8 + 8]
	mov qword [rbp - 8], rdx
	mov rdi, qword [rbp - 8]
	call __toString
	mov qword [rbp - 24], rax
	mov rdi, qword [rbp - 24]
	mov rsi, g_7
	call __stringConcate
	mov qword [rbp - 16], rax
	mov rdi, qword [rbp - 16]
	call __print
	jmp b23
	b21:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 32]
	cmp rcx, rax
	jl b22
	jmp b24
	b23:
	mov rax, qword [rbp - 32]
	inc rax
	mov qword [rbp - 32], rax
	jmp b21
	b24:
	mov rdi, g_9
	call __println
	leave
	ret 
_win:
	b25:
	push rbp
	mov rbp, rsp
	sub rsp, 144
	mov rax, 100
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 88]
	mov rcx, qword [rbp - 120]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 120], rcx
	mov rdi, qword [rbp - 120]
	call malloc
	mov qword [rbp - 40], rax
	mov rax, qword [rbp - 88]
	mov rcx, qword [rbp - 40]
	mov qword [rcx], rax
	jmp b26
	b26:
	mov rax, qword [rbp - 88]
	cmp rax, 0
	jg b27
	jmp b28
	b27:
	mov rax, qword [rbp - 88]
	mov rcx, qword [rbp - 40]
	mov qword [rcx + rax * 8], 0
	mov rax, qword [rbp - 88]
	dec rax
	mov qword [rbp - 88], rax
	jmp b26
	b28:
	mov rax, qword [rbp - 40]
	mov rcx, rax
	mov qword [rbp - 96], rcx
	mov rax, qword [g_6]
	mov rcx, qword [g_8]
	cmp rcx, rax
	jne b29
	jmp b30
	b29:
	jmp b31
	b30:
	mov rax, 0
	mov qword [rbp - 24], rax
	jmp b32
	b33:
	mov rax, 1
	mov qword [rbp - 72], rax
	jmp b34
	b31:
	mov rax, 0
	mov qword [rbp - 72], rax
	jmp b34
	b34:
	mov rcx, qword [rbp - 72]
	mov rax, rcx
	mov qword [rbp - 48], rax
	jmp b35
	jmp b30
	b36:
	mov rax, qword [g_5]
	mov rdx, qword [rbp - 24]
	mov rcx, qword [rax + rdx * 8 + 8]
	mov qword [rbp - 56], rcx
	mov rax, qword [rbp - 56]
	mov rcx, qword [rbp - 96]
	mov rdx, qword [rbp - 24]
	mov qword [rcx + rdx * 8 + 8], rax
	jmp b37
	b38:
	mov rax, 0
	mov qword [rbp - 112], rax
	jmp b39
	b32:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 24]
	cmp rcx, rax
	jl b36
	jmp b38
	b37:
	mov rax, qword [rbp - 24]
	inc rax
	mov qword [rbp - 24], rax
	jmp b32
	b40:
	mov rax, qword [rbp - 112]
	mov rcx, rax
	mov qword [rbp - 8], rcx
	mov rax, qword [rbp - 8]
	add rax, 1
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 24], rcx
	jmp b41
	b42:
	mov rax, 0
	mov qword [rbp - 112], rax
	jmp b43
	b39:
	mov rcx, qword [g_8]
	mov rax, rcx
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 64]
	sub rax, 1
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 64]
	mov rcx, qword [rbp - 112]
	cmp rcx, rax
	jl b40
	jmp b42
	b44:
	mov rax, qword [rbp - 112]
	inc rax
	mov qword [rbp - 112], rax
	jmp b39
	b45:
	mov rcx, qword [rbp - 112]
	mov rdx, qword [rbp - 96]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 104]
	mov rcx, qword [rbp - 96]
	mov rdx, qword [rbp - 24]
	cmp rax, qword [rcx + rdx * 8 + 8]
	jg b46
	jmp b47
	b48:
	jmp b44
	b41:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 24]
	cmp rcx, rax
	jl b45
	jmp b48
	b49:
	mov rax, qword [rbp - 24]
	inc rax
	mov qword [rbp - 24], rax
	jmp b41
	b46:
	mov rcx, qword [rbp - 112]
	mov rdx, qword [rbp - 96]
	mov rax, qword [rdx + rcx * 8 + 8]
	mov qword [rbp - 136], rax
	mov rcx, qword [rbp - 96]
	mov rdx, qword [rbp - 24]
	mov rax, qword [rcx + rdx * 8 + 8]
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rbp - 112]
	mov rdx, qword [rbp - 96]
	mov qword [rdx + rcx * 8 + 8], rax
	mov rax, qword [rbp - 136]
	mov rcx, qword [rbp - 96]
	mov rdx, qword [rbp - 24]
	mov qword [rcx + rdx * 8 + 8], rax
	jmp b47
	b47:
	jmp b49
	b50:
	mov rax, qword [rbp - 112]
	mov rcx, rax
	mov qword [rbp - 16], rcx
	mov rax, qword [rbp - 16]
	add rax, 1
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 112]
	mov rcx, qword [rbp - 16]
	mov rdx, qword [rbp - 96]
	cmp qword [rdx + rax * 8 + 8], rcx
	jne b51
	jmp b52
	b53:
	jmp b54
	b43:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 112]
	cmp rcx, rax
	jl b50
	jmp b53
	b55:
	mov rax, qword [rbp - 112]
	inc rax
	mov qword [rbp - 112], rax
	jmp b43
	b51:
	jmp b56
	b52:
	jmp b55
	b57:
	mov rax, 1
	mov qword [rbp - 128], rax
	jmp b58
	b56:
	mov rax, 0
	mov qword [rbp - 128], rax
	jmp b58
	b58:
	mov rcx, qword [rbp - 128]
	mov rax, rcx
	mov qword [rbp - 48], rax
	jmp b35
	jmp b52
	b54:
	mov rax, 1
	mov qword [rbp - 80], rax
	jmp b59
	b60:
	mov rax, 0
	mov qword [rbp - 80], rax
	jmp b59
	b59:
	mov rcx, qword [rbp - 80]
	mov rax, rcx
	mov qword [rbp - 48], rax
	jmp b35
	b35:
	mov rax, qword [rbp - 48]
	leave
	ret 
_merge:
	b61:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, 0
	mov qword [rbp - 24], rax
	jmp b62
	b63:
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 24]
	cmp qword [rax + rcx * 8 + 8], 0
	je b64
	jmp b65
	b66:
	mov rax, 0
	mov qword [rbp - 24], rax
	jmp b67
	b62:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 24]
	cmp rcx, rax
	jl b63
	jmp b66
	b68:
	mov rax, qword [rbp - 24]
	inc rax
	mov qword [rbp - 24], rax
	jmp b62
	b64:
	mov rcx, qword [rbp - 24]
	mov rax, rcx
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	add rax, 1
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	mov rcx, rax
	mov qword [rbp - 16], rcx
	jmp b69
	b65:
	jmp b68
	b70:
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 16]
	cmp qword [rax + rcx * 8 + 8], 0
	jne b71
	jmp b72
	b73:
	jmp b65
	b69:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 16]
	cmp rcx, rax
	jl b70
	jmp b73
	b74:
	mov rax, qword [rbp - 16]
	inc rax
	mov qword [rbp - 16], rax
	jmp b69
	b71:
	mov rdi, qword [rbp - 24]
	mov rsi, qword [rbp - 16]
	call _swap
	jmp b73
	jmp b72
	b72:
	jmp b74
	b75:
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 24]
	cmp qword [rax + rcx * 8 + 8], 0
	je b76
	jmp b77
	b67:
	mov rax, qword [g_8]
	mov rcx, qword [rbp - 24]
	cmp rcx, rax
	jl b75
	jmp b78
	b79:
	mov rax, qword [rbp - 24]
	inc rax
	mov qword [rbp - 24], rax
	jmp b67
	b76:
	mov rcx, qword [rbp - 24]
	mov rax, rcx
	mov qword [g_8], rax
	jmp b78
	jmp b77
	b77:
	jmp b79
	b78:
	leave
	ret 
_move:
	b80:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, 0
	mov qword [rbp - 16], rax
	jmp b81
	b82:
	mov rax, qword [rbp - 16]
	mov rcx, qword [g_5]
	dec qword [rcx + rax * 8 + 8]
	mov rax, qword [rbp - 16]
	mov rcx, rax
	mov qword [rbp - 24], rcx
	mov rax, qword [rbp - 24]
	add rax, 1
	mov qword [rbp - 24], rax
	mov rcx, qword [rbp - 24]
	mov rax, rcx
	mov qword [rbp - 16], rax
	jmp b81
	b81:
	mov rax, qword [rbp - 16]
	mov rcx, qword [g_8]
	cmp rax, rcx
	jl b82
	jmp b83
	b83:
	mov rax, qword [g_8]
	mov rcx, qword [g_5]
	mov qword [rcx + rax * 8 + 8], rax
	mov rax, qword [g_8]
	mov rcx, rax
	mov qword [rbp - 8], rcx
	mov rax, qword [g_8]
	inc rax
	mov qword [g_8], rax
	leave
	ret 
_main:
	b84:
	push rbp
	mov rbp, rsp
	sub rsp, 320
	mov rax, 0
	mov qword [rbp - 40], rax
	mov rax, 0
	mov qword [rbp - 72], rax
	mov rax, 0
	mov qword [rbp - 8], rax
	mov rax, 3
	mov qword [rbp - 160], rax
	mov rax, 7
	mov qword [rbp - 232], rax
	mov rax, qword [rbp - 160]
	mov rcx, qword [rbp - 232]
	push rdx
	imul rcx
	pop rdx
	mov qword [rbp - 160], rax
	mov rax, qword [rbp - 160]
	mov rcx, rax
	mov qword [rbp - 56], rcx
	mov rax, 10
	mov qword [rbp - 184], rax
	mov rax, qword [rbp - 184]
	mov rcx, qword [rbp - 56]
	push rdx
	push rax
	imul rcx
	mov rcx, rax
	mov rax, rcx
	pop rax
	pop rdx
	mov qword [rbp - 56], rcx
	mov rax, qword [rbp - 56]
	mov rcx, rax
	mov qword [g_10], rcx
	mov rax, 0
	mov qword [g_6], rax
	mov rax, 100
	mov qword [rbp - 24], rax
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 208]
	lea rcx, [rax * 8 + 8]
	mov qword [rbp - 208], rcx
	mov rdi, qword [rbp - 208]
	call malloc
	mov qword [rbp - 256], rax
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 256]
	mov qword [rcx], rax
	jmp b85
	b85:
	mov rax, qword [rbp - 24]
	cmp rax, 0
	jg b86
	jmp b87
	b86:
	mov rax, qword [rbp - 24]
	mov rcx, qword [rbp - 256]
	mov qword [rcx + rax * 8], 0
	mov rax, qword [rbp - 24]
	dec rax
	mov qword [rbp - 24], rax
	jmp b85
	b87:
	mov rcx, qword [rbp - 256]
	mov rax, rcx
	mov qword [g_5], rax
	mov rax, qword [g_4]
	mov rcx, rax
	mov qword [rbp - 136], rcx
	mov rax, qword [rbp - 136]
	mov rcx, qword [g_2]
	push rdx
	push rcx
	push rax
	push rcx
	pop rcx
	pop rax
	mov rdx, 0
	idiv rcx
	pop rcx
	pop rdx
	mov qword [rbp - 136], rax
	mov rax, qword [rbp - 136]
	mov rcx, rax
	mov qword [g_1], rcx
	mov rax, qword [g_4]
	mov rcx, rax
	mov qword [rbp - 80], rcx
	mov rax, qword [rbp - 80]
	mov rcx, qword [g_2]
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
	mov qword [rbp - 80], rax
	mov rcx, qword [rbp - 80]
	mov rax, rcx
	mov qword [g_3], rax
	mov rdi, qword [g_10]
	call _pd
	mov qword [rbp - 312], rax
	mov rax, qword [rbp - 312]
	cmp rax, 0
	jne b88
	jmp b89
	b89:
	mov rdi, g_11
	call __println
	mov rax, 1
	mov qword [rbp - 240], rax
	jmp b90
	jmp b88
	b88:
	mov rdi, g_12
	call __println
	mov rdi, 3654898
	call _initialize
	call _random
	mov qword [rbp - 88], rax
	mov rax, qword [rbp - 88]
	mov rcx, rax
	mov qword [rbp - 168], rcx
	mov rax, 10
	mov qword [rbp - 264], rax
	mov rax, qword [rbp - 264]
	mov rcx, qword [rbp - 168]
	push rdx
	push rax
	push rcx
	push rax
	pop rcx
	pop rax
	mov rdx, 0
	idiv rcx
	mov rcx, rdx
	pop rax
	pop rdx
	mov qword [rbp - 168], rcx
	mov rcx, qword [rbp - 168]
	mov rax, rcx
	mov qword [rbp - 216], rax
	mov rax, qword [rbp - 216]
	add rax, 1
	mov qword [rbp - 216], rax
	mov rcx, qword [rbp - 216]
	mov rax, rcx
	mov qword [g_8], rax
	mov rdi, qword [g_8]
	call __toString
	mov qword [rbp - 120], rax
	mov rdi, qword [rbp - 120]
	call __println
	jmp b91
	b92:
	call _random
	mov qword [rbp - 224], rax
	mov rcx, qword [rbp - 224]
	mov rax, rcx
	mov qword [rbp - 272], rax
	mov rax, 10
	mov qword [rbp - 96], rax
	mov rax, qword [rbp - 96]
	mov rcx, qword [rbp - 272]
	push rdx
	push rax
	push rcx
	push rax
	pop rcx
	pop rax
	mov rdx, 0
	idiv rcx
	mov rcx, rdx
	pop rax
	pop rdx
	mov qword [rbp - 272], rcx
	mov rax, qword [rbp - 272]
	mov rcx, rax
	mov qword [rbp - 296], rcx
	mov rax, qword [rbp - 296]
	add rax, 1
	mov qword [rbp - 296], rax
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 296]
	mov rdx, qword [rbp - 40]
	mov qword [rax + rdx * 8 + 8], rcx
	jmp b93
	b94:
	mov rax, qword [g_8]
	mov rcx, rax
	mov qword [rbp - 128], rcx
	mov rax, qword [rbp - 128]
	sub rax, 1
	mov qword [rbp - 128], rax
	mov rcx, qword [g_10]
	mov rax, rcx
	mov qword [rbp - 16], rax
	mov rax, qword [rbp - 72]
	mov rcx, qword [rbp - 16]
	sub rcx, rax
	mov qword [rbp - 16], rcx
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 128]
	mov rdx, qword [rbp - 16]
	mov qword [rax + rcx * 8 + 8], rdx
	call _show
	call _merge
	jmp b95
	b91:
	mov rcx, qword [g_8]
	mov rax, rcx
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	sub rax, 1
	mov qword [rbp - 32], rax
	mov rax, qword [rbp - 32]
	mov rcx, qword [rbp - 40]
	cmp rcx, rax
	jl b92
	jmp b94
	b96:
	mov rax, qword [rbp - 40]
	inc rax
	mov qword [rbp - 40], rax
	jmp b91
	b93:
	mov rcx, qword [g_5]
	mov rdx, qword [rbp - 40]
	mov rax, qword [rcx + rdx * 8 + 8]
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 104]
	mov rcx, qword [rbp - 72]
	add rax, rcx
	mov qword [rbp - 104], rax
	mov rax, qword [rbp - 104]
	mov rcx, qword [g_10]
	cmp rax, rcx
	jg b97
	jmp b98
	b97:
	call _random
	mov qword [rbp - 304], rax
	mov rcx, qword [rbp - 304]
	mov rax, rcx
	mov qword [rbp - 144], rax
	mov rax, 10
	mov qword [rbp - 64], rax
	mov rax, qword [rbp - 144]
	mov rcx, qword [rbp - 64]
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
	mov qword [rbp - 144], rax
	mov rax, qword [rbp - 144]
	mov rcx, rax
	mov qword [rbp - 248], rcx
	mov rax, qword [rbp - 248]
	add rax, 1
	mov qword [rbp - 248], rax
	mov rax, qword [rbp - 248]
	mov rcx, qword [g_5]
	mov rdx, qword [rbp - 40]
	mov qword [rcx + rdx * 8 + 8], rax
	jmp b93
	b98:
	mov rax, qword [rbp - 72]
	mov rcx, rax
	mov qword [rbp - 288], rcx
	mov rax, qword [g_5]
	mov rcx, qword [rbp - 288]
	mov rdx, qword [rbp - 40]
	add rcx, qword [rax + rdx * 8 + 8]
	mov qword [rbp - 288], rcx
	mov rcx, qword [rbp - 288]
	mov rax, rcx
	mov qword [rbp - 72], rax
	jmp b96
	b95:
	call _win
	mov qword [rbp - 152], rax
	mov rax, qword [rbp - 152]
	cmp rax, 0
	jne b99
	jmp b100
	b100:
	mov rax, qword [rbp - 8]
	inc rax
	mov qword [rbp - 8], rax
	mov rdi, qword [rbp - 8]
	call __toString
	mov qword [rbp - 192], rax
	mov rdi, g_13
	mov rsi, qword [rbp - 192]
	call __stringConcate
	mov qword [rbp - 48], rax
	mov rdi, qword [rbp - 48]
	mov rsi, g_14
	call __stringConcate
	mov qword [rbp - 280], rax
	mov rdi, qword [rbp - 280]
	call __println
	call _move
	call _merge
	call _show
	jmp b95
	b99:
	mov rdi, qword [rbp - 8]
	call __toString
	mov qword [rbp - 112], rax
	mov rdi, g_15
	mov rsi, qword [rbp - 112]
	call __stringConcate
	mov qword [rbp - 200], rax
	mov rdi, qword [rbp - 200]
	mov rsi, g_16
	call __stringConcate
	mov qword [rbp - 176], rax
	mov rdi, qword [rbp - 176]
	call __println
	mov rax, 0
	mov qword [rbp - 240], rax
	jmp b90
	b90:
	mov rax, qword [rbp - 240]
	leave
	ret 
__init:
	b101:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov qword [g_2], 48271
	mov qword [g_4], 2147483647
	mov qword [g_0], 1
	call _main
	mov qword [rbp - 8], rax
	mov rax, qword [rbp - 8]
	leave
	ret 
	section .data
g_10:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_6:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_8:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_5:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_2:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_4:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_1:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_3:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_0:
	db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
g_7:
	dq 1
	db 20H, 00H
g_9:
	dq 0
	db 00H
g_11:
	dq 79
	db 53H, 6FH, 72H, 72H, 79H, 2CH, 20H, 74H, 68H, 65H, 20H, 6EH, 75H, 6DH, 62H, 65H, 72H, 20H, 6EH, 20H, 6DH, 75H, 73H, 74H, 20H, 62H, 65H, 20H, 61H, 20H, 6EH, 75H, 6DH, 62H, 65H, 72H, 20H, 73H, 2EH, 74H, 2EH, 20H, 74H, 68H, 65H, 72H, 65H, 20H, 65H, 78H, 69H, 73H, 74H, 73H, 20H, 69H, 20H, 73H, 61H, 74H, 69H, 73H, 66H, 79H, 69H, 6EH, 67H, 20H, 6EH, 3DH, 31H, 2BH, 32H, 2BH, 2EH, 2EH, 2EH, 2BH, 69H, 00H
g_12:
	dq 12
	db 4CH, 65H, 74H, 27H, 73H, 20H, 73H, 74H, 61H, 72H, 74H, 21H, 00H
g_13:
	dq 5
	db 73H, 74H, 65H, 70H, 20H, 00H
g_14:
	dq 1
	db 3AH, 00H
g_15:
	dq 7
	db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 00H
g_16:
	dq 8
	db 20H, 73H, 74H, 65H, 70H, 28H, 73H, 29H, 00H
