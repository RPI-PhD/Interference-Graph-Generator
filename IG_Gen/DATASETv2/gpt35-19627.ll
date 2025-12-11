; ModuleID = 'DATASETv2/gpt35-19627.c'
source_filename = "DATASETv2/gpt35-19627.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Image = type { i32, i32, ptr }
%struct.Pixel = type { i8, i8, i8 }

@.str = private unnamed_addr constant [25 x i8] c"This is a secret message\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"cover_image.bmp\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"Error: message too large to hide in image\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"stego_image.bmp\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"Extracted message: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.Image, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i8, align 1
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.Pixel, align 1
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca %struct.Pixel, align 1
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca i8, align 1
  %25 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr @.str, ptr %6, align 8
  %26 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  store ptr %26, ptr %7, align 8
  %27 = load ptr, ptr %7, align 8
  %28 = call i64 @fread(ptr noundef %8, i64 noundef 16, i64 noundef 1, ptr noundef %27)
  %29 = load ptr, ptr %7, align 8
  %30 = call i32 @fclose(ptr noundef %29)
  %31 = getelementptr inbounds %struct.Image, ptr %8, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = getelementptr inbounds %struct.Image, ptr %8, i32 0, i32 1
  %34 = load i32, ptr %33, align 4
  %35 = mul i32 %32, %34
  store i32 %35, ptr %9, align 4
  %36 = load ptr, ptr %6, align 8
  %37 = call i64 @strlen(ptr noundef %36) #5
  %38 = trunc i64 %37 to i32
  store i32 %38, ptr %10, align 4
  %39 = load i32, ptr %10, align 4
  %40 = mul nsw i32 %39, 8
  store i32 %40, ptr %11, align 4
  %41 = load i32, ptr %11, align 4
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = call noalias ptr @malloc(i64 noundef %43) #6
  store ptr %44, ptr %12, align 8
  store i32 0, ptr %13, align 4
  br label %45

45:                                               ; preds = %80, %2
  %46 = load i32, ptr %13, align 4
  %47 = load i32, ptr %10, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %83

49:                                               ; preds = %45
  %50 = load ptr, ptr %6, align 8
  %51 = load i32, ptr %13, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %50, i64 %52
  %54 = load i8, ptr %53, align 1
  store i8 %54, ptr %14, align 1
  store i32 0, ptr %15, align 4
  br label %55

55:                                               ; preds = %76, %49
  %56 = load i32, ptr %15, align 4
  %57 = icmp slt i32 %56, 8
  br i1 %57, label %58, label %79

58:                                               ; preds = %55
  %59 = load i8, ptr %14, align 1
  %60 = sext i8 %59 to i32
  %61 = load i32, ptr %15, align 4
  %62 = sub nsw i32 7, %61
  %63 = ashr i32 %60, %62
  %64 = and i32 %63, 1
  %65 = icmp ne i32 %64, 0
  %66 = zext i1 %65 to i64
  %67 = select i1 %65, i32 49, i32 48
  %68 = trunc i32 %67 to i8
  %69 = load ptr, ptr %12, align 8
  %70 = load i32, ptr %13, align 4
  %71 = mul nsw i32 %70, 8
  %72 = load i32, ptr %15, align 4
  %73 = add nsw i32 %71, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, ptr %69, i64 %74
  store i8 %68, ptr %75, align 1
  br label %76

76:                                               ; preds = %58
  %77 = load i32, ptr %15, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %15, align 4
  br label %55, !llvm.loop !6

79:                                               ; preds = %55
  br label %80

80:                                               ; preds = %79
  %81 = load i32, ptr %13, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %13, align 4
  br label %45, !llvm.loop !8

83:                                               ; preds = %45
  %84 = load ptr, ptr %12, align 8
  %85 = load i32, ptr %11, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, ptr %84, i64 %86
  store i8 0, ptr %87, align 1
  %88 = load i32, ptr %11, align 4
  %89 = load i32, ptr %9, align 4
  %90 = mul nsw i32 %89, 3
  %91 = icmp sgt i32 %88, %90
  br i1 %91, label %92, label %94

92:                                               ; preds = %83
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 1, ptr %3, align 4
  br label %322

