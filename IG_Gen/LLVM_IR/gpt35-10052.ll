; ModuleID = 'DATASETv2/gpt35-10052.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %27, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %30

7:                                                ; preds = %4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %2, align 4
  br label %9

9:                                                ; preds = %22, %7
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %25

12:                                               ; preds = %9
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %14
  %16 = load i32, ptr %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [3 x i8], ptr %15, i64 0, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %20)
  br label %22

22:                                               ; preds = %12
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %2, align 4
  br label %9, !llvm.loop !6

25:                                               ; preds = %9
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %27

27:                                               ; preds = %25
  %28 = load i32, ptr %1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %1, align 4
  br label %4, !llvm.loop !8

30:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_move_valid(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %17, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 2
  br i1 %10, label %17, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = icmp sgt i32 %15, 2
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %11, %8, %2
  store i32 0, ptr %3, align 4
  br label %30

18:                                               ; preds = %14
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %20
  %22 = load i32, ptr %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x i8], ptr %21, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 45
  br i1 %27, label %28, label %29

28:                                               ; preds = %18
  store i32 0, ptr %3, align 4
  br label %30

29:                                               ; preds = %18
  store i32 1, ptr %3, align 4
  br label %30

30:                                               ; preds = %29, %28, %17
  %31 = load i32, ptr %3, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_game_over() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %45, %0
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %48

7:                                                ; preds = %4
  %8 = load i32, ptr %2, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %9
  %11 = getelementptr inbounds [3 x i8], ptr %10, i64 0, i64 0
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %15
  %17 = getelementptr inbounds [3 x i8], ptr %16, i64 0, i64 1
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %13, %19
  br i1 %20, label %21, label %44

21:                                               ; preds = %7
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %23
  %25 = getelementptr inbounds [3 x i8], ptr %24, i64 0, i64 1
  %26 = load i8, ptr %25, align 1
  %27 = sext i8 %26 to i32
  %28 = load i32, ptr %2, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %29
  %31 = getelementptr inbounds [3 x i8], ptr %30, i64 0, i64 2
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %27, %33
  br i1 %34, label %35, label %44

35:                                               ; preds = %21
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %37
  %39 = getelementptr inbounds [3 x i8], ptr %38, i64 0, i64 0
  %40 = load i8, ptr %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp ne i32 %41, 45
  br i1 %42, label %43, label %44

43:                                               ; preds = %35
  store i32 1, ptr %1, align 4
  br label %150

44:                                               ; preds = %35, %21, %7
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %2, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %2, align 4
  br label %4, !llvm.loop !9

48:                                               ; preds = %4
  store i32 0, ptr %2, align 4
  br label %49

49:                                               ; preds = %85, %48
  %50 = load i32, ptr %2, align 4
  %51 = icmp slt i32 %50, 3
  br i1 %51, label %52, label %88

52:                                               ; preds = %49
  %53 = load i32, ptr %2, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = load i32, ptr %2, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %59
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp eq i32 %57, %62
  br i1 %63, label %64, label %84

64:                                               ; preds = %52
  %65 = load i32, ptr %2, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = sext i8 %68 to i32
  %70 = load i32, ptr %2, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), i64 0, i64 %71
  %73 = load i8, ptr %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %69, %74
  br i1 %75, label %76, label %84

76:                                               ; preds = %64
  %77 = load i32, ptr %2, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %78
  %80 = load i8, ptr %79, align 1
  %81 = sext i8 %80 to i32
  %82 = icmp ne i32 %81, 45
  br i1 %82, label %83, label %84

83:                                               ; preds = %76
  store i32 1, ptr %1, align 4
  br label %150

84:                                               ; preds = %76, %64, %52
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %2, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %2, align 4
  br label %49, !llvm.loop !10

88:                                               ; preds = %49
  %89 = load i8, ptr @board, align 1
  %90 = sext i8 %89 to i32
  %91 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %92 = sext i8 %91 to i32
  %93 = icmp eq i32 %90, %92
  br i1 %93, label %94, label %105

