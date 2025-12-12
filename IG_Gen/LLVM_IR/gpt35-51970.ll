; ModuleID = 'DATASETv2/gpt35-51970.c'
source_filename = "DATASETv2/gpt35-51970.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@player = dso_local global i8 88, align 1
@moves = dso_local global i32 0, align 4
@board = dso_local global [3 x [3 x i8]] zeroinitializer, align 1
@.str = private unnamed_addr constant [18 x i8] c"Tic Tac Toe Game\0A\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"You are '%c' and the computer is 'O'\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Congrats! You win!\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Sorry, the computer wins.\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"It's a tie.\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"  1 2 3\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%c \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"\0AEnter your move (ex. A1, B2, C3): \00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c" %c%d\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c"That spot is already taken, try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %22, %0
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %25

7:                                                ; preds = %4
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %18, %7
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %21

11:                                               ; preds = %8
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %13
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x i8], ptr %14, i64 0, i64 %16
  store i8 32, ptr %17, align 1
  br label %18

18:                                               ; preds = %11
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  br label %8, !llvm.loop !6

21:                                               ; preds = %8
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %2, align 4
  br label %4, !llvm.loop !8

25:                                               ; preds = %4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %27 = load i8, ptr @player, align 1
  %28 = sext i8 %27 to i32
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %28)
  br label %30

30:                                               ; preds = %41, %25
  %31 = call i32 @checkWin(i8 noundef signext 88)
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %39

33:                                               ; preds = %30
  %34 = call i32 @checkWin(i8 noundef signext 79)
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %33
  %37 = load i32, ptr @moves, align 4
  %38 = icmp slt i32 %37, 9
  br label %39

39:                                               ; preds = %36, %33, %30
  %40 = phi i1 [ false, %33 ], [ false, %30 ], [ %38, %36 ]
  br i1 %40, label %41, label %42

41:                                               ; preds = %39
  call void @printBoard()
  call void @play()
  br label %30, !llvm.loop !9

42:                                               ; preds = %39
  call void @printBoard()
  %43 = call i32 @checkWin(i8 noundef signext 88)
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %47

45:                                               ; preds = %42
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %55

47:                                               ; preds = %42
  %48 = call i32 @checkWin(i8 noundef signext 79)
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %52

50:                                               ; preds = %47
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %54

52:                                               ; preds = %47
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %54

54:                                               ; preds = %52, %50
  br label %55

55:                                               ; preds = %54, %45
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @checkWin(i8 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8 %0, ptr %3, align 1
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %41, %1
  %7 = load i32, ptr %4, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %44

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %11
  %13 = getelementptr inbounds [3 x i8], ptr %12, i64 0, i64 0
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = load i8, ptr %3, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %15, %17
  br i1 %18, label %19, label %40

19:                                               ; preds = %9
  %20 = load i32, ptr %4, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %21
  %23 = getelementptr inbounds [3 x i8], ptr %22, i64 0, i64 1
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = load i8, ptr %3, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %25, %27
  br i1 %28, label %29, label %40

29:                                               ; preds = %19
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %31
  %33 = getelementptr inbounds [3 x i8], ptr %32, i64 0, i64 2
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = load i8, ptr %3, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %35, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %29
  store i32 1, ptr %2, align 4
  br label %119

40:                                               ; preds = %29, %19, %9
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %4, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %4, align 4
  br label %6, !llvm.loop !10

44:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %45

45:                                               ; preds = %77, %44
  %46 = load i32, ptr %5, align 4
  %47 = icmp slt i32 %46, 3
  br i1 %47, label %48, label %80

48:                                               ; preds = %45
  %49 = load i32, ptr %5, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = load i8, ptr %3, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp eq i32 %53, %55
  br i1 %56, label %57, label %76

57:                                               ; preds = %48
  %58 = load i32, ptr %5, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %59
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  %63 = load i8, ptr %3, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp eq i32 %62, %64
  br i1 %65, label %66, label %76

66:                                               ; preds = %57
  %67 = load i32, ptr %5, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), i64 0, i64 %68
  %70 = load i8, ptr %69, align 1
  %71 = sext i8 %70 to i32
  %72 = load i8, ptr %3, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %71, %73
  br i1 %74, label %75, label %76

