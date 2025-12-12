; ModuleID = 'DATASETv2/gpt4o_mini-4565.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @encode_image(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = call noalias ptr @fopen(ptr noundef %17, ptr noundef @.str)
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %3
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

22:                                               ; preds = %3
  %23 = load ptr, ptr %5, align 8
  %24 = call noalias ptr @fopen(ptr noundef %23, ptr noundef @.str.2)
  store ptr %24, ptr %8, align 8
  %25 = load ptr, ptr %8, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %30, label %27

27:                                               ; preds = %22
  %28 = load ptr, ptr %7, align 8
  %29 = call i32 @fclose(ptr noundef %28)
  call void @perror(ptr noundef @.str.3) #7
  call void @exit(i32 noundef 1) #8
  unreachable

30:                                               ; preds = %22
  %31 = load ptr, ptr %7, align 8
  %32 = call i32 @fseek(ptr noundef %31, i64 noundef 0, i32 noundef 2)
  %33 = load ptr, ptr %7, align 8
  %34 = call i64 @ftell(ptr noundef %33)
  store i64 %34, ptr %9, align 8
  %35 = load ptr, ptr %7, align 8
  %36 = call i32 @fseek(ptr noundef %35, i64 noundef 0, i32 noundef 0)
  %37 = load i64, ptr %9, align 8
  %38 = call noalias ptr @malloc(i64 noundef %37) #9
  store ptr %38, ptr %10, align 8
  %39 = load ptr, ptr %10, align 8
  %40 = load i64, ptr %9, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = call i64 @fread(ptr noundef %39, i64 noundef 1, i64 noundef %40, ptr noundef %41)
  store i32 54, ptr %11, align 4
  %43 = load ptr, ptr %6, align 8
  %44 = call i64 @strlen(ptr noundef %43) #10
  %45 = trunc i64 %44 to i32
  store i32 %45, ptr %12, align 4
  %46 = load i32, ptr %12, align 4
  %47 = mul nsw i32 %46, 8
  %48 = sext i32 %47 to i64
  %49 = load i64, ptr %9, align 8
  %50 = load i32, ptr %11, align 4
  %51 = sext i32 %50 to i64
  %52 = sub nsw i64 %49, %51
  %53 = icmp sgt i64 %48, %52
  br i1 %53, label %54, label %61

54:                                               ; preds = %30
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %56 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %56) #11
  %57 = load ptr, ptr %7, align 8
  %58 = call i32 @fclose(ptr noundef %57)
  %59 = load ptr, ptr %8, align 8
  %60 = call i32 @fclose(ptr noundef %59)
  call void @exit(i32 noundef 1) #8
  unreachable

61:                                               ; preds = %30
  %62 = load i32, ptr %11, align 4
  store i32 %62, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %63

63:                                               ; preds = %107, %61
  %64 = load i32, ptr %14, align 4
  %65 = load i32, ptr %12, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %110

67:                                               ; preds = %63
  store i32 0, ptr %15, align 4
  br label %68

68:                                               ; preds = %103, %67
  %69 = load i32, ptr %15, align 4
  %70 = icmp slt i32 %69, 8
  br i1 %70, label %71, label %106

71:                                               ; preds = %68
  %72 = load ptr, ptr %6, align 8
  %73 = load i32, ptr %14, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, ptr %72, i64 %74
  %76 = load i8, ptr %75, align 1
  %77 = sext i8 %76 to i32
  %78 = load i32, ptr %15, align 4
  %79 = sub nsw i32 7, %78
  %80 = ashr i32 %77, %79
  %81 = and i32 %80, 1
  %82 = trunc i32 %81 to i8
  store i8 %82, ptr %16, align 1
  %83 = load ptr, ptr %10, align 8
  %84 = load i32, ptr %13, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, ptr %83, i64 %85
  %87 = load i8, ptr %86, align 1
  %88 = zext i8 %87 to i32
  %89 = and i32 %88, 254
  %90 = trunc i32 %89 to i8
  store i8 %90, ptr %86, align 1
  %91 = load i8, ptr %16, align 1
  %92 = zext i8 %91 to i32
  %93 = load ptr, ptr %10, align 8
  %94 = load i32, ptr %13, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, ptr %93, i64 %95
  %97 = load i8, ptr %96, align 1
  %98 = zext i8 %97 to i32
  %99 = or i32 %98, %92
  %100 = trunc i32 %99 to i8
  store i8 %100, ptr %96, align 1
  %101 = load i32, ptr %13, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %13, align 4
  br label %103

103:                                              ; preds = %71
  %104 = load i32, ptr %15, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %15, align 4
  br label %68, !llvm.loop !6

106:                                              ; preds = %68
  br label %107

107:                                              ; preds = %106
  %108 = load i32, ptr %14, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %14, align 4
  br label %63, !llvm.loop !8

