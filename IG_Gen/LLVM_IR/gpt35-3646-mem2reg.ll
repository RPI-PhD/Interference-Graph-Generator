; ModuleID = 'LLVM_IR/gpt35-3646.ll'
source_filename = "DATASETv2/gpt35-3646.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@input_buffer = dso_local global ptr null, align 8
@output_buffer = dso_local global ptr null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @process_audio_data() #0 {
  br label %1

1:                                                ; preds = %13, %0
  %.0 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %2 = icmp slt i32 %.0, 1024
  br i1 %2, label %3, label %15

3:                                                ; preds = %1
  %4 = sitofp i32 %.0 to double
  %5 = call double @pow(double noundef -1.000000e+00, double noundef %4) #4
  %6 = load ptr, ptr @input_buffer, align 8
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds float, ptr %6, i64 %7
  %9 = load float, ptr %8, align 4
  %10 = fpext float %9 to double
  %11 = fmul double %10, %5
  %12 = fptrunc double %11 to float
  store float %12, ptr %8, align 4
  br label %13

13:                                               ; preds = %3
  %14 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !6

15:                                               ; preds = %1
  br label %16

16:                                               ; preds = %27, %15
  %.01 = phi i32 [ 0, %15 ], [ %28, %27 ]
  %17 = icmp slt i32 %.01, 1024
  br i1 %17, label %18, label %29

18:                                               ; preds = %16
  %19 = sitofp i32 %.01 to double
  %20 = call double @fmod(double noundef %19, double noundef 1.000000e+03) #4
  %21 = fcmp oeq double %20, 0.000000e+00
  br i1 %21, label %22, label %26

22:                                               ; preds = %18
  %23 = load ptr, ptr @input_buffer, align 8
  %24 = sext i32 %.01 to i64
  %25 = getelementptr inbounds float, ptr %23, i64 %24
  store float 0.000000e+00, ptr %25, align 4
  br label %26

26:                                               ; preds = %22, %18
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.01, 1
  br label %16, !llvm.loop !8

29:                                               ; preds = %16
  br label %30

30:                                               ; preds = %46, %29
  %.02 = phi i32 [ 0, %29 ], [ %47, %46 ]
  %31 = icmp slt i32 %.02, 1024
  br i1 %31, label %32, label %48

32:                                               ; preds = %30
  %33 = call i32 @rand() #4
  %34 = srem i32 %33, 100
  %35 = sitofp i32 %34 to float
  %36 = fpext float %35 to double
  %37 = fdiv double %36, 1.000000e+03
  %38 = fsub double %37, 5.000000e-02
  %39 = load ptr, ptr @input_buffer, align 8
  %40 = sext i32 %.02 to i64
  %41 = getelementptr inbounds float, ptr %39, i64 %40
  %42 = load float, ptr %41, align 4
  %43 = fpext float %42 to double
  %44 = fadd double %43, %38
  %45 = fptrunc double %44 to float
  store float %45, ptr %41, align 4
  br label %46

46:                                               ; preds = %32
  %47 = add nsw i32 %.02, 1
  br label %30, !llvm.loop !9

48:                                               ; preds = %30
  br label %49

49:                                               ; preds = %61, %48
  %.03 = phi i32 [ 0, %48 ], [ %62, %61 ]
  %50 = icmp slt i32 %.03, 1024
  br i1 %50, label %51, label %63

51:                                               ; preds = %49
  %52 = sitofp i32 %.03 to double
  %53 = call double @pow(double noundef -1.000000e+00, double noundef %52) #4
  %54 = load ptr, ptr @input_buffer, align 8
  %55 = sext i32 %.03 to i64
  %56 = getelementptr inbounds float, ptr %54, i64 %55
  %57 = load float, ptr %56, align 4
  %58 = fpext float %57 to double
  %59 = fmul double %58, %53
  %60 = fptrunc double %59 to float
  store float %60, ptr %56, align 4
  br label %61

61:                                               ; preds = %51
  %62 = add nsw i32 %.03, 1
  br label %49, !llvm.loop !10

63:                                               ; preds = %49
  br label %64

64:                                               ; preds = %78, %63
  %.04 = phi i32 [ 0, %63 ], [ %79, %78 ]
  %65 = icmp slt i32 %.04, 1024
  br i1 %65, label %66, label %80

66:                                               ; preds = %64
  %67 = load ptr, ptr @input_buffer, align 8
  %68 = sext i32 %.04 to i64
  %69 = getelementptr inbounds float, ptr %67, i64 %68
  %70 = load float, ptr %69, align 4
  %71 = fpext float %70 to double
  %72 = fmul double %71, 5.000000e-01
  %73 = fmul double %72, 2.000000e+00
  %74 = fptrunc double %73 to float
  %75 = load ptr, ptr @output_buffer, align 8
  %76 = sext i32 %.04 to i64
  %77 = getelementptr inbounds float, ptr %75, i64 %76
  store float %74, ptr %77, align 4
  br label %78

78:                                               ; preds = %66
  %79 = add nsw i32 %.04, 1
  br label %64, !llvm.loop !11

80:                                               ; preds = %64
  ret void
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nounwind
declare double @fmod(double noundef, double noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 4096) #5
  store ptr %1, ptr @input_buffer, align 8
  %2 = call noalias ptr @malloc(i64 noundef 4096) #5
  store ptr %2, ptr @output_buffer, align 8
  br label %3

3:                                                ; preds = %15, %0
  %.01 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %4 = icmp slt i32 %.01, 1024
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  %6 = sitofp i32 %.01 to float
  %7 = fdiv float %6, 4.410000e+04
  %8 = fpext float %7 to double
  %9 = fmul double 0x40B88B2F704A9409, %8
  %10 = call double @sin(double noundef %9) #4
  %11 = fptrunc double %10 to float
  %12 = load ptr, ptr @input_buffer, align 8
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds float, ptr %12, i64 %13
  store float %11, ptr %14, align 4
  br label %15

15:                                               ; preds = %5
  %16 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !12

17:                                               ; preds = %3
  call void @process_audio_data()
  br label %18

18:                                               ; preds = %27, %17
  %.0 = phi i32 [ 0, %17 ], [ %28, %27 ]
  %19 = icmp slt i32 %.0, 1024
  br i1 %19, label %20, label %29

20:                                               ; preds = %18
  %21 = load ptr, ptr @output_buffer, align 8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds float, ptr %21, i64 %22
  %24 = load float, ptr %23, align 4
  %25 = fpext float %24 to double
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %25)
  br label %27

27:                                               ; preds = %20
  %28 = add nsw i32 %.0, 1
  br label %18, !llvm.loop !13

29:                                               ; preds = %18
  %30 = load ptr, ptr @input_buffer, align 8
  call void @free(ptr noundef %30) #4
  %31 = load ptr, ptr @output_buffer, align 8
  call void @free(ptr noundef %31) #4
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare double @sin(double noundef) #1

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
