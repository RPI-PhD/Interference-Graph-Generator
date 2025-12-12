; ModuleID = 'DATASETv2/gemini_pro-16026.c'
source_filename = "DATASETv2/gemini_pro-16026.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Game = type { [42 x %struct.Move], i32 }
%struct.Move = type { i32, i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Player has won!\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"Tie game.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @new_game() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 508) #5
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.Game, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_game(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_move(ptr noundef %0, i64 %1, i32 %2) #0 {
  %4 = alloca %struct.Move, align 4
  %5 = alloca { i64, i32 }, align 4
  %6 = alloca ptr, align 8
  %7 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 0
  store i64 %1, ptr %7, align 4
  %8 = getelementptr inbounds { i64, i32 }, ptr %5, i32 0, i32 1
  store i32 %2, ptr %8, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %5, i64 12, i1 false)
  store ptr %0, ptr %6, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = getelementptr inbounds %struct.Game, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %struct.Game, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [42 x %struct.Move], ptr %10, i64 0, i64 %14
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %15, ptr align 4 %4, i64 12, i1 false)
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.Game, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 4
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_valid_move(ptr noundef %0, i64 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.Move, align 4
  %6 = alloca { i64, i32 }, align 4
  %7 = alloca ptr, align 8
  %8 = getelementptr inbounds { i64, i32 }, ptr %6, i32 0, i32 0
  store i64 %1, ptr %8, align 4
  %9 = getelementptr inbounds { i64, i32 }, ptr %6, i32 0, i32 1
  store i32 %2, ptr %9, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %6, i64 12, i1 false)
  store ptr %0, ptr %7, align 8
  %10 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %17, label %13

13:                                               ; preds = %3
  %14 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 0
  %15 = load i32, ptr %14, align 4
  %16 = icmp sge i32 %15, 6
  br i1 %16, label %17, label %18

17:                                               ; preds = %13, %3
  store i32 0, ptr %4, align 4
  br label %52

18:                                               ; preds = %13
  %19 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %26, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = icmp sge i32 %24, 7
  br i1 %25, label %26, label %27

26:                                               ; preds = %22, %18
  store i32 0, ptr %4, align 4
  br label %52

27:                                               ; preds = %22
  %28 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 2
  %29 = load i32, ptr %28, align 4
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %35, label %31

31:                                               ; preds = %27
  %32 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 2
  %33 = load i32, ptr %32, align 4
  %34 = icmp sge i32 %33, 6
  br i1 %34, label %35, label %36

35:                                               ; preds = %31, %27
  store i32 0, ptr %4, align 4
  br label %52

36:                                               ; preds = %31
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds %struct.Game, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.Game, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 4
  %42 = sub nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [42 x %struct.Move], ptr %38, i64 0, i64 %43
  %45 = getelementptr inbounds %struct.Move, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 4
  %47 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 0
  %48 = load i32, ptr %47, align 4
  %49 = icmp ne i32 %46, %48
  br i1 %49, label %50, label %51

50:                                               ; preds = %36
  store i32 0, ptr %4, align 4
  br label %52

51:                                               ; preds = %36
  store i32 1, ptr %4, align 4
  br label %52

