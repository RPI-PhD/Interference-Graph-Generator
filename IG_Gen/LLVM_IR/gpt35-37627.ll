; ModuleID = 'DATASETv2/gpt35-37627.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @send_packet(i32 noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [64 x i8], align 16
  %11 = alloca ptr, align 8
  %12 = alloca %struct.timeval, align 8
  %13 = alloca i32, align 4
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %14 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  store ptr %14, ptr %11, align 8
  %15 = load ptr, ptr %11, align 8
  %16 = getelementptr inbounds %struct.icmp, ptr %15, i32 0, i32 0
  store i8 8, ptr %16, align 4
  %17 = load ptr, ptr %11, align 8
  %18 = getelementptr inbounds %struct.icmp, ptr %17, i32 0, i32 1
  store i8 0, ptr %18, align 1
  %19 = call i32 @getpid() #6
  %20 = and i32 %19, 65535
  %21 = trunc i32 %20 to i16
  %22 = load ptr, ptr %11, align 8
  %23 = getelementptr inbounds %struct.icmp, ptr %22, i32 0, i32 3
  %24 = getelementptr inbounds %struct.ih_idseq, ptr %23, i32 0, i32 0
  store i16 %21, ptr %24, align 4
  %25 = load i32, ptr %9, align 4
  %26 = trunc i32 %25 to i16
  %27 = load ptr, ptr %11, align 8
  %28 = getelementptr inbounds %struct.icmp, ptr %27, i32 0, i32 3
  %29 = getelementptr inbounds %struct.ih_idseq, ptr %28, i32 0, i32 1
  store i16 %26, ptr %29, align 2
  %30 = call i32 @gettimeofday(ptr noundef %12, ptr noundef null) #6
  %31 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  %32 = getelementptr inbounds i8, ptr %31, i64 28
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %32, ptr align 8 %12, i64 16, i1 false)
  store i32 44, ptr %13, align 4
  %33 = load i32, ptr %6, align 4
  %34 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  %35 = load i32, ptr %13, align 4
  %36 = sext i32 %35 to i64
  %37 = load ptr, ptr %7, align 8
  %38 = call i64 @sendto(i32 noundef %33, ptr noundef %34, i64 noundef %36, i32 noundef 0, ptr noundef %37, i32 noundef 16)
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %4
  call void @perror(ptr noundef @.str) #7
  store i32 -1, ptr %5, align 4
  br label %42

41:                                               ; preds = %4
  store i32 0, ptr %5, align 4
  br label %42

