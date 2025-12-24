; ModuleID = 'LLVM_IR/gpt35-8446.ll'
source_filename = "DATASETv2/gpt35-8446.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.board = private unnamed_addr constant [3 x [3 x i8]] [[3 x i8] c"HGF", [3 x i8] c"EDC", [3 x i8] c"BA "], align 1
@__const.main.guiltySuspect = private unnamed_addr constant [14 x i8] c"Colonel Moran\00", align 1
@__const.main.guiltyWeapon = private unnamed_addr constant [9 x i8] c"Revolver\00", align 1
@__const.main.guiltyLocation = private unnamed_addr constant [13 x i8] c"Baker Street\00", align 1
@.str = private unnamed_addr constant [49 x i8] c"Welcome to Sherlock Holmes Murder Mystery Game!\0A\00", align 1
@.str.1 = private unnamed_addr constant [130 x i8] c"The game begins with a murder mystery. Your task is to solve the case by finding the suspect, weapon and location of the murder.\0A\00", align 1
@.str.2 = private unnamed_addr constant [88 x i8] c"You are going to roll a dice and move through rooms to gather clues and find suspects.\0A\00", align 1
@.str.3 = private unnamed_addr constant [93 x i8] c"Be careful, there are some traps on the board, if you land on them you will miss your turn.\0A\00", align 1
@.str.4 = private unnamed_addr constant [118 x i8] c"The first player who finds all three pieces of the puzzle and makes a correct accusation wins the game. Let's start!\0A\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"\0A\0APlayer %d's turn.\0A\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"You rolled a %d.\0A\00", align 1
@.str.7 = private unnamed_addr constant [61 x i8] c"You have found all three clues. Time to make an accusation!\0A\00", align 1
@.str.8 = private unnamed_addr constant [71 x i8] c"Congratulations! You have solved the murder mystery and won the game!\0A\00", align 1
@.str.9 = private unnamed_addr constant [56 x i8] c"Your accusation is incorrect! You are out of the game.\0A\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"\0A -------------------------------------\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"|\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"\09%c\09|\00", align 1
@.str.13 = private unnamed_addr constant [43 x i8] c"Oh no! You landed on a trap. Miss a turn.\0A\00", align 1
@.str.14 = private unnamed_addr constant [49 x i8] c"You have reached the end of the board. Go back.\0A\00", align 1
@.str.15 = private unnamed_addr constant [29 x i8] c"You have landed on room %c!\0A\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"H\00", align 1
@.str.17 = private unnamed_addr constant [13 x i8] c"Baker Street\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"Revolver\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"Colonel Moran\00", align 1
@.str.22 = private unnamed_addr constant [47 x i8] c"You have found a suspect! It's Colonel Moran!\0A\00", align 1
@.str.23 = private unnamed_addr constant [39 x i8] c"You didn't find anything in the room.\0A\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.25 = private unnamed_addr constant [39 x i8] c"You found a picture of Colonel Moran.\0A\00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.27 = private unnamed_addr constant [62 x i8] c"You found a letter from Moriarty talking about Baker Street.\0A\00", align 1
@.str.28 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.29 = private unnamed_addr constant [44 x i8] c"You found a bullet casing from a revolver.\0A\00", align 1
@.str.30 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.31 = private unnamed_addr constant [49 x i8] c"You found a note with 'Revolver' written on it.\0A\00", align 1
@.str.32 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.33 = private unnamed_addr constant [38 x i8] c"You found a picture of Baker Street.\0A\00", align 1
@.str.34 = private unnamed_addr constant [56 x i8] c"You found a map of the city with Baker Street circled.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [3 x [3 x i8]], align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [20 x i8], align 16
  %8 = alloca [20 x i8], align 16
  %9 = alloca [20 x i8], align 16
  %10 = alloca [14 x i8], align 1
  %11 = alloca [9 x i8], align 1
  %12 = alloca [13 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.main.board, i64 9, i1 false)
  store i32 2, ptr %2, align 4
  store i32 2, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %10, ptr align 1 @__const.main.guiltySuspect, i64 14, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %11, ptr align 1 @__const.main.guiltyWeapon, i64 9, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 1 @__const.main.guiltyLocation, i64 13, i1 false)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %18

