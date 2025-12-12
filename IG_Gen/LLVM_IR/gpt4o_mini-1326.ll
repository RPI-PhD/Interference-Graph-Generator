; ModuleID = 'DATASETv2/gpt4o_mini-1326.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initializeQuestions(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.Question, ptr %3, i64 0
  %5 = getelementptr inbounds %struct.Question, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef @.str) #5
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Question, ptr %8, i64 0
  %10 = getelementptr inbounds %struct.Question, ptr %9, i32 0, i32 1
  %11 = getelementptr inbounds [4 x [100 x i8]], ptr %10, i64 0, i64 0
  %12 = getelementptr inbounds [100 x i8], ptr %11, i64 0, i64 0
  %13 = call ptr @strcpy(ptr noundef %12, ptr noundef @.str.1) #5
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.Question, ptr %14, i64 0
  %16 = getelementptr inbounds %struct.Question, ptr %15, i32 0, i32 1
  %17 = getelementptr inbounds [4 x [100 x i8]], ptr %16, i64 0, i64 1
  %18 = getelementptr inbounds [100 x i8], ptr %17, i64 0, i64 0
  %19 = call ptr @strcpy(ptr noundef %18, ptr noundef @.str.2) #5
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.Question, ptr %20, i64 0
  %22 = getelementptr inbounds %struct.Question, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [4 x [100 x i8]], ptr %22, i64 0, i64 2
  %24 = getelementptr inbounds [100 x i8], ptr %23, i64 0, i64 0
  %25 = call ptr @strcpy(ptr noundef %24, ptr noundef @.str.3) #5
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.Question, ptr %26, i64 0
  %28 = getelementptr inbounds %struct.Question, ptr %27, i32 0, i32 1
  %29 = getelementptr inbounds [4 x [100 x i8]], ptr %28, i64 0, i64 3
  %30 = getelementptr inbounds [100 x i8], ptr %29, i64 0, i64 0
  %31 = call ptr @strcpy(ptr noundef %30, ptr noundef @.str.4) #5
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.Question, ptr %32, i64 0
  %34 = getelementptr inbounds %struct.Question, ptr %33, i32 0, i32 2
  store i32 2, ptr %34, align 4
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.Question, ptr %35, i64 1
  %37 = getelementptr inbounds %struct.Question, ptr %36, i32 0, i32 0
  %38 = getelementptr inbounds [256 x i8], ptr %37, i64 0, i64 0
  %39 = call ptr @strcpy(ptr noundef %38, ptr noundef @.str.5) #5
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.Question, ptr %40, i64 1
  %42 = getelementptr inbounds %struct.Question, ptr %41, i32 0, i32 1
  %43 = getelementptr inbounds [4 x [100 x i8]], ptr %42, i64 0, i64 0
  %44 = getelementptr inbounds [100 x i8], ptr %43, i64 0, i64 0
  %45 = call ptr @strcpy(ptr noundef %44, ptr noundef @.str.6) #5
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds %struct.Question, ptr %46, i64 1
  %48 = getelementptr inbounds %struct.Question, ptr %47, i32 0, i32 1
  %49 = getelementptr inbounds [4 x [100 x i8]], ptr %48, i64 0, i64 1
  %50 = getelementptr inbounds [100 x i8], ptr %49, i64 0, i64 0
  %51 = call ptr @strcpy(ptr noundef %50, ptr noundef @.str.7) #5
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.Question, ptr %52, i64 1
  %54 = getelementptr inbounds %struct.Question, ptr %53, i32 0, i32 1
  %55 = getelementptr inbounds [4 x [100 x i8]], ptr %54, i64 0, i64 2
  %56 = getelementptr inbounds [100 x i8], ptr %55, i64 0, i64 0
  %57 = call ptr @strcpy(ptr noundef %56, ptr noundef @.str.8) #5
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.Question, ptr %58, i64 1
  %60 = getelementptr inbounds %struct.Question, ptr %59, i32 0, i32 1
  %61 = getelementptr inbounds [4 x [100 x i8]], ptr %60, i64 0, i64 3
  %62 = getelementptr inbounds [100 x i8], ptr %61, i64 0, i64 0
  %63 = call ptr @strcpy(ptr noundef %62, ptr noundef @.str.9) #5
  %64 = load ptr, ptr %2, align 8
  %65 = getelementptr inbounds %struct.Question, ptr %64, i64 1
  %66 = getelementptr inbounds %struct.Question, ptr %65, i32 0, i32 2
  store i32 1, ptr %66, align 4
  %67 = load ptr, ptr %2, align 8
  %68 = getelementptr inbounds %struct.Question, ptr %67, i64 2
  %69 = getelementptr inbounds %struct.Question, ptr %68, i32 0, i32 0
  %70 = getelementptr inbounds [256 x i8], ptr %69, i64 0, i64 0
  %71 = call ptr @strcpy(ptr noundef %70, ptr noundef @.str.10) #5
  %72 = load ptr, ptr %2, align 8
  %73 = getelementptr inbounds %struct.Question, ptr %72, i64 2
  %74 = getelementptr inbounds %struct.Question, ptr %73, i32 0, i32 1
  %75 = getelementptr inbounds [4 x [100 x i8]], ptr %74, i64 0, i64 0
  %76 = getelementptr inbounds [100 x i8], ptr %75, i64 0, i64 0
  %77 = call ptr @strcpy(ptr noundef %76, ptr noundef @.str.11) #5
  %78 = load ptr, ptr %2, align 8
  %79 = getelementptr inbounds %struct.Question, ptr %78, i64 2
  %80 = getelementptr inbounds %struct.Question, ptr %79, i32 0, i32 1
  %81 = getelementptr inbounds [4 x [100 x i8]], ptr %80, i64 0, i64 1
  %82 = getelementptr inbounds [100 x i8], ptr %81, i64 0, i64 0
  %83 = call ptr @strcpy(ptr noundef %82, ptr noundef @.str.12) #5
  %84 = load ptr, ptr %2, align 8
  %85 = getelementptr inbounds %struct.Question, ptr %84, i64 2
  %86 = getelementptr inbounds %struct.Question, ptr %85, i32 0, i32 1
  %87 = getelementptr inbounds [4 x [100 x i8]], ptr %86, i64 0, i64 2
  %88 = getelementptr inbounds [100 x i8], ptr %87, i64 0, i64 0
  %89 = call ptr @strcpy(ptr noundef %88, ptr noundef @.str.13) #5
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.Question, ptr %90, i64 2
  %92 = getelementptr inbounds %struct.Question, ptr %91, i32 0, i32 1
  %93 = getelementptr inbounds [4 x [100 x i8]], ptr %92, i64 0, i64 3
  %94 = getelementptr inbounds [100 x i8], ptr %93, i64 0, i64 0
  %95 = call ptr @strcpy(ptr noundef %94, ptr noundef @.str.14) #5
  %96 = load ptr, ptr %2, align 8
  %97 = getelementptr inbounds %struct.Question, ptr %96, i64 2
  %98 = getelementptr inbounds %struct.Question, ptr %97, i32 0, i32 2
  store i32 3, ptr %98, align 4
  %99 = load ptr, ptr %2, align 8
  %100 = getelementptr inbounds %struct.Question, ptr %99, i64 3
  %101 = getelementptr inbounds %struct.Question, ptr %100, i32 0, i32 0
  %102 = getelementptr inbounds [256 x i8], ptr %101, i64 0, i64 0
  %103 = call ptr @strcpy(ptr noundef %102, ptr noundef @.str.15) #5
  %104 = load ptr, ptr %2, align 8
  %105 = getelementptr inbounds %struct.Question, ptr %104, i64 3
  %106 = getelementptr inbounds %struct.Question, ptr %105, i32 0, i32 1
  %107 = getelementptr inbounds [4 x [100 x i8]], ptr %106, i64 0, i64 0
  %108 = getelementptr inbounds [100 x i8], ptr %107, i64 0, i64 0
  %109 = call ptr @strcpy(ptr noundef %108, ptr noundef @.str.16) #5
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.Question, ptr %110, i64 3
  %112 = getelementptr inbounds %struct.Question, ptr %111, i32 0, i32 1
  %113 = getelementptr inbounds [4 x [100 x i8]], ptr %112, i64 0, i64 1
  %114 = getelementptr inbounds [100 x i8], ptr %113, i64 0, i64 0
  %115 = call ptr @strcpy(ptr noundef %114, ptr noundef @.str.17) #5
  %116 = load ptr, ptr %2, align 8
  %117 = getelementptr inbounds %struct.Question, ptr %116, i64 3
  %118 = getelementptr inbounds %struct.Question, ptr %117, i32 0, i32 1
  %119 = getelementptr inbounds [4 x [100 x i8]], ptr %118, i64 0, i64 2
  %120 = getelementptr inbounds [100 x i8], ptr %119, i64 0, i64 0
  %121 = call ptr @strcpy(ptr noundef %120, ptr noundef @.str.18) #5
  %122 = load ptr, ptr %2, align 8
  %123 = getelementptr inbounds %struct.Question, ptr %122, i64 3
  %124 = getelementptr inbounds %struct.Question, ptr %123, i32 0, i32 1
  %125 = getelementptr inbounds [4 x [100 x i8]], ptr %124, i64 0, i64 3
  %126 = getelementptr inbounds [100 x i8], ptr %125, i64 0, i64 0
  %127 = call ptr @strcpy(ptr noundef %126, ptr noundef @.str.19) #5
  %128 = load ptr, ptr %2, align 8
  %129 = getelementptr inbounds %struct.Question, ptr %128, i64 3
  %130 = getelementptr inbounds %struct.Question, ptr %129, i32 0, i32 2
  store i32 1, ptr %130, align 4
  %131 = load ptr, ptr %2, align 8
  %132 = getelementptr inbounds %struct.Question, ptr %131, i64 4
  %133 = getelementptr inbounds %struct.Question, ptr %132, i32 0, i32 0
  %134 = getelementptr inbounds [256 x i8], ptr %133, i64 0, i64 0
  %135 = call ptr @strcpy(ptr noundef %134, ptr noundef @.str.20) #5
  %136 = load ptr, ptr %2, align 8
  %137 = getelementptr inbounds %struct.Question, ptr %136, i64 4
  %138 = getelementptr inbounds %struct.Question, ptr %137, i32 0, i32 1
  %139 = getelementptr inbounds [4 x [100 x i8]], ptr %138, i64 0, i64 0
  %140 = getelementptr inbounds [100 x i8], ptr %139, i64 0, i64 0
  %141 = call ptr @strcpy(ptr noundef %140, ptr noundef @.str.21) #5
  %142 = load ptr, ptr %2, align 8
  %143 = getelementptr inbounds %struct.Question, ptr %142, i64 4
  %144 = getelementptr inbounds %struct.Question, ptr %143, i32 0, i32 1
  %145 = getelementptr inbounds [4 x [100 x i8]], ptr %144, i64 0, i64 1
  %146 = getelementptr inbounds [100 x i8], ptr %145, i64 0, i64 0
  %147 = call ptr @strcpy(ptr noundef %146, ptr noundef @.str.22) #5
  %148 = load ptr, ptr %2, align 8
  %149 = getelementptr inbounds %struct.Question, ptr %148, i64 4
  %150 = getelementptr inbounds %struct.Question, ptr %149, i32 0, i32 1
  %151 = getelementptr inbounds [4 x [100 x i8]], ptr %150, i64 0, i64 2
  %152 = getelementptr inbounds [100 x i8], ptr %151, i64 0, i64 0
  %153 = call ptr @strcpy(ptr noundef %152, ptr noundef @.str.23) #5
  %154 = load ptr, ptr %2, align 8
  %155 = getelementptr inbounds %struct.Question, ptr %154, i64 4
  %156 = getelementptr inbounds %struct.Question, ptr %155, i32 0, i32 1
  %157 = getelementptr inbounds [4 x [100 x i8]], ptr %156, i64 0, i64 3
  %158 = getelementptr inbounds [100 x i8], ptr %157, i64 0, i64 0
  %159 = call ptr @strcpy(ptr noundef %158, ptr noundef @.str.24) #5
  %160 = load ptr, ptr %2, align 8
  %161 = getelementptr inbounds %struct.Question, ptr %160, i64 4
  %162 = getelementptr inbounds %struct.Question, ptr %161, i32 0, i32 2
  store i32 1, ptr %162, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %0) #0 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds [256 x i8], ptr %3, i64 0, i64 0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, ptr noundef %4)
  store i32 0, ptr %2, align 4
  br label %6

