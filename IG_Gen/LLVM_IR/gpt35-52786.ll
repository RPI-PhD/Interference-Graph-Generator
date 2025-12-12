; ModuleID = 'DATASETv2/gpt35-52786.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @getSignalStrength(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = call i64 @time(ptr noundef null) #4
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #4
  %7 = call i32 @rand() #4
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %3, align 4
  %10 = sub nsw i32 %8, %9
  %11 = add nsw i32 %10, 1
  %12 = srem i32 %7, %11
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %12, %13
  ret i32 %14
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 20, i1 false)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %4)
  %11 = load i32, ptr %4, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %11)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %5)
  store i32 0, ptr %3, align 4
  br label %14

14:                                               ; preds = %24, %0
  %15 = load i32, ptr %3, align 4
  %16 = icmp slt i32 %15, 5
  br i1 %16, label %17, label %27

17:                                               ; preds = %14
  %18 = load i32, ptr %4, align 4
  %19 = load i32, ptr %5, align 4
  %20 = call i32 @getSignalStrength(i32 noundef %18, i32 noundef %19)
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %22
  store i32 %20, ptr %23, align 4
  br label %24

24:                                               ; preds = %17
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %3, align 4
  br label %14, !llvm.loop !6

27:                                               ; preds = %14
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %3, align 4
  br label %29

29:                                               ; preds = %40, %27
  %30 = load i32, ptr %3, align 4
  %31 = icmp slt i32 %30, 5
  br i1 %31, label %32, label %43

32:                                               ; preds = %29
  %33 = load i32, ptr %3, align 4
  %34 = add nsw i32 %33, 1
  %35 = load i32, ptr %3, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %34, i32 noundef %38)
  br label %40

40:                                               ; preds = %32
  %41 = load i32, ptr %3, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %3, align 4
  br label %29, !llvm.loop !8

43:                                               ; preds = %29
  store i32 0, ptr %6, align 4
  store i32 0, ptr %3, align 4
  br label %44

44:                                               ; preds = %54, %43
  %45 = load i32, ptr %3, align 4
  %46 = icmp slt i32 %45, 5
  br i1 %46, label %47, label %57

47:                                               ; preds = %44
  %48 = load i32, ptr %3, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, ptr %6, align 4
  br label %54

54:                                               ; preds = %47
  %55 = load i32, ptr %3, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %3, align 4
  br label %44, !llvm.loop !9

57:                                               ; preds = %44
  %58 = load i32, ptr %6, align 4
  %59 = sitofp i32 %58 to float
  %60 = fdiv float %59, 5.000000e+00
  store float %60, ptr %7, align 4
  %61 = load float, ptr %7, align 4
  %62 = fpext float %61 to double
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %62)
  %64 = load float, ptr %7, align 4
  %65 = fcmp oge float %64, 7.500000e+01
  br i1 %65, label %66, label %68

66:                                               ; preds = %57
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %82

68:                                               ; preds = %57
  %69 = load float, ptr %7, align 4
  %70 = fcmp oge float %69, 5.000000e+01
  br i1 %70, label %71, label %73

71:                                               ; preds = %68
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %81

73:                                               ; preds = %68
  %74 = load float, ptr %7, align 4
  %75 = fcmp oge float %74, 2.500000e+01
  br i1 %75, label %76, label %78

76:                                               ; preds = %73
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %80

78:                                               ; preds = %73
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %80

80:                                               ; preds = %78, %76
  br label %81

81:                                               ; preds = %80, %71
  br label %82

82:                                               ; preds = %81, %66
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
