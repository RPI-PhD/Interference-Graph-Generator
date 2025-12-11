; ModuleID = 'DATASETv2/gpt35-63483.c'
source_filename = "DATASETv2/gpt35-63483.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.email_t = type { [1024 x i8], [256 x i8], [4096 x i8] }

@stdin = external global ptr, align 8
@.str = private unnamed_addr constant [18 x i8] c"Sending email...\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"To: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"Subject: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Body: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"Welcome to the futuristic email client!\0A\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"What would you like to do?\0A\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"1. Compose email\0A\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"2. Exit\0A\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.10 = private unnamed_addr constant [32 x i8] c"Enter recipient email address:\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"Enter email subject:\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"Enter email body text:\0A\00", align 1
@.str.13 = private unnamed_addr constant [13 x i8] c"Email sent!\0A\00", align 1
@.str.14 = private unnamed_addr constant [23 x i8] c"Failed to send email.\0A\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"Exiting...\0A\00", align 1
@.str.17 = private unnamed_addr constant [47 x i8] c"Invalid option %s selected. Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @get_input() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  %3 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %3, ptr %1, align 8
  %4 = load ptr, ptr %1, align 8
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 1024, ptr noundef %5)
  %7 = load ptr, ptr %1, align 8
  %8 = call i64 @strlen(ptr noundef %7) #7
  store i64 %8, ptr %2, align 8
  br label %9

9:                                                ; preds = %29, %0
  %10 = load i64, ptr %2, align 8
  %11 = icmp ugt i64 %10, 0
  br i1 %11, label %12, label %27

12:                                               ; preds = %9
  %13 = call ptr @__ctype_b_loc() #8
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = load i64, ptr %2, align 8
  %17 = sub i64 %16, 1
  %18 = getelementptr inbounds i8, ptr %15, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i16, ptr %14, i64 %21
  %23 = load i16, ptr %22, align 2
  %24 = zext i16 %23 to i32
  %25 = and i32 %24, 8192
  %26 = icmp ne i32 %25, 0
  br label %27

27:                                               ; preds = %12, %9
  %28 = phi i1 [ false, %9 ], [ %26, %12 ]
  br i1 %28, label %29, label %32

29:                                               ; preds = %27
  %30 = load i64, ptr %2, align 8
  %31 = add i64 %30, -1
  store i64 %31, ptr %2, align 8
  br label %9, !llvm.loop !6

32:                                               ; preds = %27
  %33 = load ptr, ptr %1, align 8
  %34 = load i64, ptr %2, align 8
  %35 = getelementptr inbounds i8, ptr %33, i64 %34
  store i8 0, ptr %35, align 1
  br label %36

36:                                               ; preds = %48, %32
  %37 = call ptr @__ctype_b_loc() #8
  %38 = load ptr, ptr %37, align 8
  %39 = load ptr, ptr %1, align 8
  %40 = load i8, ptr %39, align 1
  %41 = sext i8 %40 to i32
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i16, ptr %38, i64 %42
  %44 = load i16, ptr %43, align 2
  %45 = zext i16 %44 to i32
  %46 = and i32 %45, 8192
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %51

48:                                               ; preds = %36
  %49 = load ptr, ptr %1, align 8
  %50 = getelementptr inbounds i8, ptr %49, i32 1
  store ptr %50, ptr %1, align 8
  br label %36, !llvm.loop !8

51:                                               ; preds = %36
  %52 = load ptr, ptr %1, align 8
  ret ptr %52
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @send_email(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.email_t, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %6)
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.email_t, ptr %8, i32 0, i32 1
  %10 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %10)
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.email_t, ptr %12, i32 0, i32 2
  %14 = getelementptr inbounds [4096 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %14)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.email_t, align 1
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %9

9:                                                ; preds = %0, %56
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %15 = call ptr @get_input()
  store ptr %15, ptr %2, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = call i32 @strcmp(ptr noundef %16, ptr noundef @.str.9) #7
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %46

19:                                               ; preds = %9
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %21 = call ptr @get_input()
  store ptr %21, ptr %3, align 8
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %23 = call ptr @get_input()
  store ptr %23, ptr %4, align 8
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %25 = call ptr @get_input()
  store ptr %25, ptr %5, align 8
  %26 = getelementptr inbounds %struct.email_t, ptr %6, i32 0, i32 0
  %27 = getelementptr inbounds [1024 x i8], ptr %26, i64 0, i64 0
  %28 = load ptr, ptr %3, align 8
  %29 = call ptr @strcpy(ptr noundef %27, ptr noundef %28) #9
  %30 = getelementptr inbounds %struct.email_t, ptr %6, i32 0, i32 1
  %31 = getelementptr inbounds [256 x i8], ptr %30, i64 0, i64 0
  %32 = load ptr, ptr %4, align 8
  %33 = call ptr @strcpy(ptr noundef %31, ptr noundef %32) #9
  %34 = getelementptr inbounds %struct.email_t, ptr %6, i32 0, i32 2
  %35 = getelementptr inbounds [4096 x i8], ptr %34, i64 0, i64 0
  %36 = load ptr, ptr %5, align 8
  %37 = call ptr @strcpy(ptr noundef %35, ptr noundef %36) #9
  %38 = call i32 @send_email(ptr noundef %6)
  store i32 %38, ptr %7, align 4
  %39 = load i32, ptr %7, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %19
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  br label %45

43:                                               ; preds = %19
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %45

45:                                               ; preds = %43, %41
  br label %56

46:                                               ; preds = %9
  %47 = load ptr, ptr %2, align 8
  %48 = call i32 @strcmp(ptr noundef %47, ptr noundef @.str.15) #7
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %52

50:                                               ; preds = %46
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %57

52:                                               ; preds = %46
  %53 = load ptr, ptr %2, align 8
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, ptr noundef %53)
  br label %55

55:                                               ; preds = %52
  br label %56

56:                                               ; preds = %55, %45
  br label %9

57:                                               ; preds = %50
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind willreturn memory(none) }
attributes #9 = { nounwind }

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
