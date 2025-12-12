; ModuleID = 'LLVM_IR/gemini_pro-6564.ll'
source_filename = "DATASETv2/gemini_pro-6564.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%c \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Initial grid:\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Does the grid percolate? %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"No\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_grid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %20, %1
  %.01 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %3 = icmp slt i32 %.01, 20
  br i1 %3, label %4, label %22

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %17, %4
  %.0 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %6 = icmp slt i32 %.0, 20
  br i1 %6, label %7, label %19

7:                                                ; preds = %5
  %8 = call i32 @rand() #3
  %9 = sitofp i32 %8 to double
  %10 = fcmp olt double %9, 0x41CFFFFFFFC00000
  %11 = zext i1 %10 to i64
  %12 = select i1 %10, i32 1, i32 0
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds [20 x i32], ptr %0, i64 %13
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [20 x i32], ptr %14, i64 0, i64 %15
  store i32 %12, ptr %16, align 4
  br label %17

17:                                               ; preds = %7
  %18 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

19:                                               ; preds = %5
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

22:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_grid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %21, %1
  %.01 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %3 = icmp slt i32 %.01, 20
  br i1 %3, label %4, label %23

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %17, %4
  %.0 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %6 = icmp slt i32 %.0, 20
  br i1 %6, label %7, label %19

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds [20 x i32], ptr %0, i64 %8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [20 x i32], ptr %9, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = icmp ne i32 %12, 0
  %14 = zext i1 %13 to i64
  %15 = select i1 %13, i32 79, i32 88
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %15)
  br label %17

17:                                               ; preds = %7
  %18 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !9

19:                                               ; preds = %5
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %21

21:                                               ; preds = %19
  %22 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !10

23:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_open(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds [20 x i32], ptr %0, i64 %4
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds [20 x i32], ptr %5, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %8, 1
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_in_bounds(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp sge i32 %0, 0
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = icmp slt i32 %0, 20
  br i1 %5, label %6, label %10

6:                                                ; preds = %4
  %7 = icmp sge i32 %1, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %6
  %9 = icmp slt i32 %1, 20
  br label %10

10:                                               ; preds = %8, %6, %4, %2
  %11 = phi i1 [ false, %6 ], [ false, %4 ], [ false, %2 ], [ %9, %8 ]
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dfs(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = call i32 @is_in_bounds(i32 noundef %1, i32 noundef %2)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %3
  %7 = call i32 @is_open(ptr noundef %0, i32 noundef %1, i32 noundef %2)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %6, %3
  br label %19

10:                                               ; preds = %6
  %11 = sext i32 %1 to i64
  %12 = getelementptr inbounds [20 x i32], ptr %0, i64 %11
  %13 = sext i32 %2 to i64
  %14 = getelementptr inbounds [20 x i32], ptr %12, i64 0, i64 %13
  store i32 -1, ptr %14, align 4
  %15 = sub nsw i32 %1, 1
  call void @dfs(ptr noundef %0, i32 noundef %15, i32 noundef %2)
  %16 = add nsw i32 %1, 1
  call void @dfs(ptr noundef %0, i32 noundef %16, i32 noundef %2)
  %17 = sub nsw i32 %2, 1
  call void @dfs(ptr noundef %0, i32 noundef %1, i32 noundef %17)
  %18 = add nsw i32 %2, 1
  call void @dfs(ptr noundef %0, i32 noundef %1, i32 noundef %18)
  br label %19

19:                                               ; preds = %10, %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @percolates(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %9, %1
  %.02 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %3 = icmp slt i32 %.02, 20
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = call i32 @is_open(ptr noundef %0, i32 noundef 0, i32 noundef %.02)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  call void @dfs(ptr noundef %0, i32 noundef 0, i32 noundef %.02)
  br label %8

8:                                                ; preds = %7, %4
  br label %9

9:                                                ; preds = %8
  %10 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !11

11:                                               ; preds = %2
  br label %12

12:                                               ; preds = %22, %11
  %.01 = phi i32 [ 0, %11 ], [ %23, %22 ]
  %13 = icmp slt i32 %.01, 20
  br i1 %13, label %14, label %24

14:                                               ; preds = %12
  %15 = getelementptr inbounds [20 x i32], ptr %0, i64 19
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds [20 x i32], ptr %15, i64 0, i64 %16
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %20, label %21

20:                                               ; preds = %14
  br label %25

21:                                               ; preds = %14
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !12

24:                                               ; preds = %12
  br label %25

25:                                               ; preds = %24, %20
  %.0 = phi i32 [ 1, %20 ], [ 0, %24 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [20 x [20 x i32]], align 16
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  %4 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 0
  call void @init_grid(ptr noundef %4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %6 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 0
  call void @print_grid(ptr noundef %6)
  %7 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 0
  %8 = call i32 @percolates(ptr noundef %7)
  %9 = icmp ne i32 %8, 0
  %10 = zext i1 %9 to i64
  %11 = select i1 %9, ptr @.str.4, ptr @.str.5
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %11)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
!12 = distinct !{!12, !7}
