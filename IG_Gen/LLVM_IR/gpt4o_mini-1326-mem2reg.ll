; ModuleID = 'LLVM_IR/gpt4o_mini-1326.ll'
source_filename = "DATASETv2/gpt4o_mini-1326.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Question = type { [256 x i8], [4 x [100 x i8]], i32 }
%struct.User = type { [50 x i8], i32 }

@.str = private unnamed_addr constant [31 x i8] c"What is the capital of France?\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Berlin\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"Madrid\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"Paris\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"Lisbon\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"Which planet is known as the Red Planet?\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Earth\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"Mars\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Jupiter\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"Venus\00", align 1
@.str.10 = private unnamed_addr constant [36 x i8] c"What is the largest ocean on Earth?\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"Atlantic Ocean\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"Indian Ocean\00", align 1
@.str.13 = private unnamed_addr constant [13 x i8] c"Arctic Ocean\00", align 1
@.str.14 = private unnamed_addr constant [14 x i8] c"Pacific Ocean\00", align 1
@.str.15 = private unnamed_addr constant [30 x i8] c"Who wrote 'Romeo and Juliet'?\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"Charles Dickens\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"William Shakespeare\00", align 1
@.str.18 = private unnamed_addr constant [12 x i8] c"Jane Austen\00", align 1
@.str.19 = private unnamed_addr constant [11 x i8] c"Mark Twain\00", align 1
@.str.20 = private unnamed_addr constant [35 x i8] c"What is the smallest prime number?\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@.str.23 = private unnamed_addr constant [2 x i8] c"3\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"5\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"\0A%s\0A\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"%d. %s\0A\00", align 1
@.str.27 = private unnamed_addr constant [21 x i8] c"Your answer (1-%d): \00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.29 = private unnamed_addr constant [10 x i8] c"Correct!\0A\00", align 1
@.str.30 = private unnamed_addr constant [35 x i8] c"Wrong! The correct answer was %s.\0A\00", align 1
@.str.31 = private unnamed_addr constant [51 x i8] c"\0AExam completed, %s! Your score is: %d out of %d.\0A\00", align 1
@.str.32 = private unnamed_addr constant [42 x i8] c"Welcome to the Online Examination System\0A\00", align 1
@.str.33 = private unnamed_addr constant [18 x i8] c"Enter your name: \00", align 1
@stdin = external global ptr, align 8
@.str.34 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.35 = private unnamed_addr constant [39 x i8] c"Thank you for participating! Goodbye.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initializeQuestions(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Question, ptr %0, i64 0
  %3 = getelementptr inbounds %struct.Question, ptr %2, i32 0, i32 0
  %4 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %5 = call ptr @strcpy(ptr noundef %4, ptr noundef @.str) #5
  %6 = getelementptr inbounds %struct.Question, ptr %0, i64 0
  %7 = getelementptr inbounds %struct.Question, ptr %6, i32 0, i32 1
  %8 = getelementptr inbounds [4 x [100 x i8]], ptr %7, i64 0, i64 0
  %9 = getelementptr inbounds [100 x i8], ptr %8, i64 0, i64 0
  %10 = call ptr @strcpy(ptr noundef %9, ptr noundef @.str.1) #5
  %11 = getelementptr inbounds %struct.Question, ptr %0, i64 0
  %12 = getelementptr inbounds %struct.Question, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds [4 x [100 x i8]], ptr %12, i64 0, i64 1
  %14 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  %15 = call ptr @strcpy(ptr noundef %14, ptr noundef @.str.2) #5
  %16 = getelementptr inbounds %struct.Question, ptr %0, i64 0
  %17 = getelementptr inbounds %struct.Question, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [4 x [100 x i8]], ptr %17, i64 0, i64 2
  %19 = getelementptr inbounds [100 x i8], ptr %18, i64 0, i64 0
  %20 = call ptr @strcpy(ptr noundef %19, ptr noundef @.str.3) #5
  %21 = getelementptr inbounds %struct.Question, ptr %0, i64 0
  %22 = getelementptr inbounds %struct.Question, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [4 x [100 x i8]], ptr %22, i64 0, i64 3
  %24 = getelementptr inbounds [100 x i8], ptr %23, i64 0, i64 0
  %25 = call ptr @strcpy(ptr noundef %24, ptr noundef @.str.4) #5
  %26 = getelementptr inbounds %struct.Question, ptr %0, i64 0
  %27 = getelementptr inbounds %struct.Question, ptr %26, i32 0, i32 2
  store i32 2, ptr %27, align 4
  %28 = getelementptr inbounds %struct.Question, ptr %0, i64 1
  %29 = getelementptr inbounds %struct.Question, ptr %28, i32 0, i32 0
  %30 = getelementptr inbounds [256 x i8], ptr %29, i64 0, i64 0
  %31 = call ptr @strcpy(ptr noundef %30, ptr noundef @.str.5) #5
  %32 = getelementptr inbounds %struct.Question, ptr %0, i64 1
  %33 = getelementptr inbounds %struct.Question, ptr %32, i32 0, i32 1
  %34 = getelementptr inbounds [4 x [100 x i8]], ptr %33, i64 0, i64 0
  %35 = getelementptr inbounds [100 x i8], ptr %34, i64 0, i64 0
  %36 = call ptr @strcpy(ptr noundef %35, ptr noundef @.str.6) #5
  %37 = getelementptr inbounds %struct.Question, ptr %0, i64 1
  %38 = getelementptr inbounds %struct.Question, ptr %37, i32 0, i32 1
  %39 = getelementptr inbounds [4 x [100 x i8]], ptr %38, i64 0, i64 1
  %40 = getelementptr inbounds [100 x i8], ptr %39, i64 0, i64 0
  %41 = call ptr @strcpy(ptr noundef %40, ptr noundef @.str.7) #5
  %42 = getelementptr inbounds %struct.Question, ptr %0, i64 1
  %43 = getelementptr inbounds %struct.Question, ptr %42, i32 0, i32 1
  %44 = getelementptr inbounds [4 x [100 x i8]], ptr %43, i64 0, i64 2
  %45 = getelementptr inbounds [100 x i8], ptr %44, i64 0, i64 0
  %46 = call ptr @strcpy(ptr noundef %45, ptr noundef @.str.8) #5
  %47 = getelementptr inbounds %struct.Question, ptr %0, i64 1
  %48 = getelementptr inbounds %struct.Question, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds [4 x [100 x i8]], ptr %48, i64 0, i64 3
  %50 = getelementptr inbounds [100 x i8], ptr %49, i64 0, i64 0
  %51 = call ptr @strcpy(ptr noundef %50, ptr noundef @.str.9) #5
  %52 = getelementptr inbounds %struct.Question, ptr %0, i64 1
  %53 = getelementptr inbounds %struct.Question, ptr %52, i32 0, i32 2
  store i32 1, ptr %53, align 4
  %54 = getelementptr inbounds %struct.Question, ptr %0, i64 2
  %55 = getelementptr inbounds %struct.Question, ptr %54, i32 0, i32 0
  %56 = getelementptr inbounds [256 x i8], ptr %55, i64 0, i64 0
  %57 = call ptr @strcpy(ptr noundef %56, ptr noundef @.str.10) #5
  %58 = getelementptr inbounds %struct.Question, ptr %0, i64 2
  %59 = getelementptr inbounds %struct.Question, ptr %58, i32 0, i32 1
  %60 = getelementptr inbounds [4 x [100 x i8]], ptr %59, i64 0, i64 0
  %61 = getelementptr inbounds [100 x i8], ptr %60, i64 0, i64 0
  %62 = call ptr @strcpy(ptr noundef %61, ptr noundef @.str.11) #5
  %63 = getelementptr inbounds %struct.Question, ptr %0, i64 2
  %64 = getelementptr inbounds %struct.Question, ptr %63, i32 0, i32 1
  %65 = getelementptr inbounds [4 x [100 x i8]], ptr %64, i64 0, i64 1
  %66 = getelementptr inbounds [100 x i8], ptr %65, i64 0, i64 0
  %67 = call ptr @strcpy(ptr noundef %66, ptr noundef @.str.12) #5
  %68 = getelementptr inbounds %struct.Question, ptr %0, i64 2
  %69 = getelementptr inbounds %struct.Question, ptr %68, i32 0, i32 1
  %70 = getelementptr inbounds [4 x [100 x i8]], ptr %69, i64 0, i64 2
  %71 = getelementptr inbounds [100 x i8], ptr %70, i64 0, i64 0
  %72 = call ptr @strcpy(ptr noundef %71, ptr noundef @.str.13) #5
  %73 = getelementptr inbounds %struct.Question, ptr %0, i64 2
  %74 = getelementptr inbounds %struct.Question, ptr %73, i32 0, i32 1
  %75 = getelementptr inbounds [4 x [100 x i8]], ptr %74, i64 0, i64 3
  %76 = getelementptr inbounds [100 x i8], ptr %75, i64 0, i64 0
  %77 = call ptr @strcpy(ptr noundef %76, ptr noundef @.str.14) #5
  %78 = getelementptr inbounds %struct.Question, ptr %0, i64 2
  %79 = getelementptr inbounds %struct.Question, ptr %78, i32 0, i32 2
  store i32 3, ptr %79, align 4
  %80 = getelementptr inbounds %struct.Question, ptr %0, i64 3
  %81 = getelementptr inbounds %struct.Question, ptr %80, i32 0, i32 0
  %82 = getelementptr inbounds [256 x i8], ptr %81, i64 0, i64 0
  %83 = call ptr @strcpy(ptr noundef %82, ptr noundef @.str.15) #5
  %84 = getelementptr inbounds %struct.Question, ptr %0, i64 3
  %85 = getelementptr inbounds %struct.Question, ptr %84, i32 0, i32 1
  %86 = getelementptr inbounds [4 x [100 x i8]], ptr %85, i64 0, i64 0
  %87 = getelementptr inbounds [100 x i8], ptr %86, i64 0, i64 0
  %88 = call ptr @strcpy(ptr noundef %87, ptr noundef @.str.16) #5
  %89 = getelementptr inbounds %struct.Question, ptr %0, i64 3
  %90 = getelementptr inbounds %struct.Question, ptr %89, i32 0, i32 1
  %91 = getelementptr inbounds [4 x [100 x i8]], ptr %90, i64 0, i64 1
  %92 = getelementptr inbounds [100 x i8], ptr %91, i64 0, i64 0
  %93 = call ptr @strcpy(ptr noundef %92, ptr noundef @.str.17) #5
  %94 = getelementptr inbounds %struct.Question, ptr %0, i64 3
  %95 = getelementptr inbounds %struct.Question, ptr %94, i32 0, i32 1
  %96 = getelementptr inbounds [4 x [100 x i8]], ptr %95, i64 0, i64 2
  %97 = getelementptr inbounds [100 x i8], ptr %96, i64 0, i64 0
  %98 = call ptr @strcpy(ptr noundef %97, ptr noundef @.str.18) #5
  %99 = getelementptr inbounds %struct.Question, ptr %0, i64 3
  %100 = getelementptr inbounds %struct.Question, ptr %99, i32 0, i32 1
  %101 = getelementptr inbounds [4 x [100 x i8]], ptr %100, i64 0, i64 3
  %102 = getelementptr inbounds [100 x i8], ptr %101, i64 0, i64 0
  %103 = call ptr @strcpy(ptr noundef %102, ptr noundef @.str.19) #5
  %104 = getelementptr inbounds %struct.Question, ptr %0, i64 3
  %105 = getelementptr inbounds %struct.Question, ptr %104, i32 0, i32 2
  store i32 1, ptr %105, align 4
  %106 = getelementptr inbounds %struct.Question, ptr %0, i64 4
  %107 = getelementptr inbounds %struct.Question, ptr %106, i32 0, i32 0
  %108 = getelementptr inbounds [256 x i8], ptr %107, i64 0, i64 0
  %109 = call ptr @strcpy(ptr noundef %108, ptr noundef @.str.20) #5
  %110 = getelementptr inbounds %struct.Question, ptr %0, i64 4
  %111 = getelementptr inbounds %struct.Question, ptr %110, i32 0, i32 1
  %112 = getelementptr inbounds [4 x [100 x i8]], ptr %111, i64 0, i64 0
  %113 = getelementptr inbounds [100 x i8], ptr %112, i64 0, i64 0
  %114 = call ptr @strcpy(ptr noundef %113, ptr noundef @.str.21) #5
  %115 = getelementptr inbounds %struct.Question, ptr %0, i64 4
  %116 = getelementptr inbounds %struct.Question, ptr %115, i32 0, i32 1
  %117 = getelementptr inbounds [4 x [100 x i8]], ptr %116, i64 0, i64 1
  %118 = getelementptr inbounds [100 x i8], ptr %117, i64 0, i64 0
  %119 = call ptr @strcpy(ptr noundef %118, ptr noundef @.str.22) #5
  %120 = getelementptr inbounds %struct.Question, ptr %0, i64 4
  %121 = getelementptr inbounds %struct.Question, ptr %120, i32 0, i32 1
  %122 = getelementptr inbounds [4 x [100 x i8]], ptr %121, i64 0, i64 2
  %123 = getelementptr inbounds [100 x i8], ptr %122, i64 0, i64 0
  %124 = call ptr @strcpy(ptr noundef %123, ptr noundef @.str.23) #5
  %125 = getelementptr inbounds %struct.Question, ptr %0, i64 4
  %126 = getelementptr inbounds %struct.Question, ptr %125, i32 0, i32 1
  %127 = getelementptr inbounds [4 x [100 x i8]], ptr %126, i64 0, i64 3
  %128 = getelementptr inbounds [100 x i8], ptr %127, i64 0, i64 0
  %129 = call ptr @strcpy(ptr noundef %128, ptr noundef @.str.24) #5
  %130 = getelementptr inbounds %struct.Question, ptr %0, i64 4
  %131 = getelementptr inbounds %struct.Question, ptr %130, i32 0, i32 2
  store i32 1, ptr %131, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, ptr noundef %3)
  br label %5

