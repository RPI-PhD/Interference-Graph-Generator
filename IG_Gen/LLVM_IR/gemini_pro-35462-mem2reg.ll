; ModuleID = 'LLVM_IR/gemini_pro-35462.ll'
source_filename = "DATASETv2/gemini_pro-35462.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.BingoGame = type { [100 x %struct.BingoCard], i32 }
%struct.BingoCard = type { [90 x i32], [90 x i32] }

@.str = private unnamed_addr constant [15 x i8] c"Winning card:\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%2d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Card %d:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.BingoGame, align 4
  %2 = alloca %struct.BingoCard, align 4
  %3 = call i64 @time(ptr noundef null) #4
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #4
  %5 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 1
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %38, %0
  %.01 = phi i32 [ 0, %0 ], [ %39, %38 ]
  %7 = icmp slt i32 %.01, 100
  br i1 %7, label %8, label %40

8:                                                ; preds = %6
  br label %9

9:                                                ; preds = %18, %8
  %.02 = phi i32 [ 0, %8 ], [ %19, %18 ]
  %10 = icmp slt i32 %.02, 90
  br i1 %10, label %11, label %20

11:                                               ; preds = %9
  %12 = call i32 @rand() #4
  %13 = srem i32 %12, 90
  %14 = add nsw i32 %13, 1
  %15 = getelementptr inbounds %struct.BingoCard, ptr %2, i32 0, i32 0
  %16 = sext i32 %.02 to i64
  %17 = getelementptr inbounds [90 x i32], ptr %15, i64 0, i64 %16
  store i32 %14, ptr %17, align 4
  br label %18

18:                                               ; preds = %11
  %19 = add nsw i32 %.02, 1
  br label %9, !llvm.loop !6

20:                                               ; preds = %9
  br label %21

21:                                               ; preds = %27, %20
  %.03 = phi i32 [ 0, %20 ], [ %28, %27 ]
  %22 = icmp slt i32 %.03, 90
  br i1 %22, label %23, label %29

23:                                               ; preds = %21
  %24 = getelementptr inbounds %struct.BingoCard, ptr %2, i32 0, i32 1
  %25 = sext i32 %.03 to i64
  %26 = getelementptr inbounds [90 x i32], ptr %24, i64 0, i64 %25
  store i32 0, ptr %26, align 4
  br label %27

27:                                               ; preds = %23
  %28 = add nsw i32 %.03, 1
  br label %21, !llvm.loop !8

29:                                               ; preds = %21
  %30 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 0
  %31 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x %struct.BingoCard], ptr %30, i64 0, i64 %33
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %34, ptr align 4 %2, i64 720, i1 false)
  %35 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %35, align 4
  br label %38

38:                                               ; preds = %29
  %39 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !9

40:                                               ; preds = %6
  call void @print_game(ptr noundef %1)
  br label %41

41:                                               ; preds = %72, %40
  %.04 = phi i32 [ -1, %40 ], [ %.1, %72 ]
  %42 = icmp eq i32 %.04, -1
  br i1 %42, label %43, label %73

43:                                               ; preds = %41
  %44 = call i32 @rand() #4
  %45 = srem i32 %44, 90
  %46 = add nsw i32 %45, 1
  br label %47

47:                                               ; preds = %55, %43
  %.05 = phi i32 [ 0, %43 ], [ %56, %55 ]
  %48 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 1
  %49 = load i32, ptr %48, align 4
  %50 = icmp slt i32 %.05, %49
  br i1 %50, label %51, label %57

51:                                               ; preds = %47
  %52 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 0
  %53 = sext i32 %.05 to i64
  %54 = getelementptr inbounds [100 x %struct.BingoCard], ptr %52, i64 0, i64 %53
  call void @mark_number(ptr noundef %54, i32 noundef %46)
  br label %55

55:                                               ; preds = %51
  %56 = add nsw i32 %.05, 1
  br label %47, !llvm.loop !10

