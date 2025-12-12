; ModuleID = 'DATASETv2/codellama_13b-11500.c'
source_filename = "DATASETv2/codellama_13b-11500.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.item = type { i32, [50 x i8], i32, i32, i32, i32 }

@.str = private unnamed_addr constant [13 x i8] c"Item ID: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Item Name: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Starting Bid: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Current Bid: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Bid Increment: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Number of Bids: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"Invalid bid\0A\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"Item 1\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Item 2\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"Item 3\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_item(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.item, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.item, ptr %7, i32 0, i32 1
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %9)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.item, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %13)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.item, ptr %15, i32 0, i32 3
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %17)
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.item, ptr %19, i32 0, i32 4
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %21)
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.item, ptr %23, i32 0, i32 5
  %25 = load i32, ptr %24, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %25)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @place_bid(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.item, ptr %6, i32 0, i32 3
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %28

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.item, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %15, align 4
  %17 = icmp sgt i32 %13, %16
  br i1 %17, label %18, label %26

18:                                               ; preds = %12
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.item, ptr %20, i32 0, i32 3
  store i32 %19, ptr %21, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.item, ptr %22, i32 0, i32 5
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %23, align 4
  br label %26

26:                                               ; preds = %18, %12
  %27 = load ptr, ptr %3, align 8
  call void @print_item(ptr noundef %27)
  br label %28

28:                                               ; preds = %26, %10
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x %struct.item], align 16
  store i32 0, ptr %1, align 4
  %3 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  %4 = getelementptr inbounds %struct.item, ptr %3, i32 0, i32 0
  store i32 1, ptr %4, align 16
  %5 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  %6 = getelementptr inbounds %struct.item, ptr %5, i32 0, i32 1
  %7 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %8 = call ptr @strcpy(ptr noundef %7, ptr noundef @.str.7) #3
  %9 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  %10 = getelementptr inbounds %struct.item, ptr %9, i32 0, i32 2
  store i32 100, ptr %10, align 8
  %11 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  %12 = getelementptr inbounds %struct.item, ptr %11, i32 0, i32 3
  store i32 100, ptr %12, align 4
  %13 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  %14 = getelementptr inbounds %struct.item, ptr %13, i32 0, i32 4
  store i32 10, ptr %14, align 16
  %15 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  %16 = getelementptr inbounds %struct.item, ptr %15, i32 0, i32 5
  store i32 0, ptr %16, align 4
  %17 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  %18 = getelementptr inbounds %struct.item, ptr %17, i32 0, i32 0
  store i32 2, ptr %18, align 8
  %19 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  %20 = getelementptr inbounds %struct.item, ptr %19, i32 0, i32 1
  %21 = getelementptr inbounds [50 x i8], ptr %20, i64 0, i64 0
  %22 = call ptr @strcpy(ptr noundef %21, ptr noundef @.str.8) #3
  %23 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  %24 = getelementptr inbounds %struct.item, ptr %23, i32 0, i32 2
  store i32 200, ptr %24, align 8
  %25 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  %26 = getelementptr inbounds %struct.item, ptr %25, i32 0, i32 3
  store i32 200, ptr %26, align 4
  %27 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  %28 = getelementptr inbounds %struct.item, ptr %27, i32 0, i32 4
  store i32 20, ptr %28, align 8
  %29 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  %30 = getelementptr inbounds %struct.item, ptr %29, i32 0, i32 5
  store i32 0, ptr %30, align 4
  %31 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  %32 = getelementptr inbounds %struct.item, ptr %31, i32 0, i32 0
  store i32 3, ptr %32, align 16
  %33 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  %34 = getelementptr inbounds %struct.item, ptr %33, i32 0, i32 1
  %35 = getelementptr inbounds [50 x i8], ptr %34, i64 0, i64 0
  %36 = call ptr @strcpy(ptr noundef %35, ptr noundef @.str.9) #3
  %37 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  %38 = getelementptr inbounds %struct.item, ptr %37, i32 0, i32 2
  store i32 300, ptr %38, align 8
  %39 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  %40 = getelementptr inbounds %struct.item, ptr %39, i32 0, i32 3
  store i32 300, ptr %40, align 4
  %41 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  %42 = getelementptr inbounds %struct.item, ptr %41, i32 0, i32 4
  store i32 30, ptr %42, align 16
  %43 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  %44 = getelementptr inbounds %struct.item, ptr %43, i32 0, i32 5
  store i32 0, ptr %44, align 4
  %45 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 0
  call void @place_bid(ptr noundef %45, i32 noundef 110)
  %46 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 1
  call void @place_bid(ptr noundef %46, i32 noundef 220)
  %47 = getelementptr inbounds [3 x %struct.item], ptr %2, i64 0, i64 2
  call void @place_bid(ptr noundef %47, i32 noundef 330)
  ret i32 0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
