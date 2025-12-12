; ModuleID = 'DATASETv2/gpt4o_mini-34281.c'
source_filename = "DATASETv2/gpt4o_mini-34281.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"Ebook Reader\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"1. Read Ebook\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"2. Exit\0A\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Choose an option (1-2): \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"\0A--- Ebook Contents ---\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.8 = private unnamed_addr constant [47 x i8] c"\0APress Enter to continue or Ctrl+C to exit...\0A\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.10 = private unnamed_addr constant [45 x i8] c"Invalid input. Please enter a number (1-2).\0A\00", align 1
@.str.11 = private unnamed_addr constant [47 x i8] c"Enter the filename to read (e.g., ebook.txt): \00", align 1
@stdin = external global ptr, align 8
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [37 x i8] c"Invalid filename. Please try again.\0A\00", align 1
@.str.14 = private unnamed_addr constant [36 x i8] c"Exiting the ebook reader. Goodbye!\0A\00", align 1
@.str.15 = private unnamed_addr constant [46 x i8] c"Invalid option. Please enter a number (1-2).\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayMenu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @readEbook(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [256 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca [1024 x i8], align 16
  store ptr %0, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noalias ptr @fopen(ptr noundef %8, ptr noundef @.str.4)
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %13, label %12

12:                                               ; preds = %1
  call void @perror(ptr noundef @.str.5) #6
  store i32 -1, ptr %2, align 4
  br label %46

13:                                               ; preds = %1
  store i32 0, ptr %6, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %15

15:                                               ; preds = %35, %13
  %16 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %17 = load ptr, ptr %4, align 8
  %18 = call ptr @fgets(ptr noundef %16, i32 noundef 256, ptr noundef %17)
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %36

20:                                               ; preds = %15
  %21 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %22 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %23 = call ptr @strcat(ptr noundef %21, ptr noundef %22) #7
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  %26 = load i32, ptr %6, align 4
  %27 = srem i32 %26, 10
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %20
  %30 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %30)
  %32 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  store i8 0, ptr %32, align 16
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %34 = call i32 @getchar()
  br label %35

35:                                               ; preds = %29, %20
  br label %15, !llvm.loop !6

36:                                               ; preds = %15
  %37 = load i32, ptr %6, align 4
  %38 = srem i32 %37, 10
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %43

40:                                               ; preds = %36
  %41 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %41)
  br label %43

43:                                               ; preds = %40, %36
  %44 = load ptr, ptr %4, align 8
  %45 = call i32 @fclose(ptr noundef %44)
  store i32 0, ptr %2, align 4
  br label %46

46:                                               ; preds = %43, %12
  %47 = load i32, ptr %2, align 4
  ret i32 %47
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #3

declare i32 @getchar() #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %0, %12, %45
  call void @displayMenu()
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %3)
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %7, label %14

7:                                                ; preds = %4
  br label %8

8:                                                ; preds = %11, %7
  %9 = call i32 @getchar()
  %10 = icmp ne i32 %9, 10
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %8, !llvm.loop !8

12:                                               ; preds = %8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %4

14:                                               ; preds = %4
  %15 = load i32, ptr %3, align 4
  switch i32 %15, label %43 [
    i32 1, label %16
    i32 2, label %41
  ]

16:                                               ; preds = %14
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %18

18:                                               ; preds = %21, %16
  %19 = call i32 @getchar()
  %20 = icmp ne i32 %19, 10
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  br label %18, !llvm.loop !9

22:                                               ; preds = %18
  %23 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %24 = load ptr, ptr @stdin, align 8
  %25 = call ptr @fgets(ptr noundef %23, i32 noundef 100, ptr noundef %24)
  %26 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %27 = call i64 @strcspn(ptr noundef %26, ptr noundef @.str.12) #8
  %28 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %27
  store i8 0, ptr %28, align 1
  %29 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %30 = call i64 @strlen(ptr noundef %29) #8
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %36, label %32

32:                                               ; preds = %22
  %33 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %34 = call i64 @strlen(ptr noundef %33) #8
  %35 = icmp uge i64 %34, 100
  br i1 %35, label %36, label %38

36:                                               ; preds = %32, %22
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %45

38:                                               ; preds = %32
  %39 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %40 = call i32 @readEbook(ptr noundef %39)
  br label %45

41:                                               ; preds = %14
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @exit(i32 noundef 0) #9
  unreachable

43:                                               ; preds = %14
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %45

45:                                               ; preds = %43, %38, %36
  br label %4
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { noreturn nounwind }

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
