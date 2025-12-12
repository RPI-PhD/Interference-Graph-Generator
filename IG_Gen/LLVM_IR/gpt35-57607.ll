; ModuleID = 'DATASETv2/gpt35-57607.c'
source_filename = "DATASETv2/gpt35-57607.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Vertex   Distance  Path\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"%d          %d      %d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.graph = private unnamed_addr constant [6 x [6 x i32]] [[6 x i32] [i32 0, i32 1, i32 4, i32 0, i32 0, i32 0], [6 x i32] [i32 1, i32 0, i32 4, i32 2, i32 7, i32 0], [6 x i32] [i32 4, i32 4, i32 0, i32 3, i32 5, i32 0], [6 x i32] [i32 0, i32 2, i32 3, i32 0, i32 4, i32 6], [6 x i32] [i32 0, i32 7, i32 5, i32 4, i32 0, i32 7], [6 x i32] [i32 0, i32 0, i32 0, i32 6, i32 7, i32 0]], align 16

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @minDistance(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 2147483647, ptr %5, align 4
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %34, %2
  %9 = load i32, ptr %7, align 4
  %10 = icmp slt i32 %9, 6
  br i1 %10, label %11, label %37

11:                                               ; preds = %8
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %33

18:                                               ; preds = %11
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %5, align 4
  %25 = icmp sle i32 %23, %24
  br i1 %25, label %26, label %33

26:                                               ; preds = %18
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  %31 = load i32, ptr %30, align 4
  store i32 %31, ptr %5, align 4
  %32 = load i32, ptr %7, align 4
  store i32 %32, ptr %6, align 4
  br label %33

33:                                               ; preds = %26, %18, %11
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %7, align 4
  br label %8, !llvm.loop !6

37:                                               ; preds = %8
  %38 = load i32, ptr %6, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printPath(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32, ptr %5, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  br label %21

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %14, i64 %16
  %18 = load i32, ptr %17, align 4
  call void @printPath(ptr noundef %13, i32 noundef %18)
  %19 = load i32, ptr %4, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %19)
  br label %21

21:                                               ; preds = %12, %11
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @printSolution(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %10, align 4
  br label %12

12:                                               ; preds = %32, %4
  %13 = load i32, ptr %10, align 4
  %14 = icmp slt i32 %13, 6
  br i1 %14, label %15, label %35

15:                                               ; preds = %12
  %16 = load i32, ptr %10, align 4
  %17 = load i32, ptr %9, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  br label %32

20:                                               ; preds = %15
  %21 = load i32, ptr %10, align 4
  %22 = load ptr, ptr %6, align 8
  %23 = load i32, ptr %10, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr %22, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = load i32, ptr %9, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %21, i32 noundef %26, i32 noundef %27)
  %29 = load ptr, ptr %8, align 8
  %30 = load i32, ptr %10, align 4
  call void @printPath(ptr noundef %29, i32 noundef %30)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %32

32:                                               ; preds = %20, %19
  %33 = load i32, ptr %10, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %10, align 4
  br label %12, !llvm.loop !8

35:                                               ; preds = %12
  %36 = load i32, ptr %5, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @dijkstra(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [6 x i32], align 16
  %6 = alloca [6 x i32], align 16
  %7 = alloca [6 x i32], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %8, align 4
  br label %12

12:                                               ; preds = %25, %2
  %13 = load i32, ptr %8, align 4
  %14 = icmp slt i32 %13, 6
  br i1 %14, label %15, label %28

15:                                               ; preds = %12
  %16 = load i32, ptr %8, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %17
  store i32 2147483647, ptr %18, align 4
  %19 = load i32, ptr %8, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [6 x i32], ptr %6, i64 0, i64 %20
  store i32 0, ptr %21, align 4
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [6 x i32], ptr %7, i64 0, i64 %23
  store i32 -1, ptr %24, align 4
  br label %25

25:                                               ; preds = %15
  %26 = load i32, ptr %8, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %8, align 4
  br label %12, !llvm.loop !9

28:                                               ; preds = %12
  %29 = load i32, ptr %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %30
  store i32 0, ptr %31, align 4
  store i32 0, ptr %9, align 4
  br label %32

32:                                               ; preds = %112, %28
  %33 = load i32, ptr %9, align 4
  %34 = icmp slt i32 %33, 5
  br i1 %34, label %35, label %115

35:                                               ; preds = %32
  %36 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 0
  %37 = getelementptr inbounds [6 x i32], ptr %6, i64 0, i64 0
  %38 = call i32 @minDistance(ptr noundef %36, ptr noundef %37)
  store i32 %38, ptr %10, align 4
  %39 = load i32, ptr %10, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [6 x i32], ptr %6, i64 0, i64 %40
  store i32 1, ptr %41, align 4
  store i32 0, ptr %11, align 4
  br label %42

42:                                               ; preds = %108, %35
  %43 = load i32, ptr %11, align 4
  %44 = icmp slt i32 %43, 6
  br i1 %44, label %45, label %111

45:                                               ; preds = %42
  %46 = load ptr, ptr %3, align 8
  %47 = load i32, ptr %10, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [6 x i32], ptr %46, i64 %48
  %50 = load i32, ptr %11, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [6 x i32], ptr %49, i64 0, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %107

55:                                               ; preds = %45
  %56 = load i32, ptr %11, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [6 x i32], ptr %6, i64 0, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %107

61:                                               ; preds = %55
  %62 = load i32, ptr %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = icmp ne i32 %65, 2147483647
  br i1 %66, label %67, label %107

67:                                               ; preds = %61
  %68 = load i32, ptr %10, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load ptr, ptr %3, align 8
  %73 = load i32, ptr %10, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [6 x i32], ptr %72, i64 %74
  %76 = load i32, ptr %11, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [6 x i32], ptr %75, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = add nsw i32 %71, %79
  %81 = load i32, ptr %11, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = icmp slt i32 %80, %84
  br i1 %85, label %86, label %107

86:                                               ; preds = %67
  %87 = load i32, ptr %10, align 4
  %88 = load i32, ptr %11, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [6 x i32], ptr %7, i64 0, i64 %89
  store i32 %87, ptr %90, align 4
  %91 = load i32, ptr %10, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %92
  %94 = load i32, ptr %93, align 4
  %95 = load ptr, ptr %3, align 8
  %96 = load i32, ptr %10, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [6 x i32], ptr %95, i64 %97
  %99 = load i32, ptr %11, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [6 x i32], ptr %98, i64 0, i64 %100
  %102 = load i32, ptr %101, align 4
  %103 = add nsw i32 %94, %102
  %104 = load i32, ptr %11, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %105
  store i32 %103, ptr %106, align 4
  br label %107

107:                                              ; preds = %86, %67, %61, %55, %45
  br label %108

108:                                              ; preds = %107
  %109 = load i32, ptr %11, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %11, align 4
  br label %42, !llvm.loop !10

111:                                              ; preds = %42
  br label %112

112:                                              ; preds = %111
  %113 = load i32, ptr %9, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %9, align 4
  br label %32, !llvm.loop !11

115:                                              ; preds = %32
  %116 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 0
  %117 = getelementptr inbounds [6 x i32], ptr %7, i64 0, i64 0
  %118 = load i32, ptr %4, align 4
  %119 = call i32 @printSolution(ptr noundef %116, i32 noundef 6, ptr noundef %117, i32 noundef %118)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [6 x [6 x i32]], align 16
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.graph, i64 144, i1 false)
  %3 = getelementptr inbounds [6 x [6 x i32]], ptr %2, i64 0, i64 0
  call void @dijkstra(ptr noundef %3, i32 noundef 0)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
