; ModuleID = 'DATASETv2/gpt4o_mini-33644.c'
source_filename = "DATASETv2/gpt4o_mini-33644.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Complex = type { double, double }

@.str = private unnamed_addr constant [21 x i8] c"Frequency Spectrum:\0A\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%3d: \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"#\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_signal(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %26, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %29

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = sitofp i32 %11 to double
  %13 = fmul double 0x4073A28C59D5433B, %12
  %14 = fdiv double %13, 1.024000e+03
  %15 = call double @sin(double noundef %14) #6
  %16 = load i32, ptr %5, align 4
  %17 = sitofp i32 %16 to double
  %18 = fmul double 0x40878FDB9EFFEA46, %17
  %19 = fdiv double %18, 1.024000e+03
  %20 = call double @sin(double noundef %19) #6
  %21 = call double @llvm.fmuladd.f64(double 5.000000e-01, double %20, double %15)
  %22 = load ptr, ptr %3, align 8
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds double, ptr %22, i64 %24
  store double %21, ptr %25, align 8
  br label %26

26:                                               ; preds = %10
  %27 = load i32, ptr %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %5, align 4
  br label %6, !llvm.loop !6

29:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare double @sin(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @fft(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.Complex, align 8
  %10 = alloca %struct.Complex, align 8
  %11 = alloca %struct.Complex, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp sle i32 %12, 1
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  br label %183

15:                                               ; preds = %2
  %16 = load i32, ptr %4, align 4
  %17 = sdiv i32 %16, 2
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 16
  %20 = call noalias ptr @malloc(i64 noundef %19) #7
  store ptr %20, ptr %5, align 8
  %21 = load i32, ptr %4, align 4
  %22 = sdiv i32 %21, 2
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 16
  %25 = call noalias ptr @malloc(i64 noundef %24) #7
  store ptr %25, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %26

26:                                               ; preds = %51, %15
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %4, align 4
  %29 = sdiv i32 %28, 2
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %54

31:                                               ; preds = %26
  %32 = load ptr, ptr %5, align 8
  %33 = load i32, ptr %7, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.Complex, ptr %32, i64 %34
  %36 = load ptr, ptr %3, align 8
  %37 = load i32, ptr %7, align 4
  %38 = mul nsw i32 %37, 2
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.Complex, ptr %36, i64 %39
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %35, ptr align 8 %40, i64 16, i1 false)
  %41 = load ptr, ptr %6, align 8
  %42 = load i32, ptr %7, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.Complex, ptr %41, i64 %43
  %45 = load ptr, ptr %3, align 8
  %46 = load i32, ptr %7, align 4
  %47 = mul nsw i32 %46, 2
  %48 = add nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.Complex, ptr %45, i64 %49
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %44, ptr align 8 %50, i64 16, i1 false)
  br label %51

51:                                               ; preds = %31
  %52 = load i32, ptr %7, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %7, align 4
  br label %26, !llvm.loop !8

54:                                               ; preds = %26
  %55 = load ptr, ptr %5, align 8
  %56 = load i32, ptr %4, align 4
  %57 = sdiv i32 %56, 2
  call void @fft(ptr noundef %55, i32 noundef %57)
  %58 = load ptr, ptr %6, align 8
  %59 = load i32, ptr %4, align 4
  %60 = sdiv i32 %59, 2
  call void @fft(ptr noundef %58, i32 noundef %60)
  store i32 0, ptr %8, align 4
  br label %61

61:                                               ; preds = %177, %54
  %62 = load i32, ptr %8, align 4
  %63 = load i32, ptr %4, align 4
  %64 = sdiv i32 %63, 2
  %65 = icmp slt i32 %62, %64
  br i1 %65, label %66, label %180

