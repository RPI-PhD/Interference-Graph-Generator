; ModuleID = 'LLVM_IR/gpt35-32012.ll'
source_filename = "DATASETv2/gpt35-32012.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Error opening input file.\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Error opening output file.\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"File compressed successfully.\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Usage: %s <input_file> <output_file>\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @compress(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = call noalias ptr @fopen(ptr noundef %0, ptr noundef @.str)
  %6 = call noalias ptr @fopen(ptr noundef %1, ptr noundef @.str.1)
  %7 = icmp ne ptr %5, null
  br i1 %7, label %10, label %8

8:                                                ; preds = %2
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %51

10:                                               ; preds = %2
  %11 = icmp ne ptr %6, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %10
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %51

14:                                               ; preds = %10
  %15 = call i32 @fseek(ptr noundef %5, i64 noundef 0, i32 noundef 2)
  %16 = call i64 @ftell(ptr noundef %5)
  %17 = call i32 @fseek(ptr noundef %5, i64 noundef 0, i32 noundef 0)
  %18 = call noalias ptr @malloc(i64 noundef %16) #4
  %19 = call i64 @fread(ptr noundef %18, i64 noundef 1, i64 noundef %16, ptr noundef %5)
  %20 = call i32 @fclose(ptr noundef %5)
  %21 = getelementptr inbounds i8, ptr %18, i64 0
  %22 = load i8, ptr %21, align 1
  store i8 %22, ptr %3, align 1
  store i32 1, ptr %4, align 4
  br label %23

23:                                               ; preds = %44, %14
  %.0 = phi i32 [ 1, %14 ], [ %45, %44 ]
  %24 = sext i32 %.0 to i64
  %25 = icmp slt i64 %24, %16
  br i1 %25, label %26, label %46

26:                                               ; preds = %23
  %27 = sext i32 %.0 to i64
  %28 = getelementptr inbounds i8, ptr %18, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = load i8, ptr %3, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %30, %32
  br i1 %33, label %34, label %37

34:                                               ; preds = %26
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %4, align 4
  br label %43

37:                                               ; preds = %26
  %38 = call i64 @fwrite(ptr noundef %4, i64 noundef 4, i64 noundef 1, ptr noundef %6)
  %39 = call i64 @fwrite(ptr noundef %3, i64 noundef 1, i64 noundef 1, ptr noundef %6)
  %40 = sext i32 %.0 to i64
  %41 = getelementptr inbounds i8, ptr %18, i64 %40
  %42 = load i8, ptr %41, align 1
  store i8 %42, ptr %3, align 1
  store i32 1, ptr %4, align 4
  br label %43

43:                                               ; preds = %37, %34
  br label %44

44:                                               ; preds = %43
  %45 = add nsw i32 %.0, 1
  br label %23, !llvm.loop !6

46:                                               ; preds = %23
  %47 = call i64 @fwrite(ptr noundef %4, i64 noundef 4, i64 noundef 1, ptr noundef %6)
  %48 = call i64 @fwrite(ptr noundef %3, i64 noundef 1, i64 noundef 1, ptr noundef %6)
  %49 = call i32 @fclose(ptr noundef %6)
  call void @free(ptr noundef %18) #5
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %51

51:                                               ; preds = %46, %12, %8
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #1

declare i64 @ftell(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp ne i32 %0, 3
  br i1 %3, label %4, label %8

4:                                                ; preds = %2
  %5 = getelementptr inbounds ptr, ptr %1, i64 0
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %6)
  br label %13

8:                                                ; preds = %2
  %9 = getelementptr inbounds ptr, ptr %1, i64 1
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds ptr, ptr %1, i64 2
  %12 = load ptr, ptr %11, align 8
  call void @compress(ptr noundef %10, ptr noundef %12)
  br label %13

13:                                               ; preds = %8, %4
  %.0 = phi i32 [ 1, %4 ], [ 0, %8 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
