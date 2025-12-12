; ModuleID = 'LLVM_IR/falcon180b-55727.ll'
source_filename = "DATASETv2/falcon180b-55727.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32, i8 }

@card = dso_local global [5 x %struct.anon] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" %c \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" - \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"Attempt %d:\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Enter row and column: \00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"Correct!\0A\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"Incorrect.\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"Invalid input.\0A\00", align 1
@.str.9 = private unnamed_addr constant [42 x i8] c"Congratulations! You won in %d attempts.\0A\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"Try again.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_cards() #0 {
  br label %1

1:                                                ; preds = %19, %0
  %.0 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %2 = icmp slt i32 %.0, 5
  br i1 %2, label %3, label %21

3:                                                ; preds = %1
  %4 = call i32 @rand() #3
  %5 = srem i32 %4, 10
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [5 x %struct.anon], ptr @card, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.anon, ptr %7, i32 0, i32 0
  store i32 %5, ptr %8, align 4
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 10
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [5 x %struct.anon], ptr @card, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.anon, ptr %12, i32 0, i32 1
  store i32 %10, ptr %13, align 4
  %14 = add nsw i32 65, %.0
  %15 = trunc i32 %14 to i8
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [5 x %struct.anon], ptr @card, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.anon, ptr %17, i32 0, i32 2
  store i8 %15, ptr %18, align 4
  br label %19

19:                                               ; preds = %3
  %20 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !6

21:                                               ; preds = %1
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board() #0 {
  br label %1

1:                                                ; preds = %67, %0
  %.0 = phi i32 [ 0, %0 ], [ %68, %67 ]
  %2 = icmp slt i32 %.0, 10
  br i1 %2, label %3, label %69

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %63, %3
  %.01 = phi i32 [ 0, %3 ], [ %64, %63 ]
  %5 = icmp slt i32 %.01, 10
  br i1 %5, label %6, label %65

6:                                                ; preds = %4
  %7 = load i32, ptr @card, align 16
  %8 = icmp eq i32 %.0, %7
  br i1 %8, label %9, label %16

9:                                                ; preds = %6
  %10 = load i32, ptr getelementptr inbounds (%struct.anon, ptr @card, i32 0, i32 1), align 4
  %11 = icmp eq i32 %.01, %10
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i8, ptr getelementptr inbounds (%struct.anon, ptr @card, i32 0, i32 2), align 8
  %14 = sext i8 %13 to i32
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %14)
  br label %62

16:                                               ; preds = %9, %6
  %17 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1), align 4
  %18 = icmp eq i32 %.0, %17
  br i1 %18, label %19, label %26

19:                                               ; preds = %16
  %20 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1, i32 1), align 4
  %21 = icmp eq i32 %.01, %20
  br i1 %21, label %22, label %26

22:                                               ; preds = %19
  %23 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1, i32 2), align 4
  %24 = sext i8 %23 to i32
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %24)
  br label %61

26:                                               ; preds = %19, %16
  %27 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2), align 8
  %28 = icmp eq i32 %.0, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %26
  %30 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2, i32 1), align 4
  %31 = icmp eq i32 %.01, %30
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  %33 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2, i32 2), align 8
  %34 = sext i8 %33 to i32
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %34)
  br label %60

36:                                               ; preds = %29, %26
  %37 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3), align 4
  %38 = icmp eq i32 %.0, %37
  br i1 %38, label %39, label %46

39:                                               ; preds = %36
  %40 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3, i32 1), align 4
  %41 = icmp eq i32 %.01, %40
  br i1 %41, label %42, label %46

42:                                               ; preds = %39
  %43 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3, i32 2), align 4
  %44 = sext i8 %43 to i32
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %44)
  br label %59

46:                                               ; preds = %39, %36
  %47 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4), align 16
  %48 = icmp eq i32 %.0, %47
  br i1 %48, label %49, label %56

49:                                               ; preds = %46
  %50 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4, i32 1), align 4
  %51 = icmp eq i32 %.01, %50
  br i1 %51, label %52, label %56

52:                                               ; preds = %49
  %53 = load i8, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4, i32 2), align 8
  %54 = sext i8 %53 to i32
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %54)
  br label %58

56:                                               ; preds = %49, %46
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %58

58:                                               ; preds = %56, %52
  br label %59

59:                                               ; preds = %58, %42
  br label %60

60:                                               ; preds = %59, %32
  br label %61

61:                                               ; preds = %60, %22
  br label %62

62:                                               ; preds = %61, %12
  br label %63

63:                                               ; preds = %62
  %64 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

65:                                               ; preds = %4
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %67

67:                                               ; preds = %65
  %68 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !9

69:                                               ; preds = %1
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  call void @init_cards()
  br label %5

5:                                                ; preds = %94, %0
  %.01 = phi i32 [ 0, %0 ], [ %95, %94 ]
  %.0 = phi i32 [ 0, %0 ], [ %.1, %94 ]
  %6 = icmp slt i32 %.01, 3
  br i1 %6, label %7, label %96