75:                                               ; preds = %66
  store i32 1, ptr %2, align 4
  br label %119

76:                                               ; preds = %66, %57, %48
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %5, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %5, align 4
  br label %45, !llvm.loop !11

80:                                               ; preds = %45
  %81 = load i8, ptr @board, align 1
  %82 = sext i8 %81 to i32
  %83 = load i8, ptr %3, align 1
  %84 = sext i8 %83 to i32
  %85 = icmp eq i32 %82, %84
  br i1 %85, label %86, label %99

86:                                               ; preds = %80
  %87 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %88 = sext i8 %87 to i32
  %89 = load i8, ptr %3, align 1
  %90 = sext i8 %89 to i32
  %91 = icmp eq i32 %88, %90
  br i1 %91, label %92, label %99

92:                                               ; preds = %86
  %93 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %94 = sext i8 %93 to i32
  %95 = load i8, ptr %3, align 1
  %96 = sext i8 %95 to i32
  %97 = icmp eq i32 %94, %96
  br i1 %97, label %98, label %99

98:                                               ; preds = %92
  store i32 1, ptr %2, align 4
  br label %119

99:                                               ; preds = %92, %86, %80
  %100 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %101 = sext i8 %100 to i32
  %102 = load i8, ptr %3, align 1
  %103 = sext i8 %102 to i32
  %104 = icmp eq i32 %101, %103
  br i1 %104, label %105, label %118

105:                                              ; preds = %99
  %106 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %107 = sext i8 %106 to i32
  %108 = load i8, ptr %3, align 1
  %109 = sext i8 %108 to i32
  %110 = icmp eq i32 %107, %109
  br i1 %110, label %111, label %118

111:                                              ; preds = %105
  %112 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %113 = sext i8 %112 to i32
  %114 = load i8, ptr %3, align 1
  %115 = sext i8 %114 to i32
  %116 = icmp eq i32 %113, %115
  br i1 %116, label %117, label %118

117:                                              ; preds = %111
  store i32 1, ptr %2, align 4
  br label %119

118:                                              ; preds = %111, %105, %99
  store i32 0, ptr %2, align 4
  br label %119

119:                                              ; preds = %118, %117, %98, %75, %39
  %120 = load i32, ptr %2, align 4
  ret i32 %120
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printBoard() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %29, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %32

7:                                                ; preds = %4
  %8 = load i32, ptr %1, align 4
  %9 = add nsw i32 65, %8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %9)
  store i32 0, ptr %2, align 4
  br label %11

11:                                               ; preds = %24, %7
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %12, 3
  br i1 %13, label %14, label %27

14:                                               ; preds = %11
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %16
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [3 x i8], ptr %17, i64 0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %22)
  br label %24

24:                                               ; preds = %14
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %2, align 4
  br label %11, !llvm.loop !12

27:                                               ; preds = %11
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %29

29:                                               ; preds = %27
  %30 = load i32, ptr %1, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %1, align 4
  br label %4, !llvm.loop !13

32:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @play() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 -1, ptr %1, align 4
  store i32 -1, ptr %2, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %1, ptr noundef %2)
  %5 = load i32, ptr %1, align 4
  %6 = sub nsw i32 %5, 65
  store i32 %6, ptr %1, align 4
  %7 = load i32, ptr %2, align 4
  %8 = add nsw i32 %7, -1
  store i32 %8, ptr %2, align 4
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %10
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [3 x i8], ptr %11, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 32
  br i1 %17, label %18, label %28

18:                                               ; preds = %0
  %19 = load i8, ptr @player, align 1
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %21
  %23 = load i32, ptr %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [3 x i8], ptr %22, i64 0, i64 %24
  store i8 %19, ptr %25, align 1
  %26 = load i32, ptr @moves, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr @moves, align 4
  br label %30

28:                                               ; preds = %0
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  call void @play()
  br label %30

