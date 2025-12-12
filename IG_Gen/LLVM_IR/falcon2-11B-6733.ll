; ModuleID = 'DATASETv2/falcon2-11B-6733.c'
source_filename = "DATASETv2/falcon2-11B-6733.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Result Matrix:\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %7 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %7, ptr %5, align 8
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %17, %0
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  %12 = call noalias ptr @malloc(i64 noundef 12) #4
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds ptr, ptr %13, i64 %15
  store ptr %12, ptr %16, align 8
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %2, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %2, align 4
  br label %8, !llvm.loop !6

20:                                               ; preds = %8
  store i32 0, ptr %2, align 4
  br label %21

21:                                               ; preds = %45, %20
  %22 = load i32, ptr %2, align 4
  %23 = icmp slt i32 %22, 4
  br i1 %23, label %24, label %48

24:                                               ; preds = %21
  store i32 0, ptr %3, align 4
  br label %25

25:                                               ; preds = %41, %24
  %26 = load i32, ptr %3, align 4
  %27 = icmp slt i32 %26, 3
  br i1 %27, label %28, label %44

28:                                               ; preds = %25
  %29 = load i32, ptr %2, align 4
  %30 = mul nsw i32 %29, 3
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %30, %31
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %2, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %33, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %37, i64 %39
  store i32 %32, ptr %40, align 4
  br label %41

41:                                               ; preds = %28
  %42 = load i32, ptr %3, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %3, align 4
  br label %25, !llvm.loop !8

44:                                               ; preds = %25
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %2, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %2, align 4
  br label %21, !llvm.loop !9

48:                                               ; preds = %21
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %2, align 4
  br label %50

50:                                               ; preds = %73, %48
  %51 = load i32, ptr %2, align 4
  %52 = icmp slt i32 %51, 4
  br i1 %52, label %53, label %76

53:                                               ; preds = %50
  store i32 0, ptr %3, align 4
  br label %54

54:                                               ; preds = %68, %53
  %55 = load i32, ptr %3, align 4
  %56 = icmp slt i32 %55, 3
  br i1 %56, label %57, label %71

57:                                               ; preds = %54
  %58 = load ptr, ptr %5, align 8
  %59 = load i32, ptr %2, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %58, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = load i32, ptr %3, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %66)
  br label %68

68:                                               ; preds = %57
  %69 = load i32, ptr %3, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %3, align 4
  br label %54, !llvm.loop !10

71:                                               ; preds = %54
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %73

73:                                               ; preds = %71
  %74 = load i32, ptr %2, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %2, align 4
  br label %50, !llvm.loop !11

76:                                               ; preds = %50
  %77 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %77, ptr %6, align 8
  store i32 0, ptr %2, align 4
  br label %78

78:                                               ; preds = %87, %76
  %79 = load i32, ptr %2, align 4
  %80 = icmp slt i32 %79, 4
  br i1 %80, label %81, label %90

81:                                               ; preds = %78
  %82 = call noalias ptr @malloc(i64 noundef 12) #4
  %83 = load ptr, ptr %6, align 8
  %84 = load i32, ptr %2, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds ptr, ptr %83, i64 %85
  store ptr %82, ptr %86, align 8
  br label %87

87:                                               ; preds = %81
  %88 = load i32, ptr %2, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %2, align 4
  br label %78, !llvm.loop !12

90:                                               ; preds = %78
  store i32 0, ptr %2, align 4
  br label %91

91:                                               ; preds = %140, %90
  %92 = load i32, ptr %2, align 4
  %93 = icmp slt i32 %92, 4
  br i1 %93, label %94, label %143

94:                                               ; preds = %91
  store i32 0, ptr %3, align 4
  br label %95

95:                                               ; preds = %136, %94
  %96 = load i32, ptr %3, align 4
  %97 = icmp slt i32 %96, 3
  br i1 %97, label %98, label %139

98:                                               ; preds = %95
  store i32 0, ptr %4, align 4
  br label %99

99:                                               ; preds = %132, %98
  %100 = load i32, ptr %4, align 4
  %101 = icmp slt i32 %100, 3
  br i1 %101, label %102, label %135

