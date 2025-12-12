; ModuleID = 'LLVM_IR/mistral_7b-1923.ll'
source_filename = "DATASETv2/mistral_7b-1923.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Weather = type { float, float, float }

@.str = private unnamed_addr constant [22 x i8] c"\0ACity Weather Report\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"\0ACity %d:\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"Temperature: %.2f\C2\B0C\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Humidity: %.2f%%\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Precipitation: %.1fmm\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.Weather], align 16
  %2 = call i64 @time(ptr noundef null) #4
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #4
  %4 = getelementptr inbounds [5 x %struct.Weather], ptr %1, i64 0, i64 0
  call void @generate_weather(ptr noundef %4, i32 noundef 10)
  %5 = getelementptr inbounds [5 x %struct.Weather], ptr %1, i64 0, i64 0
  call void @print_city_weather(ptr noundef %5)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_weather(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %29, %2
  %.02 = phi i32 [ 0, %2 ], [ %30, %29 ]
  %4 = icmp slt i32 %.02, 5
  br i1 %4, label %5, label %31

5:                                                ; preds = %3
  %6 = call i32 @rand() #4
  %7 = srem i32 %6, 30
  %8 = add nsw i32 %7, 5
  %9 = sitofp i32 %8 to float
  %10 = sext i32 %.02 to i64
  %11 = getelementptr inbounds %struct.Weather, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.Weather, ptr %11, i32 0, i32 0
  store float %9, ptr %12, align 4
  %13 = call i32 @rand() #4
  %14 = srem i32 %13, 51
  %15 = sitofp i32 %14 to double
  %16 = fadd double %15, 5.000000e+01
  %17 = fptrunc double %16 to float
  %18 = sext i32 %.02 to i64
  %19 = getelementptr inbounds %struct.Weather, ptr %0, i64 %18
  %20 = getelementptr inbounds %struct.Weather, ptr %19, i32 0, i32 1
  store float %17, ptr %20, align 4
  %21 = call i32 @rand() #4
  %22 = srem i32 %21, 11
  %23 = sitofp i32 %22 to double
  %24 = fadd double %23, 1.000000e-01
  %25 = fptrunc double %24 to float
  %26 = sext i32 %.02 to i64
  %27 = getelementptr inbounds %struct.Weather, ptr %0, i64 %26
  %28 = getelementptr inbounds %struct.Weather, ptr %27, i32 0, i32 2
  store float %25, ptr %28, align 4
  br label %29

29:                                               ; preds = %5
  %30 = add nsw i32 %.02, 1
  br label %3, !llvm.loop !6

31:                                               ; preds = %3
  br label %32

32:                                               ; preds = %69, %31
  %.01 = phi i32 [ 0, %31 ], [ %70, %69 ]
  %33 = icmp slt i32 %.01, %1
  br i1 %33, label %34, label %71

34:                                               ; preds = %32
  br label %35

35:                                               ; preds = %66, %34
  %.0 = phi i32 [ 0, %34 ], [ %67, %66 ]
  %36 = icmp slt i32 %.0, 5
  br i1 %36, label %37, label %68

37:                                               ; preds = %35
  %38 = call i32 @rand() #4
  %39 = srem i32 %38, 5
  %40 = sub nsw i32 %39, 2
  %41 = sitofp i32 %40 to float
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds %struct.Weather, ptr %0, i64 %42
  %44 = getelementptr inbounds %struct.Weather, ptr %43, i32 0, i32 0
  %45 = load float, ptr %44, align 4
  %46 = fadd float %45, %41
  store float %46, ptr %44, align 4
  %47 = call i32 @rand() #4
  %48 = srem i32 %47, 11
  %49 = sub nsw i32 %48, 5
  %50 = sitofp i32 %49 to float
  %51 = sext i32 %.0 to i64
  %52 = getelementptr inbounds %struct.Weather, ptr %0, i64 %51
  %53 = getelementptr inbounds %struct.Weather, ptr %52, i32 0, i32 1
  %54 = load float, ptr %53, align 4
  %55 = fadd float %54, %50
  store float %55, ptr %53, align 4
  %56 = call i32 @rand() #4
  %57 = srem i32 %56, 3
  %58 = sitofp i32 %57 to double
  %59 = sext i32 %.0 to i64
  %60 = getelementptr inbounds %struct.Weather, ptr %0, i64 %59
  %61 = getelementptr inbounds %struct.Weather, ptr %60, i32 0, i32 2
  %62 = load float, ptr %61, align 4
  %63 = fpext float %62 to double
  %64 = call double @llvm.fmuladd.f64(double %58, double 1.000000e-01, double %63)
  %65 = fptrunc double %64 to float
  store float %65, ptr %61, align 4
  br label %66

66:                                               ; preds = %37
  %67 = add nsw i32 %.0, 1
  br label %35, !llvm.loop !8

68:                                               ; preds = %35
  br label %69

69:                                               ; preds = %68
  %70 = add nsw i32 %.01, 1
  br label %32, !llvm.loop !9

71:                                               ; preds = %32
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_city_weather(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %3

3:                                                ; preds = %26, %1
  %.0 = phi i32 [ 0, %1 ], [ %27, %26 ]
  %4 = icmp slt i32 %.0, 5
  br i1 %4, label %5, label %28

5:                                                ; preds = %3
  %6 = add nsw i32 %.0, 1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %6)
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds %struct.Weather, ptr %0, i64 %8
  %10 = getelementptr inbounds %struct.Weather, ptr %9, i32 0, i32 0
  %11 = load float, ptr %10, align 4
  %12 = fpext float %11 to double
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %12)
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds %struct.Weather, ptr %0, i64 %14
  %16 = getelementptr inbounds %struct.Weather, ptr %15, i32 0, i32 1
  %17 = load float, ptr %16, align 4
  %18 = fpext float %17 to double
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %18)
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds %struct.Weather, ptr %0, i64 %20
  %22 = getelementptr inbounds %struct.Weather, ptr %21, i32 0, i32 2
  %23 = load float, ptr %22, align 4
  %24 = fpext float %23 to double
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %24)
  br label %26

26:                                               ; preds = %5
  %27 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !10

28:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
