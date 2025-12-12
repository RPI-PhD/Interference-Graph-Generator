; ModuleID = 'DATASETv2/falcon180b-56688.c'
source_filename = "DATASETv2/falcon180b-56688.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@arr = dso_local global [1000 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@buckets = dso_local global [1000 x i32] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [30 x i8] c"Enter the size of the array: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Unsorted array:\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Sorted array:\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_array(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = call i64 @time(ptr noundef null) #3
  %5 = trunc i64 %4 to i32
  call void @srand(i32 noundef %5) #3
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = call i32 @rand() #3
  %12 = srem i32 %11, 100
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %14
  store i32 %12, ptr %15, align 4
  br label %16

16:                                               ; preds = %10
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %6, !llvm.loop !6

19:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_array(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %14, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %17

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12)
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  br label %4, !llvm.loop !8

17:                                               ; preds = %4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @bucket_sort(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %12 = load i32, ptr @arr, align 16
  store i32 %12, ptr %3, align 4
  store i32 1, ptr %4, align 4
  br label %13

13:                                               ; preds = %30, %1
  %14 = load i32, ptr %4, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %33

17:                                               ; preds = %13
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = load i32, ptr %3, align 4
  %23 = icmp sgt i32 %21, %22
  br i1 %23, label %24, label %29

24:                                               ; preds = %17
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  store i32 %28, ptr %3, align 4
  br label %29

29:                                               ; preds = %24, %17
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %13, !llvm.loop !9

33:                                               ; preds = %13
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %2, align 4
  %36 = sdiv i32 %34, %35
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %38

38:                                               ; preds = %46, %33
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr %2, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %49

42:                                               ; preds = %38
  %43 = load i32, ptr %6, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1000 x i32], ptr @buckets, i64 0, i64 %44
  store i32 0, ptr %45, align 4
  br label %46

46:                                               ; preds = %42
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %6, align 4
  br label %38, !llvm.loop !10

49:                                               ; preds = %38
  store i32 0, ptr %7, align 4
  br label %50

50:                                               ; preds = %66, %49
  %51 = load i32, ptr %7, align 4
  %52 = load i32, ptr %2, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %69

54:                                               ; preds = %50
  %55 = load i32, ptr %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr %5, align 4
  %60 = sdiv i32 %58, %59
  store i32 %60, ptr %8, align 4
  %61 = load i32, ptr %8, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [1000 x i32], ptr @buckets, i64 0, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %63, align 4
  br label %66

66:                                               ; preds = %54
  %67 = load i32, ptr %7, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %7, align 4
  br label %50, !llvm.loop !11

69:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %70

70:                                               ; preds = %96, %69
  %71 = load i32, ptr %10, align 4
  %72 = load i32, ptr %2, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %99

74:                                               ; preds = %70
  store i32 0, ptr %11, align 4
  br label %75

75:                                               ; preds = %92, %74
  %76 = load i32, ptr %11, align 4
  %77 = load i32, ptr %10, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [1000 x i32], ptr @buckets, i64 0, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = icmp slt i32 %76, %80
  br i1 %81, label %82, label %95

82:                                               ; preds = %75
  %83 = load i32, ptr %10, align 4
  %84 = load i32, ptr %5, align 4
  %85 = mul nsw i32 %83, %84
  %86 = load i32, ptr %11, align 4
  %87 = add nsw i32 %85, %86
  %88 = load i32, ptr %9, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %9, align 4
  %90 = sext i32 %88 to i64
  %91 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %90
  store i32 %87, ptr %91, align 4
  br label %92

92:                                               ; preds = %82
  %93 = load i32, ptr %11, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %11, align 4
  br label %75, !llvm.loop !12

95:                                               ; preds = %75
  br label %96

96:                                               ; preds = %95
  %97 = load i32, ptr %10, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %10, align 4
  br label %70, !llvm.loop !13

99:                                               ; preds = %70
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %2)
  %5 = load i32, ptr %2, align 4
  call void @initialize_array(i32 noundef %5)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %7 = load i32, ptr %2, align 4
  call void @print_array(i32 noundef %7)
  %8 = load i32, ptr %2, align 4
  call void @bucket_sort(i32 noundef %8)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %10 = load i32, ptr %2, align 4
  call void @print_array(i32 noundef %10)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

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
