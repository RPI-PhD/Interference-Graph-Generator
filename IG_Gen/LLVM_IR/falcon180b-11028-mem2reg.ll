; ModuleID = 'LLVM_IR/falcon180b-11028.ll'
source_filename = "DATASETv2/falcon180b-11028.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@rows = dso_local global i32 0, align 4
@cols = dso_local global i32 0, align 4
@grid = dso_local global [20 x [40 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@num_dropped = dso_local global i32 0, align 4
@num_percolated = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [18 x i8] c"Dropped %d drops\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Percolated %d times\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_grid() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  %3 = call i32 @rand() #3
  %4 = srem i32 %3, 20
  %5 = add nsw i32 %4, 2
  store i32 %5, ptr @rows, align 4
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 40
  %8 = add nsw i32 %7, 2
  store i32 %8, ptr @cols, align 4
  br label %9

9:                                                ; preds = %26, %0
  %.0 = phi i32 [ 0, %0 ], [ %27, %26 ]
  %10 = load i32, ptr @rows, align 4
  %11 = icmp slt i32 %.0, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  br label %13

13:                                               ; preds = %23, %12
  %.01 = phi i32 [ 0, %12 ], [ %24, %23 ]
  %14 = load i32, ptr @cols, align 4
  %15 = icmp slt i32 %.01, %14
  br i1 %15, label %16, label %25

16:                                               ; preds = %13
  %17 = call i32 @rand() #3
  %18 = srem i32 %17, 2
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %19
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [40 x i32], ptr %20, i64 0, i64 %21
  store i32 %18, ptr %22, align 4
  br label %23

23:                                               ; preds = %16
  %24 = add nsw i32 %.01, 1
  br label %13, !llvm.loop !6

25:                                               ; preds = %13
  br label %26

26:                                               ; preds = %25
  %27 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !8

28:                                               ; preds = %9
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_grid() #0 {
  br label %1

1:                                                ; preds = %19, %0
  %.0 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %2 = load i32, ptr @rows, align 4
  %3 = icmp slt i32 %.0, %2
  br i1 %3, label %4, label %21

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %15, %4
  %.01 = phi i32 [ 0, %4 ], [ %16, %15 ]
  %6 = load i32, ptr @cols, align 4
  %7 = icmp slt i32 %.01, %6
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %9
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds [40 x i32], ptr %10, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13)
  br label %15

15:                                               ; preds = %8
  %16 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !9

17:                                               ; preds = %5
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %19

19:                                               ; preds = %17
  %20 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

21:                                               ; preds = %1
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @num_neighbors(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %4, label %14

4:                                                ; preds = %2
  %5 = sub nsw i32 %0, 1
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %6
  %8 = sext i32 %1 to i64
  %9 = getelementptr inbounds [40 x i32], ptr %7, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %4
  %13 = add nsw i32 0, 1
  br label %14

14:                                               ; preds = %12, %4, %2
  %.0 = phi i32 [ %13, %12 ], [ 0, %4 ], [ 0, %2 ]
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %16, label %26

16:                                               ; preds = %14
  %17 = sext i32 %0 to i64
  %18 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %17
  %19 = sub nsw i32 %1, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [40 x i32], ptr %18, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %16
  %25 = add nsw i32 %.0, 1
  br label %26

26:                                               ; preds = %24, %16, %14
  %.1 = phi i32 [ %25, %24 ], [ %.0, %16 ], [ %.0, %14 ]
  %27 = load i32, ptr @rows, align 4
  %28 = sub nsw i32 %27, 1
  %29 = icmp slt i32 %0, %28
  br i1 %29, label %30, label %40

30:                                               ; preds = %26
  %31 = add nsw i32 %0, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %32
  %34 = sext i32 %1 to i64
  %35 = getelementptr inbounds [40 x i32], ptr %33, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %40

38:                                               ; preds = %30
  %39 = add nsw i32 %.1, 1
  br label %40

40:                                               ; preds = %38, %30, %26
  %.2 = phi i32 [ %39, %38 ], [ %.1, %30 ], [ %.1, %26 ]
  %41 = load i32, ptr @cols, align 4
  %42 = sub nsw i32 %41, 1
  %43 = icmp slt i32 %1, %42
  br i1 %43, label %44, label %54

44:                                               ; preds = %40
  %45 = sext i32 %0 to i64
  %46 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %45
  %47 = add nsw i32 %1, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [40 x i32], ptr %46, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %44
  %53 = add nsw i32 %.2, 1
  br label %54

54:                                               ; preds = %52, %44, %40
  %.3 = phi i32 [ %53, %52 ], [ %.2, %44 ], [ %.2, %40 ]
  ret i32 %.3
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @drop() #0 {
  br label %1

1:                                                ; preds = %20, %0
  %.03 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %.01 = phi i32 [ undef, %0 ], [ %.12, %20 ]
  %.0 = phi i32 [ undef, %0 ], [ %.1, %20 ]
  %2 = load i32, ptr @rows, align 4
  %3 = icmp slt i32 %.03, %2
  br i1 %3, label %4, label %22

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %17, %4
  %.04 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %6 = load i32, ptr @cols, align 4
  %7 = icmp slt i32 %.04, %6
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = sext i32 %.03 to i64
  %10 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %9
  %11 = sext i32 %.04 to i64
  %12 = getelementptr inbounds [40 x i32], ptr %10, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %16

15:                                               ; preds = %8
  br label %19

16:                                               ; preds = %8
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %.04, 1
  br label %5, !llvm.loop !11

19:                                               ; preds = %15, %5
  %.12 = phi i32 [ %.04, %15 ], [ %.01, %5 ]
  %.1 = phi i32 [ %.03, %15 ], [ %.0, %5 ]
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.03, 1
  br label %1, !llvm.loop !12

22:                                               ; preds = %1
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %23
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [40 x i32], ptr %24, i64 0, i64 %25
  store i32 0, ptr %26, align 4
  %27 = load i32, ptr @num_dropped, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr @num_dropped, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @percolate() #0 {
  br label %1

1:                                                ; preds = %20, %0
  %.03 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %.01 = phi i32 [ undef, %0 ], [ %.12, %20 ]
  %.0 = phi i32 [ undef, %0 ], [ %.1, %20 ]
  %2 = load i32, ptr @rows, align 4
  %3 = icmp slt i32 %.03, %2
  br i1 %3, label %4, label %22

4:                                                ; preds = %1
  br label %5

5:                                                ; preds = %17, %4
  %.04 = phi i32 [ 0, %4 ], [ %18, %17 ]
  %6 = load i32, ptr @cols, align 4
  %7 = icmp slt i32 %.04, %6
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = sext i32 %.03 to i64
  %10 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %9
  %11 = sext i32 %.04 to i64
  %12 = getelementptr inbounds [40 x i32], ptr %10, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %16

15:                                               ; preds = %8
  br label %19

16:                                               ; preds = %8
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %.04, 1
  br label %5, !llvm.loop !13

19:                                               ; preds = %15, %5
  %.12 = phi i32 [ %.04, %15 ], [ %.01, %5 ]
  %.1 = phi i32 [ %.03, %15 ], [ %.0, %5 ]
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.03, 1
  br label %1, !llvm.loop !14

22:                                               ; preds = %1
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %23
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [40 x i32], ptr %24, i64 0, i64 %25
  store i32 0, ptr %26, align 4
  %27 = load i32, ptr @num_percolated, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr @num_percolated, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @init_grid()
  br label %1

1:                                                ; preds = %8, %0
  %.0 = phi i32 [ 0, %0 ], [ %5, %8 ]
  %2 = load i32, ptr @num_percolated, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %9

4:                                                ; preds = %1
  call void @print_grid()
  call void @drop()
  %5 = add nsw i32 %.0, 1
  %6 = icmp eq i32 %5, 100
  br i1 %6, label %7, label %8

7:                                                ; preds = %4
  br label %9

8:                                                ; preds = %4
  br label %1, !llvm.loop !15

9:                                                ; preds = %7, %1
  %.1 = phi i32 [ %5, %7 ], [ %.0, %1 ]
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %.1)
  %11 = load i32, ptr @num_percolated, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %11)
  ret i32 0
}

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
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
