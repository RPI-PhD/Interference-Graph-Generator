; ModuleID = 'LLVM_IR/falcon180b-33584.ll'
source_filename = "DATASETv2/falcon180b-33584.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@board = dso_local global [3 x [3 x i8]] zeroinitializer, align 1
@.str = private unnamed_addr constant [4 x i8] c"%c \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Player %d's turn: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Invalid move!\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Player %d wins!\0A\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"AI's turn: \00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"Welcome to Tic Tac Toe!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_board() #0 {
  br label %1

1:                                                ; preds = %14, %0
  %.0 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %2 = icmp slt i32 %.0, 3
  br i1 %2, label %3, label %16

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %11, %3
  %.01 = phi i32 [ 0, %3 ], [ %12, %11 ]
  %5 = icmp slt i32 %.01, 3
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  store i8 45, ptr %10, align 1
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !6

13:                                               ; preds = %4
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !8

16:                                               ; preds = %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board() #0 {
  br label %1

1:                                                ; preds = %18, %0
  %.0 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %2 = icmp slt i32 %.0, 3
  br i1 %2, label %3, label %20

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %14, %3
  %.01 = phi i32 [ 0, %3 ], [ %15, %14 ]
  %5 = icmp slt i32 %.01, 3
  br i1 %5, label %6, label %16

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12)
  br label %14

14:                                               ; preds = %6
  %15 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !9

16:                                               ; preds = %4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %18

18:                                               ; preds = %16
  %19 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

20:                                               ; preds = %1
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_winner() #0 {
  br label %1

1:                                                ; preds = %50, %0
  %.01 = phi i32 [ 0, %0 ], [ %51, %50 ]
  %2 = icmp slt i32 %.01, 3
  br i1 %2, label %3, label %52

3:                                                ; preds = %1
  %4 = sext i32 %.01 to i64
  %5 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %4
  %6 = getelementptr inbounds [3 x i8], ptr %5, i64 0, i64 0
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %9
  %11 = getelementptr inbounds [3 x i8], ptr %10, i64 0, i64 1
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %8, %13
  br i1 %14, label %15, label %28

15:                                               ; preds = %3
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %16
  %18 = getelementptr inbounds [3 x i8], ptr %17, i64 0, i64 1
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %21
  %23 = getelementptr inbounds [3 x i8], ptr %22, i64 0, i64 2
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %20, %25
  br i1 %26, label %27, label %28

27:                                               ; preds = %15
  br label %79

28:                                               ; preds = %15, %3
  %29 = sext i32 %.01 to i64
  %30 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = sext i32 %.01 to i64
  %34 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %33
  %35 = load i8, ptr %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %32, %36
  br i1 %37, label %38, label %49

38:                                               ; preds = %28
  %39 = sext i32 %.01 to i64
  %40 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = sext i8 %41 to i32
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), i64 0, i64 %43
  %45 = load i8, ptr %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %42, %46
  br i1 %47, label %48, label %49

48:                                               ; preds = %38
  br label %79

49:                                               ; preds = %38, %28
  br label %50

50:                                               ; preds = %49
  %51 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !11

52:                                               ; preds = %1
  %53 = load i8, ptr @board, align 1
  %54 = sext i8 %53 to i32
  %55 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %56 = sext i8 %55 to i32
  %57 = icmp eq i32 %54, %56
  br i1 %57, label %58, label %65

58:                                               ; preds = %52
  %59 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %60 = sext i8 %59 to i32
  %61 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %62 = sext i8 %61 to i32
  %63 = icmp eq i32 %60, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %58
  br label %79

65:                                               ; preds = %58, %52
  %66 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %67 = sext i8 %66 to i32
  %68 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %67, %69
  br i1 %70, label %71, label %78

71:                                               ; preds = %65
  %72 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %73 = sext i8 %72 to i32
  %74 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %75 = sext i8 %74 to i32
  %76 = icmp eq i32 %73, %75
  br i1 %76, label %77, label %78

77:                                               ; preds = %71
  br label %79

78:                                               ; preds = %71, %65
  br label %79

79:                                               ; preds = %78, %77, %64, %48, %27
  %.0 = phi i32 [ 1, %27 ], [ 1, %48 ], [ 1, %64 ], [ 1, %77 ], [ 0, %78 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @play_game() #0 {
  %1 = alloca i32, align 4
  call void @init_board()
  br label %2

2:                                                ; preds = %73, %28, %11, %0
  %.0 = phi i32 [ 0, %0 ], [ %.0, %11 ], [ %.0, %28 ], [ %46, %73 ]
  call void @print_board()
  %3 = add nsw i32 %.0, 1
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %3)
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %1)
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %1, align 4
  %10 = icmp sgt i32 %9, 8
  br i1 %10, label %11, label %13

11:                                               ; preds = %8, %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %2

13:                                               ; preds = %8
  %14 = srem i32 %.0, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = load i32, ptr %1, align 4
  br label %20

18:                                               ; preds = %13
  %19 = load i32, ptr %1, align 4
  br label %20

20:                                               ; preds = %18, %16
  %.02 = phi i32 [ %17, %16 ], [ 0, %18 ]
  %.01 = phi i32 [ 0, %16 ], [ %19, %18 ]
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %21
  %23 = sext i32 %.02 to i64
  %24 = getelementptr inbounds [3 x i8], ptr %22, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 45
  br i1 %27, label %28, label %30

28:                                               ; preds = %20
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %2

30:                                               ; preds = %20
  %31 = srem i32 %.0, 2
  %32 = icmp eq i32 %31, 0
  %33 = zext i1 %32 to i64
  %34 = select i1 %32, i32 88, i32 79
  %35 = trunc i32 %34 to i8
  %36 = sext i32 %.01 to i64
  %37 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %36
  %38 = sext i32 %.02 to i64
  %39 = getelementptr inbounds [3 x i8], ptr %37, i64 0, i64 %38
  store i8 %35, ptr %39, align 1
  %40 = call i32 @check_winner()
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %30
  %43 = add nsw i32 %.0, 1
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %43)
  br label %74

45:                                               ; preds = %30
  %46 = add nsw i32 %.0, 1
  %47 = srem i32 %46, 2
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %73

49:                                               ; preds = %45
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %51 = call i32 @rand() #3
  %52 = srem i32 %51, 9
  br label %53

53:                                               ; preds = %63, %49
  %.03 = phi i32 [ %52, %49 ], [ %65, %63 ]
  %54 = sdiv i32 %.03, 3
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %55
  %57 = srem i32 %.03, 3
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [3 x i8], ptr %56, i64 0, i64 %58
  %60 = load i8, ptr %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp ne i32 %61, 45
  br i1 %62, label %63, label %66

63:                                               ; preds = %53
  %64 = call i32 @rand() #3
  %65 = srem i32 %64, 9
  br label %53, !llvm.loop !12

66:                                               ; preds = %53
  %67 = sdiv i32 %.03, 3
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %68
  %70 = srem i32 %.03, 3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [3 x i8], ptr %69, i64 0, i64 %71
  store i8 79, ptr %72, align 1
  br label %73

73:                                               ; preds = %66, %45
  br label %2

74:                                               ; preds = %42
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  call void @play_game()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
