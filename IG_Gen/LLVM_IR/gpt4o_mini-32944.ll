; ModuleID = 'DATASETv2/gpt4o_mini-32944.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initializeMailingList(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.MailingList, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addEmail(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.MailingList, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %34

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.MailingList, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.MailingList, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x [100 x i8]], ptr %11, i64 0, i64 %15
  %17 = getelementptr inbounds [100 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %4, align 8
  %19 = call ptr @strncpy(ptr noundef %17, ptr noundef %18, i64 noundef 100) #5
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.MailingList, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.MailingList, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [100 x [100 x i8]], ptr %21, i64 0, i64 %25
  %27 = getelementptr inbounds [100 x i8], ptr %26, i64 0, i64 99
  store i8 0, ptr %27, align 1
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.MailingList, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %29, align 4
  %32 = load ptr, ptr %4, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %32)
  br label %36

34:                                               ; preds = %2
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %36

36:                                               ; preds = %34, %9
  ret void
}

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @removeEmail(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %58, %2
  %8 = load i32, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.MailingList, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %61

13:                                               ; preds = %7
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.MailingList, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x [100 x i8]], ptr %15, i64 0, i64 %17
  %19 = getelementptr inbounds [100 x i8], ptr %18, i64 0, i64 0
  %20 = load ptr, ptr %4, align 8
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #6
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %57

23:                                               ; preds = %13
  %24 = load ptr, ptr %4, align 8
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %24)
  %26 = load i32, ptr %5, align 4
  store i32 %26, ptr %6, align 4
  br label %27

27:                                               ; preds = %49, %23
  %28 = load i32, ptr %6, align 4
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.MailingList, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = sub nsw i32 %31, 1
  %33 = icmp slt i32 %28, %32
  br i1 %33, label %34, label %52

34:                                               ; preds = %27
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.MailingList, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x [100 x i8]], ptr %36, i64 0, i64 %38
  %40 = getelementptr inbounds [100 x i8], ptr %39, i64 0, i64 0
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds %struct.MailingList, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x [100 x i8]], ptr %42, i64 0, i64 %45
  %47 = getelementptr inbounds [100 x i8], ptr %46, i64 0, i64 0
  %48 = call ptr @strcpy(ptr noundef %40, ptr noundef %47) #5
  br label %49

49:                                               ; preds = %34
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %6, align 4
  br label %27, !llvm.loop !6

52:                                               ; preds = %27
  %53 = load ptr, ptr %3, align 8
  %54 = getelementptr inbounds %struct.MailingList, ptr %53, i32 0, i32 1
  %55 = load i32, ptr %54, align 4
  %56 = add nsw i32 %55, -1
  store i32 %56, ptr %54, align 4
  br label %64

57:                                               ; preds = %13
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %5, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %5, align 4
  br label %7, !llvm.loop !8

61:                                               ; preds = %7
  %62 = load ptr, ptr %4, align 8
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %62)
  br label %64

64:                                               ; preds = %61, %52
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayEmails(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %21, %1
  %6 = load i32, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.MailingList, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %24

11:                                               ; preds = %5
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.MailingList, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x [100 x i8]], ptr %15, i64 0, i64 %17
  %19 = getelementptr inbounds [100 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %13, ptr noundef %19)
  br label %21

21:                                               ; preds = %11
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %3, align 4
  br label %5, !llvm.loop !9

24:                                               ; preds = %5
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.MailingList, align 4
  %3 = alloca [100 x i8], align 16
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @initializeMailingList(ptr noundef %2)
  br label %5

5:                                                ; preds = %0, %29
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %4)
  %13 = load i32, ptr %4, align 4
  switch i32 %13, label %27 [
    i32 1, label %14
    i32 2, label %19
    i32 3, label %24
    i32 4, label %25
  ]

14:                                               ; preds = %5
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %16 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %16)
  %18 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @addEmail(ptr noundef %2, ptr noundef %18)
  br label %29

19:                                               ; preds = %5
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %21 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %22 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %21)
  %23 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @removeEmail(ptr noundef %2, ptr noundef %23)
  br label %29

24:                                               ; preds = %5
  call void @displayEmails(ptr noundef %2)
  br label %29

25:                                               ; preds = %5
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  call void @exit(i32 noundef 0) #7
  unreachable

27:                                               ; preds = %5
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %29

29:                                               ; preds = %27, %24, %19, %14
  br label %5
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
