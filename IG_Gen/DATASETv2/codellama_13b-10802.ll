; ModuleID = 'DATASETv2/codellama_13b-10802.c'
source_filename = "DATASETv2/codellama_13b-10802.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Map = type { [1000 x %struct.Road], [100 x %struct.Coordinates], [100 x %struct.Coordinates] }
%struct.Road = type { %struct.Coordinates, %struct.Coordinates }
%struct.Coordinates = type { float, float, float }
%struct.Car = type { %struct.Coordinates, float, float, float, float, i32 }

@map = dso_local global %struct.Map zeroinitializer, align 4
@cars = dso_local global [100 x %struct.Car] zeroinitializer, align 16

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_map(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %70, %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 1000
  br i1 %8, label %9, label %73

9:                                                ; preds = %6
  %10 = call i32 @rand() #3
  %11 = sitofp i32 %10 to float
  %12 = fdiv float %11, 0x41E0000000000000
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Map, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1000 x %struct.Road], ptr %14, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Road, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.Coordinates, ptr %18, i32 0, i32 0
  store float %12, ptr %19, align 4
  %20 = call i32 @rand() #3
  %21 = sitofp i32 %20 to float
  %22 = fdiv float %21, 0x41E0000000000000
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.Map, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [1000 x %struct.Road], ptr %24, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.Road, ptr %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.Coordinates, ptr %28, i32 0, i32 1
  store float %22, ptr %29, align 4
  %30 = call i32 @rand() #3
  %31 = sitofp i32 %30 to float
  %32 = fdiv float %31, 0x41E0000000000000
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.Map, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %3, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1000 x %struct.Road], ptr %34, i64 0, i64 %36
  %38 = getelementptr inbounds %struct.Road, ptr %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.Coordinates, ptr %38, i32 0, i32 2
  store float %32, ptr %39, align 4
  %40 = call i32 @rand() #3
  %41 = sitofp i32 %40 to float
  %42 = fdiv float %41, 0x41E0000000000000
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.Map, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %3, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [1000 x %struct.Road], ptr %44, i64 0, i64 %46
  %48 = getelementptr inbounds %struct.Road, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds %struct.Coordinates, ptr %48, i32 0, i32 0
  store float %42, ptr %49, align 4
  %50 = call i32 @rand() #3
  %51 = sitofp i32 %50 to float
  %52 = fdiv float %51, 0x41E0000000000000
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.Map, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %3, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1000 x %struct.Road], ptr %54, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.Road, ptr %57, i32 0, i32 1
  %59 = getelementptr inbounds %struct.Coordinates, ptr %58, i32 0, i32 1
  store float %52, ptr %59, align 4
  %60 = call i32 @rand() #3
  %61 = sitofp i32 %60 to float
  %62 = fdiv float %61, 0x41E0000000000000
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr inbounds %struct.Map, ptr %63, i32 0, i32 0
  %65 = load i32, ptr %3, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1000 x %struct.Road], ptr %64, i64 0, i64 %66
  %68 = getelementptr inbounds %struct.Road, ptr %67, i32 0, i32 1
  %69 = getelementptr inbounds %struct.Coordinates, ptr %68, i32 0, i32 2
  store float %62, ptr %69, align 4
  br label %70

70:                                               ; preds = %9
  %71 = load i32, ptr %3, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %3, align 4
  br label %6, !llvm.loop !6

73:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %74

74:                                               ; preds = %105, %73
  %75 = load i32, ptr %4, align 4
  %76 = icmp slt i32 %75, 100
  br i1 %76, label %77, label %108

