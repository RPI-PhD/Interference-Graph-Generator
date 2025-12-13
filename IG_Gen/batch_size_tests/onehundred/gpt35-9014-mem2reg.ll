; ModuleID = 'LLVM_IR/gpt35-9014.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [200 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3)
  br label %5

5:                                                ; preds = %14, %1
  %.0 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %6 = icmp slt i32 %.0, 4
  br i1 %6, label %7, label %16

7:                                                ; preds = %5
  %8 = add nsw i32 65, %.0
  %9 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 1
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [4 x [50 x i8]], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %8, ptr noundef %12)
  br label %14

14:                                               ; preds = %7
  %15 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

16:                                               ; preds = %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.Question], align 16
  %2 = alloca %struct.Question, align 8
  %3 = alloca i8, align 1
  %4 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %5 = getelementptr inbounds %struct.Question, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [200 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef @.str.2) #4
  %8 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %9 = getelementptr inbounds %struct.Question, ptr %8, i32 0, i32 1
  %10 = getelementptr inbounds [4 x [50 x i8]], ptr %9, i64 0, i64 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = call ptr @strcpy(ptr noundef %11, ptr noundef @.str.3) #4
  %13 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %14 = getelementptr inbounds %struct.Question, ptr %13, i32 0, i32 1
  %15 = getelementptr inbounds [4 x [50 x i8]], ptr %14, i64 0, i64 1
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = call ptr @strcpy(ptr noundef %16, ptr noundef @.str.4) #4
  %18 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %19 = getelementptr inbounds %struct.Question, ptr %18, i32 0, i32 1
  %20 = getelementptr inbounds [4 x [50 x i8]], ptr %19, i64 0, i64 2
  %21 = getelementptr inbounds [50 x i8], ptr %20, i64 0, i64 0
  %22 = call ptr @strcpy(ptr noundef %21, ptr noundef @.str.5) #4
  %23 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %24 = getelementptr inbounds %struct.Question, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds [4 x [50 x i8]], ptr %24, i64 0, i64 3
  %26 = getelementptr inbounds [50 x i8], ptr %25, i64 0, i64 0
  %27 = call ptr @strcpy(ptr noundef %26, ptr noundef @.str.6) #4
  %28 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %29 = getelementptr inbounds %struct.Question, ptr %28, i32 0, i32 2
  store i8 66, ptr %29, align 16
  %30 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 1
  %31 = getelementptr inbounds %struct.Question, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds [200 x i8], ptr %31, i64 0, i64 0
  %33 = call ptr @strcpy(ptr noundef %32, ptr noundef @.str.7) #4
  %34 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 1
  %35 = getelementptr inbounds %struct.Question, ptr %34, i32 0, i32 1
  %36 = getelementptr inbounds [4 x [50 x i8]], ptr %35, i64 0, i64 0
  %37 = getelementptr inbounds [50 x i8], ptr %36, i64 0, i64 0
  %38 = call ptr @strcpy(ptr noundef %37, ptr noundef @.str.8) #4
  %39 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 1
  %40 = getelementptr inbounds %struct.Question, ptr %39, i32 0, i32 1
  %41 = getelementptr inbounds [4 x [50 x i8]], ptr %40, i64 0, i64 1
  %42 = getelementptr inbounds [50 x i8], ptr %41, i64 0, i64 0
  %43 = call ptr @strcpy(ptr noundef %42, ptr noundef @.str.9) #4
  %44 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 1
  %45 = getelementptr inbounds %struct.Question, ptr %44, i32 0, i32 1
  %46 = getelementptr inbounds [4 x [50 x i8]], ptr %45, i64 0, i64 2
  %47 = getelementptr inbounds [50 x i8], ptr %46, i64 0, i64 0
  %48 = call ptr @strcpy(ptr noundef %47, ptr noundef @.str.10) #4
  %49 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 1
  %50 = getelementptr inbounds %struct.Question, ptr %49, i32 0, i32 1
  %51 = getelementptr inbounds [4 x [50 x i8]], ptr %50, i64 0, i64 3
  %52 = getelementptr inbounds [50 x i8], ptr %51, i64 0, i64 0
  %53 = call ptr @strcpy(ptr noundef %52, ptr noundef @.str.11) #4
  %54 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 1
  %55 = getelementptr inbounds %struct.Question, ptr %54, i32 0, i32 2
  store i8 65, ptr %55, align 1
  %56 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 2
  %57 = getelementptr inbounds %struct.Question, ptr %56, i32 0, i32 0
  %58 = getelementptr inbounds [200 x i8], ptr %57, i64 0, i64 0
  %59 = call ptr @strcpy(ptr noundef %58, ptr noundef @.str.12) #4
  %60 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 2
  %61 = getelementptr inbounds %struct.Question, ptr %60, i32 0, i32 1
  %62 = getelementptr inbounds [4 x [50 x i8]], ptr %61, i64 0, i64 0
  %63 = getelementptr inbounds [50 x i8], ptr %62, i64 0, i64 0
  %64 = call ptr @strcpy(ptr noundef %63, ptr noundef @.str.13) #4
  %65 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 2
  %66 = getelementptr inbounds %struct.Question, ptr %65, i32 0, i32 1
  %67 = getelementptr inbounds [4 x [50 x i8]], ptr %66, i64 0, i64 1
  %68 = getelementptr inbounds [50 x i8], ptr %67, i64 0, i64 0
  %69 = call ptr @strcpy(ptr noundef %68, ptr noundef @.str.14) #4
  %70 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 2
  %71 = getelementptr inbounds %struct.Question, ptr %70, i32 0, i32 1
  %72 = getelementptr inbounds [4 x [50 x i8]], ptr %71, i64 0, i64 2
  %73 = getelementptr inbounds [50 x i8], ptr %72, i64 0, i64 0
  %74 = call ptr @strcpy(ptr noundef %73, ptr noundef @.str.15) #4
  %75 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 2
  %76 = getelementptr inbounds %struct.Question, ptr %75, i32 0, i32 1
  %77 = getelementptr inbounds [4 x [50 x i8]], ptr %76, i64 0, i64 3
  %78 = getelementptr inbounds [50 x i8], ptr %77, i64 0, i64 0
  %79 = call ptr @strcpy(ptr noundef %78, ptr noundef @.str.16) #4
  %80 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 2
  %81 = getelementptr inbounds %struct.Question, ptr %80, i32 0, i32 2
  store i8 67, ptr %81, align 2
  %82 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 3
  %83 = getelementptr inbounds %struct.Question, ptr %82, i32 0, i32 0
  %84 = getelementptr inbounds [200 x i8], ptr %83, i64 0, i64 0
  %85 = call ptr @strcpy(ptr noundef %84, ptr noundef @.str.17) #4
  %86 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 3
  %87 = getelementptr inbounds %struct.Question, ptr %86, i32 0, i32 1
  %88 = getelementptr inbounds [4 x [50 x i8]], ptr %87, i64 0, i64 0
  %89 = getelementptr inbounds [50 x i8], ptr %88, i64 0, i64 0
  %90 = call ptr @strcpy(ptr noundef %89, ptr noundef @.str.18) #4
  %91 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 3
  %92 = getelementptr inbounds %struct.Question, ptr %91, i32 0, i32 1
  %93 = getelementptr inbounds [4 x [50 x i8]], ptr %92, i64 0, i64 1
  %94 = getelementptr inbounds [50 x i8], ptr %93, i64 0, i64 0
  %95 = call ptr @strcpy(ptr noundef %94, ptr noundef @.str.19) #4
  %96 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 3
  %97 = getelementptr inbounds %struct.Question, ptr %96, i32 0, i32 1
  %98 = getelementptr inbounds [4 x [50 x i8]], ptr %97, i64 0, i64 2
  %99 = getelementptr inbounds [50 x i8], ptr %98, i64 0, i64 0
  %100 = call ptr @strcpy(ptr noundef %99, ptr noundef @.str.20) #4
  %101 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 3
  %102 = getelementptr inbounds %struct.Question, ptr %101, i32 0, i32 1
  %103 = getelementptr inbounds [4 x [50 x i8]], ptr %102, i64 0, i64 3
  %104 = getelementptr inbounds [50 x i8], ptr %103, i64 0, i64 0
  %105 = call ptr @strcpy(ptr noundef %104, ptr noundef @.str.21) #4
  %106 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 3
  %107 = getelementptr inbounds %struct.Question, ptr %106, i32 0, i32 2
  store i8 65, ptr %107, align 1
  %108 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 4
  %109 = getelementptr inbounds %struct.Question, ptr %108, i32 0, i32 0
  %110 = getelementptr inbounds [200 x i8], ptr %109, i64 0, i64 0
  %111 = call ptr @strcpy(ptr noundef %110, ptr noundef @.str.22) #4
  %112 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 4
  %113 = getelementptr inbounds %struct.Question, ptr %112, i32 0, i32 1
  %114 = getelementptr inbounds [4 x [50 x i8]], ptr %113, i64 0, i64 0
  %115 = getelementptr inbounds [50 x i8], ptr %114, i64 0, i64 0
  %116 = call ptr @strcpy(ptr noundef %115, ptr noundef @.str.10) #4
  %117 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 4
  %118 = getelementptr inbounds %struct.Question, ptr %117, i32 0, i32 1
  %119 = getelementptr inbounds [4 x [50 x i8]], ptr %118, i64 0, i64 1
  %120 = getelementptr inbounds [50 x i8], ptr %119, i64 0, i64 0
  %121 = call ptr @strcpy(ptr noundef %120, ptr noundef @.str.23) #4
  %122 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 4
  %123 = getelementptr inbounds %struct.Question, ptr %122, i32 0, i32 1
  %124 = getelementptr inbounds [4 x [50 x i8]], ptr %123, i64 0, i64 2
  %125 = getelementptr inbounds [50 x i8], ptr %124, i64 0, i64 0
  %126 = call ptr @strcpy(ptr noundef %125, ptr noundef @.str.24) #4
  %127 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 4
  %128 = getelementptr inbounds %struct.Question, ptr %127, i32 0, i32 1
  %129 = getelementptr inbounds [4 x [50 x i8]], ptr %128, i64 0, i64 3
  %130 = getelementptr inbounds [50 x i8], ptr %129, i64 0, i64 0
  %131 = call ptr @strcpy(ptr noundef %130, ptr noundef @.str.25) #4
  %132 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 4
  %133 = getelementptr inbounds %struct.Question, ptr %132, i32 0, i32 2
  store i8 66, ptr %133, align 4
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %135

