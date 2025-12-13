; ModuleID = 'LLVM_IR/gpt35-23922.ll'
source_filename = "DATASETv2/gpt35-23922.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Welcome to Tic Tac Toe!\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"Do you want to play as X or O?\0A\00", align 1
@stdin = external global ptr, align 8
@human = dso_local global i8 0, align 1
@computer = dso_local global i8 0, align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Invalid choice!\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Congratulations! You win!\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"It's a tie!\0A\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"Sorry, you lose!\0A\00", align 1
@board = dso_local global [3 x [3 x i8]] zeroinitializer, align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%c \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"Enter row and column (1-3): \00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.10 = private unnamed_addr constant [26 x i8] c"Invalid move, try again!\0A\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"Computer is thinking...\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %4

4:                                                ; preds = %26, %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %6 = call i32 @getchar()
  %7 = trunc i32 %6 to i8
  %8 = load ptr, ptr @stdin, align 8
  %9 = call i32 @fflush(ptr noundef %8)
  %10 = sext i8 %7 to i32
  %11 = icmp eq i32 %10, 88
  br i1 %11, label %15, label %12

12:                                               ; preds = %4
  %13 = sext i8 %7 to i32
  %14 = icmp eq i32 %13, 120
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %4
  store i8 88, ptr @human, align 1
  store i8 79, ptr @computer, align 1
  br label %27

16:                                               ; preds = %12
  %17 = sext i8 %7 to i32
  %18 = icmp eq i32 %17, 79
  br i1 %18, label %22, label %19

19:                                               ; preds = %16
  %20 = sext i8 %7 to i32
  %21 = icmp eq i32 %20, 111
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %16
  store i8 79, ptr @human, align 1
  store i8 88, ptr @computer, align 1
  br label %27

23:                                               ; preds = %19
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %25

25:                                               ; preds = %23
  br label %26

26:                                               ; preds = %25
  br label %4

27:                                               ; preds = %22, %15
  call void @init_board()
  call void @print_board()
  br label %28

28:                                               ; preds = %70, %27
  %29 = load i8, ptr @human, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 88
  br i1 %31, label %32, label %51

32:                                               ; preds = %28
  call void @human_move()
  %33 = load i8, ptr @human, align 1
  %34 = call zeroext i1 @check_win(i8 noundef signext %33)
  br i1 %34, label %35, label %37

35:                                               ; preds = %32
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %71

37:                                               ; preds = %32
  %38 = call zeroext i1 @is_full()
  br i1 %38, label %39, label %41

39:                                               ; preds = %37
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %71

41:                                               ; preds = %37
  call void @computer_move()
  %42 = load i8, ptr @computer, align 1
  %43 = call zeroext i1 @check_win(i8 noundef signext %42)
  br i1 %43, label %44, label %46

44:                                               ; preds = %41
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %71

46:                                               ; preds = %41
  %47 = call zeroext i1 @is_full()
  br i1 %47, label %48, label %50

48:                                               ; preds = %46
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %71

50:                                               ; preds = %46
  br label %70

51:                                               ; preds = %28
  call void @computer_move()
  %52 = load i8, ptr @computer, align 1
  %53 = call zeroext i1 @check_win(i8 noundef signext %52)
  br i1 %53, label %54, label %56

54:                                               ; preds = %51
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %71

56:                                               ; preds = %51
  %57 = call zeroext i1 @is_full()
  br i1 %57, label %58, label %60

58:                                               ; preds = %56
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %71

60:                                               ; preds = %56
  call void @human_move()
  %61 = load i8, ptr @human, align 1
  %62 = call zeroext i1 @check_win(i8 noundef signext %61)
  br i1 %62, label %63, label %65

63:                                               ; preds = %60
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %71

65:                                               ; preds = %60
  %66 = call zeroext i1 @is_full()
  br i1 %66, label %67, label %69

67:                                               ; preds = %65
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %71

69:                                               ; preds = %65
  br label %70

70:                                               ; preds = %69, %50
  br label %28

71:                                               ; preds = %67, %63, %58, %54, %48, %44, %39, %35
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @getchar() #2

declare i32 @fflush(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @check_win(i8 noundef signext %0) #0 {
  %2 = load i8, ptr @board, align 1
  %3 = sext i8 %2 to i32
  %4 = sext i8 %0 to i32
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %17

6:                                                ; preds = %1
  %7 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 1), align 1
  %8 = sext i8 %7 to i32
  %9 = sext i8 %0 to i32
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %17

