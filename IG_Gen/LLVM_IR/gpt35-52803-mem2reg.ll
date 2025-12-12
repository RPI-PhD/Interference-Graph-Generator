; ModuleID = 'LLVM_IR/gpt35-52803.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_str_valid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %34, %1
  %.01 = phi i32 [ 0, %1 ], [ %35, %34 ]
  %3 = sext i32 %.01 to i64
  %4 = call i64 @strlen(ptr noundef %0) #5
  %5 = icmp ult i64 %3, %4
  br i1 %5, label %6, label %36

6:                                                ; preds = %2
  %7 = call ptr @__ctype_b_loc() #6
  %8 = load ptr, ptr %7, align 8
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds i8, ptr %0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i16, ptr %8, i64 %13
  %15 = load i16, ptr %14, align 2
  %16 = zext i16 %15 to i32
  %17 = and i32 %16, 1024
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %33, label %19

19:                                               ; preds = %6
  %20 = call ptr @__ctype_b_loc() #6
  %21 = load ptr, ptr %20, align 8
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds i8, ptr %0, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, ptr %21, i64 %26
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i32
  %30 = and i32 %29, 8192
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %33, label %32

32:                                               ; preds = %19
  br label %37

33:                                               ; preds = %19, %6
  br label %34

34:                                               ; preds = %33
  %35 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !6

36:                                               ; preds = %2
  br label %37

37:                                               ; preds = %36, %32
  %.0 = phi i32 [ 0, %32 ], [ 1, %36 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @convert_lowercase(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %15, %1
  %.0 = phi i32 [ 0, %1 ], [ %16, %15 ]
  %3 = sext i32 %.0 to i64
  %4 = call i64 @strlen(ptr noundef %0) #5
  %5 = icmp ult i64 %3, %4
  br i1 %5, label %6, label %17

6:                                                ; preds = %2
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = call i32 @tolower(i32 noundef %10) #5
  %12 = trunc i32 %11 to i8
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  store i8 %12, ptr %14, align 1
  br label %15

15:                                               ; preds = %6
  %16 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

17:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @trim(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %13, %1
  %.0 = phi ptr [ %0, %1 ], [ %14, %13 ]
  %3 = call ptr @__ctype_b_loc() #6
  %4 = load ptr, ptr %3, align 8
  %5 = load i8, ptr %.0, align 1
  %6 = zext i8 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i16, ptr %4, i64 %7
  %9 = load i16, ptr %8, align 2
  %10 = zext i16 %9 to i32
  %11 = and i32 %10, 8192
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = getelementptr inbounds i8, ptr %.0, i32 1
  br label %2, !llvm.loop !9

15:                                               ; preds = %2
  %16 = load i8, ptr %.0, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %15
  br label %43

20:                                               ; preds = %15
  %21 = call i64 @strlen(ptr noundef %.0) #5
  %22 = getelementptr inbounds i8, ptr %.0, i64 %21
  %23 = getelementptr inbounds i8, ptr %22, i64 -1
  br label %24

24:                                               ; preds = %39, %20
  %.01 = phi ptr [ %23, %20 ], [ %40, %39 ]
  %25 = icmp ugt ptr %.01, %.0
  br i1 %25, label %26, label %37

26:                                               ; preds = %24
  %27 = call ptr @__ctype_b_loc() #6
  %28 = load ptr, ptr %27, align 8
  %29 = load i8, ptr %.01, align 1
  %30 = zext i8 %29 to i32
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, ptr %28, i64 %31
  %33 = load i16, ptr %32, align 2
  %34 = zext i16 %33 to i32
  %35 = and i32 %34, 8192
  %36 = icmp ne i32 %35, 0
  br label %37

37:                                               ; preds = %26, %24
  %38 = phi i1 [ false, %24 ], [ %36, %26 ]
  br i1 %38, label %39, label %41

39:                                               ; preds = %37
  %40 = getelementptr inbounds i8, ptr %.01, i32 -1
  br label %24, !llvm.loop !10

41:                                               ; preds = %37
  %42 = getelementptr inbounds i8, ptr %.01, i64 1
  store i8 0, ptr %42, align 1
  br label %43

43:                                               ; preds = %41, %19
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @spell_check(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca [100 x i8], align 16
  call void @convert_lowercase(ptr noundef %0)
  call void @trim(ptr noundef %0)
  %4 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #7
  br label %5

5:                                                ; preds = %30, %2
  %.01 = phi i32 [ 0, %2 ], [ %32, %30 ]
  %.0 = phi ptr [ %4, %2 ], [ %31, %30 ]
  %6 = icmp ne ptr %.0, null
  br i1 %6, label %7, label %33

7:                                                ; preds = %5
  %8 = call i32 @is_str_valid(ptr noundef %.0)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %30

10:                                               ; preds = %7
  %11 = call i32 @fseek(ptr noundef %1, i64 noundef 0, i32 noundef 0)
  br label %12

12:                                               ; preds = %23, %10
  %13 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %14 = call ptr @fgets(ptr noundef %13, i32 noundef 100, ptr noundef %1)
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %12
  %17 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @convert_lowercase(ptr noundef %17)
  %18 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  call void @trim(ptr noundef %18)
  %19 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %20 = call i32 @strcmp(ptr noundef %.0, ptr noundef %19) #5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %16
  br label %24

23:                                               ; preds = %16
  br label %12, !llvm.loop !11

24:                                               ; preds = %22, %12
  %.02 = phi i32 [ 1, %22 ], [ 0, %12 ]
  %25 = icmp ne i32 %.02, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %24
  %27 = add nsw i32 %.01, 1
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %27, ptr noundef %.0)
  br label %29

29:                                               ; preds = %26, %24
  br label %30

30:                                               ; preds = %29, %7
  %31 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #7
  %32 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !12

33:                                               ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #3

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i8], align 16
  %2 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  %3 = icmp ne ptr %2, null
  br i1 %3, label %6, label %4

4:                                                ; preds = %0
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %13

6:                                                ; preds = %0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %8 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  %9 = load ptr, ptr @stdin, align 8
  %10 = call ptr @fgets(ptr noundef %8, i32 noundef 1000, ptr noundef %9)
  %11 = getelementptr inbounds [1000 x i8], ptr %1, i64 0, i64 0
  call void @spell_check(ptr noundef %11, ptr noundef %2)
  %12 = call i32 @fclose(ptr noundef %2)
  br label %13

13:                                               ; preds = %6, %4
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #4

declare i32 @fclose(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
