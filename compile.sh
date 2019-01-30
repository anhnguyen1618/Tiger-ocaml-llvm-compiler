#!/bin/bash

RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
RESET='\033[0m'       # Text Reset

TICK_ICON='\u2713'
X_ICON='\u2718'

TEST_DIRECTORY=test/*.tig

FILE_NAME_PATTERN='.*.tig$'

TEST_FILES=()

print_success() {
    printf "${GREEN}${TICK_ICON} $1${RESET}\n"
}

print_error() {
    printf "${RED} ${X_ICON} $1${RESET}\n"
}

run_all_test_cases() {
    printf "${GREEN}==================== RUN ALL TESTS ====================${RESET}\n"

    number_of_failed_test=0
    error_msg=""
    
    for file in $TEST_DIRECTORY
    do
        file_name=${file##*/}
	test_single_case $file_name
	if [ $? -eq 0 ]; then
	    print_success "${file_name}"
	else
	    print_error "${file_name}"
	    number_of_failed_test+=1
	    error_msg+="- ${file_name}\n"
	fi
    done

    if [ $number_of_failed_test -eq 0 ]; then
	printf "${GREEN}==================== ALL TESTS PASSED ====================${RESET}\n"
    else
	printf "${RED}==================== ${number_of_failed_test} TESTS FAILED ====================${RESET}\n"
        echo -e $error_msg
	exit 1
    fi
    
}

build_ocaml_compiler() {
    ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind -package llvm src/parse.native && \
	mv _build/src/parse.native bin/compiler
    if [ $? -ne 0 ]; then
	print_error "BUILD OCAML COMPILER FAILED"
	exit 1
    fi
}


test_single_case() {
    ./bin/compiler test/$1 && \

	opt -f -S llvm_byte_code/test/$1.ll -o llvm_byte_code/test/$1-opt.ll \
	    -mem2reg -adce -argpromotion -constmerge -globaldce -globalopt \
	    -loop-deletion -constprop && \

	llc llvm_byte_code/test/$1-opt.ll && \

	clang llvm_byte_code/test/$1-opt.s src/bindings.c -o run_prog && \

	./run_prog
}

build_ocaml_compiler && run_all_test_cases
