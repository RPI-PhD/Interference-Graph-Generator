; ModuleID = 'DATASETv2/gemini_pro-653.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addIncome(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.Income, ptr %6, i64 %9
  %11 = getelementptr inbounds %struct.Income, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.Income, ptr %15, i64 %18
  %20 = getelementptr inbounds %struct.Income, ptr %19, i32 0, i32 1
  %21 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %20)
  %22 = load ptr, ptr %4, align 8
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %22, align 4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addExpense(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.Expense, ptr %6, i64 %9
  %11 = getelementptr inbounds %struct.Expense, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.Expense, ptr %15, i64 %18
  %20 = getelementptr inbounds %struct.Expense, ptr %19, i32 0, i32 1
  %21 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %20)
  %22 = load ptr, ptr %4, align 8
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %22, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printIncome(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %25, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.Income, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.Income, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.Income, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.Income, ptr %21, i32 0, i32 1
  %23 = load double, ptr %22, align 8
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %17, double noundef %23)
  br label %25

25:                                               ; preds = %11
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %7, !llvm.loop !6

28:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printExpense(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %25, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %28

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.Expense, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.Expense, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.Expense, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.Expense, ptr %21, i32 0, i32 1
  %23 = load double, ptr %22, align 8
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %17, double noundef %23)
  br label %25

25:                                               ; preds = %11
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %7, !llvm.loop !8

28:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local double @calculateNetIncome(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  store double 0.000000e+00, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %13

13:                                               ; preds = %26, %4
  %14 = load i32, ptr %10, align 4
  %15 = load i32, ptr %6, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %29

17:                                               ; preds = %13
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %10, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.Income, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.Income, ptr %21, i32 0, i32 1
  %23 = load double, ptr %22, align 8
  %24 = load double, ptr %9, align 8
  %25 = fadd double %24, %23
  store double %25, ptr %9, align 8
  br label %26

26:                                               ; preds = %17
  %27 = load i32, ptr %10, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %10, align 4
  br label %13, !llvm.loop !9

29:                                               ; preds = %13
  store double 0.000000e+00, ptr %11, align 8
  store i32 0, ptr %12, align 4
  br label %30

30:                                               ; preds = %43, %29
  %31 = load i32, ptr %12, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %46

34:                                               ; preds = %30
  %35 = load ptr, ptr %7, align 8
  %36 = load i32, ptr %12, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.Expense, ptr %35, i64 %37
  %39 = getelementptr inbounds %struct.Expense, ptr %38, i32 0, i32 1
  %40 = load double, ptr %39, align 8
  %41 = load double, ptr %11, align 8
  %42 = fadd double %41, %40
  store double %42, ptr %11, align 8
  br label %43

43:                                               ; preds = %34
  %44 = load i32, ptr %12, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %12, align 4
  br label %30, !llvm.loop !10

46:                                               ; preds = %30
  %47 = load double, ptr %9, align 8
  %48 = load double, ptr %11, align 8
  %49 = fsub double %47, %48
  ret double %49
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x %struct.Income], align 16
  %3 = alloca [10 x %struct.Expense], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %40, %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.17, ptr noundef %6)
  %17 = load i32, ptr %6, align 4
  switch i32 %17, label %37 [
    i32 1, label %18
    i32 2, label %20
    i32 3, label %22
    i32 4, label %25
    i32 5, label %28
    i32 6, label %35
  ]

18:                                               ; preds = %7
  %19 = getelementptr inbounds [10 x %struct.Income], ptr %2, i64 0, i64 0
  call void @addIncome(ptr noundef %19, ptr noundef %4)
  br label %39

20:                                               ; preds = %7
  %21 = getelementptr inbounds [10 x %struct.Expense], ptr %3, i64 0, i64 0
  call void @addExpense(ptr noundef %21, ptr noundef %5)
  br label %39

22:                                               ; preds = %7
  %23 = getelementptr inbounds [10 x %struct.Income], ptr %2, i64 0, i64 0
  %24 = load i32, ptr %4, align 4
  call void @printIncome(ptr noundef %23, i32 noundef %24)
  br label %39

25:                                               ; preds = %7
  %26 = getelementptr inbounds [10 x %struct.Expense], ptr %3, i64 0, i64 0
  %27 = load i32, ptr %5, align 4
  call void @printExpense(ptr noundef %26, i32 noundef %27)
  br label %39

28:                                               ; preds = %7
  %29 = getelementptr inbounds [10 x %struct.Income], ptr %2, i64 0, i64 0
  %30 = load i32, ptr %4, align 4
  %31 = getelementptr inbounds [10 x %struct.Expense], ptr %3, i64 0, i64 0
  %32 = load i32, ptr %5, align 4
  %33 = call double @calculateNetIncome(ptr noundef %29, i32 noundef %30, ptr noundef %31, i32 noundef %32)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, double noundef %33)
  br label %39

35:                                               ; preds = %7
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %39

37:                                               ; preds = %7
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %39

39:                                               ; preds = %37, %35, %28, %25, %22, %20, %18
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %6, align 4
  %42 = icmp ne i32 %41, 6
  br i1 %42, label %7, label %43, !llvm.loop !11

43:                                               ; preds = %40
  ret i32 0
}

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
!11 = distinct !{!11, !7}
