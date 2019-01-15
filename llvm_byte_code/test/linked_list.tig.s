	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movq	$0, 24(%rsp)
	movl	$16, %edi
	callq	malloc
	movl	$3, (%rax)
	movq	$0, 8(%rax)
	movq	%rax, 8(%rsp)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$2, (%rbx)
	movq	$0, 8(%rbx)
	movq	%rbx, 16(%rsp)
	movl	$16, %edi
	callq	malloc
	movl	$1, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 32(%rsp)
	movq	%rax, (%rsp)
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	(%rsp), %rdi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	(%rsp), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	movq	(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, (%rsp)
.LBB0_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rdi
	callq	tig_nillable
	testl	%eax, %eax
	je	.LBB0_2
# %bb.3:                                # %end
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"end program"
	.size	.L__unnamed_1, 12


	.section	".note.GNU-stack","",@progbits
