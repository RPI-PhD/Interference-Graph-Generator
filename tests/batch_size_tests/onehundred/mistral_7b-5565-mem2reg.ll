; ModuleID = 'LLVM_IR/mistral_7b-5565.ll'
source_filename = "DATASETv2/mistral_7b-5565.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Question = type { [255 x i8], [5 x [255 x i8]], i8 }

@currentQuestion = dso_local global i32 0, align 4
@score = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [15 x i8] c"\0AQuestion %d:\0A\00", align 1
@questions = dso_local global [10 x %struct.Question] zeroinitializer, align 16
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Enter options (comma-separated): \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Enter answer (A-E): \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"\0A%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"%c) %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c" %c\00", align 1
@.str.10 = private unnamed_addr constant [42 x i8] c"\0AExamination finished!\0AYour score is %d.\0A\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"clear\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @generateQuestion() #0 {
  %1 = alloca [255 x i8], align 16
  %2 = load i32, ptr @currentQuestion, align 4
  %3 = add nsw i32 %2, 1
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  %5 = load i32, ptr @currentQuestion, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.Question, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [255 x i8], ptr %8, i64 0, i64 0
  %10 = load ptr, ptr @stdin, align 8
  %11 = call ptr @fgets(ptr noundef %9, i32 noundef 255, ptr noundef %10)
  %12 = load i32, ptr @currentQuestion, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Question, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [255 x i8], ptr %15, i64 0, i64 0
  %17 = call ptr @strtok(ptr noundef %16, ptr noundef @.str.1) #4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %19 = getelementptr inbounds [255 x i8], ptr %1, i64 0, i64 0
  %20 = load ptr, ptr @stdin, align 8
  %21 = call ptr @fgets(ptr noundef %19, i32 noundef 255, ptr noundef %20)
  %22 = getelementptr inbounds [255 x i8], ptr %1, i64 0, i64 0
  %23 = call ptr @strtok(ptr noundef %22, ptr noundef @.str.3) #4
  br label %24

24:                                               ; preds = %27, %0
  %.0 = phi i32 [ 0, %0 ], [ %37, %27 ]
  %25 = call ptr @strtok(ptr noundef null, ptr noundef @.str.4) #4
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %38

27:                                               ; preds = %24
  %28 = load i32, ptr @currentQuestion, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.Question, ptr %30, i32 0, i32 1
  %32 = sext i32 %.0 to i64
  %33 = getelementptr inbounds [5 x [255 x i8]], ptr %31, i64 0, i64 %32
  %34 = getelementptr inbounds [255 x i8], ptr %33, i64 0, i64 0
  %35 = call ptr @strtok(ptr noundef null, ptr noundef @.str.4) #4
  %36 = call ptr @strcpy(ptr noundef %34, ptr noundef %35) #4
  %37 = add nsw i32 %.0, 1
  br label %24, !llvm.loop !6

38:                                               ; preds = %24
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %40 = load i32, ptr @currentQuestion, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.Question, ptr %42, i32 0, i32 2
  %44 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %43)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayQuestion() #0 {
  %1 = load i32, ptr @currentQuestion, align 4
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %2
  %4 = getelementptr inbounds %struct.Question, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [255 x i8], ptr %4, i64 0, i64 0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %5)
  br label %7

7:                                                ; preds = %19, %0
  %.0 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %8 = icmp slt i32 %.0, 5
  br i1 %8, label %9, label %21

9:                                                ; preds = %7
  %10 = add nsw i32 %.0, 65
  %11 = load i32, ptr @currentQuestion, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Question, ptr %13, i32 0, i32 1
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [5 x [255 x i8]], ptr %14, i64 0, i64 %15
  %17 = getelementptr inbounds [255 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %10, ptr noundef %17)
  br label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !8

21:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @checkAnswer() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %1)
  %3 = load i8, ptr %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i32, ptr @currentQuestion, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.Question, ptr %7, i32 0, i32 2
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i32 %4, %10
  br i1 %11, label %12, label %15

12:                                               ; preds = %0
  %13 = load i32, ptr @score, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr @score, align 4
  br label %15

15:                                               ; preds = %12, %0
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @nextQuestion() #0 {
  %1 = load i32, ptr @currentQuestion, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, ptr @currentQuestion, align 4
  %3 = load i32, ptr @currentQuestion, align 4
  %4 = icmp sge i32 %3, 10
  br i1 %4, label %5, label %8

5:                                                ; preds = %0
  %6 = load i32, ptr @score, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %6)
  call void @exit(i32 noundef 0) #5
  unreachable

8:                                                ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #4
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #4
  br label %3

3:                                                ; preds = %6, %0
  %.0 = phi i32 [ 0, %0 ], [ %7, %6 ]
  %4 = icmp slt i32 %.0, 10
  br i1 %4, label %5, label %8

5:                                                ; preds = %3
  call void @generateQuestion()
  br label %6

6:                                                ; preds = %5
  %7 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

8:                                                ; preds = %3
  br label %9

9:                                                ; preds = %13, %8
  %.1 = phi i32 [ 0, %8 ], [ %14, %13 ]
  %10 = icmp slt i32 %.1, 10
  br i1 %10, label %11, label %15

11:                                               ; preds = %9
  %12 = call i32 @system(ptr noundef @.str.11)
  call void @displayQuestion()
  call void @checkAnswer()
  call void @nextQuestion()
  br label %13

13:                                               ; preds = %11
  %14 = add nsw i32 %.1, 1
  br label %9, !llvm.loop !10

15:                                               ; preds = %9
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @system(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