52:                                               ; preds = %51, %50, %35, %26, %17
  %53 = load i32, ptr %4, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_game_over(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.Game, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 42
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %10

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %10

10:                                               ; preds = %9, %8
  %11 = load i32, ptr %2, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @has_won(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Move, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %18

18:                                               ; preds = %298, %1
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.Game, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %301

24:                                               ; preds = %18
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.Game, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %4, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [42 x %struct.Move], ptr %26, i64 0, i64 %28
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %29, i64 12, i1 false)
  %30 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 0
  %31 = load i32, ptr %30, align 4
  store i32 %31, ptr %6, align 4
  %32 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  store i32 %33, ptr %7, align 4
  %34 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 2
  %35 = load i32, ptr %34, align 4
  store i32 %35, ptr %8, align 4
  store i32 1, ptr %9, align 4
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %10, align 4
  br label %38

38:                                               ; preds = %58, %24
  %39 = load i32, ptr %10, align 4
  %40 = icmp slt i32 %39, 7
  br i1 %40, label %41, label %61

41:                                               ; preds = %38
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.Game, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %4, align 4
  %45 = load i32, ptr %10, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [42 x %struct.Move], ptr %43, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.Move, ptr %48, i32 0, i32 2
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %8, align 4
  %52 = icmp eq i32 %50, %51
  br i1 %52, label %53, label %56

53:                                               ; preds = %41
  %54 = load i32, ptr %9, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %9, align 4
  br label %57

56:                                               ; preds = %41
  br label %61

57:                                               ; preds = %53
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %10, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %10, align 4
  br label %38, !llvm.loop !6

61:                                               ; preds = %56, %38
  %62 = load i32, ptr %7, align 4
  %63 = sub nsw i32 %62, 1
  store i32 %63, ptr %11, align 4
  br label %64

64:                                               ; preds = %84, %61
  %65 = load i32, ptr %11, align 4
  %66 = icmp sge i32 %65, 0
  br i1 %66, label %67, label %87

67:                                               ; preds = %64
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds %struct.Game, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %4, align 4
  %71 = load i32, ptr %11, align 4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [42 x %struct.Move], ptr %69, i64 0, i64 %73
  %75 = getelementptr inbounds %struct.Move, ptr %74, i32 0, i32 2
  %76 = load i32, ptr %75, align 4
  %77 = load i32, ptr %8, align 4
  %78 = icmp eq i32 %76, %77
  br i1 %78, label %79, label %82

79:                                               ; preds = %67
  %80 = load i32, ptr %9, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %9, align 4
  br label %83

82:                                               ; preds = %67
  br label %87

83:                                               ; preds = %79
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %11, align 4
  %86 = add nsw i32 %85, -1
  store i32 %86, ptr %11, align 4
  br label %64, !llvm.loop !8

87:                                               ; preds = %82, %64
  %88 = load i32, ptr %9, align 4
  %89 = icmp sge i32 %88, 3
  br i1 %89, label %90, label %91

90:                                               ; preds = %87
  store i32 1, ptr %2, align 4
  br label %302

91:                                               ; preds = %87
  store i32 1, ptr %9, align 4
  %92 = load i32, ptr %6, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %12, align 4
  br label %94

94:                                               ; preds = %115, %91
  %95 = load i32, ptr %12, align 4
  %96 = icmp slt i32 %95, 6
  br i1 %96, label %97, label %118

97:                                               ; preds = %94
  %98 = load ptr, ptr %3, align 8
  %99 = getelementptr inbounds %struct.Game, ptr %98, i32 0, i32 0
  %100 = load i32, ptr %4, align 4
  %101 = load i32, ptr %12, align 4
  %102 = mul nsw i32 %101, 7
  %103 = add nsw i32 %100, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [42 x %struct.Move], ptr %99, i64 0, i64 %104
  %106 = getelementptr inbounds %struct.Move, ptr %105, i32 0, i32 2
  %107 = load i32, ptr %106, align 4
  %108 = load i32, ptr %8, align 4
  %109 = icmp eq i32 %107, %108
  br i1 %109, label %110, label %113

110:                                              ; preds = %97
  %111 = load i32, ptr %9, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %9, align 4
  br label %114

113:                                              ; preds = %97
  br label %118

114:                                              ; preds = %110
  br label %115

115:                                              ; preds = %114
  %116 = load i32, ptr %12, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %12, align 4
  br label %94, !llvm.loop !9

118:                                              ; preds = %113, %94
  %119 = load i32, ptr %9, align 4
  %120 = icmp sge i32 %119, 3
  br i1 %120, label %121, label %122

121:                                              ; preds = %118
  store i32 1, ptr %2, align 4
  br label %302

122:                                              ; preds = %118
  store i32 1, ptr %9, align 4
  %123 = load i32, ptr %6, align 4
  %124 = sub nsw i32 %123, 1
  store i32 %124, ptr %13, align 4
  br label %125

125:                                              ; preds = %146, %122
  %126 = load i32, ptr %13, align 4
  %127 = icmp sge i32 %126, 0
  br i1 %127, label %128, label %149

128:                                              ; preds = %125
  %129 = load ptr, ptr %3, align 8
  %130 = getelementptr inbounds %struct.Game, ptr %129, i32 0, i32 0
  %131 = load i32, ptr %4, align 4
  %132 = load i32, ptr %13, align 4
  %133 = mul nsw i32 %132, 7
  %134 = add nsw i32 %131, %133
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [42 x %struct.Move], ptr %130, i64 0, i64 %135
  %137 = getelementptr inbounds %struct.Move, ptr %136, i32 0, i32 2
  %138 = load i32, ptr %137, align 4
  %139 = load i32, ptr %8, align 4
  %140 = icmp eq i32 %138, %139
  br i1 %140, label %141, label %144

141:                                              ; preds = %128
  %142 = load i32, ptr %9, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %9, align 4
  br label %145

144:                                              ; preds = %128
  br label %149

145:                                              ; preds = %141
  br label %146

146:                                              ; preds = %145
  %147 = load i32, ptr %13, align 4
  %148 = add nsw i32 %147, -1
  store i32 %148, ptr %13, align 4
  br label %125, !llvm.loop !10

149:                                              ; preds = %144, %125
  %150 = load i32, ptr %9, align 4
  %151 = icmp sge i32 %150, 3
  br i1 %151, label %152, label %153

152:                                              ; preds = %149
  store i32 1, ptr %2, align 4
  br label %302

153:                                              ; preds = %149
  store i32 1, ptr %9, align 4
  store i32 1, ptr %14, align 4
  br label %154

154:                                              ; preds = %182, %153
  %155 = load i32, ptr %14, align 4
  %156 = icmp slt i32 %155, 6
  br i1 %156, label %157, label %160

157:                                              ; preds = %154
  %158 = load i32, ptr %14, align 4
  %159 = icmp slt i32 %158, 7
  br label %160

160:                                              ; preds = %157, %154
  %161 = phi i1 [ false, %154 ], [ %159, %157 ]
  br i1 %161, label %162, label %185

162:                                              ; preds = %160
  %163 = load ptr, ptr %3, align 8
  %164 = getelementptr inbounds %struct.Game, ptr %163, i32 0, i32 0
  %165 = load i32, ptr %4, align 4
  %166 = load i32, ptr %14, align 4
  %167 = mul nsw i32 %166, 7
  %168 = add nsw i32 %165, %167
  %169 = load i32, ptr %14, align 4
  %170 = add nsw i32 %168, %169
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [42 x %struct.Move], ptr %164, i64 0, i64 %171
  %173 = getelementptr inbounds %struct.Move, ptr %172, i32 0, i32 2
  %174 = load i32, ptr %173, align 4
  %175 = load i32, ptr %8, align 4
  %176 = icmp eq i32 %174, %175
  br i1 %176, label %177, label %180

177:                                              ; preds = %162
  %178 = load i32, ptr %9, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, ptr %9, align 4
  br label %181

180:                                              ; preds = %162
  br label %185

181:                                              ; preds = %177
  br label %182

182:                                              ; preds = %181
  %183 = load i32, ptr %14, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, ptr %14, align 4
  br label %154, !llvm.loop !11

185:                                              ; preds = %180, %160
  %186 = load i32, ptr %9, align 4
  %187 = icmp sge i32 %186, 3
  br i1 %187, label %188, label %189

188:                                              ; preds = %185
  store i32 1, ptr %2, align 4
  br label %302

189:                                              ; preds = %185
  store i32 1, ptr %9, align 4
  store i32 1, ptr %15, align 4
  br label %190

190:                                              ; preds = %218, %189
  %191 = load i32, ptr %15, align 4
  %192 = icmp slt i32 %191, 6
  br i1 %192, label %193, label %196

193:                                              ; preds = %190
  %194 = load i32, ptr %15, align 4
  %195 = icmp slt i32 %194, 7
  br label %196

196:                                              ; preds = %193, %190
  %197 = phi i1 [ false, %190 ], [ %195, %193 ]
  br i1 %197, label %198, label %221

198:                                              ; preds = %196
  %199 = load ptr, ptr %3, align 8
  %200 = getelementptr inbounds %struct.Game, ptr %199, i32 0, i32 0
  %201 = load i32, ptr %4, align 4
  %202 = load i32, ptr %15, align 4
  %203 = mul nsw i32 %202, 7
  %204 = add nsw i32 %201, %203
  %205 = load i32, ptr %15, align 4
  %206 = sub nsw i32 %204, %205
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [42 x %struct.Move], ptr %200, i64 0, i64 %207
  %209 = getelementptr inbounds %struct.Move, ptr %208, i32 0, i32 2
  %210 = load i32, ptr %209, align 4
  %211 = load i32, ptr %8, align 4
  %212 = icmp eq i32 %210, %211
  br i1 %212, label %213, label %216

213:                                              ; preds = %198
  %214 = load i32, ptr %9, align 4
  %215 = add nsw i32 %214, 1
  store i32 %215, ptr %9, align 4
  br label %217

216:                                              ; preds = %198
  br label %221

217:                                              ; preds = %213
  br label %218

218:                                              ; preds = %217
  %219 = load i32, ptr %15, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, ptr %15, align 4
  br label %190, !llvm.loop !12

221:                                              ; preds = %216, %196
  %222 = load i32, ptr %9, align 4
  %223 = icmp sge i32 %222, 3
  br i1 %223, label %224, label %225

224:                                              ; preds = %221
  store i32 1, ptr %2, align 4
  br label %302

225:                                              ; preds = %221
  store i32 1, ptr %9, align 4
  store i32 -1, ptr %16, align 4
  br label %226

226:                                              ; preds = %254, %225
  %227 = load i32, ptr %16, align 4
  %228 = icmp sge i32 %227, -6
  br i1 %228, label %229, label %232

229:                                              ; preds = %226
  %230 = load i32, ptr %16, align 4
  %231 = icmp sge i32 %230, -7
  br label %232

232:                                              ; preds = %229, %226
  %233 = phi i1 [ false, %226 ], [ %231, %229 ]
  br i1 %233, label %234, label %257

234:                                              ; preds = %232
  %235 = load ptr, ptr %3, align 8
  %236 = getelementptr inbounds %struct.Game, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %4, align 4
  %238 = load i32, ptr %16, align 4
  %239 = mul nsw i32 %238, 7
  %240 = add nsw i32 %237, %239
  %241 = load i32, ptr %16, align 4
  %242 = add nsw i32 %240, %241
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [42 x %struct.Move], ptr %236, i64 0, i64 %243
  %245 = getelementptr inbounds %struct.Move, ptr %244, i32 0, i32 2
  %246 = load i32, ptr %245, align 4
  %247 = load i32, ptr %8, align 4
  %248 = icmp eq i32 %246, %247
  br i1 %248, label %249, label %252

249:                                              ; preds = %234
  %250 = load i32, ptr %9, align 4
  %251 = add nsw i32 %250, 1
  store i32 %251, ptr %9, align 4
  br label %253

252:                                              ; preds = %234
  br label %257

253:                                              ; preds = %249
  br label %254

254:                                              ; preds = %253
  %255 = load i32, ptr %16, align 4
  %256 = add nsw i32 %255, -1
  store i32 %256, ptr %16, align 4
  br label %226, !llvm.loop !13

257:                                              ; preds = %252, %232
  %258 = load i32, ptr %9, align 4
  %259 = icmp sge i32 %258, 3
  br i1 %259, label %260, label %261

260:                                              ; preds = %257
  store i32 1, ptr %2, align 4
  br label %302

261:                                              ; preds = %257
  store i32 1, ptr %9, align 4
  store i32 -1, ptr %17, align 4
  br label %262

262:                                              ; preds = %290, %261
  %263 = load i32, ptr %17, align 4
  %264 = icmp sge i32 %263, -6
  br i1 %264, label %265, label %268

265:                                              ; preds = %262
  %266 = load i32, ptr %17, align 4
  %267 = icmp sge i32 %266, -7
  br label %268

268:                                              ; preds = %265, %262
  %269 = phi i1 [ false, %262 ], [ %267, %265 ]
  br i1 %269, label %270, label %293

270:                                              ; preds = %268
  %271 = load ptr, ptr %3, align 8
  %272 = getelementptr inbounds %struct.Game, ptr %271, i32 0, i32 0
  %273 = load i32, ptr %4, align 4
  %274 = load i32, ptr %17, align 4
  %275 = mul nsw i32 %274, 7
  %276 = add nsw i32 %273, %275
  %277 = load i32, ptr %17, align 4
  %278 = sub nsw i32 %276, %277
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [42 x %struct.Move], ptr %272, i64 0, i64 %279
  %281 = getelementptr inbounds %struct.Move, ptr %280, i32 0, i32 2
  %282 = load i32, ptr %281, align 4
  %283 = load i32, ptr %8, align 4
  %284 = icmp eq i32 %282, %283
  br i1 %284, label %285, label %288

285:                                              ; preds = %270
  %286 = load i32, ptr %9, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, ptr %9, align 4
  br label %289

288:                                              ; preds = %270
  br label %293

289:                                              ; preds = %285
  br label %290

290:                                              ; preds = %289
  %291 = load i32, ptr %17, align 4
  %292 = add nsw i32 %291, -1
  store i32 %292, ptr %17, align 4
  br label %262, !llvm.loop !14

293:                                              ; preds = %288, %268
  %294 = load i32, ptr %9, align 4
  %295 = icmp sge i32 %294, 3
  br i1 %295, label %296, label %297

296:                                              ; preds = %293
  store i32 1, ptr %2, align 4
  br label %302

297:                                              ; preds = %293
  br label %298

298:                                              ; preds = %297
  %299 = load i32, ptr %4, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, ptr %4, align 4
  br label %18, !llvm.loop !15

301:                                              ; preds = %18
  store i32 0, ptr %2, align 4
  br label %302

302:                                              ; preds = %301, %296, %260, %224, %188, %152, %121, %90
  %303 = load i32, ptr %2, align 4
  ret i32 %303
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.Move, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %30, %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 6
  br i1 %8, label %9, label %33

9:                                                ; preds = %6
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %25, %9
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %11, 7
  br i1 %12, label %13, label %28

13:                                               ; preds = %10
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.Game, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %3, align 4
  %17 = mul nsw i32 %16, 7
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %17, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [42 x %struct.Move], ptr %15, i64 0, i64 %20
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %21, i64 12, i1 false)
  %22 = getelementptr inbounds %struct.Move, ptr %5, i32 0, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %23)
  br label %25

