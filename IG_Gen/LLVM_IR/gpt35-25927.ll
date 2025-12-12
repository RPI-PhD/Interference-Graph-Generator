; ModuleID = 'DATASETv2/gpt35-25927.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @calculate(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.operation, ptr %6, i32 0, i32 3
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %4, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.operation, ptr %9, i32 0, i32 2
  %11 = load i8, ptr %10, align 8
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 43
  br i1 %13, label %14, label %25

14:                                               ; preds = %1
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.operation, ptr %15, i32 0, i32 0
  %17 = load double, ptr %16, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.operation, ptr %18, i32 0, i32 1
  %20 = load double, ptr %19, align 8
  %21 = fadd double %17, %20
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %23
  store double %21, ptr %24, align 8
  br label %113

25:                                               ; preds = %1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.operation, ptr %26, i32 0, i32 2
  %28 = load i8, ptr %27, align 8
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %29, 45
  br i1 %30, label %31, label %42

31:                                               ; preds = %25
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.operation, ptr %32, i32 0, i32 0
  %34 = load double, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.operation, ptr %35, i32 0, i32 1
  %37 = load double, ptr %36, align 8
  %38 = fsub double %34, %37
  %39 = load i32, ptr %4, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %40
  store double %38, ptr %41, align 8
  br label %112

42:                                               ; preds = %25
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %struct.operation, ptr %43, i32 0, i32 2
  %45 = load i8, ptr %44, align 8
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %46, 42
  br i1 %47, label %48, label %59

48:                                               ; preds = %42
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.operation, ptr %49, i32 0, i32 0
  %51 = load double, ptr %50, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.operation, ptr %52, i32 0, i32 1
  %54 = load double, ptr %53, align 8
  %55 = fmul double %51, %54
  %56 = load i32, ptr %4, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %57
  store double %55, ptr %58, align 8
  br label %111

59:                                               ; preds = %42
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.operation, ptr %60, i32 0, i32 2
  %62 = load i8, ptr %61, align 8
  %63 = sext i8 %62 to i32
  %64 = icmp eq i32 %63, 47
  br i1 %64, label %65, label %87

65:                                               ; preds = %59
  %66 = load ptr, ptr %3, align 8
  %67 = getelementptr inbounds %struct.operation, ptr %66, i32 0, i32 1
  %68 = load double, ptr %67, align 8
  %69 = fcmp oeq double %68, 0.000000e+00
  br i1 %69, label %70, label %75

70:                                               ; preds = %65
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %72 = load i32, ptr %4, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %73
  store double -1.000000e+00, ptr %74, align 8
  br label %86

75:                                               ; preds = %65
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds %struct.operation, ptr %76, i32 0, i32 0
  %78 = load double, ptr %77, align 8
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds %struct.operation, ptr %79, i32 0, i32 1
  %81 = load double, ptr %80, align 8
  %82 = fdiv double %78, %81
  %83 = load i32, ptr %4, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %84
  store double %82, ptr %85, align 8
  br label %86

86:                                               ; preds = %75, %70
  br label %110

87:                                               ; preds = %59
  %88 = load ptr, ptr %3, align 8
  %89 = getelementptr inbounds %struct.operation, ptr %88, i32 0, i32 2
  %90 = load i8, ptr %89, align 8
  %91 = sext i8 %90 to i32
  %92 = icmp eq i32 %91, 94
  br i1 %92, label %93, label %104

93:                                               ; preds = %87
  %94 = load ptr, ptr %3, align 8
  %95 = getelementptr inbounds %struct.operation, ptr %94, i32 0, i32 0
  %96 = load double, ptr %95, align 8
  %97 = load ptr, ptr %3, align 8
  %98 = getelementptr inbounds %struct.operation, ptr %97, i32 0, i32 1
  %99 = load double, ptr %98, align 8
  %100 = call double @pow(double noundef %96, double noundef %99) #5
  %101 = load i32, ptr %4, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %102
  store double %100, ptr %103, align 8
  br label %109

