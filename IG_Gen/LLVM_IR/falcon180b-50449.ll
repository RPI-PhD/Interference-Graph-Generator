; ModuleID = 'DATASETv2/falcon180b-50449.c'
source_filename = "DATASETv2/falcon180b-50449.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Question = type { [100 x i8], [5 x ptr], i32 }

@.str = private unnamed_addr constant [44 x i8] c"Welcome to the Online Examination System!\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"Enter the number of questions: \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Enter the questions and options:\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"Question %d:\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"Enter the options (separated by spaces): \00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"Enter the correct answer (0-4): \00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"\0AOnline Examination System\0A\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"Question %d: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"%d. %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [26 x i8] c"Enter your answer (1-5): \00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"Correct!\0A\00", align 1
@.str.13 = private unnamed_addr constant [12 x i8] c"Incorrect.\0A\00", align 1
@.str.14 = private unnamed_addr constant [49 x i8] c"\0AYou answered %d out of %d questions correctly.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x %struct.Question], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %2)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %50, %0
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %53

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %17, 1
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %18)
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.Question], ptr %3, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Question, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [100 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %24)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %6, align 4
  br label %27

27:                                               ; preds = %40, %16
  %28 = load i32, ptr %6, align 4
  %29 = icmp slt i32 %28, 5
  br i1 %29, label %30, label %43

30:                                               ; preds = %27
  %31 = load i32, ptr %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [100 x %struct.Question], ptr %3, i64 0, i64 %32
  %34 = getelementptr inbounds %struct.Question, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [5 x ptr], ptr %34, i64 0, i64 %36
  %38 = load ptr, ptr %37, align 8
  %39 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %38)
  br label %40

40:                                               ; preds = %30
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %6, align 4
  br label %27, !llvm.loop !6

43:                                               ; preds = %27
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %45 = load i32, ptr %5, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [100 x %struct.Question], ptr %3, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.Question, ptr %47, i32 0, i32 2
  %49 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %48)
  br label %50

50:                                               ; preds = %43
  %51 = load i32, ptr %5, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %5, align 4
  br label %12, !llvm.loop !8

53:                                               ; preds = %12
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i32 0, ptr %5, align 4
  br label %55

55:                                               ; preds = %103, %53
  %56 = load i32, ptr %5, align 4
  %57 = load i32, ptr %2, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %106

59:                                               ; preds = %55
  %60 = load i32, ptr %5, align 4
  %61 = add nsw i32 %60, 1
  %62 = load i32, ptr %5, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [100 x %struct.Question], ptr %3, i64 0, i64 %63
  %65 = getelementptr inbounds %struct.Question, ptr %64, i32 0, i32 0
  %66 = getelementptr inbounds [100 x i8], ptr %65, i64 0, i64 0
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %61, ptr noundef %66)
  store i32 0, ptr %6, align 4
  br label %68

68:                                               ; preds = %83, %59
  %69 = load i32, ptr %6, align 4
  %70 = icmp slt i32 %69, 5
  br i1 %70, label %71, label %86

71:                                               ; preds = %68
  %72 = load i32, ptr %6, align 4
  %73 = add nsw i32 %72, 1
  %74 = load i32, ptr %5, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [100 x %struct.Question], ptr %3, i64 0, i64 %75
  %77 = getelementptr inbounds %struct.Question, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %6, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [5 x ptr], ptr %77, i64 0, i64 %79
  %81 = load ptr, ptr %80, align 8
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %73, ptr noundef %81)
  br label %83

83:                                               ; preds = %71
  %84 = load i32, ptr %6, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %6, align 4
  br label %68, !llvm.loop !9

86:                                               ; preds = %68
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %88 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %7)
  %89 = load i32, ptr %7, align 4
  %90 = load i32, ptr %5, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [100 x %struct.Question], ptr %3, i64 0, i64 %91
  %93 = getelementptr inbounds %struct.Question, ptr %92, i32 0, i32 2
  %94 = load i32, ptr %93, align 8
  %95 = icmp eq i32 %89, %94
  br i1 %95, label %96, label %98

96:                                               ; preds = %86
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %102

98:                                               ; preds = %86
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %100 = load i32, ptr %4, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %4, align 4
  br label %102

102:                                              ; preds = %98, %96
  br label %103

103:                                              ; preds = %102
  %104 = load i32, ptr %5, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %5, align 4
  br label %55, !llvm.loop !10

106:                                              ; preds = %55
  %107 = load i32, ptr %2, align 4
  %108 = load i32, ptr %4, align 4
  %109 = sub nsw i32 %107, %108
  %110 = load i32, ptr %2, align 4
  %111 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %109, i32 noundef %110)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
