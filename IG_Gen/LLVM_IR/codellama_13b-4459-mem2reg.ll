; ModuleID = 'LLVM_IR/codellama_13b-4459.ll'
source_filename = "DATASETv2/codellama_13b-4459.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.matrix1 = private unnamed_addr constant [3 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6], [3 x i32] [i32 7, i32 8, i32 9]], align 16
@__const.main.matrix2 = private unnamed_addr constant [3 x [3 x i32]] [[3 x i32] [i32 10, i32 11, i32 12], [3 x i32] [i32 13, i32 14, i32 15], [3 x i32] [i32 16, i32 17, i32 18]], align 16
@.str.2 = private unnamed_addr constant [23 x i8] c"Addition of matrices:\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Multiplication of matrices:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @addMatrices(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = sext i32 %2 to i64
  %6 = mul i64 8, %5
  %7 = call noalias ptr @malloc(i64 noundef %6) #4
  br label %8

8:                                                ; preds = %40, %4
  %.01 = phi i32 [ 0, %4 ], [ %41, %40 ]
  %9 = icmp slt i32 %.01, %2
  br i1 %9, label %10, label %42

10:                                               ; preds = %8
  %11 = sext i32 %3 to i64
  %12 = mul i64 4, %11
  %13 = call noalias ptr @malloc(i64 noundef %12) #4
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds ptr, ptr %7, i64 %14
  store ptr %13, ptr %15, align 8
  br label %16

16:                                               ; preds = %37, %10
  %.0 = phi i32 [ 0, %10 ], [ %38, %37 ]
  %17 = icmp slt i32 %.0, %3
  br i1 %17, label %18, label %39

18:                                               ; preds = %16
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds ptr, ptr %0, i64 %19
  %21 = load ptr, ptr %20, align 8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds i32, ptr %21, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds ptr, ptr %1, i64 %25
  %27 = load ptr, ptr %26, align 8
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds i32, ptr %27, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %24, %30
  %32 = sext i32 %.01 to i64
  %33 = getelementptr inbounds ptr, ptr %7, i64 %32
  %34 = load ptr, ptr %33, align 8
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds i32, ptr %34, i64 %35
  store i32 %31, ptr %36, align 4
  br label %37

37:                                               ; preds = %18
  %38 = add nsw i32 %.0, 1
  br label %16, !llvm.loop !6

39:                                               ; preds = %16
  br label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %.01, 1
  br label %8, !llvm.loop !8

42:                                               ; preds = %8
  ret ptr %7
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @multiplyMatrices(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = sext i32 %2 to i64
  %6 = mul i64 8, %5
  %7 = call noalias ptr @malloc(i64 noundef %6) #4
  br label %8

8:                                                ; preds = %53, %4
  %.02 = phi i32 [ 0, %4 ], [ %54, %53 ]
  %9 = icmp slt i32 %.02, %2
  br i1 %9, label %10, label %55

10:                                               ; preds = %8
  %11 = sext i32 %3 to i64
  %12 = mul i64 4, %11
  %13 = call noalias ptr @malloc(i64 noundef %12) #4
  %14 = sext i32 %.02 to i64
  %15 = getelementptr inbounds ptr, ptr %7, i64 %14
  store ptr %13, ptr %15, align 8
  br label %16

16:                                               ; preds = %50, %10
  %.01 = phi i32 [ 0, %10 ], [ %51, %50 ]
  %17 = icmp slt i32 %.01, %3
  br i1 %17, label %18, label %52

18:                                               ; preds = %16
  %19 = sext i32 %.02 to i64
  %20 = getelementptr inbounds ptr, ptr %7, i64 %19
  %21 = load ptr, ptr %20, align 8
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds i32, ptr %21, i64 %22
  store i32 0, ptr %23, align 4
  br label %24

24:                                               ; preds = %47, %18
  %.0 = phi i32 [ 0, %18 ], [ %48, %47 ]
  %25 = icmp slt i32 %.0, %3
  br i1 %25, label %26, label %49

26:                                               ; preds = %24
  %27 = sext i32 %.02 to i64
  %28 = getelementptr inbounds ptr, ptr %0, i64 %27
  %29 = load ptr, ptr %28, align 8
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds i32, ptr %29, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %.0 to i64
  %34 = getelementptr inbounds ptr, ptr %1, i64 %33
  %35 = load ptr, ptr %34, align 8
  %36 = sext i32 %.01 to i64
  %37 = getelementptr inbounds i32, ptr %35, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = mul nsw i32 %32, %38
  %40 = sext i32 %.02 to i64
  %41 = getelementptr inbounds ptr, ptr %7, i64 %40
  %42 = load ptr, ptr %41, align 8
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds i32, ptr %42, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %45, %39
  store i32 %46, ptr %44, align 4
  br label %47

47:                                               ; preds = %26
  %48 = add nsw i32 %.0, 1
  br label %24, !llvm.loop !9

49:                                               ; preds = %24
  br label %50

50:                                               ; preds = %49
  %51 = add nsw i32 %.01, 1
  br label %16, !llvm.loop !10

52:                                               ; preds = %16
  br label %53

53:                                               ; preds = %52
  %54 = add nsw i32 %.02, 1
  br label %8, !llvm.loop !11

55:                                               ; preds = %8
  ret ptr %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayMatrix(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  br label %4

4:                                                ; preds = %21, %3
  %.01 = phi i32 [ 0, %3 ], [ %22, %21 ]
  %5 = icmp slt i32 %.01, %1
  br i1 %5, label %6, label %23

6:                                                ; preds = %4
  br label %7

7:                                                ; preds = %17, %6
  %.0 = phi i32 [ 0, %6 ], [ %18, %17 ]
  %8 = icmp slt i32 %.0, %2
  br i1 %8, label %9, label %19

9:                                                ; preds = %7
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds ptr, ptr %0, i64 %10
  %12 = load ptr, ptr %11, align 8
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i32, ptr %12, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %17

17:                                               ; preds = %9
  %18 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !12

19:                                               ; preds = %7
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %21

21:                                               ; preds = %19
  %22 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !13

23:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [3 x [3 x i32]], align 16
  %2 = alloca [3 x [3 x i32]], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.matrix1, i64 36, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.matrix2, i64 36, i1 false)
  %3 = getelementptr inbounds [3 x [3 x i32]], ptr %1, i64 0, i64 0
  %4 = getelementptr inbounds [3 x [3 x i32]], ptr %2, i64 0, i64 0
  %5 = call ptr @addMatrices(ptr noundef %3, ptr noundef %4, i32 noundef 3, i32 noundef 3)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @displayMatrix(ptr noundef %5, i32 noundef 3, i32 noundef 3)
  %7 = getelementptr inbounds [3 x [3 x i32]], ptr %1, i64 0, i64 0
  %8 = getelementptr inbounds [3 x [3 x i32]], ptr %2, i64 0, i64 0
  %9 = call ptr @multiplyMatrices(ptr noundef %7, ptr noundef %8, i32 noundef 3, i32 noundef 3)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @displayMatrix(ptr noundef %9, i32 noundef 3, i32 noundef 3)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind allocsize(0) }

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
