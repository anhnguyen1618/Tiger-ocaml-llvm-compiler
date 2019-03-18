	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/quick_sort__code_begin"
"_camlLlvm_byte_code/test/quick_sort__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/quick_sort__data_begin"
"_camlLlvm_byte_code/test/quick_sort__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
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
	callq	_create_array
Ltmp0:
	movq	%rax, %r15
	callq	_create_array_test
Ltmp1:
	movq	%rax, %rbx
	leaq	L___unnamed_1(%rip), %rdi
	callq	_tig_print
Ltmp2:
	movq	%r15, %rsi
	callq	_print_array
Ltmp3:
	leaq	L___unnamed_2(%rip), %rdi
	callq	_tig_print
Ltmp4:
	leaq	8(%rsp), %r14
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_quick_sort
Ltmp5:
	leaq	L___unnamed_3(%rip), %rdi
	callq	_tig_print
Ltmp6:
	movq	%r15, %rsi
	callq	_print_array
Ltmp7:
	leaq	L___unnamed_4(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp8:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	_assert_equal_int
Ltmp9:
	leaq	L___unnamed_5(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp10:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	_assert_equal_int
Ltmp11:
	leaq	L___unnamed_6(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp12:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	_assert_equal_int
Ltmp13:
	leaq	L___unnamed_7(%rip), %rdx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp14:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp15:
	leaq	L___unnamed_8(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp16:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp17:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_quick_sort
Ltmp18:
	leaq	L___unnamed_9(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp19:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp20:
	leaq	L___unnamed_10(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp21:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp22:
	leaq	L___unnamed_11(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp23:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	_assert_equal_int
Ltmp24:
	leaq	L___unnamed_12(%rip), %rdx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp25:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	_assert_equal_int
Ltmp26:
	leaq	L___unnamed_13(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp27:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	_assert_equal_int
Ltmp28:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_array            ## -- Begin function print_array
	.p2align	4, 0x90
_print_array:                           ## @print_array
	.cfi_startproc
## %bb.0:                               ## %entry
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
	movq	%rsi, %rbx
	leaq	L___unnamed_14(%rip), %rdi
	callq	_tig_print
Ltmp29:
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp30:
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp31:
	movl	%eax, %r14d
	decl	%r14d
	xorl	%ebp, %ebp
	leaq	L___unnamed_15(%rip), %r15
	cmpl	%ebp, %r14d
	jl	LBB1_3
	.p2align	4, 0x90
LBB1_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movl	%ebp, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp32:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	_print_arr_int_ele
Ltmp33:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	LBB1_2
LBB1_3:                                 ## %end
	leaq	L___unnamed_16(%rip), %rdi
	callq	_tig_print
Ltmp34:
	leaq	L___unnamed_17(%rip), %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_tig_print              ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_create_array           ## -- Begin function create_array
	.p2align	4, 0x90
_create_array:                          ## @create_array
	.cfi_startproc
## %bb.0:                               ## %entry
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
	movl	$32, %edi
	callq	_malloc
Ltmp35:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$7, %eax
	ja	LBB2_3
	.p2align	4, 0x90
LBB2_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$7, %eax
	jbe	LBB2_2
LBB2_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp36:
	movq	%rax, %r14
	movl	$8, (%rax)
	movq	%rbx, 8(%rax)
	xorl	%ebx, %ebx
	leaq	L___unnamed_18(%rip), %r15
	cmpl	$7, %ebx
	ja	LBB2_6
	.p2align	4, 0x90
LBB2_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp37:
	movq	8(%r14), %r12
	movl	$50, %edi
	callq	_tig_random
Ltmp38:
	movl	%eax, (%r12,%rbx,4)
	incq	%rbx
	cmpl	$7, %ebx
	jbe	LBB2_5
LBB2_6:                                 ## %end12
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_quick_sort             ## -- Begin function quick_sort
	.p2align	4, 0x90
_quick_sort:                            ## @quick_sort
	.cfi_startproc
## %bb.0:                               ## %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rsi, %rdi
	callq	_tig_array_length
Ltmp39:
                                        ## kill: def $eax killed $eax def $rax
	leal	-1(%rax), %edx
	leaq	8(%rsp), %rdi
	xorl	%esi, %esi
	callq	_sort
Ltmp40:
	addq	$24, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_partition              ## -- Begin function partition
	.p2align	4, 0x90
_partition:                             ## @partition
	.cfi_startproc
## %bb.0:                               ## %entry
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
	movl	%edx, %r14d
	movl	%esi, %r15d
	movq	%rdi, %r12
	movq	8(%rdi), %rbp
	leaq	L___unnamed_19(%rip), %rdx
	movq	%rbp, %rdi
	movl	%r14d, %esi
	callq	_tig_check_array_bound
Ltmp41:
	movq	8(%rbp), %rax
	movslq	%r14d, %rbx
	movl	(%rax,%rbx,4), %eax
	movl	%eax, 12(%rsp)          ## 4-byte Spill
	movq	8(%r12), %rdi
	leaq	L___unnamed_20(%rip), %rdx
	movl	%r15d, %esi
	callq	_tig_check_array_bound
Ltmp42:
	movq	%rbx, 32(%rsp)          ## 8-byte Spill
	leal	-1(%rbx), %eax
	movl	%eax, 20(%rsp)          ## 4-byte Spill
	movl	%r15d, %r13d
	movq	%r12, 24(%rsp)          ## 8-byte Spill
	jmp	LBB4_1
	.p2align	4, 0x90
LBB4_4:                                 ## %merge
                                        ##   in Loop: Header=BB4_1 Depth=1
	incl	%r13d
LBB4_1:                                 ## %test
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	%r13d, 20(%rsp)         ## 4-byte Folded Reload
	movq	8(%r12), %r14
	jl	LBB4_5
## %bb.2:                               ## %loop
                                        ##   in Loop: Header=BB4_1 Depth=1
	movq	%r14, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_21(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp43:
	movq	8(%r14), %rax
	movslq	%r13d, %r14
	movl	(%rax,%r14,4), %ebx
	movq	8(%r12), %rbp
	movq	%rbp, %rdi
	movl	%r15d, %esi
	leaq	L___unnamed_22(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp44:
	cmpl	12(%rsp), %ebx          ## 4-byte Folded Reload
	jge	LBB4_4
## %bb.3:                               ## %then
                                        ##   in Loop: Header=BB4_1 Depth=1
	movq	8(%rbp), %rax
	movl	%r15d, %r12d
	movslq	%r15d, %r15
	movl	(%rax,%r15,4), %eax
	movl	%eax, 16(%rsp)          ## 4-byte Spill
	movq	24(%rsp), %rax          ## 8-byte Reload
	movq	8(%rax), %rbp
	movq	%rbp, %rdi
	movl	%r12d, %esi
	leaq	L___unnamed_23(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp45:
	movq	8(%rbp), %rax
	movl	%ebx, (%rax,%r15,4)
	movl	%r12d, %r15d
	movq	24(%rsp), %r12          ## 8-byte Reload
	movq	8(%r12), %rbp
	movq	%rbp, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_24(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp46:
	movq	8(%rbp), %rax
	movl	16(%rsp), %ecx          ## 4-byte Reload
	movl	%ecx, (%rax,%r14,4)
	incl	%r15d
	jmp	LBB4_4
LBB4_5:                                 ## %end
	leaq	L___unnamed_25(%rip), %rdx
	movq	%r14, %rdi
	movl	%r15d, %esi
	callq	_tig_check_array_bound
Ltmp47:
	movq	8(%r14), %rax
	movslq	%r15d, %rbx
	movl	(%rax,%rbx,4), %r14d
	movq	8(%r12), %rbp
	leaq	L___unnamed_26(%rip), %rdx
	movq	%rbp, %rdi
	movl	%r15d, %esi
	callq	_tig_check_array_bound
Ltmp48:
	movq	8(%rbp), %rax
	movl	12(%rsp), %ecx          ## 4-byte Reload
	movl	%ecx, (%rax,%rbx,4)
	movq	8(%r12), %rbx
	leaq	L___unnamed_27(%rip), %rdx
	movq	%rbx, %rdi
	movq	32(%rsp), %rbp          ## 8-byte Reload
	movl	%ebp, %esi
	callq	_tig_check_array_bound
Ltmp49:
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
	.cfi_endproc
                                        ## -- End function
	.globl	_sort                   ## -- Begin function sort
	.p2align	4, 0x90
_sort:                                  ## @sort
	.cfi_startproc
## %bb.0:                               ## %entry
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
	jge	LBB5_3
	.p2align	4, 0x90
LBB5_2:                                 ## %then
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movl	%ebp, %esi
	movl	%r14d, %edx
	callq	_partition
Ltmp50:
	movl	%eax, %ebx
	leal	-1(%rbx), %edx
	movq	%r15, %rdi
	movl	%ebp, %esi
	callq	_sort
Ltmp51:
	incl	%ebx
	movl	%ebx, %ebp
	cmpl	%r14d, %ebp
	jl	LBB5_2
LBB5_3:                                 ## %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_array_test      ## -- Begin function create_array_test
	.p2align	4, 0x90
_create_array_test:                     ## @create_array_test
	.cfi_startproc
## %bb.0:                               ## %entry
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
	movl	$20, %edi
	callq	_malloc
Ltmp52:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB6_3
	.p2align	4, 0x90
LBB6_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB6_2
LBB6_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp53:
	movq	%rax, %r14
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	leaq	L___unnamed_28(%rip), %r15
	cmpl	$4, %ebx
	ja	LBB6_6
	.p2align	4, 0x90
LBB6_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp54:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jbe	LBB6_5
LBB6_6:                                 ## %end12
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L___unnamed_14:                         ## @0
	.asciz	"["

	.p2align	4               ## @1
L___unnamed_15:
	.asciz	"test/quick_sort.tig::6.67: Array out of bound"

L___unnamed_16:                         ## @2
	.space	1

L___unnamed_17:                         ## @3
	.asciz	"]"

	.p2align	4               ## @4
L___unnamed_18:
	.asciz	"test/quick_sort.tig::16.41: Array out of bound"

	.p2align	4               ## @5
L___unnamed_19:
	.asciz	"test/quick_sort.tig::24.36: Array out of bound"

	.p2align	4               ## @6
L___unnamed_20:
	.asciz	"test/quick_sort.tig::25.47: Array out of bound"

	.p2align	4               ## @7
L___unnamed_21:
	.asciz	"test/quick_sort.tig::29.46: Array out of bound"

	.p2align	4               ## @8
L___unnamed_22:
	.asciz	"test/quick_sort.tig::30.48: Array out of bound"

	.p2align	4               ## @9
L___unnamed_23:
	.asciz	"test/quick_sort.tig::34.35: Array out of bound"

	.p2align	4               ## @10
L___unnamed_24:
	.asciz	"test/quick_sort.tig::35.35: Array out of bound"

	.p2align	4               ## @11
L___unnamed_25:
	.asciz	"test/quick_sort.tig::39.43: Array out of bound"

	.p2align	4               ## @12
L___unnamed_26:
	.asciz	"test/quick_sort.tig::40.23: Array out of bound"

	.p2align	4               ## @13
L___unnamed_27:
	.asciz	"test/quick_sort.tig::41.23: Array out of bound"

	.p2align	4               ## @14
L___unnamed_28:
	.asciz	"test/quick_sort.tig::64.41: Array out of bound"

L___unnamed_1:                          ## @15
	.asciz	"Before sorting"

L___unnamed_2:                          ## @16
	.asciz	"=============="

L___unnamed_3:                          ## @17
	.asciz	"After sorting"

	.p2align	4               ## @18
L___unnamed_4:
	.asciz	"test/quick_sort.tig::78.23: Array out of bound"

	.p2align	4               ## @19
L___unnamed_5:
	.asciz	"test/quick_sort.tig::79.23: Array out of bound"

	.p2align	4               ## @20
L___unnamed_6:
	.asciz	"test/quick_sort.tig::80.23: Array out of bound"

	.p2align	4               ## @21
L___unnamed_7:
	.asciz	"test/quick_sort.tig::81.23: Array out of bound"

	.p2align	4               ## @22
L___unnamed_8:
	.asciz	"test/quick_sort.tig::82.23: Array out of bound"

	.p2align	4               ## @23
L___unnamed_9:
	.asciz	"test/quick_sort.tig::86.23: Array out of bound"

	.p2align	4               ## @24
L___unnamed_10:
	.asciz	"test/quick_sort.tig::87.23: Array out of bound"

	.p2align	4               ## @25
L___unnamed_11:
	.asciz	"test/quick_sort.tig::88.23: Array out of bound"

	.p2align	4               ## @26
L___unnamed_12:
	.asciz	"test/quick_sort.tig::89.23: Array out of bound"

	.p2align	4               ## @27
L___unnamed_13:
	.asciz	"test/quick_sort.tig::90.23: Array out of bound"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/quick_sort__code_end"
"_camlLlvm_byte_code/test/quick_sort__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/quick_sort__data_end"
"_camlLlvm_byte_code/test/quick_sort__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/quick_sort__frametable"
"_camlLlvm_byte_code/test/quick_sort__frametable":
	.short	55
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp25
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp26
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp27
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp28
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for print_array
	.quad	Ltmp29
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp30
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp31
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp32
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp33
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp34
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for create_array
	.quad	Ltmp35
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp36
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp37
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp38
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for quick_sort
	.quad	Ltmp39
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp40
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for partition
	.quad	Ltmp41
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp42
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp43
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp44
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp45
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp46
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp47
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp48
	.short	88
	.short	0
	.p2align	3
	.quad	Ltmp49
	.short	88
	.short	0
	.p2align	3
                                        ## live roots for sort
	.quad	Ltmp50
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp51
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for create_array_test
	.quad	Ltmp52
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp53
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp54
	.short	40
	.short	0
	.p2align	3
.subsections_via_symbols
