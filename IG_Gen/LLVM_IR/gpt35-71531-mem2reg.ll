; ModuleID = 'LLVM_IR/gpt35-71531.ll'
source_filename = "DATASETv2/gpt35-71531.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [57 x i8] c"Hello and welcome to the Happy Hotel Management System!\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Please enter the number of rooms in the hotel: \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"Enter the room number for room #%d: \00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Enter the name of the occupant for room #%d: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"Enter the nightly rate for room #%d: \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [78 x i8] c"Thank you for entering the room information. Here are the available options:\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"1. Check-in a guest\0A\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"2. Check-out a guest\0A\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"3. View room status\0A\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"4. View room charges\0A\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"5. Exit the program\0A\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"Please enter your choice (1-5): \00", align 1
@.str.15 = private unnamed_addr constant [44 x i8] c"Please enter the room number for check-in: \00", align 1
@.str.16 = private unnamed_addr constant [51 x i8] c"Sorry, we could not find a room with that number.\0A\00", align 1
@.str.17 = private unnamed_addr constant [39 x i8] c"Sorry, that room is already occupied.\0A\00", align 1
@.str.18 = private unnamed_addr constant [50 x i8] c"Please enter the name of the guest for check-in: \00", align 1
@.str.19 = private unnamed_addr constant [49 x i8] c"Please enter the number of nights for the stay: \00", align 1
@.str.20 = private unnamed_addr constant [60 x i8] c"Thank you for checking in! Your total charges will be $%d.\0A\00", align 1
@.str.21 = private unnamed_addr constant [45 x i8] c"Please enter the room number for check-out: \00", align 1
@.str.22 = private unnamed_addr constant [45 x i8] c"Sorry, that room is not currently occupied.\0A\00", align 1
@.str.23 = private unnamed_addr constant [60 x i8] c"Thank you for checking out! We hope you enjoyed your stay.\0A\00", align 1
@.str.24 = private unnamed_addr constant [18 x i8] c"Available rooms:\0A\00", align 1
@.str.25 = private unnamed_addr constant [21 x i8] c"Room #%d: Available\0A\00", align 1
@.str.26 = private unnamed_addr constant [26 x i8] c"Room #%d: Occupied by %s\0A\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"Room charges:\0A\00", align 1
@.str.28 = private unnamed_addr constant [25 x i8] c"Room #%d: $%d per night\0A\00", align 1
@.str.29 = private unnamed_addr constant [56 x i8] c"Thank you for using the Happy Hotel Management System!\0A\00", align 1
@.str.30 = private unnamed_addr constant [43 x i8] c"Invalid choice entered. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %1)
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = mul i64 %10, 4
  %12 = call noalias ptr @malloc(i64 noundef %11) #5
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 8
  %16 = call noalias ptr @malloc(i64 noundef %15) #5
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 4
  %20 = call noalias ptr @malloc(i64 noundef %19) #5
  %21 = load i32, ptr %1, align 4
  %22 = sext i32 %21 to i64
  %23 = call noalias ptr @calloc(i64 noundef %22, i64 noundef 4) #6
  br label %24

24:                                               ; preds = %48, %0
  %.05 = phi i32 [ 0, %0 ], [ %49, %48 ]
  %25 = load i32, ptr %1, align 4
  %26 = icmp slt i32 %.05, %25
  br i1 %26, label %27, label %50

27:                                               ; preds = %24
  %28 = add nsw i32 %.05, 1
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %28)
  %30 = sext i32 %.05 to i64
  %31 = getelementptr inbounds i32, ptr %12, i64 %30
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %31)
  %33 = add nsw i32 %.05, 1
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %33)
  %35 = call noalias ptr @malloc(i64 noundef 50) #5
  %36 = sext i32 %.05 to i64
  %37 = getelementptr inbounds ptr, ptr %16, i64 %36
  store ptr %35, ptr %37, align 8
  %38 = sext i32 %.05 to i64
  %39 = getelementptr inbounds ptr, ptr %16, i64 %38
  %40 = load ptr, ptr %39, align 8
  %41 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %40)
  %42 = add nsw i32 %.05, 1
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %42)
  %44 = sext i32 %.05 to i64
  %45 = getelementptr inbounds i32, ptr %20, i64 %44
  %46 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %45)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %48

