; ModuleID = 'DATASETv2/falcon180b-62291.c'
source_filename = "DATASETv2/falcon180b-62291.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ThreadData = type { i32, i32, i32 }

@.str = private unnamed_addr constant [8 x i8] c"\1B[0;31m\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"\1B[0;34m\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"\E2\96\88\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @generateQR(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.ThreadData, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 4
  store i32 %12, ptr %4, align 4
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.ThreadData, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  store i32 %15, ptr %5, align 4
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.ThreadData, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 4
  store i32 %18, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %19

19:                                               ; preds = %43, %1
  %20 = load i32, ptr %7, align 4
  %21 = icmp slt i32 %20, 10
  br i1 %21, label %22, label %46

22:                                               ; preds = %19
  store i32 0, ptr %8, align 4
  br label %23

23:                                               ; preds = %38, %22
  %24 = load i32, ptr %8, align 4
  %25 = icmp slt i32 %24, 10
  br i1 %25, label %26, label %41

26:                                               ; preds = %23
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %27, %28
  %30 = srem i32 %29, 2
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %26
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %36

34:                                               ; preds = %26
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %36

36:                                               ; preds = %34, %32
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %38

38:                                               ; preds = %36
  %39 = load i32, ptr %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %8, align 4
  br label %23, !llvm.loop !6

41:                                               ; preds = %23
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %43

43:                                               ; preds = %41
  %44 = load i32, ptr %7, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %7, align 4
  br label %19, !llvm.loop !8

46:                                               ; preds = %19
  ret ptr null
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i64], align 16
  %3 = alloca [10 x %struct.ThreadData], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %34, %0
  %7 = load i32, ptr %4, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %37

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10 x %struct.ThreadData], ptr %3, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.ThreadData, ptr %13, i32 0, i32 0
  store i32 %10, ptr %14, align 4
  %15 = load i32, ptr %4, align 4
  %16 = srem i32 %15, 10
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [10 x %struct.ThreadData], ptr %3, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.ThreadData, ptr %19, i32 0, i32 1
  store i32 %16, ptr %20, align 4
  %21 = load i32, ptr %4, align 4
  %22 = sdiv i32 %21, 10
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [10 x %struct.ThreadData], ptr %3, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.ThreadData, ptr %25, i32 0, i32 2
  store i32 %22, ptr %26, align 4
  %27 = load i32, ptr %4, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [10 x i64], ptr %2, i64 0, i64 %28
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x %struct.ThreadData], ptr %3, i64 0, i64 %31
  %33 = call i32 @pthread_create(ptr noundef %29, ptr noundef null, ptr noundef @generateQR, ptr noundef %32) #3
  br label %34

34:                                               ; preds = %9
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %4, align 4
  br label %6, !llvm.loop !9

37:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %38

38:                                               ; preds = %47, %37
  %39 = load i32, ptr %5, align 4
  %40 = icmp slt i32 %39, 10
  br i1 %40, label %41, label %50

41:                                               ; preds = %38
  %42 = load i32, ptr %5, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [10 x i64], ptr %2, i64 0, i64 %43
  %45 = load i64, ptr %44, align 8
  %46 = call i32 @pthread_join(i64 noundef %45, ptr noundef null)
  br label %47

47:                                               ; preds = %41
  %48 = load i32, ptr %5, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %5, align 4
  br label %38, !llvm.loop !10

50:                                               ; preds = %38
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @pthread_join(i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
