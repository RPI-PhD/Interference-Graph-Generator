; ModuleID = 'DATASETv2/falcon180b-55395.c'
source_filename = "DATASETv2/falcon180b-55395.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Matrix 1:\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"\0AMatrix 2:\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"\0ASum of matrices:\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x [10 x i32]], align 16
  %3 = alloca [10 x [10 x i32]], align 16
  %4 = alloca [10 x [10 x i32]], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %17 = call i64 @time(ptr noundef null) #3
  %18 = trunc i64 %17 to i32
  call void @srand(i32 noundef %18) #3
  store i32 0, ptr %5, align 4
  br label %19

19:                                               ; preds = %39, %0
  %20 = load i32, ptr %5, align 4
  %21 = icmp slt i32 %20, 10
  br i1 %21, label %22, label %42

22:                                               ; preds = %19
  store i32 0, ptr %6, align 4
  br label %23

23:                                               ; preds = %35, %22
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 10
  br i1 %25, label %26, label %38

26:                                               ; preds = %23
  %27 = call i32 @rand() #3
  %28 = srem i32 %27, 100
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x [10 x i32]], ptr %2, i64 0, i64 %30
  %32 = load i32, ptr %6, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [10 x i32], ptr %31, i64 0, i64 %33
  store i32 %28, ptr %34, align 4
  br label %35

35:                                               ; preds = %26
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %6, align 4
  br label %23, !llvm.loop !6

38:                                               ; preds = %23
  br label %39

39:                                               ; preds = %38
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %5, align 4
  br label %19, !llvm.loop !8

42:                                               ; preds = %19
  store i32 0, ptr %7, align 4
  br label %43

43:                                               ; preds = %63, %42
  %44 = load i32, ptr %7, align 4
  %45 = icmp slt i32 %44, 10
  br i1 %45, label %46, label %66

46:                                               ; preds = %43
  store i32 0, ptr %8, align 4
  br label %47

47:                                               ; preds = %59, %46
  %48 = load i32, ptr %8, align 4
  %49 = icmp slt i32 %48, 10
  br i1 %49, label %50, label %62

50:                                               ; preds = %47
  %51 = call i32 @rand() #3
  %52 = srem i32 %51, 100
  %53 = load i32, ptr %7, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %54
  %56 = load i32, ptr %8, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [10 x i32], ptr %55, i64 0, i64 %57
  store i32 %52, ptr %58, align 4
  br label %59

59:                                               ; preds = %50
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %8, align 4
  br label %47, !llvm.loop !9

62:                                               ; preds = %47
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %43, !llvm.loop !10

66:                                               ; preds = %43
  store i32 0, ptr %9, align 4
  br label %67

67:                                               ; preds = %100, %66
  %68 = load i32, ptr %9, align 4
  %69 = icmp slt i32 %68, 10
  br i1 %69, label %70, label %103

70:                                               ; preds = %67
  store i32 0, ptr %10, align 4
  br label %71

71:                                               ; preds = %96, %70
  %72 = load i32, ptr %10, align 4
  %73 = icmp slt i32 %72, 10
  br i1 %73, label %74, label %99

74:                                               ; preds = %71
  %75 = load i32, ptr %9, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [10 x [10 x i32]], ptr %2, i64 0, i64 %76
  %78 = load i32, ptr %10, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [10 x i32], ptr %77, i64 0, i64 %79
  %81 = load i32, ptr %80, align 4
  %82 = load i32, ptr %9, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %83
  %85 = load i32, ptr %10, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [10 x i32], ptr %84, i64 0, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = add nsw i32 %81, %88
  %90 = load i32, ptr %9, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %91
  %93 = load i32, ptr %10, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [10 x i32], ptr %92, i64 0, i64 %94
  store i32 %89, ptr %95, align 4
  br label %96

96:                                               ; preds = %74
  %97 = load i32, ptr %10, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %10, align 4
  br label %71, !llvm.loop !11

99:                                               ; preds = %71
  br label %100

100:                                              ; preds = %99
  %101 = load i32, ptr %9, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %9, align 4
  br label %67, !llvm.loop !12

103:                                              ; preds = %67
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %11, align 4
  br label %105

105:                                              ; preds = %126, %103
  %106 = load i32, ptr %11, align 4
  %107 = icmp slt i32 %106, 10
  br i1 %107, label %108, label %129

108:                                              ; preds = %105
  store i32 0, ptr %12, align 4
  br label %109

109:                                              ; preds = %121, %108
  %110 = load i32, ptr %12, align 4
  %111 = icmp slt i32 %110, 10
  br i1 %111, label %112, label %124

112:                                              ; preds = %109
  %113 = load i32, ptr %11, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [10 x [10 x i32]], ptr %2, i64 0, i64 %114
  %116 = load i32, ptr %12, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [10 x i32], ptr %115, i64 0, i64 %117
  %119 = load i32, ptr %118, align 4
  %120 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %119)
  br label %121

121:                                              ; preds = %112
  %122 = load i32, ptr %12, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %12, align 4
  br label %109, !llvm.loop !13

124:                                              ; preds = %109
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %126

126:                                              ; preds = %124
  %127 = load i32, ptr %11, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %11, align 4
  br label %105, !llvm.loop !14

129:                                              ; preds = %105
  %130 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %13, align 4
  br label %131

131:                                              ; preds = %152, %129
  %132 = load i32, ptr %13, align 4
  %133 = icmp slt i32 %132, 10
  br i1 %133, label %134, label %155

134:                                              ; preds = %131
  store i32 0, ptr %14, align 4
  br label %135

135:                                              ; preds = %147, %134
  %136 = load i32, ptr %14, align 4
  %137 = icmp slt i32 %136, 10
  br i1 %137, label %138, label %150

138:                                              ; preds = %135
  %139 = load i32, ptr %13, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %140
  %142 = load i32, ptr %14, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [10 x i32], ptr %141, i64 0, i64 %143
  %145 = load i32, ptr %144, align 4
  %146 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %145)
  br label %147

147:                                              ; preds = %138
  %148 = load i32, ptr %14, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, ptr %14, align 4
  br label %135, !llvm.loop !15

150:                                              ; preds = %135
  %151 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %152

152:                                              ; preds = %150
  %153 = load i32, ptr %13, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, ptr %13, align 4
  br label %131, !llvm.loop !16

155:                                              ; preds = %131
  %156 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %15, align 4
  br label %157

157:                                              ; preds = %178, %155
  %158 = load i32, ptr %15, align 4
  %159 = icmp slt i32 %158, 10
  br i1 %159, label %160, label %181

160:                                              ; preds = %157
  store i32 0, ptr %16, align 4
  br label %161

161:                                              ; preds = %173, %160
  %162 = load i32, ptr %16, align 4
  %163 = icmp slt i32 %162, 10
  br i1 %163, label %164, label %176

164:                                              ; preds = %161
  %165 = load i32, ptr %15, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %166
  %168 = load i32, ptr %16, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [10 x i32], ptr %167, i64 0, i64 %169
  %171 = load i32, ptr %170, align 4
  %172 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %171)
  br label %173

173:                                              ; preds = %164
  %174 = load i32, ptr %16, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %16, align 4
  br label %161, !llvm.loop !17

176:                                              ; preds = %161
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %178

178:                                              ; preds = %176
  %179 = load i32, ptr %15, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, ptr %15, align 4
  br label %157, !llvm.loop !18

181:                                              ; preds = %157
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

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
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
