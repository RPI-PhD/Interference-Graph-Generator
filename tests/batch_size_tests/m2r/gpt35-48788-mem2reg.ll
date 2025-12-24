; ModuleID = 'LLVM_IR/gpt35-48788.ll'
source_filename = "DATASETv2/gpt35-48788.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Planet = type { ptr, double, double, double, double, double, double, double, double }

@.str = private unnamed_addr constant [4 x i8] c"Sun\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Mercury\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Venus\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Earth\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Mars\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"Jupiter\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"Saturn\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"Uranus\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Neptune\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"Time: %f days\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"%s: (%f, %f, %f)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @distance(ptr noundef byval(%struct.Planet) align 8 %0, ptr noundef byval(%struct.Planet) align 8 %1) #0 {
  %3 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 3
  %4 = load double, ptr %3, align 8
  %5 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 3
  %6 = load double, ptr %5, align 8
  %7 = fsub double %4, %6
  %8 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 4
  %9 = load double, ptr %8, align 8
  %10 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 4
  %11 = load double, ptr %10, align 8
  %12 = fsub double %9, %11
  %13 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 5
  %14 = load double, ptr %13, align 8
  %15 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 5
  %16 = load double, ptr %15, align 8
  %17 = fsub double %14, %16
  %18 = fmul double %12, %12
  %19 = call double @llvm.fmuladd.f64(double %7, double %7, double %18)
  %20 = call double @llvm.fmuladd.f64(double %17, double %17, double %19)
  %21 = call double @sqrt(double noundef %20) #5
  ret double %21
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @force(ptr noundef byval(%struct.Planet) align 8 %0, ptr noundef byval(%struct.Planet) align 8 %1) #0 {
  %3 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %0, ptr noundef byval(%struct.Planet) align 8 %1)
  %4 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 1
  %5 = load double, ptr %4, align 8
  %6 = fmul double 0x3DD2589EFFED8ACC, %5
  %7 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 1
  %8 = load double, ptr %7, align 8
  %9 = fmul double %6, %8
  %10 = fmul double %3, %3
  %11 = fdiv double %9, %10
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [9 x %struct.Planet], align 16
  %2 = alloca [9 x double], align 16
  %3 = alloca [9 x double], align 16
  %4 = alloca [9 x double], align 16
  %5 = call i64 @time(ptr noundef null) #5
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #5
  %7 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %8 = getelementptr inbounds %struct.Planet, ptr %7, i32 0, i32 0
  store ptr @.str, ptr %8, align 16
  %9 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %10 = getelementptr inbounds %struct.Planet, ptr %9, i32 0, i32 1
  store double 1.989100e+30, ptr %10, align 8
  %11 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %12 = getelementptr inbounds %struct.Planet, ptr %11, i32 0, i32 2
  store double 6.957000e+08, ptr %12, align 16
  %13 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %14 = getelementptr inbounds %struct.Planet, ptr %13, i32 0, i32 3
  store double 0.000000e+00, ptr %14, align 8
  %15 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %16 = getelementptr inbounds %struct.Planet, ptr %15, i32 0, i32 4
  store double 0.000000e+00, ptr %16, align 16
  %17 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %18 = getelementptr inbounds %struct.Planet, ptr %17, i32 0, i32 5
  store double 0.000000e+00, ptr %18, align 8
  %19 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %20 = getelementptr inbounds %struct.Planet, ptr %19, i32 0, i32 6
  store double 0.000000e+00, ptr %20, align 16
  %21 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %22 = getelementptr inbounds %struct.Planet, ptr %21, i32 0, i32 7
  store double 0.000000e+00, ptr %22, align 8
  %23 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 0
  %24 = getelementptr inbounds %struct.Planet, ptr %23, i32 0, i32 8
  store double 0.000000e+00, ptr %24, align 16
  %25 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %26 = getelementptr inbounds %struct.Planet, ptr %25, i32 0, i32 0
  store ptr @.str.1, ptr %26, align 8
  %27 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %28 = getelementptr inbounds %struct.Planet, ptr %27, i32 0, i32 1
  store double 3.285000e+23, ptr %28, align 8
  %29 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %30 = getelementptr inbounds %struct.Planet, ptr %29, i32 0, i32 2
  store double 2.440000e+06, ptr %30, align 8
  %31 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %32 = getelementptr inbounds %struct.Planet, ptr %31, i32 0, i32 3
  store double 5.790000e+10, ptr %32, align 8
  %33 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %34 = getelementptr inbounds %struct.Planet, ptr %33, i32 0, i32 4
  store double 0.000000e+00, ptr %34, align 8
  %35 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %36 = getelementptr inbounds %struct.Planet, ptr %35, i32 0, i32 5
  store double 0.000000e+00, ptr %36, align 8
  %37 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %38 = getelementptr inbounds %struct.Planet, ptr %37, i32 0, i32 6
  store double 0.000000e+00, ptr %38, align 8
  %39 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %40 = getelementptr inbounds %struct.Planet, ptr %39, i32 0, i32 7
  store double 4.790000e+04, ptr %40, align 8
  %41 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 1
  %42 = getelementptr inbounds %struct.Planet, ptr %41, i32 0, i32 8
  store double 0.000000e+00, ptr %42, align 8
  %43 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %44 = getelementptr inbounds %struct.Planet, ptr %43, i32 0, i32 0
  store ptr @.str.2, ptr %44, align 16
  %45 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %46 = getelementptr inbounds %struct.Planet, ptr %45, i32 0, i32 1
  store double 4.867000e+24, ptr %46, align 8
  %47 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %48 = getelementptr inbounds %struct.Planet, ptr %47, i32 0, i32 2
  store double 6.052000e+06, ptr %48, align 16
  %49 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %50 = getelementptr inbounds %struct.Planet, ptr %49, i32 0, i32 3
  store double 1.082000e+11, ptr %50, align 8
  %51 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %52 = getelementptr inbounds %struct.Planet, ptr %51, i32 0, i32 4
  store double 0.000000e+00, ptr %52, align 16
  %53 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %54 = getelementptr inbounds %struct.Planet, ptr %53, i32 0, i32 5
  store double 0.000000e+00, ptr %54, align 8
  %55 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %56 = getelementptr inbounds %struct.Planet, ptr %55, i32 0, i32 6
  store double 0.000000e+00, ptr %56, align 16
  %57 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %58 = getelementptr inbounds %struct.Planet, ptr %57, i32 0, i32 7
  store double 3.500000e+04, ptr %58, align 8
  %59 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 2
  %60 = getelementptr inbounds %struct.Planet, ptr %59, i32 0, i32 8
  store double 0.000000e+00, ptr %60, align 16
  %61 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %62 = getelementptr inbounds %struct.Planet, ptr %61, i32 0, i32 0
  store ptr @.str.3, ptr %62, align 8
  %63 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %64 = getelementptr inbounds %struct.Planet, ptr %63, i32 0, i32 1
  store double 5.972000e+24, ptr %64, align 8
  %65 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %66 = getelementptr inbounds %struct.Planet, ptr %65, i32 0, i32 2
  store double 6.371000e+06, ptr %66, align 8
  %67 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %68 = getelementptr inbounds %struct.Planet, ptr %67, i32 0, i32 3
  store double 1.496000e+11, ptr %68, align 8
  %69 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %70 = getelementptr inbounds %struct.Planet, ptr %69, i32 0, i32 4
  store double 0.000000e+00, ptr %70, align 8
  %71 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %72 = getelementptr inbounds %struct.Planet, ptr %71, i32 0, i32 5
  store double 0.000000e+00, ptr %72, align 8
  %73 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %74 = getelementptr inbounds %struct.Planet, ptr %73, i32 0, i32 6
  store double 0.000000e+00, ptr %74, align 8
  %75 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %76 = getelementptr inbounds %struct.Planet, ptr %75, i32 0, i32 7
  store double 2.978000e+04, ptr %76, align 8
  %77 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 3
  %78 = getelementptr inbounds %struct.Planet, ptr %77, i32 0, i32 8
  store double 0.000000e+00, ptr %78, align 8
  %79 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %80 = getelementptr inbounds %struct.Planet, ptr %79, i32 0, i32 0
  store ptr @.str.4, ptr %80, align 16
  %81 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %82 = getelementptr inbounds %struct.Planet, ptr %81, i32 0, i32 1
  store double 0x44E0EA084D181CD6, ptr %82, align 8
  %83 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %84 = getelementptr inbounds %struct.Planet, ptr %83, i32 0, i32 2
  store double 3.390000e+06, ptr %84, align 16
  %85 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %86 = getelementptr inbounds %struct.Planet, ptr %85, i32 0, i32 3
  store double 2.279000e+11, ptr %86, align 8
  %87 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %88 = getelementptr inbounds %struct.Planet, ptr %87, i32 0, i32 4
  store double 0.000000e+00, ptr %88, align 16
  %89 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %90 = getelementptr inbounds %struct.Planet, ptr %89, i32 0, i32 5
  store double 0.000000e+00, ptr %90, align 8
  %91 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %92 = getelementptr inbounds %struct.Planet, ptr %91, i32 0, i32 6
  store double 0.000000e+00, ptr %92, align 16
  %93 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %94 = getelementptr inbounds %struct.Planet, ptr %93, i32 0, i32 7
  store double 2.410000e+04, ptr %94, align 8
  %95 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 4
  %96 = getelementptr inbounds %struct.Planet, ptr %95, i32 0, i32 8
  store double 0.000000e+00, ptr %96, align 16
  %97 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %98 = getelementptr inbounds %struct.Planet, ptr %97, i32 0, i32 0
  store ptr @.str.5, ptr %98, align 8
  %99 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %100 = getelementptr inbounds %struct.Planet, ptr %99, i32 0, i32 1
  store double 1.898000e+27, ptr %100, align 8
  %101 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %102 = getelementptr inbounds %struct.Planet, ptr %101, i32 0, i32 2
  store double 7.149000e+07, ptr %102, align 8
  %103 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %104 = getelementptr inbounds %struct.Planet, ptr %103, i32 0, i32 3
  store double 7.783000e+11, ptr %104, align 8
  %105 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %106 = getelementptr inbounds %struct.Planet, ptr %105, i32 0, i32 4
  store double 0.000000e+00, ptr %106, align 8
  %107 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %108 = getelementptr inbounds %struct.Planet, ptr %107, i32 0, i32 5
  store double 0.000000e+00, ptr %108, align 8
  %109 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %110 = getelementptr inbounds %struct.Planet, ptr %109, i32 0, i32 6
  store double 0.000000e+00, ptr %110, align 8
  %111 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %112 = getelementptr inbounds %struct.Planet, ptr %111, i32 0, i32 7
  store double 1.307000e+04, ptr %112, align 8
  %113 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 5
  %114 = getelementptr inbounds %struct.Planet, ptr %113, i32 0, i32 8
  store double 0.000000e+00, ptr %114, align 8
  %115 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %116 = getelementptr inbounds %struct.Planet, ptr %115, i32 0, i32 0
  store ptr @.str.6, ptr %116, align 16
  %117 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %118 = getelementptr inbounds %struct.Planet, ptr %117, i32 0, i32 1
  store double 5.683000e+26, ptr %118, align 8
  %119 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %120 = getelementptr inbounds %struct.Planet, ptr %119, i32 0, i32 2
  store double 6.030000e+07, ptr %120, align 16
  %121 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %122 = getelementptr inbounds %struct.Planet, ptr %121, i32 0, i32 3
  store double 1.426000e+12, ptr %122, align 8
  %123 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %124 = getelementptr inbounds %struct.Planet, ptr %123, i32 0, i32 4
  store double 0.000000e+00, ptr %124, align 16
  %125 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %126 = getelementptr inbounds %struct.Planet, ptr %125, i32 0, i32 5
  store double 0.000000e+00, ptr %126, align 8
  %127 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %128 = getelementptr inbounds %struct.Planet, ptr %127, i32 0, i32 6
  store double 0.000000e+00, ptr %128, align 16
  %129 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %130 = getelementptr inbounds %struct.Planet, ptr %129, i32 0, i32 7
  store double 9.690000e+03, ptr %130, align 8
  %131 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 6
  %132 = getelementptr inbounds %struct.Planet, ptr %131, i32 0, i32 8
  store double 0.000000e+00, ptr %132, align 16
  %133 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %134 = getelementptr inbounds %struct.Planet, ptr %133, i32 0, i32 0
  store ptr @.str.7, ptr %134, align 8
  %135 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %136 = getelementptr inbounds %struct.Planet, ptr %135, i32 0, i32 1
  store double 8.681000e+25, ptr %136, align 8
  %137 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %138 = getelementptr inbounds %struct.Planet, ptr %137, i32 0, i32 2
  store double 2.564000e+07, ptr %138, align 8
  %139 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %140 = getelementptr inbounds %struct.Planet, ptr %139, i32 0, i32 3
  store double 2.871000e+12, ptr %140, align 8
  %141 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %142 = getelementptr inbounds %struct.Planet, ptr %141, i32 0, i32 4
  store double 0.000000e+00, ptr %142, align 8
  %143 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %144 = getelementptr inbounds %struct.Planet, ptr %143, i32 0, i32 5
  store double 0.000000e+00, ptr %144, align 8
  %145 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %146 = getelementptr inbounds %struct.Planet, ptr %145, i32 0, i32 6
  store double 0.000000e+00, ptr %146, align 8
  %147 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %148 = getelementptr inbounds %struct.Planet, ptr %147, i32 0, i32 7
  store double 6.810000e+03, ptr %148, align 8
  %149 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 7
  %150 = getelementptr inbounds %struct.Planet, ptr %149, i32 0, i32 8
  store double 0.000000e+00, ptr %150, align 8
  %151 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %152 = getelementptr inbounds %struct.Planet, ptr %151, i32 0, i32 0
  store ptr @.str.8, ptr %152, align 16
  %153 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %154 = getelementptr inbounds %struct.Planet, ptr %153, i32 0, i32 1
  store double 1.024000e+26, ptr %154, align 8
  %155 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %156 = getelementptr inbounds %struct.Planet, ptr %155, i32 0, i32 2
  store double 2.476000e+07, ptr %156, align 16
  %157 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %158 = getelementptr inbounds %struct.Planet, ptr %157, i32 0, i32 3
  store double 4.498000e+12, ptr %158, align 8
  %159 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %160 = getelementptr inbounds %struct.Planet, ptr %159, i32 0, i32 4
  store double 0.000000e+00, ptr %160, align 16
  %161 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %162 = getelementptr inbounds %struct.Planet, ptr %161, i32 0, i32 5
  store double 0.000000e+00, ptr %162, align 8
  %163 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %164 = getelementptr inbounds %struct.Planet, ptr %163, i32 0, i32 6
  store double 0.000000e+00, ptr %164, align 16
  %165 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %166 = getelementptr inbounds %struct.Planet, ptr %165, i32 0, i32 7
  store double 5.430000e+03, ptr %166, align 8
  %167 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 8
  %168 = getelementptr inbounds %struct.Planet, ptr %167, i32 0, i32 8
  store double 0.000000e+00, ptr %168, align 16
  br label %169

