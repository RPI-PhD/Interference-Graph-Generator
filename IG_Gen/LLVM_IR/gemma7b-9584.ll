; ModuleID = 'DATASETv2/gemma7b-9584.c'
source_filename = "DATASETv2/gemma7b-9584.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.maze = type { ptr, i32, i32, i32, i32, i32, i32 }

@.str = private unnamed_addr constant [32 x i8] c"You have reached the end goal!\0A\00", align 1
@__const.traverse_maze.dx = private unnamed_addr constant [4 x i32] [i32 1, i32 0, i32 -1, i32 0], align 16
@__const.traverse_maze.dy = private unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 0, i32 -1], align 16

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_maze(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %7, ptr %5, align 8
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.maze, ptr %9, i32 0, i32 1
  store i32 %8, ptr %10, align 8
  %11 = load i32, ptr %4, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.maze, ptr %12, i32 0, i32 2
  store i32 %11, ptr %13, align 4
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 8
  %17 = call noalias ptr @malloc(i64 noundef %16) #4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.maze, ptr %18, i32 0, i32 0
  store ptr %17, ptr %19, align 8
  store i32 0, ptr %6, align 4
  br label %20

20:                                               ; preds = %35, %2
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %3, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %38

24:                                               ; preds = %20
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = mul i64 %26, 4
  %28 = call noalias ptr @malloc(i64 noundef %27) #4
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.maze, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33
  store ptr %28, ptr %34, align 8
  br label %35

35:                                               ; preds = %24
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %6, align 4
  br label %20, !llvm.loop !6

38:                                               ; preds = %20
  %39 = load ptr, ptr %5, align 8
  ret ptr %39
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @traverse_maze(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [4 x i32], align 16
  %6 = alloca [4 x i32], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.maze, ptr %10, i32 0, i32 3
  %12 = load i32, ptr %11, align 8
  store i32 %12, ptr %3, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.maze, ptr %13, i32 0, i32 4
  %15 = load i32, ptr %14, align 4
  store i32 %15, ptr %4, align 4
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.maze, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds ptr, ptr %18, i64 %20
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %22, i64 %24
  store i32 2, ptr %25, align 4
  %26 = load i32, ptr %3, align 4
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.maze, ptr %27, i32 0, i32 5
  %29 = load i32, ptr %28, align 8
  %30 = icmp eq i32 %26, %29
  br i1 %30, label %31, label %39

31:                                               ; preds = %1
  %32 = load i32, ptr %4, align 4
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.maze, ptr %33, i32 0, i32 6
  %35 = load i32, ptr %34, align 4
  %36 = icmp eq i32 %32, %35
  br i1 %36, label %37, label %39

37:                                               ; preds = %31
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %104

39:                                               ; preds = %31, %1
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.traverse_maze.dx, i64 16, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 @__const.traverse_maze.dy, i64 16, i1 false)
  store i32 0, ptr %7, align 4
  br label %40

40:                                               ; preds = %101, %39
  %41 = load i32, ptr %7, align 4
  %42 = icmp slt i32 %41, 4
  br i1 %42, label %43, label %104

43:                                               ; preds = %40
  %44 = load i32, ptr %3, align 4
  %45 = load i32, ptr %7, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [4 x i32], ptr %5, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = add nsw i32 %44, %48
  store i32 %49, ptr %8, align 4
  %50 = load i32, ptr %4, align 4
  %51 = load i32, ptr %7, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [4 x i32], ptr %6, i64 0, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = add nsw i32 %50, %54
  store i32 %55, ptr %9, align 4
  %56 = load i32, ptr %8, align 4
  %57 = icmp sge i32 %56, 0
  br i1 %57, label %58, label %100

58:                                               ; preds = %43
  %59 = load i32, ptr %8, align 4
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds %struct.maze, ptr %60, i32 0, i32 2
  %62 = load i32, ptr %61, align 4
  %63 = icmp slt i32 %59, %62
  br i1 %63, label %64, label %100

64:                                               ; preds = %58
  %65 = load i32, ptr %9, align 4
  %66 = icmp sge i32 %65, 0
  br i1 %66, label %67, label %100

67:                                               ; preds = %64
  %68 = load i32, ptr %9, align 4
  %69 = load ptr, ptr %2, align 8
  %70 = getelementptr inbounds %struct.maze, ptr %69, i32 0, i32 1
  %71 = load i32, ptr %70, align 8
  %72 = icmp slt i32 %68, %71
  br i1 %72, label %73, label %100

73:                                               ; preds = %67
  %74 = load ptr, ptr %2, align 8
  %75 = getelementptr inbounds %struct.maze, ptr %74, i32 0, i32 0
  %76 = load ptr, ptr %75, align 8
  %77 = load i32, ptr %8, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds ptr, ptr %76, i64 %78
  %80 = load ptr, ptr %79, align 8
  %81 = load i32, ptr %9, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, ptr %80, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = icmp ne i32 %84, 1
  br i1 %85, label %86, label %100

86:                                               ; preds = %73
  %87 = load i32, ptr %8, align 4
  store i32 %87, ptr %3, align 4
  %88 = load i32, ptr %9, align 4
  store i32 %88, ptr %4, align 4
  %89 = load ptr, ptr %2, align 8
  %90 = getelementptr inbounds %struct.maze, ptr %89, i32 0, i32 0
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %3, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds ptr, ptr %91, i64 %93
  %95 = load ptr, ptr %94, align 8
  %96 = load i32, ptr %4, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, ptr %95, i64 %97
  store i32 2, ptr %98, align 4
  %99 = load ptr, ptr %2, align 8
  call void @traverse_maze(ptr noundef %99)
  br label %100

100:                                              ; preds = %86, %73, %67, %64, %58, %43
  br label %101

101:                                              ; preds = %100
  %102 = load i32, ptr %7, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %7, align 4
  br label %40, !llvm.loop !8

104:                                              ; preds = %37, %40
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @create_maze(i32 noundef 5, i32 noundef 5)
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.maze, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds ptr, ptr %6, i64 2
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds i32, ptr %8, i64 2
  store i32 2, ptr %9, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.maze, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 3
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds i32, ptr %14, i64 2
  store i32 2, ptr %15, align 4
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.maze, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 3
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds i32, ptr %20, i64 3
  store i32 2, ptr %21, align 4
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.maze, ptr %22, i32 0, i32 3
  store i32 0, ptr %23, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.maze, ptr %24, i32 0, i32 4
  store i32 0, ptr %25, align 4
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.maze, ptr %26, i32 0, i32 5
  store i32 4, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.maze, ptr %28, i32 0, i32 6
  store i32 4, ptr %29, align 4
  %30 = load ptr, ptr %2, align 8
  call void @traverse_maze(ptr noundef %30)
  ret i32 0
}

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
