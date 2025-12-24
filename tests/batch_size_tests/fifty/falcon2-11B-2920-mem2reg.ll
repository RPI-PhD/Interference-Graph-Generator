; ModuleID = 'LLVM_IR/falcon2-11B-2920.ll'
source_filename = "DATASETv2/falcon2-11B-2920.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.addrinfo = type { i32, i32, i32, i32, i32, ptr, ptr, ptr }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.timeval = type { i64, i64 }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [42 x i8] c"Usage: %s <server-address> <server-port>\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"ERROR opening socket\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"ERROR resolving server address\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"ERROR connecting to server\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"ERROR listening on socket\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"ERROR accepting connection\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Connected to client: %s:%d\0A\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"Hello, client!\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"World!\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"ERROR receiving from client\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"Delay: %ld.%06ld ms\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @error(ptr noundef %0) #0 {
  call void @perror(ptr noundef %0) #7
  call void @exit(i32 noundef 1) #8
  unreachable
}

; Function Attrs: cold
declare void @perror(ptr noundef) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.addrinfo, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.timeval, align 8
  %8 = alloca %struct.timeval, align 8
  %9 = icmp slt i32 %0, 3
  br i1 %9, label %10, label %15

10:                                               ; preds = %2
  %11 = load ptr, ptr @stderr, align 8
  %12 = getelementptr inbounds ptr, ptr %1, i64 0
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef @.str, ptr noundef %13)
  call void @exit(i32 noundef 1) #8
  unreachable

15:                                               ; preds = %2
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 48, i1 false)
  %16 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 1
  store i32 0, ptr %16, align 4
  %17 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 2
  store i32 1, ptr %17, align 8
  %18 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 0
  store i32 1, ptr %18, align 8
  %19 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 2
  %22 = load i32, ptr %21, align 8
  %23 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 3
  %24 = load i32, ptr %23, align 4
  %25 = call i32 @socket(i32 noundef %20, i32 noundef %22, i32 noundef %24) #9
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %27, label %28

27:                                               ; preds = %15
  call void @error(ptr noundef @.str.1)
  br label %28

28:                                               ; preds = %27, %15
  %29 = getelementptr inbounds ptr, ptr %1, i64 1
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds ptr, ptr %1, i64 2
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 @getaddrinfo(ptr noundef %30, ptr noundef %32, ptr noundef %3, ptr noundef %4)
  %34 = icmp eq i32 %33, -1
  br i1 %34, label %35, label %36

35:                                               ; preds = %28
  call void @error(ptr noundef @.str.2)
  br label %36

36:                                               ; preds = %35, %28
  %37 = load ptr, ptr %4, align 8
  br label %38

38:                                               ; preds = %60, %36
  %.02 = phi ptr [ %37, %36 ], [ %62, %60 ]
  %.01 = phi i32 [ %25, %36 ], [ %47, %60 ]
  %39 = icmp ne ptr %.02, null
  br i1 %39, label %40, label %63

40:                                               ; preds = %38
  %41 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 2
  %44 = load i32, ptr %43, align 8
  %45 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 3
  %46 = load i32, ptr %45, align 4
  %47 = call i32 @socket(i32 noundef %42, i32 noundef %44, i32 noundef %46) #9
  %48 = icmp eq i32 %47, -1
  br i1 %48, label %49, label %50

49:                                               ; preds = %40
  call void @error(ptr noundef @.str.1)
  br label %50

50:                                               ; preds = %49, %40
  %51 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 5
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 4
  %54 = load i32, ptr %53, align 8
  %55 = call i32 @connect(i32 noundef %47, ptr noundef %52, i32 noundef %54)
  %56 = icmp eq i32 %55, -1
  br i1 %56, label %57, label %59

57:                                               ; preds = %50
  %58 = call i32 @close(i32 noundef %47)
  br label %60

59:                                               ; preds = %50
  br label %63

60:                                               ; preds = %57
  %61 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 7
  %62 = load ptr, ptr %61, align 8
  br label %38, !llvm.loop !6

