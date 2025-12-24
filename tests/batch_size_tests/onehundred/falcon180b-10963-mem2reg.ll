; ModuleID = 'LLVM_IR/falcon180b-10963.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.addrinfo, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [1024 x i8], align 16
  %6 = icmp ne i32 %0, 3
  br i1 %6, label %7, label %12

7:                                                ; preds = %2
  %8 = load ptr, ptr @stderr, align 8
  %9 = getelementptr inbounds ptr, ptr %1, i64 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str, ptr noundef %10)
  call void @exit(i32 noundef 1) #7
  unreachable

12:                                               ; preds = %2
  %13 = getelementptr inbounds ptr, ptr %1, i64 1
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds ptr, ptr %1, i64 2
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #8
  call void @llvm.memset.p0.i64(ptr align 8 %3, i8 0, i64 48, i1 false)
  %18 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 1
  store i32 0, ptr %18, align 4
  %19 = getelementptr inbounds %struct.addrinfo, ptr %3, i32 0, i32 2
  store i32 1, ptr %19, align 8
  %20 = call i32 @getaddrinfo(ptr noundef %14, ptr noundef null, ptr noundef %3, ptr noundef %4)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %12
  %23 = load ptr, ptr @stderr, align 8
  %24 = call ptr @gai_strerror(i32 noundef %20) #9
  %25 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %23, ptr noundef @.str.1, ptr noundef %24)
  call void @exit(i32 noundef 1) #7
  unreachable

26:                                               ; preds = %12
  %27 = load ptr, ptr %4, align 8
  br label %28

28:                                               ; preds = %50, %26
  %.03 = phi i32 [ undef, %26 ], [ %37, %50 ]
  %.02 = phi ptr [ %27, %26 ], [ %52, %50 ]
  %29 = icmp ne ptr %.02, null
  br i1 %29, label %30, label %53

30:                                               ; preds = %28
  %31 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 2
  %34 = load i32, ptr %33, align 8
  %35 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 3
  %36 = load i32, ptr %35, align 4
  %37 = call i32 @socket(i32 noundef %32, i32 noundef %34, i32 noundef %36) #9
  %38 = icmp eq i32 %37, -1
  br i1 %38, label %39, label %40

39:                                               ; preds = %30
  call void @perror(ptr noundef @.str.2) #10
  br label %50

40:                                               ; preds = %30
  %41 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 5
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 4
  %44 = load i32, ptr %43, align 8
  %45 = call i32 @connect(i32 noundef %37, ptr noundef %42, i32 noundef %44)
  %46 = icmp eq i32 %45, -1
  br i1 %46, label %47, label %49

47:                                               ; preds = %40
  %48 = call i32 @close(i32 noundef %37)
  call void @perror(ptr noundef @.str.3) #10
  br label %50

49:                                               ; preds = %40
  br label %53

50:                                               ; preds = %47, %39
  %51 = getelementptr inbounds %struct.addrinfo, ptr %.02, i32 0, i32 7
  %52 = load ptr, ptr %51, align 8
  br label %28, !llvm.loop !6

53:                                               ; preds = %49, %28
  %.1 = phi i32 [ %37, %49 ], [ %.03, %28 ]
  %54 = icmp eq ptr %.02, null
  br i1 %54, label %55, label %58

55:                                               ; preds = %53
  %56 = load ptr, ptr @stderr, align 8
  %57 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %56, ptr noundef @.str.4)
  call void @exit(i32 noundef 1) #7
  unreachable

58:                                               ; preds = %53
  %59 = load ptr, ptr %4, align 8
  call void @freeaddrinfo(ptr noundef %59) #9
  br label %60

60:                                               ; preds = %77, %58
  %.0 = phi i32 [ 0, %58 ], [ %78, %77 ]
  %61 = icmp slt i32 %.0, 10
  br i1 %61, label %62, label %79

62:                                               ; preds = %60
  %63 = call i64 @send(i32 noundef %.1, ptr noundef @.str.5, i64 noundef 56, i32 noundef 0)
  br label %64

64:                                               ; preds = %69, %62
  %.01 = phi double [ 0.000000e+00, %62 ], [ %72, %69 ]
  %65 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %66 = call i64 @recv(i32 noundef %.1, ptr noundef %65, i64 noundef 1024, i32 noundef 0)
  %67 = trunc i64 %66 to i32
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %69, label %73

69:                                               ; preds = %64
  %70 = sitofp i32 %67 to double
  %71 = fdiv double %70, 1.024000e+03
  %72 = fadd double %.01, %71
  br label %64, !llvm.loop !8

73:                                               ; preds = %64
  %74 = fdiv double %.01, 5.000000e+00
  %75 = add nsw i32 %.0, 1
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %75, double noundef %74)
  br label %77

77:                                               ; preds = %73
  %78 = add nsw i32 %.0, 1
  br label %60, !llvm.loop !9

79:                                               ; preds = %60
  %80 = call i32 @close(i32 noundef %.1)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
