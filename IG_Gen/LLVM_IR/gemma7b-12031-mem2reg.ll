; ModuleID = 'LLVM_IR/gemma7b-12031.ll'
source_filename = "DATASETv2/gemma7b-12031.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Bidder = type { [20 x i8], i32, ptr }

@.str = private unnamed_addr constant [6 x i8] c"Romeo\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Juliet\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c" Mercutio\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Benvolio\00", align 1
@.str.4 = private unnamed_addr constant [44 x i8] c"The highest bidder is: %s with a bid of %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @insertBidder(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = call noalias ptr @malloc(i64 noundef 32) #4
  %5 = getelementptr inbounds %struct.Bidder, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [20 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef %1) #5
  %8 = getelementptr inbounds %struct.Bidder, ptr %4, i32 0, i32 1
  store i32 %2, ptr %8, align 4
  %9 = getelementptr inbounds %struct.Bidder, ptr %4, i32 0, i32 2
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %0, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %3
  store ptr %4, ptr %0, align 8
  br label %16

13:                                               ; preds = %3
  %14 = load ptr, ptr %0, align 8
  %15 = getelementptr inbounds %struct.Bidder, ptr %14, i32 0, i32 2
  store ptr %4, ptr %15, align 8
  br label %16

16:                                               ; preds = %13, %12
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @findHighestBidder(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %17, %1
  %.0 = phi ptr [ %0, %1 ], [ %.1, %17 ]
  %3 = getelementptr inbounds %struct.Bidder, ptr %.0, i32 0, i32 2
  %4 = load ptr, ptr %3, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %18

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.Bidder, ptr %.0, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds %struct.Bidder, ptr %.0, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.Bidder, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = icmp sgt i32 %8, %12
  br i1 %13, label %14, label %17

14:                                               ; preds = %6
  %15 = getelementptr inbounds %struct.Bidder, ptr %.0, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  br label %17

17:                                               ; preds = %14, %6
  %.1 = phi ptr [ %16, %14 ], [ %.0, %6 ]
  br label %2, !llvm.loop !6

18:                                               ; preds = %2
  ret ptr %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  call void @insertBidder(ptr noundef %1, ptr noundef @.str, i32 noundef 10)
  call void @insertBidder(ptr noundef %1, ptr noundef @.str.1, i32 noundef 12)
  call void @insertBidder(ptr noundef %1, ptr noundef @.str.2, i32 noundef 14)
  call void @insertBidder(ptr noundef %1, ptr noundef @.str.3, i32 noundef 16)
  %2 = load ptr, ptr %1, align 8
  %3 = call ptr @findHighestBidder(ptr noundef %2)
  %4 = getelementptr inbounds %struct.Bidder, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0
  %6 = getelementptr inbounds %struct.Bidder, ptr %3, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %5, i32 noundef %7)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

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
