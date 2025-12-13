; ModuleID = 'LLVM_IR/gemma7b-25170.ll'
source_filename = "DATASETv2/gemma7b-25170.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Bid = type { ptr, i32, ptr }

@.str = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"John Doe\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Jane Doe\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Bob Smith\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"The winning bid is: %s: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"There are no bids.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @insertBid(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 24) #4
  %5 = call noalias ptr @strdup(ptr noundef %1) #5
  %6 = getelementptr inbounds %struct.Bid, ptr %4, i32 0, i32 0
  store ptr %5, ptr %6, align 8
  %7 = getelementptr inbounds %struct.Bid, ptr %4, i32 0, i32 1
  store i32 %2, ptr %7, align 8
  %8 = getelementptr inbounds %struct.Bid, ptr %4, i32 0, i32 2
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %0, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  store ptr %4, ptr %0, align 8
  br label %15

12:                                               ; preds = %3
  %13 = load ptr, ptr %0, align 8
  %14 = getelementptr inbounds %struct.Bid, ptr %13, i32 0, i32 2
  store ptr %4, ptr %14, align 8
  br label %15

15:                                               ; preds = %12, %11
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @printBids(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %4, %1
  %.0 = phi ptr [ %0, %1 ], [ %11, %4 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %12

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Bid, ptr %.0, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %struct.Bid, ptr %.0, i32 0, i32 1
  %8 = load i32, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %6, i32 noundef %8)
  %10 = getelementptr inbounds %struct.Bid, ptr %.0, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  br label %2, !llvm.loop !6

12:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @findWinningBid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %11, %1
  %.02 = phi i32 [ 0, %1 ], [ %.13, %11 ]
  %.01 = phi ptr [ null, %1 ], [ %.1, %11 ]
  %.0 = phi ptr [ %0, %1 ], [ %13, %11 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %14

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Bid, ptr %.0, i32 0, i32 1
  %6 = load i32, ptr %5, align 8
  %7 = icmp sgt i32 %6, %.02
  br i1 %7, label %8, label %11

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.Bid, ptr %.0, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  br label %11

11:                                               ; preds = %8, %4
  %.13 = phi i32 [ %10, %8 ], [ %.02, %4 ]
  %.1 = phi ptr [ %.0, %8 ], [ %.01, %4 ]
  %12 = getelementptr inbounds %struct.Bid, ptr %.0, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  br label %2, !llvm.loop !8

14:                                               ; preds = %2
  ret ptr %.01
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @insertBid(ptr noundef %1, ptr noundef @.str.1, i32 noundef 100)
  call void @insertBid(ptr noundef %1, ptr noundef @.str.2, i32 noundef 120)
  call void @insertBid(ptr noundef %1, ptr noundef @.str.3, i32 noundef 110)
  %2 = load ptr, ptr %1, align 8
  call void @printBids(ptr noundef %2)
  %3 = load ptr, ptr %1, align 8
  %4 = call ptr @findWinningBid(ptr noundef %3)
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %12

6:                                                ; preds = %0
  %7 = getelementptr inbounds %struct.Bid, ptr %4, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds %struct.Bid, ptr %4, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %8, i32 noundef %10)
  br label %14

12:                                               ; preds = %0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %14

14:                                               ; preds = %12, %6
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
