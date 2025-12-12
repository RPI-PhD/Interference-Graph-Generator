; ModuleID = 'LLVM_IR/falcon180b-39056.ll'
source_filename = "DATASETv2/falcon180b-39056.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.item = type { [50 x i8], i32, i32, i32 }

@.str = private unnamed_addr constant [68 x i8] c"%d. %s - Starting bid: $%d - Current bid: $%d - Highest bidder: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"%s sold to bidder %d for $%d!\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"%d placed a bid of $%d on %s!\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Auction not over.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initialize_items(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %22, %2
  %.0 = phi i32 [ 0, %2 ], [ %23, %22 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %24

5:                                                ; preds = %3
  %6 = call i32 @rand() #3
  %7 = srem i32 %6, 100
  %8 = add nsw i32 %7, 1
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds %struct.item, ptr %0, i64 %9
  %11 = getelementptr inbounds %struct.item, ptr %10, i32 0, i32 1
  store i32 %8, ptr %11, align 4
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds %struct.item, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.item, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = sext i32 %.0 to i64
  %17 = getelementptr inbounds %struct.item, ptr %0, i64 %16
  %18 = getelementptr inbounds %struct.item, ptr %17, i32 0, i32 2
  store i32 %15, ptr %18, align 4
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds %struct.item, ptr %0, i64 %19
  %21 = getelementptr inbounds %struct.item, ptr %20, i32 0, i32 3
  store i32 -1, ptr %21, align 4
  br label %22

22:                                               ; preds = %5
  %23 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

24:                                               ; preds = %3
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_items(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %24, %2
  %.0 = phi i32 [ 0, %2 ], [ %25, %24 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %26

5:                                                ; preds = %3
  %6 = add nsw i32 %.0, 1
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.item, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.item, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.item, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.item, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.item, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.item, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 4
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds %struct.item, ptr %0, i64 %19
  %21 = getelementptr inbounds %struct.item, ptr %20, i32 0, i32 3
  %22 = load i32, ptr %21, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %6, ptr noundef %10, i32 noundef %14, i32 noundef %18, i32 noundef %22)
  br label %24

24:                                               ; preds = %5
  %25 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

26:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @place_bid(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds %struct.item, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.item, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %9, %3
  br i1 %10, label %11, label %18

11:                                               ; preds = %5
  %12 = sext i32 %2 to i64
  %13 = getelementptr inbounds %struct.item, ptr %0, i64 %12
  %14 = getelementptr inbounds %struct.item, ptr %13, i32 0, i32 2
  store i32 %3, ptr %14, align 4
  %15 = sext i32 %2 to i64
  %16 = getelementptr inbounds %struct.item, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.item, ptr %16, i32 0, i32 3
  store i32 %4, ptr %17, align 4
  br label %18

18:                                               ; preds = %11, %5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @is_auction_over(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %13, %2
  %.01 = phi i32 [ 0, %2 ], [ %14, %13 ]
  %4 = icmp slt i32 %.01, %1
  br i1 %4, label %5, label %15

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds %struct.item, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.item, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %12

11:                                               ; preds = %5
  br label %16

12:                                               ; preds = %5
  br label %13

13:                                               ; preds = %12
  %14 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !9

15:                                               ; preds = %3
  br label %16

16:                                               ; preds = %15, %11
  %.0 = phi i32 [ 0, %11 ], [ 1, %15 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @get_winning_bids(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %19, %2
  %.0 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %21

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.item, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.item, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds %struct.item, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.item, ptr %11, i32 0, i32 3
  %13 = load i32, ptr %12, align 4
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds %struct.item, ptr %0, i64 %14
  %16 = getelementptr inbounds %struct.item, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %9, i32 noundef %13, i32 noundef %17)
  br label %19

19:                                               ; preds = %5
  %20 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !10

21:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x %struct.item], align 16
  %2 = call i64 @time(ptr noundef null) #3
  %3 = trunc i64 %2 to i32
  call void @srand(i32 noundef %3) #3
  %4 = getelementptr inbounds [5 x %struct.item], ptr %1, i64 0, i64 0
  call void @initialize_items(ptr noundef %4, i32 noundef 5)
  %5 = getelementptr inbounds [5 x %struct.item], ptr %1, i64 0, i64 0
  call void @display_items(ptr noundef %5, i32 noundef 5)
  br label %6

6:                                                ; preds = %8, %0
  %.0 = phi i32 [ 5, %0 ], [ %23, %8 ]
  %7 = icmp sgt i32 %.0, 0
  br i1 %7, label %8, label %24

8:                                                ; preds = %6
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 5
  %11 = add nsw i32 %10, 1
  %12 = call i32 @rand() #3
  %13 = srem i32 %12, 5
  %14 = call i32 @rand() #3
  %15 = srem i32 %14, 100
  %16 = add nsw i32 %15, 1
  %17 = getelementptr inbounds [5 x %struct.item], ptr %1, i64 0, i64 0
  call void @place_bid(ptr noundef %17, i32 noundef 5, i32 noundef %13, i32 noundef %16, i32 noundef %11)
  %18 = sext i32 %13 to i64
  %19 = getelementptr inbounds [5 x %struct.item], ptr %1, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.item, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [50 x i8], ptr %20, i64 0, i64 0
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %11, i32 noundef %16, ptr noundef %21)
  %23 = add nsw i32 %.0, -1
  br label %6, !llvm.loop !11

24:                                               ; preds = %6
  %25 = getelementptr inbounds [5 x %struct.item], ptr %1, i64 0, i64 0
  %26 = call i32 @is_auction_over(ptr noundef %25, i32 noundef 5)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %24
  %29 = getelementptr inbounds [5 x %struct.item], ptr %1, i64 0, i64 0
  call void @get_winning_bids(ptr noundef %29, i32 noundef 5)
  br label %32

30:                                               ; preds = %24
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %32

32:                                               ; preds = %30, %28
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
