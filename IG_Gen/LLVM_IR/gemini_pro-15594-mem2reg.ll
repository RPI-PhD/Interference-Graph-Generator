; ModuleID = 'LLVM_IR/gemini_pro-15594.ll'
source_filename = "DATASETv2/gemini_pro-15594.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bingo_card = type { [5 x [5 x i32]], [5 x [5 x i32]] }

@.str = private unnamed_addr constant [18 x i8] c"Card %d has won!\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"No winners!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_card(ptr dead_on_unwind noalias writable sret(%struct.bingo_card) align 4 %0) #0 {
  br label %2

2:                                                ; preds = %21, %1
  %.0 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %3 = icmp slt i32 %.0, 5
  br i1 %3, label %4, label %23

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %18, %4
  %.01 = phi i32 [ 0, %4 ], [ %19, %18 ]
  %6 = icmp slt i32 %.01, 5
  br i1 %6, label %7, label %20

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 0
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [5 x [5 x i32]], ptr %8, i64 0, i64 %9
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds [5 x i32], ptr %10, i64 0, i64 %11
  store i32 0, ptr %12, align 4
  %13 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [5 x [5 x i32]], ptr %13, i64 0, i64 %14
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds [5 x i32], ptr %15, i64 0, i64 %16
  store i32 0, ptr %17, align 4
  br label %18

18:                                               ; preds = %7
  %19 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !6

20:                                               ; preds = %5
  br label %21

21:                                               ; preds = %20
  %22 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

23:                                               ; preds = %2
  br label %24

24:                                               ; preds = %41, %23
  %.02 = phi i32 [ 0, %23 ], [ %42, %41 ]
  %25 = icmp slt i32 %.02, 5
  br i1 %25, label %26, label %43

26:                                               ; preds = %24
  br label %27

27:                                               ; preds = %38, %26
  %.03 = phi i32 [ 0, %26 ], [ %39, %38 ]
  %28 = icmp slt i32 %.03, 5
  br i1 %28, label %29, label %40

29:                                               ; preds = %27
  %30 = call i32 @rand() #4
  %31 = srem i32 %30, 75
  %32 = add nsw i32 1, %31
  %33 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 0
  %34 = sext i32 %.02 to i64
  %35 = getelementptr inbounds [5 x [5 x i32]], ptr %33, i64 0, i64 %34
  %36 = sext i32 %.03 to i64
  %37 = getelementptr inbounds [5 x i32], ptr %35, i64 0, i64 %36
  store i32 %32, ptr %37, align 4
  br label %38

38:                                               ; preds = %29
  %39 = add nsw i32 %.03, 1
  br label %27, !llvm.loop !9

40:                                               ; preds = %27
  br label %41

41:                                               ; preds = %40
  %42 = add nsw i32 %.02, 1
  br label %24, !llvm.loop !10