94:                                               ; preds = %83
  store i32 0, ptr %16, align 4
  store i32 0, ptr %17, align 4
  br label %95

95:                                               ; preds = %178, %94
  %96 = load i32, ptr %17, align 4
  %97 = load i32, ptr %9, align 4
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %99, label %181

99:                                               ; preds = %95
  %100 = getelementptr inbounds %struct.Image, ptr %8, i32 0, i32 2
  %101 = load ptr, ptr %100, align 8
  %102 = load i32, ptr %17, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds %struct.Pixel, ptr %101, i64 %103
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %18, ptr align 1 %104, i64 3, i1 false)
  %105 = load i32, ptr %16, align 4
  %106 = load i32, ptr %11, align 4
  %107 = icmp slt i32 %105, %106
  br i1 %107, label %108, label %172

108:                                              ; preds = %99
  %109 = getelementptr inbounds %struct.Pixel, ptr %18, i32 0, i32 0
  %110 = load i8, ptr %109, align 1
  %111 = zext i8 %110 to i32
  %112 = and i32 %111, -2
  %113 = trunc i32 %112 to i8
  store i8 %113, ptr %109, align 1
  %114 = getelementptr inbounds %struct.Pixel, ptr %18, i32 0, i32 1
  %115 = load i8, ptr %114, align 1
  %116 = zext i8 %115 to i32
  %117 = and i32 %116, -2
  %118 = trunc i32 %117 to i8
  store i8 %118, ptr %114, align 1
  %119 = getelementptr inbounds %struct.Pixel, ptr %18, i32 0, i32 2
  %120 = load i8, ptr %119, align 1
  %121 = zext i8 %120 to i32
  %122 = and i32 %121, -2
  %123 = trunc i32 %122 to i8
  store i8 %123, ptr %119, align 1
  %124 = load ptr, ptr %12, align 8
  %125 = load i32, ptr %16, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, ptr %124, i64 %126
  %128 = load i8, ptr %127, align 1
  %129 = sext i8 %128 to i32
  %130 = icmp eq i32 %129, 49
  br i1 %130, label %131, label %137

131:                                              ; preds = %108
  %132 = getelementptr inbounds %struct.Pixel, ptr %18, i32 0, i32 0
  %133 = load i8, ptr %132, align 1
  %134 = zext i8 %133 to i32
  %135 = or i32 %134, 1
  %136 = trunc i32 %135 to i8
  store i8 %136, ptr %132, align 1
  br label %137

137:                                              ; preds = %131, %108
  %138 = load i32, ptr %16, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, ptr %16, align 4
  %140 = load ptr, ptr %12, align 8
  %141 = load i32, ptr %16, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, ptr %140, i64 %142
  %144 = load i8, ptr %143, align 1
  %145 = sext i8 %144 to i32
  %146 = icmp eq i32 %145, 49
  br i1 %146, label %147, label %153

147:                                              ; preds = %137
  %148 = getelementptr inbounds %struct.Pixel, ptr %18, i32 0, i32 1
  %149 = load i8, ptr %148, align 1
  %150 = zext i8 %149 to i32
  %151 = or i32 %150, 1
  %152 = trunc i32 %151 to i8
  store i8 %152, ptr %148, align 1
  br label %153

153:                                              ; preds = %147, %137
  %154 = load i32, ptr %16, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %16, align 4
  %156 = load ptr, ptr %12, align 8
  %157 = load i32, ptr %16, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, ptr %156, i64 %158
  %160 = load i8, ptr %159, align 1
  %161 = sext i8 %160 to i32
  %162 = icmp eq i32 %161, 49
  br i1 %162, label %163, label %169

163:                                              ; preds = %153
  %164 = getelementptr inbounds %struct.Pixel, ptr %18, i32 0, i32 2
  %165 = load i8, ptr %164, align 1
  %166 = zext i8 %165 to i32
  %167 = or i32 %166, 1
  %168 = trunc i32 %167 to i8
  store i8 %168, ptr %164, align 1
  br label %169

169:                                              ; preds = %163, %153
  %170 = load i32, ptr %16, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, ptr %16, align 4
  br label %172