6:                                                ; preds = %18, %1
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %9, label %21

9:                                                ; preds = %6
  %10 = load i32, ptr %2, align 4
  %11 = add nsw i32 %10, 1
  %12 = getelementptr inbounds %struct.Question, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x [100 x i8]], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds [100 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %11, ptr noundef %16)
  br label %18

18:                                               ; preds = %9
  %19 = load i32, ptr %2, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %2, align 4
  br label %6, !llvm.loop !6

21:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @takeExam(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.Question, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds %struct.User, ptr %8, i32 0, i32 1
  store i32 0, ptr %9, align 4
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %52, %2
  %11 = load i32, ptr %6, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %55

13:                                               ; preds = %10
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %6, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.Question, ptr %14, i64 %16
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 4 %17, i64 660, i1 false)
  call void @displayQuestion(ptr noundef byval(%struct.Question) align 8 %7)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.27, i32 noundef 4)
  %19 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.28, ptr noundef %5)
  %20 = load i32, ptr %5, align 4
  %21 = sub nsw i32 %20, 1
  %22 = load ptr, ptr %3, align 8
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.Question, ptr %22, i64 %24
  %26 = getelementptr inbounds %struct.Question, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 4
  %28 = icmp eq i32 %21, %27
  br i1 %28, label %29, label %35

