; ModuleID = 'LLVM_IR/gpt35-14216.ll'
source_filename = "DATASETv2/gpt35-14216.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MinHeapNode = type { i8, i32, ptr, ptr }
%struct.MinHeap = type { i32, i32, ptr }

@.str = private unnamed_addr constant [5 x i8] c"%c: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.data = private unnamed_addr constant [6 x i8] c"ABCDEF", align 1
@__const.main.freq = private unnamed_addr constant [6 x i32] [i32 5, i32 9, i32 12, i32 13, i32 16, i32 45], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @newNode(i8 noundef signext %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 24) #4
  %4 = getelementptr inbounds %struct.MinHeapNode, ptr %3, i32 0, i32 3
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds %struct.MinHeapNode, ptr %3, i32 0, i32 2
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds %struct.MinHeapNode, ptr %3, i32 0, i32 0
  store i8 %0, ptr %6, align 8
  %7 = getelementptr inbounds %struct.MinHeapNode, ptr %3, i32 0, i32 1
  store i32 %1, ptr %7, align 4
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @swapNodes(ptr noundef %0, ptr noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  %4 = load ptr, ptr %1, align 8
  store ptr %4, ptr %0, align 8
  store ptr %3, ptr %1, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @minHeapify(ptr noundef %0, i32 noundef %1) #0 {
  %3 = mul nsw i32 2, %1
  %4 = add nsw i32 %3, 1
  %5 = mul nsw i32 2, %1
  %6 = add nsw i32 %5, 2
  %7 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp ult i32 %4, %8
  br i1 %9, label %10, label %27

10:                                               ; preds = %2
  %11 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = sext i32 %4 to i64
  %14 = getelementptr inbounds ptr, ptr %12, i64 %13
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.MinHeapNode, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = sext i32 %1 to i64
  %21 = getelementptr inbounds ptr, ptr %19, i64 %20
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.MinHeapNode, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = icmp ult i32 %17, %24
  br i1 %25, label %26, label %27

26:                                               ; preds = %10
  br label %27

27:                                               ; preds = %26, %10, %2
  %.0 = phi i32 [ %4, %26 ], [ %1, %10 ], [ %1, %2 ]
  %28 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 0
  %29 = load i32, ptr %28, align 8
  %30 = icmp ult i32 %6, %29
  br i1 %30, label %31, label %48

31:                                               ; preds = %27
  %32 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  %34 = sext i32 %6 to i64
  %35 = getelementptr inbounds ptr, ptr %33, i64 %34
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.MinHeapNode, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = sext i32 %.0 to i64
  %42 = getelementptr inbounds ptr, ptr %40, i64 %41
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds %struct.MinHeapNode, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = icmp ult i32 %38, %45
  br i1 %46, label %47, label %48

47:                                               ; preds = %31
  br label %48

48:                                               ; preds = %47, %31, %27
  %.1 = phi i32 [ %6, %47 ], [ %.0, %31 ], [ %.0, %27 ]
  %49 = icmp ne i32 %.1, %1
  br i1 %49, label %50, label %59

50:                                               ; preds = %48
  %51 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  %53 = sext i32 %.1 to i64
  %54 = getelementptr inbounds ptr, ptr %52, i64 %53
  %55 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %56 = load ptr, ptr %55, align 8
  %57 = sext i32 %1 to i64
  %58 = getelementptr inbounds ptr, ptr %56, i64 %57
  call void @swapNodes(ptr noundef %54, ptr noundef %58)
  call void @minHeapify(ptr noundef %0, i32 noundef %.1)
  br label %59

59:                                               ; preds = %50, %48
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createMinHeap(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 16) #4
  %3 = getelementptr inbounds %struct.MinHeap, ptr %2, i32 0, i32 0
  store i32 0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.MinHeap, ptr %2, i32 0, i32 1
  store i32 %0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.MinHeap, ptr %2, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = zext i32 %6 to i64
  %8 = mul i64 %7, 8
  %9 = call noalias ptr @malloc(i64 noundef %8) #4
  %10 = getelementptr inbounds %struct.MinHeap, ptr %2, i32 0, i32 2
  store ptr %9, ptr %10, align 8
  ret ptr %2
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @insertMinHeapNode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 8
  %5 = add i32 %4, 1
  store i32 %5, ptr %3, align 8
  %6 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = sub i32 %7, 1
  br label %9

9:                                                ; preds = %26, %2
  %.0 = phi i32 [ %8, %2 ], [ %39, %26 ]
  %10 = icmp ne i32 %.0, 0
  br i1 %10, label %11, label %24

11:                                               ; preds = %9
  %12 = getelementptr inbounds %struct.MinHeapNode, ptr %1, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = sub nsw i32 %.0, 1
  %17 = sdiv i32 %16, 2
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %15, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.MinHeapNode, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = icmp ult i32 %13, %22
  br label %24

24:                                               ; preds = %11, %9
  %25 = phi i1 [ false, %9 ], [ %23, %11 ]
  br i1 %25, label %26, label %40

26:                                               ; preds = %24
  %27 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  %29 = sub nsw i32 %.0, 1
  %30 = sdiv i32 %29, 2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds ptr, ptr %28, i64 %31
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds ptr, ptr %35, i64 %36
  store ptr %33, ptr %37, align 8
  %38 = sub nsw i32 %.0, 1
  %39 = sdiv i32 %38, 2
  br label %9, !llvm.loop !6

40:                                               ; preds = %24
  %41 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %42 = load ptr, ptr %41, align 8
  %43 = sext i32 %.0 to i64
  %44 = getelementptr inbounds ptr, ptr %42, i64 %43
  store ptr %1, ptr %44, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @extractMinHeapNode(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds ptr, ptr %3, i64 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = sub i32 %9, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds ptr, ptr %7, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  store ptr %13, ptr %16, align 8
  %17 = getelementptr inbounds %struct.MinHeap, ptr %0, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = add i32 %18, -1
  store i32 %19, ptr %17, align 8
  call void @minHeapify(ptr noundef %0, i32 noundef 0)
  ret ptr %5
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @leafNode(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 2
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 3
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  %9 = xor i1 %8, true
  br label %10

10:                                               ; preds = %5, %1
  %11 = phi i1 [ false, %1 ], [ %9, %5 ]
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createAndBuildMinHeap(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = call ptr @createMinHeap(i32 noundef %2)
  br label %5

5:                                                ; preds = %19, %3
  %.01 = phi i32 [ 0, %3 ], [ %20, %19 ]
  %6 = icmp slt i32 %.01, %2
  br i1 %6, label %7, label %21

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds i32, ptr %1, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = call ptr @newNode(i8 noundef signext %10, i32 noundef %13)
  %15 = getelementptr inbounds %struct.MinHeap, ptr %4, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds ptr, ptr %16, i64 %17
  store ptr %14, ptr %18, align 8
  br label %19

19:                                               ; preds = %7
  %20 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !8

21:                                               ; preds = %5
  %22 = getelementptr inbounds %struct.MinHeap, ptr %4, i32 0, i32 0
  store i32 %2, ptr %22, align 8
  %23 = getelementptr inbounds %struct.MinHeap, ptr %4, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = sub i32 %24, 1
  %26 = udiv i32 %25, 2
  br label %27

27:                                               ; preds = %30, %21
  %.0 = phi i32 [ %26, %21 ], [ %31, %30 ]
  %28 = icmp sge i32 %.0, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %27
  call void @minHeapify(ptr noundef %4, i32 noundef %.0)
  br label %30

30:                                               ; preds = %29
  %31 = add nsw i32 %.0, -1
  br label %27, !llvm.loop !9

32:                                               ; preds = %27
  ret ptr %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @buildHuffmanTree(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = call ptr @createAndBuildMinHeap(ptr noundef %0, ptr noundef %1, i32 noundef %2)
  br label %5

5:                                                ; preds = %9, %3
  %6 = getelementptr inbounds %struct.MinHeap, ptr %4, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %9, label %20

9:                                                ; preds = %5
  %10 = call ptr @extractMinHeapNode(ptr noundef %4)
  %11 = call ptr @extractMinHeapNode(ptr noundef %4)
  %12 = getelementptr inbounds %struct.MinHeapNode, ptr %10, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = getelementptr inbounds %struct.MinHeapNode, ptr %11, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = add i32 %13, %15
  %17 = call ptr @newNode(i8 noundef signext 36, i32 noundef %16)
  %18 = getelementptr inbounds %struct.MinHeapNode, ptr %17, i32 0, i32 2
  store ptr %10, ptr %18, align 8
  %19 = getelementptr inbounds %struct.MinHeapNode, ptr %17, i32 0, i32 3
  store ptr %11, ptr %19, align 8
  call void @insertMinHeapNode(ptr noundef %4, ptr noundef %17)
  br label %5, !llvm.loop !10

20:                                               ; preds = %5
  %21 = call ptr @extractMinHeapNode(ptr noundef %4)
  ret ptr %21
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printCodes(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %3
  %8 = sext i32 %2 to i64
  %9 = getelementptr inbounds i32, ptr %1, i64 %8
  store i32 0, ptr %9, align 4
  %10 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  %12 = add nsw i32 %2, 1
  call void @printCodes(ptr noundef %11, ptr noundef %1, i32 noundef %12)
  br label %13

13:                                               ; preds = %7, %3
  %14 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 3
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %23

17:                                               ; preds = %13
  %18 = sext i32 %2 to i64
  %19 = getelementptr inbounds i32, ptr %1, i64 %18
  store i32 1, ptr %19, align 4
  %20 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 3
  %21 = load ptr, ptr %20, align 8
  %22 = add nsw i32 %2, 1
  call void @printCodes(ptr noundef %21, ptr noundef %1, i32 noundef %22)
  br label %23

23:                                               ; preds = %17, %13
  %24 = call i32 @leafNode(ptr noundef %0)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %42

26:                                               ; preds = %23
  %27 = getelementptr inbounds %struct.MinHeapNode, ptr %0, i32 0, i32 0
  %28 = load i8, ptr %27, align 8
  %29 = sext i8 %28 to i32
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %29)
  br label %31

31:                                               ; preds = %38, %26
  %.0 = phi i32 [ 0, %26 ], [ %39, %38 ]
  %32 = icmp slt i32 %.0, %2
  br i1 %32, label %33, label %40

33:                                               ; preds = %31
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds i32, ptr %1, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %36)
  br label %38

38:                                               ; preds = %33
  %39 = add nsw i32 %.0, 1
  br label %31, !llvm.loop !11

40:                                               ; preds = %31
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %42

42:                                               ; preds = %40, %23
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @HuffmanCodes(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca [100 x i32], align 16
  %5 = call ptr @buildHuffmanTree(ptr noundef %0, ptr noundef %1, i32 noundef %2)
  %6 = getelementptr inbounds [100 x i32], ptr %4, i64 0, i64 0
  call void @printCodes(ptr noundef %5, ptr noundef %6, i32 noundef 0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [6 x i8], align 1
  %2 = alloca [6 x i32], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.main.data, i64 6, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.freq, i64 24, i1 false)
  %3 = getelementptr inbounds [6 x i8], ptr %1, i64 0, i64 0
  %4 = getelementptr inbounds [6 x i32], ptr %2, i64 0, i64 0
  call void @HuffmanCodes(ptr noundef %3, ptr noundef %4, i32 noundef 6)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind allocsize(0) }

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
