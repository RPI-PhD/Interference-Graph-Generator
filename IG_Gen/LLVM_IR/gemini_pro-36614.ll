; ModuleID = 'DATASETv2/gemini_pro-36614.c'
source_filename = "DATASETv2/gemini_pro-36614.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Position = type { i32, i32 }

@board = dso_local global [4 x [4 x i8]] zeroinitializer, align 16
@matched = dso_local global [4 x [4 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%2d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%2d\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"   \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c" %c \00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"You can't select the same position twice!\0A\00", align 1
@.str.7 = private unnamed_addr constant [38 x i8] c"You can't select a matched position!\0A\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"You selected %c at (%d, %d) and %c at (%d, %d)\0A\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"You found a match!\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"Sorry, no match!\0A\00", align 1
@.str.11 = private unnamed_addr constant [50 x i8] c"Enter the position of the first card (row, col): \00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.13 = private unnamed_addr constant [51 x i8] c"Enter the position of the second card (row, col): \00", align 1
@.str.14 = private unnamed_addr constant [55 x i8] c"Congratulations! You found all the pairs in %d moves.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = call i64 @time(ptr noundef null) #3
  %8 = trunc i64 %7 to i32
  call void @srand(i32 noundef %8) #3
  store i32 0, ptr %1, align 4
  br label %9

9:                                                ; preds = %31, %0
  %10 = load i32, ptr %1, align 4
  %11 = icmp slt i32 %10, 4
  br i1 %11, label %12, label %34

12:                                               ; preds = %9
  store i32 0, ptr %2, align 4
  br label %13

13:                                               ; preds = %27, %12
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %14, 4
  br i1 %15, label %16, label %30

16:                                               ; preds = %13
  %17 = call i32 @rand() #3
  %18 = srem i32 %17, 8
  %19 = add nsw i32 %18, 1
  %20 = trunc i32 %19 to i8
  %21 = load i32, ptr %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %22
  %24 = load i32, ptr %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x i8], ptr %23, i64 0, i64 %25
  store i8 %20, ptr %26, align 1
  br label %27

27:                                               ; preds = %16
  %28 = load i32, ptr %2, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %2, align 4
  br label %13, !llvm.loop !6

30:                                               ; preds = %13
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %1, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %1, align 4
  br label %9, !llvm.loop !8

34:                                               ; preds = %9
  store i32 0, ptr %1, align 4
  br label %35

35:                                               ; preds = %78, %34
  %36 = load i32, ptr %1, align 4
  %37 = icmp slt i32 %36, 4
  br i1 %37, label %38, label %81

38:                                               ; preds = %35
  store i32 0, ptr %2, align 4
  br label %39

39:                                               ; preds = %74, %38
  %40 = load i32, ptr %2, align 4
  %41 = icmp slt i32 %40, 4
  br i1 %41, label %42, label %77

42:                                               ; preds = %39
  %43 = call i32 @rand() #3
  %44 = srem i32 %43, 4
  store i32 %44, ptr %4, align 4
  %45 = call i32 @rand() #3
  %46 = srem i32 %45, 4
  store i32 %46, ptr %5, align 4
  %47 = load i32, ptr %1, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %48
  %50 = load i32, ptr %2, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [4 x i8], ptr %49, i64 0, i64 %51
  %53 = load i8, ptr %52, align 1
  store i8 %53, ptr %6, align 1
  %54 = load i32, ptr %4, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %55
  %57 = load i32, ptr %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [4 x i8], ptr %56, i64 0, i64 %58
  %60 = load i8, ptr %59, align 1
  %61 = load i32, ptr %1, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %62
  %64 = load i32, ptr %2, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [4 x i8], ptr %63, i64 0, i64 %65
  store i8 %60, ptr %66, align 1
  %67 = load i8, ptr %6, align 1
  %68 = load i32, ptr %4, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %69
  %71 = load i32, ptr %5, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [4 x i8], ptr %70, i64 0, i64 %72
  store i8 %67, ptr %73, align 1
  br label %74

74:                                               ; preds = %42
  %75 = load i32, ptr %2, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %2, align 4
  br label %39, !llvm.loop !9

77:                                               ; preds = %39
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %1, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %1, align 4
  br label %35, !llvm.loop !10

81:                                               ; preds = %35
  store i32 0, ptr %1, align 4
  br label %82

82:                                               ; preds = %100, %81
  %83 = load i32, ptr %1, align 4
  %84 = icmp slt i32 %83, 4
  br i1 %84, label %85, label %103

85:                                               ; preds = %82
  store i32 0, ptr %2, align 4
  br label %86

86:                                               ; preds = %96, %85
  %87 = load i32, ptr %2, align 4
  %88 = icmp slt i32 %87, 4
  br i1 %88, label %89, label %99

89:                                               ; preds = %86
  %90 = load i32, ptr %1, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %91
  %93 = load i32, ptr %2, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [4 x i32], ptr %92, i64 0, i64 %94
  store i32 0, ptr %95, align 4
  br label %96

96:                                               ; preds = %89
  %97 = load i32, ptr %2, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %2, align 4
  br label %86, !llvm.loop !11

99:                                               ; preds = %86
  br label %100

100:                                              ; preds = %99
  %101 = load i32, ptr %1, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %1, align 4
  br label %82, !llvm.loop !12

103:                                              ; preds = %82
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %11, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %7, label %14

7:                                                ; preds = %4
  %8 = load i32, ptr %1, align 4
  %9 = add nsw i32 %8, 1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %9)
  br label %11

