; ModuleID = 'LLVM_IR/gemini_pro-16026.ll'
source_filename = "DATASETv2/gemini_pro-16026.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Game = type { [42 x %struct.Move], i32 }
%struct.Move = type { i32, i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Player has won!\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"Tie game.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @new_game() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 508) #5
  %2 = getelementptr inbounds %struct.Game, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 4
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_game(ptr noundef %0) #0 {
  call void @free(ptr noundef %0) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_move(ptr noundef %0, i64 %1, i32 %2) #0 {
  %4 = alloca %struct.Move, align 4
  %5 = alloca { i64, i32 }, align 4
  %6 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 0
  store i64 %1, ptr %6, align 4
  %7 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 1
  store i32 %2, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %5, i64 12, i1 false)
  %8 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %9 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [42 x %struct.Move], ptr %8, i64 0, i64 %11
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 4 %4, i64 12, i1 false)
  %13 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %13, align 4
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_valid_move(ptr noundef %0, i64 %1, i32 %2) #0 {
  %4 = alloca %struct.Move, align 4
  %5 = alloca { i64, i32 }, align 4
  %6 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 0
  store i64 %1, ptr %6, align 4
  %7 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 1
  store i32 %2, ptr %7, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %5, i64 12, i1 false)
  %8 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %15, label %11

11:                                               ; preds = %3
  %12 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 0
  %13 = load i32, ptr %12, align 4
  %14 = icmp sge i32 %13, 6
  br i1 %14, label %15, label %16

15:                                               ; preds = %11, %3
  br label %48

16:                                               ; preds = %11
  %17 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %24, label %20

20:                                               ; preds = %16
  %21 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = icmp sge i32 %22, 7
  br i1 %23, label %24, label %25

24:                                               ; preds = %20, %16
  br label %48

25:                                               ; preds = %20
  %26 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 2
  %27 = load i32, ptr %26, align 4
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %33, label %29

29:                                               ; preds = %25
  %30 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 2
  %31 = load i32, ptr %30, align 4
  %32 = icmp sge i32 %31, 6
  br i1 %32, label %33, label %34

33:                                               ; preds = %29, %25
  br label %48

34:                                               ; preds = %29
  %35 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %36 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [42 x %struct.Move], ptr %35, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.Move, ptr %40, i32 0, i32 0
  %42 = load i32, ptr %41, align 4
  %43 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 0
  %44 = load i32, ptr %43, align 4
  %45 = icmp ne i32 %42, %44
  br i1 %45, label %46, label %47

46:                                               ; preds = %34
  br label %48

47:                                               ; preds = %34
  br label %48