66:                                               ; preds = %61
  %67 = getelementptr inbounds %struct.Complex, ptr %9, i32 0, i32 0
  %68 = load i32, ptr %8, align 4
  %69 = sitofp i32 %68 to double
  %70 = fmul double 0xC01921FB54442D18, %69
  %71 = load i32, ptr %4, align 4
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %70, %72
  %74 = call double @cos(double noundef %73) #6
  %75 = load ptr, ptr %6, align 8
  %76 = load i32, ptr %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.Complex, ptr %75, i64 %77
  %79 = getelementptr inbounds %struct.Complex, ptr %78, i32 0, i32 0
  %80 = load double, ptr %79, align 8
  %81 = load i32, ptr %8, align 4
  %82 = sitofp i32 %81 to double
  %83 = fmul double 0xC01921FB54442D18, %82
  %84 = load i32, ptr %4, align 4
  %85 = sitofp i32 %84 to double
  %86 = fdiv double %83, %85
  %87 = call double @sin(double noundef %86) #6
  %88 = load ptr, ptr %6, align 8
  %89 = load i32, ptr %8, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.Complex, ptr %88, i64 %90
  %92 = getelementptr inbounds %struct.Complex, ptr %91, i32 0, i32 1
  %93 = load double, ptr %92, align 8
  %94 = fmul double %87, %93
  %95 = fneg double %94
  %96 = call double @llvm.fmuladd.f64(double %74, double %80, double %95)
  store double %96, ptr %67, align 8
  %97 = getelementptr inbounds %struct.Complex, ptr %9, i32 0, i32 1
  %98 = load i32, ptr %8, align 4
  %99 = sitofp i32 %98 to double
  %100 = fmul double 0xC01921FB54442D18, %99
  %101 = load i32, ptr %4, align 4
  %102 = sitofp i32 %101 to double
  %103 = fdiv double %100, %102
  %104 = call double @sin(double noundef %103) #6
  %105 = load ptr, ptr %6, align 8
  %106 = load i32, ptr %8, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds %struct.Complex, ptr %105, i64 %107
  %109 = getelementptr inbounds %struct.Complex, ptr %108, i32 0, i32 0
  %110 = load double, ptr %109, align 8
  %111 = load i32, ptr %8, align 4
  %112 = sitofp i32 %111 to double
  %113 = fmul double 0xC01921FB54442D18, %112
  %114 = load i32, ptr %4, align 4
  %115 = sitofp i32 %114 to double
  %116 = fdiv double %113, %115
  %117 = call double @cos(double noundef %116) #6
  %118 = load ptr, ptr %6, align 8
  %119 = load i32, ptr %8, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds %struct.Complex, ptr %118, i64 %120
  %122 = getelementptr inbounds %struct.Complex, ptr %121, i32 0, i32 1
  %123 = load double, ptr %122, align 8
  %124 = fmul double %117, %123
  %125 = call double @llvm.fmuladd.f64(double %104, double %110, double %124)
  store double %125, ptr %97, align 8
  %126 = load ptr, ptr %3, align 8
  %127 = load i32, ptr %8, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds %struct.Complex, ptr %126, i64 %128
  %130 = getelementptr inbounds %struct.Complex, ptr %10, i32 0, i32 0
  %131 = load ptr, ptr %5, align 8
  %132 = load i32, ptr %8, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds %struct.Complex, ptr %131, i64 %133
  %135 = getelementptr inbounds %struct.Complex, ptr %134, i32 0, i32 0
  %136 = load double, ptr %135, align 8
  %137 = getelementptr inbounds %struct.Complex, ptr %9, i32 0, i32 0
  %138 = load double, ptr %137, align 8
  %139 = fadd double %136, %138
  store double %139, ptr %130, align 8
  %140 = getelementptr inbounds %struct.Complex, ptr %10, i32 0, i32 1
  %141 = load ptr, ptr %5, align 8
  %142 = load i32, ptr %8, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds %struct.Complex, ptr %141, i64 %143
  %145 = getelementptr inbounds %struct.Complex, ptr %144, i32 0, i32 1
  %146 = load double, ptr %145, align 8
  %147 = getelementptr inbounds %struct.Complex, ptr %9, i32 0, i32 1
  %148 = load double, ptr %147, align 8
  %149 = fadd double %146, %148
  store double %149, ptr %140, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %129, ptr align 8 %10, i64 16, i1 false)
  %150 = load ptr, ptr %3, align 8
  %151 = load i32, ptr %8, align 4
  %152 = load i32, ptr %4, align 4
  %153 = sdiv i32 %152, 2
  %154 = add nsw i32 %151, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds %struct.Complex, ptr %150, i64 %155
  %157 = getelementptr inbounds %struct.Complex, ptr %11, i32 0, i32 0
  %158 = load ptr, ptr %5, align 8
  %159 = load i32, ptr %8, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds %struct.Complex, ptr %158, i64 %160
  %162 = getelementptr inbounds %struct.Complex, ptr %161, i32 0, i32 0
  %163 = load double, ptr %162, align 8
  %164 = getelementptr inbounds %struct.Complex, ptr %9, i32 0, i32 0
  %165 = load double, ptr %164, align 8
  %166 = fsub double %163, %165
  store double %166, ptr %157, align 8
  %167 = getelementptr inbounds %struct.Complex, ptr %11, i32 0, i32 1
  %168 = load ptr, ptr %5, align 8
  %169 = load i32, ptr %8, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds %struct.Complex, ptr %168, i64 %170
  %172 = getelementptr inbounds %struct.Complex, ptr %171, i32 0, i32 1
  %173 = load double, ptr %172, align 8
  %174 = getelementptr inbounds %struct.Complex, ptr %9, i32 0, i32 1
  %175 = load double, ptr %174, align 8
  %176 = fsub double %173, %175
  store double %176, ptr %167, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %156, ptr align 8 %11, i64 16, i1 false)
  br label %177

