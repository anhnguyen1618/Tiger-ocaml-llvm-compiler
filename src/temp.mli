type temp

val newtemp: unit -> temp

val makestring: temp -> string

type label = Symbol.symbol

val newlabel: unit -> label

val eq: temp * temp -> bool

val namedlabel: string -> label
      
