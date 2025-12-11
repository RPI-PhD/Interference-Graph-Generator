; ModuleID = 'DATASETv2/falcon180b-26620.c'
source_filename = "DATASETv2/falcon180b-26620.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.queue = type { ptr, ptr }
%struct.node = type { i32, ptr }

@.str = private unnamed_addr constant [14 x i8] c"Memory error\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Queue is empty\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Queue: \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"Dequeued element: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"Peek: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"Is queue empty? %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"No\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createQueue() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 0) #6
  unreachable

7:                                                ; preds = %0
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds %struct.queue, ptr %8, i32 0, i32 0
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds %struct.queue, ptr %10, i32 0, i32 1
  store ptr null, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  ret ptr %12
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @enqueue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 16) #5
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 0) #6
  unreachable

11:                                               ; preds = %2
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0
  store i32 %12, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 1
  store ptr null, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.queue, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %28

21:                                               ; preds = %11
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.queue, ptr %23, i32 0, i32 0
  store ptr %22, ptr %24, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.queue, ptr %26, i32 0, i32 1
  store ptr %25, ptr %27, align 8
  br label %37

28:                                               ; preds = %11
  %29 = load ptr, ptr %5, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.queue, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 1
  store ptr %29, ptr %33, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.queue, ptr %35, i32 0, i32 1
  store ptr %34, ptr %36, align 8
  br label %37

37:                                               ; preds = %28, %21
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @dequeue(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.queue, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.queue, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %1
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 -1, ptr %2, align 4
  br label %36

15:                                               ; preds = %1
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  store i32 %18, ptr %4, align 4
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.queue, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds %struct.node, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.queue, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %26) #7
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.queue, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = icmp eq ptr %29, null
  br i1 %30, label %31, label %34

31:                                               ; preds = %15
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.queue, ptr %32, i32 0, i32 1
  store ptr null, ptr %33, align 8
  br label %34

34:                                               ; preds = %31, %15
  %35 = load i32, ptr %4, align 4
  store i32 %35, ptr %2, align 4
  br label %36

36:                                               ; preds = %34, %13
  %37 = load i32, ptr %2, align 4
  ret i32 %37
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @peek(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.queue, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 -1, ptr %2, align 4
  br label %16

10:                                               ; preds = %1
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.queue, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  store i32 %15, ptr %2, align 4
  br label %16

16:                                               ; preds = %10, %8
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @isEmpty(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.queue, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  %7 = zext i1 %6 to i32
  ret i32 %7
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.queue, ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %8

8:                                                ; preds = %11, %1
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %19

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.node, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %14)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.node, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %3, align 8
  br label %8, !llvm.loop !6

19:                                               ; preds = %8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @createQueue()
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @enqueue(ptr noundef %4, i32 noundef 10)
  %5 = load ptr, ptr %2, align 8
  call void @enqueue(ptr noundef %5, i32 noundef 20)
  %6 = load ptr, ptr %2, align 8
  call void @enqueue(ptr noundef %6, i32 noundef 30)
  %7 = load ptr, ptr %2, align 8
  call void @enqueue(ptr noundef %7, i32 noundef 40)
  %8 = load ptr, ptr %2, align 8
  call void @enqueue(ptr noundef %8, i32 noundef 50)
  %9 = load ptr, ptr %2, align 8
  call void @display(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = call i32 @dequeue(ptr noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %11)
  %13 = load ptr, ptr %2, align 8
  %14 = call i32 @dequeue(ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %14)
  %16 = load ptr, ptr %2, align 8
  call void @display(ptr noundef %16)
  %17 = load ptr, ptr %2, align 8
  %18 = call i32 @peek(ptr noundef %17)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %18)
  %20 = load ptr, ptr %2, align 8
  %21 = call i32 @isEmpty(ptr noundef %20)
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, ptr @.str.8, ptr @.str.9
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %24)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

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
