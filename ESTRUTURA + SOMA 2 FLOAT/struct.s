	.file	"struct.c"
	.globl	emp
	.data
	.align 32
	.type	emp, @object
	.size	emp, 76
emp:
	.long	1232348160
	.string	"Dr Milionario"
	.zero	50
	.long	100
	.byte	109
	.zero	3
	.section	.rodata
.LC0:
	.string	"%f\n"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"%c\n"
.LC3:
	.string	"Entre com o novo sal\303\241rio:"
.LC4:
	.string	"%f"
.LC5:
	.string	"Entre com o novo nome:"
.LC6:
	.string	"%s"
.LC7:
	.string	"Entre com a nova idade:"
.LC8:
	.string	"%d"
.LC9:
	.string	"Novos valores:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	emp(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC0, %edi
	movl	$1, %eax
	call	printf
	movl	$emp+4, %edi
	call	puts
	movl	emp+68(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movzbl	emp+72(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$emp, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$emp+4, %esi
	movl	$.LC6, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	movl	$emp+68, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC9, %edi
	call	puts
	movss	emp(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC0, %edi
	movl	$1, %eax
	call	printf
	movl	$emp+4, %edi
	call	puts
	movl	emp+68(%rip), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movzbl	emp+72(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
