; ModuleID = 'LLVM_IR/gemma7b-5689.ll'
source_filename = "DATASETv2/gemma7b-5689.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Planet = type { [20 x i8], double, double, double, double, double, double, double }

@__const.main.planets = private unnamed_addr constant [5 x %struct.Planet] [%struct.Planet { [20 x i8] c"Sun\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 1.000000e+30, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Mercury\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -2.500000e+11, double 0.000000e+00, double 0.000000e+00, double -3.000000e+04, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Venus\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -2.000000e+11, double 0.000000e+00, double 0.000000e+00, double -2.000000e+04, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Earth\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -1.500000e+11, double 0.000000e+00, double 0.000000e+00, double -1.000000e+04, double 0.000000e+00, double 0.000000e+00 }, %struct.Planet { [20 x i8] c"Mars\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", double 0x44EA784379D99DB4, double -1.000000e+11, double 0.000000e+00, double 0.000000e+00, double -5.000000e+03, double 0.000000e+00, double 0.000000e+00 }], align 16
@.str = private unnamed_addr constant [18 x i8] c"%s: (%f, %f, %f)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.Planet], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.planets, i64 400, i1 false)
  br label %2

2:                                                ; preds = %123, %0
  %.02 = phi i32 [ 0, %0 ], [ %124, %123 ]
  %3 = icmp slt i32 %.02, 5
  br i1 %3, label %4, label %125

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %120, %4
  %.03 = phi i32 [ %.02, %4 ], [ %121, %120 ]
  %6 = icmp slt i32 %.03, 5
  br i1 %6, label %7, label %122

7:                                                ; preds = %5
  %8 = icmp ne i32 %.02, %.03
  br i1 %8, label %9, label %119

9:                                                ; preds = %7
  %10 = sext i32 %.03 to i64
  %11 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Planet, ptr %11, i32 0, i32 2
  %13 = load double, ptr %12, align 16
  %14 = sext i32 %.02 to i64
  %15 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Planet, ptr %15, i32 0, i32 2
  %17 = load double, ptr %16, align 16
  %18 = fsub double %13, %17
  %19 = sext i32 %.03 to i64
  %20 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Planet, ptr %20, i32 0, i32 3
  %22 = load double, ptr %21, align 8
  %23 = sext i32 %.02 to i64
  %24 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Planet, ptr %24, i32 0, i32 3
  %26 = load double, ptr %25, align 8
  %27 = fsub double %22, %26
  %28 = sext i32 %.03 to i64
  %29 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.Planet, ptr %29, i32 0, i32 4
  %31 = load double, ptr %30, align 16
  %32 = sext i32 %.02 to i64
  %33 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %32
  %34 = getelementptr inbounds %struct.Planet, ptr %33, i32 0, i32 4
  %35 = load double, ptr %34, align 16
  %36 = fsub double %31, %35
  %37 = fmul double %27, %27
  %38 = call double @llvm.fmuladd.f64(double %18, double %18, double %37)
  %39 = call double @llvm.fmuladd.f64(double %36, double %36, double %38)
  %40 = call double @sqrt(double noundef %39) #5
  %41 = sext i32 %.02 to i64
  %42 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.Planet, ptr %42, i32 0, i32 1
  %44 = load double, ptr %43, align 8
  %45 = fmul double 6.674000e-11, %44
  %46 = sext i32 %.03 to i64
  %47 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.Planet, ptr %47, i32 0, i32 1
  %49 = load double, ptr %48, align 8
  %50 = fmul double %45, %49
  %51 = fdiv double %50, %40
  %52 = fmul double %51, %40
  %53 = fmul double %52, %18
  %54 = sext i32 %.02 to i64
  %55 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %54
  %56 = getelementptr inbounds %struct.Planet, ptr %55, i32 0, i32 1
  %57 = load double, ptr %56, align 8
  %58 = fdiv double %53, %57
  %59 = sext i32 %.02 to i64
  %60 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.Planet, ptr %60, i32 0, i32 5
  %62 = load double, ptr %61, align 8
  %63 = fadd double %62, %58
  store double %63, ptr %61, align 8
  %64 = fmul double %52, %27
  %65 = sext i32 %.02 to i64
  %66 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %65
  %67 = getelementptr inbounds %struct.Planet, ptr %66, i32 0, i32 1
  %68 = load double, ptr %67, align 8
  %69 = fdiv double %64, %68
  %70 = sext i32 %.02 to i64
  %71 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %70
  %72 = getelementptr inbounds %struct.Planet, ptr %71, i32 0, i32 6
  %73 = load double, ptr %72, align 16
  %74 = fadd double %73, %69
  store double %74, ptr %72, align 16
  %75 = fmul double %52, %36
  %76 = sext i32 %.02 to i64
  %77 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %76
  %78 = getelementptr inbounds %struct.Planet, ptr %77, i32 0, i32 1
  %79 = load double, ptr %78, align 8
  %80 = fdiv double %75, %79
  %81 = sext i32 %.02 to i64
  %82 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %81
  %83 = getelementptr inbounds %struct.Planet, ptr %82, i32 0, i32 7
  %84 = load double, ptr %83, align 8
  %85 = fadd double %84, %80
  store double %85, ptr %83, align 8
  %86 = fmul double %52, %18
  %87 = sext i32 %.03 to i64
  %88 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %87
  %89 = getelementptr inbounds %struct.Planet, ptr %88, i32 0, i32 1
  %90 = load double, ptr %89, align 8
  %91 = fdiv double %86, %90
  %92 = sext i32 %.03 to i64
  %93 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %92
  %94 = getelementptr inbounds %struct.Planet, ptr %93, i32 0, i32 5
  %95 = load double, ptr %94, align 8
  %96 = fsub double %95, %91
  store double %96, ptr %94, align 8
  %97 = fmul double %52, %27
  %98 = sext i32 %.03 to i64
  %99 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.Planet, ptr %99, i32 0, i32 1
  %101 = load double, ptr %100, align 8
  %102 = fdiv double %97, %101
  %103 = sext i32 %.03 to i64
  %104 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %103
  %105 = getelementptr inbounds %struct.Planet, ptr %104, i32 0, i32 6
  %106 = load double, ptr %105, align 16
  %107 = fsub double %106, %102
  store double %107, ptr %105, align 16
  %108 = fmul double %52, %36
  %109 = sext i32 %.03 to i64
  %110 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %109
  %111 = getelementptr inbounds %struct.Planet, ptr %110, i32 0, i32 1
  %112 = load double, ptr %111, align 8
  %113 = fdiv double %108, %112
  %114 = sext i32 %.03 to i64
  %115 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %114
  %116 = getelementptr inbounds %struct.Planet, ptr %115, i32 0, i32 7
  %117 = load double, ptr %116, align 8
  %118 = fsub double %117, %113
  store double %118, ptr %116, align 8
  br label %119

119:                                              ; preds = %9, %7
  br label %120

120:                                              ; preds = %119
  %121 = add nsw i32 %.03, 1
  br label %5, !llvm.loop !6

122:                                              ; preds = %5
  br label %123

123:                                              ; preds = %122
  %124 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !8

125:                                              ; preds = %2
  br label %126

126:                                              ; preds = %171, %125
  %.04 = phi i32 [ 0, %125 ], [ %172, %171 ]
  %127 = icmp slt i32 %.04, 1000
  br i1 %127, label %128, label %173

128:                                              ; preds = %126
  br label %129

129:                                              ; preds = %168, %128
  %.01 = phi i32 [ 0, %128 ], [ %169, %168 ]
  %130 = icmp slt i32 %.01, 5
  br i1 %130, label %131, label %170

131:                                              ; preds = %129
  %132 = sext i32 %.01 to i64
  %133 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %132
  %134 = getelementptr inbounds %struct.Planet, ptr %133, i32 0, i32 5
  %135 = load double, ptr %134, align 8
  %136 = sitofp i32 %.04 to double
  %137 = fmul double %135, %136
  %138 = fdiv double %137, 1.000000e+03
  %139 = sext i32 %.01 to i64
  %140 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %139
  %141 = getelementptr inbounds %struct.Planet, ptr %140, i32 0, i32 2
  %142 = load double, ptr %141, align 16
  %143 = fadd double %142, %138
  store double %143, ptr %141, align 16
  %144 = sext i32 %.01 to i64
  %145 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %144
  %146 = getelementptr inbounds %struct.Planet, ptr %145, i32 0, i32 6
  %147 = load double, ptr %146, align 16
  %148 = sitofp i32 %.04 to double
  %149 = fmul double %147, %148
  %150 = fdiv double %149, 1.000000e+03
  %151 = sext i32 %.01 to i64
  %152 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %151
  %153 = getelementptr inbounds %struct.Planet, ptr %152, i32 0, i32 3
  %154 = load double, ptr %153, align 8
  %155 = fadd double %154, %150
  store double %155, ptr %153, align 8
  %156 = sext i32 %.01 to i64
  %157 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %156
  %158 = getelementptr inbounds %struct.Planet, ptr %157, i32 0, i32 7
  %159 = load double, ptr %158, align 8
  %160 = sitofp i32 %.04 to double
  %161 = fmul double %159, %160
  %162 = fdiv double %161, 1.000000e+03
  %163 = sext i32 %.01 to i64
  %164 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %163
  %165 = getelementptr inbounds %struct.Planet, ptr %164, i32 0, i32 4
  %166 = load double, ptr %165, align 16
  %167 = fadd double %166, %162
  store double %167, ptr %165, align 16
  br label %168

168:                                              ; preds = %131
  %169 = add nsw i32 %.01, 1
  br label %129, !llvm.loop !9

170:                                              ; preds = %129
  br label %171

171:                                              ; preds = %170
  %172 = add nsw i32 %.04, 1
  br label %126, !llvm.loop !10

173:                                              ; preds = %126
  br label %174

174:                                              ; preds = %194, %173
  %.0 = phi i32 [ 0, %173 ], [ %195, %194 ]
  %175 = icmp slt i32 %.0, 5
  br i1 %175, label %176, label %196

176:                                              ; preds = %174
  %177 = sext i32 %.0 to i64
  %178 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %177
  %179 = getelementptr inbounds %struct.Planet, ptr %178, i32 0, i32 0
  %180 = getelementptr inbounds [20 x i8], ptr %179, i64 0, i64 0
  %181 = sext i32 %.0 to i64
  %182 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %181
  %183 = getelementptr inbounds %struct.Planet, ptr %182, i32 0, i32 2
  %184 = load double, ptr %183, align 16
  %185 = sext i32 %.0 to i64
  %186 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %185
  %187 = getelementptr inbounds %struct.Planet, ptr %186, i32 0, i32 3
  %188 = load double, ptr %187, align 8
  %189 = sext i32 %.0 to i64
  %190 = getelementptr inbounds [5 x %struct.Planet], ptr %1, i64 0, i64 %189
  %191 = getelementptr inbounds %struct.Planet, ptr %190, i32 0, i32 4
  %192 = load double, ptr %191, align 16
  %193 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %180, double noundef %184, double noundef %188, double noundef %192)
  br label %194

194:                                              ; preds = %176
  %195 = add nsw i32 %.0, 1
  br label %174, !llvm.loop !11

196:                                              ; preds = %174
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

declare i32 @printf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