25:                                               ; preds = %13
  %26 = load i32, ptr %4, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %10, !llvm.loop !16

28:                                               ; preds = %10
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %30

30:                                               ; preds = %28
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %3, align 4
  br label %6, !llvm.loop !17

33:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local { i64, i32 } @get_random_move(ptr noundef %0) #0 {
  %2 = alloca %struct.Move, align 4
  %3 = alloca ptr, align 8
  %4 = alloca [42 x i32], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.Move, align 4
  %9 = alloca { i64, i32 }, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %13

13:                                               ; preds = %50, %1
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 6
  br i1 %15, label %16, label %53

16:                                               ; preds = %13
  store i32 0, ptr %7, align 4
  br label %17

17:                                               ; preds = %46, %16
  %18 = load i32, ptr %7, align 4
  %19 = icmp slt i32 %18, 7
  br i1 %19, label %20, label %49

20:                                               ; preds = %17
  %21 = getelementptr inbounds %struct.Move, ptr %8, i32 0, i32 0
  %22 = load i32, ptr %6, align 4
  store i32 %22, ptr %21, align 4
  %23 = getelementptr inbounds %struct.Move, ptr %8, i32 0, i32 1
  %24 = load i32, ptr %7, align 4
  store i32 %24, ptr %23, align 4
  %25 = getelementptr inbounds %struct.Move, ptr %8, i32 0, i32 2
  %26 = call i32 @rand() #6
  %27 = srem i32 %26, 6
  store i32 %27, ptr %25, align 4
  %28 = load ptr, ptr %3, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %8, i64 12, i1 false)
  %29 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 0
  %30 = load i64, ptr %29, align 4
  %31 = getelementptr inbounds { i64, i32 }, ptr %9, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = call i32 @is_valid_move(ptr noundef %28, i64 %30, i32 %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %45

35:                                               ; preds = %20
  %36 = load i32, ptr %6, align 4
  %37 = mul nsw i32 %36, 7
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [42 x i32], ptr %4, i64 0, i64 %41
  store i32 %39, ptr %42, align 4
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %5, align 4
  br label %45

45:                                               ; preds = %35, %20
  br label %46

46:                                               ; preds = %45
  %47 = load i32, ptr %7, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %7, align 4
  br label %17, !llvm.loop !18

49:                                               ; preds = %17
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %6, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %6, align 4
  br label %13, !llvm.loop !19

53:                                               ; preds = %13
  %54 = call i32 @rand() #6
  %55 = load i32, ptr %5, align 4
  %56 = srem i32 %54, %55
  store i32 %56, ptr %10, align 4
  %57 = load i32, ptr %10, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [42 x i32], ptr %4, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %11, align 4
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds %struct.Game, ptr %61, i32 0, i32 0
  %63 = load i32, ptr %11, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [42 x %struct.Move], ptr %62, i64 0, i64 %64
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %65, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %12, ptr align 4 %2, i64 12, i1 false)
  %66 = load { i64, i32 }, ptr %12, align 8
  ret { i64, i32 } %66
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @play_game() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca %struct.Move, align 4
  %3 = alloca { i64, i32 }, align 8
  %4 = alloca { i64, i32 }, align 4
  %5 = call ptr @new_game()
  store ptr %5, ptr %1, align 8
  br label %6

