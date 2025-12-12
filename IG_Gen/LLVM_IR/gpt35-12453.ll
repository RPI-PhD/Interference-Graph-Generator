; ModuleID = 'DATASETv2/gpt35-12453.c'
source_filename = "DATASETv2/gpt35-12453.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [23 x i8] c"Usage: %s <IP> <port>\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Failed to create socket.\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Socket created.\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Invalid IP address.\0A\00", align 1
@.str.4 = private unnamed_addr constant [30 x i8] c"Failed to connect to server.\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"Connected to server.\0A\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"Username: \00", align 1
@stdin = external global ptr, align 8
@.str.7 = private unnamed_addr constant [11 x i8] c"Password: \00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"USER %s%s\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"ftp> \00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"LIST\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"QUIT\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"GET\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"GET %s\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"Downloading %s...\0A\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.18 = private unnamed_addr constant [24 x i8] c"Failed to create file.\0A\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c"File downloaded.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.sockaddr_in, align 4
  %8 = alloca [256 x i8], align 16
  %9 = alloca [256 x i8], align 16
  %10 = alloca [1024 x i8], align 16
  %11 = alloca [1024 x i8], align 16
  %12 = alloca [256 x i8], align 16
  %13 = alloca [1024 x i8], align 16
  %14 = alloca [1024 x i8], align 16
  %15 = alloca [256 x i8], align 16
  %16 = alloca ptr, align 8
  %17 = alloca [1024 x i8], align 16
  %18 = alloca i32, align 4
  %19 = alloca [1024 x i8], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %20 = load i32, ptr %4, align 4
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %27

22:                                               ; preds = %2
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 0
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %25)
  store i32 1, ptr %3, align 4
  br label %155

27:                                               ; preds = %2
  %28 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #5
  store i32 %28, ptr %6, align 4
  %29 = load i32, ptr %6, align 4
  %30 = icmp eq i32 %29, -1
  br i1 %30, label %31, label %33

31:                                               ; preds = %27
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 1, ptr %3, align 4
  br label %155

33:                                               ; preds = %27
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %35 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 0
  store i16 2, ptr %35, align 4
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i64 2
  %38 = load ptr, ptr %37, align 8
  %39 = call i32 @atoi(ptr noundef %38) #6
  %40 = trunc i32 %39 to i16
  %41 = call zeroext i16 @htons(i16 noundef zeroext %40) #7
  %42 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 1
  store i16 %41, ptr %42, align 2
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds ptr, ptr %43, i64 1
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.sockaddr_in, ptr %7, i32 0, i32 2
  %47 = call i32 @inet_pton(i32 noundef 2, ptr noundef %45, ptr noundef %46) #5
  %48 = icmp sle i32 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %33
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 1, ptr %3, align 4
  br label %155

51:                                               ; preds = %33
  %52 = load i32, ptr %6, align 4
  %53 = call i32 @connect(i32 noundef %52, ptr noundef %7, i32 noundef 16)
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %51
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 1, ptr %3, align 4
  br label %155

57:                                               ; preds = %51
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %59 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %60 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %61 = load ptr, ptr @stdin, align 8
  %62 = call ptr @fgets(ptr noundef %60, i32 noundef 256, ptr noundef %61)
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %64 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  %65 = load ptr, ptr @stdin, align 8
  %66 = call ptr @fgets(ptr noundef %64, i32 noundef 256, ptr noundef %65)
  %67 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %68 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %69 = getelementptr inbounds [256 x i8], ptr %9, i64 0, i64 0
  %70 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %67, ptr noundef @.str.8, ptr noundef %68, ptr noundef %69) #5
  %71 = load i32, ptr %6, align 4
  %72 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %73 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %74 = call i64 @strlen(ptr noundef %73) #6
  %75 = call i64 @send(i32 noundef %71, ptr noundef %72, i64 noundef %74, i32 noundef 0)
  %76 = load i32, ptr %6, align 4
  %77 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %78 = call i64 @recv(i32 noundef %76, ptr noundef %77, i64 noundef 1024, i32 noundef 0)
  %79 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %79)
  br label %81

81:                                               ; preds = %57, %124, %151
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %83 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %84 = load ptr, ptr @stdin, align 8
  %85 = call ptr @fgets(ptr noundef %83, i32 noundef 256, ptr noundef %84)
  %86 = load i32, ptr %6, align 4
  %87 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %88 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %89 = call i64 @strlen(ptr noundef %88) #6
  %90 = call i64 @send(i32 noundef %86, ptr noundef %87, i64 noundef %89, i32 noundef 0)
  %91 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %92 = call i32 @strncmp(ptr noundef %91, ptr noundef @.str.11, i64 noundef 4) #6
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %94, label %100

