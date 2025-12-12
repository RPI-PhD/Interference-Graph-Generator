; ModuleID = 'LLVM_IR/falcon180b-50449.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x %struct.Question], align 16
  %3 = alloca i32, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %1)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %8

8:                                                ; preds = %38, %0
  %.03 = phi i32 [ 0, %0 ], [ %39, %38 ]
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %.03, %9
  br i1 %10, label %11, label %40

11:                                               ; preds = %8
  %12 = add nsw i32 %.03, 1
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %12)
  %14 = sext i32 %.03 to i64
  %15 = getelementptr inbounds [100 x %struct.Question], ptr %2, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Question, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [100 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %20

20:                                               ; preds = %30, %11
  %.0 = phi i32 [ 0, %11 ], [ %31, %30 ]
  %21 = icmp slt i32 %.0, 5
  br i1 %21, label %22, label %32

22:                                               ; preds = %20
  %23 = sext i32 %.03 to i64
  %24 = getelementptr inbounds [100 x %struct.Question], ptr %2, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Question, ptr %24, i32 0, i32 1
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds [5 x ptr], ptr %25, i64 0, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %28)
  br label %30

30:                                               ; preds = %22
  %31 = add nsw i32 %.0, 1
  br label %20, !llvm.loop !6

32:                                               ; preds = %20
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %34 = sext i32 %.03 to i64
  %35 = getelementptr inbounds [100 x %struct.Question], ptr %2, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.Question, ptr %35, i32 0, i32 2
  %37 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %36)
  br label %38

38:                                               ; preds = %32
  %39 = add nsw i32 %.03, 1
  br label %8, !llvm.loop !8

40:                                               ; preds = %8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %42

42:                                               ; preds = %80, %40
  %.14 = phi i32 [ 0, %40 ], [ %81, %80 ]
  %.01 = phi i32 [ 0, %40 ], [ %.12, %80 ]
  %43 = load i32, ptr %1, align 4
  %44 = icmp slt i32 %.14, %43
  br i1 %44, label %45, label %82

45:                                               ; preds = %42
  %46 = add nsw i32 %.14, 1
  %47 = sext i32 %.14 to i64
  %48 = getelementptr inbounds [100 x %struct.Question], ptr %2, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.Question, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds [100 x i8], ptr %49, i64 0, i64 0
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %46, ptr noundef %50)
  br label %52

52:                                               ; preds = %63, %45
  %.1 = phi i32 [ 0, %45 ], [ %64, %63 ]
  %53 = icmp slt i32 %.1, 5
  br i1 %53, label %54, label %65

54:                                               ; preds = %52
  %55 = add nsw i32 %.1, 1
  %56 = sext i32 %.14 to i64
  %57 = getelementptr inbounds [100 x %struct.Question], ptr %2, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.Question, ptr %57, i32 0, i32 1
  %59 = sext i32 %.1 to i64
  %60 = getelementptr inbounds [5 x ptr], ptr %58, i64 0, i64 %59
  %61 = load ptr, ptr %60, align 8
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %55, ptr noundef %61)
  br label %63

63:                                               ; preds = %54
  %64 = add nsw i32 %.1, 1
  br label %52, !llvm.loop !9

65:                                               ; preds = %52
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %67 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %3)
  %68 = load i32, ptr %3, align 4
  %69 = sext i32 %.14 to i64
  %70 = getelementptr inbounds [100 x %struct.Question], ptr %2, i64 0, i64 %69
  %71 = getelementptr inbounds %struct.Question, ptr %70, i32 0, i32 2
  %72 = load i32, ptr %71, align 8
  %73 = icmp eq i32 %68, %72
  br i1 %73, label %74, label %76

74:                                               ; preds = %65
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %79

76:                                               ; preds = %65
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %78 = add nsw i32 %.01, 1
  br label %79

79:                                               ; preds = %76, %74
  %.12 = phi i32 [ %.01, %74 ], [ %78, %76 ]
  br label %80

80:                                               ; preds = %79
  %81 = add nsw i32 %.14, 1
  br label %42, !llvm.loop !10

82:                                               ; preds = %42
  %83 = load i32, ptr %1, align 4
  %84 = sub nsw i32 %83, %.01
  %85 = load i32, ptr %1, align 4
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %84, i32 noundef %85)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
