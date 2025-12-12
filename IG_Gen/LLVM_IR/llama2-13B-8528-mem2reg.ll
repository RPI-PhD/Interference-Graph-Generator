; ModuleID = 'LLVM_IR/llama2-13B-8528.ll'
source_filename = "DATASETv2/llama2-13B-8528.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, ptr, ptr, i32 }

@.str = private unnamed_addr constant [15 x i8] c"parent != NULL\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"DATASETv2/llama2-13B-8528.c\00", align 1
@__PRETTY_FUNCTION__.add_child = private unnamed_addr constant [45 x i8] c"void add_child(struct Node *, struct Node *)\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"child != NULL\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"NULL\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"%d (%s): \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"root\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @new_node(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 32) #4
  %3 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 0
  store i32 %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 1
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 2
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 3
  store i32 0, ptr %6, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_child(ptr noundef %0, ptr noundef %1) #0 {
  %3 = icmp ne ptr %0, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  br label %6

5:                                                ; preds = %2
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 27, ptr noundef @__PRETTY_FUNCTION__.add_child) #5
  unreachable

6:                                                ; preds = %4
  %7 = icmp ne ptr %1, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  br label %10

9:                                                ; preds = %6
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 28, ptr noundef @__PRETTY_FUNCTION__.add_child) #5
  unreachable

10:                                               ; preds = %8
  %11 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %21

14:                                               ; preds = %10
  %15 = call noalias ptr @malloc(i64 noundef 16) #4
  %16 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  store ptr %15, ptr %16, align 8
  %17 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 0
  store ptr %1, ptr %19, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  store i32 1, ptr %20, align 8
  br label %45

21:                                               ; preds = %10
  br label %22

22:                                               ; preds = %35, %21
  %.0 = phi i32 [ 0, %21 ], [ %36, %35 ]
  %23 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  %24 = load i32, ptr %23, align 8
  %25 = icmp slt i32 %.0, %24
  br i1 %25, label %26, label %37

26:                                               ; preds = %22
  %27 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds ptr, ptr %28, i64 %29
  %31 = load ptr, ptr %30, align 8
  %32 = icmp eq ptr %31, null
  br i1 %32, label %33, label %34

33:                                               ; preds = %26
  br label %37

34:                                               ; preds = %26
  br label %35

35:                                               ; preds = %34
  %36 = add nsw i32 %.0, 1
  br label %22, !llvm.loop !6

37:                                               ; preds = %33, %22
  %38 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = sext i32 %.0 to i64
  %41 = getelementptr inbounds ptr, ptr %39, i64 %40
  store ptr %1, ptr %41, align 8
  %42 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  %43 = load i32, ptr %42, align 8
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %42, align 8
  br label %45

45:                                               ; preds = %37, %14
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_node(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %36

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %5
  br label %19

12:                                               ; preds = %5
  %13 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = sext i32 %16 to i64
  %18 = inttoptr i64 %17 to ptr
  br label %19

19:                                               ; preds = %12, %11
  %20 = phi ptr [ @.str.5, %11 ], [ %18, %12 ]
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %7, ptr noundef %20)
  br label %22

22:                                               ; preds = %32, %19
  %.0 = phi i32 [ 0, %19 ], [ %33, %32 ]
  %23 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 3
  %24 = load i32, ptr %23, align 8
  %25 = icmp slt i32 %.0, %24
  br i1 %25, label %26, label %34

26:                                               ; preds = %22
  %27 = getelementptr inbounds %struct.Node, ptr %0, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds ptr, ptr %28, i64 %29
  %31 = load ptr, ptr %30, align 8
  call void @print_node(ptr noundef %31)
  br label %32

32:                                               ; preds = %26
  %33 = add nsw i32 %.0, 1
  br label %22, !llvm.loop !8

34:                                               ; preds = %22
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %36

36:                                               ; preds = %34, %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_graph(ptr noundef %0) #0 {
  call void @print_node(ptr noundef %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @new_node(i32 noundef 1)
  %2 = call ptr @new_node(i32 noundef 2)
  %3 = call ptr @new_node(i32 noundef 3)
  %4 = call ptr @new_node(i32 noundef 4)
  %5 = call ptr @new_node(i32 noundef 5)
  call void @add_child(ptr noundef %1, ptr noundef %2)
  call void @add_child(ptr noundef %1, ptr noundef %3)
  call void @add_child(ptr noundef %2, ptr noundef %4)
  call void @add_child(ptr noundef %3, ptr noundef %5)
  call void @print_graph(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { noreturn nounwind }

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
