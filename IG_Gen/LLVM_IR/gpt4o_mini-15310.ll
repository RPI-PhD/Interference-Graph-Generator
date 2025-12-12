; ModuleID = 'DATASETv2/gpt4o_mini-15310.c'
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

; Function Attrs: noinline nounwind  uwtable
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @convertImageToASCII(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [3 x i8], align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = call noalias ptr @fopen(ptr noundef %15, ptr noundef @.str.8)
  store ptr %16, ptr %3, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %23

19:                                               ; preds = %1
  %20 = load ptr, ptr @stderr, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.9, ptr noundef %21)
  call void @exit(i32 noundef 1) #3
  unreachable

23:                                               ; preds = %1
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds [3 x i8], ptr %4, i64 0, i64 0
  %26 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %24, ptr noundef @.str.10, ptr noundef %25)
  %27 = getelementptr inbounds [3 x i8], ptr %4, i64 0, i64 1
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %29, 54
  br i1 %30, label %31, label %81

31:                                               ; preds = %23
  %32 = load ptr, ptr %3, align 8
  %33 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %32, ptr noundef @.str.11, ptr noundef %5, ptr noundef %6, ptr noundef %7)
  %34 = load ptr, ptr %3, align 8
  %35 = call i32 @fgetc(ptr noundef %34)
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  store i32 0, ptr %8, align 4
  br label %37

37:                                               ; preds = %77, %31
  %38 = load i32, ptr %8, align 4
  %39 = icmp slt i32 %38, 40
  br i1 %39, label %40, label %80

40:                                               ; preds = %37
  store i32 0, ptr %9, align 4
  br label %41

41:                                               ; preds = %72, %40
  %42 = load i32, ptr %9, align 4
  %43 = icmp slt i32 %42, 80
  br i1 %43, label %44, label %75

44:                                               ; preds = %41
  %45 = load ptr, ptr %3, align 8
  %46 = call i64 @fread(ptr noundef %10, i64 noundef 1, i64 noundef 1, ptr noundef %45)
  %47 = load ptr, ptr %3, align 8
  %48 = call i64 @fread(ptr noundef %11, i64 noundef 1, i64 noundef 1, ptr noundef %47)
  %49 = load ptr, ptr %3, align 8
  %50 = call i64 @fread(ptr noundef %12, i64 noundef 1, i64 noundef 1, ptr noundef %49)
  %51 = load i8, ptr %10, align 1
  %52 = zext i8 %51 to i32
  %53 = load i8, ptr %11, align 1
  %54 = zext i8 %53 to i32
  %55 = add nsw i32 %52, %54
  %56 = load i8, ptr %12, align 1
  %57 = zext i8 %56 to i32
  %58 = add nsw i32 %55, %57
  %59 = sdiv i32 %58, 3
  %60 = trunc i32 %59 to i8
  store i8 %60, ptr %13, align 1
  %61 = load i8, ptr %13, align 1
  %62 = zext i8 %61 to i32
  %63 = mul nsw i32 %62, 69
  %64 = sdiv i32 %63, 255
  store i32 %64, ptr %14, align 4
  %65 = load ptr, ptr @grayScaleMap, align 8
  %66 = load i32, ptr %14, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, ptr %65, i64 %67
  %69 = load i8, ptr %68, align 1
  %70 = sext i8 %69 to i32
  %71 = call i32 @putchar(i32 noundef %70)
  br label %72

72:                                               ; preds = %44
  %73 = load i32, ptr %9, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %9, align 4
  br label %41, !llvm.loop !6

75:                                               ; preds = %41
  %76 = call i32 @putchar(i32 noundef 10)
  br label %77

77:                                               ; preds = %75
  %78 = load i32, ptr %8, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %8, align 4
  br label %37, !llvm.loop !8

80:                                               ; preds = %37
  br label %86

81:                                               ; preds = %23
  %82 = load ptr, ptr @stderr, align 8
  %83 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %82, ptr noundef @.str.13)
  %84 = load ptr, ptr %3, align 8
  %85 = call i32 @fclose(ptr noundef %84)
  call void @exit(i32 noundef 1) #3
  unreachable

86:                                               ; preds = %80
  %87 = load ptr, ptr %3, align 8
  %88 = call i32 @fclose(ptr noundef %87)
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  call void @printHelp()
  store i32 1, ptr %3, align 4
  br label %13

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 1
  %12 = load ptr, ptr %11, align 8
  call void @convertImageToASCII(ptr noundef %12)
  store i32 0, ptr %3, align 4
  br label %13

13:                                               ; preds = %9, %8
  %14 = load i32, ptr %3, align 4
  ret i32 %14
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