42:                                               ; preds = %41, %40
  %43 = load i32, ptr %5, align 4
  ret i32 %43
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @recv_packet(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [64 x i8], align 16
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.fd_set, align 8
  %16 = alloca %struct.timeval, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %19 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  store ptr %19, ptr %11, align 8
  store i32 16, ptr %14, align 4
  br label %20

20:                                               ; preds = %4
  store ptr %15, ptr %18, align 8
  store i32 0, ptr %17, align 4
  br label %21

21:                                               ; preds = %31, %20
  %22 = load i32, ptr %17, align 4
  %23 = zext i32 %22 to i64
  %24 = icmp ult i64 %23, 16
  br i1 %24, label %25, label %34

25:                                               ; preds = %21
  %26 = load ptr, ptr %18, align 8
  %27 = getelementptr inbounds %struct.fd_set, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %17, align 4
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds [16 x i64], ptr %27, i64 0, i64 %29
  store i64 0, ptr %30, align 8
  br label %31

31:                                               ; preds = %25
  %32 = load i32, ptr %17, align 4
  %33 = add i32 %32, 1
  store i32 %33, ptr %17, align 4
  br label %21, !llvm.loop !6

34:                                               ; preds = %21
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %6, align 4
  %37 = srem i32 %36, 64
  %38 = zext i32 %37 to i64
  %39 = shl i64 1, %38
  %40 = getelementptr inbounds %struct.fd_set, ptr %15, i32 0, i32 0
  %41 = load i32, ptr %6, align 4
  %42 = sdiv i32 %41, 64
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [16 x i64], ptr %40, i64 0, i64 %43
  %45 = load i64, ptr %44, align 8
  %46 = or i64 %45, %39
  store i64 %46, ptr %44, align 8
  %47 = getelementptr inbounds %struct.timeval, ptr %16, i32 0, i32 0
  store i64 1, ptr %47, align 8
  %48 = getelementptr inbounds %struct.timeval, ptr %16, i32 0, i32 1
  store i64 0, ptr %48, align 8
  %49 = load i32, ptr %6, align 4
  %50 = add nsw i32 %49, 1
  %51 = call i32 @select(i32 noundef %50, ptr noundef %15, ptr noundef null, ptr noundef null, ptr noundef %16)
  %52 = icmp sle i32 %51, 0
  br i1 %52, label %53, label %54

53:                                               ; preds = %35
  store i32 -1, ptr %5, align 4
  br label %102

54:                                               ; preds = %35
  %55 = load i32, ptr %6, align 4
  %56 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  %57 = load ptr, ptr %7, align 8
  %58 = call i64 @recvfrom(i32 noundef %55, ptr noundef %56, i64 noundef 64, i32 noundef 0, ptr noundef %57, ptr noundef %14)
  %59 = trunc i64 %58 to i32
  store i32 %59, ptr %13, align 4
  %60 = icmp slt i32 %59, 0
  br i1 %60, label %61, label %62

61:                                               ; preds = %54
  store i32 -1, ptr %5, align 4
  br label %102

62:                                               ; preds = %54
  %63 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  %64 = getelementptr inbounds [64 x i8], ptr %10, i64 0, i64 0
  %65 = load i8, ptr %64, align 16
  %66 = and i8 %65, 15
  %67 = zext i8 %66 to i32
  %68 = shl i32 %67, 2
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, ptr %63, i64 %69
  store ptr %70, ptr %12, align 8
  %71 = load ptr, ptr %12, align 8
  %72 = getelementptr inbounds %struct.icmp, ptr %71, i32 0, i32 0
  %73 = load i8, ptr %72, align 4
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %101

76:                                               ; preds = %62
  %77 = load ptr, ptr %12, align 8
  %78 = getelementptr inbounds %struct.icmp, ptr %77, i32 0, i32 3
  %79 = getelementptr inbounds %struct.ih_idseq, ptr %78, i32 0, i32 0
  %80 = load i16, ptr %79, align 4
  %81 = zext i16 %80 to i32
  %82 = call i32 @getpid() #6
  %83 = and i32 %82, 65535
  %84 = icmp eq i32 %81, %83
  br i1 %84, label %85, label %100

85:                                               ; preds = %76
  %86 = load ptr, ptr %12, align 8
  %87 = getelementptr inbounds %struct.icmp, ptr %86, i32 0, i32 3
  %88 = getelementptr inbounds %struct.ih_idseq, ptr %87, i32 0, i32 1
  %89 = load i16, ptr %88, align 2
  %90 = zext i16 %89 to i32
  %91 = load ptr, ptr %8, align 8
  %92 = load i32, ptr %91, align 4
  %93 = icmp eq i32 %90, %92
  br i1 %93, label %94, label %100

94:                                               ; preds = %85
  %95 = load ptr, ptr %9, align 8
  %96 = call i32 @gettimeofday(ptr noundef %95, ptr noundef null) #6
  %97 = load ptr, ptr %8, align 8
  %98 = load i32, ptr %97, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %97, align 4
  store i32 0, ptr %5, align 4
  br label %102

100:                                              ; preds = %85, %76
  br label %101

101:                                              ; preds = %100, %62
  store i32 -1, ptr %5, align 4
  br label %102

102:                                              ; preds = %101, %94, %61, %53
  %103 = load i32, ptr %5, align 4
  ret i32 %103
}

declare i32 @select(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare i64 @recvfrom(i32 noundef, ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @ping(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.timeval, align 8
  %11 = alloca %struct.timeval, align 8
  %12 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 1, ptr %6, align 4
  store i32 0, ptr %8, align 4
  store i32 -1, ptr %9, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 16, i1 false)
  store double 0.000000e+00, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %15 = call i32 @inet_aton(ptr noundef %13, ptr noundef %14) #6
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %18)
  store i32 -1, ptr %2, align 4
  br label %119

20:                                               ; preds = %1
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %21, align 4
  %22 = call i32 @socket(i32 noundef 2, i32 noundef 3, i32 noundef 1) #6
  store i32 %22, ptr %5, align 4
  %23 = load i32, ptr %5, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %20
  call void @perror(ptr noundef @.str.2) #7
  store i32 -1, ptr %2, align 4
  br label %119

26:                                               ; preds = %20
  store i32 1, ptr %6, align 4
  br label %27

27:                                               ; preds = %112, %26
  %28 = load i32, ptr %6, align 4
  %29 = icmp sle i32 %28, 30
  br i1 %29, label %30, label %115

30:                                               ; preds = %27
  %31 = load i32, ptr %6, align 4
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %31)
  %33 = load i32, ptr %5, align 4
  %34 = call i32 @setsockopt(i32 noundef %33, i32 noundef 0, i32 noundef 2, ptr noundef %6, i32 noundef 4) #6
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %30
  call void @perror(ptr noundef @.str.4) #7
  %37 = load i32, ptr %5, align 4
  %38 = call i32 @close(i32 noundef %37)
  store i32 -1, ptr %2, align 4
  br label %119

39:                                               ; preds = %30
  store i32 0, ptr %7, align 4
  br label %40

40:                                               ; preds = %99, %39
  %41 = load i32, ptr %7, align 4
  %42 = icmp slt i32 %41, 3
  br i1 %42, label %43, label %102

