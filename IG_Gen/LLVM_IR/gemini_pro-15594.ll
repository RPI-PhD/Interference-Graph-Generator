; ModuleID = 'DATASETv2/gemini_pro-15594.c'
source_filename = "DATASETv2/gemini_pro-15594.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bingo_card = type { [5 x [5 x i32]], [5 x [5 x i32]] }

@.str = private unnamed_addr constant [18 x i8] c"Card %d has won!\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"No winners!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_card(ptr dead_on_unwind noalias writable sret(%struct.bingo_card) align 4 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %6

6:                                                ; preds = %32, %1
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %35

9:                                                ; preds = %6
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %28, %9
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 0
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [5 x [5 x i32]], ptr %14, i64 0, i64 %16
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [5 x i32], ptr %17, i64 0, i64 %19
  store i32 0, ptr %20, align 4
  %21 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [5 x [5 x i32]], ptr %21, i64 0, i64 %23
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [5 x i32], ptr %24, i64 0, i64 %26
  store i32 0, ptr %27, align 4
  br label %28

28:                                               ; preds = %13
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %3, align 4
  br label %10, !llvm.loop !6

31:                                               ; preds = %10
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %2, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %2, align 4
  br label %6, !llvm.loop !8

35:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %36

36:                                               ; preds = %58, %35
  %37 = load i32, ptr %4, align 4
  %38 = icmp slt i32 %37, 5
  br i1 %38, label %39, label %61

39:                                               ; preds = %36
  store i32 0, ptr %5, align 4
  br label %40

40:                                               ; preds = %54, %39
  %41 = load i32, ptr %5, align 4
  %42 = icmp slt i32 %41, 5
  br i1 %42, label %43, label %57

43:                                               ; preds = %40
  %44 = call i32 @rand() #4
  %45 = srem i32 %44, 75
  %46 = add nsw i32 1, %45
  %47 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 0
  %48 = load i32, ptr %4, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [5 x [5 x i32]], ptr %47, i64 0, i64 %49
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [5 x i32], ptr %50, i64 0, i64 %52
  store i32 %46, ptr %53, align 4
  br label %54

54:                                               ; preds = %43
  %55 = load i32, ptr %5, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %5, align 4
  br label %40, !llvm.loop !9

57:                                               ; preds = %40
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %4, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %4, align 4
  br label %36, !llvm.loop !10

61:                                               ; preds = %36
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @mark_number(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %40, %2
  %8 = load i32, ptr %5, align 4
  %9 = icmp slt i32 %8, 5
  br i1 %9, label %10, label %43

10:                                               ; preds = %7
  store i32 0, ptr %6, align 4
  br label %11

11:                                               ; preds = %36, %10
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %14, label %39

14:                                               ; preds = %11
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.bingo_card, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [5 x [5 x i32]], ptr %16, i64 0, i64 %18
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [5 x i32], ptr %19, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %4, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %35

26:                                               ; preds = %14
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.bingo_card, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [5 x [5 x i32]], ptr %28, i64 0, i64 %30
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [5 x i32], ptr %31, i64 0, i64 %33
  store i32 1, ptr %34, align 4
  br label %35

35:                                               ; preds = %26, %14
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %11, !llvm.loop !11

39:                                               ; preds = %11
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %5, align 4
  br label %7, !llvm.loop !12

43:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @check_for_win(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %14

14:                                               ; preds = %44, %1
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 5
  br i1 %16, label %17, label %47

17:                                               ; preds = %14
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %18

18:                                               ; preds = %36, %17
  %19 = load i32, ptr %6, align 4
  %20 = icmp slt i32 %19, 5
  br i1 %20, label %21, label %39

21:                                               ; preds = %18
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.bingo_card, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [5 x [5 x i32]], ptr %23, i64 0, i64 %25
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [5 x i32], ptr %26, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %35

32:                                               ; preds = %21
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %35

35:                                               ; preds = %32, %21
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %18, !llvm.loop !13

39:                                               ; preds = %18
  %40 = load i32, ptr %5, align 4
  %41 = icmp eq i32 %40, 5
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  store i32 1, ptr %2, align 4
  br label %135

43:                                               ; preds = %39
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %4, align 4
  br label %14, !llvm.loop !14

47:                                               ; preds = %14
  store i32 0, ptr %7, align 4
  br label %48

48:                                               ; preds = %78, %47
  %49 = load i32, ptr %7, align 4
  %50 = icmp slt i32 %49, 5
  br i1 %50, label %51, label %81

51:                                               ; preds = %48
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %70, %51
  %53 = load i32, ptr %9, align 4
  %54 = icmp slt i32 %53, 5
  br i1 %54, label %55, label %73

55:                                               ; preds = %52
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds %struct.bingo_card, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [5 x [5 x i32]], ptr %57, i64 0, i64 %59
  %61 = load i32, ptr %7, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [5 x i32], ptr %60, i64 0, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %69

66:                                               ; preds = %55
  %67 = load i32, ptr %8, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %8, align 4
  br label %69

69:                                               ; preds = %66, %55
  br label %70

70:                                               ; preds = %69
  %71 = load i32, ptr %9, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %9, align 4
  br label %52, !llvm.loop !15

73:                                               ; preds = %52
  %74 = load i32, ptr %8, align 4
  %75 = icmp eq i32 %74, 5
  br i1 %75, label %76, label %77

76:                                               ; preds = %73
  store i32 1, ptr %2, align 4
  br label %135

77:                                               ; preds = %73
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %7, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %7, align 4
  br label %48, !llvm.loop !16

81:                                               ; preds = %48
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %82

82:                                               ; preds = %100, %81
  %83 = load i32, ptr %11, align 4
  %84 = icmp slt i32 %83, 5
  br i1 %84, label %85, label %103

85:                                               ; preds = %82
  %86 = load ptr, ptr %3, align 8
  %87 = getelementptr inbounds %struct.bingo_card, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %11, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [5 x [5 x i32]], ptr %87, i64 0, i64 %89
  %91 = load i32, ptr %11, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [5 x i32], ptr %90, i64 0, i64 %92
  %94 = load i32, ptr %93, align 4
  %95 = icmp eq i32 %94, 1
  br i1 %95, label %96, label %99

96:                                               ; preds = %85
  %97 = load i32, ptr %10, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %10, align 4
  br label %99

99:                                               ; preds = %96, %85
  br label %100

100:                                              ; preds = %99
  %101 = load i32, ptr %11, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %11, align 4
  br label %82, !llvm.loop !17

103:                                              ; preds = %82
  %104 = load i32, ptr %10, align 4
  %105 = icmp eq i32 %104, 5
  br i1 %105, label %106, label %107

106:                                              ; preds = %103
  store i32 1, ptr %2, align 4
  br label %135

107:                                              ; preds = %103
  store i32 0, ptr %12, align 4
  store i32 0, ptr %13, align 4
  br label %108

108:                                              ; preds = %127, %107
  %109 = load i32, ptr %13, align 4
  %110 = icmp slt i32 %109, 5
  br i1 %110, label %111, label %130

111:                                              ; preds = %108
  %112 = load ptr, ptr %3, align 8
  %113 = getelementptr inbounds %struct.bingo_card, ptr %112, i32 0, i32 1
  %114 = load i32, ptr %13, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [5 x [5 x i32]], ptr %113, i64 0, i64 %115
  %117 = load i32, ptr %13, align 4
  %118 = sub nsw i32 4, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [5 x i32], ptr %116, i64 0, i64 %119
  %121 = load i32, ptr %120, align 4
  %122 = icmp eq i32 %121, 1
  br i1 %122, label %123, label %126

123:                                              ; preds = %111
  %124 = load i32, ptr %12, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %12, align 4
  br label %126

126:                                              ; preds = %123, %111
  br label %127

127:                                              ; preds = %126
  %128 = load i32, ptr %13, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %13, align 4
  br label %108, !llvm.loop !18

130:                                              ; preds = %108
  %131 = load i32, ptr %12, align 4
  %132 = icmp eq i32 %131, 5
  br i1 %132, label %133, label %134

133:                                              ; preds = %130
  store i32 1, ptr %2, align 4
  br label %135

134:                                              ; preds = %130
  store i32 0, ptr %2, align 4
  br label %135

135:                                              ; preds = %134, %133, %106, %76, %42
  %136 = load i32, ptr %2, align 4
  ret i32 %136
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @play_bingo() #0 {
  %1 = alloca [10 x %struct.bingo_card], align 16
  %2 = alloca i32, align 4
  %3 = alloca %struct.bingo_card, align 4
  %4 = alloca [75 x i32], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %15

15:                                               ; preds = %22, %0
  %16 = load i32, ptr %2, align 4
  %17 = icmp slt i32 %16, 10
  br i1 %17, label %18, label %25

18:                                               ; preds = %15
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %20
  call void @generate_card(ptr dead_on_unwind writable sret(%struct.bingo_card) align 4 %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %21, ptr align 4 %3, i64 200, i1 false)
  br label %22

22:                                               ; preds = %18
  %23 = load i32, ptr %2, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %2, align 4
  br label %15, !llvm.loop !19

25:                                               ; preds = %15
  store i32 0, ptr %5, align 4
  br label %26

26:                                               ; preds = %35, %25
  %27 = load i32, ptr %5, align 4
  %28 = icmp slt i32 %27, 75
  br i1 %28, label %29, label %38

29:                                               ; preds = %26
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 1, %30
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [75 x i32], ptr %4, i64 0, i64 %33
  store i32 %31, ptr %34, align 4
  br label %35

35:                                               ; preds = %29
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %5, align 4
  br label %26, !llvm.loop !20

38:                                               ; preds = %26
  store i32 0, ptr %6, align 4
  br label %39

39:                                               ; preds = %60, %38
  %40 = load i32, ptr %6, align 4
  %41 = icmp slt i32 %40, 75
  br i1 %41, label %42, label %63

42:                                               ; preds = %39
  %43 = call i32 @rand() #4
  %44 = srem i32 %43, 75
  store i32 %44, ptr %7, align 4
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [75 x i32], ptr %4, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  store i32 %48, ptr %8, align 4
  %49 = load i32, ptr %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [75 x i32], ptr %4, i64 0, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = load i32, ptr %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [75 x i32], ptr %4, i64 0, i64 %54
  store i32 %52, ptr %55, align 4
  %56 = load i32, ptr %8, align 4
  %57 = load i32, ptr %7, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [75 x i32], ptr %4, i64 0, i64 %58
  store i32 %56, ptr %59, align 4
  br label %60

60:                                               ; preds = %42
  %61 = load i32, ptr %6, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %6, align 4
  br label %39, !llvm.loop !21

63:                                               ; preds = %39
  store i32 0, ptr %9, align 4
  br label %64

64:                                               ; preds = %132, %63
  %65 = load i32, ptr %9, align 4
  %66 = icmp slt i32 %65, 75
  br i1 %66, label %67, label %133

67:                                               ; preds = %64
  %68 = load i32, ptr %9, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [75 x i32], ptr %4, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  store i32 %71, ptr %10, align 4
  %72 = load i32, ptr %9, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %9, align 4
  store i32 0, ptr %11, align 4
  br label %74

74:                                               ; preds = %82, %67
  %75 = load i32, ptr %11, align 4
  %76 = icmp slt i32 %75, 10
  br i1 %76, label %77, label %85

77:                                               ; preds = %74
  %78 = load i32, ptr %11, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %79
  %81 = load i32, ptr %10, align 4
  call void @mark_number(ptr noundef %80, i32 noundef %81)
  br label %82

82:                                               ; preds = %77
  %83 = load i32, ptr %11, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %11, align 4
  br label %74, !llvm.loop !22

85:                                               ; preds = %74
  store i32 0, ptr %12, align 4
  br label %86

86:                                               ; preds = %129, %85
  %87 = load i32, ptr %12, align 4
  %88 = icmp slt i32 %87, 10
  br i1 %88, label %89, label %132

89:                                               ; preds = %86
  %90 = load i32, ptr %12, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %91
  %93 = call i32 @check_for_win(ptr noundef %92)
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %128

95:                                               ; preds = %89
  %96 = load i32, ptr %12, align 4
  %97 = add nsw i32 %96, 1
  %98 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %97)
  store i32 0, ptr %13, align 4
  br label %99

99:                                               ; preds = %124, %95
  %100 = load i32, ptr %13, align 4
  %101 = icmp slt i32 %100, 5
  br i1 %101, label %102, label %127

102:                                              ; preds = %99
  store i32 0, ptr %14, align 4
  br label %103

103:                                              ; preds = %119, %102
  %104 = load i32, ptr %14, align 4
  %105 = icmp slt i32 %104, 5
  br i1 %105, label %106, label %122

106:                                              ; preds = %103
  %107 = load i32, ptr %12, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %108
  %110 = getelementptr inbounds %struct.bingo_card, ptr %109, i32 0, i32 0
  %111 = load i32, ptr %13, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [5 x [5 x i32]], ptr %110, i64 0, i64 %112
  %114 = load i32, ptr %14, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [5 x i32], ptr %113, i64 0, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %117)
  br label %119

119:                                              ; preds = %106
  %120 = load i32, ptr %14, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, ptr %14, align 4
  br label %103, !llvm.loop !23

122:                                              ; preds = %103
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %124

124:                                              ; preds = %122
  %125 = load i32, ptr %13, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, ptr %13, align 4
  br label %99, !llvm.loop !24

127:                                              ; preds = %99
  br label %135

128:                                              ; preds = %89
  br label %129

129:                                              ; preds = %128
  %130 = load i32, ptr %12, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %12, align 4
  br label %86, !llvm.loop !25

132:                                              ; preds = %86
  br label %64, !llvm.loop !26

133:                                              ; preds = %64
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %135

135:                                              ; preds = %133, %127
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i64 @time(ptr noundef null) #4
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #4
  call void @play_bingo()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
