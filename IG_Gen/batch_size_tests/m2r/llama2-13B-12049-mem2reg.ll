; ModuleID = 'LLVM_IR/llama2-13B-12049.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local float @circleArea(float noundef %0) #0 {
  %2 = fpext float %0 to double
  %3 = fmul double 3.141590e+00, %2
  %4 = fpext float %0 to double
  %5 = fmul double %3, %4
  %6 = fptrunc double %5 to float
  ret float %6
}

; Function Attrs: noinline nounwind uwtable
define dso_local float @circlePerimeter(float noundef %0) #0 {
  %2 = fpext float %0 to double
  %3 = fmul double 6.283180e+00, %2
  %4 = fptrunc double %3 to float
  ret float %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca float, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca i8, align 1
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %6 = load float, ptr %1, align 4
  %7 = fcmp olt float %6, 0.000000e+00
  br i1 %7, label %8, label %12

8:                                                ; preds = %0
  %9 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %10 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %9, ptr noundef @.str.2) #3
  %11 = fadd float 0.000000e+00, 1.000000e+00
  br label %35

12:                                               ; preds = %0
  %13 = load float, ptr %1, align 4
  %14 = call float @circleArea(float noundef %13)
  %15 = load float, ptr %1, align 4
  %16 = call float @circlePerimeter(float noundef %15)
  %17 = fcmp olt float %14, 0.000000e+00
  br i1 %17, label %18, label %22

18:                                               ; preds = %12
  %19 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %20 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %19, ptr noundef @.str.3) #3
  %21 = fadd float 0.000000e+00, 1.000000e+00
  br label %35

22:                                               ; preds = %12
  %23 = fpext float %14 to double
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %23)
  %25 = fpext float %16 to double
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %25)
  store i8 110, ptr %3, align 1
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %28 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %3)
  %29 = load i8, ptr %3, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 121
  br i1 %31, label %32, label %33

32:                                               ; preds = %22
  br label %43

33:                                               ; preds = %22
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %46

35:                                               ; preds = %18, %8
  %.01 = phi float [ %11, %8 ], [ %21, %18 ]
  %36 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %36)
  %38 = fadd float %.01, 1.000000e+00
  %39 = fcmp oge float %38, 3.000000e+00
  br i1 %39, label %40, label %42

40:                                               ; preds = %35
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %46

42:                                               ; preds = %35
  br label %43

43:                                               ; preds = %42, %32
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %45 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  br label %46

46:                                               ; preds = %43, %40, %33
  %.0 = phi i32 [ 1, %40 ], [ 0, %43 ], [ 0, %33 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