104:                                              ; preds = %87
  %105 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %106 = load i32, ptr %4, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %107
  store double -1.000000e+00, ptr %108, align 8
  br label %109

109:                                              ; preds = %104, %93
  br label %110

110:                                              ; preds = %109, %86
  br label %111

111:                                              ; preds = %110, %48
  br label %112

112:                                              ; preds = %111, %31
  br label %113

113:                                              ; preds = %112, %14
  %114 = call i32 @pthread_mutex_lock(ptr noundef @lock) #5
  %115 = load i32, ptr @operationCounter, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr @operationCounter, align 4
  %117 = call i32 @pthread_mutex_unlock(ptr noundef @lock) #5
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i64], align 16
  %3 = alloca [100 x %struct.operation], align 16
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  store i8 121, ptr %5, align 1
  %8 = call i32 @pthread_mutex_init(ptr noundef @lock, ptr noundef null) #5
  br label %9

9:                                                ; preds = %50, %0
  %10 = load i8, ptr %5, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 121
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 100
  br label %16

16:                                               ; preds = %13, %9
  %17 = phi i1 [ false, %9 ], [ %15, %13 ]
  br i1 %17, label %18, label %55

18:                                               ; preds = %16
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.operation], ptr %3, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.operation, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [100 x %struct.operation], ptr %3, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.operation, ptr %26, i32 0, i32 2
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.operation], ptr %3, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.operation, ptr %30, i32 0, i32 1
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %23, ptr noundef %27, ptr noundef %31)
  %33 = load i32, ptr %4, align 4
  %34 = load i32, ptr %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [100 x %struct.operation], ptr %3, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.operation, ptr %36, i32 0, i32 3
  store i32 %33, ptr %37, align 4
  %38 = load i32, ptr %4, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x i64], ptr %2, i64 0, i64 %39
  %41 = load i32, ptr %4, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x %struct.operation], ptr %3, i64 0, i64 %42
  %44 = call i32 @pthread_create(ptr noundef %40, ptr noundef null, ptr noundef @calculate, ptr noundef %43) #5
  store i32 %44, ptr %6, align 4
  %45 = load i32, ptr %6, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %50

47:                                               ; preds = %18
  %48 = load i32, ptr %6, align 4
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %48)
  call void @exit(i32 noundef -1) #7
  unreachable

50:                                               ; preds = %18
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %52 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %5)
  %53 = load i32, ptr %4, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %4, align 4
  br label %9, !llvm.loop !6

55:                                               ; preds = %16
  br label %56

56:                                               ; preds = %60, %55
  %57 = load i32, ptr @operationCounter, align 4
  %58 = load i32, ptr %4, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %61

60:                                               ; preds = %56
  br label %56, !llvm.loop !8

61:                                               ; preds = %56
  %62 = call i32 @pthread_mutex_destroy(ptr noundef @lock) #5
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 0, ptr %7, align 4
  br label %64

64:                                               ; preds = %86, %61
  %65 = load i32, ptr %7, align 4
  %66 = load i32, ptr %4, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %89

68:                                               ; preds = %64
  %69 = load i32, ptr %7, align 4
  %70 = add nsw i32 %69, 1
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %70)
  %72 = load i32, ptr %7, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %73
  %75 = load double, ptr %74, align 8
  %76 = fcmp oeq double %75, -1.000000e+00
  br i1 %76, label %77, label %79

77:                                               ; preds = %68
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %85

79:                                               ; preds = %68
  %80 = load i32, ptr %7, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [100 x double], ptr @ans, i64 0, i64 %81
  %83 = load double, ptr %82, align 8
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %83)
  br label %85

85:                                               ; preds = %79, %77
  br label %86

86:                                               ; preds = %85
  %87 = load i32, ptr %7, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %7, align 4
  br label %64, !llvm.loop !9

89:                                               ; preds = %64
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
