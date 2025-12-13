; ModuleID = 'LLVM_IR/gpt35-68692.ll'
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

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_expenses() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %2

2:                                                ; preds = %16, %0
  %.0 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %3 = load i32, ptr @num_expenses, align 4
  %4 = icmp slt i32 %.0, %3
  br i1 %4, label %5, label %18

5:                                                ; preds = %2
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.expense, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [20 x i8], ptr %8, i64 0, i64 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.expense, ptr %11, i32 0, i32 1
  %13 = load float, ptr %12, align 4
  %14 = fpext float %13 to double
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %9, double noundef %14)
  br label %16

16:                                               ; preds = %5
  %17 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @save_expenses(ptr noundef %0) #0 {
  %2 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.8)
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %26

6:                                                ; preds = %1
  br label %7

7:                                                ; preds = %21, %6
  %.0 = phi i32 [ 0, %6 ], [ %22, %21 ]
  %8 = load i32, ptr @num_expenses, align 4
  %9 = icmp slt i32 %.0, %8
  br i1 %9, label %10, label %23

10:                                               ; preds = %7
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.expense, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [20 x i8], ptr %13, i64 0, i64 0
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.expense, ptr %16, i32 0, i32 1
  %18 = load float, ptr %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.10, ptr noundef %14, double noundef %19)
  br label %21

21:                                               ; preds = %10
  %22 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !8

23:                                               ; preds = %7
  %24 = call i32 @fclose(ptr noundef %2)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %0)
  br label %26

26:                                               ; preds = %23, %4
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @load_expenses(ptr noundef %0) #0 {
  %2 = alloca [20 x i8], align 16
  %3 = alloca float, align 4
  %4 = alloca %struct.expense, align 4
  %5 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.12)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %29

9:                                                ; preds = %1
  br label %10

10:                                               ; preds = %14, %9
  %11 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %12 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %5, ptr noundef @.str.13, ptr noundef %11, ptr noundef %3)
  %13 = icmp ne i32 %12, -1
  br i1 %13, label %14, label %26

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.expense, ptr %4, i32 0, i32 0
  %16 = getelementptr inbounds [20 x i8], ptr %15, i64 0, i64 0
  %17 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %18 = call ptr @strcpy(ptr noundef %16, ptr noundef %17) #5
  %19 = load float, ptr %3, align 4
  %20 = getelementptr inbounds %struct.expense, ptr %4, i32 0, i32 1
  store float %19, ptr %20, align 4
  %21 = load i32, ptr @num_expenses, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.expense], ptr @expenses, i64 0, i64 %22
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 4 %4, i64 24, i1 false)
  %24 = load i32, ptr @num_expenses, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr @num_expenses, align 4
  br label %10, !llvm.loop !9

26:                                               ; preds = %10
  %27 = call i32 @fclose(ptr noundef %5)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %0)
  br label %29

29:                                               ; preds = %26, %7
  ret void
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %3

3:                                                ; preds = %21, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.23, ptr noundef %1)
  %12 = load i32, ptr %1, align 4
  switch i32 %12, label %19 [
    i32 1, label %13
    i32 2, label %14
    i32 3, label %15
    i32 4, label %16
    i32 5, label %17
  ]

13:                                               ; preds = %3
  call void @add_expense()
  br label %21

14:                                               ; preds = %3
  call void @print_expenses()
  br label %21

15:                                               ; preds = %3
  call void @save_expenses(ptr noundef @.str.24)
  br label %21

16:                                               ; preds = %3
  call void @load_expenses(ptr noundef @.str.24)
  br label %21

17:                                               ; preds = %3
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  call void @exit(i32 noundef 0) #6
  unreachable

19:                                               ; preds = %3
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %21

21:                                               ; preds = %19, %16, %15, %14, %13
  br label %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
