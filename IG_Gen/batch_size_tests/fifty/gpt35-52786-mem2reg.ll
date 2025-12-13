; ModuleID = 'LLVM_IR/gpt35-52786.ll'
source_filename = "DATASETv2/gpt35-52786.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"Welcome to Wi-Fi Signal Strength Analyzer!\0A\00", align 1
@.str.1 = private unnamed_addr constant [61 x i8] c"Please enter the minimum value for signal strength (0-100): \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [62 x i8] c"Please enter the maximum value for signal strength (%d-100): \00", align 1
@.str.4 = private unnamed_addr constant [58 x i8] c"Here are the 5 signal strength values that we generated:\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Signal %d: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [37 x i8] c"The average signal strength is %.2f\0A\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"The signal strength is excellent!\0A\00", align 1
@.str.8 = private unnamed_addr constant [30 x i8] c"The signal strength is good.\0A\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"The signal strength is fair.\0A\00", align 1
@.str.10 = private unnamed_addr constant [79 x i8] c"The signal strength is poor. You may have trouble connecting to the internet.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getSignalStrength(i32 noundef %0, i32 noundef %1) #0 {
  %3 = call i64 @time(ptr noundef null) #4
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #4
  %5 = call i32 @rand() #4
  %6 = sub nsw i32 %1, %0
  %7 = add nsw i32 %6, 1
  %8 = srem i32 %5, %7
  %9 = add nsw i32 %8, %0
  ret i32 %9
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x i32], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %1, i8 0, i64 20, i1 false)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %2)
  %7 = load i32, ptr %2, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %7)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %3)
  br label %10

10:                                               ; preds = %18, %0
  %.01 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %11 = icmp slt i32 %.01, 5
  br i1 %11, label %12, label %20

12:                                               ; preds = %10
  %13 = load i32, ptr %2, align 4
  %14 = load i32, ptr %3, align 4
  %15 = call i32 @getSignalStrength(i32 noundef %13, i32 noundef %14)
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds [5 x i32], ptr %1, i64 0, i64 %16
  store i32 %15, ptr %17, align 4
  br label %18

18:                                               ; preds = %12
  %19 = add nsw i32 %.01, 1
  br label %10, !llvm.loop !6

20:                                               ; preds = %10
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %22

22:                                               ; preds = %30, %20
  %.1 = phi i32 [ 0, %20 ], [ %31, %30 ]
  %23 = icmp slt i32 %.1, 5
  br i1 %23, label %24, label %32

24:                                               ; preds = %22
  %25 = add nsw i32 %.1, 1
  %26 = sext i32 %.1 to i64
  %27 = getelementptr inbounds [5 x i32], ptr %1, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %25, i32 noundef %28)
  br label %30

30:                                               ; preds = %24
  %31 = add nsw i32 %.1, 1
  br label %22, !llvm.loop !8

32:                                               ; preds = %22
  br label %33

33:                                               ; preds = %40, %32
  %.2 = phi i32 [ 0, %32 ], [ %41, %40 ]
  %.0 = phi i32 [ 0, %32 ], [ %39, %40 ]
  %34 = icmp slt i32 %.2, 5
  br i1 %34, label %35, label %42

35:                                               ; preds = %33
  %36 = sext i32 %.2 to i64
  %37 = getelementptr inbounds [5 x i32], ptr %1, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %.0, %38
  br label %40

40:                                               ; preds = %35
  %41 = add nsw i32 %.2, 1
  br label %33, !llvm.loop !9

42:                                               ; preds = %33
  %43 = sitofp i32 %.0 to float
  %44 = fdiv float %43, 5.000000e+00
  %45 = fpext float %44 to double
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %45)
  %47 = fcmp oge float %44, 7.500000e+01
  br i1 %47, label %48, label %50

48:                                               ; preds = %42
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %62

50:                                               ; preds = %42
  %51 = fcmp oge float %44, 5.000000e+01
  br i1 %51, label %52, label %54

52:                                               ; preds = %50
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %61

54:                                               ; preds = %50
  %55 = fcmp oge float %44, 2.500000e+01
  br i1 %55, label %56, label %58

56:                                               ; preds = %54
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %60

58:                                               ; preds = %54
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %60

60:                                               ; preds = %58, %56
  br label %61

61:                                               ; preds = %60, %52
  br label %62

62:                                               ; preds = %61, %48
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
