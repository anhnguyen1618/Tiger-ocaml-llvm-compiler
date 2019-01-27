default: main

parse: parse.native

main: main.native

test: test.native

%.native: 
	ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind -package llvm  src/$@
	mv _build/src/$@ bin/$*
	./bin/parse test/$(f) 

	opt -f -S llvm_byte_code/test/$(f).ll -o llvm_byte_code/test/$(f)-opt.ll \
    	-mem2reg -adce -argpromotion -constmerge -globaldce -globalopt \
    	-loop-deletion -constprop

	llc llvm_byte_code/test/$(f)-opt.ll

	clang llvm_byte_code/test/$(f).s src/bindings.c -o run_prog

.PHONY: test default
