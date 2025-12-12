; ModuleID = 'DATASETv2/gemini_pro-27897.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.sockaddr_in, align 4
  %8 = alloca [1024 x i8], align 16
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 4
  br i1 %13, label %14, label %19

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %17)
  store i32 1, ptr %3, align 4
  br label %166

19:                                               ; preds = %2
  %20 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #7
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %23, label %24

23:                                               ; preds = %19
  call void @perror(ptr noundef @.str.1) #8
  store i32 1, ptr %3, align 4
  br label %166

24:                                               ; preds = %19
  call void @llvm.memset.p0.i64(ptr align 4 %7, i8 0, i64 16, i1 false)
  %25 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 0
  store i16 2, ptr %25, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 2
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #9
  %30 = trunc i32 %29 to i16
  %31 = call zeroext i16 @htons(i16 noundef zeroext %30) #10
  %32 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 1
  store i16 %31, ptr %32, align 2
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds ptr, ptr %33, i64 1
  %35 = load ptr, ptr %34, align 8
  %36 = call i32 @inet_addr(ptr noundef %35) #7
  %37 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 2
  %38 = getelementptr inbounds %struct.in_addr, ptr %37, i32 0, i32 0
  store i32 %36, ptr %38, align 4
  %39 = load i32, ptr %6, align 4
  %40 = call i32 @connect(i32 noundef %39, ptr noundef %7, i32 noundef 16)
  %41 = icmp eq i32 %40, -1
  br i1 %41, label %42, label %43

42:                                               ; preds = %24
  call void @perror(ptr noundef @.str.2) #8
  store i32 1, ptr %3, align 4
  br label %166

43:                                               ; preds = %24
  store ptr @.str.3, ptr %9, align 8
  %44 = load i32, ptr %6, align 4
  %45 = load ptr, ptr %9, align 8
  %46 = load ptr, ptr %9, align 8
  %47 = call i64 @strlen(ptr noundef %46) #9
  %48 = call i64 @send(i32 noundef %44, ptr noundef %45, i64 noundef %47, i32 noundef 0)
  %49 = trunc i64 %48 to i32
  store i32 %49, ptr %10, align 4
  %50 = load i32, ptr %10, align 4
  %51 = icmp eq i32 %50, -1
  br i1 %51, label %52, label %53

52:                                               ; preds = %43
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

53:                                               ; preds = %43
  %54 = load i32, ptr %6, align 4
  %55 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %56 = call i64 @recv(i32 noundef %54, ptr noundef %55, i64 noundef 1024, i32 noundef 0)
  %57 = trunc i64 %56 to i32
  store i32 %57, ptr %11, align 4
  %58 = load i32, ptr %11, align 4
  %59 = icmp eq i32 %58, -1
  br i1 %59, label %60, label %61

60:                                               ; preds = %53
  call void @perror(ptr noundef @.str.5) #8
  store i32 1, ptr %3, align 4
  br label %166

61:                                               ; preds = %53
  %62 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %62)
  store ptr @.str.7, ptr %9, align 8
  %64 = load i32, ptr %6, align 4
  %65 = load ptr, ptr %9, align 8
  %66 = load ptr, ptr %9, align 8
  %67 = call i64 @strlen(ptr noundef %66) #9
  %68 = call i64 @send(i32 noundef %64, ptr noundef %65, i64 noundef %67, i32 noundef 0)
  %69 = trunc i64 %68 to i32
  store i32 %69, ptr %10, align 4
  %70 = load i32, ptr %10, align 4
  %71 = icmp eq i32 %70, -1
  br i1 %71, label %72, label %73

72:                                               ; preds = %61
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

73:                                               ; preds = %61
  %74 = load i32, ptr %6, align 4
  %75 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %76 = call i64 @recv(i32 noundef %74, ptr noundef %75, i64 noundef 1024, i32 noundef 0)
  %77 = trunc i64 %76 to i32
  store i32 %77, ptr %11, align 4
  %78 = load i32, ptr %11, align 4
  %79 = icmp eq i32 %78, -1
  br i1 %79, label %80, label %81

80:                                               ; preds = %73
  call void @perror(ptr noundef @.str.5) #8
  store i32 1, ptr %3, align 4
  br label %166

81:                                               ; preds = %73
  %82 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %82)
  store ptr @.str.8, ptr %9, align 8
  %84 = load i32, ptr %6, align 4
  %85 = load ptr, ptr %9, align 8
  %86 = load ptr, ptr %9, align 8
  %87 = call i64 @strlen(ptr noundef %86) #9
  %88 = call i64 @send(i32 noundef %84, ptr noundef %85, i64 noundef %87, i32 noundef 0)
  %89 = trunc i64 %88 to i32
  store i32 %89, ptr %10, align 4
  %90 = load i32, ptr %10, align 4
  %91 = icmp eq i32 %90, -1
  br i1 %91, label %92, label %93

92:                                               ; preds = %81
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

