; ModuleID = 'DATASETv2/gpt35-12904.c'
source_filename = "DATASETv2/gpt35-12904.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { [50 x i8], [100 x i8], ptr, i32, ptr, i32 }
%struct.Attribute = type { [50 x i8], [100 x i8] }

@.str = private unnamed_addr constant [9 x i8] c"%s=\22%s\22 \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"<%s \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"/>\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c">\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"</%s>\0A\00", align 1
@__const.main.xml = private unnamed_addr constant [200 x i8] c"<animals>\0A    <dog breed=\22golden retreiver\22>\0A        <name>Max</name>\0A        <age>3</age>\0A    </dog>\0A    <cat breed=\22siamese\22>\0A        <name>Fluffy</name>\0A        <age>5</age>\0A    </cat>\0A</animals>\0A\00", align 16
@.str.6 = private unnamed_addr constant [4 x i8] c"dog\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"breed\00", align 1
@.str.8 = private unnamed_addr constant [17 x i8] c"Dog's breed: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_node(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %11) #7
  br label %12

12:                                               ; preds = %8, %1
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Node, ptr %13, i32 0, i32 4
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %38

17:                                               ; preds = %12
  store i32 0, ptr %3, align 4
  br label %18

18:                                               ; preds = %31, %17
  %19 = load i32, ptr %3, align 4
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.Node, ptr %20, i32 0, i32 5
  %22 = load i32, ptr %21, align 8
  %23 = icmp slt i32 %19, %22
  br i1 %23, label %24, label %34

24:                                               ; preds = %18
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 4
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %3, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.Node, ptr %27, i64 %29
  call void @free_node(ptr noundef %30)
  br label %31

31:                                               ; preds = %24
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %18, !llvm.loop !6

34:                                               ; preds = %18
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.Node, ptr %35, i32 0, i32 4
  %37 = load ptr, ptr %36, align 8
  call void @free(ptr noundef %37) #7
  br label %38

38:                                               ; preds = %34, %12
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @parse_node(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %12 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 184) #8
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %15

15:                                               ; preds = %47, %2
  %16 = load ptr, ptr %4, align 8
  %17 = load i32, ptr %7, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp ne i32 %21, 62
  br i1 %22, label %23, label %34

23:                                               ; preds = %15
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp ne i32 %29, 32
  br i1 %30, label %31, label %34

31:                                               ; preds = %23
  %32 = load i32, ptr %8, align 4
  %33 = icmp slt i32 %32, 50
  br label %34

34:                                               ; preds = %31, %23, %15
  %35 = phi i1 [ false, %23 ], [ false, %15 ], [ %33, %31 ]
  br i1 %35, label %36, label %52

36:                                               ; preds = %34
  %37 = load ptr, ptr %4, align 8
  %38 = load i32, ptr %7, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %37, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = load ptr, ptr %6, align 8
  %43 = getelementptr inbounds %struct.Node, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [50 x i8], ptr %43, i64 0, i64 %45
  store i8 %41, ptr %46, align 1
  br label %47

47:                                               ; preds = %36
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %7, align 4
  %50 = load i32, ptr %8, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %8, align 4
  br label %15, !llvm.loop !8

52:                                               ; preds = %34
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds %struct.Node, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [50 x i8], ptr %54, i64 0, i64 %56
  store i8 0, ptr %57, align 1
  br label %58

58:                                               ; preds = %225, %52
  %59 = load ptr, ptr %4, align 8
  %60 = load i32, ptr %7, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, ptr %59, i64 %61
  %63 = load i8, ptr %62, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp ne i32 %64, 62
  br i1 %65, label %66, label %226

66:                                               ; preds = %58
  br label %67

67:                                               ; preds = %75, %66
  %68 = load ptr, ptr %4, align 8
  %69 = load i32, ptr %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, ptr %68, i64 %70
  %72 = load i8, ptr %71, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 32
  br i1 %74, label %75, label %78

75:                                               ; preds = %67
  %76 = load i32, ptr %7, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %7, align 4
  br label %67, !llvm.loop !9

78:                                               ; preds = %67
  %79 = load ptr, ptr %4, align 8
  %80 = load i32, ptr %7, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i8, ptr %79, i64 %81
  %83 = load i8, ptr %82, align 1
  %84 = sext i8 %83 to i32
  %85 = icmp ne i32 %84, 47
  br i1 %85, label %86, label %224