7:                                                ; preds = %5
  %8 = add nsw i32 %.01, 1
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %8)
  call void @print_board()
  br label %10

10:                                               ; preds = %85, %7
  %.02 = phi i32 [ 0, %7 ], [ %.13, %85 ]
  %.1 = phi i32 [ %.0, %7 ], [ %.7, %85 ]
  %11 = icmp slt i32 %.02, 3
  br i1 %11, label %12, label %86

12:                                               ; preds = %10
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %1, ptr noundef %2)
  %15 = load i32, ptr %1, align 4
  %16 = icmp slt i32 %15, 10
  br i1 %16, label %17, label %83

17:                                               ; preds = %12
  %18 = load i32, ptr %2, align 4
  %19 = icmp slt i32 %18, 10
  br i1 %19, label %20, label %83

20:                                               ; preds = %17
  %21 = load i32, ptr %1, align 4
  %22 = load i32, ptr @card, align 16
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %31

24:                                               ; preds = %20
  %25 = load i32, ptr %2, align 4
  %26 = load i32, ptr getelementptr inbounds (%struct.anon, ptr @card, i32 0, i32 1), align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %31

28:                                               ; preds = %24
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %30 = add nsw i32 %.1, 1
  br label %81

31:                                               ; preds = %24, %20
  %32 = load i32, ptr %1, align 4
  %33 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1), align 4
  %34 = icmp eq i32 %32, %33
  br i1 %34, label %35, label %42

35:                                               ; preds = %31
  %36 = load i32, ptr %2, align 4
  %37 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 1, i32 1), align 4
  %38 = icmp eq i32 %36, %37
  br i1 %38, label %39, label %42

39:                                               ; preds = %35
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %41 = add nsw i32 %.1, 1
  br label %80

42:                                               ; preds = %35, %31
  %43 = load i32, ptr %1, align 4
  %44 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2), align 8
  %45 = icmp eq i32 %43, %44
  br i1 %45, label %46, label %53

46:                                               ; preds = %42
  %47 = load i32, ptr %2, align 4
  %48 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 2, i32 1), align 4
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %53

50:                                               ; preds = %46
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %52 = add nsw i32 %.1, 1
  br label %79

53:                                               ; preds = %46, %42
  %54 = load i32, ptr %1, align 4
  %55 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3), align 4
  %56 = icmp eq i32 %54, %55
  br i1 %56, label %57, label %64

57:                                               ; preds = %53
  %58 = load i32, ptr %2, align 4
  %59 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 3, i32 1), align 4
  %60 = icmp eq i32 %58, %59
  br i1 %60, label %61, label %64

61:                                               ; preds = %57
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %63 = add nsw i32 %.1, 1
  br label %78

64:                                               ; preds = %57, %53
  %65 = load i32, ptr %1, align 4
  %66 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4), align 16
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %75

68:                                               ; preds = %64
  %69 = load i32, ptr %2, align 4
  %70 = load i32, ptr getelementptr inbounds ([5 x %struct.anon], ptr @card, i64 0, i64 4, i32 1), align 4
  %71 = icmp eq i32 %69, %70
  br i1 %71, label %72, label %75

72:                                               ; preds = %68
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %74 = add nsw i32 %.1, 1
  br label %77

75:                                               ; preds = %68, %64
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %77

77:                                               ; preds = %75, %72
  %.2 = phi i32 [ %74, %72 ], [ %.1, %75 ]
  br label %78

78:                                               ; preds = %77, %61
  %.3 = phi i32 [ %63, %61 ], [ %.2, %77 ]
  br label %79

79:                                               ; preds = %78, %50
  %.4 = phi i32 [ %52, %50 ], [ %.3, %78 ]
  br label %80

80:                                               ; preds = %79, %39
  %.5 = phi i32 [ %41, %39 ], [ %.4, %79 ]
  br label %81

81:                                               ; preds = %80, %28
  %.6 = phi i32 [ %30, %28 ], [ %.5, %80 ]
  %82 = add nsw i32 %.02, 1
  br label %85

83:                                               ; preds = %17, %12
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %85

85:                                               ; preds = %83, %81
  %.13 = phi i32 [ %82, %81 ], [ %.02, %83 ]
  %.7 = phi i32 [ %.6, %81 ], [ %.1, %83 ]
  br label %10, !llvm.loop !10

86:                                               ; preds = %10
  %87 = icmp eq i32 %.1, 5
  br i1 %87, label %88, label %91

88:                                               ; preds = %86
  %89 = add nsw i32 %.01, 1
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %89)
  br label %96

91:                                               ; preds = %86
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %93

93:                                               ; preds = %91
  br label %94

94:                                               ; preds = %93
  %95 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !11

96:                                               ; preds = %88, %5
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

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