77:                                               ; preds = %74
  %78 = call i32 @rand() #3
  %79 = sitofp i32 %78 to float
  %80 = fdiv float %79, 0x41E0000000000000
  %81 = load ptr, ptr %2, align 8
  %82 = getelementptr inbounds %struct.Map, ptr %81, i32 0, i32 1
  %83 = load i32, ptr %4, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [100 x %struct.Coordinates], ptr %82, i64 0, i64 %84
  %86 = getelementptr inbounds %struct.Coordinates, ptr %85, i32 0, i32 0
  store float %80, ptr %86, align 4
  %87 = call i32 @rand() #3
  %88 = sitofp i32 %87 to float
  %89 = fdiv float %88, 0x41E0000000000000
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.Map, ptr %90, i32 0, i32 1
  %92 = load i32, ptr %4, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [100 x %struct.Coordinates], ptr %91, i64 0, i64 %93
  %95 = getelementptr inbounds %struct.Coordinates, ptr %94, i32 0, i32 1
  store float %89, ptr %95, align 4
  %96 = call i32 @rand() #3
  %97 = sitofp i32 %96 to float
  %98 = fdiv float %97, 0x41E0000000000000
  %99 = load ptr, ptr %2, align 8
  %100 = getelementptr inbounds %struct.Map, ptr %99, i32 0, i32 1
  %101 = load i32, ptr %4, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [100 x %struct.Coordinates], ptr %100, i64 0, i64 %102
  %104 = getelementptr inbounds %struct.Coordinates, ptr %103, i32 0, i32 2
  store float %98, ptr %104, align 4
  br label %105

105:                                              ; preds = %77
  %106 = load i32, ptr %4, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %4, align 4
  br label %74, !llvm.loop !8

108:                                              ; preds = %74
  store i32 0, ptr %5, align 4
  br label %109

109:                                              ; preds = %140, %108
  %110 = load i32, ptr %5, align 4
  %111 = icmp slt i32 %110, 100
  br i1 %111, label %112, label %143

112:                                              ; preds = %109
  %113 = call i32 @rand() #3
  %114 = sitofp i32 %113 to float
  %115 = fdiv float %114, 0x41E0000000000000
  %116 = load ptr, ptr %2, align 8
  %117 = getelementptr inbounds %struct.Map, ptr %116, i32 0, i32 2
  %118 = load i32, ptr %5, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [100 x %struct.Coordinates], ptr %117, i64 0, i64 %119
  %121 = getelementptr inbounds %struct.Coordinates, ptr %120, i32 0, i32 0
  store float %115, ptr %121, align 4
  %122 = call i32 @rand() #3
  %123 = sitofp i32 %122 to float
  %124 = fdiv float %123, 0x41E0000000000000
  %125 = load ptr, ptr %2, align 8
  %126 = getelementptr inbounds %struct.Map, ptr %125, i32 0, i32 2
  %127 = load i32, ptr %5, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [100 x %struct.Coordinates], ptr %126, i64 0, i64 %128
  %130 = getelementptr inbounds %struct.Coordinates, ptr %129, i32 0, i32 1
  store float %124, ptr %130, align 4
  %131 = call i32 @rand() #3
  %132 = sitofp i32 %131 to float
  %133 = fdiv float %132, 0x41E0000000000000
  %134 = load ptr, ptr %2, align 8
  %135 = getelementptr inbounds %struct.Map, ptr %134, i32 0, i32 2
  %136 = load i32, ptr %5, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds [100 x %struct.Coordinates], ptr %135, i64 0, i64 %137
  %139 = getelementptr inbounds %struct.Coordinates, ptr %138, i32 0, i32 2
  store float %133, ptr %139, align 4
  br label %140

140:                                              ; preds = %112
  %141 = load i32, ptr %5, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, ptr %5, align 4
  br label %109, !llvm.loop !9

