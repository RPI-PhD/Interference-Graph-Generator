; ModuleID = 'LLVM_IR/gpt35-49656.ll'
source_filename = "DATASETv2/gpt35-49656.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"January\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"February\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"March\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"April\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"May\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"June\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"July\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"August\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"September\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"October\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"November\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"December\00", align 1
@MONTHS = dso_local global [12 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11], align 16
@.str.12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c"%02d/%02d/%04d\00", align 1
@.str.15 = private unnamed_addr constant [40 x i8] c"Enter a date in the format DD/MM/YYYY: \00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.17 = private unnamed_addr constant [34 x i8] c"Enter the number of days to add: \00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.19 = private unnamed_addr constant [20 x i8] c"The new date is %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isLeapYear(i32 noundef %0) #0 {
  %2 = srem i32 %0, 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %13

4:                                                ; preds = %1
  %5 = srem i32 %0, 100
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %4
  %8 = srem i32 %0, 400
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %14

11:                                               ; preds = %7
  br label %14

12:                                               ; preds = %4
  br label %14

13:                                               ; preds = %1
  br label %14

14:                                               ; preds = %13, %12, %11, %10
  %.0 = phi i32 [ 1, %10 ], [ 0, %11 ], [ 1, %12 ], [ 0, %13 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getMonthNumber(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %13, %1
  %.01 = phi i32 [ 0, %1 ], [ %14, %13 ]
  %3 = icmp slt i32 %.01, 12
  br i1 %3, label %4, label %15

4:                                                ; preds = %2
  %5 = sext i32 %.01 to i64
  %6 = getelementptr inbounds [12 x ptr], ptr @MONTHS, i64 0, i64 %5
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 @strcmp(ptr noundef %0, ptr noundef %7) #5
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %4
  %11 = add nsw i32 %.01, 1
  br label %16

12:                                               ; preds = %4
  br label %13

13:                                               ; preds = %12
  %14 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !6

15:                                               ; preds = %2
  br label %16

16:                                               ; preds = %15, %10
  %.0 = phi i32 [ %11, %10 ], [ -1, %15 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @getMonthName(i32 noundef %0) #0 {
  %2 = icmp slt i32 %0, 1
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = icmp sgt i32 %0, 12
  br i1 %4, label %5, label %6

5:                                                ; preds = %3, %1
  br label %11

6:                                                ; preds = %3
  %7 = sub nsw i32 %0, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [12 x ptr], ptr @MONTHS, i64 0, i64 %8
  %10 = load ptr, ptr %9, align 8
  br label %11

11:                                               ; preds = %6, %5
  %.0 = phi ptr [ @.str.12, %5 ], [ %10, %6 ]
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @convertDate(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = call ptr @strtok(ptr noundef %0, ptr noundef @.str.13) #6
  br label %6

6:                                                ; preds = %22, %4
  %.01 = phi ptr [ %5, %4 ], [ %23, %22 ]
  %.0 = phi i32 [ 0, %4 ], [ %24, %22 ]
  %7 = icmp ne ptr %.01, null
  br i1 %7, label %8, label %25

8:                                                ; preds = %6
  %9 = icmp eq i32 %.0, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %8
  %11 = call i32 @atoi(ptr noundef %.01) #5
  store i32 %11, ptr %1, align 4
  br label %22

12:                                               ; preds = %8
  %13 = icmp eq i32 %.0, 1
  br i1 %13, label %14, label %16

14:                                               ; preds = %12
  %15 = call i32 @atoi(ptr noundef %.01) #5
  store i32 %15, ptr %2, align 4
  br label %21

16:                                               ; preds = %12
  %17 = icmp eq i32 %.0, 2
  br i1 %17, label %18, label %20

18:                                               ; preds = %16
  %19 = call i32 @atoi(ptr noundef %.01) #5
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %18, %16
  br label %21

21:                                               ; preds = %20, %14
  br label %22

22:                                               ; preds = %21, %10
  %23 = call ptr @strtok(ptr noundef null, ptr noundef @.str.13) #6
  %24 = add nsw i32 %.0, 1
  br label %6, !llvm.loop !8

25:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @convertDateToString(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 11) #7
  %5 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %4, ptr noundef @.str.14, i32 noundef %0, i32 noundef %1, i32 noundef %2) #6
  ret ptr %4
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @addDays(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  call void @convertDate(ptr noundef %0, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %6, 4
  br i1 %7, label %17, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp eq i32 %9, 6
  br i1 %10, label %17, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = icmp eq i32 %12, 9
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %4, align 4
  %16 = icmp eq i32 %15, 11
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %11, %8, %2
  br label %29

18:                                               ; preds = %14
  %19 = load i32, ptr %4, align 4
  %20 = icmp eq i32 %19, 2
  br i1 %20, label %21, label %28

21:                                               ; preds = %18
  %22 = load i32, ptr %5, align 4
  %23 = call i32 @isLeapYear(i32 noundef %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %21
  br label %27

26:                                               ; preds = %21
  br label %27

27:                                               ; preds = %26, %25
  %.01 = phi i32 [ 29, %25 ], [ 28, %26 ]
  br label %28

28:                                               ; preds = %27, %18
  %.1 = phi i32 [ %.01, %27 ], [ 31, %18 ]
  br label %29

29:                                               ; preds = %28, %17
  %.2 = phi i32 [ 30, %17 ], [ %.1, %28 ]
  br label %30

30:                                               ; preds = %73, %29
  %.3 = phi i32 [ %.2, %29 ], [ %.7, %73 ]
  %.0 = phi i32 [ 0, %29 ], [ %74, %73 ]
  %31 = icmp slt i32 %.0, %1
  br i1 %31, label %32, label %75

32:                                               ; preds = %30
  %33 = load i32, ptr %3, align 4
  %34 = icmp slt i32 %33, %.3
  br i1 %34, label %35, label %38

35:                                               ; preds = %32
  %36 = load i32, ptr %3, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %3, align 4
  br label %72

38:                                               ; preds = %32
  store i32 1, ptr %3, align 4
  %39 = load i32, ptr %4, align 4
  %40 = icmp slt i32 %39, 12
  br i1 %40, label %41, label %44

41:                                               ; preds = %38
  %42 = load i32, ptr %4, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %4, align 4
  br label %47

44:                                               ; preds = %38
  store i32 1, ptr %4, align 4
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %5, align 4
  br label %47

47:                                               ; preds = %44, %41
  %48 = load i32, ptr %4, align 4
  %49 = icmp eq i32 %48, 4
  br i1 %49, label %59, label %50

50:                                               ; preds = %47
  %51 = load i32, ptr %4, align 4
  %52 = icmp eq i32 %51, 6
  br i1 %52, label %59, label %53

53:                                               ; preds = %50
  %54 = load i32, ptr %4, align 4
  %55 = icmp eq i32 %54, 9
  br i1 %55, label %59, label %56

56:                                               ; preds = %53
  %57 = load i32, ptr %4, align 4
  %58 = icmp eq i32 %57, 11
  br i1 %58, label %59, label %60

59:                                               ; preds = %56, %53, %50, %47
  br label %71

60:                                               ; preds = %56
  %61 = load i32, ptr %4, align 4
  %62 = icmp eq i32 %61, 2
  br i1 %62, label %63, label %70

63:                                               ; preds = %60
  %64 = load i32, ptr %5, align 4
  %65 = call i32 @isLeapYear(i32 noundef %64)
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %63
  br label %69

68:                                               ; preds = %63
  br label %69

69:                                               ; preds = %68, %67
  %.4 = phi i32 [ 29, %67 ], [ 28, %68 ]
  br label %70

70:                                               ; preds = %69, %60
  %.5 = phi i32 [ %.4, %69 ], [ 31, %60 ]
  br label %71

71:                                               ; preds = %70, %59
  %.6 = phi i32 [ 30, %59 ], [ %.5, %70 ]
  br label %72

72:                                               ; preds = %71, %35
  %.7 = phi i32 [ %.3, %35 ], [ %.6, %71 ]
  br label %73

73:                                               ; preds = %72
  %74 = add nsw i32 %.0, 1
  br label %30, !llvm.loop !9

75:                                               ; preds = %30
  %76 = load i32, ptr %3, align 4
  %77 = load i32, ptr %4, align 4
  %78 = load i32, ptr %5, align 4
  %79 = call ptr @convertDateToString(i32 noundef %76, i32 noundef %77, i32 noundef %78)
  ret ptr %79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [15 x i8], align 1
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %4 = getelementptr inbounds [15 x i8], ptr %1, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.18, ptr noundef %2)
  %8 = getelementptr inbounds [15 x i8], ptr %1, i64 0, i64 0
  %9 = load i32, ptr %2, align 4
  %10 = call ptr @addDays(ptr noundef %8, i32 noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.19, ptr noundef %10)
  call void @free(ptr noundef %10) #6
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #4

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind }
attributes #7 = { nounwind allocsize(0) }

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