169:                                              ; preds = %377, %0
  %.01 = phi double [ 0.000000e+00, %0 ], [ %378, %377 ]
  %170 = fdiv double %.01, 3.650000e+02
  %171 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %170)
  br label %172

172:                                              ; preds = %192, %169
  %.02 = phi i32 [ 0, %169 ], [ %193, %192 ]
  %173 = icmp slt i32 %.02, 9
  br i1 %173, label %174, label %194

174:                                              ; preds = %172
  %175 = sext i32 %.02 to i64
  %176 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %175
  %177 = getelementptr inbounds %struct.Planet, ptr %176, i32 0, i32 0
  %178 = load ptr, ptr %177, align 8
  %179 = sext i32 %.02 to i64
  %180 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %179
  %181 = getelementptr inbounds %struct.Planet, ptr %180, i32 0, i32 3
  %182 = load double, ptr %181, align 8
  %183 = sext i32 %.02 to i64
  %184 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %183
  %185 = getelementptr inbounds %struct.Planet, ptr %184, i32 0, i32 4
  %186 = load double, ptr %185, align 8
  %187 = sext i32 %.02 to i64
  %188 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %187
  %189 = getelementptr inbounds %struct.Planet, ptr %188, i32 0, i32 5
  %190 = load double, ptr %189, align 8
  %191 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %178, double noundef %182, double noundef %186, double noundef %190)
  br label %192

