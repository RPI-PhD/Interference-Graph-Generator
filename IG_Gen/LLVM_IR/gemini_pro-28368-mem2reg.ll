; ModuleID = 'LLVM_IR/gemini_pro-28368.ll'
source_filename = "DATASETv2/gemini_pro-28368.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c"Enter the size of the array: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Bubble sort took %f seconds\0A\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"Selection sort took %f seconds\0A\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"Insertion sort took %f seconds\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %4 = load i32, ptr %1, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 %5, 4
  %7 = call noalias ptr @malloc(i64 noundef %6) #4
  %8 = call i64 @time(ptr noundef null) #5
  %9 = trunc i64 %8 to i32
  call void @srand(i32 noundef %9) #5
  br label %10

10:                                               ; preds = %18, %0
  %.01 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %11 = load i32, ptr %1, align 4
  %12 = icmp slt i32 %.01, %11
  br i1 %12, label %13, label %20

13:                                               ; preds = %10
  %14 = call i32 @rand() #5
  %15 = srem i32 %14, 100
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds i32, ptr %7, i64 %16
  store i32 %15, ptr %17, align 4
  br label %18

18:                                               ; preds = %13
  %19 = add nsw i32 %.01, 1
  br label %10, !llvm.loop !6

20:                                               ; preds = %10
  %21 = call i64 @clock() #5
  %22 = sitofp i64 %21 to double
  br label %23

23:                                               ; preds = %59, %20
  %.12 = phi i32 [ 0, %20 ], [ %60, %59 ]
  %24 = load i32, ptr %1, align 4
  %25 = sub nsw i32 %24, 1
  %26 = icmp slt i32 %.12, %25
  br i1 %26, label %27, label %61

27:                                               ; preds = %23
  br label %28

28:                                               ; preds = %56, %27
  %.03 = phi i32 [ 0, %27 ], [ %57, %56 ]
  %29 = load i32, ptr %1, align 4
  %30 = sub nsw i32 %29, %.12
  %31 = sub nsw i32 %30, 1
  %32 = icmp slt i32 %.03, %31
  br i1 %32, label %33, label %58

33:                                               ; preds = %28
  %34 = sext i32 %.03 to i64
  %35 = getelementptr inbounds i32, ptr %7, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %.03, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %7, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = icmp sgt i32 %36, %40
  br i1 %41, label %42, label %55

42:                                               ; preds = %33
  %43 = sext i32 %.03 to i64
  %44 = getelementptr inbounds i32, ptr %7, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = add nsw i32 %.03, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, ptr %7, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = sext i32 %.03 to i64
  %51 = getelementptr inbounds i32, ptr %7, i64 %50
  store i32 %49, ptr %51, align 4
  %52 = add nsw i32 %.03, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %7, i64 %53
  store i32 %45, ptr %54, align 4
  br label %55

55:                                               ; preds = %42, %33
  br label %56

56:                                               ; preds = %55
  %57 = add nsw i32 %.03, 1
  br label %28, !llvm.loop !8

58:                                               ; preds = %28
  br label %59

59:                                               ; preds = %58
  %60 = add nsw i32 %.12, 1
  br label %23, !llvm.loop !9

61:                                               ; preds = %23
  %62 = call i64 @clock() #5
  %63 = sitofp i64 %62 to double
  %64 = fsub double %63, %22
  %65 = fdiv double %64, 1.000000e+06
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %65)
  %67 = call i64 @clock() #5
  %68 = sitofp i64 %67 to double
  br label %69

69:                                               ; preds = %101, %61
  %.2 = phi i32 [ 0, %61 ], [ %102, %101 ]
  %70 = load i32, ptr %1, align 4
  %71 = sub nsw i32 %70, 1
  %72 = icmp slt i32 %.2, %71
  br i1 %72, label %73, label %103

73:                                               ; preds = %69
  %74 = add nsw i32 %.2, 1
  br label %75

