; ModuleID = 'DATASETv2/gemini_pro-24326.c'
source_filename = "DATASETv2/gemini_pro-24326.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Particle = type { double, double, double, double, double, double }

@particles = dso_local global [100 x %struct.Particle] zeroinitializer, align 16
@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initParticles() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %56, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %59

5:                                                ; preds = %2
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 400
  %8 = add nsw i32 400, %7
  %9 = sub nsw i32 %8, 200
  %10 = sitofp i32 %9 to double
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Particle, ptr %13, i32 0, i32 0
  store double %10, ptr %14, align 16
  %15 = call i32 @rand() #3
  %16 = srem i32 %15, 300
  %17 = add nsw i32 300, %16
  %18 = sub nsw i32 %17, 150
  %19 = sitofp i32 %18 to double
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Particle, ptr %22, i32 0, i32 1
  store double %19, ptr %23, align 8
  %24 = call i32 @rand() #3
  %25 = srem i32 %24, 100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+02
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.Particle, ptr %30, i32 0, i32 2
  store double %27, ptr %31, align 16
  %32 = call i32 @rand() #3
  %33 = srem i32 %32, 100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.000000e+02
  %36 = load i32, ptr %1, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.Particle, ptr %38, i32 0, i32 3
  store double %35, ptr %39, align 8
  %40 = call i32 @rand() #3
  %41 = srem i32 %40, 100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.000000e+02
  %44 = load i32, ptr %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.Particle, ptr %46, i32 0, i32 4
  store double %43, ptr %47, align 16
  %48 = call i32 @rand() #3
  %49 = srem i32 %48, 100
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, 1.000000e+02
  %52 = load i32, ptr %1, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.Particle, ptr %54, i32 0, i32 5
  store double %51, ptr %55, align 8
  br label %56

56:                                               ; preds = %5
  %57 = load i32, ptr %1, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %1, align 4
  br label %2, !llvm.loop !6

59:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @updateParticles() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %72, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %75

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Particle, ptr %8, i32 0, i32 2
  %10 = load double, ptr %9, align 16
  %11 = fdiv double %10, 6.000000e+01
  %12 = load i32, ptr %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Particle, ptr %14, i32 0, i32 0
  %16 = load double, ptr %15, align 16
  %17 = fadd double %16, %11
  store double %17, ptr %15, align 16
  %18 = load i32, ptr %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Particle, ptr %20, i32 0, i32 3
  %22 = load double, ptr %21, align 8
  %23 = fdiv double %22, 6.000000e+01
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.Particle, ptr %26, i32 0, i32 1
  %28 = load double, ptr %27, align 8
  %29 = fadd double %28, %23
  store double %29, ptr %27, align 8
  %30 = load i32, ptr %1, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.Particle, ptr %32, i32 0, i32 0
  %34 = load double, ptr %33, align 16
  %35 = fcmp ogt double %34, 8.000000e+02
  br i1 %35, label %43, label %36

36:                                               ; preds = %5
  %37 = load i32, ptr %1, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %38
  %40 = getelementptr inbounds %struct.Particle, ptr %39, i32 0, i32 0
  %41 = load double, ptr %40, align 16
  %42 = fcmp olt double %41, 0.000000e+00
  br i1 %42, label %43, label %50

43:                                               ; preds = %36, %5
  %44 = load i32, ptr %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.Particle, ptr %46, i32 0, i32 2
  %48 = load double, ptr %47, align 16
  %49 = fmul double %48, -1.000000e+00
  store double %49, ptr %47, align 16
  br label %50

50:                                               ; preds = %43, %36
  %51 = load i32, ptr %1, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.Particle, ptr %53, i32 0, i32 1
  %55 = load double, ptr %54, align 8
  %56 = fcmp ogt double %55, 6.000000e+02
  br i1 %56, label %64, label %57

57:                                               ; preds = %50
  %58 = load i32, ptr %1, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.Particle, ptr %60, i32 0, i32 1
  %62 = load double, ptr %61, align 8
  %63 = fcmp olt double %62, 0.000000e+00
  br i1 %63, label %64, label %71

64:                                               ; preds = %57, %50
  %65 = load i32, ptr %1, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %66
  %68 = getelementptr inbounds %struct.Particle, ptr %67, i32 0, i32 3
  %69 = load double, ptr %68, align 8
  %70 = fmul double %69, -1.000000e+00
  store double %70, ptr %68, align 8
  br label %71

71:                                               ; preds = %64, %57
  br label %72

72:                                               ; preds = %71
  %73 = load i32, ptr %1, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %1, align 4
  br label %2, !llvm.loop !8

75:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @drawParticles() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %22, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %25

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Particle, ptr %8, i32 0, i32 0
  %10 = load double, ptr %9, align 16
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Particle, ptr %13, i32 0, i32 1
  %15 = load double, ptr %14, align 8
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.Particle], ptr @particles, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Particle, ptr %18, i32 0, i32 5
  %20 = load double, ptr %19, align 8
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %10, double noundef %15, double noundef %20)
  br label %22

22:                                               ; preds = %5
  %23 = load i32, ptr %1, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %1, align 4
  br label %2, !llvm.loop !9

25:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  call void @initParticles()
  br label %4

4:                                                ; preds = %0, %4
  call void @updateParticles()
  call void @drawParticles()
  br label %4
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
