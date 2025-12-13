; ModuleID = 'LLVM_IR/gpt35-464.ll'
source_filename = "DATASETv2/gpt35-464.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.expense = type { [20 x i8], [50 x i8], float }

@.str = private unnamed_addr constant [23 x i8] c"***Expense Tracker***\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"\0AMenu\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"1. Add Expense\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"2. View Expenses\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"3. Delete Expense\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"4. Exit\0A\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"Enter your choice (1-4): \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"Exiting the program.\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"Invalid choice.\0A\00", align 1
@stdin = external global ptr, align 8
@.str.10 = private unnamed_addr constant [31 x i8] c"\0AEnter the date (dd/mm/yyyy): \00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"Enter the item name: \00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"%[^\0A]\00", align 1
@.str.14 = private unnamed_addr constant [18 x i8] c"Enter the price: \00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c"Expense added successfully!\0A\00", align 1
@.str.17 = private unnamed_addr constant [35 x i8] c"There are no expenses to display.\0A\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"\0AExpenses\0A\00", align 1
@.str.19 = private unnamed_addr constant [19 x i8] c"Date\09\09Item\09\09Price\0A\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"%s\09%s\09%.2f\0A\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"There are no expenses to delete.\0A\00", align 1
@.str.22 = private unnamed_addr constant [56 x i8] c"\0AEnter the date of the expense to delete (dd/mm/yyyy): \00", align 1
@.str.23 = private unnamed_addr constant [31 x i8] c"Expense deleted successfully!\0A\00", align 1
@.str.24 = private unnamed_addr constant [20 x i8] c"Expense not found.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x %struct.expense], align 16
  store i32 0, ptr %1, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %5

5:                                                ; preds = %26, %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %2)
  %13 = load i32, ptr %2, align 4
  switch i32 %13, label %23 [
    i32 1, label %14
    i32 2, label %16
    i32 3, label %19
    i32 4, label %21
  ]

14:                                               ; preds = %5
  %15 = getelementptr inbounds [100 x %struct.expense], ptr %3, i64 0, i64 0
  call void @addExpense(ptr noundef %15, ptr noundef %1)
  br label %25

16:                                               ; preds = %5
  %17 = getelementptr inbounds [100 x %struct.expense], ptr %3, i64 0, i64 0
  %18 = load i32, ptr %1, align 4
  call void @viewExpenses(ptr noundef %17, i32 noundef %18)
  br label %25

19:                                               ; preds = %5
  %20 = getelementptr inbounds [100 x %struct.expense], ptr %3, i64 0, i64 0
  call void @deleteExpense(ptr noundef %20, ptr noundef %1)
  br label %25

21:                                               ; preds = %5
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %25

23:                                               ; preds = %5
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %25

25:                                               ; preds = %23, %21, %19, %16, %14
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %2, align 4
  %28 = icmp ne i32 %27, 4
  br i1 %28, label %5, label %29, !llvm.loop !6

29:                                               ; preds = %26
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addExpense(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [20 x i8], align 16
  %4 = alloca [50 x i8], align 16
  %5 = alloca float, align 4
  %6 = alloca %struct.expense, align 4
  %7 = load ptr, ptr @stdin, align 8
  %8 = call i32 @fflush(ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %10 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %10)
  %12 = load ptr, ptr @stdin, align 8
  %13 = call i32 @fflush(ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %15 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %15)
  %17 = load ptr, ptr @stdin, align 8
  %18 = call i32 @fflush(ptr noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %5)
  %21 = getelementptr inbounds %struct.expense, ptr %6, i32 0, i32 0
  %22 = getelementptr inbounds [20 x i8], ptr %21, i64 0, i64 0
  %23 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %24 = call ptr @strcpy(ptr noundef %22, ptr noundef %23) #5
  %25 = getelementptr inbounds %struct.expense, ptr %6, i32 0, i32 1
  %26 = getelementptr inbounds [50 x i8], ptr %25, i64 0, i64 0
  %27 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %28 = call ptr @strcpy(ptr noundef %26, ptr noundef %27) #5
  %29 = load float, ptr %5, align 4
  %30 = getelementptr inbounds %struct.expense, ptr %6, i32 0, i32 2
  store float %29, ptr %30, align 4
  %31 = load i32, ptr %1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.expense, ptr %0, i64 %32
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %33, ptr align 4 %6, i64 76, i1 false)
  %34 = load i32, ptr %1, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %1, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @viewExpenses(ptr noundef %0, i32 noundef %1) #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %28

6:                                                ; preds = %2
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %9

9:                                                ; preds = %26, %6
  %.0 = phi i32 [ 0, %6 ], [ %27, %26 ]
  %10 = icmp slt i32 %.0, %1
  br i1 %10, label %11, label %28

11:                                               ; preds = %9
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds %struct.expense, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.expense, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [20 x i8], ptr %14, i64 0, i64 0
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds %struct.expense, ptr %0, i64 %16
  %18 = getelementptr inbounds %struct.expense, ptr %17, i32 0, i32 1
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds %struct.expense, ptr %0, i64 %20
  %22 = getelementptr inbounds %struct.expense, ptr %21, i32 0, i32 2
  %23 = load float, ptr %22, align 4
  %24 = fpext float %23 to double
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, ptr noundef %15, ptr noundef %19, double noundef %24)
  br label %26

26:                                               ; preds = %11
  %27 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !8

28:                                               ; preds = %9, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @deleteExpense(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [20 x i8], align 16
  %4 = load i32, ptr %1, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %48

8:                                                ; preds = %2
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %10 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %10)
  br label %12

12:                                               ; preds = %25, %8
  %.01 = phi i32 [ 0, %8 ], [ %26, %25 ]
  %13 = load i32, ptr %1, align 4
  %14 = icmp slt i32 %.01, %13
  br i1 %14, label %15, label %27

15:                                               ; preds = %12
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds %struct.expense, ptr %0, i64 %16
  %18 = getelementptr inbounds %struct.expense, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [20 x i8], ptr %18, i64 0, i64 0
  %20 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %15
  br label %27

24:                                               ; preds = %15
  br label %25

25:                                               ; preds = %24
  %26 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !9

27:                                               ; preds = %23, %12
  %.03 = phi i32 [ 1, %23 ], [ 0, %12 ]
  %28 = icmp ne i32 %.03, 0
  br i1 %28, label %29, label %46

29:                                               ; preds = %27
  br label %30

30:                                               ; preds = %40, %29
  %.0 = phi i32 [ %.01, %29 ], [ %41, %40 ]
  %31 = load i32, ptr %1, align 4
  %32 = sub nsw i32 %31, 1
  %33 = icmp slt i32 %.0, %32
  br i1 %33, label %34, label %42

34:                                               ; preds = %30
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds %struct.expense, ptr %0, i64 %35
  %37 = add nsw i32 %.0, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.expense, ptr %0, i64 %38
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %36, ptr align 4 %39, i64 76, i1 false)
  br label %40

40:                                               ; preds = %34
  %41 = add nsw i32 %.0, 1
  br label %30, !llvm.loop !10

42:                                               ; preds = %30
  %43 = load i32, ptr %1, align 4
  %44 = add nsw i32 %43, -1
  store i32 %44, ptr %1, align 4
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %48

46:                                               ; preds = %27
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %48

48:                                               ; preds = %46, %42, %6
  ret void
}

declare i32 @fflush(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
