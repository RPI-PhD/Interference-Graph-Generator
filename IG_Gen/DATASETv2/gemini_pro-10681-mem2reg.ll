; ModuleID = 'DATASETv2/gemini_pro-10681.ll'
source_filename = "DATASETv2/gemini_pro-10681.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.task = type { i32, i32, i32, i32, i32 }
%struct.queue = type { ptr, i32, i32, i32 }

@.str = private unnamed_addr constant [28 x i8] c"Average waiting time: %.2f\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"Average turnaround time: %.2f\0A\00", align 1
@__const.main.tasks = private unnamed_addr constant [5 x %struct.task] [%struct.task { i32 1, i32 0, i32 3, i32 0, i32 0 }, %struct.task { i32 2, i32 2, i32 6, i32 0, i32 0 }, %struct.task { i32 3, i32 4, i32 4, i32 0, i32 0 }, %struct.task { i32 4, i32 6, i32 5, i32 0, i32 0 }, %struct.task { i32 5, i32 8, i32 2, i32 0, i32 0 }], align 16
@.str.2 = private unnamed_addr constant [19 x i8] c"Executing task %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createQueue(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 24) #4
  %3 = sext i32 %0 to i64
  %4 = mul i64 20, %3
  %5 = call noalias ptr @malloc(i64 noundef %4) #4
  %6 = getelementptr inbounds %struct.queue, ptr %2, i32 0, i32 0
  store ptr %5, ptr %6, align 8
  %7 = getelementptr inbounds %struct.queue, ptr %2, i32 0, i32 1
  store i32 -1, ptr %7, align 8
  %8 = getelementptr inbounds %struct.queue, ptr %2, i32 0, i32 2
  store i32 -1, ptr %8, align 4
  %9 = getelementptr inbounds %struct.queue, ptr %2, i32 0, i32 3
  store i32 %0, ptr %9, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @isEmpty(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 1
  %3 = load i32, ptr %2, align 8
  %4 = icmp eq i32 %3, -1
  ret i1 %4
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @isFull(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 2
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 3
  %5 = load i32, ptr %4, align 8
  %6 = sub nsw i32 %5, 1
  %7 = icmp eq i32 %3, %6
  ret i1 %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @enqueue(ptr noundef %0, ptr noundef byval(%struct.task) align 8 %1) #0 {
  %3 = call zeroext i1 @isFull(ptr noundef %0)
  br i1 %3, label %20, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 2
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 1
  store i32 0, ptr %9, align 8
  br label %10

10:                                               ; preds = %8, %4
  %11 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 2
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %11, align 4
  %14 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.queue, ptr %0, i32 0, i32 2
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.task, ptr %15, i64 %18
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %19, ptr align 8 %1, i64 20, i1 false)
  br label %20

20:                                               ; preds = %10, %2
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @dequeue(ptr dead_on_unwind noalias writable sret(%struct.task) align 4 %0, ptr noundef %1) #0 {
  %3 = call zeroext i1 @isEmpty(ptr noundef %1)
  br i1 %3, label %24, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.task, ptr %6, i64 %9
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %0, ptr align 4 %10, i64 20, i1 false)
  %11 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = icmp eq i32 %12, %14
  br i1 %15, label %16, label %19

16:                                               ; preds = %4
  %17 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 1
  store i32 -1, ptr %17, align 8
  %18 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 2
  store i32 -1, ptr %18, align 4
  br label %23

19:                                               ; preds = %4
  %20 = getelementptr inbounds %struct.queue, ptr %1, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %20, align 8
  br label %23

23:                                               ; preds = %19, %16
  br label %24

24:                                               ; preds = %23, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @sortTasksByArrivalTime(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.task, align 4
  br label %4

4:                                                ; preds = %34, %2
  %.01 = phi i32 [ 0, %2 ], [ %35, %34 ]
  %5 = sub nsw i32 %1, 1
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %36

7:                                                ; preds = %4
  %8 = add nsw i32 %.01, 1
  br label %9

9:                                                ; preds = %31, %7
  %.0 = phi i32 [ %8, %7 ], [ %32, %31 ]
  %10 = icmp slt i32 %.0, %1
  br i1 %10, label %11, label %33

11:                                               ; preds = %9
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds %struct.task, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.task, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds %struct.task, ptr %0, i64 %16
  %18 = getelementptr inbounds %struct.task, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = icmp sgt i32 %15, %19
  br i1 %20, label %21, label %30

21:                                               ; preds = %11
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds %struct.task, ptr %0, i64 %22
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %23, i64 20, i1 false)
  %24 = sext i32 %.01 to i64
  %25 = getelementptr inbounds %struct.task, ptr %0, i64 %24
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds %struct.task, ptr %0, i64 %26
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %25, ptr align 4 %27, i64 20, i1 false)
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds %struct.task, ptr %0, i64 %28
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %29, ptr align 4 %3, i64 20, i1 false)
  br label %30

