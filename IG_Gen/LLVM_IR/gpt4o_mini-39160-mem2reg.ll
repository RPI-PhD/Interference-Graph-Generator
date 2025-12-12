; ModuleID = 'LLVM_IR/gpt4o_mini-39160.ll'
source_filename = "DATASETv2/gpt4o_mini-39160.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"Enter a string (max %d characters): \00", align 1
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Reversed String: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Uppercased String: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"Lowercased String: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"String without spaces: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"Concatenated with Reversed: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [42 x i8] c"Number of vowels in the input string: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"The input string is a palindrome.\0A\00", align 1
@.str.9 = private unnamed_addr constant [39 x i8] c"The input string is not a palindrome.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @reverseString(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %0) #4
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %15, %2
  %.0 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %6 = icmp slt i32 %.0, %4
  br i1 %6, label %7, label %17

7:                                                ; preds = %5
  %8 = sub nsw i32 %4, %.0
  %9 = sub nsw i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i8, ptr %1, i64 %13
  store i8 %12, ptr %14, align 1
  br label %15

15:                                               ; preds = %7
  %16 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

17:                                               ; preds = %5
  %18 = sext i32 %4 to i64
  %19 = getelementptr inbounds i8, ptr %1, i64 %18
  store i8 0, ptr %19, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @toUpperCase(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %0) #4
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %6 = icmp slt i32 %.0, %4
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = call i32 @toupper(i32 noundef %11) #4
  %13 = trunc i32 %12 to i8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds i8, ptr %1, i64 %14
  store i8 %13, ptr %15, align 1
  br label %16

16:                                               ; preds = %7
  %17 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !8

18:                                               ; preds = %5
  %19 = sext i32 %4 to i64
  %20 = getelementptr inbounds i8, ptr %1, i64 %19
  store i8 0, ptr %20, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @toLowerCase(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call i64 @strlen(ptr noundef %0) #4
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %6 = icmp slt i32 %.0, %4
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = call i32 @tolower(i32 noundef %11) #4
  %13 = trunc i32 %12 to i8
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds i8, ptr %1, i64 %14
  store i8 %13, ptr %15, align 1
  br label %16

16:                                               ; preds = %7
  %17 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !9

18:                                               ; preds = %5
  %19 = sext i32 %4 to i64
  %20 = getelementptr inbounds i8, ptr %1, i64 %19
  store i8 0, ptr %20, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @removeSpaces(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %23, %2
  %.01 = phi i32 [ 0, %2 ], [ %.1, %23 ]
  %.0 = phi i32 [ 0, %2 ], [ %24, %23 ]
  %4 = sext i32 %.0 to i64
  %5 = getelementptr inbounds i8, ptr %0, i64 %4
  %6 = load i8, ptr %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %25

9:                                                ; preds = %3
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 32
  br i1 %14, label %15, label %22

15:                                               ; preds = %9
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds i8, ptr %0, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = add nsw i32 %.01, 1
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds i8, ptr %1, i64 %20
  store i8 %18, ptr %21, align 1
  br label %22

22:                                               ; preds = %15, %9
  %.1 = phi i32 [ %19, %15 ], [ %.01, %9 ]
  br label %23

23:                                               ; preds = %22
  %24 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !10

25:                                               ; preds = %3
  %26 = sext i32 %.01 to i64
  %27 = getelementptr inbounds i8, ptr %1, i64 %26
  store i8 0, ptr %27, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @concatenateStrings(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = call ptr @strcpy(ptr noundef %2, ptr noundef %0) #5
  %5 = call ptr @strcat(ptr noundef %2, ptr noundef %1) #5
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = alloca [200 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = alloca [100 x i8], align 16
  %5 = alloca [100 x i8], align 16
  %6 = alloca [200 x i8], align 16
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 99)
  %8 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %9 = load ptr, ptr @stdin, align 8
  %10 = call ptr @fgets(ptr noundef %8, i32 noundef 100, ptr noundef %9)
  %11 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %12 = call i64 @strcspn(ptr noundef %11, ptr noundef @.str.1) #4
  %13 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %12
  store i8 0, ptr %13, align 1
  %14 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %15 = getelementptr inbounds [200 x i8], ptr %2, i64 0, i64 0
  call void @reverseString(ptr noundef %14, ptr noundef %15)
  %16 = getelementptr inbounds [200 x i8], ptr %2, i64 0, i64 0
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %16)
  %18 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %19 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @toUpperCase(ptr noundef %18, ptr noundef %19)
  %20 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %20)
  %22 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %23 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  call void @toLowerCase(ptr noundef %22, ptr noundef %23)
  %24 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %24)
  %26 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %27 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  call void @removeSpaces(ptr noundef %26, ptr noundef %27)
  %28 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %28)
  %30 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %31 = getelementptr inbounds [200 x i8], ptr %2, i64 0, i64 0
  %32 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 0
  call void @concatenateStrings(ptr noundef %30, ptr noundef %31, ptr noundef %32)
  %33 = getelementptr inbounds [200 x i8], ptr %6, i64 0, i64 0
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %33)
  br label %35

35:                                               ; preds = %65, %0
  %.01 = phi i32 [ 0, %0 ], [ %.1, %65 ]
  %.0 = phi i32 [ 0, %0 ], [ %66, %65 ]
  %36 = sext i32 %.0 to i64
  %37 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %67

41:                                               ; preds = %35
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = call i32 @tolower(i32 noundef %45) #4
  %47 = trunc i32 %46 to i8
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 97
  br i1 %49, label %62, label %50

50:                                               ; preds = %41
  %51 = sext i8 %47 to i32
  %52 = icmp eq i32 %51, 101
  br i1 %52, label %62, label %53

53:                                               ; preds = %50
  %54 = sext i8 %47 to i32
  %55 = icmp eq i32 %54, 105
  br i1 %55, label %62, label %56

56:                                               ; preds = %53
  %57 = sext i8 %47 to i32
  %58 = icmp eq i32 %57, 111
  br i1 %58, label %62, label %59

59:                                               ; preds = %56
  %60 = sext i8 %47 to i32
  %61 = icmp eq i32 %60, 117
  br i1 %61, label %62, label %64

62:                                               ; preds = %59, %56, %53, %50, %41
  %63 = add nsw i32 %.01, 1
  br label %64

64:                                               ; preds = %62, %59
  %.1 = phi i32 [ %63, %62 ], [ %.01, %59 ]
  br label %65

65:                                               ; preds = %64
  %66 = add nsw i32 %.0, 1
  br label %35, !llvm.loop !11

67:                                               ; preds = %35
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %.01)
  %69 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %70 = getelementptr inbounds [200 x i8], ptr %2, i64 0, i64 0
  %71 = call i32 @strcmp(ptr noundef %69, ptr noundef %70) #4
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %75

73:                                               ; preds = %67
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %77

75:                                               ; preds = %67
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %77

77:                                               ; preds = %75, %73
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
attributes #5 = { nounwind }

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
