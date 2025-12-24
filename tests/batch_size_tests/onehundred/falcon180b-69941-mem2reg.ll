; ModuleID = 'LLVM_IR/falcon180b-69941.ll'
source_filename = "DATASETv2/falcon180b-69941.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Planet = type { double, double, double, double, double, double, double, double, double, double }

@.str = private unnamed_addr constant [19 x i8] c"Sun: (%f, %f, %f)\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Earth: (%f, %f, %f)\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Moon: (%f, %f, %f)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @advance(ptr noundef %0, double noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 0
  %4 = load double, ptr %3, align 8
  %5 = call double @pow(double noundef %4, double noundef 2.000000e+00) #5
  %6 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 1
  %7 = load double, ptr %6, align 8
  %8 = call double @pow(double noundef %7, double noundef 2.000000e+00) #5
  %9 = fadd double %5, %8
  %10 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 2
  %11 = load double, ptr %10, align 8
  %12 = call double @pow(double noundef %11, double noundef 2.000000e+00) #5
  %13 = fadd double %9, %12
  %14 = call double @sqrt(double noundef %13) #5
  %15 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 9
  %16 = load double, ptr %15, align 8
  %17 = fmul double 0x3DD2589EFFED8ACC, %16
  %18 = call double @pow(double noundef %14, double noundef 2.000000e+00) #5
  %19 = fdiv double %17, %18
  %20 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 0
  %21 = load double, ptr %20, align 8
  %22 = fmul double %19, %21
  %23 = fdiv double %22, %14
  %24 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 6
  store double %23, ptr %24, align 8
  %25 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 1
  %26 = load double, ptr %25, align 8
  %27 = fmul double %19, %26
  %28 = fdiv double %27, %14
  %29 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 7
  store double %28, ptr %29, align 8
  %30 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 2
  %31 = load double, ptr %30, align 8
  %32 = fmul double %19, %31
  %33 = fdiv double %32, %14
  %34 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 8
  store double %33, ptr %34, align 8
  %35 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 6
  %36 = load double, ptr %35, align 8
  %37 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 3
  %38 = load double, ptr %37, align 8
  %39 = call double @llvm.fmuladd.f64(double %36, double %1, double %38)
  store double %39, ptr %37, align 8
  %40 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 7
  %41 = load double, ptr %40, align 8
  %42 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 4
  %43 = load double, ptr %42, align 8
  %44 = call double @llvm.fmuladd.f64(double %41, double %1, double %43)
  store double %44, ptr %42, align 8
  %45 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 8
  %46 = load double, ptr %45, align 8
  %47 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 5
  %48 = load double, ptr %47, align 8
  %49 = call double @llvm.fmuladd.f64(double %46, double %1, double %48)
  store double %49, ptr %47, align 8
  %50 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 3
  %51 = load double, ptr %50, align 8
  %52 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 0
  %53 = load double, ptr %52, align 8
  %54 = call double @llvm.fmuladd.f64(double %51, double %1, double %53)
  store double %54, ptr %52, align 8
  %55 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 4
  %56 = load double, ptr %55, align 8
  %57 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 1
  %58 = load double, ptr %57, align 8
  %59 = call double @llvm.fmuladd.f64(double %56, double %1, double %58)
  store double %59, ptr %57, align 8
  %60 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 5
  %61 = load double, ptr %60, align 8
  %62 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 2
  %63 = load double, ptr %62, align 8
  %64 = call double @llvm.fmuladd.f64(double %61, double %1, double %63)
  store double %64, ptr %62, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Planet, align 8
  %2 = alloca %struct.Planet, align 8
  %3 = alloca %struct.Planet, align 8
  %4 = call i64 @time(ptr noundef null) #5
  %5 = trunc i64 %4 to i32
  call void @srand(i32 noundef %5) #5
  call void @llvm.memset.p0.i64(ptr align 8 %1, i8 0, i64 80, i1 false)
  %6 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 6
  store double 1.000000e+00, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 80, i1 false)
  %7 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 0
  store double 1.000000e+00, ptr %7, align 8
  %8 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 6
  store double 1.000000e+00, ptr %8, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 80, i1 false)
  %9 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 0
  store double 1.500000e+00, ptr %9, align 8
  %10 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 6
  store double 1.230000e-02, ptr %10, align 8
  br label %11

11:                                               ; preds = %11, %0
  call void @advance(ptr noundef %1, double noundef 8.600000e+01)
  call void @advance(ptr noundef %2, double noundef 8.600000e+01)
  call void @advance(ptr noundef %3, double noundef 8.600000e+01)
  %12 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 0
  %13 = load double, ptr %12, align 8
  %14 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 1
  %15 = load double, ptr %14, align 8
  %16 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 2
  %17 = load double, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %13, double noundef %15, double noundef %17)
  %19 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 0
  %20 = load double, ptr %19, align 8
  %21 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 1
  %22 = load double, ptr %21, align 8
  %23 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 2
  %24 = load double, ptr %23, align 8
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %20, double noundef %22, double noundef %24)
  %26 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 0
  %27 = load double, ptr %26, align 8
  %28 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 1
  %29 = load double, ptr %28, align 8
  %30 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 2
  %31 = load double, ptr %30, align 8
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %27, double noundef %29, double noundef %31)
  br label %11
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
