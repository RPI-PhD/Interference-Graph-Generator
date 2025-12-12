; ModuleID = 'DATASETv2/falcon180b-10963.c'
source_filename = "DATASETv2/falcon180b-10963.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.addrinfo = type { i32, i32, i32, i32, i32, ptr, ptr, ptr }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [39 x i8] c"Usage: %s <server_name> <server_port>\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"getaddrinfo: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"socket\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"connect\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Failed to connect\0A\00", align 1
@.str.5 = private unnamed_addr constant [57 x i8] c"GET / HTTP/1.1\0D\0AHost: example.com\0D\0AConnection: close\0D\0A\0D\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"Request %d: %.2f kB/s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.addrinfo, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca [1024 x i8], align 16
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %18 = load i32, ptr %4, align 4
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %20, label %26

20:                                               ; preds = %2
  %21 = load ptr, ptr @stderr, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 0
  %24 = load ptr, ptr %23, align 8
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str, ptr noundef %24)
  call void @exit(i32 noundef 1) #7
  unreachable

26:                                               ; preds = %2
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 1
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %6, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds ptr, ptr %30, i64 2
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 @atoi(ptr noundef %32) #8
  store i32 %33, ptr %7, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %9, i8 0, i64 48, i1 false)
  %34 = getelementptr inbounds %struct.addrinfo, ptr %9, i32 0, i32 1
  store i32 0, ptr %34, align 4
  %35 = getelementptr inbounds %struct.addrinfo, ptr %9, i32 0, i32 2
  store i32 1, ptr %35, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = call i32 @getaddrinfo(ptr noundef %36, ptr noundef null, ptr noundef %9, ptr noundef %10)
  store i32 %37, ptr %12, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %44

39:                                               ; preds = %26
  %40 = load ptr, ptr @stderr, align 8
  %41 = load i32, ptr %12, align 4
  %42 = call ptr @gai_strerror(i32 noundef %41) #9
  %43 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %40, ptr noundef @.str.1, ptr noundef %42)
  call void @exit(i32 noundef 1) #7
  unreachable

44:                                               ; preds = %26
  %45 = load ptr, ptr %10, align 8
  store ptr %45, ptr %11, align 8
  br label %46

46:                                               ; preds = %76, %44
  %47 = load ptr, ptr %11, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %80

49:                                               ; preds = %46
  %50 = load ptr, ptr %11, align 8
  %51 = getelementptr inbounds %struct.addrinfo, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %51, align 4
  %53 = load ptr, ptr %11, align 8
  %54 = getelementptr inbounds %struct.addrinfo, ptr %53, i32 0, i32 2
  %55 = load i32, ptr %54, align 8
  %56 = load ptr, ptr %11, align 8
  %57 = getelementptr inbounds %struct.addrinfo, ptr %56, i32 0, i32 3
  %58 = load i32, ptr %57, align 4
  %59 = call i32 @socket(i32 noundef %52, i32 noundef %55, i32 noundef %58) #9
  store i32 %59, ptr %8, align 4
  %60 = icmp eq i32 %59, -1
  br i1 %60, label %61, label %62

61:                                               ; preds = %49
  call void @perror(ptr noundef @.str.2) #10
  br label %76

62:                                               ; preds = %49
  %63 = load i32, ptr %8, align 4
  %64 = load ptr, ptr %11, align 8
  %65 = getelementptr inbounds %struct.addrinfo, ptr %64, i32 0, i32 5
  %66 = load ptr, ptr %65, align 8
  %67 = load ptr, ptr %11, align 8
  %68 = getelementptr inbounds %struct.addrinfo, ptr %67, i32 0, i32 4
  %69 = load i32, ptr %68, align 8
  %70 = call i32 @connect(i32 noundef %63, ptr noundef %66, i32 noundef %69)
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %72, label %75

72:                                               ; preds = %62
  %73 = load i32, ptr %8, align 4
  %74 = call i32 @close(i32 noundef %73)
  call void @perror(ptr noundef @.str.3) #10
  br label %76

75:                                               ; preds = %62
  br label %80

76:                                               ; preds = %72, %61
  %77 = load ptr, ptr %11, align 8
  %78 = getelementptr inbounds %struct.addrinfo, ptr %77, i32 0, i32 7
  %79 = load ptr, ptr %78, align 8
  store ptr %79, ptr %11, align 8
  br label %46, !llvm.loop !6

80:                                               ; preds = %75, %46
  %81 = load ptr, ptr %11, align 8
  %82 = icmp eq ptr %81, null
  br i1 %82, label %83, label %86

83:                                               ; preds = %80
  %84 = load ptr, ptr @stderr, align 8
  %85 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %84, ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #7
  unreachable

86:                                               ; preds = %80
  %87 = load ptr, ptr %10, align 8
  call void @freeaddrinfo(ptr noundef %87) #9
  store i32 0, ptr %17, align 4
  br label %88

88:                                               ; preds = %113, %86
  %89 = load i32, ptr %17, align 4
  %90 = icmp slt i32 %89, 10
  br i1 %90, label %91, label %116

91:                                               ; preds = %88
  %92 = load i32, ptr %8, align 4
  %93 = call i64 @send(i32 noundef %92, ptr noundef @.str.5, i64 noundef 56, i32 noundef 0)
  store double 0.000000e+00, ptr %15, align 8
  br label %94

94:                                               ; preds = %100, %91
  %95 = load i32, ptr %8, align 4
  %96 = getelementptr inbounds [1024 x i8], ptr %14, i64 0, i64 0
  %97 = call i64 @recv(i32 noundef %95, ptr noundef %96, i64 noundef 1024, i32 noundef 0)
  %98 = trunc i64 %97 to i32
  store i32 %98, ptr %13, align 4
  %99 = icmp sgt i32 %98, 0
  br i1 %99, label %100, label %106

100:                                              ; preds = %94
  %101 = load i32, ptr %13, align 4
  %102 = sitofp i32 %101 to double
  %103 = fdiv double %102, 1.024000e+03
  %104 = load double, ptr %15, align 8
  %105 = fadd double %104, %103
  store double %105, ptr %15, align 8
  br label %94, !llvm.loop !8

106:                                              ; preds = %94
  %107 = load double, ptr %15, align 8
  %108 = fdiv double %107, 5.000000e+00
  store double %108, ptr %16, align 8
  %109 = load i32, ptr %17, align 4
  %110 = add nsw i32 %109, 1
  %111 = load double, ptr %16, align 8
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %110, double noundef %111)
  br label %113

113:                                              ; preds = %106
  %114 = load i32, ptr %17, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, ptr %17, align 4
  br label %88, !llvm.loop !9

116:                                              ; preds = %88
  %117 = load i32, ptr %8, align 4
  %118 = call i32 @close(i32 noundef %117)
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare i32 @getaddrinfo(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare ptr @gai_strerror(i32 noundef) #5

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #5

; Function Attrs: cold
declare void @perror(ptr noundef) #6

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

; Function Attrs: nounwind
declare void @freeaddrinfo(ptr noundef) #5

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }
attributes #10 = { cold }

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
