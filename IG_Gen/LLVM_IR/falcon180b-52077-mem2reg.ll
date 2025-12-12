; ModuleID = 'LLVM_IR/falcon180b-52077.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_item(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, float noundef %4) #0 {
  %6 = icmp sge i32 %1, 100
  br i1 %6, label %7, label %9

7:                                                ; preds = %5
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %22

9:                                                ; preds = %5
  %10 = sext i32 %1 to i64
  %11 = getelementptr inbounds %struct.item_t, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.item_t, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call ptr @strcpy(ptr noundef %13, ptr noundef %2) #4
  %15 = sext i32 %1 to i64
  %16 = getelementptr inbounds %struct.item_t, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.item_t, ptr %16, i32 0, i32 1
  store i32 %3, ptr %17, align 4
  %18 = sext i32 %1 to i64
  %19 = getelementptr inbounds %struct.item_t, ptr %0, i64 %18
  %20 = getelementptr inbounds %struct.item_t, ptr %19, i32 0, i32 2
  store float %4, ptr %20, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %2)
  br label %22

22:                                               ; preds = %9, %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @display_items(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %4

4:                                                ; preds = %21, %2
  %.0 = phi i32 [ 0, %2 ], [ %22, %21 ]
  %5 = icmp slt i32 %.0, %1
  br i1 %5, label %6, label %23

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds %struct.item_t, ptr %0, i64 %7
  %9 = getelementptr inbounds %struct.item_t, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds %struct.item_t, ptr %0, i64 %11
  %13 = getelementptr inbounds %struct.item_t, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.item_t, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.item_t, ptr %16, i32 0, i32 2
  %18 = load float, ptr %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %10, i32 noundef %14, double noundef %19)
  br label %21

21:                                               ; preds = %6
  %22 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

23:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @purchase_item(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  br label %5

5:                                                ; preds = %38, %4
  %.0 = phi i32 [ 0, %4 ], [ %39, %38 ]
  %6 = icmp slt i32 %.0, %1
  br i1 %6, label %7, label %40

7:                                                ; preds = %5
  %8 = sext i32 %.0 to i64
  %9 = getelementptr inbounds %struct.item_t, ptr %0, i64 %8
  %10 = getelementptr inbounds %struct.item_t, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [50 x i8], ptr %10, i64 0, i64 0
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef %2) #5
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %37

14:                                               ; preds = %7
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds %struct.item_t, ptr %0, i64 %15
  %17 = getelementptr inbounds %struct.item_t, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = icmp sge i32 %18, %3
  br i1 %19, label %20, label %34

20:                                               ; preds = %14
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds %struct.item_t, ptr %0, i64 %21
  %23 = getelementptr inbounds %struct.item_t, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = sub nsw i32 %24, %3
  store i32 %25, ptr %23, align 4
  %26 = sext i32 %.0 to i64
  %27 = getelementptr inbounds %struct.item_t, ptr %0, i64 %26
  %28 = getelementptr inbounds %struct.item_t, ptr %27, i32 0, i32 2
  %29 = load float, ptr %28, align 4
  %30 = sitofp i32 %3 to float
  %31 = fmul float %29, %30
  %32 = fpext float %31 to double
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %3, ptr noundef %2, double noundef %32)
  br label %36

34:                                               ; preds = %14
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %2)
  br label %36

36:                                               ; preds = %34, %20
  br label %42

37:                                               ; preds = %7
  br label %38

38:                                               ; preds = %37
  %39 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !8

40:                                               ; preds = %5
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %42

42:                                               ; preds = %40, %36
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @main() #0 {
  %1 = alloca [100 x %struct.item_t], align 16
  %2 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @add_item(ptr noundef %2, i32 noundef 0, ptr noundef @.str.7, i32 noundef 100, float noundef 5.000000e-01)
  %3 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @add_item(ptr noundef %3, i32 noundef 0, ptr noundef @.str.8, i32 noundef 50, float noundef 7.500000e-01)
  %4 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @add_item(ptr noundef %4, i32 noundef 0, ptr noundef @.str.9, i32 noundef 75, float noundef 1.000000e+00)
  %5 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @display_items(ptr noundef %5, i32 noundef 0)
  %6 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @purchase_item(ptr noundef %6, i32 noundef 0, ptr noundef @.str.7, i32 noundef 25)
  %7 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @purchase_item(ptr noundef %7, i32 noundef 0, ptr noundef @.str.8, i32 noundef 10)
  %8 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @purchase_item(ptr noundef %8, i32 noundef 0, ptr noundef @.str.9, i32 noundef 50)
  %9 = getelementptr inbounds [100 x %struct.item_t], ptr %1, i64 0, i64 0
  call void @display_items(ptr noundef %9, i32 noundef 0)
  ret void
}

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
