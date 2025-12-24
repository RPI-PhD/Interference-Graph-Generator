; ModuleID = 'LLVM_IR/gpt35-41759.ll'
source_filename = "DATASETv2/gpt35-41759.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.word = type { [50 x i8] }

@.str = private unnamed_addr constant [41 x i8] c"Error: malloc failed to allocate memory\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"dictionary.txt\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [39 x i8] c"Error: could not open dictionary file\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [47 x i8] c"Dictionary loaded successfully with %d words.\0A\00", align 1
@.str.6 = private unnamed_addr constant [56 x i8] c"Enter text to check spelling on (maximum of %d words):\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"Misspelled word: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @check_spelling(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca [50 x i8], align 16
  %5 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %6 = call ptr @strcpy(ptr noundef %5, ptr noundef %2) #5
  br label %7

7:                                                ; preds = %21, %3
  %.04 = phi i32 [ 0, %3 ], [ %22, %21 ]
  %8 = sext i32 %.04 to i64
  %9 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %12, label %23

12:                                               ; preds = %7
  %13 = sext i32 %.04 to i64
  %14 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = call i32 @tolower(i32 noundef %16) #6
  %18 = trunc i32 %17 to i8
  %19 = sext i32 %.04 to i64
  %20 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 %19
  store i8 %18, ptr %20, align 1
  br label %21

21:                                               ; preds = %12
  %22 = add nsw i32 %.04, 1
  br label %7, !llvm.loop !6

23:                                               ; preds = %7
  %24 = sub nsw i32 %1, 1
  br label %25

25:                                               ; preds = %45, %23
  %.02 = phi i32 [ 0, %23 ], [ %.13, %45 ]
  %.01 = phi i32 [ %24, %23 ], [ %.1, %45 ]
  %26 = icmp sle i32 %.02, %.01
  br i1 %26, label %27, label %46

27:                                               ; preds = %25
  %28 = add nsw i32 %.02, %.01
  %29 = sdiv i32 %28, 2
  %30 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %31 = sext i32 %29 to i64
  %32 = getelementptr inbounds %struct.word, ptr %0, i64 %31
  %33 = getelementptr inbounds %struct.word, ptr %32, i32 0, i32 0
  %34 = getelementptr inbounds [50 x i8], ptr %33, i64 0, i64 0
  %35 = call i32 @strcmp(ptr noundef %30, ptr noundef %34) #6
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %27
  br label %47

38:                                               ; preds = %27
  %39 = icmp slt i32 %35, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %38
  %41 = sub nsw i32 %29, 1
  br label %44

42:                                               ; preds = %38
  %43 = add nsw i32 %29, 1
  br label %44

44:                                               ; preds = %42, %40
  %.13 = phi i32 [ %.02, %40 ], [ %43, %42 ]
  %.1 = phi i32 [ %41, %40 ], [ %.01, %42 ]
  br label %45

45:                                               ; preds = %44
  br label %25, !llvm.loop !8

46:                                               ; preds = %25
  br label %47

47:                                               ; preds = %46, %37
  %.0 = phi i1 [ true, %37 ], [ false, %46 ]
  ret i1 %.0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [50 x i8], align 16
  %2 = call noalias ptr @malloc(i64 noundef 500000) #7
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %75

6:                                                ; preds = %0
  %7 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @free(ptr noundef %2) #5
  br label %75

11:                                               ; preds = %6
  br label %12

12:                                               ; preds = %20, %11
  %.03 = phi i32 [ 0, %11 ], [ %30, %20 ]
  %13 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %14 = call ptr @fgets(ptr noundef %13, i32 noundef 50, ptr noundef %7)
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %12
  %17 = icmp slt i32 %.03, 10000
  br label %18

18:                                               ; preds = %16, %12
  %19 = phi i1 [ false, %12 ], [ %17, %16 ]
  br i1 %19, label %20, label %31

20:                                               ; preds = %18
  %21 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %22 = call i64 @strcspn(ptr noundef %21, ptr noundef @.str.4) #6
  %23 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 %22
  store i8 0, ptr %23, align 1
  %24 = sext i32 %.03 to i64
  %25 = getelementptr inbounds %struct.word, ptr %2, i64 %24
  %26 = getelementptr inbounds %struct.word, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds [50 x i8], ptr %26, i64 0, i64 0
  %28 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %29 = call ptr @strcpy(ptr noundef %27, ptr noundef %28) #5
  %30 = add nsw i32 %.03, 1
  br label %12, !llvm.loop !9

31:                                               ; preds = %18
  %32 = call i32 @fclose(ptr noundef %7)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.03)
  %34 = call noalias ptr @malloc(i64 noundef 8000) #7
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %38

36:                                               ; preds = %31
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @free(ptr noundef %2) #5
  br label %75

38:                                               ; preds = %31
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef 1000)
  br label %40

40:                                               ; preds = %61, %38
  %.04 = phi i32 [ 0, %38 ], [ %64, %61 ]
  %41 = icmp slt i32 %.04, 1000
  br i1 %41, label %42, label %65

42:                                               ; preds = %40
  %43 = call noalias ptr @malloc(i64 noundef 50) #7
  %44 = icmp eq ptr %43, null
  br i1 %44, label %45, label %56

45:                                               ; preds = %42
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %47

47:                                               ; preds = %53, %45
  %.02 = phi i32 [ 0, %45 ], [ %54, %53 ]
  %48 = icmp slt i32 %.02, %.04
  br i1 %48, label %49, label %55

49:                                               ; preds = %47
  %50 = sext i32 %.02 to i64
  %51 = getelementptr inbounds ptr, ptr %34, i64 %50
  %52 = load ptr, ptr %51, align 8
  call void @free(ptr noundef %52) #5
  br label %53

53:                                               ; preds = %49
  %54 = add nsw i32 %.02, 1
  br label %47, !llvm.loop !10

55:                                               ; preds = %47
  call void @free(ptr noundef %34) #5
  call void @free(ptr noundef %2) #5
  br label %75

56:                                               ; preds = %42
  %57 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %43)
  %58 = call zeroext i1 @check_spelling(ptr noundef %2, i32 noundef %.03, ptr noundef %43)
  br i1 %58, label %61, label %59

59:                                               ; preds = %56
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %43)
  br label %61

61:                                               ; preds = %59, %56
  %62 = sext i32 %.04 to i64
  %63 = getelementptr inbounds ptr, ptr %34, i64 %62
  store ptr %43, ptr %63, align 8
  %64 = add nsw i32 %.04, 1
  br label %40, !llvm.loop !11

65:                                               ; preds = %40
  br label %66

66:                                               ; preds = %72, %65
  %.01 = phi i32 [ 0, %65 ], [ %73, %72 ]
  %67 = icmp slt i32 %.01, %.04
  br i1 %67, label %68, label %74

68:                                               ; preds = %66
  %69 = sext i32 %.01 to i64
  %70 = getelementptr inbounds ptr, ptr %34, i64 %69
  %71 = load ptr, ptr %70, align 8
  call void @free(ptr noundef %71) #5
  br label %72

72:                                               ; preds = %68
  %73 = add nsw i32 %.01, 1
  br label %66, !llvm.loop !12

74:                                               ; preds = %66
  call void @free(ptr noundef %34) #5
  call void @free(ptr noundef %2) #5
  br label %75

75:                                               ; preds = %74, %55, %36, %9, %4
  %.0 = phi i32 [ 1, %4 ], [ 1, %9 ], [ 1, %36 ], [ 1, %55 ], [ 0, %74 ]
  ret i32 %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

declare i32 @printf(ptr noundef, ...) #4

declare noalias ptr @fopen(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #4

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
