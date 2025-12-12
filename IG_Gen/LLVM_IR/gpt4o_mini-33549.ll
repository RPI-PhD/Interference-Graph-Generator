; ModuleID = 'DATASETv2/gpt4o_mini-33549.c'
source_filename = "DATASETv2/gpt4o_mini-33549.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [45 x i8] c"The quick brown fox jumps over the lazy dog.\00", align 1
@.str.1 = private unnamed_addr constant [68 x i8] c"Programming is like writing a book, except when you miss a chapter!\00", align 1
@.str.2 = private unnamed_addr constant [47 x i8] c"In a world where you can be anything, be kind.\00", align 1
@.str.3 = private unnamed_addr constant [61 x i8] c"Code is like humor. When you have to explain it, it\E2\80\99s bad.\00", align 1
@.str.4 = private unnamed_addr constant [88 x i8] c"Debugging is like being the detective in a crime movie where you are also the murderer.\00", align 1
@prompts = dso_local global [5 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4], align 16
@stdin = external global ptr, align 8
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"\0AType the following text:\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"%s\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [40 x i8] c"You typed %d characters in %d seconds.\0A\00", align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"Your typing speed is: %.2f WPM\0A\00", align 1
@.str.10 = private unnamed_addr constant [35 x i8] c"Welcome to the Typing Speed Test!\0A\00", align 1
@.str.11 = private unnamed_addr constant [59 x i8] c"You will be provided with a prompt to type. Let's begin!\0A\0A\00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"Press Enter to start the timer...\0A\00", align 1
@.str.13 = private unnamed_addr constant [43 x i8] c"Well done! Your input matches the prompt.\0A\00", align 1
@.str.14 = private unnamed_addr constant [54 x i8] c"Your input didn't match the prompt. Keep practicing!\0A\00", align 1
@.str.15 = private unnamed_addr constant [48 x i8] c"\0APress Enter to continue to the next prompt...\0A\00", align 1
@.str.16 = private unnamed_addr constant [64 x i8] c"\0AYou have completed the typing test! Thanks for participating!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @clearInputBuffer() #0 {
  br label %1

1:                                                ; preds = %4, %0
  %2 = call i32 @getchar()
  %3 = icmp ne i32 %2, 10
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  br label %1, !llvm.loop !6

5:                                                ; preds = %1
  ret void
}

declare i32 @getchar() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @getUserInput(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = trunc i64 %6 to i32
  %8 = load ptr, ptr @stdin, align 8
  %9 = call ptr @fgets(ptr noundef %5, i32 noundef %7, ptr noundef %8)
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = call i64 @strcspn(ptr noundef %11, ptr noundef @.str.5) #4
  %13 = getelementptr inbounds i8, ptr %10, i64 %12
  store i8 0, ptr %13, align 1
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayPrompt(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %4 = load i32, ptr %2, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [5 x ptr], ptr @prompts, i64 0, i64 %5
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %7)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @calculateTypingSpeed(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = sitofp i32 %6 to float
  %8 = fdiv float %7, 5.000000e+00
  store float %8, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %3, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %9, i32 noundef %10)
  %12 = load float, ptr %5, align 4
  %13 = fpext float %12 to double
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %13)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [256 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %43, %0
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 5
  br i1 %12, label %13, label %46

13:                                               ; preds = %10
  %14 = load i32, ptr %3, align 4
  call void @displayPrompt(i32 noundef %14)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @clearInputBuffer()
  %16 = call i64 @clock() #5
  store i64 %16, ptr %4, align 8
  %17 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  call void @getUserInput(ptr noundef %17, i64 noundef 256)
  %18 = call i64 @clock() #5
  store i64 %18, ptr %5, align 8
  %19 = load i64, ptr %5, align 8
  %20 = load i64, ptr %4, align 8
  %21 = sub nsw i64 %19, %20
  %22 = sitofp i64 %21 to double
  %23 = fdiv double %22, 1.000000e+06
  store double %23, ptr %6, align 8
  %24 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %25 = call i64 @strlen(ptr noundef %24) #4
  %26 = trunc i64 %25 to i32
  store i32 %26, ptr %7, align 4
  %27 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %28 = load i32, ptr %3, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [5 x ptr], ptr @prompts, i64 0, i64 %29
  %31 = load ptr, ptr %30, align 8
  %32 = call i32 @strcmp(ptr noundef %27, ptr noundef %31) #4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %13
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %38

36:                                               ; preds = %13
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %38

38:                                               ; preds = %36, %34
  %39 = load double, ptr %6, align 8
  %40 = fptosi double %39 to i32
  %41 = load i32, ptr %7, align 4
  call void @calculateTypingSpeed(i32 noundef %40, i32 noundef %41)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @clearInputBuffer()
  br label %43

43:                                               ; preds = %38
  %44 = load i32, ptr %3, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %3, align 4
  br label %10, !llvm.loop !8

46:                                               ; preds = %10
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @clock() #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
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
