; ModuleID = 'LLVM_IR/gemma7b-17712.ll'
source_filename = "DATASETv2/gemma7b-17712.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @shuffle_dimensions(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %36, %2
  %.01 = phi i32 [ 0, %2 ], [ %37, %36 ]
  %4 = icmp slt i32 %.01, %1
  br i1 %4, label %5, label %38

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %33, %5
  %.0 = phi i32 [ 0, %5 ], [ %34, %33 ]
  %7 = icmp slt i32 %.0, %1
  br i1 %7, label %8, label %35

8:                                                ; preds = %6
  %9 = call i32 @rand() #4
  %10 = srem i32 %9, %1
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds ptr, ptr %0, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds i32, ptr %13, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = sext i32 %10 to i64
  %18 = getelementptr inbounds ptr, ptr %0, i64 %17
  %19 = load ptr, ptr %18, align 8
  %20 = sext i32 %10 to i64
  %21 = getelementptr inbounds i32, ptr %19, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = sext i32 %.01 to i64
  %24 = getelementptr inbounds ptr, ptr %0, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds i32, ptr %25, i64 %26
  store i32 %22, ptr %27, align 4
  %28 = sext i32 %10 to i64
  %29 = getelementptr inbounds ptr, ptr %0, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = sext i32 %10 to i64
  %32 = getelementptr inbounds i32, ptr %30, i64 %31
  store i32 %16, ptr %32, align 4
  br label %33

33:                                               ; preds = %8
  %34 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !6

35:                                               ; preds = %6
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

38:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = sext i32 5 to i64
  %2 = mul i64 %1, 8
  %3 = call noalias ptr @malloc(i64 noundef %2) #5
  br label %4

4:                                                ; preds = %12, %0
  %.02 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %5 = icmp slt i32 %.02, 5
  br i1 %5, label %6, label %14

6:                                                ; preds = %4
  %7 = sext i32 5 to i64
  %8 = mul i64 %7, 4
  %9 = call noalias ptr @malloc(i64 noundef %8) #5
  %10 = sext i32 %.02 to i64
  %11 = getelementptr inbounds ptr, ptr %3, i64 %10
  store ptr %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %6
  %13 = add nsw i32 %.02, 1
  br label %4, !llvm.loop !9

14:                                               ; preds = %4
  br label %15

15:                                               ; preds = %30, %14
  %.03 = phi i32 [ 0, %14 ], [ %31, %30 ]
  %16 = icmp slt i32 %.03, 5
  br i1 %16, label %17, label %32

17:                                               ; preds = %15
  br label %18

18:                                               ; preds = %27, %17
  %.04 = phi i32 [ 0, %17 ], [ %28, %27 ]
  %19 = icmp slt i32 %.04, 5
  br i1 %19, label %20, label %29

20:                                               ; preds = %18
  %21 = add nsw i32 %.03, %.04
  %22 = sext i32 %.03 to i64
  %23 = getelementptr inbounds ptr, ptr %3, i64 %22
  %24 = load ptr, ptr %23, align 8
  %25 = sext i32 %.04 to i64
  %26 = getelementptr inbounds i32, ptr %24, i64 %25
  store i32 %21, ptr %26, align 4
  br label %27

27:                                               ; preds = %20
  %28 = add nsw i32 %.04, 1
  br label %18, !llvm.loop !10

29:                                               ; preds = %18
  br label %30

30:                                               ; preds = %29
  %31 = add nsw i32 %.03, 1
  br label %15, !llvm.loop !11

32:                                               ; preds = %15
  call void @shuffle_dimensions(ptr noundef %3, i32 noundef 5)
  br label %33

33:                                               ; preds = %50, %32
  %.01 = phi i32 [ 0, %32 ], [ %51, %50 ]
  %34 = icmp slt i32 %.01, 5
  br i1 %34, label %35, label %52

35:                                               ; preds = %33
  br label %36

36:                                               ; preds = %46, %35
  %.0 = phi i32 [ 0, %35 ], [ %47, %46 ]
  %37 = icmp slt i32 %.0, 5
  br i1 %37, label %38, label %48

38:                                               ; preds = %36
  %39 = sext i32 %.01 to i64
  %40 = getelementptr inbounds ptr, ptr %3, i64 %39
  %41 = load ptr, ptr %40, align 8
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds i32, ptr %41, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %44)
  br label %46

46:                                               ; preds = %38
  %47 = add nsw i32 %.0, 1
  br label %36, !llvm.loop !12

48:                                               ; preds = %36
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %50

50:                                               ; preds = %48
  %51 = add nsw i32 %.01, 1
  br label %33, !llvm.loop !13

52:                                               ; preds = %33
  call void @free(ptr noundef %3) #4
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
