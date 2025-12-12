; ModuleID = 'DATASETv2/gpt35-23922.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %6

6:                                                ; preds = %0, %32
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = call i32 @getchar()
  %9 = trunc i32 %8 to i8
  store i8 %9, ptr %2, align 1
  %10 = load ptr, ptr @stdin, align 8
  %11 = call i32 @fflush(ptr noundef %10)
  %12 = load i8, ptr %2, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 88
  br i1 %14, label %19, label %15

15:                                               ; preds = %6
  %16 = load i8, ptr %2, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 120
  br i1 %18, label %19, label %20

19:                                               ; preds = %15, %6
  store i8 88, ptr @human, align 1
  store i8 79, ptr @computer, align 1
  br label %33

20:                                               ; preds = %15
  %21 = load i8, ptr %2, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 79
  br i1 %23, label %28, label %24

24:                                               ; preds = %20
  %25 = load i8, ptr %2, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 111
  br i1 %27, label %28, label %29

28:                                               ; preds = %24, %20
  store i8 79, ptr @human, align 1
  store i8 88, ptr @computer, align 1
  br label %33

29:                                               ; preds = %24
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %31

31:                                               ; preds = %29
  br label %32

32:                                               ; preds = %31
  br label %6

33:                                               ; preds = %28, %19
  call void @init_board()
  call void @print_board()
  br label %34

34:                                               ; preds = %33, %76
  %35 = load i8, ptr @human, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 88
  br i1 %37, label %38, label %57

38:                                               ; preds = %34
  call void @human_move()
  %39 = load i8, ptr @human, align 1
  %40 = call zeroext i1 @check_win(i8 noundef signext %39)
  br i1 %40, label %41, label %43

41:                                               ; preds = %38
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %77

43:                                               ; preds = %38
  %44 = call zeroext i1 @is_full()
  br i1 %44, label %45, label %47

45:                                               ; preds = %43
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %77

47:                                               ; preds = %43
  call void @computer_move()
  %48 = load i8, ptr @computer, align 1
  %49 = call zeroext i1 @check_win(i8 noundef signext %48)
  br i1 %49, label %50, label %52

50:                                               ; preds = %47
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %77

52:                                               ; preds = %47
  %53 = call zeroext i1 @is_full()
  br i1 %53, label %54, label %56

54:                                               ; preds = %52
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %77

56:                                               ; preds = %52
  br label %76

57:                                               ; preds = %34
  call void @computer_move()
  %58 = load i8, ptr @computer, align 1
  %59 = call zeroext i1 @check_win(i8 noundef signext %58)
  br i1 %59, label %60, label %62

60:                                               ; preds = %57
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %77

62:                                               ; preds = %57
  %63 = call zeroext i1 @is_full()
  br i1 %63, label %64, label %66

64:                                               ; preds = %62
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %77

66:                                               ; preds = %62
  call void @human_move()
  %67 = load i8, ptr @human, align 1
  %68 = call zeroext i1 @check_win(i8 noundef signext %67)
  br i1 %68, label %69, label %71

69:                                               ; preds = %66
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %77

71:                                               ; preds = %66
  %72 = call zeroext i1 @is_full()
  br i1 %72, label %73, label %75

73:                                               ; preds = %71
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %77

75:                                               ; preds = %71
  br label %76

76:                                               ; preds = %75, %56
  br label %34

77:                                               ; preds = %73, %69, %64, %60, %54, %50, %45, %41
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @getchar() #2

declare i32 @fflush(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @check_win(i8 noundef signext %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  %4 = load i8, ptr @board, align 1
  %5 = sext i8 %4 to i32
  %6 = load i8, ptr %3, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32 %5, %7
  br i1 %8, label %9, label %22

9:                                                ; preds = %1
  %10 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 1), align 1
  %11 = sext i8 %10 to i32
  %12 = load i8, ptr %3, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %11, %13
  br i1 %14, label %15, label %22

15:                                               ; preds = %9
  %16 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %17 = sext i8 %16 to i32
  %18 = load i8, ptr %3, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %17, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %15
  store i1 true, ptr %2, align 1
  br label %156

22:                                               ; preds = %15, %9, %1
  %23 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), align 1
  %24 = sext i8 %23 to i32
  %25 = load i8, ptr %3, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %24, %26
  br i1 %27, label %28, label %41

