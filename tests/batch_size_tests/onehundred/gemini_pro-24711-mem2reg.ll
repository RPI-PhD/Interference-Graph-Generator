; ModuleID = 'LLVM_IR/gemini_pro-24711.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_warehouse() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 6004) #5
  %2 = getelementptr inbounds %struct.warehouse, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 4
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_item(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %8, align 4
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds [100 x %struct.item], ptr %7, i64 0, i64 %11
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 4 %1, i64 60, i1 false)
  br label %15

13:                                               ; preds = %2
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %15

15:                                               ; preds = %13, %6
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_item(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %36, %2
  %.01 = phi i32 [ 0, %2 ], [ %37, %36 ]
  %4 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %38

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [100 x %struct.item], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.item, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef %1) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %35

15:                                               ; preds = %7
  br label %16

16:                                               ; preds = %29, %15
  %.0 = phi i32 [ %.01, %15 ], [ %30, %29 ]
  %17 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = sub nsw i32 %18, 1
  %20 = icmp slt i32 %.0, %19
  br i1 %20, label %21, label %31

21:                                               ; preds = %16
  %22 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [100 x %struct.item], ptr %22, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %26 = add nsw i32 %.0, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.item], ptr %25, i64 0, i64 %27
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %24, ptr align 4 %28, i64 60, i1 false)
  br label %29

29:                                               ; preds = %21
  %30 = add nsw i32 %.0, 1
  br label %16, !llvm.loop !6

31:                                               ; preds = %16
  %32 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, ptr %32, align 4
  br label %40

35:                                               ; preds = %7
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

38:                                               ; preds = %3
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %40

40:                                               ; preds = %38, %31
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_warehouse(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %3

3:                                                ; preds = %25, %1
  %.0 = phi i32 [ 0, %1 ], [ %26, %25 ]
  %4 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.0, %5
  br i1 %6, label %7, label %27

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [100 x %struct.item], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.item, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x %struct.item], ptr %13, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.item, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr inbounds %struct.warehouse, ptr %0, i32 0, i32 0
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [100 x %struct.item], ptr %18, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.item, ptr %20, i32 0, i32 2
  %22 = load float, ptr %21, align 4
  %23 = fpext float %22 to double
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %12, i32 noundef %17, double noundef %23)
  br label %25

25:                                               ; preds = %7
  %26 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

27:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.item, align 4
  %2 = alloca %struct.item, align 4
  %3 = alloca %struct.item, align 4
  %4 = alloca %struct.item, align 4
  %5 = alloca %struct.item, align 4
  %6 = call ptr @create_warehouse()
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 4 @__const.main.item1, i64 60, i1 false)
  call void @add_item(ptr noundef %6, ptr noundef %1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @__const.main.item2, i64 60, i1 false)
  call void @add_item(ptr noundef %6, ptr noundef %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.main.item3, i64 60, i1 false)
  call void @add_item(ptr noundef %6, ptr noundef %3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 @__const.main.item4, i64 60, i1 false)
  call void @add_item(ptr noundef %6, ptr noundef %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 @__const.main.item5, i64 60, i1 false)
  call void @add_item(ptr noundef %6, ptr noundef %5)
  call void @print_warehouse(ptr noundef %6)
  call void @remove_item(ptr noundef %6, ptr noundef @.str.4)
  call void @print_warehouse(ptr noundef %6)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
