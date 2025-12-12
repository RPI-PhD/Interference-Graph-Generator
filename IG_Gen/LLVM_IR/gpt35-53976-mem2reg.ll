; ModuleID = 'LLVM_IR/gpt35-53976.ll'
source_filename = "DATASETv2/gpt35-53976.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.arr = private unnamed_addr constant [10 x float] [float 0x3FD6666660000000, float 0x3FE28F5C20000000, float 0x3FE7AE1480000000, float 0x3FC99999A0000000, float 0x3FC47AE140000000, float 0x3FDD70A3E0000000, float 0x3FD70A3D80000000, float 0x3FE8A3D700000000, float 0x3FEF5C2900000000, float 0x3FE5C28F60000000], align 16
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bucketSort(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [10 x i32], align 16
  %4 = sitofp i32 %1 to double
  %5 = fdiv double %4, 1.000000e+01
  %6 = fptrunc double %5 to float
  %7 = fadd float %6, 1.000000e+00
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 40, i1 false)
  %8 = sext i32 10 to i64
  %9 = mul i64 %8, 8
  %10 = call noalias ptr @malloc(i64 noundef %9) #6
  br label %11

11:                                               ; preds = %19, %2
  %.02 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %12 = icmp slt i32 %.02, 10
  br i1 %12, label %13, label %21

13:                                               ; preds = %11
  %14 = fmul float %7, 4.000000e+00
  %15 = fptoui float %14 to i64
  %16 = call noalias ptr @malloc(i64 noundef %15) #6
  %17 = sext i32 %.02 to i64
  %18 = getelementptr inbounds ptr, ptr %10, i64 %17
  store ptr %16, ptr %18, align 8
  br label %19

19:                                               ; preds = %13
  %20 = add nsw i32 %.02, 1
  br label %11, !llvm.loop !6

21:                                               ; preds = %11
  br label %22

22:                                               ; preds = %43, %21
  %.13 = phi i32 [ 0, %21 ], [ %44, %43 ]
  %23 = icmp slt i32 %.13, %1
  br i1 %23, label %24, label %45

24:                                               ; preds = %22
  %25 = sext i32 %.13 to i64
  %26 = getelementptr inbounds float, ptr %0, i64 %25
  %27 = load float, ptr %26, align 4
  %28 = sitofp i32 10 to float
  %29 = fmul float %27, %28
  %30 = fptosi float %29 to i32
  %31 = sext i32 %.13 to i64
  %32 = getelementptr inbounds float, ptr %0, i64 %31
  %33 = load float, ptr %32, align 4
  %34 = sext i32 %30 to i64
  %35 = getelementptr inbounds ptr, ptr %10, i64 %34
  %36 = load ptr, ptr %35, align 8
  %37 = sext i32 %30 to i64
  %38 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %38, align 4
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds float, ptr %36, i64 %41
  store float %33, ptr %42, align 4
  br label %43

43:                                               ; preds = %24
  %44 = add nsw i32 %.13, 1
  br label %22, !llvm.loop !8

45:                                               ; preds = %22
  br label %46

46:                                               ; preds = %98, %45
  %.2 = phi i32 [ 0, %45 ], [ %99, %98 ]
  %47 = icmp slt i32 %.2, 10
  br i1 %47, label %48, label %100

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %95, %48
  %.04 = phi i32 [ 1, %48 ], [ %96, %95 ]
  %50 = sext i32 %.2 to i64
  %51 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = icmp slt i32 %.04, %52
  br i1 %53, label %54, label %97

54:                                               ; preds = %49
  %55 = sext i32 %.2 to i64
  %56 = getelementptr inbounds ptr, ptr %10, i64 %55
  %57 = load ptr, ptr %56, align 8
  %58 = sext i32 %.04 to i64
  %59 = getelementptr inbounds float, ptr %57, i64 %58
  %60 = load float, ptr %59, align 4
  %61 = sub nsw i32 %.04, 1
  br label %62

62:                                               ; preds = %74, %54
  %.01 = phi i32 [ %61, %54 ], [ %87, %74 ]
  %63 = icmp sge i32 %.01, 0
  br i1 %63, label %64, label %72

64:                                               ; preds = %62
  %65 = sext i32 %.2 to i64
  %66 = getelementptr inbounds ptr, ptr %10, i64 %65
  %67 = load ptr, ptr %66, align 8
  %68 = sext i32 %.01 to i64
  %69 = getelementptr inbounds float, ptr %67, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = fcmp ogt float %70, %60
  br label %72