86:                                               ; preds = %78
  %87 = load ptr, ptr %6, align 8
  %88 = getelementptr inbounds %struct.Node, ptr %87, i32 0, i32 3
  %89 = load i32, ptr %88, align 8
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %88, align 8
  %91 = load ptr, ptr %6, align 8
  %92 = getelementptr inbounds %struct.Node, ptr %91, i32 0, i32 2
  %93 = load ptr, ptr %92, align 8
  %94 = load ptr, ptr %6, align 8
  %95 = getelementptr inbounds %struct.Node, ptr %94, i32 0, i32 3
  %96 = load i32, ptr %95, align 8
  %97 = sext i32 %96 to i64
  %98 = mul i64 150, %97
  %99 = call ptr @realloc(ptr noundef %93, i64 noundef %98) #9
  %100 = load ptr, ptr %6, align 8
  %101 = getelementptr inbounds %struct.Node, ptr %100, i32 0, i32 2
  store ptr %99, ptr %101, align 8
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.Node, ptr %102, i32 0, i32 2
  %104 = load ptr, ptr %103, align 8
  %105 = load ptr, ptr %6, align 8
  %106 = getelementptr inbounds %struct.Node, ptr %105, i32 0, i32 3
  %107 = load i32, ptr %106, align 8
  %108 = sub nsw i32 %107, 1
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds %struct.Attribute, ptr %104, i64 %109
  store ptr %110, ptr %9, align 8
  store i32 0, ptr %8, align 4
  br label %111

111:                                              ; preds = %143, %86
  %112 = load ptr, ptr %4, align 8
  %113 = load i32, ptr %7, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, ptr %112, i64 %114
  %116 = load i8, ptr %115, align 1
  %117 = sext i8 %116 to i32
  %118 = icmp ne i32 %117, 61
  br i1 %118, label %119, label %130

119:                                              ; preds = %111
  %120 = load ptr, ptr %4, align 8
  %121 = load i32, ptr %7, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, ptr %120, i64 %122
  %124 = load i8, ptr %123, align 1
  %125 = sext i8 %124 to i32
  %126 = icmp ne i32 %125, 32
  br i1 %126, label %127, label %130

127:                                              ; preds = %119
  %128 = load i32, ptr %8, align 4
  %129 = icmp slt i32 %128, 50
  br label %130

130:                                              ; preds = %127, %119, %111
  %131 = phi i1 [ false, %119 ], [ false, %111 ], [ %129, %127 ]
  br i1 %131, label %132, label %148

132:                                              ; preds = %130
  %133 = load ptr, ptr %4, align 8
  %134 = load i32, ptr %7, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, ptr %133, i64 %135
  %137 = load i8, ptr %136, align 1
  %138 = load ptr, ptr %9, align 8
  %139 = getelementptr inbounds %struct.Attribute, ptr %138, i32 0, i32 0
  %140 = load i32, ptr %8, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [50 x i8], ptr %139, i64 0, i64 %141
  store i8 %137, ptr %142, align 1
  br label %143

143:                                              ; preds = %132
  %144 = load i32, ptr %7, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr %7, align 4
  %146 = load i32, ptr %8, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, ptr %8, align 4
  br label %111, !llvm.loop !10

148:                                              ; preds = %130
  %149 = load ptr, ptr %9, align 8
  %150 = getelementptr inbounds %struct.Attribute, ptr %149, i32 0, i32 0
  %151 = load i32, ptr %8, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [50 x i8], ptr %150, i64 0, i64 %152
  store i8 0, ptr %153, align 1
  br label %154

154:                                              ; preds = %172, %148
  %155 = load ptr, ptr %4, align 8
  %156 = load i32, ptr %7, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i8, ptr %155, i64 %157
  %159 = load i8, ptr %158, align 1
  %160 = sext i8 %159 to i32
  %161 = icmp eq i32 %160, 32
  br i1 %161, label %170, label %162

162:                                              ; preds = %154
  %163 = load ptr, ptr %4, align 8
  %164 = load i32, ptr %7, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i8, ptr %163, i64 %165
  %167 = load i8, ptr %166, align 1
  %168 = sext i8 %167 to i32
  %169 = icmp eq i32 %168, 61
  br label %170

170:                                              ; preds = %162, %154
  %171 = phi i1 [ true, %154 ], [ %169, %162 ]
  br i1 %171, label %172, label %175

172:                                              ; preds = %170
  %173 = load i32, ptr %7, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, ptr %7, align 4
  br label %154, !llvm.loop !11

175:                                              ; preds = %170
  %176 = load ptr, ptr %4, align 8
  %177 = load i32, ptr %7, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, ptr %176, i64 %178
  %180 = load i8, ptr %179, align 1
  %181 = sext i8 %180 to i32
  %182 = icmp eq i32 %181, 34
  br i1 %182, label %183, label %223

