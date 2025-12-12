; ModuleID = 'DATASETv2/gpt35-48788.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local double @distance(ptr noundef byval(%struct.Planet) align 8 %0, ptr noundef byval(%struct.Planet) align 8 %1) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 3
  %7 = load double, ptr %6, align 8
  %8 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 3
  %9 = load double, ptr %8, align 8
  %10 = fsub double %7, %9
  store double %10, ptr %3, align 8
  %11 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 4
  %12 = load double, ptr %11, align 8
  %13 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 4
  %14 = load double, ptr %13, align 8
  %15 = fsub double %12, %14
  store double %15, ptr %4, align 8
  %16 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 5
  %17 = load double, ptr %16, align 8
  %18 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 5
  %19 = load double, ptr %18, align 8
  %20 = fsub double %17, %19
  store double %20, ptr %5, align 8
  %21 = load double, ptr %3, align 8
  %22 = load double, ptr %3, align 8
  %23 = load double, ptr %4, align 8
  %24 = load double, ptr %4, align 8
  %25 = fmul double %23, %24
  %26 = call double @llvm.fmuladd.f64(double %21, double %22, double %25)
  %27 = load double, ptr %5, align 8
  %28 = load double, ptr %5, align 8
  %29 = call double @llvm.fmuladd.f64(double %27, double %28, double %26)
  %30 = call double @sqrt(double noundef %29) #5
  ret double %30
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local double @force(ptr noundef byval(%struct.Planet) align 8 %0, ptr noundef byval(%struct.Planet) align 8 %1) #0 {
  %3 = alloca double, align 8
  %4 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %0, ptr noundef byval(%struct.Planet) align 8 %1)
  store double %4, ptr %3, align 8
  %5 = getelementptr inbounds %struct.Planet, ptr %0, i32 0, i32 1
  %6 = load double, ptr %5, align 8
  %7 = fmul double 0x3DD2589EFFED8ACC, %6
  %8 = getelementptr inbounds %struct.Planet, ptr %1, i32 0, i32 1
  %9 = load double, ptr %8, align 8
  %10 = fmul double %7, %9
  %11 = load double, ptr %3, align 8
  %12 = load double, ptr %3, align 8
  %13 = fmul double %11, %12
  %14 = fdiv double %10, %13
  ret double %14
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca [9 x %struct.Planet], align 16
  %4 = alloca i32, align 4
  %5 = alloca [9 x double], align 16
  %6 = alloca [9 x double], align 16
  %7 = alloca [9 x double], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %15 = call i64 @time(ptr noundef null) #5
  %16 = trunc i64 %15 to i32
  call void @srand(i32 noundef %16) #5
  store double 0.000000e+00, ptr %2, align 8
  %17 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %18 = getelementptr inbounds %struct.Planet, ptr %17, i32 0, i32 0
  store ptr @.str, ptr %18, align 16
  %19 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %20 = getelementptr inbounds %struct.Planet, ptr %19, i32 0, i32 1
  store double 1.989100e+30, ptr %20, align 8
  %21 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %22 = getelementptr inbounds %struct.Planet, ptr %21, i32 0, i32 2
  store double 6.957000e+08, ptr %22, align 16
  %23 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %24 = getelementptr inbounds %struct.Planet, ptr %23, i32 0, i32 3
  store double 0.000000e+00, ptr %24, align 8
  %25 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %26 = getelementptr inbounds %struct.Planet, ptr %25, i32 0, i32 4
  store double 0.000000e+00, ptr %26, align 16
  %27 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %28 = getelementptr inbounds %struct.Planet, ptr %27, i32 0, i32 5
  store double 0.000000e+00, ptr %28, align 8
  %29 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %30 = getelementptr inbounds %struct.Planet, ptr %29, i32 0, i32 6
  store double 0.000000e+00, ptr %30, align 16
  %31 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %32 = getelementptr inbounds %struct.Planet, ptr %31, i32 0, i32 7
  store double 0.000000e+00, ptr %32, align 8
  %33 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 0
  %34 = getelementptr inbounds %struct.Planet, ptr %33, i32 0, i32 8
  store double 0.000000e+00, ptr %34, align 16
  %35 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %36 = getelementptr inbounds %struct.Planet, ptr %35, i32 0, i32 0
  store ptr @.str.1, ptr %36, align 8
  %37 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %38 = getelementptr inbounds %struct.Planet, ptr %37, i32 0, i32 1
  store double 3.285000e+23, ptr %38, align 8
  %39 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %40 = getelementptr inbounds %struct.Planet, ptr %39, i32 0, i32 2
  store double 2.440000e+06, ptr %40, align 8
  %41 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %42 = getelementptr inbounds %struct.Planet, ptr %41, i32 0, i32 3
  store double 5.790000e+10, ptr %42, align 8
  %43 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %44 = getelementptr inbounds %struct.Planet, ptr %43, i32 0, i32 4
  store double 0.000000e+00, ptr %44, align 8
  %45 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %46 = getelementptr inbounds %struct.Planet, ptr %45, i32 0, i32 5
  store double 0.000000e+00, ptr %46, align 8
  %47 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %48 = getelementptr inbounds %struct.Planet, ptr %47, i32 0, i32 6
  store double 0.000000e+00, ptr %48, align 8
  %49 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %50 = getelementptr inbounds %struct.Planet, ptr %49, i32 0, i32 7
  store double 4.790000e+04, ptr %50, align 8
  %51 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 1
  %52 = getelementptr inbounds %struct.Planet, ptr %51, i32 0, i32 8
  store double 0.000000e+00, ptr %52, align 8
  %53 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %54 = getelementptr inbounds %struct.Planet, ptr %53, i32 0, i32 0
  store ptr @.str.2, ptr %54, align 16
  %55 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %56 = getelementptr inbounds %struct.Planet, ptr %55, i32 0, i32 1
  store double 4.867000e+24, ptr %56, align 8
  %57 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %58 = getelementptr inbounds %struct.Planet, ptr %57, i32 0, i32 2
  store double 6.052000e+06, ptr %58, align 16
  %59 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %60 = getelementptr inbounds %struct.Planet, ptr %59, i32 0, i32 3
  store double 1.082000e+11, ptr %60, align 8
  %61 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %62 = getelementptr inbounds %struct.Planet, ptr %61, i32 0, i32 4
  store double 0.000000e+00, ptr %62, align 16
  %63 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %64 = getelementptr inbounds %struct.Planet, ptr %63, i32 0, i32 5
  store double 0.000000e+00, ptr %64, align 8
  %65 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %66 = getelementptr inbounds %struct.Planet, ptr %65, i32 0, i32 6
  store double 0.000000e+00, ptr %66, align 16
  %67 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %68 = getelementptr inbounds %struct.Planet, ptr %67, i32 0, i32 7
  store double 3.500000e+04, ptr %68, align 8
  %69 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 2
  %70 = getelementptr inbounds %struct.Planet, ptr %69, i32 0, i32 8
  store double 0.000000e+00, ptr %70, align 16
  %71 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %72 = getelementptr inbounds %struct.Planet, ptr %71, i32 0, i32 0
  store ptr @.str.3, ptr %72, align 8
  %73 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %74 = getelementptr inbounds %struct.Planet, ptr %73, i32 0, i32 1
  store double 5.972000e+24, ptr %74, align 8
  %75 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %76 = getelementptr inbounds %struct.Planet, ptr %75, i32 0, i32 2
  store double 6.371000e+06, ptr %76, align 8
  %77 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %78 = getelementptr inbounds %struct.Planet, ptr %77, i32 0, i32 3
  store double 1.496000e+11, ptr %78, align 8
  %79 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %80 = getelementptr inbounds %struct.Planet, ptr %79, i32 0, i32 4
  store double 0.000000e+00, ptr %80, align 8
  %81 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %82 = getelementptr inbounds %struct.Planet, ptr %81, i32 0, i32 5
  store double 0.000000e+00, ptr %82, align 8
  %83 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %84 = getelementptr inbounds %struct.Planet, ptr %83, i32 0, i32 6
  store double 0.000000e+00, ptr %84, align 8
  %85 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %86 = getelementptr inbounds %struct.Planet, ptr %85, i32 0, i32 7
  store double 2.978000e+04, ptr %86, align 8
  %87 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 3
  %88 = getelementptr inbounds %struct.Planet, ptr %87, i32 0, i32 8
  store double 0.000000e+00, ptr %88, align 8
  %89 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %90 = getelementptr inbounds %struct.Planet, ptr %89, i32 0, i32 0
  store ptr @.str.4, ptr %90, align 16
  %91 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %92 = getelementptr inbounds %struct.Planet, ptr %91, i32 0, i32 1
  store double 0x44E0EA084D181CD6, ptr %92, align 8
  %93 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %94 = getelementptr inbounds %struct.Planet, ptr %93, i32 0, i32 2
  store double 3.390000e+06, ptr %94, align 16
  %95 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %96 = getelementptr inbounds %struct.Planet, ptr %95, i32 0, i32 3
  store double 2.279000e+11, ptr %96, align 8
  %97 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %98 = getelementptr inbounds %struct.Planet, ptr %97, i32 0, i32 4
  store double 0.000000e+00, ptr %98, align 16
  %99 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %100 = getelementptr inbounds %struct.Planet, ptr %99, i32 0, i32 5
  store double 0.000000e+00, ptr %100, align 8
  %101 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %102 = getelementptr inbounds %struct.Planet, ptr %101, i32 0, i32 6
  store double 0.000000e+00, ptr %102, align 16
  %103 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %104 = getelementptr inbounds %struct.Planet, ptr %103, i32 0, i32 7
  store double 2.410000e+04, ptr %104, align 8
  %105 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 4
  %106 = getelementptr inbounds %struct.Planet, ptr %105, i32 0, i32 8
  store double 0.000000e+00, ptr %106, align 16
  %107 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %108 = getelementptr inbounds %struct.Planet, ptr %107, i32 0, i32 0
  store ptr @.str.5, ptr %108, align 8
  %109 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %110 = getelementptr inbounds %struct.Planet, ptr %109, i32 0, i32 1
  store double 1.898000e+27, ptr %110, align 8
  %111 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %112 = getelementptr inbounds %struct.Planet, ptr %111, i32 0, i32 2
  store double 7.149000e+07, ptr %112, align 8
  %113 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %114 = getelementptr inbounds %struct.Planet, ptr %113, i32 0, i32 3
  store double 7.783000e+11, ptr %114, align 8
  %115 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %116 = getelementptr inbounds %struct.Planet, ptr %115, i32 0, i32 4
  store double 0.000000e+00, ptr %116, align 8
  %117 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %118 = getelementptr inbounds %struct.Planet, ptr %117, i32 0, i32 5
  store double 0.000000e+00, ptr %118, align 8
  %119 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %120 = getelementptr inbounds %struct.Planet, ptr %119, i32 0, i32 6
  store double 0.000000e+00, ptr %120, align 8
  %121 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %122 = getelementptr inbounds %struct.Planet, ptr %121, i32 0, i32 7
  store double 1.307000e+04, ptr %122, align 8
  %123 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 5
  %124 = getelementptr inbounds %struct.Planet, ptr %123, i32 0, i32 8
  store double 0.000000e+00, ptr %124, align 8
  %125 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %126 = getelementptr inbounds %struct.Planet, ptr %125, i32 0, i32 0
  store ptr @.str.6, ptr %126, align 16
  %127 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %128 = getelementptr inbounds %struct.Planet, ptr %127, i32 0, i32 1
  store double 5.683000e+26, ptr %128, align 8
  %129 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %130 = getelementptr inbounds %struct.Planet, ptr %129, i32 0, i32 2
  store double 6.030000e+07, ptr %130, align 16
  %131 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %132 = getelementptr inbounds %struct.Planet, ptr %131, i32 0, i32 3
  store double 1.426000e+12, ptr %132, align 8
  %133 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %134 = getelementptr inbounds %struct.Planet, ptr %133, i32 0, i32 4
  store double 0.000000e+00, ptr %134, align 16
  %135 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %136 = getelementptr inbounds %struct.Planet, ptr %135, i32 0, i32 5
  store double 0.000000e+00, ptr %136, align 8
  %137 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %138 = getelementptr inbounds %struct.Planet, ptr %137, i32 0, i32 6
  store double 0.000000e+00, ptr %138, align 16
  %139 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %140 = getelementptr inbounds %struct.Planet, ptr %139, i32 0, i32 7
  store double 9.690000e+03, ptr %140, align 8
  %141 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 6
  %142 = getelementptr inbounds %struct.Planet, ptr %141, i32 0, i32 8
  store double 0.000000e+00, ptr %142, align 16
  %143 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %144 = getelementptr inbounds %struct.Planet, ptr %143, i32 0, i32 0
  store ptr @.str.7, ptr %144, align 8
  %145 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %146 = getelementptr inbounds %struct.Planet, ptr %145, i32 0, i32 1
  store double 8.681000e+25, ptr %146, align 8
  %147 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %148 = getelementptr inbounds %struct.Planet, ptr %147, i32 0, i32 2
  store double 2.564000e+07, ptr %148, align 8
  %149 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %150 = getelementptr inbounds %struct.Planet, ptr %149, i32 0, i32 3
  store double 2.871000e+12, ptr %150, align 8
  %151 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %152 = getelementptr inbounds %struct.Planet, ptr %151, i32 0, i32 4
  store double 0.000000e+00, ptr %152, align 8
  %153 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %154 = getelementptr inbounds %struct.Planet, ptr %153, i32 0, i32 5
  store double 0.000000e+00, ptr %154, align 8
  %155 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %156 = getelementptr inbounds %struct.Planet, ptr %155, i32 0, i32 6
  store double 0.000000e+00, ptr %156, align 8
  %157 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %158 = getelementptr inbounds %struct.Planet, ptr %157, i32 0, i32 7
  store double 6.810000e+03, ptr %158, align 8
  %159 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 7
  %160 = getelementptr inbounds %struct.Planet, ptr %159, i32 0, i32 8
  store double 0.000000e+00, ptr %160, align 8
  %161 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %162 = getelementptr inbounds %struct.Planet, ptr %161, i32 0, i32 0
  store ptr @.str.8, ptr %162, align 16
  %163 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %164 = getelementptr inbounds %struct.Planet, ptr %163, i32 0, i32 1
  store double 1.024000e+26, ptr %164, align 8
  %165 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %166 = getelementptr inbounds %struct.Planet, ptr %165, i32 0, i32 2
  store double 2.476000e+07, ptr %166, align 16
  %167 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %168 = getelementptr inbounds %struct.Planet, ptr %167, i32 0, i32 3
  store double 4.498000e+12, ptr %168, align 8
  %169 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %170 = getelementptr inbounds %struct.Planet, ptr %169, i32 0, i32 4
  store double 0.000000e+00, ptr %170, align 16
  %171 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %172 = getelementptr inbounds %struct.Planet, ptr %171, i32 0, i32 5
  store double 0.000000e+00, ptr %172, align 8
  %173 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %174 = getelementptr inbounds %struct.Planet, ptr %173, i32 0, i32 6
  store double 0.000000e+00, ptr %174, align 16
  %175 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %176 = getelementptr inbounds %struct.Planet, ptr %175, i32 0, i32 7
  store double 5.430000e+03, ptr %176, align 8
  %177 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 8
  %178 = getelementptr inbounds %struct.Planet, ptr %177, i32 0, i32 8
  store double 0.000000e+00, ptr %178, align 16
  br label %179

