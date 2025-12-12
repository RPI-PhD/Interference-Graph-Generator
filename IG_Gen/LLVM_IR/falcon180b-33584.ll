; ModuleID = 'DATASETv2/falcon180b-33584.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %21, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %24

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %17, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %20

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %12
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x i8], ptr %13, i64 0, i64 %15
  store i8 45, ptr %16, align 1
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %2, align 4
  br label %7, !llvm.loop !6

20:                                               ; preds = %7
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %1, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %1, align 4
  br label %3, !llvm.loop !8

24:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %25, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %28

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %20, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %23

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %12
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [3 x i8], ptr %13, i64 0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18)
  br label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %2, align 4
  br label %7, !llvm.loop !9

23:                                               ; preds = %7
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %25

25:                                               ; preds = %23
  %26 = load i32, ptr %1, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %1, align 4
  br label %3, !llvm.loop !10

28:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @check_winner() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %3

3:                                                ; preds = %61, %0
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %64

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %8
  %10 = getelementptr inbounds [3 x i8], ptr %9, i64 0, i64 0
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %14
  %16 = getelementptr inbounds [3 x i8], ptr %15, i64 0, i64 1
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %12, %18
  br i1 %19, label %20, label %35

20:                                               ; preds = %6
  %21 = load i32, ptr %2, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %22
  %24 = getelementptr inbounds [3 x i8], ptr %23, i64 0, i64 1
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = load i32, ptr %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %28
  %30 = getelementptr inbounds [3 x i8], ptr %29, i64 0, i64 2
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %26, %32
  br i1 %33, label %34, label %35

34:                                               ; preds = %20
  store i32 1, ptr %1, align 4
  br label %91

35:                                               ; preds = %20, %6
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x i8], ptr @board, i64 0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = load i32, ptr %2, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %40, %45
  br i1 %46, label %47, label %60

47:                                               ; preds = %35
  %48 = load i32, ptr %2, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1), i64 0, i64 %49
  %51 = load i8, ptr %50, align 1
  %52 = sext i8 %51 to i32
  %53 = load i32, ptr %2, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [3 x i8], ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), i64 0, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp eq i32 %52, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %47
  store i32 1, ptr %1, align 4
  br label %91

60:                                               ; preds = %47, %35
  br label %61

61:                                               ; preds = %60
  %62 = load i32, ptr %2, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %2, align 4
  br label %3, !llvm.loop !11

64:                                               ; preds = %3
  %65 = load i8, ptr @board, align 1
  %66 = sext i8 %65 to i32
  %67 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %68 = sext i8 %67 to i32
  %69 = icmp eq i32 %66, %68
  br i1 %69, label %70, label %77

70:                                               ; preds = %64
  %71 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %72 = sext i8 %71 to i32
  %73 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2, i64 2), align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %76, label %77

76:                                               ; preds = %70
  store i32 1, ptr %1, align 4
  br label %91

77:                                               ; preds = %70, %64
  %78 = load i8, ptr getelementptr inbounds ([3 x i8], ptr @board, i64 0, i64 2), align 1
  %79 = sext i8 %78 to i32
  %80 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %81 = sext i8 %80 to i32
  %82 = icmp eq i32 %79, %81
  br i1 %82, label %83, label %90

83:                                               ; preds = %77
  %84 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 1, i64 1), align 1
  %85 = sext i8 %84 to i32
  %86 = load i8, ptr getelementptr inbounds ([3 x [3 x i8]], ptr @board, i64 0, i64 2), align 1
  %87 = sext i8 %86 to i32
  %88 = icmp eq i32 %85, %87
  br i1 %88, label %89, label %90

89:                                               ; preds = %83
  store i32 1, ptr %1, align 4
  br label %91

90:                                               ; preds = %83, %77
  store i32 0, ptr %1, align 4
  br label %91

91:                                               ; preds = %90, %89, %76, %59, %34
  %92 = load i32, ptr %1, align 4
  ret i32 %92
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @play_game() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @init_board()
  br label %6

6:                                                ; preds = %0, %16, %36, %91
  call void @print_board()
  %7 = load i32, ptr %1, align 4
  %8 = add nsw i32 %7, 1
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %8)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %2)
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %6
  %14 = load i32, ptr %2, align 4
  %15 = icmp sgt i32 %14, 8
  br i1 %15, label %16, label %18

16:                                               ; preds = %13, %6
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %6

18:                                               ; preds = %13
  %19 = load i32, ptr %1, align 4
  %20 = srem i32 %19, 2
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %18
  store i32 0, ptr %3, align 4
  %23 = load i32, ptr %2, align 4
  store i32 %23, ptr %4, align 4
  br label %26

24:                                               ; preds = %18
  %25 = load i32, ptr %2, align 4
  store i32 %25, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %26

26:                                               ; preds = %24, %22
  %27 = load i32, ptr %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %28
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [3 x i8], ptr %29, i64 0, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 45
  br i1 %35, label %36, label %38

36:                                               ; preds = %26
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %6

38:                                               ; preds = %26
  %39 = load i32, ptr %1, align 4
  %40 = srem i32 %39, 2
  %41 = icmp eq i32 %40, 0
  %42 = zext i1 %41 to i64
  %43 = select i1 %41, i32 88, i32 79
  %44 = trunc i32 %43 to i8
  %45 = load i32, ptr %3, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %46
  %48 = load i32, ptr %4, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [3 x i8], ptr %47, i64 0, i64 %49
  store i8 %44, ptr %50, align 1
  %51 = call i32 @check_winner()
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %57

53:                                               ; preds = %38
  %54 = load i32, ptr %1, align 4
  %55 = add nsw i32 %54, 1
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %55)
  br label %92

57:                                               ; preds = %38
  %58 = load i32, ptr %1, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %1, align 4
  %60 = load i32, ptr %1, align 4
  %61 = srem i32 %60, 2
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %91

63:                                               ; preds = %57
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %65 = call i32 @rand() #3
  %66 = srem i32 %65, 9
  store i32 %66, ptr %5, align 4
  br label %67

67:                                               ; preds = %79, %63
  %68 = load i32, ptr %5, align 4
  %69 = sdiv i32 %68, 3
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %70
  %72 = load i32, ptr %5, align 4
  %73 = srem i32 %72, 3
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [3 x i8], ptr %71, i64 0, i64 %74
  %76 = load i8, ptr %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp ne i32 %77, 45
  br i1 %78, label %79, label %82

79:                                               ; preds = %67
  %80 = call i32 @rand() #3
  %81 = srem i32 %80, 9
  store i32 %81, ptr %5, align 4
  br label %67, !llvm.loop !12

82:                                               ; preds = %67
  %83 = load i32, ptr %5, align 4
  %84 = sdiv i32 %83, 3
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [3 x [3 x i8]], ptr @board, i64 0, i64 %85
  %87 = load i32, ptr %5, align 4
  %88 = srem i32 %87, 3
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [3 x i8], ptr %86, i64 0, i64 %89
  store i8 79, ptr %90, align 1
  br label %91

91:                                               ; preds = %82, %57
  br label %6

92:                                               ; preds = %53
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  call void @play_game()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
