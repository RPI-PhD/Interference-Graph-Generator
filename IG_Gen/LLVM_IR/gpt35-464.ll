; ModuleID = 'DATASETv2/gpt35-464.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [100 x %struct.expense], align 16
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %6

6:                                                ; preds = %27, %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %3)
  %14 = load i32, ptr %3, align 4
  switch i32 %14, label %24 [
    i32 1, label %15
    i32 2, label %17
    i32 3, label %20
    i32 4, label %22
  ]

15:                                               ; preds = %6
  %16 = getelementptr inbounds [100 x %struct.expense], ptr %4, i64 0, i64 0
  call void @addExpense(ptr noundef %16, ptr noundef %2)
  br label %26

17:                                               ; preds = %6
  %18 = getelementptr inbounds [100 x %struct.expense], ptr %4, i64 0, i64 0
  %19 = load i32, ptr %2, align 4
  call void @viewExpenses(ptr noundef %18, i32 noundef %19)
  br label %26

20:                                               ; preds = %6
  %21 = getelementptr inbounds [100 x %struct.expense], ptr %4, i64 0, i64 0
  call void @deleteExpense(ptr noundef %21, ptr noundef %2)
  br label %26

22:                                               ; preds = %6
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %26

24:                                               ; preds = %6
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %26

26:                                               ; preds = %24, %22, %20, %17, %15
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %3, align 4
  %29 = icmp ne i32 %28, 4
  br i1 %29, label %6, label %30, !llvm.loop !6

30:                                               ; preds = %27
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addExpense(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [20 x i8], align 16
  %6 = alloca [50 x i8], align 16
  %7 = alloca float, align 4
  %8 = alloca %struct.expense, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr @stdin, align 8
  %10 = call i32 @fflush(ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %12 = getelementptr inbounds [20 x i8], ptr %5, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %12)
  %14 = load ptr, ptr @stdin, align 8
  %15 = call i32 @fflush(ptr noundef %14)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %17 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %18 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %17)
  %19 = load ptr, ptr @stdin, align 8
  %20 = call i32 @fflush(ptr noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %22 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %7)
  %23 = getelementptr inbounds %struct.expense, ptr %8, i32 0, i32 0
  %24 = getelementptr inbounds [20 x i8], ptr %23, i64 0, i64 0
  %25 = getelementptr inbounds [20 x i8], ptr %5, i64 0, i64 0
  %26 = call ptr @strcpy(ptr noundef %24, ptr noundef %25) #5
  %27 = getelementptr inbounds %struct.expense, ptr %8, i32 0, i32 1
  %28 = getelementptr inbounds [50 x i8], ptr %27, i64 0, i64 0
  %29 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %30 = call ptr @strcpy(ptr noundef %28, ptr noundef %29) #5
  %31 = load float, ptr %7, align 4
  %32 = getelementptr inbounds %struct.expense, ptr %8, i32 0, i32 2
  store float %31, ptr %32, align 4
  %33 = load ptr, ptr %3, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = load i32, ptr %34, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.expense, ptr %33, i64 %36
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %37, ptr align 4 %8, i64 76, i1 false)
  %38 = load ptr, ptr %4, align 8
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %38, align 4
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @viewExpenses(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %41

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %38, %10
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %41

17:                                               ; preds = %13
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.expense, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.expense, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [20 x i8], ptr %22, i64 0, i64 0
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.expense, ptr %24, i64 %26
  %28 = getelementptr inbounds %struct.expense, ptr %27, i32 0, i32 1
  %29 = getelementptr inbounds [50 x i8], ptr %28, i64 0, i64 0
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.expense, ptr %30, i64 %32
  %34 = getelementptr inbounds %struct.expense, ptr %33, i32 0, i32 2
  %35 = load float, ptr %34, align 4
  %36 = fpext float %35 to double
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, ptr noundef %23, ptr noundef %29, double noundef %36)
  br label %38

38:                                               ; preds = %17
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  br label %13, !llvm.loop !8

41:                                               ; preds = %8, %13
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @deleteExpense(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [20 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %10, align 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %71

15:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %17 = getelementptr inbounds [20 x i8], ptr %7, i64 0, i64 0
  %18 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %17)
  store i32 0, ptr %8, align 4
  br label %19

19:                                               ; preds = %37, %15
  %20 = load i32, ptr %8, align 4
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %21, align 4
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %40

24:                                               ; preds = %19
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %8, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.expense, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.expense, ptr %28, i32 0, i32 0
  %30 = getelementptr inbounds [20 x i8], ptr %29, i64 0, i64 0
  %31 = getelementptr inbounds [20 x i8], ptr %7, i64 0, i64 0
  %32 = call i32 @strcmp(ptr noundef %30, ptr noundef %31) #6
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %24
  %35 = load i32, ptr %8, align 4
  store i32 %35, ptr %5, align 4
  store i32 1, ptr %6, align 4
  br label %40

36:                                               ; preds = %24
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %8, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %8, align 4
  br label %19, !llvm.loop !9

40:                                               ; preds = %34, %19
  %41 = load i32, ptr %6, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %69

43:                                               ; preds = %40
  %44 = load i32, ptr %5, align 4
  store i32 %44, ptr %9, align 4
  br label %45

45:                                               ; preds = %61, %43
  %46 = load i32, ptr %9, align 4
  %47 = load ptr, ptr %4, align 8
  %48 = load i32, ptr %47, align 4
  %49 = sub nsw i32 %48, 1
  %50 = icmp slt i32 %46, %49
  br i1 %50, label %51, label %64

51:                                               ; preds = %45
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %9, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.expense, ptr %52, i64 %54
  %56 = load ptr, ptr %3, align 8
  %57 = load i32, ptr %9, align 4
  %58 = add nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.expense, ptr %56, i64 %59
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %55, ptr align 4 %60, i64 76, i1 false)
  br label %61

61:                                               ; preds = %51
  %62 = load i32, ptr %9, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %9, align 4
  br label %45, !llvm.loop !10

64:                                               ; preds = %45
  %65 = load ptr, ptr %4, align 8
  %66 = load i32, ptr %65, align 4
  %67 = add nsw i32 %66, -1
  store i32 %67, ptr %65, align 4
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %71

69:                                               ; preds = %40
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %71

71:                                               ; preds = %13, %69, %64
  ret void
}

declare i32 @fflush(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
