; ModuleID = 'DATASETv2/gemini_pro-18827.c'
source_filename = "DATASETv2/gemini_pro-18827.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i32, ptr, ptr }

@.str = private unnamed_addr constant [17 x i8] c"new_node != NULL\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"DATASETv2/gemini_pro-18827.c\00", align 1
@__PRETTY_FUNCTION__.create_node = private unnamed_addr constant [23 x i8] c"node *create_node(int)\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"Preorder: \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"Inorder: \00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"Postorder: \00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_node(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 24) #5
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %9

8:                                                ; preds = %1
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 19, ptr noundef @__PRETTY_FUNCTION__.create_node) #6
  unreachable

9:                                                ; preds = %7
  %10 = load i32, ptr %2, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 0
  store i32 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 1
  store ptr null, ptr %14, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.node, ptr %15, i32 0, i32 2
  store ptr null, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  ret ptr %17
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @insert_node(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = call ptr @create_node(i32 noundef %10)
  %12 = load ptr, ptr %3, align 8
  store ptr %11, ptr %12, align 8
  br label %53

13:                                               ; preds = %2
  %14 = load ptr, ptr %3, align 8
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %5, align 8
  br label %16

16:                                               ; preds = %13, %52
  %17 = load i32, ptr %4, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %37

22:                                               ; preds = %16
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.node, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %32

27:                                               ; preds = %22
  %28 = load i32, ptr %4, align 4
  %29 = call ptr @create_node(i32 noundef %28)
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 1
  store ptr %29, ptr %31, align 8
  br label %53

32:                                               ; preds = %22
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.node, ptr %33, i32 0, i32 1
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %5, align 8
  br label %36

36:                                               ; preds = %32
  br label %52

37:                                               ; preds = %16
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = icmp eq ptr %40, null
  br i1 %41, label %42, label %47

42:                                               ; preds = %37
  %43 = load i32, ptr %4, align 4
  %44 = call ptr @create_node(i32 noundef %43)
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.node, ptr %45, i32 0, i32 2
  store ptr %44, ptr %46, align 8
  br label %53

47:                                               ; preds = %37
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.node, ptr %48, i32 0, i32 2
  %50 = load ptr, ptr %49, align 8
  store ptr %50, ptr %5, align 8
  br label %51

51:                                               ; preds = %47
  br label %52

52:                                               ; preds = %51, %36
  br label %16

53:                                               ; preds = %42, %27, %9
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @preorder(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %17

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.node, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  call void @preorder(ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  call void @preorder(ptr noundef %16)
  br label %17

17:                                               ; preds = %6, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @inorder(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %17

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @inorder(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %12)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  call void @inorder(ptr noundef %16)
  br label %17

17:                                               ; preds = %6, %5
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @postorder(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %17

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @postorder(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  call void @postorder(ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.node, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %15)
  br label %17

17:                                               ; preds = %6, %5
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_tree(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %14

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.node, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @free_tree(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.node, ptr %10, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  call void @free_tree(ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13) #7
  br label %14

14:                                               ; preds = %6, %5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  call void @insert_node(ptr noundef %2, i32 noundef 10)
  call void @insert_node(ptr noundef %2, i32 noundef 5)
  call void @insert_node(ptr noundef %2, i32 noundef 15)
  call void @insert_node(ptr noundef %2, i32 noundef 2)
  call void @insert_node(ptr noundef %2, i32 noundef 7)
  call void @insert_node(ptr noundef %2, i32 noundef 12)
  call void @insert_node(ptr noundef %2, i32 noundef 20)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %4 = load ptr, ptr %2, align 8
  call void @preorder(ptr noundef %4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %7 = load ptr, ptr %2, align 8
  call void @inorder(ptr noundef %7)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %10 = load ptr, ptr %2, align 8
  call void @postorder(ptr noundef %10)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %12 = load ptr, ptr %2, align 8
  call void @free_tree(ptr noundef %12)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