43:                                               ; preds = %40
  %44 = load i32, ptr %5, align 4
  %45 = load i32, ptr %6, align 4
  %46 = load i32, ptr %8, align 4
  %47 = call i32 @send_packet(i32 noundef %44, ptr noundef %4, i32 noundef %45, i32 noundef %46)
  %48 = icmp slt i32 %47, 0
  br i1 %48, label %49, label %52

49:                                               ; preds = %43
  %50 = load i32, ptr %5, align 4
  %51 = call i32 @close(i32 noundef %50)
  store i32 -1, ptr %2, align 4
  br label %119

52:                                               ; preds = %43
  %53 = load i32, ptr %5, align 4
  %54 = call i32 @recv_packet(i32 noundef %53, ptr noundef %4, ptr noundef %8, ptr noundef @tv_end)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %98

56:                                               ; preds = %52
  br label %57

57:                                               ; preds = %56
  %58 = load i64, ptr @tv_end, align 8
  %59 = getelementptr inbounds %struct.timeval, ptr %10, i32 0, i32 0
  %60 = load i64, ptr %59, align 8
  %61 = sub nsw i64 %58, %60
  %62 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 0
  store i64 %61, ptr %62, align 8
  %63 = load i64, ptr getelementptr inbounds (%struct.timeval, ptr @tv_end, i32 0, i32 1), align 8
  %64 = getelementptr inbounds %struct.timeval, ptr %10, i32 0, i32 1
  %65 = load i64, ptr %64, align 8
  %66 = sub nsw i64 %63, %65
  %67 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 1
  store i64 %66, ptr %67, align 8
  %68 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 1
  %69 = load i64, ptr %68, align 8
  %70 = icmp slt i64 %69, 0
  br i1 %70, label %71, label %78

71:                                               ; preds = %57
  %72 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 0
  %73 = load i64, ptr %72, align 8
  %74 = add nsw i64 %73, -1
  store i64 %74, ptr %72, align 8
  %75 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 1
  %76 = load i64, ptr %75, align 8
  %77 = add nsw i64 %76, 1000000
  store i64 %77, ptr %75, align 8
  br label %78

78:                                               ; preds = %71, %57
  br label %79

79:                                               ; preds = %78
  %80 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 0
  %81 = load i64, ptr %80, align 8
  %82 = mul nsw i64 %81, 1000
  %83 = getelementptr inbounds %struct.timeval, ptr %11, i32 0, i32 1
  %84 = load i64, ptr %83, align 8
  %85 = sdiv i64 %84, 1000
  %86 = add nsw i64 %82, %85
  %87 = sitofp i64 %86 to double
  store double %87, ptr %12, align 8
  %88 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %89 = getelementptr inbounds %struct.in_addr, ptr %88, i32 0, i32 0
  %90 = load i32, ptr %89, align 4
  %91 = call ptr @inet_ntoa(i32 %90) #6
  %92 = load double, ptr %12, align 8
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %91, double noundef %92)
  %94 = load i32, ptr %9, align 4
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %96, label %97

96:                                               ; preds = %79
  store i32 0, ptr %9, align 4
  br label %97

97:                                               ; preds = %96, %79
  br label %102

98:                                               ; preds = %52
  br label %99

99:                                               ; preds = %98
  %100 = load i32, ptr %7, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %7, align 4
  br label %40, !llvm.loop !8

102:                                              ; preds = %97, %40
  %103 = load i32, ptr %7, align 4
  %104 = icmp eq i32 %103, 3
  br i1 %104, label %105, label %111

105:                                              ; preds = %102
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %107 = load i32, ptr %9, align 4
  %108 = icmp slt i32 %107, 0
  br i1 %108, label %109, label %110

109:                                              ; preds = %105
  store i32 -1, ptr %9, align 4
  br label %110

110:                                              ; preds = %109, %105
  br label %111

111:                                              ; preds = %110, %102
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 @tv_end, i64 16, i1 false)
  br label %112

112:                                              ; preds = %111
  %113 = load i32, ptr %6, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %6, align 4
  br label %27, !llvm.loop !9

115:                                              ; preds = %27
  %116 = load i32, ptr %5, align 4
  %117 = call i32 @close(i32 noundef %116)
  %118 = load i32, ptr %9, align 4
  store i32 %118, ptr %2, align 4
  br label %119

119:                                              ; preds = %115, %49, %36, %25, %17
  %120 = load i32, ptr %2, align 4
  ret i32 %120
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %6 = load i32, ptr %4, align 4
  %7 = icmp ne i32 %6, 2
  br i1 %7, label %8, label %13

8:                                                ; preds = %2
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %11)
  store i32 -1, ptr %3, align 4
  br label %27

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %16)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @ping(ptr noundef %20)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %13
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  store i32 0, ptr %3, align 4
  br label %27

25:                                               ; preds = %13
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  store i32 -1, ptr %3, align 4
  br label %27

27:                                               ; preds = %25, %23, %8
  %28 = load i32, ptr %3, align 4
  ret i32 %28
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
