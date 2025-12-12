; ModuleID = 'DATASETv2/gemini_pro-39510.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_fractal(double noundef %0, double noundef %1, double noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, ptr noundef %6) #0 {
  %8 = alloca { double, double }, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca { double, double }, align 8
  %19 = alloca i32, align 4
  %20 = alloca { double, double }, align 8
  %21 = alloca { double, double }, align 8
  %22 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 0
  store double %0, ptr %22, align 8
  %23 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 1
  store double %1, ptr %23, align 8
  store double %2, ptr %9, align 8
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  store ptr %6, ptr %13, align 8
  %24 = load double, ptr %9, align 8
  %25 = fmul double 2.000000e+00, %24
  %26 = load i32, ptr %10, align 4
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %25, %27
  store double %28, ptr %14, align 8
  %29 = load double, ptr %9, align 8
  %30 = fmul double 2.000000e+00, %29
  %31 = load i32, ptr %11, align 4
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %30, %32
  store double %33, ptr %15, align 8
  store i32 0, ptr %16, align 4
  br label %34

34:                                               ; preds = %157, %7
  %35 = load i32, ptr %16, align 4
  %36 = load i32, ptr %11, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %160

38:                                               ; preds = %34
  store i32 0, ptr %17, align 4
  br label %39

39:                                               ; preds = %153, %38
  %40 = load i32, ptr %17, align 4
  %41 = load i32, ptr %10, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %156

43:                                               ; preds = %39
  %44 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 0
  %45 = load double, ptr %44, align 8
  %46 = getelementptr inbounds { double, double }, ptr %8, i32 0, i32 1
  %47 = load double, ptr %46, align 8
  %48 = load i32, ptr %17, align 4
  %49 = load i32, ptr %10, align 4
  %50 = sdiv i32 %49, 2
  %51 = sub nsw i32 %48, %50
  %52 = sitofp i32 %51 to double
  %53 = load double, ptr %14, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %45, %54
  %56 = load i32, ptr %16, align 4
  %57 = load i32, ptr %11, align 4
  %58 = sdiv i32 %57, 2
  %59 = sub nsw i32 %56, %58
  %60 = sitofp i32 %59 to double
  %61 = load double, ptr %15, align 8
  %62 = fmul double %60, %61
  %63 = fmul double %62, 0.000000e+00
  %64 = fmul double %62, 1.000000e+00
  %65 = fadd double %55, %63
  %66 = fadd double %47, %64
  %67 = getelementptr inbounds { double, double }, ptr %18, i32 0, i32 0
  %68 = getelementptr inbounds { double, double }, ptr %18, i32 0, i32 1
  store double %65, ptr %67, align 8
  store double %66, ptr %68, align 8
  store i32 0, ptr %19, align 4
  %69 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 0
  %70 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 1
  store double 0.000000e+00, ptr %69, align 8
  store double 0.000000e+00, ptr %70, align 8
  br label %71

71:                                               ; preds = %112, %43
  %72 = load i32, ptr %19, align 4
  %73 = load i32, ptr %12, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %88

75:                                               ; preds = %71
  %76 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 0
  %77 = load double, ptr %76, align 8
  %78 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 1
  %79 = load double, ptr %78, align 8
  %80 = getelementptr inbounds { double, double }, ptr %21, i32 0, i32 0
  %81 = getelementptr inbounds { double, double }, ptr %21, i32 0, i32 1
  store double %77, ptr %80, align 8
  store double %79, ptr %81, align 8
  %82 = getelementptr inbounds { double, double }, ptr %21, i32 0, i32 0
  %83 = load double, ptr %82, align 8
  %84 = getelementptr inbounds { double, double }, ptr %21, i32 0, i32 1
  %85 = load double, ptr %84, align 8
  %86 = call double @cabs(double noundef %83, double noundef %85) #6
  %87 = fcmp olt double %86, 2.000000e+00
  br label %88

88:                                               ; preds = %75, %71
  %89 = phi i1 [ false, %71 ], [ %87, %75 ]
  br i1 %89, label %90, label %125

90:                                               ; preds = %88
  %91 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 0
  %92 = load double, ptr %91, align 8
  %93 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 1
  %94 = load double, ptr %93, align 8
  %95 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 0
  %96 = load double, ptr %95, align 8
  %97 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 1
  %98 = load double, ptr %97, align 8
  %99 = fmul double %92, %96
  %100 = fmul double %94, %98
  %101 = fmul double %92, %98
  %102 = fmul double %94, %96
  %103 = fsub double %99, %100
  %104 = fadd double %101, %102
  %105 = fcmp uno double %103, %103
  br i1 %105, label %106, label %112, !prof !6

106:                                              ; preds = %90
  %107 = fcmp uno double %104, %104
  br i1 %107, label %108, label %112, !prof !6

108:                                              ; preds = %106
  %109 = call { double, double } @__muldc3(double noundef %92, double noundef %94, double noundef %96, double noundef %98) #6
  %110 = extractvalue { double, double } %109, 0
  %111 = extractvalue { double, double } %109, 1
  br label %112

112:                                              ; preds = %108, %106, %90
  %113 = phi double [ %103, %90 ], [ %103, %106 ], [ %110, %108 ]
  %114 = phi double [ %104, %90 ], [ %104, %106 ], [ %111, %108 ]
  %115 = getelementptr inbounds { double, double }, ptr %18, i32 0, i32 0
  %116 = load double, ptr %115, align 8
  %117 = getelementptr inbounds { double, double }, ptr %18, i32 0, i32 1
  %118 = load double, ptr %117, align 8
  %119 = fadd double %113, %116
  %120 = fadd double %114, %118
  %121 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 0
  %122 = getelementptr inbounds { double, double }, ptr %20, i32 0, i32 1
  store double %119, ptr %121, align 8
  store double %120, ptr %122, align 8
  %123 = load i32, ptr %19, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %19, align 4
  br label %71, !llvm.loop !7

