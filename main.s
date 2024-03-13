	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%4d"
.LC1:
	.string	"%4d "
	.text
	.p2align 4
	.globl	printMatrixByRow
	.type	printMatrixByRow, @function
printMatrixByRow:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 24(%rsp)
	movl	%esi, 20(%rsp)
	testl	%esi, %esi
	je	.L3
	movl	20(%rsp), %ebp
	movl	$0, 16(%rsp)
	leaq	.LC1(%rip), %r13
	leaq	.LC0(%rip), %r15
	movl	$0, 12(%rsp)
	leal	-1(%rbp), %r12d
	.p2align 4,,10
	.p2align 3
.L2:
	movl	16(%rsp), %eax
	movq	24(%rsp), %rcx
	xorl	%r14d, %r14d
	leaq	(%rcx,%rax), %rbx
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	%r14, %rbp
	je	.L11
.L6:
	movsbl	(%rbx,%r14), %edx
	cmpl	%r14d, %r12d
	jne	.L4
	movq	%r15, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	%r14, %rbp
	jne	.L6
.L11:
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, 12(%rsp)
	movl	20(%rsp), %esi
	movl	12(%rsp), %eax
	addl	%esi, 16(%rsp)
	cmpl	%esi, %eax
	jne	.L2
.L3:
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.cfi_endproc
.LFE24:
	.size	printMatrixByRow, .-printMatrixByRow
	.section	.rodata.str1.1
.LC2:
	.string	"Matrix A: "
.LC3:
	.string	"Copy A to C"
.LC4:
	.string	"\nMatrix C: "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"Rotating the matrix C by 90 degrees clockwise: "
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC2(%rip), %rdi
	leaq	A(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	C(%rip), %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	puts@PLT
	movl	$4, %esi
	movq	%r12, %rdi
	call	printMatrixByRow
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$4, %edx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	copy@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$4, %esi
	movq	%rbp, %rdi
	call	printMatrixByRow
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	movl	$4, %esi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	printMatrixByRow
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	C
	.bss
	.align 16
	.type	C, @object
	.size	C, 16
C:
	.zero	16
	.globl	A
	.data
	.align 16
	.type	A, @object
	.size	A, 16
A:
	.ascii	"\001\376\003\374"
	.ascii	"\373\006\371\b"
	.ascii	"\377\002\375\004"
	.ascii	"\005\372\007\370"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
