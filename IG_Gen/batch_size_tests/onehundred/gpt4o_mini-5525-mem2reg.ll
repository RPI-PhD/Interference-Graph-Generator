; ModuleID = 'LLVM_IR/gpt4o_mini-5525.ll'
source_filename = "DATASETv2/gpt4o_mini-5525.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [42 x i8] c"========================================\0A\00", align 1
@.str.1 = private unnamed_addr constant [41 x i8] c"     Welcome to Prime Number Finder!   \0A\00", align 1
@.str.2 = private unnamed_addr constant [72 x i8] c"This program helps you find all prime numbers up to a specified limit.\0A\00", align 1
@.str.3 = private unnamed_addr constant [52 x i8] c"Prime numbers are natural numbers greater than 1, \0A\00", align 1
@.str.4 = private unnamed_addr constant [68 x i8] c"which cannot be formed by multiplying two smaller natural numbers.\0A\00", align 1
@.str.5 = private unnamed_addr constant [44 x i8] c"Enjoy finding primes! Let\E2\80\99s get started!\0A\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Finding prime numbers up to: %d\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"Memory allocation failed!\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [61 x i8] c"Enter the upper limit for prime number generation (max %d): \00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.12 = private unnamed_addr constant [51 x i8] c"Please enter a number greater than or equal to 2.\0A\00", align 1
@.str.13 = private unnamed_addr constant [52 x i8] c"The limit exceeds the maximum allowed limit of %d.\0A\00", align 1
@.str.14 = private unnamed_addr constant [51 x i8] c"Thank you for using Prime Number Finder! Goodbye!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_intro() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_primes(i32 noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %0)
  %3 = add nsw i32 %0, 1
  %4 = sext i32 %3 to i64
  %5 = mul i64 %4, 4
  %6 = call noalias ptr @malloc(i64 noundef %5) #4
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %57

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %16, %10
  %.02 = phi i32 [ 0, %10 ], [ %17, %16 ]
  %12 = icmp sle i32 %.02, %0
  br i1 %12, label %13, label %18

13:                                               ; preds = %11
  %14 = sext i32 %.02 to i64
  %15 = getelementptr inbounds i32, ptr %6, i64 %14
  store i32 1, ptr %15, align 4
  br label %16

16:                                               ; preds = %13
  %17 = add nsw i32 %.02, 1
  br label %11, !llvm.loop !6

18:                                               ; preds = %11
  %19 = getelementptr inbounds i32, ptr %6, i64 1
  store i32 0, ptr %19, align 4
  %20 = getelementptr inbounds i32, ptr %6, i64 0
  store i32 0, ptr %20, align 4
  br label %21

21:                                               ; preds = %40, %18
  %.03 = phi i32 [ 2, %18 ], [ %41, %40 ]
  %22 = mul nsw i32 %.03, %.03
  %23 = icmp sle i32 %22, %0
  br i1 %23, label %24, label %42

24:                                               ; preds = %21
  %25 = sext i32 %.03 to i64
  %26 = getelementptr inbounds i32, ptr %6, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %39

29:                                               ; preds = %24
  %30 = mul nsw i32 %.03, %.03
  br label %31

31:                                               ; preds = %36, %29
  %.01 = phi i32 [ %30, %29 ], [ %37, %36 ]
  %32 = icmp sle i32 %.01, %0
  br i1 %32, label %33, label %38

33:                                               ; preds = %31
  %34 = sext i32 %.01 to i64
  %35 = getelementptr inbounds i32, ptr %6, i64 %34
  store i32 0, ptr %35, align 4
  br label %36

36:                                               ; preds = %33
  %37 = add nsw i32 %.01, %.03
  br label %31, !llvm.loop !8

38:                                               ; preds = %31
  br label %39

39:                                               ; preds = %38, %24
  br label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %.03, 1
  br label %21, !llvm.loop !9

42:                                               ; preds = %21
  br label %43

43:                                               ; preds = %53, %42
  %.0 = phi i32 [ 2, %42 ], [ %54, %53 ]
  %44 = icmp sle i32 %.0, %0
  br i1 %44, label %45, label %55

45:                                               ; preds = %43
  %46 = sext i32 %.0 to i64
  %47 = getelementptr inbounds i32, ptr %6, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %52

50:                                               ; preds = %45
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %.0)
  br label %52

52:                                               ; preds = %50, %45
  br label %53

53:                                               ; preds = %52
  %54 = add nsw i32 %.0, 1
  br label %43, !llvm.loop !10

55:                                               ; preds = %43
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  call void @free(ptr noundef %6) #5
  br label %57

57:                                               ; preds = %55, %8
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  call void @print_intro()
  br label %2

2:                                                ; preds = %16, %0
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef 1000000)
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %1)
  %5 = load i32, ptr %1, align 4
  %6 = icmp slt i32 %5, 2
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %16

9:                                                ; preds = %2
  %10 = load i32, ptr %1, align 4
  %11 = icmp sgt i32 %10, 1000000
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef 1000000)
  br label %15

14:                                               ; preds = %9
  br label %17

15:                                               ; preds = %12
  br label %16

16:                                               ; preds = %15, %7
  br label %2

17:                                               ; preds = %14
  %18 = load i32, ptr %1, align 4
  call void @print_primes(i32 noundef %18)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
