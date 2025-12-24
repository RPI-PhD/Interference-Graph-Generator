; ModuleID = 'LLVM_IR/falcon2-11B-6733.ll'
source_filename = "DATASETv2/falcon2-11B-6733.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Result Matrix:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 32) #4
  br label %2

2:                                                ; preds = %8, %0
  %.01 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %3 = icmp slt i32 %.01, 4
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = call noalias ptr @malloc(i64 noundef 12) #4
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds ptr, ptr %1, i64 %6
  store ptr %5, ptr %7, align 8
  br label %8

8:                                                ; preds = %4
  %9 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !6

10:                                               ; preds = %2
  br label %11

11:                                               ; preds = %27, %10
  %.1 = phi i32 [ 0, %10 ], [ %28, %27 ]
  %12 = icmp slt i32 %.1, 4
  br i1 %12, label %13, label %29

13:                                               ; preds = %11
  br label %14

14:                                               ; preds = %24, %13
  %.02 = phi i32 [ 0, %13 ], [ %25, %24 ]
  %15 = icmp slt i32 %.02, 3
  br i1 %15, label %16, label %26

16:                                               ; preds = %14
  %17 = mul nsw i32 %.1, 3
  %18 = add nsw i32 %17, %.02
  %19 = sext i32 %.1 to i64
  %20 = getelementptr inbounds ptr, ptr %1, i64 %19
  %21 = load ptr, ptr %20, align 8
  %22 = sext i32 %.02 to i64
  %23 = getelementptr inbounds i32, ptr %21, i64 %22
  store i32 %18, ptr %23, align 4
  br label %24

24:                                               ; preds = %16
  %25 = add nsw i32 %.02, 1
  br label %14, !llvm.loop !8

26:                                               ; preds = %14
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.1, 1
  br label %11, !llvm.loop !9

29:                                               ; preds = %11
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %31

31:                                               ; preds = %48, %29
  %.2 = phi i32 [ 0, %29 ], [ %49, %48 ]
  %32 = icmp slt i32 %.2, 4
  br i1 %32, label %33, label %50

33:                                               ; preds = %31
  br label %34

34:                                               ; preds = %44, %33
  %.13 = phi i32 [ 0, %33 ], [ %45, %44 ]
  %35 = icmp slt i32 %.13, 3
  br i1 %35, label %36, label %46

36:                                               ; preds = %34
  %37 = sext i32 %.2 to i64
  %38 = getelementptr inbounds ptr, ptr %1, i64 %37
  %39 = load ptr, ptr %38, align 8
  %40 = sext i32 %.13 to i64
  %41 = getelementptr inbounds i32, ptr %39, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %42)
  br label %44

44:                                               ; preds = %36
  %45 = add nsw i32 %.13, 1
  br label %34, !llvm.loop !10

46:                                               ; preds = %34
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %48

48:                                               ; preds = %46
  %49 = add nsw i32 %.2, 1
  br label %31, !llvm.loop !11

50:                                               ; preds = %31
  %51 = call noalias ptr @malloc(i64 noundef 32) #4
  br label %52

52:                                               ; preds = %58, %50
  %.3 = phi i32 [ 0, %50 ], [ %59, %58 ]
  %53 = icmp slt i32 %.3, 4
  br i1 %53, label %54, label %60

54:                                               ; preds = %52
  %55 = call noalias ptr @malloc(i64 noundef 12) #4
  %56 = sext i32 %.3 to i64
  %57 = getelementptr inbounds ptr, ptr %51, i64 %56
  store ptr %55, ptr %57, align 8
  br label %58

58:                                               ; preds = %54
  %59 = add nsw i32 %.3, 1
  br label %52, !llvm.loop !12

60:                                               ; preds = %52
  br label %61

61:                                               ; preds = %96, %60
  %.4 = phi i32 [ 0, %60 ], [ %97, %96 ]
  %62 = icmp slt i32 %.4, 4
  br i1 %62, label %63, label %98

63:                                               ; preds = %61
  br label %64

64:                                               ; preds = %93, %63
  %.24 = phi i32 [ 0, %63 ], [ %94, %93 ]
  %65 = icmp slt i32 %.24, 3
  br i1 %65, label %66, label %95

66:                                               ; preds = %64
  br label %67

