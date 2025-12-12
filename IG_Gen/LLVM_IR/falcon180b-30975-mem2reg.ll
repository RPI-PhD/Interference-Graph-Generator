; ModuleID = 'LLVM_IR/falcon180b-30975.ll'
source_filename = "DATASETv2/falcon180b-30975.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.data_t = type { i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Before sorting:\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"After sorting:\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.data_t, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %0, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %0, ptr align 4 %1, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %1, ptr align 4 %3, i64 8, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @partition(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds %struct.data_t, ptr %0, i64 %4
  %6 = getelementptr inbounds %struct.data_t, ptr %5, i32 0, i32 0
  %7 = load i32, ptr %6, align 4
  %8 = sub nsw i32 %1, 1
  br label %9

9:                                                ; preds = %25, %3
  %.01 = phi i32 [ %8, %3 ], [ %.1, %25 ]
  %.0 = phi i32 [ %1, %3 ], [ %26, %25 ]
  %10 = sub nsw i32 %2, 1
  %11 = icmp sle i32 %.0, %10
  br i1 %11, label %12, label %27

12:                                               ; preds = %9
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds %struct.data_t, ptr %0, i64 %13
  %15 = getelementptr inbounds %struct.data_t, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = icmp slt i32 %16, %7
  br i1 %17, label %18, label %24

18:                                               ; preds = %12
  %19 = add nsw i32 %.01, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.data_t, ptr %0, i64 %20
  %22 = sext i32 %.0 to i64
  %23 = getelementptr inbounds %struct.data_t, ptr %0, i64 %22
  call void @swap(ptr noundef %21, ptr noundef %23)
  br label %24

24:                                               ; preds = %18, %12
  %.1 = phi i32 [ %19, %18 ], [ %.01, %12 ]
  br label %25

25:                                               ; preds = %24
  %26 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !6

27:                                               ; preds = %9
  %28 = add nsw i32 %.01, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %struct.data_t, ptr %0, i64 %29
  %31 = sext i32 %2 to i64
  %32 = getelementptr inbounds %struct.data_t, ptr %0, i64 %31
  call void @swap(ptr noundef %30, ptr noundef %32)
  %33 = add nsw i32 %.01, 1
  ret i32 %33
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @quick_sort(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %6 = call i32 @partition(ptr noundef %0, i32 noundef %1, i32 noundef %2)
  %7 = sub nsw i32 %6, 1
  call void @quick_sort(ptr noundef %0, i32 noundef %1, i32 noundef %7)
  %8 = add nsw i32 %6, 1
  call void @quick_sort(ptr noundef %0, i32 noundef %8, i32 noundef %2)
  br label %9

9:                                                ; preds = %5, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @generate_array(ptr noundef %0, i32 noundef %1) #0 {
  %3 = call i64 @time(ptr noundef null) #4
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #4
  br label %5

5:                                                ; preds = %16, %2
  %.0 = phi i32 [ 0, %2 ], [ %17, %16 ]
  %6 = icmp slt i32 %.0, %1
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = call i32 @rand() #4
  %9 = srem i32 %8, 1000
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds %struct.data_t, ptr %0, i64 %10
  %12 = getelementptr inbounds %struct.data_t, ptr %11, i32 0, i32 0
  store i32 %9, ptr %12, align 4
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds %struct.data_t, ptr %0, i64 %13
  %15 = getelementptr inbounds %struct.data_t, ptr %14, i32 0, i32 1
  store i32 %.0, ptr %15, align 4
  br label %16

16:                                               ; preds = %7
  %17 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !8

18:                                               ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_array(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %11, %2
  %.0 = phi i32 [ 0, %2 ], [ %12, %11 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %13

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds %struct.data_t, ptr %0, i64 %6
  %8 = getelementptr inbounds %struct.data_t, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9)
  br label %11

11:                                               ; preds = %5
  %12 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !9

13:                                               ; preds = %3
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000000 x %struct.data_t], align 16
  %2 = getelementptr inbounds [1000000 x %struct.data_t], ptr %1, i64 0, i64 0
  call void @generate_array(ptr noundef %2, i32 noundef 1000000)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %4 = getelementptr inbounds [1000000 x %struct.data_t], ptr %1, i64 0, i64 0
  call void @print_array(ptr noundef %4, i32 noundef 1000000)
  %5 = getelementptr inbounds [1000000 x %struct.data_t], ptr %1, i64 0, i64 0
  %6 = sub nsw i32 1000000, 1
  call void @quick_sort(ptr noundef %5, i32 noundef 0, i32 noundef %6)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %8 = getelementptr inbounds [1000000 x %struct.data_t], ptr %1, i64 0, i64 0
  call void @print_array(ptr noundef %8, i32 noundef 1000000)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
