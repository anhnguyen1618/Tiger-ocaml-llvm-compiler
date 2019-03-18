; ModuleID = 'llvm_byte_code/test/fac.tig.ll'
source_filename = "Tiger jit"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @factorial({ i32 }* %frame_pointer, i32 4)
  ret i32 0
}

define i32 @factorial({ i32 }*, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %eq_tmp = icmp eq i32 %1, 1
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  %minus_tmp = sub i32 %1, 1
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %2 = call i32 @factorial({ i32 }* %fp_addr, i32 %minus_tmp)
  %mul_tmp = mul i32 %1, %2
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result_addr.0 = phi i32 [ 1, %then ], [ %mul_tmp, %else ]
  ret i32 %if_result_addr.0
}
