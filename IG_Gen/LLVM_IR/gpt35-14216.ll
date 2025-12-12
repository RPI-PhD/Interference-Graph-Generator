; ModuleID = 'DATASETv2/gpt35-14216.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @newNode(i8 noundef signext %0, i32 noundef %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i8 %0, ptr %3, align 1
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 24) #4
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds %struct.MinHeapNode, ptr %7, i32 0, i32 3
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.MinHeapNode, ptr %9, i32 0, i32 2
  store ptr null, ptr %10, align 8
  %11 = load i8, ptr %3, align 1
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.MinHeapNode, ptr %12, i32 0, i32 0
  store i8 %11, ptr %13, align 8
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.MinHeapNode, ptr %15, i32 0, i32 1
  store i32 %14, ptr %16, align 4
  %17 = load ptr, ptr %5, align 8
  ret ptr %17
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @swapNodes(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %4, align 8
  store ptr %11, ptr %12, align 8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @minHeapify(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  store i32 %8, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = mul nsw i32 2, %9
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %6, align 4
  %12 = load i32, ptr %4, align 4
  %13 = mul nsw i32 2, %12
  %14 = add nsw i32 %13, 2
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %6, align 4
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.MinHeap, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp ult i32 %15, %18
  br i1 %19, label %20, label %42

20:                                               ; preds = %2
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.MinHeap, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.MinHeapNode, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.MinHeap, ptr %30, i32 0, i32 2
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds ptr, ptr %32, i64 %34
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.MinHeapNode, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = icmp ult i32 %29, %38
  br i1 %39, label %40, label %42

40:                                               ; preds = %20
  %41 = load i32, ptr %6, align 4
  store i32 %41, ptr %5, align 4
  br label %42

42:                                               ; preds = %40, %20, %2
  %43 = load i32, ptr %7, align 4
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.MinHeap, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = icmp ult i32 %43, %46
  br i1 %47, label %48, label %70

48:                                               ; preds = %42
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.MinHeap, ptr %49, i32 0, i32 2
  %51 = load ptr, ptr %50, align 8
  %52 = load i32, ptr %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds ptr, ptr %51, i64 %53
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds %struct.MinHeapNode, ptr %55, i32 0, i32 1
  %57 = load i32, ptr %56, align 4
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds %struct.MinHeap, ptr %58, i32 0, i32 2
  %60 = load ptr, ptr %59, align 8
  %61 = load i32, ptr %5, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds ptr, ptr %60, i64 %62
  %64 = load ptr, ptr %63, align 8
  %65 = getelementptr inbounds %struct.MinHeapNode, ptr %64, i32 0, i32 1
  %66 = load i32, ptr %65, align 4
  %67 = icmp ult i32 %57, %66
  br i1 %67, label %68, label %70

68:                                               ; preds = %48
  %69 = load i32, ptr %7, align 4
  store i32 %69, ptr %5, align 4
  br label %70

70:                                               ; preds = %68, %48, %42
  %71 = load i32, ptr %5, align 4
  %72 = load i32, ptr %4, align 4
  %73 = icmp ne i32 %71, %72
  br i1 %73, label %74, label %89

74:                                               ; preds = %70
  %75 = load ptr, ptr %3, align 8
  %76 = getelementptr inbounds %struct.MinHeap, ptr %75, i32 0, i32 2
  %77 = load ptr, ptr %76, align 8
  %78 = load i32, ptr %5, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds ptr, ptr %77, i64 %79
  %81 = load ptr, ptr %3, align 8
  %82 = getelementptr inbounds %struct.MinHeap, ptr %81, i32 0, i32 2
  %83 = load ptr, ptr %82, align 8
  %84 = load i32, ptr %4, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds ptr, ptr %83, i64 %85
  call void @swapNodes(ptr noundef %80, ptr noundef %86)
  %87 = load ptr, ptr %3, align 8
  %88 = load i32, ptr %5, align 4
  call void @minHeapify(ptr noundef %87, i32 noundef %88)
  br label %89

89:                                               ; preds = %74, %70
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createMinHeap(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.MinHeap, ptr %5, i32 0, i32 0
  store i32 0, ptr %6, align 8
  %7 = load i32, ptr %2, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.MinHeap, ptr %8, i32 0, i32 1
  store i32 %7, ptr %9, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.MinHeap, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = zext i32 %12 to i64
  %14 = mul i64 %13, 8
  %15 = call noalias ptr @malloc(i64 noundef %14) #4
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.MinHeap, ptr %16, i32 0, i32 2
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  ret ptr %18
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @insertMinHeapNode(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.MinHeap, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = add i32 %8, 1
  store i32 %9, ptr %7, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.MinHeap, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = sub i32 %12, 1
  store i32 %13, ptr %5, align 4
  br label %14

14:                                               ; preds = %35, %2
  %15 = load i32, ptr %5, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %33

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.MinHeapNode, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.MinHeap, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sub nsw i32 %24, 1
  %26 = sdiv i32 %25, 2
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds ptr, ptr %23, i64 %27
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.MinHeapNode, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = icmp ult i32 %20, %31
  br label %33

33:                                               ; preds = %17, %14
  %34 = phi i1 [ false, %14 ], [ %32, %17 ]
  br i1 %34, label %35, label %54

35:                                               ; preds = %33
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.MinHeap, ptr %36, i32 0, i32 2
  %38 = load ptr, ptr %37, align 8
  %39 = load i32, ptr %5, align 4
  %40 = sub nsw i32 %39, 1
  %41 = sdiv i32 %40, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds ptr, ptr %38, i64 %42
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds %struct.MinHeap, ptr %45, i32 0, i32 2
  %47 = load ptr, ptr %46, align 8
  %48 = load i32, ptr %5, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds ptr, ptr %47, i64 %49
  store ptr %44, ptr %50, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sub nsw i32 %51, 1
  %53 = sdiv i32 %52, 2
  store i32 %53, ptr %5, align 4
  br label %14, !llvm.loop !6

54:                                               ; preds = %33
  %55 = load ptr, ptr %4, align 8
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds %struct.MinHeap, ptr %56, i32 0, i32 2
  %58 = load ptr, ptr %57, align 8
  %59 = load i32, ptr %5, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %58, i64 %60
  store ptr %55, ptr %61, align 8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @extractMinHeapNode(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.MinHeap, ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds ptr, ptr %6, i64 0
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.MinHeap, ptr %9, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.MinHeap, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = sub i32 %14, 1
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds ptr, ptr %11, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.MinHeap, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds ptr, ptr %21, i64 0
  store ptr %18, ptr %22, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.MinHeap, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  %26 = add i32 %25, -1
  store i32 %26, ptr %24, align 8
  %27 = load ptr, ptr %2, align 8
  call void @minHeapify(ptr noundef %27, i32 noundef 0)
  %28 = load ptr, ptr %3, align 8
  ret ptr %28
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @leafNode(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.MinHeapNode, ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %13, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.MinHeapNode, ptr %8, i32 0, i32 3
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  %12 = xor i1 %11, true
  br label %13

13:                                               ; preds = %7, %1
  %14 = phi i1 [ false, %1 ], [ %12, %7 ]
  %15 = zext i1 %14 to i32
  ret i32 %15
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createAndBuildMinHeap(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  %11 = call ptr @createMinHeap(i32 noundef %10)
  store ptr %11, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %12

12:                                               ; preds = %34, %3
  %13 = load i32, ptr %8, align 4
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %37

16:                                               ; preds = %12
  %17 = load ptr, ptr %4, align 8
  %18 = load i32, ptr %8, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %17, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = load ptr, ptr %5, align 8
  %23 = load i32, ptr %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %22, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = call ptr @newNode(i8 noundef signext %21, i32 noundef %26)
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds %struct.MinHeap, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %8, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds ptr, ptr %30, i64 %32
  store ptr %27, ptr %33, align 8
  br label %34

34:                                               ; preds = %16
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %8, align 4
  br label %12, !llvm.loop !8

37:                                               ; preds = %12
  %38 = load i32, ptr %6, align 4
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.MinHeap, ptr %39, i32 0, i32 0
  store i32 %38, ptr %40, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.MinHeap, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  %44 = sub i32 %43, 1
  %45 = udiv i32 %44, 2
  store i32 %45, ptr %9, align 4
  br label %46

46:                                               ; preds = %52, %37
  %47 = load i32, ptr %9, align 4
  %48 = icmp sge i32 %47, 0
  br i1 %48, label %49, label %55

49:                                               ; preds = %46
  %50 = load ptr, ptr %7, align 8
  %51 = load i32, ptr %9, align 4
  call void @minHeapify(ptr noundef %50, i32 noundef %51)
  br label %52

52:                                               ; preds = %49
  %53 = load i32, ptr %9, align 4
  %54 = add nsw i32 %53, -1
  store i32 %54, ptr %9, align 4
  br label %46, !llvm.loop !9

55:                                               ; preds = %46
  %56 = load ptr, ptr %7, align 8
  ret ptr %56
}

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @buildHuffmanTree(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load i32, ptr %6, align 4
  %14 = call ptr @createAndBuildMinHeap(ptr noundef %11, ptr noundef %12, i32 noundef %13)
  store ptr %14, ptr %10, align 8
  br label %15

15:                                               ; preds = %20, %3
  %16 = load ptr, ptr %10, align 8
  %17 = getelementptr inbounds %struct.MinHeap, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %20, label %41

20:                                               ; preds = %15
  %21 = load ptr, ptr %10, align 8
  %22 = call ptr @extractMinHeapNode(ptr noundef %21)
  store ptr %22, ptr %7, align 8
  %23 = load ptr, ptr %10, align 8
  %24 = call ptr @extractMinHeapNode(ptr noundef %23)
  store ptr %24, ptr %8, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.MinHeapNode, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = load ptr, ptr %8, align 8
  %29 = getelementptr inbounds %struct.MinHeapNode, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = add i32 %27, %30
  %32 = call ptr @newNode(i8 noundef signext 36, i32 noundef %31)
  store ptr %32, ptr %9, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = load ptr, ptr %9, align 8
  %35 = getelementptr inbounds %struct.MinHeapNode, ptr %34, i32 0, i32 2
  store ptr %33, ptr %35, align 8
  %36 = load ptr, ptr %8, align 8
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.MinHeapNode, ptr %37, i32 0, i32 3
  store ptr %36, ptr %38, align 8
  %39 = load ptr, ptr %10, align 8
  %40 = load ptr, ptr %9, align 8
  call void @insertMinHeapNode(ptr noundef %39, ptr noundef %40)
  br label %15, !llvm.loop !10

41:                                               ; preds = %15
  %42 = load ptr, ptr %10, align 8
  %43 = call ptr @extractMinHeapNode(ptr noundef %42)
  ret ptr %43
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printCodes(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.MinHeapNode, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %23

12:                                               ; preds = %3
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %6, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  store i32 0, ptr %16, align 4
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.MinHeapNode, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = load i32, ptr %6, align 4
  %22 = add nsw i32 %21, 1
  call void @printCodes(ptr noundef %19, ptr noundef %20, i32 noundef %22)
  br label %23

23:                                               ; preds = %12, %3
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.MinHeapNode, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %39

28:                                               ; preds = %23
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  store i32 1, ptr %32, align 4
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.MinHeapNode, ptr %33, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  call void @printCodes(ptr noundef %35, ptr noundef %36, i32 noundef %38)
  br label %39

39:                                               ; preds = %28, %23
  %40 = load ptr, ptr %4, align 8
  %41 = call i32 @leafNode(ptr noundef %40)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %65

43:                                               ; preds = %39
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.MinHeapNode, ptr %44, i32 0, i32 0
  %46 = load i8, ptr %45, align 8
  %47 = sext i8 %46 to i32
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %47)
  store i32 0, ptr %7, align 4
  br label %49

49:                                               ; preds = %60, %43
  %50 = load i32, ptr %7, align 4
  %51 = load i32, ptr %6, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %63

53:                                               ; preds = %49
  %54 = load ptr, ptr %5, align 8
  %55 = load i32, ptr %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %58)
  br label %60

60:                                               ; preds = %53
  %61 = load i32, ptr %7, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %7, align 4
  br label %49, !llvm.loop !11

63:                                               ; preds = %49
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %65

65:                                               ; preds = %63, %39
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @HuffmanCodes(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca [100 x i32], align 16
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load i32, ptr %6, align 4
  %13 = call ptr @buildHuffmanTree(ptr noundef %10, ptr noundef %11, i32 noundef %12)
  store ptr %13, ptr %7, align 8
  store i32 0, ptr %9, align 4
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds [100 x i32], ptr %8, i64 0, i64 0
  %16 = load i32, ptr %9, align 4
  call void @printCodes(ptr noundef %14, ptr noundef %15, i32 noundef %16)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [6 x i8], align 1
  %3 = alloca [6 x i32], align 16
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.data, i64 6, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.freq, i64 24, i1 false)
  store i32 6, ptr %4, align 4
  %5 = getelementptr inbounds [6 x i8], ptr %2, i64 0, i64 0
  %6 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 0
  %7 = load i32, ptr %4, align 4
  call void @HuffmanCodes(ptr noundef %5, ptr noundef %6, i32 noundef %7)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
