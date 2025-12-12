; ModuleID = 'DATASETv2/gpt35-28584.c'
source_filename = "DATASETv2/gpt35-28584.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@table = dso_local global [3 x [3 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [14 x i8] c"   1   2   3\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"|   \00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"| X \00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"| O \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"|\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"Welcome to Table Game!\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"Turn %d:\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Player X, enter row and column: \00", align 1
@.str.9 = private unnamed_addr constant [33 x i8] c"Player O, enter row and column: \00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"That space is already taken!\0A\00", align 1
@.str.12 = private unnamed_addr constant [19 x i8] c"Player %d wins!!!\0A\00", align 1
@.str.13 = private unnamed_addr constant [15 x i8] c"It's a tie!!!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @checkWin() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %3

3:                                                ; preds = %62, %0
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %65

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %8
  %10 = getelementptr inbounds [3 x i32], ptr %9, i64 0, i64 0
  %11 = load i32, ptr %10, align 4
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %13
  %15 = getelementptr inbounds [3 x i32], ptr %14, i64 0, i64 1
  %16 = load i32, ptr %15, align 4
  %17 = icmp eq i32 %11, %16
  br i1 %17, label %18, label %36

18:                                               ; preds = %6
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %20
  %22 = getelementptr inbounds [3 x i32], ptr %21, i64 0, i64 1
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %25
  %27 = getelementptr inbounds [3 x i32], ptr %26, i64 0, i64 2
  %28 = load i32, ptr %27, align 4
  %29 = icmp eq i32 %23, %28
  br i1 %29, label %30, label %36

30:                                               ; preds = %18
  %31 = load i32, ptr %2, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %32
  %34 = getelementptr inbounds [3 x i32], ptr %33, i64 0, i64 0
  %35 = load i32, ptr %34, align 4
  store i32 %35, ptr %1, align 4
  br label %86

36:                                               ; preds = %18, %6
  %37 = load i32, ptr %2, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [3 x i32], ptr @table, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %2, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1), i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %40, %44
  br i1 %45, label %46, label %61

46:                                               ; preds = %36
  %47 = load i32, ptr %2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1), i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load i32, ptr %2, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 2), i64 0, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = icmp eq i32 %50, %54
  br i1 %55, label %56, label %61

56:                                               ; preds = %46
  %57 = load i32, ptr %2, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [3 x i32], ptr @table, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %1, align 4
  br label %86

61:                                               ; preds = %46, %36
  br label %62

62:                                               ; preds = %61
  %63 = load i32, ptr %2, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %2, align 4
  br label %3, !llvm.loop !6

65:                                               ; preds = %3
  %66 = load i32, ptr @table, align 16
  %67 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %68 = icmp eq i32 %66, %67
  br i1 %68, label %69, label %75

69:                                               ; preds = %65
  %70 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %71 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 2, i64 2), align 8
  %72 = icmp eq i32 %70, %71
  br i1 %72, label %73, label %75

73:                                               ; preds = %69
  %74 = load i32, ptr @table, align 16
  store i32 %74, ptr %1, align 4
  br label %86

75:                                               ; preds = %69, %65
  %76 = load i32, ptr getelementptr inbounds ([3 x i32], ptr @table, i64 0, i64 2), align 8
  %77 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %78 = icmp eq i32 %76, %77
  br i1 %78, label %79, label %85

79:                                               ; preds = %75
  %80 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %81 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 2), align 8
  %82 = icmp eq i32 %80, %81
  br i1 %82, label %83, label %85

83:                                               ; preds = %79
  %84 = load i32, ptr getelementptr inbounds ([3 x i32], ptr @table, i64 0, i64 2), align 8
  store i32 %84, ptr %1, align 4
  br label %86

85:                                               ; preds = %79, %75
  store i32 0, ptr %1, align 4
  br label %86

86:                                               ; preds = %85, %83, %73, %56, %30
  %87 = load i32, ptr %1, align 4
  ret i32 %87
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printTable() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %45, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %48

7:                                                ; preds = %4
  %8 = load i32, ptr %1, align 4
  %9 = add nsw i32 %8, 1
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %9)
  store i32 0, ptr %2, align 4
  br label %11

11:                                               ; preds = %40, %7
  %12 = load i32, ptr %2, align 4
  %13 = icmp slt i32 %12, 3
  br i1 %13, label %14, label %43

14:                                               ; preds = %11
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %16
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [3 x i32], ptr %17, i64 0, i64 %19
  %21 = load i32, ptr %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %14
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %39

25:                                               ; preds = %14
  %26 = load i32, ptr %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %27
  %29 = load i32, ptr %2, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x i32], ptr %28, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = icmp eq i32 %32, 1
  br i1 %33, label %34, label %36

34:                                               ; preds = %25
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %38

36:                                               ; preds = %25
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %38

38:                                               ; preds = %36, %34
  br label %39

39:                                               ; preds = %38, %23
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %2, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %2, align 4
  br label %11, !llvm.loop !8

43:                                               ; preds = %11
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %45

45:                                               ; preds = %43
  %46 = load i32, ptr %1, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %1, align 4
  br label %4, !llvm.loop !9

48:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %7 = call i64 @time(ptr noundef null) #3
  %8 = trunc i64 %7 to i32
  call void @srand(i32 noundef %8) #3
  store i32 1, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %10

10:                                               ; preds = %58, %37, %0
  %11 = load i32, ptr %4, align 4
  %12 = icmp ne i32 %11, 0
  %13 = xor i1 %12, true
  br i1 %13, label %14, label %65

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %15)
  call void @printTable()
  %17 = load i32, ptr %2, align 4
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %21

19:                                               ; preds = %14
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %23

21:                                               ; preds = %14
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %23

23:                                               ; preds = %21, %19
  %24 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %5, ptr noundef %6)
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, ptr %5, align 4
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, -1
  store i32 %28, ptr %6, align 4
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %30
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [3 x i32], ptr %31, i64 0, i64 %33
  %35 = load i32, ptr %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %23
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %10, !llvm.loop !10

39:                                               ; preds = %23
  %40 = load i32, ptr %2, align 4
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %42
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [3 x i32], ptr %43, i64 0, i64 %45
  store i32 %40, ptr %46, align 4
  %47 = call i32 @checkWin()
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %52

49:                                               ; preds = %39
  %50 = load i32, ptr %2, align 4
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %50)
  store i32 1, ptr %4, align 4
  br label %58

52:                                               ; preds = %39
  %53 = load i32, ptr %3, align 4
  %54 = icmp eq i32 %53, 9
  br i1 %54, label %55, label %57

55:                                               ; preds = %52
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  store i32 1, ptr %4, align 4
  br label %57

57:                                               ; preds = %55, %52
  br label %58

58:                                               ; preds = %57, %49
  %59 = load i32, ptr %2, align 4
  %60 = icmp eq i32 %59, 1
  %61 = zext i1 %60 to i64
  %62 = select i1 %60, i32 2, i32 1
  store i32 %62, ptr %2, align 4
  %63 = load i32, ptr %3, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %3, align 4
  br label %10, !llvm.loop !10

65:                                               ; preds = %10
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

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
