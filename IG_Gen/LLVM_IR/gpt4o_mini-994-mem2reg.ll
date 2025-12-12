; ModuleID = 'LLVM_IR/gpt4o_mini-994.ll'
source_filename = "DATASETv2/gpt4o_mini-994.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, ptr }

@.str = private unnamed_addr constant [8 x i8] c"January\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"February\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"March\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"April\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"May\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"June\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"July\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"August\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"September\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"October\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"November\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"December\00", align 1
@months = dso_local global [12 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11], align 16
@.str.12 = private unnamed_addr constant [49 x i8] c"Welcome to the Natural Language Date Converter!\0A\00", align 1
@.str.13 = private unnamed_addr constant [81 x i8] c"Please enter a date in the format 'Month Day, Year' (e.g., 'January 1, 2022'): \0A\00", align 1
@stdin = external global ptr, align 8
@stderr = external global ptr, align 8
@.str.14 = private unnamed_addr constant [22 x i8] c"Error reading input.\0A\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"%s %d, %d\00", align 1
@.str.16 = private unnamed_addr constant [40 x i8] c"Invalid date format. Please try again.\0A\00", align 1
@.str.17 = private unnamed_addr constant [39 x i8] c"Invalid month name. Please try again.\0A\00", align 1
@.str.18 = private unnamed_addr constant [32 x i8] c"Invalid day. Please try again.\0A\00", align 1
@.str.19 = private unnamed_addr constant [29 x i8] c"Year must be 1900 or later.\0A\00", align 1
@.str.20 = private unnamed_addr constant [15 x i8] c"%04d-%02d-%02d\00", align 1
@.str.21 = private unnamed_addr constant [20 x i8] c"Converted Date: %s\0A\00", align 1
@.str.22 = private unnamed_addr constant [7 x i8] c"Sunday\00", align 1
@.str.23 = private unnamed_addr constant [7 x i8] c"Monday\00", align 1
@.str.24 = private unnamed_addr constant [8 x i8] c"Tuesday\00", align 1
@.str.25 = private unnamed_addr constant [10 x i8] c"Wednesday\00", align 1
@.str.26 = private unnamed_addr constant [9 x i8] c"Thursday\00", align 1
@.str.27 = private unnamed_addr constant [7 x i8] c"Friday\00", align 1
@.str.28 = private unnamed_addr constant [9 x i8] c"Saturday\00", align 1
@__const.main.weekdays = private unnamed_addr constant [7 x ptr] [ptr @.str.22, ptr @.str.23, ptr @.str.24, ptr @.str.25, ptr @.str.26, ptr @.str.27, ptr @.str.28], align 16
@.str.29 = private unnamed_addr constant [21 x i8] c"Day of the week: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @get_month_index(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %13, %1
  %.01 = phi i32 [ 0, %1 ], [ %14, %13 ]
  %3 = icmp slt i32 %.01, 12
  br i1 %3, label %4, label %15

4:                                                ; preds = %2
  %5 = sext i32 %.01 to i64
  %6 = getelementptr inbounds [12 x ptr], ptr @months, i64 0, i64 %5
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 @strcasecmp(ptr noundef %7, ptr noundef %0) #6
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %4
  %11 = add nsw i32 %.01, 1
  br label %16

12:                                               ; preds = %4
  br label %13

13:                                               ; preds = %12
  %14 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !6

15:                                               ; preds = %2
  br label %16

16:                                               ; preds = %15, %10
  %.0 = phi i32 [ %11, %10 ], [ -1, %15 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcasecmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [20 x i8], align 16
  %5 = alloca [11 x i8], align 1
  %6 = alloca %struct.tm, align 8
  %7 = alloca [7 x ptr], align 16
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %10 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %11 = load ptr, ptr @stdin, align 8
  %12 = call ptr @fgets(ptr noundef %10, i32 noundef 100, ptr noundef %11)
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %0
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.14)
  br label %68

17:                                               ; preds = %0
  %18 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %19 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %20 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %18, ptr noundef @.str.15, ptr noundef %19, ptr noundef %2, ptr noundef %3) #7
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %25

22:                                               ; preds = %17
  %23 = load ptr, ptr @stderr, align 8
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.16)
  br label %68

25:                                               ; preds = %17
  %26 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %27 = call i32 @get_month_index(ptr noundef %26)
  %28 = icmp eq i32 %27, -1
  br i1 %28, label %29, label %32

29:                                               ; preds = %25
  %30 = load ptr, ptr @stderr, align 8
  %31 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %30, ptr noundef @.str.17)
  br label %68

32:                                               ; preds = %25
  %33 = load i32, ptr %2, align 4
  %34 = icmp slt i32 %33, 1
  br i1 %34, label %38, label %35

35:                                               ; preds = %32
  %36 = load i32, ptr %2, align 4
  %37 = icmp sgt i32 %36, 31
  br i1 %37, label %38, label %41

38:                                               ; preds = %35, %32
  %39 = load ptr, ptr @stderr, align 8
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.18)
  br label %68

41:                                               ; preds = %35
  %42 = load i32, ptr %3, align 4
  %43 = icmp slt i32 %42, 1900
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = load ptr, ptr @stderr, align 8
  %46 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %45, ptr noundef @.str.19)
  br label %68

47:                                               ; preds = %41
  %48 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  %49 = load i32, ptr %3, align 4
  %50 = load i32, ptr %2, align 4
  %51 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %48, i64 noundef 11, ptr noundef @.str.20, i32 noundef %49, i32 noundef %27, i32 noundef %50) #7
  %52 = getelementptr inbounds [11 x i8], ptr %5, i64 0, i64 0
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %52)
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 56, i1 false)
  %54 = load i32, ptr %3, align 4
  %55 = sub nsw i32 %54, 1900
  %56 = getelementptr inbounds %struct.tm, ptr %6, i32 0, i32 5
  store i32 %55, ptr %56, align 4
  %57 = sub nsw i32 %27, 1
  %58 = getelementptr inbounds %struct.tm, ptr %6, i32 0, i32 4
  store i32 %57, ptr %58, align 8
  %59 = load i32, ptr %2, align 4
  %60 = getelementptr inbounds %struct.tm, ptr %6, i32 0, i32 3
  store i32 %59, ptr %60, align 4
  %61 = call i64 @mktime(ptr noundef %6) #7
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %7, ptr align 16 @__const.main.weekdays, i64 56, i1 false)
  %62 = getelementptr inbounds %struct.tm, ptr %6, i32 0, i32 6
  %63 = load i32, ptr %62, align 8
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [7 x ptr], ptr %7, i64 0, i64 %64
  %66 = load ptr, ptr %65, align 8
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.29, ptr noundef %66)
  br label %68

68:                                               ; preds = %47, %44, %38, %29, %22, %14
  %.0 = phi i32 [ 1, %14 ], [ 1, %22 ], [ 1, %29 ], [ 1, %38 ], [ 1, %44 ], [ 0, %47 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i64 @mktime(ptr noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind }

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
