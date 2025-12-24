; ModuleID = 'LLVM_IR/gpt4o_mini-4565.ll'
source_filename = "DATASETv2/gpt4o_mini-4565.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [39 x i8] c"Unable to open input image for reading\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"Unable to open output image for writing\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Message is too large to encode in this image\0A\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"Unable to open image for reading\00", align 1
@.str.6 = private unnamed_addr constant [96 x i8] c"Usage: %s <encode/decode> <input_image> <output_image/message.txt> <message (for encode only)>\0A\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"encode\00", align 1
@.str.8 = private unnamed_addr constant [38 x i8] c"Message encoded successfully into %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"decode\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"Decoded message: %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [53 x i8] c"Invalid operation. Please use 'encode' or 'decode'.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @encode_image(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

7:                                                ; preds = %3
  %8 = call noalias ptr @fopen(ptr noundef %1, ptr noundef @.str.2)
  %9 = icmp ne ptr %8, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = call i32 @fclose(ptr noundef %4)
  call void @perror(ptr noundef @.str.3) #7
  call void @exit(i32 noundef 1) #8
  unreachable

12:                                               ; preds = %7
  %13 = call i32 @fseek(ptr noundef %4, i64 noundef 0, i32 noundef 2)
  %14 = call i64 @ftell(ptr noundef %4)
  %15 = call i32 @fseek(ptr noundef %4, i64 noundef 0, i32 noundef 0)
  %16 = call noalias ptr @malloc(i64 noundef %14) #9
  %17 = call i64 @fread(ptr noundef %16, i64 noundef 1, i64 noundef %14, ptr noundef %4)
  %18 = call i64 @strlen(ptr noundef %2) #10
  %19 = trunc i64 %18 to i32
  %20 = mul nsw i32 %19, 8
  %21 = sext i32 %20 to i64
  %22 = sext i32 54 to i64
  %23 = sub nsw i64 %14, %22
  %24 = icmp sgt i64 %21, %23
  br i1 %24, label %25, label %29

25:                                               ; preds = %12
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  call void @free(ptr noundef %16) #11
  %27 = call i32 @fclose(ptr noundef %4)
  %28 = call i32 @fclose(ptr noundef %8)
  call void @exit(i32 noundef 1) #8
  unreachable

29:                                               ; preds = %12
  br label %30

30:                                               ; preds = %61, %29
  %.02 = phi i32 [ 54, %29 ], [ %.1, %61 ]
  %.01 = phi i32 [ 0, %29 ], [ %62, %61 ]
  %31 = icmp slt i32 %.01, %19
  br i1 %31, label %32, label %63

32:                                               ; preds = %30
  br label %33

33:                                               ; preds = %58, %32
  %.1 = phi i32 [ %.02, %32 ], [ %57, %58 ]
  %.0 = phi i32 [ 0, %32 ], [ %59, %58 ]
  %34 = icmp slt i32 %.0, 8
  br i1 %34, label %35, label %60

35:                                               ; preds = %33
  %36 = sext i32 %.01 to i64
  %37 = getelementptr inbounds i8, ptr %2, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = sub nsw i32 7, %.0
  %41 = ashr i32 %39, %40
  %42 = and i32 %41, 1
  %43 = trunc i32 %42 to i8
  %44 = sext i32 %.1 to i64
  %45 = getelementptr inbounds i8, ptr %16, i64 %44
  %46 = load i8, ptr %45, align 1
  %47 = zext i8 %46 to i32
  %48 = and i32 %47, 254
  %49 = trunc i32 %48 to i8
  store i8 %49, ptr %45, align 1
  %50 = zext i8 %43 to i32
  %51 = sext i32 %.1 to i64
  %52 = getelementptr inbounds i8, ptr %16, i64 %51
  %53 = load i8, ptr %52, align 1
  %54 = zext i8 %53 to i32
  %55 = or i32 %54, %50
  %56 = trunc i32 %55 to i8
  store i8 %56, ptr %52, align 1
  %57 = add nsw i32 %.1, 1
  br label %58

58:                                               ; preds = %35
  %59 = add nsw i32 %.0, 1
  br label %33, !llvm.loop !6

60:                                               ; preds = %33
  br label %61

61:                                               ; preds = %60
  %62 = add nsw i32 %.01, 1
  br label %30, !llvm.loop !8

63:                                               ; preds = %30
  %64 = call i64 @fwrite(ptr noundef %16, i64 noundef 1, i64 noundef %14, ptr noundef %8)
  call void @free(ptr noundef %16) #11
  %65 = call i32 @fclose(ptr noundef %4)
  %66 = call i32 @fclose(ptr noundef %8)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare i32 @fclose(ptr noundef) #1

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #1

declare i64 @ftell(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #6

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @decode_image(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  call void @perror(ptr noundef @.str.5) #7
  call void @exit(i32 noundef 1) #8
  unreachable

7:                                                ; preds = %3
  %8 = call i32 @fseek(ptr noundef %4, i64 noundef 0, i32 noundef 2)
  %9 = call i64 @ftell(ptr noundef %4)
  %10 = call i32 @fseek(ptr noundef %4, i64 noundef 0, i32 noundef 0)
  %11 = call noalias ptr @malloc(i64 noundef %9) #9
  %12 = call i64 @fread(ptr noundef %11, i64 noundef 1, i64 noundef %9, ptr noundef %4)
  br label %13

13:                                               ; preds = %43, %7
  %.03 = phi i32 [ 0, %7 ], [ %40, %43 ]
  %.02 = phi i32 [ 54, %7 ], [ %44, %43 ]
  %14 = sext i32 %.02 to i64
  %15 = icmp slt i64 %14, %9
  br i1 %15, label %16, label %45

16:                                               ; preds = %13
  %17 = sext i32 %.03 to i64
  %18 = sub i64 %2, 1
  %19 = icmp uge i64 %17, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  br label %45

21:                                               ; preds = %16
  br label %22

22:                                               ; preds = %37, %21
  %.1 = phi i32 [ %.02, %21 ], [ %36, %37 ]
  %.01 = phi i8 [ 0, %21 ], [ %35, %37 ]
  %.0 = phi i32 [ 0, %21 ], [ %38, %37 ]
  %23 = icmp slt i32 %.0, 8
  br i1 %23, label %24, label %39

24:                                               ; preds = %22
  %25 = zext i8 %.01 to i32
  %26 = shl i32 %25, 1
  %27 = trunc i32 %26 to i8
  %28 = sext i32 %.1 to i64
  %29 = getelementptr inbounds i8, ptr %11, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  %32 = and i32 %31, 1
  %33 = zext i8 %27 to i32
  %34 = or i32 %33, %32
  %35 = trunc i32 %34 to i8
  %36 = add nsw i32 %.1, 1
  br label %37

37:                                               ; preds = %24
  %38 = add nsw i32 %.0, 1
  br label %22, !llvm.loop !9

39:                                               ; preds = %22
  %40 = add nsw i32 %.03, 1
  %41 = sext i32 %.03 to i64
  %42 = getelementptr inbounds i8, ptr %1, i64 %41
  store i8 %.01, ptr %42, align 1
  br label %43

43:                                               ; preds = %39
  %44 = add nsw i32 %.1, 1
  br label %13, !llvm.loop !10

45:                                               ; preds = %20, %13
  %46 = sext i32 %.03 to i64
  %47 = getelementptr inbounds i8, ptr %1, i64 %46
  store i8 0, ptr %47, align 1
  call void @free(ptr noundef %11) #11
  %48 = call i32 @fclose(ptr noundef %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [1000 x i8], align 16
  %4 = icmp slt i32 %0, 5
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = getelementptr inbounds ptr, ptr %1, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %7)
  br label %39

9:                                                ; preds = %2
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.7) #10
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %24

14:                                               ; preds = %9
  %15 = getelementptr inbounds ptr, ptr %1, i64 2
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds ptr, ptr %1, i64 3
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds ptr, ptr %1, i64 4
  %20 = load ptr, ptr %19, align 8
  call void @encode_image(ptr noundef %16, ptr noundef %18, ptr noundef %20)
  %21 = getelementptr inbounds ptr, ptr %1, i64 3
  %22 = load ptr, ptr %21, align 8
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %22)
  br label %38

24:                                               ; preds = %9
  %25 = getelementptr inbounds ptr, ptr %1, i64 1
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @strcmp(ptr noundef %26, ptr noundef @.str.9) #10
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %35

29:                                               ; preds = %24
  %30 = getelementptr inbounds ptr, ptr %1, i64 2
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds [1000 x i8], ptr %3, i64 0, i64 0
  call void @decode_image(ptr noundef %31, ptr noundef %32, i64 noundef 1000)
  %33 = getelementptr inbounds [1000 x i8], ptr %3, i64 0, i64 0
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %33)
  br label %37

35:                                               ; preds = %24
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %39

37:                                               ; preds = %29
  br label %38

38:                                               ; preds = %37, %14
  br label %39

39:                                               ; preds = %38, %35, %5
  %.0 = phi i32 [ 1, %5 ], [ 0, %38 ], [ 1, %35 ]
  ret i32 %.0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind allocsize(0) }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { nounwind }

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
