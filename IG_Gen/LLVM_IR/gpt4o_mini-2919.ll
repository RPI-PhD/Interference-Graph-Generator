; ModuleID = 'DATASETv2/gpt4o_mini-2919.c'
source_filename = "DATASETv2/gpt4o_mini-2919.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Failed to open log file\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"[%s] %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Analyzing log file: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"happy\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Found a happy message! : %s\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"\0ATotal messages: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [20 x i8] c"Happy messages: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [38 x i8] c"Percentage of happy messages: %.2f%%\0A\00", align 1
@.str.10 = private unnamed_addr constant [43 x i8] c"Life is beautiful! Let's spread happiness!\00", align 1
@.str.11 = private unnamed_addr constant [42 x i8] c"Every day is a new opportunity! Be happy!\00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"Smiles are contagious, pass it on!\00", align 1
@.str.13 = private unnamed_addr constant [31 x i8] c"You are amazing, keep shining!\00", align 1
@.str.14 = private unnamed_addr constant [44 x i8] c"Happiness is a choice, choose it every day!\00", align 1
@.str.15 = private unnamed_addr constant [39 x i8] c"Joy is the simplest form of gratitude!\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c"Think positive, be positive!\00", align 1
@.str.17 = private unnamed_addr constant [26 x i8] c"Create your own sunshine!\00", align 1
@.str.18 = private unnamed_addr constant [51 x i8] c"Make today so awesome that yesterday gets jealous!\00", align 1
@.str.19 = private unnamed_addr constant [43 x i8] c"Happiness is not by chance, but by choice!\00", align 1
@__const.generateHappyLogs.messages = private unnamed_addr constant [10 x ptr] [ptr @.str.10, ptr @.str.11, ptr @.str.12, ptr @.str.13, ptr @.str.14, ptr @.str.15, ptr @.str.16, ptr @.str.17, ptr @.str.18, ptr @.str.19], align 16
@.str.20 = private unnamed_addr constant [14 x i8] c"happy_log.txt\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"Generating happy log messages...\0A\00", align 1
@.str.22 = private unnamed_addr constant [30 x i8] c"\0ANow let's analyze the logs!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @logMessage(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call noalias ptr @fopen(ptr noundef %7, ptr noundef @.str)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  call void @perror(ptr noundef @.str.1) #6
  br label %20

12:                                               ; preds = %2
  %13 = call i64 @time(ptr noundef %6) #7
  %14 = load ptr, ptr %5, align 8
  %15 = call ptr @ctime(ptr noundef %6) #7
  %16 = load ptr, ptr %4, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.2, ptr noundef %15, ptr noundef %16)
  %18 = load ptr, ptr %5, align 8
  %19 = call i32 @fclose(ptr noundef %18)
  br label %20

20:                                               ; preds = %12, %11
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @ctime(ptr noundef) #3

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @analyzeLogs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call noalias ptr @fopen(ptr noundef %7, ptr noundef @.str.3)
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  call void @perror(ptr noundef @.str.1) #6
  br label %53

12:                                               ; preds = %1
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %13)
  br label %15

15:                                               ; preds = %31, %12
  %16 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %17 = load ptr, ptr %3, align 8
  %18 = call ptr @fgets(ptr noundef %16, i32 noundef 256, ptr noundef %17)
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %32

20:                                               ; preds = %15
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  %23 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %24 = call ptr @strstr(ptr noundef %23, ptr noundef @.str.5) #8
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %31

26:                                               ; preds = %20
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %6, align 4
  %29 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %29)
  br label %31

31:                                               ; preds = %26, %20
  br label %15, !llvm.loop !6

32:                                               ; preds = %15
  %33 = load ptr, ptr %3, align 8
  %34 = call i32 @fclose(ptr noundef %33)
  %35 = load i32, ptr %5, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %35)
  %37 = load i32, ptr %6, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %37)
  %39 = load i32, ptr %5, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %41, label %49

41:                                               ; preds = %32
  %42 = load i32, ptr %6, align 4
  %43 = sitofp i32 %42 to float
  %44 = load i32, ptr %5, align 4
  %45 = sitofp i32 %44 to float
  %46 = fdiv float %43, %45
  %47 = fmul float %46, 1.000000e+02
  %48 = fpext float %47 to double
  br label %50

49:                                               ; preds = %32
  br label %50

50:                                               ; preds = %49, %41
  %51 = phi double [ %48, %41 ], [ 0.000000e+00, %49 ]
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %51)
  br label %53

53:                                               ; preds = %50, %11
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generateHappyLogs(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [10 x ptr], align 16
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.generateHappyLogs.messages, i64 80, i1 false)
  %9 = load ptr, ptr %3, align 8
  %10 = call noalias ptr @fopen(ptr noundef %9, ptr noundef @.str)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  call void @perror(ptr noundef @.str.1) #6
  br label %33

14:                                               ; preds = %2
  store i32 0, ptr %7, align 4
  br label %15

15:                                               ; preds = %27, %14
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %30

19:                                               ; preds = %15
  %20 = load i32, ptr %7, align 4
  %21 = sext i32 %20 to i64
  %22 = urem i64 %21, 10
  %23 = getelementptr inbounds [10 x ptr], ptr %5, i64 0, i64 %22
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %8, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = load ptr, ptr %8, align 8
  call void @logMessage(ptr noundef %25, ptr noundef %26)
  br label %27

27:                                               ; preds = %19
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %7, align 4
  br label %15, !llvm.loop !8

30:                                               ; preds = %15
  %31 = load ptr, ptr %6, align 8
  %32 = call i32 @fclose(ptr noundef %31)
  br label %33

33:                                               ; preds = %30, %13
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr @.str.20, ptr %2, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %4 = load ptr, ptr %2, align 8
  call void @generateHappyLogs(ptr noundef %4, i32 noundef 20)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %6 = load ptr, ptr %2, align 8
  call void @analyzeLogs(ptr noundef %6)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { cold }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }

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