67:                                               ; preds = %90, %66
  %.0 = phi i32 [ 0, %66 ], [ %91, %90 ]
  %68 = icmp slt i32 %.0, 3
  br i1 %68, label %69, label %92

69:                                               ; preds = %67
  %70 = sext i32 %.4 to i64
  %71 = getelementptr inbounds ptr, ptr %1, i64 %70
  %72 = load ptr, ptr %71, align 8
  %73 = sext i32 %.0 to i64
  %74 = getelementptr inbounds i32, ptr %72, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = sext i32 %.0 to i64
  %77 = getelementptr inbounds ptr, ptr %1, i64 %76
  %78 = load ptr, ptr %77, align 8
  %79 = sext i32 %.24 to i64
  %80 = getelementptr inbounds i32, ptr %78, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = mul nsw i32 %75, %81
  %83 = sext i32 %.4 to i64
  %84 = getelementptr inbounds ptr, ptr %51, i64 %83
  %85 = load ptr, ptr %84, align 8
  %86 = sext i32 %.24 to i64
  %87 = getelementptr inbounds i32, ptr %85, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = add nsw i32 %88, %82
  store i32 %89, ptr %87, align 4
  br label %90

90:                                               ; preds = %69
  %91 = add nsw i32 %.0, 1
  br label %67, !llvm.loop !13

92:                                               ; preds = %67
  br label %93

93:                                               ; preds = %92
  %94 = add nsw i32 %.24, 1
  br label %64, !llvm.loop !14

95:                                               ; preds = %64
  br label %96

96:                                               ; preds = %95
  %97 = add nsw i32 %.4, 1
  br label %61, !llvm.loop !15

98:                                               ; preds = %61
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %100

100:                                              ; preds = %117, %98
  %.5 = phi i32 [ 0, %98 ], [ %118, %117 ]
  %101 = icmp slt i32 %.5, 4
  br i1 %101, label %102, label %119

102:                                              ; preds = %100
  br label %103

103:                                              ; preds = %113, %102
  %.35 = phi i32 [ 0, %102 ], [ %114, %113 ]
  %104 = icmp slt i32 %.35, 3
  br i1 %104, label %105, label %115

105:                                              ; preds = %103
  %106 = sext i32 %.5 to i64
  %107 = getelementptr inbounds ptr, ptr %51, i64 %106
  %108 = load ptr, ptr %107, align 8
  %109 = sext i32 %.35 to i64
  %110 = getelementptr inbounds i32, ptr %108, i64 %109
  %111 = load i32, ptr %110, align 4
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %111)
  br label %113

113:                                              ; preds = %105
  %114 = add nsw i32 %.35, 1
  br label %103, !llvm.loop !16

115:                                              ; preds = %103
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %117

117:                                              ; preds = %115
  %118 = add nsw i32 %.5, 1
  br label %100, !llvm.loop !17

119:                                              ; preds = %100
  br label %120

120:                                              ; preds = %126, %119
  %.6 = phi i32 [ 0, %119 ], [ %127, %126 ]
  %121 = icmp slt i32 %.6, 4
  br i1 %121, label %122, label %128

122:                                              ; preds = %120
  %123 = sext i32 %.6 to i64
  %124 = getelementptr inbounds ptr, ptr %51, i64 %123
  %125 = load ptr, ptr %124, align 8
  call void @free(ptr noundef %125) #5
  br label %126

126:                                              ; preds = %122
  %127 = add nsw i32 %.6, 1
  br label %120, !llvm.loop !18

128:                                              ; preds = %120
  call void @free(ptr noundef %51) #5
  br label %129

129:                                              ; preds = %135, %128
  %.7 = phi i32 [ 0, %128 ], [ %136, %135 ]
  %130 = icmp slt i32 %.7, 4
  br i1 %130, label %131, label %137

131:                                              ; preds = %129
  %132 = sext i32 %.7 to i64
  %133 = getelementptr inbounds ptr, ptr %1, i64 %132
  %134 = load ptr, ptr %133, align 8
  call void @free(ptr noundef %134) #5
  br label %135

135:                                              ; preds = %131
  %136 = add nsw i32 %.7, 1
  br label %129, !llvm.loop !19

137:                                              ; preds = %129
  call void @free(ptr noundef %1) #5
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
