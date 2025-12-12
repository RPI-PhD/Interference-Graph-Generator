; ModuleID = 'DATASETv2/gpt35-71531.c'
source_filename = "DATASETv2/gpt35-71531.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [57 x i8] c"Hello and welcome to the Happy Hotel Management System!\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Please enter the number of rooms in the hotel: \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"Enter the room number for room #%d: \00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Enter the name of the occupant for room #%d: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"Enter the nightly rate for room #%d: \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [78 x i8] c"Thank you for entering the room information. Here are the available options:\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"1. Check-in a guest\0A\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"2. Check-out a guest\0A\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"3. View room status\0A\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"4. View room charges\0A\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"5. Exit the program\0A\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"Please enter your choice (1-5): \00", align 1
@.str.15 = private unnamed_addr constant [44 x i8] c"Please enter the room number for check-in: \00", align 1
@.str.16 = private unnamed_addr constant [51 x i8] c"Sorry, we could not find a room with that number.\0A\00", align 1
@.str.17 = private unnamed_addr constant [39 x i8] c"Sorry, that room is already occupied.\0A\00", align 1
@.str.18 = private unnamed_addr constant [50 x i8] c"Please enter the name of the guest for check-in: \00", align 1
@.str.19 = private unnamed_addr constant [49 x i8] c"Please enter the number of nights for the stay: \00", align 1
@.str.20 = private unnamed_addr constant [60 x i8] c"Thank you for checking in! Your total charges will be $%d.\0A\00", align 1
@.str.21 = private unnamed_addr constant [45 x i8] c"Please enter the room number for check-out: \00", align 1
@.str.22 = private unnamed_addr constant [45 x i8] c"Sorry, that room is not currently occupied.\0A\00", align 1
@.str.23 = private unnamed_addr constant [60 x i8] c"Thank you for checking out! We hope you enjoyed your stay.\0A\00", align 1
@.str.24 = private unnamed_addr constant [18 x i8] c"Available rooms:\0A\00", align 1
@.str.25 = private unnamed_addr constant [21 x i8] c"Room #%d: Available\0A\00", align 1
@.str.26 = private unnamed_addr constant [26 x i8] c"Room #%d: Occupied by %s\0A\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"Room charges:\0A\00", align 1
@.str.28 = private unnamed_addr constant [25 x i8] c"Room #%d: $%d per night\0A\00", align 1
@.str.29 = private unnamed_addr constant [56 x i8] c"Thank you for using the Happy Hotel Management System!\0A\00", align 1
@.str.30 = private unnamed_addr constant [43 x i8] c"Invalid choice entered. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
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
  %18 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %21 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %2)
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 4
  %25 = call noalias ptr @malloc(i64 noundef %24) #5
  store ptr %25, ptr %3, align 8
  %26 = load i32, ptr %2, align 4
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 8
  %29 = call noalias ptr @malloc(i64 noundef %28) #5
  store ptr %29, ptr %4, align 8
  %30 = load i32, ptr %2, align 4
  %31 = sext i32 %30 to i64
  %32 = mul i64 %31, 4
  %33 = call noalias ptr @malloc(i64 noundef %32) #5
  store ptr %33, ptr %5, align 8
  %34 = load i32, ptr %2, align 4
  %35 = sext i32 %34 to i64
  %36 = call noalias ptr @calloc(i64 noundef %35, i64 noundef 4) #6
  store ptr %36, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %37

37:                                               ; preds = %73, %0
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %2, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %76

41:                                               ; preds = %37
  %42 = load i32, ptr %7, align 4
  %43 = add nsw i32 %42, 1
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %43)
  %45 = load ptr, ptr %3, align 8
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %45, i64 %47
  %49 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %48)
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, 1
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %51)
  %53 = call noalias ptr @malloc(i64 noundef 50) #5
  %54 = load ptr, ptr %4, align 8
  %55 = load i32, ptr %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds ptr, ptr %54, i64 %56
  store ptr %53, ptr %57, align 8
  %58 = load ptr, ptr %4, align 8
  %59 = load i32, ptr %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %58, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %62)
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %65)
  %67 = load ptr, ptr %5, align 8
  %68 = load i32, ptr %7, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, ptr %67, i64 %69
  %71 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %70)
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %73

73:                                               ; preds = %41
  %74 = load i32, ptr %7, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %7, align 4
  br label %37, !llvm.loop !6

76:                                               ; preds = %37
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %79 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  store i32 0, ptr %8, align 4
  br label %83

