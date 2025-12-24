; ModuleID = 'LLVM_IR/gemini_pro-12320.ll'
source_filename = "DATASETv2/gemini_pro-12320.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@.str = private unnamed_addr constant [5 x i8] c"open\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"write\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [15 x i8] c"malloc failed\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c".bak\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"opendir\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"Usage: %s <path>\0A\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"Error backing up files\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c"Files backed up successfully\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_regular_file(ptr noundef %0) #0 {
  %2 = alloca %struct.stat, align 8
  %3 = call i32 @stat(ptr noundef %0, ptr noundef %2) #6
  %4 = getelementptr inbounds %struct.stat, ptr %2, i32 0, i32 3
  %5 = load i32, ptr %4, align 8
  %6 = and i32 %5, 61440
  %7 = icmp eq i32 %6, 32768
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind
declare i32 @stat(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @copy_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [4096 x i8], align 16
  %4 = call i32 (ptr, i32, ...) @open(ptr noundef %0, i32 noundef 0)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  call void @perror(ptr noundef @.str) #7
  br label %28

7:                                                ; preds = %2
  %8 = call i32 (ptr, i32, ...) @open(ptr noundef %1, i32 noundef 577, i32 noundef 420)
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  call void @perror(ptr noundef @.str) #7
  %11 = call i32 @close(i32 noundef %4)
  br label %28

12:                                               ; preds = %7
  br label %13

13:                                               ; preds = %24, %12
  %14 = getelementptr inbounds [4096 x i8], ptr %3, i64 0, i64 0
  %15 = call i64 @read(i32 noundef %4, ptr noundef %14, i64 noundef 4096)
  %16 = icmp sgt i64 %15, 0
  br i1 %16, label %17, label %25

17:                                               ; preds = %13
  %18 = getelementptr inbounds [4096 x i8], ptr %3, i64 0, i64 0
  %19 = call i64 @write(i32 noundef %8, ptr noundef %18, i64 noundef %15)
  %20 = icmp ne i64 %19, %15
  br i1 %20, label %21, label %24

21:                                               ; preds = %17
  call void @perror(ptr noundef @.str.1) #7
  %22 = call i32 @close(i32 noundef %4)
  %23 = call i32 @close(i32 noundef %8)
  br label %28

24:                                               ; preds = %17
  br label %13, !llvm.loop !6

25:                                               ; preds = %13
  %26 = call i32 @close(i32 noundef %4)
  %27 = call i32 @close(i32 noundef %8)
  br label %28

28:                                               ; preds = %25, %21, %10, %6
  %.0 = phi i32 [ -1, %6 ], [ -1, %10 ], [ -1, %21 ], [ 0, %25 ]
  ret i32 %.0
}

declare i32 @open(ptr noundef, i32 noundef, ...) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

declare i32 @close(i32 noundef) #2

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #2

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @create_backup(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #8
  %3 = add i64 %2, 5
  %4 = call noalias ptr @malloc(i64 noundef %3) #9
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load ptr, ptr @stderr, align 8
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.2)
  br label %22

9:                                                ; preds = %1
  %10 = call ptr @strcpy(ptr noundef %4, ptr noundef %0) #6
  %11 = call ptr @strcat(ptr noundef %4, ptr noundef @.str.3) #6
  %12 = call i32 (ptr, i32, ...) @open(ptr noundef %4, i32 noundef 577, i32 noundef 420)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %15

14:                                               ; preds = %9
  call void @perror(ptr noundef @.str) #7
  call void @free(ptr noundef %4) #6
  br label %22

15:                                               ; preds = %9
  %16 = call i32 @copy_file(ptr noundef %0, ptr noundef %4)
  %17 = icmp eq i32 %16, -1
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = call i32 @close(i32 noundef %12)
  call void @free(ptr noundef %4) #6
  br label %22

20:                                               ; preds = %15
  %21 = call i32 @close(i32 noundef %12)
  call void @free(ptr noundef %4) #6
  br label %22

