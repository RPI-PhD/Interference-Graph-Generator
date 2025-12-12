; ModuleID = 'DATASETv2/gpt35-57735.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load i32, ptr @score, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %1, align 4
  br label %8

8:                                                ; preds = %43, %0
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %11, label %46

11:                                               ; preds = %8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %2, align 4
  br label %13

13:                                               ; preds = %37, %11
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %14, 4
  br i1 %15, label %16, label %40

16:                                               ; preds = %13
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %18
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32], ptr %19, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %25, label %27

25:                                               ; preds = %16
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 219)
  br label %36

27:                                               ; preds = %16
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %29
  %31 = load i32, ptr %2, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x i32], ptr %30, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %34)
  br label %36

36:                                               ; preds = %27, %25
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %2, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %2, align 4
  br label %13, !llvm.loop !6

40:                                               ; preds = %13
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %43

43:                                               ; preds = %40
  %44 = load i32, ptr %1, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %1, align 4
  br label %8, !llvm.loop !8

46:                                               ; preds = %8
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %27, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %30

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %23, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %26

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %12
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i32], ptr %13, i64 0, i64 %15
  store i32 -1, ptr %16, align 4
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %18
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32], ptr %19, i64 0, i64 %21
  store i32 -1, ptr %22, align 4
  br label %23

23:                                               ; preds = %10
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %2, align 4
  br label %7, !llvm.loop !9

26:                                               ; preds = %7
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %1, align 4
  br label %3, !llvm.loop !10

30:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @place_numbers() #0 {
  %1 = alloca [16 x i32], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i64 @time(ptr noundef null) #3
  %8 = trunc i64 %7 to i32
  call void @srand(i32 noundef %8) #3
  store i32 0, ptr %2, align 4
  br label %9

9:                                                ; preds = %50, %0
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 8
  br i1 %11, label %12, label %53

12:                                               ; preds = %9
  %13 = call i32 @rand() #3
  %14 = srem i32 %13, 8
  %15 = add nsw i32 %14, 1
  %16 = load i32, ptr %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %17
  store i32 %15, ptr %18, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %19

19:                                               ; preds = %48, %12
  %20 = load i32, ptr %3, align 4
  %21 = icmp slt i32 %20, 2
  br i1 %21, label %22, label %49

22:                                               ; preds = %19
  %23 = call i32 @rand() #3
  %24 = srem i32 %23, 4
  store i32 %24, ptr %5, align 4
  %25 = call i32 @rand() #3
  %26 = srem i32 %25, 4
  store i32 %26, ptr %6, align 4
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %28
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i32], ptr %29, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp eq i32 %33, -1
  br i1 %34, label %35, label %48

35:                                               ; preds = %22
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [16 x i32], ptr %1, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %41
  %43 = load i32, ptr %6, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [4 x i32], ptr %42, i64 0, i64 %44
  store i32 %39, ptr %45, align 4
  %46 = load i32, ptr %3, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %3, align 4
  br label %48

48:                                               ; preds = %35, %22
  br label %19, !llvm.loop !11

49:                                               ; preds = %19
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %2, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %2, align 4
  br label %9, !llvm.loop !12

53:                                               ; preds = %9
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @check_guess(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %10 = load i32, ptr %6, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %11
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x i32], ptr %12, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %8, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %18
  %20 = load i32, ptr %9, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32], ptr %19, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %16, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %4
  store i32 1, ptr %5, align 4
  br label %27

26:                                               ; preds = %4
  store i32 0, ptr %5, align 4
  br label %27

27:                                               ; preds = %26, %25
  %28 = load i32, ptr %5, align 4
  ret i32 %28
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @play() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void @init_board()
  call void @place_numbers()
  br label %7

7:                                                ; preds = %110, %0
  %8 = load i32, ptr @gameover, align 4
  %9 = icmp ne i32 %8, 0
  %10 = xor i1 %9, true
  br i1 %10, label %11, label %111

11:                                               ; preds = %7
  call void @print_board()
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %1, ptr noundef %3)
  %14 = load i32, ptr %1, align 4
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %16
  %18 = load i32, ptr %3, align 4
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [4 x i32], ptr %17, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr %1, align 4
  %24 = sub nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %25
  %27 = load i32, ptr %3, align 4
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x i32], ptr %26, i64 0, i64 %29
  store i32 %22, ptr %30, align 4
  call void @print_board()
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %2, ptr noundef %4)
  %33 = load i32, ptr %2, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [4 x [4 x i32]], ptr @board, i64 0, i64 %35
  %37 = load i32, ptr %4, align 4
  %38 = sub nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x i32], ptr %36, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %2, align 4
  %43 = sub nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %44
  %46 = load i32, ptr %4, align 4
  %47 = sub nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [4 x i32], ptr %45, i64 0, i64 %48
  store i32 %41, ptr %49, align 4
  %50 = load i32, ptr %1, align 4
  %51 = sub nsw i32 %50, 1
  %52 = load i32, ptr %3, align 4
  %53 = sub nsw i32 %52, 1
  %54 = load i32, ptr %2, align 4
  %55 = sub nsw i32 %54, 1
  %56 = load i32, ptr %4, align 4
  %57 = sub nsw i32 %56, 1
  %58 = call i32 @check_guess(i32 noundef %51, i32 noundef %53, i32 noundef %55, i32 noundef %57)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %65

60:                                               ; preds = %11
  %61 = load i32, ptr @score, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr @score, align 4
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %64 = call i32 @getchar()
  br label %84

65:                                               ; preds = %11
  %66 = load i32, ptr %1, align 4
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %68
  %70 = load i32, ptr %3, align 4
  %71 = sub nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [4 x i32], ptr %69, i64 0, i64 %72
  store i32 -1, ptr %73, align 4
  %74 = load i32, ptr %2, align 4
  %75 = sub nsw i32 %74, 1
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %76
  %78 = load i32, ptr %4, align 4
  %79 = sub nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [4 x i32], ptr %77, i64 0, i64 %80
  store i32 -1, ptr %81, align 4
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %83 = call i32 @getchar()
  br label %84

84:                                               ; preds = %65, %60
  store i32 1, ptr @gameover, align 4
  store i32 0, ptr %5, align 4
  br label %85

85:                                               ; preds = %107, %84
  %86 = load i32, ptr %5, align 4
  %87 = icmp slt i32 %86, 4
  br i1 %87, label %88, label %110

88:                                               ; preds = %85
  store i32 0, ptr %6, align 4
  br label %89

89:                                               ; preds = %103, %88
  %90 = load i32, ptr %6, align 4
  %91 = icmp slt i32 %90, 4
  br i1 %91, label %92, label %106

92:                                               ; preds = %89
  %93 = load i32, ptr %5, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [4 x [4 x i32]], ptr @guessboard, i64 0, i64 %94
  %96 = load i32, ptr %6, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [4 x i32], ptr %95, i64 0, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = icmp eq i32 %99, -1
  br i1 %100, label %101, label %102

101:                                              ; preds = %92
  store i32 0, ptr @gameover, align 4
  br label %102

102:                                              ; preds = %101, %92
  br label %103

103:                                              ; preds = %102
  %104 = load i32, ptr %6, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %6, align 4
  br label %89, !llvm.loop !13

106:                                              ; preds = %89
  br label %107

107:                                              ; preds = %106
  %108 = load i32, ptr %5, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %5, align 4
  br label %85, !llvm.loop !14

110:                                              ; preds = %85
  br label %7, !llvm.loop !15

111:                                              ; preds = %7
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %8 = call i32 @getchar()
  call void @play()
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
