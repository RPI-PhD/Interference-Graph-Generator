; ModuleID = 'DATASETv2/gemini_pro-12320.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_regular_file(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.stat, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call i32 @stat(ptr noundef %4, ptr noundef %3) #6
  %6 = getelementptr inbounds %struct.stat, ptr %3, i32 0, i32 3
  %7 = load i32, ptr %6, align 8
  %8 = and i32 %7, 61440
  %9 = icmp eq i32 %8, 32768
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: nounwind
declare i32 @stat(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @copy_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [4096 x i8], align 16
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = call i32 (ptr, i32, ...) @open(ptr noundef %11, i32 noundef 0)
  store i32 %12, ptr %6, align 4
  %13 = load i32, ptr %6, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  call void @perror(ptr noundef @.str) #7
  store i32 -1, ptr %3, align 4
  br label %49

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = call i32 (ptr, i32, ...) @open(ptr noundef %17, i32 noundef 577, i32 noundef 420)
  store i32 %18, ptr %7, align 4
  %19 = load i32, ptr %7, align 4
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %24

21:                                               ; preds = %16
  call void @perror(ptr noundef @.str) #7
  %22 = load i32, ptr %6, align 4
  %23 = call i32 @close(i32 noundef %22)
  store i32 -1, ptr %3, align 4
  br label %49

24:                                               ; preds = %16
  br label %25

25:                                               ; preds = %43, %24
  %26 = load i32, ptr %6, align 4
  %27 = getelementptr inbounds [4096 x i8], ptr %8, i64 0, i64 0
  %28 = call i64 @read(i32 noundef %26, ptr noundef %27, i64 noundef 4096)
  store i64 %28, ptr %9, align 8
  %29 = icmp sgt i64 %28, 0
  br i1 %29, label %30, label %44

30:                                               ; preds = %25
  %31 = load i32, ptr %7, align 4
  %32 = getelementptr inbounds [4096 x i8], ptr %8, i64 0, i64 0
  %33 = load i64, ptr %9, align 8
  %34 = call i64 @write(i32 noundef %31, ptr noundef %32, i64 noundef %33)
  store i64 %34, ptr %10, align 8
  %35 = load i64, ptr %10, align 8
  %36 = load i64, ptr %9, align 8
  %37 = icmp ne i64 %35, %36
  br i1 %37, label %38, label %43

38:                                               ; preds = %30
  call void @perror(ptr noundef @.str.1) #7
  %39 = load i32, ptr %6, align 4
  %40 = call i32 @close(i32 noundef %39)
  %41 = load i32, ptr %7, align 4
  %42 = call i32 @close(i32 noundef %41)
  store i32 -1, ptr %3, align 4
  br label %49

43:                                               ; preds = %30
  br label %25, !llvm.loop !6

44:                                               ; preds = %25
  %45 = load i32, ptr %6, align 4
  %46 = call i32 @close(i32 noundef %45)
  %47 = load i32, ptr %7, align 4
  %48 = call i32 @close(i32 noundef %47)
  store i32 0, ptr %3, align 4
  br label %49

49:                                               ; preds = %44, %38, %21, %15
  %50 = load i32, ptr %3, align 4
  ret i32 %50
}

declare i32 @open(ptr noundef, i32 noundef, ...) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

declare i32 @close(i32 noundef) #2

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #2

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @create_backup(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i64 @strlen(ptr noundef %6) #8
  %8 = add i64 %7, 5
  %9 = call noalias ptr @malloc(i64 noundef %8) #9
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %1
  %13 = load ptr, ptr @stderr, align 8
  %14 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.2)
  store i32 -1, ptr %2, align 4
  br label %40

15:                                               ; preds = %1
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = call ptr @strcpy(ptr noundef %16, ptr noundef %17) #6
  %19 = load ptr, ptr %4, align 8
  %20 = call ptr @strcat(ptr noundef %19, ptr noundef @.str.3) #6
  %21 = load ptr, ptr %4, align 8
  %22 = call i32 (ptr, i32, ...) @open(ptr noundef %21, i32 noundef 577, i32 noundef 420)
  store i32 %22, ptr %5, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %25, label %27

25:                                               ; preds = %15
  call void @perror(ptr noundef @.str) #7
  %26 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %26) #6
  store i32 -1, ptr %2, align 4
  br label %40

27:                                               ; preds = %15
  %28 = load ptr, ptr %3, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = call i32 @copy_file(ptr noundef %28, ptr noundef %29)
  %31 = icmp eq i32 %30, -1
  br i1 %31, label %32, label %36

32:                                               ; preds = %27
  %33 = load i32, ptr %5, align 4
  %34 = call i32 @close(i32 noundef %33)
  %35 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %35) #6
  store i32 -1, ptr %2, align 4
  br label %40

36:                                               ; preds = %27
  %37 = load i32, ptr %5, align 4
  %38 = call i32 @close(i32 noundef %37)
  %39 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %39) #6
  store i32 0, ptr %2, align 4
  br label %40

