; ModuleID = 'DATASETv2/gpt4o_mini-994.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @get_month_index(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %20, %1
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 12
  br i1 %7, label %8, label %23

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [12 x ptr], ptr @months, i64 0, i64 %10
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = call i32 @strcasecmp(ptr noundef %12, ptr noundef %13) #6
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %8
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %2, align 4
  br label %24

19:                                               ; preds = %8
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %5, !llvm.loop !6

23:                                               ; preds = %5
  store i32 -1, ptr %2, align 4
  br label %24

24:                                               ; preds = %23, %16
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcasecmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [20 x i8], align 16
  %7 = alloca [11 x i8], align 1
  %8 = alloca %struct.tm, align 8
  %9 = alloca [7 x ptr], align 16
  store i32 0, ptr %1, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %12 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %13 = load ptr, ptr @stdin, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 100, ptr noundef %13)
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %19

16:                                               ; preds = %0
  %17 = load ptr, ptr @stderr, align 8
  %18 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %17, ptr noundef @.str.14)
  store i32 1, ptr %1, align 4
  br label %73

19:                                               ; preds = %0
  %20 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %21 = getelementptr inbounds [20 x i8], ptr %6, i64 0, i64 0
  %22 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %20, ptr noundef @.str.15, ptr noundef %21, ptr noundef %3, ptr noundef %4) #7
  %23 = icmp ne i32 %22, 3
  br i1 %23, label %24, label %27

24:                                               ; preds = %19
  %25 = load ptr, ptr @stderr, align 8
  %26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.16)
  store i32 1, ptr %1, align 4
  br label %73

27:                                               ; preds = %19
  %28 = getelementptr inbounds [20 x i8], ptr %6, i64 0, i64 0
  %29 = call i32 @get_month_index(ptr noundef %28)
  store i32 %29, ptr %5, align 4
  %30 = load i32, ptr %5, align 4
  %31 = icmp eq i32 %30, -1
  br i1 %31, label %32, label %35

32:                                               ; preds = %27
  %33 = load ptr, ptr @stderr, align 8
  %34 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef @.str.17)
  store i32 1, ptr %1, align 4
  br label %73

35:                                               ; preds = %27
  %36 = load i32, ptr %3, align 4
  %37 = icmp slt i32 %36, 1
  br i1 %37, label %41, label %38

38:                                               ; preds = %35
  %39 = load i32, ptr %3, align 4
  %40 = icmp sgt i32 %39, 31
  br i1 %40, label %41, label %44

41:                                               ; preds = %38, %35
  %42 = load ptr, ptr @stderr, align 8
  %43 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %42, ptr noundef @.str.18)
  store i32 1, ptr %1, align 4
  br label %73

44:                                               ; preds = %38
  %45 = load i32, ptr %4, align 4
  %46 = icmp slt i32 %45, 1900
  br i1 %46, label %47, label %50

47:                                               ; preds = %44
  %48 = load ptr, ptr @stderr, align 8
  %49 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %48, ptr noundef @.str.19)
  store i32 1, ptr %1, align 4
  br label %73

50:                                               ; preds = %44
  %51 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  %52 = load i32, ptr %4, align 4
  %53 = load i32, ptr %5, align 4
  %54 = load i32, ptr %3, align 4
  %55 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %51, i64 noundef 11, ptr noundef @.str.20, i32 noundef %52, i32 noundef %53, i32 noundef %54) #7
  %56 = getelementptr inbounds [11 x i8], ptr %7, i64 0, i64 0
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, ptr noundef %56)
  call void @llvm.memset.p0.i64(ptr align 8 %8, i8 0, i64 56, i1 false)
  %58 = load i32, ptr %4, align 4
  %59 = sub nsw i32 %58, 1900
  %60 = getelementptr inbounds %struct.tm, ptr %8, i32 0, i32 5
  store i32 %59, ptr %60, align 4
  %61 = load i32, ptr %5, align 4
  %62 = sub nsw i32 %61, 1
  %63 = getelementptr inbounds %struct.tm, ptr %8, i32 0, i32 4
  store i32 %62, ptr %63, align 8
  %64 = load i32, ptr %3, align 4
  %65 = getelementptr inbounds %struct.tm, ptr %8, i32 0, i32 3
  store i32 %64, ptr %65, align 4
  %66 = call i64 @mktime(ptr noundef %8) #7
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %9, ptr align 16 @__const.main.weekdays, i64 56, i1 false)
  %67 = getelementptr inbounds %struct.tm, ptr %8, i32 0, i32 6
  %68 = load i32, ptr %67, align 8
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [7 x ptr], ptr %9, i64 0, i64 %69
  %71 = load ptr, ptr %70, align 8
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.29, ptr noundef %71)
  store i32 0, ptr %1, align 4
  br label %73

73:                                               ; preds = %50, %47, %41, %32, %24, %16
  %74 = load i32, ptr %1, align 4
  ret i32 %74
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
