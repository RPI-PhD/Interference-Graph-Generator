; ModuleID = 'LLVM_IR/gpt35-57607.ll'
source_filename = "DATASETv2/gpt35-57607.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Vertex   Distance  Path\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"%d          %d      %d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__const.main.graph = private unnamed_addr constant [6 x [6 x i32]] [[6 x i32] [i32 0, i32 1, i32 4, i32 0, i32 0, i32 0], [6 x i32] [i32 1, i32 0, i32 4, i32 2, i32 7, i32 0], [6 x i32] [i32 4, i32 4, i32 0, i32 3, i32 5, i32 0], [6 x i32] [i32 0, i32 2, i32 3, i32 0, i32 4, i32 6], [6 x i32] [i32 0, i32 7, i32 5, i32 4, i32 0, i32 7], [6 x i32] [i32 0, i32 0, i32 0, i32 6, i32 7, i32 0]], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minDistance(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %20, %2
  %.02 = phi i32 [ 2147483647, %2 ], [ %.13, %20 ]
  %.01 = phi i32 [ undef, %2 ], [ %.1, %20 ]
  %.0 = phi i32 [ 0, %2 ], [ %21, %20 ]
  %4 = icmp slt i32 %.0, 6
  br i1 %4, label %5, label %22

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i32, ptr %1, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %19

10:                                               ; preds = %5
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds i32, ptr %0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = icmp sle i32 %13, %.02
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds i32, ptr %0, i64 %16
  %18 = load i32, ptr %17, align 4
  br label %19

19:                                               ; preds = %15, %10, %5
  %.13 = phi i32 [ %18, %15 ], [ %.02, %10 ], [ %.02, %5 ]
  %.1 = phi i32 [ %.0, %15 ], [ %.01, %10 ], [ %.01, %5 ]
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

22:                                               ; preds = %3
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printPath(ptr noundef %0, i32 noundef %1) #0 {
  %3 = sext i32 %1 to i64
  %4 = getelementptr inbounds i32, ptr %0, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %13

8:                                                ; preds = %2
  %9 = sext i32 %1 to i64
  %10 = getelementptr inbounds i32, ptr %0, i64 %9
  %11 = load i32, ptr %10, align 4
  call void @printPath(ptr noundef %0, i32 noundef %11)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %1)
  br label %13

13:                                               ; preds = %8, %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @printSolution(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %6

6:                                                ; preds = %17, %4
  %.0 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %7 = icmp slt i32 %.0, 6
  br i1 %7, label %8, label %19

8:                                                ; preds = %6
  %9 = icmp eq i32 %.0, %3
  br i1 %9, label %10, label %11

10:                                               ; preds = %8
  br label %17

11:                                               ; preds = %8
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %.0, i32 noundef %14, i32 noundef %3)
  call void @printPath(ptr noundef %2, i32 noundef %.0)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %17

17:                                               ; preds = %11, %10
  %18 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

19:                                               ; preds = %6
  ret i32 undef
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dijkstra(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [6 x i32], align 16
  %4 = alloca [6 x i32], align 16
  %5 = alloca [6 x i32], align 16
  br label %6

6:                                                ; preds = %15, %2
  %.02 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %7 = icmp slt i32 %.02, 6
  br i1 %7, label %8, label %17

8:                                                ; preds = %6
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %9
  store i32 2147483647, ptr %10, align 4
  %11 = sext i32 %.02 to i64
  %12 = getelementptr inbounds [6 x i32], ptr %4, i64 0, i64 %11
  store i32 0, ptr %12, align 4
  %13 = sext i32 %.02 to i64
  %14 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %13
  store i32 -1, ptr %14, align 4
  br label %15

15:                                               ; preds = %8
  %16 = add nsw i32 %.02, 1
  br label %6, !llvm.loop !9

17:                                               ; preds = %6
  %18 = sext i32 %1 to i64
  %19 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %18
  store i32 0, ptr %19, align 4
  br label %20

20:                                               ; preds = %79, %17
  %.01 = phi i32 [ 0, %17 ], [ %80, %79 ]
  %21 = icmp slt i32 %.01, 5
  br i1 %21, label %22, label %81

22:                                               ; preds = %20
  %23 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 0
  %24 = getelementptr inbounds [6 x i32], ptr %4, i64 0, i64 0
  %25 = call i32 @minDistance(ptr noundef %23, ptr noundef %24)
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [6 x i32], ptr %4, i64 0, i64 %26
  store i32 1, ptr %27, align 4
  br label %28

28:                                               ; preds = %76, %22
  %.0 = phi i32 [ 0, %22 ], [ %77, %76 ]
  %29 = icmp slt i32 %.0, 6
  br i1 %29, label %30, label %78

30:                                               ; preds = %28
  %31 = sext i32 %25 to i64
  %32 = getelementptr inbounds [6 x i32], ptr %0, i64 %31
  %33 = sext i32 %.0 to i64
  %34 = getelementptr inbounds [6 x i32], ptr %32, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %75

37:                                               ; preds = %30
  %38 = sext i32 %.0 to i64
  %39 = getelementptr inbounds [6 x i32], ptr %4, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %75

42:                                               ; preds = %37
  %43 = sext i32 %25 to i64
  %44 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = icmp ne i32 %45, 2147483647
  br i1 %46, label %47, label %75

47:                                               ; preds = %42
  %48 = sext i32 %25 to i64
  %49 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = sext i32 %25 to i64
  %52 = getelementptr inbounds [6 x i32], ptr %0, i64 %51
  %53 = sext i32 %.0 to i64
  %54 = getelementptr inbounds [6 x i32], ptr %52, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = add nsw i32 %50, %55
  %57 = sext i32 %.0 to i64
  %58 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = icmp slt i32 %56, %59
  br i1 %60, label %61, label %75

61:                                               ; preds = %47
  %62 = sext i32 %.0 to i64
  %63 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 %62
  store i32 %25, ptr %63, align 4
  %64 = sext i32 %25 to i64
  %65 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = sext i32 %25 to i64
  %68 = getelementptr inbounds [6 x i32], ptr %0, i64 %67
  %69 = sext i32 %.0 to i64
  %70 = getelementptr inbounds [6 x i32], ptr %68, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = add nsw i32 %66, %71
  %73 = sext i32 %.0 to i64
  %74 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 %73
  store i32 %72, ptr %74, align 4
  br label %75

75:                                               ; preds = %61, %47, %42, %37, %30
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.0, 1
  br label %28, !llvm.loop !10

78:                                               ; preds = %28
  br label %79

79:                                               ; preds = %78
  %80 = add nsw i32 %.01, 1
  br label %20, !llvm.loop !11

81:                                               ; preds = %20
  %82 = getelementptr inbounds [6 x i32], ptr %3, i64 0, i64 0
  %83 = getelementptr inbounds [6 x i32], ptr %5, i64 0, i64 0
  %84 = call i32 @printSolution(ptr noundef %82, i32 noundef 6, ptr noundef %83, i32 noundef %1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [6 x [6 x i32]], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.graph, i64 144, i1 false)
  %2 = getelementptr inbounds [6 x [6 x i32]], ptr %1, i64 0, i64 0
  call void @dijkstra(ptr noundef %2, i32 noundef 0)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
