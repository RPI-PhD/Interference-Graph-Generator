; ModuleID = 'DATASETv2/falcon180b-39820.c'
source_filename = "DATASETv2/falcon180b-39820.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [50 x i8] c"Enter a password (between %d and %d characters):\0A\00", align 1
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [20 x i8] c"Password is valid.\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Password is not valid.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [32 x i8], align 16
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %21, %0
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 3
  br i1 %6, label %7, label %22

7:                                                ; preds = %4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 8, i32 noundef 32)
  %9 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %10 = load ptr, ptr @stdin, align 8
  %11 = call ptr @fgets(ptr noundef %9, i32 noundef 32, ptr noundef %10)
  %12 = getelementptr inbounds [32 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 @is_valid_password(ptr noundef %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %7
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %22

17:                                               ; preds = %7
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %19 = load i32, ptr %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %3, align 4
  br label %21

21:                                               ; preds = %17
  br label %4, !llvm.loop !6

22:                                               ; preds = %15, %4
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_valid_password(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = call i64 @strlen(ptr noundef %11) #4
  %13 = trunc i64 %12 to i32
  store i32 %13, ptr %4, align 4
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 8
  br i1 %15, label %19, label %16

16:                                               ; preds = %1
  %17 = load i32, ptr %4, align 4
  %18 = icmp sgt i32 %17, 32
  br i1 %18, label %19, label %20

19:                                               ; preds = %16, %1
  store i32 0, ptr %2, align 4
  br label %102

20:                                               ; preds = %16
  store i32 0, ptr %9, align 4
  br label %21

21:                                               ; preds = %85, %20
  %22 = load i32, ptr %9, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %88

25:                                               ; preds = %21
  %26 = load ptr, ptr %3, align 8
  %27 = load i32, ptr %9, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %26, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  %32 = call i32 @tolower(i32 noundef %31) #4
  %33 = trunc i32 %32 to i8
  store i8 %33, ptr %10, align 1
  %34 = call ptr @__ctype_b_loc() #5
  %35 = load ptr, ptr %34, align 8
  %36 = load i8, ptr %10, align 1
  %37 = sext i8 %36 to i32
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, ptr %35, i64 %38
  %40 = load i16, ptr %39, align 2
  %41 = zext i16 %40 to i32
  %42 = and i32 %41, 1024
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %58

44:                                               ; preds = %25
  %45 = call ptr @__ctype_b_loc() #5
  %46 = load ptr, ptr %45, align 8
  %47 = load i8, ptr %10, align 1
  %48 = sext i8 %47 to i32
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i16, ptr %46, i64 %49
  %51 = load i16, ptr %50, align 2
  %52 = zext i16 %51 to i32
  %53 = and i32 %52, 256
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

55:                                               ; preds = %44
  store i32 1, ptr %5, align 4
  br label %57

56:                                               ; preds = %44
  store i32 1, ptr %6, align 4
  br label %57

57:                                               ; preds = %56, %55
  br label %84

58:                                               ; preds = %25
  %59 = call ptr @__ctype_b_loc() #5
  %60 = load ptr, ptr %59, align 8
  %61 = load i8, ptr %10, align 1
  %62 = sext i8 %61 to i32
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i16, ptr %60, i64 %63
  %65 = load i16, ptr %64, align 2
  %66 = zext i16 %65 to i32
  %67 = and i32 %66, 2048
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %70

69:                                               ; preds = %58
  store i32 1, ptr %7, align 4
  br label %83

70:                                               ; preds = %58
  %71 = call ptr @__ctype_b_loc() #5
  %72 = load ptr, ptr %71, align 8
  %73 = load i8, ptr %10, align 1
  %74 = sext i8 %73 to i32
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i16, ptr %72, i64 %75
  %77 = load i16, ptr %76, align 2
  %78 = zext i16 %77 to i32
  %79 = and i32 %78, 8
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %82, label %81

81:                                               ; preds = %70
  store i32 1, ptr %8, align 4
  br label %82

82:                                               ; preds = %81, %70
  br label %83

83:                                               ; preds = %82, %69
  br label %84

84:                                               ; preds = %83, %57
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %9, align 4
  br label %21, !llvm.loop !8

88:                                               ; preds = %21
  %89 = load i32, ptr %5, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %101

91:                                               ; preds = %88
  %92 = load i32, ptr %6, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %101

94:                                               ; preds = %91
  %95 = load i32, ptr %7, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %101

97:                                               ; preds = %94
  %98 = load i32, ptr %8, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %97
  store i32 1, ptr %2, align 4
  br label %102

101:                                              ; preds = %97, %94, %91, %88
  store i32 0, ptr %2, align 4
  br label %102

102:                                              ; preds = %101, %100, %19
  %103 = load i32, ptr %2, align 4
  ret i32 %103
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
