; ModuleID = 'DATASETv2/gemma7b-5689.c'
source_filename = "DATASETv2/gemma7b-5689.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Planet = type { [20 x i8], double, double, double, double, double, double, double }

@__const.main.planets = private unnamed_addr constant [5 x %struct.Planet] [%struct.Planet { [20 x i8] c"Sun\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 1.000000e+30, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Mercury\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -2.500000e+11, double 0.000000e+00, double 0.000000e+00, double -3.000000e+04, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Venus\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -2.000000e+11, double 0.000000e+00, double 0.000000e+00, double -2.000000e+04, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Earth\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -1.500000e+11, double 0.000000e+00, double 0.000000e+00, double -1.000000e+04, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Mars\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -1.000000e+11, double 0.000000e+00, double 0.000000e+00, double -5.000000e+03, double 0.000000e+00, double 0.000000e+00 }], align 16
@.str = private unnamed_addr constant [18 x i8] c"%s: (%f, %f, %f)\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x %struct.Planet], align 16
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.planets, i64 400, i1 false)
  store double 6.674000e-11, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %14

14:                                               ; preds = %182, %0
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 5
  br i1 %16, label %17, label %185

17:                                               ; preds = %14
  %18 = load i32, ptr %4, align 4
  store i32 %18, ptr %5, align 4
  br label %19

19:                                               ; preds = %178, %17
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 5
  br i1 %21, label %22, label %181

22:                                               ; preds = %19
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp ne i32 %23, %24
  br i1 %25, label %26, label %177

26:                                               ; preds = %22
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.Planet, ptr %29, i32 0, i32 2
  %31 = load double, ptr %30, align 16
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.Planet, ptr %34, i32 0, i32 2
  %36 = load double, ptr %35, align 16
  %37 = fsub double %31, %36
  store double %37, ptr %6, align 8
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.Planet, ptr %40, i32 0, i32 3
  %42 = load double, ptr %41, align 8
  %43 = load i32, ptr %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.Planet, ptr %45, i32 0, i32 3
  %47 = load double, ptr %46, align 8
  %48 = fsub double %42, %47
  store double %48, ptr %7, align 8
  %49 = load i32, ptr %5, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %50
  %52 = getelementptr inbounds %struct.Planet, ptr %51, i32 0, i32 4
  %53 = load double, ptr %52, align 16
  %54 = load i32, ptr %4, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.Planet, ptr %56, i32 0, i32 4
  %58 = load double, ptr %57, align 16
  %59 = fsub double %53, %58
  store double %59, ptr %8, align 8
  %60 = load double, ptr %6, align 8
  %61 = load double, ptr %6, align 8
  %62 = load double, ptr %7, align 8
  %63 = load double, ptr %7, align 8
  %64 = fmul double %62, %63
  %65 = call double @llvm.fmuladd.f64(double %60, double %61, double %64)
  %66 = load double, ptr %8, align 8
  %67 = load double, ptr %8, align 8
  %68 = call double @llvm.fmuladd.f64(double %66, double %67, double %65)
  %69 = call double @sqrt(double noundef %68) #5
  store double %69, ptr %9, align 8
  %70 = load double, ptr %3, align 8
  %71 = load i32, ptr %4, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %72
  %74 = getelementptr inbounds %struct.Planet, ptr %73, i32 0, i32 1
  %75 = load double, ptr %74, align 8
  %76 = fmul double %70, %75
  %77 = load i32, ptr %5, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %78
  %80 = getelementptr inbounds %struct.Planet, ptr %79, i32 0, i32 1
  %81 = load double, ptr %80, align 8
  %82 = fmul double %76, %81
  %83 = load double, ptr %9, align 8
  %84 = fdiv double %82, %83
  %85 = load double, ptr %9, align 8
  %86 = fmul double %84, %85
  store double %86, ptr %10, align 8
  %87 = load double, ptr %10, align 8
  %88 = load double, ptr %6, align 8
  %89 = fmul double %87, %88
  %90 = load i32, ptr %4, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %91
  %93 = getelementptr inbounds %struct.Planet, ptr %92, i32 0, i32 1
  %94 = load double, ptr %93, align 8
  %95 = fdiv double %89, %94
  %96 = load i32, ptr %4, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %97
  %99 = getelementptr inbounds %struct.Planet, ptr %98, i32 0, i32 5
  %100 = load double, ptr %99, align 8
  %101 = fadd double %100, %95
  store double %101, ptr %99, align 8
  %102 = load double, ptr %10, align 8
  %103 = load double, ptr %7, align 8
  %104 = fmul double %102, %103
  %105 = load i32, ptr %4, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %106
  %108 = getelementptr inbounds %struct.Planet, ptr %107, i32 0, i32 1
  %109 = load double, ptr %108, align 8
  %110 = fdiv double %104, %109
  %111 = load i32, ptr %4, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %112
  %114 = getelementptr inbounds %struct.Planet, ptr %113, i32 0, i32 6
  %115 = load double, ptr %114, align 16
  %116 = fadd double %115, %110
  store double %116, ptr %114, align 16
  %117 = load double, ptr %10, align 8
  %118 = load double, ptr %8, align 8
  %119 = fmul double %117, %118
  %120 = load i32, ptr %4, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.Planet, ptr %122, i32 0, i32 1
  %124 = load double, ptr %123, align 8
  %125 = fdiv double %119, %124
  %126 = load i32, ptr %4, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %127
  %129 = getelementptr inbounds %struct.Planet, ptr %128, i32 0, i32 7
  %130 = load double, ptr %129, align 8
  %131 = fadd double %130, %125
  store double %131, ptr %129, align 8
  %132 = load double, ptr %10, align 8
  %133 = load double, ptr %6, align 8
  %134 = fmul double %132, %133
  %135 = load i32, ptr %5, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %136
  %138 = getelementptr inbounds %struct.Planet, ptr %137, i32 0, i32 1
  %139 = load double, ptr %138, align 8
  %140 = fdiv double %134, %139
  %141 = load i32, ptr %5, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %142
  %144 = getelementptr inbounds %struct.Planet, ptr %143, i32 0, i32 5
  %145 = load double, ptr %144, align 8
  %146 = fsub double %145, %140
  store double %146, ptr %144, align 8
  %147 = load double, ptr %10, align 8
  %148 = load double, ptr %7, align 8
  %149 = fmul double %147, %148
  %150 = load i32, ptr %5, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %151
  %153 = getelementptr inbounds %struct.Planet, ptr %152, i32 0, i32 1
  %154 = load double, ptr %153, align 8
  %155 = fdiv double %149, %154
  %156 = load i32, ptr %5, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %157
  %159 = getelementptr inbounds %struct.Planet, ptr %158, i32 0, i32 6
  %160 = load double, ptr %159, align 16
  %161 = fsub double %160, %155
  store double %161, ptr %159, align 16
  %162 = load double, ptr %10, align 8
  %163 = load double, ptr %8, align 8
  %164 = fmul double %162, %163
  %165 = load i32, ptr %5, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %166
  %168 = getelementptr inbounds %struct.Planet, ptr %167, i32 0, i32 1
  %169 = load double, ptr %168, align 8
  %170 = fdiv double %164, %169
  %171 = load i32, ptr %5, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %172
  %174 = getelementptr inbounds %struct.Planet, ptr %173, i32 0, i32 7
  %175 = load double, ptr %174, align 8
  %176 = fsub double %175, %170
  store double %176, ptr %174, align 8
  br label %177

177:                                              ; preds = %26, %22
  br label %178

178:                                              ; preds = %177
  %179 = load i32, ptr %5, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, ptr %5, align 4
  br label %19, !llvm.loop !6

181:                                              ; preds = %19
  br label %182

182:                                              ; preds = %181
  %183 = load i32, ptr %4, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, ptr %4, align 4
  br label %14, !llvm.loop !8

185:                                              ; preds = %14
  store i32 0, ptr %11, align 4
  br label %186

186:                                              ; preds = %243, %185
  %187 = load i32, ptr %11, align 4
  %188 = icmp slt i32 %187, 1000
  br i1 %188, label %189, label %246

189:                                              ; preds = %186
  store i32 0, ptr %12, align 4
  br label %190

190:                                              ; preds = %239, %189
  %191 = load i32, ptr %12, align 4
  %192 = icmp slt i32 %191, 5
  br i1 %192, label %193, label %242

193:                                              ; preds = %190
  %194 = load i32, ptr %12, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %195
  %197 = getelementptr inbounds %struct.Planet, ptr %196, i32 0, i32 5
  %198 = load double, ptr %197, align 8
  %199 = load i32, ptr %11, align 4
  %200 = sitofp i32 %199 to double
  %201 = fmul double %198, %200
  %202 = fdiv double %201, 1.000000e+03
  %203 = load i32, ptr %12, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %204
  %206 = getelementptr inbounds %struct.Planet, ptr %205, i32 0, i32 2
  %207 = load double, ptr %206, align 16
  %208 = fadd double %207, %202
  store double %208, ptr %206, align 16
  %209 = load i32, ptr %12, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %210
  %212 = getelementptr inbounds %struct.Planet, ptr %211, i32 0, i32 6
  %213 = load double, ptr %212, align 16
  %214 = load i32, ptr %11, align 4
  %215 = sitofp i32 %214 to double
  %216 = fmul double %213, %215
  %217 = fdiv double %216, 1.000000e+03
  %218 = load i32, ptr %12, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %219
  %221 = getelementptr inbounds %struct.Planet, ptr %220, i32 0, i32 3
  %222 = load double, ptr %221, align 8
  %223 = fadd double %222, %217
  store double %223, ptr %221, align 8
  %224 = load i32, ptr %12, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %225
  %227 = getelementptr inbounds %struct.Planet, ptr %226, i32 0, i32 7
  %228 = load double, ptr %227, align 8
  %229 = load i32, ptr %11, align 4
  %230 = sitofp i32 %229 to double
  %231 = fmul double %228, %230
  %232 = fdiv double %231, 1.000000e+03
  %233 = load i32, ptr %12, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %234
  %236 = getelementptr inbounds %struct.Planet, ptr %235, i32 0, i32 4
  %237 = load double, ptr %236, align 16
  %238 = fadd double %237, %232
  store double %238, ptr %236, align 16
  br label %239

239:                                              ; preds = %193
  %240 = load i32, ptr %12, align 4
  %241 = add nsw i32 %240, 1
  store i32 %241, ptr %12, align 4
  br label %190, !llvm.loop !9

242:                                              ; preds = %190
  br label %243

243:                                              ; preds = %242
  %244 = load i32, ptr %11, align 4
  %245 = add nsw i32 %244, 1
  store i32 %245, ptr %11, align 4
  br label %186, !llvm.loop !10

246:                                              ; preds = %186
  store i32 0, ptr %13, align 4
  br label %247

247:                                              ; preds = %272, %246
  %248 = load i32, ptr %13, align 4
  %249 = icmp slt i32 %248, 5
  br i1 %249, label %250, label %275

250:                                              ; preds = %247
  %251 = load i32, ptr %13, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %252
  %254 = getelementptr inbounds %struct.Planet, ptr %253, i32 0, i32 0
  %255 = getelementptr inbounds [20 x i8], ptr %254, i64 0, i64 0
  %256 = load i32, ptr %13, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %257
  %259 = getelementptr inbounds %struct.Planet, ptr %258, i32 0, i32 2
  %260 = load double, ptr %259, align 16
  %261 = load i32, ptr %13, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %262
  %264 = getelementptr inbounds %struct.Planet, ptr %263, i32 0, i32 3
  %265 = load double, ptr %264, align 8
  %266 = load i32, ptr %13, align 4
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [5 x %struct.Planet], ptr %2, i64 0, i64 %267
  %269 = getelementptr inbounds %struct.Planet, ptr %268, i32 0, i32 4
  %270 = load double, ptr %269, align 16
  %271 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %255, double noundef %260, double noundef %265, double noundef %270)
  br label %272

272:                                              ; preds = %250
  %273 = load i32, ptr %13, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, ptr %13, align 4
  br label %247, !llvm.loop !11

275:                                              ; preds = %247
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

declare i32 @printf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