172:                                              ; preds = %169, %99
  %173 = getelementptr inbounds %struct.Image, ptr %8, i32 0, i32 2
  %174 = load ptr, ptr %173, align 8
  %175 = load i32, ptr %17, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds %struct.Pixel, ptr %174, i64 %176
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %177, ptr align 1 %18, i64 3, i1 false)
  br label %178

178:                                              ; preds = %172
  %179 = load i32, ptr %17, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, ptr %17, align 4
  br label %95, !llvm.loop !9

181:                                              ; preds = %95
  %182 = call noalias ptr @fopen(ptr noundef @.str.4, ptr noundef @.str.5)
  store ptr %182, ptr %7, align 8
  %183 = load ptr, ptr %7, align 8
  %184 = call i64 @fwrite(ptr noundef %8, i64 noundef 16, i64 noundef 1, ptr noundef %183)
  %185 = load ptr, ptr %7, align 8
  %186 = call i32 @fclose(ptr noundef %185)
  %187 = call noalias ptr @fopen(ptr noundef @.str.4, ptr noundef @.str.2)
  store ptr %187, ptr %7, align 8
  %188 = load ptr, ptr %7, align 8
  %189 = call i64 @fread(ptr noundef %8, i64 noundef 16, i64 noundef 1, ptr noundef %188)
  %190 = load ptr, ptr %7, align 8
  %191 = call i32 @fclose(ptr noundef %190)
  %192 = load i32, ptr %11, align 4
  %193 = add nsw i32 %192, 1
  %194 = sext i32 %193 to i64
  %195 = call noalias ptr @malloc(i64 noundef %194) #6
  store ptr %195, ptr %19, align 8
  store i32 0, ptr %16, align 4
  store i32 0, ptr %20, align 4
  br label %196

196:                                              ; preds = %265, %181
  %197 = load i32, ptr %20, align 4
  %198 = load i32, ptr %9, align 4
  %199 = icmp slt i32 %197, %198
  br i1 %199, label %200, label %268

200:                                              ; preds = %196
  %201 = getelementptr inbounds %struct.Image, ptr %8, i32 0, i32 2
  %202 = load ptr, ptr %201, align 8
  %203 = load i32, ptr %20, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds %struct.Pixel, ptr %202, i64 %204
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %21, ptr align 1 %205, i64 3, i1 false)
  %206 = load i32, ptr %16, align 4
  %207 = load i32, ptr %11, align 4
  %208 = icmp slt i32 %206, %207
  br i1 %208, label %209, label %264

209:                                              ; preds = %200
  %210 = getelementptr inbounds %struct.Pixel, ptr %21, i32 0, i32 0
  %211 = load i8, ptr %210, align 1
  %212 = zext i8 %211 to i32
  %213 = and i32 %212, 1
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %220

215:                                              ; preds = %209
  %216 = load ptr, ptr %19, align 8
  %217 = load i32, ptr %16, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds i8, ptr %216, i64 %218
  store i8 49, ptr %219, align 1
  br label %225

220:                                              ; preds = %209
  %221 = load ptr, ptr %19, align 8
  %222 = load i32, ptr %16, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i8, ptr %221, i64 %223
  store i8 48, ptr %224, align 1
  br label %225

225:                                              ; preds = %220, %215
  %226 = load i32, ptr %16, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, ptr %16, align 4
  %228 = getelementptr inbounds %struct.Pixel, ptr %21, i32 0, i32 1
  %229 = load i8, ptr %228, align 1
  %230 = zext i8 %229 to i32
  %231 = and i32 %230, 1
  %232 = icmp ne i32 %231, 0
  br i1 %232, label %233, label %238

233:                                              ; preds = %225
  %234 = load ptr, ptr %19, align 8
  %235 = load i32, ptr %16, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds i8, ptr %234, i64 %236
  store i8 49, ptr %237, align 1
  br label %243

238:                                              ; preds = %225
  %239 = load ptr, ptr %19, align 8
  %240 = load i32, ptr %16, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i8, ptr %239, i64 %241
  store i8 48, ptr %242, align 1
  br label %243

