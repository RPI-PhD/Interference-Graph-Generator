; ModuleID = 'DATASETv2/falcon180b-16906.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @handle_client(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca [1024 x i8], align 16
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %3, align 4
  br label %8

8:                                                ; preds = %1, %17
  %9 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %9, i8 0, i64 1024, i1 false)
  %10 = load i32, ptr %3, align 4
  %11 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %12 = call i64 @recv(i32 noundef %10, ptr noundef %11, i64 noundef 1024, i32 noundef 0)
  %13 = trunc i64 %12 to i32
  store i32 %13, ptr %5, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp sle i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  br label %26

17:                                               ; preds = %8
  %18 = load i32, ptr %3, align 4
  %19 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18, ptr noundef %19)
  %21 = load i32, ptr %3, align 4
  %22 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %23 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %24 = call i64 @strlen(ptr noundef %23) #7
  %25 = call i64 @send(i32 noundef %21, ptr noundef %22, i64 noundef %24, i32 noundef 0)
  br label %8

26:                                               ; preds = %16
  %27 = load i32, ptr %3, align 4
  %28 = call i32 @close(i32 noundef %27)
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %6 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  store i32 %6, ptr %2, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 16, i1 false)
  %7 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %7, align 4
  %8 = call zeroext i16 @htons(i16 noundef zeroext 8080) #10
  %9 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %8, ptr %9, align 2
  %10 = call i32 @htonl(i32 noundef 0) #10
  %11 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %12 = getelementptr inbounds %struct.in_addr, ptr %11, i32 0, i32 0
  store i32 %10, ptr %12, align 4
  %13 = load i32, ptr %2, align 4
  %14 = call i32 @bind(i32 noundef %13, ptr noundef %3, i32 noundef 16) #9
  %15 = load i32, ptr %2, align 4
  %16 = call i32 @listen(i32 noundef %15, i32 noundef 10) #9
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef 8080)
  br label %18

18:                                               ; preds = %0, %40
  %19 = load i32, ptr %2, align 4
  %20 = call i32 @accept(i32 noundef %19, ptr noundef null, ptr noundef null)
  store i32 %20, ptr %4, align 4
  %21 = load i32, ptr @num_clients, align 4
  %22 = icmp sge i32 %21, 10
  br i1 %22, label %23, label %28

23:                                               ; preds = %18
  %24 = load i32, ptr %4, align 4
  %25 = call i64 @send(i32 noundef %24, ptr noundef @.str.2, i64 noundef 15, i32 noundef 0)
  %26 = load i32, ptr %4, align 4
  %27 = call i32 @close(i32 noundef %26)
  br label %40

28:                                               ; preds = %18
  %29 = load i32, ptr %4, align 4
  %30 = load i32, ptr @num_clients, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %31
  store i32 %29, ptr %32, align 4
  %33 = load i32, ptr @num_clients, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr @num_clients, align 4
  %35 = load i32, ptr @num_clients, align 4
  %36 = sub nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %37
  %39 = call i32 @pthread_create(ptr noundef %5, ptr noundef null, ptr noundef @handle_client, ptr noundef %38) #9
  br label %40

40:                                               ; preds = %28, %23
  br label %18
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
