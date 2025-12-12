; ModuleID = 'DATASETv2/falcon2-11B-2920.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @error(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @perror(ptr noundef %3) #7
  call void @exit(i32 noundef 1) #8
  unreachable
}

; Function Attrs: cold
declare void @perror(ptr noundef) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.addrinfo, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.sockaddr_in, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.timeval, align 8
  %15 = alloca %struct.timeval, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %16, 3
  br i1 %17, label %18, label %24

18:                                               ; preds = %2
  %19 = load ptr, ptr @stderr, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 0
  %22 = load ptr, ptr %21, align 8
  %23 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str, ptr noundef %22)
  call void @exit(i32 noundef 1) #8
  unreachable

24:                                               ; preds = %2
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 48, i1 false)
  %25 = getelementptr inbounds %struct.addrinfo, ptr %6, i32 0, i32 1
  store i32 0, ptr %25, align 4
  %26 = getelementptr inbounds %struct.addrinfo, ptr %6, i32 0, i32 2
  store i32 1, ptr %26, align 8
  %27 = getelementptr inbounds %struct.addrinfo, ptr %6, i32 0, i32 0
  store i32 1, ptr %27, align 8
  %28 = getelementptr inbounds %struct.addrinfo, ptr %6, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = getelementptr inbounds %struct.addrinfo, ptr %6, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = getelementptr inbounds %struct.addrinfo, ptr %6, i32 0, i32 3
  %33 = load i32, ptr %32, align 4
  %34 = call i32 @socket(i32 noundef %29, i32 noundef %31, i32 noundef %33) #9
  store i32 %34, ptr %9, align 4
  %35 = icmp eq i32 %34, -1
  br i1 %35, label %36, label %37

36:                                               ; preds = %24
  call void @error(ptr noundef @.str.1)
  br label %37

37:                                               ; preds = %36, %24
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds ptr, ptr %38, i64 1
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 2
  %43 = load ptr, ptr %42, align 8
  %44 = call i32 @getaddrinfo(ptr noundef %40, ptr noundef %43, ptr noundef %6, ptr noundef %7)
  %45 = icmp eq i32 %44, -1
  br i1 %45, label %46, label %47

46:                                               ; preds = %37
  call void @error(ptr noundef @.str.2)
  br label %47

47:                                               ; preds = %46, %37
  %48 = load ptr, ptr %7, align 8
  store ptr %48, ptr %8, align 8
  br label %49

49:                                               ; preds = %79, %47
  %50 = load ptr, ptr %8, align 8
  %51 = icmp ne ptr %50, null
  br i1 %51, label %52, label %83

52:                                               ; preds = %49
  %53 = load ptr, ptr %8, align 8
  %54 = getelementptr inbounds %struct.addrinfo, ptr %53, i32 0, i32 1
  %55 = load i32, ptr %54, align 4
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds %struct.addrinfo, ptr %56, i32 0, i32 2
  %58 = load i32, ptr %57, align 8
  %59 = load ptr, ptr %8, align 8
  %60 = getelementptr inbounds %struct.addrinfo, ptr %59, i32 0, i32 3
  %61 = load i32, ptr %60, align 4
  %62 = call i32 @socket(i32 noundef %55, i32 noundef %58, i32 noundef %61) #9
  store i32 %62, ptr %9, align 4
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %65

64:                                               ; preds = %52
  call void @error(ptr noundef @.str.1)
  br label %65

65:                                               ; preds = %64, %52
  %66 = load i32, ptr %9, align 4
  %67 = load ptr, ptr %8, align 8
  %68 = getelementptr inbounds %struct.addrinfo, ptr %67, i32 0, i32 5
  %69 = load ptr, ptr %68, align 8
  %70 = load ptr, ptr %8, align 8
  %71 = getelementptr inbounds %struct.addrinfo, ptr %70, i32 0, i32 4
  %72 = load i32, ptr %71, align 8
  %73 = call i32 @connect(i32 noundef %66, ptr noundef %69, i32 noundef %72)
  %74 = icmp eq i32 %73, -1
  br i1 %74, label %75, label %78

75:                                               ; preds = %65
  %76 = load i32, ptr %9, align 4
  %77 = call i32 @close(i32 noundef %76)
  br label %79