179:                                              ; preds = %0, %454
  %180 = load double, ptr %2, align 8
  %181 = fdiv double %180, 3.650000e+02
  %182 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %181)
  store i32 0, ptr %4, align 4
  br label %183

183:                                              ; preds = %208, %179
  %184 = load i32, ptr %4, align 4
  %185 = icmp slt i32 %184, 9
  br i1 %185, label %186, label %211

186:                                              ; preds = %183
  %187 = load i32, ptr %4, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %188
  %190 = getelementptr inbounds %struct.Planet, ptr %189, i32 0, i32 0
  %191 = load ptr, ptr %190, align 8
  %192 = load i32, ptr %4, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %193
  %195 = getelementptr inbounds %struct.Planet, ptr %194, i32 0, i32 3
  %196 = load double, ptr %195, align 8
  %197 = load i32, ptr %4, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %198
  %200 = getelementptr inbounds %struct.Planet, ptr %199, i32 0, i32 4
  %201 = load double, ptr %200, align 8
  %202 = load i32, ptr %4, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %203
  %205 = getelementptr inbounds %struct.Planet, ptr %204, i32 0, i32 5
  %206 = load double, ptr %205, align 8
  %207 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %191, double noundef %196, double noundef %201, double noundef %206)
  br label %208

208:                                              ; preds = %186
  %209 = load i32, ptr %4, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, ptr %4, align 4
  br label %183, !llvm.loop !6

