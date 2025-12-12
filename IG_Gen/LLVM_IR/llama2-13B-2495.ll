; ModuleID = 'DATASETv2/llama2-13B-2495.c'
source_filename = "DATASETv2/llama2-13B-2495.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [14 x i8] c"socket failed\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"bind failed\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"listen failed\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"Listening for incoming connections...\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"accept failed\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Received message from client: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"allow\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"Allowing message to pass through...\0A\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"block\00", align 1
@.str.10 = private unnamed_addr constant [44 x i8] c"Blocking message and closing connection...\0A\00", align 1
@.str.11 = private unnamed_addr constant [57 x i8] c"Message not allowed, blocking and closing connection...\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.sockaddr_in, align 4
  %10 = alloca %struct.sockaddr_in, align 4
  %11 = alloca i32, align 4
  %12 = alloca [256 x i8], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 16, ptr %11, align 4
  %13 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  store i32 %13, ptr %6, align 4
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  call void @perror(ptr noundef @.str) #8
  call void @exit(i32 noundef 1) #9
  unreachable

17:                                               ; preds = %2
  %18 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 0
  store i16 2, ptr %18, align 4
  %19 = call zeroext i16 @htons(i16 noundef zeroext 8080) #10
  %20 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 1
  store i16 %19, ptr %20, align 2
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 2
  %22 = call i32 @inet_pton(i32 noundef 2, ptr noundef @.str.1, ptr noundef %21) #7
  %23 = load i32, ptr %6, align 4
  %24 = call i32 @bind(i32 noundef %23, ptr noundef %9, i32 noundef 16) #7
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %17
  call void @perror(ptr noundef @.str.2) #8
  call void @exit(i32 noundef 1) #9
  unreachable

27:                                               ; preds = %17
  %28 = load i32, ptr %6, align 4
  %29 = call i32 @listen(i32 noundef %28, i32 noundef 3) #7
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %27
  call void @perror(ptr noundef @.str.3) #8
  call void @exit(i32 noundef 1) #9
  unreachable

32:                                               ; preds = %27
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %34 = load i32, ptr %6, align 4
  %35 = call i32 @accept(i32 noundef %34, ptr noundef %10, ptr noundef %11)
  store i32 %35, ptr %8, align 4
  %36 = load i32, ptr %8, align 4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %32
  call void @perror(ptr noundef @.str.5) #8
  call void @exit(i32 noundef 1) #9
  unreachable

39:                                               ; preds = %32
  %40 = load i32, ptr %8, align 4
  %41 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %42 = call i64 @read(i32 noundef %40, ptr noundef %41, i64 noundef 256)
  %43 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %43)
  %45 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %46 = call i32 @strcmp(ptr noundef %45, ptr noundef @.str.7) #11
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %39
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %63

50:                                               ; preds = %39
  %51 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %52 = call i32 @strcmp(ptr noundef %51, ptr noundef @.str.9) #11
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %58

54:                                               ; preds = %50
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %56 = load i32, ptr %8, align 4
  %57 = call i32 @close(i32 noundef %56)
  br label %62

58:                                               ; preds = %50
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %60 = load i32, ptr %8, align 4
  %61 = call i32 @close(i32 noundef %60)
  br label %62

62:                                               ; preds = %58, %54
  br label %63

63:                                               ; preds = %62, %48
  %64 = load i32, ptr %6, align 4
  %65 = call i32 @close(i32 noundef %64)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #4

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #5

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #5

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #6

declare i32 @close(i32 noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind willreturn memory(none) }
attributes #11 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
