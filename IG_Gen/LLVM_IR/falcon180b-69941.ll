; ModuleID = 'DATASETv2/falcon180b-69941.c'
source_filename = "DATASETv2/falcon180b-69941.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Planet = type { double, double, double, double, double, double, double, double, double, double }

@.str = private unnamed_addr constant [19 x i8] c"Sun: (%f, %f, %f)\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Earth: (%f, %f, %f)\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Moon: (%f, %f, %f)\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @advance(ptr noundef %0, double noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store double %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.Planet, ptr %7, i32 0, i32 0
  %9 = load double, ptr %8, align 8
  %10 = call double @pow(double noundef %9, double noundef 2.000000e+00) #5
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.Planet, ptr %11, i32 0, i32 1
  %13 = load double, ptr %12, align 8
  %14 = call double @pow(double noundef %13, double noundef 2.000000e+00) #5
  %15 = fadd double %10, %14
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.Planet, ptr %16, i32 0, i32 2
  %18 = load double, ptr %17, align 8
  %19 = call double @pow(double noundef %18, double noundef 2.000000e+00) #5
  %20 = fadd double %15, %19
  %21 = call double @sqrt(double noundef %20) #5
  store double %21, ptr %5, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.Planet, ptr %22, i32 0, i32 9
  %24 = load double, ptr %23, align 8
  %25 = fmul double 0x3DD2589EFFED8ACC, %24
  %26 = load double, ptr %5, align 8
  %27 = call double @pow(double noundef %26, double noundef 2.000000e+00) #5
  %28 = fdiv double %25, %27
  store double %28, ptr %6, align 8
  %29 = load double, ptr %6, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.Planet, ptr %30, i32 0, i32 0
  %32 = load double, ptr %31, align 8
  %33 = fmul double %29, %32
  %34 = load double, ptr %5, align 8
  %35 = fdiv double %33, %34
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.Planet, ptr %36, i32 0, i32 6
  store double %35, ptr %37, align 8
  %38 = load double, ptr %6, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.Planet, ptr %39, i32 0, i32 1
  %41 = load double, ptr %40, align 8
  %42 = fmul double %38, %41
  %43 = load double, ptr %5, align 8
  %44 = fdiv double %42, %43
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds %struct.Planet, ptr %45, i32 0, i32 7
  store double %44, ptr %46, align 8
  %47 = load double, ptr %6, align 8
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds %struct.Planet, ptr %48, i32 0, i32 2
  %50 = load double, ptr %49, align 8
  %51 = fmul double %47, %50
  %52 = load double, ptr %5, align 8
  %53 = fdiv double %51, %52
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds %struct.Planet, ptr %54, i32 0, i32 8
  store double %53, ptr %55, align 8
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds %struct.Planet, ptr %56, i32 0, i32 6
  %58 = load double, ptr %57, align 8
  %59 = load double, ptr %4, align 8
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.Planet, ptr %60, i32 0, i32 3
  %62 = load double, ptr %61, align 8
  %63 = call double @llvm.fmuladd.f64(double %58, double %59, double %62)
  store double %63, ptr %61, align 8
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds %struct.Planet, ptr %64, i32 0, i32 7
  %66 = load double, ptr %65, align 8
  %67 = load double, ptr %4, align 8
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds %struct.Planet, ptr %68, i32 0, i32 4
  %70 = load double, ptr %69, align 8
  %71 = call double @llvm.fmuladd.f64(double %66, double %67, double %70)
  store double %71, ptr %69, align 8
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr inbounds %struct.Planet, ptr %72, i32 0, i32 8
  %74 = load double, ptr %73, align 8
  %75 = load double, ptr %4, align 8
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds %struct.Planet, ptr %76, i32 0, i32 5
  %78 = load double, ptr %77, align 8
  %79 = call double @llvm.fmuladd.f64(double %74, double %75, double %78)
  store double %79, ptr %77, align 8
  %80 = load ptr, ptr %3, align 8
  %81 = getelementptr inbounds %struct.Planet, ptr %80, i32 0, i32 3
  %82 = load double, ptr %81, align 8
  %83 = load double, ptr %4, align 8
  %84 = load ptr, ptr %3, align 8
  %85 = getelementptr inbounds %struct.Planet, ptr %84, i32 0, i32 0
  %86 = load double, ptr %85, align 8
  %87 = call double @llvm.fmuladd.f64(double %82, double %83, double %86)
  store double %87, ptr %85, align 8
  %88 = load ptr, ptr %3, align 8
  %89 = getelementptr inbounds %struct.Planet, ptr %88, i32 0, i32 4
  %90 = load double, ptr %89, align 8
  %91 = load double, ptr %4, align 8
  %92 = load ptr, ptr %3, align 8
  %93 = getelementptr inbounds %struct.Planet, ptr %92, i32 0, i32 1
  %94 = load double, ptr %93, align 8
  %95 = call double @llvm.fmuladd.f64(double %90, double %91, double %94)
  store double %95, ptr %93, align 8
  %96 = load ptr, ptr %3, align 8
  %97 = getelementptr inbounds %struct.Planet, ptr %96, i32 0, i32 5
  %98 = load double, ptr %97, align 8
  %99 = load double, ptr %4, align 8
  %100 = load ptr, ptr %3, align 8
  %101 = getelementptr inbounds %struct.Planet, ptr %100, i32 0, i32 2
  %102 = load double, ptr %101, align 8
  %103 = call double @llvm.fmuladd.f64(double %98, double %99, double %102)
  store double %103, ptr %101, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Planet, align 8
  %3 = alloca %struct.Planet, align 8
  %4 = alloca %struct.Planet, align 8
  %5 = alloca double, align 8
  store i32 0, ptr %1, align 4
  %6 = call i64 @time(ptr noundef null) #5
  %7 = trunc i64 %6 to i32
  call void @srand(i32 noundef %7) #5
  call void @llvm.memset.p0.i64(ptr align 8 %2, i8 0, i64 80, i1 false)
  %8 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 6
  store double 1.000000e+00, ptr %8, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 80, i1 false)
  %9 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 0
  store double 1.000000e+00, ptr %9, align 8
  %10 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 6
  store double 1.000000e+00, ptr %10, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %4, i8 0, i64 80, i1 false)
  %11 = getelementptr inbounds %struct.Planet, ptr %4, i32 0, i32 0
  store double 1.500000e+00, ptr %11, align 8
  %12 = getelementptr inbounds %struct.Planet, ptr %4, i32 0, i32 6
  store double 1.230000e-02, ptr %12, align 8
  store double 8.600000e+01, ptr %5, align 8
  br label %13

