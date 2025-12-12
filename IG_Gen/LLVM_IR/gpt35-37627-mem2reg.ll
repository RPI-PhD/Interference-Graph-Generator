; ModuleID = 'LLVM_IR/gpt35-37627.ll'
source_filename = "DATASETv2/gpt35-37627.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.icmp = type { i8, i8, i16, %union.anon, %union.anon.0 }
%union.anon = type { %struct.in_addr }
%struct.in_addr = type { i32 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { %struct.ip }
%struct.ip = type { i8, i8, i16, i16, i16, i8, i8, i16, %struct.in_addr, %struct.in_addr }
%struct.ih_idseq = type { i16, i16 }
%struct.fd_set = type { [16 x i64] }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }

@.str = private unnamed_addr constant [16 x i8] c"sendto() failed\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Invalid IP address: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"socket() failed\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"Checking hop %d...\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"setsockopt() failed\00", align 1
@tv_end = dso_local global %struct.timeval zeroinitializer, align 8
@.str.5 = private unnamed_addr constant [32 x i8] c"    Reply from %s: time=%.2fms\0A\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"    Timeout\0A\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"Usage: %s <IP address>\0A\00", align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"Pinging %s...\0A\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"Ping succeeded\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"Ping failed\0A\00", align 1
@tv_start = dso_local global %struct.timeval zeroinitializer, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @send_packet(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca [64 x i8], align 16
  %6 = alloca %struct.timeval, align 8
  %7 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %8 = getelementptr inbounds %struct.icmp, ptr %7, i32 0, i32 0
  store i8 8, ptr %8, align 4
  %9 = getelementptr inbounds %struct.icmp, ptr %7, i32 0, i32 1
  store i8 0, ptr %9, align 1
  %10 = call i32 @getpid() #6
  %11 = and i32 %10, 65535
  %12 = trunc i32 %11 to i16
  %13 = getelementptr inbounds %struct.icmp, ptr %7, i32 0, i32 3
  %14 = getelementptr inbounds %struct.ih_idseq, ptr %13, i32 0, i32 0
  store i16 %12, ptr %14, align 4
  %15 = trunc i32 %3 to i16
  %16 = getelementptr inbounds %struct.icmp, ptr %7, i32 0, i32 3
  %17 = getelementptr inbounds %struct.ih_idseq, ptr %16, i32 0, i32 1
  store i16 %15, ptr %17, align 2
  %18 = call i32 @gettimeofday(ptr noundef %6, ptr noundef null) #6
  %19 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %20 = getelementptr inbounds i8, ptr %19, i64 28
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %20, ptr align 8 %6, i64 16, i1 false)
  %21 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %22 = sext i32 44 to i64
  %23 = call i64 @sendto(i32 noundef %0, ptr noundef %21, i64 noundef %22, i32 noundef 0, ptr noundef %1, i32 noundef 16)
  %24 = icmp slt i64 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %4
  call void @perror(ptr noundef @.str) #7
  br label %27

26:                                               ; preds = %4
  br label %27

