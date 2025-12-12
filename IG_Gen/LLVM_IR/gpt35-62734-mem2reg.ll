; ModuleID = 'LLVM_IR/gpt35-62734.ll'
source_filename = "DATASETv2/gpt35-62734.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"Welcome to your Digital Diary\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"\0A\0AChoose an option:\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"1. Add new entry\0A\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"2. View previous entries\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"3. Exit\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"Choice: \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.7 = private unnamed_addr constant [35 x i8] c"\0AEnter today's date: (dd mm yyyy) \00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@.str.9 = private unnamed_addr constant [41 x i8] c"\0AType your entry (max 1000 characters):\0A\00", align 1
@stdin = external global ptr, align 8
@.str.10 = private unnamed_addr constant [28 x i8] c"\0AEntry added successfully!\0A\00", align 1
@.str.11 = private unnamed_addr constant [61 x i8] c"\0AEnter the date of the entry you wish to view: (dd mm yyyy) \00", align 1
@.str.12 = private unnamed_addr constant [40 x i8] c"\0AEntry not found for the date %d-%d-%d\0A\00", align 1
@.str.13 = private unnamed_addr constant [37 x i8] c"\0AEntry found for the date %d-%d-%d:\0A\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.15 = private unnamed_addr constant [26 x i8] c"\0AExiting Digital Diary...\00", align 1
@.str.16 = private unnamed_addr constant [47 x i8] c"\0AInvalid choice! Please enter a valid option.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [1000 x i8], align 16
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %7

7:                                                ; preds = %51, %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %1)
  %14 = load i32, ptr %1, align 4
  switch i32 %14, label %49 [
    i32 1, label %15
    i32 2, label %25
    i32 3, label %47
  ]

15:                                               ; preds = %7
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %4, ptr noundef %3, ptr noundef %2)
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %19 = call i32 @getchar()
  %20 = getelementptr inbounds [1000 x i8], ptr %5, i64 0, i64 0
  %21 = load ptr, ptr @stdin, align 8
  %22 = call ptr @fgets(ptr noundef %20, i32 noundef 1000, ptr noundef %21)
  %23 = call i64 @time(ptr noundef null) #4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %51

25:                                               ; preds = %7
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %27 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %4, ptr noundef %3, ptr noundef %2)
  %28 = call i64 @time(ptr noundef null) #4
  %29 = trunc i64 %28 to i32
  call void @srand(i32 noundef %29) #4
  %30 = call i32 @rand() #4
  %31 = srem i32 %30, 10
  %32 = srem i32 %31, 2
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %25
  %35 = load i32, ptr %4, align 4
  %36 = load i32, ptr %3, align 4
  %37 = load i32, ptr %2, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %35, i32 noundef %36, i32 noundef %37)
  br label %46

39:                                               ; preds = %25
  %40 = load i32, ptr %4, align 4
  %41 = load i32, ptr %3, align 4
  %42 = load i32, ptr %2, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %40, i32 noundef %41, i32 noundef %42)
  %44 = getelementptr inbounds [1000 x i8], ptr %5, i64 0, i64 0
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %44)
  br label %46

46:                                               ; preds = %39, %34
  br label %51

47:                                               ; preds = %7
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @exit(i32 noundef 0) #5
  unreachable

49:                                               ; preds = %7
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %51

51:                                               ; preds = %49, %46, %15
  br label %7
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

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
