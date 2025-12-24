; ModuleID = 'LLVM_IR/falcon180b-62291.ll'
source_filename = "DATASETv2/falcon180b-62291.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ThreadData = type { i32, i32, i32 }

@.str = private unnamed_addr constant [8 x i8] c"\1B[0;31m\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"\1B[0;34m\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"\E2\96\88\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @generateQR(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 2
  %7 = load i32, ptr %6, align 4
  br label %8

8:                                                ; preds = %27, %1
  %.01 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %9 = icmp slt i32 %.01, 10
  br i1 %9, label %10, label %29

10:                                               ; preds = %8
  br label %11

11:                                               ; preds = %23, %10
  %.0 = phi i32 [ 0, %10 ], [ %24, %23 ]
  %12 = icmp slt i32 %.0, 10
  br i1 %12, label %13, label %25

13:                                               ; preds = %11
  %14 = add nsw i32 %.01, %.0
  %15 = srem i32 %14, 2
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %21

19:                                               ; preds = %13
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %21

21:                                               ; preds = %19, %17
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %23

23:                                               ; preds = %21
  %24 = add nsw i32 %.0, 1
  br label %11, !llvm.loop !6

25:                                               ; preds = %11
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %27

27:                                               ; preds = %25
  %28 = add nsw i32 %.01, 1
  br label %8, !llvm.loop !8

29:                                               ; preds = %8
  ret ptr null
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10 x i64], align 16
  %2 = alloca [10 x %struct.ThreadData], align 16
  br label %3

3:                                                ; preds = %22, %0
  %.01 = phi i32 [ 0, %0 ], [ %23, %22 ]
  %4 = icmp slt i32 %.01, 10
  br i1 %4, label %5, label %24

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds [10 x %struct.ThreadData], ptr %2, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.ThreadData, ptr %7, i32 0, i32 0
  store i32 %.01, ptr %8, align 4
  %9 = srem i32 %.01, 10
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [10 x %struct.ThreadData], ptr %2, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.ThreadData, ptr %11, i32 0, i32 1
  store i32 %9, ptr %12, align 4
  %13 = sdiv i32 %.01, 10
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds [10 x %struct.ThreadData], ptr %2, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.ThreadData, ptr %15, i32 0, i32 2
  store i32 %13, ptr %16, align 4
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [10 x i64], ptr %1, i64 0, i64 %17
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds [10 x %struct.ThreadData], ptr %2, i64 0, i64 %19
  %21 = call i32 @pthread_create(ptr noundef %18, ptr noundef null, ptr noundef @generateQR, ptr noundef %20) #3
  br label %22

22:                                               ; preds = %5
  %23 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !9

24:                                               ; preds = %3
  br label %25

25:                                               ; preds = %32, %24
  %.0 = phi i32 [ 0, %24 ], [ %33, %32 ]
  %26 = icmp slt i32 %.0, 10
  br i1 %26, label %27, label %34

27:                                               ; preds = %25
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [10 x i64], ptr %1, i64 0, i64 %28
  %30 = load i64, ptr %29, align 8
  %31 = call i32 @pthread_join(i64 noundef %30, ptr noundef null)
  br label %32

32:                                               ; preds = %27
  %33 = add nsw i32 %.0, 1
  br label %25, !llvm.loop !10

34:                                               ; preds = %25
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @pthread_join(i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
