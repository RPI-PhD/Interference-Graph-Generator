; ModuleID = 'LLVM_IR/gpt35-65650.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @handle_sigint(i32 noundef %0) #0 {
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 0) #8
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = call ptr @signal(i32 noundef 2, ptr noundef @handle_sigint) #9
  %5 = icmp slt i32 %0, 3
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %8)
  br label %47

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds ptr, ptr %1, i64 2
  %14 = load ptr, ptr %13, align 8
  %15 = call i32 @atoi(ptr noundef %14) #10
  %16 = getelementptr inbounds ptr, ptr %1, i64 3
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #10
  %19 = zext i32 16 to i64
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 %19, i1 false)
  %20 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %20, align 4
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %22 = call i32 @inet_pton(i32 noundef 2, ptr noundef %12, ptr noundef %21) #9
  %23 = icmp ne i32 %22, 1
  br i1 %23, label %24, label %26

24:                                               ; preds = %10
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %47

26:                                               ; preds = %10
  br label %27

27:                                               ; preds = %43, %26
  %.01 = phi i32 [ %15, %26 ], [ %44, %43 ]
  %28 = icmp sle i32 %.01, %18
  br i1 %28, label %29, label %45

29:                                               ; preds = %27
  %30 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  call void @perror(ptr noundef @.str.3) #11
  br label %47

33:                                               ; preds = %29
  %34 = trunc i32 %.01 to i16
  %35 = call zeroext i16 @htons(i16 noundef zeroext %34) #12
  %36 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %35, ptr %36, align 2
  %37 = call i32 @connect(i32 noundef %30, ptr noundef %3, i32 noundef 16)
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %41

39:                                               ; preds = %33
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %.01)
  br label %41

41:                                               ; preds = %39, %33
  %42 = call i32 @close(i32 noundef %30)
  br label %43

43:                                               ; preds = %41
  %44 = add nsw i32 %.01, 1
  br label %27, !llvm.loop !6

45:                                               ; preds = %27
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %47

47:                                               ; preds = %45, %32, %24, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %24 ], [ 1, %32 ], [ 0, %45 ]
  ret i32 %.0
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
