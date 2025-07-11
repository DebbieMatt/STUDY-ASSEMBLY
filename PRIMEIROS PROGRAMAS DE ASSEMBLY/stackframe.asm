section .data



section .code
global main
main_a equ 12
main_b equ 8
main_c equ 4
main:
       push 	rbp
	mov  	rbp, rsp
	sub 	rsp, 16
	mov	[rbp-main_a], 2 ; a = 2
	mov	[rbp-main_b], 3 ; b = 3
	mov	edx, [rbp-main_b]
	mov	eax,[rbp-main_a]
	mov	esi, edx
        mov 	edi, eax
	call	func1
	mov 	[rbp-main_c], eax
        mov 	eax, [rbp-main_c]
	leave
	ret

func1_copy_a equ 20
func1_copy_b equ 24
func1_c      equ 8
func1_d      equ 4
func1:
	push 	rbp
        mov     rbp, rsp, 

	sub    rsp,32
	movl	 [rbp-func1_copy_a],edi
	movl	 [rbp-func1_copy_b],esi
	movl	edx, [rbp-func1_copy_a]
	movl	eax, [rbp-func1_copy_b]
	addl	eax, edx
	movl	 [rbp-func1_c], eax
	movl	  eax,[rbp-func1_c]
	movl	edi, eax
	call	func2
	movl	 [rbp-func1_d], eax
	movl	 edx, [rbp-func1_c]
	movl	 eax, [rbp-func1_d]
	addl	eax, edx
	leave
	ret
	
    