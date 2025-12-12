; ModuleID = 'DATASETv2/mistral_7b-688.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_medicine(ptr noundef %0, i32 noundef %1, float noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store float %2, ptr %6, align 4
  %7 = load i32, ptr @stock_count, align 4
  %8 = icmp sge i32 %7, 100
  br i1 %8, label %9, label %11

9:                                                ; preds = %3
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %34

11:                                               ; preds = %3
  %12 = load i32, ptr @stock_count, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %13
  %15 = getelementptr inbounds %struct.StockItem, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds %struct.Medicine, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %4, align 8
  %19 = call ptr @strcpy(ptr noundef %17, ptr noundef %18) #4
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr @stock_count, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.StockItem, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.Medicine, ptr %24, i32 0, i32 1
  store i32 %20, ptr %25, align 4
  %26 = load float, ptr %6, align 4
  %27 = load i32, ptr @stock_count, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.StockItem, ptr %29, i32 0, i32 1
  %31 = getelementptr inbounds %struct.Medicine, ptr %30, i32 0, i32 2
  store float %26, ptr %31, align 4
  %32 = load i32, ptr @stock_count, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr @stock_count, align 4
  br label %34

34:                                               ; preds = %11, %9
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_stock() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %36, %0
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr @stock_count, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %39

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.StockItem, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 16
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %12)
  %14 = load i32, ptr %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.StockItem, ptr %16, i32 0, i32 1
  %18 = getelementptr inbounds %struct.Medicine, ptr %17, i32 0, i32 0
  %19 = getelementptr inbounds [50 x i8], ptr %18, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %19)
  %21 = load i32, ptr %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.StockItem, ptr %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.Medicine, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %26)
  %28 = load i32, ptr %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.StockItem, ptr %30, i32 0, i32 1
  %32 = getelementptr inbounds %struct.Medicine, ptr %31, i32 0, i32 2
  %33 = load float, ptr %32, align 4
  %34 = fpext float %33 to double
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %34)
  br label %36

36:                                               ; preds = %7
  %37 = load i32, ptr %1, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %1, align 4
  br label %3, !llvm.loop !6

39:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @search_medicine(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %48, %1
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr @stock_count, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %51

8:                                                ; preds = %4
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.StockItem, ptr %11, i32 0, i32 1
  %13 = getelementptr inbounds %struct.Medicine, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds [50 x i8], ptr %13, i64 0, i64 0
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 @strcmp(ptr noundef %14, ptr noundef %15) #5
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %47

18:                                               ; preds = %8
  %19 = load i32, ptr %3, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.StockItem, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 16
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %23)
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.StockItem, ptr %27, i32 0, i32 1
  %29 = getelementptr inbounds %struct.Medicine, ptr %28, i32 0, i32 0
  %30 = getelementptr inbounds [50 x i8], ptr %29, i64 0, i64 0
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %30)
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %33
  %35 = getelementptr inbounds %struct.StockItem, ptr %34, i32 0, i32 1
  %36 = getelementptr inbounds %struct.Medicine, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %37)
  %39 = load i32, ptr %3, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [100 x %struct.StockItem], ptr @stock, i64 0, i64 %40
  %42 = getelementptr inbounds %struct.StockItem, ptr %41, i32 0, i32 1
  %43 = getelementptr inbounds %struct.Medicine, ptr %42, i32 0, i32 2
  %44 = load float, ptr %43, align 4
  %45 = fpext float %44 to double
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %45)
  br label %53

47:                                               ; preds = %8
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %3, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %3, align 4
  br label %4, !llvm.loop !8

51:                                               ; preds = %4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %53

53:                                               ; preds = %51, %18
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [50 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca [50 x i8], align 16
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %21, %0
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 5
  br i1 %9, label %10, label %24

10:                                               ; preds = %7
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %12 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %4)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.12, ptr noundef %5)
  %18 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %19 = load i32, ptr %4, align 4
  %20 = load float, ptr %5, align 4
  call void @add_medicine(ptr noundef %18, i32 noundef %19, float noundef %20)
  br label %21

21:                                               ; preds = %10
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %2, align 4
  br label %7, !llvm.loop !9

24:                                               ; preds = %7
  call void @display_stock()
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %26 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  %27 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %26)
  %28 = getelementptr inbounds [50 x i8], ptr %6, i64 0, i64 0
  call void @search_medicine(ptr noundef %28)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
