; ModuleID = 'LLVM_IR/gemini_pro-653.ll'
source_filename = "DATASETv2/gemini_pro-653.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Income = type { [50 x i8], double }
%struct.Expense = type { [50 x i8], double }

@.str = private unnamed_addr constant [29 x i8] c"Enter the source of income: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Enter the amount of income: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"Enter the category of expense: \00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"Enter the amount of expense: \00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"\0AIncome Details:\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"%s: $%.2lf\0A\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"\0AExpense Details:\0A\00", align 1
@.str.9 = private unnamed_addr constant [27 x i8] c"\0APersonal Finance Planner\0A\00", align 1
@.str.10 = private unnamed_addr constant [15 x i8] c"1. Add Income\0A\00", align 1
@.str.11 = private unnamed_addr constant [16 x i8] c"2. Add Expense\0A\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"3. Print Income Details\0A\00", align 1
@.str.13 = private unnamed_addr constant [26 x i8] c"4. Print Expense Details\0A\00", align 1
@.str.14 = private unnamed_addr constant [25 x i8] c"5. Calculate Net Income\0A\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"6. Exit\0A\00", align 1
@.str.16 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"\0ANet Income: $%.2lf\0A\00", align 1
@.str.19 = private unnamed_addr constant [24 x i8] c"Exiting the program...\0A\00", align 1
@.str.20 = private unnamed_addr constant [35 x i8] c"Invalid choice. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addIncome(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load i32, ptr %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %struct.Income, ptr %0, i64 %5
  %7 = getelementptr inbounds %struct.Income, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds [50 x i8], ptr %7, i64 0, i64 0
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds %struct.Income, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.Income, ptr %13, i32 0, i32 1
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %14)
  %16 = load i32, ptr %1, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %1, align 4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addExpense(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %4 = load i32, ptr %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %struct.Expense, ptr %0, i64 %5
  %7 = getelementptr inbounds %struct.Expense, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds [50 x i8], ptr %7, i64 0, i64 0
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds %struct.Expense, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.Expense, ptr %13, i32 0, i32 1
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %14)
  %16 = load i32, ptr %1, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %1, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printIncome(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %4

4:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.Income, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.Income, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.Income, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.Income, ptr %12, i32 0, i32 1
  %14 = load double, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %10, double noundef %14)
  br label %16

16:                                               ; preds = %6
  %17 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

18:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printExpense(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %4

4:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.Expense, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.Expense, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.Expense, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.Expense, ptr %12, i32 0, i32 1
  %14 = load double, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %10, double noundef %14)
  br label %16

16:                                               ; preds = %6
  %17 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !8

18:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @calculateNetIncome(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  br label %5

5:                                                ; preds = %13, %4
  %.03 = phi double [ 0.000000e+00, %4 ], [ %12, %13 ]
  %.02 = phi i32 [ 0, %4 ], [ %14, %13 ]
  %6 = icmp slt i32 %.02, %1
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = sext i32 %.02 to i64
  %9 = getelementptr inbounds %struct.Income, ptr %0, i64 %8
  %10 = getelementptr inbounds %struct.Income, ptr %9, i32 0, i32 1
  %11 = load double, ptr %10, align 8
  %12 = fadd double %.03, %11
  br label %13

13:                                               ; preds = %7
  %14 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !9

15:                                               ; preds = %5
  br label %16

16:                                               ; preds = %24, %15
  %.01 = phi double [ 0.000000e+00, %15 ], [ %23, %24 ]
  %.0 = phi i32 [ 0, %15 ], [ %25, %24 ]
  %17 = icmp slt i32 %.0, %3
  br i1 %17, label %18, label %26

18:                                               ; preds = %16
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds %struct.Expense, ptr %2, i64 %19
  %21 = getelementptr inbounds %struct.Expense, ptr %20, i32 0, i32 1
  %22 = load double, ptr %21, align 8
  %23 = fadd double %.01, %22
  br label %24

24:                                               ; preds = %18
  %25 = add nsw i32 %.0, 1
  br label %16, !llvm.loop !10

26:                                               ; preds = %16
  %27 = fsub double %.03, %.01
  ret double %27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10 x %struct.Income], align 16
  %2 = alloca [10 x %struct.Expense], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %39, %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.17, ptr noundef %5)
  %16 = load i32, ptr %5, align 4
  switch i32 %16, label %36 [
    i32 1, label %17
    i32 2, label %19
    i32 3, label %21
    i32 4, label %24
    i32 5, label %27
    i32 6, label %34
  ]

17:                                               ; preds = %6
  %18 = getelementptr inbounds [10 x %struct.Income], ptr %1, i64 0, i64 0
  call void @addIncome(ptr noundef %18, ptr noundef %3)
  br label %38

19:                                               ; preds = %6
  %20 = getelementptr inbounds [10 x %struct.Expense], ptr %2, i64 0, i64 0
  call void @addExpense(ptr noundef %20, ptr noundef %4)
  br label %38

21:                                               ; preds = %6
  %22 = getelementptr inbounds [10 x %struct.Income], ptr %1, i64 0, i64 0
  %23 = load i32, ptr %3, align 4
  call void @printIncome(ptr noundef %22, i32 noundef %23)
  br label %38

24:                                               ; preds = %6
  %25 = getelementptr inbounds [10 x %struct.Expense], ptr %2, i64 0, i64 0
  %26 = load i32, ptr %4, align 4
  call void @printExpense(ptr noundef %25, i32 noundef %26)
  br label %38

27:                                               ; preds = %6
  %28 = getelementptr inbounds [10 x %struct.Income], ptr %1, i64 0, i64 0
  %29 = load i32, ptr %3, align 4
  %30 = getelementptr inbounds [10 x %struct.Expense], ptr %2, i64 0, i64 0
  %31 = load i32, ptr %4, align 4
  %32 = call double @calculateNetIncome(ptr noundef %28, i32 noundef %29, ptr noundef %30, i32 noundef %31)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, double noundef %32)
  br label %38

34:                                               ; preds = %6
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %38

36:                                               ; preds = %6
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %38

38:                                               ; preds = %36, %34, %27, %24, %21, %19, %17
  br label %39

39:                                               ; preds = %38
  %40 = load i32, ptr %5, align 4
  %41 = icmp ne i32 %40, 6
  br i1 %41, label %6, label %42, !llvm.loop !11

42:                                               ; preds = %39
  ret i32 0
}

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
!11 = distinct !{!11, !7}
