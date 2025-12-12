; ModuleID = 'DATASETv2/gemini_pro-28368.c'
source_filename = "DATASETv2/gemini_pro-28368.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c"Enter the size of the array: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Bubble sort took %f seconds\0A\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"Selection sort took %f seconds\0A\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"Insertion sort took %f seconds\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #4
  store ptr %17, ptr %9, align 8
  %18 = call i64 @time(ptr noundef null) #5
  %19 = trunc i64 %18 to i32
  call void @srand(i32 noundef %19) #5
  store i32 0, ptr %3, align 4
  br label %20

20:                                               ; preds = %31, %0
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %2, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %34

24:                                               ; preds = %20
  %25 = call i32 @rand() #5
  %26 = srem i32 %25, 100
  %27 = load ptr, ptr %9, align 8
  %28 = load i32, ptr %3, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  store i32 %26, ptr %30, align 4
  br label %31

31:                                               ; preds = %24
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %20, !llvm.loop !6

34:                                               ; preds = %20
  %35 = call i64 @clock() #5
  %36 = sitofp i64 %35 to double
  store double %36, ptr %6, align 8
  store i32 0, ptr %3, align 4
  br label %37

37:                                               ; preds = %90, %34
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr %2, align 4
  %40 = sub nsw i32 %39, 1
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %42, label %93

42:                                               ; preds = %37
  store i32 0, ptr %4, align 4
  br label %43

43:                                               ; preds = %86, %42
  %44 = load i32, ptr %4, align 4
  %45 = load i32, ptr %2, align 4
  %46 = load i32, ptr %3, align 4
  %47 = sub nsw i32 %45, %46
  %48 = sub nsw i32 %47, 1
  %49 = icmp slt i32 %44, %48
  br i1 %49, label %50, label %89

50:                                               ; preds = %43
  %51 = load ptr, ptr %9, align 8
  %52 = load i32, ptr %4, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %51, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = load ptr, ptr %9, align 8
  %57 = load i32, ptr %4, align 4
  %58 = add nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %56, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = icmp sgt i32 %55, %61
  br i1 %62, label %63, label %85

63:                                               ; preds = %50
  %64 = load ptr, ptr %9, align 8
  %65 = load i32, ptr %4, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr %64, i64 %66
  %68 = load i32, ptr %67, align 4
  store i32 %68, ptr %5, align 4
  %69 = load ptr, ptr %9, align 8
  %70 = load i32, ptr %4, align 4
  %71 = add nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, ptr %69, i64 %72
  %74 = load i32, ptr %73, align 4
  %75 = load ptr, ptr %9, align 8
  %76 = load i32, ptr %4, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, ptr %75, i64 %77
  store i32 %74, ptr %78, align 4
  %79 = load i32, ptr %5, align 4
  %80 = load ptr, ptr %9, align 8
  %81 = load i32, ptr %4, align 4
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %80, i64 %83
  store i32 %79, ptr %84, align 4
  br label %85

85:                                               ; preds = %63, %50
  br label %86

86:                                               ; preds = %85
  %87 = load i32, ptr %4, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %4, align 4
  br label %43, !llvm.loop !8

89:                                               ; preds = %43
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %3, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %3, align 4
  br label %37, !llvm.loop !9

93:                                               ; preds = %37
  %94 = call i64 @clock() #5
  %95 = sitofp i64 %94 to double
  store double %95, ptr %7, align 8
  %96 = load double, ptr %7, align 8
  %97 = load double, ptr %6, align 8
  %98 = fsub double %96, %97
  %99 = fdiv double %98, 1.000000e+06
  store double %99, ptr %8, align 8
  %100 = load double, ptr %8, align 8
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %100)
  %102 = call i64 @clock() #5
  %103 = sitofp i64 %102 to double
  store double %103, ptr %6, align 8
  store i32 0, ptr %3, align 4
  br label %104

104:                                              ; preds = %155, %93
  %105 = load i32, ptr %3, align 4
  %106 = load i32, ptr %2, align 4
  %107 = sub nsw i32 %106, 1
  %108 = icmp slt i32 %105, %107
  br i1 %108, label %109, label %158

109:                                              ; preds = %104
  %110 = load i32, ptr %3, align 4
  store i32 %110, ptr %10, align 4
  %111 = load i32, ptr %3, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %4, align 4
  br label %113

113:                                              ; preds = %132, %109
  %114 = load i32, ptr %4, align 4
  %115 = load i32, ptr %2, align 4
  %116 = icmp slt i32 %114, %115
  br i1 %116, label %117, label %135

117:                                              ; preds = %113
  %118 = load ptr, ptr %9, align 8
  %119 = load i32, ptr %4, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, ptr %118, i64 %120
  %122 = load i32, ptr %121, align 4
  %123 = load ptr, ptr %9, align 8
  %124 = load i32, ptr %10, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, ptr %123, i64 %125
  %127 = load i32, ptr %126, align 4
  %128 = icmp slt i32 %122, %127
  br i1 %128, label %129, label %131

