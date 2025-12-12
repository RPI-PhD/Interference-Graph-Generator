; ModuleID = 'DATASETv2/codellama_13b-11124.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createAccount(i32 noundef %0, ptr noundef %1, ptr noundef %2, float noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca float, align 4
  %9 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store float %3, ptr %8, align 4
  %10 = call noalias ptr @malloc(i64 noundef 108) #4
  store ptr %10, ptr %9, align 8
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %9, align 8
  %13 = getelementptr inbounds %struct.Account, ptr %12, i32 0, i32 0
  store i32 %11, ptr %13, align 4
  %14 = load ptr, ptr %9, align 8
  %15 = getelementptr inbounds %struct.Account, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = load ptr, ptr %6, align 8
  %18 = call ptr @strcpy(ptr noundef %16, ptr noundef %17) #5
  %19 = load ptr, ptr %9, align 8
  %20 = getelementptr inbounds %struct.Account, ptr %19, i32 0, i32 2
  %21 = getelementptr inbounds [50 x i8], ptr %20, i64 0, i64 0
  %22 = load ptr, ptr %7, align 8
  %23 = call ptr @strcpy(ptr noundef %21, ptr noundef %22) #5
  %24 = load float, ptr %8, align 4
  %25 = load ptr, ptr %9, align 8
  %26 = getelementptr inbounds %struct.Account, ptr %25, i32 0, i32 3
  store float %24, ptr %26, align 4
  %27 = load ptr, ptr %9, align 8
  ret ptr %27
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @deposit(ptr noundef %0, float noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %5 = load float, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Account, ptr %6, i32 0, i32 3
  %8 = load float, ptr %7, align 4
  %9 = fadd float %8, %5
  store float %9, ptr %7, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @withdraw(ptr noundef %0, float noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca float, align 4
  store ptr %0, ptr %3, align 8
  store float %1, ptr %4, align 4
  %5 = load float, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Account, ptr %6, i32 0, i32 3
  %8 = load float, ptr %7, align 4
  %9 = fsub float %8, %5
  store float %9, ptr %7, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayAccountInfo(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Account, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Account, ptr %7, i32 0, i32 1
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Account, ptr %11, i32 0, i32 2
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %13)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Account, ptr %15, i32 0, i32 3
  %17 = load float, ptr %16, align 4
  %18 = fpext float %17 to double
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %18)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %4 = call ptr @createAccount(i32 noundef 1234, ptr noundef @.str.4, ptr noundef @.str.5, float noundef 1.000000e+03)
  store ptr %4, ptr %2, align 8
  %5 = call ptr @createAccount(i32 noundef 5678, ptr noundef @.str.6, ptr noundef @.str.7, float noundef 2.000000e+03)
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %2, align 8
  call void @deposit(ptr noundef %6, float noundef 5.000000e+02)
  %7 = load ptr, ptr %3, align 8
  call void @withdraw(ptr noundef %7, float noundef 1.000000e+03)
  %8 = load ptr, ptr %2, align 8
  call void @displayAccountInfo(ptr noundef %8)
  %9 = load ptr, ptr %3, align 8
  call void @displayAccountInfo(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %10) #5
  %11 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %11) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
