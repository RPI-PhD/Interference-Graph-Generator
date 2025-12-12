; ModuleID = 'DATASETv2/falcon180b-47297.c'
source_filename = "DATASETv2/falcon180b-47297.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"Enter the number of terms to generate: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [52 x i8] c"Error: Result is too large to be stored in an int.\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Fibonacci sequence:\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [100 x i32], align 16
  store i32 0, ptr %1, align 4
  %8 = call i64 @time(ptr noundef null) #4
  %9 = trunc i64 %8 to i32
  call void @srand(i32 noundef %9) #4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %12 = getelementptr inbounds [100 x i32], ptr %7, i64 0, i64 0
  store i32 0, ptr %12, align 16
  %13 = getelementptr inbounds [100 x i32], ptr %7, i64 0, i64 1
  store i32 1, ptr %13, align 4
  store i32 2, ptr %3, align 4
  br label %14

14:                                               ; preds = %55, %0
  %15 = load i32, ptr %3, align 4
  %16 = load i32, ptr %2, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %58

18:                                               ; preds = %14
  %19 = call i32 @rand() #4
  %20 = load i32, ptr %3, align 4
  %21 = sub nsw i32 %20, 1
  %22 = srem i32 %19, %21
  store i32 %22, ptr %4, align 4
  %23 = call i32 @rand() #4
  %24 = load i32, ptr %3, align 4
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %23, %25
  store i32 %26, ptr %5, align 4
  br label %27

27:                                               ; preds = %31, %18
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %4, align 4
  %30 = icmp eq i32 %28, %29
  br i1 %30, label %31, label %36

31:                                               ; preds = %27
  %32 = call i32 @rand() #4
  %33 = load i32, ptr %3, align 4
  %34 = sub nsw i32 %33, 1
  %35 = srem i32 %32, %34
  store i32 %35, ptr %5, align 4
  br label %27, !llvm.loop !6

36:                                               ; preds = %27
  %37 = load i32, ptr %4, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [100 x i32], ptr %7, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [100 x i32], ptr %7, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %40, %44
  store i32 %45, ptr %6, align 4
  %46 = load i32, ptr %6, align 4
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %36
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #5
  unreachable

50:                                               ; preds = %36
  %51 = load i32, ptr %6, align 4
  %52 = load i32, ptr %3, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [100 x i32], ptr %7, i64 0, i64 %53
  store i32 %51, ptr %54, align 4
  br label %55

55:                                               ; preds = %50
  %56 = load i32, ptr %3, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %3, align 4
  br label %14, !llvm.loop !8

58:                                               ; preds = %14
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %3, align 4
  br label %60

60:                                               ; preds = %70, %58
  %61 = load i32, ptr %3, align 4
  %62 = load i32, ptr %2, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %73

64:                                               ; preds = %60
  %65 = load i32, ptr %3, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [100 x i32], ptr %7, i64 0, i64 %66
  %68 = load i32, ptr %67, align 4
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %68)
  br label %70

70:                                               ; preds = %64
  %71 = load i32, ptr %3, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %3, align 4
  br label %60, !llvm.loop !9

73:                                               ; preds = %60
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
