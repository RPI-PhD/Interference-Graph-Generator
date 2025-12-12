; ModuleID = 'DATASETv2/gpt35-8446.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x [3 x i8]], align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [20 x i8], align 16
  %9 = alloca [20 x i8], align 16
  %10 = alloca [20 x i8], align 16
  %11 = alloca [14 x i8], align 1
  %12 = alloca [9 x i8], align 1
  %13 = alloca [13 x i8], align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.board, i64 9, i1 false)
  store i32 2, ptr %3, align 4
  store i32 2, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %11, ptr align 1 @__const.main.guiltySuspect, i64 14, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %12, ptr align 1 @__const.main.guiltyWeapon, i64 9, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %13, ptr align 1 @__const.main.guiltyLocation, i64 13, i1 false)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 1, ptr %14, align 4
  br label %22

22:                                               ; preds = %0, %57
  %23 = load i32, ptr %14, align 4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %23)
  %25 = call i32 @rollDice()
  store i32 %25, ptr %15, align 4
  %26 = load i32, ptr %15, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %26)
  %28 = getelementptr inbounds [3 x [3 x i8]], ptr %2, i64 0, i64 0
  %29 = load i32, ptr %15, align 4
  %30 = getelementptr inbounds [20 x i8], ptr %8, i64 0, i64 0
  %31 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %32 = getelementptr inbounds [20 x i8], ptr %10, i64 0, i64 0
  call void @movePlayer(ptr noundef %28, ptr noundef %3, ptr noundef %4, i32 noundef %29, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %30, ptr noundef %31, ptr noundef %32)
  %33 = load i32, ptr %5, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %57

35:                                               ; preds = %22
  %36 = load i32, ptr %6, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %57

38:                                               ; preds = %35
  %39 = load i32, ptr %7, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %57

41:                                               ; preds = %38
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %43 = getelementptr inbounds [20 x i8], ptr %8, i64 0, i64 0
  %44 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %45 = getelementptr inbounds [20 x i8], ptr %10, i64 0, i64 0
  %46 = getelementptr inbounds [14 x i8], ptr %11, i64 0, i64 0
  %47 = getelementptr inbounds [9 x i8], ptr %12, i64 0, i64 0
  %48 = getelementptr inbounds [13 x i8], ptr %13, i64 0, i64 0
  %49 = call i32 @accuse(ptr noundef %43, ptr noundef %44, ptr noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef %48)
  store i32 %49, ptr %16, align 4
  %50 = load i32, ptr %16, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %41
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  ret i32 0

54:                                               ; preds = %41
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %56

56:                                               ; preds = %54
  br label %57

57:                                               ; preds = %56, %38, %35, %22
  %58 = load i32, ptr %14, align 4
  %59 = icmp eq i32 %58, 1
  %60 = zext i1 %59 to i64
  %61 = select i1 %59, i32 2, i32 1
  store i32 %61, ptr %14, align 4
  br label %22
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @movePlayer(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, ptr noundef %8, ptr noundef %9) #0 {
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  store ptr %0, ptr %11, align 8
  store ptr %1, ptr %12, align 8
  store ptr %2, ptr %13, align 8
  store i32 %3, ptr %14, align 4
  store ptr %4, ptr %15, align 8
  store ptr %5, ptr %16, align 8
  store ptr %6, ptr %17, align 8
  store ptr %7, ptr %18, align 8
  store ptr %8, ptr %19, align 8
  store ptr %9, ptr %20, align 8
  %24 = load ptr, ptr %12, align 8
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %21, align 4
  %26 = load ptr, ptr %13, align 8
  %27 = load i32, ptr %26, align 4
  store i32 %27, ptr %22, align 4
  %28 = load ptr, ptr %11, align 8
  %29 = load i32, ptr %21, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i8], ptr %28, i64 %30
  %32 = load i32, ptr %22, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [3 x i8], ptr %31, i64 0, i64 %33
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 71
  br i1 %37, label %38, label %40

38:                                               ; preds = %10
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %211

40:                                               ; preds = %10
  br label %41

41:                                               ; preds = %110, %40
  %42 = load i32, ptr %14, align 4
  %43 = icmp sgt i32 %42, 0
  br i1 %43, label %44, label %113

44:                                               ; preds = %41
  %45 = load i32, ptr %21, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %54

47:                                               ; preds = %44
  %48 = load i32, ptr %22, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %54

50:                                               ; preds = %47
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %52 = load i32, ptr %22, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %22, align 4
  br label %110

54:                                               ; preds = %47, %44
  %55 = load i32, ptr %21, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %64

57:                                               ; preds = %54
  %58 = load i32, ptr %22, align 4
  %59 = icmp eq i32 %58, 2
  br i1 %59, label %60, label %64

60:                                               ; preds = %57
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %62 = load i32, ptr %22, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, ptr %22, align 4
  br label %109

64:                                               ; preds = %57, %54
  %65 = load i32, ptr %21, align 4
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %67, label %74

