; ModuleID = 'DATASETv2/gemma7b-12031.c'
source_filename = "DATASETv2/gemma7b-12031.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Bidder = type { [20 x i8], i32, ptr }

@.str = private unnamed_addr constant [6 x i8] c"Romeo\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"Juliet\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c" Mercutio\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Benvolio\00", align 1
@.str.4 = private unnamed_addr constant [44 x i8] c"The highest bidder is: %s with a bid of %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @insertBidder(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %8 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = getelementptr inbounds %struct.Bidder, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [20 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %5, align 8
  %13 = call ptr @strcpy(ptr noundef %11, ptr noundef %12) #5
  %14 = load i32, ptr %6, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.Bidder, ptr %15, i32 0, i32 1
  store i32 %14, ptr %16, align 4
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds %struct.Bidder, ptr %17, i32 0, i32 2
  store ptr null, ptr %18, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = load ptr, ptr %19, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %25

22:                                               ; preds = %3
  %23 = load ptr, ptr %7, align 8
  %24 = load ptr, ptr %4, align 8
  store ptr %23, ptr %24, align 8
  br label %30

25:                                               ; preds = %3
  %26 = load ptr, ptr %7, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.Bidder, ptr %28, i32 0, i32 2
  store ptr %26, ptr %29, align 8
  br label %30

30:                                               ; preds = %25, %22
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @findHighestBidder(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  store ptr %4, ptr %3, align 8
  br label %5

5:                                                ; preds = %24, %1
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Bidder, ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %25

10:                                               ; preds = %5
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.Bidder, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.Bidder, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.Bidder, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp sgt i32 %13, %18
  br i1 %19, label %20, label %24

20:                                               ; preds = %10
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.Bidder, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %3, align 8
  br label %24

24:                                               ; preds = %20, %10
  br label %5, !llvm.loop !6

25:                                               ; preds = %5
  %26 = load ptr, ptr %3, align 8
  ret ptr %26
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  call void @insertBidder(ptr noundef %2, ptr noundef @.str, i32 noundef 10)
  call void @insertBidder(ptr noundef %2, ptr noundef @.str.1, i32 noundef 12)
  call void @insertBidder(ptr noundef %2, ptr noundef @.str.2, i32 noundef 14)
  call void @insertBidder(ptr noundef %2, ptr noundef @.str.3, i32 noundef 16)
  %4 = load ptr, ptr %2, align 8
  %5 = call ptr @findHighestBidder(ptr noundef %4)
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Bidder, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds [20 x i8], ptr %7, i64 0, i64 0
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.Bidder, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %8, i32 noundef %11)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
