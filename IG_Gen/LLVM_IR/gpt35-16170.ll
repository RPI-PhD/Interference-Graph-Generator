; ModuleID = 'DATASETv2/gpt35-16170.c'
source_filename = "DATASETv2/gpt35-16170.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { i32, i32, [50 x %struct.Edge] }
%struct.Edge = type { i32, i32, i32 }

@.str = private unnamed_addr constant [24 x i8] c"Number of vertices: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Number of edges: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Edges:\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"%d -- (%d) -- %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createGraph(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 608) #3
  store ptr %6, ptr %5, align 8
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.Graph, ptr %8, i32 0, i32 0
  store i32 %7, ptr %9, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.Graph, ptr %11, i32 0, i32 1
  store i32 %10, ptr %12, align 4
  %13 = load ptr, ptr %5, align 8
  ret ptr %13
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addEdge(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load i32, ptr %6, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.Graph, ptr %10, i32 0, i32 2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.Graph, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [50 x %struct.Edge], ptr %11, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Edge, ptr %16, i32 0, i32 0
  store i32 %9, ptr %17, align 4
  %18 = load i32, ptr %7, align 4
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.Graph, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.Graph, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [50 x %struct.Edge], ptr %20, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Edge, ptr %25, i32 0, i32 1
  store i32 %18, ptr %26, align 4
  %27 = load i32, ptr %8, align 4
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds %struct.Graph, ptr %28, i32 0, i32 2
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.Graph, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [50 x %struct.Edge], ptr %29, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.Edge, ptr %34, i32 0, i32 2
  store i32 %27, ptr %35, align 4
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.Graph, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %37, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printGraph(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Graph, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %6)
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Graph, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %3, align 4
  br label %13

13:                                               ; preds = %42, %1
  %14 = load i32, ptr %3, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.Graph, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %45

19:                                               ; preds = %13
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.Graph, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [50 x %struct.Edge], ptr %21, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.Edge, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.Graph, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [50 x %struct.Edge], ptr %28, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Edge, ptr %31, i32 0, i32 2
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.Graph, ptr %34, i32 0, i32 2
  %36 = load i32, ptr %3, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [50 x %struct.Edge], ptr %35, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.Edge, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %39, align 4
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %26, i32 noundef %33, i32 noundef %40)
  br label %42

42:                                               ; preds = %19
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %3, align 4
  br label %13, !llvm.loop !6

45:                                               ; preds = %13
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @createGraph(i32 noundef 5, i32 noundef 7)
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %4, i32 noundef 0, i32 noundef 1, i32 noundef 2)
  %5 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %5, i32 noundef 0, i32 noundef 2, i32 noundef 3)
  %6 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %6, i32 noundef 1, i32 noundef 2, i32 noundef 4)
  %7 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %7, i32 noundef 1, i32 noundef 3, i32 noundef 5)
  %8 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %8, i32 noundef 2, i32 noundef 3, i32 noundef 6)
  %9 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %9, i32 noundef 2, i32 noundef 4, i32 noundef 7)
  %10 = load ptr, ptr %2, align 8
  call void @addEdge(ptr noundef %10, i32 noundef 3, i32 noundef 4, i32 noundef 8)
  %11 = load ptr, ptr %2, align 8
  call void @printGraph(ptr noundef %11)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