67:                                               ; preds = %64
  %68 = load i32, ptr %22, align 4
  %69 = icmp eq i32 %68, 2
  br i1 %69, label %70, label %74

70:                                               ; preds = %67
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %72 = load i32, ptr %21, align 4
  %73 = add nsw i32 %72, -1
  store i32 %73, ptr %21, align 4
  br label %108

74:                                               ; preds = %67, %64
  %75 = load i32, ptr %21, align 4
  %76 = icmp eq i32 %75, 1
  br i1 %76, label %77, label %84

77:                                               ; preds = %74
  %78 = load i32, ptr %22, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %84

80:                                               ; preds = %77
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %82 = load i32, ptr %21, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %21, align 4
  br label %107

84:                                               ; preds = %77, %74
  %85 = load i32, ptr %21, align 4
  %86 = srem i32 %85, 2
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %84
  %89 = load i32, ptr %22, align 4
  %90 = sub nsw i32 %89, 1
  br label %94

91:                                               ; preds = %84
  %92 = load i32, ptr %22, align 4
  %93 = add nsw i32 %92, 1
  br label %94

94:                                               ; preds = %91, %88
  %95 = phi i32 [ %90, %88 ], [ %93, %91 ]
  store i32 %95, ptr %22, align 4
  %96 = load i32, ptr %21, align 4
  %97 = srem i32 %96, 2
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %102

99:                                               ; preds = %94
  %100 = load i32, ptr %21, align 4
  %101 = sub nsw i32 %100, 1
  br label %105

102:                                              ; preds = %94
  %103 = load i32, ptr %21, align 4
  %104 = add nsw i32 %103, 1
  br label %105

105:                                              ; preds = %102, %99
  %106 = phi i32 [ %101, %99 ], [ %104, %102 ]
  store i32 %106, ptr %21, align 4
  br label %107

107:                                              ; preds = %105, %80
  br label %108

108:                                              ; preds = %107, %70
  br label %109

109:                                              ; preds = %108, %60
  br label %110

110:                                              ; preds = %109, %50
  %111 = load i32, ptr %14, align 4
  %112 = add nsw i32 %111, -1
  store i32 %112, ptr %14, align 4
  br label %41, !llvm.loop !6

113:                                              ; preds = %41
  %114 = load i32, ptr %21, align 4
  %115 = load ptr, ptr %12, align 8
  store i32 %114, ptr %115, align 4
  %116 = load i32, ptr %22, align 4
  %117 = load ptr, ptr %13, align 8
  store i32 %116, ptr %117, align 4
  %118 = load ptr, ptr %11, align 8
  %119 = load i32, ptr %21, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [3 x i8], ptr %118, i64 %120
  %122 = load i32, ptr %22, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [3 x i8], ptr %121, i64 0, i64 %123
  %125 = load i8, ptr %124, align 1
  %126 = sext i8 %125 to i32
  %127 = icmp ne i32 %126, 32
  br i1 %127, label %128, label %211

128:                                              ; preds = %113
  %129 = load ptr, ptr %11, align 8
  %130 = load i32, ptr %21, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [3 x i8], ptr %129, i64 %131
  %133 = load i32, ptr %22, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [3 x i8], ptr %132, i64 0, i64 %134
  %136 = load i8, ptr %135, align 1
  %137 = sext i8 %136 to i32
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %137)
  %139 = load ptr, ptr %11, align 8
  %140 = load i32, ptr %21, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [3 x i8], ptr %139, i64 %141
  %143 = load i32, ptr %22, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [3 x i8], ptr %142, i64 0, i64 %144
  %146 = call i32 @searchRoom(ptr noundef %145)
  store i32 %146, ptr %23, align 4
  %147 = load i32, ptr %23, align 4
  %148 = icmp eq i32 %147, 1
  br i1 %148, label %149, label %201

149:                                              ; preds = %128
  %150 = load ptr, ptr %11, align 8
  %151 = load i32, ptr %21, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [3 x i8], ptr %150, i64 %152
  %154 = load i32, ptr %22, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [3 x i8], ptr %153, i64 0, i64 %155
  call void @printClue(ptr noundef %156)
  %157 = load ptr, ptr %11, align 8
  %158 = load i32, ptr %21, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [3 x i8], ptr %157, i64 %159
  %161 = load i32, ptr %22, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [3 x i8], ptr %160, i64 0, i64 %162
  %164 = call i32 @strcmp(ptr noundef %163, ptr noundef @.str.16) #5
  %165 = icmp eq i32 %164, 0
  br i1 %165, label %166, label %170

166:                                              ; preds = %149
  %167 = load ptr, ptr %17, align 8
  store i32 1, ptr %167, align 4
  %168 = load ptr, ptr %20, align 8
  %169 = call ptr @strcpy(ptr noundef %168, ptr noundef @.str.17) #6
  br label %200

170:                                              ; preds = %149
  %171 = load ptr, ptr %11, align 8
  %172 = load i32, ptr %21, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [3 x i8], ptr %171, i64 %173
  %175 = load i32, ptr %22, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [3 x i8], ptr %174, i64 0, i64 %176
  %178 = call i32 @strcmp(ptr noundef %177, ptr noundef @.str.18) #5
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %180, label %184

