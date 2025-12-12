; ModuleID = 'DATASETv2/falcon180b-9519.c'
source_filename = "DATASETv2/falcon180b-9519.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.hostent = type { ptr, ptr, i32, i32, ptr }

@.str = private unnamed_addr constant [26 x i8] c"Usage: %s hostname count\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Error creating socket\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Host not found\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"Error connecting to server\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"PING\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"PING %d (%d bytes received)\0A\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"PING %d failed\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [100 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca %struct.sockaddr_in, align 4
  %11 = alloca [1024 x i8], align 16
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %14 = load i32, ptr %4, align 4
  %15 = icmp ne i32 %14, 3
  br i1 %15, label %16, label %21

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 0
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %19)
  call void @exit(i32 noundef 1) #8
  unreachable

21:                                               ; preds = %2
  %22 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 1
  %25 = load ptr, ptr %24, align 8
  %26 = call ptr @strcpy(ptr noundef %22, ptr noundef %25) #9
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds ptr, ptr %27, i64 2
  %29 = load ptr, ptr %28, align 8
  %30 = call i32 @atoi(ptr noundef %29) #10
  store i32 %30, ptr %7, align 4
  %31 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  store i32 %31, ptr %8, align 4
  %32 = load i32, ptr %8, align 4
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %36

34:                                               ; preds = %21
  %35 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

36:                                               ; preds = %21
  %37 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %38 = call ptr @gethostbyname(ptr noundef %37)
  store ptr %38, ptr %9, align 8
  %39 = load ptr, ptr %9, align 8
  %40 = icmp eq ptr %39, null
  br i1 %40, label %41, label %43

41:                                               ; preds = %36
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

43:                                               ; preds = %36
  %44 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 0
  store i16 2, ptr %44, align 4
  %45 = call zeroext i16 @htons(i16 noundef zeroext 0) #11
  %46 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 1
  store i16 %45, ptr %46, align 2
  %47 = getelementptr inbounds %struct.sockaddr_in, ptr %10, i32 0, i32 2
  %48 = load ptr, ptr %9, align 8
  %49 = getelementptr inbounds %struct.hostent, ptr %48, i32 0, i32 4
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds ptr, ptr %50, i64 0
  %52 = load ptr, ptr %51, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %47, ptr align 4 %52, i64 4, i1 false)
  %53 = load i32, ptr %8, align 4
  %54 = call i32 @connect(i32 noundef %53, ptr noundef %10, i32 noundef 16)
  %55 = icmp eq i32 %54, -1
  br i1 %55, label %56, label %58

56:                                               ; preds = %43
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

58:                                               ; preds = %43
  store i32 0, ptr %13, align 4
  br label %59

59:                                               ; preds = %84, %58
  %60 = load i32, ptr %13, align 4
  %61 = load i32, ptr %7, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %87

63:                                               ; preds = %59
  %64 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %64, i8 0, i64 1024, i1 false)
  %65 = load i32, ptr %8, align 4
  %66 = call i64 @send(i32 noundef %65, ptr noundef @.str.4, i64 noundef 4, i32 noundef 0)
  %67 = load i32, ptr %8, align 4
  %68 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %69 = call i64 @recv(i32 noundef %67, ptr noundef %68, i64 noundef 1024, i32 noundef 0)
  %70 = trunc i64 %69 to i32
  store i32 %70, ptr %12, align 4
  %71 = load i32, ptr %12, align 4
  %72 = icmp sgt i32 %71, 0
  br i1 %72, label %73, label %78

73:                                               ; preds = %63
  %74 = load i32, ptr %13, align 4
  %75 = add nsw i32 %74, 1
  %76 = load i32, ptr %12, align 4
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %75, i32 noundef %76)
  br label %82

78:                                               ; preds = %63
  %79 = load i32, ptr %13, align 4
  %80 = add nsw i32 %79, 1
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %80)
  br label %82

82:                                               ; preds = %78, %73
  %83 = call i32 @usleep(i32 noundef 100000)
  br label %84

84:                                               ; preds = %82
  %85 = load i32, ptr %13, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %13, align 4
  br label %59, !llvm.loop !6

87:                                               ; preds = %59
  %88 = load i32, ptr %8, align 4
  %89 = call i32 @close(i32 noundef %88)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

declare ptr @gethostbyname(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @usleep(i32 noundef) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
