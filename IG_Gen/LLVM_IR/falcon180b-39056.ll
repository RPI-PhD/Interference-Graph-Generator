; ModuleID = 'DATASETv2/falcon180b-39056.c'
source_filename = "DATASETv2/falcon180b-39056.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.item = type { [50 x i8], i32, i32, i32 }

@.str = private unnamed_addr constant [68 x i8] c"%d. %s - Starting bid: $%d - Current bid: $%d - Highest bidder: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"%s sold to bidder %d for $%d!\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"%d placed a bid of $%d on %s!\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Auction not over.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initialize_items(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %35, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %38

10:                                               ; preds = %6
  %11 = call i32 @rand() #3
  %12 = srem i32 %11, 100
  %13 = add nsw i32 %12, 1
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %struct.item, ptr %14, i64 %16
  %18 = getelementptr inbounds %struct.item, ptr %17, i32 0, i32 1
  store i32 %13, ptr %18, align 4
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.item, ptr %19, i64 %21
  %23 = getelementptr inbounds %struct.item, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.item, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.item, ptr %28, i32 0, i32 2
  store i32 %24, ptr %29, align 4
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %5, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.item, ptr %30, i64 %32
  %34 = getelementptr inbounds %struct.item, ptr %33, i32 0, i32 3
  store i32 -1, ptr %34, align 4
  br label %35

35:                                               ; preds = %10
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %5, align 4
  br label %6, !llvm.loop !6

38:                                               ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_items(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %38, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %41

10:                                               ; preds = %6
  %11 = load i32, ptr %5, align 4
  %12 = add nsw i32 %11, 1
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct.item, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct.item, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [50 x i8], ptr %17, i64 0, i64 0
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.item, ptr %19, i64 %21
  %23 = getelementptr inbounds %struct.item, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %3, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.item, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.item, ptr %28, i32 0, i32 2
  %30 = load i32, ptr %29, align 4
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.item, ptr %31, i64 %33
  %35 = getelementptr inbounds %struct.item, ptr %34, i32 0, i32 3
  %36 = load i32, ptr %35, align 4
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12, ptr noundef %18, i32 noundef %24, i32 noundef %30, i32 noundef %36)
  br label %38

38:                                               ; preds = %10
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  br label %6, !llvm.loop !8

41:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @place_bid(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %11 = load ptr, ptr %6, align 8
  %12 = load i32, ptr %8, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.item, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.item, ptr %14, i32 0, i32 2
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %9, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %32

19:                                               ; preds = %5
  %20 = load i32, ptr %9, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.item, ptr %21, i64 %23
  %25 = getelementptr inbounds %struct.item, ptr %24, i32 0, i32 2
  store i32 %20, ptr %25, align 4
  %26 = load i32, ptr %10, align 4
  %27 = load ptr, ptr %6, align 8
  %28 = load i32, ptr %8, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.item, ptr %27, i64 %29
  %31 = getelementptr inbounds %struct.item, ptr %30, i32 0, i32 3
  store i32 %26, ptr %31, align 4
  br label %32

32:                                               ; preds = %19, %5
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @is_auction_over(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %21, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %24

11:                                               ; preds = %7
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.item, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.item, ptr %15, i32 0, i32 3
  %17 = load i32, ptr %16, align 4
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %20

19:                                               ; preds = %11
  store i32 0, ptr %3, align 4
  br label %25

20:                                               ; preds = %11
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %6, align 4
  br label %7, !llvm.loop !9

24:                                               ; preds = %7
  store i32 1, ptr %3, align 4
  br label %25

25:                                               ; preds = %24, %19
  %26 = load i32, ptr %3, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @get_winning_bids(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %30, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %33

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.item, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.item, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds [50 x i8], ptr %15, i64 0, i64 0
  %17 = load ptr, ptr %3, align 8
  %18 = load i32, ptr %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.item, ptr %17, i64 %19
  %21 = getelementptr inbounds %struct.item, ptr %20, i32 0, i32 3
  %22 = load i32, ptr %21, align 4
  %23 = load ptr, ptr %3, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.item, ptr %23, i64 %25
  %27 = getelementptr inbounds %struct.item, ptr %26, i32 0, i32 2
  %28 = load i32, ptr %27, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %16, i32 noundef %22, i32 noundef %28)
  br label %30

30:                                               ; preds = %10
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %6, !llvm.loop !10

33:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x %struct.item], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %7 = call i64 @time(ptr noundef null) #3
  %8 = trunc i64 %7 to i32
  call void @srand(i32 noundef %8) #3
  %9 = getelementptr inbounds [5 x %struct.item], ptr %2, i64 0, i64 0
  call void @initialize_items(ptr noundef %9, i32 noundef 5)
  %10 = getelementptr inbounds [5 x %struct.item], ptr %2, i64 0, i64 0
  call void @display_items(ptr noundef %10, i32 noundef 5)
  store i32 5, ptr %3, align 4
  br label %11

11:                                               ; preds = %14, %0
  %12 = load i32, ptr %3, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %37

14:                                               ; preds = %11
  %15 = call i32 @rand() #3
  %16 = srem i32 %15, 5
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %4, align 4
  %18 = call i32 @rand() #3
  %19 = srem i32 %18, 5
  store i32 %19, ptr %5, align 4
  %20 = call i32 @rand() #3
  %21 = srem i32 %20, 100
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %6, align 4
  %23 = getelementptr inbounds [5 x %struct.item], ptr %2, i64 0, i64 0
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %4, align 4
  call void @place_bid(ptr noundef %23, i32 noundef 5, i32 noundef %24, i32 noundef %25, i32 noundef %26)
  %27 = load i32, ptr %4, align 4
  %28 = load i32, ptr %6, align 4
  %29 = load i32, ptr %5, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [5 x %struct.item], ptr %2, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.item, ptr %31, i32 0, i32 0
  %33 = getelementptr inbounds [50 x i8], ptr %32, i64 0, i64 0
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %27, i32 noundef %28, ptr noundef %33)
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, ptr %3, align 4
  br label %11, !llvm.loop !11

37:                                               ; preds = %11
  %38 = getelementptr inbounds [5 x %struct.item], ptr %2, i64 0, i64 0
  %39 = call i32 @is_auction_over(ptr noundef %38, i32 noundef 5)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %37
  %42 = getelementptr inbounds [5 x %struct.item], ptr %2, i64 0, i64 0
  call void @get_winning_bids(ptr noundef %42, i32 noundef 5)
  br label %45

43:                                               ; preds = %37
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %45

45:                                               ; preds = %43, %41
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
