; ModuleID = 'LLVM_IR/gemma7b-45982.ll'
source_filename = "DATASETv2/gemma7b-45982.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.baggage = type { [20 x i8], i32, ptr }

@.str = private unnamed_addr constant [21 x i8] c"Enter baggage name: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"Enter baggage weight: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"%s (%d) \00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"\0ATotal weight: %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %17, %0
  %.02 = phi i32 [ 0, %0 ], [ %18, %17 ]
  %.01 = phi ptr [ null, %0 ], [ %4, %17 ]
  %2 = icmp slt i32 %.02, 10
  br i1 %2, label %3, label %19

3:                                                ; preds = %1
  %4 = call noalias ptr @malloc(i64 noundef 32) #4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %6 = getelementptr inbounds %struct.baggage, ptr %4, i32 0, i32 0
  %7 = getelementptr inbounds [20 x i8], ptr %6, i64 0, i64 0
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = getelementptr inbounds %struct.baggage, ptr %4, i32 0, i32 1
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %10)
  %12 = icmp eq ptr %.01, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  br label %16

14:                                               ; preds = %3
  %15 = getelementptr inbounds %struct.baggage, ptr %4, i32 0, i32 2
  store ptr %.01, ptr %15, align 8
  br label %16

16:                                               ; preds = %14, %13
  br label %17

17:                                               ; preds = %16
  %18 = add nsw i32 %.02, 1
  br label %1, !llvm.loop !6

19:                                               ; preds = %1
  br label %20

20:                                               ; preds = %22, %19
  %.03 = phi ptr [ %.01, %19 ], [ %29, %22 ]
  %21 = icmp ne ptr %.03, null
  br i1 %21, label %22, label %30

22:                                               ; preds = %20
  %23 = getelementptr inbounds %struct.baggage, ptr %.03, i32 0, i32 0
  %24 = getelementptr inbounds [20 x i8], ptr %23, i64 0, i64 0
  %25 = getelementptr inbounds %struct.baggage, ptr %.03, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %24, i32 noundef %26)
  %28 = getelementptr inbounds %struct.baggage, ptr %.03, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  br label %20, !llvm.loop !8

30:                                               ; preds = %20
  br label %31

31:                                               ; preds = %33, %30
  %.14 = phi ptr [ %.01, %30 ], [ %38, %33 ]
  %.0 = phi i32 [ 0, %30 ], [ %36, %33 ]
  %32 = icmp ne ptr %.14, null
  br i1 %32, label %33, label %39

33:                                               ; preds = %31
  %34 = getelementptr inbounds %struct.baggage, ptr %.14, i32 0, i32 1
  %35 = load i32, ptr %34, align 4
  %36 = add nsw i32 %.0, %35
  %37 = getelementptr inbounds %struct.baggage, ptr %.14, i32 0, i32 2
  %38 = load ptr, ptr %37, align 8
  br label %31, !llvm.loop !9

39:                                               ; preds = %31
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.0)
  br label %41

41:                                               ; preds = %43, %39
  %.2 = phi ptr [ %.01, %39 ], [ %45, %43 ]
  %42 = icmp ne ptr %.2, null
  br i1 %42, label %43, label %46

43:                                               ; preds = %41
  call void @free(ptr noundef %.2) #5
  %44 = getelementptr inbounds %struct.baggage, ptr %.2, i32 0, i32 2
  %45 = load ptr, ptr %44, align 8
  br label %41, !llvm.loop !10

46:                                               ; preds = %41
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