30:                                               ; preds = %21, %11
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !6

33:                                               ; preds = %9
  br label %34

34:                                               ; preds = %33
  %35 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

36:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @calculateTaskMetrics(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %42, %2
  %.01 = phi i32 [ 0, %2 ], [ %.1, %42 ]
  %.0 = phi i32 [ 0, %2 ], [ %43, %42 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %44

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.task, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.task, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %.01, %9
  br i1 %10, label %11, label %16

11:                                               ; preds = %5
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds %struct.task, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.task, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  br label %16

16:                                               ; preds = %11, %5
  %.1 = phi i32 [ %15, %11 ], [ %.01, %5 ]
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds %struct.task, ptr %0, i64 %17
  %19 = getelementptr inbounds %struct.task, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 4
  %21 = add nsw i32 %.1, %20
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds %struct.task, ptr %0, i64 %22
  %24 = getelementptr inbounds %struct.task, ptr %23, i32 0, i32 3
  store i32 %21, ptr %24, align 4
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds %struct.task, ptr %0, i64 %25
  %27 = getelementptr inbounds %struct.task, ptr %26, i32 0, i32 3
  %28 = load i32, ptr %27, align 4
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds %struct.task, ptr %0, i64 %29
  %31 = getelementptr inbounds %struct.task, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = sub nsw i32 %28, %32
  %34 = sext i32 %.0 to i64
  %35 = getelementptr inbounds %struct.task, ptr %0, i64 %34
  %36 = getelementptr inbounds %struct.task, ptr %35, i32 0, i32 2
  %37 = load i32, ptr %36, align 4
  %38 = sub nsw i32 %33, %37
  %39 = sext i32 %.0 to i64
  %40 = getelementptr inbounds %struct.task, ptr %0, i64 %39
  %41 = getelementptr inbounds %struct.task, ptr %40, i32 0, i32 4
  store i32 %38, ptr %41, align 4
  br label %42

42:                                               ; preds = %16
  %43 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

44:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @calculateAverageMetrics(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %21, %2
  %.02 = phi i32 [ 0, %2 ], [ %10, %21 ]
  %.01 = phi i32 [ 0, %2 ], [ %20, %21 ]
  %.0 = phi i32 [ 0, %2 ], [ %22, %21 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %23

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.task, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.task, ptr %7, i32 0, i32 4
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %.02, %9
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.task, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.task, ptr %12, i32 0, i32 3
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.task, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.task, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = sub nsw i32 %14, %18
  %20 = add nsw i32 %.01, %19
  br label %21

21:                                               ; preds = %5
  %22 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !10

23:                                               ; preds = %3
  %24 = sitofp i32 %.02 to float
  %25 = sitofp i32 %1 to float
  %26 = fdiv float %24, %25
  %27 = fpext float %26 to double
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %27)
  %29 = sitofp i32 %.01 to float
  %30 = sitofp i32 %1 to float
  %31 = fdiv float %29, %30
  %32 = fpext float %31 to double
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %32)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.task], align 16
  %2 = alloca %struct.task, align 8
  %3 = alloca %struct.task, align 4
  %4 = call ptr @createQueue(i32 noundef 10)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.tasks, i64 100, i1 false)
  %5 = getelementptr inbounds [5 x %struct.task], ptr %1, i64 0, i64 0
  call void @sortTasksByArrivalTime(ptr noundef %5, i32 noundef 5)
  br label %6

6:                                                ; preds = %11, %0
  %.0 = phi i32 [ 0, %0 ], [ %12, %11 ]
  %7 = icmp slt i32 %.0, 5
  br i1 %7, label %8, label %13

8:                                                ; preds = %6
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [5 x %struct.task], ptr %1, i64 0, i64 %9
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 4 %10, i64 20, i1 false)
  call void @enqueue(ptr noundef %4, ptr noundef byval(%struct.task) align 8 %2)
  br label %11

11:                                               ; preds = %8
  %12 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !11

13:                                               ; preds = %6
  br label %14

14:                                               ; preds = %17, %13
  %15 = call zeroext i1 @isEmpty(ptr noundef %4)
  %16 = xor i1 %15, true
  br i1 %16, label %17, label %21

17:                                               ; preds = %14
  call void @dequeue(ptr dead_on_unwind writable sret(%struct.task) align 4 %3, ptr noundef %4)
  %18 = getelementptr inbounds %struct.task, ptr %3, i32 0, i32 0
  %19 = load i32, ptr %18, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %19)
  call void @calculateTaskMetrics(ptr noundef %3, i32 noundef 1)
  br label %14, !llvm.loop !12

21:                                               ; preds = %14
  %22 = getelementptr inbounds [5 x %struct.task], ptr %1, i64 0, i64 0
  call void @calculateAverageMetrics(ptr noundef %22, i32 noundef 5)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!12 = distinct !{!12, !7}
