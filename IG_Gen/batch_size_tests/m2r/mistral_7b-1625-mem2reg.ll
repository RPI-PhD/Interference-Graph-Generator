; ModuleID = 'LLVM_IR/mistral_7b-1625.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.Activity], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %18, %0
  call void @print_menu()
  store i32 0, ptr %3, align 4
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %3)
  %6 = load i32, ptr %3, align 4
  switch i32 %6, label %16 [
    i32 1, label %7
    i32 2, label %9
    i32 3, label %14
  ]

7:                                                ; preds = %4
  %8 = getelementptr inbounds [5 x %struct.Activity], ptr %1, i64 0, i64 0
  call void @add_activity(ptr noundef %8, ptr noundef %2)
  br label %18

9:                                                ; preds = %4
  %10 = getelementptr inbounds [5 x %struct.Activity], ptr %1, i64 0, i64 0
  %11 = load i32, ptr %2, align 4
  %12 = call i32 @get_calorie_balance(ptr noundef %10, i32 noundef %11)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %12)
  br label %18

14:                                               ; preds = %4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 0) #3
  unreachable

16:                                               ; preds = %4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %18

18:                                               ; preds = %16, %9, %7
  br label %4
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_activity(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load i32, ptr %1, align 4
  %4 = icmp sge i32 %3, 5
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %29

7:                                                ; preds = %2
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.Activity, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.Activity, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [20 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.Activity, ptr %0, i64 %17
  %19 = getelementptr inbounds %struct.Activity, ptr %18, i32 0, i32 1
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %19)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %22 = load i32, ptr %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.Activity, ptr %0, i64 %23
  %25 = getelementptr inbounds %struct.Activity, ptr %24, i32 0, i32 2
  %26 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %25)
  %27 = load i32, ptr %1, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %1, align 4
  br label %29

29:                                               ; preds = %7, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_calorie_balance(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.02 = phi i32 [ 0, %2 ], [ %10, %16 ]
  %.01 = phi i32 [ 0, %2 ], [ %15, %16 ]
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %18

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.Activity, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.Activity, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %.02, %9
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.Activity, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.Activity, ptr %12, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %.01, %14
  br label %16

16:                                               ; preds = %5
  %17 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

18:                                               ; preds = %3
  %19 = sub nsw i32 %.01, %.02
  ret i32 %19
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_menu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
