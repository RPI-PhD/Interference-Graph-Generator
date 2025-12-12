; ModuleID = 'DATASETv2/mistral_7b-1923.c'
source_filename = "DATASETv2/mistral_7b-1923.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Weather = type { float, float, float }

@.str = private unnamed_addr constant [22 x i8] c"\0ACity Weather Report\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"\0ACity %d:\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"Temperature: %.2f\C2\B0C\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Humidity: %.2f%%\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Precipitation: %.1fmm\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x %struct.Weather], align 16
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %4 = call i64 @time(ptr noundef null) #4
  %5 = trunc i64 %4 to i32
  call void @srand(i32 noundef %5) #4
  store i32 10, ptr %3, align 4
  %6 = getelementptr inbounds [5 x %struct.Weather], ptr %2, i64 0, i64 0
  %7 = load i32, ptr %3, align 4
  call void @generate_weather(ptr noundef %6, i32 noundef %7)
  %8 = getelementptr inbounds [5 x %struct.Weather], ptr %2, i64 0, i64 0
  call void @print_city_weather(ptr noundef %8)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_weather(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %41, %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 5
  br i1 %10, label %11, label %44

11:                                               ; preds = %8
  %12 = call i32 @rand() #4
  %13 = srem i32 %12, 30
  %14 = add nsw i32 %13, 5
  %15 = sitofp i32 %14 to float
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.Weather, ptr %16, i64 %18
  %20 = getelementptr inbounds %struct.Weather, ptr %19, i32 0, i32 0
  store float %15, ptr %20, align 4
  %21 = call i32 @rand() #4
  %22 = srem i32 %21, 51
  %23 = sitofp i32 %22 to double
  %24 = fadd double %23, 5.000000e+01
  %25 = fptrunc double %24 to float
  %26 = load ptr, ptr %3, align 8
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.Weather, ptr %26, i64 %28
  %30 = getelementptr inbounds %struct.Weather, ptr %29, i32 0, i32 1
  store float %25, ptr %30, align 4
  %31 = call i32 @rand() #4
  %32 = srem i32 %31, 11
  %33 = sitofp i32 %32 to double
  %34 = fadd double %33, 1.000000e-01
  %35 = fptrunc double %34 to float
  %36 = load ptr, ptr %3, align 8
  %37 = load i32, ptr %5, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.Weather, ptr %36, i64 %38
  %40 = getelementptr inbounds %struct.Weather, ptr %39, i32 0, i32 2
  store float %35, ptr %40, align 4
  br label %41

41:                                               ; preds = %11
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %5, align 4
  br label %8, !llvm.loop !6

44:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %45

45:                                               ; preds = %92, %44
  %46 = load i32, ptr %6, align 4
  %47 = load i32, ptr %4, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %95

49:                                               ; preds = %45
  store i32 0, ptr %7, align 4
  br label %50

50:                                               ; preds = %88, %49
  %51 = load i32, ptr %7, align 4
  %52 = icmp slt i32 %51, 5
  br i1 %52, label %53, label %91

53:                                               ; preds = %50
  %54 = call i32 @rand() #4
  %55 = srem i32 %54, 5
  %56 = sub nsw i32 %55, 2
  %57 = sitofp i32 %56 to float
  %58 = load ptr, ptr %3, align 8
  %59 = load i32, ptr %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds %struct.Weather, ptr %58, i64 %60
  %62 = getelementptr inbounds %struct.Weather, ptr %61, i32 0, i32 0
  %63 = load float, ptr %62, align 4
  %64 = fadd float %63, %57
  store float %64, ptr %62, align 4
  %65 = call i32 @rand() #4
  %66 = srem i32 %65, 11
  %67 = sub nsw i32 %66, 5
  %68 = sitofp i32 %67 to float
  %69 = load ptr, ptr %3, align 8
  %70 = load i32, ptr %7, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds %struct.Weather, ptr %69, i64 %71
  %73 = getelementptr inbounds %struct.Weather, ptr %72, i32 0, i32 1
  %74 = load float, ptr %73, align 4
  %75 = fadd float %74, %68
  store float %75, ptr %73, align 4
  %76 = call i32 @rand() #4
  %77 = srem i32 %76, 3
  %78 = sitofp i32 %77 to double
  %79 = load ptr, ptr %3, align 8
  %80 = load i32, ptr %7, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds %struct.Weather, ptr %79, i64 %81
  %83 = getelementptr inbounds %struct.Weather, ptr %82, i32 0, i32 2
  %84 = load float, ptr %83, align 4
  %85 = fpext float %84 to double
  %86 = call double @llvm.fmuladd.f64(double %78, double 1.000000e-01, double %85)
  %87 = fptrunc double %86 to float
  store float %87, ptr %83, align 4
  br label %88

88:                                               ; preds = %53
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %7, align 4
  br label %50, !llvm.loop !8

91:                                               ; preds = %50
  br label %92

92:                                               ; preds = %91
  %93 = load i32, ptr %6, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %6, align 4
  br label %45, !llvm.loop !9

95:                                               ; preds = %45
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_city_weather(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %36, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %8, label %39

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %10)
  %12 = load ptr, ptr %2, align 8
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.Weather, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.Weather, ptr %15, i32 0, i32 0
  %17 = load float, ptr %16, align 4
  %18 = fpext float %17 to double
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %18)
  %20 = load ptr, ptr %2, align 8
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %struct.Weather, ptr %20, i64 %22
  %24 = getelementptr inbounds %struct.Weather, ptr %23, i32 0, i32 1
  %25 = load float, ptr %24, align 4
  %26 = fpext float %25 to double
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %26)
  %28 = load ptr, ptr %2, align 8
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.Weather, ptr %28, i64 %30
  %32 = getelementptr inbounds %struct.Weather, ptr %31, i32 0, i32 2
  %33 = load float, ptr %32, align 4
  %34 = fpext float %33 to double
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %34)
  br label %36

36:                                               ; preds = %8
  %37 = load i32, ptr %3, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  br label %5, !llvm.loop !10

39:                                               ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
