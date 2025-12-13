; ModuleID = 'LLVM_IR/gpt35-51970.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %14, %0
  %.01 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %2 = icmp slt i32 %.01, 3
  br i1 %2, label %3, label %16

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %11, %3
  %.0 = phi i32 [ 0, %3 ], [ %12, %11 ]
  %5 = icmp slt i32 %.0, 3
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  store i8 32, ptr %10, align 1
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

13:                                               ; preds = %4
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !8

16:                                               ; preds = %1
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %18 = load i8, ptr @player, align 1
  %19 = sext i8 %18 to i32
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %19)
  br label %21

21:                                               ; preds = %32, %16
  %22 = call i32 @checkWin(i8 noundef signext 88)
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %21
  %25 = call i32 @checkWin(i8 noundef signext 79)
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %24
  %28 = load i32, ptr @moves, align 4
  %29 = icmp slt i32 %28, 9
  br label %30

30:                                               ; preds = %27, %24, %21
  %31 = phi i1 [ false, %24 ], [ false, %21 ], [ %29, %27 ]
  br i1 %31, label %32, label %33

32:                                               ; preds = %30
  call void @printBoard()
  call void @play()
  br label %21, !llvm.loop !9

33:                                               ; preds = %30
  call void @printBoard()
  %34 = call i32 @checkWin(i8 noundef signext 88)
  %35 = icmp eq i32 %34, 1
  br i1 %35, label %36, label %38

36:                                               ; preds = %33
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %46

38:                                               ; preds = %33
  %39 = call i32 @checkWin(i8 noundef signext 79)
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %41, label %43

41:                                               ; preds = %38
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %45

43:                                               ; preds = %38
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %45

45:                                               ; preds = %43, %41
  br label %46

46:                                               ; preds = %45, %36
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @checkWin(i8 noundef signext %0) #0 {
  br label %2

2:                                                ; preds = %30, %1
  %.02 = phi i32 [ 0, %1 ], [ %31, %30 ]
  %3 = icmp slt i32 %.02, 3
  br i1 %3, label %4, label %32

4:                                                ; preds = %2
  %5 = sext i32 %.02 to i64
  %6 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %5
  %7 = getelementptr inbounds [3 x i8], ptr %6, i64 0, i64 0
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = sext i8 %0 to i32
  %11 = icmp eq i32 %9, %10
  br i1 %11, label %12, label %29

12:                                               ; preds = %4
  %13 = sext i32 %.02 to i64
  %14 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %13
  %15 = getelementptr inbounds [3 x i8], ptr %14, i64 0, i64 1
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = sext i8 %0 to i32
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %29

20:                                               ; preds = %12
  %21 = sext i32 %.02 to i64
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %21
  %23 = getelementptr inbounds [3 x i8], ptr %22, i64 0, i64 2
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = sext i8 %0 to i32
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %20
  br label %93

29:                                               ; preds = %20, %12, %4
  br label %30

30:                                               ; preds = %29
  %31 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !10

32:                                               ; preds = %2
  br label %33

33:                                               ; preds = %58, %32
  %.01 = phi i32 [ 0, %32 ], [ %59, %58 ]
  %34 = icmp slt i32 %.01, 3
  br i1 %34, label %35, label %60

35:                                               ; preds = %33
  %36 = sext i32 %.01 to i64
  %37 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = sext i8 %0 to i32
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %57

42:                                               ; preds = %35
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %43
  %45 = load i8, ptr %44, align 1
  %46 = sext i8 %45 to i32
  %47 = sext i8 %0 to i32
  %48 = icmp eq i32 %46, %47
  br i1 %48, label %49, label %57

49:                                               ; preds = %42
  %50 = sext i32 %.01 to i64
  %51 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = sext i8 %0 to i32
  %55 = icmp eq i32 %53, %54
  br i1 %55, label %56, label %57

56:                                               ; preds = %49
  br label %93

57:                                               ; preds = %49, %42, %35
  br label %58

