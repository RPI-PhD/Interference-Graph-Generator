; ModuleID = 'LLVM_IR/gpt35-65926.ll'
source_filename = "DATASETv2/gpt35-65926.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.fd_set = type { [16 x i64] }
%struct.icmp = type { i8, i8, i16, %union.anon, %union.anon.0 }
%union.anon = type { %struct.in_addr }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { %struct.ip }
%struct.ip = type { i8, i8, i16, i16, i16, i8, i8, i16, %struct.in_addr, %struct.in_addr }
%struct.ih_idseq = type { i16, i16 }

@.str = private unnamed_addr constant [28 x i8] c"Usage: %s <destination_ip>\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"setsockopt\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"sendto\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"select\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Hop %d: Timed out\0A\00", align 1
@.str.5 = private unnamed_addr constant [50 x i8] c"Adding 1 to hop at line 77 to increase value: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"recvfrom\00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"Hop %d: Pinged %s in %f seconds\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"socket\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"inet_pton\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_usage(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @checksum(ptr noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %10, %2
  %.02 = phi ptr [ %0, %2 ], [ %6, %10 ]
  %.01 = phi i32 [ %1, %2 ], [ %11, %10 ]
  %.0 = phi i32 [ 0, %2 ], [ %9, %10 ]
  %4 = icmp sgt i32 %.01, 1
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = getelementptr inbounds i16, ptr %.02, i32 1
  %7 = load i16, ptr %.02, align 2
  %8 = zext i16 %7 to i32
  %9 = add i32 %.0, %8
  br label %10

10:                                               ; preds = %5
  %11 = sub nsw i32 %.01, 2
  br label %3, !llvm.loop !6

12:                                               ; preds = %3
  %13 = icmp eq i32 %.01, 1
  br i1 %13, label %14, label %18

14:                                               ; preds = %12
  %15 = load i8, ptr %.02, align 1
  %16 = zext i8 %15 to i32
  %17 = add i32 %.0, %16
  br label %18

18:                                               ; preds = %14, %12
  %.1 = phi i32 [ %17, %14 ], [ %.0, %12 ]
  %19 = lshr i32 %.1, 16
  %20 = and i32 %.1, 65535
  %21 = add i32 %19, %20
  %22 = lshr i32 %21, 16
  %23 = add i32 %21, %22
  %24 = xor i32 %23, -1
  %25 = trunc i32 %24 to i16
  ret i16 %25
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @ping(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca [4096 x i8], align 16
  %6 = alloca %struct.timeval, align 8
  %7 = alloca %struct.timeval, align 8
  %8 = alloca %struct.timeval, align 8
  %9 = alloca %struct.sockaddr_in, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.fd_set, align 8
  store i32 %1, ptr %4, align 4
  %12 = getelementptr inbounds %struct.timeval, ptr %8, i32 0, i32 0
  store i64 1, ptr %12, align 8
  %13 = getelementptr inbounds %struct.timeval, ptr %8, i32 0, i32 1
  store i64 0, ptr %13, align 8
  store i32 16, ptr %10, align 4
  br label %14

14:                                               ; preds = %126, %3
  %.05 = phi i32 [ 0, %3 ], [ %29, %126 ]
  %.02 = phi i32 [ 0, %3 ], [ %.24, %126 ]
  %.01 = phi i32 [ 0, %3 ], [ %.2, %126 ]
  %15 = icmp ne i32 %.01, 0
  br i1 %15, label %18, label %16

16:                                               ; preds = %14
  %17 = icmp slt i32 %.02, 64
  br label %18

18:                                               ; preds = %16, %14
  %19 = phi i1 [ false, %14 ], [ %17, %16 ]
  br i1 %19, label %20, label %128

20:                                               ; preds = %18
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 4096, i1 false)
  %21 = getelementptr inbounds [4096 x i8], ptr %5, i64 0, i64 0
  %22 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 0
  store i8 8, ptr %22, align 4
  %23 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 1
  store i8 0, ptr %23, align 1
  %24 = call i32 @getpid() #8
  %25 = and i32 %24, 65535
  %26 = trunc i32 %25 to i16
  %27 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 3
  %28 = getelementptr inbounds %struct.ih_idseq, ptr %27, i32 0, i32 0
  store i16 %26, ptr %28, align 4
  %29 = add nsw i32 %.05, 1
  %30 = trunc i32 %.05 to i16
  %31 = call zeroext i16 @htons(i16 noundef zeroext %30) #9
  %32 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 3
  %33 = getelementptr inbounds %struct.ih_idseq, ptr %32, i32 0, i32 1
  store i16 %31, ptr %33, align 2
  %34 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 4
  call void @llvm.memset.p0.i64(ptr align 4 %34, i8 -91, i64 4068, i1 false)
  %35 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 2
  store i16 0, ptr %35, align 2
  %36 = call zeroext i16 @checksum(ptr noundef %21, i32 noundef 4096)
  %37 = getelementptr inbounds %struct.icmp, ptr %21, i32 0, i32 2
  store i16 %36, ptr %37, align 2
  %38 = call i32 @setsockopt(i32 noundef %2, i32 noundef 0, i32 noundef 2, ptr noundef %4, i32 noundef 4) #8
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %20
  call void @perror(ptr noundef @.str.1) #10
  call void @exit(i32 noundef 1) #11
  unreachable

