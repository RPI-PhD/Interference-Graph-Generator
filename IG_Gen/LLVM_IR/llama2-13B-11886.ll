; ModuleID = 'DATASETv2/llama2-13B-11886.c'
source_filename = "DATASETv2/llama2-13B-11886.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kingdom = type { i32, i32, [100 x ptr] }

@.str = private unnamed_addr constant [5 x i8] c"Hail\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"Good\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"Sir\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"Knight\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Enter a word: \00", align 1
@stdin = external global ptr, align 8
@.str.5 = private unnamed_addr constant [74 x i8] c"O thou hast entered a word too short, %s. Thy word shall not be counted.\0A\00", align 1
@.str.6 = private unnamed_addr constant [95 x i8] c"Lo, thou hast entered a word already in the kingdom, %s. Thy word shall not be counted twice.\0A\00", align 1
@.str.7 = private unnamed_addr constant [99 x i8] c"Thou hast added the word %s to the kingdom. The current word count is %d. The longest word is %s.\0A\00", align 1
@.str.8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.9 = private unnamed_addr constant [55 x i8] c"The current word count is %d. The longest word is %s.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.kingdom, align 8
  %3 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
  call void @add_word(ptr noundef %2, ptr noundef @.str)
  call void @add_word(ptr noundef %2, ptr noundef @.str.1)
  call void @add_word(ptr noundef %2, ptr noundef @.str.2)
  call void @add_word(ptr noundef %2, ptr noundef @.str.3)
  br label %4

4:                                                ; preds = %0, %4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %6 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %7 = load ptr, ptr @stdin, align 8
  %8 = call ptr @fgets(ptr noundef %6, i32 noundef 100, ptr noundef %7)
  %9 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @add_word(ptr noundef %2, ptr noundef %9)
  call void @print_word_count(ptr noundef %2)
  br label %4
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_word(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call i64 @strlen(ptr noundef %6) #3
  %8 = icmp ult i64 %7, 3
  br i1 %8, label %9, label %12

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %10)
  br label %87

12:                                               ; preds = %2
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %33, %12
  %14 = load i32, ptr %5, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.kingdom, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %36

19:                                               ; preds = %13
  %20 = load ptr, ptr %4, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.kingdom, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [100 x ptr], ptr %22, i64 0, i64 %24
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @strcmp(ptr noundef %20, ptr noundef %26) #3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %19
  %30 = load ptr, ptr %4, align 8
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %30)
  br label %87

32:                                               ; preds = %19
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %5, align 4
  br label %13, !llvm.loop !6

36:                                               ; preds = %13
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.kingdom, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %38, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = call i64 @strlen(ptr noundef %41) #3
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %struct.kingdom, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = sext i32 %45 to i64
  %47 = icmp ugt i64 %42, %46
  br i1 %47, label %48, label %51

48:                                               ; preds = %36
  %49 = load ptr, ptr %4, align 8
  %50 = call i64 @strlen(ptr noundef %49) #3
  br label %56

51:                                               ; preds = %36
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.kingdom, ptr %52, i32 0, i32 1
  %54 = load i32, ptr %53, align 4
  %55 = sext i32 %54 to i64
  br label %56

56:                                               ; preds = %51, %48
  %57 = phi i64 [ %50, %48 ], [ %55, %51 ]
  %58 = trunc i64 %57 to i32
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds %struct.kingdom, ptr %59, i32 0, i32 1
  store i32 %58, ptr %60, align 4
  %61 = load ptr, ptr %4, align 8
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds %struct.kingdom, ptr %62, i32 0, i32 2
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds %struct.kingdom, ptr %64, i32 0, i32 0
  %66 = load i32, ptr %65, align 8
  %67 = sub nsw i32 %66, 1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [100 x ptr], ptr %63, i64 0, i64 %68
  store ptr %61, ptr %69, align 8
  %70 = load ptr, ptr %4, align 8
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.kingdom, ptr %71, i32 0, i32 0
  %73 = load i32, ptr %72, align 8
  %74 = load ptr, ptr %3, align 8
  %75 = getelementptr inbounds %struct.kingdom, ptr %74, i32 0, i32 1
  %76 = load i32, ptr %75, align 4
  %77 = icmp sgt i32 %76, 0
  br i1 %77, label %78, label %83

78:                                               ; preds = %56
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds %struct.kingdom, ptr %79, i32 0, i32 2
  %81 = getelementptr inbounds [100 x ptr], ptr %80, i64 0, i64 0
  %82 = load ptr, ptr %81, align 8
  br label %84

83:                                               ; preds = %56
  br label %84

84:                                               ; preds = %83, %78
  %85 = phi ptr [ %82, %78 ], [ @.str.8, %83 ]
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %70, i32 noundef %73, ptr noundef %85)
  br label %87

87:                                               ; preds = %84, %29, %9
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_word_count(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.kingdom, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.kingdom, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.kingdom, ptr %11, i32 0, i32 2
  %13 = getelementptr inbounds [100 x ptr], ptr %12, i64 0, i64 0
  %14 = load ptr, ptr %13, align 8
  br label %16

15:                                               ; preds = %1
  br label %16

16:                                               ; preds = %15, %10
  %17 = phi ptr [ %14, %10 ], [ @.str.8, %15 ]
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %5, ptr noundef %17)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

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
