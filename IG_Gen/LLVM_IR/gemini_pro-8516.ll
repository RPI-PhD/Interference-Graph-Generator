; ModuleID = 'DATASETv2/gemini_pro-8516.c'
source_filename = "DATASETv2/gemini_pro-8516.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.election = type { [10 x %struct.candidate], i32, [100 x %struct.voter], i32 }
%struct.candidate = type { [100 x i8], i32 }
%struct.voter = type { [100 x i8], i32 }

@.str = private unnamed_addr constant [19 x i8] c"Election Results:\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"%s: %d votes\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Enter your name: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.4 = private unnamed_addr constant [55 x i8] c"Enter the name of the candidate you want to vote for: \00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"You have already voted.\0A\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"Alice\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"Bob\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Charlie\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"John\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"Mary\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"Tom\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_election() #0 {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 11448) #5
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.election, ptr %3, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr inbounds %struct.election, ptr %5, i32 0, i32 3
  store i32 0, ptr %6, align 4
  %7 = load ptr, ptr %1, align 8
  ret ptr %7
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_candidate(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.election, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.election, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x %struct.candidate], ptr %6, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.candidate, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %14 = load ptr, ptr %4, align 8
  %15 = call ptr @strcpy(ptr noundef %13, ptr noundef %14) #6
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.election, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.election, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10 x %struct.candidate], ptr %17, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.candidate, ptr %22, i32 0, i32 1
  store i32 0, ptr %23, align 4
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.election, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %25, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_voter(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.election, ptr %5, i32 0, i32 2
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.election, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.voter], ptr %6, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.voter, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %14 = load ptr, ptr %4, align 8
  %15 = call ptr @strcpy(ptr noundef %13, ptr noundef %14) #6
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.election, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.election, ptr %18, i32 0, i32 3
  %20 = load i32, ptr %19, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [100 x %struct.voter], ptr %17, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.voter, ptr %22, i32 0, i32 1
  store i32 0, ptr %23, align 4
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.election, ptr %24, i32 0, i32 3
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %25, align 4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @vote(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %65, %3
  %10 = load i32, ptr %7, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.election, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %68

15:                                               ; preds = %9
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.election, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %7, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x %struct.candidate], ptr %17, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.candidate, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds [100 x i8], ptr %21, i64 0, i64 0
  %23 = load ptr, ptr %6, align 8
  %24 = call i32 @strcmp(ptr noundef %22, ptr noundef %23) #7
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %64

26:                                               ; preds = %15
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.election, ptr %27, i32 0, i32 0
  %29 = load i32, ptr %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x %struct.candidate], ptr %28, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.candidate, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %32, align 4
  store i32 0, ptr %8, align 4
  br label %35

35:                                               ; preds = %60, %26
  %36 = load i32, ptr %8, align 4
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.election, ptr %37, i32 0, i32 3
  %39 = load i32, ptr %38, align 4
  %40 = icmp slt i32 %36, %39
  br i1 %40, label %41, label %63

41:                                               ; preds = %35
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.election, ptr %42, i32 0, i32 2
  %44 = load i32, ptr %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x %struct.voter], ptr %43, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.voter, ptr %46, i32 0, i32 0
  %48 = getelementptr inbounds [100 x i8], ptr %47, i64 0, i64 0
  %49 = load ptr, ptr %5, align 8
  %50 = call i32 @strcmp(ptr noundef %48, ptr noundef %49) #7
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %59

52:                                               ; preds = %41
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.election, ptr %53, i32 0, i32 2
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [100 x %struct.voter], ptr %54, i64 0, i64 %56
  %58 = getelementptr inbounds %struct.voter, ptr %57, i32 0, i32 1
  store i32 1, ptr %58, align 4
  br label %63

59:                                               ; preds = %41
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %8, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %8, align 4
  br label %35, !llvm.loop !6

63:                                               ; preds = %52, %35
  br label %68

64:                                               ; preds = %15
  br label %65

65:                                               ; preds = %64
  %66 = load i32, ptr %7, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %7, align 4
  br label %9, !llvm.loop !8

68:                                               ; preds = %63, %9
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_results(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %27, %1
  %6 = load i32, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.election, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %30

11:                                               ; preds = %5
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.election, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x %struct.candidate], ptr %13, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.candidate, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [100 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.election, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %3, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [10 x %struct.candidate], ptr %20, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.candidate, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %18, i32 noundef %25)
  br label %27

27:                                               ; preds = %11
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  br label %5, !llvm.loop !9

30:                                               ; preds = %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @run_election(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i8], align 16
  %4 = alloca [100 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %8 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %8)
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %36, %1
  %11 = load i32, ptr %6, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.election, ptr %12, i32 0, i32 3
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %39

16:                                               ; preds = %10
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.election, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.voter], ptr %18, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.voter, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [100 x i8], ptr %22, i64 0, i64 0
  %24 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %25 = call i32 @strcmp(ptr noundef %23, ptr noundef %24) #7
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %35

27:                                               ; preds = %16
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.election, ptr %28, i32 0, i32 2
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x %struct.voter], ptr %29, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.voter, ptr %32, i32 0, i32 1
  %34 = load i32, ptr %33, align 4
  store i32 %34, ptr %5, align 4
  br label %39

35:                                               ; preds = %16
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %10, !llvm.loop !10

39:                                               ; preds = %27, %10
  %40 = load i32, ptr %5, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %49, label %42

42:                                               ; preds = %39
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %44 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %45 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %44)
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %48 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  call void @vote(ptr noundef %46, ptr noundef %47, ptr noundef %48)
  br label %51

49:                                               ; preds = %39
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %51

51:                                               ; preds = %49, %42
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds %struct.election, ptr %52, i32 0, i32 3
  %54 = load i32, ptr %53, align 4
  %55 = icmp sgt i32 %54, 0
  br i1 %55, label %56, label %58

56:                                               ; preds = %51
  %57 = load ptr, ptr %2, align 8
  call void @run_election(ptr noundef %57)
  br label %60

58:                                               ; preds = %51
  %59 = load ptr, ptr %2, align 8
  call void @print_results(ptr noundef %59)
  br label %60

60:                                               ; preds = %58, %56
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call ptr @create_election()
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  call void @add_candidate(ptr noundef %4, ptr noundef @.str.6)
  %5 = load ptr, ptr %2, align 8
  call void @add_candidate(ptr noundef %5, ptr noundef @.str.7)
  %6 = load ptr, ptr %2, align 8
  call void @add_candidate(ptr noundef %6, ptr noundef @.str.8)
  %7 = load ptr, ptr %2, align 8
  call void @add_voter(ptr noundef %7, ptr noundef @.str.9)
  %8 = load ptr, ptr %2, align 8
  call void @add_voter(ptr noundef %8, ptr noundef @.str.10)
  %9 = load ptr, ptr %2, align 8
  call void @add_voter(ptr noundef %9, ptr noundef @.str.11)
  %10 = load ptr, ptr %2, align 8
  call void @run_election(ptr noundef %10)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(read) }

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