28:                                               ; preds = %22
  %29 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %30 = sext i8 %29 to i32
  %31 = load i8, ptr %3, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %30, %32
  br i1 %33, label %34, label %41

34:                                               ; preds = %28
  %35 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 2), align 1
  %36 = sext i8 %35 to i32
  %37 = load i8, ptr %3, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %36, %38
  br i1 %39, label %40, label %41

40:                                               ; preds = %34
  store i1 true, ptr %2, align 1
  br label %156

41:                                               ; preds = %34, %28, %22
  %42 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %43 = sext i8 %42 to i32
  %44 = load i8, ptr %3, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %43, %45
  br i1 %46, label %47, label %60

47:                                               ; preds = %41
  %48 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 1), align 1
  %49 = sext i8 %48 to i32
  %50 = load i8, ptr %3, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %49, %51
  br i1 %52, label %53, label %60

53:                                               ; preds = %47
  %54 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %55 = sext i8 %54 to i32
  %56 = load i8, ptr %3, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp eq i32 %55, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %53
  store i1 true, ptr %2, align 1
  br label %156

60:                                               ; preds = %53, %47, %41
  %61 = load i8, ptr @board, align 1
  %62 = sext i8 %61 to i32
  %63 = load i8, ptr %3, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp eq i32 %62, %64
  br i1 %65, label %66, label %79

66:                                               ; preds = %60
  %67 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), align 1
  %68 = sext i8 %67 to i32
  %69 = load i8, ptr %3, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp eq i32 %68, %70
  br i1 %71, label %72, label %79

72:                                               ; preds = %66
  %73 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %74 = sext i8 %73 to i32
  %75 = load i8, ptr %3, align 1
  %76 = sext i8 %75 to i32
  %77 = icmp eq i32 %74, %76
  br i1 %77, label %78, label %79

78:                                               ; preds = %72
  store i1 true, ptr %2, align 1
  br label %156

79:                                               ; preds = %72, %66, %60
  %80 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 1), align 1
  %81 = sext i8 %80 to i32
  %82 = load i8, ptr %3, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp eq i32 %81, %83
  br i1 %84, label %85, label %98

85:                                               ; preds = %79
  %86 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %87 = sext i8 %86 to i32
  %88 = load i8, ptr %3, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp eq i32 %87, %89
  br i1 %90, label %91, label %98

91:                                               ; preds = %85
  %92 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 1), align 1
  %93 = sext i8 %92 to i32
  %94 = load i8, ptr %3, align 1
  %95 = sext i8 %94 to i32
  %96 = icmp eq i32 %93, %95
  br i1 %96, label %97, label %98

97:                                               ; preds = %91
  store i1 true, ptr %2, align 1
  br label %156

98:                                               ; preds = %91, %85, %79
  %99 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %100 = sext i8 %99 to i32
  %101 = load i8, ptr %3, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp eq i32 %100, %102
  br i1 %103, label %104, label %117

104:                                              ; preds = %98
  %105 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 2), align 1
  %106 = sext i8 %105 to i32
  %107 = load i8, ptr %3, align 1
  %108 = sext i8 %107 to i32
  %109 = icmp eq i32 %106, %108
  br i1 %109, label %110, label %117

110:                                              ; preds = %104
  %111 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %112 = sext i8 %111 to i32
  %113 = load i8, ptr %3, align 1
  %114 = sext i8 %113 to i32
  %115 = icmp eq i32 %112, %114
  br i1 %115, label %116, label %117

116:                                              ; preds = %110
  store i1 true, ptr %2, align 1
  br label %156

117:                                              ; preds = %110, %104, %98
  %118 = load i8, ptr @board, align 1
  %119 = sext i8 %118 to i32
  %120 = load i8, ptr %3, align 1
  %121 = sext i8 %120 to i32
  %122 = icmp eq i32 %119, %121
  br i1 %122, label %123, label %136

