; ModuleID = 'LLVM_IR/gpt4o_mini-39013.ll'
source_filename = "DATASETv2/gpt4o_mini-39013.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { i32, [100 x ptr] }
%struct.Node = type { i32, i32, ptr }

@.str = private unnamed_addr constant [23 x i8] c"Graph representation:\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"Vertex %d: \00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"-> %d(%d) \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Shocking! Shortest distances from vertex %d:\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Distance to vertex %d: Unreachable!\0A\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"Distance to vertex %d: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createGraph(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 808) #4
  %3 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 0
  store i32 %0, ptr %3, align 8
  br label %4

4:                                                ; preds = %10, %1
  %.0 = phi i32 [ 0, %1 ], [ %11, %10 ]
  %5 = icmp slt i32 %.0, %0
  br i1 %5, label %6, label %12

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [100 x ptr], ptr %7, i64 0, i64 %8
  store ptr null, ptr %9, align 8
  br label %10

10:                                               ; preds = %6
  %11 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

12:                                               ; preds = %4
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createNode(i32 noundef %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 16) #4
  %4 = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 0
  store i32 %0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 1
  store i32 %1, ptr %5, align 4
  %6 = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 2
  store ptr null, ptr %6, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @addEdge(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = call ptr @createNode(i32 noundef %2, i32 noundef %3)
  %6 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %7 = sext i32 %1 to i64
  %8 = getelementptr inbounds [100 x ptr], ptr %6, i64 0, i64 %7
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %5, i32 0, i32 2
  store ptr %9, ptr %10, align 8
  %11 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %12 = sext i32 %1 to i64
  %13 = getelementptr inbounds [100 x ptr], ptr %11, i64 0, i64 %12
  store ptr %5, ptr %13, align 8
  %14 = call ptr @createNode(i32 noundef %1, i32 noundef %3)
  %15 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %16 = sext i32 %2 to i64
  %17 = getelementptr inbounds [100 x ptr], ptr %15, i64 0, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 2
  store ptr %18, ptr %19, align 8
  %20 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %21 = sext i32 %2 to i64
  %22 = getelementptr inbounds [100 x ptr], ptr %20, i64 0, i64 %21
  store ptr %14, ptr %22, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printGraph(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %3

3:                                                ; preds = %25, %1
  %.01 = phi i32 [ 0, %1 ], [ %26, %25 ]
  %4 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %27

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [100 x ptr], ptr %8, i64 0, i64 %9
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %.01)
  br label %13

13:                                               ; preds = %15, %7
  %.0 = phi ptr [ %11, %7 ], [ %22, %15 ]
  %14 = icmp ne ptr %.0, null
  br i1 %14, label %15, label %23

15:                                               ; preds = %13
  %16 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %17, i32 noundef %19)
  %21 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  br label %13, !llvm.loop !8

23:                                               ; preds = %13
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %25

25:                                               ; preds = %23
  %26 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !9

27:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @dijkstra(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [100 x i32], align 16
  %4 = alloca [100 x i32], align 16
  br label %5

5:                                                ; preds = %14, %2
  %.02 = phi i32 [ 0, %2 ], [ %15, %14 ]
  %6 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp slt i32 %.02, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %5
  %10 = sext i32 %.02 to i64
  %11 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %10
  store i32 99999, ptr %11, align 4
  %12 = sext i32 %.02 to i64
  %13 = getelementptr inbounds [100 x i32], ptr %4, i64 0, i64 %12
  store i32 0, ptr %13, align 4
  br label %14

14:                                               ; preds = %9
  %15 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !10

16:                                               ; preds = %5
  %17 = sext i32 %1 to i64
  %18 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %17
  store i32 0, ptr %18, align 4
  br label %19

19:                                               ; preds = %77, %16
  %.05 = phi i32 [ undef, %16 ], [ %.16, %77 ]
  %.03 = phi i32 [ 0, %16 ], [ %78, %77 ]
  %20 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = sub nsw i32 %21, 1
  %23 = icmp slt i32 %.03, %22
  br i1 %23, label %24, label %79

24:                                               ; preds = %19
  br label %25

25:                                               ; preds = %44, %24
  %.07 = phi i32 [ 0, %24 ], [ %45, %44 ]
  %.16 = phi i32 [ %.05, %24 ], [ %.2, %44 ]
  %.04 = phi i32 [ 99999, %24 ], [ %.1, %44 ]
  %26 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 0
  %27 = load i32, ptr %26, align 8
  %28 = icmp slt i32 %.07, %27
  br i1 %28, label %29, label %46

29:                                               ; preds = %25
  %30 = sext i32 %.07 to i64
  %31 = getelementptr inbounds [100 x i32], ptr %4, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %43, label %34

34:                                               ; preds = %29
  %35 = sext i32 %.07 to i64
  %36 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = icmp slt i32 %37, %.04
  br i1 %38, label %39, label %43

39:                                               ; preds = %34
  %40 = sext i32 %.07 to i64
  %41 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  br label %43

43:                                               ; preds = %39, %34, %29
  %.2 = phi i32 [ %.16, %29 ], [ %.07, %39 ], [ %.16, %34 ]
  %.1 = phi i32 [ %.04, %29 ], [ %42, %39 ], [ %.04, %34 ]
  br label %44

44:                                               ; preds = %43
  %45 = add nsw i32 %.07, 1
  br label %25, !llvm.loop !11

46:                                               ; preds = %25
  %47 = sext i32 %.16 to i64
  %48 = getelementptr inbounds [100 x i32], ptr %4, i64 0, i64 %47
  store i32 1, ptr %48, align 4
  %49 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %50 = sext i32 %.16 to i64
  %51 = getelementptr inbounds [100 x ptr], ptr %49, i64 0, i64 %50
  %52 = load ptr, ptr %51, align 8
  br label %53

53:                                               ; preds = %73, %46
  %.01 = phi ptr [ %52, %46 ], [ %75, %73 ]
  %54 = icmp ne ptr %.01, null
  br i1 %54, label %55, label %76

55:                                               ; preds = %53
  %56 = sext i32 %.16 to i64
  %57 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 1
  %60 = load i32, ptr %59, align 4
  %61 = add nsw i32 %58, %60
  %62 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 0
  %63 = load i32, ptr %62, align 8
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = icmp slt i32 %61, %66
  br i1 %67, label %68, label %73

68:                                               ; preds = %55
  %69 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 0
  %70 = load i32, ptr %69, align 8
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %71
  store i32 %61, ptr %72, align 4
  br label %73

73:                                               ; preds = %68, %55
  %74 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 2
  %75 = load ptr, ptr %74, align 8
  br label %53, !llvm.loop !12

76:                                               ; preds = %53
  br label %77

77:                                               ; preds = %76
  %78 = add nsw i32 %.03, 1
  br label %19, !llvm.loop !13

79:                                               ; preds = %19
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %1)
  br label %81

81:                                               ; preds = %98, %79
  %.0 = phi i32 [ 0, %79 ], [ %99, %98 ]
  %82 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 0
  %83 = load i32, ptr %82, align 8
  %84 = icmp slt i32 %.0, %83
  br i1 %84, label %85, label %100

85:                                               ; preds = %81
  %86 = sext i32 %.0 to i64
  %87 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = icmp eq i32 %88, 99999
  br i1 %89, label %90, label %92

90:                                               ; preds = %85
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.0)
  br label %97

92:                                               ; preds = %85
  %93 = sext i32 %.0 to i64
  %94 = getelementptr inbounds [100 x i32], ptr %3, i64 0, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %.0, i32 noundef %95)
  br label %97

97:                                               ; preds = %92, %90
  br label %98

98:                                               ; preds = %97
  %99 = add nsw i32 %.0, 1
  br label %81, !llvm.loop !14

100:                                              ; preds = %81
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @createGraph(i32 noundef 5)
  call void @addEdge(ptr noundef %1, i32 noundef 0, i32 noundef 1, i32 noundef 10)
  call void @addEdge(ptr noundef %1, i32 noundef 0, i32 noundef 2, i32 noundef 3)
  call void @addEdge(ptr noundef %1, i32 noundef 1, i32 noundef 2, i32 noundef 1)
  call void @addEdge(ptr noundef %1, i32 noundef 1, i32 noundef 3, i32 noundef 2)
  call void @addEdge(ptr noundef %1, i32 noundef 2, i32 noundef 1, i32 noundef 4)
  call void @addEdge(ptr noundef %1, i32 noundef 2, i32 noundef 3, i32 noundef 8)
  call void @addEdge(ptr noundef %1, i32 noundef 2, i32 noundef 4, i32 noundef 2)
  call void @addEdge(ptr noundef %1, i32 noundef 3, i32 noundef 4, i32 noundef 7)
  call void @addEdge(ptr noundef %1, i32 noundef 4, i32 noundef 3, i32 noundef 9)
  call void @printGraph(ptr noundef %1)
  call void @dijkstra(ptr noundef %1, i32 noundef 0)
  br label %2

2:                                                ; preds = %15, %0
  %.01 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %3 = icmp slt i32 %.01, 5
  br i1 %3, label %4, label %17

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Graph, ptr %1, i32 0, i32 1
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds [100 x ptr], ptr %5, i64 0, i64 %6
  %8 = load ptr, ptr %7, align 8
  br label %9

9:                                                ; preds = %11, %4
  %.0 = phi ptr [ %8, %4 ], [ %13, %11 ]
  %10 = icmp ne ptr %.0, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %.0) #5
  br label %9, !llvm.loop !15

14:                                               ; preds = %9
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !16

17:                                               ; preds = %2
  call void @free(ptr noundef %1) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