11:                                               ; preds = %6
  %12 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %13 = sext i8 %12 to i32
  %14 = sext i8 %0 to i32
  %15 = icmp eq i32 %13, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %11
  br label %130

17:                                               ; preds = %11, %6, %1
  %18 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), align 1
  %19 = sext i8 %18 to i32
  %20 = sext i8 %0 to i32
  %21 = icmp eq i32 %19, %20
  br i1 %21, label %22, label %33

22:                                               ; preds = %17
  %23 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %24 = sext i8 %23 to i32
  %25 = sext i8 %0 to i32
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %33

27:                                               ; preds = %22
  %28 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 2), align 1
  %29 = sext i8 %28 to i32
  %30 = sext i8 %0 to i32
  %31 = icmp eq i32 %29, %30
  br i1 %31, label %32, label %33

32:                                               ; preds = %27
  br label %130

33:                                               ; preds = %27, %22, %17
  %34 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %35 = sext i8 %34 to i32
  %36 = sext i8 %0 to i32
  %37 = icmp eq i32 %35, %36
  br i1 %37, label %38, label %49

38:                                               ; preds = %33
  %39 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 1), align 1
  %40 = sext i8 %39 to i32
  %41 = sext i8 %0 to i32
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %49

43:                                               ; preds = %38
  %44 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %45 = sext i8 %44 to i32
  %46 = sext i8 %0 to i32
  %47 = icmp eq i32 %45, %46
  br i1 %47, label %48, label %49

48:                                               ; preds = %43
  br label %130

49:                                               ; preds = %43, %38, %33
  %50 = load i8, ptr @board, align 1
  %51 = sext i8 %50 to i32
  %52 = sext i8 %0 to i32
  %53 = icmp eq i32 %51, %52
  br i1 %53, label %54, label %65

54:                                               ; preds = %49
  %55 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), align 1
  %56 = sext i8 %55 to i32
  %57 = sext i8 %0 to i32
  %58 = icmp eq i32 %56, %57
  br i1 %58, label %59, label %65

59:                                               ; preds = %54
  %60 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %61 = sext i8 %60 to i32
  %62 = sext i8 %0 to i32
  %63 = icmp eq i32 %61, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %59
  br label %130

65:                                               ; preds = %59, %54, %49
  %66 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 1), align 1
  %67 = sext i8 %66 to i32
  %68 = sext i8 %0 to i32
  %69 = icmp eq i32 %67, %68
  br i1 %69, label %70, label %81

70:                                               ; preds = %65
  %71 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %72 = sext i8 %71 to i32
  %73 = sext i8 %0 to i32
  %74 = icmp eq i32 %72, %73
  br i1 %74, label %75, label %81

75:                                               ; preds = %70
  %76 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 1), align 1
  %77 = sext i8 %76 to i32
  %78 = sext i8 %0 to i32
  %79 = icmp eq i32 %77, %78
  br i1 %79, label %80, label %81

80:                                               ; preds = %75
  br label %130

81:                                               ; preds = %75, %70, %65
  %82 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %83 = sext i8 %82 to i32
  %84 = sext i8 %0 to i32
  %85 = icmp eq i32 %83, %84
  br i1 %85, label %86, label %97

86:                                               ; preds = %81
  %87 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 2), align 1
  %88 = sext i8 %87 to i32
  %89 = sext i8 %0 to i32
  %90 = icmp eq i32 %88, %89
  br i1 %90, label %91, label %97

91:                                               ; preds = %86
  %92 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %93 = sext i8 %92 to i32
  %94 = sext i8 %0 to i32
  %95 = icmp eq i32 %93, %94
  br i1 %95, label %96, label %97

96:                                               ; preds = %91
  br label %130

97:                                               ; preds = %91, %86, %81
  %98 = load i8, ptr @board, align 1
  %99 = sext i8 %98 to i32
  %100 = sext i8 %0 to i32
  %101 = icmp eq i32 %99, %100
  br i1 %101, label %102, label %113

102:                                              ; preds = %97
  %103 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %104 = sext i8 %103 to i32
  %105 = sext i8 %0 to i32
  %106 = icmp eq i32 %104, %105
  br i1 %106, label %107, label %113

