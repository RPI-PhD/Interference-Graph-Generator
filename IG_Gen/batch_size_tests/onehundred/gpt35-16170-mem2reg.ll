; ModuleID = 'LLVM_IR/gpt35-16170.ll'
source_filename = "DATASETv2/gpt35-16170.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { i32, i32, [50 x %struct.Edge] }
%struct.Edge = type { i32, i32, i32 }

@.str = private unnamed_addr constant [24 x i8] c"Number of vertices: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Number of edges: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Edges:\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"%d -- (%d) -- %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createGraph(i32 noundef %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 608) #3
  %4 = getelementptr inbounds %struct.Graph, ptr %3, i32 0, i32 0
  store i32 %0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.Graph, ptr %3, i32 0, i32 1
  store i32 %1, ptr %5, align 4
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addEdge(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 2
  %6 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [50 x %struct.Edge], ptr %5, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Edge, ptr %9, i32 0, i32 0
  store i32 %1, ptr %10, align 4
  %11 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 2
  %12 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [50 x %struct.Edge], ptr %11, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Edge, ptr %15, i32 0, i32 1
  store i32 %2, ptr %16, align 4
  %17 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 2
  %18 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [50 x %struct.Edge], ptr %17, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Edge, ptr %21, i32 0, i32 2
  store i32 %3, ptr %22, align 4
  %23 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %23, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printGraph(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  %5 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %9

9:                                                ; preds = %30, %1
  %.0 = phi i32 [ 0, %1 ], [ %31, %30 ]
  %10 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %.0, %11
  br i1 %12, label %13, label %32

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 2
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [50 x %struct.Edge], ptr %14, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Edge, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 2
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [50 x %struct.Edge], ptr %19, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Edge, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr inbounds %struct.Graph, ptr %0, i32 0, i32 2
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds [50 x %struct.Edge], ptr %24, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.Edge, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %27, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %18, i32 noundef %23, i32 noundef %28)
  br label %30

30:                                               ; preds = %13
  %31 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !6

32:                                               ; preds = %9
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @createGraph(i32 noundef 5, i32 noundef 7)
  call void @addEdge(ptr noundef %1, i32 noundef 0, i32 noundef 1, i32 noundef 2)
  call void @addEdge(ptr noundef %1, i32 noundef 0, i32 noundef 2, i32 noundef 3)
  call void @addEdge(ptr noundef %1, i32 noundef 1, i32 noundef 2, i32 noundef 4)
  call void @addEdge(ptr noundef %1, i32 noundef 1, i32 noundef 3, i32 noundef 5)
  call void @addEdge(ptr noundef %1, i32 noundef 2, i32 noundef 3, i32 noundef 6)
  call void @addEdge(ptr noundef %1, i32 noundef 2, i32 noundef 4, i32 noundef 7)
  call void @addEdge(ptr noundef %1, i32 noundef 3, i32 noundef 4, i32 noundef 8)
  call void @printGraph(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) }

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
