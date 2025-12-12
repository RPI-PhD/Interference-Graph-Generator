; ModuleID = 'LLVM_IR/gemini_pro-18827.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_node(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 24) #5
  %3 = icmp ne ptr %2, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %6

5:                                                ; preds = %1
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 19, ptr noundef @__PRETTY_FUNCTION__.create_node) #6
  unreachable

6:                                                ; preds = %4
  %7 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 0
  store i32 %0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 1
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 2
  store ptr null, ptr %9, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @insert_node(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr %0, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = call ptr @create_node(i32 noundef %1)
  store ptr %6, ptr %0, align 8
  br label %36

7:                                                ; preds = %2
  %8 = load ptr, ptr %0, align 8
  br label %9

9:                                                ; preds = %35, %7
  %.0 = phi ptr [ %8, %7 ], [ %.1, %35 ]
  %10 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp slt i32 %1, %11
  br i1 %12, label %13, label %24

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = call ptr @create_node(i32 noundef %1)
  %19 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  store ptr %18, ptr %19, align 8
  br label %36

20:                                               ; preds = %13
  %21 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  br label %23

23:                                               ; preds = %20
  br label %35

24:                                               ; preds = %9
  %25 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %31

28:                                               ; preds = %24
  %29 = call ptr @create_node(i32 noundef %1)
  %30 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 2
  store ptr %29, ptr %30, align 8
  br label %36

31:                                               ; preds = %24
  %32 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  br label %34

34:                                               ; preds = %31
  br label %35

35:                                               ; preds = %34, %23
  %.1 = phi ptr [ %22, %23 ], [ %33, %34 ]
  br label %9

36:                                               ; preds = %28, %17, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @preorder(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %12

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %6 = load i32, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %6)
  %8 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @preorder(ptr noundef %9)
  %10 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  call void @preorder(ptr noundef %11)
  br label %12

12:                                               ; preds = %4, %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @inorder(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %12

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  call void @inorder(ptr noundef %6)
  %7 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %8 = load i32, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %8)
  %10 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  call void @inorder(ptr noundef %11)
  br label %12

12:                                               ; preds = %4, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @postorder(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %12

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  call void @postorder(ptr noundef %6)
  %7 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  call void @postorder(ptr noundef %8)
  %9 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %10)
  br label %12

12:                                               ; preds = %4, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_tree(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %9

4:                                                ; preds = %1
  %5 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  call void @free_tree(ptr noundef %6)
  %7 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  call void @free_tree(ptr noundef %8)
  call void @free(ptr noundef %0) #7
  br label %9

9:                                                ; preds = %4, %3
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @insert_node(ptr noundef %1, i32 noundef 10)
  call void @insert_node(ptr noundef %1, i32 noundef 5)
  call void @insert_node(ptr noundef %1, i32 noundef 15)
  call void @insert_node(ptr noundef %1, i32 noundef 2)
  call void @insert_node(ptr noundef %1, i32 noundef 7)
  call void @insert_node(ptr noundef %1, i32 noundef 12)
  call void @insert_node(ptr noundef %1, i32 noundef 20)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %3 = load ptr, ptr %1, align 8
  call void @preorder(ptr noundef %3)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %6 = load ptr, ptr %1, align 8
  call void @inorder(ptr noundef %6)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %9 = load ptr, ptr %1, align 8
  call void @postorder(ptr noundef %9)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %11 = load ptr, ptr %1, align 8
  call void @free_tree(ptr noundef %11)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
