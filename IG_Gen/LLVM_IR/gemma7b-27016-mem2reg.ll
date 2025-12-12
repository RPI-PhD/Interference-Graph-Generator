; ModuleID = 'LLVM_IR/gemma7b-27016.ll'
source_filename = "DATASETv2/gemma7b-27016.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, i32, ptr }

@.str = private unnamed_addr constant [3 x i8] c"O \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @createMaze(ptr noundef %0) #0 {
  store ptr null, ptr %0, align 8
  br label %2

2:                                                ; preds = %22, %1
  %.01 = phi i32 [ 0, %1 ], [ %23, %22 ]
  %3 = icmp slt i32 %.01, 10
  br i1 %3, label %4, label %24

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %19, %4
  %.0 = phi i32 [ 0, %4 ], [ %20, %19 ]
  %6 = icmp slt i32 %.0, 10
  br i1 %6, label %7, label %21

7:                                                ; preds = %5
  %8 = call noalias ptr @malloc(i64 noundef 16) #3
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 0
  store i32 %.01, ptr %9, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 1
  store i32 %.0, ptr %10, align 4
  %11 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 2
  store ptr null, ptr %11, align 8
  %12 = load ptr, ptr %0, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %7
  store ptr %8, ptr %0, align 8
  br label %18

15:                                               ; preds = %7
  %16 = load ptr, ptr %0, align 8
  %17 = getelementptr inbounds %struct.Node, ptr %16, i32 0, i32 2
  store ptr %8, ptr %17, align 8
  store ptr %8, ptr %0, align 8
  br label %18

18:                                               ; preds = %15, %14
  br label %19

19:                                               ; preds = %18
  %20 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

21:                                               ; preds = %5
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

24:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMaze(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %28, %1
  %.01 = phi i32 [ 0, %1 ], [ %29, %28 ]
  %3 = icmp slt i32 %.01, 10
  br i1 %3, label %4, label %30

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %24, %4
  %.0 = phi i32 [ 0, %4 ], [ %25, %24 ]
  %6 = icmp slt i32 %.0, 10
  br i1 %6, label %7, label %26

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %22, %7
  %9 = icmp ne ptr %0, null
  br i1 %9, label %10, label %23

10:                                               ; preds = %8
  %11 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, %.01
  br i1 %13, label %14, label %20

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = icmp eq i32 %16, %.0
  br i1 %17, label %18, label %20

18:                                               ; preds = %14
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %22

20:                                               ; preds = %14, %10
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %22

22:                                               ; preds = %20, %18
  br label %8, !llvm.loop !9

23:                                               ; preds = %8
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !10

26:                                               ; preds = %5
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %28

28:                                               ; preds = %26
  %29 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !11

30:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @createMaze(ptr noundef %1)
  %2 = load ptr, ptr %1, align 8
  call void @printMaze(ptr noundef %2)
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
