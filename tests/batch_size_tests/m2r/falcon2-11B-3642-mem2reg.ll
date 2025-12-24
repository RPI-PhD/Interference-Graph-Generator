; ModuleID = 'LLVM_IR/falcon2-11B-3642.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.sockaddr_in, align 4
  %2 = alloca %struct.sockaddr_in, align 4
  %3 = alloca i32, align 4
  %4 = alloca [256 x i8], align 16
  store i32 1, ptr %3, align 4
  %5 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  call void @perror(ptr noundef @.str) #7
  call void @exit(i32 noundef 1) #8
  unreachable

8:                                                ; preds = %0
  %9 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 0
  store i16 2, ptr %9, align 4
  %10 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 2
  %11 = getelementptr inbounds %struct.in_addr, ptr %10, i32 0, i32 0
  store i32 0, ptr %11, align 4
  %12 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 1
  store i16 %12, ptr %13, align 2
  %14 = call i32 @bind(i32 noundef %5, ptr noundef %1, i32 noundef 16) #6
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  call void @perror(ptr noundef @.str.1) #7
  call void @exit(i32 noundef 1) #8
  unreachable

17:                                               ; preds = %8
  %18 = call i32 @listen(i32 noundef %5, i32 noundef 3) #6
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @perror(ptr noundef @.str.2) #7
  call void @exit(i32 noundef 1) #8
  unreachable

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %39, %21
  %23 = call i32 @accept(i32 noundef %5, ptr noundef %2, ptr noundef %3)
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  call void @perror(ptr noundef @.str.3) #7
  call void @exit(i32 noundef 1) #8
  unreachable

26:                                               ; preds = %22
  br label %27

27:                                               ; preds = %35, %26
  %.0 = phi i32 [ 0, %26 ], [ %32, %35 ]
  %28 = icmp sgt i32 %.0, 0
  br i1 %28, label %29, label %39

29:                                               ; preds = %27
  %30 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %31 = call i64 @recv(i32 noundef %23, ptr noundef %30, i64 noundef 256, i32 noundef 0)
  %32 = trunc i64 %31 to i32
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %29
  call void @perror(ptr noundef @.str.4) #7
  call void @exit(i32 noundef 1) #8
  unreachable

35:                                               ; preds = %29
  %36 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %37 = sext i32 %32 to i64
  %38 = call i64 @send(i32 noundef %23, ptr noundef %36, i64 noundef %37, i32 noundef 0)
  br label %27, !llvm.loop !6

39:                                               ; preds = %27
  %40 = call i32 @close(i32 noundef %23)
  br label %22
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