94:                                               ; preds = %88
  %95 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %96 = sext i8 %95 to i32
  %97 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %98 = sext i8 %97 to i32
  %99 = icmp eq i32 %96, %98
  br i1 %99, label %100, label %105

100:                                              ; preds = %94
  %101 = load i8, ptr @board, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp ne i32 %102, 45
  br i1 %103, label %104, label %105

104:                                              ; preds = %100
  store i32 1, ptr %1, align 4
  br label %150

105:                                              ; preds = %100, %94, %88
  %106 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %107 = sext i8 %106 to i32
  %108 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %109 = sext i8 %108 to i32
  %110 = icmp eq i32 %107, %109
  br i1 %110, label %111, label %122

111:                                              ; preds = %105
  %112 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %113 = sext i8 %112 to i32
  %114 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %115 = sext i8 %114 to i32
  %116 = icmp eq i32 %113, %115
  br i1 %116, label %117, label %122

117:                                              ; preds = %111
  %118 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %119 = sext i8 %118 to i32
  %120 = icmp ne i32 %119, 45
  br i1 %120, label %121, label %122

121:                                              ; preds = %117
  store i32 1, ptr %1, align 4
  br label %150

122:                                              ; preds = %117, %111, %105
  store i32 0, ptr %2, align 4
  br label %123

123:                                              ; preds = %146, %122
  %124 = load i32, ptr %2, align 4
  %125 = icmp slt i32 %124, 3
  br i1 %125, label %126, label %149

126:                                              ; preds = %123
  store i32 0, ptr %3, align 4
  br label %127

127:                                              ; preds = %142, %126
  %128 = load i32, ptr %3, align 4
  %129 = icmp slt i32 %128, 3
  br i1 %129, label %130, label %145

130:                                              ; preds = %127
  %131 = load i32, ptr %2, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %132
  %134 = load i32, ptr %3, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [3 x i8], ptr %133, i64 0, i64 %135
  %137 = load i8, ptr %136, align 1
  %138 = sext i8 %137 to i32
  %139 = icmp eq i32 %138, 45
  br i1 %139, label %140, label %141

140:                                              ; preds = %130
  store i32 0, ptr %1, align 4
  br label %150

141:                                              ; preds = %130
  br label %142

142:                                              ; preds = %141
  %143 = load i32, ptr %3, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %3, align 4
  br label %127, !llvm.loop !11

145:                                              ; preds = %127
  br label %146

146:                                              ; preds = %145
  %147 = load i32, ptr %2, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, ptr %2, align 4
  br label %123, !llvm.loop !12

149:                                              ; preds = %123
  store i32 2, ptr %1, align 4
  br label %150

150:                                              ; preds = %149, %140, %121, %104, %83, %43
  %151 = load i32, ptr %1, align 4
  ret i32 %151
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @minimax(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp ne i32 %11, 0
  %13 = zext i1 %12 to i64
  %14 = select i1 %12, i32 -1000, i32 1000
  store i32 %14, ptr %9, align 4
  %15 = call i32 @is_game_over()
  store i32 %15, ptr %10, align 4
  %16 = load i32, ptr %10, align 4
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %21

18:                                               ; preds = %2
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 10, %19
  store i32 %20, ptr %3, align 4
  br label %97

21:                                               ; preds = %2
  %22 = load i32, ptr %10, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %94

24:                                               ; preds = %21
  store i32 0, ptr %6, align 4
  br label %25

25:                                               ; preds = %89, %24
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %26, 3
  br i1 %27, label %28, label %92

28:                                               ; preds = %25
  store i32 0, ptr %7, align 4
  br label %29

29:                                               ; preds = %85, %28
  %30 = load i32, ptr %7, align 4
  %31 = icmp slt i32 %30, 3
  br i1 %31, label %32, label %88

32:                                               ; preds = %29
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %34
  %36 = load i32, ptr %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x i8], ptr %35, i64 0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 45
  br i1 %41, label %42, label %84

