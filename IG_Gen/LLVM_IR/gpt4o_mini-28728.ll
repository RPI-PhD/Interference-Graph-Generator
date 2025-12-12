; ModuleID = 'DATASETv2/gpt4o_mini-28728.c'
source_filename = "DATASETv2/gpt4o_mini-28728.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DiaryEntry = type { [50 x i8], [500 x i8], [20 x i8] }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, ptr }

@entry_count = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [15 x i8] c"%02d-%02d-%04d\00", align 1
@.str.1 = private unnamed_addr constant [40 x i8] c"Diary is full! Can't add more entries.\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Enter title: \00", align 1
@diary = dso_local global [100 x %struct.DiaryEntry] zeroinitializer, align 16
@stdin = external global ptr, align 8
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [36 x i8] c"Enter content (max %d characters):\0A\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"Entry added successfully!\0A\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"No entries found in the diary.\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"\0AYour Diary Entries:\0A\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"Entry %d:\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"Title: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"Content: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"Date: %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [27 x i8] c"-------------------------\0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"No entries to delete.\0A\00", align 1
@.str.14 = private unnamed_addr constant [42 x i8] c"Enter the entry number to delete (1-%d): \00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.16 = private unnamed_addr constant [23 x i8] c"Invalid entry number.\0A\00", align 1
@.str.17 = private unnamed_addr constant [29 x i8] c"Entry deleted successfully!\0A\00", align 1
@.str.18 = private unnamed_addr constant [18 x i8] c"diary_entries.txt\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.20 = private unnamed_addr constant [33 x i8] c"Unable to open file for saving.\0A\00", align 1
@.str.21 = private unnamed_addr constant [37 x i8] c"Entries saved to diary_entries.txt.\0A\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.23 = private unnamed_addr constant [28 x i8] c"No previous entries found.\0A\00", align 1
@.str.24 = private unnamed_addr constant [30 x i8] c"Entries loaded successfully.\0A\00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"\0ADigital Diary Menu:\0A\00", align 1
@.str.26 = private unnamed_addr constant [14 x i8] c"1. Add Entry\0A\00", align 1
@.str.27 = private unnamed_addr constant [17 x i8] c"2. View Entries\0A\00", align 1
@.str.28 = private unnamed_addr constant [17 x i8] c"3. Delete Entry\0A\00", align 1
@.str.29 = private unnamed_addr constant [17 x i8] c"4. Save Entries\0A\00", align 1
@.str.30 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.31 = private unnamed_addr constant [19 x i8] c"Choose an option: \00", align 1
@.str.32 = private unnamed_addr constant [29 x i8] c"Exiting the diary. Goodbye!\0A\00", align 1
@.str.33 = private unnamed_addr constant [35 x i8] c"Invalid choice. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @get_current_date(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.tm, align 8
  store ptr %0, ptr %2, align 8
  %5 = call i64 @time(ptr noundef null) #5
  store i64 %5, ptr %3, align 8
  %6 = call ptr @localtime(ptr noundef %3) #5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %6, i64 56, i1 false)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.tm, ptr %4, i32 0, i32 3
  %9 = load i32, ptr %8, align 4
  %10 = getelementptr inbounds %struct.tm, ptr %4, i32 0, i32 4
  %11 = load i32, ptr %10, align 8
  %12 = add nsw i32 %11, 1
  %13 = getelementptr inbounds %struct.tm, ptr %4, i32 0, i32 5
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, 1900
  %16 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %7, ptr noundef @.str, i32 noundef %9, i32 noundef %12, i32 noundef %15) #5
  ret void
}

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_entry() #0 {
  %1 = alloca [20 x i8], align 16
  %2 = load i32, ptr @entry_count, align 4
  %3 = icmp sge i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %56

