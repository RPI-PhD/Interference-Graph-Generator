; ModuleID = 'LLVM_IR/gemini_pro-24326.ll'
source_filename = "DATASETv2/gemini_pro-24326.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Particle = type { double, double, double, double, double, double }

@particles = dso_local global [100 x %struct.Particle] zeroinitializer, align 16
@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initParticles() #0 {
  br label %1

1:                                                ; preds = %48, %0
  %.0 = phi i32 [ 0, %0 ], [ %49, %48 ]
  %2 = icmp slt i32 %.0, 100
  br i1 %2, label %3, label %50

3:                                                ; preds = %1
  %4 = call i32 @rand() #3
  %5 = srem i32 %4, 400
  %6 = add nsw i32 400, %5
  %7 = sub nsw i32 %6, 200
  %8 = sitofp i32 %7 to double
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Particle, ptr %10, i32 0, i32 0
  store double %8, ptr %11, align 16
  %12 = call i32 @rand() #3
  %13 = srem i32 %12, 300
  %14 = add nsw i32 300, %13
  %15 = sub nsw i32 %14, 150
  %16 = sitofp i32 %15 to double
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Particle, ptr %18, i32 0, i32 1
  store double %16, ptr %19, align 8
  %20 = call i32 @rand() #3
  %21 = srem i32 %20, 100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.000000e+02
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Particle, ptr %25, i32 0, i32 2
  store double %23, ptr %26, align 16
  %27 = call i32 @rand() #3
  %28 = srem i32 %27, 100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+02
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.Particle, ptr %32, i32 0, i32 3
  store double %30, ptr %33, align 8
  %34 = call i32 @rand() #3
  %35 = srem i32 %34, 100
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.000000e+02
  %38 = sext i32 %.0 to i64
  %39 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %38
  %40 = getelementptr inbounds %struct.Particle, ptr %39, i32 0, i32 4
  store double %37, ptr %40, align 16
  %41 = call i32 @rand() #3
  %42 = srem i32 %41, 100
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, 1.000000e+02
  %45 = sext i32 %.0 to i64
  %46 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.Particle, ptr %46, i32 0, i32 5
  store double %44, ptr %47, align 8
  br label %48

48:                                               ; preds = %3
  %49 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !6

50:                                               ; preds = %1
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @updateParticles() #0 {
  br label %1

1:                                                ; preds = %60, %0
  %.0 = phi i32 [ 0, %0 ], [ %61, %60 ]
  %2 = icmp slt i32 %.0, 100
  br i1 %2, label %3, label %62

3:                                                ; preds = %1
  %4 = sext i32 %.0 to i64
  %5 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %4
  %6 = getelementptr inbounds %struct.Particle, ptr %5, i32 0, i32 2
  %7 = load double, ptr %6, align 16
  %8 = fdiv double %7, 6.000000e+01
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Particle, ptr %10, i32 0, i32 0
  %12 = load double, ptr %11, align 16
  %13 = fadd double %12, %8
  store double %13, ptr %11, align 16
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Particle, ptr %15, i32 0, i32 3
  %17 = load double, ptr %16, align 8
  %18 = fdiv double %17, 6.000000e+01
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Particle, ptr %20, i32 0, i32 1
  %22 = load double, ptr %21, align 8
  %23 = fadd double %22, %18
  store double %23, ptr %21, align 8
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Particle, ptr %25, i32 0, i32 0
  %27 = load double, ptr %26, align 16
  %28 = fcmp ogt double %27, 8.000000e+02
  br i1 %28, label %35, label %29

29:                                               ; preds = %3
  %30 = sext i32 %.0 to i64
  %31 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Particle, ptr %31, i32 0, i32 0
  %33 = load double, ptr %32, align 16
  %34 = fcmp olt double %33, 0.000000e+00
  br i1 %34, label %35, label %41

35:                                               ; preds = %29, %3
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %36
  %38 = getelementptr inbounds %struct.Particle, ptr %37, i32 0, i32 2
  %39 = load double, ptr %38, align 16
  %40 = fmul double %39, -1.000000e+00
  store double %40, ptr %38, align 16
  br label %41

41:                                               ; preds = %35, %29
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.Particle, ptr %43, i32 0, i32 1
  %45 = load double, ptr %44, align 8
  %46 = fcmp ogt double %45, 6.000000e+02
  br i1 %46, label %53, label %47

47:                                               ; preds = %41
  %48 = sext i32 %.0 to i64
  %49 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.Particle, ptr %49, i32 0, i32 1
  %51 = load double, ptr %50, align 8
  %52 = fcmp olt double %51, 0.000000e+00
  br i1 %52, label %53, label %59

53:                                               ; preds = %47, %41
  %54 = sext i32 %.0 to i64
  %55 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %54
  %56 = getelementptr inbounds %struct.Particle, ptr %55, i32 0, i32 3
  %57 = load double, ptr %56, align 8
  %58 = fmul double %57, -1.000000e+00
  store double %58, ptr %56, align 8
  br label %59

59:                                               ; preds = %53, %47
  br label %60

60:                                               ; preds = %59
  %61 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !8

62:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @drawParticles() #0 {
  br label %1

1:                                                ; preds = %17, %0
  %.0 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %2 = icmp slt i32 %.0, 100
  br i1 %2, label %3, label %19

3:                                                ; preds = %1
  %4 = sext i32 %.0 to i64
  %5 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %4
  %6 = getelementptr inbounds %struct.Particle, ptr %5, i32 0, i32 0
  %7 = load double, ptr %6, align 16
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Particle, ptr %9, i32 0, i32 1
  %11 = load double, ptr %10, align 8
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Particle, ptr %13, i32 0, i32 5
  %15 = load double, ptr %14, align 8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %7, double noundef %11, double noundef %15)
  br label %17

17:                                               ; preds = %3
  %18 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !9

19:                                               ; preds = %1
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  call void @initParticles()
  br label %3

3:                                                ; preds = %3, %0
  call void @updateParticles()
  call void @drawParticles()
  br label %3
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
