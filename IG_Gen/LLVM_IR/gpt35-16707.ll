; ModuleID = 'DATASETv2/gpt35-16707.c'
source_filename = "DATASETv2/gpt35-16707.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [19 x i8] c"Hello from server!\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"socket failed\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"setsockopt\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"bind failed\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"listen\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.sockaddr_in, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [1024 x i8], align 16
  %13 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 1, ptr %10, align 4
  store i32 16, ptr %11, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %12, i8 0, i64 1024, i1 false)
  store ptr @.str, ptr %13, align 8
  %14 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #8
  store i32 %14, ptr %6, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

17:                                               ; preds = %2
  %18 = load i32, ptr %6, align 4
  %19 = call i32 @setsockopt(i32 noundef %18, i32 noundef 1, i32 noundef 15, ptr noundef %10, i32 noundef 4) #8
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

22:                                               ; preds = %17
  %23 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 0
  store i16 2, ptr %23, align 4
  %24 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 2
  %25 = getelementptr inbounds %struct.in_addr, ptr %24, i32 0, i32 0
  store i32 0, ptr %25, align 4
  %26 = call zeroext i16 @htons(i16 noundef zeroext 8080) #11
  %27 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 1
  store i16 %26, ptr %27, align 2
  %28 = load i32, ptr %6, align 4
  %29 = call i32 @bind(i32 noundef %28, ptr noundef %9, i32 noundef 16) #8
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %22
  call void @perror(ptr noundef @.str.3) #9
  call void @exit(i32 noundef 1) #10
  unreachable

32:                                               ; preds = %22
  %33 = load i32, ptr %6, align 4
  %34 = call i32 @listen(i32 noundef %33, i32 noundef 3) #8
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %32
  call void @perror(ptr noundef @.str.4) #9
  call void @exit(i32 noundef 1) #10
  unreachable

37:                                               ; preds = %32
  %38 = load i32, ptr %6, align 4
  %39 = call i32 @accept(i32 noundef %38, ptr noundef %9, ptr noundef %11)
  store i32 %39, ptr %7, align 4
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %37
  call void @perror(ptr noundef @.str.5) #9
  call void @exit(i32 noundef 1) #10
  unreachable

42:                                               ; preds = %37
  %43 = load i32, ptr %7, align 4
  %44 = getelementptr inbounds [1024 x i8], ptr %12, i64 0, i64 0
  %45 = call i64 @read(i32 noundef %43, ptr noundef %44, i64 noundef 1024)
  %46 = trunc i64 %45 to i32
  store i32 %46, ptr %8, align 4
  %47 = getelementptr inbounds [1024 x i8], ptr %12, i64 0, i64 0
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %47)
  %49 = load i32, ptr %7, align 4
  %50 = load ptr, ptr %13, align 8
  %51 = load ptr, ptr %13, align 8
  %52 = call i64 @strlen(ptr noundef %51) #12
  %53 = call i64 @send(i32 noundef %49, ptr noundef %50, i64 noundef %52, i32 noundef 0)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #2

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #6

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #6

declare i32 @printf(ptr noundef, ...) #6

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #6

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #7

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind willreturn memory(none) }
attributes #12 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
