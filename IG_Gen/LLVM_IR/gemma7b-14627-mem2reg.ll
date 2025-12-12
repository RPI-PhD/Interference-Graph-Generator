; ModuleID = 'LLVM_IR/gemma7b-14627.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_item(ptr noundef %0, float noundef %1, i32 noundef %2) #0 {
  br label %4

4:                                                ; preds = %27, %3
  %.0 = phi i32 [ 0, %3 ], [ %28, %27 ]
  %5 = icmp slt i32 %.0, 10
  br i1 %5, label %6, label %29

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Item, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = load i8, ptr %10, align 4
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %26

14:                                               ; preds = %6
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Item, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = call ptr @strcpy(ptr noundef %18, ptr noundef %0) #4
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Item, ptr %21, i32 0, i32 1
  store float %1, ptr %22, align 4
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Item, ptr %24, i32 0, i32 2
  store i32 %2, ptr %25, align 4
  br label %31

26:                                               ; preds = %6
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

29:                                               ; preds = %4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %31

31:                                               ; preds = %29, %14
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_items() #0 {
  br label %1

1:                                                ; preds = %27, %0
  %.0 = phi i32 [ 0, %0 ], [ %28, %27 ]
  %2 = icmp slt i32 %.0, 10
  br i1 %2, label %3, label %29

3:                                                ; preds = %1
  %4 = sext i32 %.0 to i64
  %5 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %4
  %6 = getelementptr inbounds %struct.Item, ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %8 = load i8, ptr %7, align 4
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %26

11:                                               ; preds = %3
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Item, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [50 x i8], ptr %14, i64 0, i64 0
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Item, ptr %17, i32 0, i32 1
  %19 = load float, ptr %18, align 4
  %20 = fpext float %19 to double
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Item, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %15, double noundef %20, i32 noundef %24)
  br label %26

26:                                               ; preds = %11, %3
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !8

29:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @calculate_total(ptr noundef %0) #0 {
  store i32 0, ptr %0, align 4
  br label %2

2:                                                ; preds = %27, %1
  %.0 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %3 = icmp slt i32 %.0, 10
  br i1 %3, label %4, label %29

4:                                                ; preds = %2
  %5 = sext i32 %.0 to i64
  %6 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %5
  %7 = getelementptr inbounds %struct.Item, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds [50 x i8], ptr %7, i64 0, i64 0
  %9 = load i8, ptr %8, align 4
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %26

12:                                               ; preds = %4
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Item, ptr %14, i32 0, i32 1
  %16 = load float, ptr %15, align 4
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [10 x %struct.Item], ptr @items, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Item, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 4
  %21 = sitofp i32 %20 to float
  %22 = load i32, ptr %0, align 4
  %23 = sitofp i32 %22 to float
  %24 = call float @llvm.fmuladd.f32(float %16, float %21, float %23)
  %25 = fptosi float %24 to i32
  store i32 %25, ptr %0, align 4
  br label %26

26:                                               ; preds = %12, %4
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

29:                                               ; preds = %2
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @add_item(ptr noundef @.str.8, float noundef 2.500000e+00, i32 noundef 5)
  call void @add_item(ptr noundef @.str.9, float noundef 3.000000e+00, i32 noundef 2)
  call void @add_item(ptr noundef @.str.10, float noundef 4.000000e+00, i32 noundef 3)
  call void @generate_bill()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
