; ModuleID = 'LLVM_IR/gpt35-74107.ll'
source_filename = "DATASETv2/gpt35-74107.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ThreadData = type { i32, i32 }

@.str = private unnamed_addr constant [45 x i8] c"Thread %d is going to sleep for %d seconds.\0A\00", align 1
@.str.1 = private unnamed_addr constant [55 x i8] c"Thread %d has woken up after sleeping for %d seconds.\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Creating thread %d.\0A\00", align 1
@.str.3 = private unnamed_addr constant [48 x i8] c"ERROR; return code from pthread_create() is %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"Thread %d has finished.\0A\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"All threads have finished.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @SleepyThread(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 4
  %4 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3, i32 noundef %5)
  %7 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = call i32 @sleep(i32 noundef %8)
  %10 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 0
  %11 = load i32, ptr %10, align 4
  %12 = getelementptr inbounds %struct.ThreadData, ptr %0, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %11, i32 noundef %13)
  call void @pthread_exit(ptr noundef null) #5
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @sleep(i32 noundef) #1

; Function Attrs: noreturn
declare void @pthread_exit(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x i64], align 16
  %2 = alloca [5 x %struct.ThreadData], align 16
  br label %3

3:                                                ; preds = %15, %0
  %.0 = phi i32 [ 0, %0 ], [ %16, %15 ]
  %4 = icmp slt i32 %.0, 5
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [5 x %struct.ThreadData], ptr %2, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.ThreadData, ptr %7, i32 0, i32 0
  store i32 %.0, ptr %8, align 8
  %9 = call i32 @rand() #6
  %10 = srem i32 %9, 10
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [5 x %struct.ThreadData], ptr %2, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.ThreadData, ptr %13, i32 0, i32 1
  store i32 %11, ptr %14, align 4
  br label %15

15:                                               ; preds = %5
  %16 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

17:                                               ; preds = %3
  br label %18

18:                                               ; preds = %31, %17
  %.1 = phi i32 [ 0, %17 ], [ %32, %31 ]
  %19 = icmp slt i32 %.1, 5
  br i1 %19, label %20, label %33

20:                                               ; preds = %18
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %.1)
  %22 = sext i32 %.1 to i64
  %23 = getelementptr inbounds [5 x i64], ptr %1, i64 0, i64 %22
  %24 = sext i32 %.1 to i64
  %25 = getelementptr inbounds [5 x %struct.ThreadData], ptr %2, i64 0, i64 %24
  %26 = call i32 @pthread_create(ptr noundef %23, ptr noundef null, ptr noundef @SleepyThread, ptr noundef %25) #6
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %20
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %26)
  call void @exit(i32 noundef -1) #7
  unreachable

30:                                               ; preds = %20
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.1, 1
  br label %18, !llvm.loop !8

33:                                               ; preds = %18
  br label %34

34:                                               ; preds = %42, %33
  %.2 = phi i32 [ 0, %33 ], [ %43, %42 ]
  %35 = icmp slt i32 %.2, 5
  br i1 %35, label %36, label %44

36:                                               ; preds = %34
  %37 = sext i32 %.2 to i64
  %38 = getelementptr inbounds [5 x i64], ptr %1, i64 0, i64 %37
  %39 = load i64, ptr %38, align 8
  %40 = call i32 @pthread_join(i64 noundef %39, ptr noundef null)
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %.2)
  br label %42

42:                                               ; preds = %36
  %43 = add nsw i32 %.2, 1
  br label %34, !llvm.loop !9

44:                                               ; preds = %34
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  call void @pthread_exit(ptr noundef null) #5
  unreachable
}

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare i32 @pthread_join(i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { nounwind }
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
