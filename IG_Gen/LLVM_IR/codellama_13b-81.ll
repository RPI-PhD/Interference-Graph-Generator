; ModuleID = 'DATASETv2/codellama_13b-81.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.sockaddr_in, align 4
  %8 = alloca ptr, align 8
  %9 = alloca [1024 x i8], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %18

12:                                               ; preds = %2
  %13 = load ptr, ptr @stderr, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i64 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str, ptr noundef %16)
  store i32 1, ptr %3, align 4
  br label %66

18:                                               ; preds = %2
  %19 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #6
  store i32 %19, ptr %6, align 4
  %20 = load i32, ptr %6, align 4
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  call void @perror(ptr noundef @.str.1) #7
  store i32 1, ptr %3, align 4
  br label %66

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 0
  store i16 2, ptr %24, align 4
  %25 = call zeroext i16 @htons(i16 noundef zeroext 25) #8
  %26 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 1
  store i16 %25, ptr %26, align 2
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 1
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 2
  %31 = call i32 @inet_pton(i32 noundef 2, ptr noundef %29, ptr noundef %30) #6
  %32 = icmp sle i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %23
  %34 = load ptr, ptr @stderr, align 8
  %35 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %34, ptr noundef @.str.2)
  store i32 1, ptr %3, align 4
  br label %66

36:                                               ; preds = %23
  %37 = load i32, ptr %6, align 4
  %38 = call i32 @connect(i32 noundef %37, ptr noundef %7, i32 noundef 16)
  %39 = icmp eq i32 %38, -1
  br i1 %39, label %40, label %41

40:                                               ; preds = %36
  call void @perror(ptr noundef @.str.3) #7
  store i32 1, ptr %3, align 4
  br label %66

41:                                               ; preds = %36
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds ptr, ptr %42, i64 2
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr %8, align 8
  %45 = load i32, ptr %6, align 4
  %46 = load ptr, ptr %8, align 8
  %47 = load ptr, ptr %8, align 8
  %48 = call i64 @strlen(ptr noundef %47) #9
  %49 = call i64 @send(i32 noundef %45, ptr noundef %46, i64 noundef %48, i32 noundef 0)
  %50 = icmp eq i64 %49, -1
  br i1 %50, label %51, label %52

51:                                               ; preds = %41
  call void @perror(ptr noundef @.str.4) #7
  store i32 1, ptr %3, align 4
  br label %66

52:                                               ; preds = %41
  %53 = load i32, ptr %6, align 4
  %54 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %55 = call i64 @recv(i32 noundef %53, ptr noundef %54, i64 noundef 1024, i32 noundef 0)
  %56 = icmp eq i64 %55, -1
  br i1 %56, label %57, label %58

57:                                               ; preds = %52
  call void @perror(ptr noundef @.str.5) #7
  store i32 1, ptr %3, align 4
  br label %66

58:                                               ; preds = %52
  %59 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %59)
  %61 = load i32, ptr %6, align 4
  %62 = call i32 @close(i32 noundef %61)
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %65

64:                                               ; preds = %58
  call void @perror(ptr noundef @.str.7) #7
  store i32 1, ptr %3, align 4
  br label %66

65:                                               ; preds = %58
  store i32 0, ptr %3, align 4
  br label %66

66:                                               ; preds = %65, %64, %57, %51, %40, %33, %22, %12
  %67 = load i32, ptr %3, align 4
  ret i32 %67
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
