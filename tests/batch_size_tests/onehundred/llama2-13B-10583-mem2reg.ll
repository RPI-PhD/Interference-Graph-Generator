; ModuleID = 'LLVM_IR/llama2-13B-10583.ll'
source_filename = "DATASETv2/llama2-13B-10583.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.word_frequency = type { ptr, i32 }

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"%d. %s (%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @tokenize_log_line(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %10, %9, %2
  %.0 = phi i32 [ 0, %2 ], [ %.0, %9 ], [ %17, %10 ]
  %4 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #4
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %18

6:                                                ; preds = %3
  %7 = call i64 @strlen(ptr noundef %4) #5
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  br label %3, !llvm.loop !6

10:                                               ; preds = %6
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.word_frequency, ptr %1, i64 %11
  %13 = getelementptr inbounds %struct.word_frequency, ptr %12, i32 0, i32 0
  store ptr %4, ptr %13, align 8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds %struct.word_frequency, ptr %1, i64 %14
  %16 = getelementptr inbounds %struct.word_frequency, ptr %15, i32 0, i32 1
  store i32 1, ptr %16, align 8
  %17 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

18:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @calculate_top_10(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca [10 x i32], align 16
  br label %4

4:                                                ; preds = %9, %2
  %.01 = phi i32 [ 0, %2 ], [ %10, %9 ]
  %5 = icmp slt i32 %.01, 10
  br i1 %5, label %6, label %11

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %7
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %6
  %10 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

11:                                               ; preds = %4
  br label %12

12:                                               ; preds = %49, %11
  %.12 = phi i32 [ 0, %11 ], [ %50, %49 ]
  %13 = icmp slt i32 %.12, %1
  br i1 %13, label %14, label %51

14:                                               ; preds = %12
  br label %15

15:                                               ; preds = %46, %14
  %.0 = phi i32 [ 0, %14 ], [ %47, %46 ]
  %16 = icmp slt i32 %.0, 10
  br i1 %16, label %17, label %48

17:                                               ; preds = %15
  %18 = sext i32 %.12 to i64
  %19 = getelementptr inbounds %struct.word_frequency, ptr %0, i64 %18
  %20 = getelementptr inbounds %struct.word_frequency, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = icmp sgt i32 %21, %24
  br i1 %25, label %26, label %45

26:                                               ; preds = %17
  br label %27

27:                                               ; preds = %36, %26
  %.1 = phi i32 [ %.0, %26 ], [ %37, %36 ]
  %28 = icmp slt i32 %.1, 10
  br i1 %28, label %29, label %38

29:                                               ; preds = %27
  %30 = add nsw i32 %.1, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = sext i32 %.1 to i64
  %35 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %34
  store i32 %33, ptr %35, align 4
  br label %36

36:                                               ; preds = %29
  %37 = add nsw i32 %.1, 1
  br label %27, !llvm.loop !9

38:                                               ; preds = %27
  %39 = sext i32 %.12 to i64
  %40 = getelementptr inbounds %struct.word_frequency, ptr %0, i64 %39
  %41 = getelementptr inbounds %struct.word_frequency, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 8
  %43 = sext i32 %.1 to i64
  %44 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %43
  store i32 %42, ptr %44, align 4
  br label %48

45:                                               ; preds = %17
  br label %46

46:                                               ; preds = %45
  %47 = add nsw i32 %.0, 1
  br label %15, !llvm.loop !10

48:                                               ; preds = %38, %15
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %.12, 1
  br label %12, !llvm.loop !11

51:                                               ; preds = %12
  br label %52

52:                                               ; preds = %63, %51
  %.2 = phi i32 [ 0, %51 ], [ %64, %63 ]
  %53 = icmp slt i32 %.2, 10
  br i1 %53, label %54, label %65

54:                                               ; preds = %52
  %55 = add nsw i32 %.2, 1
  %56 = sext i32 %.2 to i64
  %57 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %56
  %58 = load i32, ptr %57, align 4
  %59 = sext i32 %.2 to i64
  %60 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %55, i32 noundef %58, i32 noundef %61)
  br label %63

63:                                               ; preds = %54
  %64 = add nsw i32 %.2, 1
  br label %52, !llvm.loop !12

65:                                               ; preds = %52
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [1000 x %struct.word_frequency], align 16
  %4 = alloca [20 x i8], align 16
  %5 = getelementptr inbounds ptr, ptr %1, i64 1
  %6 = load ptr, ptr %5, align 8
  %7 = call noalias ptr @fopen(ptr noundef %6, ptr noundef @.str.2)
  br label %8

8:                                                ; preds = %12, %2
  %.0 = phi i32 [ 0, %2 ], [ %15, %12 ]
  %9 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %10 = call ptr @fgets(ptr noundef %9, i32 noundef 20, ptr noundef %7)
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %16

12:                                               ; preds = %8
  %13 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %14 = getelementptr inbounds [1000 x %struct.word_frequency], ptr %3, i64 0, i64 0
  call void @tokenize_log_line(ptr noundef %13, ptr noundef %14)
  %15 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !13

16:                                               ; preds = %8
  %17 = getelementptr inbounds [1000 x %struct.word_frequency], ptr %3, i64 0, i64 0
  call void @calculate_top_10(ptr noundef %17, i32 noundef %.0)
  %18 = getelementptr inbounds [1000 x %struct.word_frequency], ptr %3, i64 0, i64 0
  call void @calculate_top_10(ptr noundef %18, i32 noundef %.0)
  %19 = call i32 @fclose(ptr noundef %7)
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

declare i32 @fclose(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
