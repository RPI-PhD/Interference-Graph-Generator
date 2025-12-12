; ModuleID = 'DATASETv2/falcon180b-11028.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_grid() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  %5 = call i32 @rand() #3
  %6 = srem i32 %5, 20
  %7 = add nsw i32 %6, 2
  store i32 %7, ptr @rows, align 4
  %8 = call i32 @rand() #3
  %9 = srem i32 %8, 40
  %10 = add nsw i32 %9, 2
  store i32 %10, ptr @cols, align 4
  store i32 0, ptr %1, align 4
  br label %11

11:                                               ; preds = %33, %0
  %12 = load i32, ptr %1, align 4
  %13 = load i32, ptr @rows, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %36

15:                                               ; preds = %11
  store i32 0, ptr %2, align 4
  br label %16

16:                                               ; preds = %29, %15
  %17 = load i32, ptr %2, align 4
  %18 = load i32, ptr @cols, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %32

20:                                               ; preds = %16
  %21 = call i32 @rand() #3
  %22 = srem i32 %21, 2
  %23 = load i32, ptr %1, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %24
  %26 = load i32, ptr %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [40 x i32], ptr %25, i64 0, i64 %27
  store i32 %22, ptr %28, align 4
  br label %29

29:                                               ; preds = %20
  %30 = load i32, ptr %2, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %2, align 4
  br label %16, !llvm.loop !6

32:                                               ; preds = %16
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %1, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %1, align 4
  br label %11, !llvm.loop !8

36:                                               ; preds = %11
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_grid() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %26, %0
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr @rows, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %29

7:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %21, %7
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr @cols, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %24

12:                                               ; preds = %8
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %14
  %16 = load i32, ptr %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [40 x i32], ptr %15, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %19)
  br label %21

21:                                               ; preds = %12
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %2, align 4
  br label %8, !llvm.loop !9

24:                                               ; preds = %8
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %26

26:                                               ; preds = %24
  %27 = load i32, ptr %1, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %1, align 4
  br label %3, !llvm.loop !10

29:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @num_neighbors(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 0
  br i1 %7, label %8, label %21

8:                                                ; preds = %2
  %9 = load i32, ptr %3, align 4
  %10 = sub nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %11
  %13 = load i32, ptr %4, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [40 x i32], ptr %12, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %8
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %21

21:                                               ; preds = %18, %8, %2
  %22 = load i32, ptr %4, align 4
  %23 = icmp sgt i32 %22, 0
  br i1 %23, label %24, label %37

24:                                               ; preds = %21
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %26
  %28 = load i32, ptr %4, align 4
  %29 = sub nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [40 x i32], ptr %27, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %37

34:                                               ; preds = %24
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %5, align 4
  br label %37

37:                                               ; preds = %34, %24, %21
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr @rows, align 4
  %40 = sub nsw i32 %39, 1
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %42, label %55

42:                                               ; preds = %37
  %43 = load i32, ptr %3, align 4
  %44 = add nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %45
  %47 = load i32, ptr %4, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [40 x i32], ptr %46, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %42
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %5, align 4
  br label %55

55:                                               ; preds = %52, %42, %37
  %56 = load i32, ptr %4, align 4
  %57 = load i32, ptr @cols, align 4
  %58 = sub nsw i32 %57, 1
  %59 = icmp slt i32 %56, %58
  br i1 %59, label %60, label %73

60:                                               ; preds = %55
  %61 = load i32, ptr %3, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %62
  %64 = load i32, ptr %4, align 4
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [40 x i32], ptr %63, i64 0, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %73

70:                                               ; preds = %60
  %71 = load i32, ptr %5, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %5, align 4
  br label %73

73:                                               ; preds = %70, %60, %55
  %74 = load i32, ptr %5, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @drop() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %31, %0
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr @rows, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %34

9:                                                ; preds = %5
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %27, %9
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr @cols, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %16
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [40 x i32], ptr %17, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %26

23:                                               ; preds = %14
  %24 = load i32, ptr %3, align 4
  store i32 %24, ptr %1, align 4
  %25 = load i32, ptr %4, align 4
  store i32 %25, ptr %2, align 4
  br label %30

26:                                               ; preds = %14
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %4, align 4
  br label %10, !llvm.loop !11

30:                                               ; preds = %23, %10
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %5, !llvm.loop !12

34:                                               ; preds = %5
  %35 = load i32, ptr %1, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %36
  %38 = load i32, ptr %2, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [40 x i32], ptr %37, i64 0, i64 %39
  store i32 0, ptr %40, align 4
  %41 = load i32, ptr @num_dropped, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr @num_dropped, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @percolate() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %31, %0
  %6 = load i32, ptr %3, align 4
  %7 = load i32, ptr @rows, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %34

9:                                                ; preds = %5
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %27, %9
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr @cols, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %16
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [40 x i32], ptr %17, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %26

23:                                               ; preds = %14
  %24 = load i32, ptr %3, align 4
  store i32 %24, ptr %1, align 4
  %25 = load i32, ptr %4, align 4
  store i32 %25, ptr %2, align 4
  br label %30

26:                                               ; preds = %14
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %4, align 4
  br label %10, !llvm.loop !13

30:                                               ; preds = %23, %10
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %5, !llvm.loop !14

34:                                               ; preds = %5
  %35 = load i32, ptr %1, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [20 x [40 x i32]], ptr @grid, i64 0, i64 %36
  %38 = load i32, ptr %2, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [40 x i32], ptr %37, i64 0, i64 %39
  store i32 0, ptr %40, align 4
  %41 = load i32, ptr @num_percolated, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr @num_percolated, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @init_grid()
  store i32 0, ptr %2, align 4
  br label %3

3:                                                ; preds = %12, %0
  %4 = load i32, ptr @num_percolated, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %3
  call void @print_grid()
  call void @drop()
  %7 = load i32, ptr %2, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, ptr %2, align 4
  %9 = load i32, ptr %2, align 4
  %10 = icmp eq i32 %9, 100
  br i1 %10, label %11, label %12

11:                                               ; preds = %6
  br label %13

12:                                               ; preds = %6
  br label %3, !llvm.loop !15

13:                                               ; preds = %11, %3
  %14 = load i32, ptr %2, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %14)
  %16 = load i32, ptr @num_percolated, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %16)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
