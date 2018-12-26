type temp = int
type label = Symbol.symbol
		 
let temps = ref 99
let labelCount = ref (-1)
               
module Table = Map.Make(
  struct
    type t = temp
    let compare = Pervasives.compare
  end)


let newtemp () = (temps := !temps + 1; !temps)

let makestring t = "t" ^ string_of_int t

let newlabel () = (labelCount := !labelCount + 1; Symbol.symbol("L" ^ string_of_int(!labelCount)))

let eq ((a: temp), (b: temp)): bool = a = b
					 
let namedlabel = Symbol.symbol
