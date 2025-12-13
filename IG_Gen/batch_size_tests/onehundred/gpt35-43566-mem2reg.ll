; ModuleID = 'LLVM_IR/gpt35-43566.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @calculateDiskUsage(ptr noundef %0) #0 {
  %2 = alloca [1000 x i8], align 16
  %3 = alloca %struct.stat, align 8
  %4 = call noalias ptr @opendir(ptr noundef %0)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
  br label %50

8:                                                ; preds = %1
  br label %9

9:                                                ; preds = %47, %31, %22, %8
  %.01 = phi i64 [ 0, %8 ], [ %.01, %22 ], [ %.01, %31 ], [ %.1, %47 ]
  %10 = call ptr @readdir(ptr noundef %4)
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %48

12:                                               ; preds = %9
  %13 = getelementptr inbounds %struct.dirent, ptr %10, i32 0, i32 4
  %14 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.1) #4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %22, label %17

17:                                               ; preds = %12
  %18 = getelementptr inbounds %struct.dirent, ptr %10, i32 0, i32 4
  %19 = getelementptr inbounds [256 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 @strcmp(ptr noundef %19, ptr noundef @.str.2) #4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %17, %12
  br label %9, !llvm.loop !6

23:                                               ; preds = %17
  %24 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %25 = getelementptr inbounds %struct.dirent, ptr %10, i32 0, i32 4
  %26 = getelementptr inbounds [256 x i8], ptr %25, i64 0, i64 0
  %27 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %24, i64 noundef 1000, ptr noundef @.str.3, ptr noundef %0, ptr noundef %26) #5
  %28 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %29 = call i32 @stat(ptr noundef %28, ptr noundef %3) #5
  %30 = icmp eq i32 %29, -1
  br i1 %30, label %31, label %34

31:                                               ; preds = %23
  %32 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %32)
  br label %9, !llvm.loop !6

34:                                               ; preds = %23
  %35 = getelementptr inbounds %struct.stat, ptr %3, i32 0, i32 3
  %36 = load i32, ptr %35, align 8
  %37 = and i32 %36, 61440
  %38 = icmp eq i32 %37, 16384
  br i1 %38, label %39, label %43

39:                                               ; preds = %34
  %40 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %41 = call i64 @calculateDiskUsage(ptr noundef %40)
  %42 = add nsw i64 %.01, %41
  br label %47

43:                                               ; preds = %34
  %44 = getelementptr inbounds %struct.stat, ptr %3, i32 0, i32 8
  %45 = load i64, ptr %44, align 8
  %46 = add nsw i64 %.01, %45
  br label %47

47:                                               ; preds = %43, %39
  %.1 = phi i64 [ %42, %39 ], [ %46, %43 ]
  br label %9, !llvm.loop !6

48:                                               ; preds = %9
  %49 = call i32 @closedir(ptr noundef %4)
  br label %50

50:                                               ; preds = %48, %6
  %.0 = phi i64 [ %.01, %48 ], [ 0, %6 ]
  ret i64 %.0
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %4 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 1000, ptr noundef %5)
  %7 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %8 = call i64 @strcspn(ptr noundef %7, ptr noundef @.str.7) #4
  %9 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 %8
  store i8 0, ptr %9, align 1
  %10 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %11 = call i64 @calculateDiskUsage(ptr noundef %10)
  %12 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %12)
  %14 = icmp slt i64 %11, 1024
  br i1 %14, label %15, label %17

15:                                               ; preds = %0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i64 noundef %11)
  br label %38

17:                                               ; preds = %0
  %18 = icmp slt i64 %11, 1048576
  br i1 %18, label %19, label %24

19:                                               ; preds = %17
  %20 = sitofp i64 %11 to float
  %21 = fdiv float %20, 1.024000e+03
  %22 = fpext float %21 to double
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, double noundef %22)
  br label %37

24:                                               ; preds = %17
  %25 = icmp slt i64 %11, 1073741824
  br i1 %25, label %26, label %31

26:                                               ; preds = %24
  %27 = sitofp i64 %11 to float
  %28 = fdiv float %27, 0x4130000000000000
  %29 = fpext float %28 to double
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, double noundef %29)
  br label %36

31:                                               ; preds = %24
  %32 = sitofp i64 %11 to float
  %33 = fdiv float %32, 0x41D0000000000000
  %34 = fpext float %33 to double
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %34)
  br label %36

36:                                               ; preds = %31, %26
  br label %37

37:                                               ; preds = %36, %19
  br label %38

38:                                               ; preds = %37, %15
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
