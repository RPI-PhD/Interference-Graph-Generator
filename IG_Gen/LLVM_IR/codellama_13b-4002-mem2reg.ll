; ModuleID = 'LLVM_IR/codellama_13b-4002.ll'
source_filename = "DATASETv2/codellama_13b-4002.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.user_t = type { i32, [32 x i8], [64 x i8], [64 x i8] }

@.str = private unnamed_addr constant [22 x i8] c"Adding user: %s (%s)\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Removing user: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Updating user: %d (%s, %s, %s)\0A\00", align 1
@__const.main.user = private unnamed_addr constant %struct.user_t { i32 1, [32 x i8] c"John Doe\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [64 x i8] c"johndoe@example.com\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [64 x i8] c"password\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 4
@.str.3 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"janedoe@example.com\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"new_password\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_user(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.user_t, ptr %0, i32 0, i32 1
  %3 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %4 = getelementptr inbounds %struct.user_t, ptr %0, i32 0, i32 2
  %5 = getelementptr inbounds [64 x i8], ptr %4, i64 0, i64 0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3, ptr noundef %5)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_user(i32 noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_user(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.user_t, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 4 @__const.main.user, i64 164, i1 false)
  call void @add_user(ptr noundef %1)
  %2 = getelementptr inbounds %struct.user_t, ptr %1, i32 0, i32 0
  %3 = load i32, ptr %2, align 4
  call void @remove_user(i32 noundef %3)
  %4 = getelementptr inbounds %struct.user_t, ptr %1, i32 0, i32 0
  %5 = load i32, ptr %4, align 4
  call void @update_user(i32 noundef %5, ptr noundef @.str.3, ptr noundef @.str.4, ptr noundef @.str.5)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
