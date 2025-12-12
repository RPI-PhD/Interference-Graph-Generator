; ModuleID = 'LLVM_IR/falcon180b-15465.ll'
source_filename = "DATASETv2/falcon180b-15465.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"Enter a string: \00", align 1
@stdin = external global ptr, align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"Original string: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"String with whitespace removed: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Capitalized string: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Reversed string: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"String with escaped sequences: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\\\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [100 x i8], align 16
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %3 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef %3, i32 noundef 100, ptr noundef %4)
  %6 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %6)
  %8 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @remove_whitespace(ptr noundef %8)
  %9 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %9)
  %11 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @capitalize_string(ptr noundef %11)
  %12 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %12)
  %14 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @reverse_string(ptr noundef %14)
  %15 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %15)
  %17 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  call void @escape_sequences(ptr noundef %17)
  %18 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %18)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_whitespace(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %29, %1
  %.01 = phi i32 [ 0, %1 ], [ %30, %29 ]
  %.0 = phi i32 [ 0, %1 ], [ %.1, %29 ]
  %3 = sext i32 %.01 to i64
  %4 = getelementptr inbounds i8, ptr %0, i64 %3
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %31

8:                                                ; preds = %2
  %9 = call ptr @__ctype_b_loc() #4
  %10 = load ptr, ptr %9, align 8
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds i8, ptr %0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i16, ptr %10, i64 %15
  %17 = load i16, ptr %16, align 2
  %18 = zext i16 %17 to i32
  %19 = and i32 %18, 8192
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %28, label %21

21:                                               ; preds = %8
  %22 = sext i32 %.01 to i64
  %23 = getelementptr inbounds i8, ptr %0, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds i8, ptr %0, i64 %25
  store i8 %24, ptr %26, align 1
  %27 = add nsw i32 %.0, 1
  br label %28

28:                                               ; preds = %21, %8
  %.1 = phi i32 [ %.0, %8 ], [ %27, %21 ]
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !6

31:                                               ; preds = %2
  %32 = sext i32 %.0 to i64
  %33 = getelementptr inbounds i8, ptr %0, i64 %32
  store i8 0, ptr %33, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @capitalize_string(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %31, %1
  %.0 = phi i32 [ 0, %1 ], [ %32, %31 ]
  %3 = sext i32 %.0 to i64
  %4 = getelementptr inbounds i8, ptr %0, i64 %3
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %33

8:                                                ; preds = %2
  %9 = call ptr @__ctype_b_loc() #4
  %10 = load ptr, ptr %9, align 8
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds i8, ptr %0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i16, ptr %10, i64 %15
  %17 = load i16, ptr %16, align 2
  %18 = zext i16 %17 to i32
  %19 = and i32 %18, 1024
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %30

21:                                               ; preds = %8
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds i8, ptr %0, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  %26 = call i32 @toupper(i32 noundef %25) #5
  %27 = trunc i32 %26 to i8
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds i8, ptr %0, i64 %28
  store i8 %27, ptr %29, align 1
  br label %30

30:                                               ; preds = %21, %8
  br label %31

31:                                               ; preds = %30
  %32 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

33:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @reverse_string(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #5
  %3 = sub i64 %2, 1
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %18, %1
  %.01 = phi i32 [ 0, %1 ], [ %19, %18 ]
  %.0 = phi i32 [ %4, %1 ], [ %20, %18 ]
  %6 = icmp slt i32 %.01, %.0
  br i1 %6, label %7, label %21

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds i8, ptr %0, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds i8, ptr %0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i32 %.01 to i64
  %15 = getelementptr inbounds i8, ptr %0, i64 %14
  store i8 %13, ptr %15, align 1
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds i8, ptr %0, i64 %16
  store i8 %10, ptr %17, align 1
  br label %18

18:                                               ; preds = %7
  %19 = add nsw i32 %.01, 1
  %20 = add nsw i32 %.0, -1
  br label %5, !llvm.loop !9

21:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @escape_sequences(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %49, %1
  %.01 = phi i32 [ 0, %1 ], [ %50, %49 ]
  %3 = sext i32 %.01 to i64
  %4 = getelementptr inbounds i8, ptr %0, i64 %3
  %5 = load i8, ptr %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %51

8:                                                ; preds = %2
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds i8, ptr %0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = load i8, ptr @.str.6, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %12, %14
  br i1 %15, label %16, label %48

16:                                               ; preds = %8
  %17 = add nsw i32 %.01, 1
  br label %18

18:                                               ; preds = %34, %16
  %.0 = phi i32 [ %17, %16 ], [ %35, %34 ]
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds i8, ptr %0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %32

24:                                               ; preds = %18
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds i8, ptr %0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = load i8, ptr @.str.6, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %28, %30
  br label %32

32:                                               ; preds = %24, %18
  %33 = phi i1 [ false, %18 ], [ %31, %24 ]
  br i1 %33, label %34, label %36

34:                                               ; preds = %32
  %35 = add nsw i32 %.0, 1
  br label %18, !llvm.loop !10

36:                                               ; preds = %32
  %37 = sext i32 %.01 to i64
  %38 = getelementptr inbounds i8, ptr %0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i32 %.0 to i64
  %41 = getelementptr inbounds i8, ptr %0, i64 %40
  %42 = load i8, ptr %41, align 1
  %43 = sext i32 %.01 to i64
  %44 = getelementptr inbounds i8, ptr %0, i64 %43
  store i8 %42, ptr %44, align 1
  %45 = sext i32 %.0 to i64
  %46 = getelementptr inbounds i8, ptr %0, i64 %45
  store i8 %39, ptr %46, align 1
  %47 = sub nsw i32 %.0, 1
  br label %48

48:                                               ; preds = %36, %8
  %.1 = phi i32 [ %47, %36 ], [ %.01, %8 ]
  br label %49

49:                                               ; preds = %48
  %50 = add nsw i32 %.1, 1
  br label %2, !llvm.loop !11

51:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @toupper(i32 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) }
attributes #5 = { nounwind willreturn memory(read) }

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