5:                                                ; preds = %14, %1
  %.0 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %6 = icmp slt i32 %.0, 4
  br i1 %6, label %7, label %16

7:                                                ; preds = %5
  %8 = add nsw i32 %.0, 1
  %9 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 1
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [4 x [100 x i8]], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds [100 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %8, ptr noundef %12)
  br label %14

14:                                               ; preds = %7
  %15 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

16:                                               ; preds = %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @takeExam(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.Question, align 8
  %5 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 1
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %38, %2
  %.0 = phi i32 [ 0, %2 ], [ %39, %38 ]
  %7 = icmp slt i32 %.0, 5
  br i1 %7, label %8, label %40

8:                                                ; preds = %6
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds %struct.Question, ptr %0, i64 %9
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 4 %10, i64 660, i1 false)
  call void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %4)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.27, i32 noundef 4)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.28, ptr noundef %3)
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.Question, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.Question, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 4
  %19 = icmp eq i32 %14, %18
  br i1 %19, label %20, label %25

20:                                               ; preds = %8
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %22 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %22, align 4
  br label %37

25:                                               ; preds = %8
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds %struct.Question, ptr %0, i64 %26
  %28 = getelementptr inbounds %struct.Question, ptr %27, i32 0, i32 1
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds %struct.Question, ptr %0, i64 %29
  %31 = getelementptr inbounds %struct.Question, ptr %30, i32 0, i32 2
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [4 x [100 x i8]], ptr %28, i64 0, i64 %33
  %35 = getelementptr inbounds [100 x i8], ptr %34, i64 0, i64 0
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, ptr noundef %35)
  br label %37

