; ModuleID = 'LLVM_IR/gemini_pro-2299.ll'
source_filename = "DATASETv2/gemini_pro-2299.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.thread_data = type { i32, ptr }

@.str = private unnamed_addr constant [15 x i8] c"Thread %d: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Final count: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @thread_function(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %9, %1
  %.0 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %3 = icmp slt i32 %.0, 1000000
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.thread_data, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  %7 = load i32, ptr %6, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, ptr %6, align 4
  br label %9

9:                                                ; preds = %4
  %10 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.thread_data, ptr %0, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = getelementptr inbounds %struct.thread_data, ptr %0, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = load i32, ptr %15, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13, i32 noundef %16)
  call void @free(ptr noundef %0) #4
  ret ptr null
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i64], align 16
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %12, %0
  %.0 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %4 = icmp slt i32 %.0, 5
  br i1 %4, label %5, label %14

5:                                                ; preds = %3
  %6 = call noalias ptr @malloc(i64 noundef 16) #5
  %7 = getelementptr inbounds %struct.thread_data, ptr %6, i32 0, i32 0
  store i32 %.0, ptr %7, align 8
  %8 = getelementptr inbounds %struct.thread_data, ptr %6, i32 0, i32 1
  store ptr %1, ptr %8, align 8
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [5 x i64], ptr %2, i64 0, i64 %9
  %11 = call i32 @pthread_create(ptr noundef %10, ptr noundef null, ptr noundef @thread_function, ptr noundef %6) #4
  br label %12

12:                                               ; preds = %5
  %13 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

14:                                               ; preds = %3
  br label %15

15:                                               ; preds = %22, %14
  %.1 = phi i32 [ 0, %14 ], [ %23, %22 ]
  %16 = icmp slt i32 %.1, 5
  br i1 %16, label %17, label %24

17:                                               ; preds = %15
  %18 = sext i32 %.1 to i64
  %19 = getelementptr inbounds [5 x i64], ptr %2, i64 0, i64 %18
  %20 = load i64, ptr %19, align 8
  %21 = call i32 @pthread_join(i64 noundef %20, ptr noundef null)
  br label %22

22:                                               ; preds = %17
  %23 = add nsw i32 %.1, 1
  br label %15, !llvm.loop !9

24:                                               ; preds = %15
  %25 = load i32, ptr %1, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %25)
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @pthread_join(i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind allocsize(0) }

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
