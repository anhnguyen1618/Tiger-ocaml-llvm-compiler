	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/bubble_sort__code_begin"
"_camlLlvm_byte_code/test/bubble_sort__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/bubble_sort__data_begin"
"_camlLlvm_byte_code/test/bubble_sort__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	callq	_create_array
Ltmp0:
	movq	%rax, %r14
	callq	_create_array_test
Ltmp1:
	movq	%rax, %rbx
	leaq	L___unnamed_1(%rip), %rdi
	callq	_tig_print
Ltmp2:
	movq	%r14, %rsi
	callq	_print_array
Ltmp3:
	leaq	L___unnamed_2(%rip), %rdi
	callq	_tig_print
Ltmp4:
	movq	%r14, %rsi
	callq	_bubble_sort
Ltmp5:
	leaq	L___unnamed_3(%rip), %rdi
	callq	_tig_print
Ltmp6:
	movq	%r14, %rsi
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
	movq	%rbx, %rsi
	callq	_bubble_sort
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
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
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
	.globl	_bubble_sort            ## -- Begin function bubble_sort
	.p2align	4, 0x90
_bubble_sort:                           ## @bubble_sort
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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rsi, %rdi
	callq	_tig_array_length
Ltmp39:
	addl	$-2, %eax
	movl	%eax, 4(%rsp)           ## 4-byte Spill
	xorl	%edi, %edi
	jmp	LBB3_1
	.p2align	4, 0x90
LBB3_4:                                 ##   in Loop: Header=BB3_1 Depth=1
	movl	(%rsp), %edi            ## 4-byte Reload
LBB3_1:                                 ## %test
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_3 Depth 2
	callq	_tig_not
Ltmp40:
	testl	%eax, %eax
	je	LBB3_7
## %bb.2:                               ## %test6.outer.preheader
                                        ##   in Loop: Header=BB3_1 Depth=1
	xorl	%r13d, %r13d
	movl	$1, (%rsp)              ## 4-byte Folded Spill
	jmp	LBB3_3
LBB3_6:                                 ## %then
                                        ##   in Loop: Header=BB3_3 Depth=2
	leal	-1(%r12), %esi
	movq	%rbx, %rdi
	leaq	L___unnamed_19(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp43:
	movq	8(%rbx), %rax
	movl	%ebp, (%rax,%r15,4)
	movq	%rbx, %rdi
	movl	%r12d, %esi
	leaq	L___unnamed_20(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp44:
	movq	8(%rbx), %rax
	movl	%r14d, (%rax,%r12,4)
	movl	$0, (%rsp)              ## 4-byte Folded Spill
	movl	%r12d, %r13d
	.p2align	4, 0x90
LBB3_3:                                 ## %test6
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	%r13d, 4(%rsp)          ## 4-byte Folded Reload
	jl	LBB3_4
## %bb.5:                               ## %loop7
                                        ##   in Loop: Header=BB3_3 Depth=2
	movq	%rbx, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_21(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp41:
	movq	8(%rbx), %rax
	movslq	%r13d, %r15
	movl	(%rax,%r15,4), %r14d
	incl	%r13d
	movq	%rbx, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_22(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp42:
	movq	8(%rbx), %rax
	movslq	%r13d, %r12
	movl	(%rax,%r12,4), %ebp
	cmpl	%ebp, %r14d
	jle	LBB3_3
	jmp	LBB3_6
LBB3_7:                                 ## %end
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
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
Ltmp45:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB4_3
	.p2align	4, 0x90
LBB4_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB4_2
LBB4_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp46:
	movq	%rax, %r14
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	leaq	L___unnamed_23(%rip), %r15
	cmpl	$4, %ebx
	ja	LBB4_6
	.p2align	4, 0x90
LBB4_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp47:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jbe	LBB4_5
LBB4_6:                                 ## %end12
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
	.asciz	"test/bubble_sort.tig::6.67: Array out of bound"

L___unnamed_16:                         ## @2
	.space	1

L___unnamed_17:                         ## @3
	.asciz	"]"

	.p2align	4               ## @4
L___unnamed_18:
	.asciz	"test/bubble_sort.tig::16.41: Array out of bound"

	.p2align	4               ## @5
L___unnamed_21:
	.asciz	"test/bubble_sort.tig::30.46: Array out of bound"

	.p2align	4               ## @6
L___unnamed_22:
	.asciz	"test/bubble_sort.tig::31.43: Array out of bound"

	.p2align	4               ## @7
L___unnamed_19:
	.asciz	"test/bubble_sort.tig::35.35: Array out of bound"

	.p2align	4               ## @8
L___unnamed_20:
	.asciz	"test/bubble_sort.tig::36.35: Array out of bound"

	.p2align	4               ## @9
L___unnamed_23:
	.asciz	"test/bubble_sort.tig::52.41: Array out of bound"

L___unnamed_1:                          ## @10
	.asciz	"Before sorting"

L___unnamed_2:                          ## @11
	.asciz	"=============="

L___unnamed_3:                          ## @12
	.asciz	"After sorting"

	.p2align	4               ## @13
L___unnamed_4:
	.asciz	"test/bubble_sort.tig::65.23: Array out of bound"

	.p2align	4               ## @14
L___unnamed_5:
	.asciz	"test/bubble_sort.tig::66.23: Array out of bound"

	.p2align	4               ## @15
L___unnamed_6:
	.asciz	"test/bubble_sort.tig::67.23: Array out of bound"

	.p2align	4               ## @16
L___unnamed_7:
	.asciz	"test/bubble_sort.tig::68.23: Array out of bound"

	.p2align	4               ## @17
L___unnamed_8:
	.asciz	"test/bubble_sort.tig::69.23: Array out of bound"

	.p2align	4               ## @18
L___unnamed_9:
	.asciz	"test/bubble_sort.tig::73.23: Array out of bound"

	.p2align	4               ## @19
L___unnamed_10:
	.asciz	"test/bubble_sort.tig::74.23: Array out of bound"

	.p2align	4               ## @20
L___unnamed_11:
	.asciz	"test/bubble_sort.tig::75.23: Array out of bound"

	.p2align	4               ## @21
L___unnamed_12:
	.asciz	"test/bubble_sort.tig::76.23: Array out of bound"

	.p2align	4               ## @22
L___unnamed_13:
	.asciz	"test/bubble_sort.tig::77.23: Array out of bound"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/bubble_sort__code_end"
"_camlLlvm_byte_code/test/bubble_sort__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/bubble_sort__data_end"
"_camlLlvm_byte_code/test/bubble_sort__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/bubble_sort__frametable"
"_camlLlvm_byte_code/test/bubble_sort__frametable":
	.short	48
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp13
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp17
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp20
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp21
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp22
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp23
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp24
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp25
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp26
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp27
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp28
	.short	24
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
                                        ## live roots for bubble_sort
	.quad	Ltmp39
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp40
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp41
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp42
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp43
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp44
	.short	56
	.short	0
	.p2align	3
                                        ## live roots for create_array_test
	.quad	Ltmp45
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp46
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp47
	.short	40
	.short	0
	.p2align	3
.subsections_via_symbols
