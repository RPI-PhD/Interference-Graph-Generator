; ModuleID = 'LLVM_IR/falcon180b-47297.ll'
source_filename = "DATASETv2/falcon180b-47297.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"Enter the number of terms to generate: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [52 x i8] c"Error: Result is too large to be stored in an int.\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Fibonacci sequence:\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i32], align 16
  %3 = call i64 @time(ptr noundef null) #4
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1)
  %7 = getelementptr inbounds [100 x i32], ptr %2, i64 0, i64 0
  store i32 0, ptr %7, align 16
  %8 = getelementptr inbounds [100 x i32], ptr %2, i64 0, i64 1
  store i32 1, ptr %8, align 4
  br label %9

9:                                                ; preds = %39, %0
  %.01 = phi i32 [ 2, %0 ], [ %40, %39 ]
  %10 = load i32, ptr %1, align 4
  %11 = icmp slt i32 %.01, %10
  br i1 %11, label %12, label %41

12:                                               ; preds = %9
  %13 = call i32 @rand() #4
  %14 = sub nsw i32 %.01, 1
  %15 = srem i32 %13, %14
  %16 = call i32 @rand() #4
  %17 = sub nsw i32 %.01, 1
  %18 = srem i32 %16, %17
  br label %19

19:                                               ; preds = %21, %12
  %.0 = phi i32 [ %18, %12 ], [ %24, %21 ]
  %20 = icmp eq i32 %.0, %15
  br i1 %20, label %21, label %25

21:                                               ; preds = %19
  %22 = call i32 @rand() #4
  %23 = sub nsw i32 %.01, 1
  %24 = srem i32 %22, %23
  br label %19, !llvm.loop !6

25:                                               ; preds = %19
  %26 = sext i32 %15 to i64
  %27 = getelementptr inbounds [100 x i32], ptr %2, i64 0, i64 %26
  %28 = load i32, ptr %27, align 4
  %29 = sext i32 %.0 to i64
  %30 = getelementptr inbounds [100 x i32], ptr %2, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = add nsw i32 %28, %31
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %25
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #5
  unreachable

36:                                               ; preds = %25
  %37 = sext i32 %.01 to i64
  %38 = getelementptr inbounds [100 x i32], ptr %2, i64 0, i64 %37
  store i32 %32, ptr %38, align 4
  br label %39

39:                                               ; preds = %36
  %40 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !8

41:                                               ; preds = %9
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %43

43:                                               ; preds = %51, %41
  %.1 = phi i32 [ 0, %41 ], [ %52, %51 ]
  %44 = load i32, ptr %1, align 4
  %45 = icmp slt i32 %.1, %44
  br i1 %45, label %46, label %53

46:                                               ; preds = %43
  %47 = sext i32 %.1 to i64
  %48 = getelementptr inbounds [100 x i32], ptr %2, i64 0, i64 %47
  %49 = load i32, ptr %48, align 4
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %49)
  br label %51

51:                                               ; preds = %46
  %52 = add nsw i32 %.1, 1
  br label %43, !llvm.loop !9

53:                                               ; preds = %43
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