27:                                               ; preds = %26, %25
  %.0 = phi i32 [ -1, %25 ], [ 0, %26 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @getpid() #1

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @sendto(i32 noundef, ptr noundef, i64 noundef, i32 noundef, ptr noundef, i32 noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recv_packet(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca [64 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca %struct.fd_set, align 8
  %8 = alloca %struct.timeval, align 8
  %9 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  store i32 16, ptr %6, align 4
  br label %10

10:                                               ; preds = %4
  br label %11

11:                                               ; preds = %18, %10
  %.01 = phi i32 [ 0, %10 ], [ %19, %18 ]
  %12 = zext i32 %.01 to i64
  %13 = icmp ult i64 %12, 16
  br i1 %13, label %14, label %20

14:                                               ; preds = %11
  %15 = getelementptr inbounds %struct.fd_set, ptr %7, i32 0, i32 0
  %16 = zext i32 %.01 to i64
  %17 = getelementptr inbounds [16 x i64], ptr %15, i64 0, i64 %16
  store i64 0, ptr %17, align 8
  br label %18

18:                                               ; preds = %14
  %19 = add i32 %.01, 1
  br label %11, !llvm.loop !6

20:                                               ; preds = %11
  br label %21

21:                                               ; preds = %20
  %22 = srem i32 %0, 64
  %23 = zext i32 %22 to i64
  %24 = shl i64 1, %23
  %25 = getelementptr inbounds %struct.fd_set, ptr %7, i32 0, i32 0
  %26 = sdiv i32 %0, 64
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [16 x i64], ptr %25, i64 0, i64 %27
  %29 = load i64, ptr %28, align 8
  %30 = or i64 %29, %24
  store i64 %30, ptr %28, align 8
  %31 = getelementptr inbounds %struct.timeval, ptr %8, i32 0, i32 0
  store i64 1, ptr %31, align 8
  %32 = getelementptr inbounds %struct.timeval, ptr %8, i32 0, i32 1
  store i64 0, ptr %32, align 8
  %33 = add nsw i32 %0, 1
  %34 = call i32 @select(i32 noundef %33, ptr noundef %7, ptr noundef null, ptr noundef null, ptr noundef %8)
  %35 = icmp sle i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %21
  br label %77

37:                                               ; preds = %21
  %38 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %39 = call i64 @recvfrom(i32 noundef %0, ptr noundef %38, i64 noundef 64, i32 noundef 0, ptr noundef %1, ptr noundef %6)
  %40 = trunc i64 %39 to i32
  %41 = icmp slt i32 %40, 0
  br i1 %41, label %42, label %43

42:                                               ; preds = %37
  br label %77

43:                                               ; preds = %37
  %44 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %45 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %46 = load i8, ptr %45, align 16
  %47 = and i8 %46, 15
  %48 = zext i8 %47 to i32
  %49 = shl i32 %48, 2
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, ptr %44, i64 %50
  %52 = getelementptr inbounds %struct.icmp, ptr %51, i32 0, i32 0
  %53 = load i8, ptr %52, align 4
  %54 = zext i8 %53 to i32
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %76

56:                                               ; preds = %43
  %57 = getelementptr inbounds %struct.icmp, ptr %51, i32 0, i32 3
  %58 = getelementptr inbounds %struct.ih_idseq, ptr %57, i32 0, i32 0
  %59 = load i16, ptr %58, align 4
  %60 = zext i16 %59 to i32
  %61 = call i32 @getpid() #6
  %62 = and i32 %61, 65535
  %63 = icmp eq i32 %60, %62
  br i1 %63, label %64, label %75

64:                                               ; preds = %56
  %65 = getelementptr inbounds %struct.icmp, ptr %51, i32 0, i32 3
  %66 = getelementptr inbounds %struct.ih_idseq, ptr %65, i32 0, i32 1
  %67 = load i16, ptr %66, align 2
  %68 = zext i16 %67 to i32
  %69 = load i32, ptr %2, align 4
  %70 = icmp eq i32 %68, %69
  br i1 %70, label %71, label %75

71:                                               ; preds = %64
  %72 = call i32 @gettimeofday(ptr noundef %3, ptr noundef null) #6
  %73 = load i32, ptr %2, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %2, align 4
  br label %77

75:                                               ; preds = %64, %56
  br label %76

76:                                               ; preds = %75, %43
  br label %77

77:                                               ; preds = %76, %71, %42, %36
  %.0 = phi i32 [ -1, %36 ], [ -1, %42 ], [ 0, %71 ], [ -1, %76 ]
  ret i32 %.0
}

declare i32 @select(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare i64 @recvfrom(i32 noundef, ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ping(ptr noundef %0) #0 {
  %2 = alloca %struct.sockaddr_in, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.timeval, align 8
  %6 = alloca %struct.timeval, align 8
  store i32 1, ptr %3, align 4
  store i32 0, ptr %4, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 16, i1 false)
  %7 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 2
  %8 = call i32 @inet_aton(ptr noundef %0, ptr noundef %7) #6
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %0)
  br label %97

12:                                               ; preds = %1
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 0
  store i16 2, ptr %13, align 4
  %14 = call i32 @socket(i32 noundef 2, i32 noundef 3, i32 noundef 1) #6
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  call void @perror(ptr noundef @.str.2) #7
  br label %97

17:                                               ; preds = %12
  store i32 1, ptr %3, align 4
  br label %18

18:                                               ; preds = %92, %17
  %.01 = phi i32 [ -1, %17 ], [ %.4, %92 ]
  %19 = load i32, ptr %3, align 4
  %20 = icmp sle i32 %19, 30
  br i1 %20, label %21, label %95

21:                                               ; preds = %18
  %22 = load i32, ptr %3, align 4
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %22)
  %24 = call i32 @setsockopt(i32 noundef %14, i32 noundef 0, i32 noundef 2, ptr noundef %3, i32 noundef 4) #6
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %21
  call void @perror(ptr noundef @.str.4) #7
  %27 = call i32 @close(i32 noundef %14)
  br label %97

28:                                               ; preds = %21
  br label %29

29:                                               ; preds = %82, %28
  %.02 = phi i32 [ 0, %28 ], [ %83, %82 ]
  %30 = icmp slt i32 %.02, 3
  br i1 %30, label %31, label %84

31:                                               ; preds = %29
  %32 = load i32, ptr %3, align 4
  %33 = load i32, ptr %4, align 4
  %34 = call i32 @send_packet(i32 noundef %14, ptr noundef %2, i32 noundef %32, i32 noundef %33)
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %31
  %37 = call i32 @close(i32 noundef %14)
  br label %97

38:                                               ; preds = %31
  %39 = call i32 @recv_packet(i32 noundef %14, ptr noundef %2, ptr noundef %4, ptr noundef @tv_end)
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %81

41:                                               ; preds = %38
  br label %42

42:                                               ; preds = %41
  %43 = load i64, ptr @tv_end, align 8
  %44 = getelementptr inbounds %struct.timeval, ptr %5, i32 0, i32 0
  %45 = load i64, ptr %44, align 8
  %46 = sub nsw i64 %43, %45
  %47 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 0
  store i64 %46, ptr %47, align 8
  %48 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @tv_end, i32 0, i32 1), align 8
  %49 = getelementptr inbounds %struct.timeval, ptr %5, i32 0, i32 1
  %50 = load i64, ptr %49, align 8
  %51 = sub nsw i64 %48, %50
  %52 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 1
  store i64 %51, ptr %52, align 8
  %53 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 1
  %54 = load i64, ptr %53, align 8
  %55 = icmp slt i64 %54, 0
  br i1 %55, label %56, label %63

56:                                               ; preds = %42
  %57 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 0
  %58 = load i64, ptr %57, align 8
  %59 = add nsw i64 %58, -1
  store i64 %59, ptr %57, align 8
  %60 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 1
  %61 = load i64, ptr %60, align 8
  %62 = add nsw i64 %61, 1000000
  store i64 %62, ptr %60, align 8
  br label %63

63:                                               ; preds = %56, %42
  br label %64

64:                                               ; preds = %63
  %65 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 0
  %66 = load i64, ptr %65, align 8
  %67 = mul nsw i64 %66, 1000
  %68 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 1
  %69 = load i64, ptr %68, align 8
  %70 = sdiv i64 %69, 1000
  %71 = add nsw i64 %67, %70
  %72 = sitofp i64 %71 to double
  %73 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 2
  %74 = getelementptr inbounds %struct.in_addr, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %74, align 4
  %76 = call ptr @inet_ntoa(i32 %75) #6
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %76, double noundef %72)
  %78 = icmp slt i32 %.01, 0
  br i1 %78, label %79, label %80