211:                                              ; preds = %183
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 72, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 72, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %7, i8 0, i64 72, i1 false)
  store i32 0, ptr %8, align 4
  br label %212

212:                                              ; preds = %362, %211
  %213 = load i32, ptr %8, align 4
  %214 = icmp slt i32 %213, 9
  br i1 %214, label %215, label %365

215:                                              ; preds = %212
  %216 = load i32, ptr %8, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, ptr %9, align 4
  br label %218

218:                                              ; preds = %358, %215
  %219 = load i32, ptr %9, align 4
  %220 = icmp slt i32 %219, 9
  br i1 %220, label %221, label %361

221:                                              ; preds = %218
  %222 = load i32, ptr %8, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %223
  %225 = load i32, ptr %9, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %226
  %228 = call double @force(ptr noundef byval(%struct.Planet) align 8 %224, ptr noundef byval(%struct.Planet) align 8 %227)
  store double %228, ptr %10, align 8
  %229 = load i32, ptr %9, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %230
  %232 = getelementptr inbounds %struct.Planet, ptr %231, i32 0, i32 3
  %233 = load double, ptr %232, align 8
  %234 = load i32, ptr %8, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %235
  %237 = getelementptr inbounds %struct.Planet, ptr %236, i32 0, i32 3
  %238 = load double, ptr %237, align 8
  %239 = fsub double %233, %238
  store double %239, ptr %11, align 8
  %240 = load i32, ptr %9, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %241
  %243 = getelementptr inbounds %struct.Planet, ptr %242, i32 0, i32 4
  %244 = load double, ptr %243, align 8
  %245 = load i32, ptr %8, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %246
  %248 = getelementptr inbounds %struct.Planet, ptr %247, i32 0, i32 4
  %249 = load double, ptr %248, align 8
  %250 = fsub double %244, %249
  store double %250, ptr %12, align 8
  %251 = load i32, ptr %9, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %252
  %254 = getelementptr inbounds %struct.Planet, ptr %253, i32 0, i32 5
  %255 = load double, ptr %254, align 8
  %256 = load i32, ptr %8, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %257
  %259 = getelementptr inbounds %struct.Planet, ptr %258, i32 0, i32 5
  %260 = load double, ptr %259, align 8
  %261 = fsub double %255, %260
  store double %261, ptr %13, align 8
  %262 = load double, ptr %10, align 8
  %263 = load double, ptr %11, align 8
  %264 = fmul double %262, %263
  %265 = load i32, ptr %8, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %266
  %268 = load i32, ptr %9, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %269
  %271 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %267, ptr noundef byval(%struct.Planet) align 8 %270)
  %272 = fdiv double %264, %271
  %273 = load i32, ptr %8, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [9 x double], ptr %5, i64 0, i64 %274
  %276 = load double, ptr %275, align 8
  %277 = fadd double %276, %272
  store double %277, ptr %275, align 8
  %278 = load double, ptr %10, align 8
  %279 = load double, ptr %12, align 8
  %280 = fmul double %278, %279
  %281 = load i32, ptr %8, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %282
  %284 = load i32, ptr %9, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %285
  %287 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %283, ptr noundef byval(%struct.Planet) align 8 %286)
  %288 = fdiv double %280, %287
  %289 = load i32, ptr %8, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [9 x double], ptr %6, i64 0, i64 %290
  %292 = load double, ptr %291, align 8
  %293 = fadd double %292, %288
  store double %293, ptr %291, align 8
  %294 = load double, ptr %10, align 8
  %295 = load double, ptr %13, align 8
  %296 = fmul double %294, %295
  %297 = load i32, ptr %8, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %298
  %300 = load i32, ptr %9, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %301
  %303 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %299, ptr noundef byval(%struct.Planet) align 8 %302)
  %304 = fdiv double %296, %303
  %305 = load i32, ptr %8, align 4
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds [9 x double], ptr %7, i64 0, i64 %306
  %308 = load double, ptr %307, align 8
  %309 = fadd double %308, %304
  store double %309, ptr %307, align 8
  %310 = load double, ptr %10, align 8
  %311 = load double, ptr %11, align 8
  %312 = fmul double %310, %311
  %313 = load i32, ptr %8, align 4
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %314
  %316 = load i32, ptr %9, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %317
  %319 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %315, ptr noundef byval(%struct.Planet) align 8 %318)
  %320 = fdiv double %312, %319
  %321 = load i32, ptr %9, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [9 x double], ptr %5, i64 0, i64 %322
  %324 = load double, ptr %323, align 8
  %325 = fsub double %324, %320
  store double %325, ptr %323, align 8
  %326 = load double, ptr %10, align 8
  %327 = load double, ptr %12, align 8
  %328 = fmul double %326, %327
  %329 = load i32, ptr %8, align 4
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %330
  %332 = load i32, ptr %9, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %333
  %335 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %331, ptr noundef byval(%struct.Planet) align 8 %334)
  %336 = fdiv double %328, %335
  %337 = load i32, ptr %9, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [9 x double], ptr %6, i64 0, i64 %338
  %340 = load double, ptr %339, align 8
  %341 = fsub double %340, %336
  store double %341, ptr %339, align 8
  %342 = load double, ptr %10, align 8
  %343 = load double, ptr %13, align 8
  %344 = fmul double %342, %343
  %345 = load i32, ptr %8, align 4
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %346
  %348 = load i32, ptr %9, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %349
  %351 = call double @distance(ptr noundef byval(%struct.Planet) align 8 %347, ptr noundef byval(%struct.Planet) align 8 %350)
  %352 = fdiv double %344, %351
  %353 = load i32, ptr %9, align 4
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [9 x double], ptr %7, i64 0, i64 %354
  %356 = load double, ptr %355, align 8
  %357 = fsub double %356, %352
  store double %357, ptr %355, align 8
  br label %358

