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
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$4, %edi
	callq	malloc
.Ltmp0:
	movq	%rax, %r14
	movq	%r14, %rdi
	callq	create_array
.Ltmp1:
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	create_array_test
.Ltmp2:
	movq	%rax, %rbx
	movl	$.L__unnamed_1, %edi
	callq	tig_print
.Ltmp3:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
.Ltmp4:
	movl	$.L__unnamed_2, %edi
	callq	tig_print
.Ltmp5:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	binary_sort
.Ltmp6:
	movl	$.L__unnamed_3, %edi
	callq	tig_print
.Ltmp7:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	print_array
.Ltmp8:
	xorl	%esi, %esi
	movl	$.L__unnamed_4, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp9:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
.Ltmp10:
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp11:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
.Ltmp12:
	movl	$2, %esi
	movl	$.L__unnamed_6, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp13:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
.Ltmp14:
	movl	$3, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp15:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
.Ltmp16:
	movl	$4, %esi
	movl	$.L__unnamed_8, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp17:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
.Ltmp18:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	binary_sort
.Ltmp19:
	xorl	%esi, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp20:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	assert_equal_int
.Ltmp21:
	movl	$1, %esi
	movl	$.L__unnamed_10, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp22:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	assert_equal_int
.Ltmp23:
	movl	$2, %esi
	movl	$.L__unnamed_11, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp24:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	assert_equal_int
.Ltmp25:
	movl	$3, %esi
	movl	$.L__unnamed_12, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp26:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	assert_equal_int
.Ltmp27:
	movl	$4, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp28:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	assert_equal_int
.Ltmp29:
	xorl	%eax, %eax
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
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movl	$.L__unnamed_14, %edi
	callq	tig_print
.Ltmp30:
	movq	%rbx, %rdi
	callq	tig_array_length
.Ltmp31:
	movq	%rbx, %rdi
	callq	tig_array_length
.Ltmp32:
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
.Ltmp33:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	print_arr_int_ele
.Ltmp34:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	.LBB1_2
.LBB1_3:                                # %end
	movl	$.L__unnamed_16, %edi
	callq	tig_print
.Ltmp35:
	movl	$.L__unnamed_17, %edi
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	tig_print               # TAILCALL
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
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$32, %edi
	callq	malloc
.Ltmp36:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$7, %eax
	ja	.LBB2_3
	.p2align	4, 0x90
.LBB2_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$7, %eax
	jbe	.LBB2_2
.LBB2_3:                                # %end
	movl	$16, %edi
	callq	malloc
.Ltmp37:
	movq	%rax, %r14
	movl	$8, (%r14)
	movq	%rbx, 8(%r14)
	xorl	%ebx, %ebx
	cmpl	$7, %ebx
	ja	.LBB2_6
	.p2align	4, 0x90
.LBB2_5:                                # %loop12
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
	jbe	.LBB2_5
.LBB2_6:                                # %end13
	movq	%r14, %rax
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
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r15
	movl	$24, %edi
	callq	malloc
.Ltmp40:
	movq	%rax, %rbx
	movq	%r15, (%rbx)
	movq	%r14, 16(%rbx)
	movl	$0, 8(%rbx)
	movq	%rbx, %rdi
	callq	build_binary_tree
.Ltmp41:
	movq	%rbx, %rdi
	movq	%rax, %rsi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	in_order_traversing     # TAILCALL
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
	movq	%rdi, %rbp
	movl	$16, %edi
	callq	malloc
.Ltmp42:
	movq	%rax, %r15
	movq	%rbp, (%r15)
	movq	$0, 8(%r15)
	movq	16(%rbp), %rdi
	callq	tig_array_length
.Ltmp43:
	movq	16(%rbp), %rdi
	callq	tig_array_length
.Ltmp44:
	movl	%eax, %r14d
	decl	%r14d
	xorl	%ebp, %ebp
	cmpl	%ebp, %r14d
	jl	.LBB4_3
	.p2align	4, 0x90
