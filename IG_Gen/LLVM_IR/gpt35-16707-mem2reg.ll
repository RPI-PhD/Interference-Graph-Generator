; ModuleID = 'LLVM_IR/gpt35-16707.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [1024 x i8], align 16
  store i32 1, ptr %4, align 4
  store i32 16, ptr %5, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 1024, i1 false)
  %7 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #8
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

10:                                               ; preds = %2
  %11 = call i32 @setsockopt(i32 noundef %7, i32 noundef 1, i32 noundef 15, ptr noundef %4, i32 noundef 4) #8
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

14:                                               ; preds = %10
  %15 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %15, align 4
  %16 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %17 = getelementptr inbounds %struct.in_addr, ptr %16, i32 0, i32 0
  store i32 0, ptr %17, align 4
  %18 = call zeroext i16 @htons(i16 noundef zeroext 8080) #11
  %19 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %18, ptr %19, align 2
  %20 = call i32 @bind(i32 noundef %7, ptr noundef %3, i32 noundef 16) #8
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %14
  call void @perror(ptr noundef @.str.3) #9
  call void @exit(i32 noundef 1) #10
  unreachable

23:                                               ; preds = %14
  %24 = call i32 @listen(i32 noundef %7, i32 noundef 3) #8
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %23
  call void @perror(ptr noundef @.str.4) #9
  call void @exit(i32 noundef 1) #10
  unreachable

27:                                               ; preds = %23
  %28 = call i32 @accept(i32 noundef %7, ptr noundef %3, ptr noundef %5)
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  call void @perror(ptr noundef @.str.5) #9
  call void @exit(i32 noundef 1) #10
  unreachable

31:                                               ; preds = %27
  %32 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %33 = call i64 @read(i32 noundef %28, ptr noundef %32, i64 noundef 1024)
  %34 = trunc i64 %33 to i32
  %35 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %35)
  %37 = call i64 @strlen(ptr noundef @.str) #12
  %38 = call i64 @send(i32 noundef %28, ptr noundef @.str, i64 noundef %37, i32 noundef 0)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
