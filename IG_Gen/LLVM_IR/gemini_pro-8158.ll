; ModuleID = 'DATASETv2/gemini_pro-8158.c'
source_filename = "DATASETv2/gemini_pro-8158.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Meow\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"Purr\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Thank you\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"Hiss\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"Goodbye\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"Grrr\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"Please\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"Enter a cat word: \00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"The English translation is: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @translate(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call i32 @strcmp(ptr noundef %4, ptr noundef @.str) #3
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 8
  br label %25

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = call i32 @strcmp(ptr noundef %9, ptr noundef @.str.2) #3
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %8
  store ptr @.str.3, ptr %2, align 8
  br label %25

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 8
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.4) #3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store ptr @.str.5, ptr %2, align 8
  br label %25

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 8
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @.str.6) #3
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store ptr @.str.7, ptr %2, align 8
  br label %25

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 8
  store ptr %24, ptr %2, align 8
  br label %25

25:                                               ; preds = %23, %22, %17, %12, %7
  %26 = load ptr, ptr %2, align 8
  ret ptr %26
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %5 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %5)
  %7 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %8 = call ptr @translate(ptr noundef %7)
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %9)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
