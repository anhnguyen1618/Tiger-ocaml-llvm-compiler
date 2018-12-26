default: main

parse: parse.native

main: main.native

test: test.native

%.native: 
	ocamlbuild -tag 'debug, explain' -use-menhir -use-ocamlfind src/$@
	mv _build/src/$@ bin/$*

.PHONY: test default
