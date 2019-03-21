	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/quick_sort__code_begin"
"camlLlvm_byte_code/test/quick_sort__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/quick_sort__data_begin"
"camlLlvm_byte_code/test/quick_sort__data_begin":
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
	callq	quick_sort
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
	callq	quick_sort
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
	.globl	quick_sort              # -- Begin function quick_sort
	.p2align	4, 0x90
	.type	quick_sort,@function
quick_sort:                             # @quick_sort
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
	movq	%rsi, %r15
	movq	%rdi, %r14
	movl	$16, %edi
	callq	malloc
.Ltmp40:
	movq	%rax, %rbx
	movq	%r14, (%rbx)
	movq	%r15, 8(%rbx)
	movq	%r15, %rdi
	callq	tig_array_length
.Ltmp41:
                                        # kill: def %eax killed %eax def %rax
	leal	-1(%rax), %edx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	popq	%rbx
	popq	%r14
	popq	%r15
	jmp	sort                    # TAILCALL
.Lfunc_end3:
	.size	quick_sort, .Lfunc_end3-quick_sort
	.cfi_endproc
                                        # -- End function
	.globl	partition               # -- Begin function partition
	.p2align	4, 0x90
	.type	partition,@function
partition:                              # @partition
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebx
	movl	%esi, %r15d
	movq	%rdi, %r12
	movq	8(%r12), %rbp
	movl	$.L__unnamed_19, %edx
	movq	%rbp, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp42:
	movq	8(%rbp), %rax
	movslq	%ebx, %rbx
	movl	(%rax,%rbx,4), %eax
	movl	%eax, 12(%rsp)          # 4-byte Spill
	movq	8(%r12), %rdi
	movl	$.L__unnamed_20, %edx
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp43:
	movq	%rbx, 32(%rsp)          # 8-byte Spill
	leal	-1(%rbx), %eax
	movl	%eax, 20(%rsp)          # 4-byte Spill
	movl	%r15d, %ebp
	movq	%r12, 24(%rsp)          # 8-byte Spill
	jmp	.LBB4_1
	.p2align	4, 0x90
.LBB4_4:                                # %merge
                                        #   in Loop: Header=BB4_1 Depth=1
	incl	%ebp
.LBB4_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	cmpl	%ebp, 20(%rsp)          # 4-byte Folded Reload
	movq	8(%r12), %rbx
	jl	.LBB4_5
# %bb.2:                                # %loop
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	$.L__unnamed_21, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp44:
	movq	8(%rbx), %rax
	movslq	%ebp, %r13
	movl	(%rax,%r13,4), %r14d
	movq	8(%r12), %rbx
	movl	$.L__unnamed_22, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp45:
	cmpl	12(%rsp), %r14d         # 4-byte Folded Reload
	jge	.LBB4_4
# %bb.3:                                # %then
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	8(%rbx), %rax
	movl	%r15d, %r12d
	movslq	%r12d, %r15
	movl	(%rax,%r15,4), %eax
	movl	%eax, 16(%rsp)          # 4-byte Spill
	movq	24(%rsp), %rax          # 8-byte Reload
	movq	8(%rax), %rbx
	movl	$.L__unnamed_23, %edx
	movq	%rbx, %rdi
	movl	%r12d, %esi
	callq	tig_check_array_bound
