; ModuleID = 'DATASETv2/falcon180b-13658.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.sockaddr_in, align 4
  %7 = alloca [1024 x i8], align 16
  %8 = alloca [1024 x i8], align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %12 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %12)
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %15 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %3)
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %17 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %4)
  %18 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  store i32 %18, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %26

21:                                               ; preds = %0
  %22 = call ptr @__errno_location() #7
  %23 = load i32, ptr %22, align 4
  %24 = call ptr @strerror(i32 noundef %23) #6
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %24)
  call void @exit(i32 noundef 1) #8
  unreachable

26:                                               ; preds = %0
  %27 = getelementptr inbounds %struct.sockaddr_in, ptr %6, i32 0, i32 0
  store i16 2, ptr %27, align 4
  %28 = load i32, ptr %3, align 4
  %29 = trunc i32 %28 to i16
  %30 = call zeroext i16 @htons(i16 noundef zeroext %29) #7
  %31 = getelementptr inbounds %struct.sockaddr_in, ptr %6, i32 0, i32 1
  store i16 %30, ptr %31, align 2
  %32 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 0
  %33 = getelementptr inbounds %struct.sockaddr_in, ptr %6, i32 0, i32 2
  %34 = call i32 @inet_pton(i32 noundef 2, ptr noundef %32, ptr noundef %33) #6
  %35 = load i32, ptr %5, align 4
  %36 = call i32 @connect(i32 noundef %35, ptr noundef %6, i32 noundef 16)
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %38, label %45

38:                                               ; preds = %26
  %39 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 0
  %40 = load i32, ptr %3, align 4
  %41 = call ptr @__errno_location() #7
  %42 = load i32, ptr %41, align 4
  %43 = call ptr @strerror(i32 noundef %42) #6
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %39, i32 noundef %40, ptr noundef %43)
  call void @exit(i32 noundef 1) #8
  unreachable

45:                                               ; preds = %26
  %46 = load i32, ptr %5, align 4
  %47 = call i64 @send(i32 noundef %46, ptr noundef @.str.7, i64 noundef 4, i32 noundef 0)
  %48 = trunc i64 %47 to i32
  store i32 %48, ptr %9, align 4
  %49 = load i32, ptr %9, align 4
  %50 = icmp eq i32 %49, -1
  br i1 %50, label %51, label %56

51:                                               ; preds = %45
  %52 = call ptr @__errno_location() #7
  %53 = load i32, ptr %52, align 4
  %54 = call ptr @strerror(i32 noundef %53) #6
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %54)
  call void @exit(i32 noundef 1) #8
  unreachable

56:                                               ; preds = %45
  %57 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %57, i8 0, i64 1024, i1 false)
  %58 = load i32, ptr %5, align 4
  %59 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %60 = call i64 @recv(i32 noundef %58, ptr noundef %59, i64 noundef 1024, i32 noundef 0)
  %61 = trunc i64 %60 to i32
  store i32 %61, ptr %10, align 4
  %62 = load i32, ptr %10, align 4
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %69

64:                                               ; preds = %56
  %65 = call ptr @__errno_location() #7
  %66 = load i32, ptr %65, align 4
  %67 = call ptr @strerror(i32 noundef %66) #6
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %67)
  call void @exit(i32 noundef 1) #8
  unreachable

69:                                               ; preds = %56
  %70 = load i32, ptr %5, align 4
  %71 = call i32 @close(i32 noundef %70)
  %72 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %73 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %72)
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
