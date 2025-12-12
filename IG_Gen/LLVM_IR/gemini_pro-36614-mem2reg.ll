; ModuleID = 'LLVM_IR/gemini_pro-36614.ll'
source_filename = "DATASETv2/gemini_pro-36614.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Position = type { i32, i32 }

@board = dso_local global [4 x [4 x i8]] zeroinitializer, align 16
@matched = dso_local global [4 x [4 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%2d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%2d\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"   \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c" %c \00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"You can't select the same position twice!\0A\00", align 1
@.str.7 = private unnamed_addr constant [38 x i8] c"You can't select a matched position!\0A\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"You selected %c at (%d, %d) and %c at (%d, %d)\0A\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"You found a match!\0A\00", align 1
@.str.10 = private unnamed_addr constant [18 x i8] c"Sorry, no match!\0A\00", align 1
@.str.11 = private unnamed_addr constant [50 x i8] c"Enter the position of the first card (row, col): \00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.13 = private unnamed_addr constant [51 x i8] c"Enter the position of the second card (row, col): \00", align 1
@.str.14 = private unnamed_addr constant [55 x i8] c"Congratulations! You found all the pairs in %d moves.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_board() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  br label %3

3:                                                ; preds = %20, %0
  %.0 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %4 = icmp slt i32 %.0, 4
  br i1 %4, label %5, label %22

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %17, %5
  %.01 = phi i32 [ 0, %5 ], [ %18, %17 ]
  %7 = icmp slt i32 %.01, 4
  br i1 %7, label %8, label %19

8:                                                ; preds = %6
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 8
  %11 = add nsw i32 %10, 1
  %12 = trunc i32 %11 to i8
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %13
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds [4 x i8], ptr %14, i64 0, i64 %15
  store i8 %12, ptr %16, align 1
  br label %17

17:                                               ; preds = %8
  %18 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !6

19:                                               ; preds = %6
  br label %20

20:                                               ; preds = %19
  %21 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

22:                                               ; preds = %3
  br label %23

23:                                               ; preds = %54, %22
  %.1 = phi i32 [ 0, %22 ], [ %55, %54 ]
  %24 = icmp slt i32 %.1, 4
  br i1 %24, label %25, label %56

25:                                               ; preds = %23
  br label %26

26:                                               ; preds = %51, %25
  %.12 = phi i32 [ 0, %25 ], [ %52, %51 ]
  %27 = icmp slt i32 %.12, 4
  br i1 %27, label %28, label %53

28:                                               ; preds = %26
  %29 = call i32 @rand() #3
  %30 = srem i32 %29, 4
  %31 = call i32 @rand() #3
  %32 = srem i32 %31, 4
  %33 = sext i32 %.1 to i64
  %34 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %33
  %35 = sext i32 %.12 to i64
  %36 = getelementptr inbounds [4 x i8], ptr %34, i64 0, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = sext i32 %30 to i64
  %39 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %38
  %40 = sext i32 %32 to i64
  %41 = getelementptr inbounds [4 x i8], ptr %39, i64 0, i64 %40
  %42 = load i8, ptr %41, align 1
  %43 = sext i32 %.1 to i64
  %44 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %43
  %45 = sext i32 %.12 to i64
  %46 = getelementptr inbounds [4 x i8], ptr %44, i64 0, i64 %45
  store i8 %42, ptr %46, align 1
  %47 = sext i32 %30 to i64
  %48 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %47
  %49 = sext i32 %32 to i64
  %50 = getelementptr inbounds [4 x i8], ptr %48, i64 0, i64 %49
  store i8 %37, ptr %50, align 1
  br label %51

51:                                               ; preds = %28
  %52 = add nsw i32 %.12, 1
  br label %26, !llvm.loop !9

53:                                               ; preds = %26
  br label %54

54:                                               ; preds = %53
  %55 = add nsw i32 %.1, 1
  br label %23, !llvm.loop !10

56:                                               ; preds = %23
  br label %57

57:                                               ; preds = %70, %56
  %.2 = phi i32 [ 0, %56 ], [ %71, %70 ]
  %58 = icmp slt i32 %.2, 4
  br i1 %58, label %59, label %72

59:                                               ; preds = %57
  br label %60

60:                                               ; preds = %67, %59
  %.23 = phi i32 [ 0, %59 ], [ %68, %67 ]
  %61 = icmp slt i32 %.23, 4
  br i1 %61, label %62, label %69

62:                                               ; preds = %60
  %63 = sext i32 %.2 to i64
  %64 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %63
  %65 = sext i32 %.23 to i64
  %66 = getelementptr inbounds [4 x i32], ptr %64, i64 0, i64 %65
  store i32 0, ptr %66, align 4
  br label %67

67:                                               ; preds = %62
  %68 = add nsw i32 %.23, 1
  br label %60, !llvm.loop !11

69:                                               ; preds = %60
  br label %70

70:                                               ; preds = %69
  %71 = add nsw i32 %.2, 1
  br label %57, !llvm.loop !12

72:                                               ; preds = %57
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %2

2:                                                ; preds = %7, %0
  %.0 = phi i32 [ 0, %0 ], [ %8, %7 ]
  %3 = icmp slt i32 %.0, 4
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = add nsw i32 %.0, 1
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %5)
  br label %7

7:                                                ; preds = %4
  %8 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !13

9:                                                ; preds = %2
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %11

11:                                               ; preds = %40, %9
  %.1 = phi i32 [ 0, %9 ], [ %41, %40 ]
  %12 = icmp slt i32 %.1, 4
  br i1 %12, label %13, label %42

13:                                               ; preds = %11
  %14 = add nsw i32 %.1, 1
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %14)
  br label %16

