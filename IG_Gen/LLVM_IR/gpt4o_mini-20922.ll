; ModuleID = 'DATASETv2/gpt4o_mini-20922.c'
source_filename = "DATASETv2/gpt4o_mini-20922.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.SpamDatabase = type { [100 x [256 x i8]], i32 }

@spamDb = dso_local global %struct.SpamDatabase zeroinitializer, align 4
@.str = private unnamed_addr constant [11 x i8] c"free money\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"win a lottery\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"click this link\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"urgent response needed\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"you have won\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"non_spam_messages.log\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"Failed to open log file\00", align 1
@.str.9 = private unnamed_addr constant [44 x i8] c"Enter your messages (Type 'EXIT' to quit):\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"> \00", align 1
@stdin = external global ptr, align 8
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"EXIT\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"Spam detected: \22%s\22\0A\00", align 1
@.str.14 = private unnamed_addr constant [24 x i8] c"Non-spam message: \22%s\22\0A\00", align 1
@.str.15 = private unnamed_addr constant [39 x i8] c"Welcome to the Spam Detection System!\0A\00", align 1
@.str.16 = private unnamed_addr constant [45 x i8] c"Exiting the Spam Detection System. Goodbye!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initializeSpamDatabase() #0 {
  %1 = call ptr @strcpy(ptr noundef @spamDb, ptr noundef @.str) #5
  %2 = call ptr @strcpy(ptr noundef getelementptr inbounds ([100 x [256 x i8]], ptr @spamDb, i64 0, i64 1), ptr noundef @.str.1) #5
  %3 = call ptr @strcpy(ptr noundef getelementptr inbounds ([100 x [256 x i8]], ptr @spamDb, i64 0, i64 2), ptr noundef @.str.2) #5
  %4 = call ptr @strcpy(ptr noundef getelementptr inbounds ([100 x [256 x i8]], ptr @spamDb, i64 0, i64 3), ptr noundef @.str.3) #5
  %5 = call ptr @strcpy(ptr noundef getelementptr inbounds ([100 x [256 x i8]], ptr @spamDb, i64 0, i64 4), ptr noundef @.str.4) #5
  store i32 5, ptr getelementptr inbounds (%struct.SpamDatabase, ptr @spamDb, i32 0, i32 1), align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @isSpam(ptr noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %19, %1
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr getelementptr inbounds (%struct.SpamDatabase, ptr @spamDb, i32 0, i32 1), align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %22

9:                                                ; preds = %5
  %10 = load ptr, ptr %3, align 8
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x [256 x i8]], ptr @spamDb, i64 0, i64 %12
  %14 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 0
  %15 = call ptr @strstr(ptr noundef %10, ptr noundef %14) #6
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %9
  store i1 true, ptr %2, align 1
  br label %23

18:                                               ; preds = %9
  br label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %5, !llvm.loop !6

22:                                               ; preds = %5
  store i1 false, ptr %2, align 1
  br label %23

23:                                               ; preds = %22, %17
  %24 = load i1, ptr %2, align 1
  ret i1 %24
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @logMessage(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = call noalias ptr @fopen(ptr noundef @.str.5, ptr noundef @.str.6)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.7, ptr noundef %9)
  %11 = load ptr, ptr %3, align 8
  %12 = call i32 @fclose(ptr noundef %11)
  br label %14

13:                                               ; preds = %1
  call void @perror(ptr noundef @.str.8) #7
  br label %14

14:                                               ; preds = %13, %7
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

declare i32 @fclose(ptr noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @processMessages() #0 {
  %1 = alloca [256 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %3

3:                                                ; preds = %0, %25
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %5 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 256, ptr noundef %6)
  %8 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %9 = call i64 @strcspn(ptr noundef %8, ptr noundef @.str.11) #6
  %10 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 %9
  store i8 0, ptr %10, align 1
  %11 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.12) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  br label %26

15:                                               ; preds = %3
  %16 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %17 = call zeroext i1 @isSpam(ptr noundef %16)
  br i1 %17, label %18, label %21

18:                                               ; preds = %15
  %19 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %19)
  br label %25

21:                                               ; preds = %15
  %22 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %22)
  %24 = getelementptr inbounds [256 x i8], ptr %1, i64 0, i64 0
  call void @logMessage(ptr noundef %24)
  br label %25

25:                                               ; preds = %21, %18
  br label %3

26:                                               ; preds = %14
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  call void @initializeSpamDatabase()
  call void @processMessages()
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { cold }

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
