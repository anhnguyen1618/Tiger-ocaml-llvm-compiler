type temp

val newtemp: unit -> temp

val makestring: temp -> string

type label = Symbol.symbol

val newlabel: string -> label

val eq: temp * temp -> bool

val namedlabel: string -> label
      
