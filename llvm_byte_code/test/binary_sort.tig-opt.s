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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	16(%rdi), %rdi
	callq	tig_array_length
	movq	(%rsp), %rax
	movq	16(%rax), %rdi
	callq	tig_array_length
	movl	%eax, %r15d
	decl	%r15d
	xorl	%ebx, %ebx
	movq	%rsp, %r14
	cmpl	%ebx, %r15d
	jl	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movq	16(%rax), %rbp
	movl	$.L__unnamed_19, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%rbp), %rax
	movslq	%ebx, %rcx
	movl	(%rax,%rcx,4), %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	callq	add_node
	incl	%ebx
	cmpl	%ebx, %r15d
	jge	.LBB4_2
.LBB4_3:                                # %end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	build_binary_tree, .Lfunc_end4-build_binary_tree
	.cfi_endproc
                                        # -- End function
	.globl	add_node                # -- Begin function add_node
	.p2align	4, 0x90
	.type	add_node,@function
add_node:                               # @add_node
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebp
	movq	%rsi, %rbx
	movq	%rdi, (%rsp)
	movl	%ebp, 16(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 8(%rsp)
	movq	%rbx, %rdi
	callq	tig_nillable
	cmpl	$1, %eax
	jne	.LBB5_2
# %bb.1:                                # %then
	movl	$.L__unnamed_20, %edi
	callq	tig_print
	jmp	.LBB5_3
.LBB5_2:                                # %else
	movq	%rsp, %rdi
	movq	%rbx, %rsi
	callq	insert_node
.LBB5_3:                                # %merge
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end5:
	.size	add_node, .Lfunc_end5-add_node
	.cfi_endproc
                                        # -- End function
	.globl	insert_node             # -- Begin function insert_node
	.p2align	4, 0x90
	.type	insert_node,@function
insert_node:                            # @insert_node
	.cfi_startproc
# %bb.0:                                # %test1
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movl	$.L__unnamed_21, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %ecx
	movq	8(%rsp), %rdx
	xorl	%eax, %eax
	cmpl	16(%rdx), %ecx
	jg	.LBB6_2
# %bb.1:                                # %then2
	movl	$.L__unnamed_22, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	16(%rbx), %rdi
	callq	tig_nillable
.LBB6_2:                                # %merge4
	cmpl	$1, %eax
	jne	.LBB6_6
# %bb.3:                                # %then
	movl	$.L__unnamed_23, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rbx)
	jmp	.LBB6_4
.LBB6_6:                                # %test18
	movl	$.L__unnamed_24, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %ecx
	movq	8(%rsp), %rdx
	xorl	%eax, %eax
	cmpl	16(%rdx), %ecx
	jle	.LBB6_8
# %bb.7:                                # %then19
	movl	$.L__unnamed_25, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rbx), %rdi
	callq	tig_nillable
.LBB6_8:                                # %merge21
	cmpl	$1, %eax
	jne	.LBB6_9
# %bb.5:                                # %then15
	movl	$.L__unnamed_26, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.LBB6_4
.LBB6_9:                                # %test43
	movl	$.L__unnamed_27, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %eax
	movq	8(%rsp), %rcx
	cmpl	16(%rcx), %eax
	jg	.LBB6_12
# %bb.10:                               # %then44
	movl	$.L__unnamed_28, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	16(%rbx), %rsi
	jmp	.LBB6_11
.LBB6_12:                               # %else45
	movl	$.L__unnamed_29, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rbx), %rsi
.LBB6_11:                               # %merge
	movq	8(%rsp), %rdi
	callq	insert_node
.LBB6_4:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end6:
	.size	insert_node, .Lfunc_end6-insert_node
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
	je	.LBB7_2
