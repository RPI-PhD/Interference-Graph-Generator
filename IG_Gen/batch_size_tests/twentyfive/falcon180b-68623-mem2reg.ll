; ModuleID = 'LLVM_IR/falcon180b-68623.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_file_info(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.statvfs, align 8
  %4 = call i32 @statvfs(ptr noundef %0, ptr noundef %3) #3
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %13

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.statvfs, ptr %3, i32 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = getelementptr inbounds %struct.statvfs, ptr %3, i32 0, i32 1
  %10 = load i64, ptr %9, align 8
  %11 = mul i64 %8, %10
  %12 = getelementptr inbounds %struct.FileInfo, ptr %1, i32 0, i32 1
  store i64 %11, ptr %12, align 8
  br label %15

13:                                               ; preds = %2
  %14 = getelementptr inbounds %struct.FileInfo, ptr %1, i32 0, i32 1
  store i64 0, ptr %14, align 8
  br label %15

15:                                               ; preds = %13, %6
  %16 = getelementptr inbounds %struct.FileInfo, ptr %1, i32 0, i32 0
  %17 = getelementptr inbounds [1024 x i8], ptr %16, i64 0, i64 0
  %18 = call ptr @strncpy(ptr noundef %17, ptr noundef %0, i64 noundef 1023) #3
  ret void
}

; Function Attrs: nounwind
declare i32 @statvfs(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compare_file_info(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.FileInfo, ptr %1, i32 0, i32 1
  %4 = load i64, ptr %3, align 8
  %5 = getelementptr inbounds %struct.FileInfo, ptr %0, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  %7 = sub i64 %4, %6
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_file_info(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.FileInfo, ptr %0, i32 0, i32 0
  %3 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %4 = getelementptr inbounds %struct.FileInfo, ptr %0, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3, i64 noundef %5)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [1000 x %struct.FileInfo], align 16
  %4 = alloca [1024 x i8], align 16
  %5 = icmp slt i32 %0, 2
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %8)
  br label %52

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call noalias ptr @opendir(ptr noundef %12)
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = getelementptr inbounds ptr, ptr %1, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %17)
  br label %52

19:                                               ; preds = %10
  br label %20

20:                                               ; preds = %39, %19
  %.02 = phi i32 [ 0, %19 ], [ %.1, %39 ]
  %21 = call ptr @readdir(ptr noundef %13)
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %40

23:                                               ; preds = %20
  %24 = getelementptr inbounds %struct.dirent, ptr %21, i32 0, i32 3
  %25 = load i8, ptr %24, align 2
  %26 = zext i8 %25 to i32
  %27 = icmp eq i32 %26, 4
  br i1 %27, label %28, label %39

28:                                               ; preds = %23
  %29 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %30 = getelementptr inbounds ptr, ptr %1, i64 1
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.dirent, ptr %21, i32 0, i32 4
  %33 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 0
  %34 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %29, i64 noundef 1024, ptr noundef @.str.3, ptr noundef %31, ptr noundef %33) #3
  %35 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %36 = sext i32 %.02 to i64
  %37 = getelementptr inbounds [1000 x %struct.FileInfo], ptr %3, i64 0, i64 %36
  call void @get_file_info(ptr noundef %35, ptr noundef %37)
  %38 = add nsw i32 %.02, 1
  br label %39

39:                                               ; preds = %28, %23
  %.1 = phi i32 [ %38, %28 ], [ %.02, %23 ]
  br label %20, !llvm.loop !6

40:                                               ; preds = %20
  %41 = call i32 @closedir(ptr noundef %13)
  %42 = getelementptr inbounds [1000 x %struct.FileInfo], ptr %3, i64 0, i64 0
  %43 = sext i32 %.02 to i64
  call void @qsort(ptr noundef %42, i64 noundef %43, i64 noundef 1032, ptr noundef @compare_file_info)
  br label %44

44:                                               ; preds = %49, %40
  %.01 = phi i32 [ 0, %40 ], [ %50, %49 ]
  %45 = icmp slt i32 %.01, %.02
  br i1 %45, label %46, label %51

46:                                               ; preds = %44
  %47 = sext i32 %.01 to i64
  %48 = getelementptr inbounds [1000 x %struct.FileInfo], ptr %3, i64 0, i64 %47
  call void @print_file_info(ptr noundef %48)
  br label %49

49:                                               ; preds = %46
  %50 = add nsw i32 %.01, 1
  br label %44, !llvm.loop !8

51:                                               ; preds = %44
  br label %52

52:                                               ; preds = %51, %15, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %15 ], [ 0, %51 ]
  ret i32 %.0
}

declare noalias ptr @opendir(ptr noundef) #2

declare ptr @readdir(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #1

declare i32 @closedir(ptr noundef) #2

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
