; ModuleID = 'DATASETv2/falcon180b-41359.c'
source_filename = "DATASETv2/falcon180b-41359.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.WordFrequency = type { ptr, i32 }

@.str = private unnamed_addr constant [15 x i8] c"spam_words.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"Error opening spam_words.txt\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Enter a message: \00", align 1
@stdin = external global ptr, align 8
@.str.5 = private unnamed_addr constant [17 x i8] c"Message is spam\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Message is not spam\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @compareWords(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  store ptr %8, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %7, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.WordFrequency, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = getelementptr inbounds %struct.WordFrequency, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = icmp sgt i32 %12, %15
  br i1 %16, label %17, label %18

17:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %28

18:                                               ; preds = %2
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.WordFrequency, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.WordFrequency, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %27

26:                                               ; preds = %18
  store i32 1, ptr %3, align 4
  br label %28

27:                                               ; preds = %18
  store i32 0, ptr %3, align 4
  br label %28

28:                                               ; preds = %27, %26, %17
  %29 = load i32, ptr %3, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @isSpam(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [16 x i8], align 16
  %6 = alloca [1000 x %struct.WordFrequency], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %10 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  store ptr %10, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %1
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #5
  unreachable

15:                                               ; preds = %1
  br label %16

16:                                               ; preds = %64, %15
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  %19 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %17, ptr noundef @.str.3, ptr noundef %18)
  %20 = icmp ne i32 %19, -1
  br i1 %20, label %21, label %65

21:                                               ; preds = %16
  store i32 0, ptr %9, align 4
  br label %22

22:                                               ; preds = %43, %21
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %46

26:                                               ; preds = %22
  %27 = load i32, ptr %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %6, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.WordFrequency, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 16
  %32 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  %33 = call i32 @strcmp(ptr noundef %31, ptr noundef %32) #6
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %42

35:                                               ; preds = %26
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %6, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.WordFrequency, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %39, align 8
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %39, align 8
  br label %46

42:                                               ; preds = %26
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %9, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %9, align 4
  br label %22, !llvm.loop !6

46:                                               ; preds = %35, %22
  %47 = load i32, ptr %9, align 4
  %48 = load i32, ptr %7, align 4
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %64

50:                                               ; preds = %46
  %51 = load i32, ptr %7, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %6, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.WordFrequency, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 16
  %56 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  %57 = call ptr @strcpy(ptr noundef %55, ptr noundef %56) #7
  %58 = load i32, ptr %7, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %6, i64 0, i64 %59
  %61 = getelementptr inbounds %struct.WordFrequency, ptr %60, i32 0, i32 1
  store i32 1, ptr %61, align 8
  %62 = load i32, ptr %7, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %7, align 4
  br label %64

64:                                               ; preds = %50, %46
  br label %16, !llvm.loop !8

65:                                               ; preds = %16
  %66 = load ptr, ptr %4, align 8
  %67 = call i32 @fclose(ptr noundef %66)
  store i32 0, ptr %9, align 4
  br label %68

68:                                               ; preds = %83, %65
  %69 = load i32, ptr %9, align 4
  %70 = load i32, ptr %7, align 4
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %86

72:                                               ; preds = %68
  %73 = load i32, ptr %9, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %6, i64 0, i64 %74
  %76 = getelementptr inbounds %struct.WordFrequency, ptr %75, i32 0, i32 1
  %77 = load i32, ptr %76, align 8
  %78 = icmp sge i32 %77, 3
  br i1 %78, label %79, label %82

79:                                               ; preds = %72
  %80 = load i32, ptr %8, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %8, align 4
  br label %82

82:                                               ; preds = %79, %72
  br label %83

83:                                               ; preds = %82
  %84 = load i32, ptr %9, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, ptr %9, align 4
  br label %68, !llvm.loop !9

86:                                               ; preds = %68
  %87 = load i32, ptr %8, align 4
  %88 = icmp sge i32 %87, 3
  br i1 %88, label %89, label %90

89:                                               ; preds = %86
  store i32 1, ptr %2, align 4
  br label %91

90:                                               ; preds = %86
  store i32 0, ptr %2, align 4
  br label %91

91:                                               ; preds = %90, %89
  %92 = load i32, ptr %2, align 4
  ret i32 %92
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i8], align 16
  store i32 0, ptr %1, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %4 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 1000, ptr noundef %5)
  %7 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %8 = call i32 @isSpam(ptr noundef %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %14

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %14

14:                                               ; preds = %12, %10
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind }

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
