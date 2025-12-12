; ModuleID = 'LLVM_IR/gemini_pro-2495.ll'
source_filename = "DATASETv2/gemini_pro-2495.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Document = type { ptr, i32, i32 }
%struct.Line = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"<\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c">\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @document_create() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 16) #6
  %2 = call noalias ptr @malloc(i64 noundef 256) #6
  %3 = getelementptr inbounds %struct.Document, ptr %1, i32 0, i32 0
  store ptr %2, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Document, ptr %1, i32 0, i32 1
  store i32 0, ptr %4, align 8
  %5 = getelementptr inbounds %struct.Document, ptr %1, i32 0, i32 2
  store i32 16, ptr %5, align 4
  ret ptr %1
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @document_destroy(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %13, %1
  %.0 = phi i32 [ 0, %1 ], [ %14, %13 ]
  %3 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %15

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds %struct.Line, ptr %8, i64 %9
  %11 = getelementptr inbounds %struct.Line, ptr %10, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %12) #7
  br label %13

13:                                               ; preds = %6
  %14 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

15:                                               ; preds = %2
  %16 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17) #7
  call void @free(ptr noundef %0) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @document_add_line(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 2
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %4, %6
  br i1 %7, label %8, label %21

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 2
  %12 = load i32, ptr %11, align 4
  %13 = sext i32 %12 to i64
  %14 = mul i64 16, %13
  %15 = mul i64 %14, 2
  %16 = call ptr @realloc(ptr noundef %10, i64 noundef %15) #8
  %17 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  store ptr %16, ptr %17, align 8
  %18 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 2
  %19 = load i32, ptr %18, align 4
  %20 = mul nsw i32 %19, 2
  store i32 %20, ptr %18, align 4
  br label %21

21:                                               ; preds = %8, %2
  %22 = call noalias ptr @strdup(ptr noundef %1) #7
  %23 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.Line, ptr %24, i64 %27
  %29 = getelementptr inbounds %struct.Line, ptr %28, i32 0, i32 0
  store ptr %22, ptr %29, align 8
  %30 = call i64 @strlen(ptr noundef %1) #9
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %35 = load i32, ptr %34, align 8
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds %struct.Line, ptr %33, i64 %36
  %38 = getelementptr inbounds %struct.Line, ptr %37, i32 0, i32 1
  store i32 %31, ptr %38, align 8
  %39 = call i64 @strlen(ptr noundef %1) #9
  %40 = add i64 %39, 1
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %45 = load i32, ptr %44, align 8
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %struct.Line, ptr %43, i64 %46
  %48 = getelementptr inbounds %struct.Line, ptr %47, i32 0, i32 2
  store i32 %41, ptr %48, align 4
  %49 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %50 = load i32, ptr %49, align 8
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %49, align 8
  ret void
}

; Function Attrs: nounwind allocsize(1)
declare ptr @realloc(ptr noundef, i64 noundef) #3

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @document_beautify(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %69, %1
  %.01 = phi i32 [ 0, %1 ], [ %70, %69 ]
  %3 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %71

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.Document, ptr %0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds %struct.Line, ptr %8, i64 %9
  br label %11

11:                                               ; preds = %66, %6
  %.03 = phi i32 [ 0, %6 ], [ %.3, %66 ]
  %.02 = phi i32 [ 0, %6 ], [ %67, %66 ]
  %12 = getelementptr inbounds %struct.Line, ptr %10, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %.02, %13
  br i1 %14, label %15, label %68

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.Line, ptr %10, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = sext i32 %.02 to i64
  %19 = getelementptr inbounds i8, ptr %17, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 32
  br i1 %22, label %23, label %25

23:                                               ; preds = %15
  %24 = add nsw i32 %.03, 1
  br label %65

25:                                               ; preds = %15
  %26 = getelementptr inbounds %struct.Line, ptr %10, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = sext i32 %.02 to i64
  %29 = getelementptr inbounds i8, ptr %27, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp eq i32 %31, 60
  br i1 %32, label %33, label %45

33:                                               ; preds = %25
  %34 = icmp sgt i32 %.03, 0
  br i1 %34, label %35, label %43

35:                                               ; preds = %33
  br label %36

36:                                               ; preds = %40, %35
  %.0 = phi i32 [ 0, %35 ], [ %41, %40 ]
  %37 = icmp slt i32 %.0, %.03
  br i1 %37, label %38, label %42

38:                                               ; preds = %36
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %40

40:                                               ; preds = %38
  %41 = add nsw i32 %.0, 1
  br label %36, !llvm.loop !8

42:                                               ; preds = %36
  br label %43

43:                                               ; preds = %42, %33
  %.1 = phi i32 [ 0, %42 ], [ %.03, %33 ]
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %64

45:                                               ; preds = %25
  %46 = getelementptr inbounds %struct.Line, ptr %10, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = sext i32 %.02 to i64
  %49 = getelementptr inbounds i8, ptr %47, i64 %48
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp eq i32 %51, 62
  br i1 %52, label %53, label %55

53:                                               ; preds = %45
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %63

55:                                               ; preds = %45
  %56 = getelementptr inbounds %struct.Line, ptr %10, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = sext i32 %.02 to i64
  %59 = getelementptr inbounds i8, ptr %57, i64 %58
  %60 = load i8, ptr %59, align 1
  %61 = sext i8 %60 to i32
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %61)
  br label %63

63:                                               ; preds = %55, %53
  br label %64

64:                                               ; preds = %63, %43
  %.2 = phi i32 [ %.1, %43 ], [ %.03, %63 ]
  br label %65

65:                                               ; preds = %64, %23
  %.3 = phi i32 [ %24, %23 ], [ %.2, %64 ]
  br label %66

66:                                               ; preds = %65
  %67 = add nsw i32 %.02, 1
  br label %11, !llvm.loop !9

68:                                               ; preds = %11
  br label %69

69:                                               ; preds = %68
  %70 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !10

71:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  %3 = call ptr @document_create()
  store ptr null, ptr %1, align 8
  store i64 0, ptr %2, align 8
  br label %4

4:                                                ; preds = %8, %0
  %5 = load ptr, ptr @stdin, align 8
  %6 = call i64 @getline(ptr noundef %1, ptr noundef %2, ptr noundef %5)
  %7 = icmp ne i64 %6, -1
  br i1 %7, label %8, label %10

8:                                                ; preds = %4
  %9 = load ptr, ptr %1, align 8
  call void @document_add_line(ptr noundef %3, ptr noundef %9)
  br label %4, !llvm.loop !11

10:                                               ; preds = %4
  call void @document_beautify(ptr noundef %3)
  call void @document_destroy(ptr noundef %3)
  ret i32 0
}

declare i64 @getline(ptr noundef, ptr noundef, ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(1) }
attributes #9 = { nounwind willreturn memory(read) }

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