125:                                              ; preds = %88
  %126 = load i32, ptr %19, align 4
  %127 = load i32, ptr %12, align 4
  %128 = icmp eq i32 %126, %127
  br i1 %128, label %129, label %138

129:                                              ; preds = %125
  %130 = load ptr, ptr %13, align 8
  %131 = load i32, ptr %16, align 4
  %132 = load i32, ptr %10, align 4
  %133 = mul nsw i32 %131, %132
  %134 = load i32, ptr %17, align 4
  %135 = add nsw i32 %133, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i32, ptr %130, i64 %136
  store i32 0, ptr %137, align 4
  br label %152

138:                                              ; preds = %125
  %139 = load i32, ptr %19, align 4
  %140 = srem i32 %139, 8
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [8 x i32], ptr @colors, i64 0, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = load ptr, ptr %13, align 8
  %145 = load i32, ptr %16, align 4
  %146 = load i32, ptr %10, align 4
  %147 = mul nsw i32 %145, %146
  %148 = load i32, ptr %17, align 4
  %149 = add nsw i32 %147, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, ptr %144, i64 %150
  store i32 %143, ptr %151, align 4
  br label %152

152:                                              ; preds = %138, %129
  br label %153

153:                                              ; preds = %152
  %154 = load i32, ptr %17, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %17, align 4
  br label %39, !llvm.loop !9

156:                                              ; preds = %39
  br label %157

157:                                              ; preds = %156
  %158 = load i32, ptr %16, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, ptr %16, align 4
  br label %34, !llvm.loop !10

160:                                              ; preds = %34
  ret void
}

; Function Attrs: nounwind
declare double @cabs(double noundef, double noundef) #1

declare { double, double } @__muldc3(double, double, double, double)

; Function Attrs: noinline nounwind  uwtable
define dso_local void @write_fractal(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str)
  store ptr %13, ptr %9, align 8
  %14 = load ptr, ptr %9, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %4
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

17:                                               ; preds = %4
  %18 = load ptr, ptr %9, align 8
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %7, align 4
  %21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.2, i32 noundef %19, i32 noundef %20)
  store i32 0, ptr %10, align 4
  br label %22

22:                                               ; preds = %72, %17
  %23 = load i32, ptr %10, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %75

26:                                               ; preds = %22
  store i32 0, ptr %11, align 4
  br label %27

27:                                               ; preds = %66, %26
  %28 = load i32, ptr %11, align 4
  %29 = load i32, ptr %6, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %69

31:                                               ; preds = %27
  %32 = load ptr, ptr %9, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %10, align 4
  %35 = load i32, ptr %6, align 4
  %36 = mul nsw i32 %34, %35
  %37 = load i32, ptr %11, align 4
  %38 = add nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %33, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = ashr i32 %41, 16
  %43 = and i32 %42, 255
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %10, align 4
  %46 = load i32, ptr %6, align 4
  %47 = mul nsw i32 %45, %46
  %48 = load i32, ptr %11, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr %44, i64 %50
  %52 = load i32, ptr %51, align 4
  %53 = ashr i32 %52, 8
  %54 = and i32 %53, 255
  %55 = load ptr, ptr %5, align 8
  %56 = load i32, ptr %10, align 4
  %57 = load i32, ptr %6, align 4
  %58 = mul nsw i32 %56, %57
  %59 = load i32, ptr %11, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr %55, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = and i32 %63, 255
  %65 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %32, ptr noundef @.str.3, i32 noundef %43, i32 noundef %54, i32 noundef %64)
  br label %66

66:                                               ; preds = %31
  %67 = load i32, ptr %11, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %11, align 4
  br label %27, !llvm.loop !11

69:                                               ; preds = %27
  %70 = load ptr, ptr %9, align 8
  %71 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %70, ptr noundef @.str.4)
  br label %72

72:                                               ; preds = %69
  %73 = load i32, ptr %10, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %10, align 4
  br label %22, !llvm.loop !12

75:                                               ; preds = %22
  %76 = load ptr, ptr %9, align 8
  %77 = call i32 @fclose(ptr noundef %76)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca { double, double }, align 8
  store i32 0, ptr %1, align 4
  %4 = call noalias ptr @malloc(i64 noundef 1920000) #9
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds { double, double }, ptr %3, i32 0, i32 0
  %7 = getelementptr inbounds { double, double }, ptr %3, i32 0, i32 1
  store double 0.000000e+00, ptr %6, align 8
  store double 0.000000e+00, ptr %7, align 8
  %8 = getelementptr inbounds { double, double }, ptr %3, i32 0, i32 0
  %9 = load double, ptr %8, align 8
  %10 = getelementptr inbounds { double, double }, ptr %3, i32 0, i32 1
  %11 = load double, ptr %10, align 8
  call void @generate_fractal(double noundef %9, double noundef %11, double noundef 1.000000e+00, i32 noundef 800, i32 noundef 600, i32 noundef 256, ptr noundef %5)
  %12 = load ptr, ptr %2, align 8
  call void @write_fractal(ptr noundef %12, i32 noundef 800, i32 noundef 600, ptr noundef @.str.5)
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13) #6
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