78:                                               ; preds = %65
  br label %83

79:                                               ; preds = %75
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds %struct.addrinfo, ptr %80, i32 0, i32 7
  %82 = load ptr, ptr %81, align 8
  store ptr %82, ptr %8, align 8
  br label %49, !llvm.loop !6

83:                                               ; preds = %78, %49
  %84 = load ptr, ptr %8, align 8
  %85 = icmp eq ptr %84, null
  br i1 %85, label %86, label %87

86:                                               ; preds = %83
  call void @error(ptr noundef @.str.3)
  br label %87

87:                                               ; preds = %86, %83
  %88 = load i32, ptr %9, align 4
  %89 = call i32 @listen(i32 noundef %88, i32 noundef 5) #9
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %91, label %92

91:                                               ; preds = %87
  call void @error(ptr noundef @.str.4)
  br label %92

92:                                               ; preds = %91, %87
  br label %93

93:                                               ; preds = %92, %138
  store i32 16, ptr %11, align 4
  %94 = load i32, ptr %9, align 4
  %95 = call i32 @accept(i32 noundef %94, ptr noundef %10, ptr noundef %11)
  store i32 %95, ptr %12, align 4
  %96 = load i32, ptr %12, align 4
  %97 = icmp eq i32 %96, -1
  br i1 %97, label %98, label %99

98:                                               ; preds = %93
  call void @error(ptr noundef @.str.5)
  br label %99

99:                                               ; preds = %98, %93
  %100 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 2
  %101 = getelementptr inbounds %struct.in_addr, ptr %100, i32 0, i32 0
  %102 = load i32, ptr %101, align 4
  %103 = call ptr @inet_ntoa(i32 %102) #9
  %104 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 1
  %105 = load i16, ptr %104, align 2
  %106 = call zeroext i16 @ntohs(i16 noundef zeroext %105) #10
  %107 = zext i16 %106 to i32
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %103, i32 noundef %107)
  store i32 0, ptr %13, align 4
  br label %109

109:                                              ; preds = %135, %99
  %110 = load i32, ptr %13, align 4
  %111 = icmp slt i32 %110, 10
  br i1 %111, label %112, label %138

112:                                              ; preds = %109
  %113 = call i32 @gettimeofday(ptr noundef %14, ptr noundef null) #9
  %114 = load i32, ptr %12, align 4
  %115 = call i64 @send(i32 noundef %114, ptr noundef @.str.7, i64 noundef 15, i32 noundef 0)
  %116 = load i32, ptr %12, align 4
  %117 = call i64 @recv(i32 noundef %116, ptr noundef @.str.8, i64 noundef 7, i32 noundef 0)
  %118 = icmp eq i64 %117, -1
  br i1 %118, label %119, label %120

119:                                              ; preds = %112
  call void @error(ptr noundef @.str.9)
  br label %120

120:                                              ; preds = %119, %112
  %121 = call i32 @gettimeofday(ptr noundef %15, ptr noundef null) #9
  %122 = getelementptr inbounds %struct.timeval, ptr %15, i32 0, i32 0
  %123 = load i64, ptr %122, align 8
  %124 = getelementptr inbounds %struct.timeval, ptr %14, i32 0, i32 0
  %125 = load i64, ptr %124, align 8
  %126 = sub nsw i64 %123, %125
  %127 = mul nsw i64 %126, 1000
  %128 = getelementptr inbounds %struct.timeval, ptr %15, i32 0, i32 1
  %129 = load i64, ptr %128, align 8
  %130 = getelementptr inbounds %struct.timeval, ptr %14, i32 0, i32 1
  %131 = load i64, ptr %130, align 8
  %132 = sub nsw i64 %129, %131
  %133 = sdiv i64 %132, 1000
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i64 noundef %127, i64 noundef %133)
  br label %135

135:                                              ; preds = %120
  %136 = load i32, ptr %13, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, ptr %13, align 4
  br label %109, !llvm.loop !8

138:                                              ; preds = %109
  %139 = load i32, ptr %12, align 4
  %140 = call i32 @close(i32 noundef %139)
  br label %93
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
