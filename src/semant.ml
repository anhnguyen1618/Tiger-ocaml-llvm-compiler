module E = Env
module T = Types
module A = Absyn
module S = Symbol
module Err = Error.Error
module U = Util

type venv = E.enventry Symbol.table
type tenv = T.ty Symbol.table
type expty = {exp: Translate.exp; ty: T.ty}
type decty =  {v_env : venv; t_env: tenv; expList: Translate.exp list}

type arg_name_type_map = { name: S.symbol; ty: T.ty }

let nested_loop_level = ref 0
let change_nested_loop_level oper = nested_loop_level := oper !nested_loop_level 1
let increase_nested_Level () = change_nested_loop_level (+)
let decrease_nested_level () = change_nested_loop_level (-)
let get_nested_level () = !nested_loop_level


let trans_type ((t_env: tenv), (ty: A.ty)): T.ty =

  let look_up_type ((s: S.symbol), (p: int)): T.ty =
    match S.look(t_env, s) with
      Some t -> t
    | None -> (Err.error p ("Type " ^ S.name(s) ^ " has not been declared\n"); T.NIL) in

  let map_field_to_record (A.Field {name; typ; pos; escape = _}): S.symbol * T.ty =
    (name, look_up_type(typ, pos)) in
		    
  let check_record (fields: A.field list): T.ty =
    T.RECORD (List.map map_field_to_record fields, ref ()) in

  let check_array_type e = T.ARRAY(look_up_type e, ref()) in
			 
  let trans_ty: A.ty -> T.ty = function
    | A.NameTy (s, p) -> look_up_type (s, p)
    | A.RecordTy e -> check_record e
    | A.ArrayTy (s, p) -> check_array_type (s, p)
  in
  trans_ty ty

