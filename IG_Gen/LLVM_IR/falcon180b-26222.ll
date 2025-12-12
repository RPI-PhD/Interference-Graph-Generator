; ModuleID = 'DATASETv2/falcon180b-26222.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca double, align 8
  store i32 0, ptr %1, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %4)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %5)
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16) #4
  store ptr %17, ptr %6, align 8
  %18 = call i64 @time(ptr noundef null) #5
  %19 = trunc i64 %18 to i32
  call void @srand(i32 noundef %19) #5
  store i32 0, ptr %2, align 4
  br label %20

20:                                               ; preds = %32, %0
  %21 = load i32, ptr %2, align 4
  %22 = load i32, ptr %4, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %35

24:                                               ; preds = %20
  %25 = call i32 @rand() #5
  %26 = load i32, ptr %5, align 4
  %27 = srem i32 %25, %26
  %28 = load ptr, ptr %6, align 8
  %29 = load i32, ptr %2, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr %28, i64 %30
  store i32 %27, ptr %31, align 4
  br label %32

32:                                               ; preds = %24
  %33 = load i32, ptr %2, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %2, align 4
  br label %20, !llvm.loop !6

35:                                               ; preds = %20
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %2, align 4
  br label %37

37:                                               ; preds = %48, %35
  %38 = load i32, ptr %2, align 4
  %39 = load i32, ptr %4, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %51

41:                                               ; preds = %37
  %42 = load ptr, ptr %6, align 8
  %43 = load i32, ptr %2, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %46)
  br label %48

48:                                               ; preds = %41
  %49 = load i32, ptr %2, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %2, align 4
  br label %37, !llvm.loop !8

51:                                               ; preds = %37
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %53 = call i64 @clock() #5
  store i64 %53, ptr %7, align 8
  store i32 0, ptr %2, align 4
  br label %54

54:                                               ; preds = %82, %51
  %55 = load i32, ptr %2, align 4
  %56 = load i32, ptr %4, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %58, label %85

58:                                               ; preds = %54
  store i32 0, ptr %3, align 4
  br label %59

59:                                               ; preds = %78, %58
  %60 = load i32, ptr %3, align 4
  %61 = icmp slt i32 %60, 1000000
  br i1 %61, label %62, label %81

62:                                               ; preds = %59
  %63 = load ptr, ptr %6, align 8
  %64 = load i32, ptr %2, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr %63, i64 %65
  %67 = load i32, ptr %66, align 4
  %68 = load i32, ptr %3, align 4
  %69 = icmp eq i32 %67, %68
  br i1 %69, label %70, label %77

70:                                               ; preds = %62
  %71 = load i32, ptr %3, align 4
  %72 = sub nsw i32 1000000, %71
  %73 = load ptr, ptr %6, align 8
  %74 = load i32, ptr %2, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32, ptr %73, i64 %75
  store i32 %72, ptr %76, align 4
  br label %81

77:                                               ; preds = %62
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %3, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %3, align 4
  br label %59, !llvm.loop !9

81:                                               ; preds = %70, %59
  br label %82

82:                                               ; preds = %81
  %83 = load i32, ptr %2, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %2, align 4
  br label %54, !llvm.loop !10

85:                                               ; preds = %54
  store i32 0, ptr %2, align 4
  br label %86

86:                                               ; preds = %113, %85
  %87 = load i32, ptr %2, align 4
  %88 = icmp slt i32 %87, 1000000
  br i1 %88, label %89, label %116

89:                                               ; preds = %86
  store i32 0, ptr %3, align 4
  br label %90

90:                                               ; preds = %109, %89
  %91 = load i32, ptr %3, align 4
  %92 = load i32, ptr %4, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %112

94:                                               ; preds = %90
  %95 = load ptr, ptr %6, align 8
  %96 = load i32, ptr %3, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, ptr %95, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %2, align 4
  %101 = icmp eq i32 %99, %100
  br i1 %101, label %102, label %108

102:                                              ; preds = %94
  %103 = load i32, ptr %3, align 4
  %104 = load ptr, ptr %6, align 8
  %105 = load i32, ptr %3, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, ptr %104, i64 %106
  store i32 %103, ptr %107, align 4
  br label %112

108:                                              ; preds = %94
  br label %109

109:                                              ; preds = %108
  %110 = load i32, ptr %3, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %3, align 4
  br label %90, !llvm.loop !11

112:                                              ; preds = %102, %90
  br label %113

113:                                              ; preds = %112
  %114 = load i32, ptr %2, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, ptr %2, align 4
  br label %86, !llvm.loop !12

116:                                              ; preds = %86
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %2, align 4
  br label %118

118:                                              ; preds = %129, %116
  %119 = load i32, ptr %2, align 4
  %120 = load i32, ptr %4, align 4
  %121 = icmp slt i32 %119, %120
  br i1 %121, label %122, label %132

122:                                              ; preds = %118
  %123 = load ptr, ptr %6, align 8
  %124 = load i32, ptr %2, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, ptr %123, i64 %125
  %127 = load i32, ptr %126, align 4
  %128 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %127)
  br label %129

129:                                              ; preds = %122
  %130 = load i32, ptr %2, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %2, align 4
  br label %118, !llvm.loop !13

132:                                              ; preds = %118
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %134 = call i64 @clock() #5
  store i64 %134, ptr %8, align 8
  %135 = load i64, ptr %8, align 8
  %136 = load i64, ptr %7, align 8
  %137 = sub nsw i64 %135, %136
  %138 = sitofp i64 %137 to double
  %139 = fdiv double %138, 1.000000e+06
  store double %139, ptr %9, align 8
  %140 = load double, ptr %9, align 8
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %140)
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
