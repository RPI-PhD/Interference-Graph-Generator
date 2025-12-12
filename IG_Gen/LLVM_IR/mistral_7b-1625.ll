; ModuleID = 'DATASETv2/mistral_7b-1625.c'
source_filename = "DATASETv2/mistral_7b-1625.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Activity = type { [20 x i8], i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Total Calorie Balance: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Exiting the program...\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Invalid choice. Please try again.\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"\0AFitness Tracker Menu:\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"1. Add an activity\0A\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"2. View total calorie balance\0A\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"3. Exit\0A\00", align 1
@.str.8 = private unnamed_addr constant [84 x i8] c"Maximum number of activities reached. Please add or remove activities to continue.\0A\00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"Enter the name of the activity: \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.11 = private unnamed_addr constant [48 x i8] c"Enter the calories consumed for this activity: \00", align 1
@.str.12 = private unnamed_addr constant [49 x i8] c"Enter the calories burned during this activity: \00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x %struct.Activity], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %0, %19
  call void @print_menu()
  store i32 0, ptr %4, align 4
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %4)
  %7 = load i32, ptr %4, align 4
  switch i32 %7, label %17 [
    i32 1, label %8
    i32 2, label %10
    i32 3, label %15
  ]

8:                                                ; preds = %5
  %9 = getelementptr inbounds [5 x %struct.Activity], ptr %2, i64 0, i64 0
  call void @add_activity(ptr noundef %9, ptr noundef %3)
  br label %19

10:                                               ; preds = %5
  %11 = getelementptr inbounds [5 x %struct.Activity], ptr %2, i64 0, i64 0
  %12 = load i32, ptr %3, align 4
  %13 = call i32 @get_calorie_balance(ptr noundef %11, i32 noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %13)
  br label %19

15:                                               ; preds = %5
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 0) #3
  unreachable

17:                                               ; preds = %5
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %19

19:                                               ; preds = %17, %10, %8
  br label %5
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_activity(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %5, align 4
  %7 = icmp sge i32 %6, 5
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %39

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.Activity, ptr %12, i64 %15
  %17 = getelementptr inbounds %struct.Activity, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [20 x i8], ptr %17, i64 0, i64 0
  %19 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %18)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = load i32, ptr %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.Activity, ptr %21, i64 %24
  %26 = getelementptr inbounds %struct.Activity, ptr %25, i32 0, i32 1
  %27 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %26)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %29 = load ptr, ptr %3, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.Activity, ptr %29, i64 %32
  %34 = getelementptr inbounds %struct.Activity, ptr %33, i32 0, i32 2
  %35 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %34)
  %36 = load ptr, ptr %4, align 8
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %36, align 4
  br label %39

39:                                               ; preds = %10, %8
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @get_calorie_balance(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %29, %2
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %32

12:                                               ; preds = %8
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.Activity, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.Activity, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, ptr %5, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = load i32, ptr %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.Activity, ptr %21, i64 %23
  %25 = getelementptr inbounds %struct.Activity, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %6, align 4
  br label %29

29:                                               ; preds = %12
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %7, align 4
  br label %8, !llvm.loop !6

32:                                               ; preds = %8
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sub nsw i32 %33, %34
  ret i32 %35
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_menu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

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
