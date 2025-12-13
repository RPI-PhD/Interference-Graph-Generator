; ModuleID = 'LLVM_IR/mistral_7b-2229.ll'
source_filename = "DATASETv2/mistral_7b-2229.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%02X\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"Invalid hexadecimal string.\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Enter a hexadecimal string: \00", align 1
@stdin = external global ptr, align 8
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_hex(ptr noundef %0) #0 {
  %2 = alloca [33 x i8], align 16
  br label %3

3:                                                ; preds = %15, %1
  %.0 = phi i32 [ 0, %1 ], [ %16, %15 ]
  %4 = icmp slt i32 %.0, 16
  br i1 %4, label %5, label %17

5:                                                ; preds = %3
  %6 = getelementptr inbounds [33 x i8], ptr %2, i64 0, i64 0
  %7 = mul nsw i32 %.0, 2
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i8, ptr %6, i64 %8
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load i8, ptr %11, align 1
  %13 = zext i8 %12 to i32
  %14 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %9, ptr noundef @.str, i32 noundef %13) #5
  br label %15

15:                                               ; preds = %5
  %16 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

17:                                               ; preds = %3
  %18 = getelementptr inbounds [33 x i8], ptr %2, i64 0, i64 0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %18)
  ret void
}

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_hex_character(i8 noundef signext %0) #0 {
  %2 = call ptr @__ctype_b_loc() #6
  %3 = load ptr, ptr %2, align 8
  %4 = sext i8 %0 to i32
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds i16, ptr %3, i64 %5
  %7 = load i16, ptr %6, align 2
  %8 = zext i16 %7 to i32
  %9 = and i32 %8, 2048
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %51, label %11

11:                                               ; preds = %1
  %12 = call ptr @__ctype_b_loc() #6
  %13 = load ptr, ptr %12, align 8
  %14 = sext i8 %0 to i32
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i16, ptr %13, i64 %15
  %17 = load i16, ptr %16, align 2
  %18 = zext i16 %17 to i32
  %19 = and i32 %18, 1024
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %31

21:                                               ; preds = %11
  %22 = call ptr @__ctype_b_loc() #6
  %23 = load ptr, ptr %22, align 8
  %24 = sext i8 %0 to i32
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i16, ptr %23, i64 %25
  %27 = load i16, ptr %26, align 2
  %28 = zext i16 %27 to i32
  %29 = and i32 %28, 1024
  %30 = icmp sle i32 %29, 70
  br i1 %30, label %51, label %31

31:                                               ; preds = %21, %11
  %32 = call ptr @__ctype_b_loc() #6
  %33 = load ptr, ptr %32, align 8
  %34 = sext i8 %0 to i32
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, ptr %33, i64 %35
  %37 = load i16, ptr %36, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 1024
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %52

41:                                               ; preds = %31
  %42 = call ptr @__ctype_b_loc() #6
  %43 = load ptr, ptr %42, align 8
  %44 = sext i8 %0 to i32
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i16, ptr %43, i64 %45
  %47 = load i16, ptr %46, align 2
  %48 = zext i16 %47 to i32
  %49 = and i32 %48, 1024
  %50 = icmp sge i32 %49, 65
  br i1 %50, label %51, label %52

51:                                               ; preds = %41, %21, %1
  br label %53

52:                                               ; preds = %41, %31
  br label %53