30:                                               ; preds = %28, %18
  %31 = load i8, ptr @player, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 88
  %34 = zext i1 %33 to i64
  %35 = select i1 %33, i32 79, i32 88
  %36 = trunc i32 %35 to i8
  store i8 %36, ptr @player, align 1
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @minimax(i8 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8 %0, ptr %3, align 1
  %9 = call i32 @checkWin(i8 noundef signext 88)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  store i32 -10, ptr %2, align 4
  br label %132

12:                                               ; preds = %1
  %13 = call i32 @checkWin(i8 noundef signext 79)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i32 10, ptr %2, align 4
  br label %132

16:                                               ; preds = %12
  %17 = load i32, ptr @moves, align 4
  %18 = icmp eq i32 %17, 9
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  store i32 0, ptr %2, align 4
  br label %132

20:                                               ; preds = %16
  %21 = load i8, ptr %3, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 79
  br i1 %23, label %24, label %77

24:                                               ; preds = %20
  store i32 -1000, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %25

25:                                               ; preds = %73, %24
  %26 = load i32, ptr %5, align 4
  %27 = icmp slt i32 %26, 3
  br i1 %27, label %28, label %76

28:                                               ; preds = %25
  store i32 0, ptr %6, align 4
  br label %29

29:                                               ; preds = %69, %28
  %30 = load i32, ptr %6, align 4
  %31 = icmp slt i32 %30, 3
  br i1 %31, label %32, label %72

32:                                               ; preds = %29
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %34
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x i8], ptr %35, i64 0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp eq i32 %40, 32
  br i1 %41, label %42, label %68

42:                                               ; preds = %32
  %43 = load i32, ptr %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %44
  %46 = load i32, ptr %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [3 x i8], ptr %45, i64 0, i64 %47
  store i8 79, ptr %48, align 1
  %49 = load i32, ptr @moves, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr @moves, align 4
  %51 = load i32, ptr %4, align 4
  %52 = call i32 @minimax(i8 noundef signext 88)
  %53 = icmp sgt i32 %51, %52
  br i1 %53, label %54, label %56

54:                                               ; preds = %42
  %55 = load i32, ptr %4, align 4
  br label %58

56:                                               ; preds = %42
  %57 = call i32 @minimax(i8 noundef signext 88)
  br label %58

58:                                               ; preds = %56, %54
  %59 = phi i32 [ %55, %54 ], [ %57, %56 ]
  store i32 %59, ptr %4, align 4
  %60 = load i32, ptr %5, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %61
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [3 x i8], ptr %62, i64 0, i64 %64
  store i8 32, ptr %65, align 1
  %66 = load i32, ptr @moves, align 4
  %67 = add nsw i32 %66, -1
  store i32 %67, ptr @moves, align 4
  br label %68

68:                                               ; preds = %58, %32
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %6, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %6, align 4
  br label %29, !llvm.loop !14

72:                                               ; preds = %29
  br label %73

73:                                               ; preds = %72
  %74 = load i32, ptr %5, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %5, align 4
  br label %25, !llvm.loop !15

76:                                               ; preds = %25
  br label %130

77:                                               ; preds = %20
  store i32 1000, ptr %4, align 4
  store i32 0, ptr %7, align 4
  br label %78

78:                                               ; preds = %126, %77
  %79 = load i32, ptr %7, align 4
  %80 = icmp slt i32 %79, 3
  br i1 %80, label %81, label %129

81:                                               ; preds = %78
  store i32 0, ptr %8, align 4
  br label %82

82:                                               ; preds = %122, %81
  %83 = load i32, ptr %8, align 4
  %84 = icmp slt i32 %83, 3
  br i1 %84, label %85, label %125

85:                                               ; preds = %82
  %86 = load i32, ptr %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %87
  %89 = load i32, ptr %8, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [3 x i8], ptr %88, i64 0, i64 %90
  %92 = load i8, ptr %91, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp eq i32 %93, 32
  br i1 %94, label %95, label %121

