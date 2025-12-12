; ModuleID = 'LLVM_IR/gpt35-67966.ll'
source_filename = "DATASETv2/gpt35-67966.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"Bubble sort took %lf seconds.\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Quick sort took %lf seconds.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bubbleSort(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %37, %2
  %.01 = phi i32 [ 0, %2 ], [ %38, %37 ]
  %4 = sub nsw i32 %1, 1
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %39

6:                                                ; preds = %3
  br label %7

7:                                                ; preds = %34, %6
  %.0 = phi i32 [ 0, %6 ], [ %35, %34 ]
  %8 = sub nsw i32 %1, %.01
  %9 = sub nsw i32 %8, 1
  %10 = icmp slt i32 %.0, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %7
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %.0, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = icmp sgt i32 %14, %18
  br i1 %19, label %20, label %33

20:                                               ; preds = %11
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds i32, ptr %0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %.0, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds i32, ptr %0, i64 %28
  store i32 %27, ptr %29, align 4
  %30 = add nsw i32 %.0, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %0, i64 %31
  store i32 %23, ptr %32, align 4
  br label %33

33:                                               ; preds = %20, %11
  br label %34

34:                                               ; preds = %33
  %35 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

36:                                               ; preds = %7
  br label %37

37:                                               ; preds = %36
  %38 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

39:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @quickSort(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = add nsw i32 %1, %2
  %5 = sdiv i32 %4, 2
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, ptr %0, i64 %6
  %8 = load i32, ptr %7, align 4
  br label %9

9:                                                ; preds = %42, %3
  %.01 = phi i32 [ %1, %3 ], [ %.23, %42 ]
  %.0 = phi i32 [ %2, %3 ], [ %.2, %42 ]
  %10 = icmp sle i32 %.01, %.0
  br i1 %10, label %11, label %43

11:                                               ; preds = %9
  br label %12

12:                                               ; preds = %17, %11
  %.12 = phi i32 [ %.01, %11 ], [ %18, %17 ]
  %13 = sext i32 %.12 to i64
  %14 = getelementptr inbounds i32, ptr %0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = icmp slt i32 %15, %8
  br i1 %16, label %17, label %19

17:                                               ; preds = %12
  %18 = add nsw i32 %.12, 1
  br label %12, !llvm.loop !9

19:                                               ; preds = %12
  br label %20

20:                                               ; preds = %25, %19
  %.1 = phi i32 [ %.0, %19 ], [ %26, %25 ]
  %21 = sext i32 %.1 to i64
  %22 = getelementptr inbounds i32, ptr %0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp sgt i32 %23, %8
  br i1 %24, label %25, label %27

25:                                               ; preds = %20
  %26 = add nsw i32 %.1, -1
  br label %20, !llvm.loop !10

27:                                               ; preds = %20
  %28 = icmp sle i32 %.12, %.1
  br i1 %28, label %29, label %42

29:                                               ; preds = %27
  %30 = sext i32 %.12 to i64
  %31 = getelementptr inbounds i32, ptr %0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %.1 to i64
  %34 = getelementptr inbounds i32, ptr %0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = sext i32 %.12 to i64
  %37 = getelementptr inbounds i32, ptr %0, i64 %36
  store i32 %35, ptr %37, align 4
  %38 = sext i32 %.1 to i64
  %39 = getelementptr inbounds i32, ptr %0, i64 %38
  store i32 %32, ptr %39, align 4
  %40 = add nsw i32 %.12, 1
  %41 = add nsw i32 %.1, -1
  br label %42

42:                                               ; preds = %29, %27
  %.23 = phi i32 [ %40, %29 ], [ %.12, %27 ]
  %.2 = phi i32 [ %41, %29 ], [ %.1, %27 ]
  br label %9, !llvm.loop !11

43:                                               ; preds = %9
  %44 = icmp slt i32 %1, %.0
  br i1 %44, label %45, label %46

45:                                               ; preds = %43
  call void @quickSort(ptr noundef %0, i32 noundef %1, i32 noundef %.0)
  br label %46

46:                                               ; preds = %45, %43
  %47 = icmp slt i32 %.01, %2
  br i1 %47, label %48, label %49

48:                                               ; preds = %46
  call void @quickSort(ptr noundef %0, i32 noundef %.01, i32 noundef %2)
  br label %49

49:                                               ; preds = %48, %46
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000000 x i32], align 16
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  br label %4

4:                                                ; preds = %11, %0
  %.0 = phi i32 [ 0, %0 ], [ %12, %11 ]
  %5 = icmp slt i32 %.0, 1000000
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = call i32 @rand() #3
  %8 = srem i32 %7, 1000
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [1000000 x i32], ptr %1, i64 0, i64 %9
  store i32 %8, ptr %10, align 4
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !12

13:                                               ; preds = %4
  %14 = call i64 @clock() #3
  %15 = getelementptr inbounds [1000000 x i32], ptr %1, i64 0, i64 0
  call void @bubbleSort(ptr noundef %15, i32 noundef 1000000)
  %16 = call i64 @clock() #3
  %17 = sub nsw i64 %16, %14
  %18 = sitofp i64 %17 to double
  %19 = fdiv double %18, 1.000000e+06
  %20 = call i64 @time(ptr noundef null) #3
  %21 = trunc i64 %20 to i32
  call void @srand(i32 noundef %21) #3
  br label %22

22:                                               ; preds = %29, %13
  %.1 = phi i32 [ 0, %13 ], [ %30, %29 ]
  %23 = icmp slt i32 %.1, 1000000
  br i1 %23, label %24, label %31

24:                                               ; preds = %22
  %25 = call i32 @rand() #3
  %26 = srem i32 %25, 1000
  %27 = sext i32 %.1 to i64
  %28 = getelementptr inbounds [1000000 x i32], ptr %1, i64 0, i64 %27
  store i32 %26, ptr %28, align 4
  br label %29

29:                                               ; preds = %24
  %30 = add nsw i32 %.1, 1
  br label %22, !llvm.loop !13

31:                                               ; preds = %22
  %32 = call i64 @clock() #3
  %33 = getelementptr inbounds [1000000 x i32], ptr %1, i64 0, i64 0
  call void @quickSort(ptr noundef %33, i32 noundef 0, i32 noundef 999999)
  %34 = call i64 @clock() #3
  %35 = sub nsw i64 %34, %32
  %36 = sitofp i64 %35 to double
  %37 = fdiv double %36, 1.000000e+06
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %19)
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %37)
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
