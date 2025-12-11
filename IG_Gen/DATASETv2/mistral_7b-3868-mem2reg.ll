; ModuleID = 'DATASETv2/mistral_7b-3868.ll'
source_filename = "DATASETv2/mistral_7b-3868.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"Usage: %s input_file output_file\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.5 = private unnamed_addr constant [52 x i8] c"Reversed words in the file have been written to %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @reverse_string(ptr noundef %0) #0 {
  %2 = call i64 @strlen(ptr noundef %0) #6
  %3 = sub i64 %2, 1
  %4 = trunc i64 %3 to i32
  br label %5

5:                                                ; preds = %7, %1
  %.01 = phi i32 [ 0, %1 ], [ %18, %7 ]
  %.0 = phi i32 [ %4, %1 ], [ %19, %7 ]
  %6 = icmp slt i32 %.01, %.0
  br i1 %6, label %7, label %20

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
  %18 = add nsw i32 %.01, 1
  %19 = add nsw i32 %.0, -1
  br label %5, !llvm.loop !6

20:                                               ; preds = %5
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @reverse_words(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %31, %1
  %.01 = phi ptr [ %0, %1 ], [ %.2, %31 ]
  %.0 = phi ptr [ %0, %1 ], [ %.1, %31 ]
  %3 = load i8, ptr %.0, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %32

6:                                                ; preds = %2
  %7 = load i8, ptr %.0, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, 32
  br i1 %9, label %10, label %29

10:                                               ; preds = %6
  %11 = getelementptr inbounds i8, ptr %.0, i64 -1
  br label %12

12:                                               ; preds = %24, %10
  %.12 = phi ptr [ %.01, %10 ], [ %15, %24 ]
  %13 = call ptr @__ctype_b_loc() #7
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds i8, ptr %.12, i32 -1
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i16, ptr %14, i64 %18
  %20 = load i16, ptr %19, align 2
  %21 = zext i16 %20 to i32
  %22 = and i32 %21, 8192
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %12
  br label %12, !llvm.loop !8

25:                                               ; preds = %12
  %26 = getelementptr inbounds i8, ptr %15, i64 1
  call void @reverse_string(ptr noundef %26)
  %27 = getelementptr inbounds i8, ptr %11, i64 1
  call void @reverse_string(ptr noundef %27)
  %28 = getelementptr inbounds i8, ptr %.0, i32 1
  br label %31

29:                                               ; preds = %6
  %30 = getelementptr inbounds i8, ptr %.0, i32 1
  br label %31

31:                                               ; preds = %29, %25
  %.2 = phi ptr [ %15, %25 ], [ %.01, %29 ]
  %.1 = phi ptr [ %28, %25 ], [ %30, %29 ]
  br label %2, !llvm.loop !9

32:                                               ; preds = %2
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [1024 x i8], align 16
  %4 = alloca [1024 x i8], align 16
  %5 = icmp ne i32 %0, 3
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %8)
  br label %39

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str.1)
  %14 = getelementptr inbounds ptr, ptr %1, i64 2
  %15 = load ptr, ptr %14, align 8
  %16 = call noalias ptr @fopen(ptr noundef %15, ptr noundef @.str.2)
  %17 = icmp eq ptr %13, null
  br i1 %17, label %20, label %18

18:                                               ; preds = %10
  %19 = icmp eq ptr %16, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %18, %10
  call void @perror(ptr noundef @.str.3) #8
  br label %39

21:                                               ; preds = %18
  br label %22

22:                                               ; preds = %26, %21
  %23 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %24 = call ptr @fgets(ptr noundef %23, i32 noundef 1024, ptr noundef %13)
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %33

26:                                               ; preds = %22
  %27 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  call void @reverse_words(ptr noundef %27)
  %28 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %29 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %30 = call ptr @strcpy(ptr noundef %28, ptr noundef %29) #9
  %31 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %32 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %16, ptr noundef @.str.4, ptr noundef %31)
  br label %22, !llvm.loop !10

33:                                               ; preds = %22
  %34 = call i32 @fclose(ptr noundef %13)
  %35 = call i32 @fclose(ptr noundef %16)
  %36 = getelementptr inbounds ptr, ptr %1, i64 2
  %37 = load ptr, ptr %36, align 8
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %37)
  br label %39

39:                                               ; preds = %33, %20, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %20 ], [ 0, %33 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #3

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #5

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

declare i32 @fclose(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { cold }
attributes #9 = { nounwind }

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
