; ModuleID = 'LLVM_IR/gpt4o_mini-21863.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i64, align 8
  %2 = sitofp i32 7 to float
  %3 = fadd float %2, 0x40091EB860000000
  %4 = fpext float %3 to double
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %4)
  %6 = mul nsw i32 6, 12
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %6)
  %8 = fpext float %3 to double
  %9 = fdiv double %8, 1.000000e-03
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %9)
  %11 = call i64 @time(ptr noundef %1) #4
  %12 = call ptr @localtime(ptr noundef %1) #4
  %13 = call ptr @asctime(ptr noundef %12) #4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %13)
  br label %15

15:                                               ; preds = %49, %0
  %.0 = phi i32 [ 1, %0 ], [ %50, %49 ]
  %16 = icmp sle i32 %.0, 5
  br i1 %16, label %17, label %51

17:                                               ; preds = %15
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %.0)
  %19 = mul nsw i32 %.0, %.0
  %20 = sitofp i32 %19 to float
  %21 = sitofp i32 7 to float
  %22 = add nsw i32 %.0, 1
  %23 = sitofp i32 %22 to float
  %24 = fdiv float %21, %23
  %25 = fadd float %20, %24
  %26 = fpext float %25 to double
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %26)
  %28 = srem i32 %.0, 2
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %33

30:                                               ; preds = %17
  %31 = mul nsw i32 %6, %.0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %31)
  br label %39

33:                                               ; preds = %17
  %34 = sitofp i32 %6 to double
  %35 = fdiv double %34, 1.000000e-03
  %36 = fptrunc double %35 to float
  %37 = fpext float %36 to double
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %37)
  br label %39

39:                                               ; preds = %33, %30
  %40 = sitofp i32 %6 to float
  %41 = call float @llvm.fmuladd.f32(float %25, float 0x40091EB860000000, float %40)
  %42 = getelementptr inbounds %struct.tm, ptr %12, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = add nsw i32 %43, 1
  %45 = sitofp i32 %44 to float
  %46 = fdiv float %41, %45
  %47 = fpext float %46 to double
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, double noundef %47)
  br label %49

49:                                               ; preds = %39
  %50 = add nsw i32 %.0, 1
  br label %15, !llvm.loop !6

51:                                               ; preds = %15
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %53 = add nsw i32 7, %6
  %54 = sitofp i32 %53 to double
  %55 = fmul double 1.000000e-03, 1.000000e+03
  %56 = fmul double %54, %55
  %57 = fptrunc double %56 to float
  %58 = fpext float %57 to double
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %58)
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