11:                                               ; preds = %7
  %12 = load i32, ptr %1, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %1, align 4
  br label %4, !llvm.loop !13

14:                                               ; preds = %4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %1, align 4
  br label %16

16:                                               ; preds = %53, %14
  %17 = load i32, ptr %1, align 4
  %18 = icmp slt i32 %17, 4
  br i1 %18, label %19, label %56

19:                                               ; preds = %16
  %20 = load i32, ptr %1, align 4
  %21 = add nsw i32 %20, 1
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %21)
  store i32 0, ptr %2, align 4
  br label %23

23:                                               ; preds = %48, %19
  %24 = load i32, ptr %2, align 4
  %25 = icmp slt i32 %24, 4
  br i1 %25, label %26, label %51

26:                                               ; preds = %23
  %27 = load i32, ptr %1, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %28
  %30 = load i32, ptr %2, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x i32], ptr %29, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %26
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %47

37:                                               ; preds = %26
  %38 = load i32, ptr %1, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %39
  %41 = load i32, ptr %2, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [4 x i8], ptr %40, i64 0, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %45)
  br label %47

47:                                               ; preds = %37, %35
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %2, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %2, align 4
  br label %23, !llvm.loop !14

51:                                               ; preds = %23
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %53

53:                                               ; preds = %51
  %54 = load i32, ptr %1, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %1, align 4
  br label %16, !llvm.loop !15

56:                                               ; preds = %16
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @make_move(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %struct.Position, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.Position, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = icmp eq i32 %8, %11
  br i1 %12, label %13, label %23

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.Position, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.Position, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = icmp eq i32 %16, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %13
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %3, align 4
  br label %142

23:                                               ; preds = %13, %2
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.Position, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %27
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.Position, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [4 x i32], ptr %28, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %49, label %36

36:                                               ; preds = %23
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds %struct.Position, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %40
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %struct.Position, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [4 x i32], ptr %41, i64 0, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %36, %23
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 0, ptr %3, align 4
  br label %142

51:                                               ; preds = %36
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds %struct.Position, ptr %52, i32 0, i32 0
  %54 = load i32, ptr %53, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %55
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.Position, ptr %57, i32 0, i32 1
  %59 = load i32, ptr %58, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [4 x i8], ptr %56, i64 0, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.Position, ptr %64, i32 0, i32 0
  %66 = load i32, ptr %65, align 4
  %67 = add nsw i32 %66, 1
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds %struct.Position, ptr %68, i32 0, i32 1
  %70 = load i32, ptr %69, align 4
  %71 = add nsw i32 %70, 1
  %72 = load ptr, ptr %5, align 8
  %73 = getelementptr inbounds %struct.Position, ptr %72, i32 0, i32 0
  %74 = load i32, ptr %73, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %75
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds %struct.Position, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [4 x i8], ptr %76, i64 0, i64 %80
  %82 = load i8, ptr %81, align 1
  %83 = sext i8 %82 to i32
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds %struct.Position, ptr %84, i32 0, i32 0
  %86 = load i32, ptr %85, align 4
  %87 = add nsw i32 %86, 1
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.Position, ptr %88, i32 0, i32 1
  %90 = load i32, ptr %89, align 4
  %91 = add nsw i32 %90, 1
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %63, i32 noundef %67, i32 noundef %71, i32 noundef %83, i32 noundef %87, i32 noundef %91)
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.Position, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %94, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %96
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds %struct.Position, ptr %98, i32 0, i32 1
  %100 = load i32, ptr %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [4 x i8], ptr %97, i64 0, i64 %101
  %103 = load i8, ptr %102, align 1
  %104 = sext i8 %103 to i32
  %105 = load ptr, ptr %5, align 8
  %106 = getelementptr inbounds %struct.Position, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %108
  %110 = load ptr, ptr %5, align 8
  %111 = getelementptr inbounds %struct.Position, ptr %110, i32 0, i32 1
  %112 = load i32, ptr %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [4 x i8], ptr %109, i64 0, i64 %113
  %115 = load i8, ptr %114, align 1
  %116 = sext i8 %115 to i32
  %117 = icmp eq i32 %104, %116
  br i1 %117, label %118, label %140