22:                                               ; preds = %20, %18, %14, %6
  %.0 = phi i32 [ -1, %6 ], [ -1, %14 ], [ -1, %18 ], [ 0, %20 ]
  ret i32 %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @backup_directory(ptr noundef %0) #0 {
  %2 = call noalias ptr @opendir(ptr noundef %0)
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  call void @perror(ptr noundef @.str.4) #7
  br label %62

5:                                                ; preds = %1
  br label %6

6:                                                ; preds = %59, %19, %5
  %7 = call ptr @readdir(ptr noundef %2)
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %60

9:                                                ; preds = %6
  %10 = getelementptr inbounds %struct.dirent, ptr %7, i32 0, i32 4
  %11 = getelementptr inbounds [256 x i8], ptr %10, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.5) #8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %9
  %15 = getelementptr inbounds %struct.dirent, ptr %7, i32 0, i32 4
  %16 = getelementptr inbounds [256 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 @strcmp(ptr noundef %16, ptr noundef @.str.6) #8
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %14, %9
  br label %6, !llvm.loop !8

20:                                               ; preds = %14
  %21 = call i64 @strlen(ptr noundef %0) #8
  %22 = getelementptr inbounds %struct.dirent, ptr %7, i32 0, i32 4
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call i64 @strlen(ptr noundef %23) #8
  %25 = add i64 %21, %24
  %26 = add i64 %25, 1
  %27 = call noalias ptr @malloc(i64 noundef %26) #9
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %33

29:                                               ; preds = %20
  %30 = load ptr, ptr @stderr, align 8
  %31 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %30, ptr noundef @.str.2)
  %32 = call i32 @closedir(ptr noundef %2)
  br label %62

33:                                               ; preds = %20
  %34 = call ptr @strcpy(ptr noundef %27, ptr noundef %0) #6
  %35 = call ptr @strcat(ptr noundef %27, ptr noundef @.str.7) #6
  %36 = getelementptr inbounds %struct.dirent, ptr %7, i32 0, i32 4
  %37 = getelementptr inbounds [256 x i8], ptr %36, i64 0, i64 0
  %38 = call ptr @strcat(ptr noundef %27, ptr noundef %37) #6
  %39 = call i32 @is_regular_file(ptr noundef %27)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %47

41:                                               ; preds = %33
  %42 = call i32 @create_backup(ptr noundef %27)
  %43 = icmp eq i32 %42, -1
  br i1 %43, label %44, label %46

44:                                               ; preds = %41
  call void @free(ptr noundef %27) #6
  %45 = call i32 @closedir(ptr noundef %2)
  br label %62

46:                                               ; preds = %41
  br label %59

47:                                               ; preds = %33
  %48 = getelementptr inbounds %struct.dirent, ptr %7, i32 0, i32 3
  %49 = load i8, ptr %48, align 2
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 4
  br i1 %51, label %52, label %58

52:                                               ; preds = %47
  %53 = call i32 @backup_directory(ptr noundef %27)
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %57

55:                                               ; preds = %52
  call void @free(ptr noundef %27) #6
  %56 = call i32 @closedir(ptr noundef %2)
  br label %62

57:                                               ; preds = %52
  br label %58

58:                                               ; preds = %57, %47
  br label %59

59:                                               ; preds = %58, %46
  call void @free(ptr noundef %27) #6
  br label %6, !llvm.loop !8

60:                                               ; preds = %6
  %61 = call i32 @closedir(ptr noundef %2)
  br label %62

62:                                               ; preds = %60, %55, %44, %29, %4
  %.0 = phi i32 [ -1, %4 ], [ -1, %29 ], [ -1, %44 ], [ -1, %55 ], [ 0, %60 ]
  ret i32 %.0
}

declare noalias ptr @opendir(ptr noundef) #2

declare ptr @readdir(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #5

declare i32 @closedir(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp ne i32 %0, 2
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8
  %6 = getelementptr inbounds ptr, ptr %1, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.8, ptr noundef %7)
  br label %19

9:                                                ; preds = %2
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @backup_directory(ptr noundef %11)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %17

14:                                               ; preds = %9
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.9)
  br label %19

17:                                               ; preds = %9
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %19

19:                                               ; preds = %17, %14, %4
  %.0 = phi i32 [ -1, %4 ], [ -1, %14 ], [ 0, %17 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind allocsize(0) }

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