123:                                              ; preds = %117
  %124 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %125 = sext i8 %124 to i32
  %126 = load i8, ptr %3, align 1
  %127 = sext i8 %126 to i32
  %128 = icmp eq i32 %125, %127
  br i1 %128, label %129, label %136

129:                                              ; preds = %123
  %130 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %131 = sext i8 %130 to i32
  %132 = load i8, ptr %3, align 1
  %133 = sext i8 %132 to i32
  %134 = icmp eq i32 %131, %133
  br i1 %134, label %135, label %136

135:                                              ; preds = %129
  store i1 true, ptr %2, align 1
  br label %156

136:                                              ; preds = %129, %123, %117
  %137 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %138 = sext i8 %137 to i32
  %139 = load i8, ptr %3, align 1
  %140 = sext i8 %139 to i32
  %141 = icmp eq i32 %138, %140
  br i1 %141, label %142, label %155

142:                                              ; preds = %136
  %143 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %144 = sext i8 %143 to i32
  %145 = load i8, ptr %3, align 1
  %146 = sext i8 %145 to i32
  %147 = icmp eq i32 %144, %146
  br i1 %147, label %148, label %155

148:                                              ; preds = %142
  %149 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %150 = sext i8 %149 to i32
  %151 = load i8, ptr %3, align 1
  %152 = sext i8 %151 to i32
  %153 = icmp eq i32 %150, %152
  br i1 %153, label %154, label %155

154:                                              ; preds = %148
  store i1 true, ptr %2, align 1
  br label %156

155:                                              ; preds = %148, %142, %136
  store i1 false, ptr %2, align 1
  br label %156

156:                                              ; preds = %155, %154, %135, %116, %97, %78, %59, %40, %21
  %157 = load i1, ptr %2, align 1
  ret i1 %157
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %21, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %24

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %17, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %20

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %12
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x i8], ptr %13, i64 0, i64 %15
  store i8 45, ptr %16, align 1
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %2, align 4
  br label %7, !llvm.loop !6

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %1, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %1, align 4
  br label %3, !llvm.loop !8

24:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %25, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %28

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %20, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %23

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %12
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x i8], ptr %13, i64 0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %18)
  br label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %2, align 4
  br label %7, !llvm.loop !9

23:                                               ; preds = %7
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %25

25:                                               ; preds = %23
  %26 = load i32, ptr %1, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %1, align 4
  br label %3, !llvm.loop !10

28:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @is_valid_move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %17, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp sge i32 %9, 3
  br i1 %10, label %17, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = icmp sge i32 %15, 3
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %11, %8, %2
  store i1 false, ptr %3, align 1
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
  store i1 false, ptr %3, align 1
  br label %30

29:                                               ; preds = %18
  store i1 true, ptr %3, align 1
  br label %30

30:                                               ; preds = %29, %28, %17
  %31 = load i1, ptr %3, align 1
  ret i1 %31
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @human_move() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %0, %25
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @computer_move() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  store i32 0, ptr %1, align 4
  br label %8

8:                                                ; preds = %42, %0
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %45

11:                                               ; preds = %8
  store i32 0, ptr %2, align 4
  br label %12

12:                                               ; preds = %38, %11
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 3
  br i1 %14, label %15, label %41

15:                                               ; preds = %12
  %16 = load i32, ptr %1, align 4
  %17 = load i32, ptr %2, align 4
  %18 = call zeroext i1 @is_valid_move(i32 noundef %16, i32 noundef %17)
  br i1 %18, label %19, label %37

19:                                               ; preds = %15
  %20 = load i8, ptr @computer, align 1
  %21 = load i32, ptr %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %22
  %24 = load i32, ptr %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [3 x i8], ptr %23, i64 0, i64 %25
  store i8 %20, ptr %26, align 1
  %27 = load i8, ptr @computer, align 1
  %28 = call zeroext i1 @check_win(i8 noundef signext %27)
  br i1 %28, label %29, label %30

29:                                               ; preds = %19
  call void @print_board()
  br label %108

30:                                               ; preds = %19
  %31 = load i32, ptr %1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %32
  %34 = load i32, ptr %2, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [3 x i8], ptr %33, i64 0, i64 %35
  store i8 45, ptr %36, align 1
  br label %37

