; ModuleID = 'LLVM_IR/gpt35-72243.ll'
source_filename = "DATASETv2/gpt35-72243.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [43 x i8] c"Welcome to the Automated Fortune Teller!\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Please enter your name: \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"Please enter your birth year (YYYY): \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [40 x i8] c"Please enter your lucky number (1-10): \00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"\0A\0ACalculating your fortune...\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [37 x i8] c"Dear %s, your fortune for today is:\0A\00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"You will have a great day today!\0A\00", align 1
@.str.9 = private unnamed_addr constant [35 x i8] c"You will get a promotion at work!\0A\00", align 1
@.str.10 = private unnamed_addr constant [38 x i8] c"You will meet someone special today!\0A\00", align 1
@.str.11 = private unnamed_addr constant [51 x i8] c"You will receive good news by the end of the day!\0A\00", align 1
@.str.12 = private unnamed_addr constant [68 x i8] c"You will find a solution to a problem that has been bothering you!\0A\00", align 1
@.str.13 = private unnamed_addr constant [56 x i8] c"You will have a stroke of luck at a casino or lottery!\0A\00", align 1
@.str.14 = private unnamed_addr constant [44 x i8] c"You will travel to a foreign country soon!\0A\00", align 1
@.str.15 = private unnamed_addr constant [49 x i8] c"You will be successful in an important project!\0A\00", align 1
@.str.16 = private unnamed_addr constant [35 x i8] c"You will make a new friend today!\0A\00", align 1
@.str.17 = private unnamed_addr constant [40 x i8] c"You will have a romantic date tonight!\0A\00", align 1
@.str.18 = private unnamed_addr constant [53 x i8] c"\0A\0AThank you for using the Automated Fortune Teller!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [20 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %6 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %2)
  %10 = load i32, ptr %2, align 4
  %11 = sub nsw i32 2021, %10
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %3)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %15 = call i64 @time(ptr noundef null) #3
  %16 = trunc i64 %15 to i32
  call void @srand(i32 noundef %16) #3
  %17 = call i32 @rand() #3
  %18 = srem i32 %17, 10
  %19 = add nsw i32 %18, 1
  %20 = load i32, ptr %3, align 4
  %21 = add nsw i32 %20, %19
  %22 = srem i32 %21, 10
  %23 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %23)
  switch i32 %22, label %45 [
    i32 0, label %25
    i32 1, label %27
    i32 2, label %29
    i32 3, label %31
    i32 4, label %33
    i32 5, label %35
    i32 6, label %37
    i32 7, label %39
    i32 8, label %41
    i32 9, label %43
  ]

25:                                               ; preds = %0
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %45

27:                                               ; preds = %0
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %45

29:                                               ; preds = %0
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %45

31:                                               ; preds = %0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %45

33:                                               ; preds = %0
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %45

35:                                               ; preds = %0
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %45

37:                                               ; preds = %0
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %45

39:                                               ; preds = %0
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %45

41:                                               ; preds = %0
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %45

43:                                               ; preds = %0
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %45

45:                                               ; preds = %43, %41, %39, %37, %35, %33, %31, %29, %27, %25, %0
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
