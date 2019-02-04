	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	8(%rsp), %r14
	movq	%r14, %rdi
	callq	create_array
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	create_array_test
	movq	%rax, %rbx
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	binary_sort
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
	xorl	%esi, %esi
	movl	$.L__unnamed_4, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
	movl	$2, %esi
	movl	$.L__unnamed_6, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
	movl	$3, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
	movl	$4, %esi
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	binary_sort
	xorl	%esi, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
	movl	$2, %esi
	movl	$.L__unnamed_11, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
	movl	$3, %esi
	movl	$.L__unnamed_12, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
	movl	$4, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movl	$.L__unnamed_14, %edi
	callq	tig_print
	movq	%rbx, %rdi
	callq	tig_array_length
	movq	%rbx, %rdi
	callq	tig_array_length
	movl	%eax, %r14d
	decl	%r14d
	xorl	%ebp, %ebp
	cmpl	%ebp, %r14d
	jl	.LBB1_3
	.p2align	4, 0x90
.LBB1_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_15, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	.LBB1_2
.LBB1_3:                                # %end
	movl	$.L__unnamed_16, %edi
	callq	tig_print
	movl	$.L__unnamed_17, %edi
	callq	tig_print
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, 8(%rsp)
	movl	$32, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$7, %eax
	jg	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$7, %eax
	jle	.LBB2_2
.LBB2_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$8, (%r14)
	movq	%rbx, 8(%r14)
	xorl	%ebx, %ebx
	cmpl	$7, %ebx
	jg	.LBB2_6
	.p2align	4, 0x90
.LBB2_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_18, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r14), %r15
	movl	$50, %edi
	callq	tig_random
	movl	%eax, (%r15,%rbx,4)
	incq	%rbx
	cmpl	$7, %ebx
	jle	.LBB2_5
.LBB2_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	create_array, .Lfunc_end2-create_array
	.cfi_endproc
                                        # -- End function
	.globl	binary_sort             # -- Begin function binary_sort
	.p2align	4, 0x90
	.type	binary_sort,@function
binary_sort:                            # @binary_sort
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, 24(%rsp)
	movl	$0, 16(%rsp)
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	build_binary_tree
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	in_order_traversing
	addq	$32, %rsp
	popq	%rbx
	retq
.Lfunc_end3:
	.size	binary_sort, .Lfunc_end3-binary_sort
	.cfi_endproc
                                        # -- End function
	.globl	build_binary_tree       # -- Begin function build_binary_tree
	.p2align	4, 0x90
	.type	build_binary_tree,@function
build_binary_tree:                      # @build_binary_tree
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	xorl	%eax, %eax
	retq
.Lfunc_end4:
	.size	build_binary_tree, .Lfunc_end4-build_binary_tree
	.cfi_endproc
                                        # -- End function
	.globl	in_order_traversing     # -- Begin function in_order_traversing
	.p2align	4, 0x90
	.type	in_order_traversing,@function
in_order_traversing:                    # @in_order_traversing
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rbx, %rdi
	callq	tig_nillable
	cmpl	$1, %eax
	je	.LBB5_2