40:                                               ; preds = %36, %32, %25, %12
  %41 = load i32, ptr %2, align 4
  ret i32 %41
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @backup_directory(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noalias ptr @opendir(ptr noundef %8)
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %1
  call void @perror(ptr noundef @.str.4) #7
  store i32 -1, ptr %2, align 4
  br label %94

13:                                               ; preds = %1
  br label %14

14:                                               ; preds = %89, %30, %13
  %15 = load ptr, ptr %4, align 8
  %16 = call ptr @readdir(ptr noundef %15)
  store ptr %16, ptr %5, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %91

18:                                               ; preds = %14
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.dirent, ptr %19, i32 0, i32 4
  %21 = getelementptr inbounds [256 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 @strcmp(ptr noundef %21, ptr noundef @.str.5) #8
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %30, label %24

24:                                               ; preds = %18
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.dirent, ptr %25, i32 0, i32 4
  %27 = getelementptr inbounds [256 x i8], ptr %26, i64 0, i64 0
  %28 = call i32 @strcmp(ptr noundef %27, ptr noundef @.str.6) #8
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %24, %18
  br label %14, !llvm.loop !8

31:                                               ; preds = %24
  %32 = load ptr, ptr %3, align 8
  %33 = call i64 @strlen(ptr noundef %32) #8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.dirent, ptr %34, i32 0, i32 4
  %36 = getelementptr inbounds [256 x i8], ptr %35, i64 0, i64 0
  %37 = call i64 @strlen(ptr noundef %36) #8
  %38 = add i64 %33, %37
  %39 = add i64 %38, 1
  %40 = call noalias ptr @malloc(i64 noundef %39) #9
  store ptr %40, ptr %6, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = icmp eq ptr %41, null
  br i1 %42, label %43, label %48

43:                                               ; preds = %31
  %44 = load ptr, ptr @stderr, align 8
  %45 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %44, ptr noundef @.str.2)
  %46 = load ptr, ptr %4, align 8
  %47 = call i32 @closedir(ptr noundef %46)
  store i32 -1, ptr %2, align 4
  br label %94

48:                                               ; preds = %31
  %49 = load ptr, ptr %6, align 8
  %50 = load ptr, ptr %3, align 8
  %51 = call ptr @strcpy(ptr noundef %49, ptr noundef %50) #6
  %52 = load ptr, ptr %6, align 8
  %53 = call ptr @strcat(ptr noundef %52, ptr noundef @.str.7) #6
  %54 = load ptr, ptr %6, align 8
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds %struct.dirent, ptr %55, i32 0, i32 4
  %57 = getelementptr inbounds [256 x i8], ptr %56, i64 0, i64 0
  %58 = call ptr @strcat(ptr noundef %54, ptr noundef %57) #6
  %59 = load ptr, ptr %6, align 8
  %60 = call i32 @is_regular_file(ptr noundef %59)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %72

62:                                               ; preds = %48
  %63 = load ptr, ptr %6, align 8
  %64 = call i32 @create_backup(ptr noundef %63)
  store i32 %64, ptr %7, align 4
  %65 = load i32, ptr %7, align 4
  %66 = icmp eq i32 %65, -1
  br i1 %66, label %67, label %71

67:                                               ; preds = %62
  %68 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %68) #6
  %69 = load ptr, ptr %4, align 8
  %70 = call i32 @closedir(ptr noundef %69)
  store i32 -1, ptr %2, align 4
  br label %94

71:                                               ; preds = %62
  br label %89

72:                                               ; preds = %48
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.dirent, ptr %73, i32 0, i32 3
  %75 = load i8, ptr %74, align 2
  %76 = zext i8 %75 to i32
  %77 = icmp eq i32 %76, 4
  br i1 %77, label %78, label %88

78:                                               ; preds = %72
  %79 = load ptr, ptr %6, align 8
  %80 = call i32 @backup_directory(ptr noundef %79)
  store i32 %80, ptr %7, align 4
  %81 = load i32, ptr %7, align 4
  %82 = icmp eq i32 %81, -1
  br i1 %82, label %83, label %87

83:                                               ; preds = %78
  %84 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %84) #6
  %85 = load ptr, ptr %4, align 8
  %86 = call i32 @closedir(ptr noundef %85)
  store i32 -1, ptr %2, align 4
  br label %94

87:                                               ; preds = %78
  br label %88

88:                                               ; preds = %87, %72
  br label %89

89:                                               ; preds = %88, %71
  %90 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %90) #6
  br label %14, !llvm.loop !8

91:                                               ; preds = %14
  %92 = load ptr, ptr %4, align 8
  %93 = call i32 @closedir(ptr noundef %92)
  store i32 0, ptr %2, align 4
  br label %94

94:                                               ; preds = %91, %83, %67, %43, %12
  %95 = load i32, ptr %2, align 4
  ret i32 %95
}

declare noalias ptr @opendir(ptr noundef) #2

declare ptr @readdir(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #5

declare i32 @closedir(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %6 = load i32, ptr %4, align 4
  %7 = icmp ne i32 %6, 2
  br i1 %7, label %8, label %14

8:                                                ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.8, ptr noundef %12)
  store i32 -1, ptr %3, align 4
  br label %25

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @backup_directory(ptr noundef %17)
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %20, label %23

20:                                               ; preds = %14
  %21 = load ptr, ptr @stderr, align 8
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.9)
  store i32 -1, ptr %3, align 4
  br label %25

23:                                               ; preds = %14
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i32 0, ptr %3, align 4
  br label %25

25:                                               ; preds = %23, %20, %8
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