let transDec (
        (v_env: venv),
        (t_env: tenv),
        (level: Translate.level),
        (exps: Absyn.dec list),
        break
      ): decty =
  let check_var_dec (
          (v_env: venv),
          (t_env: tenv),
          A.VarDec { name; typ; init; pos; escape },
          expList
        ) =
    let {exp = initueIrExp; ty = rhs_type} = {exp = (); ty = T.UNIT}(*transExp (v_env, t_env, level, init, break) *)
    in
    
    let create_assign_stm access =
      expList (* @ [Translate.assignStm(Translate.simpleVar(access, level), initueIrExp)] *)
    in
    match typ with
      Some (s, p) ->
       (match S.look(t_env, s) with
	  Some lhs_type ->
           if T.eq(lhs_type, rhs_type)
	   then (
	     let access = () in(*Translate.allocLocal(level)(!escape)*)
             let new_entry = E.VarEntry{ty = lhs_type; access = access} in
	     let new_v_env = S.enter(v_env, name, new_entry) in
	     {
               v_env = new_v_env;
	       t_env = t_env;
	       expList = create_assign_stm (access)
	     }
           )
	   else (
             let msg = Printf.sprintf
                         "Can't assign exp type '%s' to type '%s'"
                         (T.name(rhs_type)) (S.name(s)) in 
             Err.error p msg;
	     {v_env = v_env; t_env = t_env; expList = expList}
           )
	| None -> (
          let msg = Printf.sprintf
                      "Type '%s' has not been declared"
                      (S.name(s)) in
          Err.error pos msg;
	  {v_env = v_env; t_env = t_env; expList = expList})
       )
    | None -> ( if T.eq(rhs_type, T.NIL) (* case  var a := nil *)
		then (Err.error pos ("Can't assign Nil to non-record type variable"));		
		let access = () (*Translate.allocLocal(level)(!escape)*) in
                let new_entry = E.VarEntry{ty = rhs_type; access = access} in
		{
		  v_env = S.enter(v_env, name, new_entry);
		  t_env = t_env;
		  expList = create_assign_stm (access)
		}
	      )
  in
		

  let check_type_dec (
          (v_env: venv),
          (t_env: tenv),
          (types: A.typeDec list),
          expList
        ) =
    let add_dump_type t_env (A.Type {name; _}) =
      S.enter(t_env, name, T.NAME(name, ref None)) in
    
    let dumb_t_env = List.fold_left add_dump_type t_env types in
    
    let f { v_env; t_env; expList } (A.Type {name; ty; pos}) =
      {t_env = S.enter(t_env, name, trans_type(t_env, ty)); v_env = v_env; expList = expList}
    in
    U.check_circular types;
    List.fold_left f {v_env = v_env; t_env = dumb_t_env; expList = expList} types
  in

  let check_func_dec (
          (v_env: venv),
          (t_env: tenv),
          (fs: A.fundec list),
          expList) =
    let look_type_up (s, p): T.ty =
      match S.look(t_env, s) with
	Some t -> t
      | None -> (Err.error p ("Type " ^ S.name(s) ^ "has not been declared"); T.NIL)
    in

    let get_type_for_result = function
      | Some (s, p) -> look_type_up (s, p)
      | None -> T.UNIT
    in
   
    let get_type (A.Field {name; escape = _; typ; pos}): arg_name_type_map =
      {name = name; ty = look_type_up (typ, pos)}
    in

    let check_result_type (expectType, resultType) =
      if T.eq(expectType, T.UNIT) then true
      else T.eq(expectType, resultType)
    in
    
    let add_func_header acc (A.Func {name; params; result; body; pos}) =
      let f param = get_type param |> (fun x -> x.ty) |> (U.actual_ty t_env) in
      let type_list = List.map f params in
      let result_type = get_type_for_result result in
      let label = Temp.newlabel in
      S.enter(acc, name, E.FunEntry{
                             formals = type_list;
                             result = result_type;
                             label = name;
                             level = level})
    in
						
    let add_new_func_entry (cur_v_env: venv) (A.Func {name; params; result; body; pos}) = 
      let types: arg_name_type_map list = List.map get_type params in
      let result_type = get_type_for_result result in
      let escapes = List.map (fun (A.Field x) -> !(x.escape)) params in
      let label = match S.look(cur_v_env, name) with
	| Some(E.FunEntry {label; _}) -> label
	| _ -> Temp.newlabel() in
					       
      let func_level = Translate.outermost
      (*Translate.newLevel
        {parent = level; name = label; formals = escapes}*) in

      let param_accessed = [](*Translate.formals func_level*) in
							      
      let add_params_to_body (temp, i) ({name; ty}: arg_name_type_map) =
        let mapping = S.enter(
              temp,
              name,
	      E.VarEntry({ ty = ty; access = (List.nth param_accessed i)})) in
	( mapping, i + 1)
      in

      
      
      let startAccessIndex = 1 in (* First access is static link, first front- args is allocated at index 1*)
      let (bodyVenv, _) = List.fold_left add_params_to_body (cur_v_env, startAccessIndex) types in
      let {exp = bodyIr; ty = body_type } = (*transExp(bodyVenv, t_env, func_level, body, break) *) {exp = (); ty = T.UNIT}
      in
      (*Translate.procEntryExit {level = func_level; body = bodyIr};*)
      (if check_result_type(result_type, body_type) then ()
       else 
         let msg = Printf.sprintf "return type '%s'  does not match with '%s'"
                     (T.name body_type) (T.name result_type) in
         Err.error pos msg);
       cur_v_env
    in

    let base_env = List.fold_left add_func_header v_env fs in
    let newv_env = List.fold_left add_new_func_entry base_env fs in
    {v_env = newv_env; t_env = t_env; expList = expList}
  in

  let trDec = function
    | (v_env, t_env, (A.VarDec _ as e), expList) -> check_var_dec (v_env, t_env, e, expList)
    | (v_env, t_env, A.TypeDec(e), expList) -> check_type_dec (v_env, t_env, e, expList)
    | (v_env, t_env, A.FunctionDec(e), expList) -> check_func_dec (v_env, t_env, e, expList)
  in
						       
  let helper = fun {v_env = v_env; t_env = t_env; expList} dec -> trDec(v_env, t_env, dec, expList) in
  let result = List.fold_left helper {v_env = v_env; t_env = t_env; expList = []} exps in
  result

  and trans_var (
        (v_env: venv),
        (t_env: tenv),
        (level: Translate.level),
        (exp: Absyn.var),
        (break: Temp.label)
      ): expty =

    let actual_ty = U.actual_ty t_env in
    let check_simple_var ((s: S.symbol), (pos: int)) =
      match S.look(v_env, s) with
        Some(E.VarEntry({ty; access})) -> {exp = (*Translate.simpleVar(access, level)*) (); ty = actual_ty ty}
      | Some _ -> {exp = (*Translate.intExp(0)*) (); ty = T.NIL}
      | None -> (Err.error pos ("variable '" ^ S.name(s) ^"' has not been declared\n");
	         {exp = (*Translate.intExp(0)*) (); ty = T.NIL})
    in
    
    let rec check_field_var (obj, s, pos) =
      let {exp = recExp; ty = ty } = tr_var obj in
      let typeWithObj = actual_ty ty
      in
      match typeWithObj with
      | T.RECORD (tys, _) ->
	 let index = ref (-1) in
         let matchedField = List.find_opt
                              (fun (symbol, _) -> (index := !index + 1; S.eq(s, symbol))) tys
         in
         (match matchedField with
         | Some (_, ty) -> {exp = ()(*Translate.fieldVar(recExp, !index)*); ty = ty}
         | None -> (
           let msg = Printf.sprintf "Property '%s' does not exist on type '%s'\n"
                       (S.name s) (T.name typeWithObj) in
           Err.error pos msg;
	   {exp = () (*Translate.intExp(0)*); ty = T.NIL}))
      | _ -> (Err.error pos ("Can't access property '"
			     ^ S.name(s) ^ "' with type '"
			     ^ T.name(typeWithObj) ^ "'");
	      {exp = () (*Translate.intExp(0)*); ty = T.NIL})
    and check_array_var (var, sizeExp, pos) =
      let {exp = arrayExp; ty = ty} = tr_var var in
      let typeWithArr = actual_ty ty in
      match typeWithArr with
      | T.ARRAY (ty, _) ->
	 let  {exp = sizeIrExp; ty = sizety} = transExp(v_env, t_env, level, sizeExp, break) in
         if T.eq(sizety, T.INT)
         then {exp = () (*Translate.subscriptVar(arrayExp, sizeIrExp)*); ty = ty}
         else (Err.error pos "index with array is not int"; {exp = ()(*Translate.intExp(0)*); ty = T.NIL})
      | _ -> (
        Err.error pos ("Can't access member with non-array type");
        {exp = () (*Translate.intExp(0)*); ty = T.NIL})		    
    and tr_var = function
      | A.SimpleVar (s, p) -> check_simple_var (s, p)
      | A.FieldVar (var, e, p) -> check_field_var (var, e, p)
      | A.SubscriptVar (var, e, p) -> check_array_var (var, e, p)
    in
    tr_var exp

  and trans_exp (
       (v_env: venv),
       (t_env: tenv),
       (level: Translate.level),
       (exp: Absyn.exp),
       (break: Temp.label))(*: expty *) =
    let actual_ty = U.actual_ty t_env in
    let actual_ty_exp x = x.ty |> actual_ty in

    let rec checkTypeOp (A.OpExp{left; oper; right; pos}) =
      let (leftResult, rightResult) = (tr_exp left, tr_exp right) in
      let {exp = leftIr; ty = leftTy} = leftResult in
      let {exp = rightIr; ty = rightTy} = rightResult in

      U.assert_type_eq (actual_ty leftTy, T.INT, pos, "Interger is require");
      U.assert_type_eq (actual_ty rightTy, T.INT, pos, "Interger is require");
      {exp = ()(*Translate.opExp(leftIr, oper, rightIr)*); ty = T.INT}

    and checkFnCallExp (A.CallExp {func; args; pos}) =
      let check_param acc (exp, ty): Translate.exp list =
	let {exp = argIr; ty = arg_type } = trExp exp in
        let actualArgType = actual_ty arg_type in
        let msg = Printf.sprintf "Mismatched types with function args.
                                  Expect: '%s'. Received: '%s'"
                    (T.name ty) (T.name actualArgType) in
	U.assert_type_eq (ty, actualArgType, pos, msg);
        argIr :: acc

      in
      match S.look(v_env, func) with
      | Some (E.FunEntry({formals; result; label; level = decLevel})) ->
         let arg_formal_pairs = List.map2 (fun a b -> (a, b)) args formals in
	 let argIrs = List.fold_left check_param [] arg_formal_pairs in
	 {exp = (*Translate.letCallExp(decLevel, level, label, argIrs)*)(); ty = result}

      | Some _ ->
         Err.error pos (S.name(func) ^ " does not have type letction");
	 {exp = (*Translate.nilExp()*)(); ty = T.UNIT}
      | None ->
         Err.error pos ("Function '" ^ S.name(func) ^ "' can't be found");
	 { exp = (*Translate.nilExp()*) (); ty = T.UNIT}

    and checkRecordExp (A.RecordExp {fields; typ; pos}) =
      let preFields = List.map (fun (symbol, exp, pos) -> (symbol, tr_exp(exp), pos)) fields in
      let fieldLetsIR = List.map (fun (_, { exp; _ }, _) -> exp) preFields in
      let fieldExps = List.map (fun (symbol, exp, pos) -> (symbol, actual_ty_exp exp, pos)) preFields in
      match S.look(t_env, typ) with
	Some (T.RECORD (types, refer)) ->
	 let rec checkFields = function
           | [] -> []
	   | (s, t, p) :: tl ->
              let matchedField = List.find_opt (fun (symbol, _) -> S.eq(s, symbol)) types
              in
              (match matchedField with
               | Some(symbol, typeExp) ->
                  let msg = Printf.sprintf
                              "Mismatched types with fields property: '%s'.
                               Expect: '%s'. Received: '%s'"
                              (S.name s) (T.name typeExp) (T.name t) in
                  U.assert_type_eq (t, actual_ty(typeExp), p,msg);
                  (symbol,typeExp) :: checkFields(tl)
               | None  ->
                  Err.error pos ("Field '" ^ S.name(s) ^ "' is unknown in type " ^ S.name(typ));
                  checkFields(tl))

	     in
	     if List.length fieldExps <> List.length types
	     then (Err.error pos ("RecordExp and record type '" ^ S.name(typ) ^ "' doesn't match");
		   {exp = (*Translate.recordDec(fieldLetsIR)*) (); ty = T.RECORD (types, refer)})
	     else
	       let typesInCreateOrder = checkFields fieldExps in
	       {exp = (*Translate.recordDec(fieldLetsIR)*)(); ty = T.RECORD (typesInCreateOrder, refer)}
			    
      | Some _ -> (Err.error pos (S.name(typ) ^ " does not have type record");
		   {exp = (*Translate.intExp(0)*)(); ty = T.RECORD ([], ref ())})
      | None -> (Err.error pos ("type " ^ S.name(typ)  ^ " can't be found");
		 {exp = (*Translate.intExp(0)*)(); ty = T.RECORD ([], ref ())})

    and checkSeqExp (xs) =
      match List.length xs with
	0 -> {exp = ()(*Translate.nilExp()*); ty=T.UNIT}
      | _ -> 
	 let results = List.map (fun (exp, _) -> tr_exp exp) xs in
         let irExps = List.map (fun x -> x.exp) results in
         if (List.length results) = 0
         then {exp = (); ty = T.NIL}
         else
           let typ = List.nth results (List.length(results) -1) in
	   {exp = ()(*Translate.seqExp(irExps)*); ty = typ}


    and checkAssignExp (A.AssignExp{var; exp; pos}) =
      let {ty = typeLeft; exp = leftExp} = trans_var (v_env, t_env, level, var, break) in 
      let {ty = typeRight; exp = rightExp} = trExp exp in 
      let msg = "Can't assign type " ^ T.name(typeRight) ^ " to type " ^ T.name(typeLeft) in
      U.assert_type_eq (typeLeft, typeRight, pos, msg);
      {exp=(*Translate.assignStm(leftExp, rightExp)*)(); ty=T.UNIT }


    and checkIfExp (A.IfExp {test = testExp; then' = thenExp; else' = elseOption; pos})  =
      let {exp = testIr; ty = testTy} = tr_exp testExp in
      let {exp = thenIr; ty = thenTy} = trExp thenExp in
      U.assert_type_eq (actual_ty testTy, T.INT, pos,
                          "if test clause does not have type int");
      match elseOption with
      | None -> {exp = () (*Translate.ifExp(testIr, thenIr, NONE)*); ty= thenTy}
      | Some elseExp ->
	 let {exp = elseIr; ty = elseTy} = trExp elseExp in
	 U.assert_type_eq (actual_ty thenTy,
			   actual_ty elseTy,
			   pos,
			   "Mismatched types between then and else");
	 {exp = (*Translate.ifExp(testIr, thenIr, Some(elseIr))*)(); ty = elseTy}


    and checkWhileExp (A.WhileExp{test; body; pos}) =
      let _ = increase_nested_Level() in
      let {exp = testExp; ty = testTy} = trExp test in
      let doneLabel = Temp.newlabel() in
      let {exp = bodyExp; ty = _} = transExp (v_env, t_env, level, body, doneLabel) in
      let _ = decrease_nested_level()  in
      U.assert_type_eq (actual_ty testTy, T.INT, pos, "while test clause does not have type int");		      
      { exp = () (*Translate.whileExp(testExp, bodyExp, doneLabel)*); ty = T.UNIT }

      
    and checkForExp (e) =

      let whileAST = A.rewriteForExp(e)
      (* let loTy = (actual_ty_exp o trExp o #lo) e
		    let hiTy = (actual_ty_exp o trExp o #hi) e
		    let _ = checkTypeEq (loTy, T.INT, pos, "from-for clause does not have type int")
		    let _ = checkTypeEq (hiTy, T.INT, pos, "to-for clause does not have type int") *)
      in
      trExp whileAST
		    
    and checkLetExp (A.LetExp{decs; body; pos}) =

      let {v_env; t_env; expList} = transDec(v_env, t_env, level, decs, break) in
      let {exp = body; ty} = transExp (v_env, t_env, level, body, break) in 
      let newBody = () (*Translate.concatExpList(expList, body)*) in
      {exp = newBody; ty= ty}


	    and checkArrayExp ({typ, size, init, pos}) =
		match S.look(t_env, typ) with
		    Some (T.ARRAY(ty, unique)) ->
		    let
			let sizeResult = trExp size
			let initResult = trExp init
		    in
			(checkTypeEq (actual_ty_exp sizeResult, T.INT, pos, "Size with array must have type " ^ T.name(T.INT));
			 checkTypeEq (actual_ty_exp initResult, ty, pos, "Initialize letue with array does not have type " ^ T.name(ty));
			 {exp = Translate.arrayDec(#exp sizeResult, #exp initResult), ty = T.ARRAY(ty, unique)})
		    end
			
		  | Some _ -> (Err.error pos (S.name(typ) ^ " does not exist"); {exp = Translate.unitExp(), ty = T.ARRAY(T.NIL, ref ())})
		  | NONE -> (Err.error pos ("Type " ^ S.name(typ) ^ " could not be found"); {exp = Translate.unitExp(), ty = T.ARRAY(T.NIL, ref ())})
		
		    
							
	    and trExp (A.VarExp(var)) = transVar(v_env, t_env, level, var, break)
	      | trExp (A.NilExp) = {exp = Translate.nilExp(), ty = T.NIL}
	      | trExp (A.IntExp e) = {exp = Translate.intExp(e), ty = T.INT}
	      | trExp (A.StringExp (str, _)) = {exp = Translate.stringExp(str), ty = T.STRING}
	      | trExp (A.CallExp e) = checkFnCallExp e
	      | trExp (A.OpExp e) = checkTypeOp e
	      | trExp (A.RecordExp e) = checkRecordExp e
	      | trExp (A.SeqExp e) = checkSeqExp e
	      | trExp (A.AssignExp e) = checkAssignExp e
	      | trExp (A.IfExp e) = checkIfExp e
	      | trExp (A.WhileExp e) = checkWhileExp e
	      | trExp (A.ForExp e) = checkForExp e
	      | trExp (A.BreakExp pos) = (if getNestedLoopLevel() > 0 then () else Err.error pos "Break exp is not nested inside loop";
					  {exp = Translate.breakExp(break), ty = T.STRING})
	      | trExp (A.LetExp e) = checkLetExp e
	      | trExp (A.ArrayExp e) = checkArrayExp e
	in	    
	    trExp exp
	end

    let transProg (my_exp : A.exp): F.frag list = 
	let
	    let mainlabel = Temp.newlabel()
	    let mainlevel = Translate.newLevel {parent=Translate.outermost, name=mainlabel, formals=[]}
	    let _ = FindEscape.findEscape my_exp
	    (* The reason that we have to use mainlevel instead with outermost here is that we can't alloc local on outermost *)
	    (* See alloclocal letction in translate.sml*)
	    let {exp = mainexp, ty = _} = transExp(Env.base_venv, Env.base_tenv, mainlevel, my_exp, mainlabel)
	    let _ = Translate.procEntryExit {level=mainlevel, body=mainexp};
	    let resultIR = Translate.getResult()
					      
	    let printFn = fn exp -> Printtree.printtree (TextIO.stdOut, exp)
	in
	    Translate.convertToStm mainexp;
	    resultIR
	end

    let testIR (name: string) =
	transProg(Parse.parse name)
   
    
    


