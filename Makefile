default: main

parse: parse.native

main: main.native

test: test.native

%.native: 
	ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind -package llvm  src/$@
	mv _build/src/$@ bin/$*

.PHONY: test default
