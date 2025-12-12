; ModuleID = 'DATASETv2/gpt35-3646.c'
source_filename = "DATASETv2/gpt35-3646.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@input_buffer = dso_local global ptr null, align 8
@output_buffer = dso_local global ptr null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @process_audio_data() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %6

6:                                                ; preds = %21, %0
  %7 = load i32, ptr %1, align 4
  %8 = icmp slt i32 %7, 1024
  br i1 %8, label %9, label %24

9:                                                ; preds = %6
  %10 = load i32, ptr %1, align 4
  %11 = sitofp i32 %10 to double
  %12 = call double @pow(double noundef -1.000000e+00, double noundef %11) #4
  %13 = load ptr, ptr @input_buffer, align 8
  %14 = load i32, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, ptr %13, i64 %15
  %17 = load float, ptr %16, align 4
  %18 = fpext float %17 to double
  %19 = fmul double %18, %12
  %20 = fptrunc double %19 to float
  store float %20, ptr %16, align 4
  br label %21

21:                                               ; preds = %9
  %22 = load i32, ptr %1, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %1, align 4
  br label %6, !llvm.loop !6

24:                                               ; preds = %6
  store i32 0, ptr %2, align 4
  br label %25

25:                                               ; preds = %39, %24
  %26 = load i32, ptr %2, align 4
  %27 = icmp slt i32 %26, 1024
  br i1 %27, label %28, label %42

28:                                               ; preds = %25
  %29 = load i32, ptr %2, align 4
  %30 = sitofp i32 %29 to double
  %31 = call double @fmod(double noundef %30, double noundef 1.000000e+03) #4
  %32 = fcmp oeq double %31, 0.000000e+00
  br i1 %32, label %33, label %38

33:                                               ; preds = %28
  %34 = load ptr, ptr @input_buffer, align 8
  %35 = load i32, ptr %2, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds float, ptr %34, i64 %36
  store float 0.000000e+00, ptr %37, align 4
  br label %38

38:                                               ; preds = %33, %28
  br label %39

39:                                               ; preds = %38
  %40 = load i32, ptr %2, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %2, align 4
  br label %25, !llvm.loop !8

42:                                               ; preds = %25
  store i32 0, ptr %3, align 4
  br label %43

43:                                               ; preds = %61, %42
  %44 = load i32, ptr %3, align 4
  %45 = icmp slt i32 %44, 1024
  br i1 %45, label %46, label %64

46:                                               ; preds = %43
  %47 = call i32 @rand() #4
  %48 = srem i32 %47, 100
  %49 = sitofp i32 %48 to float
  %50 = fpext float %49 to double
  %51 = fdiv double %50, 1.000000e+03
  %52 = fsub double %51, 5.000000e-02
  %53 = load ptr, ptr @input_buffer, align 8
  %54 = load i32, ptr %3, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, ptr %53, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = fpext float %57 to double
  %59 = fadd double %58, %52
  %60 = fptrunc double %59 to float
  store float %60, ptr %56, align 4
  br label %61

61:                                               ; preds = %46
  %62 = load i32, ptr %3, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %3, align 4
  br label %43, !llvm.loop !9

64:                                               ; preds = %43
  store i32 0, ptr %4, align 4
  br label %65

65:                                               ; preds = %80, %64
  %66 = load i32, ptr %4, align 4
  %67 = icmp slt i32 %66, 1024
  br i1 %67, label %68, label %83

68:                                               ; preds = %65
  %69 = load i32, ptr %4, align 4
  %70 = sitofp i32 %69 to double
  %71 = call double @pow(double noundef -1.000000e+00, double noundef %70) #4
  %72 = load ptr, ptr @input_buffer, align 8
  %73 = load i32, ptr %4, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, ptr %72, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = fpext float %76 to double
  %78 = fmul double %77, %71
  %79 = fptrunc double %78 to float
  store float %79, ptr %75, align 4
  br label %80

80:                                               ; preds = %68
  %81 = load i32, ptr %4, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %4, align 4
  br label %65, !llvm.loop !10

83:                                               ; preds = %65
  store i32 0, ptr %5, align 4
  br label %84

84:                                               ; preds = %101, %83
  %85 = load i32, ptr %5, align 4
  %86 = icmp slt i32 %85, 1024
  br i1 %86, label %87, label %104

87:                                               ; preds = %84
  %88 = load ptr, ptr @input_buffer, align 8
  %89 = load i32, ptr %5, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds float, ptr %88, i64 %90
  %92 = load float, ptr %91, align 4
  %93 = fpext float %92 to double
  %94 = fmul double %93, 5.000000e-01
  %95 = fmul double %94, 2.000000e+00
  %96 = fptrunc double %95 to float
  %97 = load ptr, ptr @output_buffer, align 8
  %98 = load i32, ptr %5, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, ptr %97, i64 %99
  store float %96, ptr %100, align 4
  br label %101

101:                                              ; preds = %87
  %102 = load i32, ptr %5, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %5, align 4
  br label %84, !llvm.loop !11

104:                                              ; preds = %84
  ret void
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @fmod(double noundef, double noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %5 = call noalias ptr @malloc(i64 noundef 4096) #5
  store ptr %5, ptr @input_buffer, align 8
  %6 = call noalias ptr @malloc(i64 noundef 4096) #5
  store ptr %6, ptr @output_buffer, align 8
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %23, %0
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 1024
  br i1 %9, label %10, label %26

10:                                               ; preds = %7
  %11 = load i32, ptr %2, align 4
  %12 = sitofp i32 %11 to float
  %13 = fdiv float %12, 4.410000e+04
  store float %13, ptr %3, align 4
  %14 = load float, ptr %3, align 4
  %15 = fpext float %14 to double
  %16 = fmul double 0x40B88B2F704A9409, %15
  %17 = call double @sin(double noundef %16) #4
  %18 = fptrunc double %17 to float
  %19 = load ptr, ptr @input_buffer, align 8
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, ptr %19, i64 %21
  store float %18, ptr %22, align 4
  br label %23

23:                                               ; preds = %10
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %2, align 4
  br label %7, !llvm.loop !12

26:                                               ; preds = %7
  call void @process_audio_data()
  store i32 0, ptr %4, align 4
  br label %27

27:                                               ; preds = %38, %26
  %28 = load i32, ptr %4, align 4
  %29 = icmp slt i32 %28, 1024
  br i1 %29, label %30, label %41

30:                                               ; preds = %27
  %31 = load ptr, ptr @output_buffer, align 8
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, ptr %31, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = fpext float %35 to double
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %36)
  br label %38

38:                                               ; preds = %30
  %39 = load i32, ptr %4, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %4, align 4
  br label %27, !llvm.loop !13

41:                                               ; preds = %27
  %42 = load ptr, ptr @input_buffer, align 8
  call void @free(ptr noundef %42) #4
  %43 = load ptr, ptr @output_buffer, align 8
  call void @free(ptr noundef %43) #4
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare double @sin(double noundef) #1

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
