; ModuleID = 'DATASETv2/gpt35-74107.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @SleepyThread(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.ThreadData, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.ThreadData, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %7, i32 noundef %10)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.ThreadData, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = call i32 @sleep(i32 noundef %14)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.ThreadData, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.ThreadData, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %18, i32 noundef %21)
  call void @pthread_exit(ptr noundef null) #5
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @sleep(i32 noundef) #1

; Function Attrs: noreturn
declare void @pthread_exit(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i64], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [5 x %struct.ThreadData], align 16
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %22, %0
  %7 = load i32, ptr %4, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %25

9:                                                ; preds = %6
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5 x %struct.ThreadData], ptr %5, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.ThreadData, ptr %13, i32 0, i32 0
  store i32 %10, ptr %14, align 8
  %15 = call i32 @rand() #6
  %16 = srem i32 %15, 10
  %17 = add nsw i32 %16, 1
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [5 x %struct.ThreadData], ptr %5, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.ThreadData, ptr %20, i32 0, i32 1
  store i32 %17, ptr %21, align 4
  br label %22

22:                                               ; preds = %9
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %6, !llvm.loop !6

25:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %26

26:                                               ; preds = %45, %25
  %27 = load i32, ptr %4, align 4
  %28 = icmp slt i32 %27, 5
  br i1 %28, label %29, label %48

29:                                               ; preds = %26
  %30 = load i32, ptr %4, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %30)
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [5 x i64], ptr %2, i64 0, i64 %33
  %35 = load i32, ptr %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [5 x %struct.ThreadData], ptr %5, i64 0, i64 %36
  %38 = call i32 @pthread_create(ptr noundef %34, ptr noundef null, ptr noundef @SleepyThread, ptr noundef %37) #6
  store i32 %38, ptr %3, align 4
  %39 = load i32, ptr %3, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %29
  %42 = load i32, ptr %3, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %42)
  call void @exit(i32 noundef -1) #7
  unreachable

44:                                               ; preds = %29
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %4, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %4, align 4
  br label %26, !llvm.loop !8

48:                                               ; preds = %26
  store i32 0, ptr %4, align 4
  br label %49

49:                                               ; preds = %60, %48
  %50 = load i32, ptr %4, align 4
  %51 = icmp slt i32 %50, 5
  br i1 %51, label %52, label %63

52:                                               ; preds = %49
  %53 = load i32, ptr %4, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [5 x i64], ptr %2, i64 0, i64 %54
  %56 = load i64, ptr %55, align 8
  %57 = call i32 @pthread_join(i64 noundef %56, ptr noundef null)
  %58 = load i32, ptr %4, align 4
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %58)
  br label %60

60:                                               ; preds = %52
  %61 = load i32, ptr %4, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %4, align 4
  br label %49, !llvm.loop !9

63:                                               ; preds = %49
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
