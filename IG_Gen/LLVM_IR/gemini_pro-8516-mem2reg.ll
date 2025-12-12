; ModuleID = 'LLVM_IR/gemini_pro-8516.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_election() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 11448) #5
  %2 = getelementptr inbounds %struct.election, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds %struct.election, ptr %1, i32 0, i32 3
  store i32 0, ptr %3, align 4
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_candidate(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [10 x %struct.candidate], ptr %3, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.candidate, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [100 x i8], ptr %8, i64 0, i64 0
  %10 = call ptr @strcpy(ptr noundef %9, ptr noundef %1) #6
  %11 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 0
  %12 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x %struct.candidate], ptr %11, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.candidate, ptr %15, i32 0, i32 1
  store i32 0, ptr %16, align 4
  %17 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_voter(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 2
  %4 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 3
  %5 = load i32, ptr %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [100 x %struct.voter], ptr %3, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.voter, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [100 x i8], ptr %8, i64 0, i64 0
  %10 = call ptr @strcpy(ptr noundef %9, ptr noundef %1) #6
  %11 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 2
  %12 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.voter], ptr %11, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.voter, ptr %15, i32 0, i32 1
  store i32 0, ptr %16, align 4
  %17 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 3
  %18 = load i32, ptr %17, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %17, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @vote(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %45, %3
  %.01 = phi i32 [ 0, %3 ], [ %46, %45 ]
  %5 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %.01, %6
  br i1 %7, label %8, label %47

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 0
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [10 x %struct.candidate], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.candidate, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 @strcmp(ptr noundef %13, ptr noundef %2) #7
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %44

16:                                               ; preds = %8
  %17 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 0
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [10 x %struct.candidate], ptr %17, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.candidate, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %20, align 4
  br label %23

23:                                               ; preds = %41, %16
  %.0 = phi i32 [ 0, %16 ], [ %42, %41 ]
  %24 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 3
  %25 = load i32, ptr %24, align 4
  %26 = icmp slt i32 %.0, %25
  br i1 %26, label %27, label %43

27:                                               ; preds = %23
  %28 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 2
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds [100 x %struct.voter], ptr %28, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.voter, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds [100 x i8], ptr %31, i64 0, i64 0
  %33 = call i32 @strcmp(ptr noundef %32, ptr noundef %1) #7
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %40

35:                                               ; preds = %27
  %36 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 2
  %37 = sext i32 %.0 to i64
  %38 = getelementptr inbounds [100 x %struct.voter], ptr %36, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.voter, ptr %38, i32 0, i32 1
  store i32 1, ptr %39, align 4
  br label %43

40:                                               ; preds = %27
  br label %41

41:                                               ; preds = %40
  %42 = add nsw i32 %.0, 1
  br label %23, !llvm.loop !6

43:                                               ; preds = %35, %23
  br label %47

44:                                               ; preds = %8
  br label %45

45:                                               ; preds = %44
  %46 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

47:                                               ; preds = %43, %4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_results(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %3

3:                                                ; preds = %19, %1
  %.0 = phi i32 [ 0, %1 ], [ %20, %19 ]
  %4 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.0, %5
  br i1 %6, label %7, label %21

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 0
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [10 x %struct.candidate], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.candidate, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [100 x i8], ptr %11, i64 0, i64 0
  %13 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 0
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [10 x %struct.candidate], ptr %13, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.candidate, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %12, i32 noundef %17)
  br label %19

19:                                               ; preds = %7
  %20 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

21:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @run_election(ptr noundef %0) #0 {
  %2 = alloca [100 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %5 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %5)
  br label %7

7:                                                ; preds = %27, %1
  %.0 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %8 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 3
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %.0, %9
  br i1 %10, label %11, label %29

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 2
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [100 x %struct.voter], ptr %12, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.voter, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [100 x i8], ptr %15, i64 0, i64 0
  %17 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %18 = call i32 @strcmp(ptr noundef %16, ptr noundef %17) #7
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %11
  %21 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 2
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds [100 x %struct.voter], ptr %21, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.voter, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  br label %29

26:                                               ; preds = %11
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !10

29:                                               ; preds = %20, %7
  %.01 = phi i32 [ %25, %20 ], [ undef, %7 ]
  %30 = icmp ne i32 %.01, 0
  br i1 %30, label %37, label %31

31:                                               ; preds = %29
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %33 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %34 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %33)
  %35 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %36 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @vote(ptr noundef %0, ptr noundef %35, ptr noundef %36)
  br label %39

37:                                               ; preds = %29
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %39

39:                                               ; preds = %37, %31
  %40 = getelementptr inbounds %struct.election, ptr %0, i32 0, i32 3
  %41 = load i32, ptr %40, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %39
  call void @run_election(ptr noundef %0)
  br label %45

44:                                               ; preds = %39
  call void @print_results(ptr noundef %0)
  br label %45

45:                                               ; preds = %44, %43
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_election()
  call void @add_candidate(ptr noundef %1, ptr noundef @.str.6)
  call void @add_candidate(ptr noundef %1, ptr noundef @.str.7)
  call void @add_candidate(ptr noundef %1, ptr noundef @.str.8)
  call void @add_voter(ptr noundef %1, ptr noundef @.str.9)
  call void @add_voter(ptr noundef %1, ptr noundef @.str.10)
  call void @add_voter(ptr noundef %1, ptr noundef @.str.11)
  call void @run_election(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
