; ModuleID = 'DATASETv2/gpt4o_mini-7232.c'
source_filename = "DATASETv2/gpt4o_mini-7232.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Failed to open URL file\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"uptime_log.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"%Y-%m-%d %H:%M:%S\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"[%s] %s is %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"UP\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"DOWN\00", align 1
@stderr = external global ptr, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Usage: %s <url_file>\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_curl() #0 {
  %1 = call i32 @curl_global_init(i64 noundef 3)
  ret void
}

declare i32 @curl_global_init(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @check_url(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = call ptr @curl_easy_init()
  store ptr %6, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %24

9:                                                ; preds = %1
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %10, i32 noundef 10002, ptr noundef %11)
  %13 = load ptr, ptr %4, align 8
  %14 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %13, i32 noundef 44, i64 noundef 1)
  %15 = load ptr, ptr %4, align 8
  %16 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %15, i32 noundef 13, i32 noundef 5)
  %17 = load ptr, ptr %4, align 8
  %18 = call i32 @curl_easy_perform(ptr noundef %17)
  store i32 %18, ptr %5, align 4
  %19 = load ptr, ptr %4, align 8
  call void @curl_easy_cleanup(ptr noundef %19)
  %20 = load i32, ptr %5, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %9
  store i32 1, ptr %2, align 4
  br label %25

23:                                               ; preds = %9
  store i32 0, ptr %2, align 4
  br label %25

24:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %25

25:                                               ; preds = %24, %23, %22
  %26 = load i32, ptr %2, align 4
  ret i32 %26
}

declare ptr @curl_easy_init() #1

declare i32 @curl_easy_setopt(ptr noundef, i32 noundef, ...) #1

declare i32 @curl_easy_perform(ptr noundef) #1

declare void @curl_easy_cleanup(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @load_urls(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = call noalias ptr @fopen(ptr noundef %8, ptr noundef @.str)
  store ptr %9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %13, label %12

12:                                               ; preds = %2
  call void @perror(ptr noundef @.str.1) #5
  store i32 -1, ptr %3, align 4
  br label %46

13:                                               ; preds = %2
  store i32 0, ptr %7, align 4
  br label %14

14:                                               ; preds = %28, %13
  %15 = load i32, ptr %7, align 4
  %16 = icmp slt i32 %15, 100
  br i1 %16, label %17, label %26

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [256 x i8], ptr %18, i64 %20
  %22 = getelementptr inbounds [256 x i8], ptr %21, i64 0, i64 0
  %23 = load ptr, ptr %6, align 8
  %24 = call ptr @fgets(ptr noundef %22, i32 noundef 256, ptr noundef %23)
  %25 = icmp ne ptr %24, null
  br label %26

26:                                               ; preds = %17, %14
  %27 = phi i1 [ false, %14 ], [ %25, %17 ]
  br i1 %27, label %28, label %42

28:                                               ; preds = %26
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [256 x i8], ptr %29, i64 %31
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %7, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [256 x i8], ptr %33, i64 %35
  %37 = getelementptr inbounds [256 x i8], ptr %36, i64 0, i64 0
  %38 = call i64 @strcspn(ptr noundef %37, ptr noundef @.str.2) #6
  %39 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 %38
  store i8 0, ptr %39, align 1
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %7, align 4
  br label %14, !llvm.loop !6

42:                                               ; preds = %26
  %43 = load ptr, ptr %6, align 8
  %44 = call i32 @fclose(ptr noundef %43)
  %45 = load i32, ptr %7, align 4
  store i32 %45, ptr %3, align 4
  br label %46

46:                                               ; preds = %42, %12
  %47 = load i32, ptr %3, align 4
  ret i32 %47
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @log_result(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca [30 x i8], align 16
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = call noalias ptr @fopen(ptr noundef @.str.3, ptr noundef @.str.4)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %28

12:                                               ; preds = %2
  %13 = call i64 @time(ptr noundef null) #7
  store i64 %13, ptr %6, align 8
  %14 = call ptr @localtime(ptr noundef %6) #7
  store ptr %14, ptr %7, align 8
  %15 = getelementptr inbounds [30 x i8], ptr %8, i64 0, i64 0
  %16 = load ptr, ptr %7, align 8
  %17 = call i64 @strftime(ptr noundef %15, i64 noundef 30, ptr noundef @.str.5, ptr noundef %16) #7
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds [30 x i8], ptr %8, i64 0, i64 0
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %4, align 4
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, ptr @.str.7, ptr @.str.8
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.6, ptr noundef %19, ptr noundef %20, ptr noundef %24)
  %26 = load ptr, ptr %5, align 8
  %27 = call i32 @fclose(ptr noundef %26)
  br label %28

28:                                               ; preds = %12, %2
  ret void
}

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #4

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #4

; Function Attrs: nounwind
declare i64 @strftime(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [100 x [256 x i8]], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp ne i32 %10, 2
  br i1 %11, label %12, label %18

12:                                               ; preds = %2
  %13 = load ptr, ptr @stderr, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.9, ptr noundef %16)
  store i32 1, ptr %3, align 4
  br label %49

18:                                               ; preds = %2
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 1
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds [100 x [256 x i8]], ptr %6, i64 0, i64 0
  %23 = call i32 @load_urls(ptr noundef %21, ptr noundef %22)
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %18
  store i32 1, ptr %3, align 4
  br label %49

27:                                               ; preds = %18
  call void @initialize_curl()
  br label %28

28:                                               ; preds = %27, %47
  store i32 0, ptr %8, align 4
  br label %29

29:                                               ; preds = %44, %28
  %30 = load i32, ptr %8, align 4
  %31 = load i32, ptr %7, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %47

33:                                               ; preds = %29
  %34 = load i32, ptr %8, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [100 x [256 x i8]], ptr %6, i64 0, i64 %35
  %37 = getelementptr inbounds [256 x i8], ptr %36, i64 0, i64 0
  %38 = call i32 @check_url(ptr noundef %37)
  store i32 %38, ptr %9, align 4
  %39 = load i32, ptr %8, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [100 x [256 x i8]], ptr %6, i64 0, i64 %40
  %42 = getelementptr inbounds [256 x i8], ptr %41, i64 0, i64 0
  %43 = load i32, ptr %9, align 4
  call void @log_result(ptr noundef %42, i32 noundef %43)
  br label %44

44:                                               ; preds = %33
  %45 = load i32, ptr %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %8, align 4
  br label %29, !llvm.loop !8

47:                                               ; preds = %29
  %48 = call i32 @sleep(i32 noundef 60)
  br label %28

49:                                               ; preds = %26, %12
  %50 = load i32, ptr %3, align 4
  ret i32 %50
}

declare i32 @sleep(i32 noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold }
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
!8 = distinct !{!8, !7}
