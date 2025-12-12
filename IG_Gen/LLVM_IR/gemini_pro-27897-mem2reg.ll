; ModuleID = 'LLVM_IR/gemini_pro-27897.ll'
source_filename = "DATASETv2/gemini_pro-27897.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [47 x i8] c"Usage: %s <server_ip> <server_port> <message>\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"socket() failed\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"connect() failed\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"HELO localhost\0D\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"send() failed\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"recv() failed\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Server response: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [34 x i8] c"MAIL FROM: <sender@example.com>\0D\0A\00", align 1
@.str.8 = private unnamed_addr constant [34 x i8] c"RCPT TO: <receiver@example.com>\0D\0A\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"DATA\0D\0A\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"This is the message body.\0D\0A\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c".\0D\0A\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"QUIT\0D\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca [1024 x i8], align 16
  %5 = icmp slt i32 %0, 4
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %8)
  br label %114

10:                                               ; preds = %2
  %11 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  %12 = icmp eq i32 %11, -1
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  call void @perror(ptr noundef @.str.1) #8
  br label %114

14:                                               ; preds = %10
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 16, i1 false)
  %15 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %15, align 4
  %16 = getelementptr inbounds ptr, ptr %1, i64 2
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 @atoi(ptr noundef %17) #9
  %19 = trunc i32 %18 to i16
  %20 = call zeroext i16 @htons(i16 noundef zeroext %19) #10
  %21 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %20, ptr %21, align 2
  %22 = getelementptr inbounds ptr, ptr %1, i64 1
  %23 = load ptr, ptr %22, align 8
  %24 = call i32 @inet_addr(ptr noundef %23) #7
  %25 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %26 = getelementptr inbounds %struct.in_addr, ptr %25, i32 0, i32 0
  store i32 %24, ptr %26, align 4
  %27 = call i32 @connect(i32 noundef %11, ptr noundef %3, i32 noundef 16)
  %28 = icmp eq i32 %27, -1
  br i1 %28, label %29, label %30

29:                                               ; preds = %14
  call void @perror(ptr noundef @.str.2) #8
  br label %114

30:                                               ; preds = %14
  %31 = call i64 @strlen(ptr noundef @.str.3) #9
  %32 = call i64 @send(i32 noundef %11, ptr noundef @.str.3, i64 noundef %31, i32 noundef 0)
  %33 = trunc i64 %32 to i32
  %34 = icmp eq i32 %33, -1
  br i1 %34, label %35, label %36

35:                                               ; preds = %30
  call void @perror(ptr noundef @.str.4) #8
  br label %114

36:                                               ; preds = %30
  %37 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %38 = call i64 @recv(i32 noundef %11, ptr noundef %37, i64 noundef 1024, i32 noundef 0)
  %39 = trunc i64 %38 to i32
  %40 = icmp eq i32 %39, -1
  br i1 %40, label %41, label %42

41:                                               ; preds = %36
  call void @perror(ptr noundef @.str.5) #8
  br label %114

42:                                               ; preds = %36
  %43 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %43)
  %45 = call i64 @strlen(ptr noundef @.str.7) #9
  %46 = call i64 @send(i32 noundef %11, ptr noundef @.str.7, i64 noundef %45, i32 noundef 0)
  %47 = trunc i64 %46 to i32
  %48 = icmp eq i32 %47, -1
  br i1 %48, label %49, label %50

49:                                               ; preds = %42
  call void @perror(ptr noundef @.str.4) #8
  br label %114

50:                                               ; preds = %42
  %51 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %52 = call i64 @recv(i32 noundef %11, ptr noundef %51, i64 noundef 1024, i32 noundef 0)
  %53 = trunc i64 %52 to i32
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %56

55:                                               ; preds = %50
  call void @perror(ptr noundef @.str.5) #8
  br label %114

56:                                               ; preds = %50
  %57 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %57)
  %59 = call i64 @strlen(ptr noundef @.str.8) #9
  %60 = call i64 @send(i32 noundef %11, ptr noundef @.str.8, i64 noundef %59, i32 noundef 0)
  %61 = trunc i64 %60 to i32
  %62 = icmp eq i32 %61, -1
  br i1 %62, label %63, label %64

