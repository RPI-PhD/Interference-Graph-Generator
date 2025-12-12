; ModuleID = 'LLVM_IR/gpt4o_mini-28728.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_current_date(ptr noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.tm, align 8
  %4 = call i64 @time(ptr noundef null) #5
  store i64 %4, ptr %2, align 8
  %5 = call ptr @localtime(ptr noundef %2) #5
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %5, i64 56, i1 false)
  %6 = getelementptr inbounds %struct.tm, ptr %3, i32 0, i32 3
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr inbounds %struct.tm, ptr %3, i32 0, i32 4
  %9 = load i32, ptr %8, align 8
  %10 = add nsw i32 %9, 1
  %11 = getelementptr inbounds %struct.tm, ptr %3, i32 0, i32 5
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, 1900
  %14 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %0, ptr noundef @.str, i32 noundef %7, i32 noundef %10, i32 noundef %13) #5
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

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @view_entries() #0 {
  %1 = load i32, ptr @entry_count, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %31

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %7

7:                                                ; preds = %29, %5
  %.0 = phi i32 [ 0, %5 ], [ %30, %29 ]
  %8 = load i32, ptr @entry_count, align 4
  %9 = icmp slt i32 %.0, %8
  br i1 %9, label %10, label %31

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %11)
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.DiaryEntry, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %16)
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.DiaryEntry, ptr %19, i32 0, i32 1
  %21 = getelementptr inbounds [500 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %21)
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.DiaryEntry, ptr %24, i32 0, i32 2
  %26 = getelementptr inbounds [20 x i8], ptr %25, i64 0, i64 0
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %26)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %29

29:                                               ; preds = %10
  %30 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

31:                                               ; preds = %7, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @delete_entry() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @entry_count, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %38

6:                                                ; preds = %0
  %7 = load i32, ptr @entry_count, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %7)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %1)
  %10 = call i32 @getchar()
  %11 = load i32, ptr %1, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %17, label %13

13:                                               ; preds = %6
  %14 = load i32, ptr %1, align 4
  %15 = load i32, ptr @entry_count, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %6
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %38

19:                                               ; preds = %13
  %20 = load i32, ptr %1, align 4
  %21 = sub nsw i32 %20, 1
  br label %22

22:                                               ; preds = %32, %19
  %.0 = phi i32 [ %21, %19 ], [ %33, %32 ]
  %23 = load i32, ptr @entry_count, align 4
  %24 = sub nsw i32 %23, 1
  %25 = icmp slt i32 %.0, %24
  br i1 %25, label %26, label %34

26:                                               ; preds = %22
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %27
  %29 = add nsw i32 %.0, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %30
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %28, ptr align 2 %31, i64 570, i1 false)
  br label %32

32:                                               ; preds = %26
  %33 = add nsw i32 %.0, 1
  br label %22, !llvm.loop !8

34:                                               ; preds = %22
  %35 = load i32, ptr @entry_count, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, ptr @entry_count, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %38

38:                                               ; preds = %34, %17, %4
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

declare i32 @getchar() #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @save_entries() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.18, ptr noundef @.str.19)
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  br label %31

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %26, %5
  %.0 = phi i32 [ 0, %5 ], [ %27, %26 ]
  %7 = load i32, ptr @entry_count, align 4
  %8 = icmp slt i32 %.0, %7
  br i1 %8, label %9, label %28

9:                                                ; preds = %6
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.DiaryEntry, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.9, ptr noundef %13)
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.DiaryEntry, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds [500 x i8], ptr %17, i64 0, i64 0
  %19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.10, ptr noundef %18)
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.DiaryEntry, ptr %21, i32 0, i32 2
  %23 = getelementptr inbounds [20 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.11, ptr noundef %23)
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.12)
  br label %26

26:                                               ; preds = %9
  %27 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !9

28:                                               ; preds = %6
  %29 = call i32 @fclose(ptr noundef %1)
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %31

31:                                               ; preds = %28, %3
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

declare i32 @fclose(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @load_entries() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.18, ptr noundef @.str.22)
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %65

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %14, %5
  %7 = load i32, ptr @entry_count, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.DiaryEntry, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = call ptr @fgets(ptr noundef %11, i32 noundef 50, ptr noundef %1)
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %62

14:                                               ; preds = %6
  %15 = load i32, ptr @entry_count, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.DiaryEntry, ptr %17, i32 0, i32 0
  %19 = load i32, ptr @entry_count, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.DiaryEntry, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [50 x i8], ptr %22, i64 0, i64 0
  %24 = call i64 @strcspn(ptr noundef %23, ptr noundef @.str.3) #6
  %25 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 %24
  store i8 0, ptr %25, align 1
  %26 = load i32, ptr @entry_count, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.DiaryEntry, ptr %28, i32 0, i32 1
  %30 = getelementptr inbounds [500 x i8], ptr %29, i64 0, i64 0
  %31 = call ptr @fgets(ptr noundef %30, i32 noundef 500, ptr noundef %1)
  %32 = load i32, ptr @entry_count, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.DiaryEntry, ptr %34, i32 0, i32 1
  %36 = load i32, ptr @entry_count, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.DiaryEntry, ptr %38, i32 0, i32 1
  %40 = getelementptr inbounds [500 x i8], ptr %39, i64 0, i64 0
  %41 = call i64 @strcspn(ptr noundef %40, ptr noundef @.str.3) #6
  %42 = getelementptr inbounds [500 x i8], ptr %35, i64 0, i64 %41
  store i8 0, ptr %42, align 1
  %43 = load i32, ptr @entry_count, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.DiaryEntry, ptr %45, i32 0, i32 2
  %47 = getelementptr inbounds [20 x i8], ptr %46, i64 0, i64 0
  %48 = call ptr @fgets(ptr noundef %47, i32 noundef 20, ptr noundef %1)
  %49 = load i32, ptr @entry_count, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %50
  %52 = getelementptr inbounds %struct.DiaryEntry, ptr %51, i32 0, i32 2
  %53 = load i32, ptr @entry_count, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %54
  %56 = getelementptr inbounds %struct.DiaryEntry, ptr %55, i32 0, i32 2
  %57 = getelementptr inbounds [20 x i8], ptr %56, i64 0, i64 0
  %58 = call i64 @strcspn(ptr noundef %57, ptr noundef @.str.3) #6
  %59 = getelementptr inbounds [20 x i8], ptr %52, i64 0, i64 %58
  store i8 0, ptr %59, align 1
  %60 = load i32, ptr @entry_count, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr @entry_count, align 4
  br label %6, !llvm.loop !10

62:                                               ; preds = %6
  %63 = call i32 @fclose(ptr noundef %1)
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  br label %65

65:                                               ; preds = %62, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  call void @load_entries()
  br label %2

2:                                                ; preds = %21, %0
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %1)
  %11 = call i32 @getchar()
  %12 = load i32, ptr %1, align 4
  switch i32 %12, label %19 [
    i32 1, label %13
    i32 2, label %14
    i32 3, label %15
    i32 4, label %16
    i32 5, label %17
  ]

13:                                               ; preds = %2
  call void @add_entry()
  br label %21

14:                                               ; preds = %2
  call void @view_entries()
  br label %21

15:                                               ; preds = %2
  call void @delete_entry()
  br label %21

16:                                               ; preds = %2
  call void @save_entries()
  br label %21

17:                                               ; preds = %2
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.32)
  ret i32 0

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.33)
  br label %21

21:                                               ; preds = %19, %16, %15, %14, %13
  br label %2
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
