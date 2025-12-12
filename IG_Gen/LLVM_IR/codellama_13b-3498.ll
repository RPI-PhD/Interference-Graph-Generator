; ModuleID = 'DATASETv2/codellama_13b-3498.c'
source_filename = "DATASETv2/codellama_13b-3498.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Pixel = type { i8, i8, i8 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [30 x i8] c"Could not open input file %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"output.bmp\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Could not open output file %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"Message: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"image.bmp\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"Hello, World!\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @hide_message(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str)
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %20

16:                                               ; preds = %2
  %17 = load ptr, ptr @stderr, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %17, ptr noundef @.str.1, ptr noundef %18)
  br label %90

20:                                               ; preds = %2
  %21 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  store ptr %21, ptr %6, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %24, label %27

24:                                               ; preds = %20
  %25 = load ptr, ptr @stderr, align 8
  %26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.4, ptr noundef @.str.2)
  br label %90

27:                                               ; preds = %20
  %28 = call noalias ptr @malloc(i64 noundef 7372800) #6
  store ptr %28, ptr %7, align 8
  %29 = load ptr, ptr %7, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = call i64 @fread(ptr noundef %29, i64 noundef 7372800, i64 noundef 1, ptr noundef %30)
  %32 = load ptr, ptr %5, align 8
  %33 = call i32 @fclose(ptr noundef %32)
  %34 = load ptr, ptr %3, align 8
  %35 = call i64 @strlen(ptr noundef %34) #7
  %36 = trunc i64 %35 to i32
  store i32 %36, ptr %8, align 4
  %37 = load i32, ptr %8, align 4
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 3.000000e+00
  %40 = call double @llvm.ceil.f64(double %39)
  %41 = fptosi double %40 to i32
  store i32 %41, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %42

42:                                               ; preds = %80, %27
  %43 = load i32, ptr %10, align 4
  %44 = load i32, ptr %9, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %83

46:                                               ; preds = %42
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %10, align 4
  %49 = mul nsw i32 %48, 640
  %50 = mul nsw i32 %49, 480
  %51 = mul nsw i32 %50, 24
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %47, i64 %52
  store ptr %53, ptr %11, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = load i32, ptr %10, align 4
  %56 = mul nsw i32 %55, 3
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, ptr %54, i64 %57
  %59 = load i8, ptr %58, align 1
  %60 = load ptr, ptr %11, align 8
  %61 = getelementptr inbounds %struct.Pixel, ptr %60, i32 0, i32 0
  store i8 %59, ptr %61, align 1
  %62 = load ptr, ptr %3, align 8
  %63 = load i32, ptr %10, align 4
  %64 = mul nsw i32 %63, 3
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, ptr %62, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = load ptr, ptr %11, align 8
  %70 = getelementptr inbounds %struct.Pixel, ptr %69, i32 0, i32 1
  store i8 %68, ptr %70, align 1
  %71 = load ptr, ptr %3, align 8
  %72 = load i32, ptr %10, align 4
  %73 = mul nsw i32 %72, 3
  %74 = add nsw i32 %73, 2
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %71, i64 %75
  %77 = load i8, ptr %76, align 1
  %78 = load ptr, ptr %11, align 8
  %79 = getelementptr inbounds %struct.Pixel, ptr %78, i32 0, i32 2
  store i8 %77, ptr %79, align 1
  br label %80

80:                                               ; preds = %46
  %81 = load i32, ptr %10, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %10, align 4
  br label %42, !llvm.loop !6

83:                                               ; preds = %42
  %84 = load ptr, ptr %7, align 8
  %85 = load ptr, ptr %6, align 8
  %86 = call i64 @fwrite(ptr noundef %84, i64 noundef 7372800, i64 noundef 1, ptr noundef %85)
  %87 = load ptr, ptr %6, align 8
  %88 = call i32 @fclose(ptr noundef %87)
  %89 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %89) #8
  br label %90

90:                                               ; preds = %83, %24, %16
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ceil.f64(double) #4

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind  uwtable
define dso_local void @retrieve_message(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca [1000 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = call noalias ptr @fopen(ptr noundef %9, ptr noundef @.str)
  store ptr %10, ptr %3, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %17

13:                                               ; preds = %1
  %14 = load ptr, ptr @stderr, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.1, ptr noundef %15)
  br label %66

17:                                               ; preds = %1
  %18 = call noalias ptr @malloc(i64 noundef 7372800) #6
  store ptr %18, ptr %4, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = call i64 @fread(ptr noundef %19, i64 noundef 7372800, i64 noundef 1, ptr noundef %20)
  %22 = load ptr, ptr %3, align 8
  %23 = call i32 @fclose(ptr noundef %22)
  store i32 307200, ptr %5, align 4
  store i32 0, ptr %7, align 4
  br label %24

24:                                               ; preds = %59, %17
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %5, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %62

28:                                               ; preds = %24
  %29 = load ptr, ptr %4, align 8
  %30 = load i32, ptr %7, align 4
  %31 = mul nsw i32 %30, 640
  %32 = mul nsw i32 %31, 480
  %33 = mul nsw i32 %32, 24
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, ptr %29, i64 %34
  store ptr %35, ptr %8, align 8
  %36 = load ptr, ptr %8, align 8
  %37 = getelementptr inbounds %struct.Pixel, ptr %36, i32 0, i32 0
  %38 = load i8, ptr %37, align 1
  %39 = load i32, ptr %7, align 4
  %40 = mul nsw i32 %39, 3
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 %41
  store i8 %38, ptr %42, align 1
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds %struct.Pixel, ptr %43, i32 0, i32 1
  %45 = load i8, ptr %44, align 1
  %46 = load i32, ptr %7, align 4
  %47 = mul nsw i32 %46, 3
  %48 = add nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 %49
  store i8 %45, ptr %50, align 1
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.Pixel, ptr %51, i32 0, i32 2
  %53 = load i8, ptr %52, align 1
  %54 = load i32, ptr %7, align 4
  %55 = mul nsw i32 %54, 3
  %56 = add nsw i32 %55, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 %57
  store i8 %53, ptr %58, align 1
  br label %59

59:                                               ; preds = %28
  %60 = load i32, ptr %7, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %7, align 4
  br label %24, !llvm.loop !8

62:                                               ; preds = %24
  %63 = getelementptr inbounds [1000 x i8], ptr %6, i64 0, i64 0
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %63)
  %65 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %65) #8
  br label %66

66:                                               ; preds = %62, %13
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr @.str.6, ptr %2, align 8
  store ptr @.str.7, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = load ptr, ptr %2, align 8
  call void @hide_message(ptr noundef %4, ptr noundef %5)
  %6 = load ptr, ptr %2, align 8
  call void @retrieve_message(ptr noundef %6)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind }

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
