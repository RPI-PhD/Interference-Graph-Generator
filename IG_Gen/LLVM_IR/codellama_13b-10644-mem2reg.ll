; ModuleID = 'LLVM_IR/codellama_13b-10644.ll'
source_filename = "DATASETv2/codellama_13b-10644.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"Welcome to the Unit Converter\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"----------------------------\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"1. Convert from meters to feet\0A\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"2. Convert from feet to meters\0A\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"3. Convert from kilometers to miles\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"4. Convert from miles to kilometers\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [28 x i8] c"Enter the value in meters: \00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"Value in feet: %.2lf\0A\00", align 1
@.str.11 = private unnamed_addr constant [26 x i8] c"Enter the value in feet: \00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"Value in meters: %.2lf\0A\00", align 1
@.str.13 = private unnamed_addr constant [32 x i8] c"Enter the value in kilometers: \00", align 1
@.str.14 = private unnamed_addr constant [23 x i8] c"Value in miles: %.2lf\0A\00", align 1
@.str.15 = private unnamed_addr constant [27 x i8] c"Enter the value in miles: \00", align 1
@.str.16 = private unnamed_addr constant [28 x i8] c"Value in kilometers: %.2lf\0A\00", align 1
@.str.17 = private unnamed_addr constant [17 x i8] c"Invalid choice.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %1)
  %11 = load i32, ptr %1, align 4
  switch i32 %11, label %36 [
    i32 1, label %12
    i32 2, label %18
    i32 3, label %24
    i32 4, label %30
  ]

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %2)
  %15 = load double, ptr %2, align 8
  %16 = fmul double %15, 3.280840e+00
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %16)
  br label %38

18:                                               ; preds = %0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %2)
  %21 = load double, ptr %2, align 8
  %22 = fdiv double %21, 3.280840e+00
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %22)
  br label %38

24:                                               ; preds = %0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %26 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %2)
  %27 = load double, ptr %2, align 8
  %28 = fmul double %27, 6.213710e-01
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, double noundef %28)
  br label %38

30:                                               ; preds = %0
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %2)
  %33 = load double, ptr %2, align 8
  %34 = fdiv double %33, 6.213710e-01
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, double noundef %34)
  br label %38

36:                                               ; preds = %0
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %38

38:                                               ; preds = %36, %30, %24, %18, %12
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
