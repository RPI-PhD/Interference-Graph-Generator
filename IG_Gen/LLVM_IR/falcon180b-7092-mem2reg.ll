; ModuleID = 'LLVM_IR/falcon180b-7092.ll'
source_filename = "DATASETv2/falcon180b-7092.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Memory allocation failed!\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Sorted array:\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Time taken for sorting: %.6f seconds\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 4000000) #5
  %2 = icmp eq ptr %1, null
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #6
  unreachable

5:                                                ; preds = %0
  br label %6

6:                                                ; preds = %13, %5
  %.01 = phi i32 [ 0, %5 ], [ %14, %13 ]
  %7 = icmp slt i32 %.01, 1000000
  br i1 %7, label %8, label %15

8:                                                ; preds = %6
  %9 = call i32 @rand() #7
  %10 = srem i32 %9, 1000000
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds i32, ptr %1, i64 %11
  store i32 %10, ptr %12, align 4
  br label %13

13:                                               ; preds = %8
  %14 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !6

15:                                               ; preds = %6
  %16 = call i64 @clock() #7
  br label %17

17:                                               ; preds = %46, %15
  %.1 = phi i32 [ 0, %15 ], [ %47, %46 ]
  %18 = icmp slt i32 %.1, 999999
  br i1 %18, label %19, label %48

19:                                               ; preds = %17
  %20 = add nsw i32 %.1, 1
  br label %21

21:                                               ; preds = %43, %19
  %.0 = phi i32 [ %20, %19 ], [ %44, %43 ]
  %22 = icmp slt i32 %.0, 1000000
  br i1 %22, label %23, label %45

23:                                               ; preds = %21
  %24 = sext i32 %.0 to i64
  %25 = getelementptr inbounds i32, ptr %1, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = sext i32 %.1 to i64
  %28 = getelementptr inbounds i32, ptr %1, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = icmp slt i32 %26, %29
  br i1 %30, label %31, label %42

31:                                               ; preds = %23
  %32 = sext i32 %.1 to i64
  %33 = getelementptr inbounds i32, ptr %1, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds i32, ptr %1, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = sext i32 %.1 to i64
  %39 = getelementptr inbounds i32, ptr %1, i64 %38
  store i32 %37, ptr %39, align 4
  %40 = sext i32 %.0 to i64
  %41 = getelementptr inbounds i32, ptr %1, i64 %40
  store i32 %34, ptr %41, align 4
  br label %42

42:                                               ; preds = %31, %23
  br label %43

43:                                               ; preds = %42
  %44 = add nsw i32 %.0, 1
  br label %21, !llvm.loop !8

45:                                               ; preds = %21
  br label %46

46:                                               ; preds = %45
  %47 = add nsw i32 %.1, 1
  br label %17, !llvm.loop !9

48:                                               ; preds = %17
  %49 = call i64 @clock() #7
  %50 = sub nsw i64 %49, %16
  %51 = sitofp i64 %50 to double
  %52 = fdiv double %51, 1.000000e+06
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %54

54:                                               ; preds = %61, %48
  %.2 = phi i32 [ 0, %48 ], [ %62, %61 ]
  %55 = icmp slt i32 %.2, 1000000
  br i1 %55, label %56, label %63

56:                                               ; preds = %54
  %57 = sext i32 %.2 to i64
  %58 = getelementptr inbounds i32, ptr %1, i64 %57
  %59 = load i32, ptr %58, align 4
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %59)
  br label %61

61:                                               ; preds = %56
  %62 = add nsw i32 %.2, 1
  br label %54, !llvm.loop !10

63:                                               ; preds = %54
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, double noundef %52)
  call void @free(ptr noundef %1) #7
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: nounwind
declare i64 @clock() #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

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
