; ModuleID = 'DATASETv2/gpt35-65650.c'
source_filename = "DATASETv2/gpt35-65650.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [13 x i8] c"\0AExiting...\0A\00", align 1
@.str.1 = private unnamed_addr constant [48 x i8] c"Usage: %s <IP address> <start port> <end port>\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Invalid IP address\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"socket\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Port %d is open\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Scan complete\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @handle_sigint(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 0) #8
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
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %13 = call ptr @signal(i32 noundef 2, ptr noundef @handle_sigint) #9
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 3
  br i1 %15, label %16, label %21

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 0
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %19)
  store i32 1, ptr %3, align 4
  br label %73

21:                                               ; preds = %2
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 1
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 2
  %27 = load ptr, ptr %26, align 8
  %28 = call i32 @atoi(ptr noundef %27) #10
  store i32 %28, ptr %7, align 4
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds ptr, ptr %29, i64 3
  %31 = load ptr, ptr %30, align 8
  %32 = call i32 @atoi(ptr noundef %31) #10
  store i32 %32, ptr %8, align 4
  store i32 16, ptr %11, align 4
  %33 = load i32, ptr %11, align 4
  %34 = zext i32 %33 to i64
  call void @llvm.memset.p0.i64(ptr align 4 %10, i8 0, i64 %34, i1 false)
  %35 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 0
  store i16 2, ptr %35, align 4
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 2
  %38 = call i32 @inet_pton(i32 noundef 2, ptr noundef %36, ptr noundef %37) #9
  %39 = icmp ne i32 %38, 1
  br i1 %39, label %40, label %42

40:                                               ; preds = %21
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 1, ptr %3, align 4
  br label %73

42:                                               ; preds = %21
  %43 = load i32, ptr %7, align 4
  store i32 %43, ptr %9, align 4
  br label %44

44:                                               ; preds = %68, %42
  %45 = load i32, ptr %9, align 4
  %46 = load i32, ptr %8, align 4
  %47 = icmp sle i32 %45, %46
  br i1 %47, label %48, label %71

48:                                               ; preds = %44
  %49 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  store i32 %49, ptr %12, align 4
  %50 = load i32, ptr %12, align 4
  %51 = icmp slt i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  call void @perror(ptr noundef @.str.3) #11
  store i32 1, ptr %3, align 4
  br label %73

53:                                               ; preds = %48
  %54 = load i32, ptr %9, align 4
  %55 = trunc i32 %54 to i16
  %56 = call zeroext i16 @htons(i16 noundef zeroext %55) #12
  %57 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 1
  store i16 %56, ptr %57, align 2
  %58 = load i32, ptr %12, align 4
  %59 = load i32, ptr %11, align 4
  %60 = call i32 @connect(i32 noundef %58, ptr noundef %10, i32 noundef %59)
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %65

62:                                               ; preds = %53
  %63 = load i32, ptr %9, align 4
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %63)
  br label %65

65:                                               ; preds = %62, %53
  %66 = load i32, ptr %12, align 4
  %67 = call i32 @close(i32 noundef %66)
  br label %68

68:                                               ; preds = %65
  %69 = load i32, ptr %9, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %9, align 4
  br label %44, !llvm.loop !6

71:                                               ; preds = %44
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %3, align 4
  br label %73

73:                                               ; preds = %71, %52, %40, %16
  %74 = load i32, ptr %3, align 4
  ret i32 %74
}

; Function Attrs: nounwind
declare ptr @signal(i32 noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #6

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #7

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { cold }
attributes #12 = { nounwind willreturn memory(none) }

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
