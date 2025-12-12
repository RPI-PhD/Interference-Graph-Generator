; ModuleID = 'DATASETv2/gpt35-53976.c'
source_filename = "DATASETv2/gpt35-53976.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.arr = private unnamed_addr constant [10 x float] [float 0x3FD6666660000000, float 0x3FE28F5C20000000, float 0x3FE7AE1480000000, float 0x3FC99999A0000000, float 0x3FC47AE140000000, float 0x3FDD70A3E0000000, float 0x3FD70A3D80000000, float 0x3FE8A3D700000000, float 0x3FEF5C2900000000, float 0x3FE5C28F60000000], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @bucketSort(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca [10 x i32], align 16
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 10, ptr %8, align 4
  %15 = load i32, ptr %4, align 4
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+01
  %18 = fptrunc double %17 to float
  %19 = fadd float %18, 1.000000e+00
  store float %19, ptr %9, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %10, i8 0, i64 40, i1 false)
  %20 = load i32, ptr %8, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 8
  %23 = call noalias ptr @malloc(i64 noundef %22) #6
  store ptr %23, ptr %11, align 8
  store i32 0, ptr %5, align 4
  br label %24

24:                                               ; preds = %37, %2
  %25 = load i32, ptr %5, align 4
  %26 = load i32, ptr %8, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %40

28:                                               ; preds = %24
  %29 = load float, ptr %9, align 4
  %30 = fmul float %29, 4.000000e+00
  %31 = fptoui float %30 to i64
  %32 = call noalias ptr @malloc(i64 noundef %31) #6
  %33 = load ptr, ptr %11, align 8
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %33, i64 %35
  store ptr %32, ptr %36, align 8
  br label %37

37:                                               ; preds = %28
  %38 = load i32, ptr %5, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %5, align 4
  br label %24, !llvm.loop !6

40:                                               ; preds = %24
  store i32 0, ptr %5, align 4
  br label %41

41:                                               ; preds = %72, %40
  %42 = load i32, ptr %5, align 4
  %43 = load i32, ptr %4, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %75

45:                                               ; preds = %41
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, ptr %46, i64 %48
  %50 = load float, ptr %49, align 4
  %51 = load i32, ptr %8, align 4
  %52 = sitofp i32 %51 to float
  %53 = fmul float %50, %52
  %54 = fptosi float %53 to i32
  store i32 %54, ptr %12, align 4
  %55 = load ptr, ptr %3, align 8
  %56 = load i32, ptr %5, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, ptr %55, i64 %57
  %59 = load float, ptr %58, align 4
  %60 = load ptr, ptr %11, align 8
  %61 = load i32, ptr %12, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds ptr, ptr %60, i64 %62
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %12, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %67, align 4
  %70 = sext i32 %68 to i64
  %71 = getelementptr inbounds float, ptr %64, i64 %70
  store float %59, ptr %71, align 4
  br label %72

72:                                               ; preds = %45
  %73 = load i32, ptr %5, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %5, align 4
  br label %41, !llvm.loop !8

75:                                               ; preds = %41
  store i32 0, ptr %5, align 4
  br label %76

76:                                               ; preds = %153, %75
  %77 = load i32, ptr %5, align 4
  %78 = load i32, ptr %8, align 4
  %79 = icmp slt i32 %77, %78
  br i1 %79, label %80, label %156

80:                                               ; preds = %76
  store i32 1, ptr %6, align 4
  br label %81

81:                                               ; preds = %149, %80
  %82 = load i32, ptr %6, align 4
  %83 = load i32, ptr %5, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = icmp slt i32 %82, %86
  br i1 %87, label %88, label %152

88:                                               ; preds = %81
  %89 = load ptr, ptr %11, align 8
  %90 = load i32, ptr %5, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds ptr, ptr %89, i64 %91
  %93 = load ptr, ptr %92, align 8
  %94 = load i32, ptr %6, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, ptr %93, i64 %95
  %97 = load float, ptr %96, align 4
  store float %97, ptr %13, align 4
  %98 = load i32, ptr %6, align 4
  %99 = sub nsw i32 %98, 1
  store i32 %99, ptr %7, align 4
  br label %100

100:                                              ; preds = %117, %88
  %101 = load i32, ptr %7, align 4
  %102 = icmp sge i32 %101, 0
  br i1 %102, label %103, label %115

103:                                              ; preds = %100
  %104 = load ptr, ptr %11, align 8
  %105 = load i32, ptr %5, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds ptr, ptr %104, i64 %106
  %108 = load ptr, ptr %107, align 8
  %109 = load i32, ptr %7, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds float, ptr %108, i64 %110
  %112 = load float, ptr %111, align 4
  %113 = load float, ptr %13, align 4
  %114 = fcmp ogt float %112, %113
  br label %115

