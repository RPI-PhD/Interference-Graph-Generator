; ModuleID = 'LLVM_IR/falcon180b-56688.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialize_array(i32 noundef %0) #0 {
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  br label %4

4:                                                ; preds = %11, %1
  %.0 = phi i32 [ 0, %1 ], [ %12, %11 ]
  %5 = icmp slt i32 %.0, %0
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = call i32 @rand() #3
  %8 = srem i32 %7, 100
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %9
  store i32 %8, ptr %10, align 4
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

13:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_array(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %9, %1
  %.0 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %3 = icmp slt i32 %.0, %0
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = sext i32 %.0 to i64
  %6 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7)
  br label %9

9:                                                ; preds = %4
  %10 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

11:                                               ; preds = %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bucket_sort(i32 noundef %0) #0 {
  %2 = load i32, ptr @arr, align 16
  br label %3

3:                                                ; preds = %15, %1
  %.02 = phi i32 [ 1, %1 ], [ %16, %15 ]
  %.01 = phi i32 [ %2, %1 ], [ %.1, %15 ]
  %4 = icmp slt i32 %.02, %0
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  %6 = sext i32 %.02 to i64
  %7 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = icmp sgt i32 %8, %.01
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = sext i32 %.02 to i64
  %12 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  br label %14

14:                                               ; preds = %10, %5
  %.1 = phi i32 [ %13, %10 ], [ %.01, %5 ]
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.02, 1
  br label %3, !llvm.loop !9

17:                                               ; preds = %3
  %18 = sdiv i32 %.01, %0
  %19 = add nsw i32 %18, 1
  br label %20

20:                                               ; preds = %25, %17
  %.04 = phi i32 [ 0, %17 ], [ %26, %25 ]
  %21 = icmp slt i32 %.04, %0
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = sext i32 %.04 to i64
  %24 = getelementptr inbounds [1000 x i32], ptr @buckets, i64 0, i64 %23
  store i32 0, ptr %24, align 4
  br label %25

25:                                               ; preds = %22
  %26 = add nsw i32 %.04, 1
  br label %20, !llvm.loop !10

27:                                               ; preds = %20
  br label %28

28:                                               ; preds = %39, %27
  %.05 = phi i32 [ 0, %27 ], [ %40, %39 ]
  %29 = icmp slt i32 %.05, %0
  br i1 %29, label %30, label %41

30:                                               ; preds = %28
  %31 = sext i32 %.05 to i64
  %32 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = sdiv i32 %33, %19
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1000 x i32], ptr @buckets, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %36, align 4
  br label %39

39:                                               ; preds = %30
  %40 = add nsw i32 %.05, 1
  br label %28, !llvm.loop !11

41:                                               ; preds = %28
  br label %42

42:                                               ; preds = %59, %41
  %.06 = phi i32 [ 0, %41 ], [ %.17, %59 ]
  %.03 = phi i32 [ 0, %41 ], [ %60, %59 ]
  %43 = icmp slt i32 %.03, %0
  br i1 %43, label %44, label %61

44:                                               ; preds = %42
  br label %45

45:                                               ; preds = %56, %44
  %.17 = phi i32 [ %.06, %44 ], [ %53, %56 ]
  %.0 = phi i32 [ 0, %44 ], [ %57, %56 ]
  %46 = sext i32 %.03 to i64
  %47 = getelementptr inbounds [1000 x i32], ptr @buckets, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp slt i32 %.0, %48
  br i1 %49, label %50, label %58

50:                                               ; preds = %45
  %51 = mul nsw i32 %.03, %19
  %52 = add nsw i32 %51, %.0
  %53 = add nsw i32 %.17, 1
  %54 = sext i32 %.17 to i64
  %55 = getelementptr inbounds [1000 x i32], ptr @arr, i64 0, i64 %54
  store i32 %52, ptr %55, align 4
  br label %56

56:                                               ; preds = %50
  %57 = add nsw i32 %.0, 1
  br label %45, !llvm.loop !12

58:                                               ; preds = %45
  br label %59

59:                                               ; preds = %58
  %60 = add nsw i32 %.03, 1
  br label %42, !llvm.loop !13

61:                                               ; preds = %42
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %1)
  %4 = load i32, ptr %1, align 4
  call void @initialize_array(i32 noundef %4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %6 = load i32, ptr %1, align 4
  call void @print_array(i32 noundef %6)
  %7 = load i32, ptr %1, align 4
  call void @bucket_sort(i32 noundef %7)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %9 = load i32, ptr %1, align 4
  call void @print_array(i32 noundef %9)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
