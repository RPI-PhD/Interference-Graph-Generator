; ModuleID = 'DATASETv2/gpt4o_mini-13835.c'
source_filename = "DATASETv2/gpt4o_mini-13835.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"users.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Error opening file for writing\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"User '%s' added successfully.\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Error opening file for reading\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"Current users:\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"temp.txt\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.11 = private unnamed_addr constant [36 x i8] c"Error opening temp file for writing\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [33 x i8] c"User '%s' deleted successfully.\0A\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c"User '%s' not found.\0A\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"\0AUser Management System\0A\00", align 1
@.str.16 = private unnamed_addr constant [13 x i8] c"1. Add User\0A\00", align 1
@.str.17 = private unnamed_addr constant [18 x i8] c"2. Display Users\0A\00", align 1
@.str.18 = private unnamed_addr constant [16 x i8] c"3. Delete User\0A\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"4. Exit\0A\00", align 1
@.str.20 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.22 = private unnamed_addr constant [24 x i8] c"Enter username to add: \00", align 1
@stdin = external global ptr, align 8
@.str.23 = private unnamed_addr constant [26 x i8] c"Invalid username length.\0A\00", align 1
@.str.24 = private unnamed_addr constant [27 x i8] c"Enter username to delete: \00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"Exiting the program.\0A\00", align 1
@.str.26 = private unnamed_addr constant [35 x i8] c"Invalid choice. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addUser(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @perror(ptr noundef @.str.2) #6
  call void @exit(i32 noundef 1) #7
  unreachable

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.3, ptr noundef %10)
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @fclose(ptr noundef %12)
  %14 = load ptr, ptr %2, align 8
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %14)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayUsers() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = alloca ptr, align 8
  %3 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.5)
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %0
  call void @perror(ptr noundef @.str.6) #6
  call void @exit(i32 noundef 1) #7
  unreachable

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %9

9:                                                ; preds = %14, %7
  %10 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %11 = load ptr, ptr %2, align 8
  %12 = call ptr @fgets(ptr noundef %10, i32 noundef 1024, ptr noundef %11)
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %9
  %15 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %15)
  br label %9, !llvm.loop !6

17:                                               ; preds = %9
  %18 = load ptr, ptr %2, align 8
  %19 = call i32 @fclose(ptr noundef %18)
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @deleteUser(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [1024 x i8], align 16
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.5)
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @perror(ptr noundef @.str.6) #6
  call void @exit(i32 noundef 1) #7
  unreachable

11:                                               ; preds = %1
  %12 = call noalias ptr @fopen(ptr noundef @.str.9, ptr noundef @.str.10)
  store ptr %12, ptr %4, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %18

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 8
  %17 = call i32 @fclose(ptr noundef %16)
  call void @perror(ptr noundef @.str.11) #6
  call void @exit(i32 noundef 1) #7
  unreachable

18:                                               ; preds = %11
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %37, %18
  %20 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %21 = load ptr, ptr %3, align 8
  %22 = call ptr @fgets(ptr noundef %20, i32 noundef 1024, ptr noundef %21)
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %38

24:                                               ; preds = %19
  %25 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %26 = call i64 @strcspn(ptr noundef %25, ptr noundef @.str.12) #8
  %27 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 %26
  store i8 0, ptr %27, align 1
  %28 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %29 = load ptr, ptr %2, align 8
  %30 = call i32 @strcmp(ptr noundef %28, ptr noundef %29) #8
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %36

32:                                               ; preds = %24
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %35 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef @.str.3, ptr noundef %34)
  br label %37

36:                                               ; preds = %24
  store i32 1, ptr %6, align 4
  br label %37

37:                                               ; preds = %36, %32
  br label %19, !llvm.loop !8

38:                                               ; preds = %19
  %39 = load ptr, ptr %3, align 8
  %40 = call i32 @fclose(ptr noundef %39)
  %41 = load ptr, ptr %4, align 8
  %42 = call i32 @fclose(ptr noundef %41)
  %43 = load i32, ptr %6, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %50