42:                                               ; preds = %32
  %43 = load i32, ptr %5, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %61

45:                                               ; preds = %42
  %46 = load i32, ptr %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %47
  %49 = load i32, ptr %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [3 x i8], ptr %48, i64 0, i64 %50
  store i8 120, ptr %51, align 1
  %52 = load i32, ptr %4, align 4
  %53 = add nsw i32 %52, 1
  %54 = call i32 @minimax(i32 noundef %53, i32 noundef 0)
  store i32 %54, ptr %8, align 4
  %55 = load i32, ptr %8, align 4
  %56 = load i32, ptr %9, align 4
  %57 = icmp sgt i32 %55, %56
  br i1 %57, label %58, label %60

58:                                               ; preds = %45
  %59 = load i32, ptr %8, align 4
  store i32 %59, ptr %9, align 4
  br label %60

60:                                               ; preds = %58, %45
  br label %77

61:                                               ; preds = %42
  %62 = load i32, ptr %6, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %63
  %65 = load i32, ptr %7, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [3 x i8], ptr %64, i64 0, i64 %66
  store i8 111, ptr %67, align 1
  %68 = load i32, ptr %4, align 4
  %69 = add nsw i32 %68, 1
  %70 = call i32 @minimax(i32 noundef %69, i32 noundef 1)
  store i32 %70, ptr %8, align 4
  %71 = load i32, ptr %8, align 4
  %72 = load i32, ptr %9, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %76

74:                                               ; preds = %61
  %75 = load i32, ptr %8, align 4
  store i32 %75, ptr %9, align 4
  br label %76

76:                                               ; preds = %74, %61
  br label %77

77:                                               ; preds = %76, %60
  %78 = load i32, ptr %6, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %79
  %81 = load i32, ptr %7, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [3 x i8], ptr %80, i64 0, i64 %82
  store i8 45, ptr %83, align 1
  br label %84

84:                                               ; preds = %77, %32
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %7, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %7, align 4
  br label %29, !llvm.loop !13

88:                                               ; preds = %29
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %6, align 4
  br label %25, !llvm.loop !14

92:                                               ; preds = %25
  %93 = load i32, ptr %9, align 4
  store i32 %93, ptr %3, align 4
  br label %97

94:                                               ; preds = %21
  %95 = load i32, ptr %4, align 4
  %96 = add nsw i32 -10, %95
  store i32 %96, ptr %3, align 4
  br label %97

97:                                               ; preds = %94, %92, %18
  %98 = load i32, ptr %3, align 4
  ret i32 %98
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @get_best_move() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 -1000, ptr %4, align 4
  store i32 -1, ptr %5, align 4
  store i32 -1, ptr %6, align 4
  store i32 0, ptr %1, align 4
  br label %7

7:                                                ; preds = %51, %0
  %8 = load i32, ptr %1, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %54

10:                                               ; preds = %7
  store i32 0, ptr %2, align 4
  br label %11

11:                                               ; preds = %47, %10
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %12, 3
  br i1 %13, label %14, label %50

14:                                               ; preds = %11
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %16
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [3 x i8], ptr %17, i64 0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 45
  br i1 %23, label %24, label %46

24:                                               ; preds = %14
  %25 = load i32, ptr %1, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %26
  %28 = load i32, ptr %2, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [3 x i8], ptr %27, i64 0, i64 %29
  store i8 120, ptr %30, align 1
  %31 = call i32 @minimax(i32 noundef 0, i32 noundef 0)
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %33
  %35 = load i32, ptr %2, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x i8], ptr %34, i64 0, i64 %36
  store i8 45, ptr %37, align 1
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr %4, align 4
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %45

41:                                               ; preds = %24
  %42 = load i32, ptr %3, align 4
  store i32 %42, ptr %4, align 4
  %43 = load i32, ptr %1, align 4
  store i32 %43, ptr %5, align 4
  %44 = load i32, ptr %2, align 4
  store i32 %44, ptr %6, align 4
  br label %45

