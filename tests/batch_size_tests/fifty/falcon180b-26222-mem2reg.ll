; ModuleID = 'LLVM_IR/falcon180b-26222.ll'
source_filename = "DATASETv2/falcon180b-26222.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"Enter the number of elements: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Enter the range: \00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Unsorted array: \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Sorted array: \00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"Time taken for sorting: %f seconds\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %7 = load i32, ptr %1, align 4
  %8 = sext i32 %7 to i64
  %9 = mul i64 %8, 4
  %10 = call noalias ptr @malloc(i64 noundef %9) #4
  %11 = call i64 @time(ptr noundef null) #5
  %12 = trunc i64 %11 to i32
  call void @srand(i32 noundef %12) #5
  br label %13

13:                                               ; preds = %22, %0
  %.01 = phi i32 [ 0, %0 ], [ %23, %22 ]
  %14 = load i32, ptr %1, align 4
  %15 = icmp slt i32 %.01, %14
  br i1 %15, label %16, label %24

16:                                               ; preds = %13
  %17 = call i32 @rand() #5
  %18 = load i32, ptr %2, align 4
  %19 = srem i32 %17, %18
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds i32, ptr %10, i64 %20
  store i32 %19, ptr %21, align 4
  br label %22

22:                                               ; preds = %16
  %23 = add nsw i32 %.01, 1
  br label %13, !llvm.loop !6

24:                                               ; preds = %13
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %26

26:                                               ; preds = %34, %24
  %.12 = phi i32 [ 0, %24 ], [ %35, %34 ]
  %27 = load i32, ptr %1, align 4
  %28 = icmp slt i32 %.12, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %26
  %30 = sext i32 %.12 to i64
  %31 = getelementptr inbounds i32, ptr %10, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %32)
  br label %34

34:                                               ; preds = %29
  %35 = add nsw i32 %.12, 1
  br label %26, !llvm.loop !8

36:                                               ; preds = %26
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %38 = call i64 @clock() #5
  br label %39

39:                                               ; preds = %58, %36
  %.2 = phi i32 [ 0, %36 ], [ %59, %58 ]
  %40 = load i32, ptr %1, align 4
  %41 = icmp slt i32 %.2, %40
  br i1 %41, label %42, label %60

42:                                               ; preds = %39
  br label %43

43:                                               ; preds = %55, %42
  %.0 = phi i32 [ 0, %42 ], [ %56, %55 ]
  %44 = icmp slt i32 %.0, 1000000
  br i1 %44, label %45, label %57

45:                                               ; preds = %43
  %46 = sext i32 %.2 to i64
  %47 = getelementptr inbounds i32, ptr %10, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp eq i32 %48, %.0
  br i1 %49, label %50, label %54

50:                                               ; preds = %45
  %51 = sub nsw i32 1000000, %.0
  %52 = sext i32 %.2 to i64
  %53 = getelementptr inbounds i32, ptr %10, i64 %52
  store i32 %51, ptr %53, align 4
  br label %57

54:                                               ; preds = %45
  br label %55

55:                                               ; preds = %54
  %56 = add nsw i32 %.0, 1
  br label %43, !llvm.loop !9

57:                                               ; preds = %50, %43
  br label %58

58:                                               ; preds = %57
  %59 = add nsw i32 %.2, 1
  br label %39, !llvm.loop !10

60:                                               ; preds = %39
  br label %61

61:                                               ; preds = %79, %60
  %.3 = phi i32 [ 0, %60 ], [ %80, %79 ]
  %62 = icmp slt i32 %.3, 1000000
  br i1 %62, label %63, label %81

63:                                               ; preds = %61
  br label %64

64:                                               ; preds = %76, %63
  %.1 = phi i32 [ 0, %63 ], [ %77, %76 ]
  %65 = load i32, ptr %1, align 4
  %66 = icmp slt i32 %.1, %65
  br i1 %66, label %67, label %78

67:                                               ; preds = %64
  %68 = sext i32 %.1 to i64
  %69 = getelementptr inbounds i32, ptr %10, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = icmp eq i32 %70, %.3
  br i1 %71, label %72, label %75

72:                                               ; preds = %67
  %73 = sext i32 %.1 to i64
  %74 = getelementptr inbounds i32, ptr %10, i64 %73
  store i32 %.1, ptr %74, align 4
  br label %78

75:                                               ; preds = %67
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.1, 1
  br label %64, !llvm.loop !11

78:                                               ; preds = %72, %64
  br label %79

79:                                               ; preds = %78
  %80 = add nsw i32 %.3, 1
  br label %61, !llvm.loop !12

81:                                               ; preds = %61
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %83

83:                                               ; preds = %91, %81
  %.4 = phi i32 [ 0, %81 ], [ %92, %91 ]
  %84 = load i32, ptr %1, align 4
  %85 = icmp slt i32 %.4, %84
  br i1 %85, label %86, label %93

86:                                               ; preds = %83
  %87 = sext i32 %.4 to i64
  %88 = getelementptr inbounds i32, ptr %10, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %89)
  br label %91

91:                                               ; preds = %86
  %92 = add nsw i32 %.4, 1
  br label %83, !llvm.loop !13

93:                                               ; preds = %83
  %94 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %95 = call i64 @clock() #5
  %96 = sub nsw i64 %95, %38
  %97 = sitofp i64 %96 to double
  %98 = fdiv double %97, 1.000000e+06
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %98)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @srand(i32 noundef) #3

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind
declare i64 @clock() #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
