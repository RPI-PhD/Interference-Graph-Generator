; ModuleID = 'DATASETv2/gpt35-67535.c'
source_filename = "DATASETv2/gpt35-67535.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.queue = type { [10 x i32], i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"\0AQueue is full. Element cannot be inserted.\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"\0AQueue is empty. Element cannot be deleted.\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"\0AQueue is empty.\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"\0AQueue elements are: \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @createQueue() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 48) #3
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.queue, ptr %3, i32 0, i32 1
  store i32 -1, ptr %4, align 4
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr inbounds %struct.queue, ptr %5, i32 0, i32 2
  store i32 -1, ptr %6, align 4
  %7 = load ptr, ptr %1, align 8
  ret ptr %7
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @isEmpty(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.queue, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, -1
  br i1 %7, label %8, label %14

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.queue, ptr %9, i32 0, i32 2
  %11 = load i32, ptr %10, align 4
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %13, label %14

13:                                               ; preds = %8
  store i32 1, ptr %2, align 4
  br label %15

14:                                               ; preds = %8, %1
  store i32 0, ptr %2, align 4
  br label %15

15:                                               ; preds = %14, %13
  %16 = load i32, ptr %2, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @isFull(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.queue, ptr %4, i32 0, i32 2
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 9
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %10

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %10

10:                                               ; preds = %9, %8
  %11 = load i32, ptr %2, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @enqueue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = call i32 @isFull(ptr noundef %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %34

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8
  %12 = call i32 @isEmpty(ptr noundef %11)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.queue, ptr %15, i32 0, i32 2
  store i32 0, ptr %16, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.queue, ptr %17, i32 0, i32 1
  store i32 0, ptr %18, align 4
  br label %24

19:                                               ; preds = %10
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.queue, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %21, align 4
  br label %24

24:                                               ; preds = %19, %14
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %4, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.queue, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.queue, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [10 x i32], ptr %28, i64 0, i64 %32
  store i32 %26, ptr %33, align 4
  br label %34

34:                                               ; preds = %25, %8
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @dequeue(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 @isEmpty(ptr noundef %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %27

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.queue, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.queue, ptr %12, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = icmp eq i32 %11, %14
  br i1 %15, label %16, label %21

16:                                               ; preds = %8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.queue, ptr %17, i32 0, i32 2
  store i32 -1, ptr %18, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.queue, ptr %19, i32 0, i32 1
  store i32 -1, ptr %20, align 4
  br label %26

21:                                               ; preds = %8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.queue, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %23, align 4
  br label %26

26:                                               ; preds = %21, %16
  br label %27

27:                                               ; preds = %6, %26
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call i32 @isEmpty(ptr noundef %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %33

9:                                                ; preds = %1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.queue, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %28, %9
  %15 = load i32, ptr %3, align 4
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.queue, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 4
  %19 = icmp sle i32 %15, %18
  br i1 %19, label %20, label %31

20:                                               ; preds = %14
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.queue, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [10 x i32], ptr %22, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %26)
  br label %28

28:                                               ; preds = %20
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %3, align 4
  br label %14, !llvm.loop !6

31:                                               ; preds = %14
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %33

33:                                               ; preds = %7, %31
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
  call void @display(ptr noundef %8)
  %9 = load ptr, ptr %2, align 8
  call void @dequeue(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  call void @display(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  call void @dequeue(ptr noundef %11)
  %12 = load ptr, ptr %2, align 8
  call void @dequeue(ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  call void @dequeue(ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  call void @dequeue(ptr noundef %14)
  %15 = load ptr, ptr %2, align 8
  call void @display(ptr noundef %15)
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
