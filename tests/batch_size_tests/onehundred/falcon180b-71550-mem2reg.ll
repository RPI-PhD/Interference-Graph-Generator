; ModuleID = 'LLVM_IR/falcon180b-71550.ll'
source_filename = "DATASETv2/falcon180b-71550.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i32, ptr }

@.str = private unnamed_addr constant [27 x i8] c"Memory allocation failed!\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Invalid position!\0A\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"Value not found in the list!\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%d -> \00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"NULL\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_node(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 16) #5
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #6
  unreachable

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 0
  store i32 %0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 1
  store ptr null, ptr %8, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_node_at_beginning(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call ptr @create_node(i32 noundef %1)
  %4 = load ptr, ptr %0, align 8
  %5 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1
  store ptr %4, ptr %5, align 8
  store ptr %3, ptr %0, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_node_at_end(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call ptr @create_node(i32 noundef %1)
  %4 = load ptr, ptr %0, align 8
  %5 = load ptr, ptr %0, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  store ptr %3, ptr %0, align 8
  br label %18

8:                                                ; preds = %2
  br label %9

9:                                                ; preds = %13, %8
  %.0 = phi ptr [ %4, %8 ], [ %15, %13 ]
  %10 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %16

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  br label %9, !llvm.loop !6

16:                                               ; preds = %9
  %17 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  store ptr %3, ptr %17, align 8
  br label %18

18:                                               ; preds = %16, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_node_at_position(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = call ptr @create_node(i32 noundef %1)
  %5 = load ptr, ptr %0, align 8
  %6 = icmp eq i32 %2, 1
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = load ptr, ptr %0, align 8
  %9 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1
  store ptr %8, ptr %9, align 8
  store ptr %4, ptr %0, align 8
  br label %32

10:                                               ; preds = %3
  br label %11

11:                                               ; preds = %21, %10
  %.01 = phi ptr [ %5, %10 ], [ %20, %21 ]
  %.0 = phi i32 [ 1, %10 ], [ %22, %21 ]
  %12 = sub nsw i32 %2, 1
  %13 = icmp slt i32 %.0, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = icmp ne ptr %.01, null
  br label %16

16:                                               ; preds = %14, %11
  %17 = phi i1 [ false, %11 ], [ %15, %14 ]
  br i1 %17, label %18, label %23

18:                                               ; preds = %16
  %19 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  br label %21

21:                                               ; preds = %18
  %22 = add nsw i32 %.0, 1
  br label %11, !llvm.loop !8

23:                                               ; preds = %16
  %24 = icmp eq ptr %.01, null
  br i1 %24, label %25, label %27

25:                                               ; preds = %23
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %32

27:                                               ; preds = %23
  %28 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.node, ptr %4, i32 0, i32 1
  store ptr %29, ptr %30, align 8
  %31 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  store ptr %4, ptr %31, align 8
  br label %32

32:                                               ; preds = %27, %25, %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @delete_node_by_value(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %12

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp eq i32 %7, %1
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %0, align 8
  call void @free(ptr noundef %3) #7
  br label %32

12:                                               ; preds = %5, %2
  br label %13

13:                                               ; preds = %21, %12
  %.01 = phi ptr [ %3, %12 ], [ %23, %21 ]
  %.0 = phi ptr [ null, %12 ], [ %.01, %21 ]
  %14 = icmp ne ptr %.01, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %13
  %16 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp ne i32 %17, %1
  br label %19

19:                                               ; preds = %15, %13
  %20 = phi i1 [ false, %13 ], [ %18, %15 ]
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  br label %13, !llvm.loop !9

24:                                               ; preds = %19
  %25 = icmp eq ptr %.01, null
  br i1 %25, label %26, label %28

26:                                               ; preds = %24
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %32

28:                                               ; preds = %24
  %29 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  store ptr %30, ptr %31, align 8
  call void @free(ptr noundef %.01) #7
  br label %32

32:                                               ; preds = %28, %26, %9
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_list(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.0 = phi ptr [ %0, %1 ], [ %9, %4 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %6)
  %8 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  br label %2, !llvm.loop !10

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @add_node_at_beginning(ptr noundef %1, i32 noundef 10)
  call void @add_node_at_end(ptr noundef %1, i32 noundef 20)
  call void @add_node_at_position(ptr noundef %1, i32 noundef 15, i32 noundef 2)
  %2 = load ptr, ptr %1, align 8
  call void @print_list(ptr noundef %2)
  call void @delete_node_by_value(ptr noundef %1, i32 noundef 10)
  %3 = load ptr, ptr %1, align 8
  call void @print_list(ptr noundef %3)
  call void @delete_node_by_value(ptr noundef %1, i32 noundef 20)
  %4 = load ptr, ptr %1, align 8
  call void @print_list(ptr noundef %4)
  call void @delete_node_by_value(ptr noundef %1, i32 noundef 15)
  %5 = load ptr, ptr %1, align 8
  call void @print_list(ptr noundef %5)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
