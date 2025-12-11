; ModuleID = 'DATASETv2/falcon2-11B-11879.ll'
source_filename = "DATASETv2/falcon2-11B-11879.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [18 x i8] c"Usage: %s <port>\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"ERROR opening socket\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"ERROR on binding\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"ERROR on accept\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"ERROR reading from socket\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @error(ptr noundef %0) #0 {
  call void @perror(ptr noundef %0) #8
  call void @exit(i32 noundef 1) #9
  unreachable
}

; Function Attrs: cold
declare void @perror(ptr noundef) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca [256 x i8], align 16
  %5 = icmp ne i32 %0, 2
  br i1 %5, label %6, label %11

6:                                                ; preds = %2
  %7 = load ptr, ptr @stderr, align 8
  %8 = getelementptr inbounds ptr, ptr %1, i64 0
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str, ptr noundef %9)
  call void @exit(i32 noundef 1) #9
  unreachable

11:                                               ; preds = %2
  %12 = getelementptr inbounds ptr, ptr %1, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @atoi(ptr noundef %13) #10
  %15 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #11
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %11
  call void @error(ptr noundef @.str.1)
  br label %18

18:                                               ; preds = %17, %11
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 16, i1 false)
  %19 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %19, align 4
  %20 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %21 = getelementptr inbounds %struct.in_addr, ptr %20, i32 0, i32 0
  store i32 0, ptr %21, align 4
  %22 = trunc i32 %14 to i16
  %23 = call zeroext i16 @htons(i16 noundef zeroext %22) #12
  %24 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %23, ptr %24, align 2
  %25 = call i32 @bind(i32 noundef %15, ptr noundef %3, i32 noundef 16) #11
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %18
  call void @error(ptr noundef @.str.2)
  br label %28

28:                                               ; preds = %27, %18
  %29 = call i32 @listen(i32 noundef %15, i32 noundef 3) #11
  %30 = call i32 @accept(i32 noundef %15, ptr noundef null, ptr noundef null)
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %28
  call void @error(ptr noundef @.str.3)
  br label %33

33:                                               ; preds = %32, %28
  %34 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %34, i8 0, i64 256, i1 false)
  br label %35

35:                                               ; preds = %44, %33
  %36 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %37 = call i64 @recv(i32 noundef %30, ptr noundef %36, i64 noundef 256, i32 noundef 0)
  %38 = trunc i64 %37 to i32
  %39 = icmp slt i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %35
  call void @error(ptr noundef @.str.4)
  br label %41

41:                                               ; preds = %40, %35
  %42 = icmp eq i32 %38, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %41
  br label %48

44:                                               ; preds = %41
  %45 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %46 = sext i32 %38 to i64
  %47 = call i64 @send(i32 noundef %30, ptr noundef %45, i64 noundef %46, i32 noundef 0)
  br label %35

48:                                               ; preds = %43
  %49 = call i32 @close(i32 noundef %30)
  %50 = call i32 @close(i32 noundef %15)
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #7

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #5

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #5

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #3

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #3

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #3

declare i32 @close(i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind willreturn memory(read) }
attributes #11 = { nounwind }
attributes #12 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