177:                                              ; preds = %66
  %178 = load i32, ptr %8, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, ptr %8, align 4
  br label %61, !llvm.loop !9

180:                                              ; preds = %61
  %181 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %181) #6
  %182 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %182) #6
  br label %183

183:                                              ; preds = %180, %14
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_frequency_spectrum(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %58, %2
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %61

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.Complex, ptr %15, i64 %17
  %19 = getelementptr inbounds %struct.Complex, ptr %18, i32 0, i32 0
  %20 = load double, ptr %19, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = load i32, ptr %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.Complex, ptr %21, i64 %23
  %25 = getelementptr inbounds %struct.Complex, ptr %24, i32 0, i32 0
  %26 = load double, ptr %25, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.Complex, ptr %27, i64 %29
  %31 = getelementptr inbounds %struct.Complex, ptr %30, i32 0, i32 1
  %32 = load double, ptr %31, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds %struct.Complex, ptr %33, i64 %35
  %37 = getelementptr inbounds %struct.Complex, ptr %36, i32 0, i32 1
  %38 = load double, ptr %37, align 8
  %39 = fmul double %32, %38
  %40 = call double @llvm.fmuladd.f64(double %20, double %26, double %39)
  %41 = call double @sqrt(double noundef %40) #6
  store double %41, ptr %6, align 8
  %42 = load double, ptr %6, align 8
  %43 = fdiv double %42, 1.000000e+01
  %44 = fptosi double %43 to i32
  store i32 %44, ptr %7, align 4
  %45 = load i32, ptr %5, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %45)
  store i32 0, ptr %8, align 4
  br label %47

47:                                               ; preds = %53, %14
  %48 = load i32, ptr %8, align 4
  %49 = load i32, ptr %7, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %56

51:                                               ; preds = %47
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %53

53:                                               ; preds = %51
  %54 = load i32, ptr %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %8, align 4
  br label %47, !llvm.loop !10

56:                                               ; preds = %47
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %58

58:                                               ; preds = %56
  %59 = load i32, ptr %5, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %5, align 4
  br label %10, !llvm.loop !11

61:                                               ; preds = %10
  ret void
}

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [512 x double], align 16
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Complex, align 8
  store i32 0, ptr %1, align 4
  %6 = getelementptr inbounds [512 x double], ptr %2, i64 0, i64 0
  call void @generate_signal(ptr noundef %6, i32 noundef 512)
  %7 = call noalias ptr @malloc(i64 noundef 8192) #7
  store ptr %7, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %22, %0
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %9, 512
  br i1 %10, label %11, label %25

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %4, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.Complex, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.Complex, ptr %5, i32 0, i32 0
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [512 x double], ptr %2, i64 0, i64 %18
  %20 = load double, ptr %19, align 8
  store double %20, ptr %16, align 8
  %21 = getelementptr inbounds %struct.Complex, ptr %5, i32 0, i32 1
  store double 0.000000e+00, ptr %21, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %5, i64 16, i1 false)
  br label %22

22:                                               ; preds = %11
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %8, !llvm.loop !12

25:                                               ; preds = %8
  %26 = load ptr, ptr %3, align 8
  call void @fft(ptr noundef %26, i32 noundef 512)
  %27 = load ptr, ptr %3, align 8
  call void @print_frequency_spectrum(ptr noundef %27, i32 noundef 256)
  %28 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %28) #6
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
