; ModuleID = 'LLVM_IR/gpt4o_mini-33644.ll'
source_filename = "DATASETv2/gpt4o_mini-33644.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Complex = type { double, double }

@.str = private unnamed_addr constant [21 x i8] c"Frequency Spectrum:\0A\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%3d: \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_signal(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %17, %2
  %.0 = phi i32 [ 0, %2 ], [ %18, %17 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %19

5:                                                ; preds = %3
  %6 = sitofp i32 %.0 to double
  %7 = fmul double 0x4073A28C59D5433B, %6
  %8 = fdiv double %7, 1.024000e+03
  %9 = call double @sin(double noundef %8) #6
  %10 = sitofp i32 %.0 to double
  %11 = fmul double 0x40878FDB9EFFEA46, %10
  %12 = fdiv double %11, 1.024000e+03
  %13 = call double @sin(double noundef %12) #6
  %14 = call double @llvm.fmuladd.f64(double 5.000000e-01, double %13, double %9)
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds double, ptr %0, i64 %15
  store double %14, ptr %16, align 8
  br label %17

17:                                               ; preds = %5
  %18 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

19:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @fft(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.Complex, align 8
  %4 = alloca %struct.Complex, align 8
  %5 = alloca %struct.Complex, align 8
  %6 = icmp sle i32 %1, 1
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %125

8:                                                ; preds = %2
  %9 = sdiv i32 %1, 2
  %10 = sext i32 %9 to i64
  %11 = mul i64 %10, 16
  %12 = call noalias ptr @malloc(i64 noundef %11) #7
  %13 = sdiv i32 %1, 2
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 16
  %16 = call noalias ptr @malloc(i64 noundef %15) #7
  br label %17

17:                                               ; preds = %32, %8
  %.01 = phi i32 [ 0, %8 ], [ %33, %32 ]
  %18 = sdiv i32 %1, 2
  %19 = icmp slt i32 %.01, %18
  br i1 %19, label %20, label %34

20:                                               ; preds = %17
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds %struct.Complex, ptr %12, i64 %21
  %23 = mul nsw i32 %.01, 2
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.Complex, ptr %0, i64 %24
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %22, ptr align 8 %25, i64 16, i1 false)
  %26 = sext i32 %.01 to i64
  %27 = getelementptr inbounds %struct.Complex, ptr %16, i64 %26
  %28 = mul nsw i32 %.01, 2
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.Complex, ptr %0, i64 %30
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %27, ptr align 8 %31, i64 16, i1 false)
  br label %32

32:                                               ; preds = %20
  %33 = add nsw i32 %.01, 1
  br label %17, !llvm.loop !8

34:                                               ; preds = %17
  %35 = sdiv i32 %1, 2
  call void @fft(ptr noundef %12, i32 noundef %35)
  %36 = sdiv i32 %1, 2
  call void @fft(ptr noundef %16, i32 noundef %36)
  br label %37

37:                                               ; preds = %122, %34
  %.0 = phi i32 [ 0, %34 ], [ %123, %122 ]
  %38 = sdiv i32 %1, 2
  %39 = icmp slt i32 %.0, %38
  br i1 %39, label %40, label %124