45:                                               ; preds = %38
  %46 = call i32 @remove(ptr noundef @.str) #9
  %47 = call i32 @rename(ptr noundef @.str.9, ptr noundef @.str) #9
  %48 = load ptr, ptr %2, align 8
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %48)
  br label %54

50:                                               ; preds = %38
  %51 = call i32 @remove(ptr noundef @.str.9) #9
  %52 = load ptr, ptr %2, align 8
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %52)
  br label %54

54:                                               ; preds = %50, %45
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare i32 @remove(ptr noundef) #5

; Function Attrs: nounwind
declare i32 @rename(ptr noundef, ptr noundef) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local void @clearBuffer() #0 {
  %1 = alloca i32, align 4
  br label %2

2:                                                ; preds = %10, %0
  %3 = call i32 @getchar()
  store i32 %3, ptr %1, align 4
  %4 = icmp ne i32 %3, 10
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  %6 = load i32, ptr %1, align 4
  %7 = icmp ne i32 %6, -1
  br label %8

8:                                                ; preds = %5, %2
  %9 = phi i1 [ false, %2 ], [ %7, %5 ]
  br i1 %9, label %10, label %11

10:                                               ; preds = %8
  br label %2, !llvm.loop !9

11:                                               ; preds = %8
  ret void
}

declare i32 @getchar() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [50 x i8], align 16
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %59, %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.21, ptr noundef %2)
  call void @clearBuffer()
  %12 = load i32, ptr %2, align 4
  switch i32 %12, label %56 [
    i32 1, label %13
    i32 2, label %33
    i32 3, label %34
    i32 4, label %54
  ]

13:                                               ; preds = %4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %15 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %16 = load ptr, ptr @stdin, align 8
  %17 = call ptr @fgets(ptr noundef %15, i32 noundef 50, ptr noundef %16)
  %18 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %19 = call i64 @strcspn(ptr noundef %18, ptr noundef @.str.12) #8
  %20 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 %19
  store i8 0, ptr %20, align 1
  %21 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %22 = call i64 @strlen(ptr noundef %21) #8
  %23 = icmp ugt i64 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %13
  %25 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %26 = call i64 @strlen(ptr noundef %25) #8
  %27 = icmp ult i64 %26, 50
  br i1 %27, label %28, label %30

28:                                               ; preds = %24
  %29 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  call void @addUser(ptr noundef %29)
  br label %32

30:                                               ; preds = %24, %13
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %32

32:                                               ; preds = %30, %28
  br label %58

33:                                               ; preds = %4
  call void @displayUsers()
  br label %58

34:                                               ; preds = %4
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  %36 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %37 = load ptr, ptr @stdin, align 8
  %38 = call ptr @fgets(ptr noundef %36, i32 noundef 50, ptr noundef %37)
  %39 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %40 = call i64 @strcspn(ptr noundef %39, ptr noundef @.str.12) #8
  %41 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 %40
  store i8 0, ptr %41, align 1
  %42 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %43 = call i64 @strlen(ptr noundef %42) #8
  %44 = icmp ugt i64 %43, 0
  br i1 %44, label %45, label %51

45:                                               ; preds = %34
  %46 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %47 = call i64 @strlen(ptr noundef %46) #8
  %48 = icmp ult i64 %47, 50
  br i1 %48, label %49, label %51

49:                                               ; preds = %45
  %50 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  call void @deleteUser(ptr noundef %50)
  br label %53

51:                                               ; preds = %45, %34
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %53

53:                                               ; preds = %51, %49
  br label %58

54:                                               ; preds = %4
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %58

56:                                               ; preds = %4
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %58

58:                                               ; preds = %56, %54, %53, %33, %32
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %2, align 4
  %61 = icmp ne i32 %60, 4
  br i1 %61, label %4, label %62, !llvm.loop !10

62:                                               ; preds = %59
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }

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
!10 = distinct !{!10, !7}
