; ModuleID = 'DATASETv2/gpt35-9014.c'
source_filename = "DATASETv2/gpt35-9014.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Question = type { [200 x i8], [4 x [50 x i8]], i8 }

@.str = private unnamed_addr constant [5 x i8] c"\0A%s\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"%c. %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"What is the capital of India?\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Mumbai\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"New Delhi\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"Kolkata\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"Chennai\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"Who is the founder of Apple Inc.?\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"Steve Jobs\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"Bill Gates\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"Mark Zuckerberg\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"Jeff Bezos\00", align 1
@.str.12 = private unnamed_addr constant [52 x i8] c"Which of the following is a primary color of light?\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"Red\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"Green\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"Blue\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"Yellow\00", align 1
@.str.17 = private unnamed_addr constant [39 x i8] c"What does RAM stand for in a computer?\00", align 1
@.str.18 = private unnamed_addr constant [21 x i8] c"Random Access Memory\00", align 1
@.str.19 = private unnamed_addr constant [17 x i8] c"Read-Only Memory\00", align 1
@.str.20 = private unnamed_addr constant [16 x i8] c"Hard Disk Drive\00", align 1
@.str.21 = private unnamed_addr constant [24 x i8] c"Central Processing Unit\00", align 1
@.str.22 = private unnamed_addr constant [38 x i8] c"Who is the current CEO of Tesla Inc.?\00", align 1
@.str.23 = private unnamed_addr constant [10 x i8] c"Elon Musk\00", align 1
@.str.24 = private unnamed_addr constant [9 x i8] c"Tim Cook\00", align 1
@.str.25 = private unnamed_addr constant [14 x i8] c"Satya Nadella\00", align 1
@.str.26 = private unnamed_addr constant [43 x i8] c"Welcome to the Online Examination System!\0A\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"\0AQuestion %d:\0A\00", align 1
@.str.28 = private unnamed_addr constant [31 x i8] c"\0AEnter your answer (A/B/C/D): \00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"\0A%c\00", align 1
@.str.30 = private unnamed_addr constant [21 x i8] c"\0AYour score is: %d/5\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %0) #0 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %4)
  store i32 0, ptr %2, align 4
  br label %6

6:                                                ; preds = %18, %1
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %9, label %21

9:                                                ; preds = %6
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 65, %10
  %12 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x [50 x i8]], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %11, ptr noundef %16)
  br label %18

18:                                               ; preds = %9
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %2, align 4
  br label %6, !llvm.loop !6

21:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x %struct.Question], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.Question, align 8
  %6 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  %7 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %8 = getelementptr inbounds %struct.Question, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [200 x i8], ptr %8, i64 0, i64 0
  %10 = call ptr @strcpy(ptr noundef %9, ptr noundef @.str.2) #4
  %11 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %12 = getelementptr inbounds %struct.Question, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds [4 x [50 x i8]], ptr %12, i64 0, i64 0
  %14 = getelementptr inbounds [50 x i8], ptr %13, i64 0, i64 0
  %15 = call ptr @strcpy(ptr noundef %14, ptr noundef @.str.3) #4
  %16 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %17 = getelementptr inbounds %struct.Question, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [4 x [50 x i8]], ptr %17, i64 0, i64 1
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = call ptr @strcpy(ptr noundef %19, ptr noundef @.str.4) #4
  %21 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %22 = getelementptr inbounds %struct.Question, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [4 x [50 x i8]], ptr %22, i64 0, i64 2
  %24 = getelementptr inbounds [50 x i8], ptr %23, i64 0, i64 0
  %25 = call ptr @strcpy(ptr noundef %24, ptr noundef @.str.5) #4
  %26 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %27 = getelementptr inbounds %struct.Question, ptr %26, i32 0, i32 1
  %28 = getelementptr inbounds [4 x [50 x i8]], ptr %27, i64 0, i64 3
  %29 = getelementptr inbounds [50 x i8], ptr %28, i64 0, i64 0
  %30 = call ptr @strcpy(ptr noundef %29, ptr noundef @.str.6) #4
  %31 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %32 = getelementptr inbounds %struct.Question, ptr %31, i32 0, i32 2
  store i8 66, ptr %32, align 16
  %33 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 1
  %34 = getelementptr inbounds %struct.Question, ptr %33, i32 0, i32 0
  %35 = getelementptr inbounds [200 x i8], ptr %34, i64 0, i64 0
  %36 = call ptr @strcpy(ptr noundef %35, ptr noundef @.str.7) #4
  %37 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 1
  %38 = getelementptr inbounds %struct.Question, ptr %37, i32 0, i32 1
  %39 = getelementptr inbounds [4 x [50 x i8]], ptr %38, i64 0, i64 0
  %40 = getelementptr inbounds [50 x i8], ptr %39, i64 0, i64 0
  %41 = call ptr @strcpy(ptr noundef %40, ptr noundef @.str.8) #4
  %42 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 1
  %43 = getelementptr inbounds %struct.Question, ptr %42, i32 0, i32 1
  %44 = getelementptr inbounds [4 x [50 x i8]], ptr %43, i64 0, i64 1
  %45 = getelementptr inbounds [50 x i8], ptr %44, i64 0, i64 0
  %46 = call ptr @strcpy(ptr noundef %45, ptr noundef @.str.9) #4
  %47 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 1
  %48 = getelementptr inbounds %struct.Question, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds [4 x [50 x i8]], ptr %48, i64 0, i64 2
  %50 = getelementptr inbounds [50 x i8], ptr %49, i64 0, i64 0
  %51 = call ptr @strcpy(ptr noundef %50, ptr noundef @.str.10) #4
  %52 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 1
  %53 = getelementptr inbounds %struct.Question, ptr %52, i32 0, i32 1
  %54 = getelementptr inbounds [4 x [50 x i8]], ptr %53, i64 0, i64 3
  %55 = getelementptr inbounds [50 x i8], ptr %54, i64 0, i64 0
  %56 = call ptr @strcpy(ptr noundef %55, ptr noundef @.str.11) #4
  %57 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 1
  %58 = getelementptr inbounds %struct.Question, ptr %57, i32 0, i32 2
  store i8 65, ptr %58, align 1
  %59 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 2
  %60 = getelementptr inbounds %struct.Question, ptr %59, i32 0, i32 0
  %61 = getelementptr inbounds [200 x i8], ptr %60, i64 0, i64 0
  %62 = call ptr @strcpy(ptr noundef %61, ptr noundef @.str.12) #4
  %63 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 2
  %64 = getelementptr inbounds %struct.Question, ptr %63, i32 0, i32 1
  %65 = getelementptr inbounds [4 x [50 x i8]], ptr %64, i64 0, i64 0
  %66 = getelementptr inbounds [50 x i8], ptr %65, i64 0, i64 0
  %67 = call ptr @strcpy(ptr noundef %66, ptr noundef @.str.13) #4
  %68 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 2
  %69 = getelementptr inbounds %struct.Question, ptr %68, i32 0, i32 1
  %70 = getelementptr inbounds [4 x [50 x i8]], ptr %69, i64 0, i64 1
  %71 = getelementptr inbounds [50 x i8], ptr %70, i64 0, i64 0
  %72 = call ptr @strcpy(ptr noundef %71, ptr noundef @.str.14) #4
  %73 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 2
  %74 = getelementptr inbounds %struct.Question, ptr %73, i32 0, i32 1
  %75 = getelementptr inbounds [4 x [50 x i8]], ptr %74, i64 0, i64 2
  %76 = getelementptr inbounds [50 x i8], ptr %75, i64 0, i64 0
  %77 = call ptr @strcpy(ptr noundef %76, ptr noundef @.str.15) #4
  %78 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 2
  %79 = getelementptr inbounds %struct.Question, ptr %78, i32 0, i32 1
  %80 = getelementptr inbounds [4 x [50 x i8]], ptr %79, i64 0, i64 3
  %81 = getelementptr inbounds [50 x i8], ptr %80, i64 0, i64 0
  %82 = call ptr @strcpy(ptr noundef %81, ptr noundef @.str.16) #4
  %83 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 2
  %84 = getelementptr inbounds %struct.Question, ptr %83, i32 0, i32 2
  store i8 67, ptr %84, align 2
  %85 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 3
  %86 = getelementptr inbounds %struct.Question, ptr %85, i32 0, i32 0
  %87 = getelementptr inbounds [200 x i8], ptr %86, i64 0, i64 0
  %88 = call ptr @strcpy(ptr noundef %87, ptr noundef @.str.17) #4
  %89 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 3
  %90 = getelementptr inbounds %struct.Question, ptr %89, i32 0, i32 1
  %91 = getelementptr inbounds [4 x [50 x i8]], ptr %90, i64 0, i64 0
  %92 = getelementptr inbounds [50 x i8], ptr %91, i64 0, i64 0
  %93 = call ptr @strcpy(ptr noundef %92, ptr noundef @.str.18) #4
  %94 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 3
  %95 = getelementptr inbounds %struct.Question, ptr %94, i32 0, i32 1
  %96 = getelementptr inbounds [4 x [50 x i8]], ptr %95, i64 0, i64 1
  %97 = getelementptr inbounds [50 x i8], ptr %96, i64 0, i64 0
  %98 = call ptr @strcpy(ptr noundef %97, ptr noundef @.str.19) #4
  %99 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 3
  %100 = getelementptr inbounds %struct.Question, ptr %99, i32 0, i32 1
  %101 = getelementptr inbounds [4 x [50 x i8]], ptr %100, i64 0, i64 2
  %102 = getelementptr inbounds [50 x i8], ptr %101, i64 0, i64 0
  %103 = call ptr @strcpy(ptr noundef %102, ptr noundef @.str.20) #4
  %104 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 3
  %105 = getelementptr inbounds %struct.Question, ptr %104, i32 0, i32 1
  %106 = getelementptr inbounds [4 x [50 x i8]], ptr %105, i64 0, i64 3
  %107 = getelementptr inbounds [50 x i8], ptr %106, i64 0, i64 0
  %108 = call ptr @strcpy(ptr noundef %107, ptr noundef @.str.21) #4
  %109 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 3
  %110 = getelementptr inbounds %struct.Question, ptr %109, i32 0, i32 2
  store i8 65, ptr %110, align 1
  %111 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 4
  %112 = getelementptr inbounds %struct.Question, ptr %111, i32 0, i32 0
  %113 = getelementptr inbounds [200 x i8], ptr %112, i64 0, i64 0
  %114 = call ptr @strcpy(ptr noundef %113, ptr noundef @.str.22) #4
  %115 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 4
  %116 = getelementptr inbounds %struct.Question, ptr %115, i32 0, i32 1
  %117 = getelementptr inbounds [4 x [50 x i8]], ptr %116, i64 0, i64 0
  %118 = getelementptr inbounds [50 x i8], ptr %117, i64 0, i64 0
  %119 = call ptr @strcpy(ptr noundef %118, ptr noundef @.str.10) #4
  %120 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 4
  %121 = getelementptr inbounds %struct.Question, ptr %120, i32 0, i32 1
  %122 = getelementptr inbounds [4 x [50 x i8]], ptr %121, i64 0, i64 1
  %123 = getelementptr inbounds [50 x i8], ptr %122, i64 0, i64 0
  %124 = call ptr @strcpy(ptr noundef %123, ptr noundef @.str.23) #4
  %125 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 4
  %126 = getelementptr inbounds %struct.Question, ptr %125, i32 0, i32 1
  %127 = getelementptr inbounds [4 x [50 x i8]], ptr %126, i64 0, i64 2
  %128 = getelementptr inbounds [50 x i8], ptr %127, i64 0, i64 0
  %129 = call ptr @strcpy(ptr noundef %128, ptr noundef @.str.24) #4
  %130 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 4
  %131 = getelementptr inbounds %struct.Question, ptr %130, i32 0, i32 1
  %132 = getelementptr inbounds [4 x [50 x i8]], ptr %131, i64 0, i64 3
  %133 = getelementptr inbounds [50 x i8], ptr %132, i64 0, i64 0
  %134 = call ptr @strcpy(ptr noundef %133, ptr noundef @.str.25) #4
  %135 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 4
  %136 = getelementptr inbounds %struct.Question, ptr %135, i32 0, i32 2
  store i8 66, ptr %136, align 4
  store i32 0, ptr %3, align 4
  %137 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  store i32 0, ptr %4, align 4
  br label %138