129:                                              ; preds = %117
  %130 = load i32, ptr %4, align 4
  store i32 %130, ptr %10, align 4
  br label %131

131:                                              ; preds = %129, %117
  br label %132

132:                                              ; preds = %131
  %133 = load i32, ptr %4, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %4, align 4
  br label %113, !llvm.loop !10

135:                                              ; preds = %113
  %136 = load ptr, ptr %9, align 8
  %137 = load i32, ptr %3, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr %136, i64 %138
  %140 = load i32, ptr %139, align 4
  store i32 %140, ptr %5, align 4
  %141 = load ptr, ptr %9, align 8
  %142 = load i32, ptr %10, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, ptr %141, i64 %143
  %145 = load i32, ptr %144, align 4
  %146 = load ptr, ptr %9, align 8
  %147 = load i32, ptr %3, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, ptr %146, i64 %148
  store i32 %145, ptr %149, align 4
  %150 = load i32, ptr %5, align 4
  %151 = load ptr, ptr %9, align 8
  %152 = load i32, ptr %10, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, ptr %151, i64 %153
  store i32 %150, ptr %154, align 4
  br label %155

155:                                              ; preds = %135
  %156 = load i32, ptr %3, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, ptr %3, align 4
  br label %104, !llvm.loop !11

158:                                              ; preds = %104
  %159 = call i64 @clock() #5
  %160 = sitofp i64 %159 to double
  store double %160, ptr %7, align 8
  %161 = load double, ptr %7, align 8
  %162 = load double, ptr %6, align 8
  %163 = fsub double %161, %162
  %164 = fdiv double %163, 1.000000e+06
  store double %164, ptr %8, align 8
  %165 = load double, ptr %8, align 8
  %166 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %165)
  %167 = call i64 @clock() #5
  %168 = sitofp i64 %167 to double
  store double %168, ptr %6, align 8
  store i32 1, ptr %3, align 4
  br label %169

169:                                              ; preds = %214, %158
  %170 = load i32, ptr %3, align 4
  %171 = load i32, ptr %2, align 4
  %172 = icmp slt i32 %170, %171
  br i1 %172, label %173, label %217

173:                                              ; preds = %169
  %174 = load ptr, ptr %9, align 8
  %175 = load i32, ptr %3, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32, ptr %174, i64 %176
  %178 = load i32, ptr %177, align 4
  store i32 %178, ptr %11, align 4
  %179 = load i32, ptr %3, align 4
  %180 = sub nsw i32 %179, 1
  store i32 %180, ptr %4, align 4
  br label %181

181:                                              ; preds = %194, %173
  %182 = load i32, ptr %4, align 4
  %183 = icmp sge i32 %182, 0
  br i1 %183, label %184, label %192

184:                                              ; preds = %181
  %185 = load ptr, ptr %9, align 8
  %186 = load i32, ptr %4, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds i32, ptr %185, i64 %187
  %189 = load i32, ptr %188, align 4
  %190 = load i32, ptr %11, align 4
  %191 = icmp sgt i32 %189, %190
  br label %192

192:                                              ; preds = %184, %181
  %193 = phi i1 [ false, %181 ], [ %191, %184 ]
  br i1 %193, label %194, label %207

194:                                              ; preds = %192
  %195 = load ptr, ptr %9, align 8
  %196 = load i32, ptr %4, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds i32, ptr %195, i64 %197
  %199 = load i32, ptr %198, align 4
  %200 = load ptr, ptr %9, align 8
  %201 = load i32, ptr %4, align 4
  %202 = add nsw i32 %201, 1
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds i32, ptr %200, i64 %203
  store i32 %199, ptr %204, align 4
  %205 = load i32, ptr %4, align 4
  %206 = add nsw i32 %205, -1
  store i32 %206, ptr %4, align 4
  br label %181, !llvm.loop !12

207:                                              ; preds = %192
  %208 = load i32, ptr %11, align 4
  %209 = load ptr, ptr %9, align 8
  %210 = load i32, ptr %4, align 4
  %211 = add nsw i32 %210, 1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i32, ptr %209, i64 %212
  store i32 %208, ptr %213, align 4
  br label %214

214:                                              ; preds = %207
  %215 = load i32, ptr %3, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, ptr %3, align 4
  br label %169, !llvm.loop !13

217:                                              ; preds = %169
  %218 = call i64 @clock() #5
  %219 = sitofp i64 %218 to double
  store double %219, ptr %7, align 8
  %220 = load double, ptr %7, align 8
  %221 = load double, ptr %6, align 8
  %222 = fsub double %220, %221
  %223 = fdiv double %222, 1.000000e+06
  store double %223, ptr %8, align 8
  %224 = load double, ptr %8, align 8
  %225 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %224)
  %226 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %226) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind
declare i64 @clock() #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
