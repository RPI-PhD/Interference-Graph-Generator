; ModuleID = 'DATASETv2/gpt4o_mini-29067.ll'
source_filename = "DATASETv2/gpt4o_mini-29067.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"!@#$%^&*()-=_+[]{}|;:'\22,.<>?/`~\00", align 1
@specialChars = dso_local global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [27 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ\00", align 1
@upperChars = dso_local global ptr @.str.1, align 8
@.str.2 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@lowerChars = dso_local global ptr @.str.2, align 8
@.str.3 = private unnamed_addr constant [11 x i8] c"0123456789\00", align 1
@digitChars = dso_local global ptr @.str.3, align 8
@.str.4 = private unnamed_addr constant [27 x i8] c"#########################\0A\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"#   WARNING! WARNING!   #\0A\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"# For your security,   #\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"# DO NOT share your     #\0A\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"# passwords with anyone!#\0A\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"#########################\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [52 x i8] c"Enter desired password length (between %d and %d): \00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.12 = private unnamed_addr constant [58 x i8] c"Invalid length! Please enter a length between %d and %d: \00", align 1
@.str.13 = private unnamed_addr constant [29 x i8] c"Your secure password is: %s\0A\00", align 1
@.str.14 = private unnamed_addr constant [70 x i8] c"Store it safely! Never share it with anyone. Understand? It's YOURS!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @paranoid_warning() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_strength_valid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %46, %1
  %.07 = phi i32 [ 0, %1 ], [ %.4, %46 ]
  %.04 = phi i32 [ 0, %1 ], [ %.3, %46 ]
  %.02 = phi i32 [ 0, %1 ], [ %.2, %46 ]
  %.01 = phi i32 [ 0, %1 ], [ %.1, %46 ]
  %.0 = phi i32 [ 0, %1 ], [ %47, %46 ]
  %3 = sext i32 %.0 to i64
  %4 = call i64 @strlen(ptr noundef %0) #5
  %5 = icmp ult i64 %3, %4
  br i1 %5, label %6, label %48

6:                                                ; preds = %2
  %7 = load ptr, ptr @upperChars, align 8
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = call ptr @strchr(ptr noundef %7, i32 noundef %11) #5
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  br label %45

15:                                               ; preds = %6
  %16 = load ptr, ptr @lowerChars, align 8
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds i8, ptr %0, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = call ptr @strchr(ptr noundef %16, i32 noundef %20) #5
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %15
  br label %44

24:                                               ; preds = %15
  %25 = load ptr, ptr @digitChars, align 8
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds i8, ptr %0, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = call ptr @strchr(ptr noundef %25, i32 noundef %29) #5
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %33

32:                                               ; preds = %24
  br label %43

33:                                               ; preds = %24
  %34 = load ptr, ptr @specialChars, align 8
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds i8, ptr %0, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = sext i8 %37 to i32
  %39 = call ptr @strchr(ptr noundef %34, i32 noundef %38) #5
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %42

41:                                               ; preds = %33
  br label %42

42:                                               ; preds = %41, %33
  %.18 = phi i32 [ 1, %41 ], [ %.07, %33 ]
  br label %43

43:                                               ; preds = %42, %32
  %.29 = phi i32 [ %.07, %32 ], [ %.18, %42 ]
  %.15 = phi i32 [ 1, %32 ], [ %.04, %42 ]
  br label %44

44:                                               ; preds = %43, %23
  %.310 = phi i32 [ %.07, %23 ], [ %.29, %43 ]
  %.26 = phi i32 [ %.04, %23 ], [ %.15, %43 ]
  %.13 = phi i32 [ 1, %23 ], [ %.02, %43 ]
  br label %45

45:                                               ; preds = %44, %14
  %.4 = phi i32 [ %.07, %14 ], [ %.310, %44 ]
  %.3 = phi i32 [ %.04, %14 ], [ %.26, %44 ]
  %.2 = phi i32 [ %.02, %14 ], [ %.13, %44 ]
  %.1 = phi i32 [ 1, %14 ], [ %.01, %44 ]
  br label %46

46:                                               ; preds = %45
  %47 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

48:                                               ; preds = %2
  %49 = icmp ne i32 %.01, 0
  br i1 %49, label %50, label %56

50:                                               ; preds = %48
  %51 = icmp ne i32 %.02, 0
  br i1 %51, label %52, label %56

52:                                               ; preds = %50
  %53 = icmp ne i32 %.04, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %52
  %55 = icmp ne i32 %.07, 0
  br label %56

56:                                               ; preds = %54, %52, %50, %48
  %57 = phi i1 [ false, %52 ], [ false, %50 ], [ false, %48 ], [ %55, %54 ]
  %58 = zext i1 %57 to i32
  ret i32 %58
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_secure_password(ptr noundef %0, i32 noundef %1) #0 {
  %3 = load ptr, ptr @upperChars, align 8
  %4 = call i64 @strlen(ptr noundef %3) #5
  %5 = load ptr, ptr @lowerChars, align 8
  %6 = call i64 @strlen(ptr noundef %5) #5
  %7 = add i64 %4, %6
  %8 = load ptr, ptr @digitChars, align 8
  %9 = call i64 @strlen(ptr noundef %8) #5
  %10 = add i64 %7, %9
  %11 = load ptr, ptr @specialChars, align 8
  %12 = call i64 @strlen(ptr noundef %11) #5
  %13 = add i64 %10, %12
  %14 = add i64 %13, 1
  %15 = call noalias ptr @malloc(i64 noundef %14) #6
  %16 = load ptr, ptr @upperChars, align 8
  %17 = call ptr @strcpy(ptr noundef %15, ptr noundef %16) #7
  %18 = load ptr, ptr @lowerChars, align 8
  %19 = call ptr @strcat(ptr noundef %15, ptr noundef %18) #7
  %20 = load ptr, ptr @digitChars, align 8
  %21 = call ptr @strcat(ptr noundef %15, ptr noundef %20) #7
  %22 = load ptr, ptr @specialChars, align 8
  %23 = call ptr @strcat(ptr noundef %15, ptr noundef %22) #7
  %24 = call i64 @time(ptr noundef null) #7
  %25 = call i32 @getpid() #7
  %26 = sext i32 %25 to i64
  %27 = xor i64 %24, %26
  %28 = trunc i64 %27 to i32
  call void @srand(i32 noundef %28) #7
  br label %29

29:                                               ; preds = %40, %2
  %.0 = phi i32 [ 0, %2 ], [ %41, %40 ]
  %30 = icmp slt i32 %.0, %1
  br i1 %30, label %31, label %42

31:                                               ; preds = %29
  %32 = call i32 @rand() #7
  %33 = sext i32 %32 to i64
  %34 = call i64 @strlen(ptr noundef %15) #5
  %35 = urem i64 %33, %34
  %36 = getelementptr inbounds i8, ptr %15, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = sext i32 %.0 to i64
  %39 = getelementptr inbounds i8, ptr %0, i64 %38
  store i8 %37, ptr %39, align 1
  br label %40

40:                                               ; preds = %31
  %41 = add nsw i32 %.0, 1
  br label %29, !llvm.loop !8

42:                                               ; preds = %29
  %43 = sext i32 %1 to i64
  %44 = getelementptr inbounds i8, ptr %0, i64 %43
  store i8 0, ptr %44, align 1
  call void @free(ptr noundef %15) #7
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare void @srand(i32 noundef) #4

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #4

; Function Attrs: nounwind
declare i32 @getpid() #4

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @prompt_for_password_length(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef 12, i32 noundef 20)
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %0)
  br label %4