13:                                               ; preds = %0, %13
  %14 = load double, ptr %5, align 8
  call void @advance(ptr noundef %2, double noundef %14)
  %15 = load double, ptr %5, align 8
  call void @advance(ptr noundef %3, double noundef %15)
  %16 = load double, ptr %5, align 8
  call void @advance(ptr noundef %4, double noundef %16)
  %17 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 0
  %18 = load double, ptr %17, align 8
  %19 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 1
  %20 = load double, ptr %19, align 8
  %21 = getelementptr inbounds %struct.Planet, ptr %2, i32 0, i32 2
  %22 = load double, ptr %21, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %18, double noundef %20, double noundef %22)
  %24 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 0
  %25 = load double, ptr %24, align 8
  %26 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 1
  %27 = load double, ptr %26, align 8
  %28 = getelementptr inbounds %struct.Planet, ptr %3, i32 0, i32 2
  %29 = load double, ptr %28, align 8
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %25, double noundef %27, double noundef %29)
  %31 = getelementptr inbounds %struct.Planet, ptr %4, i32 0, i32 0
  %32 = load double, ptr %31, align 8
  %33 = getelementptr inbounds %struct.Planet, ptr %4, i32 0, i32 1
  %34 = load double, ptr %33, align 8
  %35 = getelementptr inbounds %struct.Planet, ptr %4, i32 0, i32 2
  %36 = load double, ptr %35, align 8
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %32, double noundef %34, double noundef %36)
  br label %13
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
