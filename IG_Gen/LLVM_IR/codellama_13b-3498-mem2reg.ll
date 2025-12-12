; ModuleID = 'LLVM_IR/codellama_13b-3498.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @hide_message(ptr noundef %0, ptr noundef %1) #0 {
  %3 = call noalias ptr @fopen(ptr noundef %1, ptr noundef @.str)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  %6 = load ptr, ptr @stderr, align 8
  %7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.1, ptr noundef %1)
  br label %54

8:                                                ; preds = %2
  %9 = call noalias ptr @fopen(ptr noundef @.str.2, ptr noundef @.str.3)
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = load ptr, ptr @stderr, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef @.str.4, ptr noundef @.str.2)
  br label %54

14:                                               ; preds = %8
  %15 = call noalias ptr @malloc(i64 noundef 7372800) #6
  %16 = call i64 @fread(ptr noundef %15, i64 noundef 7372800, i64 noundef 1, ptr noundef %3)
  %17 = call i32 @fclose(ptr noundef %3)
  %18 = call i64 @strlen(ptr noundef %0) #7
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 3.000000e+00
  %22 = call double @llvm.ceil.f64(double %21)
  %23 = fptosi double %22 to i32
  br label %24

24:                                               ; preds = %49, %14
  %.0 = phi i32 [ 0, %14 ], [ %50, %49 ]
  %25 = icmp slt i32 %.0, %23
  br i1 %25, label %26, label %51

26:                                               ; preds = %24
  %27 = mul nsw i32 %.0, 640
  %28 = mul nsw i32 %27, 480
  %29 = mul nsw i32 %28, 24
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %15, i64 %30
  %32 = mul nsw i32 %.0, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, ptr %0, i64 %33
  %35 = load i8, ptr %34, align 1
  %36 = getelementptr inbounds %struct.Pixel, ptr %31, i32 0, i32 0
  store i8 %35, ptr %36, align 1
  %37 = mul nsw i32 %.0, 3
  %38 = add nsw i32 %37, 1
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %0, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = getelementptr inbounds %struct.Pixel, ptr %31, i32 0, i32 1
  store i8 %41, ptr %42, align 1
  %43 = mul nsw i32 %.0, 3
  %44 = add nsw i32 %43, 2
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, ptr %0, i64 %45
  %47 = load i8, ptr %46, align 1
  %48 = getelementptr inbounds %struct.Pixel, ptr %31, i32 0, i32 2
  store i8 %47, ptr %48, align 1
  br label %49

49:                                               ; preds = %26
  %50 = add nsw i32 %.0, 1
  br label %24, !llvm.loop !6

51:                                               ; preds = %24
  %52 = call i64 @fwrite(ptr noundef %15, i64 noundef 7372800, i64 noundef 1, ptr noundef %9)
  %53 = call i32 @fclose(ptr noundef %9)
  call void @free(ptr noundef %15) #8
  br label %54

54:                                               ; preds = %51, %11, %5
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @retrieve_message(ptr noundef %0) #0 {
  %2 = alloca [1000 x i8], align 16
  %3 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = load ptr, ptr @stderr, align 8
  %7 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.1, ptr noundef %0)
  br label %42

8:                                                ; preds = %1
  %9 = call noalias ptr @malloc(i64 noundef 7372800) #6
  %10 = call i64 @fread(ptr noundef %9, i64 noundef 7372800, i64 noundef 1, ptr noundef %3)
  %11 = call i32 @fclose(ptr noundef %3)
  br label %12

12:                                               ; preds = %37, %8
  %.0 = phi i32 [ 0, %8 ], [ %38, %37 ]
  %13 = icmp slt i32 %.0, 307200
  br i1 %13, label %14, label %39

14:                                               ; preds = %12
  %15 = mul nsw i32 %.0, 640
  %16 = mul nsw i32 %15, 480
  %17 = mul nsw i32 %16, 24
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %9, i64 %18
  %20 = getelementptr inbounds %struct.Pixel, ptr %19, i32 0, i32 0
  %21 = load i8, ptr %20, align 1
  %22 = mul nsw i32 %.0, 3
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %23
  store i8 %21, ptr %24, align 1
  %25 = getelementptr inbounds %struct.Pixel, ptr %19, i32 0, i32 1
  %26 = load i8, ptr %25, align 1
  %27 = mul nsw i32 %.0, 3
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %29
  store i8 %26, ptr %30, align 1
  %31 = getelementptr inbounds %struct.Pixel, ptr %19, i32 0, i32 2
  %32 = load i8, ptr %31, align 1
  %33 = mul nsw i32 %.0, 3
  %34 = add nsw i32 %33, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 %35
  store i8 %32, ptr %36, align 1
  br label %37

37:                                               ; preds = %14
  %38 = add nsw i32 %.0, 1
  br label %12, !llvm.loop !8

39:                                               ; preds = %12
  %40 = getelementptr inbounds [1000 x i8], ptr %2, i64 0, i64 0
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %40)
  call void @free(ptr noundef %9) #8
  br label %42

42:                                               ; preds = %39, %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @hide_message(ptr noundef @.str.7, ptr noundef @.str.6)
  call void @retrieve_message(ptr noundef @.str.6)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
