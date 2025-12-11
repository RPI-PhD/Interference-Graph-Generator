; ModuleID = 'DATASETv2/gpt4o_mini-38058.ll'
source_filename = "DATASETv2/gpt4o_mini-38058.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Topology = type { [10 x %struct.Device], i32 }
%struct.Device = type { [20 x i8], [10 x i32], i32 }

@.str = private unnamed_addr constant [48 x i8] c"Cannot add more devices, the limit is reached!\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"One of the devices does not exist!\0A\00", align 1
@.str.2 = private unnamed_addr constant [43 x i8] c"\0ASurprise! Here\E2\80\99s the network topology:\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Device: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Connected to: \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"Router\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"Switch\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"PC1\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"PC2\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"Printer\00", align 1
@.str.12 = private unnamed_addr constant [58 x i8] c"\F0\9F\8E\89\F0\9F\8E\88 Surprise! The network is fully mapped! \F0\9F\8E\88\F0\9F\8E\89\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @add_device(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = icmp sge i32 %4, 10
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %26

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %10 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10 x %struct.Device], ptr %9, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Device, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [20 x i8], ptr %14, i64 0, i64 0
  %16 = call ptr @strncpy(ptr noundef %15, ptr noundef %1, i64 noundef 20) #4
  %17 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %18 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [10 x %struct.Device], ptr %17, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.Device, ptr %21, i32 0, i32 2
  store i32 0, ptr %22, align 4
  %23 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %23, align 4
  br label %26

26:                                               ; preds = %8, %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @connect_devices(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  br label %4

4:                                                ; preds = %27, %3
  %.02 = phi i32 [ -1, %3 ], [ %.13, %27 ]
  %.01 = phi i32 [ -1, %3 ], [ %.1, %27 ]
  %.0 = phi i32 [ 0, %3 ], [ %28, %27 ]
  %5 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %.0, %6
  br i1 %7, label %8, label %29

8:                                                ; preds = %4
  %9 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %10 = sext i32 %.0 to i64
  %11 = getelementptr inbounds [10 x %struct.Device], ptr %9, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Device, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [20 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 @strcmp(ptr noundef %13, ptr noundef %1) #5
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  br label %17

17:                                               ; preds = %16, %8
  %.13 = phi i32 [ %.0, %16 ], [ %.02, %8 ]
  %18 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %19 = sext i32 %.0 to i64
  %20 = getelementptr inbounds [10 x %struct.Device], ptr %18, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Device, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds [20 x i8], ptr %21, i64 0, i64 0
  %23 = call i32 @strcmp(ptr noundef %22, ptr noundef %2) #5
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %17
  br label %26

26:                                               ; preds = %25, %17
  %.1 = phi i32 [ %.0, %25 ], [ %.01, %17 ]
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !6

29:                                               ; preds = %4
  %30 = icmp eq i32 %.02, -1
  br i1 %30, label %33, label %31

31:                                               ; preds = %29
  %32 = icmp eq i32 %.01, -1
  br i1 %32, label %33, label %35

33:                                               ; preds = %31, %29
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %60

35:                                               ; preds = %31
  %36 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %37 = sext i32 %.02 to i64
  %38 = getelementptr inbounds [10 x %struct.Device], ptr %36, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.Device, ptr %38, i32 0, i32 1
  %40 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %41 = sext i32 %.02 to i64
  %42 = getelementptr inbounds [10 x %struct.Device], ptr %40, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.Device, ptr %42, i32 0, i32 2
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %43, align 4
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds [10 x i32], ptr %39, i64 0, i64 %46
  store i32 %.01, ptr %47, align 4
  %48 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %49 = sext i32 %.01 to i64
  %50 = getelementptr inbounds [10 x %struct.Device], ptr %48, i64 0, i64 %49
  %51 = getelementptr inbounds %struct.Device, ptr %50, i32 0, i32 1
  %52 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %53 = sext i32 %.01 to i64
  %54 = getelementptr inbounds [10 x %struct.Device], ptr %52, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.Device, ptr %54, i32 0, i32 2
  %56 = load i32, ptr %55, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %55, align 4
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds [10 x i32], ptr %51, i64 0, i64 %58
  store i32 %.02, ptr %59, align 4
  br label %60

60:                                               ; preds = %35, %33
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_topology(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %3

3:                                                ; preds = %40, %1
  %.01 = phi i32 [ 0, %1 ], [ %41, %40 ]
  %4 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = icmp slt i32 %.01, %5
  br i1 %6, label %7, label %42

7:                                                ; preds = %3
  %8 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [10 x %struct.Device], ptr %8, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Device, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [20 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %15

15:                                               ; preds = %36, %7
  %.0 = phi i32 [ 0, %7 ], [ %37, %36 ]
  %16 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [10 x %struct.Device], ptr %16, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Device, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 4
  %21 = icmp slt i32 %.0, %20
  br i1 %21, label %22, label %38

22:                                               ; preds = %15
  %23 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %24 = getelementptr inbounds %struct.Topology, ptr %0, i32 0, i32 0
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [10 x %struct.Device], ptr %24, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.Device, ptr %26, i32 0, i32 1
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds [10 x i32], ptr %27, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x %struct.Device], ptr %23, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.Device, ptr %32, i32 0, i32 0
  %34 = getelementptr inbounds [20 x i8], ptr %33, i64 0, i64 0
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %34)
  br label %36

36:                                               ; preds = %22
  %37 = add nsw i32 %.0, 1
  br label %15, !llvm.loop !8

38:                                               ; preds = %15
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %40

40:                                               ; preds = %38
  %41 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !9

42:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Topology, align 4
  %2 = getelementptr inbounds %struct.Topology, ptr %1, i32 0, i32 1
  store i32 0, ptr %2, align 4
  call void @add_device(ptr noundef %1, ptr noundef @.str.7)
  call void @add_device(ptr noundef %1, ptr noundef @.str.8)
  call void @add_device(ptr noundef %1, ptr noundef @.str.9)
  call void @add_device(ptr noundef %1, ptr noundef @.str.10)
  call void @add_device(ptr noundef %1, ptr noundef @.str.11)
  call void @connect_devices(ptr noundef %1, ptr noundef @.str.7, ptr noundef @.str.8)
  call void @connect_devices(ptr noundef %1, ptr noundef @.str.8, ptr noundef @.str.9)
  call void @connect_devices(ptr noundef %1, ptr noundef @.str.8, ptr noundef @.str.10)
  call void @connect_devices(ptr noundef %1, ptr noundef @.str.9, ptr noundef @.str.11)
  call void @print_topology(ptr noundef %1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  ret i32 0
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
!9 = distinct !{!9, !7}
