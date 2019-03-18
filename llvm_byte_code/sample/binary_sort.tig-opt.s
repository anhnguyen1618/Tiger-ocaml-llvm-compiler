	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/binary_sort__code_begin"
"camlLlvm_byte_code/test/binary_sort__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/binary_sort__data_begin"
"camlLlvm_byte_code/test/binary_sort__data_begin":
	.text
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
.Ltmp0:
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	create_array_test
.Ltmp1:
	movq	%rax, %rbx
	movl	$.L__unnamed_1, %edi
	callq	tig_print
.Ltmp2:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
.Ltmp3:
	movl	$.L__unnamed_2, %edi
	callq	tig_print
.Ltmp4:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	binary_sort
.Ltmp5:
	movl	$.L__unnamed_3, %edi
	callq	tig_print
.Ltmp6:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
.Ltmp7:
	xorl	%esi, %esi
	movl	$.L__unnamed_4, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp8:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
.Ltmp9:
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp10:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
.Ltmp11:
	movl	$2, %esi
	movl	$.L__unnamed_6, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp12:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
.Ltmp13:
	movl	$3, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp14:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
.Ltmp15:
	movl	$4, %esi
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp16:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
.Ltmp17:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	binary_sort
.Ltmp18:
	xorl	%esi, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp19:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
.Ltmp20:
	movl	$1, %esi
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp21:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
.Ltmp22:
	movl	$2, %esi
	movl	$.L__unnamed_11, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp23:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
.Ltmp24:
	movl	$3, %esi
	movl	$.L__unnamed_12, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp25:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
.Ltmp26:
	movl	$4, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp27:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
.Ltmp28:
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
.Ltmp29:
	movq	%rbx, %rdi
	callq	tig_array_length
.Ltmp30:
	movq	%rbx, %rdi
	callq	tig_array_length
.Ltmp31:
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
.Ltmp32:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
.Ltmp33:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	.LBB1_2
.LBB1_3:                                # %end
	movl	$.L__unnamed_16, %edi
	callq	tig_print
.Ltmp34:
	movl	$.L__unnamed_17, %edi
	callq	tig_print
.Ltmp35:
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
.Ltmp36:
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
.Ltmp37:
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
.Ltmp38:
	movq	8(%r14), %r15
	movl	$50, %edi
	callq	tig_random
.Ltmp39:
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
.Ltmp40:
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	in_order_traversing
.Ltmp41:
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	16(%rdi), %rdi
	callq	tig_array_length
.Ltmp42:
	movq	8(%rsp), %rax
	movq	16(%rax), %rdi
	callq	tig_array_length
.Ltmp43:
	movl	%eax, %r15d
	decl	%r15d
	xorl	%ebp, %ebp
	leaq	8(%rsp), %r14
	cmpl	%ebp, %r15d
	jl	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_19, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp44:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %esi
	movq	%r14, %rdi
	callq	add_node
.Ltmp45:
	incl	%ebp
	cmpl	%ebp, %r15d
	jge	.LBB4_2
.LBB4_3:                                # %end
	movq	16(%rsp), %rax
	addq	$24, %rsp
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	%esi, %ebx
	movq	%rdi, 8(%rsp)
	movl	%ebx, 24(%rsp)
	movl	$24, %edi
	callq	malloc
.Ltmp46:
	movl	%ebx, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	callq	tig_nillable
.Ltmp47:
	cmpl	$1, %eax
	jne	.LBB5_2
# %bb.1:                                # %then
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, 8(%rax)
	jmp	.LBB5_3
.LBB5_2:                                # %else
	movq	8(%rsp), %rax
	movq	8(%rax), %rsi
	leaq	8(%rsp), %rdi
	callq	insert_node
.Ltmp48:
.LBB5_3:                                # %merge
	addq	$32, %rsp
	popq	%rbx
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
	movl	$.L__unnamed_20, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp49:
	movl	(%rbx), %ecx
	movq	8(%rsp), %rdx
	xorl	%eax, %eax
	cmpl	16(%rdx), %ecx
	jg	.LBB6_2
# %bb.1:                                # %then2
	movl	$.L__unnamed_21, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp50:
	movq	16(%rbx), %rdi
	callq	tig_nillable
.Ltmp51:
.LBB6_2:                                # %merge4
	cmpl	$1, %eax
	jne	.LBB6_6
# %bb.3:                                # %then
	movl	$.L__unnamed_22, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp52:
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rbx)
	jmp	.LBB6_4
.LBB6_6:                                # %test18
	movl	$.L__unnamed_23, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp54:
	movl	(%rbx), %ecx
	movq	8(%rsp), %rdx
	xorl	%eax, %eax
	cmpl	16(%rdx), %ecx
	jle	.LBB6_8
