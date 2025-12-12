; ModuleID = 'DATASETv2/gemini_pro-24711.c'
source_filename = "DATASETv2/gemini_pro-24711.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.item = type { [50 x i8], i32, float }
%struct.warehouse = type { [100 x %struct.item], i32 }

@.str = private unnamed_addr constant [20 x i8] c"Warehouse is full!\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Item not found!\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Warehouse contains:\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"%s %d %.2f\0A\00", align 1
@__const.main.item1 = private unnamed_addr constant %struct.item { [50 x i8] c"Apple\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 10, float 5.000000e-01 }, align 4
@__const.main.item2 = private unnamed_addr constant %struct.item { [50 x i8] c"Orange\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 10, float 7.500000e-01 }, align 4
@__const.main.item3 = private unnamed_addr constant %struct.item { [50 x i8] c"Banana\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 10, float 1.000000e+00 }, align 4
@__const.main.item4 = private unnamed_addr constant %struct.item { [50 x i8] c"Grape\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 10, float 1.500000e+00 }, align 4
@__const.main.item5 = private unnamed_addr constant %struct.item { [50 x i8] c"Strawberry\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", i32 10, float 2.000000e+00 }, align 4
@.str.4 = private unnamed_addr constant [7 x i8] c"Orange\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_warehouse() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 6004) #5
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.warehouse, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_item(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.warehouse, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %19

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.warehouse, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.warehouse, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %13, align 4
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds [100 x %struct.item], ptr %11, i64 0, i64 %16
  %18 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %18, i64 60, i1 false)
  br label %21

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %21

21:                                               ; preds = %19, %9
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @remove_item(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %54, %2
  %8 = load i32, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.warehouse, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %57

13:                                               ; preds = %7
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.warehouse, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.item], ptr %15, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.item, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = load ptr, ptr %4, align 8
  %22 = call i32 @strcmp(ptr noundef %20, ptr noundef %21) #6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %53

24:                                               ; preds = %13
  %25 = load i32, ptr %5, align 4
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %45, %24
  %27 = load i32, ptr %6, align 4
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.warehouse, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = sub nsw i32 %30, 1
  %32 = icmp slt i32 %27, %31
  br i1 %32, label %33, label %48

33:                                               ; preds = %26
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.warehouse, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x %struct.item], ptr %35, i64 0, i64 %37
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.warehouse, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [100 x %struct.item], ptr %40, i64 0, i64 %43
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %38, ptr align 4 %44, i64 60, i1 false)
  br label %45

45:                                               ; preds = %33
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %6, align 4
  br label %26, !llvm.loop !6

48:                                               ; preds = %26
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.warehouse, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, ptr %50, align 4
  br label %59

53:                                               ; preds = %13
  br label %54

54:                                               ; preds = %53
  %55 = load i32, ptr %5, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %5, align 4
  br label %7, !llvm.loop !8

57:                                               ; preds = %7
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %59

59:                                               ; preds = %57, %48
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_warehouse(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %35, %1
  %6 = load i32, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.warehouse, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %38

11:                                               ; preds = %5
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.warehouse, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x %struct.item], ptr %13, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.item, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.warehouse, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.item], ptr %20, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.item, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.warehouse, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %3, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.item], ptr %27, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.item, ptr %30, i32 0, i32 2
  %32 = load float, ptr %31, align 4
  %33 = fpext float %32 to double
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %18, i32 noundef %25, double noundef %33)
  br label %35

35:                                               ; preds = %11
  %36 = load i32, ptr %3, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %3, align 4
  br label %5, !llvm.loop !9

38:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca %struct.item, align 4
  %4 = alloca %struct.item, align 4
  %5 = alloca %struct.item, align 4
  %6 = alloca %struct.item, align 4
  %7 = alloca %struct.item, align 4
  store i32 0, ptr %1, align 4
  %8 = call ptr @create_warehouse()
  store ptr %8, ptr %2, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.main.item1, i64 60, i1 false)
  %9 = load ptr, ptr %2, align 8
  call void @add_item(ptr noundef %9, ptr noundef %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 @__const.main.item2, i64 60, i1 false)
  %10 = load ptr, ptr %2, align 8
  call void @add_item(ptr noundef %10, ptr noundef %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 @__const.main.item3, i64 60, i1 false)
  %11 = load ptr, ptr %2, align 8
  call void @add_item(ptr noundef %11, ptr noundef %5)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %6, ptr align 4 @__const.main.item4, i64 60, i1 false)
  %12 = load ptr, ptr %2, align 8
  call void @add_item(ptr noundef %12, ptr noundef %6)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %7, ptr align 4 @__const.main.item5, i64 60, i1 false)
  %13 = load ptr, ptr %2, align 8
  call void @add_item(ptr noundef %13, ptr noundef %7)
  %14 = load ptr, ptr %2, align 8
  call void @print_warehouse(ptr noundef %14)
  %15 = load ptr, ptr %2, align 8
  call void @remove_item(ptr noundef %15, ptr noundef @.str.4)
  %16 = load ptr, ptr %2, align 8
  call void @print_warehouse(ptr noundef %16)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind willreturn memory(read) }

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
