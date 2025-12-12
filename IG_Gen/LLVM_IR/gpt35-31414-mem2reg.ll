; ModuleID = 'LLVM_IR/gpt35-31414.ll'
source_filename = "DATASETv2/gpt35-31414.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.QoS_metrics = type { i32, i32, i32 }

@packet_count = dso_local global i32 0, align 4
@received_count = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [16 x i8] c"socket() failed\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"bind() failed\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"recv() failed\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"pthread_create() failed\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"Delay: %d ms\0A\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Packet loss: %.2f%%\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"Throughput: %d bytes/s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @QoS_monitor(ptr noundef %0) #0 {
  %2 = alloca %struct.sockaddr_in, align 4
  %3 = alloca [100 x i8], align 16
  %4 = call i32 @socket(i32 noundef 2, i32 noundef 2, i32 noundef 17) #8
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

7:                                                ; preds = %1
  call void @llvm.memset.p0.i64(ptr align 4 %2, i8 0, i64 16, i1 false)
  %8 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 0
  store i16 2, ptr %8, align 4
  %9 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 2
  %10 = getelementptr inbounds %struct.in_addr, ptr %9, i32 0, i32 0
  store i32 0, ptr %10, align 4
  %11 = call zeroext i16 @htons(i16 noundef zeroext 5000) #11
  %12 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 1
  store i16 %11, ptr %12, align 2
  %13 = call i32 @bind(i32 noundef %4, ptr noundef %2, i32 noundef 16) #8
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %16

15:                                               ; preds = %7
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

16:                                               ; preds = %7
  br label %17

17:                                               ; preds = %45, %34, %16
  %18 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %19 = call i64 @recv(i32 noundef %4, ptr noundef %18, i64 noundef 100, i32 noundef 0)
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %44

21:                                               ; preds = %17
  %22 = load i32, ptr @received_count, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr @received_count, align 4
  %24 = call i32 @rand() #8
  %25 = srem i32 %24, 50
  %26 = mul nsw i32 %25, 1000
  %27 = call i32 @usleep(i32 noundef %26)
  %28 = getelementptr inbounds %struct.QoS_metrics, ptr %0, i32 0, i32 0
  %29 = load i32, ptr %28, align 4
  %30 = add nsw i32 %29, %25
  store i32 %30, ptr %28, align 4
  %31 = call i32 @rand() #8
  %32 = srem i32 %31, 10
  %33 = icmp slt i32 %32, 3
  br i1 %33, label %34, label %35

34:                                               ; preds = %21
  br label %17

35:                                               ; preds = %21
  %36 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %37 = call i64 @strlen(ptr noundef %36) #12
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds %struct.QoS_metrics, ptr %0, i32 0, i32 2
  %40 = load i32, ptr %39, align 4
  %41 = add nsw i32 %40, %38
  store i32 %41, ptr %39, align 4
  %42 = load i32, ptr @packet_count, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr @packet_count, align 4
  br label %45

44:                                               ; preds = %17
  call void @perror(ptr noundef @.str.2) #9
  br label %45

45:                                               ; preds = %44, %35
  br label %17
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #6

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @usleep(i32 noundef) #6

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.QoS_metrics, align 4
  %2 = alloca i64, align 8
  %3 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 0
  store i32 0, ptr %3, align 4
  %4 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 1
  store i32 0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 2
  store i32 0, ptr %5, align 4
  %6 = call i32 @pthread_create(ptr noundef %2, ptr noundef null, ptr noundef @QoS_monitor, ptr noundef %1) #8
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %0
  call void @perror(ptr noundef @.str.3) #9
  call void @exit(i32 noundef 1) #10
  unreachable

9:                                                ; preds = %0
  br label %10

10:                                               ; preds = %10, %9
  %11 = load i32, ptr @packet_count, align 4
  %12 = load i32, ptr @received_count, align 4
  %13 = sub nsw i32 %11, %12
  %14 = sitofp i32 %13 to float
  %15 = load i32, ptr @packet_count, align 4
  %16 = sitofp i32 %15 to float
  %17 = fdiv float %14, %16
  %18 = fmul float %17, 1.000000e+02
  %19 = fptosi float %18 to i32
  %20 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 1
  store i32 %19, ptr %20, align 4
  %21 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 0
  %22 = load i32, ptr %21, align 4
  %23 = load i32, ptr @received_count, align 4
  %24 = sdiv i32 %22, %23
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %24)
  %26 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %27)
  %29 = getelementptr inbounds %struct.QoS_metrics, ptr %1, i32 0, i32 2
  %30 = load i32, ptr %29, align 4
  %31 = load i32, ptr @received_count, align 4
  %32 = sdiv i32 %30, %31
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %32)
  %34 = call i32 @sleep(i32 noundef 1)
  br label %10
}

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #6

declare i32 @sleep(i32 noundef) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind willreturn memory(none) }
attributes #12 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
