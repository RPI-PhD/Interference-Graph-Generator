; ModuleID = 'LLVM_IR/gpt35-57735.ll'
source_filename = "DATASETv2/gpt35-57735.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@gameover = dso_local global i32 0, align 4
@score = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [30 x i8] c"\09========Memory Game========\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"\09Score = %d\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"\09| 1 | 2 | 3 | 4 |\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"\09----------------\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@guessboard = dso_local global [4 x [4 x i32]] zeroinitializer, align 16
@.str.5 = private unnamed_addr constant [6 x i8] c"| %c \00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"| %d \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"|\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@board = dso_local global [4 x [4 x i32]] zeroinitializer, align 16
@.str.9 = private unnamed_addr constant [30 x i8] c"Enter first guess (row col): \00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str.11 = private unnamed_addr constant [31 x i8] c"Enter second guess (row col): \00", align 1
@.str.12 = private unnamed_addr constant [31 x i8] c"\0AGood Job! You found a match!\0A\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"\0AOops! Try again!\0A\00", align 1
@.str.14 = private unnamed_addr constant [25 x i8] c"\09Welcome to Memory Game\0A\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"\09Instructions:\0A\0A\00", align 1
@.str.16 = private unnamed_addr constant [64 x i8] c"\091. Enter the row and column of the guess separated by a space\0A\00", align 1
@.str.17 = private unnamed_addr constant [46 x i8] c"\092. You get one point for each correct guess\0A\00", align 1
@.str.18 = private unnamed_addr constant [76 x i8] c"\093. You have to keep guessing till you match all the numbers on the board\0A\0A\00", align 1
@.str.19 = private unnamed_addr constant [31 x i8] c"\09Press enter to start the game\00", align 1
@.str.20 = private unnamed_addr constant [11 x i8] c"\09You Won!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = load i32, ptr @score, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %2)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %6

6:                                                ; preds = %34, %0
  %.0 = phi i32 [ 0, %0 ], [ %35, %34 ]
  %7 = icmp slt i32 %.0, 4
  br i1 %7, label %8, label %36

8:                                                ; preds = %6
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %10

10:                                               ; preds = %29, %8
  %.01 = phi i32 [ 0, %8 ], [ %30, %29 ]
  %11 = icmp slt i32 %.01, 4
  br i1 %11, label %12, label %31

12:                                               ; preds = %10
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %13
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds [4 x i32], ptr %14, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %21

19:                                               ; preds = %12
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 219)
  br label %28

21:                                               ; preds = %12
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %22
  %24 = sext i32 %.01 to i64
  %25 = getelementptr inbounds [4 x i32], ptr %23, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %26)
  br label %28

28:                                               ; preds = %21, %19
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.01, 1
  br label %10, !llvm.loop !6

31:                                               ; preds = %10
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %34

34:                                               ; preds = %31
  %35 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

36:                                               ; preds = %6
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_board() #0 {
  br label %1

1:                                                ; preds = %18, %0
  %.0 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %2 = icmp slt i32 %.0, 4
  br i1 %2, label %3, label %20

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %15, %3
  %.01 = phi i32 [ 0, %3 ], [ %16, %15 ]
  %5 = icmp slt i32 %.01, 4
  br i1 %5, label %6, label %17

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [4 x i32], ptr %8, i64 0, i64 %9
  store i32 -1, ptr %10, align 4
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %11
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 %13
  store i32 -1, ptr %14, align 4
  br label %15

15:                                               ; preds = %6
  %16 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !9

17:                                               ; preds = %4
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

20:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @place_numbers() #0 {
  %1 = alloca [16 x i32], align 16
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  br label %4

4:                                                ; preds = %36, %0
  %.0 = phi i32 [ 0, %0 ], [ %37, %36 ]
  %5 = icmp slt i32 %.0, 8
  br i1 %5, label %6, label %38

6:                                                ; preds = %4
  %7 = call i32 @rand() #3
  %8 = srem i32 %7, 8
  %9 = add nsw i32 %8, 1
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %10
  store i32 %9, ptr %11, align 4
  br label %12

12:                                               ; preds = %34, %6
  %.01 = phi i32 [ 0, %6 ], [ %.1, %34 ]
  %13 = icmp slt i32 %.01, 2
  br i1 %13, label %14, label %35

14:                                               ; preds = %12
  %15 = call i32 @rand() #3
  %16 = srem i32 %15, 4
  %17 = call i32 @rand() #3
  %18 = srem i32 %17, 4
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %19
  %21 = sext i32 %18 to i64
  %22 = getelementptr inbounds [4 x i32], ptr %20, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %25, label %34

25:                                               ; preds = %14
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = sext i32 %16 to i64
  %30 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %29
  %31 = sext i32 %18 to i64
  %32 = getelementptr inbounds [4 x i32], ptr %30, i64 0, i64 %31
  store i32 %28, ptr %32, align 4
  %33 = add nsw i32 %.01, 1
  br label %34

