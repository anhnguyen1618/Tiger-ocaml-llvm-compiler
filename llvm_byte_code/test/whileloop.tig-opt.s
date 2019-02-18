	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/whileloop__code_begin"
"_camlLlvm_byte_code/test/whileloop__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/whileloop__data_begin"
"_camlLlvm_byte_code/test/whileloop__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	xorl	%ebx, %ebx
	cmpl	$4, %ebx
	jle	LBB0_2
	jmp	LBB0_3
	.p2align	4, 0x90
LBB0_4:                                 ## %else
                                        ##   in Loop: Header=BB0_2 Depth=1
	incl	%ebx
	cmpl	$4, %ebx
	jg	LBB0_3
LBB0_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	_tig_print_int
Ltmp0:
	cmpl	$3, %ebx
	jne	LBB0_4
LBB0_3:                                 ## %end
	leal	2(%rbx), %ebp
	movl	$3, %esi
	movl	%ebx, %edi
	callq	_assert_equal_int
Ltmp1:
	movl	$5, %esi
	movl	%ebp, %edi
	callq	_assert_equal_int
Ltmp2:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

	.globl	"_camlLlvm_byte_code/test/whileloop__code_end"
"_camlLlvm_byte_code/test/whileloop__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/whileloop__data_end"
"_camlLlvm_byte_code/test/whileloop__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/whileloop__frametable"
"_camlLlvm_byte_code/test/whileloop__frametable":
	.short	3
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
.subsections_via_symbols