107:                                              ; preds = %102
  %108 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %109 = sext i8 %108 to i32
  %110 = sext i8 %0 to i32
  %111 = icmp eq i32 %109, %110
  br i1 %111, label %112, label %113

112:                                              ; preds = %107
  br label %130

113:                                              ; preds = %107, %102, %97
  %114 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %115 = sext i8 %114 to i32
  %116 = sext i8 %0 to i32
  %117 = icmp eq i32 %115, %116
  br i1 %117, label %118, label %129

118:                                              ; preds = %113
  %119 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %120 = sext i8 %119 to i32
  %121 = sext i8 %0 to i32
  %122 = icmp eq i32 %120, %121
  br i1 %122, label %123, label %129

123:                                              ; preds = %118
  %124 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %125 = sext i8 %124 to i32
  %126 = sext i8 %0 to i32
  %127 = icmp eq i32 %125, %126
  br i1 %127, label %128, label %129

128:                                              ; preds = %123
  br label %130

129:                                              ; preds = %123, %118, %113
  br label %130

130:                                              ; preds = %129, %128, %112, %96, %80, %64, %48, %32, %16
  %.0 = phi i1 [ true, %16 ], [ true, %32 ], [ true, %48 ], [ true, %64 ], [ true, %80 ], [ true, %96 ], [ true, %112 ], [ true, %128 ], [ false, %129 ]
  ret i1 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_board() #0 {
  br label %1

1:                                                ; preds = %14, %0
  %.0 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %2 = icmp slt i32 %.0, 3
  br i1 %2, label %3, label %16

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %11, %3
  %.01 = phi i32 [ 0, %3 ], [ %12, %11 ]
  %5 = icmp slt i32 %.01, 3
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  store i8 45, ptr %10, align 1
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !6

13:                                               ; preds = %4
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !8

16:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board() #0 {
  br label %1

1:                                                ; preds = %18, %0
  %.0 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %2 = icmp slt i32 %.0, 3
  br i1 %2, label %3, label %20

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %14, %3
  %.01 = phi i32 [ 0, %3 ], [ %15, %14 ]
  %5 = icmp slt i32 %.01, 3
  br i1 %5, label %6, label %16

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %12)
  br label %14

14:                                               ; preds = %6
  %15 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !9

16:                                               ; preds = %4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %18

18:                                               ; preds = %16
  %19 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

20:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @is_valid_move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp slt i32 %0, 0
  br i1 %3, label %10, label %4

4:                                                ; preds = %2
  %5 = icmp sge i32 %0, 3
  br i1 %5, label %10, label %6

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %6
  %9 = icmp sge i32 %1, 3
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
  %.0 = phi i1 [ false, %10 ], [ false, %19 ], [ true, %20 ]
  ret i1 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @human_move() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %25, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %1, ptr noundef %2)
  %6 = load ptr, ptr @stdin, align 8
  %7 = call i32 @fflush(ptr noundef %6)
  %8 = load i32, ptr %1, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, ptr %1, align 4
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, ptr %2, align 4
  %12 = load i32, ptr %1, align 4
  %13 = load i32, ptr %2, align 4
  %14 = call zeroext i1 @is_valid_move(i32 noundef %12, i32 noundef %13)
  br i1 %14, label %15, label %23

15:                                               ; preds = %3
  %16 = load i8, ptr @human, align 1
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %18
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [3 x i8], ptr %19, i64 0, i64 %21
  store i8 %16, ptr %22, align 1
  call void @print_board()
  br label %26

23:                                               ; preds = %3
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %25

25:                                               ; preds = %23
  br label %3

26:                                               ; preds = %15
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @computer_move() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %2

2:                                                ; preds = %27, %0
  %.0 = phi i32 [ 0, %0 ], [ %28, %27 ]
  %3 = icmp slt i32 %.0, 3
  br i1 %3, label %4, label %29

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %24, %4
  %.01 = phi i32 [ 0, %4 ], [ %25, %24 ]
  %6 = icmp slt i32 %.01, 3
  br i1 %6, label %7, label %26

7:                                                ; preds = %5
  %8 = call zeroext i1 @is_valid_move(i32 noundef %.0, i32 noundef %.01)
  br i1 %8, label %9, label %23

9:                                                ; preds = %7
  %10 = load i8, ptr @computer, align 1
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %11
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds [3 x i8], ptr %12, i64 0, i64 %13
  store i8 %10, ptr %14, align 1
  %15 = load i8, ptr @computer, align 1
  %16 = call zeroext i1 @check_win(i8 noundef signext %15)
  br i1 %16, label %17, label %18

