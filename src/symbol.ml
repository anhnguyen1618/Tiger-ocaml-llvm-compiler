type symbol = string * int

exception Symbol
let nextsym = ref 0
let size_hint = 128

module H = Hashtbl

let hashtable: (string, int) H.t  = H.create size_hint    
    
let symbol name =
  match H.find_opt hashtable name with
    Some i -> (name,i)
  | None -> let i = !nextsym in
            nextsym := i+1;
            H.add hashtable name i;
	    (name,i)


let name ((s: string), _): string = s
                                         
module Table = Map.Make(
                   struct
                     type t = symbol
                     let compare (_,n1) (_,n2) = compare n1 n2
                   end)

let eq (a,b) = a = b 

type 'a table= 'a Table.t
let empty = Table.empty
let enter (t, k, v) = Table.add k v t
let look (t, k) = Table.find_opt k t
         

