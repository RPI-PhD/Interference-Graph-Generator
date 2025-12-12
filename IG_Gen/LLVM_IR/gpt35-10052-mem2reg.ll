; ModuleID = 'LLVM_IR/gpt35-10052.ll'
source_filename = "DATASETv2/gpt35-10052.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"-------------\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"|\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c" %c |\00", align 1
@board = dso_local global [3 x [3 x i8]] zeroinitializer, align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"\0A-------------\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Welcome to Tic Tac Toe!\0A\00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"The computer has made a move at (%d, %d)\0A\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Enter your move (row column): \00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"Invalid move. Try again.\0A\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"Game Over. \00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"The computer has won!\0A\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"You have won!\0A\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"Game over. It's a draw.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %2

2:                                                ; preds = %20, %0
  %.0 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %3 = icmp slt i32 %.0, 3
  br i1 %3, label %4, label %22

4:                                                ; preds = %2
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %6

6:                                                ; preds = %16, %4
  %.01 = phi i32 [ 0, %4 ], [ %17, %16 ]
  %7 = icmp slt i32 %.01, 3
  br i1 %7, label %8, label %18

8:                                                ; preds = %6
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %9
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds [3 x i8], ptr %10, i64 0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %14)
  br label %16

16:                                               ; preds = %8
  %17 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !6

18:                                               ; preds = %6
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %20

20:                                               ; preds = %18
  %21 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

22:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_move_valid(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp slt i32 %0, 0
  br i1 %3, label %10, label %4

4:                                                ; preds = %2
  %5 = icmp sgt i32 %0, 2
  br i1 %5, label %10, label %6

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %6
  %9 = icmp sgt i32 %1, 2
  br i1 %9, label %10, label %11

10:                                               ; preds = %8, %6, %4, %2
  br label %21

11:                                               ; preds = %8
  %12 = sext i32 %0 to i64
  %13 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %12
  %14 = sext i32 %1 to i64
  %15 = getelementptr inbounds [3 x i8], ptr %13, i64 0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 45
  br i1 %18, label %19, label %20

19:                                               ; preds = %11
  br label %21

20:                                               ; preds = %11
  br label %21

21:                                               ; preds = %20, %19, %10
  %.0 = phi i32 [ 0, %10 ], [ 0, %19 ], [ 1, %20 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_game_over() #0 {
  br label %1

1:                                                ; preds = %36, %0
  %.01 = phi i32 [ 0, %0 ], [ %37, %36 ]
  %2 = icmp slt i32 %.01, 3
  br i1 %2, label %3, label %38

3:                                                ; preds = %1
  %4 = sext i32 %.01 to i64
  %5 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %4
  %6 = getelementptr inbounds [3 x i8], ptr %5, i64 0, i64 0
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %9
  %11 = getelementptr inbounds [3 x i8], ptr %10, i64 0, i64 1
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %8, %13
  br i1 %14, label %15, label %35

15:                                               ; preds = %3
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %16
  %18 = getelementptr inbounds [3 x i8], ptr %17, i64 0, i64 1
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %21
  %23 = getelementptr inbounds [3 x i8], ptr %22, i64 0, i64 2
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %20, %25
  br i1 %26, label %27, label %35

27:                                               ; preds = %15
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %28
  %30 = getelementptr inbounds [3 x i8], ptr %29, i64 0, i64 0
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 45
  br i1 %33, label %34, label %35

34:                                               ; preds = %27
  br label %127

35:                                               ; preds = %27, %15, %3
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !9

38:                                               ; preds = %1
  br label %39

39:                                               ; preds = %69, %38
  %.1 = phi i32 [ 0, %38 ], [ %70, %69 ]
  %40 = icmp slt i32 %.1, 3
  br i1 %40, label %41, label %71

41:                                               ; preds = %39
  %42 = sext i32 %.1 to i64
  %43 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = sext i32 %.1 to i64
  %47 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %46
  %48 = load i8, ptr %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp eq i32 %45, %49
  br i1 %50, label %51, label %68

51:                                               ; preds = %41
  %52 = sext i32 %.1 to i64
  %53 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %52
  %54 = load i8, ptr %53, align 1
  %55 = sext i8 %54 to i32
  %56 = sext i32 %.1 to i64
  %57 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), i64 0, i64 %56
  %58 = load i8, ptr %57, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp eq i32 %55, %59
  br i1 %60, label %61, label %68

61:                                               ; preds = %51
  %62 = sext i32 %.1 to i64
  %63 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %62
  %64 = load i8, ptr %63, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp ne i32 %65, 45
  br i1 %66, label %67, label %68

67:                                               ; preds = %61
  br label %127

68:                                               ; preds = %61, %51, %41
  br label %69

69:                                               ; preds = %68
  %70 = add nsw i32 %.1, 1
  br label %39, !llvm.loop !10

71:                                               ; preds = %39
  %72 = load i8, ptr @board, align 1
  %73 = sext i8 %72 to i32
  %74 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %75 = sext i8 %74 to i32
  %76 = icmp eq i32 %73, %75
  br i1 %76, label %77, label %88

77:                                               ; preds = %71
  %78 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %79 = sext i8 %78 to i32
  %80 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %81 = sext i8 %80 to i32
  %82 = icmp eq i32 %79, %81
  br i1 %82, label %83, label %88

83:                                               ; preds = %77
  %84 = load i8, ptr @board, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp ne i32 %85, 45
  br i1 %86, label %87, label %88

87:                                               ; preds = %83
  br label %127

88:                                               ; preds = %83, %77, %71
  %89 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %90 = sext i8 %89 to i32
  %91 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %92 = sext i8 %91 to i32
  %93 = icmp eq i32 %90, %92
  br i1 %93, label %94, label %105

94:                                               ; preds = %88
  %95 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %96 = sext i8 %95 to i32
  %97 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %98 = sext i8 %97 to i32
  %99 = icmp eq i32 %96, %98
  br i1 %99, label %100, label %105

100:                                              ; preds = %94
  %101 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %102 = sext i8 %101 to i32
  %103 = icmp ne i32 %102, 45
  br i1 %103, label %104, label %105

104:                                              ; preds = %100
  br label %127

105:                                              ; preds = %100, %94, %88
  br label %106

106:                                              ; preds = %124, %105
  %.2 = phi i32 [ 0, %105 ], [ %125, %124 ]
  %107 = icmp slt i32 %.2, 3
  br i1 %107, label %108, label %126

108:                                              ; preds = %106
  br label %109

109:                                              ; preds = %121, %108
  %.02 = phi i32 [ 0, %108 ], [ %122, %121 ]
  %110 = icmp slt i32 %.02, 3
  br i1 %110, label %111, label %123

111:                                              ; preds = %109
  %112 = sext i32 %.2 to i64
  %113 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %112
  %114 = sext i32 %.02 to i64
  %115 = getelementptr inbounds [3 x i8], ptr %113, i64 0, i64 %114
  %116 = load i8, ptr %115, align 1
  %117 = sext i8 %116 to i32
  %118 = icmp eq i32 %117, 45
  br i1 %118, label %119, label %120

119:                                              ; preds = %111
  br label %127

120:                                              ; preds = %111
  br label %121

121:                                              ; preds = %120
  %122 = add nsw i32 %.02, 1
  br label %109, !llvm.loop !11

123:                                              ; preds = %109
  br label %124

124:                                              ; preds = %123
  %125 = add nsw i32 %.2, 1
  br label %106, !llvm.loop !12

126:                                              ; preds = %106
  br label %127

127:                                              ; preds = %126, %119, %104, %87, %67, %34
  %.0 = phi i32 [ 1, %34 ], [ 1, %67 ], [ 1, %87 ], [ 1, %104 ], [ 0, %119 ], [ 2, %126 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minimax(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp ne i32 %1, 0
  %4 = zext i1 %3 to i64
  %5 = select i1 %3, i32 -1000, i32 1000
  %6 = call i32 @is_game_over()
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = sub nsw i32 10, %0
  br label %62

10:                                               ; preds = %2
  %11 = icmp eq i32 %6, 0
  br i1 %11, label %12, label %60

12:                                               ; preds = %10
  br label %13

13:                                               ; preds = %57, %12
  %.02 = phi i32 [ 0, %12 ], [ %58, %57 ]
  %.01 = phi i32 [ %5, %12 ], [ %.1, %57 ]
  %14 = icmp slt i32 %.02, 3
  br i1 %14, label %15, label %59

15:                                               ; preds = %13
  br label %16

16:                                               ; preds = %54, %15
  %.03 = phi i32 [ 0, %15 ], [ %55, %54 ]
  %.1 = phi i32 [ %.01, %15 ], [ %.5, %54 ]
  %17 = icmp slt i32 %.03, 3
  br i1 %17, label %18, label %56

18:                                               ; preds = %16
  %19 = sext i32 %.02 to i64
  %20 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %19
  %21 = sext i32 %.03 to i64
  %22 = getelementptr inbounds [3 x i8], ptr %20, i64 0, i64 %21
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 45
  br i1 %25, label %26, label %53

26:                                               ; preds = %18
  %27 = icmp ne i32 %1, 0
  br i1 %27, label %28, label %38

28:                                               ; preds = %26
  %29 = sext i32 %.02 to i64
  %30 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %29
  %31 = sext i32 %.03 to i64
  %32 = getelementptr inbounds [3 x i8], ptr %30, i64 0, i64 %31
  store i8 120, ptr %32, align 1
  %33 = add nsw i32 %0, 1
  %34 = call i32 @minimax(i32 noundef %33, i32 noundef 0)
  %35 = icmp sgt i32 %34, %.1
  br i1 %35, label %36, label %37

36:                                               ; preds = %28
  br label %37

37:                                               ; preds = %36, %28
  %.2 = phi i32 [ %34, %36 ], [ %.1, %28 ]
  br label %48

38:                                               ; preds = %26
  %39 = sext i32 %.02 to i64
  %40 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %39
  %41 = sext i32 %.03 to i64
  %42 = getelementptr inbounds [3 x i8], ptr %40, i64 0, i64 %41
  store i8 111, ptr %42, align 1
  %43 = add nsw i32 %0, 1
  %44 = call i32 @minimax(i32 noundef %43, i32 noundef 1)
  %45 = icmp slt i32 %44, %.1
  br i1 %45, label %46, label %47

46:                                               ; preds = %38
  br label %47

47:                                               ; preds = %46, %38
  %.3 = phi i32 [ %44, %46 ], [ %.1, %38 ]
  br label %48

48:                                               ; preds = %47, %37
  %.4 = phi i32 [ %.2, %37 ], [ %.3, %47 ]
  %49 = sext i32 %.02 to i64
  %50 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %49
  %51 = sext i32 %.03 to i64
  %52 = getelementptr inbounds [3 x i8], ptr %50, i64 0, i64 %51
  store i8 45, ptr %52, align 1
  br label %53

53:                                               ; preds = %48, %18
  %.5 = phi i32 [ %.4, %48 ], [ %.1, %18 ]
  br label %54

54:                                               ; preds = %53
  %55 = add nsw i32 %.03, 1
  br label %16, !llvm.loop !13

56:                                               ; preds = %16
  br label %57

57:                                               ; preds = %56
  %58 = add nsw i32 %.02, 1
  br label %13, !llvm.loop !14

59:                                               ; preds = %13
  br label %62

60:                                               ; preds = %10
  %61 = add nsw i32 -10, %0
  br label %62

62:                                               ; preds = %60, %59, %8
  %.0 = phi i32 [ %9, %8 ], [ %.01, %59 ], [ %61, %60 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_best_move() #0 {
  br label %1

1:                                                ; preds = %31, %0
  %.07 = phi i32 [ -1, %0 ], [ %.18, %31 ]
  %.03 = phi i32 [ -1000, %0 ], [ %.14, %31 ]
  %.02 = phi i32 [ -1, %0 ], [ %.1, %31 ]
  %.0 = phi i32 [ 0, %0 ], [ %32, %31 ]
  %2 = icmp slt i32 %.0, 3
  br i1 %2, label %3, label %33

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %28, %3
  %.18 = phi i32 [ %.07, %3 ], [ %.310, %28 ]
  %.14 = phi i32 [ %.03, %3 ], [ %.36, %28 ]
  %.1 = phi i32 [ %.02, %3 ], [ %.3, %28 ]
  %.01 = phi i32 [ 0, %3 ], [ %29, %28 ]
  %5 = icmp slt i32 %.01, 3
  br i1 %5, label %6, label %30

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 45
  br i1 %13, label %14, label %27

14:                                               ; preds = %6
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %15
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [3 x i8], ptr %16, i64 0, i64 %17
  store i8 120, ptr %18, align 1
  %19 = call i32 @minimax(i32 noundef 0, i32 noundef 0)
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %20
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds [3 x i8], ptr %21, i64 0, i64 %22
  store i8 45, ptr %23, align 1
  %24 = icmp sgt i32 %19, %.14
  br i1 %24, label %25, label %26

25:                                               ; preds = %14
  br label %26

26:                                               ; preds = %25, %14
  %.29 = phi i32 [ %.0, %25 ], [ %.18, %14 ]
  %.25 = phi i32 [ %19, %25 ], [ %.14, %14 ]
  %.2 = phi i32 [ %.01, %25 ], [ %.1, %14 ]
  br label %27

27:                                               ; preds = %26, %6
  %.310 = phi i32 [ %.29, %26 ], [ %.18, %6 ]
  %.36 = phi i32 [ %.25, %26 ], [ %.14, %6 ]
  %.3 = phi i32 [ %.2, %26 ], [ %.1, %6 ]
  br label %28

28:                                               ; preds = %27
  %29 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !15

30:                                               ; preds = %4
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !16

33:                                               ; preds = %1
  %34 = mul nsw i32 %.07, 3
  %35 = add nsw i32 %34, %.02
  ret i32 %35
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %16, %0
  %.01 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %4 = icmp slt i32 %.01, 3
  br i1 %4, label %5, label %18

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %13, %5
  %.0 = phi i32 [ 0, %5 ], [ %14, %13 ]
  %7 = icmp slt i32 %.0, 3
  br i1 %7, label %8, label %15

8:                                                ; preds = %6
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %9
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [3 x i8], ptr %10, i64 0, i64 %11
  store i8 45, ptr %12, align 1
  br label %13

13:                                               ; preds = %8
  %14 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !17

15:                                               ; preds = %6
  br label %16

16:                                               ; preds = %15
  %17 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !18

18:                                               ; preds = %3
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %20

20:                                               ; preds = %77, %42, %18
  %.02 = phi i32 [ 1, %18 ], [ %80, %77 ], [ %.02, %42 ]
  call void @print_board()
  %21 = icmp ne i32 %.02, 0
  br i1 %21, label %22, label %31

22:                                               ; preds = %20
  %23 = call i32 @get_best_move()
  %24 = sdiv i32 %23, 3
  store i32 %24, ptr %1, align 4
  %25 = srem i32 %23, 3
  store i32 %25, ptr %2, align 4
  %26 = load i32, ptr %1, align 4
  %27 = add nsw i32 %26, 1
  %28 = load i32, ptr %2, align 4
  %29 = add nsw i32 %28, 1
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %27, i32 noundef %29)
  br label %45

31:                                               ; preds = %20
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %33 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %1, ptr noundef %2)
  %34 = load i32, ptr %1, align 4
  %35 = add nsw i32 %34, -1
  store i32 %35, ptr %1, align 4
  %36 = load i32, ptr %2, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, ptr %2, align 4
  %38 = load i32, ptr %1, align 4
  %39 = load i32, ptr %2, align 4
  %40 = call i32 @is_move_valid(i32 noundef %38, i32 noundef %39)
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %44, label %42

42:                                               ; preds = %31
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %20

44:                                               ; preds = %31
  br label %45

45:                                               ; preds = %44, %22
  %46 = icmp ne i32 %.02, 0
  br i1 %46, label %47, label %54

47:                                               ; preds = %45
  %48 = load i32, ptr %1, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %49
  %51 = load i32, ptr %2, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x i8], ptr %50, i64 0, i64 %52
  store i8 120, ptr %53, align 1
  br label %61

54:                                               ; preds = %45
  %55 = load i32, ptr %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %56
  %58 = load i32, ptr %2, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [3 x i8], ptr %57, i64 0, i64 %59
  store i8 111, ptr %60, align 1
  br label %61

61:                                               ; preds = %54, %47
  %62 = call i32 @is_game_over()
  %63 = icmp eq i32 %62, 1
  br i1 %63, label %64, label %72

64:                                               ; preds = %61
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %66 = icmp ne i32 %.02, 0
  br i1 %66, label %67, label %69

67:                                               ; preds = %64
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %71

69:                                               ; preds = %64
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %71

71:                                               ; preds = %69, %67
  call void @print_board()
  br label %81

72:                                               ; preds = %61
  %73 = icmp eq i32 %62, 2
  br i1 %73, label %74, label %76

74:                                               ; preds = %72
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @print_board()
  br label %81

76:                                               ; preds = %72
  br label %77

77:                                               ; preds = %76
  %78 = icmp ne i32 %.02, 0
  %79 = xor i1 %78, true
  %80 = zext i1 %79 to i32
  br label %20

81:                                               ; preds = %74, %71
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