118:                                              ; preds = %51
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %120 = load ptr, ptr %4, align 8
  %121 = getelementptr inbounds %struct.Position, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %123
  %125 = load ptr, ptr %4, align 8
  %126 = getelementptr inbounds %struct.Position, ptr %125, i32 0, i32 1
  %127 = load i32, ptr %126, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [4 x i32], ptr %124, i64 0, i64 %128
  store i32 1, ptr %129, align 4
  %130 = load ptr, ptr %5, align 8
  %131 = getelementptr inbounds %struct.Position, ptr %130, i32 0, i32 0
  %132 = load i32, ptr %131, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %133
  %135 = load ptr, ptr %5, align 8
  %136 = getelementptr inbounds %struct.Position, ptr %135, i32 0, i32 1
  %137 = load i32, ptr %136, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [4 x i32], ptr %134, i64 0, i64 %138
  store i32 1, ptr %139, align 4
  store i32 1, ptr %3, align 4
  br label %142

140:                                              ; preds = %51
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i32 0, ptr %3, align 4
  br label %142

142:                                              ; preds = %140, %118, %49, %21
  %143 = load i32, ptr %3, align 4
  ret i32 %143
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.Position, align 4
  %5 = alloca %struct.Position, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  call void @init_board()
  br label %6

6:                                                ; preds = %35, %0
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 8
  br i1 %8, label %9, label %38

9:                                                ; preds = %6
  call void @print_board()
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %11 = getelementptr inbounds %struct.Position, ptr %4, i32 0, i32 0
  %12 = getelementptr inbounds %struct.Position, ptr %4, i32 0, i32 1
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %11, ptr noundef %12)
  %14 = getelementptr inbounds %struct.Position, ptr %4, i32 0, i32 0
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, ptr %14, align 4
  %17 = getelementptr inbounds %struct.Position, ptr %4, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, ptr %17, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %21 = getelementptr inbounds %struct.Position, ptr %5, i32 0, i32 0
  %22 = getelementptr inbounds %struct.Position, ptr %5, i32 0, i32 1
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %21, ptr noundef %22)
  %24 = getelementptr inbounds %struct.Position, ptr %5, i32 0, i32 0
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, ptr %24, align 4
  %27 = getelementptr inbounds %struct.Position, ptr %5, i32 0, i32 1
  %28 = load i32, ptr %27, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, ptr %27, align 4
  %30 = call i32 @make_move(ptr noundef %4, ptr noundef %5)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %35

32:                                               ; preds = %9
  %33 = load i32, ptr %3, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %3, align 4
  br label %35

35:                                               ; preds = %32, %9
  %36 = load i32, ptr %2, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %2, align 4
  br label %6, !llvm.loop !16

38:                                               ; preds = %6
  %39 = load i32, ptr %2, align 4
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %39)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

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
