; ModuleID = 'LLVM_IR/falcon180b-41467.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_usage(ptr noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %0)
  call void @exit(i32 noundef 1) #7
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca i32, align 4
  %5 = icmp ne i32 %0, 4
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  call void @print_usage(ptr noundef %8)
  br label %9

9:                                                ; preds = %6, %2
  %10 = getelementptr inbounds ptr, ptr %1, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds ptr, ptr %1, i64 2
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @atoi(ptr noundef %13) #8
  %15 = getelementptr inbounds ptr, ptr %1, i64 3
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #8
  %18 = icmp sgt i32 %14, %17
  br i1 %18, label %19, label %21

19:                                               ; preds = %9
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %14, i32 noundef %17)
  call void @exit(i32 noundef 1) #7
  unreachable

21:                                               ; preds = %9
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %11, i32 noundef %14, i32 noundef %17)
  %23 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %25, label %30

25:                                               ; preds = %21
  %26 = call ptr @__errno_location() #10
  %27 = load i32, ptr %26, align 4
  %28 = call ptr @strerror(i32 noundef %27) #9
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %28)
  call void @exit(i32 noundef 1) #7
  unreachable

30:                                               ; preds = %21
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 16, i1 false)
  %31 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %31, align 4
  %32 = trunc i32 %14 to i16
  %33 = call zeroext i16 @htons(i16 noundef zeroext %32) #10
  %34 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %33, ptr %34, align 2
  %35 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %36 = call i32 @inet_pton(i32 noundef 2, ptr noundef %11, ptr noundef %35) #9
  store i32 1, ptr %4, align 4
  %37 = call i32 @setsockopt(i32 noundef %23, i32 noundef 1, i32 noundef 2, ptr noundef %4, i32 noundef 4) #9
  br label %38

38:                                               ; preds = %69, %30
  %.0 = phi i32 [ %14, %30 ], [ %70, %69 ]
  %39 = icmp sle i32 %.0, %17
  br i1 %39, label %40, label %71

40:                                               ; preds = %38
  %41 = trunc i32 %.0 to i16
  %42 = call zeroext i16 @htons(i16 noundef zeroext %41) #10
  %43 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %42, ptr %43, align 2
  %44 = call i32 @connect(i32 noundef %23, ptr noundef %3, i32 noundef 16)
  %45 = icmp eq i32 %44, -1
  br i1 %45, label %46, label %65

46:                                               ; preds = %40
  %47 = call ptr @__errno_location() #10
  %48 = load i32, ptr %47, align 4
  %49 = icmp eq i32 %48, 111
  br i1 %49, label %50, label %52

50:                                               ; preds = %46
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %.0)
  br label %64

52:                                               ; preds = %46
  %53 = call ptr @__errno_location() #10
  %54 = load i32, ptr %53, align 4
  %55 = icmp eq i32 %54, 104
  br i1 %55, label %56, label %58

56:                                               ; preds = %52
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.0)
  br label %63

58:                                               ; preds = %52
  %59 = call ptr @__errno_location() #10
  %60 = load i32, ptr %59, align 4
  %61 = call ptr @strerror(i32 noundef %60) #9
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %.0, ptr noundef %61)
  br label %63

63:                                               ; preds = %58, %56
  br label %64

64:                                               ; preds = %63, %50
  br label %68

65:                                               ; preds = %40
  %66 = call i32 @close(i32 noundef %23)
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %.0)
  br label %68

68:                                               ; preds = %65, %64
  br label %69

69:                                               ; preds = %68
  %70 = add nsw i32 %.0, 1
  br label %38, !llvm.loop !6

71:                                               ; preds = %38
  %72 = call i32 @close(i32 noundef %23)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