135:                                              ; preds = %155, %0
  %.01 = phi i32 [ 0, %0 ], [ %.1, %155 ]
  %.0 = phi i32 [ 0, %0 ], [ %156, %155 ]
  %136 = icmp slt i32 %.0, 5
  br i1 %136, label %137, label %157

137:                                              ; preds = %135
  %138 = add nsw i32 %.0, 1
  %139 = call i32 (ptr, ...) @printf(ptr noundef @.str.27, i32 noundef %138)
  %140 = sext i32 %.0 to i64
  %141 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 %140
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 1 %141, i64 401, i1 false)
  call void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %2)
  %142 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %143 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.29, ptr noundef %3)
  %144 = load i8, ptr %3, align 1
  %145 = sext i8 %144 to i32
  %146 = sext i32 %.0 to i64
  %147 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 %146
  %148 = getelementptr inbounds %struct.Question, ptr %147, i32 0, i32 2
  %149 = load i8, ptr %148, align 1
  %150 = sext i8 %149 to i32
  %151 = icmp eq i32 %145, %150
  br i1 %151, label %152, label %154

152:                                              ; preds = %137
  %153 = add nsw i32 %.01, 1
  br label %154

154:                                              ; preds = %152, %137
  %.1 = phi i32 [ %153, %152 ], [ %.01, %137 ]
  br label %155

155:                                              ; preds = %154
  %156 = add nsw i32 %.0, 1
  br label %135, !llvm.loop !8

157:                                              ; preds = %135
  %158 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, i32 noundef %.01)
  ret i32 0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
