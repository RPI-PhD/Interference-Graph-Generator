; ModuleID = 'LLVM_IR/gpt4o_mini-29997.ll'
source_filename = "DATASETv2/gpt4o_mini-29997.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [11 x i8] c"Client: %s\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Client disconnected.\0A\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Socket failed\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"Bind failed\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"Listen failed\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Server is listening on port %d...\0A\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"Accept failed\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"New client connected.\0A\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"Thread creation failed\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @handle_client(ptr noundef %0) #0 {
  %2 = alloca [1024 x i8], align 16
  %3 = load i32, ptr %0, align 4
  br label %4

4:                                                ; preds = %9, %1
  %5 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %6 = call i64 @recv(i32 noundef %3, ptr noundef %5, i64 noundef 1024, i32 noundef 0)
  %7 = trunc i64 %6 to i32
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %17

9:                                                ; preds = %4
  %10 = sext i32 %7 to i64
  %11 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 %10
  store i8 0, ptr %11, align 1
  %12 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %12)
  %14 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %15 = sext i32 %7 to i64
  %16 = call i64 @send(i32 noundef %3, ptr noundef %14, i64 noundef %15, i32 noundef 0)
  br label %4, !llvm.loop !6

17:                                               ; preds = %4
  %18 = call i32 @close(i32 noundef %3)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret ptr null
}

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.sockaddr_in, align 4
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca i32, align 4
  %5 = alloca [5 x i64], align 16
  store i32 16, ptr %4, align 4
  %6 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %0
  call void @perror(ptr noundef @.str.2) #7
  call void @exit(i32 noundef 1) #8
  unreachable

9:                                                ; preds = %0
  %10 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 0
  store i16 2, ptr %10, align 4
  %11 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 2
  %12 = getelementptr inbounds %struct.in_addr, ptr %11, i32 0, i32 0
  store i32 0, ptr %12, align 4
  %13 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %14 = getelementptr inbounds %struct.sockaddr_in, ptr %2, i32 0, i32 1
  store i16 %13, ptr %14, align 2
  %15 = call i32 @bind(i32 noundef %6, ptr noundef %2, i32 noundef 16) #6
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %9
  call void @perror(ptr noundef @.str.3) #7
  %18 = call i32 @close(i32 noundef %6)
  call void @exit(i32 noundef 1) #8
  unreachable

19:                                               ; preds = %9
  %20 = call i32 @listen(i32 noundef %6, i32 noundef 5) #6
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  call void @perror(ptr noundef @.str.4) #7
  %23 = call i32 @close(i32 noundef %6)
  call void @exit(i32 noundef 1) #8
  unreachable

24:                                               ; preds = %19
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 8080)
  br label %26

26:                                               ; preds = %53, %29, %24
  %.01 = phi i32 [ 0, %24 ], [ %.01, %29 ], [ %.1, %53 ]
  %27 = call i32 @accept(i32 noundef %6, ptr noundef %3, ptr noundef %4)
  store i32 %27, ptr %1, align 4
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  call void @perror(ptr noundef @.str.6) #7
  br label %26

30:                                               ; preds = %26
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %32 = add nsw i32 %.01, 1
  %33 = sext i32 %.01 to i64
  %34 = getelementptr inbounds [5 x i64], ptr %5, i64 0, i64 %33
  %35 = call i32 @pthread_create(ptr noundef %34, ptr noundef null, ptr noundef @handle_client, ptr noundef %1) #6
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %30
  call void @perror(ptr noundef @.str.8) #7
  %38 = load i32, ptr %1, align 4
  %39 = call i32 @close(i32 noundef %38)
  br label %40

40:                                               ; preds = %37, %30
  %41 = icmp sge i32 %32, 5
  br i1 %41, label %42, label %53

42:                                               ; preds = %40
  br label %43

43:                                               ; preds = %50, %42
  %.0 = phi i32 [ 0, %42 ], [ %51, %50 ]
  %44 = icmp slt i32 %.0, 5
  br i1 %44, label %45, label %52

45:                                               ; preds = %43
  %46 = sext i32 %.0 to i64
  %47 = getelementptr inbounds [5 x i64], ptr %5, i64 0, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = call i32 @pthread_join(i64 noundef %48, ptr noundef null)
  br label %50

50:                                               ; preds = %45
  %51 = add nsw i32 %.0, 1
  br label %43, !llvm.loop !8

52:                                               ; preds = %43
  br label %53

53:                                               ; preds = %52, %40
  %.1 = phi i32 [ 0, %52 ], [ %32, %40 ]
  br label %26
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #2

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @pthread_join(i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind willreturn memory(none) }

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
!8 = distinct !{!8, !7}
