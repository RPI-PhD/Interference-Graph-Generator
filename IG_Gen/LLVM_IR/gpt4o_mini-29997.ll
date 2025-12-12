; ModuleID = 'DATASETv2/gpt4o_mini-29997.c'
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

8:                                                ; preds = %14, %1
  %9 = load i32, ptr %3, align 4
  %10 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %11 = call i64 @recv(i32 noundef %9, ptr noundef %10, i64 noundef 1024, i32 noundef 0)
  %12 = trunc i64 %11 to i32
  store i32 %12, ptr %5, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %25

14:                                               ; preds = %8
  %15 = load i32, ptr %5, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 %16
  store i8 0, ptr %17, align 1
  %18 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %18)
  %20 = load i32, ptr %3, align 4
  %21 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %22 = load i32, ptr %5, align 4
  %23 = sext i32 %22 to i64
  %24 = call i64 @send(i32 noundef %20, ptr noundef %21, i64 noundef %23, i32 noundef 0)
  br label %8, !llvm.loop !6

25:                                               ; preds = %8
  %26 = load i32, ptr %3, align 4
  %27 = call i32 @close(i32 noundef %26)
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret ptr null
}

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = alloca i32, align 4
  %7 = alloca [5 x i64], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 16, ptr %6, align 4
  store i32 0, ptr %8, align 4
  %10 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  store i32 %10, ptr %2, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  call void @perror(ptr noundef @.str.2) #7
  call void @exit(i32 noundef 1) #8
  unreachable

13:                                               ; preds = %0
  %14 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %14, align 4
  %15 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %16 = getelementptr inbounds %struct.in_addr, ptr %15, i32 0, i32 0
  store i32 0, ptr %16, align 4
  %17 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %18 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 1
  store i16 %17, ptr %18, align 2
  %19 = load i32, ptr %2, align 4
  %20 = call i32 @bind(i32 noundef %19, ptr noundef %4, i32 noundef 16) #6
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %13
  call void @perror(ptr noundef @.str.3) #7
  %23 = load i32, ptr %2, align 4
  %24 = call i32 @close(i32 noundef %23)
  call void @exit(i32 noundef 1) #8
  unreachable

25:                                               ; preds = %13
  %26 = load i32, ptr %2, align 4
  %27 = call i32 @listen(i32 noundef %26, i32 noundef 5) #6
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %25
  call void @perror(ptr noundef @.str.4) #7
  %30 = load i32, ptr %2, align 4
  %31 = call i32 @close(i32 noundef %30)
  call void @exit(i32 noundef 1) #8
  unreachable

32:                                               ; preds = %25
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef 8080)
  br label %34

34:                                               ; preds = %32, %38, %67
  %35 = load i32, ptr %2, align 4
  %36 = call i32 @accept(i32 noundef %35, ptr noundef %5, ptr noundef %6)
  store i32 %36, ptr %3, align 4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %34
  call void @perror(ptr noundef @.str.6) #7
  br label %34

39:                                               ; preds = %34
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %8, align 4
  %43 = sext i32 %41 to i64
  %44 = getelementptr inbounds [5 x i64], ptr %7, i64 0, i64 %43
  %45 = call i32 @pthread_create(ptr noundef %44, ptr noundef null, ptr noundef @handle_client, ptr noundef %3) #6
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %50

47:                                               ; preds = %39
  call void @perror(ptr noundef @.str.8) #7
  %48 = load i32, ptr %3, align 4
  %49 = call i32 @close(i32 noundef %48)
  br label %50

50:                                               ; preds = %47, %39
  %51 = load i32, ptr %8, align 4
  %52 = icmp sge i32 %51, 5
  br i1 %52, label %53, label %67

53:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  br label %54

54:                                               ; preds = %63, %53
  %55 = load i32, ptr %9, align 4
  %56 = icmp slt i32 %55, 5
  br i1 %56, label %57, label %66

57:                                               ; preds = %54
  %58 = load i32, ptr %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [5 x i64], ptr %7, i64 0, i64 %59
  %61 = load i64, ptr %60, align 8
  %62 = call i32 @pthread_join(i64 noundef %61, ptr noundef null)
  br label %63

63:                                               ; preds = %57
  %64 = load i32, ptr %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %9, align 4
  br label %54, !llvm.loop !8

66:                                               ; preds = %54
  store i32 0, ptr %8, align 4
  br label %67

67:                                               ; preds = %66, %50
  br label %34
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
