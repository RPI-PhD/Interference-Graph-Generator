; ModuleID = 'LLVM_IR/codellama_13b-11500.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_item(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3)
  %5 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 1
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %6)
  %8 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %9)
  %11 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 3
  %12 = load i32, ptr %11, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %12)
  %14 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 4
  %15 = load i32, ptr %14, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %15)
  %17 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 5
  %18 = load i32, ptr %17, align 4
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %18)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @place_bid(ptr noundef %0, i32 noundef %1) #0 {
  %3 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 3
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %1, %4
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %18

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 3
  %10 = load i32, ptr %9, align 4
  %11 = icmp sgt i32 %1, %10
  br i1 %11, label %12, label %17

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 3
  store i32 %1, ptr %13, align 4
  %14 = getelementptr inbounds %struct.item, ptr %0, i32 0, i32 5
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 4
  br label %17

17:                                               ; preds = %12, %8
  call void @print_item(ptr noundef %0)
  br label %18

18:                                               ; preds = %17, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [3 x %struct.item], align 16
  %2 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  %3 = getelementptr inbounds %struct.item, ptr %2, i32 0, i32 0
  store i32 1, ptr %3, align 16
  %4 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  %5 = getelementptr inbounds %struct.item, ptr %4, i32 0, i32 1
  %6 = getelementptr inbounds [50 x i8], ptr %5, i64 0, i64 0
  %7 = call ptr @strcpy(ptr noundef %6, ptr noundef @.str.7) #3
  %8 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  %9 = getelementptr inbounds %struct.item, ptr %8, i32 0, i32 2
  store i32 100, ptr %9, align 8
  %10 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  %11 = getelementptr inbounds %struct.item, ptr %10, i32 0, i32 3
  store i32 100, ptr %11, align 4
  %12 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  %13 = getelementptr inbounds %struct.item, ptr %12, i32 0, i32 4
  store i32 10, ptr %13, align 16
  %14 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  %15 = getelementptr inbounds %struct.item, ptr %14, i32 0, i32 5
  store i32 0, ptr %15, align 4
  %16 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  %17 = getelementptr inbounds %struct.item, ptr %16, i32 0, i32 0
  store i32 2, ptr %17, align 8
  %18 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  %19 = getelementptr inbounds %struct.item, ptr %18, i32 0, i32 1
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = call ptr @strcpy(ptr noundef %20, ptr noundef @.str.8) #3
  %22 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  %23 = getelementptr inbounds %struct.item, ptr %22, i32 0, i32 2
  store i32 200, ptr %23, align 8
  %24 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  %25 = getelementptr inbounds %struct.item, ptr %24, i32 0, i32 3
  store i32 200, ptr %25, align 4
  %26 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  %27 = getelementptr inbounds %struct.item, ptr %26, i32 0, i32 4
  store i32 20, ptr %27, align 8
  %28 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  %29 = getelementptr inbounds %struct.item, ptr %28, i32 0, i32 5
  store i32 0, ptr %29, align 4
  %30 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  %31 = getelementptr inbounds %struct.item, ptr %30, i32 0, i32 0
  store i32 3, ptr %31, align 16
  %32 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  %33 = getelementptr inbounds %struct.item, ptr %32, i32 0, i32 1
  %34 = getelementptr inbounds [50 x i8], ptr %33, i64 0, i64 0
  %35 = call ptr @strcpy(ptr noundef %34, ptr noundef @.str.9) #3
  %36 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  %37 = getelementptr inbounds %struct.item, ptr %36, i32 0, i32 2
  store i32 300, ptr %37, align 8
  %38 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  %39 = getelementptr inbounds %struct.item, ptr %38, i32 0, i32 3
  store i32 300, ptr %39, align 4
  %40 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  %41 = getelementptr inbounds %struct.item, ptr %40, i32 0, i32 4
  store i32 30, ptr %41, align 16
  %42 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  %43 = getelementptr inbounds %struct.item, ptr %42, i32 0, i32 5
  store i32 0, ptr %43, align 4
  %44 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 0
  call void @place_bid(ptr noundef %44, i32 noundef 110)
  %45 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 1
  call void @place_bid(ptr noundef %45, i32 noundef 220)
  %46 = getelementptr inbounds [3 x %struct.item], ptr %1, i64 0, i64 2
  call void @place_bid(ptr noundef %46, i32 noundef 330)
  ret i32 0
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