83:                                               ; preds = %76, %269
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %85 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %8)
  %86 = load i32, ptr %8, align 4
  %87 = icmp eq i32 %86, 1
  br i1 %87, label %88, label %147

88:                                               ; preds = %83
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %90 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %9)
  store i32 -1, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %91

91:                                               ; preds = %106, %88
  %92 = load i32, ptr %11, align 4
  %93 = load i32, ptr %2, align 4
  %94 = icmp slt i32 %92, %93
  br i1 %94, label %95, label %109

95:                                               ; preds = %91
  %96 = load ptr, ptr %3, align 8
  %97 = load i32, ptr %11, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, ptr %96, i64 %98
  %100 = load i32, ptr %99, align 4
  %101 = load i32, ptr %9, align 4
  %102 = icmp eq i32 %100, %101
  br i1 %102, label %103, label %105

103:                                              ; preds = %95
  %104 = load i32, ptr %11, align 4
  store i32 %104, ptr %10, align 4
  br label %109

105:                                              ; preds = %95
  br label %106

106:                                              ; preds = %105
  %107 = load i32, ptr %11, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, ptr %11, align 4
  br label %91, !llvm.loop !8

109:                                              ; preds = %103, %91
  %110 = load i32, ptr %10, align 4
  %111 = icmp eq i32 %110, -1
  br i1 %111, label %112, label %114

112:                                              ; preds = %109
  %113 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %146

114:                                              ; preds = %109
  %115 = load ptr, ptr %6, align 8
  %116 = load i32, ptr %10, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, ptr %115, i64 %117
  %119 = load i32, ptr %118, align 4
  %120 = icmp eq i32 %119, 1
  br i1 %120, label %121, label %123

121:                                              ; preds = %114
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %145

123:                                              ; preds = %114
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %125 = load ptr, ptr %4, align 8
  %126 = load i32, ptr %10, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds ptr, ptr %125, i64 %127
  %129 = load ptr, ptr %128, align 8
  %130 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %129)
  %131 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %132 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %12)
  %133 = load ptr, ptr %6, align 8
  %134 = load i32, ptr %10, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i32, ptr %133, i64 %135
  store i32 1, ptr %136, align 4
  %137 = load i32, ptr %12, align 4
  %138 = load ptr, ptr %5, align 8
  %139 = load i32, ptr %10, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, ptr %138, i64 %140
  %142 = load i32, ptr %141, align 4
  %143 = mul nsw i32 %137, %142
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %143)
  br label %145

145:                                              ; preds = %123, %121
  br label %146

146:                                              ; preds = %145, %112
  br label %269

147:                                              ; preds = %83
  %148 = load i32, ptr %8, align 4
  %149 = icmp eq i32 %148, 2
  br i1 %149, label %150, label %193

150:                                              ; preds = %147
  %151 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %152 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %13)
  store i32 -1, ptr %14, align 4
  store i32 0, ptr %15, align 4
  br label %153

153:                                              ; preds = %168, %150
  %154 = load i32, ptr %15, align 4
  %155 = load i32, ptr %2, align 4
  %156 = icmp slt i32 %154, %155
  br i1 %156, label %157, label %171

157:                                              ; preds = %153
  %158 = load ptr, ptr %3, align 8
  %159 = load i32, ptr %15, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, ptr %158, i64 %160
  %162 = load i32, ptr %161, align 4
  %163 = load i32, ptr %13, align 4
  %164 = icmp eq i32 %162, %163
  br i1 %164, label %165, label %167

165:                                              ; preds = %157
  %166 = load i32, ptr %15, align 4
  store i32 %166, ptr %14, align 4
  br label %171

167:                                              ; preds = %157
  br label %168

168:                                              ; preds = %167
  %169 = load i32, ptr %15, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, ptr %15, align 4
  br label %153, !llvm.loop !9

171:                                              ; preds = %165, %153
  %172 = load i32, ptr %14, align 4
  %173 = icmp eq i32 %172, -1
  br i1 %173, label %174, label %176

174:                                              ; preds = %171
  %175 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %192

176:                                              ; preds = %171
  %177 = load ptr, ptr %6, align 8
  %178 = load i32, ptr %14, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds i32, ptr %177, i64 %179
  %181 = load i32, ptr %180, align 4
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %183, label %185

183:                                              ; preds = %176
  %184 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  br label %191

185:                                              ; preds = %176
  %186 = load ptr, ptr %6, align 8
  %187 = load i32, ptr %14, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i32, ptr %186, i64 %188
  store i32 0, ptr %189, align 4
  %190 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %191

