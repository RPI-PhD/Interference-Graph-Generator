; ModuleID = 'LLVM_IR/gpt4o_mini-37643.ll'
source_filename = "DATASETv2/gpt4o_mini-37643.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Password: \22%s\22 is Strong!\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Password: \22%s\22 is Weak!\0A\00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"Enter your password (8-20 characters): \00", align 1
@stdin = external global ptr, align 8
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [43 x i8] c"Welcome to the Password Strength Checker!\0A\00", align 1
@.str.5 = private unnamed_addr constant [54 x i8] c"Please follow the guidelines for a strong password.\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [53 x i8] c"\0AThank you for using the Password Strength Checker!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @isStrongPassword(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #4
  %3 = trunc i64 %2 to i32
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = icmp sgt i32 %3, 20
  br i1 %6, label %7, label %8

7:                                                ; preds = %5, %1
  br label %84

8:                                                ; preds = %5
  br label %9

9:                                                ; preds = %71, %8
  %.08 = phi i32 [ 0, %8 ], [ %.311, %71 ]
  %.05 = phi i32 [ 0, %8 ], [ %.27, %71 ]
  %.03 = phi i32 [ 0, %8 ], [ %.14, %71 ]
  %.02 = phi i32 [ 0, %8 ], [ %.4, %71 ]
  %.01 = phi i32 [ 0, %8 ], [ %72, %71 ]
  %10 = icmp slt i32 %.01, %3
  br i1 %10, label %11, label %73

11:                                               ; preds = %9
  %12 = call ptr @__ctype_b_loc() #5
  %13 = load ptr, ptr %12, align 8
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds i8, ptr %0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i16, ptr %13, i64 %18
  %20 = load i16, ptr %19, align 2
  %21 = zext i16 %20 to i32
  %22 = and i32 %21, 256
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %11
  br label %70

25:                                               ; preds = %11
  %26 = call ptr @__ctype_b_loc() #5
  %27 = load ptr, ptr %26, align 8
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds i8, ptr %0, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i16, ptr %27, i64 %32
  %34 = load i16, ptr %33, align 2
  %35 = zext i16 %34 to i32
  %36 = and i32 %35, 512
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %25
  br label %69

39:                                               ; preds = %25
  %40 = call ptr @__ctype_b_loc() #5
  %41 = load ptr, ptr %40, align 8
  %42 = sext i32 %.01 to i64
  %43 = getelementptr inbounds i8, ptr %0, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i16, ptr %41, i64 %46
  %48 = load i16, ptr %47, align 2
  %49 = zext i16 %48 to i32
  %50 = and i32 %49, 2048
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %39
  br label %68

53:                                               ; preds = %39
  %54 = call ptr @__ctype_b_loc() #5
  %55 = load ptr, ptr %54, align 8
  %56 = sext i32 %.01 to i64
  %57 = getelementptr inbounds i8, ptr %0, i64 %56
  %58 = load i8, ptr %57, align 1
  %59 = sext i8 %58 to i32
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i16, ptr %55, i64 %60
  %62 = load i16, ptr %61, align 2
  %63 = zext i16 %62 to i32
  %64 = and i32 %63, 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %67

66:                                               ; preds = %53
  br label %67

67:                                               ; preds = %66, %53
  %.1 = phi i32 [ 1, %66 ], [ %.02, %53 ]
  br label %68

68:                                               ; preds = %67, %52
  %.19 = phi i32 [ 1, %52 ], [ %.08, %67 ]
  %.2 = phi i32 [ %.02, %52 ], [ %.1, %67 ]
  br label %69

69:                                               ; preds = %68, %38
  %.210 = phi i32 [ %.08, %38 ], [ %.19, %68 ]
  %.16 = phi i32 [ 1, %38 ], [ %.05, %68 ]
  %.3 = phi i32 [ %.02, %38 ], [ %.2, %68 ]
  br label %70

70:                                               ; preds = %69, %24
  %.311 = phi i32 [ %.08, %24 ], [ %.210, %69 ]
  %.27 = phi i32 [ %.05, %24 ], [ %.16, %69 ]
  %.14 = phi i32 [ 1, %24 ], [ %.03, %69 ]
  %.4 = phi i32 [ %.02, %24 ], [ %.3, %69 ]
  br label %71

71:                                               ; preds = %70
  %72 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !6

73:                                               ; preds = %9
  %74 = icmp ne i32 %.03, 0
  br i1 %74, label %75, label %81

75:                                               ; preds = %73
  %76 = icmp ne i32 %.05, 0
  br i1 %76, label %77, label %81

77:                                               ; preds = %75
  %78 = icmp ne i32 %.08, 0
  br i1 %78, label %79, label %81

79:                                               ; preds = %77
  %80 = icmp ne i32 %.02, 0
  br label %81

81:                                               ; preds = %79, %77, %75, %73
  %82 = phi i1 [ false, %77 ], [ false, %75 ], [ false, %73 ], [ %80, %79 ]
  %83 = zext i1 %82 to i32
  br label %84

84:                                               ; preds = %81, %7
  %.0 = phi i32 [ 0, %7 ], [ %83, %81 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @displayStrength(ptr noundef %0) #0 {
  %2 = call i32 @isStrongPassword(ptr noundef %0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %1
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
  br label %8

6:                                                ; preds = %1
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %0)
  br label %8

8:                                                ; preds = %6, %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @getUserInput(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef %0, i32 noundef %1, ptr noundef %4)
  %6 = call i64 @strcspn(ptr noundef %0, ptr noundef @.str.3) #4
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  store i8 0, ptr %7, align 1
  ret void
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %4 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @getUserInput(ptr noundef %4, i32 noundef 100)
  %5 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @displayStrength(ptr noundef %5)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) }
attributes #5 = { nounwind willreturn memory(none) }

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
