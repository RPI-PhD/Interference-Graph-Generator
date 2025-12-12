; ModuleID = 'DATASETv2/gpt35-31414.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @QoS_monitor(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.sockaddr_in, align 4
  %9 = alloca [100 x i8], align 16
  %10 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  store ptr %11, ptr %10, align 8
  %12 = call i32 @socket(i32 noundef 2, i32 noundef 2, i32 noundef 17) #8
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %16

15:                                               ; preds = %1
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

16:                                               ; preds = %1
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 16, i1 false)
  %17 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 0
  store i16 2, ptr %17, align 4
  %18 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 2
  %19 = getelementptr inbounds %struct.in_addr, ptr %18, i32 0, i32 0
  store i32 0, ptr %19, align 4
  %20 = call zeroext i16 @htons(i16 noundef zeroext 5000) #11
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 1
  store i16 %20, ptr %21, align 2
  %22 = load i32, ptr %3, align 4
  %23 = call i32 @bind(i32 noundef %22, ptr noundef %8, i32 noundef 16) #8
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %25, label %26

25:                                               ; preds = %16
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

26:                                               ; preds = %16
  br label %27

27:                                               ; preds = %26, %49, %62
  %28 = load i32, ptr %3, align 4
  %29 = getelementptr inbounds [100 x i8], ptr %9, i64 0, i64 0
  %30 = call i64 @recv(i32 noundef %28, ptr noundef %29, i64 noundef 100, i32 noundef 0)
  %31 = icmp ne i64 %30, -1
  br i1 %31, label %32, label %61

32:                                               ; preds = %27
  %33 = load i32, ptr @received_count, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr @received_count, align 4
  %35 = call i32 @rand() #8
  %36 = srem i32 %35, 50
  store i32 %36, ptr %4, align 4
  %37 = load i32, ptr %4, align 4
  %38 = mul nsw i32 %37, 1000
  %39 = call i32 @usleep(i32 noundef %38)
  %40 = load i32, ptr %4, align 4
  %41 = load ptr, ptr %10, align 8
  %42 = getelementptr inbounds %struct.QoS_metrics, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %43, %40
  store i32 %44, ptr %42, align 4
  %45 = call i32 @rand() #8
  %46 = srem i32 %45, 10
  store i32 %46, ptr %5, align 4
  %47 = load i32, ptr %5, align 4
  %48 = icmp slt i32 %47, 3
  br i1 %48, label %49, label %50

49:                                               ; preds = %32
  br label %27

50:                                               ; preds = %32
  %51 = getelementptr inbounds [100 x i8], ptr %9, i64 0, i64 0
  %52 = call i64 @strlen(ptr noundef %51) #12
  %53 = trunc i64 %52 to i32
  store i32 %53, ptr %6, align 4
  %54 = load i32, ptr %6, align 4
  %55 = load ptr, ptr %10, align 8
  %56 = getelementptr inbounds %struct.QoS_metrics, ptr %55, i32 0, i32 2
  %57 = load i32, ptr %56, align 4
  %58 = add nsw i32 %57, %54
  store i32 %58, ptr %56, align 4
  %59 = load i32, ptr @packet_count, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr @packet_count, align 4
  br label %62

61:                                               ; preds = %27
  call void @perror(ptr noundef @.str.2) #9
  br label %62

62:                                               ; preds = %61, %50
  br label %27
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.QoS_metrics, align 4
  %3 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %4 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 0
  store i32 0, ptr %4, align 4
  %5 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 1
  store i32 0, ptr %5, align 4
  %6 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 2
  store i32 0, ptr %6, align 4
  %7 = call i32 @pthread_create(ptr noundef %3, ptr noundef null, ptr noundef @QoS_monitor, ptr noundef %2) #8
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %0
  call void @perror(ptr noundef @.str.3) #9
  call void @exit(i32 noundef 1) #10
  unreachable

10:                                               ; preds = %0
  br label %11

11:                                               ; preds = %10, %11
  %12 = load i32, ptr @packet_count, align 4
  %13 = load i32, ptr @received_count, align 4
  %14 = sub nsw i32 %12, %13
  %15 = sitofp i32 %14 to float
  %16 = load i32, ptr @packet_count, align 4
  %17 = sitofp i32 %16 to float
  %18 = fdiv float %15, %17
  %19 = fmul float %18, 1.000000e+02
  %20 = fptosi float %19 to i32
  %21 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 1
  store i32 %20, ptr %21, align 4
  %22 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 0
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr @received_count, align 4
  %25 = sdiv i32 %23, %24
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %25)
  %27 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 1
  %28 = load i32, ptr %27, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %28)
  %30 = getelementptr inbounds %struct.QoS_metrics, ptr %2, i32 0, i32 2
  %31 = load i32, ptr %30, align 4
  %32 = load i32, ptr @received_count, align 4
  %33 = sdiv i32 %31, %32
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %33)
  %35 = call i32 @sleep(i32 noundef 1)
  br label %11
}

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #6

declare i32 @sleep(i32 noundef) #6

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