18:                                               ; preds = %49, %0
  %.0 = phi i32 [ 1, %0 ], [ %52, %49 ]
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.0)
  %20 = call i32 @rollDice()
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %20)
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr %1, i64 0, i64 0
  %23 = getelementptr inbounds [20 x i8], ptr %7, i64 0, i64 0
  %24 = getelementptr inbounds [20 x i8], ptr %8, i64 0, i64 0
  %25 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  call void @movePlayer(ptr noundef %22, ptr noundef %2, ptr noundef %3, i32 noundef %20, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %23, ptr noundef %24, ptr noundef %25)
  %26 = load i32, ptr %4, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %49

28:                                               ; preds = %18
  %29 = load i32, ptr %5, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %49

31:                                               ; preds = %28
  %32 = load i32, ptr %6, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %49

34:                                               ; preds = %31
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %36 = getelementptr inbounds [20 x i8], ptr %7, i64 0, i64 0
  %37 = getelementptr inbounds [20 x i8], ptr %8, i64 0, i64 0
  %38 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %39 = getelementptr inbounds [14 x i8], ptr %10, i64 0, i64 0
  %40 = getelementptr inbounds [9 x i8], ptr %11, i64 0, i64 0
  %41 = getelementptr inbounds [13 x i8], ptr %12, i64 0, i64 0
  %42 = call i32 @accuse(ptr noundef %36, ptr noundef %37, ptr noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %46

44:                                               ; preds = %34
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret i32 0

46:                                               ; preds = %34
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %48

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %48, %31, %28, %18
  %50 = icmp eq i32 %.0, 1
  %51 = zext i1 %50 to i64
  %52 = select i1 %50, i32 2, i32 1
  br label %18
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @movePlayer(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8, ptr noundef %9) #0 {
  %11 = load i32, ptr %1, align 4
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds [3 x i8], ptr %0, i64 %13
  %15 = sext i32 %12 to i64
  %16 = getelementptr inbounds [3 x i8], ptr %14, i64 0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 71
  br i1 %19, label %20, label %22

20:                                               ; preds = %10
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %138

22:                                               ; preds = %10
  br label %23

23:                                               ; preds = %73, %22
  %.06 = phi i32 [ %3, %22 ], [ %74, %73 ]
  %.01 = phi i32 [ %11, %22 ], [ %.45, %73 ]
  %.0 = phi i32 [ %12, %22 ], [ %.4, %73 ]
  %24 = icmp sgt i32 %.06, 0
  br i1 %24, label %25, label %75

25:                                               ; preds = %23
  %26 = icmp eq i32 %.01, 0
  br i1 %26, label %27, label %32

27:                                               ; preds = %25
  %28 = icmp eq i32 %.0, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %27
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %31 = add nsw i32 %.0, 1
  br label %73

32:                                               ; preds = %27, %25
  %33 = icmp eq i32 %.01, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %32
  %35 = icmp eq i32 %.0, 2
  br i1 %35, label %36, label %39

36:                                               ; preds = %34
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %38 = add nsw i32 %.0, -1
  br label %72

39:                                               ; preds = %34, %32
  %40 = icmp eq i32 %.01, 1
  br i1 %40, label %41, label %46

41:                                               ; preds = %39
  %42 = icmp eq i32 %.0, 2
  br i1 %42, label %43, label %46

43:                                               ; preds = %41
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %45 = add nsw i32 %.01, -1
  br label %71

46:                                               ; preds = %41, %39
  %47 = icmp eq i32 %.01, 1
  br i1 %47, label %48, label %53

48:                                               ; preds = %46
  %49 = icmp eq i32 %.0, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %48
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %52 = add nsw i32 %.01, 1
  br label %70

53:                                               ; preds = %48, %46
  %54 = srem i32 %.01, 2
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %58

56:                                               ; preds = %53
  %57 = sub nsw i32 %.0, 1
  br label %60

58:                                               ; preds = %53
  %59 = add nsw i32 %.0, 1
  br label %60

60:                                               ; preds = %58, %56
  %61 = phi i32 [ %57, %56 ], [ %59, %58 ]
  %62 = srem i32 %.01, 2
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

64:                                               ; preds = %60
  %65 = sub nsw i32 %.01, 1
  br label %68

66:                                               ; preds = %60
  %67 = add nsw i32 %.01, 1
  br label %68

68:                                               ; preds = %66, %64
  %69 = phi i32 [ %65, %64 ], [ %67, %66 ]
  br label %70

70:                                               ; preds = %68, %50
  %.12 = phi i32 [ %52, %50 ], [ %69, %68 ]
  %.1 = phi i32 [ %.0, %50 ], [ %61, %68 ]
  br label %71

71:                                               ; preds = %70, %43
  %.23 = phi i32 [ %45, %43 ], [ %.12, %70 ]
  %.2 = phi i32 [ %.0, %43 ], [ %.1, %70 ]
  br label %72

72:                                               ; preds = %71, %36
  %.34 = phi i32 [ %.01, %36 ], [ %.23, %71 ]
  %.3 = phi i32 [ %38, %36 ], [ %.2, %71 ]
  br label %73

73:                                               ; preds = %72, %29
  %.45 = phi i32 [ %.01, %29 ], [ %.34, %72 ]
  %.4 = phi i32 [ %31, %29 ], [ %.3, %72 ]
  %74 = add nsw i32 %.06, -1
  br label %23, !llvm.loop !6

75:                                               ; preds = %23
  store i32 %.01, ptr %1, align 4
  store i32 %.0, ptr %2, align 4
  %76 = sext i32 %.01 to i64
  %77 = getelementptr inbounds [3 x i8], ptr %0, i64 %76
  %78 = sext i32 %.0 to i64
  %79 = getelementptr inbounds [3 x i8], ptr %77, i64 0, i64 %78
  %80 = load i8, ptr %79, align 1
  %81 = sext i8 %80 to i32
  %82 = icmp ne i32 %81, 32
  br i1 %82, label %83, label %138

83:                                               ; preds = %75
  %84 = sext i32 %.01 to i64
  %85 = getelementptr inbounds [3 x i8], ptr %0, i64 %84
  %86 = sext i32 %.0 to i64
  %87 = getelementptr inbounds [3 x i8], ptr %85, i64 0, i64 %86
  %88 = load i8, ptr %87, align 1
  %89 = sext i8 %88 to i32
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %89)
  %91 = sext i32 %.01 to i64
  %92 = getelementptr inbounds [3 x i8], ptr %0, i64 %91
  %93 = sext i32 %.0 to i64
  %94 = getelementptr inbounds [3 x i8], ptr %92, i64 0, i64 %93
  %95 = call i32 @searchRoom(ptr noundef %94)
  %96 = icmp eq i32 %95, 1
  br i1 %96, label %97, label %131

