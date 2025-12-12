; ModuleID = 'LLVM_IR/gpt4o_mini-7232.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialize_curl() #0 {
  %1 = call i32 @curl_global_init(i64 noundef 3)
  ret void
}

declare i32 @curl_global_init(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_url(ptr noundef %0) #0 {
  %2 = call ptr @curl_easy_init()
  %3 = icmp ne ptr %2, null
  br i1 %3, label %4, label %12

4:                                                ; preds = %1
  %5 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %2, i32 noundef 10002, ptr noundef %0)
  %6 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %2, i32 noundef 44, i64 noundef 1)
  %7 = call i32 (ptr, i32, ...) @curl_easy_setopt(ptr noundef %2, i32 noundef 13, i32 noundef 5)
  %8 = call i32 @curl_easy_perform(ptr noundef %2)
  call void @curl_easy_cleanup(ptr noundef %2)
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %4
  br label %13

11:                                               ; preds = %4
  br label %13

12:                                               ; preds = %1
  br label %13

13:                                               ; preds = %12, %11, %10
  %.0 = phi i32 [ 1, %10 ], [ 0, %11 ], [ 0, %12 ]
  ret i32 %.0
}

declare ptr @curl_easy_init() #1

declare i32 @curl_easy_setopt(ptr noundef, i32 noundef, ...) #1

declare i32 @curl_easy_perform(ptr noundef) #1

declare void @curl_easy_cleanup(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @load_urls(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  call void @perror(ptr noundef @.str.1) #5
  br label %28

6:                                                ; preds = %2
  br label %7

7:                                                ; preds = %17, %6
  %.01 = phi i32 [ 0, %6 ], [ %25, %17 ]
  %8 = icmp slt i32 %.01, 100
  br i1 %8, label %9, label %15

9:                                                ; preds = %7
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [256 x i8], ptr %1, i64 %10
  %12 = getelementptr inbounds [256 x i8], ptr %11, i64 0, i64 0
  %13 = call ptr @fgets(ptr noundef %12, i32 noundef 256, ptr noundef %3)
  %14 = icmp ne ptr %13, null
  br label %15

15:                                               ; preds = %9, %7
  %16 = phi i1 [ false, %7 ], [ %14, %9 ]
  br i1 %16, label %17, label %26

17:                                               ; preds = %15
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [256 x i8], ptr %1, i64 %18
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds [256 x i8], ptr %1, i64 %20
  %22 = getelementptr inbounds [256 x i8], ptr %21, i64 0, i64 0
  %23 = call i64 @strcspn(ptr noundef %22, ptr noundef @.str.2) #6
  %24 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 %23
  store i8 0, ptr %24, align 1
  %25 = add nsw i32 %.01, 1
  br label %7, !llvm.loop !6

26:                                               ; preds = %15
  %27 = call i32 @fclose(ptr noundef %3)
  br label %28

28:                                               ; preds = %26, %5
  %.0 = phi i32 [ %.01, %26 ], [ -1, %5 ]
  ret i32 %.0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @log_result(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca [30 x i8], align 16
  %5 = call noalias ptr @fopen(ptr noundef @.str.3, ptr noundef @.str.4)
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %18

7:                                                ; preds = %2
  %8 = call i64 @time(ptr noundef null) #7
  store i64 %8, ptr %3, align 8
  %9 = call ptr @localtime(ptr noundef %3) #7
  %10 = getelementptr inbounds [30 x i8], ptr %4, i64 0, i64 0
  %11 = call i64 @strftime(ptr noundef %10, i64 noundef 30, ptr noundef @.str.5, ptr noundef %9) #7
  %12 = getelementptr inbounds [30 x i8], ptr %4, i64 0, i64 0
  %13 = icmp ne i32 %1, 0
  %14 = zext i1 %13 to i64
  %15 = select i1 %13, ptr @.str.7, ptr @.str.8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.6, ptr noundef %12, ptr noundef %0, ptr noundef %15)
  %17 = call i32 @fclose(ptr noundef %5)
  br label %18

18:                                               ; preds = %7, %2
  ret void
}

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #4

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #4

; Function Attrs: nounwind
declare i64 @strftime(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [100 x [256 x i8]], align 16
  %4 = icmp ne i32 %0, 2
  br i1 %4, label %5, label %10

5:                                                ; preds = %2
  %6 = load ptr, ptr @stderr, align 8
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.9, ptr noundef %8)
  br label %33

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds [100 x [256 x i8]], ptr %3, i64 0, i64 0
  %14 = call i32 @load_urls(ptr noundef %12, ptr noundef %13)
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  br label %33

17:                                               ; preds = %10
  call void @initialize_curl()
  br label %18

18:                                               ; preds = %31, %17
  br label %19

19:                                               ; preds = %29, %18
  %.01 = phi i32 [ 0, %18 ], [ %30, %29 ]
  %20 = icmp slt i32 %.01, %14
  br i1 %20, label %21, label %31

21:                                               ; preds = %19
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds [100 x [256 x i8]], ptr %3, i64 0, i64 %22
  %24 = getelementptr inbounds [256 x i8], ptr %23, i64 0, i64 0
  %25 = call i32 @check_url(ptr noundef %24)
  %26 = sext i32 %.01 to i64
  %27 = getelementptr inbounds [100 x [256 x i8]], ptr %3, i64 0, i64 %26
  %28 = getelementptr inbounds [256 x i8], ptr %27, i64 0, i64 0
  call void @log_result(ptr noundef %28, i32 noundef %25)
  br label %29

29:                                               ; preds = %21
  %30 = add nsw i32 %.01, 1
  br label %19, !llvm.loop !8

31:                                               ; preds = %19
  %32 = call i32 @sleep(i32 noundef 60)
  br label %18

33:                                               ; preds = %16, %5
  ret i32 1
}

declare i32 @sleep(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
