; ModuleID = 'DATASETv2/gpt4o_mini-9214.c'
source_filename = "DATASETv2/gpt4o_mini-9214.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DiaryEntry = type { [11 x i8], [256 x i8] }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, ptr }

@entry_count = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [41 x i8] c"Diary is full! Cannot add more entries.\0A\00", align 1
@diary = dso_local global [100 x %struct.DiaryEntry] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [15 x i8] c"%04d-%02d-%02d\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Enter your diary entry (max %d characters):\0A\00", align 1
@stdin = external global ptr, align 8
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Entry added for date: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"No entries in the diary.\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"\0A--- Diary Entries ---\0A\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"Date: %s\0A\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"Entry: %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [23 x i8] c"---------------------\0A\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"No entries to delete.\0A\00", align 1
@.str.11 = private unnamed_addr constant [53 x i8] c"Enter the date of the entry to delete (YYYY-MM-DD): \00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"%10s\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"Entry for date %s deleted.\0A\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"No entry found for the date %s.\0A\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"diary_entries.txt\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.17 = private unnamed_addr constant [20 x i8] c"Failed to open file\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"%s\0A%s\0A\00", align 1
@.str.19 = private unnamed_addr constant [27 x i8] c"Diary saved successfully!\0A\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.21 = private unnamed_addr constant [37 x i8] c"No diary saved yet, starting fresh.\0A\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"%10s\0A%255[^\0A]\0A\00", align 1
@.str.23 = private unnamed_addr constant [44 x i8] c"Diary loaded successfully with %d entries.\0A\00", align 1
@.str.24 = private unnamed_addr constant [29 x i8] c"\0A--- Digital Diary Menu ---\0A\00", align 1
@.str.25 = private unnamed_addr constant [14 x i8] c"1. Add Entry\0A\00", align 1
@.str.26 = private unnamed_addr constant [17 x i8] c"2. View Entries\0A\00", align 1
@.str.27 = private unnamed_addr constant [17 x i8] c"3. Delete Entry\0A\00", align 1
@.str.28 = private unnamed_addr constant [15 x i8] c"4. Save Diary\0A\00", align 1
@.str.29 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.30 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.32 = private unnamed_addr constant [31 x i8] c"Exiting the program. Goodbye!\0A\00", align 1
@.str.33 = private unnamed_addr constant [35 x i8] c"Invalid choice. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_entry() #0 {
  %1 = alloca i64, align 8
  %2 = alloca %struct.tm, align 8
  %3 = load i32, ptr @entry_count, align 4
  %4 = icmp sge i32 %3, 100
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %53

7:                                                ; preds = %0
  %8 = call i64 @time(ptr noundef null) #6
  store i64 %8, ptr %1, align 8
  %9 = call ptr @localtime(ptr noundef %1) #6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %9, i64 56, i1 false)
  %10 = load i32, ptr @entry_count, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.DiaryEntry, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [11 x i8], ptr %13, i64 0, i64 0
  %15 = getelementptr inbounds %struct.tm, ptr %2, i32 0, i32 5
  %16 = load i32, ptr %15, align 4
  %17 = add nsw i32 %16, 1900
  %18 = getelementptr inbounds %struct.tm, ptr %2, i32 0, i32 4
  %19 = load i32, ptr %18, align 8
  %20 = add nsw i32 %19, 1
  %21 = getelementptr inbounds %struct.tm, ptr %2, i32 0, i32 3
  %22 = load i32, ptr %21, align 4
  %23 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %14, ptr noundef @.str.1, i32 noundef %17, i32 noundef %20, i32 noundef %22) #6
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 256)
  %25 = call i32 @getchar()
  %26 = load i32, ptr @entry_count, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.DiaryEntry, ptr %28, i32 0, i32 1
  %30 = getelementptr inbounds [256 x i8], ptr %29, i64 0, i64 0
  %31 = load ptr, ptr @stdin, align 8
  %32 = call ptr @fgets(ptr noundef %30, i32 noundef 256, ptr noundef %31)
  %33 = load i32, ptr @entry_count, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.DiaryEntry, ptr %35, i32 0, i32 1
  %37 = load i32, ptr @entry_count, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %38
  %40 = getelementptr inbounds %struct.DiaryEntry, ptr %39, i32 0, i32 1
  %41 = getelementptr inbounds [256 x i8], ptr %40, i64 0, i64 0
  %42 = call i64 @strcspn(ptr noundef %41, ptr noundef @.str.3) #7
  %43 = getelementptr inbounds [256 x i8], ptr %36, i64 0, i64 %42
  store i8 0, ptr %43, align 1
  %44 = load i32, ptr @entry_count, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr @entry_count, align 4
  %46 = load i32, ptr @entry_count, align 4
  %47 = sub nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.DiaryEntry, ptr %49, i32 0, i32 0
  %51 = getelementptr inbounds [11 x i8], ptr %50, i64 0, i64 0
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %51)
  br label %53

53:                                               ; preds = %7, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

declare i32 @getchar() #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @view_entries() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @entry_count, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %29

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %1, align 4
  br label %8

8:                                                ; preds = %26, %6
  %9 = load i32, ptr %1, align 4
  %10 = load i32, ptr @entry_count, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %29

12:                                               ; preds = %8
  %13 = load i32, ptr %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.DiaryEntry, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [11 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %17)
  %19 = load i32, ptr %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.DiaryEntry, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %23)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %26

