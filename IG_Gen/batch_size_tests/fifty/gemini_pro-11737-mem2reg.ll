; ModuleID = 'LLVM_IR/gemini_pro-11737.ll'
source_filename = "DATASETv2/gemini_pro-11737.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.client_data = type { i32, ptr, i64 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.epoll_event = type <{ i32, %union.epoll_data }>
%union.epoll_data = type { ptr }

@.str = private unnamed_addr constant [6 x i8] c"fcntl\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"malloc\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [18 x i8] c"Usage: %s <port>\0A\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"socket\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"bind\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"listen\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"set_nonblock\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"epoll_create1\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"epoll_ctl\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"epoll_wait\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"accept\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"read\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [14 x i8] c"Received: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @set_nonblock(i32 noundef %0) #0 {
  %2 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 3, i32 noundef 0)
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  call void @perror(ptr noundef @.str) #8
  br label %11

5:                                                ; preds = %1
  %6 = or i32 %2, 2048
  %7 = call i32 (i32, i32, ...) @fcntl(i32 noundef %0, i32 noundef 4, i32 noundef %6)
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %10

9:                                                ; preds = %5
  call void @perror(ptr noundef @.str) #8
  br label %11

10:                                               ; preds = %5
  br label %11

11:                                               ; preds = %10, %9, %4
  %.0 = phi i32 [ -1, %4 ], [ -1, %9 ], [ 0, %10 ]
  ret i32 %.0
}

declare i32 @fcntl(i32 noundef, i32 noundef, ...) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @create_client_data(i32 noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 24) #9
  %3 = icmp eq ptr %2, null
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  call void @perror(ptr noundef @.str.1) #8
  br label %15

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct.client_data, ptr %2, i32 0, i32 0
  store i32 %0, ptr %6, align 8
  %7 = call noalias ptr @malloc(i64 noundef 4096) #9
  %8 = getelementptr inbounds %struct.client_data, ptr %2, i32 0, i32 1
  store ptr %7, ptr %8, align 8
  %9 = getelementptr inbounds %struct.client_data, ptr %2, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %5
  call void @perror(ptr noundef @.str.1) #8
  call void @free(ptr noundef %2) #10
  br label %15

13:                                               ; preds = %5
  %14 = getelementptr inbounds %struct.client_data, ptr %2, i32 0, i32 2
  store i64 0, ptr %14, align 8
  br label %15

15:                                               ; preds = %13, %12, %4
  %.0 = phi ptr [ null, %4 ], [ null, %12 ], [ %2, %13 ]
  ret ptr %.0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @free_client_data(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.client_data, ptr %0, i32 0, i32 0
  %3 = load i32, ptr %2, align 8
  %4 = call i32 @close(i32 noundef %3)
  %5 = getelementptr inbounds %struct.client_data, ptr %0, i32 0, i32 1
  %6 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %6) #10
  call void @free(ptr noundef %0) #10
  ret void
}

declare i32 @close(i32 noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca %struct.epoll_event, align 1
  %5 = alloca [1024 x %struct.epoll_event], align 16
  %6 = alloca %struct.sockaddr_in, align 4
  %7 = alloca i32, align 4
  %8 = icmp slt i32 %0, 2
  br i1 %8, label %9, label %14

9:                                                ; preds = %2
  %10 = load ptr, ptr @stderr, align 8
  %11 = getelementptr inbounds ptr, ptr %1, i64 0
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef @.str.2, ptr noundef %12)
  br label %158

14:                                               ; preds = %2
  %15 = getelementptr inbounds ptr, ptr %1, i64 1
  %16 = load ptr, ptr %15, align 8
  %17 = call i32 @atoi(ptr noundef %16) #11
  %18 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #10
  %19 = icmp eq i32 %18, -1
  br i1 %19, label %20, label %21

20:                                               ; preds = %14
  call void @perror(ptr noundef @.str.3) #8
  br label %158

21:                                               ; preds = %14
  call void @llvm.memset.p0.i64(ptr align 4 %3, i8 0, i64 16, i1 false)
  %22 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %22, align 4
  %23 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %24 = getelementptr inbounds %struct.in_addr, ptr %23, i32 0, i32 0
  store i32 0, ptr %24, align 4
  %25 = trunc i32 %17 to i16
  %26 = call zeroext i16 @htons(i16 noundef zeroext %25) #12
  %27 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %26, ptr %27, align 2
  %28 = call i32 @bind(i32 noundef %18, ptr noundef %3, i32 noundef 16) #10
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %30, label %31