40:                                               ; preds = %37
  %41 = getelementptr inbounds %struct.Complex, ptr %3, i32 0, i32 0
  %42 = sitofp i32 %.0 to double
  %43 = fmul double 0xC01921FB54442D18, %42
  %44 = sitofp i32 %1 to double
  %45 = fdiv double %43, %44
  %46 = call double @cos(double noundef %45) #6
  %47 = sext i32 %.0 to i64
  %48 = getelementptr inbounds %struct.Complex, ptr %16, i64 %47
  %49 = getelementptr inbounds %struct.Complex, ptr %48, i32 0, i32 0
  %50 = load double, ptr %49, align 8
  %51 = sitofp i32 %.0 to double
  %52 = fmul double 0xC01921FB54442D18, %51
  %53 = sitofp i32 %1 to double
  %54 = fdiv double %52, %53
  %55 = call double @sin(double noundef %54) #6
  %56 = sext i32 %.0 to i64
  %57 = getelementptr inbounds %struct.Complex, ptr %16, i64 %56
  %58 = getelementptr inbounds %struct.Complex, ptr %57, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = fmul double %55, %59
  %61 = fneg double %60
  %62 = call double @llvm.fmuladd.f64(double %46, double %50, double %61)
  store double %62, ptr %41, align 8
  %63 = getelementptr inbounds %struct.Complex, ptr %3, i32 0, i32 1
  %64 = sitofp i32 %.0 to double
  %65 = fmul double 0xC01921FB54442D18, %64
  %66 = sitofp i32 %1 to double
  %67 = fdiv double %65, %66
  %68 = call double @sin(double noundef %67) #6
  %69 = sext i32 %.0 to i64
  %70 = getelementptr inbounds %struct.Complex, ptr %16, i64 %69
  %71 = getelementptr inbounds %struct.Complex, ptr %70, i32 0, i32 0
  %72 = load double, ptr %71, align 8
  %73 = sitofp i32 %.0 to double
  %74 = fmul double 0xC01921FB54442D18, %73
  %75 = sitofp i32 %1 to double
  %76 = fdiv double %74, %75
  %77 = call double @cos(double noundef %76) #6
  %78 = sext i32 %.0 to i64
  %79 = getelementptr inbounds %struct.Complex, ptr %16, i64 %78
  %80 = getelementptr inbounds %struct.Complex, ptr %79, i32 0, i32 1
  %81 = load double, ptr %80, align 8
  %82 = fmul double %77, %81
  %83 = call double @llvm.fmuladd.f64(double %68, double %72, double %82)
  store double %83, ptr %63, align 8
  %84 = sext i32 %.0 to i64
  %85 = getelementptr inbounds %struct.Complex, ptr %0, i64 %84
  %86 = getelementptr inbounds %struct.Complex, ptr %4, i32 0, i32 0
  %87 = sext i32 %.0 to i64
  %88 = getelementptr inbounds %struct.Complex, ptr %12, i64 %87
  %89 = getelementptr inbounds %struct.Complex, ptr %88, i32 0, i32 0
  %90 = load double, ptr %89, align 8
  %91 = getelementptr inbounds %struct.Complex, ptr %3, i32 0, i32 0
  %92 = load double, ptr %91, align 8
  %93 = fadd double %90, %92
  store double %93, ptr %86, align 8
  %94 = getelementptr inbounds %struct.Complex, ptr %4, i32 0, i32 1
  %95 = sext i32 %.0 to i64
  %96 = getelementptr inbounds %struct.Complex, ptr %12, i64 %95
  %97 = getelementptr inbounds %struct.Complex, ptr %96, i32 0, i32 1
  %98 = load double, ptr %97, align 8
  %99 = getelementptr inbounds %struct.Complex, ptr %3, i32 0, i32 1
  %100 = load double, ptr %99, align 8
  %101 = fadd double %98, %100
  store double %101, ptr %94, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %85, ptr align 8 %4, i64 16, i1 false)
  %102 = sdiv i32 %1, 2
  %103 = add nsw i32 %.0, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds %struct.Complex, ptr %0, i64 %104
  %106 = getelementptr inbounds %struct.Complex, ptr %5, i32 0, i32 0
  %107 = sext i32 %.0 to i64
  %108 = getelementptr inbounds %struct.Complex, ptr %12, i64 %107
  %109 = getelementptr inbounds %struct.Complex, ptr %108, i32 0, i32 0
  %110 = load double, ptr %109, align 8
  %111 = getelementptr inbounds %struct.Complex, ptr %3, i32 0, i32 0
  %112 = load double, ptr %111, align 8
  %113 = fsub double %110, %112
  store double %113, ptr %106, align 8
  %114 = getelementptr inbounds %struct.Complex, ptr %5, i32 0, i32 1
  %115 = sext i32 %.0 to i64
  %116 = getelementptr inbounds %struct.Complex, ptr %12, i64 %115
  %117 = getelementptr inbounds %struct.Complex, ptr %116, i32 0, i32 1
  %118 = load double, ptr %117, align 8
  %119 = getelementptr inbounds %struct.Complex, ptr %3, i32 0, i32 1
  %120 = load double, ptr %119, align 8
  %121 = fsub double %118, %120
  store double %121, ptr %114, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %105, ptr align 8 %5, i64 16, i1 false)
  br label %122