43:                                               ; preds = %24
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @mark_number(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %26, %2
  %.01 = phi i32 [ 0, %2 ], [ %27, %26 ]
  %4 = icmp slt i32 %.01, 5
  br i1 %4, label %5, label %28

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %23, %5
  %.0 = phi i32 [ 0, %5 ], [ %24, %23 ]
  %7 = icmp slt i32 %.0, 5
  br i1 %7, label %8, label %25

8:                                                ; preds = %6
  %9 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 0
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [5 x [5 x i32]], ptr %9, i64 0, i64 %10
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [5 x i32], ptr %11, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = icmp eq i32 %14, %1
  br i1 %15, label %16, label %22

16:                                               ; preds = %8
  %17 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [5 x [5 x i32]], ptr %17, i64 0, i64 %18
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [5 x i32], ptr %19, i64 0, i64 %20
  store i32 1, ptr %21, align 4
  br label %22

22:                                               ; preds = %16, %8
  br label %23

23:                                               ; preds = %22
  %24 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !11

25:                                               ; preds = %6
  br label %26

26:                                               ; preds = %25
  %27 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !12

28:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_for_win(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %24, %1
  %.02 = phi i32 [ 0, %1 ], [ %25, %24 ]
  %3 = icmp slt i32 %.02, 5
  br i1 %3, label %4, label %26

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %18, %4
  %.04 = phi i32 [ 0, %4 ], [ %19, %18 ]
  %.03 = phi i32 [ 0, %4 ], [ %.1, %18 ]
  %6 = icmp slt i32 %.04, 5
  br i1 %6, label %7, label %20

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds [5 x [5 x i32]], ptr %8, i64 0, i64 %9
  %11 = sext i32 %.04 to i64
  %12 = getelementptr inbounds [5 x i32], ptr %10, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %17

15:                                               ; preds = %7
  %16 = add nsw i32 %.03, 1
  br label %17

17:                                               ; preds = %15, %7
  %.1 = phi i32 [ %16, %15 ], [ %.03, %7 ]
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.04, 1
  br label %5, !llvm.loop !13

20:                                               ; preds = %5
  %21 = icmp eq i32 %.03, 5
  br i1 %21, label %22, label %23

22:                                               ; preds = %20
  br label %91

23:                                               ; preds = %20
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !14

26:                                               ; preds = %2
  br label %27

27:                                               ; preds = %49, %26
  %.05 = phi i32 [ 0, %26 ], [ %50, %49 ]
  %28 = icmp slt i32 %.05, 5
  br i1 %28, label %29, label %51

29:                                               ; preds = %27
  br label %30

30:                                               ; preds = %43, %29
  %.08 = phi i32 [ 0, %29 ], [ %44, %43 ]
  %.06 = phi i32 [ 0, %29 ], [ %.17, %43 ]
  %31 = icmp slt i32 %.08, 5
  br i1 %31, label %32, label %45

32:                                               ; preds = %30
  %33 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %34 = sext i32 %.08 to i64
  %35 = getelementptr inbounds [5 x [5 x i32]], ptr %33, i64 0, i64 %34
  %36 = sext i32 %.05 to i64
  %37 = getelementptr inbounds [5 x i32], ptr %35, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %42

40:                                               ; preds = %32
  %41 = add nsw i32 %.06, 1
  br label %42

42:                                               ; preds = %40, %32
  %.17 = phi i32 [ %41, %40 ], [ %.06, %32 ]
  br label %43

43:                                               ; preds = %42
  %44 = add nsw i32 %.08, 1
  br label %30, !llvm.loop !15

45:                                               ; preds = %30
  %46 = icmp eq i32 %.06, 5
  br i1 %46, label %47, label %48

47:                                               ; preds = %45
  br label %91

48:                                               ; preds = %45
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %.05, 1
  br label %27, !llvm.loop !16

51:                                               ; preds = %27
  br label %52

52:                                               ; preds = %65, %51
  %.011 = phi i32 [ 0, %51 ], [ %66, %65 ]
  %.09 = phi i32 [ 0, %51 ], [ %.110, %65 ]
  %53 = icmp slt i32 %.011, 5
  br i1 %53, label %54, label %67

54:                                               ; preds = %52
  %55 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %56 = sext i32 %.011 to i64
  %57 = getelementptr inbounds [5 x [5 x i32]], ptr %55, i64 0, i64 %56
  %58 = sext i32 %.011 to i64
  %59 = getelementptr inbounds [5 x i32], ptr %57, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %64

62:                                               ; preds = %54
  %63 = add nsw i32 %.09, 1
  br label %64

64:                                               ; preds = %62, %54
  %.110 = phi i32 [ %63, %62 ], [ %.09, %54 ]
  br label %65

65:                                               ; preds = %64
  %66 = add nsw i32 %.011, 1
  br label %52, !llvm.loop !17

67:                                               ; preds = %52
  %68 = icmp eq i32 %.09, 5
  br i1 %68, label %69, label %70

69:                                               ; preds = %67
  br label %91

70:                                               ; preds = %67
  br label %71

71:                                               ; preds = %85, %70
  %.012 = phi i32 [ 0, %70 ], [ %.113, %85 ]
  %.01 = phi i32 [ 0, %70 ], [ %86, %85 ]
  %72 = icmp slt i32 %.01, 5
  br i1 %72, label %73, label %87

73:                                               ; preds = %71
  %74 = getelementptr inbounds %struct.bingo_card, ptr %0, i32 0, i32 1
  %75 = sext i32 %.01 to i64
  %76 = getelementptr inbounds [5 x [5 x i32]], ptr %74, i64 0, i64 %75
  %77 = sub nsw i32 4, %.01
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [5 x i32], ptr %76, i64 0, i64 %78
  %80 = load i32, ptr %79, align 4
  %81 = icmp eq i32 %80, 1
  br i1 %81, label %82, label %84

82:                                               ; preds = %73
  %83 = add nsw i32 %.012, 1
  br label %84

84:                                               ; preds = %82, %73
  %.113 = phi i32 [ %83, %82 ], [ %.012, %73 ]
  br label %85

85:                                               ; preds = %84
  %86 = add nsw i32 %.01, 1
  br label %71, !llvm.loop !18

87:                                               ; preds = %71
  %88 = icmp eq i32 %.012, 5
  br i1 %88, label %89, label %90

89:                                               ; preds = %87
  br label %91

90:                                               ; preds = %87
  br label %91

91:                                               ; preds = %90, %89, %69, %47, %22
  %.0 = phi i32 [ 1, %22 ], [ 1, %47 ], [ 1, %69 ], [ 1, %89 ], [ 0, %90 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @play_bingo() #0 {
  %1 = alloca [10 x %struct.bingo_card], align 16
  %2 = alloca %struct.bingo_card, align 4
  %3 = alloca [75 x i32], align 16
  br label %4

4:                                                ; preds = %9, %0
  %.0 = phi i32 [ 0, %0 ], [ %10, %9 ]
  %5 = icmp slt i32 %.0, 10
  br i1 %5, label %6, label %11

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %7
  call void @generate_card(ptr dead_on_unwind writable sret(%struct.bingo_card) align 4 %2)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 4 %2, i64 200, i1 false)
  br label %9

9:                                                ; preds = %6
  %10 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !19

11:                                               ; preds = %4
  br label %12

12:                                               ; preds = %18, %11
  %.01 = phi i32 [ 0, %11 ], [ %19, %18 ]
  %13 = icmp slt i32 %.01, 75
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = add nsw i32 1, %.01
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds [75 x i32], ptr %3, i64 0, i64 %16
  store i32 %15, ptr %17, align 4
  br label %18

18:                                               ; preds = %14
  %19 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !20

20:                                               ; preds = %12
  br label %21

21:                                               ; preds = %36, %20
  %.02 = phi i32 [ 0, %20 ], [ %37, %36 ]
  %22 = icmp slt i32 %.02, 75
  br i1 %22, label %23, label %38

23:                                               ; preds = %21
  %24 = call i32 @rand() #4
  %25 = srem i32 %24, 75
  %26 = sext i32 %.02 to i64
  %27 = getelementptr inbounds [75 x i32], ptr %3, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = sext i32 %25 to i64
  %30 = getelementptr inbounds [75 x i32], ptr %3, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %.02 to i64
  %33 = getelementptr inbounds [75 x i32], ptr %3, i64 0, i64 %32
  store i32 %31, ptr %33, align 4
  %34 = sext i32 %25 to i64
  %35 = getelementptr inbounds [75 x i32], ptr %3, i64 0, i64 %34
  store i32 %28, ptr %35, align 4
  br label %36

36:                                               ; preds = %23
  %37 = add nsw i32 %.02, 1
  br label %21, !llvm.loop !21

38:                                               ; preds = %21
  br label %39

39:                                               ; preds = %89, %38
  %.05 = phi i32 [ 0, %38 ], [ %45, %89 ]
  %40 = icmp slt i32 %.05, 75
  br i1 %40, label %41, label %90

41:                                               ; preds = %39
  %42 = sext i32 %.05 to i64
  %43 = getelementptr inbounds [75 x i32], ptr %3, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %.05, 1
  br label %46

46:                                               ; preds = %51, %41
  %.07 = phi i32 [ 0, %41 ], [ %52, %51 ]
  %47 = icmp slt i32 %.07, 10
  br i1 %47, label %48, label %53

48:                                               ; preds = %46
  %49 = sext i32 %.07 to i64
  %50 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %49
  call void @mark_number(ptr noundef %50, i32 noundef %44)
  br label %51

51:                                               ; preds = %48
  %52 = add nsw i32 %.07, 1
  br label %46, !llvm.loop !22

53:                                               ; preds = %46
  br label %54

54:                                               ; preds = %87, %53
  %.06 = phi i32 [ 0, %53 ], [ %88, %87 ]
  %55 = icmp slt i32 %.06, 10
  br i1 %55, label %56, label %89

56:                                               ; preds = %54
  %57 = sext i32 %.06 to i64
  %58 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %57
  %59 = call i32 @check_for_win(ptr noundef %58)
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %86

61:                                               ; preds = %56
  %62 = add nsw i32 %.06, 1
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %62)
  br label %64

64:                                               ; preds = %83, %61
  %.04 = phi i32 [ 0, %61 ], [ %84, %83 ]
  %65 = icmp slt i32 %.04, 5
  br i1 %65, label %66, label %85

66:                                               ; preds = %64
  br label %67

67:                                               ; preds = %79, %66
  %.03 = phi i32 [ 0, %66 ], [ %80, %79 ]
  %68 = icmp slt i32 %.03, 5
  br i1 %68, label %69, label %81

69:                                               ; preds = %67
  %70 = sext i32 %.06 to i64
  %71 = getelementptr inbounds [10 x %struct.bingo_card], ptr %1, i64 0, i64 %70
  %72 = getelementptr inbounds %struct.bingo_card, ptr %71, i32 0, i32 0
  %73 = sext i32 %.04 to i64
  %74 = getelementptr inbounds [5 x [5 x i32]], ptr %72, i64 0, i64 %73
  %75 = sext i32 %.03 to i64
  %76 = getelementptr inbounds [5 x i32], ptr %74, i64 0, i64 %75
  %77 = load i32, ptr %76, align 4
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %77)
  br label %79

79:                                               ; preds = %69
  %80 = add nsw i32 %.03, 1
  br label %67, !llvm.loop !23

81:                                               ; preds = %67
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %83

83:                                               ; preds = %81
  %84 = add nsw i32 %.04, 1
  br label %64, !llvm.loop !24

85:                                               ; preds = %64
  br label %92

86:                                               ; preds = %56
  br label %87

87:                                               ; preds = %86
  %88 = add nsw i32 %.06, 1
  br label %54, !llvm.loop !25

89:                                               ; preds = %54
  br label %39, !llvm.loop !26

90:                                               ; preds = %39
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %92

92:                                               ; preds = %90, %85
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #4
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #4
  call void @play_bingo()
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
