; ModuleID = 'LLVM_IR/gemma7b-14981.ll'
source_filename = "DATASETv2/gemma7b-14981.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 400) #4
  br label %2

2:                                                ; preds = %19, %0
  %.01 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %3 = icmp slt i32 %.01, 50
  br i1 %3, label %4, label %21

4:                                                ; preds = %2
  %5 = call noalias ptr @malloc(i64 noundef 200) #4
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds ptr, ptr %1, i64 %6
  store ptr %5, ptr %7, align 8
  br label %8

8:                                                ; preds = %16, %4
  %.0 = phi i32 [ 0, %4 ], [ %17, %16 ]
  %9 = icmp slt i32 %.0, 50
  br i1 %9, label %10, label %18

10:                                               ; preds = %8
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds ptr, ptr %1, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds i32, ptr %13, i64 %14
  store i32 0, ptr %15, align 4
  br label %16

16:                                               ; preds = %10
  %17 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !6

18:                                               ; preds = %8
  br label %19

19:                                               ; preds = %18
  %20 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

21:                                               ; preds = %2
  br label %22

22:                                               ; preds = %76, %21
  %.12 = phi i32 [ 0, %21 ], [ %77, %76 ]
  %23 = icmp slt i32 %.12, 1000
  br i1 %23, label %24, label %78

24:                                               ; preds = %22
  %25 = call i32 @rand() #5
  %26 = srem i32 %25, 50
  %27 = call i32 @rand() #5
  %28 = srem i32 %27, 50
  %29 = sext i32 %26 to i64
  %30 = getelementptr inbounds ptr, ptr %1, i64 %29
  %31 = load ptr, ptr %30, align 8
  %32 = sext i32 %28 to i64
  %33 = getelementptr inbounds i32, ptr %31, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %75

36:                                               ; preds = %24
  %37 = sub nsw i32 %26, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds ptr, ptr %1, i64 %38
  %40 = load ptr, ptr %39, align 8
  %41 = sext i32 %28 to i64
  %42 = getelementptr inbounds i32, ptr %40, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %26, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds ptr, ptr %1, i64 %45
  %47 = load ptr, ptr %46, align 8
  %48 = sext i32 %28 to i64
  %49 = getelementptr inbounds i32, ptr %47, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = add nsw i32 %43, %50
  %52 = sext i32 %26 to i64
  %53 = getelementptr inbounds ptr, ptr %1, i64 %52
  %54 = load ptr, ptr %53, align 8
  %55 = sub nsw i32 %28, 1
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = add nsw i32 %51, %58
  %60 = sext i32 %26 to i64
  %61 = getelementptr inbounds ptr, ptr %1, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = add nsw i32 %28, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = add nsw i32 %59, %66
  %68 = icmp sgt i32 %67, 3
  br i1 %68, label %69, label %75

69:                                               ; preds = %36
  %70 = sext i32 %26 to i64
  %71 = getelementptr inbounds ptr, ptr %1, i64 %70
  %72 = load ptr, ptr %71, align 8
  %73 = sext i32 %28 to i64
  %74 = getelementptr inbounds i32, ptr %72, i64 %73
  store i32 1, ptr %74, align 4
  br label %75

75:                                               ; preds = %69, %36, %24
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.12, 1
  br label %22, !llvm.loop !9

78:                                               ; preds = %22
  br label %79

79:                                               ; preds = %96, %78
  %.2 = phi i32 [ 0, %78 ], [ %97, %96 ]
  %80 = icmp slt i32 %.2, 50
  br i1 %80, label %81, label %98

81:                                               ; preds = %79
  br label %82

82:                                               ; preds = %92, %81
  %.1 = phi i32 [ 0, %81 ], [ %93, %92 ]
  %83 = icmp slt i32 %.1, 50
  br i1 %83, label %84, label %94

84:                                               ; preds = %82
  %85 = sext i32 %.2 to i64
  %86 = getelementptr inbounds ptr, ptr %1, i64 %85
  %87 = load ptr, ptr %86, align 8
  %88 = sext i32 %.1 to i64
  %89 = getelementptr inbounds i32, ptr %87, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %90)
  br label %92

92:                                               ; preds = %84
  %93 = add nsw i32 %.1, 1
  br label %82, !llvm.loop !10

94:                                               ; preds = %82
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %96

96:                                               ; preds = %94
  %97 = add nsw i32 %.2, 1
  br label %79, !llvm.loop !11

98:                                               ; preds = %79
  br label %99

99:                                               ; preds = %105, %98
  %.3 = phi i32 [ 0, %98 ], [ %106, %105 ]
  %100 = icmp slt i32 %.3, 50
  br i1 %100, label %101, label %107

101:                                              ; preds = %99
  %102 = sext i32 %.3 to i64
  %103 = getelementptr inbounds ptr, ptr %1, i64 %102
  %104 = load ptr, ptr %103, align 8
  call void @free(ptr noundef %104) #5
  br label %105

105:                                              ; preds = %101
  %106 = add nsw i32 %.3, 1
  br label %99, !llvm.loop !12

107:                                              ; preds = %99
  call void @free(ptr noundef %1) #5
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