29:                                               ; preds = %13
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.User, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %32, align 4
  br label %51

35:                                               ; preds = %13
  %36 = load ptr, ptr %3, align 8
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.Question, ptr %36, i64 %38
  %40 = getelementptr inbounds %struct.Question, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %3, align 8
  %42 = load i32, ptr %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %struct.Question, ptr %41, i64 %43
  %45 = getelementptr inbounds %struct.Question, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [4 x [100 x i8]], ptr %40, i64 0, i64 %47
  %49 = getelementptr inbounds [100 x i8], ptr %48, i64 0, i64 0
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, ptr noundef %49)
  br label %51

51:                                               ; preds = %35, %29
  br label %52

52:                                               ; preds = %51
  %53 = load i32, ptr %6, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %6, align 4
  br label %10, !llvm.loop !8

55:                                               ; preds = %10
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.User, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  ret i32 %58
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayResult(ptr noundef byval(%struct.User) align 8 %0) #0 {
  %2 = getelementptr inbounds %struct.User, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %4 = getelementptr inbounds %struct.User, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, ptr noundef %3, i32 noundef %5, i32 noundef 5)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x %struct.Question], align 16
  %3 = alloca %struct.User, align 8
  store i32 0, ptr %1, align 4
  %4 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  call void @initializeQuestions(ptr noundef %4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  %7 = getelementptr inbounds %struct.User, ptr %3, i32 0, i32 0
  %8 = getelementptr inbounds [50 x i8], ptr %7, i64 0, i64 0
  %9 = load ptr, ptr @stdin, align 8
  %10 = call ptr @fgets(ptr noundef %8, i32 noundef 50, ptr noundef %9)
  %11 = getelementptr inbounds %struct.User, ptr %3, i32 0, i32 0
  %12 = getelementptr inbounds %struct.User, ptr %3, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i64 @strcspn(ptr noundef %13, ptr noundef @.str.34) #6
  %15 = getelementptr inbounds [50 x i8], ptr %11, i64 0, i64 %14
  store i8 0, ptr %15, align 1
  %16 = getelementptr inbounds [5 x %struct.Question], ptr %2, i64 0, i64 0
  %17 = call i32 @takeExam(ptr noundef %16, ptr noundef %3)
  call void @displayResult(ptr noundef byval(%struct.User) align 8 %3)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.35)
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
