; ModuleID = 'DATASETv2/gemma7b-14627.c'
source_filename = "DATASETv2/gemma7b-14627.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Item = type { [50 x i8], float, i32 }

@items = dso_local global [10 x %struct.Item] zeroinitializer, align 16
@.str = private unnamed_addr constant [28 x i8] c"Error: Item limit reached.\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"%s: %.2f, %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"Bill:\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Total: %.2f\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Payment: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Insufficient funds.\0A\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"Change: %.2f\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Coffee\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"Tea\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"Juice\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_item(ptr noundef %0, float noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca float, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store float %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %39, %3
  %9 = load i32, ptr %7, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %42

11:                                               ; preds = %8
  %12 = load i32, ptr %7, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Item, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = load i8, ptr %16, align 4
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %38

20:                                               ; preds = %11
  %21 = load i32, ptr %7, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.Item, ptr %23, i32 0, i32 0
  %25 = getelementptr inbounds [50 x i8], ptr %24, i64 0, i64 0
  %26 = load ptr, ptr %4, align 8
  %27 = call ptr @strcpy(ptr noundef %25, ptr noundef %26) #4
  %28 = load float, ptr %5, align 4
  %29 = load i32, ptr %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Item, ptr %31, i32 0, i32 1
  store float %28, ptr %32, align 4
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %7, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.Item, ptr %36, i32 0, i32 2
  store i32 %33, ptr %37, align 4
  br label %44

38:                                               ; preds = %11
  br label %39

39:                                               ; preds = %38
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %7, align 4
  br label %8, !llvm.loop !6

42:                                               ; preds = %8
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %44

44:                                               ; preds = %42, %20
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_items() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %33, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %36

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Item, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = load i8, ptr %10, align 4
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %32

14:                                               ; preds = %5
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Item, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Item, ptr %22, i32 0, i32 1
  %24 = load float, ptr %23, align 4
  %25 = fpext float %24 to double
  %26 = load i32, ptr %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.Item, ptr %28, i32 0, i32 2
  %30 = load i32, ptr %29, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %19, double noundef %25, i32 noundef %30)
  br label %32

32:                                               ; preds = %14, %5
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %1, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %1, align 4
  br label %2, !llvm.loop !8

36:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @calculate_total(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  store i32 0, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %35, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 10
  br i1 %7, label %8, label %38

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Item, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = load i8, ptr %13, align 4
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %34

17:                                               ; preds = %8
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Item, ptr %20, i32 0, i32 1
  %22 = load float, ptr %21, align 4
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Item, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 4
  %28 = sitofp i32 %27 to float
  %29 = load ptr, ptr %2, align 8
  %30 = load i32, ptr %29, align 4
  %31 = sitofp i32 %30 to float
  %32 = call float @llvm.fmuladd.f32(float %22, float %28, float %31)
  %33 = fptosi float %32 to i32
  store i32 %33, ptr %29, align 4
  br label %34

34:                                               ; preds = %17, %8
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %3, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %3, align 4
  br label %5, !llvm.loop !9

38:                                               ; preds = %5
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_bill() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  store i32 0, ptr %1, align 4
  call void @calculate_total(ptr noundef %1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @display_items()
  %4 = load i32, ptr %1, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store float 0.000000e+00, ptr %2, align 4
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %2)
  %8 = load float, ptr %2, align 4
  %9 = load i32, ptr %1, align 4
  %10 = sitofp i32 %9 to float
  %11 = fcmp olt float %8, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %21

14:                                               ; preds = %0
  %15 = load float, ptr %2, align 4
  %16 = load i32, ptr %1, align 4
  %17 = sitofp i32 %16 to float
  %18 = fsub float %15, %17
  %19 = fpext float %18 to double
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %19)
  br label %21

21:                                               ; preds = %14, %12
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @add_item(ptr noundef @.str.8, float noundef 2.500000e+00, i32 noundef 5)
  call void @add_item(ptr noundef @.str.9, float noundef 3.000000e+00, i32 noundef 2)
  call void @add_item(ptr noundef @.str.10, float noundef 4.000000e+00, i32 noundef 3)
  call void @generate_bill()
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
