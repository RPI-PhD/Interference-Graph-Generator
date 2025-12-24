; ModuleID = 'LLVM_IR/gpt35-25927.ll'
source_filename = "DATASETv2/gpt35-25927.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { ptr, ptr }
%struct.operation = type { double, double, i8, i32 }

@operationCounter = dso_local global i32 0, align 4
@ans = dso_local global [100 x double] zeroinitializer, align 16
@.str = private unnamed_addr constant [25 x i8] c"ERROR: Division by zero\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"ERROR: Invalid operator\0A\00", align 1
@lock = dso_local global %union.pthread_mutex_t zeroinitializer, align 8
@.str.2 = private unnamed_addr constant [69 x i8] c"Enter an operation (in the format of 'operand1 operator operand2'): \00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"%lf %c %lf\00", align 1
@.str.4 = private unnamed_addr constant [48 x i8] c"ERROR: Return code from pthread_create() is %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [48 x i8] c"Do you want to input another operation? (y/n): \00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"Answers:\0A\00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"Operation %d: \00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"Error\0A\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"%.2lf\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @calculate(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 3
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 2
  %5 = load i8, ptr %4, align 8
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 43
  br i1 %7, label %8, label %16

8:                                                ; preds = %1
  %9 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 0
  %10 = load double, ptr %9, align 8
  %11 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  %13 = fadd double %10, %12
  %14 = sext i32 %3 to i64
  %15 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %14
  store double %13, ptr %15, align 8
  br label %85

16:                                               ; preds = %1
  %17 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 2
  %18 = load i8, ptr %17, align 8
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 45
  br i1 %20, label %21, label %29

21:                                               ; preds = %16
  %22 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 0
  %23 = load double, ptr %22, align 8
  %24 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 1
  %25 = load double, ptr %24, align 8
  %26 = fsub double %23, %25
  %27 = sext i32 %3 to i64
  %28 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %27
  store double %26, ptr %28, align 8
  br label %84

29:                                               ; preds = %16
  %30 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 2
  %31 = load i8, ptr %30, align 8
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 42
  br i1 %33, label %34, label %42

34:                                               ; preds = %29
  %35 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 0
  %36 = load double, ptr %35, align 8
  %37 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 1
  %38 = load double, ptr %37, align 8
  %39 = fmul double %36, %38
  %40 = sext i32 %3 to i64
  %41 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %40
  store double %39, ptr %41, align 8
  br label %83

42:                                               ; preds = %29
  %43 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 2
  %44 = load i8, ptr %43, align 8
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 47
  br i1 %46, label %47, label %64

47:                                               ; preds = %42
  %48 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 1
  %49 = load double, ptr %48, align 8
  %50 = fcmp oeq double %49, 0.000000e+00
  br i1 %50, label %51, label %55

51:                                               ; preds = %47
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %53 = sext i32 %3 to i64
  %54 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %53
  store double -1.000000e+00, ptr %54, align 8
  br label %63

55:                                               ; preds = %47
  %56 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 0
  %57 = load double, ptr %56, align 8
  %58 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = fdiv double %57, %59
  %61 = sext i32 %3 to i64
  %62 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %61
  store double %60, ptr %62, align 8
  br label %63

63:                                               ; preds = %55, %51
  br label %82

64:                                               ; preds = %42
  %65 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 2
  %66 = load i8, ptr %65, align 8
  %67 = sext i8 %66 to i32
  %68 = icmp eq i32 %67, 94
  br i1 %68, label %69, label %77

69:                                               ; preds = %64
  %70 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 0
  %71 = load double, ptr %70, align 8
  %72 = getelementptr inbounds %struct.operation, ptr %0, i32 0, i32 1
  %73 = load double, ptr %72, align 8
  %74 = call double @pow(double noundef %71, double noundef %73) #5
  %75 = sext i32 %3 to i64
  %76 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %75
  store double %74, ptr %76, align 8
  br label %81

77:                                               ; preds = %64
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %79 = sext i32 %3 to i64
  %80 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %79
  store double -1.000000e+00, ptr %80, align 8
  br label %81

81:                                               ; preds = %77, %69
  br label %82

82:                                               ; preds = %81, %63
  br label %83

83:                                               ; preds = %82, %34
  br label %84

84:                                               ; preds = %83, %21
  br label %85

85:                                               ; preds = %84, %8
  %86 = call i32 @pthread_mutex_lock(ptr noundef @lock) #5
  %87 = load i32, ptr @operationCounter, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr @operationCounter, align 4
  %89 = call i32 @pthread_mutex_unlock(ptr noundef @lock) #5
  call void @pthread_exit(ptr noundef null) #6
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(ptr noundef) #2

; Function Attrs: noreturn
declare void @pthread_exit(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i64], align 16
  %2 = alloca [100 x %struct.operation], align 16
  %3 = alloca i8, align 1
  store i8 121, ptr %3, align 1
  %4 = call i32 @pthread_mutex_init(ptr noundef @lock, ptr noundef null) #5
  br label %5

5:                                                ; preds = %36, %0
  %.01 = phi i32 [ 0, %0 ], [ %39, %36 ]
  %6 = load i8, ptr %3, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32 %7, 121
  br i1 %8, label %9, label %11

9:                                                ; preds = %5
  %10 = icmp slt i32 %.01, 100
  br label %11

11:                                               ; preds = %9, %5
  %12 = phi i1 [ false, %5 ], [ %10, %9 ]
  br i1 %12, label %13, label %40

13:                                               ; preds = %11
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds [100 x %struct.operation], ptr %2, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.operation, ptr %16, i32 0, i32 0
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [100 x %struct.operation], ptr %2, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.operation, ptr %19, i32 0, i32 2
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [100 x %struct.operation], ptr %2, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.operation, ptr %22, i32 0, i32 1
  %24 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %17, ptr noundef %20, ptr noundef %23)
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [100 x %struct.operation], ptr %2, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.operation, ptr %26, i32 0, i32 3
  store i32 %.01, ptr %27, align 4
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds [100 x i64], ptr %1, i64 0, i64 %28
  %30 = sext i32 %.01 to i64
  %31 = getelementptr inbounds [100 x %struct.operation], ptr %2, i64 0, i64 %30
  %32 = call i32 @pthread_create(ptr noundef %29, ptr noundef null, ptr noundef @calculate, ptr noundef %31) #5
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %13
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %32)
  call void @exit(i32 noundef -1) #7
  unreachable