93:                                               ; preds = %81
  %94 = load i32, ptr %6, align 4
  %95 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %96 = call i64 @recv(i32 noundef %94, ptr noundef %95, i64 noundef 1024, i32 noundef 0)
  %97 = trunc i64 %96 to i32
  store i32 %97, ptr %11, align 4
  %98 = load i32, ptr %11, align 4
  %99 = icmp eq i32 %98, -1
  br i1 %99, label %100, label %101

100:                                              ; preds = %93
  call void @perror(ptr noundef @.str.5) #8
  store i32 1, ptr %3, align 4
  br label %166

101:                                              ; preds = %93
  %102 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %103 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %102)
  store ptr @.str.9, ptr %9, align 8
  %104 = load i32, ptr %6, align 4
  %105 = load ptr, ptr %9, align 8
  %106 = load ptr, ptr %9, align 8
  %107 = call i64 @strlen(ptr noundef %106) #9
  %108 = call i64 @send(i32 noundef %104, ptr noundef %105, i64 noundef %107, i32 noundef 0)
  %109 = trunc i64 %108 to i32
  store i32 %109, ptr %10, align 4
  %110 = load i32, ptr %10, align 4
  %111 = icmp eq i32 %110, -1
  br i1 %111, label %112, label %113

112:                                              ; preds = %101
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

113:                                              ; preds = %101
  %114 = load i32, ptr %6, align 4
  %115 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %116 = call i64 @recv(i32 noundef %114, ptr noundef %115, i64 noundef 1024, i32 noundef 0)
  %117 = trunc i64 %116 to i32
  store i32 %117, ptr %11, align 4
  %118 = load i32, ptr %11, align 4
  %119 = icmp eq i32 %118, -1
  br i1 %119, label %120, label %121

120:                                              ; preds = %113
  call void @perror(ptr noundef @.str.5) #8
  store i32 1, ptr %3, align 4
  br label %166

121:                                              ; preds = %113
  %122 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %123 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %122)
  store ptr @.str.10, ptr %9, align 8
  %124 = load i32, ptr %6, align 4
  %125 = load ptr, ptr %9, align 8
  %126 = load ptr, ptr %9, align 8
  %127 = call i64 @strlen(ptr noundef %126) #9
  %128 = call i64 @send(i32 noundef %124, ptr noundef %125, i64 noundef %127, i32 noundef 0)
  %129 = trunc i64 %128 to i32
  store i32 %129, ptr %10, align 4
  %130 = load i32, ptr %10, align 4
  %131 = icmp eq i32 %130, -1
  br i1 %131, label %132, label %133

132:                                              ; preds = %121
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

133:                                              ; preds = %121
  store ptr @.str.11, ptr %9, align 8
  %134 = load i32, ptr %6, align 4
  %135 = load ptr, ptr %9, align 8
  %136 = load ptr, ptr %9, align 8
  %137 = call i64 @strlen(ptr noundef %136) #9
  %138 = call i64 @send(i32 noundef %134, ptr noundef %135, i64 noundef %137, i32 noundef 0)
  %139 = trunc i64 %138 to i32
  store i32 %139, ptr %10, align 4
  %140 = load i32, ptr %10, align 4
  %141 = icmp eq i32 %140, -1
  br i1 %141, label %142, label %143

142:                                              ; preds = %133
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

143:                                              ; preds = %133
  %144 = load i32, ptr %6, align 4
  %145 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %146 = call i64 @recv(i32 noundef %144, ptr noundef %145, i64 noundef 1024, i32 noundef 0)
  %147 = trunc i64 %146 to i32
  store i32 %147, ptr %11, align 4
  %148 = load i32, ptr %11, align 4
  %149 = icmp eq i32 %148, -1
  br i1 %149, label %150, label %151

150:                                              ; preds = %143
  call void @perror(ptr noundef @.str.5) #8
  store i32 1, ptr %3, align 4
  br label %166

151:                                              ; preds = %143
  %152 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %152)
  store ptr @.str.12, ptr %9, align 8
  %154 = load i32, ptr %6, align 4
  %155 = load ptr, ptr %9, align 8
  %156 = load ptr, ptr %9, align 8
  %157 = call i64 @strlen(ptr noundef %156) #9
  %158 = call i64 @send(i32 noundef %154, ptr noundef %155, i64 noundef %157, i32 noundef 0)
  %159 = trunc i64 %158 to i32
  store i32 %159, ptr %10, align 4
  %160 = load i32, ptr %10, align 4
  %161 = icmp eq i32 %160, -1
  br i1 %161, label %162, label %163

162:                                              ; preds = %151
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %166

163:                                              ; preds = %151
  %164 = load i32, ptr %6, align 4
  %165 = call i32 @close(i32 noundef %164)
  store i32 0, ptr %3, align 4
  br label %166

166:                                              ; preds = %163, %162, %150, %142, %132, %120, %112, %100, %92, %80, %72, %60, %52, %42, %23, %14
  %167 = load i32, ptr %3, align 4
  ret i32 %167
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
