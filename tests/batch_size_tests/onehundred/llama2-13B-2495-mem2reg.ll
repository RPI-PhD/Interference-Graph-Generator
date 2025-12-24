; ModuleID = 'LLVM_IR/llama2-13B-2495.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca i32, align 4
  %6 = alloca [256 x i8], align 16
  store i32 16, ptr %5, align 4
  %7 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @perror(ptr noundef @.str) #8
  call void @exit(i32 noundef 1) #9
  unreachable

10:                                               ; preds = %2
  %11 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %11, align 4
  %12 = call zeroext i16 @htons(i16 noundef zeroext 8080) #10
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %12, ptr %13, align 2
  %14 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %15 = call i32 @inet_pton(i32 noundef 2, ptr noundef @.str.1, ptr noundef %14) #7
  %16 = call i32 @bind(i32 noundef %7, ptr noundef %3, i32 noundef 16) #7
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %10
  call void @perror(ptr noundef @.str.2) #8
  call void @exit(i32 noundef 1) #9
  unreachable

19:                                               ; preds = %10
  %20 = call i32 @listen(i32 noundef %7, i32 noundef 3) #7
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  call void @perror(ptr noundef @.str.3) #8
  call void @exit(i32 noundef 1) #9
  unreachable

23:                                               ; preds = %19
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %25 = call i32 @accept(i32 noundef %7, ptr noundef %4, ptr noundef %5)
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  call void @perror(ptr noundef @.str.5) #8
  call void @exit(i32 noundef 1) #9
  unreachable

28:                                               ; preds = %23
  %29 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %30 = call i64 @read(i32 noundef %25, ptr noundef %29, i64 noundef 256)
  %31 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %31)
  %33 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %34 = call i32 @strcmp(ptr noundef %33, ptr noundef @.str.7) #11
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %28
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %49

38:                                               ; preds = %28
  %39 = getelementptr inbounds [256 x i8], ptr %6, i64 0, i64 0
  %40 = call i32 @strcmp(ptr noundef %39, ptr noundef @.str.9) #11
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %38
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %44 = call i32 @close(i32 noundef %25)
  br label %48

45:                                               ; preds = %38
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %47 = call i32 @close(i32 noundef %25)
  br label %48

48:                                               ; preds = %45, %42
  br label %49

49:                                               ; preds = %48, %36
  %50 = call i32 @close(i32 noundef %7)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