48:                                               ; preds = %27
  %49 = add nsw i32 %.05, 1
  br label %24, !llvm.loop !6

50:                                               ; preds = %24
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  store i32 0, ptr %2, align 4
  br label %57

57:                                               ; preds = %203, %50
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %59 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %2)
  %60 = load i32, ptr %2, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %107

62:                                               ; preds = %57
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %64 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %3)
  br label %65

65:                                               ; preds = %76, %62
  %.07 = phi i32 [ 0, %62 ], [ %77, %76 ]
  %66 = load i32, ptr %1, align 4
  %67 = icmp slt i32 %.07, %66
  br i1 %67, label %68, label %78

68:                                               ; preds = %65
  %69 = sext i32 %.07 to i64
  %70 = getelementptr inbounds i32, ptr %12, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = load i32, ptr %3, align 4
  %73 = icmp eq i32 %71, %72
  br i1 %73, label %74, label %75

74:                                               ; preds = %68
  br label %78

75:                                               ; preds = %68
  br label %76

76:                                               ; preds = %75
  %77 = add nsw i32 %.07, 1
  br label %65, !llvm.loop !8

78:                                               ; preds = %74, %65
  %.06 = phi i32 [ %.07, %74 ], [ -1, %65 ]
  %79 = icmp eq i32 %.06, -1
  br i1 %79, label %80, label %82

80:                                               ; preds = %78
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %106

82:                                               ; preds = %78
  %83 = sext i32 %.06 to i64
  %84 = getelementptr inbounds i32, ptr %23, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 1
  br i1 %86, label %87, label %89

87:                                               ; preds = %82
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %105

89:                                               ; preds = %82
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %91 = sext i32 %.06 to i64
  %92 = getelementptr inbounds ptr, ptr %16, i64 %91
  %93 = load ptr, ptr %92, align 8
  %94 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %93)
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %96 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %4)
  %97 = sext i32 %.06 to i64
  %98 = getelementptr inbounds i32, ptr %23, i64 %97
  store i32 1, ptr %98, align 4
  %99 = load i32, ptr %4, align 4
  %100 = sext i32 %.06 to i64
  %101 = getelementptr inbounds i32, ptr %20, i64 %100
  %102 = load i32, ptr %101, align 4
  %103 = mul nsw i32 %99, %102
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %103)
  br label %105

105:                                              ; preds = %89, %87
  br label %106

106:                                              ; preds = %105, %80
  br label %203

107:                                              ; preds = %57
  %108 = load i32, ptr %2, align 4
  %109 = icmp eq i32 %108, 2
  br i1 %109, label %110, label %143

110:                                              ; preds = %107
  %111 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %112 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %5)
  br label %113

113:                                              ; preds = %124, %110
  %.03 = phi i32 [ 0, %110 ], [ %125, %124 ]
  %114 = load i32, ptr %1, align 4
  %115 = icmp slt i32 %.03, %114
  br i1 %115, label %116, label %126

116:                                              ; preds = %113
  %117 = sext i32 %.03 to i64
  %118 = getelementptr inbounds i32, ptr %12, i64 %117
  %119 = load i32, ptr %118, align 4
  %120 = load i32, ptr %5, align 4
  %121 = icmp eq i32 %119, %120
  br i1 %121, label %122, label %123

122:                                              ; preds = %116
  br label %126

123:                                              ; preds = %116
  br label %124

124:                                              ; preds = %123
  %125 = add nsw i32 %.03, 1
  br label %113, !llvm.loop !9

126:                                              ; preds = %122, %113
  %.04 = phi i32 [ %.03, %122 ], [ -1, %113 ]
  %127 = icmp eq i32 %.04, -1
  br i1 %127, label %128, label %130

128:                                              ; preds = %126
  %129 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %142

130:                                              ; preds = %126
  %131 = sext i32 %.04 to i64
  %132 = getelementptr inbounds i32, ptr %23, i64 %131
  %133 = load i32, ptr %132, align 4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %137

135:                                              ; preds = %130
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  br label %141

137:                                              ; preds = %130
  %138 = sext i32 %.04 to i64
  %139 = getelementptr inbounds i32, ptr %23, i64 %138
  store i32 0, ptr %139, align 4
  %140 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %141

141:                                              ; preds = %137, %135
  br label %142

142:                                              ; preds = %141, %128
  br label %202

