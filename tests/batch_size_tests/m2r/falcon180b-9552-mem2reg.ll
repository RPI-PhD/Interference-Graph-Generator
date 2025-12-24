; ModuleID = 'LLVM_IR/falcon180b-9552.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @countWords(ptr noundef %0) #0 {
  %2 = call ptr @strtok(ptr noundef %0, ptr noundef @.str) #5
  br label %3

3:                                                ; preds = %5, %1
  %.01 = phi i32 [ 0, %1 ], [ %6, %5 ]
  %.0 = phi ptr [ %2, %1 ], [ %7, %5 ]
  %4 = icmp ne ptr %.0, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %3
  %6 = add nsw i32 %.01, 1
  %7 = call ptr @strtok(ptr noundef null, ptr noundef @.str) #5
  br label %3, !llvm.loop !6

8:                                                ; preds = %3
  ret i32 %.01
}

; Function Attrs: nounwind
declare ptr @strtok(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @countChars(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %6, %1
  %.01 = phi i32 [ 0, %1 ], [ %8, %6 ]
  %.0 = phi ptr [ %0, %1 ], [ %7, %6 ]
  %3 = load i8, ptr %.0, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = getelementptr inbounds i8, ptr %.0, i32 1
  %8 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

9:                                                ; preds = %2
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @countSentences(ptr noundef %0) #0 {
  %2 = call ptr @strtok(ptr noundef %0, ptr noundef @.str.1) #5
  br label %3

3:                                                ; preds = %5, %1
  %.01 = phi i32 [ 0, %1 ], [ %6, %5 ]
  %.0 = phi ptr [ %2, %1 ], [ %7, %5 ]
  %4 = icmp ne ptr %.0, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %3
  %6 = add nsw i32 %.01, 1
  %7 = call ptr @strtok(ptr noundef null, ptr noundef @.str.1) #5
  br label %3, !llvm.loop !9

8:                                                ; preds = %3
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @countParagraphs(ptr noundef %0) #0 {
  %2 = call ptr @strtok(ptr noundef %0, ptr noundef @.str.2) #5
  br label %3

3:                                                ; preds = %5, %1
  %.01 = phi i32 [ 0, %1 ], [ %6, %5 ]
  %.0 = phi ptr [ %2, %1 ], [ %7, %5 ]
  %4 = icmp ne ptr %.0, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %3
  %6 = add nsw i32 %.01, 1
  %7 = call ptr @strtok(ptr noundef null, ptr noundef @.str.2) #5
  br label %3, !llvm.loop !10

8:                                                ; preds = %3
  ret i32 %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  store ptr null, ptr %1, align 8
  store i64 0, ptr %2, align 8
  %3 = call noalias ptr @fopen(ptr noundef @.str.3, ptr noundef @.str.4)
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %37

7:                                                ; preds = %0
  br label %8

8:                                                ; preds = %11, %7
  %.05 = phi i32 [ 0, %7 ], [ %23, %11 ]
  %.04 = phi i32 [ 0, %7 ], [ %20, %11 ]
  %.03 = phi ptr [ null, %7 ], [ %15, %11 ]
  %.02 = phi i32 [ 0, %7 ], [ %26, %11 ]
  %.01 = phi i32 [ 0, %7 ], [ %29, %11 ]
  %9 = call i64 @getline(ptr noundef %1, ptr noundef %2, ptr noundef %3)
  %10 = icmp ne i64 %9, -1
  br i1 %10, label %11, label %30

11:                                               ; preds = %8
  %12 = call i64 @strlen(ptr noundef %.03) #6
  %13 = add i64 %12, %9
  %14 = add i64 %13, 1
  %15 = call ptr @realloc(ptr noundef %.03, i64 noundef %14) #7
  %16 = load ptr, ptr %1, align 8
  %17 = call ptr @strcat(ptr noundef %15, ptr noundef %16) #5
  %18 = load ptr, ptr %1, align 8
  %19 = call i32 @countWords(ptr noundef %18)
  %20 = add nsw i32 %.04, %19
  %21 = load ptr, ptr %1, align 8
  %22 = call i32 @countChars(ptr noundef %21)
  %23 = add nsw i32 %.05, %22
  %24 = load ptr, ptr %1, align 8
  %25 = call i32 @countSentences(ptr noundef %24)
  %26 = add nsw i32 %.02, %25
  %27 = load ptr, ptr %1, align 8
  %28 = call i32 @countParagraphs(ptr noundef %27)
  %29 = add nsw i32 %.01, %28
  br label %8, !llvm.loop !11

30:                                               ; preds = %8
  %31 = call i32 @fclose(ptr noundef %3)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %.04)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %.05)
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, i32 noundef %.02)
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %.01)
  %36 = load ptr, ptr %1, align 8
  call void @free(ptr noundef %36) #5
  call void @free(ptr noundef %.03) #5
  br label %37

37:                                               ; preds = %30, %5
  %.0 = phi i32 [ 1, %5 ], [ 0, %30 ]
  ret i32 %.0
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
