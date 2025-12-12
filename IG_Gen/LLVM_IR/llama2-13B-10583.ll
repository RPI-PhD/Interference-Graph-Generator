; ModuleID = 'DATASETv2/llama2-13B-10583.c'
source_filename = "DATASETv2/llama2-13B-10583.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.word_frequency = type { ptr, i32 }

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"%d. %s (%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @tokenize_log_line(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %16, %15, %2
  %8 = load ptr, ptr %3, align 8
  %9 = call ptr @strtok(ptr noundef %8, ptr noundef @.str) #4
  store ptr %9, ptr %5, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %30

11:                                               ; preds = %7
  %12 = load ptr, ptr %5, align 8
  %13 = call i64 @strlen(ptr noundef %12) #5
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  br label %7, !llvm.loop !6

16:                                               ; preds = %11
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %6, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.word_frequency, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.word_frequency, ptr %21, i32 0, i32 0
  store ptr %17, ptr %22, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.word_frequency, ptr %23, i64 %25
  %27 = getelementptr inbounds %struct.word_frequency, ptr %26, i32 0, i32 1
  store i32 1, ptr %27, align 8
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %7, !llvm.loop !6

30:                                               ; preds = %7
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @calculate_top_10(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [10 x i32], align 16
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %15, %2
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %18

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %13
  store i32 0, ptr %14, align 4
  br label %15

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %5, align 4
  br label %8, !llvm.loop !8

18:                                               ; preds = %8
  store i32 0, ptr %5, align 4
  br label %19

19:                                               ; preds = %70, %18
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %73

23:                                               ; preds = %19
  store i32 0, ptr %6, align 4
  br label %24

24:                                               ; preds = %66, %23
  %25 = load i32, ptr %6, align 4
  %26 = icmp slt i32 %25, 10
  br i1 %26, label %27, label %69

27:                                               ; preds = %24
  %28 = load ptr, ptr %3, align 8
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.word_frequency, ptr %28, i64 %30
  %32 = getelementptr inbounds %struct.word_frequency, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 8
  %34 = load i32, ptr %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = icmp sgt i32 %33, %37
  br i1 %38, label %39, label %65

39:                                               ; preds = %27
  br label %40

40:                                               ; preds = %52, %39
  %41 = load i32, ptr %6, align 4
  %42 = icmp slt i32 %41, 10
  br i1 %42, label %43, label %55

43:                                               ; preds = %40
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = load i32, ptr %6, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %50
  store i32 %48, ptr %51, align 4
  br label %52

52:                                               ; preds = %43
  %53 = load i32, ptr %6, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %6, align 4
  br label %40, !llvm.loop !9

55:                                               ; preds = %40
  %56 = load ptr, ptr %3, align 8
  %57 = load i32, ptr %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds %struct.word_frequency, ptr %56, i64 %58
  %60 = getelementptr inbounds %struct.word_frequency, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 8
  %62 = load i32, ptr %6, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %63
  store i32 %61, ptr %64, align 4
  br label %69

65:                                               ; preds = %27
  br label %66

66:                                               ; preds = %65
  %67 = load i32, ptr %6, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %6, align 4
  br label %24, !llvm.loop !10

69:                                               ; preds = %55, %24
  br label %70

70:                                               ; preds = %69
  %71 = load i32, ptr %5, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %5, align 4
  br label %19, !llvm.loop !11

73:                                               ; preds = %19
  store i32 0, ptr %5, align 4
  br label %74

74:                                               ; preds = %89, %73
  %75 = load i32, ptr %5, align 4
  %76 = icmp slt i32 %75, 10
  br i1 %76, label %77, label %92

77:                                               ; preds = %74
  %78 = load i32, ptr %5, align 4
  %79 = add nsw i32 %78, 1
  %80 = load i32, ptr %5, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = load i32, ptr %5, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [10 x i32], ptr %7, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %79, i32 noundef %83, i32 noundef %87)
  br label %89

89:                                               ; preds = %77
  %90 = load i32, ptr %5, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %5, align 4
  br label %74, !llvm.loop !12

92:                                               ; preds = %74
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [1000 x %struct.word_frequency], align 16
  %8 = alloca i32, align 4
  %9 = alloca [20 x i8], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str.2)
  store ptr %13, ptr %6, align 8
  store i32 0, ptr %8, align 4
  br label %14

14:                                               ; preds = %19, %2
  %15 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %16 = load ptr, ptr %6, align 8
  %17 = call ptr @fgets(ptr noundef %15, i32 noundef 20, ptr noundef %16)
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %24

19:                                               ; preds = %14
  %20 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0
  %21 = getelementptr inbounds [1000 x %struct.word_frequency], ptr %7, i64 0, i64 0
  call void @tokenize_log_line(ptr noundef %20, ptr noundef %21)
  %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %8, align 4
  br label %14, !llvm.loop !13

24:                                               ; preds = %14
  %25 = getelementptr inbounds [1000 x %struct.word_frequency], ptr %7, i64 0, i64 0
  %26 = load i32, ptr %8, align 4
  call void @calculate_top_10(ptr noundef %25, i32 noundef %26)
  %27 = getelementptr inbounds [1000 x %struct.word_frequency], ptr %7, i64 0, i64 0
  %28 = load i32, ptr %8, align 4
  call void @calculate_top_10(ptr noundef %27, i32 noundef %28)
  %29 = load ptr, ptr %6, align 8
  %30 = call i32 @fclose(ptr noundef %29)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(read) }

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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
