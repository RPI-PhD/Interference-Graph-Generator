; ModuleID = 'LLVM_IR/gpt4o_mini-2919.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @logMessage(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  call void @perror(ptr noundef @.str.1) #6
  br label %12

7:                                                ; preds = %2
  %8 = call i64 @time(ptr noundef %3) #7
  %9 = call ptr @ctime(ptr noundef %3) #7
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef @.str.2, ptr noundef %9, ptr noundef %1)
  %11 = call i32 @fclose(ptr noundef %4)
  br label %12

12:                                               ; preds = %7, %6
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @analyzeLogs(ptr noundef %0) #0 {
  %2 = alloca [256 x i8], align 16
  %3 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.3)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  call void @perror(ptr noundef @.str.1) #6
  br label %37

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %0)
  br label %8

8:                                                ; preds = %21, %6
  %.01 = phi i32 [ 0, %6 ], [ %13, %21 ]
  %.0 = phi i32 [ 0, %6 ], [ %.1, %21 ]
  %9 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %10 = call ptr @fgets(ptr noundef %9, i32 noundef 256, ptr noundef %3)
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = add nsw i32 %.01, 1
  %14 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %15 = call ptr @strstr(ptr noundef %14, ptr noundef @.str.5) #8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %21

17:                                               ; preds = %12
  %18 = add nsw i32 %.0, 1
  %19 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %19)
  br label %21

21:                                               ; preds = %17, %12
  %.1 = phi i32 [ %18, %17 ], [ %.0, %12 ]
  br label %8, !llvm.loop !6

22:                                               ; preds = %8
  %23 = call i32 @fclose(ptr noundef %3)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %.01)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %.0)
  %26 = icmp sgt i32 %.01, 0
  br i1 %26, label %27, label %33

27:                                               ; preds = %22
  %28 = sitofp i32 %.0 to float
  %29 = sitofp i32 %.01 to float
  %30 = fdiv float %28, %29
  %31 = fmul float %30, 1.000000e+02
  %32 = fpext float %31 to double
  br label %34

33:                                               ; preds = %22
  br label %34

34:                                               ; preds = %33, %27
  %35 = phi double [ %32, %27 ], [ 0.000000e+00, %33 ]
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, double noundef %35)
  br label %37

37:                                               ; preds = %34, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @generateHappyLogs(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [10 x ptr], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.generateHappyLogs.messages, i64 80, i1 false)
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  call void @perror(ptr noundef @.str.1) #6
  br label %19

7:                                                ; preds = %2
  br label %8

8:                                                ; preds = %15, %7
  %.0 = phi i32 [ 0, %7 ], [ %16, %15 ]
  %9 = icmp slt i32 %.0, %1
  br i1 %9, label %10, label %17

10:                                               ; preds = %8
  %11 = sext i32 %.0 to i64
  %12 = urem i64 %11, 10
  %13 = getelementptr inbounds [10 x ptr], ptr %3, i64 0, i64 %12
  %14 = load ptr, ptr %13, align 8
  call void @logMessage(ptr noundef %0, ptr noundef %14)
  br label %15

15:                                               ; preds = %10
  %16 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !8

17:                                               ; preds = %8
  %18 = call i32 @fclose(ptr noundef %4)
  br label %19

19:                                               ; preds = %17, %6
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  call void @generateHappyLogs(ptr noundef @.str.20, i32 noundef 20)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  call void @analyzeLogs(ptr noundef @.str.20)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
