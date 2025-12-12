; ModuleID = 'LLVM_IR/gpt35-55127.ll'
source_filename = "DATASETv2/gpt35-55127.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { i32, ptr }

@.str = private unnamed_addr constant [30 x i8] c"Colors assigned to vertices:\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Vertex %d: Color %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"Could not color the graph with maximum %d colors\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_colors(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %4

4:                                                ; preds = %11, %2
  %.0 = phi i32 [ 0, %2 ], [ %12, %11 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds i32, ptr %0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %.0, i32 noundef %9)
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

13:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_color(i32 noundef %0, i32 noundef %1, i32 %2, ptr %3, ptr noundef %4) #0 {
  %6 = alloca %struct.Graph, align 8
  %7 = getelementptr inbounds { i32, ptr }, ptr %6, i32 0, i32 0
  store i32 %2, ptr %7, align 8
  %8 = getelementptr inbounds { i32, ptr }, ptr %6, i32 0, i32 1
  store ptr %3, ptr %8, align 8
  br label %9

9:                                                ; preds = %30, %5
  %.01 = phi i32 [ 0, %5 ], [ %31, %30 ]
  %10 = getelementptr inbounds %struct.Graph, ptr %6, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %.01, %11
  br i1 %12, label %13, label %32

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.Graph, ptr %6, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = sext i32 %0 to i64
  %17 = getelementptr inbounds ptr, ptr %15, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds i32, ptr %18, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %13
  %24 = sext i32 %.01 to i64
  %25 = getelementptr inbounds i32, ptr %4, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = icmp eq i32 %1, %26
  br i1 %27, label %28, label %29

28:                                               ; preds = %23
  br label %33

29:                                               ; preds = %23, %13
  br label %30

30:                                               ; preds = %29
  %31 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !8

32:                                               ; preds = %9
  br label %33

33:                                               ; preds = %32, %28
  %.0 = phi i32 [ 0, %28 ], [ 1, %32 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @graph_coloring_util(i32 noundef %0, i32 noundef %1, i32 %2, ptr %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca %struct.Graph, align 8
  %8 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 0
  store i32 %2, ptr %8, align 8
  %9 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 1
  store ptr %3, ptr %9, align 8
  %10 = icmp eq i32 %0, %1
  br i1 %10, label %11, label %12

11:                                               ; preds = %6
  br label %40

12:                                               ; preds = %6
  br label %13

13:                                               ; preds = %37, %12
  %.01 = phi i32 [ 1, %12 ], [ %38, %37 ]
  %14 = icmp sle i32 %.01, %5
  br i1 %14, label %15, label %39

15:                                               ; preds = %13
  %16 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @check_color(i32 noundef %0, i32 noundef %.01, i32 %17, ptr %19, ptr noundef %4)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %36

22:                                               ; preds = %15
  %23 = sext i32 %0 to i64
  %24 = getelementptr inbounds i32, ptr %4, i64 %23
  store i32 %.01, ptr %24, align 4
  %25 = add nsw i32 %0, 1
  %26 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = call i32 @graph_coloring_util(i32 noundef %25, i32 noundef %1, i32 %27, ptr %29, ptr noundef %4, i32 noundef %5)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %22
  br label %40

33:                                               ; preds = %22
  %34 = sext i32 %0 to i64
  %35 = getelementptr inbounds i32, ptr %4, i64 %34
  store i32 0, ptr %35, align 4
  br label %36

36:                                               ; preds = %33, %15
  br label %37

37:                                               ; preds = %36
  %38 = add nsw i32 %.01, 1
  br label %13, !llvm.loop !9

39:                                               ; preds = %13
  br label %40

40:                                               ; preds = %39, %32, %11
  %.0 = phi i32 [ 1, %11 ], [ 1, %32 ], [ 0, %39 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @graph_coloring(i32 noundef %0, i32 %1, ptr %2) #0 {
  %4 = alloca %struct.Graph, align 8
  %5 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 0
  store i32 %1, ptr %5, align 8
  %6 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 1
  store ptr %2, ptr %6, align 8
  %7 = sext i32 %0 to i64
  %8 = call noalias ptr @calloc(i64 noundef %7, i64 noundef 4) #4
  %9 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 @graph_coloring_util(i32 noundef 0, i32 noundef %0, i32 %10, ptr %12, ptr noundef %8, i32 noundef %0)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  call void @print_colors(ptr noundef %8, i32 noundef %0)
  br label %18

16:                                               ; preds = %3
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %0)
  br label %18

18:                                               ; preds = %16, %15
  ret void
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Graph, align 8
  %2 = sub nsw i32 5, 1
  %3 = mul nsw i32 5, %2
  %4 = sdiv i32 %3, 2
  %5 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 0
  store i32 5, ptr %5, align 8
  %6 = sext i32 5 to i64
  %7 = call noalias ptr @calloc(i64 noundef %6, i64 noundef 8) #4
  %8 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  store ptr %7, ptr %8, align 8
  br label %9

9:                                                ; preds = %18, %0
  %.01 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %10 = icmp slt i32 %.01, 5
  br i1 %10, label %11, label %20

11:                                               ; preds = %9
  %12 = sext i32 5 to i64
  %13 = call noalias ptr @calloc(i64 noundef %12, i64 noundef 4) #4
  %14 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds ptr, ptr %15, i64 %16
  store ptr %13, ptr %17, align 8
  br label %18

18:                                               ; preds = %11
  %19 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !10

20:                                               ; preds = %9
  %21 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 0
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds i32, ptr %24, i64 1
  store i32 1, ptr %25, align 4
  %26 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 0
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds i32, ptr %29, i64 2
  store i32 1, ptr %30, align 4
  %31 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds ptr, ptr %32, i64 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds i32, ptr %34, i64 3
  store i32 1, ptr %35, align 4
  %36 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds ptr, ptr %37, i64 2
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds i32, ptr %39, i64 3
  store i32 1, ptr %40, align 4
  %41 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds ptr, ptr %42, i64 3
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds i32, ptr %44, i64 4
  store i32 1, ptr %45, align 4
  %46 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = getelementptr inbounds { i32, ptr }, ptr %1, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  call void @graph_coloring(i32 noundef 5, i32 %47, ptr %49)
  br label %50

50:                                               ; preds = %58, %20
  %.0 = phi i32 [ 0, %20 ], [ %59, %58 ]
  %51 = icmp slt i32 %.0, 5
  br i1 %51, label %52, label %60

52:                                               ; preds = %50
  %53 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %54 = load ptr, ptr %53, align 8
  %55 = sext i32 %.0 to i64
  %56 = getelementptr inbounds ptr, ptr %54, i64 %55
  %57 = load ptr, ptr %56, align 8
  call void @free(ptr noundef %57) #5
  br label %58

58:                                               ; preds = %52
  %59 = add nsw i32 %.0, 1
  br label %50, !llvm.loop !11

60:                                               ; preds = %50
  %61 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  call void @free(ptr noundef %62) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }
attributes #5 = { nounwind }

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