17:                                               ; preds = %9
  call void @print_board()
  br label %76

18:                                               ; preds = %9
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %19
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [3 x i8], ptr %20, i64 0, i64 %21
  store i8 45, ptr %22, align 1
  br label %23

23:                                               ; preds = %18, %7
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !11

26:                                               ; preds = %5
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !12

29:                                               ; preds = %2
  br label %30

30:                                               ; preds = %60, %29
  %.02 = phi i32 [ 0, %29 ], [ %61, %60 ]
  %31 = icmp slt i32 %.02, 3
  br i1 %31, label %32, label %62

32:                                               ; preds = %30
  br label %33

33:                                               ; preds = %57, %32
  %.03 = phi i32 [ 0, %32 ], [ %58, %57 ]
  %34 = icmp slt i32 %.03, 3
  br i1 %34, label %35, label %59

35:                                               ; preds = %33
  %36 = call zeroext i1 @is_valid_move(i32 noundef %.02, i32 noundef %.03)
  br i1 %36, label %37, label %56

37:                                               ; preds = %35
  %38 = load i8, ptr @human, align 1
  %39 = sext i32 %.02 to i64
  %40 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %39
  %41 = sext i32 %.03 to i64
  %42 = getelementptr inbounds [3 x i8], ptr %40, i64 0, i64 %41
  store i8 %38, ptr %42, align 1
  %43 = load i8, ptr @human, align 1
  %44 = call zeroext i1 @check_win(i8 noundef signext %43)
  br i1 %44, label %45, label %51

45:                                               ; preds = %37
  %46 = load i8, ptr @computer, align 1
  %47 = sext i32 %.02 to i64
  %48 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %47
  %49 = sext i32 %.03 to i64
  %50 = getelementptr inbounds [3 x i8], ptr %48, i64 0, i64 %49
  store i8 %46, ptr %50, align 1
  call void @print_board()
  br label %76

51:                                               ; preds = %37
  %52 = sext i32 %.02 to i64
  %53 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %52
  %54 = sext i32 %.03 to i64
  %55 = getelementptr inbounds [3 x i8], ptr %53, i64 0, i64 %54
  store i8 45, ptr %55, align 1
  br label %56

56:                                               ; preds = %51, %35
  br label %57

57:                                               ; preds = %56
  %58 = add nsw i32 %.03, 1
  br label %33, !llvm.loop !13

59:                                               ; preds = %33
  br label %60

60:                                               ; preds = %59
  %61 = add nsw i32 %.02, 1
  br label %30, !llvm.loop !14

62:                                               ; preds = %30
  br label %63

63:                                               ; preds = %75, %62
  %64 = call i32 @rand() #3
  %65 = srem i32 %64, 3
  %66 = call i32 @rand() #3
  %67 = srem i32 %66, 3
  %68 = call zeroext i1 @is_valid_move(i32 noundef %65, i32 noundef %67)
  br i1 %68, label %69, label %75

69:                                               ; preds = %63
  %70 = load i8, ptr @computer, align 1
  %71 = sext i32 %65 to i64
  %72 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %71
  %73 = sext i32 %67 to i64
  %74 = getelementptr inbounds [3 x i8], ptr %72, i64 0, i64 %73
  store i8 %70, ptr %74, align 1
  call void @print_board()
  br label %76

75:                                               ; preds = %63
  br label %63

76:                                               ; preds = %69, %45, %17
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @is_full() #0 {
  br label %1

1:                                                ; preds = %19, %0
  %.01 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %2 = icmp slt i32 %.01, 3
  br i1 %2, label %3, label %21

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %16, %3
  %.02 = phi i32 [ 0, %3 ], [ %17, %16 ]
  %5 = icmp slt i32 %.02, 3
  br i1 %5, label %6, label %18

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 45
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  br label %22

15:                                               ; preds = %6
  br label %16

16:                                               ; preds = %15
  %17 = add nsw i32 %.02, 1
  br label %4, !llvm.loop !15

18:                                               ; preds = %4
  br label %19

19:                                               ; preds = %18
  %20 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !16

21:                                               ; preds = %1
  br label %22

22:                                               ; preds = %21, %14
  %.0 = phi i1 [ false, %14 ], [ true, %21 ]
  ret i1 %.0
}

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
