; ModuleID = 'LLVM_IR/codellama_13b-11124.ll'
source_filename = "DATASETv2/codellama_13b-11124.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Account = type { i32, [50 x i8], [50 x i8], float }

@.str = private unnamed_addr constant [20 x i8] c"Account Number: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"Name: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Email: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Balance: $%.2f\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"johndoe@example.com\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"janedoe@example.com\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createAccount(i32 noundef %0, ptr noundef %1, ptr noundef %2, float noundef %3) #0 {
  %5 = call noalias ptr @malloc(i64 noundef 108) #4
  %6 = getelementptr inbounds %struct.Account, ptr %5, i32 0, i32 0
  store i32 %0, ptr %6, align 4
  %7 = getelementptr inbounds %struct.Account, ptr %5, i32 0, i32 1
  %8 = getelementptr inbounds [50 x i8], ptr %7, i64 0, i64 0
  %9 = call ptr @strcpy(ptr noundef %8, ptr noundef %1) #5
  %10 = getelementptr inbounds %struct.Account, ptr %5, i32 0, i32 2
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = call ptr @strcpy(ptr noundef %11, ptr noundef %2) #5
  %13 = getelementptr inbounds %struct.Account, ptr %5, i32 0, i32 3
  store float %3, ptr %13, align 4
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @deposit(ptr noundef %0, float noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Account, ptr %0, i32 0, i32 3
  %4 = load float, ptr %3, align 4
  %5 = fadd float %4, %1
  store float %5, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @withdraw(ptr noundef %0, float noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Account, ptr %0, i32 0, i32 3
  %4 = load float, ptr %3, align 4
  %5 = fsub float %4, %1
  store float %5, ptr %3, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayAccountInfo(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Account, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  %5 = getelementptr inbounds %struct.Account, ptr %0, i32 0, i32 1
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %6)
  %8 = getelementptr inbounds %struct.Account, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %9)
  %11 = getelementptr inbounds %struct.Account, ptr %0, i32 0, i32 3
  %12 = load float, ptr %11, align 4
  %13 = fpext float %12 to double
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %13)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @createAccount(i32 noundef 1234, ptr noundef @.str.4, ptr noundef @.str.5, float noundef 1.000000e+03)
  %2 = call ptr @createAccount(i32 noundef 5678, ptr noundef @.str.6, ptr noundef @.str.7, float noundef 2.000000e+03)
  call void @deposit(ptr noundef %1, float noundef 5.000000e+02)
  call void @withdraw(ptr noundef %2, float noundef 1.000000e+03)
  call void @displayAccountInfo(ptr noundef %1)
  call void @displayAccountInfo(ptr noundef %2)
  call void @free(ptr noundef %1) #5
  call void @free(ptr noundef %2) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
