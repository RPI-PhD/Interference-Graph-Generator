; ModuleID = 'LLVM_IR/mistral_7b-688.ll'
source_filename = "DATASETv2/mistral_7b-688.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StockItem = type { i32, %struct.Medicine }
%struct.Medicine = type { [50 x i8], i32, float }

@stock_count = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [20 x i8] c"Error: Stock full!\0A\00", align 1
@stock = dso_local global [100 x %struct.StockItem] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [17 x i8] c"\0ACURRENT STOCK:\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"\0AID: %d\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"\0AMEDICINE: %s\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"\0AQUANTITY: %d\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"\0APRICE: %.2f\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"\0AMedicine not found!\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"\0AEnter medicine name: \00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"\0AEnter quantity: \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"\0AEnter price: \00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.13 = private unnamed_addr constant [33 x i8] c"\0AEnter medicine name to search: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_medicine(ptr noundef %0, i32 noundef %1, float noundef %2) #0 {
  %4 = load i32, ptr @stock_count, align 4
  %5 = icmp sge i32 %4, 100
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %28

8:                                                ; preds = %3
  %9 = load i32, ptr @stock_count, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.StockItem, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds %struct.Medicine, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [50 x i8], ptr %13, i64 0, i64 0
  %15 = call ptr @strcpy(ptr noundef %14, ptr noundef %0) #4
  %16 = load i32, ptr @stock_count, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.StockItem, ptr %18, i32 0, i32 1
  %20 = getelementptr inbounds %struct.Medicine, ptr %19, i32 0, i32 1
  store i32 %1, ptr %20, align 4
  %21 = load i32, ptr @stock_count, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.StockItem, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.Medicine, ptr %24, i32 0, i32 2
  store float %2, ptr %25, align 4
  %26 = load i32, ptr @stock_count, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr @stock_count, align 4
  br label %28

28:                                               ; preds = %8, %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_stock() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %2

2:                                                ; preds = %30, %0
  %.0 = phi i32 [ 0, %0 ], [ %31, %30 ]
  %3 = load i32, ptr @stock_count, align 4
  %4 = icmp slt i32 %.0, %3
  br i1 %4, label %5, label %32

5:                                                ; preds = %2
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.StockItem, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 16
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %9)
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.StockItem, ptr %12, i32 0, i32 1
  %14 = getelementptr inbounds %struct.Medicine, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [50 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %15)
  %17 = sext i32 %.0 to i64
  %18 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.StockItem, ptr %18, i32 0, i32 1
  %20 = getelementptr inbounds %struct.Medicine, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %21)
  %23 = sext i32 %.0 to i64
  %24 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %23
  %25 = getelementptr inbounds %struct.StockItem, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds %struct.Medicine, ptr %25, i32 0, i32 2
  %27 = load float, ptr %26, align 4
  %28 = fpext float %27 to double
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %28)
  br label %30

30:                                               ; preds = %5
  %31 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

32:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @search_medicine(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %39, %1
  %.0 = phi i32 [ 0, %1 ], [ %40, %39 ]
  %3 = load i32, ptr @stock_count, align 4
  %4 = icmp slt i32 %.0, %3
  br i1 %4, label %5, label %41

5:                                                ; preds = %2
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.StockItem, ptr %7, i32 0, i32 1
  %9 = getelementptr inbounds %struct.Medicine, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 @strcmp(ptr noundef %10, ptr noundef %0) #5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %38

13:                                               ; preds = %5
  %14 = sext i32 %.0 to i64
  %15 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.StockItem, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 16
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %17)
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.StockItem, ptr %20, i32 0, i32 1
  %22 = getelementptr inbounds %struct.Medicine, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [50 x i8], ptr %22, i64 0, i64 0
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %23)
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.StockItem, ptr %26, i32 0, i32 1
  %28 = getelementptr inbounds %struct.Medicine, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %29)
  %31 = sext i32 %.0 to i64
  %32 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.StockItem, ptr %32, i32 0, i32 1
  %34 = getelementptr inbounds %struct.Medicine, ptr %33, i32 0, i32 2
  %35 = load float, ptr %34, align 4
  %36 = fpext float %35 to double
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %36)
  br label %43

38:                                               ; preds = %5
  br label %39

39:                                               ; preds = %38
  %40 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

41:                                               ; preds = %2
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %43

43:                                               ; preds = %41, %13
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [50 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  %4 = alloca [50 x i8], align 16
  br label %5

5:                                                ; preds = %18, %0
  %.0 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %6 = icmp slt i32 %.0, 5
  br i1 %6, label %7, label %20

7:                                                ; preds = %5
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %9 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %2)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %14 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %3)
  %15 = getelementptr inbounds [50 x i8], ptr %1, i64 0, i64 0
  %16 = load i32, ptr %2, align 4
  %17 = load float, ptr %3, align 4
  call void @add_medicine(ptr noundef %15, i32 noundef %16, float noundef %17)
  br label %18

18:                                               ; preds = %7
  %19 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !9

20:                                               ; preds = %5
  call void @display_stock()
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %22 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %22)
  %24 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0
  call void @search_medicine(ptr noundef %24)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(read) }

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
