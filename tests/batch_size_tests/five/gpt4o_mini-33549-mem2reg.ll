; ModuleID = 'LLVM_IR/gpt4o_mini-33549.ll'
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

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @getUserInput(ptr noundef %0, i64 noundef %1) #0 {
  %3 = trunc i64 %1 to i32
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef %0, i32 noundef %3, ptr noundef %4)
  %6 = call i64 @strcspn(ptr noundef %0, ptr noundef @.str.5) #4
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  store i8 0, ptr %7, align 1
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayPrompt(i32 noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %3 = sext i32 %0 to i64
  %4 = getelementptr inbounds [5 x ptr], ptr @prompts, i64 0, i64 %3
  %5 = load ptr, ptr %4, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %5)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @calculateTypingSpeed(i32 noundef %0, i32 noundef %1) #0 {
  %3 = sitofp i32 %1 to float
  %4 = fdiv float %3, 5.000000e+00
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %1, i32 noundef %0)
  %6 = fpext float %4 to double
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %4

4:                                                ; preds = %30, %0
  %.0 = phi i32 [ 0, %0 ], [ %31, %30 ]
  %5 = icmp slt i32 %.0, 5
  br i1 %5, label %6, label %32

6:                                                ; preds = %4
  call void @displayPrompt(i32 noundef %.0)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @clearInputBuffer()
  %8 = call i64 @clock() #5
  %9 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  call void @getUserInput(ptr noundef %9, i64 noundef 256)
  %10 = call i64 @clock() #5
  %11 = sub nsw i64 %10, %8
  %12 = sitofp i64 %11 to double
  %13 = fdiv double %12, 1.000000e+06
  %14 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %15 = call i64 @strlen(ptr noundef %14) #4
  %16 = trunc i64 %15 to i32
  %17 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [5 x ptr], ptr @prompts, i64 0, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @strcmp(ptr noundef %17, ptr noundef %20) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %6
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %27

25:                                               ; preds = %6
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %27

27:                                               ; preds = %25, %23
  %28 = fptosi double %13 to i32
  call void @calculateTypingSpeed(i32 noundef %28, i32 noundef %16)
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @clearInputBuffer()
  br label %30

30:                                               ; preds = %27
  %31 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !8

32:                                               ; preds = %4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @clock() #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