75:                                               ; preds = %88, %73
  %.14 = phi i32 [ %74, %73 ], [ %89, %88 ]
  %.0 = phi i32 [ %.2, %73 ], [ %.1, %88 ]
  %76 = load i32, ptr %1, align 4
  %77 = icmp slt i32 %.14, %76
  br i1 %77, label %78, label %90

78:                                               ; preds = %75
  %79 = sext i32 %.14 to i64
  %80 = getelementptr inbounds i32, ptr %7, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = sext i32 %.0 to i64
  %83 = getelementptr inbounds i32, ptr %7, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = icmp slt i32 %81, %84
  br i1 %85, label %86, label %87

86:                                               ; preds = %78
  br label %87

87:                                               ; preds = %86, %78
  %.1 = phi i32 [ %.14, %86 ], [ %.0, %78 ]
  br label %88

88:                                               ; preds = %87
  %89 = add nsw i32 %.14, 1
  br label %75, !llvm.loop !10

90:                                               ; preds = %75
  %91 = sext i32 %.2 to i64
  %92 = getelementptr inbounds i32, ptr %7, i64 %91
  %93 = load i32, ptr %92, align 4
  %94 = sext i32 %.0 to i64
  %95 = getelementptr inbounds i32, ptr %7, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = sext i32 %.2 to i64
  %98 = getelementptr inbounds i32, ptr %7, i64 %97
  store i32 %96, ptr %98, align 4
  %99 = sext i32 %.0 to i64
  %100 = getelementptr inbounds i32, ptr %7, i64 %99
  store i32 %93, ptr %100, align 4
  br label %101

101:                                              ; preds = %90
  %102 = add nsw i32 %.2, 1
  br label %69, !llvm.loop !11

103:                                              ; preds = %69
  %104 = call i64 @clock() #5
  %105 = sitofp i64 %104 to double
  %106 = fsub double %105, %68
  %107 = fdiv double %106, 1.000000e+06
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, double noundef %107)
  %109 = call i64 @clock() #5
  %110 = sitofp i64 %109 to double
  br label %111

111:                                              ; preds = %140, %103
  %.3 = phi i32 [ 1, %103 ], [ %141, %140 ]
  %112 = load i32, ptr %1, align 4
  %113 = icmp slt i32 %.3, %112
  br i1 %113, label %114, label %142

114:                                              ; preds = %111
  %115 = sext i32 %.3 to i64
  %116 = getelementptr inbounds i32, ptr %7, i64 %115
  %117 = load i32, ptr %116, align 4
  %118 = sub nsw i32 %.3, 1
  br label %119

119:                                              ; preds = %128, %114
  %.25 = phi i32 [ %118, %114 ], [ %135, %128 ]
  %120 = icmp sge i32 %.25, 0
  br i1 %120, label %121, label %126

121:                                              ; preds = %119
  %122 = sext i32 %.25 to i64
  %123 = getelementptr inbounds i32, ptr %7, i64 %122
  %124 = load i32, ptr %123, align 4
  %125 = icmp sgt i32 %124, %117
  br label %126

126:                                              ; preds = %121, %119
  %127 = phi i1 [ false, %119 ], [ %125, %121 ]
  br i1 %127, label %128, label %136

128:                                              ; preds = %126
  %129 = sext i32 %.25 to i64
  %130 = getelementptr inbounds i32, ptr %7, i64 %129
  %131 = load i32, ptr %130, align 4
  %132 = add nsw i32 %.25, 1
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, ptr %7, i64 %133
  store i32 %131, ptr %134, align 4
  %135 = add nsw i32 %.25, -1
  br label %119, !llvm.loop !12

136:                                              ; preds = %126
  %137 = add nsw i32 %.25, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, ptr %7, i64 %138
  store i32 %117, ptr %139, align 4
  br label %140

140:                                              ; preds = %136
  %141 = add nsw i32 %.3, 1
  br label %111, !llvm.loop !13

142:                                              ; preds = %111
  %143 = call i64 @clock() #5
  %144 = sitofp i64 %143 to double
  %145 = fsub double %144, %110
  %146 = fdiv double %145, 1.000000e+06
  %147 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %146)
  call void @free(ptr noundef %7) #5
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
