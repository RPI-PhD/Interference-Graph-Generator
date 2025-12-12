; ModuleID = 'DATASETv2/gpt35-62734.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1000 x i8], align 16
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %10

10:                                               ; preds = %0, %55
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %2)
  %17 = load i32, ptr %2, align 4
  switch i32 %17, label %53 [
    i32 1, label %18
    i32 2, label %28
    i32 3, label %51
  ]

18:                                               ; preds = %10
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %5, ptr noundef %4, ptr noundef %3)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %22 = call i32 @getchar()
  %23 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 0
  %24 = load ptr, ptr @stdin, align 8
  %25 = call ptr @fgets(ptr noundef %23, i32 noundef 1000, ptr noundef %24)
  %26 = call i64 @time(ptr noundef null) #4
  store i64 %26, ptr %7, align 8
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %55

28:                                               ; preds = %10
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %30 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %5, ptr noundef %4, ptr noundef %3)
  %31 = call i64 @time(ptr noundef null) #4
  %32 = trunc i64 %31 to i32
  call void @srand(i32 noundef %32) #4
  %33 = call i32 @rand() #4
  %34 = srem i32 %33, 10
  store i32 %34, ptr %8, align 4
  %35 = load i32, ptr %8, align 4
  %36 = srem i32 %35, 2
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %43

38:                                               ; preds = %28
  %39 = load i32, ptr %5, align 4
  %40 = load i32, ptr %4, align 4
  %41 = load i32, ptr %3, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %39, i32 noundef %40, i32 noundef %41)
  br label %50

43:                                               ; preds = %28
  %44 = load i32, ptr %5, align 4
  %45 = load i32, ptr %4, align 4
  %46 = load i32, ptr %3, align 4
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %44, i32 noundef %45, i32 noundef %46)
  %48 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 0
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %48)
  br label %50

50:                                               ; preds = %43, %38
  br label %55

51:                                               ; preds = %10
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @exit(i32 noundef 0) #5
  unreachable

53:                                               ; preds = %10
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %55

55:                                               ; preds = %53, %50, %18
  br label %10
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
