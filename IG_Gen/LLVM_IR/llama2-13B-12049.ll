; ModuleID = 'DATASETv2/llama2-13B-12049.c'
source_filename = "DATASETv2/llama2-13B-12049.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"Enter the radius of the circle: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.2 = private unnamed_addr constant [52 x i8] c"Error: Negative radius not allowed. Trying again...\00", align 1
@.str.3 = private unnamed_addr constant [43 x i8] c"Error: Calculation failed. Trying again...\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"The area of the circle is: %f\0A\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"The perimeter of the circle is: %f\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"Do you want to continue? (y/n): \00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"Exiting program...\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"Error: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [39 x i8] c"Too many attempts. Exiting program...\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local float @circleArea(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %2, align 4
  %4 = load float, ptr %2, align 4
  %5 = fpext float %4 to double
  %6 = fmul double 3.141590e+00, %5
  %7 = load float, ptr %2, align 4
  %8 = fpext float %7 to double
  %9 = fmul double %6, %8
  %10 = fptrunc double %9 to float
  store float %10, ptr %3, align 4
  %11 = load float, ptr %3, align 4
  ret float %11
}

; Function Attrs: noinline nounwind  uwtable
define dso_local float @circlePerimeter(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float %0, ptr %2, align 4
  %4 = load float, ptr %2, align 4
  %5 = fpext float %4 to double
  %6 = fmul double 6.283180e+00, %5
  %7 = fptrunc double %6 to float
  store float %7, ptr %3, align 4
  %8 = load float, ptr %3, align 4
  ret float %8
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca [100 x i8], align 16
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  store float 0.000000e+00, ptr %3, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %10 = load float, ptr %2, align 4
  %11 = fcmp olt float %10, 0.000000e+00
  br i1 %11, label %12, label %17

12:                                               ; preds = %0
  %13 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %14 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %13, ptr noundef @.str.2) #3
  %15 = load float, ptr %3, align 4
  %16 = fadd float %15, 1.000000e+00
  store float %16, ptr %3, align 4
  br label %44

17:                                               ; preds = %0
  %18 = load float, ptr %2, align 4
  %19 = call float @circleArea(float noundef %18)
  store float %19, ptr %5, align 4
  %20 = load float, ptr %2, align 4
  %21 = call float @circlePerimeter(float noundef %20)
  store float %21, ptr %6, align 4
  %22 = load float, ptr %5, align 4
  %23 = fcmp olt float %22, 0.000000e+00
  br i1 %23, label %24, label %29

24:                                               ; preds = %17
  %25 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %26 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %25, ptr noundef @.str.3) #3
  %27 = load float, ptr %3, align 4
  %28 = fadd float %27, 1.000000e+00
  store float %28, ptr %3, align 4
  br label %44

29:                                               ; preds = %17
  %30 = load float, ptr %5, align 4
  %31 = fpext float %30 to double
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %31)
  %33 = load float, ptr %6, align 4
  %34 = fpext float %33 to double
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %34)
  store i8 110, ptr %7, align 1
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %37 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %7)
  %38 = load i8, ptr %7, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 121
  br i1 %40, label %41, label %42

41:                                               ; preds = %29
  br label %54

42:                                               ; preds = %29
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i32 0, ptr %1, align 4
  br label %57

44:                                               ; preds = %24, %12
  %45 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %45)
  %47 = load float, ptr %3, align 4
  %48 = fadd float %47, 1.000000e+00
  store float %48, ptr %3, align 4
  %49 = load float, ptr %3, align 4
  %50 = fcmp oge float %49, 3.000000e+00
  br i1 %50, label %51, label %53

51:                                               ; preds = %44
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i32 1, ptr %1, align 4
  br label %57

53:                                               ; preds = %44
  br label %54

54:                                               ; preds = %53, %41
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %56 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  br label %57

57:                                               ; preds = %54, %51, %42
  %58 = load i32, ptr %1, align 4
  ret i32 %58
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
