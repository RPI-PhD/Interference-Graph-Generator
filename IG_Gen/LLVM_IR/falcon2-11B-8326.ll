; ModuleID = 'DATASETv2/falcon2-11B-8326.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1024 x i8], align 16
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 16, ptr %6, align 4
  %9 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = icmp eq i32 %10, -1
  br i1 %11, label %12, label %13

12:                                               ; preds = %0
  call void @perror(ptr noundef @.str) #7
  store i32 1, ptr %1, align 4
  br label %55

13:                                               ; preds = %0
  %14 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %14, align 4
  %15 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %16 = getelementptr inbounds %struct.in_addr, ptr %15, i32 0, i32 0
  store i32 0, ptr %16, align 4
  %17 = call zeroext i16 @htons(i16 noundef zeroext 8080) #8
  %18 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 1
  store i16 %17, ptr %18, align 2
  %19 = load i32, ptr %2, align 4
  %20 = call i32 @bind(i32 noundef %19, ptr noundef %4, i32 noundef 16) #6
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %13
  call void @perror(ptr noundef @.str.1) #7
  store i32 1, ptr %1, align 4
  br label %55

23:                                               ; preds = %13
  %24 = load i32, ptr %2, align 4
  %25 = call i32 @listen(i32 noundef %24, i32 noundef 5) #6
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  call void @perror(ptr noundef @.str.2) #7
  store i32 1, ptr %1, align 4
  br label %55

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %28, %52
  %30 = load i32, ptr %2, align 4
  %31 = call i32 @accept(i32 noundef %30, ptr noundef %5, ptr noundef %6)
  store i32 %31, ptr %3, align 4
  %32 = load i32, ptr %3, align 4
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %29
  call void @perror(ptr noundef @.str.3) #7
  store i32 1, ptr %1, align 4
  br label %55

35:                                               ; preds = %29
  br label %36

36:                                               ; preds = %35, %47
  %37 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %37, i8 0, i64 1024, i1 false)
  %38 = load i32, ptr %3, align 4
  %39 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %40 = call i64 @recv(i32 noundef %38, ptr noundef %39, i64 noundef 1024, i32 noundef 0)
  %41 = trunc i64 %40 to i32
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = icmp sle i32 %42, 0
  br i1 %43, label %44, label %47

44:                                               ; preds = %36
  %45 = load i32, ptr %3, align 4
  %46 = call i32 @close(i32 noundef %45)
  br label %52

47:                                               ; preds = %36
  %48 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %49 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %48)
  %50 = load i32, ptr %3, align 4
  %51 = call i64 @send(i32 noundef %50, ptr noundef @.str.5, i64 noundef 9, i32 noundef 0)
  br label %36

52:                                               ; preds = %44
  %53 = load i32, ptr %3, align 4
  %54 = call i32 @close(i32 noundef %53)
  br label %29

55:                                               ; preds = %34, %27, %22, %12
  %56 = load i32, ptr %1, align 4
  ret i32 %56
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
