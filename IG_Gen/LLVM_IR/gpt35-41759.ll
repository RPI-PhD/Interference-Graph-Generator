; ModuleID = 'DATASETv2/gpt35-41759.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @check_spelling(ptr noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca [50 x i8], align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %14 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %15 = load ptr, ptr %7, align 8
  %16 = call ptr @strcpy(ptr noundef %14, ptr noundef %15) #5
  store i32 0, ptr %9, align 4
  br label %17

17:                                               ; preds = %34, %3
  %18 = load i32, ptr %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %37

23:                                               ; preds = %17
  %24 = load i32, ptr %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = call i32 @tolower(i32 noundef %28) #6
  %30 = trunc i32 %29 to i8
  %31 = load i32, ptr %9, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 %32
  store i8 %30, ptr %33, align 1
  br label %34

34:                                               ; preds = %23
  %35 = load i32, ptr %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %9, align 4
  br label %17, !llvm.loop !6

37:                                               ; preds = %17
  store i32 0, ptr %10, align 4
  %38 = load i32, ptr %6, align 4
  %39 = sub nsw i32 %38, 1
  store i32 %39, ptr %11, align 4
  br label %40

40:                                               ; preds = %70, %37
  %41 = load i32, ptr %10, align 4
  %42 = load i32, ptr %11, align 4
  %43 = icmp sle i32 %41, %42
  br i1 %43, label %44, label %71

44:                                               ; preds = %40
  %45 = load i32, ptr %10, align 4
  %46 = load i32, ptr %11, align 4
  %47 = add nsw i32 %45, %46
  %48 = sdiv i32 %47, 2
  store i32 %48, ptr %12, align 4
  %49 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %50 = load ptr, ptr %5, align 8
  %51 = load i32, ptr %12, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.word, ptr %50, i64 %52
  %54 = getelementptr inbounds %struct.word, ptr %53, i32 0, i32 0
  %55 = getelementptr inbounds [50 x i8], ptr %54, i64 0, i64 0
  %56 = call i32 @strcmp(ptr noundef %49, ptr noundef %55) #6
  store i32 %56, ptr %13, align 4
  %57 = load i32, ptr %13, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %59, label %60

59:                                               ; preds = %44
  store i1 true, ptr %4, align 1
  br label %72

60:                                               ; preds = %44
  %61 = load i32, ptr %13, align 4
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %66

63:                                               ; preds = %60
  %64 = load i32, ptr %12, align 4
  %65 = sub nsw i32 %64, 1
  store i32 %65, ptr %11, align 4
  br label %69

66:                                               ; preds = %60
  %67 = load i32, ptr %12, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %10, align 4
  br label %69

69:                                               ; preds = %66, %63
  br label %70

70:                                               ; preds = %69
  br label %40, !llvm.loop !8

71:                                               ; preds = %40
  store i1 false, ptr %4, align 1
  br label %72

72:                                               ; preds = %71, %59
  %73 = load i1, ptr %4, align 1
  ret i1 %73
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [50 x i8], align 16
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %11 = call noalias ptr @malloc(i64 noundef 500000) #7
  store ptr %11, ptr %2, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 1, ptr %1, align 4
  br label %121

16:                                               ; preds = %0
  %17 = call noalias ptr @fopen(ptr noundef @.str.1, ptr noundef @.str.2)
  store ptr %17, ptr %3, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %23

20:                                               ; preds = %16
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %22 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %22) #5
  store i32 1, ptr %1, align 4
  br label %121

23:                                               ; preds = %16
  store i32 0, ptr %4, align 4
  br label %24

24:                                               ; preds = %34, %23
  %25 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %26 = load ptr, ptr %3, align 8
  %27 = call ptr @fgets(ptr noundef %25, i32 noundef 50, ptr noundef %26)
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %32

29:                                               ; preds = %24
  %30 = load i32, ptr %4, align 4
  %31 = icmp slt i32 %30, 10000
  br label %32

32:                                               ; preds = %29, %24
  %33 = phi i1 [ false, %24 ], [ %31, %29 ]
  br i1 %33, label %34, label %48

