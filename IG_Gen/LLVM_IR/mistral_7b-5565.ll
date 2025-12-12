; ModuleID = 'DATASETv2/mistral_7b-5565.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generateQuestion() #0 {
  %1 = alloca [255 x i8], align 16
  %2 = alloca i32, align 4
  %3 = load i32, ptr @currentQuestion, align 4
  %4 = add nsw i32 %3, 1
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %4)
  %6 = load i32, ptr @currentQuestion, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Question, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [255 x i8], ptr %9, i64 0, i64 0
  %11 = load ptr, ptr @stdin, align 8
  %12 = call ptr @fgets(ptr noundef %10, i32 noundef 255, ptr noundef %11)
  %13 = load i32, ptr @currentQuestion, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Question, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [255 x i8], ptr %16, i64 0, i64 0
  %18 = call ptr @strtok(ptr noundef %17, ptr noundef @.str.1) #4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %20 = getelementptr inbounds [255 x i8], ptr %1, i64 0, i64 0
  %21 = load ptr, ptr @stdin, align 8
  %22 = call ptr @fgets(ptr noundef %20, i32 noundef 255, ptr noundef %21)
  %23 = getelementptr inbounds [255 x i8], ptr %1, i64 0, i64 0
  %24 = call ptr @strtok(ptr noundef %23, ptr noundef @.str.3) #4
  store i32 0, ptr %2, align 4
  br label %25

25:                                               ; preds = %28, %0
  %26 = call ptr @strtok(ptr noundef null, ptr noundef @.str.4) #4
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %41

28:                                               ; preds = %25
  %29 = load i32, ptr @currentQuestion, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Question, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %2, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [5 x [255 x i8]], ptr %32, i64 0, i64 %34
  %36 = getelementptr inbounds [255 x i8], ptr %35, i64 0, i64 0
  %37 = call ptr @strtok(ptr noundef null, ptr noundef @.str.4) #4
  %38 = call ptr @strcpy(ptr noundef %36, ptr noundef %37) #4
  %39 = load i32, ptr %2, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %2, align 4
  br label %25, !llvm.loop !6

41:                                               ; preds = %25
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %43 = load i32, ptr @currentQuestion, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.Question, ptr %45, i32 0, i32 2
  %47 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %46)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayQuestion() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @currentQuestion, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %3
  %5 = getelementptr inbounds %struct.Question, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [255 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %6)
  store i32 0, ptr %1, align 4
  br label %8

8:                                                ; preds = %23, %0
  %9 = load i32, ptr %1, align 4
  %10 = icmp slt i32 %9, 5
  br i1 %10, label %11, label %26

11:                                               ; preds = %8
  %12 = load i32, ptr %1, align 4
  %13 = add nsw i32 %12, 65
  %14 = load i32, ptr @currentQuestion, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x %struct.Question], ptr @questions, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Question, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [5 x [255 x i8]], ptr %17, i64 0, i64 %19
  %21 = getelementptr inbounds [255 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %13, ptr noundef %21)
  br label %23

23:                                               ; preds = %11
  %24 = load i32, ptr %1, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %1, align 4
  br label %8, !llvm.loop !8

26:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %3 = call i64 @time(ptr noundef null) #4
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #4
  store i32 0, ptr %2, align 4
  br label %5

5:                                                ; preds = %9, %0
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 10
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  call void @generateQuestion()
  br label %9

9:                                                ; preds = %8
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %2, align 4
  br label %5, !llvm.loop !9

12:                                               ; preds = %5
  store i32 0, ptr %2, align 4
  br label %13

13:                                               ; preds = %18, %12
  %14 = load i32, ptr %2, align 4
  %15 = icmp slt i32 %14, 10
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = call i32 @system(ptr noundef @.str.11)
  call void @displayQuestion()
  call void @checkAnswer()
  call void @nextQuestion()
  br label %18

18:                                               ; preds = %16
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %2, align 4
  br label %13, !llvm.loop !10

21:                                               ; preds = %13
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @system(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
