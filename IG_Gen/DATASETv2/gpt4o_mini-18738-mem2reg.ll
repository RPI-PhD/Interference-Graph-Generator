; ModuleID = 'DATASETv2/gpt4o_mini-18738.ll'
source_filename = "DATASETv2/gpt4o_mini-18738.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DiaryEntry = type { [11 x i8], [256 x i8] }

@numEntries = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [25 x i8] c"Choose an option (1-5): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"Exiting the diary. Have a great day!\0A\00", align 1
@.str.3 = private unnamed_addr constant [38 x i8] c"Invalid choice, please select again!\0A\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"\0APress Enter to continue...\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"Diary is full! Cannot add more entries.\0A\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"Enter your diary entry: \00", align 1
@diary = dso_local global [100 x %struct.DiaryEntry] zeroinitializer, align 16
@stdin = external global ptr, align 8
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"%Y-%m-%d\00", align 1
@.str.9 = private unnamed_addr constant [31 x i8] c"Your entry has been recorded!\0A\00", align 1
@.str.10 = private unnamed_addr constant [30 x i8] c"No entries in the diary yet!\0A\00", align 1
@.str.11 = private unnamed_addr constant [16 x i8] c"Diary Entries:\0A\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"[%d] Date: %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [14 x i8] c"   Entry: %s\0A\00", align 1
@.str.14 = private unnamed_addr constant [25 x i8] c"-----------------------\0A\00", align 1
@.str.15 = private unnamed_addr constant [10 x i8] c"diary.txt\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.17 = private unnamed_addr constant [22 x i8] c"Error creating file!\0A\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"%s\0A%s\0A\00", align 1
@.str.19 = private unnamed_addr constant [27 x i8] c"Diary saved successfully!\0A\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.21 = private unnamed_addr constant [42 x i8] c"No previous diary found, starting fresh!\0A\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"%10s\0A%255[^\0A]\0A\00", align 1
@.str.23 = private unnamed_addr constant [31 x i8] c"Diary loaded with %d entries!\0A\00", align 1
@.str.24 = private unnamed_addr constant [29 x i8] c"====== Digital Diary ======\0A\00", align 1
@.str.25 = private unnamed_addr constant [20 x i8] c"1. Add a New Entry\0A\00", align 1
@.str.26 = private unnamed_addr constant [17 x i8] c"2. View Entries\0A\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"3. Save Diary\0A\00", align 1
@.str.28 = private unnamed_addr constant [15 x i8] c"4. Load Diary\0A\00", align 1
@.str.29 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.30 = private unnamed_addr constant [29 x i8] c"===========================\0A\00", align 1
@.str.31 = private unnamed_addr constant [7 x i8] c"\1B[H\1B[J\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  call void @loadDiary()
  br label %2

2:                                                ; preds = %18, %0
  call void @clearScreen()
  call void @displayMenu()
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %5 = call i32 @getchar()
  %6 = load i32, ptr %1, align 4
  switch i32 %6, label %13 [
    i32 1, label %7
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
    i32 5, label %11
  ]

7:                                                ; preds = %2
  call void @addEntry()
  br label %15

8:                                                ; preds = %2
  call void @viewEntries()
  br label %15

9:                                                ; preds = %2
  call void @saveDiary()
  br label %15

10:                                               ; preds = %2
  call void @loadDiary()
  br label %15

11:                                               ; preds = %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %15

13:                                               ; preds = %2
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %15

15:                                               ; preds = %13, %11, %10, %9, %8, %7
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %17 = call i32 @getchar()
  br label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %1, align 4
  %20 = icmp ne i32 %19, 5
  br i1 %20, label %2, label %21, !llvm.loop !6

