; ModuleID = 'DATASETv2/gpt4o_mini-5525.c'
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

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_primes(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %8 = load i32, ptr %2, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %8)
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = mul i64 %12, 4
  %14 = call noalias ptr @malloc(i64 noundef %13) #4
  store ptr %14, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %19

17:                                               ; preds = %1
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %94

19:                                               ; preds = %1
  store i32 0, ptr %4, align 4
  br label %20

20:                                               ; preds = %29, %19
  %21 = load i32, ptr %4, align 4
  %22 = load i32, ptr %2, align 4
  %23 = icmp sle i32 %21, %22
  br i1 %23, label %24, label %32

24:                                               ; preds = %20
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  store i32 1, ptr %28, align 4
  br label %29

29:                                               ; preds = %24
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %20, !llvm.loop !6

32:                                               ; preds = %20
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds i32, ptr %33, i64 1
  store i32 0, ptr %34, align 4
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds i32, ptr %35, i64 0
  store i32 0, ptr %36, align 4
  store i32 2, ptr %5, align 4
  br label %37

37:                                               ; preds = %69, %32
  %38 = load i32, ptr %5, align 4
  %39 = load i32, ptr %5, align 4
  %40 = mul nsw i32 %38, %39
  %41 = load i32, ptr %2, align 4
  %42 = icmp sle i32 %40, %41
  br i1 %42, label %43, label %72

43:                                               ; preds = %37
  %44 = load ptr, ptr %3, align 8
  %45 = load i32, ptr %5, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %44, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %68

50:                                               ; preds = %43
  %51 = load i32, ptr %5, align 4
  %52 = load i32, ptr %5, align 4
  %53 = mul nsw i32 %51, %52
  store i32 %53, ptr %6, align 4
  br label %54

54:                                               ; preds = %63, %50
  %55 = load i32, ptr %6, align 4
  %56 = load i32, ptr %2, align 4
  %57 = icmp sle i32 %55, %56
  br i1 %57, label %58, label %67

58:                                               ; preds = %54
  %59 = load ptr, ptr %3, align 8
  %60 = load i32, ptr %6, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  store i32 0, ptr %62, align 4
  br label %63

63:                                               ; preds = %58
  %64 = load i32, ptr %5, align 4
  %65 = load i32, ptr %6, align 4
  %66 = add nsw i32 %65, %64
  store i32 %66, ptr %6, align 4
  br label %54, !llvm.loop !8

67:                                               ; preds = %54
  br label %68

68:                                               ; preds = %67, %43
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %5, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %5, align 4
  br label %37, !llvm.loop !9

72:                                               ; preds = %37
  store i32 2, ptr %7, align 4
  br label %73

73:                                               ; preds = %88, %72
  %74 = load i32, ptr %7, align 4
  %75 = load i32, ptr %2, align 4
  %76 = icmp sle i32 %74, %75
  br i1 %76, label %77, label %91

77:                                               ; preds = %73
  %78 = load ptr, ptr %3, align 8
  %79 = load i32, ptr %7, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, ptr %78, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %87

84:                                               ; preds = %77
  %85 = load i32, ptr %7, align 4
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %85)
  br label %87

87:                                               ; preds = %84, %77
  br label %88

88:                                               ; preds = %87
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %7, align 4
  br label %73, !llvm.loop !10

91:                                               ; preds = %73
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %93 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %93) #5
  br label %94

94:                                               ; preds = %91, %17
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @print_intro()
  br label %3

3:                                                ; preds = %0, %17
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef 1000000)
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %2)
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %17

10:                                               ; preds = %3
  %11 = load i32, ptr %2, align 4
  %12 = icmp sgt i32 %11, 1000000
  br i1 %12, label %13, label %15

13:                                               ; preds = %10
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef 1000000)
  br label %16

15:                                               ; preds = %10
  br label %18

16:                                               ; preds = %13
  br label %17

17:                                               ; preds = %16, %8
  br label %3

18:                                               ; preds = %15
  %19 = load i32, ptr %2, align 4
  call void @print_primes(i32 noundef %19)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