4:                                                ; preds = %12, %1
  %5 = load i32, ptr %0, align 4
  %6 = icmp slt i32 %5, 12
  br i1 %6, label %10, label %7

7:                                                ; preds = %4
  %8 = load i32, ptr %0, align 4
  %9 = icmp sgt i32 %8, 20
  br label %10

10:                                               ; preds = %7, %4
  %11 = phi i1 [ true, %4 ], [ %9, %7 ]
  br i1 %11, label %12, label %15

12:                                               ; preds = %10
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef 12, i32 noundef 20)
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %0)
  br label %4, !llvm.loop !9

15:                                               ; preds = %10
  ret void
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [21 x i8], align 16
  %2 = alloca i32, align 4
  call void @paranoid_warning()
  call void @prompt_for_password_length(ptr noundef %2)
  br label %3

3:                                                ; preds = %6, %0
  %4 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %5 = load i32, ptr %2, align 4
  call void @generate_secure_password(ptr noundef %4, i32 noundef %5)
  br label %6

6:                                                ; preds = %3
  %7 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %8 = call i32 @is_strength_valid(ptr noundef %7)
  %9 = icmp ne i32 %8, 0
  %10 = xor i1 %9, true
  br i1 %10, label %3, label %11, !llvm.loop !10

11:                                               ; preds = %6
  %12 = getelementptr inbounds [21 x i8], ptr %1, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }

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
