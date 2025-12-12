; ModuleID = 'LLVM_IR/gpt4o_mini-32944.ll'
source_filename = "DATASETv2/gpt4o_mini-32944.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MailingList = type { [100 x [100 x i8]], i32 }

@.str = private unnamed_addr constant [22 x i8] c"Peacefully added: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [55 x i8] c"The mailing list is full. You cannot add more emails.\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Gently removing: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [50 x i8] c"The email %s was not found in the peaceful list.\0A\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"\0A--- Current Mailing List ---\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c" %d: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"---------------------------\0A\00", align 1
@.str.7 = private unnamed_addr constant [47 x i8] c"\0AWelcome to the Peaceful Mailing List Manager\0A\00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"1. Add Email\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"2. Remove Email\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"3. Display Emails\0A\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"4. Exit\0A\00", align 1
@.str.12 = private unnamed_addr constant [33 x i8] c"Please enter your choice (1-4): \00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.14 = private unnamed_addr constant [21 x i8] c"Enter email to add: \00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"Enter email to remove: \00", align 1
@.str.17 = private unnamed_addr constant [43 x i8] c"Exiting peacefully. Have a wonderful day!\0A\00", align 1
@.str.18 = private unnamed_addr constant [36 x i8] c"Please enter a valid choice (1-4).\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initializeMailingList(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  store i32 0, ptr %2, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @addEmail(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %24

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %8 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x [100 x i8]], ptr %7, i64 0, i64 %10
  %12 = getelementptr inbounds [100 x i8], ptr %11, i64 0, i64 0
  %13 = call ptr @strncpy(ptr noundef %12, ptr noundef %1, i64 noundef 100) #5
  %14 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %15 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x [100 x i8]], ptr %14, i64 0, i64 %17
  %19 = getelementptr inbounds [100 x i8], ptr %18, i64 0, i64 99
  store i8 0, ptr %19, align 1
  %20 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %20, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %1)
  br label %26

24:                                               ; preds = %2
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %26

26:                                               ; preds = %24, %6
  ret void
}

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @removeEmail(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %39, %2
  %.01 = phi i32 [ 0, %2 ], [ %40, %39 ]
  %4 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %41

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [100 x [100 x i8]], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds [100 x i8], ptr %10, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef %1) #6
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %38

14:                                               ; preds = %7
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %1)
  br label %16

16:                                               ; preds = %32, %14
  %.0 = phi i32 [ %.01, %14 ], [ %33, %32 ]
  %17 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = sub nsw i32 %18, 1
  %20 = icmp slt i32 %.0, %19
  br i1 %20, label %21, label %34

21:                                               ; preds = %16
  %22 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [100 x [100 x i8]], ptr %22, i64 0, i64 %23
  %25 = getelementptr inbounds [100 x i8], ptr %24, i64 0, i64 0
  %26 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %27 = add nsw i32 %.0, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x [100 x i8]], ptr %26, i64 0, i64 %28
  %30 = getelementptr inbounds [100 x i8], ptr %29, i64 0, i64 0
  %31 = call ptr @strcpy(ptr noundef %25, ptr noundef %30) #5
  br label %32

32:                                               ; preds = %21
  %33 = add nsw i32 %.0, 1
  br label %16, !llvm.loop !6

34:                                               ; preds = %16
  %35 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, ptr %35, align 4
  br label %43

38:                                               ; preds = %7
  br label %39

39:                                               ; preds = %38
  %40 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

41:                                               ; preds = %3
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %1)
  br label %43

43:                                               ; preds = %41, %34
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayEmails(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %3

3:                                                ; preds = %14, %1
  %.0 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %4 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.0, %5
  br i1 %6, label %7, label %16

7:                                                ; preds = %3
  %8 = add nsw i32 %.0, 1
  %9 = getelementptr inbounds %struct.MailingList, ptr %0, i32 0, i32 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [100 x [100 x i8]], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds [100 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %8, ptr noundef %12)
  br label %14

14:                                               ; preds = %7
  %15 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

16:                                               ; preds = %3
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.MailingList, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca i32, align 4
  call void @initializeMailingList(ptr noundef %1)
  br label %4

4:                                                ; preds = %28, %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %3)
  %12 = load i32, ptr %3, align 4
  switch i32 %12, label %26 [
    i32 1, label %13
    i32 2, label %18
    i32 3, label %23
    i32 4, label %24
  ]

13:                                               ; preds = %4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %15 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %15)
  %17 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  call void @addEmail(ptr noundef %1, ptr noundef %17)
  br label %28

18:                                               ; preds = %4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %20 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %21 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %20)
  %22 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  call void @removeEmail(ptr noundef %1, ptr noundef %22)
  br label %28

23:                                               ; preds = %4
  call void @displayEmails(ptr noundef %1)
  br label %28

24:                                               ; preds = %4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  call void @exit(i32 noundef 0) #7
  unreachable

26:                                               ; preds = %4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %28

28:                                               ; preds = %26, %23, %18, %13
  br label %4
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { noreturn nounwind }

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