183:                                              ; preds = %175
  %184 = load i32, ptr %7, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %186

186:                                              ; preds = %210, %183
  %187 = load ptr, ptr %4, align 8
  %188 = load i32, ptr %7, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8, ptr %187, i64 %189
  %191 = load i8, ptr %190, align 1
  %192 = sext i8 %191 to i32
  %193 = icmp ne i32 %192, 34
  br i1 %193, label %194, label %197

194:                                              ; preds = %186
  %195 = load i32, ptr %8, align 4
  %196 = icmp slt i32 %195, 100
  br label %197

197:                                              ; preds = %194, %186
  %198 = phi i1 [ false, %186 ], [ %196, %194 ]
  br i1 %198, label %199, label %215

199:                                              ; preds = %197
  %200 = load ptr, ptr %4, align 8
  %201 = load i32, ptr %7, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i8, ptr %200, i64 %202
  %204 = load i8, ptr %203, align 1
  %205 = load ptr, ptr %9, align 8
  %206 = getelementptr inbounds %struct.Attribute, ptr %205, i32 0, i32 1
  %207 = load i32, ptr %8, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [100 x i8], ptr %206, i64 0, i64 %208
  store i8 %204, ptr %209, align 1
  br label %210

210:                                              ; preds = %199
  %211 = load i32, ptr %7, align 4
  %212 = add nsw i32 %211, 1
  store i32 %212, ptr %7, align 4
  %213 = load i32, ptr %8, align 4
  %214 = add nsw i32 %213, 1
  store i32 %214, ptr %8, align 4
  br label %186, !llvm.loop !12

215:                                              ; preds = %197
  %216 = load ptr, ptr %9, align 8
  %217 = getelementptr inbounds %struct.Attribute, ptr %216, i32 0, i32 1
  %218 = load i32, ptr %8, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [100 x i8], ptr %217, i64 0, i64 %219
  store i8 0, ptr %220, align 1
  %221 = load i32, ptr %7, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, ptr %7, align 4
  br label %223

223:                                              ; preds = %215, %175
  br label %225

224:                                              ; preds = %78
  br label %226

225:                                              ; preds = %223
  br label %58, !llvm.loop !13

226:                                              ; preds = %224, %58
  %227 = load i32, ptr %7, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, ptr %7, align 4
  %229 = load ptr, ptr %4, align 8
  %230 = load i32, ptr %7, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i8, ptr %229, i64 %231
  %233 = load i8, ptr %232, align 1
  %234 = sext i8 %233 to i32
  %235 = icmp eq i32 %234, 47
  br i1 %235, label %236, label %240

236:                                              ; preds = %226
  %237 = load i32, ptr %7, align 4
  %238 = add nsw i32 %237, 2
  store i32 %238, ptr %7, align 4
  %239 = load ptr, ptr %6, align 8
  store ptr %239, ptr %3, align 8
  br label %334

240:                                              ; preds = %226
  store i32 0, ptr %10, align 4
  %241 = load ptr, ptr %6, align 8
  %242 = getelementptr inbounds %struct.Node, ptr %241, i32 0, i32 5
  store i32 0, ptr %242, align 8
  %243 = load ptr, ptr %6, align 8
  %244 = getelementptr inbounds %struct.Node, ptr %243, i32 0, i32 4
  store ptr null, ptr %244, align 8
  br label %245

245:                                              ; preds = %253, %240
  %246 = load ptr, ptr %4, align 8
  %247 = load i32, ptr %7, align 4
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i8, ptr %246, i64 %248
  %250 = load i8, ptr %249, align 1
  %251 = sext i8 %250 to i32
  %252 = icmp ne i32 %251, 60
  br i1 %252, label %253, label %266

253:                                              ; preds = %245
  %254 = load ptr, ptr %4, align 8
  %255 = load i32, ptr %7, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, ptr %7, align 4
  %257 = sext i32 %255 to i64
  %258 = getelementptr inbounds i8, ptr %254, i64 %257
  %259 = load i8, ptr %258, align 1
  %260 = load ptr, ptr %6, align 8
  %261 = getelementptr inbounds %struct.Node, ptr %260, i32 0, i32 1
  %262 = load i32, ptr %10, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, ptr %10, align 4
  %264 = sext i32 %262 to i64
  %265 = getelementptr inbounds [100 x i8], ptr %261, i64 0, i64 %264
  store i8 %259, ptr %265, align 1
  br label %245, !llvm.loop !14

