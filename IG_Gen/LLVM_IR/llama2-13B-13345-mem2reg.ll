; ModuleID = 'LLVM_IR/llama2-13B-13345.ll'
source_filename = "DATASETv2/llama2-13B-13345.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.game_state = type { i32, i32, [10 x i8] }

@.str = private unnamed_addr constant [12 x i8] c"Game Over!\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Level %d (%d guesses)\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Password: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"Welcome to the Cryptographic Puzzle Game!\0A\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"Choose a level or type 'q' to quit:\0A\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Enter a number (1-3) or 'q' to quit: \00", align 1
@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_password(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %11, %1
  %.0 = phi i32 [ 0, %1 ], [ %12, %11 ]
  %3 = icmp slt i32 %.0, 10
  br i1 %3, label %4, label %13

4:                                                ; preds = %2
  %5 = call i32 @rand() #3
  %6 = srem i32 %5, 26
  %7 = add nsw i32 97, %6
  %8 = trunc i32 %7 to i8
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds i8, ptr %0, i64 %9
  store i8 %8, ptr %10, align 1
  br label %11

11:                                               ; preds = %4
  %12 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

13:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_guess(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %17, %2
  %.01 = phi i32 [ 0, %2 ], [ %18, %17 ]
  %4 = icmp slt i32 %.01, 10
  br i1 %4, label %5, label %19

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds i8, ptr %1, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %9, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %5
  br label %20

16:                                               ; preds = %5
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

19:                                               ; preds = %3
  br label %20

20:                                               ; preds = %19, %15
  %.0 = phi i32 [ 0, %15 ], [ 1, %19 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @game_over(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %4, i32 noundef %6)
  %8 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [10 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %9)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @game_menu(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %3 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %4, i32 noundef %6)
  %8 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [10 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @handle_input(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %59, %2
  %.0 = phi i32 [ 0, %2 ], [ %60, %59 ]
  %4 = icmp slt i32 %.0, 10
  br i1 %4, label %5, label %61

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i8, ptr %1, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp eq i32 %9, 49
  br i1 %10, label %11, label %21

11:                                               ; preds = %5
  %12 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, ptr %12, align 4
  %15 = srem i32 %.0, 26
  %16 = add nsw i32 97, %15
  %17 = trunc i32 %16 to i8
  %18 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 2
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [10 x i8], ptr %18, i64 0, i64 %19
  store i8 %17, ptr %20, align 1
  br label %58

21:                                               ; preds = %5
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds i8, ptr %1, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 50
  br i1 %26, label %27, label %38

27:                                               ; preds = %21
  %28 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = add nsw i32 %29, -1
  store i32 %30, ptr %28, align 4
  %31 = srem i32 %.0, 26
  %32 = add nsw i32 %31, 26
  %33 = add nsw i32 97, %32
  %34 = trunc i32 %33 to i8
  %35 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 2
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds [10 x i8], ptr %35, i64 0, i64 %36
  store i8 %34, ptr %37, align 1
  br label %57

38:                                               ; preds = %21
  %39 = sext i32 %.0 to i64
  %40 = getelementptr inbounds i8, ptr %1, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %42, 51
  br i1 %43, label %44, label %55

44:                                               ; preds = %38
  %45 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 1
  %46 = load i32, ptr %45, align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, ptr %45, align 4
  %48 = srem i32 %.0, 26
  %49 = add nsw i32 %48, 52
  %50 = add nsw i32 97, %49
  %51 = trunc i32 %50 to i8
  %52 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 2
  %53 = sext i32 %.0 to i64
  %54 = getelementptr inbounds [10 x i8], ptr %52, i64 0, i64 %53
  store i8 %51, ptr %54, align 1
  br label %56

55:                                               ; preds = %38
  br label %61

56:                                               ; preds = %44
  br label %57

57:                                               ; preds = %56, %27
  br label %58

58:                                               ; preds = %57, %11
  br label %59

59:                                               ; preds = %58
  %60 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

61:                                               ; preds = %55, %3
  %62 = getelementptr inbounds %struct.game_state, ptr %0, i32 0, i32 1
  %63 = load i32, ptr %62, align 4
  %64 = icmp sle i32 %63, 0
  br i1 %64, label %65, label %66

65:                                               ; preds = %61
  call void @game_over(ptr noundef %0)
  br label %66

66:                                               ; preds = %65, %61
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.game_state, align 4
  %2 = alloca [10 x i8], align 1
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  %5 = getelementptr inbounds %struct.game_state, ptr %1, i32 0, i32 0
  store i32 1, ptr %5, align 4
  %6 = getelementptr inbounds %struct.game_state, ptr %1, i32 0, i32 1
  store i32 5, ptr %6, align 4
  %7 = getelementptr inbounds %struct.game_state, ptr %1, i32 0, i32 2
  %8 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  call void @generate_password(ptr noundef %8)
  call void @game_menu(ptr noundef %1)
  br label %9

9:                                                ; preds = %9, %0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %11 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %12 = load ptr, ptr @stdin, align 8
  %13 = call ptr @fgets(ptr noundef %11, i32 noundef 10, ptr noundef %12)
  %14 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  call void @handle_input(ptr noundef %1, ptr noundef %14)
  br label %9
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