.Ltmp46:
	movq	8(%rbx), %rax
	movl	%r14d, (%rax,%r15,4)
	movl	%r12d, %r15d
	movq	24(%rsp), %r12          # 8-byte Reload
	movq	8(%r12), %rbx
	movl	$.L__unnamed_24, %edx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp47:
	movq	8(%rbx), %rax
	movl	16(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, (%rax,%r13,4)
	incl	%r15d
	jmp	.LBB4_4
.LBB4_5:                                # %end
	movl	$.L__unnamed_25, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp48:
	movq	8(%rbx), %rax
	movslq	%r15d, %rbp
	movl	(%rax,%rbp,4), %r14d
	movq	8(%r12), %rbx
	movl	$.L__unnamed_26, %edx
	movq	%rbx, %rdi
	movl	%r15d, %esi
	callq	tig_check_array_bound
.Ltmp49:
	movq	8(%rbx), %rax
	movl	12(%rsp), %ecx          # 4-byte Reload
	movl	%ecx, (%rax,%rbp,4)
	movq	8(%r12), %rbx
	movl	$.L__unnamed_27, %edx
	movq	%rbx, %rdi
	movq	32(%rsp), %rbp          # 8-byte Reload
	movl	%ebp, %esi
	callq	tig_check_array_bound
.Ltmp50:
	movq	8(%rbx), %rax
	movl	%r14d, (%rax,%rbp,4)
	movl	%r15d, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end4:
	.size	partition, .Lfunc_end4-partition
	.cfi_endproc
                                        # -- End function
	.globl	sort                    # -- Begin function sort
	.p2align	4, 0x90
	.type	sort,@function
sort:                                   # @sort
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
	movl	%edx, %r14d
	movl	%esi, %ebp
	movq	%rdi, %r15
	cmpl	%r14d, %ebp
	jge	.LBB5_3
	.p2align	4, 0x90
.LBB5_2:                                # %then
                                        # =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movl	%ebp, %esi
	movl	%r14d, %edx
	callq	partition
.Ltmp51:
	movl	%eax, %ebx
	leal	-1(%rbx), %edx
	movq	%r15, %rdi
	movl	%ebp, %esi
	callq	sort
.Ltmp52:
	incl	%ebx
	movl	%ebx, %ebp
	cmpl	%r14d, %ebp
	jl	.LBB5_2
.LBB5_3:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end5:
	.size	sort, .Lfunc_end5-sort
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
.Ltmp53:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	.LBB6_3
	.p2align	4, 0x90
.LBB6_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jbe	.LBB6_2
.LBB6_3:                                # %end
	movl	$16, %edi
	callq	malloc
.Ltmp54:
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbx, 8(%r14)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	ja	.LBB6_6
	.p2align	4, 0x90
.LBB6_5:                                # %loop12
                                        # =>This Inner Loop Header: Depth=1
	movl	$.L__unnamed_28, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	tig_check_array_bound
.Ltmp55:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jbe	.LBB6_5
.LBB6_6:                                # %end13
	movq	%r14, %rax
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
	.asciz	"test/quick_sort.tig::6.67: Array out of bound"
	.size	.L__unnamed_15, 46

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
	.asciz	"test/quick_sort.tig::16.41: Array out of bound"
	.size	.L__unnamed_18, 47

	.type	.L__unnamed_19,@object  # @5
	.p2align	4
.L__unnamed_19:
	.asciz	"test/quick_sort.tig::24.36: Array out of bound"
	.size	.L__unnamed_19, 47

	.type	.L__unnamed_20,@object  # @6
	.p2align	4
.L__unnamed_20:
	.asciz	"test/quick_sort.tig::25.47: Array out of bound"
	.size	.L__unnamed_20, 47

	.type	.L__unnamed_21,@object  # @7
	.p2align	4
.L__unnamed_21:
	.asciz	"test/quick_sort.tig::29.46: Array out of bound"
	.size	.L__unnamed_21, 47

	.type	.L__unnamed_22,@object  # @8
	.p2align	4
.L__unnamed_22:
	.asciz	"test/quick_sort.tig::30.48: Array out of bound"
	.size	.L__unnamed_22, 47

	.type	.L__unnamed_23,@object  # @9
	.p2align	4
.L__unnamed_23:
	.asciz	"test/quick_sort.tig::34.35: Array out of bound"
	.size	.L__unnamed_23, 47

	.type	.L__unnamed_24,@object  # @10
	.p2align	4
.L__unnamed_24:
	.asciz	"test/quick_sort.tig::35.35: Array out of bound"
	.size	.L__unnamed_24, 47

	.type	.L__unnamed_25,@object  # @11
	.p2align	4
.L__unnamed_25:
	.asciz	"test/quick_sort.tig::39.43: Array out of bound"
	.size	.L__unnamed_25, 47

	.type	.L__unnamed_26,@object  # @12
	.p2align	4
.L__unnamed_26:
	.asciz	"test/quick_sort.tig::40.23: Array out of bound"
	.size	.L__unnamed_26, 47

	.type	.L__unnamed_27,@object  # @13
	.p2align	4
.L__unnamed_27:
	.asciz	"test/quick_sort.tig::41.23: Array out of bound"
	.size	.L__unnamed_27, 47

	.type	.L__unnamed_28,@object  # @14
	.p2align	4
.L__unnamed_28:
	.asciz	"test/quick_sort.tig::64.41: Array out of bound"
	.size	.L__unnamed_28, 47

	.type	.L__unnamed_1,@object   # @15
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Before sorting"
	.size	.L__unnamed_1, 15

	.type	.L__unnamed_2,@object   # @16
.L__unnamed_2:
	.asciz	"=============="
	.size	.L__unnamed_2, 15

	.type	.L__unnamed_3,@object   # @17
.L__unnamed_3:
	.asciz	"After sorting"
	.size	.L__unnamed_3, 14

	.type	.L__unnamed_4,@object   # @18
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/quick_sort.tig::78.23: Array out of bound"
	.size	.L__unnamed_4, 47

	.type	.L__unnamed_5,@object   # @19
	.p2align	4
.L__unnamed_5:
	.asciz	"test/quick_sort.tig::79.23: Array out of bound"
	.size	.L__unnamed_5, 47

	.type	.L__unnamed_6,@object   # @20
	.p2align	4
.L__unnamed_6:
	.asciz	"test/quick_sort.tig::80.23: Array out of bound"
	.size	.L__unnamed_6, 47

	.type	.L__unnamed_7,@object   # @21
	.p2align	4
.L__unnamed_7:
	.asciz	"test/quick_sort.tig::81.23: Array out of bound"
	.size	.L__unnamed_7, 47

	.type	.L__unnamed_8,@object   # @22
	.p2align	4
.L__unnamed_8:
	.asciz	"test/quick_sort.tig::82.23: Array out of bound"
	.size	.L__unnamed_8, 47

	.type	.L__unnamed_9,@object   # @23
	.p2align	4
.L__unnamed_9:
	.asciz	"test/quick_sort.tig::86.23: Array out of bound"
	.size	.L__unnamed_9, 47

	.type	.L__unnamed_10,@object  # @24
	.p2align	4
.L__unnamed_10:
	.asciz	"test/quick_sort.tig::87.23: Array out of bound"
	.size	.L__unnamed_10, 47

	.type	.L__unnamed_11,@object  # @25
	.p2align	4
.L__unnamed_11:
	.asciz	"test/quick_sort.tig::88.23: Array out of bound"
	.size	.L__unnamed_11, 47

	.type	.L__unnamed_12,@object  # @26
	.p2align	4
.L__unnamed_12:
	.asciz	"test/quick_sort.tig::89.23: Array out of bound"
	.size	.L__unnamed_12, 47

	.type	.L__unnamed_13,@object  # @27
	.p2align	4
.L__unnamed_13:
	.asciz	"test/quick_sort.tig::90.23: Array out of bound"
	.size	.L__unnamed_13, 47


	.text
	.globl	"camlLlvm_byte_code/test/quick_sort__code_end"
"camlLlvm_byte_code/test/quick_sort__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/quick_sort__data_end"
"camlLlvm_byte_code/test/quick_sort__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/quick_sort__frametable"
"camlLlvm_byte_code/test/quick_sort__frametable":
	.short	56
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
                                        # live roots for quick_sort
	.quad	.Ltmp40
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp41
	.short	24
	.short	0
	.p2align	3
                                        # live roots for partition
	.quad	.Ltmp42
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp43
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp44
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp45
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp46
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp47
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp48
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp49
	.short	88
	.short	0
	.p2align	3
	.quad	.Ltmp50
	.short	88
	.short	0
	.p2align	3
                                        # live roots for sort
	.quad	.Ltmp51
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp52
	.short	40
	.short	0
	.p2align	3
                                        # live roots for create_array_test
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
	.section	".note.GNU-stack","",@progbits