143:                                              ; preds = %109
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_cars(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %74, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %77

10:                                               ; preds = %6
  %11 = call i32 @rand() #3
  %12 = sitofp i32 %11 to float
  %13 = fdiv float %12, 0x41E0000000000000
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.Car, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct.Car, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.Coordinates, ptr %18, i32 0, i32 0
  store float %13, ptr %19, align 4
  %20 = call i32 @rand() #3
  %21 = sitofp i32 %20 to float
  %22 = fdiv float %21, 0x41E0000000000000
  %23 = load ptr, ptr %3, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.Car, ptr %23, i64 %25
  %27 = getelementptr inbounds %struct.Car, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.Coordinates, ptr %27, i32 0, i32 1
  store float %22, ptr %28, align 4
  %29 = call i32 @rand() #3
  %30 = sitofp i32 %29 to float
  %31 = fdiv float %30, 0x41E0000000000000
  %32 = load ptr, ptr %3, align 8
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds %struct.Car, ptr %32, i64 %34
  %36 = getelementptr inbounds %struct.Car, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.Coordinates, ptr %36, i32 0, i32 2
  store float %31, ptr %37, align 4
  %38 = call i32 @rand() #3
  %39 = sitofp i32 %38 to float
  %40 = fdiv float %39, 0x41E0000000000000
  %41 = load ptr, ptr %3, align 8
  %42 = load i32, ptr %5, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.Car, ptr %41, i64 %43
  %45 = getelementptr inbounds %struct.Car, ptr %44, i32 0, i32 1
  store float %40, ptr %45, align 4
  %46 = call i32 @rand() #3
  %47 = sitofp i32 %46 to float
  %48 = fdiv float %47, 0x41E0000000000000
  %49 = load ptr, ptr %3, align 8
  %50 = load i32, ptr %5, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.Car, ptr %49, i64 %51
  %53 = getelementptr inbounds %struct.Car, ptr %52, i32 0, i32 2
  store float %48, ptr %53, align 4
  %54 = call i32 @rand() #3
  %55 = sitofp i32 %54 to float
  %56 = fdiv float %55, 0x41E0000000000000
  %57 = load ptr, ptr %3, align 8
  %58 = load i32, ptr %5, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.Car, ptr %57, i64 %59
  %61 = getelementptr inbounds %struct.Car, ptr %60, i32 0, i32 3
  store float %56, ptr %61, align 4
  %62 = load ptr, ptr %3, align 8
  %63 = load i32, ptr %5, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %struct.Car, ptr %62, i64 %64
  %66 = getelementptr inbounds %struct.Car, ptr %65, i32 0, i32 4
  store float 0.000000e+00, ptr %66, align 4
  %67 = call i32 @rand() #3
  %68 = srem i32 %67, 1000
  %69 = load ptr, ptr %3, align 8
  %70 = load i32, ptr %5, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds %struct.Car, ptr %69, i64 %71
  %73 = getelementptr inbounds %struct.Car, ptr %72, i32 0, i32 5
  store i32 %68, ptr %73, align 4
  br label %74

74:                                               ; preds = %10
  %75 = load i32, ptr %5, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %5, align 4
  br label %6, !llvm.loop !10

77:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @simulate_time(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %12

12:                                               ; preds = %136, %4
  %13 = load i32, ptr %9, align 4
  %14 = load i32, ptr %8, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %139

16:                                               ; preds = %12
  store i32 0, ptr %10, align 4
  br label %17

17:                                               ; preds = %132, %16
  %18 = load i32, ptr %10, align 4
  %19 = load i32, ptr %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %135

21:                                               ; preds = %17
  %22 = load ptr, ptr %6, align 8
  %23 = load i32, ptr %10, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.Car, ptr %22, i64 %24
  %26 = getelementptr inbounds %struct.Car, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.Coordinates, ptr %26, i32 0, i32 0
  %28 = load float, ptr %27, align 4
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.Map, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %6, align 8
  %32 = load i32, ptr %10, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.Car, ptr %31, i64 %33
  %35 = getelementptr inbounds %struct.Car, ptr %34, i32 0, i32 5
  %36 = load i32, ptr %35, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1000 x %struct.Road], ptr %30, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.Road, ptr %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.Coordinates, ptr %39, i32 0, i32 0
  %41 = load float, ptr %40, align 4
  %42 = fsub float %28, %41
  %43 = fpext float %42 to double
  %44 = call double @pow(double noundef %43, double noundef 2.000000e+00) #3
  %45 = load ptr, ptr %6, align 8
  %46 = load i32, ptr %10, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.Car, ptr %45, i64 %47
  %49 = getelementptr inbounds %struct.Car, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.Coordinates, ptr %49, i32 0, i32 1
  %51 = load float, ptr %50, align 4
  %52 = load ptr, ptr %5, align 8
  %53 = getelementptr inbounds %struct.Map, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %6, align 8
  %55 = load i32, ptr %10, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds %struct.Car, ptr %54, i64 %56
  %58 = getelementptr inbounds %struct.Car, ptr %57, i32 0, i32 5
  %59 = load i32, ptr %58, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [1000 x %struct.Road], ptr %53, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.Road, ptr %61, i32 0, i32 0
  %63 = getelementptr inbounds %struct.Coordinates, ptr %62, i32 0, i32 1
  %64 = load float, ptr %63, align 4
  %65 = fsub float %51, %64
  %66 = fpext float %65 to double
  %67 = call double @pow(double noundef %66, double noundef 2.000000e+00) #3
  %68 = fadd double %44, %67
  %69 = load ptr, ptr %6, align 8
  %70 = load i32, ptr %10, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds %struct.Car, ptr %69, i64 %71
  %73 = getelementptr inbounds %struct.Car, ptr %72, i32 0, i32 0
  %74 = getelementptr inbounds %struct.Coordinates, ptr %73, i32 0, i32 2
  %75 = load float, ptr %74, align 4
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.Map, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %6, align 8
  %79 = load i32, ptr %10, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds %struct.Car, ptr %78, i64 %80
  %82 = getelementptr inbounds %struct.Car, ptr %81, i32 0, i32 5
  %83 = load i32, ptr %82, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [1000 x %struct.Road], ptr %77, i64 0, i64 %84
  %86 = getelementptr inbounds %struct.Road, ptr %85, i32 0, i32 0
  %87 = getelementptr inbounds %struct.Coordinates, ptr %86, i32 0, i32 2
  %88 = load float, ptr %87, align 4
  %89 = fsub float %75, %88
  %90 = fpext float %89 to double
  %91 = call double @pow(double noundef %90, double noundef 2.000000e+00) #3
  %92 = fadd double %68, %91
  %93 = call double @sqrt(double noundef %92) #3
  %94 = fptrunc double %93 to float
  store float %94, ptr %11, align 4
  %95 = load float, ptr %11, align 4
  %96 = load ptr, ptr %6, align 8
  %97 = load i32, ptr %10, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.Car, ptr %96, i64 %98
  %100 = getelementptr inbounds %struct.Car, ptr %99, i32 0, i32 4
  %101 = load float, ptr %100, align 4
  %102 = fadd float %101, %95
  store float %102, ptr %100, align 4
  %103 = load ptr, ptr %6, align 8
  %104 = load i32, ptr %10, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.Car, ptr %103, i64 %105
  %107 = getelementptr inbounds %struct.Car, ptr %106, i32 0, i32 0
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.Map, ptr %108, i32 0, i32 0
  %110 = load ptr, ptr %6, align 8
  %111 = load i32, ptr %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds %struct.Car, ptr %110, i64 %112
  %114 = getelementptr inbounds %struct.Car, ptr %113, i32 0, i32 5
  %115 = load i32, ptr %114, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [1000 x %struct.Road], ptr %109, i64 0, i64 %116
  %118 = getelementptr inbounds %struct.Road, ptr %117, i32 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %107, ptr align 4 %118, i64 12, i1 false)
  %119 = load ptr, ptr %6, align 8
  %120 = load i32, ptr %10, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds %struct.Car, ptr %119, i64 %121
  %123 = getelementptr inbounds %struct.Car, ptr %122, i32 0, i32 5
  %124 = load i32, ptr %123, align 4
  %125 = add nsw i32 %124, 1
  %126 = srem i32 %125, 1000
  %127 = load ptr, ptr %6, align 8
  %128 = load i32, ptr %10, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds %struct.Car, ptr %127, i64 %129
  %131 = getelementptr inbounds %struct.Car, ptr %130, i32 0, i32 5
  store i32 %126, ptr %131, align 4
  br label %132

132:                                              ; preds = %21
  %133 = load i32, ptr %10, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %10, align 4
  br label %17, !llvm.loop !11

135:                                              ; preds = %17
  br label %136

136:                                              ; preds = %135
  %137 = load i32, ptr %9, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, ptr %9, align 4
  br label %12, !llvm.loop !12

139:                                              ; preds = %12
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  call void @initialize_map(ptr noundef @map)
  call void @initialize_cars(ptr noundef @cars, i32 noundef 100)
  call void @simulate_time(ptr noundef @map, ptr noundef @cars, i32 noundef 100, i32 noundef 1000)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