37:                                               ; preds = %30, %15
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %2, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %2, align 4
  br label %12, !llvm.loop !11

41:                                               ; preds = %12
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %1, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %1, align 4
  br label %8, !llvm.loop !12

45:                                               ; preds = %8
  store i32 0, ptr %3, align 4
  br label %46

46:                                               ; preds = %87, %45
  %47 = load i32, ptr %3, align 4
  %48 = icmp slt i32 %47, 3
  br i1 %48, label %49, label %90

49:                                               ; preds = %46
  store i32 0, ptr %4, align 4
  br label %50

50:                                               ; preds = %83, %49
  %51 = load i32, ptr %4, align 4
  %52 = icmp slt i32 %51, 3
  br i1 %52, label %53, label %86

53:                                               ; preds = %50
  %54 = load i32, ptr %3, align 4
  %55 = load i32, ptr %4, align 4
  %56 = call zeroext i1 @is_valid_move(i32 noundef %54, i32 noundef %55)
  br i1 %56, label %57, label %82

57:                                               ; preds = %53
  %58 = load i8, ptr @human, align 1
  %59 = load i32, ptr %3, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %60
  %62 = load i32, ptr %4, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [3 x i8], ptr %61, i64 0, i64 %63
  store i8 %58, ptr %64, align 1
  %65 = load i8, ptr @human, align 1
  %66 = call zeroext i1 @check_win(i8 noundef signext %65)
  br i1 %66, label %67, label %75

67:                                               ; preds = %57
  %68 = load i8, ptr @computer, align 1
  %69 = load i32, ptr %3, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %70
  %72 = load i32, ptr %4, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [3 x i8], ptr %71, i64 0, i64 %73
  store i8 %68, ptr %74, align 1
  call void @print_board()
  br label %108

75:                                               ; preds = %57
  %76 = load i32, ptr %3, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %77
  %79 = load i32, ptr %4, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [3 x i8], ptr %78, i64 0, i64 %80
  store i8 45, ptr %81, align 1
  br label %82

82:                                               ; preds = %75, %53
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %4, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %4, align 4
  br label %50, !llvm.loop !13

86:                                               ; preds = %50
  br label %87

87:                                               ; preds = %86
  %88 = load i32, ptr %3, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %3, align 4
  br label %46, !llvm.loop !14

90:                                               ; preds = %46
  br label %91

91:                                               ; preds = %90, %107
  %92 = call i32 @rand() #3
  %93 = srem i32 %92, 3
  store i32 %93, ptr %5, align 4
  %94 = call i32 @rand() #3
  %95 = srem i32 %94, 3
  store i32 %95, ptr %6, align 4
  %96 = load i32, ptr %5, align 4
  %97 = load i32, ptr %6, align 4
  %98 = call zeroext i1 @is_valid_move(i32 noundef %96, i32 noundef %97)
  br i1 %98, label %99, label %107

99:                                               ; preds = %91
  %100 = load i8, ptr @computer, align 1
  %101 = load i32, ptr %5, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %102
  %104 = load i32, ptr %6, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [3 x i8], ptr %103, i64 0, i64 %105
  store i8 %100, ptr %106, align 1
  call void @print_board()
  br label %108

107:                                              ; preds = %91
  br label %91

108:                                              ; preds = %99, %67, %29
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @is_full() #0 {
  %1 = alloca i1, align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %27, %0
  %5 = load i32, ptr %2, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %30

7:                                                ; preds = %4
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %23, %7
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 3
  br i1 %10, label %11, label %26

11:                                               ; preds = %8
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %13
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x i8], ptr %14, i64 0, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 45
  br i1 %20, label %21, label %22

21:                                               ; preds = %11
  store i1 false, ptr %1, align 1
  br label %31

22:                                               ; preds = %11
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %8, !llvm.loop !15

26:                                               ; preds = %8
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %2, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %2, align 4
  br label %4, !llvm.loop !16

30:                                               ; preds = %4
  store i1 true, ptr %1, align 1
  br label %31

31:                                               ; preds = %30, %21
  %32 = load i1, ptr %1, align 1
  ret i1 %32
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
