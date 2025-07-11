	.file	"read2floats.c"
	.comm	f1,4,4
	.comm	f2,4,4
	.comm	f3,4,4
	.section	.rodata
.LC0:
	.string	"entre com um float:"
.LC1:
	.string	"%f"
.LC2:
	.string	"a soma eh: %f\n"
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
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$f1, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$f2, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movss	f1(%rip), %xmm1
	movss	f2(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, f3(%rip)
	movss	f3(%rip), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