58:                                               ; preds = %57
  %59 = add nsw i32 %.01, 1
  br label %33, !llvm.loop !11

60:                                               ; preds = %33
  %61 = load i8, ptr @board, align 1
  %62 = sext i8 %61 to i32
  %63 = sext i8 %0 to i32
  %64 = icmp eq i32 %62, %63
  br i1 %64, label %65, label %76

65:                                               ; preds = %60
  %66 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %67 = sext i8 %66 to i32
  %68 = sext i8 %0 to i32
  %69 = icmp eq i32 %67, %68
  br i1 %69, label %70, label %76

70:                                               ; preds = %65
  %71 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %72 = sext i8 %71 to i32
  %73 = sext i8 %0 to i32
  %74 = icmp eq i32 %72, %73
  br i1 %74, label %75, label %76

75:                                               ; preds = %70
  br label %93

76:                                               ; preds = %70, %65, %60
  %77 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %78 = sext i8 %77 to i32
  %79 = sext i8 %0 to i32
  %80 = icmp eq i32 %78, %79
  br i1 %80, label %81, label %92

81:                                               ; preds = %76
  %82 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %83 = sext i8 %82 to i32
  %84 = sext i8 %0 to i32
  %85 = icmp eq i32 %83, %84
  br i1 %85, label %86, label %92

86:                                               ; preds = %81
  %87 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %88 = sext i8 %87 to i32
  %89 = sext i8 %0 to i32
  %90 = icmp eq i32 %88, %89
  br i1 %90, label %91, label %92

91:                                               ; preds = %86
  br label %93

92:                                               ; preds = %86, %81, %76
  br label %93

93:                                               ; preds = %92, %91, %75, %56, %28
  %.0 = phi i32 [ 1, %28 ], [ 1, %56 ], [ 1, %75 ], [ 1, %91 ], [ 0, %92 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printBoard() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %2

2:                                                ; preds = %21, %0
  %.0 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %3 = icmp slt i32 %.0, 3
  br i1 %3, label %4, label %23

4:                                                ; preds = %2
  %5 = add nsw i32 65, %.0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %5)
  br label %7

7:                                                ; preds = %17, %4
  %.01 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %8 = icmp slt i32 %.01, 3
  br i1 %8, label %9, label %19

9:                                                ; preds = %7
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %10
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [3 x i8], ptr %11, i64 0, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %15)
  br label %17

17:                                               ; preds = %9
  %18 = add nsw i32 %.01, 1
  br label %7, !llvm.loop !12

19:                                               ; preds = %7
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %21

21:                                               ; preds = %19
  %22 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !13

23:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minimax(i8 noundef signext %0) #0 {
  %2 = call i32 @checkWin(i8 noundef signext 88)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %99

5:                                                ; preds = %1
  %6 = call i32 @checkWin(i8 noundef signext 79)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  br label %99

9:                                                ; preds = %5
  %10 = load i32, ptr @moves, align 4
  %11 = icmp eq i32 %10, 9
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  br label %99

13:                                               ; preds = %9
  %14 = sext i8 %0 to i32
  %15 = icmp eq i32 %14, 79
  br i1 %15, label %16, label %57

16:                                               ; preds = %13
  br label %17

17:                                               ; preds = %54, %16
  %.03 = phi i32 [ 0, %16 ], [ %55, %54 ]
  %.02 = phi i32 [ -1000, %16 ], [ %.1, %54 ]
  %18 = icmp slt i32 %.03, 3
  br i1 %18, label %19, label %56

19:                                               ; preds = %17
  br label %20

20:                                               ; preds = %51, %19
  %.04 = phi i32 [ 0, %19 ], [ %52, %51 ]
  %.1 = phi i32 [ %.02, %19 ], [ %.2, %51 ]
  %21 = icmp slt i32 %.04, 3
  br i1 %21, label %22, label %53

