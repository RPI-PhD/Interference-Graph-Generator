; ModuleID = 'LLVM_IR/gemma7b-2335.ll'
source_filename = "DATASETv2/gemma7b-2335.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Enter the first string: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Enter the second string: \00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Enter the third string: \00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Enter the fourth string: \00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Enter the fifth string: \00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"The strings are similar.\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"The strings are not similar.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = alloca [100 x i8], align 16
  %5 = alloca [100 x i8], align 16
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %10)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %13 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %13)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %16 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %16)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %19 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %19)
  br label %21

21:                                               ; preds = %109, %0
  %.01 = phi i32 [ 0, %0 ], [ %110, %109 ]
  %.0 = phi i32 [ 0, %0 ], [ %.1, %109 ]
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %111

27:                                               ; preds = %21
  br label %28

28:                                               ; preds = %106, %27
  %.02 = phi i32 [ 0, %27 ], [ %107, %106 ]
  %.1 = phi i32 [ %.0, %27 ], [ %.2, %106 ]
  %29 = sext i32 %.02 to i64
  %30 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %108

34:                                               ; preds = %28
  br label %35

35:                                               ; preds = %103, %34
  %.03 = phi i32 [ 0, %34 ], [ %104, %103 ]
  %.2 = phi i32 [ %.1, %34 ], [ %.3, %103 ]
  %36 = sext i32 %.03 to i64
  %37 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %105

41:                                               ; preds = %35
  br label %42

42:                                               ; preds = %100, %41
  %.04 = phi i32 [ 0, %41 ], [ %101, %100 ]
  %.3 = phi i32 [ %.2, %41 ], [ %.4, %100 ]
  %43 = sext i32 %.04 to i64
  %44 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %43
  %45 = load i8, ptr %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %102

48:                                               ; preds = %42
  br label %49

49:                                               ; preds = %97, %48
  %.05 = phi i32 [ 0, %48 ], [ %98, %97 ]
  %.4 = phi i32 [ %.3, %48 ], [ %.5, %97 ]
  %50 = sext i32 %.05 to i64
  %51 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = sext i8 %52 to i32
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %99

55:                                               ; preds = %49
  %56 = sext i32 %.01 to i64
  %57 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %56
  %58 = load i8, ptr %57, align 1
  %59 = sext i8 %58 to i32
  %60 = sext i32 %.02 to i64
  %61 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp eq i32 %59, %63
  br i1 %64, label %65, label %96

65:                                               ; preds = %55
  %66 = sext i32 %.02 to i64
  %67 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = sext i8 %68 to i32
  %70 = sext i32 %.03 to i64
  %71 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %70
  %72 = load i8, ptr %71, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %69, %73
  br i1 %74, label %75, label %96

75:                                               ; preds = %65
  %76 = sext i32 %.03 to i64
  %77 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %76
  %78 = load i8, ptr %77, align 1
  %79 = sext i8 %78 to i32
  %80 = sext i32 %.04 to i64
  %81 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %80
  %82 = load i8, ptr %81, align 1
  %83 = sext i8 %82 to i32
  %84 = icmp eq i32 %79, %83
  br i1 %84, label %85, label %96

85:                                               ; preds = %75
  %86 = sext i32 %.04 to i64
  %87 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %86
  %88 = load i8, ptr %87, align 1
  %89 = sext i8 %88 to i32
  %90 = sext i32 %.05 to i64
  %91 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 %90
  %92 = load i8, ptr %91, align 1
  %93 = sext i8 %92 to i32
  %94 = icmp eq i32 %89, %93
  br i1 %94, label %95, label %96

95:                                               ; preds = %85
  br label %96

96:                                               ; preds = %95, %85, %75, %65, %55
  %.5 = phi i32 [ 1, %95 ], [ %.4, %85 ], [ %.4, %75 ], [ %.4, %65 ], [ %.4, %55 ]
  br label %97

97:                                               ; preds = %96
  %98 = add nsw i32 %.05, 1
  br label %49, !llvm.loop !6

99:                                               ; preds = %49
  br label %100

100:                                              ; preds = %99
  %101 = add nsw i32 %.04, 1
  br label %42, !llvm.loop !8

102:                                              ; preds = %42
  br label %103

103:                                              ; preds = %102
  %104 = add nsw i32 %.03, 1
  br label %35, !llvm.loop !9

105:                                              ; preds = %35
  br label %106

106:                                              ; preds = %105
  %107 = add nsw i32 %.02, 1
  br label %28, !llvm.loop !10

108:                                              ; preds = %28
  br label %109

109:                                              ; preds = %108
  %110 = add nsw i32 %.01, 1
  br label %21, !llvm.loop !11

111:                                              ; preds = %21
  %112 = icmp eq i32 %.0, 1
  br i1 %112, label %113, label %115

113:                                              ; preds = %111
  %114 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %117

115:                                              ; preds = %111
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %117

117:                                              ; preds = %115, %113
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