180:                                              ; preds = %170
  %181 = load ptr, ptr %16, align 8
  store i32 1, ptr %181, align 4
  %182 = load ptr, ptr %19, align 8
  %183 = call ptr @strcpy(ptr noundef %182, ptr noundef @.str.19) #6
  br label %199

184:                                              ; preds = %170
  %185 = load ptr, ptr %11, align 8
  %186 = load i32, ptr %21, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [3 x i8], ptr %185, i64 %187
  %189 = load i32, ptr %22, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [3 x i8], ptr %188, i64 0, i64 %190
  %192 = call i32 @strcmp(ptr noundef %191, ptr noundef @.str.20) #5
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %198

194:                                              ; preds = %184
  %195 = load ptr, ptr %15, align 8
  store i32 1, ptr %195, align 4
  %196 = load ptr, ptr %18, align 8
  %197 = call ptr @strcpy(ptr noundef %196, ptr noundef @.str.21) #6
  br label %198

198:                                              ; preds = %194, %184
  br label %199

199:                                              ; preds = %198, %180
  br label %200

200:                                              ; preds = %199, %166
  br label %210

201:                                              ; preds = %128
  %202 = load i32, ptr %23, align 4
  %203 = icmp eq i32 %202, 2
  br i1 %203, label %204, label %209

204:                                              ; preds = %201
  %205 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %206 = load ptr, ptr %15, align 8
  store i32 1, ptr %206, align 4
  %207 = load ptr, ptr %18, align 8
  %208 = call ptr @strcpy(ptr noundef %207, ptr noundef @.str.21) #6
  br label %209

209:                                              ; preds = %204, %201
  br label %210

210:                                              ; preds = %209, %200
  br label %211

211:                                              ; preds = %38, %210, %113
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @accuse(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %11, align 8
  %16 = call i32 @strcmp(ptr noundef %14, ptr noundef %15) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %29

18:                                               ; preds = %6
  %19 = load ptr, ptr %9, align 8
  %20 = load ptr, ptr %12, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %18
  %24 = load ptr, ptr %10, align 8
  %25 = load ptr, ptr %13, align 8
  %26 = call i32 @strcmp(ptr noundef %24, ptr noundef %25) #5
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %23
  store i32 1, ptr %7, align 4
  br label %30

29:                                               ; preds = %23, %18, %6
  store i32 0, ptr %7, align 4
  br label %30

30:                                               ; preds = %29, %28
  %31 = load i32, ptr %7, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printBoard(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i32 0, ptr %7, align 4
  br label %10

10:                                               ; preds = %36, %3
  %11 = load i32, ptr %7, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %39

14:                                               ; preds = %10
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %31, %14
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %34

20:                                               ; preds = %16
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x i8], ptr %21, i64 %23
  %25 = load i32, ptr %8, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [3 x i8], ptr %24, i64 0, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %29)
  br label %31

31:                                               ; preds = %20
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %8, align 4
  br label %16, !llvm.loop !8

34:                                               ; preds = %16
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %36

36:                                               ; preds = %34
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %7, align 4
  br label %10, !llvm.loop !9

39:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @searchRoom(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %5 = call i64 @time(ptr noundef null) #6
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #6
  %7 = call i32 @rand() #6
  %8 = srem i32 %7, 3
  store i32 %8, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %1
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  store i32 0, ptr %2, align 4
  br label %18

13:                                               ; preds = %1
  %14 = load i32, ptr %4, align 4
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 1, ptr %2, align 4
  br label %18

17:                                               ; preds = %13
  store i32 2, ptr %2, align 4
  br label %18

18:                                               ; preds = %17, %16, %11
  %19 = load i32, ptr %2, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printClue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @strcmp(ptr noundef %3, ptr noundef @.str.24) #5
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %43

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str.26) #5
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  br label %42

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 @strcmp(ptr noundef %15, ptr noundef @.str.28) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %14
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %41

20:                                               ; preds = %14
  %21 = load ptr, ptr %2, align 8
  %22 = call i32 @strcmp(ptr noundef %21, ptr noundef @.str.30) #5
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %20
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  br label %40

26:                                               ; preds = %20
  %27 = load ptr, ptr %2, align 8
  %28 = call i32 @strcmp(ptr noundef %27, ptr noundef @.str.32) #5
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %26
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  br label %39

32:                                               ; preds = %26
  %33 = load ptr, ptr %2, align 8
  %34 = call i32 @strcmp(ptr noundef %33, ptr noundef @.str.16) #5
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %32
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.34)
  br label %38

38:                                               ; preds = %36, %32
  br label %39

39:                                               ; preds = %38, %30
  br label %40

40:                                               ; preds = %39, %24
  br label %41

41:                                               ; preds = %40, %18
  br label %42

42:                                               ; preds = %41, %12
  br label %43

43:                                               ; preds = %42, %6
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