# %bb.1:                                # %else
	movl	$.L__unnamed_19, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	in_order_traversing
	movq	8(%rsp), %rax
	movslq	8(%rax), %r14
	movq	16(%rax), %r15
	movl	$.L__unnamed_20, %edx
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%r15), %r15
	movl	$.L__unnamed_21, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %eax
	movl	%eax, (%r15,%r14,4)
	movq	8(%rsp), %rax
	incl	8(%rax)
	movl	$.L__unnamed_22, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	16(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	in_order_traversing
.LBB5_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end5:
	.size	in_order_traversing, .Lfunc_end5-in_order_traversing
	.cfi_endproc
                                        # -- End function
	.globl	create_array_test       # -- Begin function create_array_test
	.p2align	4, 0x90
	.type	create_array_test,@function
create_array_test:                      # @create_array_test
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 8(%rsp)
	movl	$20, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB6_3
	.p2align	4, 0x90
.LBB6_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB6_2
.LBB6_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	jg	.LBB6_6
	.p2align	4, 0x90
.LBB6_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_23, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	.LBB6_5
.LBB6_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end6:
	.size	create_array_test, .Lfunc_end6-create_array_test
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_14,@object  # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_14:
	.asciz	"["
	.size	.L__unnamed_14, 2

	.type	.L__unnamed_15,@object  # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_15:
	.asciz	"test/binary_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_15, 47

	.type	.L__unnamed_16,@object  # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_16:
	.zero	1
	.size	.L__unnamed_16, 1

	.type	.L__unnamed_17,@object  # @3
.L__unnamed_17:
	.asciz	"]"
	.size	.L__unnamed_17, 2

	.type	.L__unnamed_18,@object  # @4
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_18:
	.asciz	"test/binary_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_18, 48

	.type	.L__unnamed_19,@object  # @5
	.p2align	4
.L__unnamed_19:
	.asciz	"test/binary_sort.tig::53.48: Nil pointer exception!"
	.size	.L__unnamed_19, 52

	.type	.L__unnamed_20,@object  # @6
	.p2align	4
.L__unnamed_20:
	.asciz	"test/binary_sort.tig::54.23: Array out of bound"
	.size	.L__unnamed_20, 48

	.type	.L__unnamed_21,@object  # @7
	.p2align	4
.L__unnamed_21:
	.asciz	"test/binary_sort.tig::54.44: Nil pointer exception!"
	.size	.L__unnamed_21, 52

	.type	.L__unnamed_22,@object  # @8
	.p2align	4
.L__unnamed_22:
	.asciz	"test/binary_sort.tig::56.48: Nil pointer exception!"
	.size	.L__unnamed_22, 52

	.type	.L__unnamed_23,@object  # @9
	.p2align	4
.L__unnamed_23:
	.asciz	"test/binary_sort.tig::73.41: Array out of bound"
	.size	.L__unnamed_23, 48

	.type	.L__unnamed_1,@object   # @10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @11
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @12
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @13
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/binary_sort.tig::86.23: Array out of bound"
	.size	.L__unnamed_4, 48

	.type	.L__unnamed_5,@object   # @14
	.p2align	4
.L__unnamed_5:
	.asciz	"test/binary_sort.tig::87.23: Array out of bound"
	.size	.L__unnamed_5, 48

	.type	.L__unnamed_6,@object   # @15
	.p2align	4
.L__unnamed_6:
	.asciz	"test/binary_sort.tig::88.23: Array out of bound"
	.size	.L__unnamed_6, 48

	.type	.L__unnamed_7,@object   # @16
	.p2align	4
.L__unnamed_7:
	.asciz	"test/binary_sort.tig::89.23: Array out of bound"
	.size	.L__unnamed_7, 48

	.type	.L__unnamed_8,@object   # @17
	.p2align	4
.L__unnamed_8:
	.asciz	"test/binary_sort.tig::90.23: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @18
	.p2align	4
.L__unnamed_9:
	.asciz	"test/binary_sort.tig::94.23: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @19
	.p2align	4
.L__unnamed_10:
	.asciz	"test/binary_sort.tig::95.23: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @20
	.p2align	4
.L__unnamed_11:
	.asciz	"test/binary_sort.tig::96.23: Array out of bound"
	.size	.L__unnamed_11, 48

	.type	.L__unnamed_12,@object  # @21
	.p2align	4
.L__unnamed_12:
	.asciz	"test/binary_sort.tig::97.23: Array out of bound"
	.size	.L__unnamed_12, 48

	.type	.L__unnamed_13,@object  # @22
	.p2align	4
.L__unnamed_13:
	.asciz	"test/binary_sort.tig::98.23: Array out of bound"
	.size	.L__unnamed_13, 48


	.section	".note.GNU-stack","",@progbits
