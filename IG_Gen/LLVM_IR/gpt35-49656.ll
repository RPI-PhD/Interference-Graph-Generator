; ModuleID = 'DATASETv2/gpt35-49656.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @isLeapYear(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = srem i32 %4, 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %18

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = srem i32 %8, 100
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %17

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = srem i32 %12, 400
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  store i32 1, ptr %2, align 4
  br label %19

16:                                               ; preds = %11
  store i32 0, ptr %2, align 4
  br label %19

17:                                               ; preds = %7
  store i32 1, ptr %2, align 4
  br label %19

18:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %16, %15
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @getMonthNumber(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %20, %1
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 12
  br i1 %7, label %8, label %23

8:                                                ; preds = %5
  %9 = load ptr, ptr %3, align 8
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [12 x ptr], ptr @MONTHS, i64 0, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @strcmp(ptr noundef %9, ptr noundef %13) #5
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %8
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %2, align 4
  br label %24

19:                                               ; preds = %8
  br label %20

20:                                               ; preds = %19
  %21 = load i32, ptr %4, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %4, align 4
  br label %5, !llvm.loop !6

23:                                               ; preds = %5
  store i32 -1, ptr %2, align 4
  br label %24

24:                                               ; preds = %23, %16
  %25 = load i32, ptr %2, align 4
  ret i32 %25
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @getMonthName(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 1
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 12
  br i1 %8, label %9, label %10

9:                                                ; preds = %6, %1
  store ptr @.str.12, ptr %2, align 8
  br label %16

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = sub nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [12 x ptr], ptr @MONTHS, i64 0, i64 %13
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %2, align 8
  br label %16

16:                                               ; preds = %10, %9
  %17 = load ptr, ptr %2, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @convertDate(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = call ptr @strtok(ptr noundef %11, ptr noundef @.str.13) #6
  store ptr %12, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %13

13:                                               ; preds = %39, %4
  %14 = load ptr, ptr %9, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %43

16:                                               ; preds = %13
  %17 = load i32, ptr %10, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

19:                                               ; preds = %16
  %20 = load ptr, ptr %9, align 8
  %21 = call i32 @atoi(ptr noundef %20) #5
  %22 = load ptr, ptr %6, align 8
  store i32 %21, ptr %22, align 4
  br label %39

23:                                               ; preds = %16
  %24 = load i32, ptr %10, align 4
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %26, label %30

26:                                               ; preds = %23
  %27 = load ptr, ptr %9, align 8
  %28 = call i32 @atoi(ptr noundef %27) #5
  %29 = load ptr, ptr %7, align 8
  store i32 %28, ptr %29, align 4
  br label %38

30:                                               ; preds = %23
  %31 = load i32, ptr %10, align 4
  %32 = icmp eq i32 %31, 2
  br i1 %32, label %33, label %37

33:                                               ; preds = %30
  %34 = load ptr, ptr %9, align 8
  %35 = call i32 @atoi(ptr noundef %34) #5
  %36 = load ptr, ptr %8, align 8
  store i32 %35, ptr %36, align 4
  br label %37

37:                                               ; preds = %33, %30
  br label %38

38:                                               ; preds = %37, %26
  br label %39

39:                                               ; preds = %38, %19
  %40 = call ptr @strtok(ptr noundef null, ptr noundef @.str.13) #6
  store ptr %40, ptr %9, align 8
  %41 = load i32, ptr %10, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %10, align 4
  br label %13, !llvm.loop !8

43:                                               ; preds = %13
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @convertDateToString(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = call noalias ptr @malloc(i64 noundef 11) #7
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = load i32, ptr %4, align 4
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %9, ptr noundef @.str.14, i32 noundef %10, i32 noundef %11, i32 noundef %12) #6
  %14 = load ptr, ptr %7, align 8
  ret ptr %14
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @addDays(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %10 = load ptr, ptr %3, align 8
  call void @convertDate(ptr noundef %10, ptr noundef %5, ptr noundef %6, ptr noundef %7)
  store i32 31, ptr %8, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp eq i32 %11, 4
  br i1 %12, label %22, label %13

13:                                               ; preds = %2
  %14 = load i32, ptr %6, align 4
  %15 = icmp eq i32 %14, 6
  br i1 %15, label %22, label %16

16:                                               ; preds = %13
  %17 = load i32, ptr %6, align 4
  %18 = icmp eq i32 %17, 9
  br i1 %18, label %22, label %19

19:                                               ; preds = %16
  %20 = load i32, ptr %6, align 4
  %21 = icmp eq i32 %20, 11
  br i1 %21, label %22, label %23

22:                                               ; preds = %19, %16, %13, %2
  store i32 30, ptr %8, align 4
  br label %34

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %33

26:                                               ; preds = %23
  %27 = load i32, ptr %7, align 4
  %28 = call i32 @isLeapYear(i32 noundef %27)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %26
  store i32 29, ptr %8, align 4
  br label %32

31:                                               ; preds = %26
  store i32 28, ptr %8, align 4
  br label %32

32:                                               ; preds = %31, %30
  br label %33

33:                                               ; preds = %32, %23
  br label %34

34:                                               ; preds = %33, %22
  store i32 0, ptr %9, align 4
  br label %35

35:                                               ; preds = %81, %34
  %36 = load i32, ptr %9, align 4
  %37 = load i32, ptr %4, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %84

39:                                               ; preds = %35
  %40 = load i32, ptr %5, align 4
  %41 = load i32, ptr %8, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = load i32, ptr %5, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %5, align 4
  br label %80

46:                                               ; preds = %39
  store i32 1, ptr %5, align 4
  %47 = load i32, ptr %6, align 4
  %48 = icmp slt i32 %47, 12
  br i1 %48, label %49, label %52

49:                                               ; preds = %46
  %50 = load i32, ptr %6, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %6, align 4
  br label %55

52:                                               ; preds = %46
  store i32 1, ptr %6, align 4
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %7, align 4
  br label %55

55:                                               ; preds = %52, %49
  store i32 31, ptr %8, align 4
  %56 = load i32, ptr %6, align 4
  %57 = icmp eq i32 %56, 4
  br i1 %57, label %67, label %58

58:                                               ; preds = %55
  %59 = load i32, ptr %6, align 4
  %60 = icmp eq i32 %59, 6
  br i1 %60, label %67, label %61

61:                                               ; preds = %58
  %62 = load i32, ptr %6, align 4
  %63 = icmp eq i32 %62, 9
  br i1 %63, label %67, label %64

64:                                               ; preds = %61
  %65 = load i32, ptr %6, align 4
  %66 = icmp eq i32 %65, 11
  br i1 %66, label %67, label %68

67:                                               ; preds = %64, %61, %58, %55
  store i32 30, ptr %8, align 4
  br label %79

68:                                               ; preds = %64
  %69 = load i32, ptr %6, align 4
  %70 = icmp eq i32 %69, 2
  br i1 %70, label %71, label %78

71:                                               ; preds = %68
  %72 = load i32, ptr %7, align 4
  %73 = call i32 @isLeapYear(i32 noundef %72)
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %76

75:                                               ; preds = %71
  store i32 29, ptr %8, align 4
  br label %77

76:                                               ; preds = %71
  store i32 28, ptr %8, align 4
  br label %77

77:                                               ; preds = %76, %75
  br label %78

78:                                               ; preds = %77, %68
  br label %79

79:                                               ; preds = %78, %67
  br label %80

80:                                               ; preds = %79, %43
  br label %81

81:                                               ; preds = %80
  %82 = load i32, ptr %9, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %9, align 4
  br label %35, !llvm.loop !9

84:                                               ; preds = %35
  %85 = load i32, ptr %5, align 4
  %86 = load i32, ptr %6, align 4
  %87 = load i32, ptr %7, align 4
  %88 = call ptr @convertDateToString(i32 noundef %85, i32 noundef %86, i32 noundef %87)
  ret ptr %88
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [15 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %6 = getelementptr inbounds [15 x i8], ptr %2, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.16, ptr noundef %6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.18, ptr noundef %3)
  %10 = getelementptr inbounds [15 x i8], ptr %2, i64 0, i64 0
  %11 = load i32, ptr %3, align 4
  %12 = call ptr @addDays(ptr noundef %10, i32 noundef %11)
  store ptr %12, ptr %4, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.19, ptr noundef %13)
  %15 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %15) #6
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #4

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
