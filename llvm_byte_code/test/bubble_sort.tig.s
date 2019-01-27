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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	leaq	32(%rsp), %rbx
	movq	%rbx, %rdi
	callq	create_array
	movq	%rax, 16(%rsp)
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	bubble_sort
	movq	16(%rsp), %rdi
	callq	tig_array_length
	movl	$0, 12(%rsp)
	movq	16(%rsp), %rdi
	callq	tig_array_length
	decl	%eax
	movl	%eax, 28(%rsp)
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_4:                                # %continue
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	tig_print_int
	incl	12(%rsp)
.LBB0_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movl	28(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB0_5
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	16(%rsp), %rbx
	movl	12(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB0_4
# %bb.3:                                # %error
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
	jmp	.LBB0_4
.LBB0_5:                                # %end
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	create_array            # -- Begin function create_array
	.p2align	4, 0x90
	.type	create_array,@function
create_array:                           # @create_array
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$40, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 32(%rsp)
	movl	$8, 16(%rsp)
	movl	$8, %ebp
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$0, 12(%rsp)
	cmpl	%ebp, 12(%rsp)
	jge	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	12(%rsp), %rax
	movl	$1, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 12(%rsp)
	cmpl	%ebp, 12(%rsp)
	jl	.LBB1_2
.LBB1_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 24(%rsp)
	movl	$0, 8(%rsp)
	movl	16(%rsp), %eax
	decl	%eax
	movl	%eax, 20(%rsp)
	jmp	.LBB1_4
	.p2align	4, 0x90
.LBB1_7:                                # %continue
                                        #   in Loop: Header=BB1_4 Depth=1
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	16(%rsp), %edx
	subl	8(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	incl	8(%rsp)
.LBB1_4:                                # %test10
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB1_8
# %bb.5:                                # %loop11
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	8(%rsp), %ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB1_7
# %bb.6:                                # %error
                                        #   in Loop: Header=BB1_4 Depth=1
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
	jmp	.LBB1_7
.LBB1_8:                                # %end12
	movq	24(%rsp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	create_array, .Lfunc_end1-create_array
	.cfi_endproc
                                        # -- End function
	.globl	bubble_sort             # -- Begin function bubble_sort
	.p2align	4, 0x90
	.type	bubble_sort,@function
bubble_sort:                            # @bubble_sort
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 48(%rsp)
	movq	%rsi, 24(%rsp)
	movl	$0, 12(%rsp)
	movq	%rsi, %rdi
	callq	tig_array_length
	movl	%eax, 32(%rsp)
	jmp	.LBB2_1
	.p2align	4, 0x90
.LBB2_16:                               # %end8
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	16(%rsp), %eax
	movl	%eax, 12(%rsp)
.LBB2_1:                                # %test
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_3 Depth 2
	movl	12(%rsp), %edi
	callq	tig_not
	cmpl	$1, %eax
	jne	.LBB2_15
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$1, 16(%rsp)
	movl	$0, 8(%rsp)
	movl	32(%rsp), %eax
	addl	$-2, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB2_3
	.p2align	4, 0x90
.LBB2_14:                               # %else
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	$0, 44(%rsp)
	incl	8(%rsp)
.LBB2_3:                                # %test6
                                        #   Parent Loop BB2_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	36(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB2_16
# %bb.4:                                # %loop7
                                        #   in Loop: Header=BB2_3 Depth=2
	movq	24(%rsp), %rbx
	movl	8(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB2_6
# %bb.5:                                # %error
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	$.L__unnamed_4, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB2_6:                                # %continue
                                        #   in Loop: Header=BB2_3 Depth=2
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 20(%rsp)
	movq	24(%rsp), %rbx
	movl	8(%rsp), %ebp
	incl	%ebp
	cmpl	(%rbx), %ebp
	jl	.LBB2_8
# %bb.7:                                # %error20
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	$.L__unnamed_5, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB2_8:                                # %test27
                                        #   in Loop: Header=BB2_3 Depth=2
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 40(%rsp)
	cmpl	%eax, 20(%rsp)
	jle	.LBB2_14
# %bb.9:                                # %then
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	8(%rsp), %ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB2_11
# %bb.10:                               # %error35
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	$.L__unnamed_6, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB2_11:                               # %continue36
                                        #   in Loop: Header=BB2_3 Depth=2
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	40(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	8(%rsp), %ebx
	incl	%ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB2_13
# %bb.12:                               # %error46
                                        #   in Loop: Header=BB2_3 Depth=2
	movl	$.L__unnamed_7, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB2_13:                               # %continue47
                                        #   in Loop: Header=BB2_3 Depth=2
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	20(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	$0, 16(%rsp)
	jmp	.LBB2_14
.LBB2_15:                               # %end
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	bubble_sort, .Lfunc_end2-bubble_sort
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_3,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_3:
	.asciz	"test/bubble_sort.tig::41.4: Array out of bound"
	.size	.L__unnamed_3, 47

	.type	.L__unnamed_4,@object   # @1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/bubble_sort.tig::41.437: Array out of bound"
	.size	.L__unnamed_4, 49

	.type	.L__unnamed_5,@object   # @2
	.p2align	4
.L__unnamed_5:
	.asciz	"test/bubble_sort.tig::41.484: Array out of bound"
	.size	.L__unnamed_5, 49

	.type	.L__unnamed_6,@object   # @3
	.p2align	4
.L__unnamed_6:
	.asciz	"test/bubble_sort.tig::41.635: Array out of bound"
	.size	.L__unnamed_6, 49

	.type	.L__unnamed_7,@object   # @4
	.p2align	4
.L__unnamed_7:
	.asciz	"test/bubble_sort.tig::41.683: Array out of bound"
	.size	.L__unnamed_7, 49

	.type	.L__unnamed_1,@object   # @5
	.p2align	4
.L__unnamed_1:
	.asciz	"test/bubble_sort.tig::41.996: Array out of bound"
	.size	.L__unnamed_1, 49

	.type	.L__unnamed_2,@object   # @6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"something"
	.size	.L__unnamed_2, 10


	.section	".note.GNU-stack","",@progbits
