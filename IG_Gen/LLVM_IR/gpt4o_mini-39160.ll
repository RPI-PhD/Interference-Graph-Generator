; ModuleID = 'DATASETv2/gpt4o_mini-39160.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @reverseString(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call i64 @strlen(ptr noundef %7) #4
  %9 = trunc i64 %8 to i32
  store i32 %9, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %27, %2
  %11 = load i32, ptr %6, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = sub nsw i32 %16, %17
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i8, ptr %15, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  store i8 %22, ptr %26, align 1
  br label %27

27:                                               ; preds = %14
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %10, !llvm.loop !6

30:                                               ; preds = %10
  %31 = load ptr, ptr %4, align 8
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %31, i64 %33
  store i8 0, ptr %34, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @toUpperCase(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call i64 @strlen(ptr noundef %7) #4
  %9 = trunc i64 %8 to i32
  store i32 %9, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %27, %2
  %11 = load i32, ptr %6, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr %15, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = call i32 @toupper(i32 noundef %20) #4
  %22 = trunc i32 %21 to i8
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  store i8 %22, ptr %26, align 1
  br label %27

27:                                               ; preds = %14
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %10, !llvm.loop !8

30:                                               ; preds = %10
  %31 = load ptr, ptr %4, align 8
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %31, i64 %33
  store i8 0, ptr %34, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @toLowerCase(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call i64 @strlen(ptr noundef %7) #4
  %9 = trunc i64 %8 to i32
  store i32 %9, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %10

10:                                               ; preds = %27, %2
  %11 = load i32, ptr %6, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr %15, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = call i32 @tolower(i32 noundef %20) #4
  %22 = trunc i32 %21 to i8
  %23 = load ptr, ptr %4, align 8
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  store i8 %22, ptr %26, align 1
  br label %27

27:                                               ; preds = %14
  %28 = load i32, ptr %6, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %6, align 4
  br label %10, !llvm.loop !9

30:                                               ; preds = %10
  %31 = load ptr, ptr %4, align 8
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %31, i64 %33
  store i8 0, ptr %34, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @removeSpaces(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %35, %2
  %8 = load ptr, ptr %3, align 8
  %9 = load i32, ptr %6, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i8, ptr %8, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %38

15:                                               ; preds = %7
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp ne i32 %21, 32
  br i1 %22, label %23, label %34

23:                                               ; preds = %15
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %5, align 4
  %32 = sext i32 %30 to i64
  %33 = getelementptr inbounds i8, ptr %29, i64 %32
  store i8 %28, ptr %33, align 1
  br label %34

34:                                               ; preds = %23, %15
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %6, align 4
  br label %7, !llvm.loop !10

38:                                               ; preds = %7
  %39 = load ptr, ptr %4, align 8
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr %39, i64 %41
  store i8 0, ptr %42, align 1
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @concatenateStrings(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = call ptr @strcpy(ptr noundef %7, ptr noundef %8) #5
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = call ptr @strcat(ptr noundef %10, ptr noundef %11) #5
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca [200 x i8], align 16
  %4 = alloca [100 x i8], align 16
  %5 = alloca [100 x i8], align 16
  %6 = alloca [100 x i8], align 16
  %7 = alloca [200 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 99)
  %12 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %13 = load ptr, ptr @stdin, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 100, ptr noundef %13)
  %15 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %16 = call i64 @strcspn(ptr noundef %15, ptr noundef @.str.1) #4
  %17 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %16
  store i8 0, ptr %17, align 1
  %18 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %19 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  call void @reverseString(ptr noundef %18, ptr noundef %19)
  %20 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %20)
  %22 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %23 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  call void @toUpperCase(ptr noundef %22, ptr noundef %23)
  %24 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %24)
  %26 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %27 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  call void @toLowerCase(ptr noundef %26, ptr noundef %27)
  %28 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %28)
  %30 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %31 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  call void @removeSpaces(ptr noundef %30, ptr noundef %31)
  %32 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %32)
  %34 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %35 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  %36 = getelementptr inbounds [200 x i8], ptr %7, i64 0, i64 0
  call void @concatenateStrings(ptr noundef %34, ptr noundef %35, ptr noundef %36)
  %37 = getelementptr inbounds [200 x i8], ptr %7, i64 0, i64 0
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %37)
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %39

39:                                               ; preds = %77, %0
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %41
  %43 = load i8, ptr %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %80

46:                                               ; preds = %39
  %47 = load i32, ptr %9, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %48
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = call i32 @tolower(i32 noundef %51) #4
  %53 = trunc i32 %52 to i8
  store i8 %53, ptr %10, align 1
  %54 = load i8, ptr %10, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp eq i32 %55, 97
  br i1 %56, label %73, label %57

57:                                               ; preds = %46
  %58 = load i8, ptr %10, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp eq i32 %59, 101
  br i1 %60, label %73, label %61

61:                                               ; preds = %57
  %62 = load i8, ptr %10, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp eq i32 %63, 105
  br i1 %64, label %73, label %65

65:                                               ; preds = %61
  %66 = load i8, ptr %10, align 1
  %67 = sext i8 %66 to i32
  %68 = icmp eq i32 %67, 111
  br i1 %68, label %73, label %69

69:                                               ; preds = %65
  %70 = load i8, ptr %10, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp eq i32 %71, 117
  br i1 %72, label %73, label %76

73:                                               ; preds = %69, %65, %61, %57, %46
  %74 = load i32, ptr %8, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %8, align 4
  br label %76

76:                                               ; preds = %73, %69
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %9, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %9, align 4
  br label %39, !llvm.loop !11

80:                                               ; preds = %39
  %81 = load i32, ptr %8, align 4
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %81)
  %83 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %84 = getelementptr inbounds [200 x i8], ptr %3, i64 0, i64 0
  %85 = call i32 @strcmp(ptr noundef %83, ptr noundef %84) #4
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %89

87:                                               ; preds = %80
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %91

89:                                               ; preds = %80
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %91

91:                                               ; preds = %89, %87
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
