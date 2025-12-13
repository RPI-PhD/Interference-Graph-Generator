; ModuleID = 'LLVM_IR/falcon180b-23962.ll'
source_filename = "DATASETv2/falcon180b-23962.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"Current between nodes 0 and 1 is %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_matrix(i32 noundef %0) #0 {
  %2 = sext i32 %0 to i64
  %3 = mul i64 %2, 8
  %4 = call noalias ptr @malloc(i64 noundef %3) #4
  br label %5

5:                                                ; preds = %24, %1
  %.01 = phi i32 [ 0, %1 ], [ %25, %24 ]
  %6 = icmp slt i32 %.01, %0
  br i1 %6, label %7, label %26

7:                                                ; preds = %5
  %8 = sext i32 %0 to i64
  %9 = mul i64 %8, 4
  %10 = call noalias ptr @malloc(i64 noundef %9) #4
  %11 = sext i32 %.01 to i64
  %12 = getelementptr inbounds ptr, ptr %4, i64 %11
  store ptr %10, ptr %12, align 8
  br label %13

13:                                               ; preds = %21, %7
  %.0 = phi i32 [ 0, %7 ], [ %22, %21 ]
  %14 = icmp slt i32 %.0, %0
  br i1 %14, label %15, label %23

15:                                               ; preds = %13
  %16 = sext i32 %.01 to i64
  %17 = getelementptr inbounds ptr, ptr %4, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds i32, ptr %18, i64 %19
  store i32 0, ptr %20, align 4
  br label %21

21:                                               ; preds = %15
  %22 = add nsw i32 %.0, 1
  br label %13, !llvm.loop !6

23:                                               ; preds = %13
  br label %24

24:                                               ; preds = %23
  %25 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !8

26:                                               ; preds = %5
  ret ptr %4
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_resistor(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = sext i32 %1 to i64
  %6 = getelementptr inbounds ptr, ptr %0, i64 %5
  %7 = load ptr, ptr %6, align 8
  %8 = sext i32 %2 to i64
  %9 = getelementptr inbounds i32, ptr %7, i64 %8
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, %3
  store i32 %11, ptr %9, align 4
  %12 = sext i32 %2 to i64
  %13 = getelementptr inbounds ptr, ptr %0, i64 %12
  %14 = load ptr, ptr %13, align 8
  %15 = sext i32 %1 to i64
  %16 = getelementptr inbounds i32, ptr %14, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = add nsw i32 %17, %3
  store i32 %18, ptr %16, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_voltage_source(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds ptr, ptr %0, i64 %4
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds i32, ptr %6, i64 0
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %8, %2
  store i32 %9, ptr %7, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @calculate_current(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds ptr, ptr %0, i64 %4
  %6 = load ptr, ptr %5, align 8
  %7 = sext i32 %2 to i64
  %8 = getelementptr inbounds i32, ptr %6, i64 %7
  %9 = load i32, ptr %8, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call ptr @create_matrix(i32 noundef 3)
  call void @add_resistor(ptr noundef %1, i32 noundef 0, i32 noundef 1, i32 noundef 10)
  call void @add_resistor(ptr noundef %1, i32 noundef 1, i32 noundef 2, i32 noundef 20)
  call void @add_voltage_source(ptr noundef %1, i32 noundef 0, i32 noundef 5)
  %2 = call i32 @calculate_current(ptr noundef %1, i32 noundef 0, i32 noundef 1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %2)
  %4 = getelementptr inbounds ptr, ptr %1, i64 0
  %5 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %5) #5
  call void @free(ptr noundef %1) #5
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