266:                                              ; preds = %245
  %267 = load ptr, ptr %6, align 8
  %268 = getelementptr inbounds %struct.Node, ptr %267, i32 0, i32 1
  %269 = load i32, ptr %10, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [100 x i8], ptr %268, i64 0, i64 %270
  store i8 0, ptr %271, align 1
  br label %272

272:                                              ; preds = %299, %266
  %273 = load ptr, ptr %4, align 8
  %274 = load i32, ptr %7, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i8, ptr %273, i64 %275
  %277 = load i8, ptr %276, align 1
  %278 = sext i8 %277 to i32
  %279 = icmp eq i32 %278, 60
  br i1 %279, label %280, label %330

280:                                              ; preds = %272
  %281 = load ptr, ptr %4, align 8
  %282 = load i32, ptr %7, align 4
  %283 = add nsw i32 %282, 1
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds i8, ptr %281, i64 %284
  %286 = load i8, ptr %285, align 1
  %287 = sext i8 %286 to i32
  %288 = icmp eq i32 %287, 47
  br i1 %288, label %289, label %299

289:                                              ; preds = %280
  %290 = load ptr, ptr %6, align 8
  %291 = getelementptr inbounds %struct.Node, ptr %290, i32 0, i32 0
  %292 = getelementptr inbounds [50 x i8], ptr %291, i64 0, i64 0
  %293 = call i64 @strlen(ptr noundef %292) #10
  %294 = add i64 %293, 2
  %295 = load i32, ptr %7, align 4
  %296 = sext i32 %295 to i64
  %297 = add i64 %296, %294
  %298 = trunc i64 %297 to i32
  store i32 %298, ptr %7, align 4
  br label %330

299:                                              ; preds = %280
  %300 = load i32, ptr %7, align 4
  %301 = add nsw i32 %300, 1
  store i32 %301, ptr %7, align 4
  %302 = load ptr, ptr %4, align 8
  %303 = call ptr @parse_node(ptr noundef %302, ptr noundef %7)
  store ptr %303, ptr %11, align 8
  %304 = load ptr, ptr %6, align 8
  %305 = getelementptr inbounds %struct.Node, ptr %304, i32 0, i32 5
  %306 = load i32, ptr %305, align 8
  %307 = add nsw i32 %306, 1
  store i32 %307, ptr %305, align 8
  %308 = load ptr, ptr %6, align 8
  %309 = getelementptr inbounds %struct.Node, ptr %308, i32 0, i32 4
  %310 = load ptr, ptr %309, align 8
  %311 = load ptr, ptr %6, align 8
  %312 = getelementptr inbounds %struct.Node, ptr %311, i32 0, i32 5
  %313 = load i32, ptr %312, align 8
  %314 = sext i32 %313 to i64
  %315 = mul i64 184, %314
  %316 = call ptr @realloc(ptr noundef %310, i64 noundef %315) #9
  %317 = load ptr, ptr %6, align 8
  %318 = getelementptr inbounds %struct.Node, ptr %317, i32 0, i32 4
  store ptr %316, ptr %318, align 8
  %319 = load ptr, ptr %6, align 8
  %320 = getelementptr inbounds %struct.Node, ptr %319, i32 0, i32 4
  %321 = load ptr, ptr %320, align 8
  %322 = load ptr, ptr %6, align 8
  %323 = getelementptr inbounds %struct.Node, ptr %322, i32 0, i32 5
  %324 = load i32, ptr %323, align 8
  %325 = sub nsw i32 %324, 1
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds %struct.Node, ptr %321, i64 %326
  %328 = load ptr, ptr %11, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %327, ptr align 8 %328, i64 184, i1 false)
  %329 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %329) #7
  br label %272, !llvm.loop !15

330:                                              ; preds = %289, %272
  %331 = load i32, ptr %7, align 4
  %332 = load ptr, ptr %5, align 8
  store i32 %331, ptr %332, align 4
  %333 = load ptr, ptr %6, align 8
  store ptr %333, ptr %3, align 8
  br label %334