95:                                               ; preds = %85
  %96 = load i32, ptr %7, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %97
  %99 = load i32, ptr %8, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [3 x i8], ptr %98, i64 0, i64 %100
  store i8 88, ptr %101, align 1
  %102 = load i32, ptr @moves, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr @moves, align 4
  %104 = load i32, ptr %4, align 4
  %105 = call i32 @minimax(i8 noundef signext 79)
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %109

107:                                              ; preds = %95
  %108 = load i32, ptr %4, align 4
  br label %111

109:                                              ; preds = %95
  %110 = call i32 @minimax(i8 noundef signext 79)
  br label %111

111:                                              ; preds = %109, %107
  %112 = phi i32 [ %108, %107 ], [ %110, %109 ]
  store i32 %112, ptr %4, align 4
  %113 = load i32, ptr %7, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %114
  %116 = load i32, ptr %8, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [3 x i8], ptr %115, i64 0, i64 %117
  store i8 32, ptr %118, align 1
  %119 = load i32, ptr @moves, align 4
  %120 = add nsw i32 %119, -1
  store i32 %120, ptr @moves, align 4
  br label %121

121:                                              ; preds = %111, %85
  br label %122

122:                                              ; preds = %121
  %123 = load i32, ptr %8, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %8, align 4
  br label %82, !llvm.loop !16

125:                                              ; preds = %82
  br label %126

126:                                              ; preds = %125
  %127 = load i32, ptr %7, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %7, align 4
  br label %78, !llvm.loop !17

129:                                              ; preds = %78
  br label %130

130:                                              ; preds = %129, %76
  %131 = load i32, ptr %4, align 4
  store i32 %131, ptr %2, align 4
  br label %132

132:                                              ; preds = %130, %19, %15, %11
  %133 = load i32, ptr %2, align 4
  ret i32 %133
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @computerMove() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 -1, ptr %2, align 4
  store i32 -1, ptr %3, align 4
  store i32 -1000, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %56, %0
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %59

11:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %52, %11
  %13 = load i32, ptr %6, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %55

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %17
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [3 x i8], ptr %18, i64 0, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp eq i32 %23, 32
  br i1 %24, label %25, label %51

25:                                               ; preds = %15
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %27
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i8], ptr %28, i64 0, i64 %30
  store i8 79, ptr %31, align 1
  %32 = load i32, ptr @moves, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr @moves, align 4
  %34 = call i32 @minimax(i8 noundef signext 88)
  store i32 %34, ptr %7, align 4
  %35 = load i32, ptr %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %36
  %38 = load i32, ptr %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [3 x i8], ptr %37, i64 0, i64 %39
  store i8 32, ptr %40, align 1
  %41 = load i32, ptr @moves, align 4
  %42 = add nsw i32 %41, -1
  store i32 %42, ptr @moves, align 4
  %43 = load i32, ptr %7, align 4
  %44 = load i32, ptr %4, align 4
  %45 = icmp sgt i32 %43, %44
  br i1 %45, label %46, label %50

46:                                               ; preds = %25
  %47 = load i32, ptr %7, align 4
  store i32 %47, ptr %4, align 4
  %48 = load i32, ptr %5, align 4
  store i32 %48, ptr %2, align 4
  %49 = load i32, ptr %6, align 4
  store i32 %49, ptr %3, align 4
  br label %50

50:                                               ; preds = %46, %25
  br label %51

51:                                               ; preds = %50, %15
  br label %52

52:                                               ; preds = %51
  %53 = load i32, ptr %6, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %6, align 4
  br label %12, !llvm.loop !18

55:                                               ; preds = %12
  br label %56

56:                                               ; preds = %55
  %57 = load i32, ptr %5, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %5, align 4
  br label %8, !llvm.loop !19

59:                                               ; preds = %8
  %60 = load i32, ptr %2, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %61
  %63 = load i32, ptr %3, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [3 x i8], ptr %62, i64 0, i64 %64
  store i8 79, ptr %65, align 1
  %66 = load i32, ptr @moves, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr @moves, align 4
  %68 = load i32, ptr %1, align 4
  ret i32 %68
}

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
!19 = distinct !{!19, !7}
