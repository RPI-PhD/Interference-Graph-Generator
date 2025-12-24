; ModuleID = 'LLVM_IR/falcon2-11B-5139.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_ticker(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %5, 10
  br i1 %6, label %7, label %32

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %9 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10 x %struct.Ticker], ptr %8, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.Ticker, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [5 x i8], ptr %13, i64 0, i64 0
  store i8 0, ptr %14, align 4
  %15 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %16 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [10 x %struct.Ticker], ptr %15, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Ticker, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [5 x i8], ptr %20, i64 0, i64 0
  %22 = call ptr @strncpy(ptr noundef %21, ptr noundef %1, i64 noundef 4) #5
  %23 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %24 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [10 x %struct.Ticker], ptr %23, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.Ticker, ptr %27, i32 0, i32 1
  store i32 %2, ptr %28, align 4
  %29 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %29, align 4
  br label %34

32:                                               ; preds = %3
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %34

34:                                               ; preds = %32, %7
  ret void
}

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @remove_ticker(ptr noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %36, %2
  %.01 = phi i32 [ 0, %2 ], [ %37, %36 ]
  %4 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %38

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [10 x %struct.Ticker], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Ticker, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [5 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 @strcmp(ptr noundef %12, ptr noundef %1) #6
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %35

15:                                               ; preds = %7
  br label %16

16:                                               ; preds = %29, %15
  %.0 = phi i32 [ %.01, %15 ], [ %30, %29 ]
  %17 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = sub nsw i32 %18, 1
  %20 = icmp slt i32 %.0, %19
  br i1 %20, label %21, label %31

21:                                               ; preds = %16
  %22 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [10 x %struct.Ticker], ptr %22, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %26 = add nsw i32 %.0, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [10 x %struct.Ticker], ptr %25, i64 0, i64 %27
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %24, ptr align 4 %28, i64 12, i1 false)
  br label %29

29:                                               ; preds = %21
  %30 = add nsw i32 %.0, 1
  br label %16, !llvm.loop !6

31:                                               ; preds = %16
  %32 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, ptr %32, align 4
  br label %40

35:                                               ; preds = %7
  br label %36

36:                                               ; preds = %35
  %37 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !8

38:                                               ; preds = %3
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %40

40:                                               ; preds = %38, %31
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @list_tickers(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %18, %1
  %.0 = phi i32 [ 0, %1 ], [ %19, %18 ]
  %3 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %20

6:                                                ; preds = %2
  %7 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds [10 x %struct.Ticker], ptr %7, i64 0, i64 %8
  %10 = getelementptr inbounds %struct.Ticker, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [5 x i8], ptr %10, i64 0, i64 0
  %12 = getelementptr inbounds %struct.StockMarketTracker, ptr %0, i32 0, i32 0
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [10 x %struct.Ticker], ptr %12, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.Ticker, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %11, i32 noundef %16)
  br label %18

18:                                               ; preds = %6
  %19 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

20:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.StockMarketTracker, align 4
  %2 = getelementptr inbounds %struct.StockMarketTracker, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 4
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.3, i32 noundef 10)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.4, i32 noundef 20)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.5, i32 noundef 30)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.6, i32 noundef 50)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.7, i32 noundef 60)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.8, i32 noundef 70)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.9, i32 noundef 80)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.10, i32 noundef 90)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.11, i32 noundef 100)
  call void @add_ticker(ptr noundef %1, ptr noundef @.str.9, i32 noundef 10)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  call void @list_tickers(ptr noundef %1)
  call void @remove_ticker(ptr noundef %1, ptr noundef @.str.9)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  call void @list_tickers(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
