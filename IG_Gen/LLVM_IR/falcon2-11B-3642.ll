; ModuleID = 'DATASETv2/falcon2-11B-3642.c'
source_filename = "DATASETv2/falcon2-11B-3642.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [13 x i8] c"socket error\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"bind error\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"listen error\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"accept error\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"recv error\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = alloca i32, align 4
  %7 = alloca [256 x i8], align 16
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 1, ptr %6, align 4
  %9 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  call void @perror(ptr noundef @.str) #7
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
  br i1 %21, label %22, label %23

22:                                               ; preds = %13
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

23:                                               ; preds = %13
  %24 = load i32, ptr %2, align 4
  %25 = call i32 @listen(i32 noundef %24, i32 noundef 3) #6
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  call void @perror(ptr noundef @.str.2) #7
  call void @exit(i32 noundef 1) #8
  unreachable

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %28, %53
  %30 = load i32, ptr %2, align 4
  %31 = call i32 @accept(i32 noundef %30, ptr noundef %5, ptr noundef %6)
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %3, align 4
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %29
  call void @perror(ptr noundef @.str.3) #7
  call void @exit(i32 noundef 1) #8
  unreachable

35:                                               ; preds = %29
  store i32 0, ptr %8, align 4
  br label %36

36:                                               ; preds = %47, %35
  %37 = load i32, ptr %8, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %53

39:                                               ; preds = %36
  %40 = load i32, ptr %3, align 4
  %41 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  %42 = call i64 @recv(i32 noundef %40, ptr noundef %41, i64 noundef 256, i32 noundef 0)
  %43 = trunc i64 %42 to i32
  store i32 %43, ptr %8, align 4
  %44 = load i32, ptr %8, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %47

46:                                               ; preds = %39
  call void @perror(ptr noundef @.str.4) #7
  call void @exit(i32 noundef 1) #8
  unreachable

47:                                               ; preds = %39
  %48 = load i32, ptr %3, align 4
  %49 = getelementptr inbounds [256 x i8], ptr %7, i64 0, i64 0
  %50 = load i32, ptr %8, align 4
  %51 = sext i32 %50 to i64
  %52 = call i64 @send(i32 noundef %48, ptr noundef %49, i64 noundef %51, i32 noundef 0)
  br label %36, !llvm.loop !6

53:                                               ; preds = %36
  %54 = load i32, ptr %3, align 4
  %55 = call i32 @close(i32 noundef %54)
  br label %29
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
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #1

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #5

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #5

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #5

declare i32 @close(i32 noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