192:                                              ; preds = %174
  %193 = add nsw i32 %.02, 1
  br label %172, !llvm.loop !6

194:                                              ; preds = %172
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 72, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 72, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %4, i8 0, i64 72, i1 false)
  br label %195

195:                                              ; preds = %303, %194
  %.03 = phi i32 [ 0, %194 ], [ %304, %303 ]
  %196 = icmp slt i32 %.03, 9
  br i1 %196, label %197, label %305

197:                                              ; preds = %195
  %198 = add nsw i32 %.03, 1
  br label %199

199:                                              ; preds = %300, %197
  %.04 = phi i32 [ %198, %197 ], [ %301, %300 ]
  %200 = icmp slt i32 %.04, 9
  br i1 %200, label %201, label %302

201:                                              ; preds = %199
  %202 = sext i32 %.03 to i64
  %203 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %202
  %204 = sext i32 %.04 to i64
  %205 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %204
  %206 = call double @force(ptr noundef byval(%struct.Planet) align 8 %203, ptr noundef byval(%struct.Planet) align 8 %205)
  %207 = sext i32 %.04 to i64
  %208 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %207
  %209 = getelementptr inbounds %struct.Planet, ptr %208, i32 0, i32 3
  %210 = load double, ptr %209, align 8
  %211 = sext i32 %.03 to i64
  %212 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %211
  %213 = getelementptr inbounds %struct.Planet, ptr %212, i32 0, i32 3
  %214 = load double, ptr %213, align 8
  %215 = fsub double %210, %214
  %216 = sext i32 %.04 to i64
  %217 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %216
  %218 = getelementptr inbounds %struct.Planet, ptr %217, i32 0, i32 4
  %219 = load double, ptr %218, align 8
  %220 = sext i32 %.03 to i64
  %221 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %220
  %222 = getelementptr inbounds %struct.Planet, ptr %221, i32 0, i32 4
  %223 = load double, ptr %222, align 8
  %224 = fsub double %219, %223
  %225 = sext i32 %.04 to i64
  %226 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %225
  %227 = getelementptr inbounds %struct.Planet, ptr %226, i32 0, i32 5
  %228 = load double, ptr %227, align 8
  %229 = sext i32 %.03 to i64
  %230 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %229
  %231 = getelementptr inbounds %struct.Planet, ptr %230, i32 0, i32 5
  %232 = load double, ptr %231, align 8
  %233 = fsub double %228, %232
  %234 = fmul double %206, %215
  %235 = sext i32 %.03 to i64
  %236 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %235
  %237 = sext i32 %.04 to i64
  %238 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %237
  %239 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %236, ptr noundef byval(%struct.Planet) align 8 %238)
  %240 = fdiv double %234, %239
  %241 = sext i32 %.03 to i64
  %242 = getelementptr inbounds [9 x double], ptr %2, i64 0, i64 %241
  %243 = load double, ptr %242, align 8
  %244 = fadd double %243, %240
  store double %244, ptr %242, align 8
  %245 = fmul double %206, %224
  %246 = sext i32 %.03 to i64
  %247 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %246
  %248 = sext i32 %.04 to i64
  %249 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %248
  %250 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %247, ptr noundef byval(%struct.Planet) align 8 %249)
  %251 = fdiv double %245, %250
  %252 = sext i32 %.03 to i64
  %253 = getelementptr inbounds [9 x double], ptr %3, i64 0, i64 %252
  %254 = load double, ptr %253, align 8
  %255 = fadd double %254, %251
  store double %255, ptr %253, align 8
  %256 = fmul double %206, %233
  %257 = sext i32 %.03 to i64
  %258 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %257
  %259 = sext i32 %.04 to i64
  %260 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %259
  %261 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %258, ptr noundef byval(%struct.Planet) align 8 %260)
  %262 = fdiv double %256, %261
  %263 = sext i32 %.03 to i64
  %264 = getelementptr inbounds [9 x double], ptr %4, i64 0, i64 %263
  %265 = load double, ptr %264, align 8
  %266 = fadd double %265, %262
  store double %266, ptr %264, align 8
  %267 = fmul double %206, %215
  %268 = sext i32 %.03 to i64
  %269 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %268
  %270 = sext i32 %.04 to i64
  %271 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %270
  %272 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %269, ptr noundef byval(%struct.Planet) align 8 %271)
  %273 = fdiv double %267, %272
  %274 = sext i32 %.04 to i64
  %275 = getelementptr inbounds [9 x double], ptr %2, i64 0, i64 %274
  %276 = load double, ptr %275, align 8
  %277 = fsub double %276, %273
  store double %277, ptr %275, align 8
  %278 = fmul double %206, %224
  %279 = sext i32 %.03 to i64
  %280 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %279
  %281 = sext i32 %.04 to i64
  %282 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %281
  %283 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %280, ptr noundef byval(%struct.Planet) align 8 %282)
  %284 = fdiv double %278, %283
  %285 = sext i32 %.04 to i64
  %286 = getelementptr inbounds [9 x double], ptr %3, i64 0, i64 %285
  %287 = load double, ptr %286, align 8
  %288 = fsub double %287, %284
  store double %288, ptr %286, align 8
  %289 = fmul double %206, %233
  %290 = sext i32 %.03 to i64
  %291 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %290
  %292 = sext i32 %.04 to i64
  %293 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %292
  %294 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %291, ptr noundef byval(%struct.Planet) align 8 %293)
  %295 = fdiv double %289, %294
  %296 = sext i32 %.04 to i64
  %297 = getelementptr inbounds [9 x double], ptr %4, i64 0, i64 %296
  %298 = load double, ptr %297, align 8
  %299 = fsub double %298, %295
  store double %299, ptr %297, align 8
  br label %300

