	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsp, %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	fib
	movl	%eax, %r14d
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	fib
	movl	%eax, %ebp
	movl	$5, %esi
	movq	%rbx, %rdi
	callq	fib
	movl	%eax, %r15d
	movl	$14, %esi
	movq	%rbx, %rdi
	callq	fib
	movl	%eax, %r12d
	movl	$30, %esi
	movq	%rbx, %rdi
	callq	fib
	movl	%eax, %r13d
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movl	%r14d, %esi
	callq	assert_int
	movl	$1, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	assert_int
	movl	$9, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	assert_int
	movl	$377, %edx              # imm = 0x179
	movq	%rbx, %rdi
	movl	%r12d, %esi
	callq	assert_int
	movl	$832040, %edx           # imm = 0xCB228
	movq	%rbx, %rdi
	movl	%r13d, %esi
	callq	assert_int
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	fib                     # -- Begin function fib
	.p2align	4, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebx
	movq	%rdi, (%rsp)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.LBB1_3
# %bb.1:                                # %test2
	cmpl	$1, %ebx
	movl	$1, %eax
	je	.LBB1_3
# %bb.2:                                # %else4
	leal	-1(%rbx), %esi
	movq	(%rsp), %rdi
	callq	fib
	movl	%eax, %ebp
	addl	$-2, %ebx
	movq	(%rsp), %rdi
	movl	%ebx, %esi
	callq	fib
	addl	%ebp, %eax
.LBB1_3:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	fib, .Lfunc_end1-fib
	.cfi_endproc
                                        # -- End function
	.globl	assert_int              # -- Begin function assert_int
	.p2align	4, 0x90
	.type	assert_int,@function
assert_int:                             # @assert_int
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebx
	movl	%esi, %ebp
	movq	%rdi, (%rsp)
	xorl	%edi, %edi
	cmpl	%ebx, %ebp
	sete	%dil
	callq	tig_not
	cmpl	$1, %eax
	jne	.LBB2_2
# %bb.1:                                # %then
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movl	%ebp, %edi
	callq	tig_print_int
	movl	$.L__unnamed_4, %edi
	callq	tig_print
	movl	%ebx, %edi
	callq	tig_print_int
	movl	$1, %edi
	callq	tig_exit
.LBB2_2:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	assert_int, .Lfunc_end2-assert_int
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_2,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_2:
	.asciz	"Test file: fig.tig"
	.size	.L__unnamed_2, 19

	.type	.L__unnamed_3,@object   # @1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_3:
	.asciz	"Expect"
	.size	.L__unnamed_3, 7

	.type	.L__unnamed_4,@object   # @2
.L__unnamed_4:
	.asciz	"To equal"
	.size	.L__unnamed_4, 9

	.type	.L__unnamed_1,@object   # @3
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_1:
	.asciz	"fib.tig: Passed!"
	.size	.L__unnamed_1, 17


	.section	".note.GNU-stack","",@progbits
