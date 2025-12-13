; ModuleID = 'LLVM_IR/gpt35-12453.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.sockaddr_in, align 4
  %4 = alloca [256 x i8], align 16
  %5 = alloca [256 x i8], align 16
  %6 = alloca [1024 x i8], align 16
  %7 = alloca [1024 x i8], align 16
  %8 = alloca [256 x i8], align 16
  %9 = alloca [1024 x i8], align 16
  %10 = alloca [1024 x i8], align 16
  %11 = alloca [256 x i8], align 16
  %12 = alloca [1024 x i8], align 16
  %13 = alloca [1024 x i8], align 16
  %14 = icmp ne i32 %0, 3
  br i1 %14, label %15, label %19

15:                                               ; preds = %2
  %16 = getelementptr inbounds ptr, ptr %1, i64 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %17)
  br label %131

19:                                               ; preds = %2
  %20 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #5
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %24

22:                                               ; preds = %19
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %131

24:                                               ; preds = %19
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %26 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 0
  store i16 2, ptr %26, align 4
  %27 = getelementptr inbounds ptr, ptr %1, i64 2
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #6
  %30 = trunc i32 %29 to i16
  %31 = call zeroext i16 @htons(i16 noundef zeroext %30) #7
  %32 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 1
  store i16 %31, ptr %32, align 2
  %33 = getelementptr inbounds ptr, ptr %1, i64 1
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.sockaddr_in, ptr %3, i32 0, i32 2
  %36 = call i32 @inet_pton(i32 noundef 2, ptr noundef %34, ptr noundef %35) #5
  %37 = icmp sle i32 %36, 0
  br i1 %37, label %38, label %40

38:                                               ; preds = %24
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %131

40:                                               ; preds = %24
  %41 = call i32 @connect(i32 noundef %20, ptr noundef %3, i32 noundef 16)
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %43, label %45

43:                                               ; preds = %40
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %131

45:                                               ; preds = %40
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %48 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %49 = load ptr, ptr @stdin, align 8
  %50 = call ptr @fgets(ptr noundef %48, i32 noundef 256, ptr noundef %49)
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %52 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %53 = load ptr, ptr @stdin, align 8
  %54 = call ptr @fgets(ptr noundef %52, i32 noundef 256, ptr noundef %53)
  %55 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %56 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %57 = getelementptr inbounds [256 x i8], ptr %5, i64 0, i64 0
  %58 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %55, ptr noundef @.str.8, ptr noundef %56, ptr noundef %57) #5
  %59 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %60 = getelementptr inbounds [1024 x i8], ptr %6, i64 0, i64 0
  %61 = call i64 @strlen(ptr noundef %60) #6
  %62 = call i64 @send(i32 noundef %20, ptr noundef %59, i64 noundef %61, i32 noundef 0)
  %63 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %64 = call i64 @recv(i32 noundef %20, ptr noundef %63, i64 noundef 1024, i32 noundef 0)
  %65 = getelementptr inbounds [1024 x i8], ptr %7, i64 0, i64 0
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %65)
  br label %67

67:                                               ; preds = %128, %106, %45
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %69 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %70 = load ptr, ptr @stdin, align 8
  %71 = call ptr @fgets(ptr noundef %69, i32 noundef 256, ptr noundef %70)
  %72 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %73 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %74 = call i64 @strlen(ptr noundef %73) #6
  %75 = call i64 @send(i32 noundef %20, ptr noundef %72, i64 noundef %74, i32 noundef 0)
  %76 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %77 = call i32 @strncmp(ptr noundef %76, ptr noundef @.str.11, i64 noundef 4) #6
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %84

79:                                               ; preds = %67
  %80 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %81 = call i64 @recv(i32 noundef %20, ptr noundef %80, i64 noundef 1024, i32 noundef 0)
  %82 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, ptr noundef %82)
  br label %128

84:                                               ; preds = %67
  %85 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %86 = call i32 @strncmp(ptr noundef %85, ptr noundef @.str.13, i64 noundef 4) #6
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %93

88:                                               ; preds = %84
  %89 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %90 = call i64 @recv(i32 noundef %20, ptr noundef %89, i64 noundef 1024, i32 noundef 0)
  %91 = getelementptr inbounds [1024 x i8], ptr %10, i64 0, i64 0
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %91)
  br label %129

93:                                               ; preds = %84
  %94 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %95 = call i32 @strncmp(ptr noundef %94, ptr noundef @.str.14, i64 noundef 3) #6
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %97, label %121

97:                                               ; preds = %93
  %98 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %99 = getelementptr inbounds [256 x i8], ptr %11, i64 0, i64 0
  %100 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %98, ptr noundef @.str.15, ptr noundef %99) #5
  %101 = getelementptr inbounds [256 x i8], ptr %11, i64 0, i64 0
  %102 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %101)
  %103 = getelementptr inbounds [256 x i8], ptr %11, i64 0, i64 0
  %104 = call noalias ptr @fopen(ptr noundef %103, ptr noundef @.str.17)
  %105 = icmp eq ptr %104, null
  br i1 %105, label %106, label %108

106:                                              ; preds = %97
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %67

108:                                              ; preds = %97
  br label %109

109:                                              ; preds = %114, %108
  %110 = getelementptr inbounds [1024 x i8], ptr %12, i64 0, i64 0
  %111 = call i64 @recv(i32 noundef %20, ptr noundef %110, i64 noundef 1024, i32 noundef 0)
  %112 = trunc i64 %111 to i32
  %113 = icmp sgt i32 %112, 0
  br i1 %113, label %114, label %118

114:                                              ; preds = %109
  %115 = getelementptr inbounds [1024 x i8], ptr %12, i64 0, i64 0
  %116 = sext i32 %112 to i64
  %117 = call i64 @fwrite(ptr noundef %115, i64 noundef 1, i64 noundef %116, ptr noundef %104)
  br label %109, !llvm.loop !6

118:                                              ; preds = %109
  %119 = call i32 @fclose(ptr noundef %104)
  %120 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %126

121:                                              ; preds = %93
  %122 = getelementptr inbounds [1024 x i8], ptr %13, i64 0, i64 0
  %123 = call i64 @recv(i32 noundef %20, ptr noundef %122, i64 noundef 1024, i32 noundef 0)
  %124 = getelementptr inbounds [1024 x i8], ptr %13, i64 0, i64 0
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %124)
  br label %126

126:                                              ; preds = %121, %118
  br label %127

127:                                              ; preds = %126
  br label %128

128:                                              ; preds = %127, %79
  br label %67

129:                                              ; preds = %88
  %130 = call i32 @close(i32 noundef %20)
  br label %131

131:                                              ; preds = %129, %43, %38, %22, %15
  %.0 = phi i32 [ 1, %15 ], [ 1, %22 ], [ 1, %38 ], [ 1, %43 ], [ 0, %129 ]
  ret i32 %.0
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