6:                                                ; preds = %17, %0
  %7 = load ptr, ptr %1, align 8
  %8 = call i32 @is_game_over(ptr noundef %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %15, label %10

10:                                               ; preds = %6
  %11 = load ptr, ptr %1, align 8
  %12 = call i32 @has_won(ptr noundef %11)
  %13 = icmp ne i32 %12, 0
  %14 = xor i1 %13, true
  br label %15

15:                                               ; preds = %10, %6
  %16 = phi i1 [ false, %6 ], [ %14, %10 ]
  br i1 %16, label %17, label %25

17:                                               ; preds = %15
  %18 = load ptr, ptr %1, align 8
  %19 = call { i64, i32 } @get_random_move(ptr noundef %18)
  store { i64, i32 } %19, ptr %3, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 8 %3, i64 12, i1 false)
  %20 = load ptr, ptr %1, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %2, i64 12, i1 false)
  %21 = getelementptr inbounds { i64, i32 }, ptr %4, i32 0, i32 0
  %22 = load i64, ptr %21, align 4
  %23 = getelementptr inbounds { i64, i32 }, ptr %4, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  call void @add_move(ptr noundef %20, i64 %22, i32 %24)
  br label %6, !llvm.loop !20

25:                                               ; preds = %15
  %26 = load ptr, ptr %1, align 8
  %27 = call i32 @has_won(ptr noundef %26)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %25
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %33

31:                                               ; preds = %25
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %33

33:                                               ; preds = %31, %29
  %34 = load ptr, ptr %1, align 8
  call void @print_board(ptr noundef %34)
  %35 = load ptr, ptr %1, align 8
  call void @free_game(ptr noundef %35)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i64 @time(ptr noundef null) #6
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #6
  call void @play_game()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