37:                                               ; preds = %25, %20
  br label %38

38:                                               ; preds = %37
  %39 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

40:                                               ; preds = %6
  %41 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  ret i32 %42
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayResult(ptr noundef byval(%struct.User) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.User, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %4 = getelementptr inbounds %struct.User, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, ptr noundef %3, i32 noundef %5, i32 noundef 5)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.Question], align 16
  %2 = alloca %struct.User, align 8
  %3 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  call void @initializeQuestions(ptr noundef %3)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %6 = getelementptr inbounds %struct.User, ptr %2, i32 0, i32 0
  %7 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %8 = load ptr, ptr @stdin, align 8
  %9 = call ptr @fgets(ptr noundef %7, i32 noundef 50, ptr noundef %8)
  %10 = getelementptr inbounds %struct.User, ptr %2, i32 0, i32 0
  %11 = getelementptr inbounds %struct.User, ptr %2, i32 0, i32 0
  %12 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 0
  %13 = call i64 @strcspn(ptr noundef %12, ptr noundef @.str.34) #6
  %14 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 %13
  store i8 0, ptr %14, align 1
  %15 = getelementptr inbounds [5 x %struct.Question], ptr %1, i64 0, i64 0
  %16 = call i32 @takeExam(ptr noundef %15, ptr noundef %2)
  call void @displayResult(ptr noundef byval(%struct.User) align 8 %2)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