94:                                               ; preds = %81
  %95 = load i32, ptr %6, align 4
  %96 = getelementptr inbounds [1024 x i8], ptr %13, i64 0, i64 0
  %97 = call i64 @recv(i32 noundef %95, ptr noundef %96, i64 noundef 1024, i32 noundef 0)
  %98 = getelementptr inbounds [1024 x i8], ptr %13, i64 0, i64 0
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %98)
  br label %151

100:                                              ; preds = %81
  %101 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %102 = call i32 @strncmp(ptr noundef %101, ptr noundef @.str.13, i64 noundef 4) #6
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %110

104:                                              ; preds = %100
  %105 = load i32, ptr %6, align 4
  %106 = getelementptr inbounds [1024 x i8], ptr %14, i64 0, i64 0
  %107 = call i64 @recv(i32 noundef %105, ptr noundef %106, i64 noundef 1024, i32 noundef 0)
  %108 = getelementptr inbounds [1024 x i8], ptr %14, i64 0, i64 0
  %109 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %108)
  br label %152

110:                                              ; preds = %100
  %111 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %112 = call i32 @strncmp(ptr noundef %111, ptr noundef @.str.14, i64 noundef 3) #6
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %143

114:                                              ; preds = %110
  %115 = getelementptr inbounds [256 x i8], ptr %12, i64 0, i64 0
  %116 = getelementptr inbounds [256 x i8], ptr %15, i64 0, i64 0
  %117 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %115, ptr noundef @.str.15, ptr noundef %116) #5
  %118 = getelementptr inbounds [256 x i8], ptr %15, i64 0, i64 0
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %118)
  %120 = getelementptr inbounds [256 x i8], ptr %15, i64 0, i64 0
  %121 = call noalias ptr @fopen(ptr noundef %120, ptr noundef @.str.17)
  store ptr %121, ptr %16, align 8
  %122 = load ptr, ptr %16, align 8
  %123 = icmp eq ptr %122, null
  br i1 %123, label %124, label %126

124:                                              ; preds = %114
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %81

126:                                              ; preds = %114
  br label %127

127:                                              ; preds = %133, %126
  %128 = load i32, ptr %6, align 4
  %129 = getelementptr inbounds [1024 x i8], ptr %17, i64 0, i64 0
  %130 = call i64 @recv(i32 noundef %128, ptr noundef %129, i64 noundef 1024, i32 noundef 0)
  %131 = trunc i64 %130 to i32
  store i32 %131, ptr %18, align 4
  %132 = icmp sgt i32 %131, 0
  br i1 %132, label %133, label %139

133:                                              ; preds = %127
  %134 = getelementptr inbounds [1024 x i8], ptr %17, i64 0, i64 0
  %135 = load i32, ptr %18, align 4
  %136 = sext i32 %135 to i64
  %137 = load ptr, ptr %16, align 8
  %138 = call i64 @fwrite(ptr noundef %134, i64 noundef 1, i64 noundef %136, ptr noundef %137)
  br label %127, !llvm.loop !6

139:                                              ; preds = %127
  %140 = load ptr, ptr %16, align 8
  %141 = call i32 @fclose(ptr noundef %140)
  %142 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %149

143:                                              ; preds = %110
  %144 = load i32, ptr %6, align 4
  %145 = getelementptr inbounds [1024 x i8], ptr %19, i64 0, i64 0
  %146 = call i64 @recv(i32 noundef %144, ptr noundef %145, i64 noundef 1024, i32 noundef 0)
  %147 = getelementptr inbounds [1024 x i8], ptr %19, i64 0, i64 0
  %148 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %147)
  br label %149

149:                                              ; preds = %143, %139
  br label %150

150:                                              ; preds = %149
  br label %151

151:                                              ; preds = %150, %94
  br label %81

152:                                              ; preds = %104
  %153 = load i32, ptr %6, align 4
  %154 = call i32 @close(i32 noundef %153)
  store i32 0, ptr %3, align 4
  br label %155

155:                                              ; preds = %152, %55, %49, %31, %22
  %156 = load i32, ptr %3, align 4
  ret i32 %156
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

; Function Attrs: nounwind
declare i32 @inet_pton(i32 noundef, ptr noundef, ptr noundef) #2

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #2

declare i64 @send(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #4

declare i64 @recv(i32 noundef, ptr noundef, i64 noundef, i32 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind willreturn memory(none) }

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
