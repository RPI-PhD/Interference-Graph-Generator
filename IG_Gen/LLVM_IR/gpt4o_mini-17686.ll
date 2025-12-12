; ModuleID = 'DATASETv2/gpt4o_mini-17686.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @addDevice(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i32, ptr @device_count, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %19

5:                                                ; preds = %1
  %6 = load i32, ptr @device_count, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %7
  %9 = getelementptr inbounds %struct.Device, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = load ptr, ptr %2, align 8
  %12 = call ptr @strcpy(ptr noundef %10, ptr noundef %11) #4
  %13 = load i32, ptr @device_count, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.Device, ptr %15, i32 0, i32 2
  store i32 0, ptr %16, align 4
  %17 = load i32, ptr @device_count, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr @device_count, align 4
  br label %21

19:                                               ; preds = %1
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %21

21:                                               ; preds = %19, %5
  ret void
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @connectDevices(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr @device_count, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %39

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr @device_count, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %39

12:                                               ; preds = %8
  %13 = load i32, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.Device, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Device, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %21, align 4
  %24 = sext i32 %22 to i64
  %25 = getelementptr inbounds [100 x i32], ptr %17, i64 0, i64 %24
  store i32 %13, ptr %25, align 4
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.Device, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %32
  %34 = getelementptr inbounds %struct.Device, ptr %33, i32 0, i32 2
  %35 = load i32, ptr %34, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %34, align 4
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds [100 x i32], ptr %30, i64 0, i64 %37
  store i32 %26, ptr %38, align 4
  br label %41

39:                                               ; preds = %8, %2
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %41

41:                                               ; preds = %39, %12
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printNetworkTopology() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %42, %0
  %5 = load i32, ptr %1, align 4
  %6 = load i32, ptr @device_count, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %45

8:                                                ; preds = %4
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Device, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [50 x i8], ptr %12, i64 0, i64 0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %13)
  store i32 0, ptr %2, align 4
  br label %15

15:                                               ; preds = %37, %8
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Device, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %20, align 4
  %22 = icmp slt i32 %16, %21
  br i1 %22, label %23, label %40

23:                                               ; preds = %15
  %24 = load i32, ptr %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.Device, ptr %26, i32 0, i32 1
  %28 = load i32, ptr %2, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [100 x i32], ptr %27, i64 0, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [100 x %struct.Device], ptr @devices, i64 0, i64 %32
  %34 = getelementptr inbounds %struct.Device, ptr %33, i32 0, i32 0
  %35 = getelementptr inbounds [50 x i8], ptr %34, i64 0, i64 0
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %35)
  br label %37

37:                                               ; preds = %23
  %38 = load i32, ptr %2, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %2, align 4
  br label %15, !llvm.loop !6

40:                                               ; preds = %15
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %42

42:                                               ; preds = %40
  %43 = load i32, ptr %1, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %1, align 4
  br label %4, !llvm.loop !8

45:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [50 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %6

6:                                                ; preds = %0, %31
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %2)
  %13 = load i32, ptr %2, align 4
  switch i32 %13, label %29 [
    i32 1, label %14
    i32 2, label %19
    i32 3, label %26
    i32 4, label %27
  ]

14:                                               ; preds = %6
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %16 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %16)
  %18 = getelementptr inbounds [50 x i8], ptr %3, i64 0, i64 0
  call void @addDevice(ptr noundef %18)
  br label %31

19:                                               ; preds = %6
  %20 = load i32, ptr @device_count, align 4
  %21 = sub nsw i32 %20, 1
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %21)
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.15, ptr noundef %4, ptr noundef %5)
  %24 = load i32, ptr %4, align 4
  %25 = load i32, ptr %5, align 4
  call void @connectDevices(i32 noundef %24, i32 noundef %25)
  br label %31

26:                                               ; preds = %6
  call void @printNetworkTopology()
  br label %31

27:                                               ; preds = %6
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  call void @exit(i32 noundef 0) #5
  unreachable

29:                                               ; preds = %6
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %31

31:                                               ; preds = %29, %26, %19, %14
  br label %6
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