22:                                               ; preds = %20
  %23 = sext i32 %.03 to i64
  %24 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %23
  %25 = sext i32 %.04 to i64
  %26 = getelementptr inbounds [3 x i8], ptr %24, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 32
  br i1 %29, label %30, label %50

30:                                               ; preds = %22
  %31 = sext i32 %.03 to i64
  %32 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %31
  %33 = sext i32 %.04 to i64
  %34 = getelementptr inbounds [3 x i8], ptr %32, i64 0, i64 %33
  store i8 79, ptr %34, align 1
  %35 = load i32, ptr @moves, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr @moves, align 4
  %37 = call i32 @minimax(i8 noundef signext 88)
  %38 = icmp sgt i32 %.1, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %30
  br label %42

40:                                               ; preds = %30
  %41 = call i32 @minimax(i8 noundef signext 88)
  br label %42

42:                                               ; preds = %40, %39
  %43 = phi i32 [ %.1, %39 ], [ %41, %40 ]
  %44 = sext i32 %.03 to i64
  %45 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %44
  %46 = sext i32 %.04 to i64
  %47 = getelementptr inbounds [3 x i8], ptr %45, i64 0, i64 %46
  store i8 32, ptr %47, align 1
  %48 = load i32, ptr @moves, align 4
  %49 = add nsw i32 %48, -1
  store i32 %49, ptr @moves, align 4
  br label %50

50:                                               ; preds = %42, %22
  %.2 = phi i32 [ %43, %42 ], [ %.1, %22 ]
  br label %51

51:                                               ; preds = %50
  %52 = add nsw i32 %.04, 1
  br label %20, !llvm.loop !14

53:                                               ; preds = %20
  br label %54

54:                                               ; preds = %53
  %55 = add nsw i32 %.03, 1
  br label %17, !llvm.loop !15

56:                                               ; preds = %17
  br label %98

57:                                               ; preds = %13
  br label %58

58:                                               ; preds = %95, %57
  %.05 = phi i32 [ 0, %57 ], [ %96, %95 ]
  %.3 = phi i32 [ 1000, %57 ], [ %.4, %95 ]
  %59 = icmp slt i32 %.05, 3
  br i1 %59, label %60, label %97

60:                                               ; preds = %58
  br label %61

61:                                               ; preds = %92, %60
  %.4 = phi i32 [ %.3, %60 ], [ %.5, %92 ]
  %.01 = phi i32 [ 0, %60 ], [ %93, %92 ]
  %62 = icmp slt i32 %.01, 3
  br i1 %62, label %63, label %94

63:                                               ; preds = %61
  %64 = sext i32 %.05 to i64
  %65 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %64
  %66 = sext i32 %.01 to i64
  %67 = getelementptr inbounds [3 x i8], ptr %65, i64 0, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 32
  br i1 %70, label %71, label %91

71:                                               ; preds = %63
  %72 = sext i32 %.05 to i64
  %73 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %72
  %74 = sext i32 %.01 to i64
  %75 = getelementptr inbounds [3 x i8], ptr %73, i64 0, i64 %74
  store i8 88, ptr %75, align 1
  %76 = load i32, ptr @moves, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr @moves, align 4
  %78 = call i32 @minimax(i8 noundef signext 79)
  %79 = icmp slt i32 %.4, %78
  br i1 %79, label %80, label %81

80:                                               ; preds = %71
  br label %83

81:                                               ; preds = %71
  %82 = call i32 @minimax(i8 noundef signext 79)
  br label %83

83:                                               ; preds = %81, %80
  %84 = phi i32 [ %.4, %80 ], [ %82, %81 ]
  %85 = sext i32 %.05 to i64
  %86 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %85
  %87 = sext i32 %.01 to i64
  %88 = getelementptr inbounds [3 x i8], ptr %86, i64 0, i64 %87
  store i8 32, ptr %88, align 1
  %89 = load i32, ptr @moves, align 4
  %90 = add nsw i32 %89, -1
  store i32 %90, ptr @moves, align 4
  br label %91

