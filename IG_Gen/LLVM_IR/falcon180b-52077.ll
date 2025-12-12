; ModuleID = 'DATASETv2/falcon180b-52077.c'
source_filename = "DATASETv2/falcon180b-52077.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.item_t = type { [50 x i8], i32, float }

@.str = private unnamed_addr constant [26 x i8] c"Error: Max items reached\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Item added: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Items in store:\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"%s: %d in stock, $%.2f each\0A\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"%d %s purchased for $%.2f\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Not enough %s in stock\0A\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"Item not found\0A\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"Aspirin\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"Ibuprofen\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"Tylenol\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @add_item(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, float noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store float %4, ptr %10, align 4
  %11 = load i32, ptr %7, align 4
  %12 = icmp sge i32 %11, 100
  br i1 %12, label %13, label %15

13:                                               ; preds = %5
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %38

15:                                               ; preds = %5
  %16 = load ptr, ptr %6, align 8
  %17 = load i32, ptr %7, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.item_t, ptr %16, i64 %18
  %20 = getelementptr inbounds %struct.item_t, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [50 x i8], ptr %20, i64 0, i64 0
  %22 = load ptr, ptr %8, align 8
  %23 = call ptr @strcpy(ptr noundef %21, ptr noundef %22) #4
  %24 = load i32, ptr %9, align 4
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %7, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.item_t, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.item_t, ptr %28, i32 0, i32 1
  store i32 %24, ptr %29, align 4
  %30 = load float, ptr %10, align 4
  %31 = load ptr, ptr %6, align 8
  %32 = load i32, ptr %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.item_t, ptr %31, i64 %33
  %35 = getelementptr inbounds %struct.item_t, ptr %34, i32 0, i32 2
  store float %30, ptr %35, align 4
  %36 = load ptr, ptr %8, align 8
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %36)
  br label %38

38:                                               ; preds = %15, %13
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @display_items(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %32, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %35

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.item_t, ptr %12, i64 %14
  %16 = getelementptr inbounds %struct.item_t, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0
  %18 = load ptr, ptr %3, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.item_t, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.item_t, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.item_t, ptr %24, i64 %26
  %28 = getelementptr inbounds %struct.item_t, ptr %27, i32 0, i32 2
  %29 = load float, ptr %28, align 4
  %30 = fpext float %29 to double
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %17, i32 noundef %23, double noundef %30)
  br label %32

32:                                               ; preds = %11
  %33 = load i32, ptr %5, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %7, !llvm.loop !6

35:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @purchase_item(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %10

10:                                               ; preds = %60, %4
  %11 = load i32, ptr %9, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %63

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.item_t, ptr %15, i64 %17
  %19 = getelementptr inbounds %struct.item_t, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [50 x i8], ptr %19, i64 0, i64 0
  %21 = load ptr, ptr %7, align 8
  %22 = call i32 @strcmp(ptr noundef %20, ptr noundef %21) #5
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %59

24:                                               ; preds = %14
  %25 = load ptr, ptr %5, align 8
  %26 = load i32, ptr %9, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.item_t, ptr %25, i64 %27
  %29 = getelementptr inbounds %struct.item_t, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr %8, align 4
  %32 = icmp sge i32 %30, %31
  br i1 %32, label %33, label %55

33:                                               ; preds = %24
  %34 = load i32, ptr %8, align 4
  %35 = load ptr, ptr %5, align 8
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.item_t, ptr %35, i64 %37
  %39 = getelementptr inbounds %struct.item_t, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %39, align 4
  %41 = sub nsw i32 %40, %34
  store i32 %41, ptr %39, align 4
  %42 = load i32, ptr %8, align 4
  %43 = load ptr, ptr %7, align 8
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %9, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %struct.item_t, ptr %44, i64 %46
  %48 = getelementptr inbounds %struct.item_t, ptr %47, i32 0, i32 2
  %49 = load float, ptr %48, align 4
  %50 = load i32, ptr %8, align 4
  %51 = sitofp i32 %50 to float
  %52 = fmul float %49, %51
  %53 = fpext float %52 to double
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %42, ptr noundef %43, double noundef %53)
  br label %58

55:                                               ; preds = %24
  %56 = load ptr, ptr %7, align 8
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %56)
  br label %58

58:                                               ; preds = %55, %33
  br label %65

59:                                               ; preds = %14
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %9, align 4
  br label %10, !llvm.loop !8

63:                                               ; preds = %10
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %65

65:                                               ; preds = %63, %58
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @main() #0 {
  %1 = alloca [100 x %struct.item_t], align 16
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %3 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %4 = load i32, ptr %2, align 4
  call void @add_item(ptr noundef %3, i32 noundef %4, ptr noundef @.str.7, i32 noundef 100, float noundef 5.000000e-01)
  %5 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %6 = load i32, ptr %2, align 4
  call void @add_item(ptr noundef %5, i32 noundef %6, ptr noundef @.str.8, i32 noundef 50, float noundef 7.500000e-01)
  %7 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %8 = load i32, ptr %2, align 4
  call void @add_item(ptr noundef %7, i32 noundef %8, ptr noundef @.str.9, i32 noundef 75, float noundef 1.000000e+00)
  %9 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %10 = load i32, ptr %2, align 4
  call void @display_items(ptr noundef %9, i32 noundef %10)
  %11 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %12 = load i32, ptr %2, align 4
  call void @purchase_item(ptr noundef %11, i32 noundef %12, ptr noundef @.str.7, i32 noundef 25)
  %13 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %14 = load i32, ptr %2, align 4
  call void @purchase_item(ptr noundef %13, i32 noundef %14, ptr noundef @.str.8, i32 noundef 10)
  %15 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %16 = load i32, ptr %2, align 4
  call void @purchase_item(ptr noundef %15, i32 noundef %16, ptr noundef @.str.9, i32 noundef 50)
  %17 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  %18 = load i32, ptr %2, align 4
  call void @display_items(ptr noundef %17, i32 noundef %18)
  ret void
}

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
