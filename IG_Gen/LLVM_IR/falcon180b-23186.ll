; ModuleID = 'DATASETv2/falcon180b-23186.c'
source_filename = "DATASETv2/falcon180b-23186.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [23 x i8] c"Error creating socket\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"Error binding socket\0A\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"Error listening on socket\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Error accepting connection\0A\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"Welcome to the futuristic server, %s!\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.sockaddr_in, align 4
  %9 = alloca %struct.sockaddr_in, align 4
  %10 = alloca i32, align 4
  %11 = alloca [1024 x i8], align 16
  %12 = alloca i64, align 8
  %13 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %14 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  store i32 %14, ptr %6, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %2
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @exit(i32 noundef 1) #8
  unreachable

18:                                               ; preds = %2
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 16, i1 false)
  %19 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 0
  store i16 2, ptr %19, align 4
  %20 = call i32 @htonl(i32 noundef 0) #9
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 2
  %22 = getelementptr inbounds %struct.in_addr, ptr %21, i32 0, i32 0
  store i32 %20, ptr %22, align 4
  %23 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %24 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 1
  store i16 %23, ptr %24, align 2
  %25 = load i32, ptr %6, align 4
  %26 = call i32 @bind(i32 noundef %25, ptr noundef %8, i32 noundef 16) #7
  %27 = icmp slt i32 %26, 0
  br i1 %27, label %28, label %30

28:                                               ; preds = %18
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

30:                                               ; preds = %18
  %31 = load i32, ptr %6, align 4
  %32 = call i32 @listen(i32 noundef %31, i32 noundef 10) #7
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

36:                                               ; preds = %30
  br label %37

37:                                               ; preds = %36, %43
  %38 = load i32, ptr %6, align 4
  %39 = call i32 @accept(i32 noundef %38, ptr noundef %9, ptr noundef %10)
  store i32 %39, ptr %7, align 4
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %37
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

43:                                               ; preds = %37
  %44 = call i64 @time(ptr noundef null) #7
  store i64 %44, ptr %12, align 8
  %45 = call ptr @ctime(ptr noundef %12) #7
  store ptr %45, ptr %13, align 8
  %46 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %47 = load ptr, ptr %13, align 8
  %48 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %46, ptr noundef @.str.4, ptr noundef %47) #7
  %49 = load i32, ptr %7, align 4
  %50 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %51 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %52 = call i64 @strlen(ptr noundef %51) #10
  %53 = call i64 @send(i32 noundef %49, ptr noundef %50, i64 noundef %52, i32 noundef 0)
  %54 = load i32, ptr %7, align 4
  %55 = call i32 @close(i32 noundef %54)
  br label %37
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind willreturn memory(none)
declare i32 @htonl(i32 noundef) #5

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #1

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @ctime(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #6

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