102:                                              ; preds = %99
  %103 = load ptr, ptr %5, align 8
  %104 = load i32, ptr %2, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds ptr, ptr %103, i64 %105
  %107 = load ptr, ptr %106, align 8
  %108 = load i32, ptr %4, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr %107, i64 %109
  %111 = load i32, ptr %110, align 4
  %112 = load ptr, ptr %5, align 8
  %113 = load i32, ptr %4, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds ptr, ptr %112, i64 %114
  %116 = load ptr, ptr %115, align 8
  %117 = load i32, ptr %3, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, ptr %116, i64 %118
  %120 = load i32, ptr %119, align 4
  %121 = mul nsw i32 %111, %120
  %122 = load ptr, ptr %6, align 8
  %123 = load i32, ptr %2, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds ptr, ptr %122, i64 %124
  %126 = load ptr, ptr %125, align 8
  %127 = load i32, ptr %3, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, ptr %126, i64 %128
  %130 = load i32, ptr %129, align 4
  %131 = add nsw i32 %130, %121
  store i32 %131, ptr %129, align 4
  br label %132

132:                                              ; preds = %102
  %133 = load i32, ptr %4, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %4, align 4
  br label %99, !llvm.loop !13

135:                                              ; preds = %99
  br label %136

136:                                              ; preds = %135
  %137 = load i32, ptr %3, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, ptr %3, align 4
  br label %95, !llvm.loop !14

139:                                              ; preds = %95
  br label %140

140:                                              ; preds = %139
  %141 = load i32, ptr %2, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, ptr %2, align 4
  br label %91, !llvm.loop !15

143:                                              ; preds = %91
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %2, align 4
  br label %145

145:                                              ; preds = %168, %143
  %146 = load i32, ptr %2, align 4
  %147 = icmp slt i32 %146, 4
  br i1 %147, label %148, label %171

148:                                              ; preds = %145
  store i32 0, ptr %3, align 4
  br label %149

149:                                              ; preds = %163, %148
  %150 = load i32, ptr %3, align 4
  %151 = icmp slt i32 %150, 3
  br i1 %151, label %152, label %166

152:                                              ; preds = %149
  %153 = load ptr, ptr %6, align 8
  %154 = load i32, ptr %2, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds ptr, ptr %153, i64 %155
  %157 = load ptr, ptr %156, align 8
  %158 = load i32, ptr %3, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, ptr %157, i64 %159
  %161 = load i32, ptr %160, align 4
  %162 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %161)
  br label %163

163:                                              ; preds = %152
  %164 = load i32, ptr %3, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, ptr %3, align 4
  br label %149, !llvm.loop !16

166:                                              ; preds = %149
  %167 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %168

168:                                              ; preds = %166
  %169 = load i32, ptr %2, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, ptr %2, align 4
  br label %145, !llvm.loop !17

171:                                              ; preds = %145
  store i32 0, ptr %2, align 4
  br label %172

172:                                              ; preds = %181, %171
  %173 = load i32, ptr %2, align 4
  %174 = icmp slt i32 %173, 4
  br i1 %174, label %175, label %184

175:                                              ; preds = %172
  %176 = load ptr, ptr %6, align 8
  %177 = load i32, ptr %2, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds ptr, ptr %176, i64 %178
  %180 = load ptr, ptr %179, align 8
  call void @free(ptr noundef %180) #5
  br label %181

181:                                              ; preds = %175
  %182 = load i32, ptr %2, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, ptr %2, align 4
  br label %172, !llvm.loop !18

184:                                              ; preds = %172
  %185 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %185) #5
  store i32 0, ptr %2, align 4
  br label %186

186:                                              ; preds = %195, %184
  %187 = load i32, ptr %2, align 4
  %188 = icmp slt i32 %187, 4
  br i1 %188, label %189, label %198

189:                                              ; preds = %186
  %190 = load ptr, ptr %5, align 8
  %191 = load i32, ptr %2, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds ptr, ptr %190, i64 %192
  %194 = load ptr, ptr %193, align 8
  call void @free(ptr noundef %194) #5
  br label %195

195:                                              ; preds = %189
  %196 = load i32, ptr %2, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, ptr %2, align 4
  br label %186, !llvm.loop !19

198:                                              ; preds = %186
  %199 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %199) #5
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
