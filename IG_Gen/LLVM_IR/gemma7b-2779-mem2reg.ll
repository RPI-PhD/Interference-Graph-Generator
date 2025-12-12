; ModuleID = 'LLVM_IR/gemma7b-2779.ll'
source_filename = "DATASETv2/gemma7b-2779.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Passenger = type { [50 x i8], i32, ptr }
%struct.Bag = type { [20 x i8], i32, ptr }

@.str = private unnamed_addr constant [35 x i8] c"Passenger: %s, Number of bags: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Bag tag: %s, Weight: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @simulate_airport() #0 {
  br label %1

1:                                                ; preds = %9, %0
  %.02 = phi i32 [ 0, %0 ], [ %10, %9 ]
  %.0 = phi ptr [ null, %0 ], [ %4, %9 ]
  %2 = icmp slt i32 %.02, 10
  br i1 %2, label %3, label %11

3:                                                ; preds = %1
  %4 = call noalias ptr @malloc(i64 noundef 64) #4
  %5 = call i32 @rand() #5
  %6 = srem i32 %5, 20
  %7 = getelementptr inbounds %struct.Passenger, ptr %4, i32 0, i32 1
  store i32 %6, ptr %7, align 4
  %8 = getelementptr inbounds %struct.Passenger, ptr %4, i32 0, i32 2
  store ptr %.0, ptr %8, align 8
  br label %9

9:                                                ; preds = %3
  %10 = add nsw i32 %.02, 1
  br label %1, !llvm.loop !6

11:                                               ; preds = %1
  br label %12

12:                                               ; preds = %28, %11
  %.04 = phi ptr [ %.0, %11 ], [ %30, %28 ]
  %.01 = phi ptr [ null, %11 ], [ %.1, %28 ]
  %13 = icmp ne ptr %.04, null
  br i1 %13, label %14, label %31

14:                                               ; preds = %12
  br label %15

15:                                               ; preds = %25, %14
  %.05 = phi i32 [ 0, %14 ], [ %26, %25 ]
  %.1 = phi ptr [ %.01, %14 ], [ %20, %25 ]
  %16 = getelementptr inbounds %struct.Passenger, ptr %.04, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = icmp slt i32 %.05, %17
  br i1 %18, label %19, label %27

19:                                               ; preds = %15
  %20 = call noalias ptr @malloc(i64 noundef 32) #4
  %21 = call i32 @rand() #5
  %22 = srem i32 %21, 50
  %23 = getelementptr inbounds %struct.Bag, ptr %20, i32 0, i32 1
  store i32 %22, ptr %23, align 4
  %24 = getelementptr inbounds %struct.Bag, ptr %20, i32 0, i32 2
  store ptr %.1, ptr %24, align 8
  br label %25

25:                                               ; preds = %19
  %26 = add nsw i32 %.05, 1
  br label %15, !llvm.loop !8

27:                                               ; preds = %15
  br label %28

28:                                               ; preds = %27
  %29 = getelementptr inbounds %struct.Passenger, ptr %.04, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  br label %12, !llvm.loop !9

31:                                               ; preds = %12
  br label %32

32:                                               ; preds = %40, %31
  %.06 = phi ptr [ %.0, %31 ], [ %42, %40 ]
  %33 = icmp ne ptr %.06, null
  br i1 %33, label %34, label %43

34:                                               ; preds = %32
  %35 = getelementptr inbounds %struct.Passenger, ptr %.06, i32 0, i32 0
  %36 = getelementptr inbounds [50 x i8], ptr %35, i64 0, i64 0
  %37 = getelementptr inbounds %struct.Passenger, ptr %.06, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %36, i32 noundef %38)
  br label %40

40:                                               ; preds = %34
  %41 = getelementptr inbounds %struct.Passenger, ptr %.06, i32 0, i32 2
  %42 = load ptr, ptr %41, align 8
  br label %32, !llvm.loop !10

43:                                               ; preds = %32
  br label %44

44:                                               ; preds = %52, %43
  %.03 = phi ptr [ %.01, %43 ], [ %54, %52 ]
  %45 = icmp ne ptr %.03, null
  br i1 %45, label %46, label %55

46:                                               ; preds = %44
  %47 = getelementptr inbounds %struct.Bag, ptr %.03, i32 0, i32 0
  %48 = getelementptr inbounds [20 x i8], ptr %47, i64 0, i64 0
  %49 = getelementptr inbounds %struct.Bag, ptr %.03, i32 0, i32 1
  %50 = load i32, ptr %49, align 4
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %48, i32 noundef %50)
  br label %52

52:                                               ; preds = %46
  %53 = getelementptr inbounds %struct.Bag, ptr %.03, i32 0, i32 2
  %54 = load ptr, ptr %53, align 8
  br label %44, !llvm.loop !11

55:                                               ; preds = %44
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @simulate_airport()
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!11 = distinct !{!11, !7}