26:                                               ; preds = %12
  %27 = load i32, ptr %1, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %1, align 4
  br label %8, !llvm.loop !6

29:                                               ; preds = %4, %8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @delete_entry() #0 {
  %1 = alloca [11 x i8], align 1
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = load i32, ptr @entry_count, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %59

9:                                                ; preds = %0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %11 = getelementptr inbounds [11 x i8], ptr %1, i64 0, i64 0
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %11)
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  br label %13

13:                                               ; preds = %50, %9
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr @entry_count, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %53

17:                                               ; preds = %13
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.DiaryEntry, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds [11 x i8], ptr %21, i64 0, i64 0
  %23 = getelementptr inbounds [11 x i8], ptr %1, i64 0, i64 0
  %24 = call i32 @strcmp(ptr noundef %22, ptr noundef %23) #7
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %49

26:                                               ; preds = %17
  %27 = load i32, ptr %3, align 4
  store i32 %27, ptr %4, align 4
  br label %28

28:                                               ; preds = %41, %26
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr @entry_count, align 4
  %31 = sub nsw i32 %30, 1
  %32 = icmp slt i32 %29, %31
  br i1 %32, label %33, label %44

33:                                               ; preds = %28
  %34 = load i32, ptr %4, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %35
  %37 = load i32, ptr %4, align 4
  %38 = add nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %39
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %36, ptr align 1 %40, i64 267, i1 false)
  br label %41

41:                                               ; preds = %33
  %42 = load i32, ptr %4, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %4, align 4
  br label %28, !llvm.loop !8

44:                                               ; preds = %28
  %45 = load i32, ptr @entry_count, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, ptr @entry_count, align 4
  store i32 1, ptr %2, align 4
  %47 = getelementptr inbounds [11 x i8], ptr %1, i64 0, i64 0
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %47)
  br label %53

49:                                               ; preds = %17
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %3, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %3, align 4
  br label %13, !llvm.loop !9

53:                                               ; preds = %44, %13
  %54 = load i32, ptr %2, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %59, label %56

56:                                               ; preds = %53
  %57 = getelementptr inbounds [11 x i8], ptr %1, i64 0, i64 0
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %57)
  br label %59

59:                                               ; preds = %7, %56, %53
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @save_diary() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = call noalias ptr @fopen(ptr noundef @.str.15, ptr noundef @.str.16)
  store ptr %3, ptr %1, align 8
  %4 = load ptr, ptr %1, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %0
  call void @perror(ptr noundef @.str.17) #8
  br label %32

7:                                                ; preds = %0
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %25, %7
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr @entry_count, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %28

12:                                               ; preds = %8
  %13 = load ptr, ptr %1, align 8
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.DiaryEntry, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [11 x i8], ptr %17, i64 0, i64 0
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.DiaryEntry, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.18, ptr noundef %18, ptr noundef %23)
  br label %25

25:                                               ; preds = %12
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %2, align 4
  br label %8, !llvm.loop !10

28:                                               ; preds = %8
  %29 = load ptr, ptr %1, align 8
  %30 = call i32 @fclose(ptr noundef %29)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %32

32:                                               ; preds = %28, %6
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #5

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @load_diary() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @fopen(ptr noundef @.str.15, ptr noundef @.str.20)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %7, label %5

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %34

7:                                                ; preds = %0
  br label %8

8:                                                ; preds = %28, %7
  %9 = load ptr, ptr %1, align 8
  %10 = load i32, ptr @entry_count, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.DiaryEntry, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [11 x i8], ptr %13, i64 0, i64 0
  %15 = load i32, ptr @entry_count, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.DiaryEntry, ptr %17, i32 0, i32 1
  %19 = getelementptr inbounds [256 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %9, ptr noundef @.str.22, ptr noundef %14, ptr noundef %19)
  %21 = icmp ne i32 %20, -1
  br i1 %21, label %22, label %29

22:                                               ; preds = %8
  %23 = load i32, ptr @entry_count, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr @entry_count, align 4
  %25 = load i32, ptr @entry_count, align 4
  %26 = icmp sge i32 %25, 100
  br i1 %26, label %27, label %28

27:                                               ; preds = %22
  br label %29

28:                                               ; preds = %22
  br label %8, !llvm.loop !11

29:                                               ; preds = %27, %8
  %30 = load ptr, ptr %1, align 8
  %31 = call i32 @fclose(ptr noundef %30)
  %32 = load i32, ptr @entry_count, align 4
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %32)
  br label %34

34:                                               ; preds = %29, %5
  ret void
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @load_diary()
  br label %3

3:                                                ; preds = %22, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.31, ptr noundef %2)
  %12 = load i32, ptr %2, align 4
  switch i32 %12, label %19 [
    i32 1, label %13
    i32 2, label %14
    i32 3, label %15
    i32 4, label %16
    i32 5, label %17
  ]

13:                                               ; preds = %3
  call void @add_entry()
  br label %21

14:                                               ; preds = %3
  call void @view_entries()
  br label %21

15:                                               ; preds = %3
  call void @delete_entry()
  br label %21

16:                                               ; preds = %3
  call void @save_diary()
  br label %21

17:                                               ; preds = %3
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  br label %21

19:                                               ; preds = %3
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  br label %21

21:                                               ; preds = %19, %17, %16, %15, %14, %13
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %2, align 4
  %24 = icmp ne i32 %23, 5
  br i1 %24, label %3, label %25, !llvm.loop !12

25:                                               ; preds = %22
  call void @save_diary()
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { cold }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
