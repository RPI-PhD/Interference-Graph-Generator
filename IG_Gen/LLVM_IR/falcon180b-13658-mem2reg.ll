; ModuleID = 'LLVM_IR/falcon180b-13658.ll'
source_filename = "DATASETv2/falcon180b-13658.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [17 x i8] c"Enter hostname: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"Enter port: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"Enter timeout in seconds: \00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"Error creating socket: %s\0A\00", align 1
@.str.6 = private unnamed_addr constant [31 x i8] c"Error connecting to %s:%d: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"PING\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"Error sending PING: %s\0A\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"Error receiving response: %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [14 x i8] c"Response: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [64 x i8], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca [1024 x i8], align 16
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = getelementptr inbounds [64 x i8], ptr %1, i64 0, i64 0
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %2)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %3)
  %13 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %20

15:                                               ; preds = %0
  %16 = call ptr @__errno_location() #7
  %17 = load i32, ptr %16, align 4
  %18 = call ptr @strerror(i32 noundef %17) #6
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %18)
  call void @exit(i32 noundef 1) #8
  unreachable

20:                                               ; preds = %0
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %21, align 4
  %22 = load i32, ptr %2, align 4
  %23 = trunc i32 %22 to i16
  %24 = call zeroext i16 @htons(i16 noundef zeroext %23) #7
  %25 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 1
  store i16 %24, ptr %25, align 2
  %26 = getelementptr inbounds [64 x i8], ptr %1, i64 0, i64 0
  %27 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %28 = call i32 @inet_pton(i32 noundef 2, ptr noundef %26, ptr noundef %27) #6
  %29 = call i32 @connect(i32 noundef %13, ptr noundef %4, i32 noundef 16)
  %30 = icmp eq i32 %29, -1
  br i1 %30, label %31, label %38

31:                                               ; preds = %20
  %32 = getelementptr inbounds [64 x i8], ptr %1, i64 0, i64 0
  %33 = load i32, ptr %2, align 4
  %34 = call ptr @__errno_location() #7
  %35 = load i32, ptr %34, align 4
  %36 = call ptr @strerror(i32 noundef %35) #6
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %32, i32 noundef %33, ptr noundef %36)
  call void @exit(i32 noundef 1) #8
  unreachable

38:                                               ; preds = %20
  %39 = call i64 @send(i32 noundef %13, ptr noundef @.str.7, i64 noundef 4, i32 noundef 0)
  %40 = trunc i64 %39 to i32
  %41 = icmp eq i32 %40, -1
  br i1 %41, label %42, label %47

42:                                               ; preds = %38
  %43 = call ptr @__errno_location() #7
  %44 = load i32, ptr %43, align 4
  %45 = call ptr @strerror(i32 noundef %44) #6
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %45)
  call void @exit(i32 noundef 1) #8
  unreachable

47:                                               ; preds = %38
  %48 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %48, i8 0, i64 1024, i1 false)
  %49 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %50 = call i64 @recv(i32 noundef %13, ptr noundef %49, i64 noundef 1024, i32 noundef 0)
  %51 = trunc i64 %50 to i32
  %52 = icmp eq i32 %51, -1
  br i1 %52, label %53, label %58

53:                                               ; preds = %47
  %54 = call ptr @__errno_location() #7
  %55 = load i32, ptr %54, align 4
  %56 = call ptr @strerror(i32 noundef %55) #6
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %56)
  call void @exit(i32 noundef 1) #8
  unreachable

58:                                               ; preds = %47
  %59 = call i32 @close(i32 noundef %13)
  %60 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %60)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: nounwind
declare ptr @strerror(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #3

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