57:                                               ; preds = %47
  br label %58

58:                                               ; preds = %70, %57
  %.0 = phi i32 [ 0, %57 ], [ %71, %70 ]
  %59 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 1
  %60 = load i32, ptr %59, align 4
  %61 = icmp slt i32 %.0, %60
  br i1 %61, label %62, label %72

62:                                               ; preds = %58
  %63 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 0
  %64 = sext i32 %.0 to i64
  %65 = getelementptr inbounds [100 x %struct.BingoCard], ptr %63, i64 0, i64 %64
  %66 = call i32 @check_card(ptr noundef %65)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %69

68:                                               ; preds = %62
  br label %72

69:                                               ; preds = %62
  br label %70

70:                                               ; preds = %69
  %71 = add nsw i32 %.0, 1
  br label %58, !llvm.loop !11

72:                                               ; preds = %68, %58
  %.1 = phi i32 [ %.0, %68 ], [ %.04, %58 ]
  call void @print_game(ptr noundef %1)
  br label %41, !llvm.loop !12

73:                                               ; preds = %41
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %75 = getelementptr inbounds %struct.BingoGame, ptr %1, i32 0, i32 0
  %76 = sext i32 %.04 to i64
  %77 = getelementptr inbounds [100 x %struct.BingoCard], ptr %75, i64 0, i64 %76
  call void @print_card(ptr noundef %77)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_game(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %13, %1
  %.0 = phi i32 [ 0, %1 ], [ %14, %13 ]
  %3 = getelementptr inbounds %struct.BingoGame, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %15

6:                                                ; preds = %2
  %7 = add nsw i32 %.0, 1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %7)
  %9 = getelementptr inbounds %struct.BingoGame, ptr %0, i32 0, i32 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.BingoCard], ptr %9, i64 0, i64 %10
  call void @print_card(ptr noundef %11)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %13

13:                                               ; preds = %6
  %14 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !13

15:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @mark_number(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %4 = icmp slt i32 %.0, 90
  br i1 %4, label %5, label %18

5:                                                ; preds = %3
  %6 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 0
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [90 x i32], ptr %6, i64 0, i64 %7
  %9 = load i32, ptr %8, align 4
  %10 = icmp eq i32 %9, %1
  br i1 %10, label %11, label %15

11:                                               ; preds = %5
  %12 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 1
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [90 x i32], ptr %12, i64 0, i64 %13
  store i32 1, ptr %14, align 4
  br label %18

15:                                               ; preds = %5
  br label %16

16:                                               ; preds = %15
  %17 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !14

18:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_card(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %24, %1
  %.02 = phi i32 [ 0, %1 ], [ %25, %24 ]
  %3 = icmp slt i32 %.02, 3
  br i1 %3, label %4, label %26

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %18, %4
  %.04 = phi i32 [ 0, %4 ], [ %19, %18 ]
  %.03 = phi i32 [ 0, %4 ], [ %.1, %18 ]
  %6 = icmp slt i32 %.04, 5
  br i1 %6, label %7, label %20

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 1
  %9 = mul nsw i32 %.02, 5
  %10 = add nsw i32 %9, %.04
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [90 x i32], ptr %8, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %7
  %16 = add nsw i32 %.03, 1
  br label %17

17:                                               ; preds = %15, %7
  %.1 = phi i32 [ %16, %15 ], [ %.03, %7 ]
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.04, 1
  br label %5, !llvm.loop !15

20:                                               ; preds = %5
  %21 = icmp eq i32 %.03, 5
  br i1 %21, label %22, label %23

22:                                               ; preds = %20
  br label %84

23:                                               ; preds = %20
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !16

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
  %31 = icmp slt i32 %.08, 3
  br i1 %31, label %32, label %45

32:                                               ; preds = %30
  %33 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 1
  %34 = mul nsw i32 %.08, 5
  %35 = add nsw i32 %34, %.05
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [90 x i32], ptr %33, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %32
  %41 = add nsw i32 %.06, 1
  br label %42

42:                                               ; preds = %40, %32
  %.17 = phi i32 [ %41, %40 ], [ %.06, %32 ]
  br label %43

43:                                               ; preds = %42
  %44 = add nsw i32 %.08, 1
  br label %30, !llvm.loop !17

45:                                               ; preds = %30
  %46 = icmp eq i32 %.06, 3
  br i1 %46, label %47, label %48

47:                                               ; preds = %45
  br label %84

48:                                               ; preds = %45
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %.05, 1
  br label %27, !llvm.loop !18

51:                                               ; preds = %27
  br label %52

52:                                               ; preds = %76, %51
  %.011 = phi i32 [ 0, %51 ], [ %.112, %76 ]
  %.09 = phi i32 [ 0, %51 ], [ %.110, %76 ]
  %.01 = phi i32 [ 0, %51 ], [ %77, %76 ]
  %53 = icmp slt i32 %.01, 3
  br i1 %53, label %54, label %78

54:                                               ; preds = %52
  %55 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 1
  %56 = mul nsw i32 %.01, 5
  %57 = add nsw i32 %56, %.01
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [90 x i32], ptr %55, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %64

62:                                               ; preds = %54
  %63 = add nsw i32 %.09, 1
  br label %64

64:                                               ; preds = %62, %54
  %.110 = phi i32 [ %63, %62 ], [ %.09, %54 ]
  %65 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 1
  %66 = mul nsw i32 %.01, 5
  %67 = sub nsw i32 4, %.01
  %68 = add nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [90 x i32], ptr %65, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %75

73:                                               ; preds = %64
  %74 = add nsw i32 %.011, 1
  br label %75

75:                                               ; preds = %73, %64
  %.112 = phi i32 [ %74, %73 ], [ %.011, %64 ]
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.01, 1
  br label %52, !llvm.loop !19

78:                                               ; preds = %52
  %79 = icmp eq i32 %.09, 3
  br i1 %79, label %82, label %80

80:                                               ; preds = %78
  %81 = icmp eq i32 %.011, 3
  br i1 %81, label %82, label %83

82:                                               ; preds = %80, %78
  br label %84

83:                                               ; preds = %80
  br label %84

84:                                               ; preds = %83, %82, %47, %22
  %.0 = phi i32 [ 1, %22 ], [ 1, %47 ], [ 1, %82 ], [ 0, %83 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_card(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %19, %1
  %.01 = phi i32 [ 0, %1 ], [ %20, %19 ]
  %3 = icmp slt i32 %.01, 3
  br i1 %3, label %4, label %21

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %15, %4
  %.0 = phi i32 [ 0, %4 ], [ %16, %15 ]
  %6 = icmp slt i32 %.0, 5
  br i1 %6, label %7, label %17

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.BingoCard, ptr %0, i32 0, i32 0
  %9 = mul nsw i32 %.01, 5
  %10 = add nsw i32 %9, %.0
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [90 x i32], ptr %8, i64 0, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %13)
  br label %15

15:                                               ; preds = %7
  %16 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !20

17:                                               ; preds = %5
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %19

19:                                               ; preds = %17
  %20 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !21

21:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_game(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %14, %1
  %.01 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %3 = getelementptr inbounds %struct.BingoGame, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %16

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.BingoGame, ptr %0, i32 0, i32 0
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds [100 x %struct.BingoCard], ptr %7, i64 0, i64 %8
  %10 = call i32 @check_card(ptr noundef %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %6
  br label %17

13:                                               ; preds = %6
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !22

16:                                               ; preds = %2
  br label %17

17:                                               ; preds = %16, %12
  %.0 = phi i32 [ 1, %12 ], [ 0, %16 ]
  ret i32 %.0
}

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
