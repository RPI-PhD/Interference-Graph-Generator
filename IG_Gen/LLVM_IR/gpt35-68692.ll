; ModuleID = 'DATASETv2/gpt35-68692.c'
source_filename = "DATASETv2/gpt35-68692.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.expense = type { [20 x i8], float }

@num_expenses = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [17 x i8] c"Enter category: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"Enter cost: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@expenses = dso_local global [100 x %struct.expense] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [17 x i8] c"Expense added!\0A\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Category\09Cost\0A\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"%s\09\09$%.2f\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"Error: Could not open file!\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"%s,%.2f\0A\00", align 1
@.str.11 = private unnamed_addr constant [23 x i8] c"Expenses saved to %s\0A\0A\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"%[^,],%f\0A\00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"Expenses loaded from %s\0A\0A\00", align 1
@.str.15 = private unnamed_addr constant [33 x i8] c"Welcome to the expense tracker!\0A\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"Menu:\0A\00", align 1
@.str.17 = private unnamed_addr constant [17 x i8] c"(1) Add expense\0A\00", align 1
@.str.18 = private unnamed_addr constant [20 x i8] c"(2) Print expenses\0A\00", align 1
@.str.19 = private unnamed_addr constant [19 x i8] c"(3) Save expenses\0A\00", align 1
@.str.20 = private unnamed_addr constant [19 x i8] c"(4) Load expenses\0A\00", align 1
@.str.21 = private unnamed_addr constant [10 x i8] c"(5) Exit\0A\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"Enter choice: \00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.24 = private unnamed_addr constant [13 x i8] c"expenses.csv\00", align 1
@.str.25 = private unnamed_addr constant [10 x i8] c"Goodbye!\0A\00", align 1
@.str.26 = private unnamed_addr constant [18 x i8] c"Invalid choice!\0A\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_expense() #0 {
  %1 = alloca %struct.expense, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds %struct.expense, ptr %1, i32 0, i32 0
  %4 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %7 = getelementptr inbounds %struct.expense, ptr %1, i32 0, i32 1
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %7)
  %9 = load i32, ptr @num_expenses, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %10
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %11, ptr align 4 %1, i64 24, i1 false)
  %12 = load i32, ptr @num_expenses, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr @num_expenses, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_expenses() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %20, %0
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr @num_expenses, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %23

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.expense, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [20 x i8], ptr %11, i64 0, i64 0
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.expense, ptr %15, i32 0, i32 1
  %17 = load float, ptr %16, align 4
  %18 = fpext float %17 to double
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %12, double noundef %18)
  br label %20

20:                                               ; preds = %7
  %21 = load i32, ptr %1, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %1, align 4
  br label %3, !llvm.loop !6

23:                                               ; preds = %3
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @save_expenses(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call noalias ptr @fopen(ptr noundef %5, ptr noundef @.str.8)
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %38

11:                                               ; preds = %1
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr @num_expenses, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %33

16:                                               ; preds = %12
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.expense, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds [20 x i8], ptr %21, i64 0, i64 0
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.expense, ptr %25, i32 0, i32 1
  %27 = load float, ptr %26, align 4
  %28 = fpext float %27 to double
  %29 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %17, ptr noundef @.str.10, ptr noundef %22, double noundef %28)
  br label %30

30:                                               ; preds = %16
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %12, !llvm.loop !8

33:                                               ; preds = %12
  %34 = load ptr, ptr %3, align 8
  %35 = call i32 @fclose(ptr noundef %34)
  %36 = load ptr, ptr %2, align 8
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %36)
  br label %38

38:                                               ; preds = %33, %9
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @load_expenses(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [20 x i8], align 16
  %5 = alloca float, align 4
  %6 = alloca %struct.expense, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call noalias ptr @fopen(ptr noundef %7, ptr noundef @.str.12)
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %13

11:                                               ; preds = %1
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %36

13:                                               ; preds = %1
  br label %14

14:                                               ; preds = %19, %13
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %17 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %15, ptr noundef @.str.13, ptr noundef %16, ptr noundef %5)
  %18 = icmp ne i32 %17, -1
  br i1 %18, label %19, label %31

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.expense, ptr %6, i32 0, i32 0
  %21 = getelementptr inbounds [20 x i8], ptr %20, i64 0, i64 0
  %22 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %23 = call ptr @strcpy(ptr noundef %21, ptr noundef %22) #5
  %24 = load float, ptr %5, align 4
  %25 = getelementptr inbounds %struct.expense, ptr %6, i32 0, i32 1
  store float %24, ptr %25, align 4
  %26 = load i32, ptr @num_expenses, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %27
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %28, ptr align 4 %6, i64 24, i1 false)
  %29 = load i32, ptr @num_expenses, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr @num_expenses, align 4
  br label %14, !llvm.loop !9

31:                                               ; preds = %14
  %32 = load ptr, ptr %3, align 8
  %33 = call i32 @fclose(ptr noundef %32)
  %34 = load ptr, ptr %2, align 8
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %34)
  br label %36

36:                                               ; preds = %31, %11
  ret void
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %4

4:                                                ; preds = %0, %22
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.23, ptr noundef %2)
  %13 = load i32, ptr %2, align 4
  switch i32 %13, label %20 [
    i32 1, label %14
    i32 2, label %15
    i32 3, label %16
    i32 4, label %17
    i32 5, label %18
  ]

14:                                               ; preds = %4
  call void @add_expense()
  br label %22

15:                                               ; preds = %4
  call void @print_expenses()
  br label %22

16:                                               ; preds = %4
  call void @save_expenses(ptr noundef @.str.24)
  br label %22

17:                                               ; preds = %4
  call void @load_expenses(ptr noundef @.str.24)
  br label %22

18:                                               ; preds = %4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  call void @exit(i32 noundef 0) #6
  unreachable

20:                                               ; preds = %4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %22

22:                                               ; preds = %20, %17, %16, %15, %14
  br label %4
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

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
