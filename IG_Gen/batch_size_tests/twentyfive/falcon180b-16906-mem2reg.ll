; ModuleID = 'LLVM_IR/falcon180b-16906.ll'
source_filename = "DATASETv2/falcon180b-16906.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@num_clients = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [20 x i8] c"Client %d sent: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Server started on port %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Server is full\0A\00", align 1
@clients = dso_local global [10 x i32] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @handle_client(ptr noundef %0) #0 {
  %2 = alloca [1024 x i8], align 16
  %3 = load i32, ptr %0, align 4
  br label %4

4:                                                ; preds = %11, %1
  %5 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 1024, i1 false)
  %6 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %7 = call i64 @recv(i32 noundef %3, ptr noundef %6, i64 noundef 1024, i32 noundef 0)
  %8 = trunc i64 %7 to i32
  %9 = icmp sle i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %4
  br label %18

11:                                               ; preds = %4
  %12 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3, ptr noundef %12)
  %14 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %15 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %16 = call i64 @strlen(ptr noundef %15) #7
  %17 = call i64 @send(i32 noundef %3, ptr noundef %14, i64 noundef %16, i32 noundef 0)
  br label %4

18:                                               ; preds = %10
  %19 = call i32 @close(i32 noundef %3)
  call void @pthread_exit(ptr noundef null) #8
  unreachable
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

declare i32 @close(i32 noundef) #2

; Function Attrs: noreturn
declare void @pthread_exit(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.sockaddr_in, align 4
  %2 = alloca i64, align 8
  %3 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  call void @llvm.memset.p0.i64(ptr align 4 %1, i8 0, i64 16, i1 false)
  %4 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 0
  store i16 2, ptr %4, align 4
  %5 = call zeroext i16 @htons(i16 noundef zeroext 8080) #10
  %6 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 1
  store i16 %5, ptr %6, align 2
  %7 = call i32 @htonl(i32 noundef 0) #10
  %8 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 2
  %9 = getelementptr inbounds %struct.in_addr, ptr %8, i32 0, i32 0
  store i32 %7, ptr %9, align 4
  %10 = call i32 @bind(i32 noundef %3, ptr noundef %1, i32 noundef 16) #9
  %11 = call i32 @listen(i32 noundef %3, i32 noundef 10) #9
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef 8080)
  br label %13

13:                                               ; preds = %31, %0
  %14 = call i32 @accept(i32 noundef %3, ptr noundef null, ptr noundef null)
  %15 = load i32, ptr @num_clients, align 4
  %16 = icmp sge i32 %15, 10
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  %18 = call i64 @send(i32 noundef %14, ptr noundef @.str.2, i64 noundef 15, i32 noundef 0)
  %19 = call i32 @close(i32 noundef %14)
  br label %31

20:                                               ; preds = %13
  %21 = load i32, ptr @num_clients, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %22
  store i32 %14, ptr %23, align 4
  %24 = load i32, ptr @num_clients, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr @num_clients, align 4
  %26 = load i32, ptr @num_clients, align 4
  %27 = sub nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %28
  %30 = call i32 @pthread_create(ptr noundef %2, ptr noundef null, ptr noundef @handle_client, ptr noundef %29) #9
  br label %31

31:                                               ; preds = %20, %17
  br label %13
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #5

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #6

; Function Attrs: nounwind willreturn memory(none)
declare i32 @htonl(i32 noundef) #6

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #5

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #5

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { noreturn }
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