79:                                               ; preds = %64
  br label %80

80:                                               ; preds = %79, %64
  %.1 = phi i32 [ 0, %79 ], [ %.01, %64 ]
  br label %84

81:                                               ; preds = %38
  br label %82

82:                                               ; preds = %81
  %83 = add nsw i32 %.02, 1
  br label %29, !llvm.loop !8

84:                                               ; preds = %80, %29
  %.2 = phi i32 [ %.1, %80 ], [ %.01, %29 ]
  %85 = icmp eq i32 %.02, 3
  br i1 %85, label %86, label %91

86:                                               ; preds = %84
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %88 = icmp slt i32 %.2, 0
  br i1 %88, label %89, label %90

89:                                               ; preds = %86
  br label %90

90:                                               ; preds = %89, %86
  %.3 = phi i32 [ -1, %89 ], [ %.2, %86 ]
  br label %91

91:                                               ; preds = %90, %84
  %.4 = phi i32 [ %.3, %90 ], [ %.2, %84 ]
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 @tv_end, i64 16, i1 false)
  br label %92

92:                                               ; preds = %91
  %93 = load i32, ptr %3, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %3, align 4
  br label %18, !llvm.loop !9

95:                                               ; preds = %18
  %96 = call i32 @close(i32 noundef %14)
  br label %97

97:                                               ; preds = %95, %36, %26, %16, %10
  %.0 = phi i32 [ -1, %10 ], [ -1, %16 ], [ -1, %26 ], [ -1, %36 ], [ %.01, %95 ]
  ret i32 %.0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i32 @inet_aton(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #3

; Function Attrs: nounwind
declare ptr @inet_ntoa(i32) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp ne i32 %0, 2
  br i1 %3, label %4, label %8

4:                                                ; preds = %2
  %5 = getelementptr inbounds ptr, ptr %1, i64 0
  %6 = load ptr, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %6)
  br label %20

8:                                                ; preds = %2
  %9 = getelementptr inbounds ptr, ptr %1, i64 1
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %10)
  %12 = getelementptr inbounds ptr, ptr %1, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @ping(ptr noundef %13)
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %20

18:                                               ; preds = %8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %20

20:                                               ; preds = %18, %16, %4
  %.0 = phi i32 [ -1, %4 ], [ 0, %16 ], [ -1, %18 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }
attributes #7 = { cold }

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
