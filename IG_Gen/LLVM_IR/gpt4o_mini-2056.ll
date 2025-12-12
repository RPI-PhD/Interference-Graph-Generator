; ModuleID = 'DATASETv2/gpt4o_mini-2056.c'
source_filename = "DATASETv2/gpt4o_mini-2056.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.User = type { [30 x i8], [32 x i8], i32 }

@userCount = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [59 x i8] c"\F0\9F\8E\89 Welcome to the Cheerful User Management System! \F0\9F\8E\89\0A\00", align 1
@.str.1 = private unnamed_addr constant [63 x i8] c"Here you can register, log in, and manage users with a smile!\0A\00", align 1
@.str.2 = private unnamed_addr constant [60 x i8] c"----------------------------------------------------------\0A\00", align 1
@.str.3 = private unnamed_addr constant [64 x i8] c"\E2\98\B9\EF\B8\8F Oops! The user list is full. Can't register more users.\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Enter a username: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"Enter a password: \00", align 1
@users = dso_local global [10 x %struct.User] zeroinitializer, align 16
@.str.7 = private unnamed_addr constant [44 x i8] c"\F0\9F\8E\8A User %s registered successfully! \F0\9F\8E\8A\0A\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"Enter your username: \00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"Enter your password: \00", align 1
@.str.10 = private unnamed_addr constant [52 x i8] c"\F0\9F\8C\9F Welcome back, %s! You are now logged in! \F0\9F\8C\9F\0A\00", align 1
@.str.11 = private unnamed_addr constant [63 x i8] c"\F0\9F\98\A2 Login failed! Incorrect username or password. Try again!\0A\00", align 1
@.str.12 = private unnamed_addr constant [33 x i8] c"Enter your username to log out: \00", align 1
@.str.13 = private unnamed_addr constant [58 x i8] c"\F0\9F\91\8B Goodbye, %s! You have logged out successfully! \F0\9F\91\8B\0A\00", align 1
@.str.14 = private unnamed_addr constant [55 x i8] c"\F0\9F\98\94 You are not logged in or don't exist! Try again!\0A\00", align 1
@.str.15 = private unnamed_addr constant [37 x i8] c"\F0\9F\8E\88 Currently logged in users \F0\9F\8E\88\0A\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"- %s\0A\00", align 1
@.str.17 = private unnamed_addr constant [47 x i8] c"\F0\9F\94\95 There are no active users at the moment!\0A\00", align 1
@.str.18 = private unnamed_addr constant [11 x i8] c"\0AOptions:\0A\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c"1. Register User\0A\00", align 1
@.str.20 = private unnamed_addr constant [15 x i8] c"2. Login User\0A\00", align 1
@.str.21 = private unnamed_addr constant [16 x i8] c"3. Logout User\0A\00", align 1
@.str.22 = private unnamed_addr constant [22 x i8] c"4. Show Active Users\0A\00", align 1
@.str.23 = private unnamed_addr constant [9 x i8] c"5. Exit\0A\00", align 1
@.str.24 = private unnamed_addr constant [25 x i8] c"Choose an option (1-5): \00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.26 = private unnamed_addr constant [77 x i8] c"\F0\9F\8E\89 Thank you for using the Cheerful User Management System! Goodbye! \F0\9F\8E\89\0A\00", align 1
@.str.27 = private unnamed_addr constant [57 x i8] c"\E2\9D\8C Invalid choice! Please choose a valid option (1-5).\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @displayWelcomeMessage() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @registerUser() #0 {
  %1 = alloca %struct.User, align 4
  %2 = load i32, ptr @userCount, align 4
  %3 = icmp sge i32 %2, 10
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %24

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %8 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 0
  %9 = getelementptr inbounds [30 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %12 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 1
  %13 = getelementptr inbounds [32 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %13)
  %15 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 2
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr @userCount, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %17
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %1, i64 68, i1 false)
  %19 = load i32, ptr @userCount, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr @userCount, align 4
  %21 = getelementptr inbounds %struct.User, ptr %1, i32 0, i32 0
  %22 = getelementptr inbounds [30 x i8], ptr %21, i64 0, i64 0
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %22)
  br label %24

