; ModuleID = 'LLVM_IR/falcon180b-9519.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [100 x i8], align 16
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca [1024 x i8], align 16
  %6 = icmp ne i32 %0, 3
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = getelementptr inbounds ptr, ptr %1, i64 0
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %9)
  call void @exit(i32 noundef 1) #8
  unreachable

11:                                               ; preds = %2
  %12 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %13 = getelementptr inbounds ptr, ptr %1, i64 1
  %14 = load ptr, ptr %13, align 8
  %15 = call ptr @strcpy(ptr noundef %12, ptr noundef %14) #9
  %16 = getelementptr inbounds ptr, ptr %1, i64 2
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #10
  %19 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  %20 = icmp eq i32 %19, -1
  br i1 %20, label %21, label %23

21:                                               ; preds = %11
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #8
  unreachable

23:                                               ; preds = %11
  %24 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %25 = call ptr @gethostbyname(ptr noundef %24)
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %23
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 1) #8
  unreachable

29:                                               ; preds = %23
  %30 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %30, align 4
  %31 = call zeroext i16 @htons(i16 noundef zeroext 0) #11
  %32 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 1
  store i16 %31, ptr %32, align 2
  %33 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %34 = getelementptr inbounds %struct.hostent, ptr %25, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds ptr, ptr %35, i64 0
  %37 = load ptr, ptr %36, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %33, ptr align 4 %37, i64 4, i1 false)
  %38 = call i32 @connect(i32 noundef %19, ptr noundef %4, i32 noundef 16)
  %39 = icmp eq i32 %38, -1
  br i1 %39, label %40, label %42

40:                                               ; preds = %29
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef 1) #8
  unreachable

42:                                               ; preds = %29
  br label %43

43:                                               ; preds = %60, %42
  %.0 = phi i32 [ 0, %42 ], [ %61, %60 ]
  %44 = icmp slt i32 %.0, %18
  br i1 %44, label %45, label %62

45:                                               ; preds = %43
  %46 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %46, i8 0, i64 1024, i1 false)
  %47 = call i64 @send(i32 noundef %19, ptr noundef @.str.4, i64 noundef 4, i32 noundef 0)
  %48 = getelementptr inbounds [1024 x i8], ptr %5, i64 0, i64 0
  %49 = call i64 @recv(i32 noundef %19, ptr noundef %48, i64 noundef 1024, i32 noundef 0)
  %50 = trunc i64 %49 to i32
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %45
  %53 = add nsw i32 %.0, 1
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %53, i32 noundef %50)
  br label %58

55:                                               ; preds = %45
  %56 = add nsw i32 %.0, 1
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %56)
  br label %58

58:                                               ; preds = %55, %52
  %59 = call i32 @usleep(i32 noundef 100000)
  br label %60

60:                                               ; preds = %58
  %61 = add nsw i32 %.0, 1
  br label %43, !llvm.loop !6

62:                                               ; preds = %43
  %63 = call i32 @close(i32 noundef %19)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