300:                                              ; preds = %201
  %301 = add nsw i32 %.04, 1
  br label %199, !llvm.loop !8

302:                                              ; preds = %199
  br label %303

303:                                              ; preds = %302
  %304 = add nsw i32 %.03, 1
  br label %195, !llvm.loop !9

305:                                              ; preds = %195
  br label %306

306:                                              ; preds = %375, %305
  %.0 = phi i32 [ 0, %305 ], [ %376, %375 ]
  %307 = icmp slt i32 %.0, 9
  br i1 %307, label %308, label %377

308:                                              ; preds = %306
  %309 = sext i32 %.0 to i64
  %310 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %309
  %311 = getelementptr inbounds %struct.Planet, ptr %310, i32 0, i32 6
  %312 = load double, ptr %311, align 8
  %313 = sext i32 %.0 to i64
  %314 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %313
  %315 = getelementptr inbounds %struct.Planet, ptr %314, i32 0, i32 3
  %316 = load double, ptr %315, align 8
  %317 = call double @llvm.fmuladd.f64(double %312, double 8.640000e+04, double %316)
  store double %317, ptr %315, align 8
  %318 = sext i32 %.0 to i64
  %319 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %318
  %320 = getelementptr inbounds %struct.Planet, ptr %319, i32 0, i32 7
  %321 = load double, ptr %320, align 8
  %322 = sext i32 %.0 to i64
  %323 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %322
  %324 = getelementptr inbounds %struct.Planet, ptr %323, i32 0, i32 4
  %325 = load double, ptr %324, align 8
  %326 = call double @llvm.fmuladd.f64(double %321, double 8.640000e+04, double %325)
  store double %326, ptr %324, align 8
  %327 = sext i32 %.0 to i64
  %328 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %327
  %329 = getelementptr inbounds %struct.Planet, ptr %328, i32 0, i32 8
  %330 = load double, ptr %329, align 8
  %331 = sext i32 %.0 to i64
  %332 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %331
  %333 = getelementptr inbounds %struct.Planet, ptr %332, i32 0, i32 5
  %334 = load double, ptr %333, align 8
  %335 = call double @llvm.fmuladd.f64(double %330, double 8.640000e+04, double %334)
  store double %335, ptr %333, align 8
  %336 = sext i32 %.0 to i64
  %337 = getelementptr inbounds [9 x double], ptr %2, i64 0, i64 %336
  %338 = load double, ptr %337, align 8
  %339 = sext i32 %.0 to i64
  %340 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %339
  %341 = getelementptr inbounds %struct.Planet, ptr %340, i32 0, i32 1
  %342 = load double, ptr %341, align 8
  %343 = fdiv double %338, %342
  %344 = sext i32 %.0 to i64
  %345 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %344
  %346 = getelementptr inbounds %struct.Planet, ptr %345, i32 0, i32 6
  %347 = load double, ptr %346, align 8
  %348 = call double @llvm.fmuladd.f64(double %343, double 8.640000e+04, double %347)
  store double %348, ptr %346, align 8
  %349 = sext i32 %.0 to i64
  %350 = getelementptr inbounds [9 x double], ptr %3, i64 0, i64 %349
  %351 = load double, ptr %350, align 8
  %352 = sext i32 %.0 to i64
  %353 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %352
  %354 = getelementptr inbounds %struct.Planet, ptr %353, i32 0, i32 1
  %355 = load double, ptr %354, align 8
  %356 = fdiv double %351, %355
  %357 = sext i32 %.0 to i64
  %358 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %357
  %359 = getelementptr inbounds %struct.Planet, ptr %358, i32 0, i32 7
  %360 = load double, ptr %359, align 8
  %361 = call double @llvm.fmuladd.f64(double %356, double 8.640000e+04, double %360)
  store double %361, ptr %359, align 8
  %362 = sext i32 %.0 to i64
  %363 = getelementptr inbounds [9 x double], ptr %4, i64 0, i64 %362
  %364 = load double, ptr %363, align 8
  %365 = sext i32 %.0 to i64
  %366 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %365
  %367 = getelementptr inbounds %struct.Planet, ptr %366, i32 0, i32 1
  %368 = load double, ptr %367, align 8
  %369 = fdiv double %364, %368
  %370 = sext i32 %.0 to i64
  %371 = getelementptr inbounds [9 x %struct.Planet], ptr %1, i64 0, i64 %370
  %372 = getelementptr inbounds %struct.Planet, ptr %371, i32 0, i32 8
  %373 = load double, ptr %372, align 8
  %374 = call double @llvm.fmuladd.f64(double %369, double 8.640000e+04, double %373)
  store double %374, ptr %372, align 8
  br label %375

375:                                              ; preds = %308
  %376 = add nsw i32 %.0, 1
  br label %306, !llvm.loop !10

377:                                              ; preds = %306
  %378 = fadd double %.01, 8.640000e+04
  br label %169
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind }

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
