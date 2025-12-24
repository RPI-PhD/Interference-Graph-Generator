; ModuleID = 'LLVM_IR/falcon180b-70136.ll'
source_filename = "DATASETv2/falcon180b-70136.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [23 x i8] c"Error creating socket\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Error binding socket\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Error listening on socket\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Error accepting connection\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"Welcome to the server! \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.sockaddr_in, align 4
  %2 = alloca %struct.sockaddr_in, align 4
  %3 = alloca [1024 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 1, ptr %5, align 4
  %6 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %0
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

10:                                               ; preds = %0
  %11 = call i32 @setsockopt(i32 noundef %6, i32 noundef 1, i32 noundef 15, ptr noundef %5, i32 noundef 4) #7
  call void @llvm.memset.p0.i64(ptr align 4 %1, i8 48, i64 16, i1 false)
  %12 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 0
  store i16 2, ptr %12, align 4
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 2
  %14 = getelementptr inbounds %struct.in_addr, ptr %13, i32 0, i32 0
  store i32 0, ptr %14, align 4
  %15 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %16 = getelementptr inbounds %struct.sockaddr_in, ptr %1, i32 0, i32 1
  store i16 %15, ptr %16, align 2
  %17 = call i32 @bind(i32 noundef %6, ptr noundef %1, i32 noundef 16) #7
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %10
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

21:                                               ; preds = %10
  %22 = call i32 @listen(i32 noundef %6, i32 noundef 5) #7
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %21
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

26:                                               ; preds = %21
  store i32 16, ptr %4, align 4
  %27 = call i32 @accept(i32 noundef %6, ptr noundef %2, ptr noundef %4)
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

31:                                               ; preds = %26
  %32 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %33 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %32, ptr noundef @.str.4) #7
  %34 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %35 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %36 = call i64 @strlen(ptr noundef %35) #10
  %37 = call i64 @send(i32 noundef %27, ptr noundef %34, i64 noundef %36, i32 noundef 0)
  %38 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %38, i8 48, i64 1024, i1 false)
  %39 = getelementptr inbounds [1024 x i8], ptr %3, i64 0, i64 0
  %40 = call i64 @recv(i32 noundef %27, ptr noundef %39, i64 noundef 1024, i32 noundef 0)
  %41 = call i32 @close(i32 noundef %27)
  %42 = call i32 @close(i32 noundef %6)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i32 @setsockopt(i32 noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #1

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #6

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

declare i32 @close(i32 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind willreturn memory(none) }
attributes #10 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
