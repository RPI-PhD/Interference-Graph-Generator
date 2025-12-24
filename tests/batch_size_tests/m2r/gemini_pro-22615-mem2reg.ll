; ModuleID = 'LLVM_IR/gemini_pro-22615.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_inventory() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 6004) #6
  %2 = getelementptr inbounds %struct.inventory, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 4
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_product(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %15

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.product], ptr %7, i64 0, i64 %10
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %1, i64 60, i1 false)
  %12 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %12, align 4
  br label %15

15:                                               ; preds = %6, %2
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_product(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %29, %2
  %.0 = phi i32 [ 0, %2 ], [ %30, %29 ]
  %4 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.0, %5
  br i1 %6, label %7, label %31

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [100 x %struct.product], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.product, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef %1) #7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %28

15:                                               ; preds = %7
  %16 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [100 x %struct.product], ptr %16, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %20 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = sub nsw i32 %21, 1
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x %struct.product], ptr %19, i64 0, i64 %23
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %24, i64 60, i1 false)
  %25 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr %25, align 4
  br label %31

28:                                               ; preds = %7
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

31:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @find_product(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %20, %2
  %.01 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %4 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %22

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [100 x %struct.product], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.product, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef %1) #7
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %7
  %16 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [100 x %struct.product], ptr %16, i64 0, i64 %17
  br label %23

19:                                               ; preds = %7
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

22:                                               ; preds = %3
  br label %23

23:                                               ; preds = %22, %15
  %.0 = phi ptr [ %18, %15 ], [ null, %22 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_inventory(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %24, %1
  %.0 = phi i32 [ 0, %1 ], [ %25, %24 ]
  %3 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %26

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x %struct.product], ptr %7, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.product, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [100 x %struct.product], ptr %12, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.product, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr inbounds %struct.inventory, ptr %0, i32 0, i32 0
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [100 x %struct.product], ptr %17, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.product, ptr %19, i32 0, i32 2
  %21 = load float, ptr %20, align 4
  %22 = fpext float %21 to double
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %11, i32 noundef %16, double noundef %22)
  br label %24

24:                                               ; preds = %6
  %25 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

26:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.product, align 4
  %2 = alloca %struct.product, align 4
  %3 = alloca %struct.product, align 4
  %4 = call ptr @create_inventory()
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 4 @__const.main.p1, i64 60, i1 false)
  call void @add_product(ptr noundef %4, ptr noundef %1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @__const.main.p2, i64 60, i1 false)
  call void @add_product(ptr noundef %4, ptr noundef %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.main.p3, i64 60, i1 false)
  call void @add_product(ptr noundef %4, ptr noundef %3)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @print_inventory(ptr noundef %4)
  %6 = call ptr @find_product(ptr noundef %4, ptr noundef @.str.2)
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %12

8:                                                ; preds = %0
  %9 = getelementptr inbounds %struct.product, ptr %6, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %10)
  br label %14

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %14

14:                                               ; preds = %12, %8
  call void @remove_product(ptr noundef %4, ptr noundef @.str.5)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @print_inventory(ptr noundef %4)
  call void @free(ptr noundef %4) #8
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
