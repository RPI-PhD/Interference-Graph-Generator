; ModuleID = 'LLVM_IR/gpt35-51119.ll'
source_filename = "DATASETv2/gpt35-51119.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"\0AQR Code: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generateMatrix(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = call i64 @time(ptr noundef null) #4
  %5 = trunc i64 %4 to i32
  call void @srand(i32 noundef %5) #4
  br label %6

6:                                                ; preds = %22, %3
  %.01 = phi i32 [ 0, %3 ], [ %23, %22 ]
  %7 = icmp slt i32 %.01, %0
  br i1 %7, label %8, label %24

8:                                                ; preds = %6
  br label %9

9:                                                ; preds = %19, %8
  %.0 = phi i32 [ 0, %8 ], [ %20, %19 ]
  %10 = icmp slt i32 %.0, %1
  br i1 %10, label %11, label %21

11:                                               ; preds = %9
  %12 = call i32 @rand() #4
  %13 = srem i32 %12, 2
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds ptr, ptr %2, i64 %14
  %16 = load ptr, ptr %15, align 8
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds i32, ptr %16, i64 %17
  store i32 %13, ptr %18, align 4
  br label %19

19:                                               ; preds = %11
  %20 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !6

21:                                               ; preds = %9
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !8

24:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %21, %3
  %.01 = phi i32 [ 0, %3 ], [ %22, %21 ]
  %5 = icmp slt i32 %.01, %0
  br i1 %5, label %6, label %23

6:                                                ; preds = %4
  br label %7

7:                                                ; preds = %17, %6
  %.0 = phi i32 [ 0, %6 ], [ %18, %17 ]
  %8 = icmp slt i32 %.0, %1
  br i1 %8, label %9, label %19

9:                                                ; preds = %7
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds ptr, ptr %2, i64 %10
  %12 = load ptr, ptr %11, align 8
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i32, ptr %12, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %17

17:                                               ; preds = %9
  %18 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !9

19:                                               ; preds = %7
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %21

21:                                               ; preds = %19
  %22 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !10

23:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @generateQRCode(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = mul nsw i32 %0, %1
  %5 = add nsw i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = call noalias ptr @malloc(i64 noundef %6) #5
  br label %8

8:                                                ; preds = %28, %3
  %.02 = phi i32 [ 0, %3 ], [ %.1, %28 ]
  %.01 = phi i32 [ 0, %3 ], [ %29, %28 ]
  %9 = icmp slt i32 %.01, %0
  br i1 %9, label %10, label %30

10:                                               ; preds = %8
  br label %11

11:                                               ; preds = %25, %10
  %.1 = phi i32 [ %.02, %10 ], [ %24, %25 ]
  %.0 = phi i32 [ 0, %10 ], [ %26, %25 ]
  %12 = icmp slt i32 %.0, %1
  br i1 %12, label %13, label %27

13:                                               ; preds = %11
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds ptr, ptr %2, i64 %14
  %16 = load ptr, ptr %15, align 8
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds i32, ptr %16, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = add nsw i32 %19, 48
  %21 = trunc i32 %20 to i8
  %22 = sext i32 %.1 to i64
  %23 = getelementptr inbounds i8, ptr %7, i64 %22
  store i8 %21, ptr %23, align 1
  %24 = add nsw i32 %.1, 1
  br label %25

25:                                               ; preds = %13
  %26 = add nsw i32 %.0, 1
  br label %11, !llvm.loop !11

27:                                               ; preds = %11
  br label %28

28:                                               ; preds = %27
  %29 = add nsw i32 %.01, 1
  br label %8, !llvm.loop !12

30:                                               ; preds = %8
  %31 = sext i32 %.02 to i64
  %32 = getelementptr inbounds i8, ptr %7, i64 %31
  store i8 0, ptr %32, align 1
  ret ptr %7
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = sext i32 10 to i64
  %2 = mul i64 8, %1
  %3 = call noalias ptr @malloc(i64 noundef %2) #5
  br label %4

4:                                                ; preds = %12, %0
  %.01 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %5 = icmp slt i32 %.01, 10
  br i1 %5, label %6, label %14

6:                                                ; preds = %4
  %7 = sext i32 10 to i64
  %8 = mul i64 4, %7
  %9 = call noalias ptr @malloc(i64 noundef %8) #5
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds ptr, ptr %3, i64 %10
  store ptr %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %6
  %13 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !13

14:                                               ; preds = %4
  call void @generateMatrix(i32 noundef 10, i32 noundef 10, ptr noundef %3)
  call void @printMatrix(i32 noundef 10, i32 noundef 10, ptr noundef %3)
  %15 = call ptr @generateQRCode(i32 noundef 10, i32 noundef 10, ptr noundef %3)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %15)
  call void @free(ptr noundef %15) #4
  br label %17

17:                                               ; preds = %23, %14
  %.0 = phi i32 [ 0, %14 ], [ %24, %23 ]
  %18 = icmp slt i32 %.0, 10
  br i1 %18, label %19, label %25

19:                                               ; preds = %17
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds ptr, ptr %3, i64 %20
  %22 = load ptr, ptr %21, align 8
  call void @free(ptr noundef %22) #4
  br label %23

23:                                               ; preds = %19
  %24 = add nsw i32 %.0, 1
  br label %17, !llvm.loop !14

25:                                               ; preds = %17
  call void @free(ptr noundef %3) #4
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!14 = distinct !{!14, !7}
