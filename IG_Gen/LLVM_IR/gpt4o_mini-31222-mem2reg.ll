; ModuleID = 'LLVM_IR/gpt4o_mini-31222.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialize_polygon(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  store i32 0, ptr %2, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_vertex(ptr noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %23

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %9 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x %struct.Point], ptr %8, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.Point, ptr %12, i32 0, i32 0
  store double %1, ptr %13, align 8
  %14 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %15 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %16 = load i32, ptr %15, align 8
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.Point], ptr %14, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Point, ptr %18, i32 0, i32 1
  store double %2, ptr %19, align 8
  %20 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %20, align 8
  br label %23

23:                                               ; preds = %7, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @calculate_area(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %3 = load i32, ptr %2, align 8
  %4 = sub nsw i32 %3, 1
  br label %5

5:                                                ; preds = %33, %1
  %.02 = phi i32 [ %4, %1 ], [ %.0, %33 ]
  %.01 = phi double [ 0.000000e+00, %1 ], [ %32, %33 ]
  %.0 = phi i32 [ 0, %1 ], [ %34, %33 ]
  %6 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = icmp slt i32 %.0, %7
  br i1 %8, label %9, label %35

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %11 = sext i32 %.02 to i64
  %12 = getelementptr inbounds [100 x %struct.Point], ptr %10, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.Point, ptr %12, i32 0, i32 0
  %14 = load double, ptr %13, align 8
  %15 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [100 x %struct.Point], ptr %15, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Point, ptr %17, i32 0, i32 0
  %19 = load double, ptr %18, align 8
  %20 = fadd double %14, %19
  %21 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %22 = sext i32 %.02 to i64
  %23 = getelementptr inbounds [100 x %struct.Point], ptr %21, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.Point, ptr %23, i32 0, i32 1
  %25 = load double, ptr %24, align 8
  %26 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds [100 x %struct.Point], ptr %26, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Point, ptr %28, i32 0, i32 1
  %30 = load double, ptr %29, align 8
  %31 = fsub double %25, %30
  %32 = call double @llvm.fmuladd.f64(double %20, double %31, double %.01)
  br label %33

33:                                               ; preds = %9
  %34 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

35:                                               ; preds = %5
  %36 = fdiv double %.01, 2.000000e+00
  %37 = call double @llvm.fabs.f64(double %36)
  ret double %37
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @calculate_perimeter(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %37, %1
  %.01 = phi double [ 0.000000e+00, %1 ], [ %36, %37 ]
  %.0 = phi i32 [ 0, %1 ], [ %38, %37 ]
  %3 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %39

6:                                                ; preds = %2
  %7 = add nsw i32 %.0, 1
  %8 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  %10 = srem i32 %7, %9
  %11 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %12 = sext i32 %10 to i64
  %13 = getelementptr inbounds [100 x %struct.Point], ptr %11, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Point, ptr %13, i32 0, i32 0
  %15 = load double, ptr %14, align 8
  %16 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [100 x %struct.Point], ptr %16, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Point, ptr %18, i32 0, i32 0
  %20 = load double, ptr %19, align 8
  %21 = fsub double %15, %20
  %22 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %23 = sext i32 %10 to i64
  %24 = getelementptr inbounds [100 x %struct.Point], ptr %22, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Point, ptr %24, i32 0, i32 1
  %26 = load double, ptr %25, align 8
  %27 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [100 x %struct.Point], ptr %27, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.Point, ptr %29, i32 0, i32 1
  %31 = load double, ptr %30, align 8
  %32 = fsub double %26, %31
  %33 = fmul double %32, %32
  %34 = call double @llvm.fmuladd.f64(double %21, double %21, double %33)
  %35 = call double @sqrt(double noundef %34) #4
  %36 = fadd double %.01, %35
  br label %37

37:                                               ; preds = %6
  %38 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

39:                                               ; preds = %2
  ret double %.01
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_polygon(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %3

3:                                                ; preds = %20, %1
  %.0 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %4 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  %6 = icmp slt i32 %.0, %5
  br i1 %6, label %7, label %22

7:                                                ; preds = %3
  %8 = add nsw i32 %.0, 1
  %9 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.Point], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Point, ptr %11, i32 0, i32 0
  %13 = load double, ptr %12, align 8
  %14 = getelementptr inbounds %struct.Polygon, ptr %0, i32 0, i32 0
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [100 x %struct.Point], ptr %14, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Point, ptr %16, i32 0, i32 1
  %18 = load double, ptr %17, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %8, double noundef %13, double noundef %18)
  br label %20

20:                                               ; preds = %7
  %21 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

22:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Polygon, align 8
  call void @initialize_polygon(ptr noundef %1)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @add_vertex(ptr noundef %1, double noundef 0.000000e+00, double noundef 0.000000e+00)
  call void @add_vertex(ptr noundef %1, double noundef 4.000000e+00, double noundef 0.000000e+00)
  call void @add_vertex(ptr noundef %1, double noundef 4.000000e+00, double noundef 3.000000e+00)
  call void @add_vertex(ptr noundef %1, double noundef 0.000000e+00, double noundef 3.000000e+00)
  call void @display_polygon(ptr noundef %1)
  %3 = call double @calculate_area(ptr noundef %1)
  %4 = call double @calculate_perimeter(ptr noundef %1)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %3)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %4)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
