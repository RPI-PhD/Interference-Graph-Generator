; ModuleID = 'DATASETv2/gpt35-32012.c'
source_filename = "DATASETv2/gpt35-32012.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Error opening input file.\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Error opening output file.\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"File compressed successfully.\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Usage: %s <input_file> <output_file>\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @compress(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str)
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = call noalias ptr @fopen(ptr noundef %14, ptr noundef @.str.1)
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %20, label %18

18:                                               ; preds = %2
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %84

20:                                               ; preds = %2
  %21 = load ptr, ptr %6, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %25, label %23

23:                                               ; preds = %20
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %84

25:                                               ; preds = %20
  %26 = load ptr, ptr %5, align 8
  %27 = call i32 @fseek(ptr noundef %26, i64 noundef 0, i32 noundef 2)
  %28 = load ptr, ptr %5, align 8
  %29 = call i64 @ftell(ptr noundef %28)
  store i64 %29, ptr %7, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = call i32 @fseek(ptr noundef %30, i64 noundef 0, i32 noundef 0)
  %32 = load i64, ptr %7, align 8
  %33 = call noalias ptr @malloc(i64 noundef %32) #4
  store ptr %33, ptr %8, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = load i64, ptr %7, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = call i64 @fread(ptr noundef %34, i64 noundef 1, i64 noundef %35, ptr noundef %36)
  %38 = load ptr, ptr %5, align 8
  %39 = call i32 @fclose(ptr noundef %38)
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr inbounds i8, ptr %40, i64 0
  %42 = load i8, ptr %41, align 1
  store i8 %42, ptr %9, align 1
  store i32 1, ptr %10, align 4
  store i32 1, ptr %11, align 4
  br label %43

43:                                               ; preds = %72, %25
  %44 = load i32, ptr %11, align 4
  %45 = sext i32 %44 to i64
  %46 = load i64, ptr %7, align 8
  %47 = icmp slt i64 %45, %46
  br i1 %47, label %48, label %75

48:                                               ; preds = %43
  %49 = load ptr, ptr %8, align 8
  %50 = load i32, ptr %11, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, ptr %49, i64 %51
  %53 = load i8, ptr %52, align 1
  %54 = sext i8 %53 to i32
  %55 = load i8, ptr %9, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp eq i32 %54, %56
  br i1 %57, label %58, label %61

58:                                               ; preds = %48
  %59 = load i32, ptr %10, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %10, align 4
  br label %71

61:                                               ; preds = %48
  %62 = load ptr, ptr %6, align 8
  %63 = call i64 @fwrite(ptr noundef %10, i64 noundef 4, i64 noundef 1, ptr noundef %62)
  %64 = load ptr, ptr %6, align 8
  %65 = call i64 @fwrite(ptr noundef %9, i64 noundef 1, i64 noundef 1, ptr noundef %64)
  %66 = load ptr, ptr %8, align 8
  %67 = load i32, ptr %11, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i8, ptr %66, i64 %68
  %70 = load i8, ptr %69, align 1
  store i8 %70, ptr %9, align 1
  store i32 1, ptr %10, align 4
  br label %71

71:                                               ; preds = %61, %58
  br label %72

72:                                               ; preds = %71
  %73 = load i32, ptr %11, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %11, align 4
  br label %43, !llvm.loop !6

75:                                               ; preds = %43
  %76 = load ptr, ptr %6, align 8
  %77 = call i64 @fwrite(ptr noundef %10, i64 noundef 4, i64 noundef 1, ptr noundef %76)
  %78 = load ptr, ptr %6, align 8
  %79 = call i64 @fwrite(ptr noundef %9, i64 noundef 1, i64 noundef 1, ptr noundef %78)
  %80 = load ptr, ptr %6, align 8
  %81 = call i32 @fclose(ptr noundef %80)
  %82 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %82) #5
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %84

84:                                               ; preds = %75, %23, %18
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4
  %9 = icmp ne i32 %8, 3
  br i1 %9, label %10, label %15

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 0
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %13)
  store i32 1, ptr %3, align 4
  br label %24

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 1
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %6, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 2
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %7, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = load ptr, ptr %7, align 8
  call void @compress(ptr noundef %22, ptr noundef %23)
  store i32 0, ptr %3, align 4
  br label %24

24:                                               ; preds = %15, %10
  %25 = load i32, ptr %3, align 4
  ret i32 %25
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