21:                                               ; preds = %18
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addEntry() #0 {
  %1 = alloca i64, align 8
  %2 = load i32, ptr @numEntries, align 4
  %3 = icmp sge i32 %2, 100
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %37

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %8 = load i32, ptr @numEntries, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.DiaryEntry, ptr %10, i32 0, i32 1
  %12 = getelementptr inbounds [256 x i8], ptr %11, i64 0, i64 0
  %13 = load ptr, ptr @stdin, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 256, ptr noundef %13)
  %15 = load i32, ptr @numEntries, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.DiaryEntry, ptr %17, i32 0, i32 1
  %19 = load i32, ptr @numEntries, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.DiaryEntry, ptr %21, i32 0, i32 1
  %23 = getelementptr inbounds [256 x i8], ptr %22, i64 0, i64 0
  %24 = call i64 @strcspn(ptr noundef %23, ptr noundef @.str.7) #4
  %25 = getelementptr inbounds [256 x i8], ptr %18, i64 0, i64 %24
  store i8 0, ptr %25, align 1
  %26 = call i64 @time(ptr noundef null) #5
  store i64 %26, ptr %1, align 8
  %27 = call ptr @localtime(ptr noundef %1) #5
  %28 = load i32, ptr @numEntries, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.DiaryEntry, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds [11 x i8], ptr %31, i64 0, i64 0
  %33 = call i64 @strftime(ptr noundef %32, i64 noundef 11, ptr noundef @.str.8, ptr noundef %27) #5
  %34 = load i32, ptr @numEntries, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr @numEntries, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %37

37:                                               ; preds = %6, %4
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #3

; Function Attrs: nounwind
declare ptr @localtime(ptr noundef) #3

; Function Attrs: nounwind
declare i64 @strftime(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @viewEntries() #0 {
  call void @clearScreen()
  %1 = load i32, ptr @numEntries, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %25

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %7

7:                                                ; preds = %23, %5
  %.0 = phi i32 [ 0, %5 ], [ %24, %23 ]
  %8 = load i32, ptr @numEntries, align 4
  %9 = icmp slt i32 %.0, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.DiaryEntry, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [11 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %11, ptr noundef %15)
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.DiaryEntry, ptr %18, i32 0, i32 1
  %20 = getelementptr inbounds [256 x i8], ptr %19, i64 0, i64 0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %20)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %23

23:                                               ; preds = %10
  %24 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !8

25:                                               ; preds = %7, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @saveDiary() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.15, ptr noundef @.str.16)
  %2 = icmp ne ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %24

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %19, %5
  %.0 = phi i32 [ 0, %5 ], [ %20, %19 ]
  %7 = load i32, ptr @numEntries, align 4
  %8 = icmp slt i32 %.0, %7
  br i1 %8, label %9, label %21

9:                                                ; preds = %6
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.DiaryEntry, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [11 x i8], ptr %12, i64 0, i64 0
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.DiaryEntry, ptr %15, i32 0, i32 1
  %17 = getelementptr inbounds [256 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str.18, ptr noundef %13, ptr noundef %17)
  br label %19

19:                                               ; preds = %9
  %20 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !9

21:                                               ; preds = %6
  %22 = call i32 @fclose(ptr noundef %1)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %24

24:                                               ; preds = %21, %3
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @loadDiary() #0 {
  %1 = call noalias ptr @fopen(ptr noundef @.str.15, ptr noundef @.str.20)
  %2 = icmp ne ptr %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %30

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %25, %5
  %7 = load i32, ptr @numEntries, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.DiaryEntry, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [11 x i8], ptr %10, i64 0, i64 0
  %12 = load i32, ptr @numEntries, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.DiaryEntry], ptr @diary, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.DiaryEntry, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [256 x i8], ptr %15, i64 0, i64 0
  %17 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %1, ptr noundef @.str.22, ptr noundef %11, ptr noundef %16)
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %19, label %26

19:                                               ; preds = %6
  %20 = load i32, ptr @numEntries, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr @numEntries, align 4
  %22 = load i32, ptr @numEntries, align 4
  %23 = icmp sge i32 %22, 100
  br i1 %23, label %24, label %25

24:                                               ; preds = %19
  br label %26

25:                                               ; preds = %19
  br label %6, !llvm.loop !10

26:                                               ; preds = %24, %6
  %27 = call i32 @fclose(ptr noundef %1)
  %28 = load i32, ptr @numEntries, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %28)
  br label %30

30:                                               ; preds = %26, %3
  ret void
}

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayMenu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.25)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.29)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.30)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @clearScreen() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.31)
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
attributes #5 = { nounwind }

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
