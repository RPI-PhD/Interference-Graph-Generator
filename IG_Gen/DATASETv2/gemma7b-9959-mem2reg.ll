; ModuleID = 'DATASETv2/gemma7b-9959.ll'
source_filename = "DATASETv2/gemma7b-9959.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [22 x i8] c"Error creating socket\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Error binding socket\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Error accepting client connection\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Error receiving client message\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"Hello, %s!\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1024 x i8], align 16
  %2 = alloca [1024 x i8], align 16
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = call zeroext i16 @htons(i16 noundef zeroext 8080) #7
  %5 = zext i16 %4 to i32
  %6 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef %5) #8
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %0
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

9:                                                ; preds = %0
  %10 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %10, align 4
  %11 = call zeroext i16 @htons(i16 noundef zeroext 8080) #7
  %12 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %11, ptr %12, align 2
  %13 = call i32 @bind(i32 noundef %6, ptr noundef %3, i32 noundef 16) #8
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %9
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

16:                                               ; preds = %9
  br label %17

17:                                               ; preds = %28, %26, %20, %16
  %18 = call i32 @accept(i32 noundef %6, ptr noundef null, ptr noundef null)
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %17
  call void @perror(ptr noundef @.str.2) #9
  br label %17

21:                                               ; preds = %17
  %22 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %23 = call i64 @recv(i32 noundef %18, ptr noundef %22, i64 noundef 1024, i32 noundef 0)
  %24 = trunc i64 %23 to i32
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %21
  call void @perror(ptr noundef @.str.3) #9
  %27 = call i32 @close(i32 noundef %18)
  br label %17

28:                                               ; preds = %21
  %29 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %30 = getelementptr inbounds [1024 x i8], ptr %1, i64 0, i64 0
  %31 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %29, ptr noundef @.str.4, ptr noundef %30) #8
  %32 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %33 = getelementptr inbounds [1024 x i8], ptr %2, i64 0, i64 0
  %34 = call i64 @strlen(ptr noundef %33) #11
  %35 = call i64 @send(i32 noundef %18, ptr noundef %32, i64 noundef %34, i32 noundef 0)
  %36 = call i32 @close(i32 noundef %18)
  br label %17
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #5

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #5

declare i32 @close(i32 noundef) #5

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #6

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { nounwind }
attributes #9 = { cold }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
