; ModuleID = 'LLVM_IR/gemma7b-8702.ll'
source_filename = "DATASETv2/gemma7b-8702.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [20 x [20 x i32]], align 16
  br label %2

2:                                                ; preds = %15, %0
  %.01 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %3 = icmp slt i32 %.01, 20
  br i1 %3, label %4, label %17

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %12, %4
  %.02 = phi i32 [ 0, %4 ], [ %13, %12 ]
  %6 = icmp slt i32 %.02, 20
  br i1 %6, label %7, label %14

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %8
  %10 = sext i32 %.02 to i64
  %11 = getelementptr inbounds [20 x i32], ptr %9, i64 0, i64 %10
  store i32 0, ptr %11, align 4
  br label %12

12:                                               ; preds = %7
  %13 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !6

14:                                               ; preds = %5
  br label %15

15:                                               ; preds = %14
  %16 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

17:                                               ; preds = %2
  br label %18

18:                                               ; preds = %29, %17
  %.05 = phi i32 [ 0, %17 ], [ %30, %29 ]
  %19 = icmp slt i32 %.05, 100
  br i1 %19, label %20, label %31

20:                                               ; preds = %18
  %21 = call i32 @rand() #3
  %22 = srem i32 %21, 20
  %23 = call i32 @rand() #3
  %24 = srem i32 %23, 20
  %25 = sext i32 %22 to i64
  %26 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %25
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds [20 x i32], ptr %26, i64 0, i64 %27
  store i32 1, ptr %28, align 4
  br label %29

29:                                               ; preds = %20
  %30 = add nsw i32 %.05, 1
  br label %18, !llvm.loop !9

31:                                               ; preds = %18
  br label %32

32:                                               ; preds = %119, %31
  %.0 = phi i32 [ 0, %31 ], [ %120, %119 ]
  %33 = icmp slt i32 %.0, 10
  br i1 %33, label %34, label %121

34:                                               ; preds = %32
  br label %35

35:                                               ; preds = %98, %34
  %.16 = phi i32 [ 0, %34 ], [ %99, %98 ]
  %36 = icmp slt i32 %.16, 20
  br i1 %36, label %37, label %100

37:                                               ; preds = %35
  br label %38

38:                                               ; preds = %95, %37
  %.07 = phi i32 [ 0, %37 ], [ %96, %95 ]
  %39 = icmp slt i32 %.07, 20
  br i1 %39, label %40, label %97

40:                                               ; preds = %38
  br label %41

41:                                               ; preds = %64, %40
  %.08 = phi i32 [ 0, %40 ], [ %.19, %64 ]
  %.1 = phi i32 [ -1, %40 ], [ %65, %64 ]
  %42 = icmp sle i32 %.1, 1
  br i1 %42, label %43, label %66

43:                                               ; preds = %41
  br label %44

44:                                               ; preds = %61, %43
  %.19 = phi i32 [ %.08, %43 ], [ %.3, %61 ]
  %.13 = phi i32 [ -1, %43 ], [ %62, %61 ]
  %45 = icmp sle i32 %.13, 1
  br i1 %45, label %46, label %63

46:                                               ; preds = %44
  %47 = icmp eq i32 %.1, 0
  br i1 %47, label %48, label %51

48:                                               ; preds = %46
  %49 = icmp eq i32 %.13, 0
  br i1 %49, label %50, label %51

50:                                               ; preds = %48
  br label %61

51:                                               ; preds = %48, %46
  %52 = sext i32 %.1 to i64
  %53 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %52
  %54 = sext i32 %.13 to i64
  %55 = getelementptr inbounds [20 x i32], ptr %53, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  %57 = icmp eq i32 %56, 1
  br i1 %57, label %58, label %60

58:                                               ; preds = %51
  %59 = add nsw i32 %.19, 1
  br label %60

60:                                               ; preds = %58, %51
  %.210 = phi i32 [ %59, %58 ], [ %.19, %51 ]
  br label %61

61:                                               ; preds = %60, %50
  %.3 = phi i32 [ %.19, %50 ], [ %.210, %60 ]
  %62 = add nsw i32 %.13, 1
  br label %44, !llvm.loop !10

63:                                               ; preds = %44
  br label %64

64:                                               ; preds = %63
  %65 = add nsw i32 %.1, 1
  br label %41, !llvm.loop !11

66:                                               ; preds = %41
  %67 = sext i32 %.16 to i64
  %68 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %67
  %69 = sext i32 %.07 to i64
  %70 = getelementptr inbounds [20 x i32], ptr %68, i64 0, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = icmp eq i32 %71, 1
  br i1 %72, label %73, label %80

73:                                               ; preds = %66
  %74 = icmp slt i32 %.08, 2
  br i1 %74, label %75, label %80

75:                                               ; preds = %73
  %76 = sext i32 %.16 to i64
  %77 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %76
  %78 = sext i32 %.07 to i64
  %79 = getelementptr inbounds [20 x i32], ptr %77, i64 0, i64 %78
  store i32 0, ptr %79, align 4
  br label %80

80:                                               ; preds = %75, %73, %66
  %81 = sext i32 %.16 to i64
  %82 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %81
  %83 = sext i32 %.07 to i64
  %84 = getelementptr inbounds [20 x i32], ptr %82, i64 0, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %94

87:                                               ; preds = %80
  %88 = icmp eq i32 %.08, 3
  br i1 %88, label %89, label %94

89:                                               ; preds = %87
  %90 = sext i32 %.16 to i64
  %91 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %90
  %92 = sext i32 %.07 to i64
  %93 = getelementptr inbounds [20 x i32], ptr %91, i64 0, i64 %92
  store i32 1, ptr %93, align 4
  br label %94

94:                                               ; preds = %89, %87, %80
  br label %95

95:                                               ; preds = %94
  %96 = add nsw i32 %.07, 1
  br label %38, !llvm.loop !12

97:                                               ; preds = %38
  br label %98

98:                                               ; preds = %97
  %99 = add nsw i32 %.16, 1
  br label %35, !llvm.loop !13

100:                                              ; preds = %35
  br label %101

101:                                              ; preds = %117, %100
  %.2 = phi i32 [ 0, %100 ], [ %118, %117 ]
  %102 = icmp slt i32 %.2, 20
  br i1 %102, label %103, label %119

103:                                              ; preds = %101
  br label %104

104:                                              ; preds = %113, %103
  %.24 = phi i32 [ 0, %103 ], [ %114, %113 ]
  %105 = icmp slt i32 %.24, 20
  br i1 %105, label %106, label %115

106:                                              ; preds = %104
  %107 = sext i32 %.2 to i64
  %108 = getelementptr inbounds [20 x [20 x i32]], ptr %1, i64 0, i64 %107
  %109 = sext i32 %.24 to i64
  %110 = getelementptr inbounds [20 x i32], ptr %108, i64 0, i64 %109
  %111 = load i32, ptr %110, align 4
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %111)
  br label %113

113:                                              ; preds = %106
  %114 = add nsw i32 %.24, 1
  br label %104, !llvm.loop !14

115:                                              ; preds = %104
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %117

117:                                              ; preds = %115
  %118 = add nsw i32 %.2, 1
  br label %101, !llvm.loop !15

119:                                              ; preds = %101
  %120 = add nsw i32 %.0, 1
  br label %32, !llvm.loop !16

121:                                              ; preds = %32
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

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
