; ModuleID = 'DATASETv2/gpt4o_mini-21863.c'
source_filename = "DATASETv2/gpt4o_mini-21863.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, ptr }

@.str = private unnamed_addr constant [69 x i8] c"The fruit of dragon combined with the cloud's infinity equals: %.2f\0A\00", align 1
@.str.1 = private unnamed_addr constant [54 x i8] c"The interoperability of colors and fishes yields: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [66 x i8] c"Dividing the surreal sum by the existential error gives us: %.2f\0A\00", align 1
@.str.3 = private unnamed_addr constant [58 x i8] c"Current local time altered by the whims of surrealism: %s\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"\0AReality perception %d of 5:\0A\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Through the lens of perception, we find: %.2f\0A\00", align 1
@.str.6 = private unnamed_addr constant [64 x i8] c"On even perceptions, the mirror multiplies by the sky fish: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [86 x i8] c"Odd perceptions grant a division of fantastical fruits with existential errors: %.2f\0A\00", align 1
@.str.8 = private unnamed_addr constant [49 x i8] c"Dreamy result from the calculator of life: %.2f\0A\00", align 1
@.str.9 = private unnamed_addr constant [43 x i8] c"\0AFinal reflection on surreal arithmetic: \0A\00", align 1
@.str.10 = private unnamed_addr constant [50 x i8] c"In conclusion, the final reflection yields: %.2f\0A\00", align 1
@.str.11 = private unnamed_addr constant [57 x i8] c"\0AIn a world where numbers dance and dreams take flight,\0A\00", align 1
@.str.12 = private unnamed_addr constant [48 x i8] c"We find arithmetic wrapped in surreal delight.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca float, align 4
  %14 = alloca double, align 8
  %15 = alloca float, align 4
  store i32 0, ptr %1, align 4
  store i32 7, ptr %2, align 4
  store float 0x40091EB860000000, ptr %3, align 4
  store i32 6, ptr %4, align 4
  store i32 12, ptr %5, align 4
  store double 1.000000e-03, ptr %6, align 8
  %16 = load i32, ptr %2, align 4
  %17 = sitofp i32 %16 to float
  %18 = load float, ptr %3, align 4
  %19 = fadd float %17, %18
  store float %19, ptr %7, align 4
  %20 = load float, ptr %7, align 4
  %21 = fpext float %20 to double
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %21)
  %23 = load i32, ptr %4, align 4
  %24 = load i32, ptr %5, align 4
  %25 = mul nsw i32 %23, %24
  store i32 %25, ptr %8, align 4
  %26 = load i32, ptr %8, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %26)
  %28 = load float, ptr %7, align 4
  %29 = fpext float %28 to double
  %30 = load double, ptr %6, align 8
  %31 = fdiv double %29, %30
  store double %31, ptr %9, align 8
  %32 = load double, ptr %9, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %32)
  %34 = call i64 @time(ptr noundef %10) #4
  %35 = call ptr @localtime(ptr noundef %10) #4
  store ptr %35, ptr %11, align 8
  %36 = load ptr, ptr %11, align 8
  %37 = call ptr @asctime(ptr noundef %36) #4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %37)
  store i32 1, ptr %12, align 4
  br label %39

39:                                               ; preds = %90, %0
  %40 = load i32, ptr %12, align 4
  %41 = icmp sle i32 %40, 5
  br i1 %41, label %42, label %93

42:                                               ; preds = %39
  %43 = load i32, ptr %12, align 4
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %43)
  %45 = load i32, ptr %12, align 4
  %46 = load i32, ptr %12, align 4
  %47 = mul nsw i32 %45, %46
  %48 = sitofp i32 %47 to float
  %49 = load i32, ptr %2, align 4
  %50 = sitofp i32 %49 to float
  %51 = load i32, ptr %12, align 4
  %52 = add nsw i32 %51, 1
  %53 = sitofp i32 %52 to float
  %54 = fdiv float %50, %53
  %55 = fadd float %48, %54
  store float %55, ptr %13, align 4
  %56 = load float, ptr %13, align 4
  %57 = fpext float %56 to double
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %57)
  %59 = load i32, ptr %12, align 4
  %60 = srem i32 %59, 2
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %67

62:                                               ; preds = %42
  %63 = load i32, ptr %8, align 4
  %64 = load i32, ptr %12, align 4
  %65 = mul nsw i32 %63, %64
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %65)
  br label %75

67:                                               ; preds = %42
  %68 = load i32, ptr %8, align 4
  %69 = sitofp i32 %68 to double
  %70 = load double, ptr %6, align 8
  %71 = fdiv double %69, %70
  %72 = fptrunc double %71 to float
  %73 = fpext float %72 to double
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %73)
  br label %75

75:                                               ; preds = %67, %62
  %76 = load float, ptr %13, align 4
  %77 = load float, ptr %3, align 4
  %78 = load i32, ptr %8, align 4
  %79 = sitofp i32 %78 to float
  %80 = call float @llvm.fmuladd.f32(float %76, float %77, float %79)
  %81 = load ptr, ptr %11, align 8
  %82 = getelementptr inbounds %struct.tm, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %82, align 8
  %84 = add nsw i32 %83, 1
  %85 = sitofp i32 %84 to float
  %86 = fdiv float %80, %85
  %87 = fpext float %86 to double
  store double %87, ptr %14, align 8
  %88 = load double, ptr %14, align 8
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, double noundef %88)
  br label %90

90:                                               ; preds = %75
  %91 = load i32, ptr %12, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %12, align 4
  br label %39, !llvm.loop !6

93:                                               ; preds = %39
  %94 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %95 = load i32, ptr %2, align 4
  %96 = load i32, ptr %8, align 4
  %97 = add nsw i32 %95, %96
  %98 = sitofp i32 %97 to double
  %99 = load double, ptr %6, align 8
  %100 = fmul double %99, 1.000000e+03
  %101 = fmul double %98, %100
  %102 = fptrunc double %101 to float
  store float %102, ptr %15, align 4
  %103 = load float, ptr %15, align 4
  %104 = fpext float %103 to double
  %105 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %104)
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @asctime(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