53:                                               ; preds = %52, %51
  %.0 = phi i32 [ 1, %51 ], [ 0, %52 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @hex_string_to_array(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %86, %2
  %.02 = phi i32 [ 0, %2 ], [ %87, %86 ]
  %.01 = phi i32 [ 0, %2 ], [ %.2, %86 ]
  %4 = sext i32 %.02 to i64
  %5 = getelementptr inbounds i8, ptr %0, i64 %4
  %6 = load i8, ptr %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %88

9:                                                ; preds = %3
  %10 = call i32 @is_hex_character(i8 noundef signext %6)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %78

12:                                               ; preds = %9
  %13 = call ptr @__ctype_b_loc() #6
  %14 = load ptr, ptr %13, align 8
  %15 = sext i8 %6 to i32
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i16, ptr %14, i64 %16
  %18 = load i16, ptr %17, align 2
  %19 = zext i16 %18 to i32
  %20 = and i32 %19, 2048
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %45

22:                                               ; preds = %12
  %23 = call ptr @__ctype_b_loc() #6
  %24 = load ptr, ptr %23, align 8
  %25 = sext i8 %6 to i32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, ptr %24, i64 %26
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i32
  %30 = and i32 %29, 2048
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %35

32:                                               ; preds = %22
  %33 = sext i8 %6 to i32
  %34 = sub nsw i32 %33, 48
  br label %39

35:                                               ; preds = %22
  %36 = sext i8 %6 to i32
  %37 = sub nsw i32 %36, 65
  %38 = add nsw i32 %37, 10
  br label %39

39:                                               ; preds = %35, %32
  %40 = phi i32 [ %34, %32 ], [ %38, %35 ]
  %41 = trunc i32 %40 to i8
  %42 = add nsw i32 %.01, 1
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds i8, ptr %1, i64 %43
  store i8 %41, ptr %44, align 1
  br label %68

45:                                               ; preds = %12
  %46 = call ptr @__ctype_b_loc() #6
  %47 = load ptr, ptr %46, align 8
  %48 = sext i8 %6 to i32
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i16, ptr %47, i64 %49
  %51 = load i16, ptr %50, align 2
  %52 = zext i16 %51 to i32
  %53 = and i32 %52, 1024
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %58

55:                                               ; preds = %45
  %56 = sext i8 %6 to i32
  %57 = sub nsw i32 %56, 65
  br label %62

58:                                               ; preds = %45
  %59 = sext i8 %6 to i32
  %60 = sub nsw i32 %59, 48
  %61 = sub nsw i32 %60, 10
  br label %62

62:                                               ; preds = %58, %55
  %63 = phi i32 [ %57, %55 ], [ %61, %58 ]
  %64 = trunc i32 %63 to i8
  %65 = add nsw i32 %.01, 1
  %66 = sext i32 %.01 to i64
  %67 = getelementptr inbounds i8, ptr %1, i64 %66
  store i8 %64, ptr %67, align 1
  br label %68

68:                                               ; preds = %62, %39
  %.1 = phi i32 [ %42, %39 ], [ %65, %62 ]
  %69 = add nsw i32 %.02, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, ptr %0, i64 %70
  %72 = load i8, ptr %71, align 1
  %73 = call i32 @is_hex_character(i8 noundef signext %72)
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %77

75:                                               ; preds = %68
  %76 = add nsw i32 %.02, 1
  br label %77

77:                                               ; preds = %75, %68
  %.13 = phi i32 [ %76, %75 ], [ %.02, %68 ]
  br label %86

78:                                               ; preds = %9
  %79 = icmp sgt i32 %.01, 0
  br i1 %79, label %80, label %83

80:                                               ; preds = %78
  %81 = add nsw i32 %.02, 1
  %82 = add nsw i32 %.01, -1
  br label %85

83:                                               ; preds = %78
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %91

85:                                               ; preds = %80
  br label %86

86:                                               ; preds = %85, %77
  %.24 = phi i32 [ %.13, %77 ], [ %81, %85 ]
  %.2 = phi i32 [ %.1, %77 ], [ %82, %85 ]
  %87 = add nsw i32 %.24, 1
  br label %3, !llvm.loop !8

88:                                               ; preds = %3
  %89 = getelementptr inbounds i8, ptr %1, i64 50
  store i8 0, ptr %89, align 1
  %90 = add nsw i32 %.01, 1
  br label %91

91:                                               ; preds = %88, %83
  %.0 = phi i32 [ 0, %83 ], [ %90, %88 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [50 x i8], align 16
  %2 = alloca [100 x i8], align 16
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %4 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call ptr @fgets(ptr noundef %4, i32 noundef 100, ptr noundef %5)
  %7 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %8 = call i64 @strcspn(ptr noundef %7, ptr noundef @.str.4) #7
  %9 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %8
  store i8 0, ptr %9, align 1
  %10 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %11 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %12 = call i32 @hex_string_to_array(ptr noundef %10, ptr noundef %11)
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %0
  %15 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  call void @print_hex(ptr noundef %15)
  br label %16

16:                                               ; preds = %14, %0
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strcspn(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(none) }
attributes #7 = { nounwind willreturn memory(read) }

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