243:                                              ; preds = %238, %233
  %244 = load i32, ptr %16, align 4
  %245 = add nsw i32 %244, 1
  store i32 %245, ptr %16, align 4
  %246 = getelementptr inbounds %struct.Pixel, ptr %21, i32 0, i32 2
  %247 = load i8, ptr %246, align 1
  %248 = zext i8 %247 to i32
  %249 = and i32 %248, 1
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %251, label %256

251:                                              ; preds = %243
  %252 = load ptr, ptr %19, align 8
  %253 = load i32, ptr %16, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i8, ptr %252, i64 %254
  store i8 49, ptr %255, align 1
  br label %261

256:                                              ; preds = %243
  %257 = load ptr, ptr %19, align 8
  %258 = load i32, ptr %16, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds i8, ptr %257, i64 %259
  store i8 48, ptr %260, align 1
  br label %261

261:                                              ; preds = %256, %251
  %262 = load i32, ptr %16, align 4
  %263 = add nsw i32 %262, 1
  store i32 %263, ptr %16, align 4
  br label %264

264:                                              ; preds = %261, %200
  br label %265

265:                                              ; preds = %264
  %266 = load i32, ptr %20, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, ptr %20, align 4
  br label %196, !llvm.loop !10

268:                                              ; preds = %196
  %269 = load ptr, ptr %19, align 8
  %270 = load i32, ptr %11, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i8, ptr %269, i64 %271
  store i8 0, ptr %272, align 1
  %273 = load i32, ptr %10, align 4
  %274 = add nsw i32 %273, 1
  %275 = sext i32 %274 to i64
  %276 = call noalias ptr @malloc(i64 noundef %275) #6
  store ptr %276, ptr %22, align 8
  store i32 0, ptr %23, align 4
  br label %277

277:                                              ; preds = %312, %268
  %278 = load i32, ptr %23, align 4
  %279 = load i32, ptr %10, align 4
  %280 = icmp slt i32 %278, %279
  br i1 %280, label %281, label %315

281:                                              ; preds = %277
  store i8 0, ptr %24, align 1
  store i32 0, ptr %25, align 4
  br label %282

282:                                              ; preds = %303, %281
  %283 = load i32, ptr %25, align 4
  %284 = icmp slt i32 %283, 8
  br i1 %284, label %285, label %306

285:                                              ; preds = %282
  %286 = load ptr, ptr %19, align 8
  %287 = load i32, ptr %23, align 4
  %288 = mul nsw i32 %287, 8
  %289 = load i32, ptr %25, align 4
  %290 = add nsw i32 %288, %289
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds i8, ptr %286, i64 %291
  %293 = load i8, ptr %292, align 1
  %294 = sext i8 %293 to i32
  %295 = sub nsw i32 %294, 48
  %296 = load i32, ptr %25, align 4
  %297 = sub nsw i32 7, %296
  %298 = shl i32 %295, %297
  %299 = load i8, ptr %24, align 1
  %300 = sext i8 %299 to i32
  %301 = or i32 %300, %298
  %302 = trunc i32 %301 to i8
  store i8 %302, ptr %24, align 1
  br label %303

303:                                              ; preds = %285
  %304 = load i32, ptr %25, align 4
  %305 = add nsw i32 %304, 1
  store i32 %305, ptr %25, align 4
  br label %282, !llvm.loop !11

306:                                              ; preds = %282
  %307 = load i8, ptr %24, align 1
  %308 = load ptr, ptr %22, align 8
  %309 = load i32, ptr %23, align 4
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds i8, ptr %308, i64 %310
  store i8 %307, ptr %311, align 1
  br label %312

312:                                              ; preds = %306
  %313 = load i32, ptr %23, align 4
  %314 = add nsw i32 %313, 1
  store i32 %314, ptr %23, align 4
  br label %277, !llvm.loop !12

315:                                              ; preds = %277
  %316 = load ptr, ptr %22, align 8
  %317 = load i32, ptr %10, align 4
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i8, ptr %316, i64 %318
  store i8 0, ptr %319, align 1
  %320 = load ptr, ptr %22, align 8
  %321 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %320)
  store i32 0, ptr %3, align 4
  br label %322

322:                                              ; preds = %315, %92
  %323 = load i32, ptr %3, align 4
  ret i32 %323
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind allocsize(0) }

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