30:                                               ; preds = %21
  call void @perror(ptr noundef @.str.4) #8
  br label %158

31:                                               ; preds = %21
  %32 = call i32 @listen(i32 noundef %18, i32 noundef 4096) #10
  %33 = icmp eq i32 %32, -1
  br i1 %33, label %34, label %35

34:                                               ; preds = %31
  call void @perror(ptr noundef @.str.5) #8
  br label %158

35:                                               ; preds = %31
  %36 = call i32 @set_nonblock(i32 noundef %18)
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  call void @perror(ptr noundef @.str.6) #8
  br label %158

39:                                               ; preds = %35
  %40 = call i32 @epoll_create1(i32 noundef 0) #10
  %41 = icmp eq i32 %40, -1
  br i1 %41, label %42, label %43

42:                                               ; preds = %39
  call void @perror(ptr noundef @.str.7) #8
  br label %158

43:                                               ; preds = %39
  call void @llvm.memset.p0.i64(ptr align 1 %4, i8 0, i64 12, i1 false)
  %44 = getelementptr inbounds %struct.epoll_event, ptr %4, i32 0, i32 0
  store i32 -2147483647, ptr %44, align 1
  %45 = getelementptr inbounds %struct.epoll_event, ptr %4, i32 0, i32 1
  store i32 %18, ptr %45, align 1
  %46 = call i32 @epoll_ctl(i32 noundef %40, i32 noundef 1, i32 noundef %18, ptr noundef %4) #10
  %47 = icmp eq i32 %46, -1
  br i1 %47, label %48, label %49

48:                                               ; preds = %43
  call void @perror(ptr noundef @.str.8) #8
  br label %158

49:                                               ; preds = %43
  br label %50

50:                                               ; preds = %157, %58, %49
  %51 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %5, i64 0, i64 0
  %52 = call i32 @epoll_wait(i32 noundef %40, ptr noundef %51, i32 noundef 1024, i32 noundef -1)
  %53 = icmp eq i32 %52, -1
  br i1 %53, label %54, label %60

54:                                               ; preds = %50
  %55 = call ptr @__errno_location() #12
  %56 = load i32, ptr %55, align 4
  %57 = icmp eq i32 %56, 4
  br i1 %57, label %58, label %59

58:                                               ; preds = %54
  br label %50

59:                                               ; preds = %54
  call void @perror(ptr noundef @.str.9) #8
  br label %158

60:                                               ; preds = %50
  br label %61

61:                                               ; preds = %155, %60
  %.01 = phi i32 [ 0, %60 ], [ %156, %155 ]
  %62 = icmp slt i32 %.01, %52
  br i1 %62, label %63, label %157

63:                                               ; preds = %61
  %64 = sext i32 %.01 to i64
  %65 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %5, i64 0, i64 %64
  %66 = getelementptr inbounds %struct.epoll_event, ptr %65, i32 0, i32 1
  %67 = load i32, ptr %66, align 4
  %68 = icmp eq i32 %67, %18
  br i1 %68, label %69, label %88

69:                                               ; preds = %63
  store i32 16, ptr %7, align 4
  %70 = call i32 @accept(i32 noundef %18, ptr noundef %6, ptr noundef %7)
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %72, label %73

72:                                               ; preds = %69
  call void @perror(ptr noundef @.str.10) #8
  br label %155

73:                                               ; preds = %69
  %74 = call i32 @set_nonblock(i32 noundef %70)
  %75 = icmp eq i32 %74, -1
  br i1 %75, label %76, label %77

76:                                               ; preds = %73
  call void @perror(ptr noundef @.str.6) #8
  br label %155

77:                                               ; preds = %73
  %78 = call ptr @create_client_data(i32 noundef %70)
  %79 = icmp eq ptr %78, null
  br i1 %79, label %80, label %81

80:                                               ; preds = %77
  br label %155

81:                                               ; preds = %77
  %82 = getelementptr inbounds %struct.epoll_event, ptr %4, i32 0, i32 0
  store i32 -2147483647, ptr %82, align 1
  %83 = getelementptr inbounds %struct.epoll_event, ptr %4, i32 0, i32 1
  store ptr %78, ptr %83, align 1
  %84 = call i32 @epoll_ctl(i32 noundef %40, i32 noundef 1, i32 noundef %70, ptr noundef %4) #10
  %85 = icmp eq i32 %84, -1
  br i1 %85, label %86, label %87

86:                                               ; preds = %81
  call void @perror(ptr noundef @.str.8) #8
  call void @free_client_data(ptr noundef %78)
  br label %155

87:                                               ; preds = %81
  br label %154