# %bb.7:                                # %then19
	movl	$.L__unnamed_24, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp55:
	movq	8(%rbx), %rdi
	callq	tig_nillable
.Ltmp56:
.LBB6_8:                                # %merge21
	cmpl	$1, %eax
	jne	.LBB6_9
# %bb.5:                                # %then15
	movl	$.L__unnamed_25, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp53:
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	.LBB6_4
.LBB6_9:                                # %test43
	movl	$.L__unnamed_26, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp57:
	movl	(%rbx), %eax
	movq	8(%rsp), %rcx
	cmpl	16(%rcx), %eax
	jg	.LBB6_12
# %bb.10:                               # %then44
	movl	$.L__unnamed_27, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp58:
	movq	16(%rbx), %rsi
	jmp	.LBB6_11
.LBB6_12:                               # %else45
	movl	$.L__unnamed_28, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp60:
	movq	8(%rbx), %rsi
.LBB6_11:                               # %merge
	movq	8(%rsp), %rdi
	callq	insert_node
.Ltmp59:
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
.Ltmp61:
	cmpl	$1, %eax
	je	.LBB7_2
# %bb.1:                                # %else
	movl	$.L__unnamed_29, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp62:
	movq	8(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	in_order_traversing
.Ltmp63:
	movq	8(%rsp), %rax
	movslq	8(%rax), %r14
	movq	16(%rax), %r15
	movl	$.L__unnamed_30, %edx
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	tig_check_array_bound
.Ltmp64:
	movq	8(%r15), %r15
	movl	$.L__unnamed_31, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp65:
	movl	(%rbx), %eax
	movl	%eax, (%r15,%r14,4)
	movq	8(%rsp), %rax
	incl	8(%rax)
	movl	$.L__unnamed_32, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp66:
	movq	16(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	in_order_traversing
.Ltmp67:
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
.Ltmp68:
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
.Ltmp69:
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
	movl	$.L__unnamed_33, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp70:
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
	.p2align	4
.L__unnamed_20:
	.asciz	"test/binary_sort.tig::35.47: Nil pointer exception!"
	.size	.L__unnamed_20, 52

	.type	.L__unnamed_21,@object  # @6
	.p2align	4
.L__unnamed_21:
	.asciz	"test/binary_sort.tig::35.79: Nil pointer exception!"
	.size	.L__unnamed_21, 52

	.type	.L__unnamed_22,@object  # @7
	.p2align	4
.L__unnamed_22:
	.asciz	"test/binary_sort.tig::36.49: Nil pointer exception!"
	.size	.L__unnamed_22, 52

	.type	.L__unnamed_23,@object  # @8
	.p2align	4
.L__unnamed_23:
	.asciz	"test/binary_sort.tig::37.52: Nil pointer exception!"
	.size	.L__unnamed_23, 52

	.type	.L__unnamed_24,@object  # @9
	.p2align	4
.L__unnamed_24:
	.asciz	"test/binary_sort.tig::37.83: Nil pointer exception!"
	.size	.L__unnamed_24, 52

	.type	.L__unnamed_25,@object  # @10
	.p2align	4
.L__unnamed_25:
	.asciz	"test/binary_sort.tig::38.49: Nil pointer exception!"
	.size	.L__unnamed_25, 52

	.type	.L__unnamed_26,@object  # @11
	.p2align	4
.L__unnamed_26:
	.asciz	"test/binary_sort.tig::39.52: Nil pointer exception!"
	.size	.L__unnamed_26, 52

	.type	.L__unnamed_27,@object  # @12
	.p2align	4
.L__unnamed_27:
	.asciz	"test/binary_sort.tig::40.61: Nil pointer exception!"
	.size	.L__unnamed_27, 52

	.type	.L__unnamed_28,@object  # @13
	.p2align	4
.L__unnamed_28:
	.asciz	"test/binary_sort.tig::41.61: Nil pointer exception!"
	.size	.L__unnamed_28, 52

	.type	.L__unnamed_19,@object  # @14
	.p2align	4
.L__unnamed_19:
	.asciz	"test/binary_sort.tig::49.36: Array out of bound"
	.size	.L__unnamed_19, 48

	.type	.L__unnamed_29,@object  # @15
	.p2align	4
.L__unnamed_29:
	.asciz	"test/binary_sort.tig::57.48: Nil pointer exception!"
	.size	.L__unnamed_29, 52

	.type	.L__unnamed_30,@object  # @16
	.p2align	4
.L__unnamed_30:
	.asciz	"test/binary_sort.tig::58.23: Array out of bound"
	.size	.L__unnamed_30, 48

	.type	.L__unnamed_31,@object  # @17
	.p2align	4
.L__unnamed_31:
	.asciz	"test/binary_sort.tig::58.44: Nil pointer exception!"
	.size	.L__unnamed_31, 52

	.type	.L__unnamed_32,@object  # @18
	.p2align	4
.L__unnamed_32:
	.asciz	"test/binary_sort.tig::60.48: Nil pointer exception!"
	.size	.L__unnamed_32, 52

	.type	.L__unnamed_33,@object  # @19
	.p2align	4
.L__unnamed_33:
	.asciz	"test/binary_sort.tig::77.41: Array out of bound"
	.size	.L__unnamed_33, 48

	.type	.L__unnamed_1,@object   # @20
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @21
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @22
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @23
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/binary_sort.tig::90.23: Array out of bound"
	.size	.L__unnamed_4, 48

	.type	.L__unnamed_5,@object   # @24
	.p2align	4
.L__unnamed_5:
	.asciz	"test/binary_sort.tig::91.23: Array out of bound"
	.size	.L__unnamed_5, 48

	.type	.L__unnamed_6,@object   # @25
	.p2align	4
.L__unnamed_6:
	.asciz	"test/binary_sort.tig::92.23: Array out of bound"
	.size	.L__unnamed_6, 48

	.type	.L__unnamed_7,@object   # @26
	.p2align	4
.L__unnamed_7:
	.asciz	"test/binary_sort.tig::93.23: Array out of bound"
	.size	.L__unnamed_7, 48

	.type	.L__unnamed_8,@object   # @27
	.p2align	4
.L__unnamed_8:
	.asciz	"test/binary_sort.tig::94.23: Array out of bound"
	.size	.L__unnamed_8, 48

	.type	.L__unnamed_9,@object   # @28
	.p2align	4
.L__unnamed_9:
	.asciz	"test/binary_sort.tig::98.23: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_10,@object  # @29
	.p2align	4
.L__unnamed_10:
	.asciz	"test/binary_sort.tig::99.23: Array out of bound"
	.size	.L__unnamed_10, 48

	.type	.L__unnamed_11,@object  # @30
	.p2align	4
.L__unnamed_11:
	.asciz	"test/binary_sort.tig::100.23: Array out of bound"
	.size	.L__unnamed_11, 49

	.type	.L__unnamed_12,@object  # @31
	.p2align	4
.L__unnamed_12:
	.asciz	"test/binary_sort.tig::101.23: Array out of bound"
	.size	.L__unnamed_12, 49

	.type	.L__unnamed_13,@object  # @32
	.p2align	4
.L__unnamed_13:
	.asciz	"test/binary_sort.tig::102.23: Array out of bound"
	.size	.L__unnamed_13, 49


	.text
	.globl	"camlLlvm_byte_code/test/binary_sort__code_end"
"camlLlvm_byte_code/test/binary_sort__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/binary_sort__data_end"
"camlLlvm_byte_code/test/binary_sort__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/binary_sort__frametable"
"camlLlvm_byte_code/test/binary_sort__frametable":
	.short	71
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp19
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp25
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp26
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp27
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp28
	.short	40
	.short	0
	.p2align	3
                                        # live roots for print_array
	.quad	.Ltmp29
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp30
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp31
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp32
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp33
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp34
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp35
	.short	40
	.short	0
	.p2align	3
                                        # live roots for create_array
	.quad	.Ltmp36
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp37
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp38
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp39
	.short	40
	.short	0
	.p2align	3
                                        # live roots for binary_sort
	.quad	.Ltmp40
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp41
	.short	40
	.short	0
	.p2align	3
                                        # live roots for build_binary_tree
	.quad	.Ltmp42
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp43
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp44
	.short	56
	.short	0
	.p2align	3
	.quad	.Ltmp45
	.short	56
	.short	0
	.p2align	3
                                        # live roots for add_node
	.quad	.Ltmp46
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp47
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp48
	.short	40
	.short	0
	.p2align	3
                                        # live roots for insert_node
	.quad	.Ltmp49
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp50
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp51
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp52
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp53
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp54
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp55
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp56
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp57
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp58
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp59
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp60
	.short	24
	.short	0
	.p2align	3
                                        # live roots for in_order_traversing
	.quad	.Ltmp61
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp62
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp63
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp64
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp65
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp66
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp67
	.short	40
	.short	0
	.p2align	3
                                        # live roots for create_array_test
	.quad	.Ltmp68
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp69
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp70
	.short	40
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