16:                                               ; preds = %36, %13
  %.01 = phi i32 [ 0, %13 ], [ %37, %36 ]
  %17 = icmp slt i32 %.01, 4
  br i1 %17, label %18, label %38

18:                                               ; preds = %16
  %19 = sext i32 %.1 to i64
  %20 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %19
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [4 x i32], ptr %20, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %18
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %35

27:                                               ; preds = %18
  %28 = sext i32 %.1 to i64
  %29 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %28
  %30 = sext i32 %.01 to i64
  %31 = getelementptr inbounds [4 x i8], ptr %29, i64 0, i64 %30
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %33)
  br label %35

35:                                               ; preds = %27, %25
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.01, 1
  br label %16, !llvm.loop !14

38:                                               ; preds = %16
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %40

40:                                               ; preds = %38
  %41 = add nsw i32 %.1, 1
  br label %11, !llvm.loop !15

42:                                               ; preds = %11
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @make_move(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %4, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %115

16:                                               ; preds = %8, %2
  %17 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i32], ptr %20, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %38, label %27

27:                                               ; preds = %16
  %28 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %29 = load i32, ptr %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x i32], ptr %31, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %40

38:                                               ; preds = %27, %16
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %115

40:                                               ; preds = %27
  %41 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 0
  %42 = load i32, ptr %41, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %43
  %45 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 1
  %46 = load i32, ptr %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [4 x i8], ptr %44, i64 0, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = sext i8 %49 to i32
  %51 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 0
  %52 = load i32, ptr %51, align 4
  %53 = add nsw i32 %52, 1
  %54 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 1
  %55 = load i32, ptr %54, align 4
  %56 = add nsw i32 %55, 1
  %57 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %58 = load i32, ptr %57, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %62 = load i32, ptr %61, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [4 x i8], ptr %60, i64 0, i64 %63
  %65 = load i8, ptr %64, align 1
  %66 = sext i8 %65 to i32
  %67 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %68 = load i32, ptr %67, align 4
  %69 = add nsw i32 %68, 1
  %70 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %71 = load i32, ptr %70, align 4
  %72 = add nsw i32 %71, 1
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %50, i32 noundef %53, i32 noundef %56, i32 noundef %66, i32 noundef %69, i32 noundef %72)
  %74 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 0
  %75 = load i32, ptr %74, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %76
  %78 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 1
  %79 = load i32, ptr %78, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [4 x i8], ptr %77, i64 0, i64 %80
  %82 = load i8, ptr %81, align 1
  %83 = sext i8 %82 to i32
  %84 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %85 = load i32, ptr %84, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [4 x [4 x i8]], ptr @board, i64 0, i64 %86
  %88 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %89 = load i32, ptr %88, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [4 x i8], ptr %87, i64 0, i64 %90
  %92 = load i8, ptr %91, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp eq i32 %83, %93
  br i1 %94, label %95, label %113

95:                                               ; preds = %40
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %97 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 0
  %98 = load i32, ptr %97, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %99
  %101 = getelementptr inbounds %struct.Position, ptr %0, i32 0, i32 1
  %102 = load i32, ptr %101, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [4 x i32], ptr %100, i64 0, i64 %103
  store i32 1, ptr %104, align 4
  %105 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %106 = load i32, ptr %105, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [4 x [4 x i32]], ptr @matched, i64 0, i64 %107
  %109 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %110 = load i32, ptr %109, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [4 x i32], ptr %108, i64 0, i64 %111
  store i32 1, ptr %112, align 4
  br label %115

113:                                              ; preds = %40
  %114 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %115

115:                                              ; preds = %113, %95, %38, %14
  %.0 = phi i32 [ 0, %14 ], [ 0, %38 ], [ 1, %95 ], [ 0, %113 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Position, align 4
  %2 = alloca %struct.Position, align 4
  call void @init_board()
  br label %3

3:                                                ; preds = %30, %0
  %.01 = phi i32 [ 0, %0 ], [ %31, %30 ]
  %.0 = phi i32 [ 0, %0 ], [ %.1, %30 ]
  %4 = icmp slt i32 %.0, 8
  br i1 %4, label %5, label %32

5:                                                ; preds = %3
  call void @print_board()
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %7 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %8 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %7, ptr noundef %8)
  %10 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = add nsw i32 %11, -1
  store i32 %12, ptr %10, align 4
  %13 = getelementptr inbounds %struct.Position, ptr %1, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %13, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %17 = getelementptr inbounds %struct.Position, ptr %2, i32 0, i32 0
  %18 = getelementptr inbounds %struct.Position, ptr %2, i32 0, i32 1
  %19 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %17, ptr noundef %18)
  %20 = getelementptr inbounds %struct.Position, ptr %2, i32 0, i32 0
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %21, -1
  store i32 %22, ptr %20, align 4
  %23 = getelementptr inbounds %struct.Position, ptr %2, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, ptr %23, align 4
  %26 = call i32 @make_move(ptr noundef %1, ptr noundef %2)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %5
  %29 = add nsw i32 %.0, 1
  br label %30

30:                                               ; preds = %28, %5
  %.1 = phi i32 [ %29, %28 ], [ %.0, %5 ]
  %31 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !16

32:                                               ; preds = %3
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %.01)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

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
!16 = distinct !{!16, !7}
