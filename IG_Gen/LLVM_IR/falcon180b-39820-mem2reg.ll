; ModuleID = 'LLVM_IR/falcon180b-39820.ll'
source_filename = "DATASETv2/falcon180b-39820.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [50 x i8] c"Enter a password (between %d and %d characters):\0A\00", align 1
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [20 x i8] c"Password is valid.\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Password is not valid.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [32 x i8], align 16
  br label %2

2:                                                ; preds = %17, %0
  %.0 = phi i32 [ 0, %0 ], [ %16, %17 ]
  %3 = icmp slt i32 %.0, 3
  br i1 %3, label %4, label %18

4:                                                ; preds = %2
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 8, i32 noundef 32)
  %6 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  %7 = load ptr, ptr @stdin, align 8
  %8 = call ptr @fgets(ptr noundef %6, i32 noundef 32, ptr noundef %7)
  %9 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  %10 = call i32 @is_valid_password(ptr noundef %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %18

14:                                               ; preds = %4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %16 = add nsw i32 %.0, 1
  br label %17

17:                                               ; preds = %14
  br label %2, !llvm.loop !6

18:                                               ; preds = %12, %2
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_valid_password(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #4
  %3 = trunc i64 %2 to i32
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = icmp sgt i32 %3, 32
  br i1 %6, label %7, label %8

7:                                                ; preds = %5, %1
  br label %77

8:                                                ; preds = %5
  br label %9

9:                                                ; preds = %65, %8
  %.09 = phi i32 [ 0, %8 ], [ %.211, %65 ]
  %.06 = phi i32 [ 0, %8 ], [ %.28, %65 ]
  %.03 = phi i32 [ 0, %8 ], [ %.25, %65 ]
  %.02 = phi i32 [ 0, %8 ], [ %.3, %65 ]
  %.01 = phi i32 [ 0, %8 ], [ %66, %65 ]
  %10 = icmp slt i32 %.01, %3
  br i1 %10, label %11, label %67

11:                                               ; preds = %9
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds i8, ptr %0, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 @tolower(i32 noundef %15) #4
  %17 = trunc i32 %16 to i8
  %18 = call ptr @__ctype_b_loc() #5
  %19 = load ptr, ptr %18, align 8
  %20 = sext i8 %17 to i32
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i16, ptr %19, i64 %21
  %23 = load i16, ptr %22, align 2
  %24 = zext i16 %23 to i32
  %25 = and i32 %24, 1024
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %40

27:                                               ; preds = %11
  %28 = call ptr @__ctype_b_loc() #5
  %29 = load ptr, ptr %28, align 8
  %30 = sext i8 %17 to i32
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, ptr %29, i64 %31
  %33 = load i16, ptr %32, align 2
  %34 = zext i16 %33 to i32
  %35 = and i32 %34, 256
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %27
  br label %39

38:                                               ; preds = %27
  br label %39

39:                                               ; preds = %38, %37
  %.17 = phi i32 [ %.06, %37 ], [ 1, %38 ]
  %.14 = phi i32 [ 1, %37 ], [ %.03, %38 ]
  br label %64

40:                                               ; preds = %11
  %41 = call ptr @__ctype_b_loc() #5
  %42 = load ptr, ptr %41, align 8
  %43 = sext i8 %17 to i32
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i16, ptr %42, i64 %44
  %46 = load i16, ptr %45, align 2
  %47 = zext i16 %46 to i32
  %48 = and i32 %47, 2048
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %51

50:                                               ; preds = %40
  br label %63

51:                                               ; preds = %40
  %52 = call ptr @__ctype_b_loc() #5
  %53 = load ptr, ptr %52, align 8
  %54 = sext i8 %17 to i32
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i16, ptr %53, i64 %55
  %57 = load i16, ptr %56, align 2
  %58 = zext i16 %57 to i32
  %59 = and i32 %58, 8
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %62, label %61

61:                                               ; preds = %51
  br label %62

62:                                               ; preds = %61, %51
  %.1 = phi i32 [ %.02, %51 ], [ 1, %61 ]
  br label %63

63:                                               ; preds = %62, %50
  %.110 = phi i32 [ 1, %50 ], [ %.09, %62 ]
  %.2 = phi i32 [ %.02, %50 ], [ %.1, %62 ]
  br label %64

64:                                               ; preds = %63, %39
  %.211 = phi i32 [ %.09, %39 ], [ %.110, %63 ]
  %.28 = phi i32 [ %.17, %39 ], [ %.06, %63 ]
  %.25 = phi i32 [ %.14, %39 ], [ %.03, %63 ]
  %.3 = phi i32 [ %.02, %39 ], [ %.2, %63 ]
  br label %65

65:                                               ; preds = %64
  %66 = add nsw i32 %.01, 1
  br label %9, !llvm.loop !8

67:                                               ; preds = %9
  %68 = icmp ne i32 %.03, 0
  br i1 %68, label %69, label %76

69:                                               ; preds = %67
  %70 = icmp ne i32 %.06, 0
  br i1 %70, label %71, label %76

71:                                               ; preds = %69
  %72 = icmp ne i32 %.09, 0
  br i1 %72, label %73, label %76

73:                                               ; preds = %71
  %74 = icmp ne i32 %.02, 0
  br i1 %74, label %75, label %76

75:                                               ; preds = %73
  br label %77

76:                                               ; preds = %73, %71, %69, %67
  br label %77

77:                                               ; preds = %76, %75, %7
  %.0 = phi i32 [ 0, %7 ], [ 1, %75 ], [ 0, %76 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = distinct !{!8, !7}