# %bb.1:                                # %else
	movl	$.L__unnamed_30, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	in_order_traversing
	movq	8(%rsp), %rax
	movslq	8(%rax), %r14
	movq	16(%rax), %r15
	movl	$.L__unnamed_31, %edx
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
	movq	8(%r15), %r15
	movl	$.L__unnamed_32, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %eax
	movl	%eax, (%r15,%r14,4)
	movq	8(%rsp), %rax
	incl	8(%rax)
	movl	$.L__unnamed_33, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	16(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	in_order_traversing
.LBB7_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end7:
	.size	in_order_traversing, .Lfunc_end7-in_order_traversing
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
	jg	.LBB8_3
	.p2align	4, 0x90
.LBB8_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB8_2
.LBB8_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	jg	.LBB8_6
	.p2align	4, 0x90
.LBB8_5:                                # %loop11
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_34, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	.LBB8_5
.LBB8_6:                                # %end12
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end8:
	.size	create_array_test, .Lfunc_end8-create_array_test
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

	.type	.L__unnamed_20,@object  # @5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_20:
	.asciz	"run here"
	.size	.L__unnamed_20, 9

	.type	.L__unnamed_21,@object  # @6
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_21:
	.asciz	"test/binary_sort.tig::35.47: Nil pointer exception!"
	.size	.L__unnamed_21, 52

	.type	.L__unnamed_22,@object  # @7
	.p2align	4
.L__unnamed_22:
	.asciz	"test/binary_sort.tig::35.79: Nil pointer exception!"
	.size	.L__unnamed_22, 52

	.type	.L__unnamed_23,@object  # @8
	.p2align	4
.L__unnamed_23:
	.asciz	"test/binary_sort.tig::36.49: Nil pointer exception!"
	.size	.L__unnamed_23, 52

	.type	.L__unnamed_24,@object  # @9
	.p2align	4
.L__unnamed_24:
	.asciz	"test/binary_sort.tig::37.52: Nil pointer exception!"
	.size	.L__unnamed_24, 52

	.type	.L__unnamed_25,@object  # @10
	.p2align	4
.L__unnamed_25:
	.asciz	"test/binary_sort.tig::37.83: Nil pointer exception!"
	.size	.L__unnamed_25, 52

	.type	.L__unnamed_26,@object  # @11
	.p2align	4
.L__unnamed_26:
	.asciz	"test/binary_sort.tig::38.49: Nil pointer exception!"
	.size	.L__unnamed_26, 52

	.type	.L__unnamed_27,@object  # @12
	.p2align	4
.L__unnamed_27:
	.asciz	"test/binary_sort.tig::39.52: Nil pointer exception!"
	.size	.L__unnamed_27, 52

	.type	.L__unnamed_28,@object  # @13
	.p2align	4
.L__unnamed_28:
	.asciz	"test/binary_sort.tig::40.61: Nil pointer exception!"
	.size	.L__unnamed_28, 52

	.type	.L__unnamed_29,@object  # @14
	.p2align	4
.L__unnamed_29:
	.asciz	"test/binary_sort.tig::41.61: Nil pointer exception!"
	.size	.L__unnamed_29, 52

	.type	.L__unnamed_19,@object  # @15
	.p2align	4
.L__unnamed_19:
	.asciz	"test/binary_sort.tig::49.47: Array out of bound"
	.size	.L__unnamed_19, 48

	.type	.L__unnamed_30,@object  # @16
	.p2align	4
.L__unnamed_30:
	.asciz	"test/binary_sort.tig::57.48: Nil pointer exception!"
	.size	.L__unnamed_30, 52

	.type	.L__unnamed_31,@object  # @17
	.p2align	4
.L__unnamed_31:
	.asciz	"test/binary_sort.tig::58.23: Array out of bound"
	.size	.L__unnamed_31, 48

	.type	.L__unnamed_32,@object  # @18
	.p2align	4
.L__unnamed_32:
	.asciz	"test/binary_sort.tig::58.44: Nil pointer exception!"
	.size	.L__unnamed_32, 52

	.type	.L__unnamed_33,@object  # @19
	.p2align	4
.L__unnamed_33:
	.asciz	"test/binary_sort.tig::60.48: Nil pointer exception!"
	.size	.L__unnamed_33, 52

	.type	.L__unnamed_34,@object  # @20
	.p2align	4
.L__unnamed_34:
	.asciz	"test/binary_sort.tig::77.41: Array out of bound"
	.size	.L__unnamed_34, 48

	.type	.L__unnamed_1,@object   # @21
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @22
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @23
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @24
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/binary_sort.tig::90.23: Array out of bound"
	.size	.L__unnamed_4, 48

	.type	.L__unnamed_5,@object   # @25
	.p2align	4
.L__unnamed_5:
	.asciz	"test/binary_sort.tig::91.23: Array out of bound"
	.size	.L__unnamed_5, 48

	.type	.L__unnamed_6,@object   # @26
	.p2align	4
.L__unnamed_6:
	.asciz	"test/binary_sort.tig::92.23: Array out of bound"
	.size	.L__unnamed_6, 48

	.type	.L__unnamed_7,@object   # @27
	.p2align	4
.L__unnamed_7:
	.asciz	"test/binary_sort.tig::93.23: Array out of bound"
	.size	.L__unnamed_7, 48

	.type	.L__unnamed_8,@object   # @28
	.p2align	4
.L__unnamed_8:
	.asciz	"test/binary_sort.tig::94.23: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @29
	.p2align	4
.L__unnamed_9:
	.asciz	"test/binary_sort.tig::98.23: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @30
	.p2align	4
.L__unnamed_10:
	.asciz	"test/binary_sort.tig::99.23: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @31
	.p2align	4
.L__unnamed_11:
	.asciz	"test/binary_sort.tig::100.23: Array out of bound"
	.size	.L__unnamed_11, 49

	.type	.L__unnamed_12,@object  # @32
	.p2align	4
.L__unnamed_12:
	.asciz	"test/binary_sort.tig::101.23: Array out of bound"
	.size	.L__unnamed_12, 49

	.type	.L__unnamed_13,@object  # @33
	.p2align	4
.L__unnamed_13:
	.asciz	"test/binary_sort.tig::102.23: Array out of bound"
	.size	.L__unnamed_13, 49


	.section	".note.GNU-stack","",@progbits
