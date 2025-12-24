; ModuleID = 'LLVM_IR/gpt4o_mini-15310.ll'
source_filename = "DATASETv2/gpt4o_mini-15310.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c" .:-=+*%@#\00", align 1
@grayScaleMap = dso_local global ptr @.str, align 8
@.str.1 = private unnamed_addr constant [37 x i8] c"Welcome to the ASCII Art Converter!\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"This program will take your beautiful bytes\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"and jazz them up into ASCII! It's like a\0A\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"makeover, but for images! \0A\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"Usage:\0A\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"  ./ascii_art_converter <input_image.ppm>\0A\00", align 1
@.str.7 = private unnamed_addr constant [56 x i8] c"Don\E2\80\99t forget to provide a party hat for your image!\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@stderr = external global ptr, align 8
@.str.9 = private unnamed_addr constant [42 x i8] c"Oops! Cannot find the fabulous image: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"%d %d %d\00", align 1
@.str.12 = private unnamed_addr constant [52 x i8] c"\0AConverting your image to ASCII... Please wait...\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [50 x i8] c"Yikes! This program only supports P6 PPM images!\0A\00", align 1
@.str.14 = private unnamed_addr constant [73 x i8] c"\0AYour masterpiece is ready! Hang it on the wall, or send it to grandma!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printHelp() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @convertImageToASCII(ptr noundef %0) #0 {
  %2 = alloca [3 x i8], align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str.8)
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %1
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef @.str.9, ptr noundef %0)
  call void @exit(i32 noundef 1) #3
  unreachable

14:                                               ; preds = %1
  %15 = getelementptr inbounds [3 x i8], ptr %2, i64 0, i64 0
  %16 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %9, ptr noundef @.str.10, ptr noundef %15)
  %17 = getelementptr inbounds [3 x i8], ptr %2, i64 0, i64 1
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 54
  br i1 %20, label %21, label %60

21:                                               ; preds = %14
  %22 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %9, ptr noundef @.str.11, ptr noundef %3, ptr noundef %4, ptr noundef %5)
  %23 = call i32 @fgetc(ptr noundef %9)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %25

25:                                               ; preds = %57, %21
  %.01 = phi i32 [ 0, %21 ], [ %58, %57 ]
  %26 = icmp slt i32 %.01, 40
  br i1 %26, label %27, label %59

27:                                               ; preds = %25
  br label %28

28:                                               ; preds = %53, %27
  %.0 = phi i32 [ 0, %27 ], [ %54, %53 ]
  %29 = icmp slt i32 %.0, 80
  br i1 %29, label %30, label %55

30:                                               ; preds = %28
  %31 = call i64 @fread(ptr noundef %6, i64 noundef 1, i64 noundef 1, ptr noundef %9)
  %32 = call i64 @fread(ptr noundef %7, i64 noundef 1, i64 noundef 1, ptr noundef %9)
  %33 = call i64 @fread(ptr noundef %8, i64 noundef 1, i64 noundef 1, ptr noundef %9)
  %34 = load i8, ptr %6, align 1
  %35 = zext i8 %34 to i32
  %36 = load i8, ptr %7, align 1
  %37 = zext i8 %36 to i32
  %38 = add nsw i32 %35, %37
  %39 = load i8, ptr %8, align 1
  %40 = zext i8 %39 to i32
  %41 = add nsw i32 %38, %40
  %42 = sdiv i32 %41, 3
  %43 = trunc i32 %42 to i8
  %44 = zext i8 %43 to i32
  %45 = mul nsw i32 %44, 69
  %46 = sdiv i32 %45, 255
  %47 = load ptr, ptr @grayScaleMap, align 8
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds i8, ptr %47, i64 %48
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = call i32 @putchar(i32 noundef %51)
  br label %53

53:                                               ; preds = %30
  %54 = add nsw i32 %.0, 1
  br label %28, !llvm.loop !6

55:                                               ; preds = %28
  %56 = call i32 @putchar(i32 noundef 10)
  br label %57

57:                                               ; preds = %55
  %58 = add nsw i32 %.01, 1
  br label %25, !llvm.loop !8

59:                                               ; preds = %25
  br label %64

60:                                               ; preds = %14
  %61 = load ptr, ptr @stderr, align 8
  %62 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %61, ptr noundef @.str.13)
  %63 = call i32 @fclose(ptr noundef %9)
  call void @exit(i32 noundef 1) #3
  unreachable

64:                                               ; preds = %59
  %65 = call i32 @fclose(ptr noundef %9)
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

declare i32 @fgetc(ptr noundef) #1

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i32 @putchar(i32 noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp slt i32 %0, 2
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  call void @printHelp()
  br label %8

5:                                                ; preds = %2
  %6 = getelementptr inbounds ptr, ptr %1, i64 1
  %7 = load ptr, ptr %6, align 8
  call void @convertImageToASCII(ptr noundef %7)
  br label %8

8:                                                ; preds = %5, %4
  %.0 = phi i32 [ 1, %4 ], [ 0, %5 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

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
