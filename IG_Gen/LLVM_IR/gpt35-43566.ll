; ModuleID = 'DATASETv2/gpt35-43566.c'
source_filename = "DATASETv2/gpt35-43566.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@.str = private unnamed_addr constant [36 x i8] c"Error: Could not open directory %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1
@.str.4 = private unnamed_addr constant [40 x i8] c"Error: Could not get file stats for %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [40 x i8] c"Welcome to Castle Disk Space Analyzer!\0A\00", align 1
@.str.6 = private unnamed_addr constant [65 x i8] c"Please enter the path for the directory you would like to scan:\0A\00", align 1
@stdin = external global ptr, align 8
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"\0ADisk usage for %s:\0A\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"%lld bytes\0A\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"%.2f KB\0A\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"%.2f MB\0A\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"%.2f GB\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i64 @calculateDiskUsage(ptr noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [1000 x i8], align 16
  %8 = alloca %struct.stat, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 0, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = call noalias ptr @opendir(ptr noundef %10)
  store ptr %11, ptr %5, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %17, label %14

14:                                               ; preds = %1
  %15 = load ptr, ptr %3, align 8
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %15)
  store i64 0, ptr %2, align 8
  br label %69

17:                                               ; preds = %1
  br label %18

18:                                               ; preds = %64, %45, %34, %17
  %19 = load ptr, ptr %5, align 8
  %20 = call ptr @readdir(ptr noundef %19)
  store ptr %20, ptr %6, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %65

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.dirent, ptr %23, i32 0, i32 4
  %25 = getelementptr inbounds [256 x i8], ptr %24, i64 0, i64 0
  %26 = call i32 @strcmp(ptr noundef %25, ptr noundef @.str.1) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %34, label %28

28:                                               ; preds = %22
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.dirent, ptr %29, i32 0, i32 4
  %31 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 0
  %32 = call i32 @strcmp(ptr noundef %31, ptr noundef @.str.2) #4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %28, %22
  br label %18, !llvm.loop !6

35:                                               ; preds = %28
  %36 = getelementptr inbounds [1000 x i8], ptr %7, i64 0, i64 0
  %37 = load ptr, ptr %3, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds %struct.dirent, ptr %38, i32 0, i32 4
  %40 = getelementptr inbounds [256 x i8], ptr %39, i64 0, i64 0
  %41 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %36, i64 noundef 1000, ptr noundef @.str.3, ptr noundef %37, ptr noundef %40) #5
  %42 = getelementptr inbounds [1000 x i8], ptr %7, i64 0, i64 0
  %43 = call i32 @stat(ptr noundef %42, ptr noundef %8) #5
  %44 = icmp eq i32 %43, -1
  br i1 %44, label %45, label %48

45:                                               ; preds = %35
  %46 = getelementptr inbounds [1000 x i8], ptr %7, i64 0, i64 0
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %46)
  br label %18, !llvm.loop !6

48:                                               ; preds = %35
  %49 = getelementptr inbounds %struct.stat, ptr %8, i32 0, i32 3
  %50 = load i32, ptr %49, align 8
  %51 = and i32 %50, 61440
  %52 = icmp eq i32 %51, 16384
  br i1 %52, label %53, label %59

53:                                               ; preds = %48
  %54 = getelementptr inbounds [1000 x i8], ptr %7, i64 0, i64 0
  %55 = call i64 @calculateDiskUsage(ptr noundef %54)
  store i64 %55, ptr %9, align 8
  %56 = load i64, ptr %9, align 8
  %57 = load i64, ptr %4, align 8
  %58 = add nsw i64 %57, %56
  store i64 %58, ptr %4, align 8
  br label %64

59:                                               ; preds = %48
  %60 = getelementptr inbounds %struct.stat, ptr %8, i32 0, i32 8
  %61 = load i64, ptr %60, align 8
  %62 = load i64, ptr %4, align 8
  %63 = add nsw i64 %62, %61
  store i64 %63, ptr %4, align 8
  br label %64

64:                                               ; preds = %59, %53
  br label %18, !llvm.loop !6

65:                                               ; preds = %18
  %66 = load ptr, ptr %5, align 8
  %67 = call i32 @closedir(ptr noundef %66)
  %68 = load i64, ptr %4, align 8
  store i64 %68, ptr %2, align 8
  br label %69

69:                                               ; preds = %65, %14
  %70 = load i64, ptr %2, align 8
  ret i64 %70
}

declare noalias ptr @opendir(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare ptr @readdir(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @stat(ptr noundef, ptr noundef) #3

declare i32 @closedir(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i8], align 16
  %3 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %6 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %7 = load ptr, ptr @stdin, align 8
  %8 = call ptr @fgets(ptr noundef %6, i32 noundef 1000, ptr noundef %7)
  %9 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %10 = call i64 @strcspn(ptr noundef %9, ptr noundef @.str.7) #4
  %11 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %10
  store i8 0, ptr %11, align 1
  %12 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %13 = call i64 @calculateDiskUsage(ptr noundef %12)
  store i64 %13, ptr %3, align 8
  %14 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %14)
  %16 = load i64, ptr %3, align 8
  %17 = icmp slt i64 %16, 1024
  br i1 %17, label %18, label %21

18:                                               ; preds = %0
  %19 = load i64, ptr %3, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i64 noundef %19)
  br label %47

21:                                               ; preds = %0
  %22 = load i64, ptr %3, align 8
  %23 = icmp slt i64 %22, 1048576
  br i1 %23, label %24, label %30

24:                                               ; preds = %21
  %25 = load i64, ptr %3, align 8
  %26 = sitofp i64 %25 to float
  %27 = fdiv float %26, 1.024000e+03
  %28 = fpext float %27 to double
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %28)
  br label %46

30:                                               ; preds = %21
  %31 = load i64, ptr %3, align 8
  %32 = icmp slt i64 %31, 1073741824
  br i1 %32, label %33, label %39

33:                                               ; preds = %30
  %34 = load i64, ptr %3, align 8
  %35 = sitofp i64 %34 to float
  %36 = fdiv float %35, 0x4130000000000000
  %37 = fpext float %36 to double
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, double noundef %37)
  br label %45

39:                                               ; preds = %30
  %40 = load i64, ptr %3, align 8
  %41 = sitofp i64 %40 to float
  %42 = fdiv float %41, 0x41D0000000000000
  %43 = fpext float %42 to double
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %43)
  br label %45

45:                                               ; preds = %39, %33
  br label %46

46:                                               ; preds = %45, %24
  br label %47

47:                                               ; preds = %46, %18
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
attributes #5 = { nounwind }

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
