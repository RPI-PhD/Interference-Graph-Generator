; ModuleID = 'LLVM_IR/gemma7b-31475.ll'
source_filename = "DATASETv2/gemma7b-31475.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [39 x i8] c"Enter the number of rows and columns: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"The solution is:\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @traverse(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = sub nsw i32 %0, 1
  %5 = icmp eq i32 %1, %4
  br i1 %5, label %6, label %14

6:                                                ; preds = %3
  %7 = sub nsw i32 %0, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds ptr, ptr %2, i64 %8
  %10 = load ptr, ptr %9, align 8
  %11 = sub nsw i32 %0, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr %10, i64 %12
  store i32 1, ptr %13, align 4
  br label %39

14:                                               ; preds = %3
  br label %15

15:                                               ; preds = %37, %14
  %.0 = phi i32 [ 0, %14 ], [ %38, %37 ]
  %16 = icmp slt i32 %.0, %0
  br i1 %16, label %17, label %39

17:                                               ; preds = %15
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds ptr, ptr %2, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = sext i32 %1 to i64
  %22 = getelementptr inbounds i32, ptr %20, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %36

25:                                               ; preds = %17
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds ptr, ptr %2, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = sext i32 %1 to i64
  %30 = getelementptr inbounds i32, ptr %28, i64 %29
  store i32 1, ptr %30, align 4
  call void @traverse(i32 noundef %0, i32 noundef %.0, ptr noundef %2)
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds ptr, ptr %2, i64 %31
  %33 = load ptr, ptr %32, align 8
  %34 = sext i32 %1 to i64
  %35 = getelementptr inbounds i32, ptr %33, i64 %34
  store i32 0, ptr %35, align 4
  br label %36

36:                                               ; preds = %25, %17
  br label %37

37:                                               ; preds = %36
  %38 = add nsw i32 %.0, 1
  br label %15, !llvm.loop !6

39:                                               ; preds = %15, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %4 = load i32, ptr %1, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 %5, 8
  %7 = call noalias ptr @malloc(i64 noundef %6) #3
  br label %8

8:                                                ; preds = %18, %0
  %.02 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %.02, %9
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = mul i64 %13, 4
  %15 = call noalias ptr @malloc(i64 noundef %14) #3
  %16 = sext i32 %.02 to i64
  %17 = getelementptr inbounds ptr, ptr %7, i64 %16
  store ptr %15, ptr %17, align 8
  br label %18

18:                                               ; preds = %11
  %19 = add nsw i32 %.02, 1
  br label %8, !llvm.loop !8

20:                                               ; preds = %8
  %21 = load i32, ptr %1, align 4
  call void @traverse(i32 noundef %21, i32 noundef 0, ptr noundef %7)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %23

23:                                               ; preds = %42, %20
  %.01 = phi i32 [ 0, %20 ], [ %43, %42 ]
  %24 = load i32, ptr %1, align 4
  %25 = icmp slt i32 %.01, %24
  br i1 %25, label %26, label %44

26:                                               ; preds = %23
  br label %27

27:                                               ; preds = %38, %26
  %.0 = phi i32 [ 0, %26 ], [ %39, %38 ]
  %28 = load i32, ptr %1, align 4
  %29 = icmp slt i32 %.0, %28
  br i1 %29, label %30, label %40

30:                                               ; preds = %27
  %31 = sext i32 %.01 to i64
  %32 = getelementptr inbounds ptr, ptr %7, i64 %31
  %33 = load ptr, ptr %32, align 8
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds i32, ptr %33, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %36)
  br label %38

38:                                               ; preds = %30
  %39 = add nsw i32 %.0, 1
  br label %27, !llvm.loop !9

40:                                               ; preds = %27
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %42

42:                                               ; preds = %40
  %43 = add nsw i32 %.01, 1
  br label %23, !llvm.loop !10

44:                                               ; preds = %23
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) }

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