334:                                              ; preds = %330, %236
  %335 = load ptr, ptr %3, align 8
  ret ptr %335
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @get_attribute_value(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %35, %2
  %8 = load i32, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 3
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %38

13:                                               ; preds = %7
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.Attribute, ptr %16, i64 %18
  %20 = getelementptr inbounds %struct.Attribute, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [50 x i8], ptr %20, i64 0, i64 0
  %22 = load ptr, ptr %5, align 8
  %23 = call i32 @strcmp(ptr noundef %21, ptr noundef %22) #10
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %34

25:                                               ; preds = %13
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.Node, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.Attribute, ptr %28, i64 %30
  %32 = getelementptr inbounds %struct.Attribute, ptr %31, i32 0, i32 1
  %33 = getelementptr inbounds [100 x i8], ptr %32, i64 0, i64 0
  store ptr %33, ptr %3, align 8
  br label %39

34:                                               ; preds = %13
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %6, align 4
  br label %7, !llvm.loop !16

38:                                               ; preds = %7
  store ptr null, ptr %3, align 8
  br label %39

39:                                               ; preds = %38, %25
  %40 = load ptr, ptr %3, align 8
  ret ptr %40
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_attributes(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %28, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Node, ptr %6, i32 0, i32 3
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %31

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.Node, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.Attribute, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.Attribute, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.Attribute, ptr %21, i64 %23
  %25 = getelementptr inbounds %struct.Attribute, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds [100 x i8], ptr %25, i64 0, i64 0
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %18, ptr noundef %26)
  br label %28

28:                                               ; preds = %10
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %3, align 4
  br label %4, !llvm.loop !17

31:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #6

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_nodes(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %6)
  %8 = load ptr, ptr %2, align 8
  call void @print_attributes(ptr noundef %8)
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 5
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %21

13:                                               ; preds = %1
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [100 x i8], ptr %15, i64 0, i64 0
  %17 = call i64 @strlen(ptr noundef %16) #10
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %13
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %55

21:                                               ; preds = %13, %1
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.Node, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds [100 x i8], ptr %24, i64 0, i64 0
  %26 = call i64 @strlen(ptr noundef %25) #10
  %27 = icmp ugt i64 %26, 0
  br i1 %27, label %28, label %33

28:                                               ; preds = %21
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 1
  %31 = getelementptr inbounds [100 x i8], ptr %30, i64 0, i64 0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %31)
  br label %33

33:                                               ; preds = %28, %21
  store i32 0, ptr %3, align 4
  br label %34

34:                                               ; preds = %47, %33
  %35 = load i32, ptr %3, align 4
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.Node, ptr %36, i32 0, i32 5
  %38 = load i32, ptr %37, align 8
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %50

40:                                               ; preds = %34
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds %struct.Node, ptr %41, i32 0, i32 4
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %3, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.Node, ptr %43, i64 %45
  call void @print_nodes(ptr noundef %46)
  br label %47

47:                                               ; preds = %40
  %48 = load i32, ptr %3, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %3, align 4
  br label %34, !llvm.loop !18

50:                                               ; preds = %34
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.Node, ptr %51, i32 0, i32 0
  %53 = getelementptr inbounds [50 x i8], ptr %52, i64 0, i64 0
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %53)
  br label %55

55:                                               ; preds = %50, %19
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @find_node_by_name(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = load ptr, ptr %5, align 8
  %12 = call i32 @strcmp(ptr noundef %10, ptr noundef %11) #10
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %2
  %15 = load ptr, ptr %4, align 8
  store ptr %15, ptr %3, align 8
  br label %41

16:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %37, %16
  %18 = load i32, ptr %6, align 4
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 5
  %21 = load i32, ptr %20, align 8
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %40

23:                                               ; preds = %17
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.Node, ptr %24, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.Node, ptr %26, i64 %28
  %30 = load ptr, ptr %5, align 8
  %31 = call ptr @find_node_by_name(ptr noundef %29, ptr noundef %30)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %34, label %36

34:                                               ; preds = %23
  %35 = load ptr, ptr %7, align 8
  store ptr %35, ptr %3, align 8
  br label %41

36:                                               ; preds = %23
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  br label %17, !llvm.loop !19

40:                                               ; preds = %17
  store ptr null, ptr %3, align 8
  br label %41

41:                                               ; preds = %40, %34, %14
  %42 = load ptr, ptr %3, align 8
  ret ptr %42
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [200 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.xml, i64 200, i1 false)
  store i32 0, ptr %3, align 4
  %7 = getelementptr inbounds [200 x i8], ptr %2, i64 0, i64 0
  %8 = call ptr @parse_node(ptr noundef %7, ptr noundef %3)
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call ptr @find_node_by_name(ptr noundef %9, ptr noundef @.str.6)
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = call ptr @get_attribute_value(ptr noundef %11, ptr noundef @.str.7)
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %13)
  %15 = load ptr, ptr %4, align 8
  call void @print_nodes(ptr noundef %15)
  %16 = load ptr, ptr %4, align 8
  call void @free_node(ptr noundef %16)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(0,1) }
attributes #9 = { nounwind allocsize(1) }
attributes #10 = { nounwind willreturn memory(read) }

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
