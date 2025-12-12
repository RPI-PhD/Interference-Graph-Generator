; ModuleID = 'LLVM_IR/gemini_pro-39510.ll'
source_filename = "DATASETv2/gemini_pro-39510.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@colors = dso_local constant [8 x i32] [i32 0, i32 255, i32 65280, i32 16711680, i32 16776960, i32 16711935, i32 65535, i32 16777215], align 16
@.str = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"P3\0A%d %d\0A255\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"%d %d %d \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"fractal.ppm\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_fractal(double noundef %0, double noundef %1, double noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6) #0 {
  %8 = alloca { double, double }, align 8
  %9 = alloca { double, double }, align 8
  %10 = alloca { double, double }, align 8
  %11 = alloca { double, double }, align 8
  %12 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 0
  store double %0, ptr %12, align 8
  %13 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 1
  store double %1, ptr %13, align 8
  %14 = fmul double 2.000000e+00, %2
  %15 = sitofp i32 %3 to double
  %16 = fdiv double %14, %15
  %17 = fmul double 2.000000e+00, %2
  %18 = sitofp i32 %4 to double
  %19 = fdiv double %17, %18
  br label %20

20:                                               ; preds = %118, %7
  %.02 = phi i32 [ 0, %7 ], [ %119, %118 ]
  %21 = icmp slt i32 %.02, %4
  br i1 %21, label %22, label %120

22:                                               ; preds = %20
  br label %23

23:                                               ; preds = %115, %22
  %.01 = phi i32 [ 0, %22 ], [ %116, %115 ]
  %24 = icmp slt i32 %.01, %3
  br i1 %24, label %25, label %117

25:                                               ; preds = %23
  %26 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 0
  %27 = load double, ptr %26, align 8
  %28 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 1
  %29 = load double, ptr %28, align 8
  %30 = sdiv i32 %3, 2
  %31 = sub nsw i32 %.01, %30
  %32 = sitofp i32 %31 to double
  %33 = fmul double %32, %16
  %34 = fadd double %27, %33
  %35 = sdiv i32 %4, 2
  %36 = sub nsw i32 %.02, %35
  %37 = sitofp i32 %36 to double
  %38 = fmul double %37, %19
  %39 = fmul double %38, 0.000000e+00
  %40 = fmul double %38, 1.000000e+00
  %41 = fadd double %34, %39
  %42 = fadd double %29, %40
  %43 = getelementptr inbounds { double, double }, ptr %9, i32 0, i32 0
  %44 = getelementptr inbounds { double, double }, ptr %9, i32 0, i32 1
  store double %41, ptr %43, align 8
  store double %42, ptr %44, align 8
  %45 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 0
  %46 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 1
  store double 0.000000e+00, ptr %45, align 8
  store double 0.000000e+00, ptr %46, align 8
  br label %47

47:                                               ; preds = %86, %25
  %.0 = phi i32 [ 0, %25 ], [ %97, %86 ]
  %48 = icmp slt i32 %.0, %5
  br i1 %48, label %49, label %62

49:                                               ; preds = %47
  %50 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 0
  %51 = load double, ptr %50, align 8
  %52 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 1
  %53 = load double, ptr %52, align 8
  %54 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %55 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  store double %51, ptr %54, align 8
  store double %53, ptr %55, align 8
  %56 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 0
  %57 = load double, ptr %56, align 8
  %58 = getelementptr inbounds { double, double }, ptr %11, i32 0, i32 1
  %59 = load double, ptr %58, align 8
  %60 = call double @cabs(double noundef %57, double noundef %59) #6
  %61 = fcmp olt double %60, 2.000000e+00
  br label %62

62:                                               ; preds = %49, %47
  %63 = phi i1 [ false, %47 ], [ %61, %49 ]
  br i1 %63, label %64, label %98

64:                                               ; preds = %62
  %65 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 0
  %66 = load double, ptr %65, align 8
  %67 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 1
  %68 = load double, ptr %67, align 8
  %69 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 0
  %70 = load double, ptr %69, align 8
  %71 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 1
  %72 = load double, ptr %71, align 8
  %73 = fmul double %66, %70
  %74 = fmul double %68, %72
  %75 = fmul double %66, %72
  %76 = fmul double %68, %70
  %77 = fsub double %73, %74
  %78 = fadd double %75, %76
  %79 = fcmp uno double %77, %77
  br i1 %79, label %80, label %86, !prof !6

80:                                               ; preds = %64
  %81 = fcmp uno double %78, %78
  br i1 %81, label %82, label %86, !prof !6

82:                                               ; preds = %80
  %83 = call { double, double } @__muldc3(double noundef %66, double noundef %68, double noundef %70, double noundef %72) #6
  %84 = extractvalue { double, double } %83, 0
  %85 = extractvalue { double, double } %83, 1
  br label %86

