; ModuleID = 'DATASETv2/gpt4o_mini-22020.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @parseLogLine(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call ptr @strtok(ptr noundef %7, ptr noundef @.str) #7
  store ptr %8, ptr %6, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.LogEntry, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [20 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %6, align 8
  %16 = call ptr @strncpy(ptr noundef %14, ptr noundef %15, i64 noundef 20) #7
  br label %18

17:                                               ; preds = %2
  store i1 false, ptr %3, align 1
  br label %41

18:                                               ; preds = %11
  %19 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #7
  store ptr %19, ptr %6, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %28

22:                                               ; preds = %18
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.LogEntry, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds [10 x i8], ptr %24, i64 0, i64 0
  %26 = load ptr, ptr %6, align 8
  %27 = call ptr @strncpy(ptr noundef %25, ptr noundef %26, i64 noundef 10) #7
  br label %29

28:                                               ; preds = %18
  store i1 false, ptr %3, align 1
  br label %41

29:                                               ; preds = %22
  %30 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #7
  store ptr %30, ptr %6, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %39

33:                                               ; preds = %29
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.LogEntry, ptr %34, i32 0, i32 2
  %36 = getelementptr inbounds [256 x i8], ptr %35, i64 0, i64 0
  %37 = load ptr, ptr %6, align 8
  %38 = call ptr @strncpy(ptr noundef %36, ptr noundef %37, i64 noundef 256) #7
  br label %40

39:                                               ; preds = %29
  store i1 false, ptr %3, align 1
  br label %41

40:                                               ; preds = %33
  store i1 true, ptr %3, align 1
  br label %41

41:                                               ; preds = %40, %39, %28, %17
  %42 = load i1, ptr %3, align 1
  ret i1 %42
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @readLogFile(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca %struct.LogEntry, align 1
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call noalias ptr @fopen(ptr noundef %6, ptr noundef @.str.2)
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %1
  call void @perror(ptr noundef @.str.3) #8
  call void @exit(i32 noundef 1) #9
  unreachable

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %33, %11
  %13 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %14 = load ptr, ptr %3, align 8
  %15 = call ptr @fgets(ptr noundef %13, i32 noundef 256, ptr noundef %14)
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %34

17:                                               ; preds = %12
  %18 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %19 = call zeroext i1 @parseLogLine(ptr noundef %18, ptr noundef %5)
  br i1 %19, label %20, label %30

20:                                               ; preds = %17
  %21 = load i32, ptr @logEntryCount, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr @logEntryCount, align 4
  %23 = sext i32 %21 to i64
  %24 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %23
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %24, ptr align 1 %5, i64 286, i1 false)
  %25 = load i32, ptr @logEntryCount, align 4
  %26 = icmp sge i32 %25, 1000
  br i1 %26, label %27, label %29

27:                                               ; preds = %20
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %34

29:                                               ; preds = %20
  br label %33

30:                                               ; preds = %17
  %31 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %31)
  br label %33

33:                                               ; preds = %30, %29
  br label %12, !llvm.loop !6

34:                                               ; preds = %27, %12
  %35 = load ptr, ptr %3, align 8
  %36 = call i32 @fclose(ptr noundef %35)
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @filterLogBySeverity(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %4)
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %37, %1
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr @logEntryCount, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %40

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.LogEntry, ptr %13, i32 0, i32 1
  %15 = getelementptr inbounds [10 x i8], ptr %14, i64 0, i64 0
  %16 = load ptr, ptr %2, align 8
  %17 = call i32 @strcmp(ptr noundef %15, ptr noundef %16) #10
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %36

19:                                               ; preds = %10
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.LogEntry, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [20 x i8], ptr %23, i64 0, i64 0
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.LogEntry, ptr %27, i32 0, i32 1
  %29 = getelementptr inbounds [10 x i8], ptr %28, i64 0, i64 0
  %30 = load i32, ptr %3, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.LogEntry, ptr %32, i32 0, i32 2
  %34 = getelementptr inbounds [256 x i8], ptr %33, i64 0, i64 0
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %24, ptr noundef %29, ptr noundef %34)
  br label %36

36:                                               ; preds = %19, %10
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %6, !llvm.loop !8

40:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #6

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayAllLogs() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %24, %0
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr @logEntryCount, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %27

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.LogEntry, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [20 x i8], ptr %11, i64 0, i64 0
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.LogEntry, ptr %15, i32 0, i32 1
  %17 = getelementptr inbounds [10 x i8], ptr %16, i64 0, i64 0
  %18 = load i32, ptr %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1000 x %struct.LogEntry], ptr @logEntries, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.LogEntry, ptr %20, i32 0, i32 2
  %22 = getelementptr inbounds [256 x i8], ptr %21, i64 0, i64 0
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %12, ptr noundef %17, ptr noundef %22)
  br label %24

24:                                               ; preds = %7
  %25 = load i32, ptr %1, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %1, align 4
  br label %3, !llvm.loop !9

27:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %14

8:                                                ; preds = %2
  %9 = load ptr, ptr @stderr, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef @.str.18, ptr noundef %12)
  store i32 1, ptr %3, align 4
  br label %18

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  call void @readLogFile(ptr noundef %17)
  call void @logAnalyzer()
  store i32 0, ptr %3, align 4
  br label %18

18:                                               ; preds = %14, %8
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
