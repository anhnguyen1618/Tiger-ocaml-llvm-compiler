module type Error =
sig
    val file_name : string ref
    val line_num : int ref
    val line_pos : int list ref
    val error : int -> string -> unit
    val gen_err_message: int -> string -> string
    exception Error
    val impossible : string -> 'a   (* raises Error *)
end

module Error: Error = struct
  let file_name = ref ""
  let line_num = ref 1
  let line_pos = ref [1]

  exception Error

  let gen_err_message pos msg =
    let rec look  = function
      | (a::rest, n) -> if a < pos
                        then (":" ^ string_of_int(n) ^ "." ^ string_of_int(pos - a))
                        else look(rest, n -1)
      | _ -> "0.0"
    in
    let location = !file_name ^ ":" ^(look(!line_pos, !line_num)) in
    location ^ ": " ^ msg
    

  let error pos (msg: string) =
    print_string (gen_err_message pos msg);
    exit 1


  let impossible msg =
    print_string ("Error: Compiler bug: " ^ msg ^ "\n");
    raise Error
   
  
end