143:                                              ; preds = %107
  %144 = load i32, ptr %2, align 4
  %145 = icmp eq i32 %144, 3
  br i1 %145, label %146, label %173

146:                                              ; preds = %143
  %147 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %148

148:                                              ; preds = %170, %146
  %.02 = phi i32 [ 0, %146 ], [ %171, %170 ]
  %149 = load i32, ptr %1, align 4
  %150 = icmp slt i32 %.02, %149
  br i1 %150, label %151, label %172

151:                                              ; preds = %148
  %152 = sext i32 %.02 to i64
  %153 = getelementptr inbounds i32, ptr %23, i64 %152
  %154 = load i32, ptr %153, align 4
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %161

156:                                              ; preds = %151
  %157 = sext i32 %.02 to i64
  %158 = getelementptr inbounds i32, ptr %12, i64 %157
  %159 = load i32, ptr %158, align 4
  %160 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i32 noundef %159)
  br label %169

161:                                              ; preds = %151
  %162 = sext i32 %.02 to i64
  %163 = getelementptr inbounds i32, ptr %12, i64 %162
  %164 = load i32, ptr %163, align 4
  %165 = sext i32 %.02 to i64
  %166 = getelementptr inbounds ptr, ptr %16, i64 %165
  %167 = load ptr, ptr %166, align 8
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %164, ptr noundef %167)
  br label %169

169:                                              ; preds = %161, %156
  br label %170

170:                                              ; preds = %169
  %171 = add nsw i32 %.02, 1
  br label %148, !llvm.loop !10

172:                                              ; preds = %148
  br label %201

173:                                              ; preds = %143
  %174 = load i32, ptr %2, align 4
  %175 = icmp eq i32 %174, 4
  br i1 %175, label %176, label %192

176:                                              ; preds = %173
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  br label %178

178:                                              ; preds = %189, %176
  %.01 = phi i32 [ 0, %176 ], [ %190, %189 ]
  %179 = load i32, ptr %1, align 4
  %180 = icmp slt i32 %.01, %179
  br i1 %180, label %181, label %191

181:                                              ; preds = %178
  %182 = sext i32 %.01 to i64
  %183 = getelementptr inbounds i32, ptr %12, i64 %182
  %184 = load i32, ptr %183, align 4
  %185 = sext i32 %.01 to i64
  %186 = getelementptr inbounds i32, ptr %20, i64 %185
  %187 = load i32, ptr %186, align 4
  %188 = call i32 (ptr, ...) @printf(ptr noundef @.str.28, i32 noundef %184, i32 noundef %187)
  br label %189

189:                                              ; preds = %181
  %190 = add nsw i32 %.01, 1
  br label %178, !llvm.loop !11

191:                                              ; preds = %178
  br label %200

192:                                              ; preds = %173
  %193 = load i32, ptr %2, align 4
  %194 = icmp eq i32 %193, 5
  br i1 %194, label %195, label %197

195:                                              ; preds = %192
  %196 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  br label %204

197:                                              ; preds = %192
  %198 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  br label %199

199:                                              ; preds = %197
  br label %200

200:                                              ; preds = %199, %191
  br label %201

201:                                              ; preds = %200, %172
  br label %202

202:                                              ; preds = %201, %142
  br label %203

203:                                              ; preds = %202, %106
  br label %57

204:                                              ; preds = %195
  call void @free(ptr noundef %12) #7
  br label %205

205:                                              ; preds = %212, %204
  %.0 = phi i32 [ 0, %204 ], [ %213, %212 ]
  %206 = load i32, ptr %1, align 4
  %207 = icmp slt i32 %.0, %206
  br i1 %207, label %208, label %214

208:                                              ; preds = %205
  %209 = sext i32 %.0 to i64
  %210 = getelementptr inbounds ptr, ptr %16, i64 %209
  %211 = load ptr, ptr %210, align 8
  call void @free(ptr noundef %211) #7
  br label %212

212:                                              ; preds = %208
  %213 = add nsw i32 %.0, 1
  br label %205, !llvm.loop !12

214:                                              ; preds = %205
  call void @free(ptr noundef %16) #7
  call void @free(ptr noundef %20) #7
  call void @free(ptr noundef %23) #7
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind allocsize(0,1) }
attributes #7 = { nounwind }

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
