; ModuleID = 'DATASETv2/falcon180b-9552.c'
source_filename = "DATASETv2/falcon180b-9552.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"example.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Error: Could not open file.\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"Total words: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Total characters: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"Total sentences: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"Total paragraphs: %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @countWords(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @strtok(ptr noundef %5, ptr noundef @.str) #5
  store ptr %6, ptr %4, align 8
  br label %7

7:                                                ; preds = %10, %1
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %3, align 4
  %13 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #5
  store ptr %13, ptr %4, align 8
  br label %7, !llvm.loop !6

14:                                               ; preds = %7
  %15 = load i32, ptr %3, align 4
  ret i32 %15
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @countChars(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %9, %1
  %5 = load ptr, ptr %2, align 8
  %6 = load i8, ptr %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %14

9:                                                ; preds = %4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds i8, ptr %10, i32 1
  store ptr %11, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %3, align 4
  br label %4, !llvm.loop !8

14:                                               ; preds = %4
  %15 = load i32, ptr %3, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @countSentences(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @strtok(ptr noundef %5, ptr noundef @.str.1) #5
  store ptr %6, ptr %4, align 8
  br label %7

7:                                                ; preds = %10, %1
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %3, align 4
  %13 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #5
  store ptr %13, ptr %4, align 8
  br label %7, !llvm.loop !9

14:                                               ; preds = %7
  %15 = load i32, ptr %3, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @countParagraphs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %5 = load ptr, ptr %2, align 8
  %6 = call ptr @strtok(ptr noundef %5, ptr noundef @.str.2) #5
  store ptr %6, ptr %4, align 8
  br label %7

7:                                                ; preds = %10, %1
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %14

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %3, align 4
  %13 = call ptr @strtok(ptr noundef null, ptr noundef @.str.2) #5
  store ptr %13, ptr %4, align 8
  br label %7, !llvm.loop !10

14:                                               ; preds = %7
  %15 = load i32, ptr %3, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store ptr null, ptr %3, align 8
  store i64 0, ptr %4, align 8
  store ptr null, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  %11 = call noalias ptr @fopen(ptr noundef @.str.3, ptr noundef @.str.4)
  store ptr %11, ptr %2, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %0
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 1, ptr %1, align 4
  br label %61

16:                                               ; preds = %0
  br label %17

17:                                               ; preds = %21, %16
  %18 = load ptr, ptr %2, align 8
  %19 = call i64 @getline(ptr noundef %3, ptr noundef %4, ptr noundef %18)
  store i64 %19, ptr %5, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %48

21:                                               ; preds = %17
  %22 = load ptr, ptr %6, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = call i64 @strlen(ptr noundef %23) #6
  %25 = load i64, ptr %5, align 8
  %26 = add i64 %24, %25
  %27 = add i64 %26, 1
  %28 = call ptr @realloc(ptr noundef %22, i64 noundef %27) #7
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = call ptr @strcat(ptr noundef %29, ptr noundef %30) #5
  %32 = load ptr, ptr %3, align 8
  %33 = call i32 @countWords(ptr noundef %32)
  %34 = load i32, ptr %7, align 4
  %35 = add nsw i32 %34, %33
  store i32 %35, ptr %7, align 4
  %36 = load ptr, ptr %3, align 8
  %37 = call i32 @countChars(ptr noundef %36)
  %38 = load i32, ptr %8, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, ptr %8, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = call i32 @countSentences(ptr noundef %40)
  %42 = load i32, ptr %9, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, ptr %9, align 4
  %44 = load ptr, ptr %3, align 8
  %45 = call i32 @countParagraphs(ptr noundef %44)
  %46 = load i32, ptr %10, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, ptr %10, align 4
  br label %17, !llvm.loop !11

48:                                               ; preds = %17
  %49 = load ptr, ptr %2, align 8
  %50 = call i32 @fclose(ptr noundef %49)
  %51 = load i32, ptr %7, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %51)
  %53 = load i32, ptr %8, align 4
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %53)
  %55 = load i32, ptr %9, align 4
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %55)
  %57 = load i32, ptr %10, align 4
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %57)
  %59 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %59) #5
  %60 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %60) #5
  store i32 0, ptr %1, align 4
  br label %61

61:                                               ; preds = %48, %14
  %62 = load i32, ptr %1, align 4
  ret i32 %62
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i64 @getline(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind allocsize(1) }

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
