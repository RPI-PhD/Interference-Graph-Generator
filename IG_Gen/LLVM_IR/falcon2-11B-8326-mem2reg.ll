; ModuleID = 'LLVM_IR/falcon2-11B-8326.ll'
source_filename = "DATASETv2/falcon2-11B-8326.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [14 x i8] c"socket failed\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"bind failed\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"listen failed\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"accept failed\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"Received\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.sockaddr_in, align 4
  %2 = alloca %struct.sockaddr_in, align 4
  %3 = alloca i32, align 4
  %4 = alloca [1024 x i8], align 16
  store i32 16, ptr %3, align 4
  %5 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  call void @perror(ptr noundef @.str) #7
  br label %41

8:                                                ; preds = %0
  %9 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 0
  store i16 2, ptr %9, align 4
  %10 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 2
  %11 = getelementptr inbounds %struct.in_addr, ptr %10, i32 0, i32 0
  store i32 0, ptr %11, align 4
  %12 = call zeroext i16 @htons(i16 noundef zeroext 8080) #8
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 1
  store i16 %12, ptr %13, align 2
  %14 = call i32 @bind(i32 noundef %5, ptr noundef %1, i32 noundef 16) #6
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %8
  call void @perror(ptr noundef @.str.1) #7
  br label %41

17:                                               ; preds = %8
  %18 = call i32 @listen(i32 noundef %5, i32 noundef 5) #6
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @perror(ptr noundef @.str.2) #7
  br label %41

21:                                               ; preds = %17
  br label %22

22:                                               ; preds = %39, %21
  %23 = call i32 @accept(i32 noundef %5, ptr noundef %2, ptr noundef %3)
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  call void @perror(ptr noundef @.str.3) #7
  br label %41

26:                                               ; preds = %22
  br label %27

27:                                               ; preds = %35, %26
  %28 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %28, i8 0, i64 1024, i1 false)
  %29 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %30 = call i64 @recv(i32 noundef %23, ptr noundef %29, i64 noundef 1024, i32 noundef 0)
  %31 = trunc i64 %30 to i32
  %32 = icmp sle i32 %31, 0
  br i1 %32, label %33, label %35

33:                                               ; preds = %27
  %34 = call i32 @close(i32 noundef %23)
  br label %39

35:                                               ; preds = %27
  %36 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %36)
  %38 = call i64 @send(i32 noundef %23, ptr noundef @.str.5, i64 noundef 9, i32 noundef 0)
  br label %27

39:                                               ; preds = %33
  %40 = call i32 @close(i32 noundef %23)
  br label %22

41:                                               ; preds = %25, %20, %16, %7
  ret i32 1
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #3

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #1

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #4

declare i32 @close(i32 noundef) #4

declare i32 @printf(ptr noundef, ...) #4

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