6:                                                ; preds = %0
  %7 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  call void @get_current_date(ptr noundef %7)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %9 = load i32, ptr @entry_count, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.DiaryEntry, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = load ptr, ptr @stdin, align 8
  %15 = call ptr @fgets(ptr noundef %13, i32 noundef 50, ptr noundef %14)
  %16 = load i32, ptr @entry_count, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.DiaryEntry, ptr %18, i32 0, i32 0
  %20 = load i32, ptr @entry_count, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.DiaryEntry, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [50 x i8], ptr %23, i64 0, i64 0
  %25 = call i64 @strcspn(ptr noundef %24, ptr noundef @.str.3) #6
  %26 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 %25
  store i8 0, ptr %26, align 1
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef 500)
  %28 = load i32, ptr @entry_count, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.DiaryEntry, ptr %30, i32 0, i32 1
  %32 = getelementptr inbounds [500 x i8], ptr %31, i64 0, i64 0
  %33 = load ptr, ptr @stdin, align 8
  %34 = call ptr @fgets(ptr noundef %32, i32 noundef 500, ptr noundef %33)
  %35 = load i32, ptr @entry_count, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %36
  %38 = getelementptr inbounds %struct.DiaryEntry, ptr %37, i32 0, i32 1
  %39 = load i32, ptr @entry_count, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %40
  %42 = getelementptr inbounds %struct.DiaryEntry, ptr %41, i32 0, i32 1
  %43 = getelementptr inbounds [500 x i8], ptr %42, i64 0, i64 0
  %44 = call i64 @strcspn(ptr noundef %43, ptr noundef @.str.3) #6
  %45 = getelementptr inbounds [500 x i8], ptr %38, i64 0, i64 %44
  store i8 0, ptr %45, align 1
  %46 = load i32, ptr @entry_count, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.DiaryEntry, ptr %48, i32 0, i32 2
  %50 = getelementptr inbounds [20 x i8], ptr %49, i64 0, i64 0
  %51 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %52 = call ptr @strcpy(ptr noundef %50, ptr noundef %51) #5
  %53 = load i32, ptr @entry_count, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr @entry_count, align 4
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %56

56:                                               ; preds = %6, %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @view_entries() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @entry_count, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %38

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  store i32 0, ptr %1, align 4
  br label %8

8:                                                ; preds = %35, %6
  %9 = load i32, ptr %1, align 4
  %10 = load i32, ptr @entry_count, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %38

12:                                               ; preds = %8
  %13 = load i32, ptr %1, align 4
  %14 = add nsw i32 %13, 1
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %14)
  %16 = load i32, ptr %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.DiaryEntry, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %20)
  %22 = load i32, ptr %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.DiaryEntry, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds [500 x i8], ptr %25, i64 0, i64 0
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %26)
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.DiaryEntry, ptr %30, i32 0, i32 2
  %32 = getelementptr inbounds [20 x i8], ptr %31, i64 0, i64 0
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %32)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %35

35:                                               ; preds = %12
  %36 = load i32, ptr %1, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %1, align 4
  br label %8, !llvm.loop !6

38:                                               ; preds = %4, %8
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @delete_entry() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, ptr @entry_count, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %43

7:                                                ; preds = %0
  %8 = load i32, ptr @entry_count, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %8)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %1)
  %11 = call i32 @getchar()
  %12 = load i32, ptr %1, align 4
  %13 = icmp slt i32 %12, 1
  br i1 %13, label %18, label %14

14:                                               ; preds = %7
  %15 = load i32, ptr %1, align 4
  %16 = load i32, ptr @entry_count, align 4
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %14, %7
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %43

20:                                               ; preds = %14
  %21 = load i32, ptr %1, align 4
  %22 = sub nsw i32 %21, 1
  store i32 %22, ptr %2, align 4
  br label %23

23:                                               ; preds = %36, %20
  %24 = load i32, ptr %2, align 4
  %25 = load i32, ptr @entry_count, align 4
  %26 = sub nsw i32 %25, 1
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %28, label %39

28:                                               ; preds = %23
  %29 = load i32, ptr %2, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %30
  %32 = load i32, ptr %2, align 4
  %33 = add nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %34
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %31, ptr align 2 %35, i64 570, i1 false)
  br label %36

36:                                               ; preds = %28
  %37 = load i32, ptr %2, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %2, align 4
  br label %23, !llvm.loop !8

39:                                               ; preds = %23
  %40 = load i32, ptr @entry_count, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, ptr @entry_count, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %43

43:                                               ; preds = %39, %18, %5
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

declare i32 @getchar() #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @save_entries() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = call noalias ptr @fopen(ptr noundef @.str.18, ptr noundef @.str.19)
  store ptr %3, ptr %1, align 8
  %4 = load ptr, ptr %1, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %44

8:                                                ; preds = %0
  store i32 0, ptr %2, align 4
  br label %9

9:                                                ; preds = %37, %8
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr @entry_count, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %40

13:                                               ; preds = %9
  %14 = load ptr, ptr %1, align 8
  %15 = load i32, ptr %2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.DiaryEntry, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.9, ptr noundef %19)
  %21 = load ptr, ptr %1, align 8
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.DiaryEntry, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds [500 x i8], ptr %25, i64 0, i64 0
  %27 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.10, ptr noundef %26)
  %28 = load ptr, ptr %1, align 8
  %29 = load i32, ptr %2, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.DiaryEntry, ptr %31, i32 0, i32 2
  %33 = getelementptr inbounds [20 x i8], ptr %32, i64 0, i64 0
  %34 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %28, ptr noundef @.str.11, ptr noundef %33)
  %35 = load ptr, ptr %1, align 8
  %36 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %35, ptr noundef @.str.12)
  br label %37

