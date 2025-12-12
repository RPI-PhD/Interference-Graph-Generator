; ModuleID = 'DATASETv2/gpt35-52803.c'
source_filename = "DATASETv2/gpt35-52803.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"Error at line %d: '%s' is not in dictionary\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"dictionary.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"Error: Could not open dictionary file\0A\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"Enter text to be spell checked:\0A\00", align 1
@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_str_valid(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %43, %1
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = load ptr, ptr %3, align 8
  %9 = call i64 @strlen(ptr noundef %8) #5
  %10 = icmp ult i64 %7, %9
  br i1 %10, label %11, label %46

11:                                               ; preds = %5
  %12 = call ptr @__ctype_b_loc() #6
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr %14, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, ptr %13, i64 %20
  %22 = load i16, ptr %21, align 2
  %23 = zext i16 %22 to i32
  %24 = and i32 %23, 1024
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %42, label %26

26:                                               ; preds = %11
  %27 = call ptr @__ctype_b_loc() #6
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, ptr %29, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, ptr %28, i64 %35
  %37 = load i16, ptr %36, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 8192
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %42, label %41

41:                                               ; preds = %26
  store i32 0, ptr %2, align 4
  br label %47

42:                                               ; preds = %26, %11
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %4, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %4, align 4
  br label %5, !llvm.loop !6

46:                                               ; preds = %5
  store i32 1, ptr %2, align 4
  br label %47

47:                                               ; preds = %46, %41
  %48 = load i32, ptr %2, align 4
  ret i32 %48
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @convert_lowercase(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %23, %1
  %5 = load i32, ptr %3, align 4
  %6 = sext i32 %5 to i64
  %7 = load ptr, ptr %2, align 8
  %8 = call i64 @strlen(ptr noundef %7) #5
  %9 = icmp ult i64 %6, %8
  br i1 %9, label %10, label %26

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, ptr %11, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = call i32 @tolower(i32 noundef %16) #5
  %18 = trunc i32 %17 to i8
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, ptr %19, i64 %21
  store i8 %18, ptr %22, align 1
  br label %23

23:                                               ; preds = %10
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %4, !llvm.loop !8

26:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @trim(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %16, %1
  %5 = call ptr @__ctype_b_loc() #6
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i16, ptr %6, i64 %10
  %12 = load i16, ptr %11, align 2
  %13 = zext i16 %12 to i32
  %14 = and i32 %13, 8192
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

16:                                               ; preds = %4
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds i8, ptr %17, i32 1
  store ptr %18, ptr %2, align 8
  br label %4, !llvm.loop !9

19:                                               ; preds = %4
  %20 = load ptr, ptr %2, align 8
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %19
  br label %55

25:                                               ; preds = %19
  %26 = load ptr, ptr %2, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = call i64 @strlen(ptr noundef %27) #5
  %29 = getelementptr inbounds i8, ptr %26, i64 %28
  %30 = getelementptr inbounds i8, ptr %29, i64 -1
  store ptr %30, ptr %3, align 8
  br label %31

31:                                               ; preds = %49, %25
  %32 = load ptr, ptr %3, align 8
  %33 = load ptr, ptr %2, align 8
  %34 = icmp ugt ptr %32, %33
  br i1 %34, label %35, label %47

35:                                               ; preds = %31
  %36 = call ptr @__ctype_b_loc() #6
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = load i8, ptr %38, align 1
  %40 = zext i8 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, ptr %37, i64 %41
  %43 = load i16, ptr %42, align 2
  %44 = zext i16 %43 to i32
  %45 = and i32 %44, 8192
  %46 = icmp ne i32 %45, 0
  br label %47

47:                                               ; preds = %35, %31
  %48 = phi i1 [ false, %31 ], [ %46, %35 ]
  br i1 %48, label %49, label %52

49:                                               ; preds = %47
  %50 = load ptr, ptr %3, align 8
  %51 = getelementptr inbounds i8, ptr %50, i32 -1
  store ptr %51, ptr %3, align 8
  br label %31, !llvm.loop !10

52:                                               ; preds = %47
  %53 = load ptr, ptr %3, align 8
  %54 = getelementptr inbounds i8, ptr %53, i64 1
  store i8 0, ptr %54, align 1
  br label %55

55:                                               ; preds = %52, %24
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @spell_check(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [100 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %8, align 4
  %10 = load ptr, ptr %3, align 8
  call void @convert_lowercase(ptr noundef %10)
  %11 = load ptr, ptr %3, align 8
  call void @trim(ptr noundef %11)
  %12 = load ptr, ptr %3, align 8
  %13 = call ptr @strtok(ptr noundef %12, ptr noundef @.str) #7
  store ptr %13, ptr %9, align 8
  br label %14

14:                                               ; preds = %47, %2
  %15 = load ptr, ptr %9, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %51

17:                                               ; preds = %14
  %18 = load ptr, ptr %9, align 8
  %19 = call i32 @is_str_valid(ptr noundef %18)
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %47

21:                                               ; preds = %17
  %22 = load ptr, ptr %4, align 8
  %23 = call i32 @fseek(ptr noundef %22, i64 noundef 0, i32 noundef 0)
  store i32 0, ptr %7, align 4
  br label %24

24:                                               ; preds = %37, %21
  %25 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %26 = load ptr, ptr %4, align 8
  %27 = call ptr @fgets(ptr noundef %25, i32 noundef 100, ptr noundef %26)
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %38

29:                                               ; preds = %24
  %30 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  call void @convert_lowercase(ptr noundef %30)
  %31 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  call void @trim(ptr noundef %31)
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %34 = call i32 @strcmp(ptr noundef %32, ptr noundef %33) #5
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %29
  store i32 1, ptr %7, align 4
  br label %38

37:                                               ; preds = %29
  br label %24, !llvm.loop !11

38:                                               ; preds = %36, %24
  %39 = load i32, ptr %7, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %46, label %41

41:                                               ; preds = %38
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, 1
  %44 = load ptr, ptr %9, align 8
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %43, ptr noundef %44)
  br label %46

46:                                               ; preds = %41, %38
  br label %47

47:                                               ; preds = %46, %17
  %48 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #7
  store ptr %48, ptr %9, align 8
  %49 = load i32, ptr %8, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %8, align 4
  br label %14, !llvm.loop !12

51:                                               ; preds = %14
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %5 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %10, label %8

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %1, align 4
  br label %19

10:                                               ; preds = %0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %12 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %13 = load ptr, ptr @stdin, align 8
  %14 = call ptr @fgets(ptr noundef %12, i32 noundef 1000, ptr noundef %13)
  %15 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %16 = load ptr, ptr %4, align 8
  call void @spell_check(ptr noundef %15, ptr noundef %16)
  %17 = load ptr, ptr %4, align 8
  %18 = call i32 @fclose(ptr noundef %17)
  store i32 0, ptr %1, align 4
  br label %19

19:                                               ; preds = %10, %8
  %20 = load i32, ptr %1, align 4
  ret i32 %20
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #4

declare i32 @fclose(ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind willreturn memory(none) }
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
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
