; ModuleID = 'DATASETv2/falcon180b-15926.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %8)
  %12 = load i32, ptr %8, align 4
  %13 = sext i32 %12 to i64
  %14 = mul i64 %13, 4
  %15 = call noalias ptr @malloc(i64 noundef %14) #4
  store ptr %15, ptr %7, align 8
  store i32 0, ptr %2, align 4
  br label %16

16:                                               ; preds = %27, %0
  %17 = load i32, ptr %2, align 4
  %18 = load i32, ptr %8, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %30

20:                                               ; preds = %16
  %21 = call i32 @rand() #5
  %22 = srem i32 %21, 4
  %23 = load ptr, ptr %7, align 8
  %24 = load i32, ptr %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %23, i64 %25
  store i32 %22, ptr %26, align 4
  br label %27

27:                                               ; preds = %20
  %28 = load i32, ptr %2, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %2, align 4
  br label %16, !llvm.loop !6

30:                                               ; preds = %16
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %2, align 4
  br label %32

32:                                               ; preds = %43, %30
  %33 = load i32, ptr %2, align 4
  %34 = load i32, ptr %8, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %46

36:                                               ; preds = %32
  %37 = load ptr, ptr %7, align 8
  %38 = load i32, ptr %2, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %37, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %41)
  br label %43

43:                                               ; preds = %36
  %44 = load i32, ptr %2, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %2, align 4
  br label %32, !llvm.loop !8

46:                                               ; preds = %32
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %49 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %9)
  %50 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %50, ptr %6, align 8
  store i32 0, ptr %2, align 4
  br label %51

51:                                               ; preds = %78, %46
  %52 = load i32, ptr %2, align 4
  %53 = icmp slt i32 %52, 4
  br i1 %53, label %54, label %81

54:                                               ; preds = %51
  %55 = call noalias ptr @malloc(i64 noundef 16) #4
  %56 = load ptr, ptr %6, align 8
  %57 = load i32, ptr %2, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58
  store ptr %55, ptr %59, align 8
  store i32 0, ptr %3, align 4
  br label %60

60:                                               ; preds = %74, %54
  %61 = load i32, ptr %3, align 4
  %62 = icmp slt i32 %61, 4
  br i1 %62, label %63, label %77

63:                                               ; preds = %60
  %64 = call i32 @rand() #5
  %65 = srem i32 %64, 100
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %2, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds ptr, ptr %66, i64 %68
  %70 = load ptr, ptr %69, align 8
  %71 = load i32, ptr %3, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, ptr %70, i64 %72
  store i32 %65, ptr %73, align 4
  br label %74

74:                                               ; preds = %63
  %75 = load i32, ptr %3, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %3, align 4
  br label %60, !llvm.loop !9

77:                                               ; preds = %60
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %2, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %2, align 4
  br label %51, !llvm.loop !10

81:                                               ; preds = %51
  store i32 0, ptr %2, align 4
  br label %82

82:                                               ; preds = %104, %81
  %83 = load i32, ptr %2, align 4
  %84 = load i32, ptr %9, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %107

86:                                               ; preds = %82
  %87 = call i32 @rand() #5
  %88 = load i32, ptr %8, align 4
  %89 = srem i32 %87, %88
  store i32 %89, ptr %4, align 4
  %90 = call i32 @rand() #5
  %91 = srem i32 %90, 4
  store i32 %91, ptr %5, align 4
  %92 = load ptr, ptr %7, align 8
  %93 = load i32, ptr %4, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i32, ptr %92, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = load i32, ptr %5, align 4
  %98 = add nsw i32 %96, %97
  %99 = srem i32 %98, 4
  %100 = load ptr, ptr %7, align 8
  %101 = load i32, ptr %4, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, ptr %100, i64 %102
  store i32 %99, ptr %103, align 4
  br label %104

104:                                              ; preds = %86
  %105 = load i32, ptr %2, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %2, align 4
  br label %82, !llvm.loop !11

107:                                              ; preds = %82
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %2, align 4
  br label %109

109:                                              ; preds = %120, %107
  %110 = load i32, ptr %2, align 4
  %111 = load i32, ptr %8, align 4
  %112 = icmp slt i32 %110, %111
  br i1 %112, label %113, label %123

113:                                              ; preds = %109
  %114 = load ptr, ptr %7, align 8
  %115 = load i32, ptr %2, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, ptr %114, i64 %116
  %118 = load i32, ptr %117, align 4
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %118)
  br label %120

120:                                              ; preds = %113
  %121 = load i32, ptr %2, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %2, align 4
  br label %109, !llvm.loop !12

123:                                              ; preds = %109
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %125 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %125) #5
  store i32 0, ptr %2, align 4
  br label %126

126:                                              ; preds = %135, %123
  %127 = load i32, ptr %2, align 4
  %128 = icmp slt i32 %127, 4
  br i1 %128, label %129, label %138

129:                                              ; preds = %126
  %130 = load ptr, ptr %6, align 8
  %131 = load i32, ptr %2, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds ptr, ptr %130, i64 %132
  %134 = load ptr, ptr %133, align 8
  call void @free(ptr noundef %134) #5
  br label %135

135:                                              ; preds = %129
  %136 = load i32, ptr %2, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, ptr %2, align 4
  br label %126, !llvm.loop !13

138:                                              ; preds = %126
  %139 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %139) #5
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
