; ModuleID = 'DATASETv2/falcon180b-68623.c'
source_filename = "DATASETv2/falcon180b-68623.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.statvfs = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, [5 x i32] }
%struct.FileInfo = type { [1024 x i8], i64 }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@.str = private unnamed_addr constant [14 x i8] c"%-40s %10llu\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Usage: %s <directory>\0A\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"Error: Could not open directory '%s'.\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"%s/%s\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @get_file_info(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.statvfs, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i32 @statvfs(ptr noundef %6, ptr noundef %5) #3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %17

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.statvfs, ptr %5, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = getelementptr inbounds %struct.statvfs, ptr %5, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  %14 = mul i64 %11, %13
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.FileInfo, ptr %15, i32 0, i32 1
  store i64 %14, ptr %16, align 8
  br label %20

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.FileInfo, ptr %18, i32 0, i32 1
  store i64 0, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %9
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.FileInfo, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [1024 x i8], ptr %22, i64 0, i64 0
  %24 = load ptr, ptr %3, align 8
  %25 = call ptr @strncpy(ptr noundef %23, ptr noundef %24, i64 noundef 1023) #3
  ret void
}

; Function Attrs: nounwind
declare i32 @statvfs(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @compare_file_info(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  store ptr %8, ptr %6, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = getelementptr inbounds %struct.FileInfo, ptr %9, i32 0, i32 1
  %11 = load i64, ptr %10, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.FileInfo, ptr %12, i32 0, i32 1
  %14 = load i64, ptr %13, align 8
  %15 = sub i64 %11, %14
  %16 = trunc i64 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_file_info(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.FileInfo, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.FileInfo, ptr %6, i32 0, i32 1
  %8 = load i64, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %5, i64 noundef %8)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [1000 x %struct.FileInfo], align 16
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca [1024 x i8], align 16
  %11 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 2
  br i1 %13, label %14, label %19

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %17)
  store i32 1, ptr %3, align 4
  br label %76

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 1
  %22 = load ptr, ptr %21, align 8
  %23 = call noalias ptr @opendir(ptr noundef %22)
  store ptr %23, ptr %6, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %31

26:                                               ; preds = %19
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 1
  %29 = load ptr, ptr %28, align 8
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %29)
  store i32 1, ptr %3, align 4
  br label %76

31:                                               ; preds = %19
  store i32 0, ptr %8, align 4
  br label %32

32:                                               ; preds = %57, %31
  %33 = load ptr, ptr %6, align 8
  %34 = call ptr @readdir(ptr noundef %33)
  store ptr %34, ptr %9, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %58

36:                                               ; preds = %32
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.dirent, ptr %37, i32 0, i32 3
  %39 = load i8, ptr %38, align 2
  %40 = zext i8 %39 to i32
  %41 = icmp eq i32 %40, 4
  br i1 %41, label %42, label %57

42:                                               ; preds = %36
  %43 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds ptr, ptr %44, i64 1
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %9, align 8
  %48 = getelementptr inbounds %struct.dirent, ptr %47, i32 0, i32 4
  %49 = getelementptr inbounds [256 x i8], ptr %48, i64 0, i64 0
  %50 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %43, i64 noundef 1024, ptr noundef @.str.3, ptr noundef %46, ptr noundef %49) #3
  %51 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %52 = load i32, ptr %8, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [1000 x %struct.FileInfo], ptr %7, i64 0, i64 %53
  call void @get_file_info(ptr noundef %51, ptr noundef %54)
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %8, align 4
  br label %57

57:                                               ; preds = %42, %36
  br label %32, !llvm.loop !6

58:                                               ; preds = %32
  %59 = load ptr, ptr %6, align 8
  %60 = call i32 @closedir(ptr noundef %59)
  %61 = getelementptr inbounds [1000 x %struct.FileInfo], ptr %7, i64 0, i64 0
  %62 = load i32, ptr %8, align 4
  %63 = sext i32 %62 to i64
  call void @qsort(ptr noundef %61, i64 noundef %63, i64 noundef 1032, ptr noundef @compare_file_info)
  store i32 0, ptr %11, align 4
  br label %64

64:                                               ; preds = %72, %58
  %65 = load i32, ptr %11, align 4
  %66 = load i32, ptr %8, align 4
  %67 = icmp slt i32 %65, %66
  br i1 %67, label %68, label %75

68:                                               ; preds = %64
  %69 = load i32, ptr %11, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [1000 x %struct.FileInfo], ptr %7, i64 0, i64 %70
  call void @print_file_info(ptr noundef %71)
  br label %72

72:                                               ; preds = %68
  %73 = load i32, ptr %11, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %11, align 4
  br label %64, !llvm.loop !8

75:                                               ; preds = %64
  store i32 0, ptr %3, align 4
  br label %76

76:                                               ; preds = %75, %26, %14
  %77 = load i32, ptr %3, align 4
  ret i32 %77
}

declare noalias ptr @opendir(ptr noundef) #2

declare ptr @readdir(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

declare i32 @closedir(ptr noundef) #2

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