24:                                               ; preds = %6, %4
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @loginUser() #0 {
  %1 = alloca [30 x i8], align 16
  %2 = alloca [32 x i8], align 16
  %3 = alloca i32, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %5 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %8 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %8)
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %40, %0
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr @userCount, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %43

14:                                               ; preds = %10
  %15 = load i32, ptr %3, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.User, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [30 x i8], ptr %18, i64 0, i64 0
  %20 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %21 = call i32 @strcmp(ptr noundef %19, ptr noundef %20) #4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %39

23:                                               ; preds = %14
  %24 = load i32, ptr %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.User, ptr %26, i32 0, i32 1
  %28 = getelementptr inbounds [32 x i8], ptr %27, i64 0, i64 0
  %29 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %30 = call i32 @strcmp(ptr noundef %28, ptr noundef %29) #4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %39

32:                                               ; preds = %23
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.User, ptr %35, i32 0, i32 2
  store i32 1, ptr %36, align 4
  %37 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %37)
  br label %45

39:                                               ; preds = %23, %14
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %3, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %3, align 4
  br label %10, !llvm.loop !6

43:                                               ; preds = %10
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %45

45:                                               ; preds = %43, %32
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @logoutUser() #0 {
  %1 = alloca [30 x i8], align 16
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %4 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %4)
  store i32 0, ptr %2, align 4
  br label %6

6:                                                ; preds = %34, %0
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr @userCount, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %37

10:                                               ; preds = %6
  %11 = load i32, ptr %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.User, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [30 x i8], ptr %14, i64 0, i64 0
  %16 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %17 = call i32 @strcmp(ptr noundef %15, ptr noundef %16) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %33

19:                                               ; preds = %10
  %20 = load i32, ptr %2, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.User, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %33

26:                                               ; preds = %19
  %27 = load i32, ptr %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.User, ptr %29, i32 0, i32 2
  store i32 0, ptr %30, align 4
  %31 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %31)
  br label %39

33:                                               ; preds = %19, %10
  br label %34

34:                                               ; preds = %33
  %35 = load i32, ptr %2, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %2, align 4
  br label %6, !llvm.loop !8

37:                                               ; preds = %6
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %39

39:                                               ; preds = %37, %26
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @showActiveUsers() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %4

4:                                                ; preds = %23, %0
  %5 = load i32, ptr %2, align 4
  %6 = load i32, ptr @userCount, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %26

8:                                                ; preds = %4
  %9 = load i32, ptr %2, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.User, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %22

15:                                               ; preds = %8
  %16 = load i32, ptr %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.User, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [30 x i8], ptr %19, i64 0, i64 0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %20)
  store i32 1, ptr %1, align 4
  br label %22

22:                                               ; preds = %15, %8
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %2, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %2, align 4
  br label %4, !llvm.loop !9

26:                                               ; preds = %4
  %27 = load i32, ptr %1, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %31, label %29

29:                                               ; preds = %26
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %31

31:                                               ; preds = %29, %26
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printMenu() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.20)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.24)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @displayWelcomeMessage()
  br label %3

3:                                                ; preds = %15, %0
  call void @printMenu()
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.25, ptr noundef %2)
  %5 = load i32, ptr %2, align 4
  switch i32 %5, label %12 [
    i32 1, label %6
    i32 2, label %7
    i32 3, label %8
    i32 4, label %9
    i32 5, label %10
  ]

6:                                                ; preds = %3
  call void @registerUser()
  br label %14

7:                                                ; preds = %3
  call void @loginUser()
  br label %14

8:                                                ; preds = %3
  call void @logoutUser()
  br label %14

9:                                                ; preds = %3
  call void @showActiveUsers()
  br label %14

10:                                               ; preds = %3
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %14

12:                                               ; preds = %3
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  br label %14

14:                                               ; preds = %12, %10, %9, %8, %7, %6
  br label %15

15:                                               ; preds = %14
  %16 = load i32, ptr %2, align 4
  %17 = icmp ne i32 %16, 5
  br i1 %17, label %3, label %18, !llvm.loop !10

18:                                               ; preds = %15
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }

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
