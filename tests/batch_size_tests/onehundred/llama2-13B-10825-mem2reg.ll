; ModuleID = 'LLVM_IR/llama2-13B-10825.ll'
source_filename = "DATASETv2/llama2-13B-10825.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, ptr }

@.str = private unnamed_addr constant [18 x i8] c"Removed node: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @newNode(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 16) #4
  %3 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 0
  store i32 %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 1
  store ptr null, ptr %4, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @insertAtBeginning(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call ptr @newNode(i32 noundef %1)
  %4 = load ptr, ptr %0, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 1
  store ptr %4, ptr %5, align 8
  store ptr %3, ptr %0, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @insertAtEnd(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  br label %4

4:                                                ; preds = %8, %2
  %.0 = phi ptr [ %3, %2 ], [ %10, %8 ]
  %5 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  br label %4, !llvm.loop !6

11:                                               ; preds = %4
  %12 = call ptr @newNode(i32 noundef %1)
  %13 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  store ptr %12, ptr %13, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @removeFirstOccurrence(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  br label %4

4:                                                ; preds = %12, %2
  %.02 = phi ptr [ %3, %2 ], [ %14, %12 ]
  %.01 = phi ptr [ null, %2 ], [ %.02, %12 ]
  %5 = icmp ne ptr %.02, null
  br i1 %5, label %6, label %10

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.Node, ptr %.02, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp ne i32 %8, %1
  br label %10

10:                                               ; preds = %6, %4
  %11 = phi i1 [ false, %4 ], [ %9, %6 ]
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = getelementptr inbounds %struct.Node, ptr %.02, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  br label %4, !llvm.loop !8

15:                                               ; preds = %10
  %16 = icmp ne ptr %.02, null
  br i1 %16, label %17, label %27

17:                                               ; preds = %15
  %18 = icmp eq ptr %.01, null
  br i1 %18, label %19, label %22

19:                                               ; preds = %17
  %20 = getelementptr inbounds %struct.Node, ptr %.02, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %0, align 8
  br label %26

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.Node, ptr %.02, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 1
  store ptr %24, ptr %25, align 8
  br label %26

26:                                               ; preds = %22, %19
  call void @free(ptr noundef %.02) #5
  br label %28

27:                                               ; preds = %15
  br label %28

28:                                               ; preds = %27, %26
  %.0 = phi ptr [ %.02, %26 ], [ null, %27 ]
  ret ptr %.0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @removeAllOccurrences(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  br label %4

4:                                                ; preds = %20, %2
  %.01 = phi ptr [ %3, %2 ], [ %22, %20 ]
  %.0 = phi ptr [ null, %2 ], [ %.01, %20 ]
  %5 = icmp ne ptr %.01, null
  br i1 %5, label %6, label %23

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = icmp eq i32 %8, %1
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = icmp eq ptr %.0, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %0, align 8
  br label %19

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  store ptr %17, ptr %18, align 8
  br label %19

19:                                               ; preds = %15, %12
  call void @free(ptr noundef %.01) #5
  br label %20

20:                                               ; preds = %19, %6
  %21 = getelementptr inbounds %struct.Node, ptr %.01, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  br label %4, !llvm.loop !9

23:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @insertAtBeginning(ptr noundef %1, i32 noundef 1)
  call void @insertAtBeginning(ptr noundef %1, i32 noundef 2)
  call void @insertAtBeginning(ptr noundef %1, i32 noundef 3)
  call void @insertAtEnd(ptr noundef %1, i32 noundef 4)
  call void @insertAtEnd(ptr noundef %1, i32 noundef 5)
  %2 = call ptr @removeFirstOccurrence(ptr noundef %1, i32 noundef 3)
  %3 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 0
  %4 = load i32, ptr %3, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %4)
  call void @removeAllOccurrences(ptr noundef %1, i32 noundef 4)
  %6 = load ptr, ptr %1, align 8
  br label %7

7:                                                ; preds = %9, %0
  %.0 = phi ptr [ %6, %0 ], [ %14, %9 ]
  %8 = icmp ne ptr %.0, null
  br i1 %8, label %9, label %15

9:                                                ; preds = %7
  %10 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %11)
  %13 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  br label %7, !llvm.loop !10

15:                                               ; preds = %7
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
