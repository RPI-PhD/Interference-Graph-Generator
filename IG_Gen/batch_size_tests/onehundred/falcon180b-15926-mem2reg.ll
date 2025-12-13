; ModuleID = 'LLVM_IR/falcon180b-15926.ll'
source_filename = "DATASETv2/falcon180b-15926.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [24 x i8] c"Enter sequence length: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Initial sequence:\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"Enter number of mutations: \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"Final sequence:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %5 = load i32, ptr %1, align 4
  %6 = sext i32 %5 to i64
  %7 = mul i64 %6, 4
  %8 = call noalias ptr @malloc(i64 noundef %7) #4
  br label %9

9:                                                ; preds = %17, %0
  %.01 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %10 = load i32, ptr %1, align 4
  %11 = icmp slt i32 %.01, %10
  br i1 %11, label %12, label %19

12:                                               ; preds = %9
  %13 = call i32 @rand() #5
  %14 = srem i32 %13, 4
  %15 = sext i32 %.01 to i64
  %16 = getelementptr inbounds i32, ptr %8, i64 %15
  store i32 %14, ptr %16, align 4
  br label %17

17:                                               ; preds = %12
  %18 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !6

19:                                               ; preds = %9
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %21

21:                                               ; preds = %29, %19
  %.1 = phi i32 [ 0, %19 ], [ %30, %29 ]
  %22 = load i32, ptr %1, align 4
  %23 = icmp slt i32 %.1, %22
  br i1 %23, label %24, label %31

24:                                               ; preds = %21
  %25 = sext i32 %.1 to i64
  %26 = getelementptr inbounds i32, ptr %8, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %27)
  br label %29

29:                                               ; preds = %24
  %30 = add nsw i32 %.1, 1
  br label %21, !llvm.loop !8

31:                                               ; preds = %21
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %34 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %35 = call noalias ptr @malloc(i64 noundef 32) #4
  br label %36

36:                                               ; preds = %55, %31
  %.2 = phi i32 [ 0, %31 ], [ %56, %55 ]
  %37 = icmp slt i32 %.2, 4
  br i1 %37, label %38, label %57

38:                                               ; preds = %36
  %39 = call noalias ptr @malloc(i64 noundef 16) #4
  %40 = sext i32 %.2 to i64
  %41 = getelementptr inbounds ptr, ptr %35, i64 %40
  store ptr %39, ptr %41, align 8
  br label %42

42:                                               ; preds = %52, %38
  %.0 = phi i32 [ 0, %38 ], [ %53, %52 ]
  %43 = icmp slt i32 %.0, 4
  br i1 %43, label %44, label %54

44:                                               ; preds = %42
  %45 = call i32 @rand() #5
  %46 = srem i32 %45, 100
  %47 = sext i32 %.2 to i64
  %48 = getelementptr inbounds ptr, ptr %35, i64 %47
  %49 = load ptr, ptr %48, align 8
  %50 = sext i32 %.0 to i64
  %51 = getelementptr inbounds i32, ptr %49, i64 %50
  store i32 %46, ptr %51, align 4
  br label %52

52:                                               ; preds = %44
  %53 = add nsw i32 %.0, 1
  br label %42, !llvm.loop !9

54:                                               ; preds = %42
  br label %55

55:                                               ; preds = %54
  %56 = add nsw i32 %.2, 1
  br label %36, !llvm.loop !10

57:                                               ; preds = %36
  br label %58

58:                                               ; preds = %74, %57
  %.3 = phi i32 [ 0, %57 ], [ %75, %74 ]
  %59 = load i32, ptr %2, align 4
  %60 = icmp slt i32 %.3, %59
  br i1 %60, label %61, label %76

61:                                               ; preds = %58
  %62 = call i32 @rand() #5
  %63 = load i32, ptr %1, align 4
  %64 = srem i32 %62, %63
  %65 = call i32 @rand() #5
  %66 = srem i32 %65, 4
  %67 = sext i32 %64 to i64
  %68 = getelementptr inbounds i32, ptr %8, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = add nsw i32 %69, %66
  %71 = srem i32 %70, 4
  %72 = sext i32 %64 to i64
  %73 = getelementptr inbounds i32, ptr %8, i64 %72
  store i32 %71, ptr %73, align 4
  br label %74

74:                                               ; preds = %61
  %75 = add nsw i32 %.3, 1
  br label %58, !llvm.loop !11

76:                                               ; preds = %58
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %78

78:                                               ; preds = %86, %76
  %.4 = phi i32 [ 0, %76 ], [ %87, %86 ]
  %79 = load i32, ptr %1, align 4
  %80 = icmp slt i32 %.4, %79
  br i1 %80, label %81, label %88

81:                                               ; preds = %78
  %82 = sext i32 %.4 to i64
  %83 = getelementptr inbounds i32, ptr %8, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %84)
  br label %86

86:                                               ; preds = %81
  %87 = add nsw i32 %.4, 1
  br label %78, !llvm.loop !12

88:                                               ; preds = %78
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  call void @free(ptr noundef %8) #5
  br label %90

90:                                               ; preds = %96, %88
  %.5 = phi i32 [ 0, %88 ], [ %97, %96 ]
  %91 = icmp slt i32 %.5, 4
  br i1 %91, label %92, label %98

92:                                               ; preds = %90
  %93 = sext i32 %.5 to i64
  %94 = getelementptr inbounds ptr, ptr %35, i64 %93
  %95 = load ptr, ptr %94, align 8
  call void @free(ptr noundef %95) #5
  br label %96

96:                                               ; preds = %92
  %97 = add nsw i32 %.5, 1
  br label %90, !llvm.loop !13

98:                                               ; preds = %90
  call void @free(ptr noundef %35) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

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
