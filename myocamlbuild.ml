(*open Ocamlbuild_plugin;;

tag_any ["package(llvm, llvm.executionengine, llvm.all_backends, llvm.analysis)"];;
 *)

open Ocamlbuild_plugin

let () =
  dispatch
    (function
     | After_rules ->
          ocaml_lib ~extern:true "llvm";
          ocaml_lib ~extern:true "llvm_analysis";
          ocaml_lib ~extern:true "llvm_bitwriter";

          flag ["link"; "ocaml"; "g++"] (S[A"-cc"; A"g++"; A"-cclib"; A"-rdynamic"]);

          dep ["link"; "ocaml"; "use_bindings"] ["src/bindings.o"]

     | _ -> ()
    )
