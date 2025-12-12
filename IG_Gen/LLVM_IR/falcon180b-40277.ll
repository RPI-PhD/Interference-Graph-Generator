; ModuleID = 'DATASETv2/falcon180b-40277.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.sockaddr_in, align 4
  %10 = alloca %struct.sockaddr_in, align 4
  %11 = alloca [1024 x i8], align 16
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca [10 x i8], align 1
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %16 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #8
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %2
  call void @perror(ptr noundef @.str) #9
  call void @exit(i32 noundef 1) #10
  unreachable

20:                                               ; preds = %2
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 0
  store i16 2, ptr %21, align 4
  %22 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 2
  %23 = getelementptr inbounds %struct.in_addr, ptr %22, i32 0, i32 0
  store i32 0, ptr %23, align 4
  %24 = call zeroext i16 @htons(i16 noundef zeroext 8080) #11
  %25 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 1
  store i16 %24, ptr %25, align 2
  %26 = load i32, ptr %6, align 4
  %27 = call i32 @bind(i32 noundef %26, ptr noundef %9, i32 noundef 16) #8
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %20
  call void @perror(ptr noundef @.str.1) #9
  call void @exit(i32 noundef 1) #10
  unreachable

30:                                               ; preds = %20
  %31 = load i32, ptr %6, align 4
  %32 = call i32 @listen(i32 noundef %31, i32 noundef 5) #8
  br label %33

33:                                               ; preds = %30, %89
  store i32 16, ptr %8, align 4
  %34 = load i32, ptr %6, align 4
  %35 = call i32 @accept(i32 noundef %34, ptr noundef %10, ptr noundef %8)
  store i32 %35, ptr %7, align 4
  %36 = load i32, ptr %7, align 4
  %37 = icmp slt i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %33
  call void @perror(ptr noundef @.str.2) #9
  call void @exit(i32 noundef 1) #10
  unreachable

39:                                               ; preds = %33
  %40 = load i32, ptr %7, align 4
  %41 = call i64 @send(i32 noundef %40, ptr noundef @.str.3, i64 noundef 38, i32 noundef 0)
  %42 = load i32, ptr %7, align 4
  %43 = call i64 @send(i32 noundef %42, ptr noundef @.str.4, i64 noundef 49, i32 noundef 0)
  br label %44

44:                                               ; preds = %39, %52
  %45 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %45, i8 0, i64 1024, i1 false)
  %46 = load i32, ptr %7, align 4
  %47 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %48 = call i64 @recv(i32 noundef %46, ptr noundef %47, i64 noundef 1024, i32 noundef 0)
  %49 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %50 = call i64 @strlen(ptr noundef %49) #12
  %51 = icmp eq i64 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %44
  %53 = load i32, ptr %7, align 4
  %54 = call i64 @send(i32 noundef %53, ptr noundef @.str.5, i64 noundef 44, i32 noundef 0)
  br label %44

55:                                               ; preds = %44
  %56 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %57 = call noalias ptr @strdup(ptr noundef %56) #8
  store ptr %57, ptr %12, align 8
  store i32 0, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %58

58:                                               ; preds = %73, %55
  %59 = load i32, ptr %14, align 4
  %60 = sext i32 %59 to i64
  %61 = load ptr, ptr %12, align 8
  %62 = call i64 @strlen(ptr noundef %61) #12
  %63 = icmp ult i64 %60, %62
  br i1 %63, label %64, label %76

64:                                               ; preds = %58
  %65 = load ptr, ptr %12, align 8
  %66 = load i32, ptr %14, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, ptr %65, i64 %67
  %69 = load i8, ptr %68, align 1
  %70 = sext i8 %69 to i32
  %71 = load i32, ptr %13, align 4
  %72 = add nsw i32 %71, %70
  store i32 %72, ptr %13, align 4
  br label %73

73:                                               ; preds = %64
  %74 = load i32, ptr %14, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %14, align 4
  br label %58, !llvm.loop !6

76:                                               ; preds = %58
  %77 = getelementptr inbounds [10 x i8], ptr %15, i64 0, i64 0
  %78 = load i32, ptr %13, align 4
  %79 = srem i32 %78, 256
  %80 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %77, ptr noundef @.str.6, i32 noundef %79) #8
  %81 = load i32, ptr %7, align 4
  %82 = call i64 @send(i32 noundef %81, ptr noundef @.str.7, i64 noundef 31, i32 noundef 0)
  %83 = load i32, ptr %7, align 4
  %84 = getelementptr inbounds [10 x i8], ptr %15, i64 0, i64 0
  %85 = getelementptr inbounds [10 x i8], ptr %15, i64 0, i64 0
  %86 = call i64 @strlen(ptr noundef %85) #12
  %87 = call i64 @send(i32 noundef %83, ptr noundef %84, i64 noundef %86, i32 noundef 0)
  %88 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %88) #8
  br label %89

89:                                               ; preds = %76
  %90 = load i32, ptr %7, align 4
  %91 = call i32 @close(i32 noundef %90)
  br label %33
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
