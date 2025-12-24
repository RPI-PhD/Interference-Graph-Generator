; ModuleID = 'LLVM_IR/codellama_13b-81.ll'
source_filename = "DATASETv2/codellama_13b-81.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [24 x i8] c"usage: %s <host> <msg>\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"socket\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"invalid host\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"connect\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"send\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"recv\00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"response: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"close\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca [1024 x i8], align 16
  %5 = icmp ne i32 %0, 3
  br i1 %5, label %6, label %11

6:                                                ; preds = %2
  %7 = load ptr, ptr @stderr, align 8
  %8 = getelementptr inbounds ptr, ptr %1, i64 0
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str, ptr noundef %9)
  br label %50

11:                                               ; preds = %2
  %12 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  call void @perror(ptr noundef @.str.1) #7
  br label %50

15:                                               ; preds = %11
  %16 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %16, align 4
  %17 = call zeroext i16 @htons(i16 noundef zeroext 25) #8
  %18 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %17, ptr %18, align 2
  %19 = getelementptr inbounds ptr, ptr %1, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %22 = call i32 @inet_pton(i32 noundef 2, ptr noundef %20, ptr noundef %21) #6
  %23 = icmp sle i32 %22, 0
  br i1 %23, label %24, label %27

24:                                               ; preds = %15
  %25 = load ptr, ptr @stderr, align 8
  %26 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.2)
  br label %50

27:                                               ; preds = %15
  %28 = call i32 @connect(i32 noundef %12, ptr noundef %3, i32 noundef 16)
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %30, label %31

30:                                               ; preds = %27
  call void @perror(ptr noundef @.str.3) #7
  br label %50

31:                                               ; preds = %27
  %32 = getelementptr inbounds ptr, ptr %1, i64 2
  %33 = load ptr, ptr %32, align 8
  %34 = call i64 @strlen(ptr noundef %33) #9
  %35 = call i64 @send(i32 noundef %12, ptr noundef %33, i64 noundef %34, i32 noundef 0)
  %36 = icmp eq i64 %35, -1
  br i1 %36, label %37, label %38

37:                                               ; preds = %31
  call void @perror(ptr noundef @.str.4) #7
  br label %50

38:                                               ; preds = %31
  %39 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %40 = call i64 @recv(i32 noundef %12, ptr noundef %39, i64 noundef 1024, i32 noundef 0)
  %41 = icmp eq i64 %40, -1
  br i1 %41, label %42, label %43

42:                                               ; preds = %38
  call void @perror(ptr noundef @.str.5) #7
  br label %50

43:                                               ; preds = %38
  %44 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %44)
  %46 = call i32 @close(i32 noundef %12)
  %47 = icmp eq i32 %46, -1
  br i1 %47, label %48, label %49

48:                                               ; preds = %43
  call void @perror(ptr noundef @.str.7) #7
  br label %50

49:                                               ; preds = %43
  br label %50

50:                                               ; preds = %49, %48, %42, %37, %30, %24, %14, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %14 ], [ 1, %24 ], [ 1, %30 ], [ 1, %37 ], [ 1, %42 ], [ 1, %48 ], [ 0, %49 ]
  ret i32 %.0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #4

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { nounwind willreturn memory(none) }
attributes #9 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
