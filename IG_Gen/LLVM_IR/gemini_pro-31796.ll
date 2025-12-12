; ModuleID = 'DATASETv2/gemini_pro-31796.c'
source_filename = "DATASETv2/gemini_pro-31796.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [55 x i8] c"Password length must be between %d and %d characters.\0A\00", align 1
@.str.1 = private unnamed_addr constant [83 x i8] c"Password strength: Low. Consider using a longer password with a mix of characters.\00", align 1
@.str.2 = private unnamed_addr constant [75 x i8] c"Password strength: Medium. Consider adding a symbol for enhanced security.\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c"Password strength: High. Excellent work!\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Enter a password: \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.6 = private unnamed_addr constant [69 x i8] c"\0AAfter careful scrutiny, the password strength has been assessed as \00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"weak.\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"moderate.\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"strong.\00", align 1
@.str.10 = private unnamed_addr constant [57 x i8] c"\0AConsider revising your password for enhanced security.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @assess_strength(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = call i64 @strlen(ptr noundef %11) #3
  %13 = trunc i64 %12 to i32
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 8
  br i1 %15, label %19, label %16

16:                                               ; preds = %1
  %17 = load i32, ptr %4, align 4
  %18 = icmp sgt i32 %17, 20
  br i1 %18, label %19, label %21

19:                                               ; preds = %16, %1
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 8, i32 noundef 20)
  store i32 0, ptr %2, align 4
  br label %118

21:                                               ; preds = %16
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %22

22:                                               ; preds = %81, %21
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %4, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %84

26:                                               ; preds = %22
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %9, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %27, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp sge i32 %32, 97
  br i1 %33, label %34, label %43

34:                                               ; preds = %26
  %35 = load ptr, ptr %3, align 8
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr %35, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp sle i32 %40, 122
  br i1 %41, label %42, label %43

42:                                               ; preds = %34
  store i32 1, ptr %5, align 4
  br label %80

43:                                               ; preds = %34, %26
  %44 = load ptr, ptr %3, align 8
  %45 = load i32, ptr %9, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, ptr %44, i64 %46
  %48 = load i8, ptr %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp sge i32 %49, 65
  br i1 %50, label %51, label %60

51:                                               ; preds = %43
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %9, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, ptr %52, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp sle i32 %57, 90
  br i1 %58, label %59, label %60

59:                                               ; preds = %51
  store i32 1, ptr %6, align 4
  br label %79

60:                                               ; preds = %51, %43
  %61 = load ptr, ptr %3, align 8
  %62 = load i32, ptr %9, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, ptr %61, i64 %63
  %65 = load i8, ptr %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp sge i32 %66, 48
  br i1 %67, label %68, label %77

68:                                               ; preds = %60
  %69 = load ptr, ptr %3, align 8
  %70 = load i32, ptr %9, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %69, i64 %71
  %73 = load i8, ptr %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp sle i32 %74, 57
  br i1 %75, label %76, label %77

76:                                               ; preds = %68
  store i32 1, ptr %7, align 4
  br label %78

77:                                               ; preds = %68, %60
  store i32 1, ptr %8, align 4
  br label %78

78:                                               ; preds = %77, %76
  br label %79

79:                                               ; preds = %78, %59
  br label %80

80:                                               ; preds = %79, %42
  br label %81

81:                                               ; preds = %80
  %82 = load i32, ptr %9, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %9, align 4
  br label %22, !llvm.loop !6

84:                                               ; preds = %22
  store i32 0, ptr %10, align 4
  %85 = load i32, ptr %5, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %97

87:                                               ; preds = %84
  %88 = load i32, ptr %6, align 4
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %97

90:                                               ; preds = %87
  %91 = load i32, ptr %7, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %97

93:                                               ; preds = %90
  %94 = load i32, ptr %8, align 4
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %97

96:                                               ; preds = %93
  store i32 2, ptr %10, align 4
  br label %108

97:                                               ; preds = %93, %90, %87, %84
  %98 = load i32, ptr %5, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %107

100:                                              ; preds = %97
  %101 = load i32, ptr %6, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %107

103:                                              ; preds = %100
  %104 = load i32, ptr %7, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %107

106:                                              ; preds = %103
  store i32 1, ptr %10, align 4
  br label %107

107:                                              ; preds = %106, %103, %100, %97
  br label %108

108:                                              ; preds = %107, %96
  %109 = load i32, ptr %10, align 4
  switch i32 %109, label %116 [
    i32 0, label %110
    i32 1, label %112
    i32 2, label %114
  ]

110:                                              ; preds = %108
  %111 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %116

112:                                              ; preds = %108
  %113 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %116

114:                                              ; preds = %108
  %115 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %116

116:                                              ; preds = %108, %114, %112, %110
  %117 = load i32, ptr %10, align 4
  store i32 %117, ptr %2, align 4
  br label %118

118:                                              ; preds = %116, %19
  %119 = load i32, ptr %2, align 4
  ret i32 %119
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [21 x i8], align 16
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %5 = getelementptr inbounds [21 x i8], ptr %2, i64 0, i64 0
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %5)
  %7 = getelementptr inbounds [21 x i8], ptr %2, i64 0, i64 0
  %8 = call i32 @assess_strength(ptr noundef %7)
  store i32 %8, ptr %3, align 4
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %10 = load i32, ptr %3, align 4
  switch i32 %10, label %17 [
    i32 0, label %11
    i32 1, label %13
    i32 2, label %15
  ]

11:                                               ; preds = %0
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %17

13:                                               ; preds = %0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %17

15:                                               ; preds = %0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %17

17:                                               ; preds = %0, %15, %13, %11
  %18 = load i32, ptr %3, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %22

22:                                               ; preds = %20, %17
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