97:                                               ; preds = %83
  %98 = sext i32 %.01 to i64
  %99 = getelementptr inbounds [3 x i8], ptr %0, i64 %98
  %100 = sext i32 %.0 to i64
  %101 = getelementptr inbounds [3 x i8], ptr %99, i64 0, i64 %100
  call void @printClue(ptr noundef %101)
  %102 = sext i32 %.01 to i64
  %103 = getelementptr inbounds [3 x i8], ptr %0, i64 %102
  %104 = sext i32 %.0 to i64
  %105 = getelementptr inbounds [3 x i8], ptr %103, i64 0, i64 %104
  %106 = call i32 @strcmp(ptr noundef %105, ptr noundef @.str.16) #5
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %110

108:                                              ; preds = %97
  store i32 1, ptr %6, align 4
  %109 = call ptr @strcpy(ptr noundef %9, ptr noundef @.str.17) #6
  br label %130

110:                                              ; preds = %97
  %111 = sext i32 %.01 to i64
  %112 = getelementptr inbounds [3 x i8], ptr %0, i64 %111
  %113 = sext i32 %.0 to i64
  %114 = getelementptr inbounds [3 x i8], ptr %112, i64 0, i64 %113
  %115 = call i32 @strcmp(ptr noundef %114, ptr noundef @.str.18) #5
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %119

117:                                              ; preds = %110
  store i32 1, ptr %5, align 4
  %118 = call ptr @strcpy(ptr noundef %8, ptr noundef @.str.19) #6
  br label %129