72:                                               ; preds = %64, %62
  %73 = phi i1 [ false, %62 ], [ %71, %64 ]
  br i1 %73, label %74, label %88

74:                                               ; preds = %72
  %75 = sext i32 %.2 to i64
  %76 = getelementptr inbounds ptr, ptr %10, i64 %75
  %77 = load ptr, ptr %76, align 8
  %78 = sext i32 %.01 to i64
  %79 = getelementptr inbounds float, ptr %77, i64 %78
  %80 = load float, ptr %79, align 4
  %81 = sext i32 %.2 to i64
  %82 = getelementptr inbounds ptr, ptr %10, i64 %81
  %83 = load ptr, ptr %82, align 8
  %84 = add nsw i32 %.01, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, ptr %83, i64 %85
  store float %80, ptr %86, align 4
  %87 = add nsw i32 %.01, -1
  br label %62, !llvm.loop !9

88:                                               ; preds = %72
  %89 = sext i32 %.2 to i64
  %90 = getelementptr inbounds ptr, ptr %10, i64 %89
  %91 = load ptr, ptr %90, align 8
  %92 = add nsw i32 %.01, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, ptr %91, i64 %93
  store float %60, ptr %94, align 4
  br label %95

95:                                               ; preds = %88
  %96 = add nsw i32 %.04, 1
  br label %49, !llvm.loop !10

97:                                               ; preds = %49
  br label %98

98:                                               ; preds = %97
  %99 = add nsw i32 %.2, 1
  br label %46, !llvm.loop !11

100:                                              ; preds = %46
  br label %101

101:                                              ; preds = %125, %100
  %.3 = phi i32 [ 0, %100 ], [ %126, %125 ]
  %.0 = phi i32 [ 0, %100 ], [ %.1, %125 ]
  %102 = icmp slt i32 %.3, 10
  br i1 %102, label %103, label %127

103:                                              ; preds = %101
  br label %104

104:                                              ; preds = %119, %103
  %.15 = phi i32 [ 0, %103 ], [ %120, %119 ]
  %.1 = phi i32 [ %.0, %103 ], [ %116, %119 ]
  %105 = sext i32 %.3 to i64
  %106 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %105
  %107 = load i32, ptr %106, align 4
  %108 = icmp slt i32 %.15, %107
  br i1 %108, label %109, label %121

109:                                              ; preds = %104
  %110 = sext i32 %.3 to i64
  %111 = getelementptr inbounds ptr, ptr %10, i64 %110
  %112 = load ptr, ptr %111, align 8
  %113 = sext i32 %.15 to i64
  %114 = getelementptr inbounds float, ptr %112, i64 %113
  %115 = load float, ptr %114, align 4
  %116 = add nsw i32 %.1, 1
  %117 = sext i32 %.1 to i64
  %118 = getelementptr inbounds float, ptr %0, i64 %117
  store float %115, ptr %118, align 4
  br label %119

119:                                              ; preds = %109
  %120 = add nsw i32 %.15, 1
  br label %104, !llvm.loop !12

121:                                              ; preds = %104
  %122 = sext i32 %.3 to i64
  %123 = getelementptr inbounds ptr, ptr %10, i64 %122
  %124 = load ptr, ptr %123, align 8
  call void @free(ptr noundef %124) #7
  br label %125

125:                                              ; preds = %121
  %126 = add nsw i32 %.3, 1
  br label %101, !llvm.loop !13

127:                                              ; preds = %101
  call void @free(ptr noundef %10) #7
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10 x float], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.arr, i64 40, i1 false)
  %2 = getelementptr inbounds [10 x float], ptr %1, i64 0, i64 0
  call void @bucketSort(ptr noundef %2, i32 noundef 10)
  br label %3

3:                                                ; preds = %11, %0
  %.0 = phi i32 [ 0, %0 ], [ %12, %11 ]
  %4 = icmp slt i32 %.0, 10
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [10 x float], ptr %1, i64 0, i64 %6
  %8 = load float, ptr %7, align 4
  %9 = fpext float %8 to double
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %9)
  br label %11

11:                                               ; preds = %5
  %12 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !14

13:                                               ; preds = %3
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

declare i32 @printf(ptr noundef, ...) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
