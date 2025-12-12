; ModuleID = 'LLVM_IR/gpt4o_mini-2056.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayWelcomeMessage() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @loginUser() #0 {
  %1 = alloca [30 x i8], align 16
  %2 = alloca [32 x i8], align 16
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %4 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %7 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %7)
  br label %9

9:                                                ; preds = %35, %0
  %.0 = phi i32 [ 0, %0 ], [ %36, %35 ]
  %10 = load i32, ptr @userCount, align 4
  %11 = icmp slt i32 %.0, %10
  br i1 %11, label %12, label %37

12:                                               ; preds = %9
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.User, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [30 x i8], ptr %15, i64 0, i64 0
  %17 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %18 = call i32 @strcmp(ptr noundef %16, ptr noundef %17) #4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %34

20:                                               ; preds = %12
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.User, ptr %22, i32 0, i32 1
  %24 = getelementptr inbounds [32 x i8], ptr %23, i64 0, i64 0
  %25 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %26 = call i32 @strcmp(ptr noundef %24, ptr noundef %25) #4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %34

28:                                               ; preds = %20
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.User, ptr %30, i32 0, i32 2
  store i32 1, ptr %31, align 4
  %32 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %32)
  br label %39

34:                                               ; preds = %20, %12
  br label %35

35:                                               ; preds = %34
  %36 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !6

37:                                               ; preds = %9
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %39

39:                                               ; preds = %37, %28
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @logoutUser() #0 {
  %1 = alloca [30 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %3 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %3)
  br label %5

5:                                                ; preds = %29, %0
  %.0 = phi i32 [ 0, %0 ], [ %30, %29 ]
  %6 = load i32, ptr @userCount, align 4
  %7 = icmp slt i32 %.0, %6
  br i1 %7, label %8, label %31

8:                                                ; preds = %5
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.User, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [30 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %14 = call i32 @strcmp(ptr noundef %12, ptr noundef %13) #4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %28

16:                                               ; preds = %8
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.User, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

22:                                               ; preds = %16
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.User, ptr %24, i32 0, i32 2
  store i32 0, ptr %25, align 4
  %26 = getelementptr inbounds [30 x i8], ptr %1, i64 0, i64 0
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %26)
  br label %33

28:                                               ; preds = %16, %8
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !8

31:                                               ; preds = %5
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  br label %33

33:                                               ; preds = %31, %22
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @showActiveUsers() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  br label %2

2:                                                ; preds = %18, %0
  %.01 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %.0 = phi i32 [ 0, %0 ], [ %.1, %18 ]
  %3 = load i32, ptr @userCount, align 4
  %4 = icmp slt i32 %.01, %3
  br i1 %4, label %5, label %20

5:                                                ; preds = %2
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.User, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %17

11:                                               ; preds = %5
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [10 x %struct.User], ptr @users, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.User, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [30 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %15)
  br label %17

17:                                               ; preds = %11, %5
  %.1 = phi i32 [ 1, %11 ], [ %.0, %5 ]
  br label %18

18:                                               ; preds = %17
  %19 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !9

20:                                               ; preds = %2
  %21 = icmp ne i32 %.0, 0
  br i1 %21, label %24, label %22

22:                                               ; preds = %20
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %24

24:                                               ; preds = %22, %20
  ret void
}

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  call void @displayWelcomeMessage()
  br label %2

2:                                                ; preds = %14, %0
  call void @printMenu()
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.25, ptr noundef %1)
  %4 = load i32, ptr %1, align 4
  switch i32 %4, label %11 [
    i32 1, label %5
    i32 2, label %6
    i32 3, label %7
    i32 4, label %8
    i32 5, label %9
  ]

5:                                                ; preds = %2
  call void @registerUser()
  br label %13

6:                                                ; preds = %2
  call void @loginUser()
  br label %13

7:                                                ; preds = %2
  call void @logoutUser()
  br label %13

8:                                                ; preds = %2
  call void @showActiveUsers()
  br label %13

9:                                                ; preds = %2
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.26)
  br label %13

11:                                               ; preds = %2
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  br label %13

13:                                               ; preds = %11, %9, %8, %7, %6, %5
  br label %14

14:                                               ; preds = %13
  %15 = load i32, ptr %1, align 4
  %16 = icmp ne i32 %15, 5
  br i1 %16, label %2, label %17, !llvm.loop !10

17:                                               ; preds = %14
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
