; ModuleID = 'LLVM_IR/gemini_pro-31796.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @assess_strength(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #3
  %3 = trunc i64 %2 to i32
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = icmp sgt i32 %3, 20
  br i1 %6, label %7, label %9

7:                                                ; preds = %5, %1
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 8, i32 noundef 20)
  br label %82

9:                                                ; preds = %5
  br label %10

10:                                               ; preds = %55, %9
  %.010 = phi i32 [ 0, %9 ], [ %.313, %55 ]
  %.07 = phi i32 [ 0, %9 ], [ %.3, %55 ]
  %.05 = phi i32 [ 0, %9 ], [ %.2, %55 ]
  %.03 = phi i32 [ 0, %9 ], [ %.14, %55 ]
  %.02 = phi i32 [ 0, %9 ], [ %56, %55 ]
  %11 = icmp slt i32 %.02, %3
  br i1 %11, label %12, label %57

12:                                               ; preds = %10
  %13 = sext i32 %.02 to i64
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp sge i32 %16, 97
  br i1 %17, label %18, label %25

18:                                               ; preds = %12
  %19 = sext i32 %.02 to i64
  %20 = getelementptr inbounds i8, ptr %0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp sle i32 %22, 122
  br i1 %23, label %24, label %25

24:                                               ; preds = %18
  br label %54

25:                                               ; preds = %18, %12
  %26 = sext i32 %.02 to i64
  %27 = getelementptr inbounds i8, ptr %0, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp sge i32 %29, 65
  br i1 %30, label %31, label %38

31:                                               ; preds = %25
  %32 = sext i32 %.02 to i64
  %33 = getelementptr inbounds i8, ptr %0, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp sle i32 %35, 90
  br i1 %36, label %37, label %38

37:                                               ; preds = %31
  br label %53

38:                                               ; preds = %31, %25
  %39 = sext i32 %.02 to i64
  %40 = getelementptr inbounds i8, ptr %0, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp sge i32 %42, 48
  br i1 %43, label %44, label %51

44:                                               ; preds = %38
  %45 = sext i32 %.02 to i64
  %46 = getelementptr inbounds i8, ptr %0, i64 %45
  %47 = load i8, ptr %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp sle i32 %48, 57
  br i1 %49, label %50, label %51

50:                                               ; preds = %44
  br label %52

51:                                               ; preds = %44, %38
  br label %52

52:                                               ; preds = %51, %50
  %.111 = phi i32 [ %.010, %50 ], [ 1, %51 ]
  %.18 = phi i32 [ 1, %50 ], [ %.07, %51 ]
  br label %53

53:                                               ; preds = %52, %37
  %.212 = phi i32 [ %.010, %37 ], [ %.111, %52 ]
  %.29 = phi i32 [ %.07, %37 ], [ %.18, %52 ]
  %.16 = phi i32 [ 1, %37 ], [ %.05, %52 ]
  br label %54

54:                                               ; preds = %53, %24
  %.313 = phi i32 [ %.010, %24 ], [ %.212, %53 ]
  %.3 = phi i32 [ %.07, %24 ], [ %.29, %53 ]
  %.2 = phi i32 [ %.05, %24 ], [ %.16, %53 ]
  %.14 = phi i32 [ 1, %24 ], [ %.03, %53 ]
  br label %55

55:                                               ; preds = %54
  %56 = add nsw i32 %.02, 1
  br label %10, !llvm.loop !6

57:                                               ; preds = %10
  %58 = icmp ne i32 %.03, 0
  br i1 %58, label %59, label %66

59:                                               ; preds = %57
  %60 = icmp ne i32 %.05, 0
  br i1 %60, label %61, label %66

61:                                               ; preds = %59
  %62 = icmp ne i32 %.07, 0
  br i1 %62, label %63, label %66

63:                                               ; preds = %61
  %64 = icmp ne i32 %.010, 0
  br i1 %64, label %65, label %66

65:                                               ; preds = %63
  br label %74

66:                                               ; preds = %63, %61, %59, %57
  %67 = icmp ne i32 %.03, 0
  br i1 %67, label %68, label %73

68:                                               ; preds = %66
  %69 = icmp ne i32 %.05, 0
  br i1 %69, label %70, label %73

70:                                               ; preds = %68
  %71 = icmp ne i32 %.07, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %70
  br label %73

73:                                               ; preds = %72, %70, %68, %66
  %.01 = phi i32 [ 1, %72 ], [ 0, %70 ], [ 0, %68 ], [ 0, %66 ]
  br label %74

74:                                               ; preds = %73, %65
  %.1 = phi i32 [ 2, %65 ], [ %.01, %73 ]
  switch i32 %.1, label %81 [
    i32 0, label %75
    i32 1, label %77
    i32 2, label %79
  ]

75:                                               ; preds = %74
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %81

77:                                               ; preds = %74
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %81

79:                                               ; preds = %74
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %81

81:                                               ; preds = %79, %77, %75, %74
  br label %82

82:                                               ; preds = %81, %7
  %.0 = phi i32 [ 0, %7 ], [ %.1, %81 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [21 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %3 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %4 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %3)
  %5 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %6 = call i32 @assess_strength(ptr noundef %5)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  switch i32 %6, label %14 [
    i32 0, label %8
    i32 1, label %10
    i32 2, label %12
  ]

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %14

10:                                               ; preds = %0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %14

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %14

14:                                               ; preds = %12, %10, %8, %0
  %15 = icmp slt i32 %6, 2
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %18

18:                                               ; preds = %16, %14
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