191:                                              ; preds = %185, %183
  br label %192

192:                                              ; preds = %191, %174
  br label %268

193:                                              ; preds = %147
  %194 = load i32, ptr %8, align 4
  %195 = icmp eq i32 %194, 3
  br i1 %195, label %196, label %233

196:                                              ; preds = %193
  %197 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  store i32 0, ptr %16, align 4
  br label %198

198:                                              ; preds = %229, %196
  %199 = load i32, ptr %16, align 4
  %200 = load i32, ptr %2, align 4
  %201 = icmp slt i32 %199, %200
  br i1 %201, label %202, label %232

202:                                              ; preds = %198
  %203 = load ptr, ptr %6, align 8
  %204 = load i32, ptr %16, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i32, ptr %203, i64 %205
  %207 = load i32, ptr %206, align 4
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %209, label %216

209:                                              ; preds = %202
  %210 = load ptr, ptr %3, align 8
  %211 = load i32, ptr %16, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, ptr %210, i64 %212
  %214 = load i32, ptr %213, align 4
  %215 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i32 noundef %214)
  br label %228

216:                                              ; preds = %202
  %217 = load ptr, ptr %3, align 8
  %218 = load i32, ptr %16, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i32, ptr %217, i64 %219
  %221 = load i32, ptr %220, align 4
  %222 = load ptr, ptr %4, align 8
  %223 = load i32, ptr %16, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds ptr, ptr %222, i64 %224
  %226 = load ptr, ptr %225, align 8
  %227 = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %221, ptr noundef %226)
  br label %228

228:                                              ; preds = %216, %209
  br label %229

229:                                              ; preds = %228
  %230 = load i32, ptr %16, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, ptr %16, align 4
  br label %198, !llvm.loop !10

232:                                              ; preds = %198
  br label %267

233:                                              ; preds = %193
  %234 = load i32, ptr %8, align 4
  %235 = icmp eq i32 %234, 4
  br i1 %235, label %236, label %258

236:                                              ; preds = %233
  %237 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  store i32 0, ptr %17, align 4
  br label %238

238:                                              ; preds = %254, %236
  %239 = load i32, ptr %17, align 4
  %240 = load i32, ptr %2, align 4
  %241 = icmp slt i32 %239, %240
  br i1 %241, label %242, label %257

242:                                              ; preds = %238
  %243 = load ptr, ptr %3, align 8
  %244 = load i32, ptr %17, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i32, ptr %243, i64 %245
  %247 = load i32, ptr %246, align 4
  %248 = load ptr, ptr %5, align 8
  %249 = load i32, ptr %17, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds i32, ptr %248, i64 %250
  %252 = load i32, ptr %251, align 4
  %253 = call i32 (ptr, ...) @printf(ptr noundef @.str.28, i32 noundef %247, i32 noundef %252)
  br label %254

254:                                              ; preds = %242
  %255 = load i32, ptr %17, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, ptr %17, align 4
  br label %238, !llvm.loop !11

257:                                              ; preds = %238
  br label %266

258:                                              ; preds = %233
  %259 = load i32, ptr %8, align 4
  %260 = icmp eq i32 %259, 5
  br i1 %260, label %261, label %263

261:                                              ; preds = %258
  %262 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %270

263:                                              ; preds = %258
  %264 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  br label %265

265:                                              ; preds = %263
  br label %266

266:                                              ; preds = %265, %257
  br label %267

267:                                              ; preds = %266, %232
  br label %268

268:                                              ; preds = %267, %192
  br label %269

269:                                              ; preds = %268, %146
  br label %83

270:                                              ; preds = %261
  %271 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %271) #7
  store i32 0, ptr %18, align 4
  br label %272

272:                                              ; preds = %282, %270
  %273 = load i32, ptr %18, align 4
  %274 = load i32, ptr %2, align 4
  %275 = icmp slt i32 %273, %274
  br i1 %275, label %276, label %285

276:                                              ; preds = %272
  %277 = load ptr, ptr %4, align 8
  %278 = load i32, ptr %18, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds ptr, ptr %277, i64 %279
  %281 = load ptr, ptr %280, align 8
  call void @free(ptr noundef %281) #7
  br label %282

282:                                              ; preds = %276
  %283 = load i32, ptr %18, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, ptr %18, align 4
  br label %272, !llvm.loop !12

285:                                              ; preds = %272
  %286 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %286) #7
  %287 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %287) #7
  %288 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %288) #7
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind allocsize(0,1) }
attributes #7 = { nounwind }

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
