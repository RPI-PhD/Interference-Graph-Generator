; ModuleID = 'LLVM_IR/gpt4o_mini-13835.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @addUser(ptr noundef %0) #0 {
  %2 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  call void @perror(ptr noundef @.str.2) #6
  call void @exit(i32 noundef 1) #7
  unreachable

5:                                                ; preds = %1
  %6 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef @.str.3, ptr noundef %0)
  %7 = call i32 @fclose(ptr noundef %2)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %0)
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayUsers() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.5)
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  call void @perror(ptr noundef @.str.6) #6
  call void @exit(i32 noundef 1) #7
  unreachable

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %7

7:                                                ; preds = %11, %5
  %8 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %9 = call ptr @fgets(ptr noundef %8, i32 noundef 1024, ptr noundef %2)
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %7
  %12 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %12)
  br label %7, !llvm.loop !6

14:                                               ; preds = %7
  %15 = call i32 @fclose(ptr noundef %2)
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @deleteUser(ptr noundef %0) #0 {
  %2 = alloca [1024 x i8], align 16
  %3 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.5)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  call void @perror(ptr noundef @.str.6) #6
  call void @exit(i32 noundef 1) #7
  unreachable

6:                                                ; preds = %1
  %7 = call noalias ptr @fopen(ptr noundef @.str.9, ptr noundef @.str.10)
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = call i32 @fclose(ptr noundef %3)
  call void @perror(ptr noundef @.str.11) #6
  call void @exit(i32 noundef 1) #7
  unreachable

11:                                               ; preds = %6
  br label %12

12:                                               ; preds = %27, %11
  %.0 = phi i32 [ 0, %11 ], [ %.1, %27 ]
  %13 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %14 = call ptr @fgets(ptr noundef %13, i32 noundef 1024, ptr noundef %3)
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %28

16:                                               ; preds = %12
  %17 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %18 = call i64 @strcspn(ptr noundef %17, ptr noundef @.str.12) #8
  %19 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 %18
  store i8 0, ptr %19, align 1
  %20 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %21 = call i32 @strcmp(ptr noundef %20, ptr noundef %0) #8
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %16
  %24 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.3, ptr noundef %24)
  br label %27

26:                                               ; preds = %16
  br label %27

27:                                               ; preds = %26, %23
  %.1 = phi i32 [ %.0, %23 ], [ 1, %26 ]
  br label %12, !llvm.loop !8

28:                                               ; preds = %12
  %29 = call i32 @fclose(ptr noundef %3)
  %30 = call i32 @fclose(ptr noundef %7)
  %31 = icmp ne i32 %.0, 0
  br i1 %31, label %32, label %36

32:                                               ; preds = %28
  %33 = call i32 @remove(ptr noundef @.str) #9
  %34 = call i32 @rename(ptr noundef @.str.9, ptr noundef @.str) #9
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %0)
  br label %39

36:                                               ; preds = %28
  %37 = call i32 @remove(ptr noundef @.str.9) #9
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %0)
  br label %39

39:                                               ; preds = %36, %32
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @clearBuffer() #0 {
  br label %1

1:                                                ; preds = %8, %0
  %2 = call i32 @getchar()
  %3 = icmp ne i32 %2, 10
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = icmp ne i32 %2, -1
  br label %6

6:                                                ; preds = %4, %1
  %7 = phi i1 [ false, %1 ], [ %5, %4 ]
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  br label %1, !llvm.loop !9

9:                                                ; preds = %6
  ret void
}

declare i32 @getchar() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  br label %3

3:                                                ; preds = %58, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.21, ptr noundef %1)
  call void @clearBuffer()
  %11 = load i32, ptr %1, align 4
  switch i32 %11, label %55 [
    i32 1, label %12
    i32 2, label %32
    i32 3, label %33
    i32 4, label %53
  ]

12:                                               ; preds = %3
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %14 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %15 = load ptr, ptr @stdin, align 8
  %16 = call ptr @fgets(ptr noundef %14, i32 noundef 50, ptr noundef %15)
  %17 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %18 = call i64 @strcspn(ptr noundef %17, ptr noundef @.str.12) #8
  %19 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 %18
  store i8 0, ptr %19, align 1
  %20 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %21 = call i64 @strlen(ptr noundef %20) #8
  %22 = icmp ugt i64 %21, 0
  br i1 %22, label %23, label %29

23:                                               ; preds = %12
  %24 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %25 = call i64 @strlen(ptr noundef %24) #8
  %26 = icmp ult i64 %25, 50
  br i1 %26, label %27, label %29

27:                                               ; preds = %23
  %28 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  call void @addUser(ptr noundef %28)
  br label %31

29:                                               ; preds = %23, %12
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %31

31:                                               ; preds = %29, %27
  br label %57

32:                                               ; preds = %3
  call void @displayUsers()
  br label %57

33:                                               ; preds = %3
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  %35 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %36 = load ptr, ptr @stdin, align 8
  %37 = call ptr @fgets(ptr noundef %35, i32 noundef 50, ptr noundef %36)
  %38 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %39 = call i64 @strcspn(ptr noundef %38, ptr noundef @.str.12) #8
  %40 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 %39
  store i8 0, ptr %40, align 1
  %41 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %42 = call i64 @strlen(ptr noundef %41) #8
  %43 = icmp ugt i64 %42, 0
  br i1 %43, label %44, label %50

44:                                               ; preds = %33
  %45 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %46 = call i64 @strlen(ptr noundef %45) #8
  %47 = icmp ult i64 %46, 50
  br i1 %47, label %48, label %50

48:                                               ; preds = %44
  %49 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  call void @deleteUser(ptr noundef %49)
  br label %52

50:                                               ; preds = %44, %33
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %52

52:                                               ; preds = %50, %48
  br label %57

53:                                               ; preds = %3
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  br label %57

55:                                               ; preds = %3
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %57

57:                                               ; preds = %55, %53, %52, %32, %31
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %1, align 4
  %60 = icmp ne i32 %59, 4
  br i1 %60, label %3, label %61, !llvm.loop !10

61:                                               ; preds = %58
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
