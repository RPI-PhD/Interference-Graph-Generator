; ModuleID = 'LLVM_IR/gpt35-56475.ll'
source_filename = "DATASETv2/gpt35-56475.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"Error creating addition thread\00", align 1
@.str.1 = private unnamed_addr constant [34 x i8] c"Error creating subtraction thread\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"Error joining addition thread\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"Error joining subtraction thread\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Threads finished execution\0A\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Addition result: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"Subtraction result: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 10, ptr %3, align 4
  store i32 5, ptr %4, align 4
  %5 = call i32 @pthread_create(ptr noundef %1, ptr noundef null, ptr noundef @addition, ptr noundef %3) #6
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  call void @perror(ptr noundef @.str) #7
  call void @exit(i32 noundef 1) #8
  unreachable

8:                                                ; preds = %0
  %9 = call i32 @pthread_create(ptr noundef %2, ptr noundef null, ptr noundef @subtraction, ptr noundef %4) #6
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

12:                                               ; preds = %8
  %13 = load i64, ptr %1, align 8
  %14 = call i32 @pthread_join(i64 noundef %13, ptr noundef null)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  call void @perror(ptr noundef @.str.2) #7
  call void @exit(i32 noundef 1) #8
  unreachable

17:                                               ; preds = %12
  %18 = load i64, ptr %2, align 8
  %19 = call i32 @pthread_join(i64 noundef %18, ptr noundef null)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  call void @perror(ptr noundef @.str.3) #7
  call void @exit(i32 noundef 1) #8
  unreachable

22:                                               ; preds = %17
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @addition(ptr noundef %0) #0 {
  %2 = load i32, ptr %0, align 4
  br label %3

3:                                                ; preds = %7, %1
  %.01 = phi i32 [ 0, %1 ], [ %6, %7 ]
  %.0 = phi i32 [ 1, %1 ], [ %8, %7 ]
  %4 = icmp sle i32 %.0, %2
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %6 = add nsw i32 %.01, %.0
  br label %7

7:                                                ; preds = %5
  %8 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

9:                                                ; preds = %3
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.01)
  call void @pthread_exit(ptr noundef null) #9
  unreachable
}

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @subtraction(ptr noundef %0) #0 {
  %2 = load i32, ptr %0, align 4
  br label %3

3:                                                ; preds = %7, %1
  %.01 = phi i32 [ 20, %1 ], [ %6, %7 ]
  %.0 = phi i32 [ 1, %1 ], [ %8, %7 ]
  %4 = icmp sle i32 %.0, %2
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %6 = sub nsw i32 %.01, %.0
  br label %7

7:                                                ; preds = %5
  %8 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

9:                                                ; preds = %3
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %.01)
  call void @pthread_exit(ptr noundef null) #9
  unreachable
}

declare i32 @pthread_join(i64 noundef, ptr noundef) #4

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noreturn
declare void @pthread_exit(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { noreturn }

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
