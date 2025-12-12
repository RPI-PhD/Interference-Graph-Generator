; ModuleID = 'LLVM_IR/gpt4o_mini-34281.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayMenu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @readEbook(ptr noundef %0) #0 {
  %2 = alloca [256 x i8], align 16
  %3 = alloca [1024 x i8], align 16
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.4)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  call void @perror(ptr noundef @.str.5) #6
  br label %35

7:                                                ; preds = %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %9

9:                                                ; preds = %26, %7
  %.01 = phi i32 [ 0, %7 ], [ %17, %26 ]
  %10 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %11 = call ptr @fgets(ptr noundef %10, i32 noundef 256, ptr noundef %4)
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %27

13:                                               ; preds = %9
  %14 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %15 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %16 = call ptr @strcat(ptr noundef %14, ptr noundef %15) #7
  %17 = add nsw i32 %.01, 1
  %18 = srem i32 %17, 10
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %13
  %21 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %21)
  %23 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  store i8 0, ptr %23, align 16
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %25 = call i32 @getchar()
  br label %26

26:                                               ; preds = %20, %13
  br label %9, !llvm.loop !6

27:                                               ; preds = %9
  %28 = srem i32 %.01, 10
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %33

30:                                               ; preds = %27
  %31 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %31)
  br label %33

33:                                               ; preds = %30, %27
  %34 = call i32 @fclose(ptr noundef %4)
  br label %35

35:                                               ; preds = %33, %6
  %.0 = phi i32 [ 0, %33 ], [ -1, %6 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #3

declare i32 @getchar() #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i32, align 4
  br label %3

3:                                                ; preds = %44, %11, %0
  call void @displayMenu()
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %2)
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %13

6:                                                ; preds = %3
  br label %7

7:                                                ; preds = %10, %6
  %8 = call i32 @getchar()
  %9 = icmp ne i32 %8, 10
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %7, !llvm.loop !8

11:                                               ; preds = %7
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %3

13:                                               ; preds = %3
  %14 = load i32, ptr %2, align 4
  switch i32 %14, label %42 [
    i32 1, label %15
    i32 2, label %40
  ]

15:                                               ; preds = %13
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %17

17:                                               ; preds = %20, %15
  %18 = call i32 @getchar()
  %19 = icmp ne i32 %18, 10
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  br label %17, !llvm.loop !9

21:                                               ; preds = %17
  %22 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %23 = load ptr, ptr @stdin, align 8
  %24 = call ptr @fgets(ptr noundef %22, i32 noundef 100, ptr noundef %23)
  %25 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %26 = call i64 @strcspn(ptr noundef %25, ptr noundef @.str.12) #8
  %27 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %26
  store i8 0, ptr %27, align 1
  %28 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %29 = call i64 @strlen(ptr noundef %28) #8
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %35, label %31

31:                                               ; preds = %21
  %32 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %33 = call i64 @strlen(ptr noundef %32) #8
  %34 = icmp uge i64 %33, 100
  br i1 %34, label %35, label %37

35:                                               ; preds = %31, %21
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %44

37:                                               ; preds = %31
  %38 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %39 = call i32 @readEbook(ptr noundef %38)
  br label %44

40:                                               ; preds = %13
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  call void @exit(i32 noundef 0) #9
  unreachable

42:                                               ; preds = %13
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %44

44:                                               ; preds = %42, %37, %35
  br label %3
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
