; ModuleID = 'DATASETv2/llama2-13B-8528.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @new_node(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %4, ptr %3, align 8
  %5 = load i32, ptr %2, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Node, ptr %6, i32 0, i32 0
  store i32 %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 1
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.Node, ptr %10, i32 0, i32 2
  store ptr null, ptr %11, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 3
  store i32 0, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  ret ptr %14
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_child(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %10

9:                                                ; preds = %2
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 27, ptr noundef @__PRETTY_FUNCTION__.add_child) #5
  unreachable

10:                                               ; preds = %8
  %11 = load ptr, ptr %4, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  br label %15

14:                                               ; preds = %10
  call void @__assert_fail(ptr noundef @.str.2, ptr noundef @.str.1, i32 noundef 28, ptr noundef @__PRETTY_FUNCTION__.add_child) #5
  unreachable

15:                                               ; preds = %13
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.Node, ptr %16, i32 0, i32 3
  %18 = load i32, ptr %17, align 8
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %31

20:                                               ; preds = %15
  %21 = call noalias ptr @malloc(i64 noundef 16) #4
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.Node, ptr %22, i32 0, i32 2
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 0
  store ptr %24, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 3
  store i32 1, ptr %30, align 8
  br label %64

31:                                               ; preds = %15
  store i32 0, ptr %5, align 4
  br label %32

32:                                               ; preds = %49, %31
  %33 = load i32, ptr %5, align 4
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.Node, ptr %34, i32 0, i32 3
  %36 = load i32, ptr %35, align 8
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %52

38:                                               ; preds = %32
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.Node, ptr %39, i32 0, i32 2
  %41 = load ptr, ptr %40, align 8
  %42 = load i32, ptr %5, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds ptr, ptr %41, i64 %43
  %45 = load ptr, ptr %44, align 8
  %46 = icmp eq ptr %45, null
  br i1 %46, label %47, label %48

47:                                               ; preds = %38
  br label %52

48:                                               ; preds = %38
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %5, align 4
  br label %32, !llvm.loop !6

52:                                               ; preds = %47, %32
  %53 = load ptr, ptr %4, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds %struct.Node, ptr %54, i32 0, i32 2
  %56 = load ptr, ptr %55, align 8
  %57 = load i32, ptr %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58
  store ptr %53, ptr %59, align 8
  %60 = load ptr, ptr %3, align 8
  %61 = getelementptr inbounds %struct.Node, ptr %60, i32 0, i32 3
  %62 = load i32, ptr %61, align 8
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %61, align 8
  br label %64

64:                                               ; preds = %52, %20
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_node(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %47

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.Node, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  br label %25

17:                                               ; preds = %8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.Node, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.Node, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %21, align 8
  %23 = sext i32 %22 to i64
  %24 = inttoptr i64 %23 to ptr
  br label %25

25:                                               ; preds = %17, %16
  %26 = phi ptr [ @.str.5, %16 ], [ %24, %17 ]
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %11, ptr noundef %26)
  store i32 0, ptr %3, align 4
  br label %28

28:                                               ; preds = %42, %25
  %29 = load i32, ptr %3, align 4
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.Node, ptr %30, i32 0, i32 3
  %32 = load i32, ptr %31, align 8
  %33 = icmp slt i32 %29, %32
  br i1 %33, label %34, label %45

34:                                               ; preds = %28
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.Node, ptr %35, i32 0, i32 2
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds ptr, ptr %37, i64 %39
  %41 = load ptr, ptr %40, align 8
  call void @print_node(ptr noundef %41)
  br label %42

42:                                               ; preds = %34
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %3, align 4
  br label %28, !llvm.loop !8

45:                                               ; preds = %28
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %47

47:                                               ; preds = %45, %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_graph(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @print_node(ptr noundef %3)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %7 = call ptr @new_node(i32 noundef 1)
  store ptr %7, ptr %2, align 8
  %8 = call ptr @new_node(i32 noundef 2)
  store ptr %8, ptr %3, align 8
  %9 = call ptr @new_node(i32 noundef 3)
  store ptr %9, ptr %4, align 8
  %10 = call ptr @new_node(i32 noundef 4)
  store ptr %10, ptr %5, align 8
  %11 = call ptr @new_node(i32 noundef 5)
  store ptr %11, ptr %6, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = load ptr, ptr %3, align 8
  call void @add_child(ptr noundef %12, ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = load ptr, ptr %4, align 8
  call void @add_child(ptr noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %5, align 8
  call void @add_child(ptr noundef %16, ptr noundef %17)
  %18 = load ptr, ptr %4, align 8
  %19 = load ptr, ptr %6, align 8
  call void @add_child(ptr noundef %18, ptr noundef %19)
  %20 = load ptr, ptr %2, align 8
  call void @print_graph(ptr noundef %20)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