88:                                               ; preds = %63
  %89 = sext i32 %.01 to i64
  %90 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %5, i64 0, i64 %89
  %91 = getelementptr inbounds %struct.epoll_event, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 4
  %93 = sext i32 %.01 to i64
  %94 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %5, i64 0, i64 %93
  %95 = getelementptr inbounds %struct.epoll_event, ptr %94, i32 0, i32 0
  %96 = load i32, ptr %95, align 4
  %97 = and i32 %96, 1
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %153

99:                                               ; preds = %88
  %100 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 0
  %101 = load i32, ptr %100, align 8
  %102 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 2
  %105 = load i64, ptr %104, align 8
  %106 = getelementptr inbounds i8, ptr %103, i64 %105
  %107 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 2
  %108 = load i64, ptr %107, align 8
  %109 = sub i64 4096, %108
  %110 = call i64 @read(i32 noundef %101, ptr noundef %106, i64 noundef %109)
  %111 = icmp eq i64 %110, -1
  br i1 %111, label %112, label %118

112:                                              ; preds = %99
  %113 = call ptr @__errno_location() #12
  %114 = load i32, ptr %113, align 4
  %115 = icmp eq i32 %114, 11
  br i1 %115, label %116, label %117

116:                                              ; preds = %112
  br label %155

117:                                              ; preds = %112
  call void @perror(ptr noundef @.str.11) #8
  call void @free_client_data(ptr noundef %92)
  br label %155

118:                                              ; preds = %99
  %119 = icmp eq i64 %110, 0
  br i1 %119, label %120, label %127

120:                                              ; preds = %118
  %121 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = call i32 @close(i32 noundef %122)
  %124 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = call i32 @epoll_ctl(i32 noundef %40, i32 noundef 2, i32 noundef %125, ptr noundef null) #10
  call void @free_client_data(ptr noundef %92)
  br label %155

127:                                              ; preds = %118
  br label %128

128:                                              ; preds = %127
  %129 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 2
  %130 = load i64, ptr %129, align 8
  %131 = add i64 %130, %110
  store i64 %131, ptr %129, align 8
  %132 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 1
  %133 = load ptr, ptr %132, align 8
  %134 = call ptr @strstr(ptr noundef %133, ptr noundef @.str.12) #11
  %135 = icmp ne ptr %134, null
  br i1 %135, label %136, label %152

136:                                              ; preds = %128
  %137 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 1
  %138 = load ptr, ptr %137, align 8
  %139 = call ptr @strchr(ptr noundef %138, i32 noundef 10) #11
  store i8 0, ptr %139, align 1
  %140 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 1
  %141 = load ptr, ptr %140, align 8
  %142 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %141)
  %143 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 1
  %146 = load ptr, ptr %145, align 8
  %147 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 1
  %148 = load ptr, ptr %147, align 8
  %149 = call i64 @strlen(ptr noundef %148) #11
  %150 = call i64 @write(i32 noundef %144, ptr noundef %146, i64 noundef %149)
  %151 = getelementptr inbounds %struct.client_data, ptr %92, i32 0, i32 2
  store i64 0, ptr %151, align 8
  br label %152

152:                                              ; preds = %136, %128
  br label %153

153:                                              ; preds = %152, %88
  br label %154

154:                                              ; preds = %153, %87
  br label %155

155:                                              ; preds = %154, %120, %117, %116, %86, %80, %76, %72
  %156 = add nsw i32 %.01, 1
  br label %61, !llvm.loop !6

157:                                              ; preds = %61
  br label %50

158:                                              ; preds = %59, %48, %42, %38, %34, %30, %20, %9
  ret i32 1
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #5

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #7

; Function Attrs: nounwind
declare i32 @bind(i32 noundef, ptr noundef, i32 noundef) #4

; Function Attrs: nounwind
declare i32 @listen(i32 noundef, i32 noundef) #4

; Function Attrs: nounwind
declare i32 @epoll_create1(i32 noundef) #4

; Function Attrs: nounwind
declare i32 @epoll_ctl(i32 noundef, i32 noundef, i32 noundef, ptr noundef) #4

declare i32 @epoll_wait(i32 noundef, ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #7

declare i32 @accept(i32 noundef, ptr noundef, ptr noundef) #1

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strstr(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #5

declare i32 @printf(ptr noundef, ...) #1

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { cold }
attributes #9 = { nounwind allocsize(0) }
attributes #10 = { nounwind }
attributes #11 = { nounwind willreturn memory(read) }
attributes #12 = { nounwind willreturn memory(none) }

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
