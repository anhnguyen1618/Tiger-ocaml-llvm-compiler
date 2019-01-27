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
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	create_array
	movq	%rax, (%rsp)
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	callq	print_array
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	callq	bubble_sort
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	callq	print_array
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	print_array             # -- Begin function print_array
	.p2align	4, 0x90
	.type	print_array,@function
print_array:                            # @print_array
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
	movq	%rsi, 16(%rsp)
	movl	$.L__unnamed_4, %edi
	callq	tig_print
	movq	16(%rsp), %rdi
	callq	tig_array_length
	movl	$0, 12(%rsp)
	movq	16(%rsp), %rdi
	callq	tig_array_length
	decl	%eax
	movl	%eax, 28(%rsp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_4:                                # %continue
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
	incl	12(%rsp)
.LBB1_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movl	28(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB1_5
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	16(%rsp), %rbx
	movl	12(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB1_4
# %bb.3:                                # %error
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$.L__unnamed_5, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
	jmp	.LBB1_4
.LBB1_5:                                # %end
	movl	$.L__unnamed_6, %edi
	callq	tig_print
	movl	$.L__unnamed_7, %edi
	callq	tig_print
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	print_array, .Lfunc_end1-print_array
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
	movl	$0, 8(%rsp)
	cmpl	%ebp, 8(%rsp)
	jge	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	8(%rsp), %rax
	movl	$1, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 8(%rsp)
	cmpl	%ebp, 8(%rsp)
	jl	.LBB2_2
.LBB2_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 24(%rsp)
	movl	$0, 12(%rsp)
	movl	16(%rsp), %eax
	decl	%eax
	movl	%eax, 20(%rsp)
	jmp	.LBB2_4
	.p2align	4, 0x90
.LBB2_7:                                # %continue
                                        #   in Loop: Header=BB2_4 Depth=1
	movq	8(%rbp), %rbp
	movslq	%ebx, %rbx
	movl	$50, %edi
	callq	tig_random
	movl	%eax, (%rbp,%rbx,4)
	incl	12(%rsp)
.LBB2_4:                                # %test10
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%rsp), %eax
	cmpl	12(%rsp), %eax
	jl	.LBB2_8
# %bb.5:                                # %loop11
                                        #   in Loop: Header=BB2_4 Depth=1
	movl	12(%rsp), %ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB2_7
# %bb.6:                                # %error
                                        #   in Loop: Header=BB2_4 Depth=1
	movl	$.L__unnamed_8, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
	jmp	.LBB2_7
.LBB2_8:                                # %end12
	movq	24(%rsp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end2:
	.size	create_array, .Lfunc_end2-create_array
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
	jmp	.LBB3_1
	.p2align	4, 0x90
.LBB3_16:                               # %end8
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	16(%rsp), %eax
	movl	%eax, 12(%rsp)
.LBB3_1:                                # %test
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_3 Depth 2
	movl	12(%rsp), %edi
	callq	tig_not
	cmpl	$1, %eax
	jne	.LBB3_15
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$1, 16(%rsp)
	movl	$0, 8(%rsp)
	movl	32(%rsp), %eax
	addl	$-2, %eax
	movl	%eax, 36(%rsp)
	jmp	.LBB3_3
	.p2align	4, 0x90
.LBB3_14:                               # %else
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$0, 44(%rsp)
	incl	8(%rsp)
.LBB3_3:                                # %test6
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	36(%rsp), %eax
	cmpl	8(%rsp), %eax
	jl	.LBB3_16
# %bb.4:                                # %loop7
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	24(%rsp), %rbx
	movl	8(%rsp), %ebp
	cmpl	(%rbx), %ebp
	jl	.LBB3_6
# %bb.5:                                # %error
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$.L__unnamed_9, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB3_6:                                # %continue
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 20(%rsp)
	movq	24(%rsp), %rbx
	movl	8(%rsp), %ebp
	incl	%ebp
	cmpl	(%rbx), %ebp
	jl	.LBB3_8
# %bb.7:                                # %error20
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$.L__unnamed_10, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB3_8:                                # %test27
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, 40(%rsp)
	cmpl	%eax, 20(%rsp)
	jle	.LBB3_14
# %bb.9:                                # %then
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	8(%rsp), %ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB3_11
# %bb.10:                               # %error35
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$.L__unnamed_11, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB3_11:                               # %continue36
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	40(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	8(%rsp), %ebx
	incl	%ebx
	movq	24(%rsp), %rbp
	cmpl	(%rbp), %ebx
	jl	.LBB3_13
# %bb.12:                               # %error46
                                        #   in Loop: Header=BB3_3 Depth=2
	movl	$.L__unnamed_12, %edi
	callq	tig_print
	movl	$1, %edi
	callq	tig_exit
.LBB3_13:                               # %continue47
                                        #   in Loop: Header=BB3_3 Depth=2
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	20(%rsp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	$0, 16(%rsp)
	jmp	.LBB3_14
.LBB3_15:                               # %end
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end3:
	.size	bubble_sort, .Lfunc_end3-bubble_sort
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_4,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_4:
	.asciz	"["
	.size	.L__unnamed_4, 2

	.type	.L__unnamed_5,@object   # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_5:
	.asciz	"test/bubble_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_5, 47

	.type	.L__unnamed_6,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_6:
	.zero	1
	.size	.L__unnamed_6, 1

	.type	.L__unnamed_7,@object   # @3
.L__unnamed_7:
	.asciz	"]"
	.size	.L__unnamed_7, 2

	.type	.L__unnamed_8,@object   # @4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_8:
	.asciz	"test/bubble_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @5
	.p2align	4
.L__unnamed_9:
	.asciz	"test/bubble_sort.tig::30.46: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @6
	.p2align	4
.L__unnamed_10:
	.asciz	"test/bubble_sort.tig::31.43: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @7
	.p2align	4
.L__unnamed_11:
	.asciz	"test/bubble_sort.tig::35.35: Array out of bound"
	.size	.L__unnamed_11, 48

	.type	.L__unnamed_12,@object  # @8
	.p2align	4
.L__unnamed_12:
	.asciz	"test/bubble_sort.tig::36.35: Array out of bound"
	.size	.L__unnamed_12, 48

	.type	.L__unnamed_1,@object   # @9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @10
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @11
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14


	.section	".note.GNU-stack","",@progbits