36:                                               ; preds = %13
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %38 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %3)
  %39 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !6

40:                                               ; preds = %11
  br label %41

41:                                               ; preds = %44, %40
  %42 = load i32, ptr @operationCounter, align 4
  %43 = icmp slt i32 %42, %.01
  br i1 %43, label %44, label %45

44:                                               ; preds = %41
  br label %41, !llvm.loop !8

45:                                               ; preds = %41
  %46 = call i32 @pthread_mutex_destroy(ptr noundef @lock) #5
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %48

48:                                               ; preds = %65, %45
  %.0 = phi i32 [ 0, %45 ], [ %66, %65 ]
  %49 = icmp slt i32 %.0, %.01
  br i1 %49, label %50, label %67

50:                                               ; preds = %48
  %51 = add nsw i32 %.0, 1
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %51)
  %53 = sext i32 %.0 to i64
  %54 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %53
  %55 = load double, ptr %54, align 8
  %56 = fcmp oeq double %55, -1.000000e+00
  br i1 %56, label %57, label %59

57:                                               ; preds = %50
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %64

59:                                               ; preds = %50
  %60 = sext i32 %.0 to i64
  %61 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %60
  %62 = load double, ptr %61, align 8
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %62)
  br label %64

64:                                               ; preds = %59, %57
  br label %65

65:                                               ; preds = %64
  %66 = add nsw i32 %.0, 1
  br label %48, !llvm.loop !9

67:                                               ; preds = %48
  call void @pthread_exit(ptr noundef null) #6
  unreachable
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_init(ptr noundef, ptr noundef) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare i32 @pthread_mutex_destroy(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }
attributes #7 = { noreturn nounwind }

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
