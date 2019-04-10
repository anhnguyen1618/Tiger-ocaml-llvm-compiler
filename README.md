# LLVM Compiler for Tiger programming language

[![Build Status](https://travis-ci.org/anhnguyen300795/Tiger-ocaml-llvm.svg?branch=master)](https://travis-ci.org/anhnguyen300795/Tiger-ocaml-llvm-compiler)

A minimal compiler written in OCaml that compiles Tiger to LLVM IR and subsequently to target-dependent assembly code

### Tiger programming language 
[Link to manual](https://www.lrde.epita.fr/~tiger/tiger.html)

Sample Tiger code:
```ocaml module
let
  function fib (n: int): int =
    if n = 0 then 0
    else if n = 1 then 1
    else fib(n-1) + fib(n-2)

  type node = {data: my_int, next: node}
  type my_int = int
  var a := node {data = 3, next = nil}
  var b := node {data = 2, next = a}

  type intFun = int -> int
  type intIntFun = int -> intFun
  function f(a: int): intIntFun =
    let
      function g(b: int): intFun =
        let
          function k(c: int): int = a + b + c
        in
          k
        end
    in
      g
    end
in
  assert_int(fib (0), 0);
  assert_int(fib (30), 832040);
  assert_int(b.next.data, 3);
  assert_int(f(1)(2)(3), 6)
end
```

### Technologies
 * [OCaml](https://www.docker.com/): OCaml programming language
 * [OCamllex](https://caml.inria.fr/pub/docs/manual-ocaml/lexyacc.html): Lexer
 * [Menhir](http://cristal.inria.fr/~fpottier/menhir/): LR(1) parser
 * [LLVM](http://llvm.org/): LLVM compiler framework
 * [Clang](https://clang.llvm.org/): C compiler
 * [Travis](https://travis-ci.com/): CI-testing

### Required software

 * llvm-6.0-dev
 * opam-1.2.2 
 * ocaml-4.05.0
 * python-2.7
 * ocamlbuild
 * ocamlfind
 * llvm (opam package)

See ```.travis.yml``` for more details

### Usage
After cloning this repo, please create new output directory ```/llvm_byte_code/test/``` with the command:
```node module
mkdir llvm_byte_code/test
```

Tiger test file ```<test_file_name>.tig``` must be placed directly under directory ```./test```

Compile file ```test/<test_file_name>.tig``` without executing the output binary run_prog:
```node module
make parse -f=<test_file_name>.tig
```
This command generates the binary executable file ```run_prog``` in the current directory. This file can be executed with the command:
```node module
./run_prog
```

To compile and run test on Tiger file ```test/<test_file_name>.tig``` in one command:

```node module
python test.py -s <name>
```

Compile and run all Tiger test files in directory ```./test```:

```node module
python test.py
```
or 
```node module
./compile
```

The **LLVM IR** results and **assembly** code emitted by compiling file ```test/<test_file_name>.tig``` can be found in directory ```/llvm_byte_code/test/```:
```
  * <test_file_name>.tig.ll               # LLVM IR code
  * <test_file_name>.tig-opt.ll           # Optimized IR codes
  * <test_file_name>.tig-opt.s            # Assembly code
```