119:                                              ; preds = %110
  %120 = sext i32 %.01 to i64
  %121 = getelementptr inbounds [3 x i8], ptr %0, i64 %120
  %122 = sext i32 %.0 to i64
  %123 = getelementptr inbounds [3 x i8], ptr %121, i64 0, i64 %122
  %124 = call i32 @strcmp(ptr noundef %123, ptr noundef @.str.20) #5
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %128

126:                                              ; preds = %119
  store i32 1, ptr %4, align 4
  %127 = call ptr @strcpy(ptr noundef %7, ptr noundef @.str.21) #6
  br label %128

128:                                              ; preds = %126, %119
  br label %129

129:                                              ; preds = %128, %117
  br label %130

130:                                              ; preds = %129, %108
  br label %137

131:                                              ; preds = %83
  %132 = icmp eq i32 %95, 2
  br i1 %132, label %133, label %136

133:                                              ; preds = %131
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  store i32 1, ptr %4, align 4
  %135 = call ptr @strcpy(ptr noundef %7, ptr noundef @.str.21) #6
  br label %136

136:                                              ; preds = %133, %131
  br label %137

137:                                              ; preds = %136, %130
  br label %138

138:                                              ; preds = %137, %75, %20
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @accuse(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = call i32 @strcmp(ptr noundef %0, ptr noundef %3) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = call i32 @strcmp(ptr noundef %1, ptr noundef %4) #5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = call i32 @strcmp(ptr noundef %2, ptr noundef %5) #5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  br label %17

16:                                               ; preds = %12, %9, %6
  br label %17

17:                                               ; preds = %16, %15
  %.0 = phi i32 [ 1, %15 ], [ 0, %16 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printBoard(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %5

5:                                                ; preds = %23, %3
  %.01 = phi i32 [ 0, %3 ], [ %24, %23 ]
  %6 = icmp slt i32 %.01, %1
  br i1 %6, label %7, label %25

7:                                                ; preds = %5
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %9

9:                                                ; preds = %19, %7
  %.0 = phi i32 [ 0, %7 ], [ %20, %19 ]
  %10 = icmp slt i32 %.0, %2
  br i1 %10, label %11, label %21

11:                                               ; preds = %9
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [3 x i8], ptr %0, i64 %12
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [3 x i8], ptr %13, i64 0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %17)
  br label %19

19:                                               ; preds = %11
  %20 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !8

21:                                               ; preds = %9
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %23

23:                                               ; preds = %21
  %24 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !9

25:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @rollDice() #0 {
  %1 = call i64 @time(ptr noundef null) #6
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #6
  %3 = call i32 @rand() #6
  %4 = srem i32 %3, 6
  %5 = add nsw i32 %4, 1
  ret i32 %5
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @searchRoom(ptr noundef %0) #0 {
  %2 = call i64 @time(ptr noundef null) #6
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #6
  %4 = call i32 @rand() #6
  %5 = srem i32 %4, 3
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %13

9:                                                ; preds = %1
  %10 = icmp eq i32 %5, 1
  br i1 %10, label %11, label %12

11:                                               ; preds = %9
  br label %13

12:                                               ; preds = %9
  br label %13

13:                                               ; preds = %12, %11, %7
  %.0 = phi i32 [ 0, %7 ], [ 1, %11 ], [ 2, %12 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printClue(ptr noundef %0) #0 {
  %2 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.24) #5
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %36

6:                                                ; preds = %1
  %7 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.26) #5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  br label %35

11:                                               ; preds = %6
  %12 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.28) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %34

16:                                               ; preds = %11
  %17 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.30) #5
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  br label %33

21:                                               ; preds = %16
  %22 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.32) #5
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %21
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  br label %32

26:                                               ; preds = %21
  %27 = call i32 @strcmp(ptr noundef %0, ptr noundef @.str.16) #5
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  br label %31

31:                                               ; preds = %29, %26
  br label %32

32:                                               ; preds = %31, %24
  br label %33

33:                                               ; preds = %32, %19
  br label %34

34:                                               ; preds = %33, %14
  br label %35

35:                                               ; preds = %34, %9
  br label %36

36:                                               ; preds = %35, %4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind }

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