63:                                               ; preds = %59, %38
  %.1 = phi i32 [ %47, %59 ], [ %.01, %38 ]
  %64 = icmp eq ptr %.02, null
  br i1 %64, label %65, label %66

65:                                               ; preds = %63
  call void @error(ptr noundef @.str.3)
  br label %66

66:                                               ; preds = %65, %63
  %67 = call i32 @listen(i32 noundef %.1, i32 noundef 5) #9
  %68 = icmp eq i32 %67, -1
  br i1 %68, label %69, label %70

69:                                               ; preds = %66
  call void @error(ptr noundef @.str.4)
  br label %70

70:                                               ; preds = %69, %66
  br label %71

71:                                               ; preds = %110, %70
  store i32 16, ptr %6, align 4
  %72 = call i32 @accept(i32 noundef %.1, ptr noundef %5, ptr noundef %6)
  %73 = icmp eq i32 %72, -1
  br i1 %73, label %74, label %75

74:                                               ; preds = %71
  call void @error(ptr noundef @.str.5)
  br label %75

75:                                               ; preds = %74, %71
  %76 = getelementptr inbounds %struct.sockaddr_in, ptr %5, i32 0, i32 2
  %77 = getelementptr inbounds %struct.in_addr, ptr %76, i32 0, i32 0
  %78 = load i32, ptr %77, align 4
  %79 = call ptr @inet_ntoa(i32 %78) #9
  %80 = getelementptr inbounds %struct.sockaddr_in, ptr %5, i32 0, i32 1
  %81 = load i16, ptr %80, align 2
  %82 = call zeroext i16 @ntohs(i16 noundef zeroext %81) #10
  %83 = zext i16 %82 to i32
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %79, i32 noundef %83)
  br label %85

85:                                               ; preds = %108, %75
  %.0 = phi i32 [ 0, %75 ], [ %109, %108 ]
  %86 = icmp slt i32 %.0, 10
  br i1 %86, label %87, label %110

87:                                               ; preds = %85
  %88 = call i32 @gettimeofday(ptr noundef %7, ptr noundef null) #9
  %89 = call i64 @send(i32 noundef %72, ptr noundef @.str.7, i64 noundef 15, i32 noundef 0)
  %90 = call i64 @recv(i32 noundef %72, ptr noundef @.str.8, i64 noundef 7, i32 noundef 0)
  %91 = icmp eq i64 %90, -1
  br i1 %91, label %92, label %93

92:                                               ; preds = %87
  call void @error(ptr noundef @.str.9)
  br label %93

93:                                               ; preds = %92, %87
  %94 = call i32 @gettimeofday(ptr noundef %8, ptr noundef null) #9
  %95 = getelementptr inbounds %struct.timeval, ptr %8, i32 0, i32 0
  %96 = load i64, ptr %95, align 8
  %97 = getelementptr inbounds %struct.timeval, ptr %7, i32 0, i32 0
  %98 = load i64, ptr %97, align 8
  %99 = sub nsw i64 %96, %98
  %100 = mul nsw i64 %99, 1000
  %101 = getelementptr inbounds %struct.timeval, ptr %8, i32 0, i32 1
  %102 = load i64, ptr %101, align 8
  %103 = getelementptr inbounds %struct.timeval, ptr %7, i32 0, i32 1
  %104 = load i64, ptr %103, align 8
  %105 = sub nsw i64 %102, %104
  %106 = sdiv i64 %105, 1000
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i64 noundef %100, i64 noundef %106)
  br label %108

108:                                              ; preds = %93
  %109 = add nsw i32 %.0, 1
  br label %85, !llvm.loop !8

110:                                              ; preds = %85
  %111 = call i32 @close(i32 noundef %72)
  br label %71
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #5

declare i32 @getaddrinfo(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #3

declare i32 @close(i32 noundef) #3

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #5

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #3

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare ptr @inet_ntoa(i32) #5

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @ntohs(i16 noundef zeroext) #6

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #5

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #3

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind willreturn memory(none) }

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
