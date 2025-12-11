; ModuleID = 'DATASETv2/falcon2-11B-11442.c'
source_filename = "DATASETv2/falcon2-11B-11442.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node_t = type { i32, i32, [100 x ptr] }
%struct.edge_t = type { i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"Node %d: \00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"%d -> %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_node(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 808) #3
  store ptr %4, ptr %3, align 8
  %5 = load i32, ptr %2, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.node_t, ptr %6, i32 0, i32 0
  store i32 %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.node_t, ptr %8, i32 0, i32 1
  store i32 0, ptr %9, align 4
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_edge(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 8) #3
  store ptr %6, ptr %5, align 8
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.edge_t, ptr %8, i32 0, i32 0
  store i32 %7, ptr %9, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.edge_t, ptr %11, i32 0, i32 1
  store i32 %10, ptr %12, align 4
  %13 = load ptr, ptr %5, align 8
  ret ptr %13
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_edge_to_node(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = call ptr @create_edge(i32 noundef %8, i32 noundef %9)
  store ptr %10, ptr %7, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.node_t, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %12, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.node_t, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.node_t, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = sub nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x ptr], ptr %17, i64 0, i64 %22
  store ptr %15, ptr %23, align 8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_node(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.node_t, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7)
  store i32 0, ptr %3, align 4
  br label %9

9:                                                ; preds = %29, %1
  %10 = load i32, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.node_t, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %32

15:                                               ; preds = %9
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.node_t, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x ptr], ptr %17, i64 0, i64 %19
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %4, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.edge_t, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.edge_t, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %24, i32 noundef %27)
  br label %29

29:                                               ; preds = %15
  %30 = load i32, ptr %3, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %9, !llvm.loop !6

32:                                               ; preds = %9
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %8 = call ptr @create_node(i32 noundef 1)
  store ptr %8, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  call void @add_edge_to_node(ptr noundef %9, i32 noundef 1, i32 noundef 2)
  %10 = load ptr, ptr %2, align 8
  call void @add_edge_to_node(ptr noundef %10, i32 noundef 1, i32 noundef 3)
  %11 = load ptr, ptr %2, align 8
  call void @print_node(ptr noundef %11)
  %12 = call ptr @create_node(i32 noundef 2)
  store ptr %12, ptr %3, align 8
  %13 = load ptr, ptr %3, align 8
  call void @add_edge_to_node(ptr noundef %13, i32 noundef 2, i32 noundef 1)
  %14 = load ptr, ptr %3, align 8
  call void @add_edge_to_node(ptr noundef %14, i32 noundef 2, i32 noundef 4)
  %15 = load ptr, ptr %3, align 8
  call void @add_edge_to_node(ptr noundef %15, i32 noundef 2, i32 noundef 5)
  %16 = load ptr, ptr %3, align 8
  call void @print_node(ptr noundef %16)
  %17 = call ptr @create_node(i32 noundef 3)
  store ptr %17, ptr %4, align 8
  %18 = load ptr, ptr %4, align 8
  call void @add_edge_to_node(ptr noundef %18, i32 noundef 3, i32 noundef 1)
  %19 = load ptr, ptr %4, align 8
  call void @add_edge_to_node(ptr noundef %19, i32 noundef 3, i32 noundef 2)
  %20 = load ptr, ptr %4, align 8
  call void @add_edge_to_node(ptr noundef %20, i32 noundef 3, i32 noundef 4)
  %21 = load ptr, ptr %4, align 8
  call void @print_node(ptr noundef %21)
  %22 = call ptr @create_node(i32 noundef 4)
  store ptr %22, ptr %5, align 8
  %23 = load ptr, ptr %5, align 8
  call void @add_edge_to_node(ptr noundef %23, i32 noundef 4, i32 noundef 2)
  %24 = load ptr, ptr %5, align 8
  call void @add_edge_to_node(ptr noundef %24, i32 noundef 4, i32 noundef 5)
  %25 = load ptr, ptr %5, align 8
  call void @add_edge_to_node(ptr noundef %25, i32 noundef 4, i32 noundef 6)
  %26 = load ptr, ptr %5, align 8
  call void @print_node(ptr noundef %26)
  %27 = call ptr @create_node(i32 noundef 5)
  store ptr %27, ptr %6, align 8
  %28 = load ptr, ptr %6, align 8
  call void @add_edge_to_node(ptr noundef %28, i32 noundef 5, i32 noundef 2)
  %29 = load ptr, ptr %6, align 8
  call void @add_edge_to_node(ptr noundef %29, i32 noundef 5, i32 noundef 3)
  %30 = load ptr, ptr %6, align 8
  call void @add_edge_to_node(ptr noundef %30, i32 noundef 5, i32 noundef 4)
  %31 = load ptr, ptr %6, align 8
  call void @add_edge_to_node(ptr noundef %31, i32 noundef 5, i32 noundef 6)
  %32 = load ptr, ptr %6, align 8
  call void @print_node(ptr noundef %32)
  %33 = call ptr @create_node(i32 noundef 6)
  store ptr %33, ptr %7, align 8
  %34 = load ptr, ptr %7, align 8
  call void @add_edge_to_node(ptr noundef %34, i32 noundef 6, i32 noundef 4)
  %35 = load ptr, ptr %7, align 8
  call void @add_edge_to_node(ptr noundef %35, i32 noundef 6, i32 noundef 5)
  %36 = load ptr, ptr %7, align 8
  call void @print_node(ptr noundef %36)
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