115:                                              ; preds = %103, %100
  %116 = phi i1 [ false, %100 ], [ %114, %103 ]
  br i1 %116, label %117, label %138

117:                                              ; preds = %115
  %118 = load ptr, ptr %11, align 8
  %119 = load i32, ptr %5, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds ptr, ptr %118, i64 %120
  %122 = load ptr, ptr %121, align 8
  %123 = load i32, ptr %7, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds float, ptr %122, i64 %124
  %126 = load float, ptr %125, align 4
  %127 = load ptr, ptr %11, align 8
  %128 = load i32, ptr %5, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds ptr, ptr %127, i64 %129
  %131 = load ptr, ptr %130, align 8
  %132 = load i32, ptr %7, align 4
  %133 = add nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds float, ptr %131, i64 %134
  store float %126, ptr %135, align 4
  %136 = load i32, ptr %7, align 4
  %137 = add nsw i32 %136, -1
  store i32 %137, ptr %7, align 4
  br label %100, !llvm.loop !9

138:                                              ; preds = %115
  %139 = load float, ptr %13, align 4
  %140 = load ptr, ptr %11, align 8
  %141 = load i32, ptr %5, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds ptr, ptr %140, i64 %142
  %144 = load ptr, ptr %143, align 8
  %145 = load i32, ptr %7, align 4
  %146 = add nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, ptr %144, i64 %147
  store float %139, ptr %148, align 4
  br label %149

149:                                              ; preds = %138
  %150 = load i32, ptr %6, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, ptr %6, align 4
  br label %81, !llvm.loop !10

152:                                              ; preds = %81
  br label %153

153:                                              ; preds = %152
  %154 = load i32, ptr %5, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %5, align 4
  br label %76, !llvm.loop !11

156:                                              ; preds = %76
  store i32 0, ptr %14, align 4
  store i32 0, ptr %5, align 4
  br label %157

157:                                              ; preds = %193, %156
  %158 = load i32, ptr %5, align 4
  %159 = load i32, ptr %8, align 4
  %160 = icmp slt i32 %158, %159
  br i1 %160, label %161, label %196

161:                                              ; preds = %157
  store i32 0, ptr %6, align 4
  br label %162

162:                                              ; preds = %184, %161
  %163 = load i32, ptr %6, align 4
  %164 = load i32, ptr %5, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [10 x i32], ptr %10, i64 0, i64 %165
  %167 = load i32, ptr %166, align 4
  %168 = icmp slt i32 %163, %167
  br i1 %168, label %169, label %187

169:                                              ; preds = %162
  %170 = load ptr, ptr %11, align 8
  %171 = load i32, ptr %5, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds ptr, ptr %170, i64 %172
  %174 = load ptr, ptr %173, align 8
  %175 = load i32, ptr %6, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, ptr %174, i64 %176
  %178 = load float, ptr %177, align 4
  %179 = load ptr, ptr %3, align 8
  %180 = load i32, ptr %14, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, ptr %14, align 4
  %182 = sext i32 %180 to i64
  %183 = getelementptr inbounds float, ptr %179, i64 %182
  store float %178, ptr %183, align 4
  br label %184

184:                                              ; preds = %169
  %185 = load i32, ptr %6, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, ptr %6, align 4
  br label %162, !llvm.loop !12

187:                                              ; preds = %162
  %188 = load ptr, ptr %11, align 8
  %189 = load i32, ptr %5, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds ptr, ptr %188, i64 %190
  %192 = load ptr, ptr %191, align 8
  call void @free(ptr noundef %192) #7
  br label %193

193:                                              ; preds = %187
  %194 = load i32, ptr %5, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, ptr %5, align 4
  br label %157, !llvm.loop !13

196:                                              ; preds = %157
  %197 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %197) #7
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [10 x float], align 16
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 10, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.arr, i64 40, i1 false)
  %5 = getelementptr inbounds [10 x float], ptr %3, i64 0, i64 0
  %6 = load i32, ptr %2, align 4
  call void @bucketSort(ptr noundef %5, i32 noundef %6)
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %18, %0
  %8 = load i32, ptr %4, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

11:                                               ; preds = %7
  %12 = load i32, ptr %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [10 x float], ptr %3, i64 0, i64 %13
  %15 = load float, ptr %14, align 4
  %16 = fpext float %15 to double
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %16)
  br label %18

18:                                               ; preds = %11
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %4, align 4
  br label %7, !llvm.loop !14

21:                                               ; preds = %7
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare i32 @printf(ptr noundef, ...) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
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
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