.LBB4_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	(%r15), %rax
	movq	16(%rax), %rbx
	movl	$.L__unnamed_19, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp45:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %esi
	movq	%r15, %rdi
	callq	add_node
.Ltmp46:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	.LBB4_2
.LBB4_3:                                # %end
	movq	8(%r15), %rax
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
	movl	%esi, %ebp
	movq	%rdi, %r14
	movl	$24, %edi
	callq	malloc
.Ltmp47:
	movq	%rax, %r15
	movq	%r14, (%r15)
	movl	%ebp, 16(%r15)
	movl	$24, %edi
	callq	malloc
.Ltmp48:
	movq	%rax, %rbx
	movl	%ebp, (%rbx)
	movq	$0, 16(%rbx)
	movq	$0, 8(%rbx)
	movq	%rbx, 8(%r15)
	movq	8(%r14), %rdi
	callq	tig_nillable
.Ltmp49:
	testl	%eax, %eax
	je	.LBB5_2
# %bb.1:                                # %merge
	movq	%rbx, 8(%r14)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.LBB5_2:                                # %else
	movq	8(%r14), %rsi
	movq	%r15, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	insert_node             # TAILCALL
.Lfunc_end5:
	.size	add_node, .Lfunc_end5-add_node
	.cfi_endproc
                                        # -- End function
	.globl	insert_node             # -- Begin function insert_node
	.p2align	4, 0x90
	.type	insert_node,@function
insert_node:                            # @insert_node
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	jmp	.LBB6_1
	.p2align	4, 0x90
.LBB6_9:                                # %then44
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$.L__unnamed_20, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp58:
	addq	$16, %rbx
	movq	(%rbx), %rbx
.LBB6_1:                                # %tailrecurse
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_21, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp50:
	movl	(%rbx), %eax
	cmpl	16(%r14), %eax
	jg	.LBB6_6
# %bb.2:                                # %then2
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$.L__unnamed_22, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp51:
	movq	16(%rbx), %rdi
	callq	tig_nillable
.Ltmp52:
	testl	%eax, %eax
	jne	.LBB6_3
.LBB6_6:                                # %test18
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$.L__unnamed_23, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp54:
	movl	(%rbx), %eax
	cmpl	16(%r14), %eax
	jle	.LBB6_8
# %bb.7:                                # %then19
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$.L__unnamed_24, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp55:
	movq	8(%rbx), %rdi
	callq	tig_nillable
.Ltmp56:
	testl	%eax, %eax
	jne	.LBB6_5
.LBB6_8:                                # %test43
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$.L__unnamed_25, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp57:
	movl	(%rbx), %eax
	cmpl	16(%r14), %eax
	jle	.LBB6_9
# %bb.10:                               # %else45
                                        #   in Loop: Header=BB6_1 Depth=1
	movl	$.L__unnamed_26, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp59:
	addq	$8, %rbx
	movq	(%rbx), %rbx
	jmp	.LBB6_1
.LBB6_3:                                # %then
	leaq	16(%rbx), %r15
	movl	$.L__unnamed_27, %esi
	jmp	.LBB6_4
.LBB6_5:                                # %then15
	leaq	8(%rbx), %r15
	movl	$.L__unnamed_28, %esi
.LBB6_4:                                # %merge
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp53:
	movq	8(%r14), %rax
	movq	%rax, (%r15)
	popq	%rbx
	popq	%r14
	popq	%r15
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
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, %r14
	jmp	.LBB7_1
	.p2align	4, 0x90
.LBB7_2:                                # %else
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	$.L__unnamed_29, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp61:
	movq	8(%rbx), %rsi
	movq	%r14, %rdi
	callq	in_order_traversing