63:                                               ; preds = %56
  call void @perror(ptr noundef @.str.4) #8
  br label %114

64:                                               ; preds = %56
  %65 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %66 = call i64 @recv(i32 noundef %11, ptr noundef %65, i64 noundef 1024, i32 noundef 0)
  %67 = trunc i64 %66 to i32
  %68 = icmp eq i32 %67, -1
  br i1 %68, label %69, label %70

69:                                               ; preds = %64
  call void @perror(ptr noundef @.str.5) #8
  br label %114

70:                                               ; preds = %64
  %71 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %71)
  %73 = call i64 @strlen(ptr noundef @.str.9) #9
  %74 = call i64 @send(i32 noundef %11, ptr noundef @.str.9, i64 noundef %73, i32 noundef 0)
  %75 = trunc i64 %74 to i32
  %76 = icmp eq i32 %75, -1
  br i1 %76, label %77, label %78

77:                                               ; preds = %70
  call void @perror(ptr noundef @.str.4) #8
  br label %114

78:                                               ; preds = %70
  %79 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %80 = call i64 @recv(i32 noundef %11, ptr noundef %79, i64 noundef 1024, i32 noundef 0)
  %81 = trunc i64 %80 to i32
  %82 = icmp eq i32 %81, -1
  br i1 %82, label %83, label %84

83:                                               ; preds = %78
  call void @perror(ptr noundef @.str.5) #8
  br label %114

84:                                               ; preds = %78
  %85 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %85)
  %87 = call i64 @strlen(ptr noundef @.str.10) #9
  %88 = call i64 @send(i32 noundef %11, ptr noundef @.str.10, i64 noundef %87, i32 noundef 0)
  %89 = trunc i64 %88 to i32
  %90 = icmp eq i32 %89, -1
  br i1 %90, label %91, label %92

91:                                               ; preds = %84
  call void @perror(ptr noundef @.str.4) #8
  br label %114

92:                                               ; preds = %84
  %93 = call i64 @strlen(ptr noundef @.str.11) #9
  %94 = call i64 @send(i32 noundef %11, ptr noundef @.str.11, i64 noundef %93, i32 noundef 0)
  %95 = trunc i64 %94 to i32
  %96 = icmp eq i32 %95, -1
  br i1 %96, label %97, label %98

97:                                               ; preds = %92
  call void @perror(ptr noundef @.str.4) #8
  br label %114

98:                                               ; preds = %92
  %99 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %100 = call i64 @recv(i32 noundef %11, ptr noundef %99, i64 noundef 1024, i32 noundef 0)
  %101 = trunc i64 %100 to i32
  %102 = icmp eq i32 %101, -1
  br i1 %102, label %103, label %104

103:                                              ; preds = %98
  call void @perror(ptr noundef @.str.5) #8
  br label %114

104:                                              ; preds = %98
  %105 = getelementptr inbounds [1024 x i8], ptr %4, i64 0, i64 0
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %105)
  %107 = call i64 @strlen(ptr noundef @.str.12) #9
  %108 = call i64 @send(i32 noundef %11, ptr noundef @.str.12, i64 noundef %107, i32 noundef 0)
  %109 = trunc i64 %108 to i32
  %110 = icmp eq i32 %109, -1
  br i1 %110, label %111, label %112

111:                                              ; preds = %104
  call void @perror(ptr noundef @.str.4) #8
  br label %114

112:                                              ; preds = %104
  %113 = call i32 @close(i32 noundef %11)
  br label %114

114:                                              ; preds = %112, %111, %103, %97, %91, %83, %77, %69, %63, %55, %49, %41, %35, %29, %13, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %13 ], [ 1, %29 ], [ 1, %35 ], [ 1, %41 ], [ 1, %49 ], [ 1, %55 ], [ 1, %63 ], [ 1, %69 ], [ 1, %77 ], [ 1, %83 ], [ 1, %91 ], [ 1, %97 ], [ 1, %103 ], [ 1, %111 ], [ 0, %112 ]
  ret i32 %.0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #5

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #6

; Function Attrs: nounwind
declare i32 @inet_addr(ptr noundef) #2

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #6

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { nounwind willreturn memory(read) }
attributes #10 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
