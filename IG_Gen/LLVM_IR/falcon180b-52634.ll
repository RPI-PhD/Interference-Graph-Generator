; ModuleID = 'DATASETv2/falcon180b-52634.c'
source_filename = "DATASETv2/falcon180b-52634.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@top = dso_local global i32 -1, align 4
@.str = private unnamed_addr constant [16 x i8] c"Stack overflow\0A\00", align 1
@stack = dso_local global [1000 x i32] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [17 x i8] c"Stack underflow\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Enter your choice:\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"1. Push\0A2. Pop\0A3. Display\0A4. Exit\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Enter the value to be pushed:\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"The popped value is %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"The stack elements are:\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"Exiting...\0A\00", align 1
@.str.11 = private unnamed_addr constant [16 x i8] c"Invalid choice\0A\00", align 1
@.str.12 = private unnamed_addr constant [33 x i8] c"Do you want to continue? (y/n): \00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c" %c\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @push(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr @top, align 4
  %4 = icmp eq i32 %3, 999
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #3
  unreachable

7:                                                ; preds = %1
  %8 = load i32, ptr %2, align 4
  %9 = load i32, ptr @top, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr @top, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [1000 x i32], ptr @stack, i64 0, i64 %11
  store i32 %8, ptr %12, align 4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @pop() #0 {
  %1 = load i32, ptr @top, align 4
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #3
  unreachable

5:                                                ; preds = %0
  %6 = load i32, ptr @top, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, ptr @top, align 4
  %8 = sext i32 %6 to i64
  %9 = getelementptr inbounds [1000 x i32], ptr @stack, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %44, %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %2)
  %9 = load i32, ptr %2, align 4
  switch i32 %9, label %31 [
    i32 1, label %10
    i32 2, label %14
    i32 3, label %18
    i32 4, label %29
  ]

10:                                               ; preds = %5
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %3)
  %13 = load i32, ptr %3, align 4
  call void @push(i32 noundef %13)
  br label %33

14:                                               ; preds = %5
  %15 = call i32 @pop()
  store i32 %15, ptr %3, align 4
  %16 = load i32, ptr %3, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %16)
  br label %33

18:                                               ; preds = %5
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %20

20:                                               ; preds = %23, %18
  %21 = load i32, ptr @top, align 4
  %22 = icmp sge i32 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20
  %24 = call i32 @pop()
  store i32 %24, ptr %3, align 4
  %25 = load i32, ptr %3, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %25)
  br label %20, !llvm.loop !6

27:                                               ; preds = %20
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %33

29:                                               ; preds = %5
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %33

31:                                               ; preds = %5
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %33

33:                                               ; preds = %31, %29, %27, %14, %10
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %35 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %4)
  br label %36

36:                                               ; preds = %33
  %37 = load i8, ptr %4, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %38, 121
  br i1 %39, label %44, label %40

40:                                               ; preds = %36
  %41 = load i8, ptr %4, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %42, 89
  br label %44

44:                                               ; preds = %40, %36
  %45 = phi i1 [ true, %36 ], [ %43, %40 ]
  br i1 %45, label %5, label %46, !llvm.loop !8

46:                                               ; preds = %44
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

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