86:                                               ; preds = %82, %80, %64
  %87 = phi double [ %77, %64 ], [ %77, %80 ], [ %84, %82 ]
  %88 = phi double [ %78, %64 ], [ %78, %80 ], [ %85, %82 ]
  %89 = getelementptr inbounds { double, double }, ptr %9, i32 0, i32 0
  %90 = load double, ptr %89, align 8
  %91 = getelementptr inbounds { double, double }, ptr %9, i32 0, i32 1
  %92 = load double, ptr %91, align 8
  %93 = fadd double %87, %90
  %94 = fadd double %88, %92
  %95 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 0
  %96 = getelementptr inbounds { double, double }, ptr %10, i32 0, i32 1
  store double %93, ptr %95, align 8
  store double %94, ptr %96, align 8
  %97 = add nsw i32 %.0, 1
  br label %47, !llvm.loop !7

98:                                               ; preds = %62
  %99 = icmp eq i32 %.0, %5
  br i1 %99, label %100, label %105

100:                                              ; preds = %98
  %101 = mul nsw i32 %.02, %3
  %102 = add nsw i32 %101, %.01
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, ptr %6, i64 %103
  store i32 0, ptr %104, align 4
  br label %114

105:                                              ; preds = %98
  %106 = srem i32 %.0, 8
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [8 x i32], ptr @colors, i64 0, i64 %107
  %109 = load i32, ptr %108, align 4
  %110 = mul nsw i32 %.02, %3
  %111 = add nsw i32 %110, %.01
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, ptr %6, i64 %112
  store i32 %109, ptr %113, align 4
  br label %114

114:                                              ; preds = %105, %100
  br label %115

115:                                              ; preds = %114
  %116 = add nsw i32 %.01, 1
  br label %23, !llvm.loop !9

117:                                              ; preds = %23
  br label %118

118:                                              ; preds = %117
  %119 = add nsw i32 %.02, 1
  br label %20, !llvm.loop !10

120:                                              ; preds = %20
  ret void
}

; Function Attrs: nounwind
declare double @cabs(double noundef, double noundef) #1

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: noinline nounwind uwtable
define dso_local void @write_fractal(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = call noalias ptr @fopen(ptr noundef %3, ptr noundef @.str)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

8:                                                ; preds = %4
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.2, i32 noundef %1, i32 noundef %2)
  br label %10

10:                                               ; preds = %41, %8
  %.01 = phi i32 [ 0, %8 ], [ %42, %41 ]
  %11 = icmp slt i32 %.01, %2
  br i1 %11, label %12, label %43

12:                                               ; preds = %10
  br label %13

13:                                               ; preds = %37, %12
  %.0 = phi i32 [ 0, %12 ], [ %38, %37 ]
  %14 = icmp slt i32 %.0, %1
  br i1 %14, label %15, label %39

15:                                               ; preds = %13
  %16 = mul nsw i32 %.01, %1
  %17 = add nsw i32 %16, %.0
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = ashr i32 %20, 16
  %22 = and i32 %21, 255
  %23 = mul nsw i32 %.01, %1
  %24 = add nsw i32 %23, %.0
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = ashr i32 %27, 8
  %29 = and i32 %28, 255
  %30 = mul nsw i32 %.01, %1
  %31 = add nsw i32 %30, %.0
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, ptr %0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = and i32 %34, 255
  %36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.3, i32 noundef %22, i32 noundef %29, i32 noundef %35)
  br label %37

37:                                               ; preds = %15
  %38 = add nsw i32 %.0, 1
  br label %13, !llvm.loop !11

39:                                               ; preds = %13
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.4)
  br label %41

41:                                               ; preds = %39
  %42 = add nsw i32 %.01, 1
  br label %10, !llvm.loop !12

43:                                               ; preds = %10
  %44 = call i32 @fclose(ptr noundef %5)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca { double, double }, align 8
  %2 = call noalias ptr @malloc(i64 noundef 1920000) #9
  %3 = getelementptr inbounds { double, double }, ptr %1, i32 0, i32 0
  %4 = getelementptr inbounds { double, double }, ptr %1, i32 0, i32 1
  store double 0.000000e+00, ptr %3, align 8
  store double 0.000000e+00, ptr %4, align 8
  %5 = getelementptr inbounds { double, double }, ptr %1, i32 0, i32 0
  %6 = load double, ptr %5, align 8
  %7 = getelementptr inbounds { double, double }, ptr %1, i32 0, i32 1
  %8 = load double, ptr %7, align 8
  call void @generate_fractal(double noundef %6, double noundef %8, double noundef 1.000000e+00, i32 noundef 800, i32 noundef 600, i32 noundef 256, ptr noundef %2)
  call void @write_fractal(ptr noundef %2, i32 noundef 800, i32 noundef 600, ptr noundef @.str.5)
  call void @free(ptr noundef %2) #6
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = !{!"branch_weights", i32 1, i32 1048575}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
