; ModuleID = 'DATASETv2/falcon180b-70136.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = alloca %struct.sockaddr_in, align 4
  %7 = alloca [1024 x i8], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 1, ptr %9, align 4
  %10 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %0
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

15:                                               ; preds = %0
  %16 = load i32, ptr %2, align 4
  %17 = call i32 @setsockopt(i32 noundef %16, i32 noundef 1, i32 noundef 15, ptr noundef %9, i32 noundef 4) #7
  call void @llvm.memset.p0.i64(ptr align 4 %5, i8 48, i64 16, i1 false)
  %18 = getelementptr inbounds %struct.sockaddr_in, ptr %5, i32 0, i32 0
  store i16 2, ptr %18, align 4
  %19 = getelementptr inbounds %struct.sockaddr_in, ptr %5, i32 0, i32 2
  %20 = getelementptr inbounds %struct.in_addr, ptr %19, i32 0, i32 0
  store i32 0, ptr %20, align 4
  %21 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %22 = getelementptr inbounds %struct.sockaddr_in, ptr %5, i32 0, i32 1
  store i16 %21, ptr %22, align 2
  %23 = load i32, ptr %2, align 4
  %24 = call i32 @bind(i32 noundef %23, ptr noundef %5, i32 noundef 16) #7
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %15
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

28:                                               ; preds = %15
  %29 = load i32, ptr %2, align 4
  %30 = call i32 @listen(i32 noundef %29, i32 noundef 5) #7
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %28
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

34:                                               ; preds = %28
  store i32 16, ptr %8, align 4
  %35 = load i32, ptr %2, align 4
  %36 = call i32 @accept(i32 noundef %35, ptr noundef %6, ptr noundef %8)
  store i32 %36, ptr %3, align 4
  %37 = load i32, ptr %3, align 4
  %38 = icmp slt i32 %37, 0
  br i1 %38, label %39, label %41

39:                                               ; preds = %34
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

41:                                               ; preds = %34
  %42 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %43 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %42, ptr noundef @.str.4) #7
  %44 = load i32, ptr %3, align 4
  %45 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %46 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %47 = call i64 @strlen(ptr noundef %46) #10
  %48 = call i64 @send(i32 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0)
  %49 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %49, i8 48, i64 1024, i1 false)
  %50 = load i32, ptr %3, align 4
  %51 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %52 = call i64 @recv(i32 noundef %50, ptr noundef %51, i64 noundef 1024, i32 noundef 0)
  %53 = load i32, ptr %3, align 4
  %54 = call i32 @close(i32 noundef %53)
  %55 = load i32, ptr %2, align 4
  %56 = call i32 @close(i32 noundef %55)
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
