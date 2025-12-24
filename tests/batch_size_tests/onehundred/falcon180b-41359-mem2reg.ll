; ModuleID = 'LLVM_IR/falcon180b-41359.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compareWords(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.WordFrequency, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = getelementptr inbounds %struct.WordFrequency, ptr %1, i32 0, i32 1
  %6 = load i32, ptr %5, align 8
  %7 = icmp sgt i32 %4, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %17

9:                                                ; preds = %2
  %10 = getelementptr inbounds %struct.WordFrequency, ptr %0, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = getelementptr inbounds %struct.WordFrequency, ptr %1, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %9
  br label %17

16:                                               ; preds = %9
  br label %17

17:                                               ; preds = %16, %15, %8
  %.0 = phi i32 [ -1, %8 ], [ 1, %15 ], [ 0, %16 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isSpam(ptr noundef %0) #0 {
  %2 = alloca [16 x i8], align 16
  %3 = alloca [1000 x %struct.WordFrequency], align 16
  %4 = call noalias ptr @fopen(ptr noundef @.str, ptr noundef @.str.1)
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #5
  unreachable

8:                                                ; preds = %1
  br label %9

9:                                                ; preds = %46, %8
  %.04 = phi i32 [ 0, %8 ], [ %.15, %46 ]
  %10 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %11 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %4, ptr noundef @.str.3, ptr noundef %10)
  %12 = icmp ne i32 %11, -1
  br i1 %12, label %13, label %47

13:                                               ; preds = %9
  br label %14

14:                                               ; preds = %31, %13
  %.01 = phi i32 [ 0, %13 ], [ %32, %31 ]
  %15 = icmp slt i32 %.01, %.04
  br i1 %15, label %16, label %33

16:                                               ; preds = %14
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %3, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.WordFrequency, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 16
  %21 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %22 = call i32 @strcmp(ptr noundef %20, ptr noundef %21) #6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %16
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %3, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.WordFrequency, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %27, align 8
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %27, align 8
  br label %33

30:                                               ; preds = %16
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.01, 1
  br label %14, !llvm.loop !6

33:                                               ; preds = %24, %14
  %34 = icmp eq i32 %.01, %.04
  br i1 %34, label %35, label %46

35:                                               ; preds = %33
  %36 = sext i32 %.04 to i64
  %37 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %3, i64 0, i64 %36
  %38 = getelementptr inbounds %struct.WordFrequency, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 16
  %40 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  %41 = call ptr @strcpy(ptr noundef %39, ptr noundef %40) #7
  %42 = sext i32 %.04 to i64
  %43 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %3, i64 0, i64 %42
  %44 = getelementptr inbounds %struct.WordFrequency, ptr %43, i32 0, i32 1
  store i32 1, ptr %44, align 8
  %45 = add nsw i32 %.04, 1
  br label %46

46:                                               ; preds = %35, %33
  %.15 = phi i32 [ %45, %35 ], [ %.04, %33 ]
  br label %9, !llvm.loop !8

47:                                               ; preds = %9
  %48 = call i32 @fclose(ptr noundef %4)
  br label %49

49:                                               ; preds = %60, %47
  %.02 = phi i32 [ 0, %47 ], [ %.13, %60 ]
  %.1 = phi i32 [ 0, %47 ], [ %61, %60 ]
  %50 = icmp slt i32 %.1, %.04
  br i1 %50, label %51, label %62

51:                                               ; preds = %49
  %52 = sext i32 %.1 to i64
  %53 = getelementptr inbounds [1000 x %struct.WordFrequency], ptr %3, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.WordFrequency, ptr %53, i32 0, i32 1
  %55 = load i32, ptr %54, align 8
  %56 = icmp sge i32 %55, 3
  br i1 %56, label %57, label %59

57:                                               ; preds = %51
  %58 = add nsw i32 %.02, 1
  br label %59

59:                                               ; preds = %57, %51
  %.13 = phi i32 [ %58, %57 ], [ %.02, %51 ]
  br label %60

60:                                               ; preds = %59
  %61 = add nsw i32 %.1, 1
  br label %49, !llvm.loop !9

62:                                               ; preds = %49
  %63 = icmp sge i32 %.02, 3
  br i1 %63, label %64, label %65

64:                                               ; preds = %62
  br label %66

65:                                               ; preds = %62
  br label %66

66:                                               ; preds = %65, %64
  %.0 = phi i32 [ 1, %64 ], [ 0, %65 ]
  ret i32 %.0
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %3 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef %3, i32 noundef 1000, ptr noundef %4)
  %6 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %7 = call i32 @isSpam(ptr noundef %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %13

11:                                               ; preds = %0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %13

13:                                               ; preds = %11, %9
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