91:                                               ; preds = %83, %63
  %.5 = phi i32 [ %84, %83 ], [ %.4, %63 ]
  br label %92

92:                                               ; preds = %91
  %93 = add nsw i32 %.01, 1
  br label %61, !llvm.loop !16

94:                                               ; preds = %61
  br label %95

95:                                               ; preds = %94
  %96 = add nsw i32 %.05, 1
  br label %58, !llvm.loop !17

97:                                               ; preds = %58
  br label %98

98:                                               ; preds = %97, %56
  %.6 = phi i32 [ %.02, %56 ], [ %.3, %97 ]
  br label %99

99:                                               ; preds = %98, %12, %8, %4
  %.0 = phi i32 [ -10, %4 ], [ 10, %8 ], [ 0, %12 ], [ %.6, %98 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @computerMove() #0 {
  br label %1

1:                                                ; preds = %35, %0
  %.010 = phi i32 [ 0, %0 ], [ %36, %35 ]
  %.06 = phi i32 [ -1000, %0 ], [ %.17, %35 ]
  %.02 = phi i32 [ -1, %0 ], [ %.13, %35 ]
  %.01 = phi i32 [ -1, %0 ], [ %.1, %35 ]
  %2 = icmp slt i32 %.010, 3
  br i1 %2, label %3, label %37

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %32, %3
  %.17 = phi i32 [ %.06, %3 ], [ %.39, %32 ]
  %.13 = phi i32 [ %.02, %3 ], [ %.35, %32 ]
  %.1 = phi i32 [ %.01, %3 ], [ %.3, %32 ]
  %.0 = phi i32 [ 0, %3 ], [ %33, %32 ]
  %5 = icmp slt i32 %.0, 3
  br i1 %5, label %6, label %34

6:                                                ; preds = %4
  %7 = sext i32 %.010 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 32
  br i1 %13, label %14, label %31

14:                                               ; preds = %6
  %15 = sext i32 %.010 to i64
  %16 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %15
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [3 x i8], ptr %16, i64 0, i64 %17
  store i8 79, ptr %18, align 1
  %19 = load i32, ptr @moves, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr @moves, align 4
  %21 = call i32 @minimax(i8 noundef signext 88)
  %22 = sext i32 %.010 to i64
  %23 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %22
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds [3 x i8], ptr %23, i64 0, i64 %24
  store i8 32, ptr %25, align 1
  %26 = load i32, ptr @moves, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr @moves, align 4
  %28 = icmp sgt i32 %21, %.17
  br i1 %28, label %29, label %30

29:                                               ; preds = %14
  br label %30

30:                                               ; preds = %29, %14
  %.28 = phi i32 [ %21, %29 ], [ %.17, %14 ]
  %.24 = phi i32 [ %.0, %29 ], [ %.13, %14 ]
  %.2 = phi i32 [ %.010, %29 ], [ %.1, %14 ]
  br label %31

31:                                               ; preds = %30, %6
  %.39 = phi i32 [ %.28, %30 ], [ %.17, %6 ]
  %.35 = phi i32 [ %.24, %30 ], [ %.13, %6 ]
  %.3 = phi i32 [ %.2, %30 ], [ %.1, %6 ]
  br label %32

32:                                               ; preds = %31
  %33 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !18

34:                                               ; preds = %4
  br label %35

35:                                               ; preds = %34
  %36 = add nsw i32 %.010, 1
  br label %1, !llvm.loop !19

37:                                               ; preds = %1
  %38 = sext i32 %.01 to i64
  %39 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %38
  %40 = sext i32 %.02 to i64
  %41 = getelementptr inbounds [3 x i8], ptr %39, i64 0, i64 %40
  store i8 79, ptr %41, align 1
  %42 = load i32, ptr @moves, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr @moves, align 4
  ret i32 undef
}

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
!19 = distinct !{!19, !7}