.Ltmp62:
	movslq	8(%r14), %r15
	movq	16(%r14), %r12
	movl	$.L__unnamed_30, %edx
	movq	%r12, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp63:
	movq	8(%r12), %r12
	movl	$.L__unnamed_31, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp64:
	movl	(%rbx), %eax
	movl	%eax, (%r12,%r15,4)
	incl	8(%r14)
	movl	$.L__unnamed_32, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp65:
	movq	16(%rbx), %rbx
.LBB7_1:                                # %tailrecurse
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	tig_nillable
.Ltmp60:
	testl	%eax, %eax
	je	.LBB7_2
# %bb.3:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
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
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	$20, %edi
	callq	malloc
.Ltmp66:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	.LBB8_3
	.p2align	4, 0x90
.LBB8_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jbe	.LBB8_2
.LBB8_3:                                # %end
	movl	$16, %edi
	callq	malloc
.Ltmp67:
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	ja	.LBB8_6
	.p2align	4, 0x90
.LBB8_5:                                # %loop12
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_33, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp68:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jbe	.LBB8_5
.LBB8_6:                                # %end13
	movq	%r14, %rax
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

	.type	.L__unnamed_21,@object  # @5
	.p2align	4
.L__unnamed_21:
	.asciz	"test/binary_sort.tig::35.47: Nil pointer exception!"
	.size	.L__unnamed_21, 52

	.type	.L__unnamed_22,@object  # @6
	.p2align	4
.L__unnamed_22:
	.asciz	"test/binary_sort.tig::35.79: Nil pointer exception!"
	.size	.L__unnamed_22, 52

	.type	.L__unnamed_27,@object  # @7
	.p2align	4
.L__unnamed_27:
	.asciz	"test/binary_sort.tig::36.49: Nil pointer exception!"
	.size	.L__unnamed_27, 52

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

	.type	.L__unnamed_28,@object  # @10
	.p2align	4
.L__unnamed_28:
	.asciz	"test/binary_sort.tig::38.49: Nil pointer exception!"
	.size	.L__unnamed_28, 52

	.type	.L__unnamed_25,@object  # @11
	.p2align	4
.L__unnamed_25:
	.asciz	"test/binary_sort.tig::39.52: Nil pointer exception!"
	.size	.L__unnamed_25, 52

	.type	.L__unnamed_20,@object  # @12
	.p2align	4
.L__unnamed_20:
	.asciz	"test/binary_sort.tig::40.61: Nil pointer exception!"
	.size	.L__unnamed_20, 52

	.type	.L__unnamed_26,@object  # @13
	.p2align	4
.L__unnamed_26:
	.asciz	"test/binary_sort.tig::41.61: Nil pointer exception!"
	.size	.L__unnamed_26, 52

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
	.short	69
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp12
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp13
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp14
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp15
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp16
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp17
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp18
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp19
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp20
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp21
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp23
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp24
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp25
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp26
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp27
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp28
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp29
	.short	24
	.short	0
	.p2align	3
                                        # live roots for print_array
	.quad	.Ltmp30
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp31
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp32
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp33
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp34
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp35
	.short	24
	.short	0
	.p2align	3
                                        # live roots for create_array
	.quad	.Ltmp36
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp37
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp38
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp39
	.short	24
	.short	0
	.p2align	3
                                        # live roots for binary_sort
	.quad	.Ltmp40
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp41
	.short	24
	.short	0
	.p2align	3
                                        # live roots for build_binary_tree
	.quad	.Ltmp42
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp43
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp44
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp45
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp46
	.short	40
	.short	0
	.p2align	3
                                        # live roots for add_node
	.quad	.Ltmp47
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp48
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp49
	.short	40
	.short	0
	.p2align	3
                                        # live roots for insert_node
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
                                        # live roots for in_order_traversing
	.quad	.Ltmp60
	.short	40
	.short	0
	.p2align	3
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
                                        # live roots for create_array_test
	.quad	.Ltmp66
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp67
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp68
	.short	24
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