45:                                               ; preds = %41, %24
  br label %46

46:                                               ; preds = %45, %14
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %2, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %2, align 4
  br label %11, !llvm.loop !15

50:                                               ; preds = %11
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %1, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %1, align 4
  br label %7, !llvm.loop !16

54:                                               ; preds = %7
  %55 = load i32, ptr %5, align 4
  %56 = mul nsw i32 %55, 3
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %56, %57
  ret i32 %58
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %9

9:                                                ; preds = %27, %0
  %10 = load i32, ptr %6, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %30

12:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %13

13:                                               ; preds = %23, %12
  %14 = load i32, ptr %7, align 4
  %15 = icmp slt i32 %14, 3
  br i1 %15, label %16, label %26

16:                                               ; preds = %13
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %18
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [3 x i8], ptr %19, i64 0, i64 %21
  store i8 45, ptr %22, align 1
  br label %23

23:                                               ; preds = %16
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %7, align 4
  br label %13, !llvm.loop !17

26:                                               ; preds = %13
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %9, !llvm.loop !18

30:                                               ; preds = %9
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %32

32:                                               ; preds = %30, %57, %96
  call void @print_board()
  %33 = load i32, ptr %5, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %46

35:                                               ; preds = %32
  %36 = call i32 @get_best_move()
  store i32 %36, ptr %4, align 4
  %37 = load i32, ptr %4, align 4
  %38 = sdiv i32 %37, 3
  store i32 %38, ptr %2, align 4
  %39 = load i32, ptr %4, align 4
  %40 = srem i32 %39, 3
  store i32 %40, ptr %3, align 4
  %41 = load i32, ptr %2, align 4
  %42 = add nsw i32 %41, 1
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, 1
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %42, i32 noundef %44)
  br label %60

46:                                               ; preds = %32
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %48 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %2, ptr noundef %3)
  %49 = load i32, ptr %2, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, ptr %2, align 4
  %51 = load i32, ptr %3, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, ptr %3, align 4
  %53 = load i32, ptr %2, align 4
  %54 = load i32, ptr %3, align 4
  %55 = call i32 @is_move_valid(i32 noundef %53, i32 noundef %54)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %59, label %57

57:                                               ; preds = %46
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %32

59:                                               ; preds = %46
  br label %60

60:                                               ; preds = %59, %35
  %61 = load i32, ptr %5, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %70

63:                                               ; preds = %60
  %64 = load i32, ptr %2, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %65
  %67 = load i32, ptr %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [3 x i8], ptr %66, i64 0, i64 %68
  store i8 120, ptr %69, align 1
  br label %77

70:                                               ; preds = %60
  %71 = load i32, ptr %2, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %72
  %74 = load i32, ptr %3, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [3 x i8], ptr %73, i64 0, i64 %75
  store i8 111, ptr %76, align 1
  br label %77

77:                                               ; preds = %70, %63
  %78 = call i32 @is_game_over()
  store i32 %78, ptr %8, align 4
  %79 = load i32, ptr %8, align 4
  %80 = icmp eq i32 %79, 1
  br i1 %80, label %81, label %90

81:                                               ; preds = %77
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %83 = load i32, ptr %5, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %87

85:                                               ; preds = %81
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %89

87:                                               ; preds = %81
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %89

89:                                               ; preds = %87, %85
  call void @print_board()
  br label %101

90:                                               ; preds = %77
  %91 = load i32, ptr %8, align 4
  %92 = icmp eq i32 %91, 2
  br i1 %92, label %93, label %95

93:                                               ; preds = %90
  %94 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @print_board()
  br label %101

95:                                               ; preds = %90
  br label %96

96:                                               ; preds = %95
  %97 = load i32, ptr %5, align 4
  %98 = icmp ne i32 %97, 0
  %99 = xor i1 %98, true
  %100 = zext i1 %99 to i32
  store i32 %100, ptr %5, align 4
  br label %32

101:                                              ; preds = %93, %89
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