34:                                               ; preds = %25, %14
  %.1 = phi i32 [ %33, %25 ], [ %.01, %14 ]
  br label %12, !llvm.loop !11

35:                                               ; preds = %12
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !12

38:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_guess(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = sext i32 %0 to i64
  %6 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %5
  %7 = sext i32 %1 to i64
  %8 = getelementptr inbounds [4 x i32], ptr %6, i64 0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %2 to i64
  %11 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %10
  %12 = sext i32 %3 to i64
  %13 = getelementptr inbounds [4 x i32], ptr %11, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp eq i32 %9, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %4
  br label %18

17:                                               ; preds = %4
  br label %18

18:                                               ; preds = %17, %16
  %.0 = phi i32 [ 1, %16 ], [ 0, %17 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @play() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @init_board()
  call void @place_numbers()
  br label %5

5:                                                ; preds = %102, %0
  %6 = load i32, ptr @gameover, align 4
  %7 = icmp ne i32 %6, 0
  %8 = xor i1 %7, true
  br i1 %8, label %9, label %103

9:                                                ; preds = %5
  call void @print_board()
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %1, ptr noundef %3)
  %12 = load i32, ptr %1, align 4
  %13 = sub nsw i32 %12, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %14
  %16 = load i32, ptr %3, align 4
  %17 = sub nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x i32], ptr %15, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = load i32, ptr %1, align 4
  %22 = sub nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %23
  %25 = load i32, ptr %3, align 4
  %26 = sub nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [4 x i32], ptr %24, i64 0, i64 %27
  store i32 %20, ptr %28, align 4
  call void @print_board()
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %30 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %2, ptr noundef %4)
  %31 = load i32, ptr %2, align 4
  %32 = sub nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %33
  %35 = load i32, ptr %4, align 4
  %36 = sub nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [4 x i32], ptr %34, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = load i32, ptr %2, align 4
  %41 = sub nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %42
  %44 = load i32, ptr %4, align 4
  %45 = sub nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [4 x i32], ptr %43, i64 0, i64 %46
  store i32 %39, ptr %47, align 4
  %48 = load i32, ptr %1, align 4
  %49 = sub nsw i32 %48, 1
  %50 = load i32, ptr %3, align 4
  %51 = sub nsw i32 %50, 1
  %52 = load i32, ptr %2, align 4
  %53 = sub nsw i32 %52, 1
  %54 = load i32, ptr %4, align 4
  %55 = sub nsw i32 %54, 1
  %56 = call i32 @check_guess(i32 noundef %49, i32 noundef %51, i32 noundef %53, i32 noundef %55)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %63

58:                                               ; preds = %9
  %59 = load i32, ptr @score, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr @score, align 4
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %62 = call i32 @getchar()
  br label %82

63:                                               ; preds = %9
  %64 = load i32, ptr %1, align 4
  %65 = sub nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %66
  %68 = load i32, ptr %3, align 4
  %69 = sub nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [4 x i32], ptr %67, i64 0, i64 %70
  store i32 -1, ptr %71, align 4
  %72 = load i32, ptr %2, align 4
  %73 = sub nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %74
  %76 = load i32, ptr %4, align 4
  %77 = sub nsw i32 %76, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [4 x i32], ptr %75, i64 0, i64 %78
  store i32 -1, ptr %79, align 4
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %81 = call i32 @getchar()
  br label %82

82:                                               ; preds = %63, %58
  store i32 1, ptr @gameover, align 4
  br label %83

83:                                               ; preds = %100, %82
  %.0 = phi i32 [ 0, %82 ], [ %101, %100 ]
  %84 = icmp slt i32 %.0, 4
  br i1 %84, label %85, label %102

85:                                               ; preds = %83
  br label %86

86:                                               ; preds = %97, %85
  %.01 = phi i32 [ 0, %85 ], [ %98, %97 ]
  %87 = icmp slt i32 %.01, 4
  br i1 %87, label %88, label %99

88:                                               ; preds = %86
  %89 = sext i32 %.0 to i64
  %90 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %89
  %91 = sext i32 %.01 to i64
  %92 = getelementptr inbounds [4 x i32], ptr %90, i64 0, i64 %91
  %93 = load i32, ptr %92, align 4
  %94 = icmp eq i32 %93, -1
  br i1 %94, label %95, label %96

95:                                               ; preds = %88
  store i32 0, ptr @gameover, align 4
  br label %96

96:                                               ; preds = %95, %88
  br label %97

97:                                               ; preds = %96
  %98 = add nsw i32 %.01, 1
  br label %86, !llvm.loop !13

99:                                               ; preds = %86
  br label %100

100:                                              ; preds = %99
  %101 = add nsw i32 %.0, 1
  br label %83, !llvm.loop !14

102:                                              ; preds = %83
  br label %5, !llvm.loop !15

103:                                              ; preds = %5
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %7 = call i32 @getchar()
  call void @play()
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
