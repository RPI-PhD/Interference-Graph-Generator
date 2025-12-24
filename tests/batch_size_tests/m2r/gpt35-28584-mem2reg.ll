; ModuleID = 'LLVM_IR/gpt35-28584.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @checkWin() #0 {
  br label %1

1:                                                ; preds = %49, %0
  %.01 = phi i32 [ 0, %0 ], [ %50, %49 ]
  %2 = icmp slt i32 %.01, 3
  br i1 %2, label %3, label %51

3:                                                ; preds = %1
  %4 = sext i32 %.01 to i64
  %5 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %4
  %6 = getelementptr inbounds [3 x i32], ptr %5, i64 0, i64 0
  %7 = load i32, ptr %6, align 4
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %8
  %10 = getelementptr inbounds [3 x i32], ptr %9, i64 0, i64 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp eq i32 %7, %11
  br i1 %12, label %13, label %28

13:                                               ; preds = %3
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %14
  %16 = getelementptr inbounds [3 x i32], ptr %15, i64 0, i64 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %18
  %20 = getelementptr inbounds [3 x i32], ptr %19, i64 0, i64 2
  %21 = load i32, ptr %20, align 4
  %22 = icmp eq i32 %17, %21
  br i1 %22, label %23, label %28

23:                                               ; preds = %13
  %24 = sext i32 %.01 to i64
  %25 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %24
  %26 = getelementptr inbounds [3 x i32], ptr %25, i64 0, i64 0
  %27 = load i32, ptr %26, align 4
  br label %72

28:                                               ; preds = %13, %3
  %29 = sext i32 %.01 to i64
  %30 = getelementptr inbounds [3 x i32], ptr @table, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %.01 to i64
  %33 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1), i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = icmp eq i32 %31, %34
  br i1 %35, label %36, label %48

36:                                               ; preds = %28
  %37 = sext i32 %.01 to i64
  %38 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1), i64 0, i64 %37
  %39 = load i32, ptr %38, align 4
  %40 = sext i32 %.01 to i64
  %41 = getelementptr inbounds [3 x i32], ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 2), i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = icmp eq i32 %39, %42
  br i1 %43, label %44, label %48

44:                                               ; preds = %36
  %45 = sext i32 %.01 to i64
  %46 = getelementptr inbounds [3 x i32], ptr @table, i64 0, i64 %45
  %47 = load i32, ptr %46, align 4
  br label %72

48:                                               ; preds = %36, %28
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !6

51:                                               ; preds = %1
  %52 = load i32, ptr @table, align 16
  %53 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %54 = icmp eq i32 %52, %53
  br i1 %54, label %55, label %61

55:                                               ; preds = %51
  %56 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %57 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 2, i64 2), align 8
  %58 = icmp eq i32 %56, %57
  br i1 %58, label %59, label %61

59:                                               ; preds = %55
  %60 = load i32, ptr @table, align 16
  br label %72

61:                                               ; preds = %55, %51
  %62 = load i32, ptr getelementptr inbounds ([3 x i32], ptr @table, i64 0, i64 2), align 8
  %63 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %64 = icmp eq i32 %62, %63
  br i1 %64, label %65, label %71

65:                                               ; preds = %61
  %66 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 1, i64 1), align 4
  %67 = load i32, ptr getelementptr inbounds ([3 x [3 x i32]], ptr @table, i64 0, i64 2), align 8
  %68 = icmp eq i32 %66, %67
  br i1 %68, label %69, label %71

69:                                               ; preds = %65
  %70 = load i32, ptr getelementptr inbounds ([3 x i32], ptr @table, i64 0, i64 2), align 8
  br label %72

71:                                               ; preds = %65, %61
  br label %72

72:                                               ; preds = %71, %69, %59, %44, %23
  %.0 = phi i32 [ %27, %23 ], [ %47, %44 ], [ %60, %59 ], [ %70, %69 ], [ 0, %71 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printTable() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %2

2:                                                ; preds = %35, %0
  %.0 = phi i32 [ 0, %0 ], [ %36, %35 ]
  %3 = icmp slt i32 %.0, 3
  br i1 %3, label %4, label %37

4:                                                ; preds = %2
  %5 = add nsw i32 %.0, 1
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %5)
  br label %7

7:                                                ; preds = %31, %4
  %.01 = phi i32 [ 0, %4 ], [ %32, %31 ]
  %8 = icmp slt i32 %.01, 3
  br i1 %8, label %9, label %33

9:                                                ; preds = %7
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %10
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %9
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %30

18:                                               ; preds = %9
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %19
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [3 x i32], ptr %20, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %27

25:                                               ; preds = %18
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %29

27:                                               ; preds = %18
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %29

29:                                               ; preds = %27, %25
  br label %30

30:                                               ; preds = %29, %16
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.01, 1
  br label %7, !llvm.loop !8

33:                                               ; preds = %7
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %35

35:                                               ; preds = %33
  %36 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

37:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %6

6:                                                ; preds = %48, %30, %0
  %.02 = phi i32 [ 1, %0 ], [ %.02, %30 ], [ %52, %48 ]
  %.01 = phi i32 [ 1, %0 ], [ %.01, %30 ], [ %51, %48 ]
  %.0 = phi i32 [ 0, %0 ], [ %.0, %30 ], [ %.2, %48 ]
  %7 = icmp ne i32 %.0, 0
  %8 = xor i1 %7, true
  br i1 %8, label %9, label %53

9:                                                ; preds = %6
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %.02)
  call void @printTable()
  %11 = icmp eq i32 %.01, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %16

14:                                               ; preds = %9
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %16

16:                                               ; preds = %14, %12
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %1, ptr noundef %2)
  %18 = load i32, ptr %1, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, ptr %1, align 4
  %20 = load i32, ptr %2, align 4
  %21 = add nsw i32 %20, -1
  store i32 %21, ptr %2, align 4
  %22 = load i32, ptr %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %23
  %25 = load i32, ptr %2, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [3 x i32], ptr %24, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %16
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %6, !llvm.loop !10

32:                                               ; preds = %16
  %33 = load i32, ptr %1, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [3 x [3 x i32]], ptr @table, i64 0, i64 %34
  %36 = load i32, ptr %2, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x i32], ptr %35, i64 0, i64 %37
  store i32 %.01, ptr %38, align 4
  %39 = call i32 @checkWin()
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %32
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %.01)
  br label %48

43:                                               ; preds = %32
  %44 = icmp eq i32 %.02, 9
  br i1 %44, label %45, label %47

45:                                               ; preds = %43
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %47

47:                                               ; preds = %45, %43
  %.1 = phi i32 [ 1, %45 ], [ %.0, %43 ]
  br label %48

48:                                               ; preds = %47, %41
  %.2 = phi i32 [ 1, %41 ], [ %.1, %47 ]
  %49 = icmp eq i32 %.01, 1
  %50 = zext i1 %49 to i64
  %51 = select i1 %49, i32 2, i32 1
  %52 = add nsw i32 %.02, 1
  br label %6, !llvm.loop !10

53:                                               ; preds = %6
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

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