110:                                              ; preds = %63
  %111 = load ptr, ptr %10, align 8
  %112 = load i64, ptr %9, align 8
  %113 = load ptr, ptr %8, align 8
  %114 = call i64 @fwrite(ptr noundef %111, i64 noundef 1, i64 noundef %112, ptr noundef %113)
  %115 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %115) #11
  %116 = load ptr, ptr %7, align 8
  %117 = call i32 @fclose(ptr noundef %116)
  %118 = load ptr, ptr %8, align 8
  %119 = call i32 @fclose(ptr noundef %118)
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @decode_image(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = call noalias ptr @fopen(ptr noundef %15, ptr noundef @.str)
  store ptr %16, ptr %7, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %20, label %19

19:                                               ; preds = %3
  call void @perror(ptr noundef @.str.5) #7
  call void @exit(i32 noundef 1) #8
  unreachable

20:                                               ; preds = %3
  %21 = load ptr, ptr %7, align 8
  %22 = call i32 @fseek(ptr noundef %21, i64 noundef 0, i32 noundef 2)
  %23 = load ptr, ptr %7, align 8
  %24 = call i64 @ftell(ptr noundef %23)
  store i64 %24, ptr %8, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = call i32 @fseek(ptr noundef %25, i64 noundef 0, i32 noundef 0)
  %27 = load i64, ptr %8, align 8
  %28 = call noalias ptr @malloc(i64 noundef %27) #9
  store ptr %28, ptr %9, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = load i64, ptr %8, align 8
  %31 = load ptr, ptr %7, align 8
  %32 = call i64 @fread(ptr noundef %29, i64 noundef 1, i64 noundef %30, ptr noundef %31)
  store i32 54, ptr %10, align 4
  store i32 0, ptr %11, align 4
  %33 = load i32, ptr %10, align 4
  store i32 %33, ptr %12, align 4
  br label %34

34:                                               ; preds = %78, %20
  %35 = load i32, ptr %12, align 4
  %36 = sext i32 %35 to i64
  %37 = load i64, ptr %8, align 8
  %38 = icmp slt i64 %36, %37
  br i1 %38, label %39, label %81

39:                                               ; preds = %34
  %40 = load i32, ptr %11, align 4
  %41 = sext i32 %40 to i64
  %42 = load i64, ptr %6, align 8
  %43 = sub i64 %42, 1
  %44 = icmp uge i64 %41, %43
  br i1 %44, label %45, label %46

45:                                               ; preds = %39
  br label %81

46:                                               ; preds = %39
  store i8 0, ptr %13, align 1
  store i32 0, ptr %14, align 4
  br label %47

47:                                               ; preds = %68, %46
  %48 = load i32, ptr %14, align 4
  %49 = icmp slt i32 %48, 8
  br i1 %49, label %50, label %71

50:                                               ; preds = %47
  %51 = load i8, ptr %13, align 1
  %52 = zext i8 %51 to i32
  %53 = shl i32 %52, 1
  %54 = trunc i32 %53 to i8
  store i8 %54, ptr %13, align 1
  %55 = load ptr, ptr %9, align 8
  %56 = load i32, ptr %12, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, ptr %55, i64 %57
  %59 = load i8, ptr %58, align 1
  %60 = zext i8 %59 to i32
  %61 = and i32 %60, 1
  %62 = load i8, ptr %13, align 1
  %63 = zext i8 %62 to i32
  %64 = or i32 %63, %61
  %65 = trunc i32 %64 to i8
  store i8 %65, ptr %13, align 1
  %66 = load i32, ptr %12, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %12, align 4
  br label %68

68:                                               ; preds = %50
  %69 = load i32, ptr %14, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %14, align 4
  br label %47, !llvm.loop !9

71:                                               ; preds = %47
  %72 = load i8, ptr %13, align 1
  %73 = load ptr, ptr %5, align 8
  %74 = load i32, ptr %11, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %11, align 4
  %76 = sext i32 %74 to i64
  %77 = getelementptr inbounds i8, ptr %73, i64 %76
  store i8 %72, ptr %77, align 1
  br label %78

78:                                               ; preds = %71
  %79 = load i32, ptr %12, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %12, align 4
  br label %34, !llvm.loop !10

81:                                               ; preds = %45, %34
  %82 = load ptr, ptr %5, align 8
  %83 = load i32, ptr %11, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, ptr %82, i64 %84
  store i8 0, ptr %85, align 1
  %86 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %86) #11
  %87 = load ptr, ptr %7, align 8
  %88 = call i32 @fclose(ptr noundef %87)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [1000 x i8], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %14

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %12)
  store i32 1, ptr %3, align 4
  br label %51

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @strcmp(ptr noundef %17, ptr noundef @.str.7) #10
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %34

20:                                               ; preds = %14
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds ptr, ptr %21, i64 2
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 3
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 4
  %29 = load ptr, ptr %28, align 8
  call void @encode_image(ptr noundef %23, ptr noundef %26, ptr noundef %29)
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds ptr, ptr %30, i64 3
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %32)
  br label %50

34:                                               ; preds = %14
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds ptr, ptr %35, i64 1
  %37 = load ptr, ptr %36, align 8
  %38 = call i32 @strcmp(ptr noundef %37, ptr noundef @.str.9) #10
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %47

40:                                               ; preds = %34
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 2
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 0
  call void @decode_image(ptr noundef %43, ptr noundef %44, i64 noundef 1000)
  %45 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 0
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %45)
  br label %49

47:                                               ; preds = %34
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  store i32 1, ptr %3, align 4
  br label %51

49:                                               ; preds = %40
  br label %50

50:                                               ; preds = %49, %20
  store i32 0, ptr %3, align 4
  br label %51

51:                                               ; preds = %50, %47, %9
  %52 = load i32, ptr %3, align 4
  ret i32 %52
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