138:                                              ; preds = %163, %0
  %139 = load i32, ptr %4, align 4
  %140 = icmp slt i32 %139, 5
  br i1 %140, label %141, label %166

141:                                              ; preds = %138
  %142 = load i32, ptr %4, align 4
  %143 = add nsw i32 %142, 1
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str.27, i32 noundef %143)
  %145 = load i32, ptr %4, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 %146
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 1 %147, i64 401, i1 false)
  call void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %5)
  %148 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %149 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.29, ptr noundef %6)
  %150 = load i8, ptr %6, align 1
  %151 = sext i8 %150 to i32
  %152 = load i32, ptr %4, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 %153
  %155 = getelementptr inbounds %struct.Question, ptr %154, i32 0, i32 2
  %156 = load i8, ptr %155, align 1
  %157 = sext i8 %156 to i32
  %158 = icmp eq i32 %151, %157
  br i1 %158, label %159, label %162

159:                                              ; preds = %141
  %160 = load i32, ptr %3, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, ptr %3, align 4
  br label %162

162:                                              ; preds = %159, %141
  br label %163

163:                                              ; preds = %162
  %164 = load i32, ptr %4, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, ptr %4, align 4
  br label %138, !llvm.loop !8

166:                                              ; preds = %138
  %167 = load i32, ptr %3, align 4
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %167)
  ret i32 0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind }

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
