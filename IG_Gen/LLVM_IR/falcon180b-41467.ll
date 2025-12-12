; ModuleID = 'DATASETv2/falcon180b-41467.c'
source_filename = "DATASETv2/falcon180b-41467.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [49 x i8] c"Usage: %s <hostname/IP> <start_port> <end_port>\0A\00", align 1
@.str.1 = private unnamed_addr constant [61 x i8] c"Error: start_port (%d) cannot be greater than end_port (%d)\0A\00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"Scanning host %s for ports %d to %d...\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"Error creating socket: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Port %d is closed\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Port %d is open\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"Error connecting to port %d: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_usage(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %3)
  call void @exit(i32 noundef 1) #7
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.sockaddr_in, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %14 = load i32, ptr %4, align 4
  %15 = icmp ne i32 %14, 4
  br i1 %15, label %16, label %20

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 0
  %19 = load ptr, ptr %18, align 8
  call void @print_usage(ptr noundef %19)
  br label %20

20:                                               ; preds = %16, %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds ptr, ptr %21, i64 1
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %6, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 2
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @atoi(ptr noundef %26) #8
  store i32 %27, ptr %7, align 4
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 3
  %30 = load ptr, ptr %29, align 8
  %31 = call i32 @atoi(ptr noundef %30) #8
  store i32 %31, ptr %8, align 4
  %32 = load i32, ptr %7, align 4
  %33 = load i32, ptr %8, align 4
  %34 = icmp sgt i32 %32, %33
  br i1 %34, label %35, label %39

35:                                               ; preds = %20
  %36 = load i32, ptr %7, align 4
  %37 = load i32, ptr %8, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %36, i32 noundef %37)
  call void @exit(i32 noundef 1) #7
  unreachable

39:                                               ; preds = %20
  %40 = load ptr, ptr %6, align 8
  %41 = load i32, ptr %7, align 4
  %42 = load i32, ptr %8, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %40, i32 noundef %41, i32 noundef %42)
  %44 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  store i32 %44, ptr %9, align 4
  %45 = load i32, ptr %9, align 4
  %46 = icmp eq i32 %45, -1
  br i1 %46, label %47, label %52

47:                                               ; preds = %39
  %48 = call ptr @__errno_location() #10
  %49 = load i32, ptr %48, align 4
  %50 = call ptr @strerror(i32 noundef %49) #9
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %50)
  call void @exit(i32 noundef 1) #7
  unreachable

52:                                               ; preds = %39
  call void @llvm.memset.p0.i64(ptr align 4 %10, i8 0, i64 16, i1 false)
  %53 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 0
  store i16 2, ptr %53, align 4
  %54 = load i32, ptr %7, align 4
  %55 = trunc i32 %54 to i16
  %56 = call zeroext i16 @htons(i16 noundef zeroext %55) #10
  %57 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 1
  store i16 %56, ptr %57, align 2
  %58 = load ptr, ptr %6, align 8
  %59 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 2
  %60 = call i32 @inet_pton(i32 noundef 2, ptr noundef %58, ptr noundef %59) #9
  store i32 1, ptr %11, align 4
  %61 = load i32, ptr %9, align 4
  %62 = call i32 @setsockopt(i32 noundef %61, i32 noundef 1, i32 noundef 2, ptr noundef %11, i32 noundef 4) #9
  %63 = load i32, ptr %7, align 4
  store i32 %63, ptr %12, align 4
  br label %64

64:                                               ; preds = %105, %52
  %65 = load i32, ptr %12, align 4
  %66 = load i32, ptr %8, align 4
  %67 = icmp sle i32 %65, %66
  br i1 %67, label %68, label %108

68:                                               ; preds = %64
  %69 = load i32, ptr %12, align 4
  %70 = trunc i32 %69 to i16
  %71 = call zeroext i16 @htons(i16 noundef zeroext %70) #10
  %72 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 1
  store i16 %71, ptr %72, align 2
  %73 = load i32, ptr %9, align 4
  %74 = call i32 @connect(i32 noundef %73, ptr noundef %10, i32 noundef 16)
  store i32 %74, ptr %13, align 4
  %75 = load i32, ptr %13, align 4
  %76 = icmp eq i32 %75, -1
  br i1 %76, label %77, label %99

77:                                               ; preds = %68
  %78 = call ptr @__errno_location() #10
  %79 = load i32, ptr %78, align 4
  %80 = icmp eq i32 %79, 111
  br i1 %80, label %81, label %84

81:                                               ; preds = %77
  %82 = load i32, ptr %12, align 4
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %82)
  br label %98

84:                                               ; preds = %77
  %85 = call ptr @__errno_location() #10
  %86 = load i32, ptr %85, align 4
  %87 = icmp eq i32 %86, 104
  br i1 %87, label %88, label %91

88:                                               ; preds = %84
  %89 = load i32, ptr %12, align 4
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %89)
  br label %97

91:                                               ; preds = %84
  %92 = load i32, ptr %12, align 4
  %93 = call ptr @__errno_location() #10
  %94 = load i32, ptr %93, align 4
  %95 = call ptr @strerror(i32 noundef %94) #9
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %92, ptr noundef %95)
  br label %97

97:                                               ; preds = %91, %88
  br label %98

98:                                               ; preds = %97, %81
  br label %104

99:                                               ; preds = %68
  %100 = load i32, ptr %9, align 4
  %101 = call i32 @close(i32 noundef %100)
  %102 = load i32, ptr %12, align 4
  %103 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %102)
  br label %104

104:                                              ; preds = %99, %98
  br label %105

105:                                              ; preds = %104
  %106 = load i32, ptr %12, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %12, align 4
  br label %64, !llvm.loop !6

108:                                              ; preds = %64
  %109 = load i32, ptr %9, align 4
  %110 = call i32 @close(i32 noundef %109)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #4

; Function Attrs: nounwind
declare ptr @strerror(i32 noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #4

; Function Attrs: nounwind
declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) #4

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }
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
