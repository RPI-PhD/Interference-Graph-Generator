; ModuleID = 'LLVM_IR/falcon180b-40277.ll'
source_filename = "DATASETv2/falcon180b-40277.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [14 x i8] c"socket failed\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"bind failed\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"accept failed\00", align 1
@.str.3 = private unnamed_addr constant [39 x i8] c"Welcome to the C Checksum Calculator!\0A\00", align 1
@.str.4 = private unnamed_addr constant [50 x i8] c"Please enter a string to calculate its checksum.\0A\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"Invalid input. Please enter a valid string.\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"The checksum of the string is: \00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  %6 = alloca [1024 x i8], align 16
  %7 = alloca [10 x i8], align 1
  %8 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #8
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 0
  store i16 2, ptr %12, align 4
  %13 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 2
  %14 = getelementptr inbounds %struct.in_addr, ptr %13, i32 0, i32 0
  store i32 0, ptr %14, align 4
  %15 = call zeroext i16 @htons(i16 noundef zeroext 8080) #11
  %16 = getelementptr inbounds %struct.sockaddr_in, ptr %4, i32 0, i32 1
  store i16 %15, ptr %16, align 2
  %17 = call i32 @bind(i32 noundef %8, ptr noundef %4, i32 noundef 16) #8
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %11
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

20:                                               ; preds = %11
  %21 = call i32 @listen(i32 noundef %8, i32 noundef 5) #8
  br label %22

22:                                               ; preds = %62, %20
  store i32 16, ptr %3, align 4
  %23 = call i32 @accept(i32 noundef %8, ptr noundef %5, ptr noundef %3)
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

26:                                               ; preds = %22
  %27 = call i64 @send(i32 noundef %23, ptr noundef @.str.3, i64 noundef 38, i32 noundef 0)
  %28 = call i64 @send(i32 noundef %23, ptr noundef @.str.4, i64 noundef 49, i32 noundef 0)
  br label %29

29:                                               ; preds = %36, %26
  %30 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %30, i8 0, i64 1024, i1 false)
  %31 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %32 = call i64 @recv(i32 noundef %23, ptr noundef %31, i64 noundef 1024, i32 noundef 0)
  %33 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %34 = call i64 @strlen(ptr noundef %33) #12
  %35 = icmp eq i64 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %29
  %37 = call i64 @send(i32 noundef %23, ptr noundef @.str.5, i64 noundef 44, i32 noundef 0)
  br label %29

38:                                               ; preds = %29
  %39 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %40 = call noalias ptr @strdup(ptr noundef %39) #8
  br label %41

41:                                               ; preds = %51, %38
  %.01 = phi i32 [ 0, %38 ], [ %50, %51 ]
  %.0 = phi i32 [ 0, %38 ], [ %52, %51 ]
  %42 = sext i32 %.0 to i64
  %43 = call i64 @strlen(ptr noundef %40) #12
  %44 = icmp ult i64 %42, %43
  br i1 %44, label %45, label %53

45:                                               ; preds = %41
  %46 = sext i32 %.0 to i64
  %47 = getelementptr inbounds i8, ptr %40, i64 %46
  %48 = load i8, ptr %47, align 1
  %49 = sext i8 %48 to i32
  %50 = add nsw i32 %.01, %49
  br label %51

51:                                               ; preds = %45
  %52 = add nsw i32 %.0, 1
  br label %41, !llvm.loop !6

53:                                               ; preds = %41
  %54 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %55 = srem i32 %.01, 256
  %56 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %54, ptr noundef @.str.6, i32 noundef %55) #8
  %57 = call i64 @send(i32 noundef %23, ptr noundef @.str.7, i64 noundef 31, i32 noundef 0)
  %58 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %59 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %60 = call i64 @strlen(ptr noundef %59) #12
  %61 = call i64 @send(i32 noundef %23, ptr noundef %58, i64 noundef %60, i32 noundef 0)
  call void @free(ptr noundef %40) #8
  br label %62

62:                                               ; preds = %53
  %63 = call i32 @close(i32 noundef %23)
  br label %22
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #4

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #1

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #5

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #7

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

declare i32 @close(i32 noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
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
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