34:                                               ; preds = %32
  %35 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %36 = call i64 @strcspn(ptr noundef %35, ptr noundef @.str.4) #6
  %37 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 %36
  store i8 0, ptr %37, align 1
  %38 = load ptr, ptr %2, align 8
  %39 = load i32, ptr %4, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.word, ptr %38, i64 %40
  %42 = getelementptr inbounds %struct.word, ptr %41, i32 0, i32 0
  %43 = getelementptr inbounds [50 x i8], ptr %42, i64 0, i64 0
  %44 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %45 = call ptr @strcpy(ptr noundef %43, ptr noundef %44) #5
  %46 = load i32, ptr %4, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %4, align 4
  br label %24, !llvm.loop !9

48:                                               ; preds = %32
  %49 = load ptr, ptr %3, align 8
  %50 = call i32 @fclose(ptr noundef %49)
  %51 = load i32, ptr %4, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %51)
  %53 = call noalias ptr @malloc(i64 noundef 8000) #7
  store ptr %53, ptr %6, align 8
  %54 = load ptr, ptr %6, align 8
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %59

56:                                               ; preds = %48
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %58 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %58) #5
  store i32 1, ptr %1, align 4
  br label %121

59:                                               ; preds = %48
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef 1000)
  store i32 0, ptr %7, align 4
  br label %61

61:                                               ; preds = %96, %59
  %62 = load i32, ptr %7, align 4
  %63 = icmp slt i32 %62, 1000
  br i1 %63, label %64, label %104

64:                                               ; preds = %61
  %65 = call noalias ptr @malloc(i64 noundef 50) #7
  store ptr %65, ptr %8, align 8
  %66 = load ptr, ptr %8, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %86

68:                                               ; preds = %64
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %9, align 4
  br label %70

70:                                               ; preds = %80, %68
  %71 = load i32, ptr %9, align 4
  %72 = load i32, ptr %7, align 4
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %74, label %83

74:                                               ; preds = %70
  %75 = load ptr, ptr %6, align 8
  %76 = load i32, ptr %9, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds ptr, ptr %75, i64 %77
  %79 = load ptr, ptr %78, align 8
  call void @free(ptr noundef %79) #5
  br label %80

80:                                               ; preds = %74
  %81 = load i32, ptr %9, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %9, align 4
  br label %70, !llvm.loop !10

83:                                               ; preds = %70
  %84 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %84) #5
  %85 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %85) #5
  store i32 1, ptr %1, align 4
  br label %121

86:                                               ; preds = %64
  %87 = load ptr, ptr %8, align 8
  %88 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %87)
  %89 = load ptr, ptr %2, align 8
  %90 = load i32, ptr %4, align 4
  %91 = load ptr, ptr %8, align 8
  %92 = call zeroext i1 @check_spelling(ptr noundef %89, i32 noundef %90, ptr noundef %91)
  br i1 %92, label %96, label %93

93:                                               ; preds = %86
  %94 = load ptr, ptr %8, align 8
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %94)
  br label %96

96:                                               ; preds = %93, %86
  %97 = load ptr, ptr %8, align 8
  %98 = load ptr, ptr %6, align 8
  %99 = load i32, ptr %7, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds ptr, ptr %98, i64 %100
  store ptr %97, ptr %101, align 8
  %102 = load i32, ptr %7, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %7, align 4
  br label %61, !llvm.loop !11

104:                                              ; preds = %61
  store i32 0, ptr %10, align 4
  br label %105

105:                                              ; preds = %115, %104
  %106 = load i32, ptr %10, align 4
  %107 = load i32, ptr %7, align 4
  %108 = icmp slt i32 %106, %107
  br i1 %108, label %109, label %118

109:                                              ; preds = %105
  %110 = load ptr, ptr %6, align 8
  %111 = load i32, ptr %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds ptr, ptr %110, i64 %112
  %114 = load ptr, ptr %113, align 8
  call void @free(ptr noundef %114) #5
  br label %115

115:                                              ; preds = %109
  %116 = load i32, ptr %10, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %10, align 4
  br label %105, !llvm.loop !12

118:                                              ; preds = %105
  %119 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %119) #5
  %120 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %120) #5
  store i32 0, ptr %1, align 4
  br label %121

121:                                              ; preds = %118, %83, %56, %20, %14
  %122 = load i32, ptr %1, align 4
  ret i32 %122
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