358:                                              ; preds = %221
  %359 = load i32, ptr %9, align 4
  %360 = add nsw i32 %359, 1
  store i32 %360, ptr %9, align 4
  br label %218, !llvm.loop !8

361:                                              ; preds = %218
  br label %362

362:                                              ; preds = %361
  %363 = load i32, ptr %8, align 4
  %364 = add nsw i32 %363, 1
  store i32 %364, ptr %8, align 4
  br label %212, !llvm.loop !9

365:                                              ; preds = %212
  store i32 0, ptr %14, align 4
  br label %366

366:                                              ; preds = %451, %365
  %367 = load i32, ptr %14, align 4
  %368 = icmp slt i32 %367, 9
  br i1 %368, label %369, label %454

369:                                              ; preds = %366
  %370 = load i32, ptr %14, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %371
  %373 = getelementptr inbounds %struct.Planet, ptr %372, i32 0, i32 6
  %374 = load double, ptr %373, align 8
  %375 = load i32, ptr %14, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %376
  %378 = getelementptr inbounds %struct.Planet, ptr %377, i32 0, i32 3
  %379 = load double, ptr %378, align 8
  %380 = call double @llvm.fmuladd.f64(double %374, double 8.640000e+04, double %379)
  store double %380, ptr %378, align 8
  %381 = load i32, ptr %14, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %382
  %384 = getelementptr inbounds %struct.Planet, ptr %383, i32 0, i32 7
  %385 = load double, ptr %384, align 8
  %386 = load i32, ptr %14, align 4
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %387
  %389 = getelementptr inbounds %struct.Planet, ptr %388, i32 0, i32 4
  %390 = load double, ptr %389, align 8
  %391 = call double @llvm.fmuladd.f64(double %385, double 8.640000e+04, double %390)
  store double %391, ptr %389, align 8
  %392 = load i32, ptr %14, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %393
  %395 = getelementptr inbounds %struct.Planet, ptr %394, i32 0, i32 8
  %396 = load double, ptr %395, align 8
  %397 = load i32, ptr %14, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %398
  %400 = getelementptr inbounds %struct.Planet, ptr %399, i32 0, i32 5
  %401 = load double, ptr %400, align 8
  %402 = call double @llvm.fmuladd.f64(double %396, double 8.640000e+04, double %401)
  store double %402, ptr %400, align 8
  %403 = load i32, ptr %14, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [9 x double], ptr %5, i64 0, i64 %404
  %406 = load double, ptr %405, align 8
  %407 = load i32, ptr %14, align 4
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %408
  %410 = getelementptr inbounds %struct.Planet, ptr %409, i32 0, i32 1
  %411 = load double, ptr %410, align 8
  %412 = fdiv double %406, %411
  %413 = load i32, ptr %14, align 4
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %414
  %416 = getelementptr inbounds %struct.Planet, ptr %415, i32 0, i32 6
  %417 = load double, ptr %416, align 8
  %418 = call double @llvm.fmuladd.f64(double %412, double 8.640000e+04, double %417)
  store double %418, ptr %416, align 8
  %419 = load i32, ptr %14, align 4
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [9 x double], ptr %6, i64 0, i64 %420
  %422 = load double, ptr %421, align 8
  %423 = load i32, ptr %14, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %424
  %426 = getelementptr inbounds %struct.Planet, ptr %425, i32 0, i32 1
  %427 = load double, ptr %426, align 8
  %428 = fdiv double %422, %427
  %429 = load i32, ptr %14, align 4
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %430
  %432 = getelementptr inbounds %struct.Planet, ptr %431, i32 0, i32 7
  %433 = load double, ptr %432, align 8
  %434 = call double @llvm.fmuladd.f64(double %428, double 8.640000e+04, double %433)
  store double %434, ptr %432, align 8
  %435 = load i32, ptr %14, align 4
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds [9 x double], ptr %7, i64 0, i64 %436
  %438 = load double, ptr %437, align 8
  %439 = load i32, ptr %14, align 4
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %440
  %442 = getelementptr inbounds %struct.Planet, ptr %441, i32 0, i32 1
  %443 = load double, ptr %442, align 8
  %444 = fdiv double %438, %443
  %445 = load i32, ptr %14, align 4
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds [9 x %struct.Planet], ptr %3, i64 0, i64 %446
  %448 = getelementptr inbounds %struct.Planet, ptr %447, i32 0, i32 8
  %449 = load double, ptr %448, align 8
  %450 = call double @llvm.fmuladd.f64(double %444, double 8.640000e+04, double %449)
  store double %450, ptr %448, align 8
  br label %451

451:                                              ; preds = %369
  %452 = load i32, ptr %14, align 4
  %453 = add nsw i32 %452, 1
  store i32 %453, ptr %14, align 4
  br label %366, !llvm.loop !10

454:                                              ; preds = %366
  %455 = load double, ptr %2, align 8
  %456 = fadd double %455, 8.640000e+04
  store double %456, ptr %2, align 8
  br label %179
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
