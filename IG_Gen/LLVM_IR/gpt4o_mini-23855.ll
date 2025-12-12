; ModuleID = 'DATASETv2/gpt4o_mini-23855.c'
source_filename = "DATASETv2/gpt4o_mini-23855.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Rule = type { [16 x i8], [16 x i8], i32 }

@ruleCount = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [34 x i8] c"Welcome to the Retro C Firewall!\0A\00", align 1
@.str.1 = private unnamed_addr constant [37 x i8] c"-----------------------------------\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"\0A1. Add Rule\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"2. List Rules\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"3. Filter Packet\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"4. Exit\0A\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"Select an option: \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"Enter Source IP: \00", align 1
@stdin = external global ptr, align 8
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"Enter Destination IP: \00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"Allow (1) or Block (0): \00", align 1
@.str.12 = private unnamed_addr constant [32 x i8] c"Enter Source IP of the packet: \00", align 1
@.str.13 = private unnamed_addr constant [37 x i8] c"Enter Destination IP of the packet: \00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"Packet from %s to %s is allowed.\0A\00", align 1
@.str.15 = private unnamed_addr constant [34 x i8] c"Packet from %s to %s is blocked.\0A\00", align 1
@.str.16 = private unnamed_addr constant [42 x i8] c"Exiting the Retro C Firewall. Stay safe!\0A\00", align 1
@.str.17 = private unnamed_addr constant [35 x i8] c"Invalid option, please try again.\0A\00", align 1
@rules = dso_local global [100 x %struct.Rule] zeroinitializer, align 16
@.str.18 = private unnamed_addr constant [28 x i8] c"Rule added: %s to %s is %s\0A\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"allowed\00", align 1
@.str.20 = private unnamed_addr constant [8 x i8] c"blocked\00", align 1
@.str.21 = private unnamed_addr constant [21 x i8] c"Rule limit reached!\0A\00", align 1
@.str.22 = private unnamed_addr constant [19 x i8] c"No rules defined.\0A\00", align 1
@.str.23 = private unnamed_addr constant [25 x i8] c"Current Firewall Rules:\0A\00", align 1
@.str.24 = private unnamed_addr constant [25 x i8] c"Rule %d: %s to %s is %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [16 x i8], align 16
  %4 = alloca [16 x i8], align 16
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %8

8:                                                ; preds = %0, %71
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %2)
  %15 = call i32 @getchar()
  %16 = load i32, ptr %2, align 4
  switch i32 %16, label %69 [
    i32 1, label %17
    i32 2, label %38
    i32 3, label %39
    i32 4, label %67
  ]

17:                                               ; preds = %8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %19 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %20 = load ptr, ptr @stdin, align 8
  %21 = call ptr @fgets(ptr noundef %19, i32 noundef 16, ptr noundef %20)
  %22 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %23 = call i64 @strcspn(ptr noundef %22, ptr noundef @.str.9) #5
  %24 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %23
  store i8 0, ptr %24, align 1
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %26 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %27 = load ptr, ptr @stdin, align 8
  %28 = call ptr @fgets(ptr noundef %26, i32 noundef 16, ptr noundef %27)
  %29 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %30 = call i64 @strcspn(ptr noundef %29, ptr noundef @.str.9) #5
  %31 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 %30
  store i8 0, ptr %31, align 1
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %33 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %5)
  %34 = call i32 @getchar()
  %35 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %36 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %37 = load i32, ptr %5, align 4
  call void @addRule(ptr noundef %35, ptr noundef %36, i32 noundef %37)
  br label %71

38:                                               ; preds = %8
  call void @listRules()
  br label %71

39:                                               ; preds = %8
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %41 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %42 = load ptr, ptr @stdin, align 8
  %43 = call ptr @fgets(ptr noundef %41, i32 noundef 16, ptr noundef %42)
  %44 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %45 = call i64 @strcspn(ptr noundef %44, ptr noundef @.str.9) #5
  %46 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %45
  store i8 0, ptr %46, align 1
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %48 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %49 = load ptr, ptr @stdin, align 8
  %50 = call ptr @fgets(ptr noundef %48, i32 noundef 16, ptr noundef %49)
  %51 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %52 = call i64 @strcspn(ptr noundef %51, ptr noundef @.str.9) #5
  %53 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 %52
  store i8 0, ptr %53, align 1
  %54 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %55 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %56 = call i32 @filterPacket(ptr noundef %54, ptr noundef %55)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %62

