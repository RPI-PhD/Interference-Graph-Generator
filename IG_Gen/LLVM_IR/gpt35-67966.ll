; ModuleID = 'DATASETv2/gpt35-67966.c'
source_filename = "DATASETv2/gpt35-67966.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"Bubble sort took %lf seconds.\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Quick sort took %lf seconds.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @bubbleSort(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %61, %2
  %9 = load i32, ptr %5, align 4
  %10 = load i32, ptr %4, align 4
  %11 = sub nsw i32 %10, 1
  %12 = icmp slt i32 %9, %11
  br i1 %12, label %13, label %64

13:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %14

14:                                               ; preds = %57, %13
  %15 = load i32, ptr %6, align 4
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sub nsw i32 %16, %17
  %19 = sub nsw i32 %18, 1
  %20 = icmp slt i32 %15, %19
  br i1 %20, label %21, label %60

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 8
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %22, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %27, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = icmp sgt i32 %26, %32
  br i1 %33, label %34, label %56

34:                                               ; preds = %21
  %35 = load ptr, ptr %3, align 8
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %35, i64 %37
  %39 = load i32, ptr %38, align 4
  store i32 %39, ptr %7, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %40, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, ptr %46, i64 %48
  store i32 %45, ptr %49, align 4
  %50 = load i32, ptr %7, align 4
  %51 = load ptr, ptr %3, align 8
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr %51, i64 %54
  store i32 %50, ptr %55, align 4
  br label %56

56:                                               ; preds = %34, %21
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %6, align 4
  br label %14, !llvm.loop !6

60:                                               ; preds = %14
  br label %61

61:                                               ; preds = %60
  %62 = load i32, ptr %5, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %5, align 4
  br label %8, !llvm.loop !8

64:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @quickSort(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %11 = load i32, ptr %5, align 4
  store i32 %11, ptr %7, align 4
  %12 = load i32, ptr %6, align 4
  store i32 %12, ptr %8, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add nsw i32 %14, %15
  %17 = sdiv i32 %16, 2
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %13, i64 %18
  %20 = load i32, ptr %19, align 4
  store i32 %20, ptr %10, align 4
  br label %21

21:                                               ; preds = %77, %3
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %8, align 4
  %24 = icmp sle i32 %22, %23
  br i1 %24, label %25, label %78

25:                                               ; preds = %21
  br label %26

26:                                               ; preds = %34, %25
  %27 = load ptr, ptr %4, align 8
  %28 = load i32, ptr %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %37

34:                                               ; preds = %26
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %7, align 4
  br label %26, !llvm.loop !9

37:                                               ; preds = %26
  br label %38

38:                                               ; preds = %46, %37
  %39 = load ptr, ptr %4, align 8
  %40 = load i32, ptr %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %39, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = load i32, ptr %10, align 4
  %45 = icmp sgt i32 %43, %44
  br i1 %45, label %46, label %49

46:                                               ; preds = %38
  %47 = load i32, ptr %8, align 4
  %48 = add nsw i32 %47, -1
  store i32 %48, ptr %8, align 4
  br label %38, !llvm.loop !10

49:                                               ; preds = %38
  %50 = load i32, ptr %7, align 4
  %51 = load i32, ptr %8, align 4
  %52 = icmp sle i32 %50, %51
  br i1 %52, label %53, label %77

53:                                               ; preds = %49
  %54 = load ptr, ptr %4, align 8
  %55 = load i32, ptr %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  %58 = load i32, ptr %57, align 4
  store i32 %58, ptr %9, align 4
  %59 = load ptr, ptr %4, align 8
  %60 = load i32, ptr %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %59, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load ptr, ptr %4, align 8
  %65 = load i32, ptr %7, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr %64, i64 %66
  store i32 %63, ptr %67, align 4
  %68 = load i32, ptr %9, align 4
  %69 = load ptr, ptr %4, align 8
  %70 = load i32, ptr %8, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %69, i64 %71
  store i32 %68, ptr %72, align 4
  %73 = load i32, ptr %7, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %7, align 4
  %75 = load i32, ptr %8, align 4
  %76 = add nsw i32 %75, -1
  store i32 %76, ptr %8, align 4
  br label %77

77:                                               ; preds = %53, %49
  br label %21, !llvm.loop !11

78:                                               ; preds = %21
  %79 = load i32, ptr %5, align 4
  %80 = load i32, ptr %8, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %86

82:                                               ; preds = %78
  %83 = load ptr, ptr %4, align 8
  %84 = load i32, ptr %5, align 4
  %85 = load i32, ptr %8, align 4
  call void @quickSort(ptr noundef %83, i32 noundef %84, i32 noundef %85)
  br label %86

86:                                               ; preds = %82, %78
  %87 = load i32, ptr %7, align 4
  %88 = load i32, ptr %6, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %90, label %94

90:                                               ; preds = %86
  %91 = load ptr, ptr %4, align 8
  %92 = load i32, ptr %7, align 4
  %93 = load i32, ptr %6, align 4
  call void @quickSort(ptr noundef %91, i32 noundef %92, i32 noundef %93)
  br label %94

94:                                               ; preds = %90, %86
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store i32 0, ptr %1, align 4
  %8 = call i64 @time(ptr noundef null) #3
  %9 = trunc i64 %8 to i32
  call void @srand(i32 noundef %9) #3
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %19, %0
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 1000000
  br i1 %12, label %13, label %22

13:                                               ; preds = %10
  %14 = call i32 @rand() #3
  %15 = srem i32 %14, 1000
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1000000 x i32], ptr %2, i64 0, i64 %17
  store i32 %15, ptr %18, align 4
  br label %19

19:                                               ; preds = %13
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %3, align 4
  br label %10, !llvm.loop !12

22:                                               ; preds = %10
  %23 = call i64 @clock() #3
  store i64 %23, ptr %4, align 8
  %24 = getelementptr inbounds [1000000 x i32], ptr %2, i64 0, i64 0
  call void @bubbleSort(ptr noundef %24, i32 noundef 1000000)
  %25 = call i64 @clock() #3
  store i64 %25, ptr %5, align 8
  %26 = load i64, ptr %5, align 8
  %27 = load i64, ptr %4, align 8
  %28 = sub nsw i64 %26, %27
  %29 = sitofp i64 %28 to double
  %30 = fdiv double %29, 1.000000e+06
  store double %30, ptr %6, align 8
  %31 = call i64 @time(ptr noundef null) #3
  %32 = trunc i64 %31 to i32
  call void @srand(i32 noundef %32) #3
  store i32 0, ptr %3, align 4
  br label %33

33:                                               ; preds = %42, %22
  %34 = load i32, ptr %3, align 4
  %35 = icmp slt i32 %34, 1000000
  br i1 %35, label %36, label %45

36:                                               ; preds = %33
  %37 = call i32 @rand() #3
  %38 = srem i32 %37, 1000
  %39 = load i32, ptr %3, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [1000000 x i32], ptr %2, i64 0, i64 %40
  store i32 %38, ptr %41, align 4
  br label %42

42:                                               ; preds = %36
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %3, align 4
  br label %33, !llvm.loop !13

45:                                               ; preds = %33
  %46 = call i64 @clock() #3
  store i64 %46, ptr %4, align 8
  %47 = getelementptr inbounds [1000000 x i32], ptr %2, i64 0, i64 0
  call void @quickSort(ptr noundef %47, i32 noundef 0, i32 noundef 999999)
  %48 = call i64 @clock() #3
  store i64 %48, ptr %5, align 8
  %49 = load i64, ptr %5, align 8
  %50 = load i64, ptr %4, align 8
  %51 = sub nsw i64 %49, %50
  %52 = sitofp i64 %51 to double
  %53 = fdiv double %52, 1.000000e+06
  store double %53, ptr %7, align 8
  %54 = load double, ptr %6, align 8
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %54)
  %56 = load double, ptr %7, align 8
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %56)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare i64 @clock() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
