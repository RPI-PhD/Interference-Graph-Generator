; ModuleID = 'LLVM_IR/gpt4o_mini-22020.ll'
source_filename = "DATASETv2/gpt4o_mini-22020.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.LogEntry = type { [20 x i8], [10 x i8], [256 x i8] }

@logEntryCount = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Unable to open log file\00", align 1
@logEntries = dso_local global [1000 x %struct.LogEntry] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [36 x i8] c"Error: Maximum log entries reached\0A\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"Error parsing line: %s\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"\0AFiltered Logs by Severity [%s]:\0A\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"%s - %s: %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"\0AAll Logs:\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"\0ALog Analyzer Menu:\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"1. Display All Logs\0A\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"2. Filter Logs by Severity\0A\00", align 1
@.str.12 = private unnamed_addr constant [9 x i8] c"3. Exit\0A\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Choose an option: \00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.15 = private unnamed_addr constant [37 x i8] c"Enter severity (ERROR, WARN, INFO): \00", align 1
@stdin = external global ptr, align 8
@.str.16 = private unnamed_addr constant [23 x i8] c"Exiting Log Analyzer.\0A\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"Invalid option. Try again!\0A\00", align 1
@stderr = external global ptr, align 8
@.str.18 = private unnamed_addr constant [21 x i8] c"Usage: %s <logfile>\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @parseLogLine(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #7
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.LogEntry, ptr %1, i32 0, i32 0
  %7 = getelementptr inbounds [20 x i8], ptr %6, i64 0, i64 0
  %8 = call ptr @strncpy(ptr noundef %7, ptr noundef %3, i64 noundef 20) #7
  br label %10

9:                                                ; preds = %2
  br label %27

10:                                               ; preds = %5
  %11 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #7
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %17

13:                                               ; preds = %10
  %14 = getelementptr inbounds %struct.LogEntry, ptr %1, i32 0, i32 1
  %15 = getelementptr inbounds [10 x i8], ptr %14, i64 0, i64 0
  %16 = call ptr @strncpy(ptr noundef %15, ptr noundef %11, i64 noundef 10) #7
  br label %18

17:                                               ; preds = %10
  br label %27

18:                                               ; preds = %13
  %19 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #7
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %25

21:                                               ; preds = %18
  %22 = getelementptr inbounds %struct.LogEntry, ptr %1, i32 0, i32 2
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call ptr @strncpy(ptr noundef %23, ptr noundef %19, i64 noundef 256) #7
  br label %26

25:                                               ; preds = %18
  br label %27

26:                                               ; preds = %21
  br label %27

27:                                               ; preds = %26, %25, %17, %9
  %.0 = phi i1 [ true, %26 ], [ false, %25 ], [ false, %17 ], [ false, %9 ]
  ret i1 %.0
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @readLogFile(ptr noundef %0) #0 {
  %2 = alloca [256 x i8], align 16
  %3 = alloca %struct.LogEntry, align 1
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.2)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  call void @perror(ptr noundef @.str.3) #8
  call void @exit(i32 noundef 1) #9
  unreachable

7:                                                ; preds = %1
  br label %8

8:                                                ; preds = %28, %7
  %9 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %10 = call ptr @fgets(ptr noundef %9, i32 noundef 256, ptr noundef %4)
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %29

12:                                               ; preds = %8
  %13 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %14 = call zeroext i1 @parseLogLine(ptr noundef %13, ptr noundef %3)
  br i1 %14, label %15, label %25

15:                                               ; preds = %12
  %16 = load i32, ptr @logEntryCount, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr @logEntryCount, align 4
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %18
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %19, ptr align 1 %3, i64 286, i1 false)
  %20 = load i32, ptr @logEntryCount, align 4
  %21 = icmp sge i32 %20, 1000
  br i1 %21, label %22, label %24

22:                                               ; preds = %15
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %29

24:                                               ; preds = %15
  br label %28

25:                                               ; preds = %12
  %26 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %26)
  br label %28

28:                                               ; preds = %25, %24
  br label %8, !llvm.loop !6

29:                                               ; preds = %22, %8
  %30 = call i32 @fclose(ptr noundef %4)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

declare i32 @printf(ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @filterLogBySeverity(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %0)
  br label %3

3:                                                ; preds = %28, %1
  %.0 = phi i32 [ 0, %1 ], [ %29, %28 ]
  %4 = load i32, ptr @logEntryCount, align 4
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %30

6:                                                ; preds = %3
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.LogEntry, ptr %8, i32 0, i32 1
  %10 = getelementptr inbounds [10 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef %0) #10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %27

13:                                               ; preds = %6
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.LogEntry, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [20 x i8], ptr %16, i64 0, i64 0
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.LogEntry, ptr %19, i32 0, i32 1
  %21 = getelementptr inbounds [10 x i8], ptr %20, i64 0, i64 0
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.LogEntry, ptr %23, i32 0, i32 2
  %25 = getelementptr inbounds [256 x i8], ptr %24, i64 0, i64 0
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %17, ptr noundef %21, ptr noundef %25)
  br label %27

27:                                               ; preds = %13, %6
  br label %28

28:                                               ; preds = %27
  %29 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

30:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayAllLogs() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %2

2:                                                ; preds = %19, %0
  %.0 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %3 = load i32, ptr @logEntryCount, align 4
  %4 = icmp slt i32 %.0, %3
  br i1 %4, label %5, label %21

5:                                                ; preds = %2
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.LogEntry, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [20 x i8], ptr %8, i64 0, i64 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.LogEntry, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 0
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.LogEntry, ptr %15, i32 0, i32 2
  %17 = getelementptr inbounds [256 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %9, ptr noundef %13, ptr noundef %17)
  br label %19

19:                                               ; preds = %5
  %20 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

21:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @logAnalyzer() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i8], align 1
  br label %3

3:                                                ; preds = %26, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.14, ptr noundef %1)
  %10 = call i32 @getchar()
  %11 = load i32, ptr %1, align 4
  switch i32 %11, label %23 [
    i32 1, label %12
    i32 2, label %13
    i32 3, label %21
  ]

12:                                               ; preds = %3
  call void @displayAllLogs()
  br label %25

13:                                               ; preds = %3
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %15 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %16 = load ptr, ptr @stdin, align 8
  %17 = call ptr @fgets(ptr noundef %15, i32 noundef 10, ptr noundef %16)
  %18 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %19 = call ptr @strtok(ptr noundef %18, ptr noundef @.str.1) #7
  %20 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  call void @filterLogBySeverity(ptr noundef %20)
  br label %25

21:                                               ; preds = %3
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %25

23:                                               ; preds = %3
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %25

25:                                               ; preds = %23, %21, %13, %12
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %1, align 4
  %28 = icmp ne i32 %27, 3
  br i1 %28, label %3, label %29, !llvm.loop !10

29:                                               ; preds = %26
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

declare i32 @getchar() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp slt i32 %0, 2
  br i1 %3, label %4, label %9

4:                                                ; preds = %2
  %5 = load ptr, ptr @stderr, align 8
  %6 = getelementptr inbounds ptr, ptr %1, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef @.str.18, ptr noundef %7)
  br label %12

9:                                                ; preds = %2
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  call void @readLogFile(ptr noundef %11)
  call void @logAnalyzer()
  br label %12

12:                                               ; preds = %9, %4
  %.0 = phi i32 [ 1, %4 ], [ 0, %9 ]
  ret i32 %.0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind willreturn memory(read) }

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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