41:                                               ; preds = %20
  %42 = getelementptr inbounds [4096 x i8], ptr %5, i64 0, i64 0
  %43 = call i64 @sendto(i32 noundef %2, ptr noundef %42, i64 noundef 4096, i32 noundef 0, ptr noundef %0, i32 noundef 16)
  %44 = icmp sle i64 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %41
  call void @perror(ptr noundef @.str.2) #10
  call void @exit(i32 noundef 1) #11
  unreachable

46:                                               ; preds = %41
  %47 = call i32 @gettimeofday(ptr noundef %6, ptr noundef null) #8
  br label %48

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %56, %48
  %.0 = phi i32 [ 0, %48 ], [ %57, %56 ]
  %50 = zext i32 %.0 to i64
  %51 = icmp ult i64 %50, 16
  br i1 %51, label %52, label %58

52:                                               ; preds = %49
  %53 = getelementptr inbounds %struct.fd_set, ptr %11, i32 0, i32 0
  %54 = zext i32 %.0 to i64
  %55 = getelementptr inbounds [16 x i64], ptr %53, i64 0, i64 %54
  store i64 0, ptr %55, align 8
  br label %56

56:                                               ; preds = %52
  %57 = add i32 %.0, 1
  br label %49, !llvm.loop !8

58:                                               ; preds = %49
  br label %59

59:                                               ; preds = %58
  %60 = srem i32 %2, 64
  %61 = zext i32 %60 to i64
  %62 = shl i64 1, %61
  %63 = getelementptr inbounds %struct.fd_set, ptr %11, i32 0, i32 0
  %64 = sdiv i32 %2, 64
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [16 x i64], ptr %63, i64 0, i64 %65
  %67 = load i64, ptr %66, align 8
  %68 = or i64 %67, %62
  store i64 %68, ptr %66, align 8
  %69 = add nsw i32 %2, 1
  %70 = call i32 @select(i32 noundef %69, ptr noundef %11, ptr noundef null, ptr noundef null, ptr noundef %8)
  %71 = icmp slt i32 %70, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %59
  call void @perror(ptr noundef @.str.3) #10
  call void @exit(i32 noundef 1) #11
  unreachable

73:                                               ; preds = %59
  %74 = icmp eq i32 %70, 0
  br i1 %74, label %75, label %78

75:                                               ; preds = %73
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %.02)
  %77 = add nsw i32 %.02, 1
  br label %125

78:                                               ; preds = %73
  %79 = add nsw i32 %.02, 1
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %79)
  %81 = getelementptr inbounds [4096 x i8], ptr %5, i64 0, i64 0
  %82 = call i64 @recvfrom(i32 noundef %2, ptr noundef %81, i64 noundef 4096, i32 noundef 0, ptr noundef %9, ptr noundef %10)
  %83 = icmp sle i64 %82, 0
  br i1 %83, label %84, label %85

84:                                               ; preds = %78
  call void @perror(ptr noundef @.str.6) #10
  call void @exit(i32 noundef 1) #11
  unreachable

