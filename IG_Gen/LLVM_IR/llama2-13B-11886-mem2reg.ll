; ModuleID = 'LLVM_IR/llama2-13B-11886.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.kingdom, align 8
  %2 = alloca [100 x i8], align 16
  call void @add_word(ptr noundef %1, ptr noundef @.str)
  call void @add_word(ptr noundef %1, ptr noundef @.str.1)
  call void @add_word(ptr noundef %1, ptr noundef @.str.2)
  call void @add_word(ptr noundef %1, ptr noundef @.str.3)
  br label %3

3:                                                ; preds = %3, %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %5 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %6 = load ptr, ptr @stdin, align 8
  %7 = call ptr @fgets(ptr noundef %5, i32 noundef 100, ptr noundef %6)
  %8 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  call void @add_word(ptr noundef %1, ptr noundef %8)
  call void @print_word_count(ptr noundef %1)
  br label %3
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_word(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %1) #3
  %4 = icmp ult i64 %3, 3
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %1)
  br label %62

7:                                                ; preds = %2
  br label %8

8:                                                ; preds = %22, %7
  %.0 = phi i32 [ 0, %7 ], [ %23, %22 ]
  %9 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %.0, %10
  br i1 %11, label %12, label %24

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 2
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x ptr], ptr %13, i64 0, i64 %14
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @strcmp(ptr noundef %1, ptr noundef %16) #3
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %12
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %1)
  br label %62

21:                                               ; preds = %12
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !6

24:                                               ; preds = %8
  %25 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %25, align 8
  %28 = call i64 @strlen(ptr noundef %1) #3
  %29 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = sext i32 %30 to i64
  %32 = icmp ugt i64 %28, %31
  br i1 %32, label %33, label %35

33:                                               ; preds = %24
  %34 = call i64 @strlen(ptr noundef %1) #3
  br label %39

35:                                               ; preds = %24
  %36 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = sext i32 %37 to i64
  br label %39

39:                                               ; preds = %35, %33
  %40 = phi i64 [ %34, %33 ], [ %38, %35 ]
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 1
  store i32 %41, ptr %42, align 4
  %43 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 2
  %44 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = sub nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x ptr], ptr %43, i64 0, i64 %47
  store ptr %1, ptr %48, align 8
  %49 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  %51 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 1
  %52 = load i32, ptr %51, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %58

54:                                               ; preds = %39
  %55 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 2
  %56 = getelementptr inbounds [100 x ptr], ptr %55, i64 0, i64 0
  %57 = load ptr, ptr %56, align 8
  br label %59

58:                                               ; preds = %39
  br label %59

59:                                               ; preds = %58, %54
  %60 = phi ptr [ %57, %54 ], [ @.str.8, %58 ]
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %1, i32 noundef %50, ptr noundef %60)
  br label %62

62:                                               ; preds = %59, %19, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_word_count(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 8
  %4 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.kingdom, ptr %0, i32 0, i32 2
  %9 = getelementptr inbounds [100 x ptr], ptr %8, i64 0, i64 0
  %10 = load ptr, ptr %9, align 8
  br label %12

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %11, %7
  %13 = phi ptr [ %10, %7 ], [ @.str.8, %11 ]
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %3, ptr noundef %13)
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
