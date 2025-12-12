; ModuleID = 'DATASETv2/gemini_pro-22615.c'
source_filename = "DATASETv2/gemini_pro-22615.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.product = type { [50 x i8], i32, float }
%struct.inventory = type { [100 x %struct.product], i32 }

@.str = private unnamed_addr constant [12 x i8] c"%s %d %.2f\0A\00", align 1
@__const.main.p1 = private unnamed_addr constant %struct.product { [50 x i8] c"Apple\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 10, float 1.000000e+00 }, align 4
@__const.main.p2 = private unnamed_addr constant %struct.product { [50 x i8] c"Orange\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 5, float 1.500000e+00 }, align 4
@__const.main.p3 = private unnamed_addr constant %struct.product { [50 x i8] c"Banana\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 15, float 2.000000e+00 }, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"Inventory:\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"Apple\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Found product: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"Product not found.\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"Orange\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_inventory() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 6004) #6
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.inventory, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_product(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.inventory, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %22

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.inventory, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.inventory, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x %struct.product], ptr %11, i64 0, i64 %15
  %17 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %17, i64 60, i1 false)
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.inventory, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %19, align 4
  br label %22

22:                                               ; preds = %9, %2
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @remove_product(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %42, %2
  %7 = load i32, ptr %5, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.inventory, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %45

12:                                               ; preds = %6
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.inventory, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.product], ptr %14, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.product, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = load ptr, ptr %4, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #7
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %41

23:                                               ; preds = %12
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.inventory, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.product], ptr %25, i64 0, i64 %27
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.inventory, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.inventory, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = sub nsw i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [100 x %struct.product], ptr %30, i64 0, i64 %35
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %28, ptr align 4 %36, i64 60, i1 false)
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.inventory, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, ptr %38, align 4
  br label %45

41:                                               ; preds = %12
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %5, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %5, align 4
  br label %6, !llvm.loop !6

45:                                               ; preds = %23, %6
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @find_product(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %31, %2
  %8 = load i32, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.inventory, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %34

13:                                               ; preds = %7
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.inventory, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.product], ptr %15, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.product, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = load ptr, ptr %5, align 8
  %22 = call i32 @strcmp(ptr noundef %20, ptr noundef %21) #7
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %13
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.inventory, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x %struct.product], ptr %26, i64 0, i64 %28
  store ptr %29, ptr %3, align 8
  br label %35

30:                                               ; preds = %13
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %6, align 4
  br label %7, !llvm.loop !8

34:                                               ; preds = %7
  store ptr null, ptr %3, align 8
  br label %35

35:                                               ; preds = %34, %24
  %36 = load ptr, ptr %3, align 8
  ret ptr %36
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_inventory(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %34, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.inventory, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %37

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.inventory, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.product], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.product, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.inventory, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.product], ptr %19, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.product, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.inventory, ptr %25, i32 0, i32 0
  %27 = load i32, ptr %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x %struct.product], ptr %26, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.product, ptr %29, i32 0, i32 2
  %31 = load float, ptr %30, align 4
  %32 = fpext float %31 to double
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %17, i32 noundef %24, double noundef %32)
  br label %34

34:                                               ; preds = %10
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %3, align 4
  br label %4, !llvm.loop !9

37:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca %struct.product, align 4
  %4 = alloca %struct.product, align 4
  %5 = alloca %struct.product, align 4
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %7 = call ptr @create_inventory()
  store ptr %7, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.main.p1, i64 60, i1 false)
  %8 = load ptr, ptr %2, align 8
  call void @add_product(ptr noundef %8, ptr noundef %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 @__const.main.p2, i64 60, i1 false)
  %9 = load ptr, ptr %2, align 8
  call void @add_product(ptr noundef %9, ptr noundef %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 @__const.main.p3, i64 60, i1 false)
  %10 = load ptr, ptr %2, align 8
  call void @add_product(ptr noundef %10, ptr noundef %5)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %12 = load ptr, ptr %2, align 8
  call void @print_inventory(ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  %14 = call ptr @find_product(ptr noundef %13, ptr noundef @.str.2)
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %22

17:                                               ; preds = %0
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds %struct.product, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %20)
  br label %24

22:                                               ; preds = %0
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %24

24:                                               ; preds = %22, %17
  %25 = load ptr, ptr %2, align 8
  call void @remove_product(ptr noundef %25, ptr noundef @.str.5)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %27 = load ptr, ptr %2, align 8
  call void @print_inventory(ptr noundef %27)
  %28 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %28) #8
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind }

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