85:                                               ; preds = %78
  %86 = call i32 @gettimeofday(ptr noundef %7, ptr noundef null) #8
  %87 = getelementptr inbounds %struct.timeval, ptr %7, i32 0, i32 0
  %88 = load i64, ptr %87, align 8
  %89 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 0
  %90 = load i64, ptr %89, align 8
  %91 = sub nsw i64 %88, %90
  %92 = sitofp i64 %91 to double
  %93 = getelementptr inbounds %struct.timeval, ptr %7, i32 0, i32 1
  %94 = load i64, ptr %93, align 8
  %95 = getelementptr inbounds %struct.timeval, ptr %6, i32 0, i32 1
  %96 = load i64, ptr %95, align 8
  %97 = sub nsw i64 %94, %96
  %98 = sitofp i64 %97 to double
  %99 = fdiv double %98, 1.000000e+06
  %100 = fadd double %92, %99
  %101 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 2
  %102 = getelementptr inbounds %struct.in_addr, ptr %101, i32 0, i32 0
  %103 = load i32, ptr %102, align 4
  %104 = call ptr @inet_ntoa(i32 %103) #8
  %105 = getelementptr inbounds %struct.sockaddr_in, ptr %0, i32 0, i32 2
  %106 = getelementptr inbounds %struct.in_addr, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 4
  %108 = call ptr @inet_ntoa(i32 %107) #8
  %109 = call i32 @strcmp(ptr noundef %104, ptr noundef %108) #12
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %117

111:                                              ; preds = %85
  %112 = getelementptr inbounds %struct.sockaddr_in, ptr %0, i32 0, i32 2
  %113 = getelementptr inbounds %struct.in_addr, ptr %112, i32 0, i32 0
  %114 = load i32, ptr %113, align 4
  %115 = call ptr @inet_ntoa(i32 %114) #8
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %.02, ptr noundef %115, double noundef %100)
  br label %124

117:                                              ; preds = %85
  %118 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 2
  %119 = getelementptr inbounds %struct.in_addr, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 4
  %121 = call ptr @inet_ntoa(i32 %120) #8
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %.02, ptr noundef %121, double noundef %100)
  %123 = add nsw i32 %.02, 1
  br label %124

124:                                              ; preds = %117, %111
  %.13 = phi i32 [ %.02, %111 ], [ %123, %117 ]
  %.1 = phi i32 [ 1, %111 ], [ %.01, %117 ]
  br label %125

125:                                              ; preds = %124, %75
  %.24 = phi i32 [ %77, %75 ], [ %.13, %124 ]
  %.2 = phi i32 [ %.01, %75 ], [ %.1, %124 ]
  br label %126

126:                                              ; preds = %125
  %127 = call i32 @usleep(i32 noundef 1000000)
  br label %14, !llvm.loop !9

128:                                              ; preds = %18
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i32 @getpid() #3

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #4

; Function Attrs: nounwind
declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #6

declare i64 @sendto(i32 noundef, ptr noundef, i64 noundef, i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #3

declare i32 @select(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare i64 @recvfrom(i32 noundef, ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #7

; Function Attrs: nounwind
declare ptr @inet_ntoa(i32) #3

declare i32 @usleep(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = icmp ne i32 %0, 2
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  %6 = getelementptr inbounds ptr, ptr %1, i64 0
  %7 = load ptr, ptr %6, align 8
  call void @print_usage(ptr noundef %7)
  br label %22

8:                                                ; preds = %2
  %9 = call i32 @socket(i32 noundef 2, i32 noundef 3, i32 noundef 1) #8
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  call void @perror(ptr noundef @.str.8) #10
  br label %22

12:                                               ; preds = %8
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 16, i1 false)
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %13, align 4
  %14 = getelementptr inbounds ptr, ptr %1, i64 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %17 = call i32 @inet_pton(i32 noundef 2, ptr noundef %15, ptr noundef %16) #8
  %18 = icmp sle i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %12
  call void @perror(ptr noundef @.str.9) #10
  br label %22

20:                                               ; preds = %12
  call void @ping(ptr noundef %3, i32 noundef 1, i32 noundef %9)
  %21 = call i32 @close(i32 noundef %9)
  br label %22

22:                                               ; preds = %20, %19, %11, %5
  %.0 = phi i32 [ 1, %5 ], [ 1, %11 ], [ 1, %19 ], [ 0, %20 ]
  ret i32 %.0
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { nounwind willreturn memory(none) }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind willreturn memory(read) }

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