58:                                               ; preds = %39
  %59 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %60 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %59, ptr noundef %60)
  br label %66

62:                                               ; preds = %39
  %63 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %64 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 0
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %63, ptr noundef %64)
  br label %66

66:                                               ; preds = %62, %58
  br label %71

67:                                               ; preds = %8
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @exit(i32 noundef 0) #6
  unreachable

69:                                               ; preds = %8
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %71

71:                                               ; preds = %69, %66, %38, %17
  br label %8
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addRule(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr @ruleCount, align 4
  %8 = icmp slt i32 %7, 100
  br i1 %8, label %9, label %38

9:                                                ; preds = %3
  %10 = load i32, ptr @ruleCount, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.Rule, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [16 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %4, align 8
  %16 = call ptr @strncpy(ptr noundef %14, ptr noundef %15, i64 noundef 16) #7
  %17 = load i32, ptr @ruleCount, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Rule, ptr %19, i32 0, i32 1
  %21 = getelementptr inbounds [16 x i8], ptr %20, i64 0, i64 0
  %22 = load ptr, ptr %5, align 8
  %23 = call ptr @strncpy(ptr noundef %21, ptr noundef %22, i64 noundef 16) #7
  %24 = load i32, ptr %6, align 4
  %25 = load i32, ptr @ruleCount, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.Rule, ptr %27, i32 0, i32 2
  store i32 %24, ptr %28, align 4
  %29 = load i32, ptr @ruleCount, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr @ruleCount, align 4
  %31 = load ptr, ptr %4, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = load i32, ptr %6, align 4
  %34 = icmp ne i32 %33, 0
  %35 = zext i1 %34 to i64
  %36 = select i1 %34, ptr @.str.19, ptr @.str.20
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %31, ptr noundef %32, ptr noundef %36)
  br label %40

38:                                               ; preds = %3
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %40

40:                                               ; preds = %38, %9
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @filterPacket(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %36, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr @ruleCount, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %39

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Rule, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [16 x i8], ptr %15, i64 0, i64 0
  %17 = load ptr, ptr %4, align 8
  %18 = call i32 @strcmp(ptr noundef %16, ptr noundef %17) #5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %35

20:                                               ; preds = %11
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.Rule, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds [16 x i8], ptr %24, i64 0, i64 0
  %26 = load ptr, ptr %5, align 8
  %27 = call i32 @strcmp(ptr noundef %25, ptr noundef %26) #5
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %20
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.Rule, ptr %32, i32 0, i32 2
  %34 = load i32, ptr %33, align 4
  store i32 %34, ptr %3, align 4
  br label %40

35:                                               ; preds = %20, %11
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %7, !llvm.loop !6

39:                                               ; preds = %7
  store i32 1, ptr %3, align 4
  br label %40

40:                                               ; preds = %39, %29
  %41 = load i32, ptr %3, align 4
  ret i32 %41
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @listRules() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, ptr @ruleCount, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  br label %38

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  store i32 0, ptr %1, align 4
  br label %8

8:                                                ; preds = %34, %6
  %9 = load i32, ptr %1, align 4
  %10 = load i32, ptr @ruleCount, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %37

12:                                               ; preds = %8
  %13 = load i32, ptr %1, align 4
  %14 = add nsw i32 %13, 1
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Rule, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [16 x i8], ptr %18, i64 0, i64 0
  %20 = load i32, ptr %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Rule, ptr %22, i32 0, i32 1
  %24 = getelementptr inbounds [16 x i8], ptr %23, i64 0, i64 0
  %25 = load i32, ptr %1, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.Rule, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 4
  %30 = icmp ne i32 %29, 0
  %31 = zext i1 %30 to i64
  %32 = select i1 %30, ptr @.str.19, ptr @.str.20
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %14, ptr noundef %19, ptr noundef %24, ptr noundef %32)
  br label %34

34:                                               ; preds = %12
  %35 = load i32, ptr %1, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %1, align 4
  br label %8, !llvm.loop !8

37:                                               ; preds = %8
  br label %38

38:                                               ; preds = %37, %4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

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
