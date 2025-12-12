; ModuleID = 'DATASETv2/gpt4o_mini-31222.c'
source_filename = "DATASETv2/gpt4o_mini-31222.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Polygon = type { [100 x %struct.Point], i32 }
%struct.Point = type { double, double }

@.str = private unnamed_addr constant [19 x i8] c"Polygon vertices:\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Vertex %d: (%lf, %lf)\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Ah, dear Watson! Let us define our polygon.\0A\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"The area of the polygon is: %lf\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"The perimeter of the polygon is: %lf\0A\00", align 1
@.str.5 = private unnamed_addr constant [72 x i8] c"Elementary, my dear Watson, the mystery of geometry unfolds before us!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_polygon(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Polygon, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_vertex(ptr noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store ptr %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.Polygon, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  %10 = icmp slt i32 %9, 100
  br i1 %10, label %11, label %34

11:                                               ; preds = %3
  %12 = load double, ptr %5, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.Polygon, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.Polygon, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [100 x %struct.Point], ptr %14, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Point, ptr %19, i32 0, i32 0
  store double %12, ptr %20, align 8
  %21 = load double, ptr %6, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.Polygon, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.Polygon, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.Point], ptr %23, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Point, ptr %28, i32 0, i32 1
  store double %21, ptr %29, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.Polygon, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 8
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %31, align 8
  br label %34

34:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local double @calculate_area(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %3, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Polygon, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = sub nsw i32 %8, 1
  store i32 %9, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %50, %1
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.Polygon, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 8
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %53

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.Polygon, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.Point], ptr %18, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Point, ptr %21, i32 0, i32 0
  %23 = load double, ptr %22, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.Polygon, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.Point], ptr %25, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Point, ptr %28, i32 0, i32 0
  %30 = load double, ptr %29, align 8
  %31 = fadd double %23, %30
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.Polygon, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [100 x %struct.Point], ptr %33, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.Point, ptr %36, i32 0, i32 1
  %38 = load double, ptr %37, align 8
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr inbounds %struct.Polygon, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x %struct.Point], ptr %40, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.Point, ptr %43, i32 0, i32 1
  %45 = load double, ptr %44, align 8
  %46 = fsub double %38, %45
  %47 = load double, ptr %3, align 8
  %48 = call double @llvm.fmuladd.f64(double %31, double %46, double %47)
  store double %48, ptr %3, align 8
  %49 = load i32, ptr %5, align 4
  store i32 %49, ptr %4, align 4
  br label %50

50:                                               ; preds = %16
  %51 = load i32, ptr %5, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %5, align 4
  br label %10, !llvm.loop !6

53:                                               ; preds = %10
  %54 = load double, ptr %3, align 8
  %55 = fdiv double %54, 2.000000e+00
  %56 = call double @llvm.fabs.f64(double %55)
  ret double %56
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local double @calculate_perimeter(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %60, %1
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.Polygon, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %63

14:                                               ; preds = %8
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %15, 1
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.Polygon, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 8
  %20 = srem i32 %16, %19
  store i32 %20, ptr %5, align 4
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.Polygon, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [100 x %struct.Point], ptr %22, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Point, ptr %25, i32 0, i32 0
  %27 = load double, ptr %26, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.Polygon, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x %struct.Point], ptr %29, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.Point, ptr %32, i32 0, i32 0
  %34 = load double, ptr %33, align 8
  %35 = fsub double %27, %34
  store double %35, ptr %6, align 8
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.Polygon, ptr %36, i32 0, i32 0
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x %struct.Point], ptr %37, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.Point, ptr %40, i32 0, i32 1
  %42 = load double, ptr %41, align 8
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.Polygon, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %4, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [100 x %struct.Point], ptr %44, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.Point, ptr %47, i32 0, i32 1
  %49 = load double, ptr %48, align 8
  %50 = fsub double %42, %49
  store double %50, ptr %7, align 8
  %51 = load double, ptr %6, align 8
  %52 = load double, ptr %6, align 8
  %53 = load double, ptr %7, align 8
  %54 = load double, ptr %7, align 8
  %55 = fmul double %53, %54
  %56 = call double @llvm.fmuladd.f64(double %51, double %52, double %55)
  %57 = call double @sqrt(double noundef %56) #4
  %58 = load double, ptr %3, align 8
  %59 = fadd double %58, %57
  store double %59, ptr %3, align 8
  br label %60

60:                                               ; preds = %14
  %61 = load i32, ptr %4, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %4, align 4
  br label %8, !llvm.loop !8

63:                                               ; preds = %8
  %64 = load double, ptr %3, align 8
  ret double %64
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_polygon(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %29, %1
  %6 = load i32, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Polygon, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %32

11:                                               ; preds = %5
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.Polygon, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.Point], ptr %15, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Point, ptr %18, i32 0, i32 0
  %20 = load double, ptr %19, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.Polygon, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [100 x %struct.Point], ptr %22, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Point, ptr %25, i32 0, i32 1
  %27 = load double, ptr %26, align 8
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %13, double noundef %20, double noundef %27)
  br label %29

29:                                               ; preds = %11
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %5, !llvm.loop !9

32:                                               ; preds = %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Polygon, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store i32 0, ptr %1, align 4
  call void @initialize_polygon(ptr noundef %2)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @add_vertex(ptr noundef %2, double noundef 0.000000e+00, double noundef 0.000000e+00)
  call void @add_vertex(ptr noundef %2, double noundef 4.000000e+00, double noundef 0.000000e+00)
  call void @add_vertex(ptr noundef %2, double noundef 4.000000e+00, double noundef 3.000000e+00)
  call void @add_vertex(ptr noundef %2, double noundef 0.000000e+00, double noundef 3.000000e+00)
  call void @display_polygon(ptr noundef %2)
  %6 = call double @calculate_area(ptr noundef %2)
  store double %6, ptr %3, align 8
  %7 = call double @calculate_perimeter(ptr noundef %2)
  store double %7, ptr %4, align 8
  %8 = load double, ptr %3, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %8)
  %10 = load double, ptr %4, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
