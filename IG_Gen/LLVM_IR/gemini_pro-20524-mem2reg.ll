; ModuleID = 'LLVM_IR/gemini_pro-20524.ll'
source_filename = "DATASETv2/gemini_pro-20524.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { i32, ptr }

@.str = private unnamed_addr constant [27 x i8] c"The linked list is empty.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"The linked list is: \00", align 1
@.str.4 = private unnamed_addr constant [36 x i8] c"The linked list after deletion is: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_node(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 16) #4
  %3 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 0
  store i32 %0, ptr %3, align 8
  %4 = getelementptr inbounds %struct.node, ptr %2, i32 0, i32 1
  store ptr null, ptr %4, align 8
  ret ptr %2
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @insert_at_beginning(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call ptr @create_node(i32 noundef %1)
  %4 = getelementptr inbounds %struct.node, ptr %3, i32 0, i32 1
  store ptr %0, ptr %4, align 8
  ret ptr %3
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @insert_at_end(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call ptr @create_node(i32 noundef %1)
  %4 = icmp eq ptr %0, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  br label %16

6:                                                ; preds = %2
  br label %7

7:                                                ; preds = %11, %6
  %.01 = phi ptr [ %0, %6 ], [ %13, %11 ]
  %8 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  br label %7, !llvm.loop !6

14:                                               ; preds = %7
  %15 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  store ptr %3, ptr %15, align 8
  br label %16

16:                                               ; preds = %14, %5
  %.0 = phi ptr [ %3, %5 ], [ %0, %14 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @insert_after(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = icmp eq ptr %0, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %3
  br label %23

6:                                                ; preds = %3
  br label %7

7:                                                ; preds = %19, %6
  %.01 = phi ptr [ %0, %6 ], [ %21, %19 ]
  %8 = icmp ne ptr %.01, null
  br i1 %8, label %9, label %22

9:                                                ; preds = %7
  %10 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, %1
  br i1 %12, label %13, label %19

13:                                               ; preds = %9
  %14 = call ptr @create_node(i32 noundef %2)
  %15 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 1
  store ptr %16, ptr %17, align 8
  %18 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  store ptr %14, ptr %18, align 8
  br label %23

19:                                               ; preds = %9
  %20 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  br label %7, !llvm.loop !8

22:                                               ; preds = %7
  br label %23

23:                                               ; preds = %22, %13, %5
  %.0 = phi ptr [ null, %5 ], [ %0, %13 ], [ %0, %22 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @delete_node(ptr noundef %0, i32 noundef %1) #0 {
  %3 = icmp eq ptr %0, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  br label %33

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 0
  %7 = load i32, ptr %6, align 8
  %8 = icmp eq i32 %7, %1
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.node, ptr %0, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %0) #5
  br label %33

12:                                               ; preds = %5
  br label %13

13:                                               ; preds = %29, %12
  %.01 = phi ptr [ %0, %12 ], [ %31, %29 ]
  %14 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %32

17:                                               ; preds = %13
  %18 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, %1
  br i1 %22, label %23, label %29

23:                                               ; preds = %17
  %24 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.node, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  store ptr %27, ptr %28, align 8
  call void @free(ptr noundef %25) #5
  br label %33

29:                                               ; preds = %17
  %30 = getelementptr inbounds %struct.node, ptr %.01, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  br label %13, !llvm.loop !9

32:                                               ; preds = %13
  br label %33

33:                                               ; preds = %32, %23, %9, %4
  %.0 = phi ptr [ null, %4 ], [ %11, %9 ], [ %0, %23 ], [ %0, %32 ]
  ret ptr %.0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_linked_list(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %16

5:                                                ; preds = %1
  br label %6

6:                                                ; preds = %8, %5
  %.0 = phi ptr [ %0, %5 ], [ %13, %8 ]
  %7 = icmp ne ptr %.0, null
  br i1 %7, label %8, label %14

8:                                                ; preds = %6
  %9 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %10)
  %12 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  br label %6, !llvm.loop !10

14:                                               ; preds = %6
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %16

16:                                               ; preds = %14, %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_linked_list(ptr noundef %0) #0 {
  %2 = icmp eq ptr %0, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %10

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %7, %4
  %.0 = phi ptr [ %0, %4 ], [ %9, %7 ]
  %6 = icmp ne ptr %.0, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.node, ptr %.0, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %.0) #5
  br label %5, !llvm.loop !11

10:                                               ; preds = %5, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @insert_at_beginning(ptr noundef null, i32 noundef 10)
  %2 = call ptr @insert_at_end(ptr noundef %1, i32 noundef 20)
  %3 = call ptr @insert_at_end(ptr noundef %2, i32 noundef 30)
  %4 = call ptr @insert_after(ptr noundef %3, i32 noundef 20, i32 noundef 25)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @print_linked_list(ptr noundef %4)
  %6 = call ptr @delete_node(ptr noundef %4, i32 noundef 25)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  call void @print_linked_list(ptr noundef %6)
  call void @free_linked_list(ptr noundef %6)
  ret i32 0
}

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
!11 = distinct !{!11, !7}
