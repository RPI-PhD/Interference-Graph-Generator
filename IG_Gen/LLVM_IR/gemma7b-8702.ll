; ModuleID = 'DATASETv2/gemma7b-8702.c'
source_filename = "DATASETv2/gemma7b-8702.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [20 x [20 x i32]], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %28, %0
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 20
  br i1 %12, label %13, label %31

13:                                               ; preds = %10
  store i32 0, ptr %4, align 4
  br label %14

14:                                               ; preds = %24, %13
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 20
  br i1 %16, label %17, label %27

17:                                               ; preds = %14
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %19
  %21 = load i32, ptr %4, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [20 x i32], ptr %20, i64 0, i64 %22
  store i32 0, ptr %23, align 4
  br label %24

24:                                               ; preds = %17
  %25 = load i32, ptr %4, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %4, align 4
  br label %14, !llvm.loop !6

27:                                               ; preds = %14
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %3, align 4
  br label %10, !llvm.loop !8

31:                                               ; preds = %10
  store i32 0, ptr %5, align 4
  br label %32

32:                                               ; preds = %46, %31
  %33 = load i32, ptr %5, align 4
  %34 = icmp slt i32 %33, 100
  br i1 %34, label %35, label %49

35:                                               ; preds = %32
  %36 = call i32 @rand() #3
  %37 = srem i32 %36, 20
  store i32 %37, ptr %3, align 4
  %38 = call i32 @rand() #3
  %39 = srem i32 %38, 20
  store i32 %39, ptr %4, align 4
  %40 = load i32, ptr %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %41
  %43 = load i32, ptr %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [20 x i32], ptr %42, i64 0, i64 %44
  store i32 1, ptr %45, align 4
  br label %46

46:                                               ; preds = %35
  %47 = load i32, ptr %5, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %5, align 4
  br label %32, !llvm.loop !9

49:                                               ; preds = %32
  br label %50

50:                                               ; preds = %167, %49
  %51 = load i32, ptr %9, align 4
  %52 = icmp slt i32 %51, 10
  br i1 %52, label %53, label %170

53:                                               ; preds = %50
  store i32 0, ptr %5, align 4
  br label %54

54:                                               ; preds = %139, %53
  %55 = load i32, ptr %5, align 4
  %56 = icmp slt i32 %55, 20
  br i1 %56, label %57, label %142

57:                                               ; preds = %54
  store i32 0, ptr %6, align 4
  br label %58

58:                                               ; preds = %135, %57
  %59 = load i32, ptr %6, align 4
  %60 = icmp slt i32 %59, 20
  br i1 %60, label %61, label %138

61:                                               ; preds = %58
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 -1, ptr %3, align 4
  br label %62

62:                                               ; preds = %93, %61
  %63 = load i32, ptr %3, align 4
  %64 = icmp sle i32 %63, 1
  br i1 %64, label %65, label %96

65:                                               ; preds = %62
  store i32 -1, ptr %4, align 4
  br label %66

66:                                               ; preds = %89, %65
  %67 = load i32, ptr %4, align 4
  %68 = icmp sle i32 %67, 1
  br i1 %68, label %69, label %92

69:                                               ; preds = %66
  %70 = load i32, ptr %3, align 4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %76

72:                                               ; preds = %69
  %73 = load i32, ptr %4, align 4
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %76

75:                                               ; preds = %72
  br label %89

76:                                               ; preds = %72, %69
  %77 = load i32, ptr %3, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %78
  %80 = load i32, ptr %4, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [20 x i32], ptr %79, i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = icmp eq i32 %83, 1
  br i1 %84, label %85, label %88

85:                                               ; preds = %76
  %86 = load i32, ptr %7, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %7, align 4
  br label %88

88:                                               ; preds = %85, %76
  br label %89

89:                                               ; preds = %88, %75
  %90 = load i32, ptr %4, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %4, align 4
  br label %66, !llvm.loop !10

92:                                               ; preds = %66
  br label %93

93:                                               ; preds = %92
  %94 = load i32, ptr %3, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %3, align 4
  br label %62, !llvm.loop !11

96:                                               ; preds = %62
  %97 = load i32, ptr %5, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %98
  %100 = load i32, ptr %6, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [20 x i32], ptr %99, i64 0, i64 %101
  %103 = load i32, ptr %102, align 4
  %104 = icmp eq i32 %103, 1
  br i1 %104, label %105, label %115

105:                                              ; preds = %96
  %106 = load i32, ptr %7, align 4
  %107 = icmp slt i32 %106, 2
  br i1 %107, label %108, label %115

108:                                              ; preds = %105
  %109 = load i32, ptr %5, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %110
  %112 = load i32, ptr %6, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [20 x i32], ptr %111, i64 0, i64 %113
  store i32 0, ptr %114, align 4
  br label %115

115:                                              ; preds = %108, %105, %96
  %116 = load i32, ptr %5, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %117
  %119 = load i32, ptr %6, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [20 x i32], ptr %118, i64 0, i64 %120
  %122 = load i32, ptr %121, align 4
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %134

124:                                              ; preds = %115
  %125 = load i32, ptr %7, align 4
  %126 = icmp eq i32 %125, 3
  br i1 %126, label %127, label %134

127:                                              ; preds = %124
  %128 = load i32, ptr %5, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %129
  %131 = load i32, ptr %6, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [20 x i32], ptr %130, i64 0, i64 %132
  store i32 1, ptr %133, align 4
  br label %134

134:                                              ; preds = %127, %124, %115
  br label %135

135:                                              ; preds = %134
  %136 = load i32, ptr %6, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, ptr %6, align 4
  br label %58, !llvm.loop !12

138:                                              ; preds = %58
  br label %139

139:                                              ; preds = %138
  %140 = load i32, ptr %5, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, ptr %5, align 4
  br label %54, !llvm.loop !13

142:                                              ; preds = %54
  store i32 0, ptr %3, align 4
  br label %143

143:                                              ; preds = %164, %142
  %144 = load i32, ptr %3, align 4
  %145 = icmp slt i32 %144, 20
  br i1 %145, label %146, label %167

146:                                              ; preds = %143
  store i32 0, ptr %4, align 4
  br label %147

147:                                              ; preds = %159, %146
  %148 = load i32, ptr %4, align 4
  %149 = icmp slt i32 %148, 20
  br i1 %149, label %150, label %162

150:                                              ; preds = %147
  %151 = load i32, ptr %3, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [20 x [20 x i32]], ptr %2, i64 0, i64 %152
  %154 = load i32, ptr %4, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [20 x i32], ptr %153, i64 0, i64 %155
  %157 = load i32, ptr %156, align 4
  %158 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %157)
  br label %159

159:                                              ; preds = %150
  %160 = load i32, ptr %4, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, ptr %4, align 4
  br label %147, !llvm.loop !14

162:                                              ; preds = %147
  %163 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %164

164:                                              ; preds = %162
  %165 = load i32, ptr %3, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, ptr %3, align 4
  br label %143, !llvm.loop !15

167:                                              ; preds = %143
  %168 = load i32, ptr %9, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, ptr %9, align 4
  br label %50, !llvm.loop !16

170:                                              ; preds = %50
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
