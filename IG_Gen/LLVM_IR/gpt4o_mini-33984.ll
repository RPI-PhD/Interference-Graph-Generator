; ModuleID = 'DATASETv2/gpt4o_mini-33984.c'
source_filename = "DATASETv2/gpt4o_mini-33984.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [53 x i8] c"***************************************************\0A\00", align 1
@.str.1 = private unnamed_addr constant [46 x i8] c"Welcome to the Post-Apocalyptic Dice Roller!\0A\00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"In the wasteland, you\E2\80\99ll need luck to survive.\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"Enter the number of dice to roll (1-%d): \00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"Do you wish to roll again? (y/n): \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.6 = private unnamed_addr constant [41 x i8] c"Survive the wasteland. Until next time!\0A\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"You rolled: \00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [56 x i8] c"Invalid input. Please enter a number between 1 and %d: \00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"Instructions:\0A\00", align 1
@.str.13 = private unnamed_addr constant [47 x i8] c"1. Enter the number of dice you want to roll.\0A\00", align 1
@.str.14 = private unnamed_addr constant [72 x i8] c"2. Each die will yield a number between 1 and 6, reflecting your fate.\0A\00", align 1
@.str.15 = private unnamed_addr constant [89 x i8] c"3. Roll as many times as you wish, but be wary of the unknown dangers of the wasteland.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  %5 = call i64 @time(ptr noundef null) #3
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #3
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @displayInstructions()
  br label %11

11:                                               ; preds = %28, %0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef 5)
  %13 = call i32 @getValidInput()
  store i32 %13, ptr %3, align 4
  %14 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0
  %15 = load i32, ptr %3, align 4
  call void @rollDice(ptr noundef %14, i32 noundef %15)
  %16 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0
  %17 = load i32, ptr %3, align 4
  call void @printRoll(ptr noundef %16, i32 noundef %17)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %19 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %4)
  br label %20

20:                                               ; preds = %11
  %21 = load i8, ptr %4, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 121
  br i1 %23, label %28, label %24

24:                                               ; preds = %20
  %25 = load i8, ptr %4, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 89
  br label %28

28:                                               ; preds = %24, %20
  %29 = phi i1 [ true, %20 ], [ %27, %24 ]
  br i1 %29, label %11, label %30, !llvm.loop !6

30:                                               ; preds = %28
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @rollDice(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %18, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %21

10:                                               ; preds = %6
  %11 = call i32 @rand() #3
  %12 = srem i32 %11, 6
  %13 = add nsw i32 %12, 1
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  store i32 %13, ptr %17, align 4
  br label %18

18:                                               ; preds = %10
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %6, !llvm.loop !8

21:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printRoll(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %18, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %16)
  br label %18

18:                                               ; preds = %11
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %7, !llvm.loop !9

21:                                               ; preds = %7
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @getValidInput() #0 {
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %0, %13
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %1)
  %4 = load i32, ptr %1, align 4
  %5 = icmp sge i32 %4, 1
  br i1 %5, label %6, label %11

6:                                                ; preds = %2
  %7 = load i32, ptr %1, align 4
  %8 = icmp sle i32 %7, 5
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = load i32, ptr %1, align 4
  ret i32 %10

11:                                               ; preds = %6, %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef 5)
  br label %13

13:                                               ; preds = %11
  br label %2
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayInstructions() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  ret void
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
