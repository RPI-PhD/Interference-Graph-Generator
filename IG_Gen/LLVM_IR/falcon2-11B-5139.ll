; ModuleID = 'DATASETv2/falcon2-11B-5139.c'
source_filename = "DATASETv2/falcon2-11B-5139.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StockMarketTracker = type { [10 x %struct.Ticker], i32 }
%struct.Ticker = type { [5 x i8], i32 }

@.str = private unnamed_addr constant [32 x i8] c"Error: Too many tickers added.\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Error: Ticker not found.\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"%s: %d shares\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"AAPL\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"GOOG\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"MSFT\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"TSLA\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"AMZN\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"FB\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"NFLX\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"PYPL\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"ZNGA\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"Tickers: \00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"\0AAfter removing NFLX: \00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_ticker(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.StockMarketTracker, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %45

11:                                               ; preds = %3
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.StockMarketTracker, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.StockMarketTracker, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x %struct.Ticker], ptr %13, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Ticker, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [5 x i8], ptr %19, i64 0, i64 0
  store i8 0, ptr %20, align 4
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.StockMarketTracker, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.StockMarketTracker, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [10 x %struct.Ticker], ptr %22, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.Ticker, ptr %27, i32 0, i32 0
  %29 = getelementptr inbounds [5 x i8], ptr %28, i64 0, i64 0
  %30 = load ptr, ptr %5, align 8
  %31 = call ptr @strncpy(ptr noundef %29, ptr noundef %30, i64 noundef 4) #5
  %32 = load i32, ptr %6, align 4
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.StockMarketTracker, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.StockMarketTracker, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [10 x %struct.Ticker], ptr %34, i64 0, i64 %38
  %40 = getelementptr inbounds %struct.Ticker, ptr %39, i32 0, i32 1
  store i32 %32, ptr %40, align 4
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.StockMarketTracker, ptr %41, i32 0, i32 1
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %42, align 4
  br label %47

45:                                               ; preds = %3
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %47

47:                                               ; preds = %45, %11
  ret void
}

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @remove_ticker(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %54, %2
  %8 = load i32, ptr %5, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.StockMarketTracker, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %57

13:                                               ; preds = %7
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.StockMarketTracker, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x %struct.Ticker], ptr %15, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Ticker, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [5 x i8], ptr %19, i64 0, i64 0
  %21 = load ptr, ptr %4, align 8
  %22 = call i32 @strcmp(ptr noundef %20, ptr noundef %21) #6
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %53

24:                                               ; preds = %13
  %25 = load i32, ptr %5, align 4
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %45, %24
  %27 = load i32, ptr %6, align 4
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.StockMarketTracker, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = sub nsw i32 %30, 1
  %32 = icmp slt i32 %27, %31
  br i1 %32, label %33, label %48

33:                                               ; preds = %26
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.StockMarketTracker, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %6, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [10 x %struct.Ticker], ptr %35, i64 0, i64 %37
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.StockMarketTracker, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [10 x %struct.Ticker], ptr %40, i64 0, i64 %43
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %38, ptr align 4 %44, i64 12, i1 false)
  br label %45

45:                                               ; preds = %33
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %6, align 4
  br label %26, !llvm.loop !6

48:                                               ; preds = %26
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.StockMarketTracker, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, ptr %50, align 4
  br label %59

53:                                               ; preds = %13
  br label %54

54:                                               ; preds = %53
  %55 = load i32, ptr %5, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %5, align 4
  br label %7, !llvm.loop !8

57:                                               ; preds = %7
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %59

59:                                               ; preds = %57, %48
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @list_tickers(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %26, %1
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.StockMarketTracker, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %5, %8
  br i1 %9, label %10, label %29

10:                                               ; preds = %4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.StockMarketTracker, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x %struct.Ticker], ptr %12, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Ticker, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [5 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds %struct.StockMarketTracker, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10 x %struct.Ticker], ptr %19, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Ticker, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %17, i32 noundef %24)
  br label %26

26:                                               ; preds = %10
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %3, align 4
  br label %4, !llvm.loop !9

29:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.StockMarketTracker, align 4
  store i32 0, ptr %1, align 4
  %3 = getelementptr inbounds %struct.StockMarketTracker, ptr %2, i32 0, i32 1
  store i32 0, ptr %3, align 4
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.3, i32 noundef 10)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.4, i32 noundef 20)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.5, i32 noundef 30)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.6, i32 noundef 50)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.7, i32 noundef 60)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.8, i32 noundef 70)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.9, i32 noundef 80)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.10, i32 noundef 90)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.11, i32 noundef 100)
  call void @add_ticker(ptr noundef %2, ptr noundef @.str.9, i32 noundef 10)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @list_tickers(ptr noundef %2)
  call void @remove_ticker(ptr noundef %2, ptr noundef @.str.9)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  call void @list_tickers(ptr noundef %2)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }

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
