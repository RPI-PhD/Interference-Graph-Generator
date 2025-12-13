; ModuleID = 'LLVM_IR/gemma7b-45436.ll'
source_filename = "DATASETv2/gemma7b-45436.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, ptr }
%struct.Queue = type { ptr, ptr, i32 }

@.str = private unnamed_addr constant [17 x i8] c"Dequed data: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @enqueue(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call noalias ptr @malloc(i64 noundef 16) #3
  %4 = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 0
  store i32 %1, ptr %4, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 1
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 0
  store ptr %3, ptr %10, align 8
  br label %15

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.Node, ptr %13, i32 0, i32 1
  store ptr %3, ptr %14, align 8
  br label %15

15:                                               ; preds = %11, %9
  %16 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 1
  store ptr %3, ptr %16, align 8
  %17 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 2
  %18 = load i32, ptr %17, align 8
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 8
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dequeue(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %19

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 0
  store ptr %14, ptr %15, align 8
  %16 = getelementptr inbounds %struct.Queue, ptr %0, i32 0, i32 2
  %17 = load i32, ptr %16, align 8
  %18 = add nsw i32 %17, -1
  store i32 %18, ptr %16, align 8
  br label %19

19:                                               ; preds = %6, %5
  %.0 = phi i32 [ -1, %5 ], [ %10, %6 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 24) #3
  %2 = getelementptr inbounds %struct.Queue, ptr %1, i32 0, i32 0
  store ptr null, ptr %2, align 8
  %3 = getelementptr inbounds %struct.Queue, ptr %1, i32 0, i32 1
  store ptr null, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Queue, ptr %1, i32 0, i32 2
  store i32 0, ptr %4, align 8
  call void @enqueue(ptr noundef %1, i32 noundef 10)
  call void @enqueue(ptr noundef %1, i32 noundef 20)
  call void @enqueue(ptr noundef %1, i32 noundef 30)
  %5 = call i32 @dequeue(ptr noundef %1)
  %6 = icmp ne i32 %5, -1
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  br label %9

9:                                                ; preds = %7, %0
  %10 = call i32 @dequeue(ptr noundef %1)
  %11 = icmp ne i32 %10, -1
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %10)
  br label %14

14:                                               ; preds = %12, %9
  %15 = call i32 @dequeue(ptr noundef %1)
  %16 = icmp ne i32 %15, -1
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %19

19:                                               ; preds = %17, %14
  %20 = call i32 @dequeue(ptr noundef %1)
  %21 = icmp ne i32 %20, -1
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %20)
  br label %24

24:                                               ; preds = %22, %19
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

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