37:                                               ; preds = %13
  %38 = load i32, ptr %2, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %2, align 4
  br label %9, !llvm.loop !9

40:                                               ; preds = %9
  %41 = load ptr, ptr %1, align 8
  %42 = call i32 @fclose(ptr noundef %41)
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %44

44:                                               ; preds = %40, %6
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

declare i32 @fclose(ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @load_entries() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @fopen(ptr noundef @.str.18, ptr noundef @.str.22)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %71

7:                                                ; preds = %0
  br label %8

8:                                                ; preds = %17, %7
  %9 = load i32, ptr @entry_count, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.DiaryEntry, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = load ptr, ptr %1, align 8
  %15 = call ptr @fgets(ptr noundef %13, i32 noundef 50, ptr noundef %14)
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %67

17:                                               ; preds = %8
  %18 = load i32, ptr @entry_count, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.DiaryEntry, ptr %20, i32 0, i32 0
  %22 = load i32, ptr @entry_count, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.DiaryEntry, ptr %24, i32 0, i32 0
  %26 = getelementptr inbounds [50 x i8], ptr %25, i64 0, i64 0
  %27 = call i64 @strcspn(ptr noundef %26, ptr noundef @.str.3) #6
  %28 = getelementptr inbounds [50 x i8], ptr %21, i64 0, i64 %27
  store i8 0, ptr %28, align 1
  %29 = load i32, ptr @entry_count, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.DiaryEntry, ptr %31, i32 0, i32 1
  %33 = getelementptr inbounds [500 x i8], ptr %32, i64 0, i64 0
  %34 = load ptr, ptr %1, align 8
  %35 = call ptr @fgets(ptr noundef %33, i32 noundef 500, ptr noundef %34)
  %36 = load i32, ptr @entry_count, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.DiaryEntry, ptr %38, i32 0, i32 1
  %40 = load i32, ptr @entry_count, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.DiaryEntry, ptr %42, i32 0, i32 1
  %44 = getelementptr inbounds [500 x i8], ptr %43, i64 0, i64 0
  %45 = call i64 @strcspn(ptr noundef %44, ptr noundef @.str.3) #6
  %46 = getelementptr inbounds [500 x i8], ptr %39, i64 0, i64 %45
  store i8 0, ptr %46, align 1
  %47 = load i32, ptr @entry_count, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.DiaryEntry, ptr %49, i32 0, i32 2
  %51 = getelementptr inbounds [20 x i8], ptr %50, i64 0, i64 0
  %52 = load ptr, ptr %1, align 8
  %53 = call ptr @fgets(ptr noundef %51, i32 noundef 20, ptr noundef %52)
  %54 = load i32, ptr @entry_count, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.DiaryEntry, ptr %56, i32 0, i32 2
  %58 = load i32, ptr @entry_count, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.DiaryEntry, ptr %60, i32 0, i32 2
  %62 = getelementptr inbounds [20 x i8], ptr %61, i64 0, i64 0
  %63 = call i64 @strcspn(ptr noundef %62, ptr noundef @.str.3) #6
  %64 = getelementptr inbounds [20 x i8], ptr %57, i64 0, i64 %63
  store i8 0, ptr %64, align 1
  %65 = load i32, ptr @entry_count, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr @entry_count, align 4
  br label %8, !llvm.loop !10

67:                                               ; preds = %8
  %68 = load ptr, ptr %1, align 8
  %69 = call i32 @fclose(ptr noundef %68)
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %71

71:                                               ; preds = %67, %5
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @load_entries()
  br label %3

3:                                                ; preds = %0, %22
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %2)
  %12 = call i32 @getchar()
  %13 = load i32, ptr %2, align 4
  switch i32 %13, label %20 [
    i32 1, label %14
    i32 2, label %15
    i32 3, label %16
    i32 4, label %17
    i32 5, label %18
  ]

14:                                               ; preds = %3
  call void @add_entry()
  br label %22

15:                                               ; preds = %3
  call void @view_entries()
  br label %22

16:                                               ; preds = %3
  call void @delete_entry()
  br label %22

17:                                               ; preds = %3
  call void @save_entries()
  br label %22

18:                                               ; preds = %3
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  ret i32 0

20:                                               ; preds = %3
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  br label %22

22:                                               ; preds = %20, %17, %16, %15, %14
  br label %3
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
