default: main

parse: parse.native

main: main.native

single_test:
	./bin/parse test/$(f) 	

	opt -f -S llvm_byte_code/test/$(f).ll -o llvm_byte_code/test/$(f)-opt.ll \
    	-mem2reg -adce -argpromotion -constmerge -globaldce -globalopt \
    	-loop-deletion -constprop

	llc llvm_byte_code/test/$(f)-opt.ll

	clang llvm_byte_code/test/$(f)-opt.s src/bindings.c -o run_prog

	./run_prog

%.native:
	echo "================= COMPILING COMPILER =================\n"
	ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind -package llvm  src/$@
	mv _build/src/$@ bin/$*
	./bin/parse test/$(f) 

	echo "================= OPTIMIZING LLVM ====================\n"
	opt -f -S llvm_byte_code/test/$(f).ll -o llvm_byte_code/test/$(f)-opt.ll \
    	-mem2reg -adce -argpromotion -constmerge -globaldce -globalopt \
    	-loop-deletion -constprop

	echo "================= COMPILING LLVM =====================\n"
	llc llvm_byte_code/test/$(f)-opt.ll

	echo "================= LINKING ============================\n"
	clang llvm_byte_code/test/$(f)-opt.s src/bindings.c -o run_prog

.PHONY: test default
