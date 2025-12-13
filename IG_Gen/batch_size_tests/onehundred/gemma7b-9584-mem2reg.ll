; ModuleID = 'LLVM_IR/gemma7b-9584.ll'
source_filename = "DATASETv2/gemma7b-9584.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.maze = type { ptr, i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [32 x i8] c"You have reached the end goal!\0A\00", align 1
@__const.traverse_maze.dx = private unnamed_addr constant [4 x i32] [i32 1, i32 0, i32 -1, i32 0], align 16
@__const.traverse_maze.dy = private unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 0, i32 -1], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_maze(i32 noundef %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 32) #4
  %4 = getelementptr inbounds %struct.maze, ptr %3, i32 0, i32 1
  store i32 %0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.maze, ptr %3, i32 0, i32 2
  store i32 %1, ptr %5, align 4
  %6 = sext i32 %0 to i64
  %7 = mul i64 %6, 8
  %8 = call noalias ptr @malloc(i64 noundef %7) #4
  %9 = getelementptr inbounds %struct.maze, ptr %3, i32 0, i32 0
  store ptr %8, ptr %9, align 8
  br label %10

10:                                               ; preds = %20, %2
  %.0 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %11 = icmp slt i32 %.0, %0
  br i1 %11, label %12, label %22

12:                                               ; preds = %10
  %13 = sext i32 %1 to i64
  %14 = mul i64 %13, 4
  %15 = call noalias ptr @malloc(i64 noundef %14) #4
  %16 = getelementptr inbounds %struct.maze, ptr %3, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds ptr, ptr %17, i64 %18
  store ptr %15, ptr %19, align 8
  br label %20

20:                                               ; preds = %12
  %21 = add nsw i32 %.0, 1
  br label %10, !llvm.loop !6

22:                                               ; preds = %10
  ret ptr %3
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @traverse_maze(ptr noundef %0) #0 {
  %2 = alloca [4 x i32], align 16
  %3 = alloca [4 x i32], align 16
  %4 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 3
  %5 = load i32, ptr %4, align 8
  %6 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 4
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = sext i32 %5 to i64
  %11 = getelementptr inbounds ptr, ptr %9, i64 %10
  %12 = load ptr, ptr %11, align 8
  %13 = sext i32 %7 to i64
  %14 = getelementptr inbounds i32, ptr %12, i64 %13
  store i32 2, ptr %14, align 4
  %15 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 5
  %16 = load i32, ptr %15, align 8
  %17 = icmp eq i32 %5, %16
  br i1 %17, label %18, label %24

18:                                               ; preds = %1
  %19 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 6
  %20 = load i32, ptr %19, align 4
  %21 = icmp eq i32 %7, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %18
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %68

24:                                               ; preds = %18, %1
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.traverse_maze.dx, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.traverse_maze.dy, i64 16, i1 false)
  br label %25

25:                                               ; preds = %66, %24
  %.02 = phi i32 [ %7, %24 ], [ %.13, %66 ]
  %.01 = phi i32 [ %5, %24 ], [ %.1, %66 ]
  %.0 = phi i32 [ 0, %24 ], [ %67, %66 ]
  %26 = icmp slt i32 %.0, 4
  br i1 %26, label %27, label %68

27:                                               ; preds = %25
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [4 x i32], ptr %2, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %.01, %30
  %32 = sext i32 %.0 to i64
  %33 = getelementptr inbounds [4 x i32], ptr %3, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = add nsw i32 %.02, %34
  %36 = icmp sge i32 %31, 0
  br i1 %36, label %37, label %65

37:                                               ; preds = %27
  %38 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 2
  %39 = load i32, ptr %38, align 4
  %40 = icmp slt i32 %31, %39
  br i1 %40, label %41, label %65

41:                                               ; preds = %37
  %42 = icmp sge i32 %35, 0
  br i1 %42, label %43, label %65

43:                                               ; preds = %41
  %44 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 1
  %45 = load i32, ptr %44, align 8
  %46 = icmp slt i32 %35, %45
  br i1 %46, label %47, label %65

47:                                               ; preds = %43
  %48 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = sext i32 %31 to i64
  %51 = getelementptr inbounds ptr, ptr %49, i64 %50
  %52 = load ptr, ptr %51, align 8
  %53 = sext i32 %35 to i64
  %54 = getelementptr inbounds i32, ptr %52, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = icmp ne i32 %55, 1
  br i1 %56, label %57, label %65

57:                                               ; preds = %47
  %58 = getelementptr inbounds %struct.maze, ptr %0, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = sext i32 %31 to i64
  %61 = getelementptr inbounds ptr, ptr %59, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = sext i32 %35 to i64
  %64 = getelementptr inbounds i32, ptr %62, i64 %63
  store i32 2, ptr %64, align 4
  call void @traverse_maze(ptr noundef %0)
  br label %65

65:                                               ; preds = %57, %47, %43, %41, %37, %27
  %.13 = phi i32 [ %35, %57 ], [ %.02, %47 ], [ %.02, %43 ], [ %.02, %41 ], [ %.02, %37 ], [ %.02, %27 ]
  %.1 = phi i32 [ %31, %57 ], [ %.01, %47 ], [ %.01, %43 ], [ %.01, %41 ], [ %.01, %37 ], [ %.01, %27 ]
  br label %66

66:                                               ; preds = %65
  %67 = add nsw i32 %.0, 1
  br label %25, !llvm.loop !8

68:                                               ; preds = %25, %22
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_maze(i32 noundef 5, i32 noundef 5)
  %2 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds ptr, ptr %3, i64 2
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i32, ptr %5, i64 2
  store i32 2, ptr %6, align 4
  %7 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds ptr, ptr %8, i64 3
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds i32, ptr %10, i64 2
  store i32 2, ptr %11, align 4
  %12 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds ptr, ptr %13, i64 3
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds i32, ptr %15, i64 3
  store i32 2, ptr %16, align 4
  %17 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 3
  store i32 0, ptr %17, align 8
  %18 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 4
  store i32 0, ptr %18, align 4
  %19 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 5
  store i32 4, ptr %19, align 8
  %20 = getelementptr inbounds %struct.maze, ptr %1, i32 0, i32 6
  store i32 4, ptr %20, align 4
  call void @traverse_maze(ptr noundef %1)
  ret i32 0
}

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