48:                                               ; preds = %47, %46, %33, %24, %15
  %.0 = phi i32 [ 0, %15 ], [ 0, %24 ], [ 0, %33 ], [ 0, %46 ], [ 1, %47 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_game_over(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 1
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, 42
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %7

6:                                                ; preds = %1
  br label %7

7:                                                ; preds = %6, %5
  %.0 = phi i32 [ 1, %5 ], [ 0, %6 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @has_won(ptr noundef %0) #0 {
  %2 = alloca %struct.Move, align 4
  br label %3

3:                                                ; preds = %204, %1
  %.02 = phi i32 [ 0, %1 ], [ %205, %204 ]
  %4 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.02, %5
  br i1 %6, label %7, label %206

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds [42 x %struct.Move], ptr %8, i64 0, i64 %9
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %10, i64 12, i1 false)
  %11 = getelementptr inbounds %struct.Move, ptr %2, i32 0, i32 0
  %12 = load i32, ptr %11, align 4
  %13 = getelementptr inbounds %struct.Move, ptr %2, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = getelementptr inbounds %struct.Move, ptr %2, i32 0, i32 2
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %14, 1
  br label %18

18:                                               ; preds = %32, %7
  %.07 = phi i32 [ %17, %7 ], [ %33, %32 ]
  %.06 = phi i32 [ 1, %7 ], [ %29, %32 ]
  %19 = icmp slt i32 %.07, 7
  br i1 %19, label %20, label %34

20:                                               ; preds = %18
  %21 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %22 = add nsw i32 %.02, %.07
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [42 x %struct.Move], ptr %21, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Move, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 4
  %27 = icmp eq i32 %26, %16
  br i1 %27, label %28, label %30

28:                                               ; preds = %20
  %29 = add nsw i32 %.06, 1
  br label %31

30:                                               ; preds = %20
  br label %34

31:                                               ; preds = %28
  br label %32

32:                                               ; preds = %31
  %33 = add nsw i32 %.07, 1
  br label %18, !llvm.loop !6

34:                                               ; preds = %30, %18
  %35 = sub nsw i32 %14, 1
  br label %36

36:                                               ; preds = %50, %34
  %.08 = phi i32 [ %35, %34 ], [ %51, %50 ]
  %.1 = phi i32 [ %.06, %34 ], [ %47, %50 ]
  %37 = icmp sge i32 %.08, 0
  br i1 %37, label %38, label %52

38:                                               ; preds = %36
  %39 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %40 = add nsw i32 %.02, %.08
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [42 x %struct.Move], ptr %39, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.Move, ptr %42, i32 0, i32 2
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %44, %16
  br i1 %45, label %46, label %48

46:                                               ; preds = %38
  %47 = add nsw i32 %.1, 1
  br label %49

48:                                               ; preds = %38
  br label %52

49:                                               ; preds = %46
  br label %50

50:                                               ; preds = %49
  %51 = add nsw i32 %.08, -1
  br label %36, !llvm.loop !8

52:                                               ; preds = %48, %36
  %53 = icmp sge i32 %.1, 3
  br i1 %53, label %54, label %55

54:                                               ; preds = %52
  br label %207

55:                                               ; preds = %52
  %56 = add nsw i32 %12, 1
  br label %57

57:                                               ; preds = %72, %55
  %.09 = phi i32 [ %56, %55 ], [ %73, %72 ]
  %.2 = phi i32 [ 1, %55 ], [ %69, %72 ]
  %58 = icmp slt i32 %.09, 6
  br i1 %58, label %59, label %74

59:                                               ; preds = %57
  %60 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %61 = mul nsw i32 %.09, 7
  %62 = add nsw i32 %.02, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [42 x %struct.Move], ptr %60, i64 0, i64 %63
  %65 = getelementptr inbounds %struct.Move, ptr %64, i32 0, i32 2
  %66 = load i32, ptr %65, align 4
  %67 = icmp eq i32 %66, %16
  br i1 %67, label %68, label %70

68:                                               ; preds = %59
  %69 = add nsw i32 %.2, 1
  br label %71

70:                                               ; preds = %59
  br label %74

71:                                               ; preds = %68
  br label %72

72:                                               ; preds = %71
  %73 = add nsw i32 %.09, 1
  br label %57, !llvm.loop !9

74:                                               ; preds = %70, %57
  %75 = icmp sge i32 %.2, 3
  br i1 %75, label %76, label %77

76:                                               ; preds = %74
  br label %207

77:                                               ; preds = %74
  %78 = sub nsw i32 %12, 1
  br label %79

79:                                               ; preds = %94, %77
  %.010 = phi i32 [ %78, %77 ], [ %95, %94 ]
  %.3 = phi i32 [ 1, %77 ], [ %91, %94 ]
  %80 = icmp sge i32 %.010, 0
  br i1 %80, label %81, label %96

81:                                               ; preds = %79
  %82 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %83 = mul nsw i32 %.010, 7
  %84 = add nsw i32 %.02, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [42 x %struct.Move], ptr %82, i64 0, i64 %85
  %87 = getelementptr inbounds %struct.Move, ptr %86, i32 0, i32 2
  %88 = load i32, ptr %87, align 4
  %89 = icmp eq i32 %88, %16
  br i1 %89, label %90, label %92

90:                                               ; preds = %81
  %91 = add nsw i32 %.3, 1
  br label %93

92:                                               ; preds = %81
  br label %96

93:                                               ; preds = %90
  br label %94

94:                                               ; preds = %93
  %95 = add nsw i32 %.010, -1
  br label %79, !llvm.loop !10

96:                                               ; preds = %92, %79
  %97 = icmp sge i32 %.3, 3
  br i1 %97, label %98, label %99

98:                                               ; preds = %96
  br label %207

99:                                               ; preds = %96
  br label %100

100:                                              ; preds = %120, %99
  %.4 = phi i32 [ 1, %99 ], [ %117, %120 ]
  %.05 = phi i32 [ 1, %99 ], [ %121, %120 ]
  %101 = icmp slt i32 %.05, 6
  br i1 %101, label %102, label %104

102:                                              ; preds = %100
  %103 = icmp slt i32 %.05, 7
  br label %104

104:                                              ; preds = %102, %100
  %105 = phi i1 [ false, %100 ], [ %103, %102 ]
  br i1 %105, label %106, label %122

106:                                              ; preds = %104
  %107 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %108 = mul nsw i32 %.05, 7
  %109 = add nsw i32 %.02, %108
  %110 = add nsw i32 %109, %.05
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [42 x %struct.Move], ptr %107, i64 0, i64 %111
  %113 = getelementptr inbounds %struct.Move, ptr %112, i32 0, i32 2
  %114 = load i32, ptr %113, align 4
  %115 = icmp eq i32 %114, %16
  br i1 %115, label %116, label %118

116:                                              ; preds = %106
  %117 = add nsw i32 %.4, 1
  br label %119

118:                                              ; preds = %106
  br label %122

119:                                              ; preds = %116
  br label %120

120:                                              ; preds = %119
  %121 = add nsw i32 %.05, 1
  br label %100, !llvm.loop !11

122:                                              ; preds = %118, %104
  %123 = icmp sge i32 %.4, 3
  br i1 %123, label %124, label %125

124:                                              ; preds = %122
  br label %207

125:                                              ; preds = %122
  br label %126

126:                                              ; preds = %146, %125
  %.5 = phi i32 [ 1, %125 ], [ %143, %146 ]
  %.04 = phi i32 [ 1, %125 ], [ %147, %146 ]
  %127 = icmp slt i32 %.04, 6
  br i1 %127, label %128, label %130

128:                                              ; preds = %126
  %129 = icmp slt i32 %.04, 7
  br label %130

130:                                              ; preds = %128, %126
  %131 = phi i1 [ false, %126 ], [ %129, %128 ]
  br i1 %131, label %132, label %148

132:                                              ; preds = %130
  %133 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %134 = mul nsw i32 %.04, 7
  %135 = add nsw i32 %.02, %134
  %136 = sub nsw i32 %135, %.04
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [42 x %struct.Move], ptr %133, i64 0, i64 %137
  %139 = getelementptr inbounds %struct.Move, ptr %138, i32 0, i32 2
  %140 = load i32, ptr %139, align 4
  %141 = icmp eq i32 %140, %16
  br i1 %141, label %142, label %144

142:                                              ; preds = %132
  %143 = add nsw i32 %.5, 1
  br label %145

144:                                              ; preds = %132
  br label %148

145:                                              ; preds = %142
  br label %146

146:                                              ; preds = %145
  %147 = add nsw i32 %.04, 1
  br label %126, !llvm.loop !12

148:                                              ; preds = %144, %130
  %149 = icmp sge i32 %.5, 3
  br i1 %149, label %150, label %151

150:                                              ; preds = %148
  br label %207

151:                                              ; preds = %148
  br label %152

152:                                              ; preds = %172, %151
  %.6 = phi i32 [ 1, %151 ], [ %169, %172 ]
  %.03 = phi i32 [ -1, %151 ], [ %173, %172 ]
  %153 = icmp sge i32 %.03, -6
  br i1 %153, label %154, label %156

154:                                              ; preds = %152
  %155 = icmp sge i32 %.03, -7
  br label %156

156:                                              ; preds = %154, %152
  %157 = phi i1 [ false, %152 ], [ %155, %154 ]
  br i1 %157, label %158, label %174

158:                                              ; preds = %156
  %159 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %160 = mul nsw i32 %.03, 7
  %161 = add nsw i32 %.02, %160
  %162 = add nsw i32 %161, %.03
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [42 x %struct.Move], ptr %159, i64 0, i64 %163
  %165 = getelementptr inbounds %struct.Move, ptr %164, i32 0, i32 2
  %166 = load i32, ptr %165, align 4
  %167 = icmp eq i32 %166, %16
  br i1 %167, label %168, label %170

168:                                              ; preds = %158
  %169 = add nsw i32 %.6, 1
  br label %171

170:                                              ; preds = %158
  br label %174

171:                                              ; preds = %168
  br label %172

172:                                              ; preds = %171
  %173 = add nsw i32 %.03, -1
  br label %152, !llvm.loop !13

174:                                              ; preds = %170, %156
  %175 = icmp sge i32 %.6, 3
  br i1 %175, label %176, label %177

176:                                              ; preds = %174
  br label %207

177:                                              ; preds = %174
  br label %178

178:                                              ; preds = %198, %177
  %.7 = phi i32 [ 1, %177 ], [ %195, %198 ]
  %.01 = phi i32 [ -1, %177 ], [ %199, %198 ]
  %179 = icmp sge i32 %.01, -6
  br i1 %179, label %180, label %182

180:                                              ; preds = %178
  %181 = icmp sge i32 %.01, -7
  br label %182

182:                                              ; preds = %180, %178
  %183 = phi i1 [ false, %178 ], [ %181, %180 ]
  br i1 %183, label %184, label %200

184:                                              ; preds = %182
  %185 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %186 = mul nsw i32 %.01, 7
  %187 = add nsw i32 %.02, %186
  %188 = sub nsw i32 %187, %.01
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [42 x %struct.Move], ptr %185, i64 0, i64 %189
  %191 = getelementptr inbounds %struct.Move, ptr %190, i32 0, i32 2
  %192 = load i32, ptr %191, align 4
  %193 = icmp eq i32 %192, %16
  br i1 %193, label %194, label %196

194:                                              ; preds = %184
  %195 = add nsw i32 %.7, 1
  br label %197

196:                                              ; preds = %184
  br label %200

197:                                              ; preds = %194
  br label %198

198:                                              ; preds = %197
  %199 = add nsw i32 %.01, -1
  br label %178, !llvm.loop !14

200:                                              ; preds = %196, %182
  %201 = icmp sge i32 %.7, 3
  br i1 %201, label %202, label %203

202:                                              ; preds = %200
  br label %207

203:                                              ; preds = %200
  br label %204

204:                                              ; preds = %203
  %205 = add nsw i32 %.02, 1
  br label %3, !llvm.loop !15

206:                                              ; preds = %3
  br label %207

207:                                              ; preds = %206, %202, %176, %150, %124, %98, %76, %54
  %.0 = phi i32 [ 1, %54 ], [ 1, %76 ], [ 1, %98 ], [ 1, %124 ], [ 1, %150 ], [ 1, %176 ], [ 1, %202 ], [ 0, %206 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board(ptr noundef %0) #0 {
  %2 = alloca %struct.Move, align 4
  br label %3

3:                                                ; preds = %21, %1
  %.01 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %4 = icmp slt i32 %.01, 6
  br i1 %4, label %5, label %23

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %17, %5
  %.0 = phi i32 [ 0, %5 ], [ %18, %17 ]
  %7 = icmp slt i32 %.0, 7
  br i1 %7, label %8, label %19

8:                                                ; preds = %6
  %9 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %10 = mul nsw i32 %.01, 7
  %11 = add nsw i32 %10, %.0
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [42 x %struct.Move], ptr %9, i64 0, i64 %12
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %13, i64 12, i1 false)
  %14 = getelementptr inbounds %struct.Move, ptr %2, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %17

17:                                               ; preds = %8
  %18 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !16

19:                                               ; preds = %6
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %21

21:                                               ; preds = %19
  %22 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !17

23:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i32 } @get_random_move(ptr noundef %0) #0 {
  %2 = alloca %struct.Move, align 4
  %3 = alloca [42 x i32], align 16
  %4 = alloca %struct.Move, align 4
  %5 = alloca { i64, i32 }, align 4
  %6 = alloca { i64, i32 }, align 8
  br label %7

7:                                                ; preds = %34, %1
  %.02 = phi i32 [ 0, %1 ], [ %35, %34 ]
  %.01 = phi i32 [ 0, %1 ], [ %.1, %34 ]
  %8 = icmp slt i32 %.02, 6
  br i1 %8, label %9, label %36

9:                                                ; preds = %7
  br label %10

10:                                               ; preds = %31, %9
  %.1 = phi i32 [ %.01, %9 ], [ %.2, %31 ]
  %.0 = phi i32 [ 0, %9 ], [ %32, %31 ]
  %11 = icmp slt i32 %.0, 7
  br i1 %11, label %12, label %33

12:                                               ; preds = %10
  %13 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 0
  store i32 %.02, ptr %13, align 4
  %14 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 1
  store i32 %.0, ptr %14, align 4
  %15 = getelementptr inbounds %struct.Move, ptr %4, i32 0, i32 2
  %16 = call i32 @rand() #6
  %17 = srem i32 %16, 6
  store i32 %17, ptr %15, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %4, i64 12, i1 false)
  %18 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 0
  %19 = load i64, ptr %18, align 4
  %20 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = call i32 @is_valid_move(ptr noundef %0, i64 %19, i32 %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %12
  %25 = mul nsw i32 %.02, 7
  %26 = add nsw i32 %25, %.0
  %27 = sext i32 %.1 to i64
  %28 = getelementptr inbounds [42 x i32], ptr %3, i64 0, i64 %27
  store i32 %26, ptr %28, align 4
  %29 = add nsw i32 %.1, 1
  br label %30

30:                                               ; preds = %24, %12
  %.2 = phi i32 [ %29, %24 ], [ %.1, %12 ]
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.0, 1
  br label %10, !llvm.loop !18

33:                                               ; preds = %10
  br label %34

34:                                               ; preds = %33
  %35 = add nsw i32 %.02, 1
  br label %7, !llvm.loop !19

36:                                               ; preds = %7
  %37 = call i32 @rand() #6
  %38 = srem i32 %37, %.01
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [42 x i32], ptr %3, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = getelementptr inbounds %struct.Game, ptr %0, i32 0, i32 0
  %43 = sext i32 %41 to i64
  %44 = getelementptr inbounds [42 x %struct.Move], ptr %42, i64 0, i64 %43
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %44, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 4 %2, i64 12, i1 false)
  %45 = load { i64, i32 }, ptr %6, align 8
  ret { i64, i32 } %45
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @play_game() #0 {
  %1 = alloca %struct.Move, align 4
  %2 = alloca { i64, i32 }, align 8
  %3 = alloca { i64, i32 }, align 4
  %4 = call ptr @new_game()
  br label %5

5:                                                ; preds = %14, %0
  %6 = call i32 @is_game_over(ptr noundef %4)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %12, label %8

8:                                                ; preds = %5
  %9 = call i32 @has_won(ptr noundef %4)
  %10 = icmp ne i32 %9, 0
  %11 = xor i1 %10, true
  br label %12

12:                                               ; preds = %8, %5
  %13 = phi i1 [ false, %5 ], [ %11, %8 ]
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = call { i64, i32 } @get_random_move(ptr noundef %4)
  store { i64, i32 } %15, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 8 %2, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %1, i64 12, i1 false)
  %16 = getelementptr inbounds { i64, i32 }, ptr %3, i32 0, i32 0
  %17 = load i64, ptr %16, align 4
  %18 = getelementptr inbounds { i64, i32 }, ptr %3, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  call void @add_move(ptr noundef %4, i64 %17, i32 %19)
  br label %5, !llvm.loop !20

20:                                               ; preds = %12
  %21 = call i32 @has_won(ptr noundef %4)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %27

25:                                               ; preds = %20
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %27

27:                                               ; preds = %25, %23
  call void @print_board(ptr noundef %4)
  call void @free_game(ptr noundef %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #6
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #6
  call void @play_game()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
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