122:                                              ; preds = %40
  %123 = add nsw i32 %.0, 1
  br label %37, !llvm.loop !9

124:                                              ; preds = %37
  call void @free(ptr noundef %12) #6
  call void @free(ptr noundef %16) #6
  br label %125

125:                                              ; preds = %124, %7
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare double @cos(double noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_frequency_spectrum(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %4

4:                                                ; preds = %37, %2
  %.01 = phi i32 [ 0, %2 ], [ %38, %37 ]
  %5 = icmp slt i32 %.01, %1
  br i1 %5, label %6, label %39

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds %struct.Complex, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.Complex, ptr %8, i32 0, i32 0
  %10 = load double, ptr %9, align 8
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds %struct.Complex, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.Complex, ptr %12, i32 0, i32 0
  %14 = load double, ptr %13, align 8
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds %struct.Complex, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.Complex, ptr %16, i32 0, i32 1
  %18 = load double, ptr %17, align 8
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds %struct.Complex, ptr %0, i64 %19
  %21 = getelementptr inbounds %struct.Complex, ptr %20, i32 0, i32 1
  %22 = load double, ptr %21, align 8
  %23 = fmul double %18, %22
  %24 = call double @llvm.fmuladd.f64(double %10, double %14, double %23)
  %25 = call double @sqrt(double noundef %24) #6
  %26 = fdiv double %25, 1.000000e+01
  %27 = fptosi double %26 to i32
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %.01)
  br label %29

29:                                               ; preds = %33, %6
  %.0 = phi i32 [ 0, %6 ], [ %34, %33 ]
  %30 = icmp slt i32 %.0, %27
  br i1 %30, label %31, label %35

31:                                               ; preds = %29
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %33

33:                                               ; preds = %31
  %34 = add nsw i32 %.0, 1
  br label %29, !llvm.loop !10

35:                                               ; preds = %29
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %37

37:                                               ; preds = %35
  %38 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !11

39:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [512 x double], align 16
  %2 = alloca %struct.Complex, align 8
  %3 = getelementptr inbounds [512 x double], ptr %1, i64 0, i64 0
  call void @generate_signal(ptr noundef %3, i32 noundef 512)
  %4 = call noalias ptr @malloc(i64 noundef 8192) #7
  br label %5

5:                                                ; preds = %15, %0
  %.0 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %6 = icmp slt i32 %.0, 512
  br i1 %6, label %7, label %17

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds %struct.Complex, ptr %4, i64 %8
  %10 = getelementptr inbounds %struct.Complex, ptr %2, i32 0, i32 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [512 x double], ptr %1, i64 0, i64 %11
  %13 = load double, ptr %12, align 8
  store double %13, ptr %10, align 8
  %14 = getelementptr inbounds %struct.Complex, ptr %2, i32 0, i32 1
  store double 0.000000e+00, ptr %14, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %2, i64 16, i1 false)
  br label %15

15:                                               ; preds = %7
  %16 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !12

17:                                               ; preds = %5
  call void @fft(ptr noundef %4, i32 noundef 512)
  call void @print_frequency_spectrum(ptr noundef %4, i32 noundef 256)
  call void @free(ptr noundef %4) #6
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind allocsize(0) }

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
