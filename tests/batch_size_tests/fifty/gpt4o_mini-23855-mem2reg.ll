; ModuleID = 'LLVM_IR/gpt4o_mini-23855.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [16 x i8], align 16
  %3 = alloca [16 x i8], align 16
  %4 = alloca i32, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %7

7:                                                ; preds = %70, %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %1)
  %14 = call i32 @getchar()
  %15 = load i32, ptr %1, align 4
  switch i32 %15, label %68 [
    i32 1, label %16
    i32 2, label %37
    i32 3, label %38
    i32 4, label %66
  ]

16:                                               ; preds = %7
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %18 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %19 = load ptr, ptr @stdin, align 8
  %20 = call ptr @fgets(ptr noundef %18, i32 noundef 16, ptr noundef %19)
  %21 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %22 = call i64 @strcspn(ptr noundef %21, ptr noundef @.str.9) #5
  %23 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 %22
  store i8 0, ptr %23, align 1
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %25 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %26 = load ptr, ptr @stdin, align 8
  %27 = call ptr @fgets(ptr noundef %25, i32 noundef 16, ptr noundef %26)
  %28 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %29 = call i64 @strcspn(ptr noundef %28, ptr noundef @.str.9) #5
  %30 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %29
  store i8 0, ptr %30, align 1
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %32 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %4)
  %33 = call i32 @getchar()
  %34 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %35 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %36 = load i32, ptr %4, align 4
  call void @addRule(ptr noundef %34, ptr noundef %35, i32 noundef %36)
  br label %70

37:                                               ; preds = %7
  call void @listRules()
  br label %70

38:                                               ; preds = %7
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %40 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %41 = load ptr, ptr @stdin, align 8
  %42 = call ptr @fgets(ptr noundef %40, i32 noundef 16, ptr noundef %41)
  %43 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %44 = call i64 @strcspn(ptr noundef %43, ptr noundef @.str.9) #5
  %45 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 %44
  store i8 0, ptr %45, align 1
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %47 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %48 = load ptr, ptr @stdin, align 8
  %49 = call ptr @fgets(ptr noundef %47, i32 noundef 16, ptr noundef %48)
  %50 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %51 = call i64 @strcspn(ptr noundef %50, ptr noundef @.str.9) #5
  %52 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 %51
  store i8 0, ptr %52, align 1
  %53 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %54 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %55 = call i32 @filterPacket(ptr noundef %53, ptr noundef %54)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %61

57:                                               ; preds = %38
  %58 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %59 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %58, ptr noundef %59)
  br label %65

61:                                               ; preds = %38
  %62 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %63 = getelementptr inbounds [16 x i8], ptr %3, i64 0, i64 0
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %62, ptr noundef %63)
  br label %65

65:                                               ; preds = %61, %57
  br label %70

66:                                               ; preds = %7
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @exit(i32 noundef 0) #6
  unreachable

68:                                               ; preds = %7
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %70

70:                                               ; preds = %68, %65, %37, %16
  br label %7
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

declare i32 @getchar() #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @addRule(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = load i32, ptr @ruleCount, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %29

6:                                                ; preds = %3
  %7 = load i32, ptr @ruleCount, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Rule, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [16 x i8], ptr %10, i64 0, i64 0
  %12 = call ptr @strncpy(ptr noundef %11, ptr noundef %0, i64 noundef 16) #7
  %13 = load i32, ptr @ruleCount, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Rule, ptr %15, i32 0, i32 1
  %17 = getelementptr inbounds [16 x i8], ptr %16, i64 0, i64 0
  %18 = call ptr @strncpy(ptr noundef %17, ptr noundef %1, i64 noundef 16) #7
  %19 = load i32, ptr @ruleCount, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Rule, ptr %21, i32 0, i32 2
  store i32 %2, ptr %22, align 4
  %23 = load i32, ptr @ruleCount, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr @ruleCount, align 4
  %25 = icmp ne i32 %2, 0
  %26 = zext i1 %25 to i64
  %27 = select i1 %25, ptr @.str.19, ptr @.str.20
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.18, ptr noundef %0, ptr noundef %1, ptr noundef %27)
  br label %31

29:                                               ; preds = %3
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  br label %31

31:                                               ; preds = %29, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @filterPacket(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %26, %2
  %.01 = phi i32 [ 0, %2 ], [ %27, %26 ]
  %4 = load i32, ptr @ruleCount, align 4
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %28

6:                                                ; preds = %3
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Rule, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [16 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef %0) #5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %25

13:                                               ; preds = %6
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Rule, ptr %15, i32 0, i32 1
  %17 = getelementptr inbounds [16 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 @strcmp(ptr noundef %17, ptr noundef %1) #5
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %13
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Rule, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 4
  br label %29

25:                                               ; preds = %13, %6
  br label %26

26:                                               ; preds = %25
  %27 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !6

28:                                               ; preds = %3
  br label %29

29:                                               ; preds = %28, %20
  %.0 = phi i32 [ %24, %20 ], [ 1, %28 ]
  ret i32 %.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @listRules() #0 {
  %1 = load i32, ptr @ruleCount, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.22)
  br label %31

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.23)
  br label %7

7:                                                ; preds = %28, %5
  %.0 = phi i32 [ 0, %5 ], [ %29, %28 ]
  %8 = load i32, ptr @ruleCount, align 4
  %9 = icmp slt i32 %.0, %8
  br i1 %9, label %10, label %30

10:                                               ; preds = %7
  %11 = add nsw i32 %.0, 1
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Rule, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [16 x i8], ptr %14, i64 0, i64 0
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %16
  %18 = getelementptr inbounds %struct.Rule, ptr %17, i32 0, i32 1
  %19 = getelementptr inbounds [16 x i8], ptr %18, i64 0, i64 0
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [100 x %struct.Rule], ptr @rules, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Rule, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 4
  %24 = icmp ne i32 %23, 0
  %25 = zext i1 %24 to i64
  %26 = select i1 %24, ptr @.str.19, ptr @.str.20
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %11, ptr noundef %15, ptr noundef %19, ptr noundef %26)
  br label %28

28:                                               ; preds = %10
  %29 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !8

30:                                               ; preds = %7
  br label %31

31:                                               ; preds = %30, %3
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
