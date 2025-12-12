; ModuleID = 'DATASETv2/falcon180b-49570.c'
source_filename = "DATASETv2/falcon180b-49570.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@num_clients = dso_local global i32 0, align 4
@clients = dso_local global [10 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [30 x i8] c"Server is running on port %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [41 x i8] c"Server is full. Please try again later.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @handle_client(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca [1024 x i8], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %3, align 4
  br label %9

9:                                                ; preds = %1, %43
  %10 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %10, i8 0, i64 1024, i1 false)
  %11 = load i32, ptr %3, align 4
  %12 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %13 = call i64 @recv(i32 noundef %11, ptr noundef %12, i64 noundef 1024, i32 noundef 0)
  %14 = trunc i64 %13 to i32
  store i32 %14, ptr %5, align 4
  %15 = load i32, ptr %5, align 4
  %16 = icmp sle i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %9
  br label %44

18:                                               ; preds = %9
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %40, %18
  %20 = load i32, ptr %6, align 4
  %21 = load i32, ptr @num_clients, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %43

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %3, align 4
  %29 = icmp ne i32 %27, %28
  br i1 %29, label %30, label %39

30:                                               ; preds = %23
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %36 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %37 = call i64 @strlen(ptr noundef %36) #7
  %38 = call i64 @send(i32 noundef %34, ptr noundef %35, i64 noundef %37, i32 noundef 0)
  br label %39

39:                                               ; preds = %30, %23
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %6, align 4
  br label %19, !llvm.loop !6

43:                                               ; preds = %19
  br label %9

44:                                               ; preds = %17
  %45 = load i32, ptr %3, align 4
  %46 = call i32 @close(i32 noundef %45)
  call void @pthread_exit(ptr noundef null) #8
  unreachable
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

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
  %10 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %11 = getelementptr inbounds %struct.in_addr, ptr %10, i32 0, i32 0
  store i32 0, ptr %11, align 4
  %12 = load i32, ptr %2, align 4
  %13 = call i32 @bind(i32 noundef %12, ptr noundef %3, i32 noundef 16) #9
  %14 = load i32, ptr %2, align 4
  %15 = call i32 @listen(i32 noundef %14, i32 noundef 10) #9
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 8080)
  br label %17

17:                                               ; preds = %0, %22, %27
  %18 = load i32, ptr %2, align 4
  %19 = call i32 @accept(i32 noundef %18, ptr noundef null, ptr noundef null)
  store i32 %19, ptr %4, align 4
  %20 = load i32, ptr @num_clients, align 4
  %21 = icmp sge i32 %20, 10
  br i1 %21, label %22, label %27

22:                                               ; preds = %17
  %23 = load i32, ptr %4, align 4
  %24 = call i64 @send(i32 noundef %23, ptr noundef @.str.1, i64 noundef 40, i32 noundef 0)
  %25 = load i32, ptr %4, align 4
  %26 = call i32 @close(i32 noundef %25)
  br label %17

27:                                               ; preds = %17
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr @num_clients, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x i32], ptr @clients, i64 0, i64 %30
  store i32 %28, ptr %31, align 4
  %32 = load i32, ptr @num_clients, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr @num_clients, align 4
  %34 = call i32 @pthread_create(ptr noundef %5, ptr noundef null, ptr noundef @handle_client, ptr noundef %4) #9
  br label %17
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #5

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #6

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #5

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #5

declare i32 @printf(ptr noundef, ...) #2

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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
