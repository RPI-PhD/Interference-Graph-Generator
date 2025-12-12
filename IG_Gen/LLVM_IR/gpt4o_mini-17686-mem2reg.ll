; ModuleID = 'LLVM_IR/gpt4o_mini-17686.ll'
source_filename = "DATASETv2/gpt4o_mini-17686.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Device = type { [50 x i8], [100 x i32], i32 }

@device_count = dso_local global i32 0, align 4
@devices = dso_local global [100 x %struct.Device] zeroinitializer, align 16
@.str = private unnamed_addr constant [27 x i8] c"Max device limit reached!\0A\00", align 1
@.str.1 = private unnamed_addr constant [40 x i8] c"Invalid device indices for connection!\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Network Topology:\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Device %s is connected to: \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"1. Add Device\0A\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"2. Connect Devices\0A\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"3. Print Network Topology\0A\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"4. Exit\0A\00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"Enter device name: \00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.14 = private unnamed_addr constant [48 x i8] c"Enter two device indices to connect (0 to %d): \00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"Exiting...\0A\00", align 1
@.str.17 = private unnamed_addr constant [35 x i8] c"Invalid choice! Please try again.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @addDevice(ptr noundef %0) #0 {
  %2 = load i32, ptr @device_count, align 4
  %3 = icmp slt i32 %2, 100
  br i1 %3, label %4, label %17

4:                                                ; preds = %1
  %5 = load i32, ptr @device_count, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.Device, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call ptr @strcpy(ptr noundef %9, ptr noundef %0) #4
  %11 = load i32, ptr @device_count, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Device, ptr %13, i32 0, i32 2
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr @device_count, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr @device_count, align 4
  br label %19

17:                                               ; preds = %1
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %19

19:                                               ; preds = %17, %4
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @connectDevices(i32 noundef %0, i32 noundef %1) #0 {
  %3 = load i32, ptr @device_count, align 4
  %4 = icmp slt i32 %0, %3
  br i1 %4, label %5, label %29

5:                                                ; preds = %2
  %6 = load i32, ptr @device_count, align 4
  %7 = icmp slt i32 %1, %6
  br i1 %7, label %8, label %29

8:                                                ; preds = %5
  %9 = sext i32 %0 to i64
  %10 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.Device, ptr %10, i32 0, i32 1
  %12 = sext i32 %0 to i64
  %13 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Device, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 4
  %17 = sext i32 %15 to i64
  %18 = getelementptr inbounds [100 x i32], ptr %11, i64 0, i64 %17
  store i32 %1, ptr %18, align 4
  %19 = sext i32 %1 to i64
  %20 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Device, ptr %20, i32 0, i32 1
  %22 = sext i32 %1 to i64
  %23 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %22
  %24 = getelementptr inbounds %struct.Device, ptr %23, i32 0, i32 2
  %25 = load i32, ptr %24, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %24, align 4
  %27 = sext i32 %25 to i64
  %28 = getelementptr inbounds [100 x i32], ptr %21, i64 0, i64 %27
  store i32 %0, ptr %28, align 4
  br label %31

29:                                               ; preds = %5, %2
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %31

31:                                               ; preds = %29, %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printNetworkTopology() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %2

2:                                                ; preds = %33, %0
  %.0 = phi i32 [ 0, %0 ], [ %34, %33 ]
  %3 = load i32, ptr @device_count, align 4
  %4 = icmp slt i32 %.0, %3
  br i1 %4, label %5, label %35

5:                                                ; preds = %2
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.Device, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [50 x i8], ptr %8, i64 0, i64 0
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %9)
  br label %11

11:                                               ; preds = %29, %5
  %.01 = phi i32 [ 0, %5 ], [ %30, %29 ]
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Device, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = icmp slt i32 %.01, %15
  br i1 %16, label %17, label %31

17:                                               ; preds = %11
  %18 = sext i32 %.0 to i64
  %19 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Device, ptr %19, i32 0, i32 1
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds [100 x i32], ptr %20, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.Device, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds [50 x i8], ptr %26, i64 0, i64 0
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %27)
  br label %29

29:                                               ; preds = %17
  %30 = add nsw i32 %.01, 1
  br label %11, !llvm.loop !6

31:                                               ; preds = %11
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %33

33:                                               ; preds = %31
  %34 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !8

35:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [50 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  br label %5

5:                                                ; preds = %30, %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %1)
  %12 = load i32, ptr %1, align 4
  switch i32 %12, label %28 [
    i32 1, label %13
    i32 2, label %18
    i32 3, label %25
    i32 4, label %26
  ]

13:                                               ; preds = %5
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %15 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %15)
  %17 = getelementptr inbounds [50 x i8], ptr %2, i64 0, i64 0
  call void @addDevice(ptr noundef %17)
  br label %30

18:                                               ; preds = %5
  %19 = load i32, ptr @device_count, align 4
  %20 = sub nsw i32 %19, 1
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %20)
  %22 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %3, ptr noundef %4)
  %23 = load i32, ptr %3, align 4
  %24 = load i32, ptr %4, align 4
  call void @connectDevices(i32 noundef %23, i32 noundef %24)
  br label %30

25:                                               ; preds = %5
  call void @printNetworkTopology()
  br label %30

26:                                               ; preds = %5
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @exit(i32 noundef 0) #5
  unreachable

28:                                               ; preds = %5
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %30

30:                                               ; preds = %28, %25, %18, %13
  br label %5
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
