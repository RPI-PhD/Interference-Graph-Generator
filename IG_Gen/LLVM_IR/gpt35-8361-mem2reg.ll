; ModuleID = 'LLVM_IR/gpt35-8361.ll'
source_filename = "DATASETv2/gpt35-8361.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i32, ptr }

@__const.main.arr = private unnamed_addr constant [10 x i32] [i32 1, i32 3, i32 5, i32 9, i32 8, i32 7, i32 2, i32 4, i32 6, i32 0], align 16
@.str = private unnamed_addr constant [17 x i8] c"Unsorted array: \00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Sorted array: \00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bucketSort(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [10 x ptr], align 16
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 80, i1 false)
  br label %4

4:                                                ; preds = %20, %2
  %.02 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %5 = icmp slt i32 %.02, %1
  br i1 %5, label %6, label %22

6:                                                ; preds = %4
  %7 = sext i32 %.02 to i64
  %8 = getelementptr inbounds i32, ptr %0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = sdiv i32 %9, 10
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10 x ptr], ptr %3, i64 0, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = sext i32 %.02 to i64
  %15 = getelementptr inbounds i32, ptr %0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = call ptr @insert(ptr noundef %13, i32 noundef %16)
  %18 = sext i32 %10 to i64
  %19 = getelementptr inbounds [10 x ptr], ptr %3, i64 0, i64 %18
  store ptr %17, ptr %19, align 8
  br label %20

20:                                               ; preds = %6
  %21 = add nsw i32 %.02, 1
  br label %4, !llvm.loop !6

22:                                               ; preds = %4
  br label %23

23:                                               ; preds = %40, %22
  %.03 = phi i32 [ 0, %22 ], [ %.1, %40 ]
  %.01 = phi i32 [ 0, %22 ], [ %41, %40 ]
  %24 = icmp slt i32 %.01, 10
  br i1 %24, label %25, label %42

25:                                               ; preds = %23
  %26 = sext i32 %.01 to i64
  %27 = getelementptr inbounds [10 x ptr], ptr %3, i64 0, i64 %26
  %28 = load ptr, ptr %27, align 8
  br label %29

29:                                               ; preds = %31, %25
  %.1 = phi i32 [ %.03, %25 ], [ %34, %31 ]
  %.0 = phi ptr [ %28, %25 ], [ %38, %31 ]
  %30 = icmp ne ptr %.0, null
  br i1 %30, label %31, label %39

31:                                               ; preds = %29
  %32 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = add nsw i32 %.1, 1
  %35 = sext i32 %.1 to i64
  %36 = getelementptr inbounds i32, ptr %0, i64 %35
  store i32 %33, ptr %36, align 4
  %37 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  br label %29, !llvm.loop !8

39:                                               ; preds = %29
  br label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %.01, 1
  br label %23, !llvm.loop !9

42:                                               ; preds = %23
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
define internal ptr @insert(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 16) #5
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0
  store i32 %1, ptr %4, align 8
  %5 = icmp eq ptr %0, null
  br i1 %5, label %10, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp slt i32 %1, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %6, %2
  %11 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1
  store ptr %0, ptr %11, align 8
  br label %33

12:                                               ; preds = %6
  br label %13

13:                                               ; preds = %25, %12
  %.01 = phi ptr [ %0, %12 ], [ %27, %25 ]
  %14 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %23

17:                                               ; preds = %13
  %18 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp sle i32 %21, %1
  br label %23

23:                                               ; preds = %17, %13
  %24 = phi i1 [ false, %13 ], [ %22, %17 ]
  br i1 %24, label %25, label %28

25:                                               ; preds = %23
  %26 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  br label %13, !llvm.loop !10

28:                                               ; preds = %23
  %29 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1
  store ptr %30, ptr %31, align 8
  %32 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  store ptr %3, ptr %32, align 8
  br label %33

33:                                               ; preds = %28, %10
  %.0 = phi ptr [ %3, %10 ], [ %0, %28 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10 x i32], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.arr, i64 40, i1 false)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 0
  call void @printArray(ptr noundef %3, i32 noundef 10)
  %4 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 0
  call void @bucketSort(ptr noundef %4, i32 noundef 10)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %6 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 0
  call void @printArray(ptr noundef %6, i32 noundef 10)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @printArray(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %10, %2
  %.0 = phi i32 [ 0, %2 ], [ %11, %10 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i32, ptr %0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %8)
  br label %10

10:                                               ; preds = %5
  %11 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !11

12:                                               ; preds = %3
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }

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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
