; ModuleID = 'DATASETv2/gpt35-48156.c'
source_filename = "DATASETv2/gpt35-48156.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.hostent = type { ptr, ptr, i32, i32, ptr }

@.str = private unnamed_addr constant [29 x i8] c"POP3 Client Example Program\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"===========================\0A\00", align 1
@stderr = external global ptr, align 8
@.str.2 = private unnamed_addr constant [25 x i8] c"Usage: %s hostname port\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"ERROR opening socket\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"ERROR, no such host\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"ERROR connecting\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"Connected to server %s on port %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"ERROR reading from socket\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"Username: \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.11 = private unnamed_addr constant [10 x i8] c"USER %s\0D\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"ERROR writing to socket\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"Password: \00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c"PASS %s\0D\0A\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"LIST\0D\0A\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"QUIT\0D\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.sockaddr_in, align 4
  %10 = alloca ptr, align 8
  %11 = alloca [1024 x i8], align 16
  %12 = alloca [1024 x i8], align 16
  %13 = alloca [1024 x i8], align 16
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %16, 3
  br i1 %17, label %18, label %24

18:                                               ; preds = %2
  %19 = load ptr, ptr @stderr, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 0
  %22 = load ptr, ptr %21, align 8
  %23 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str.2, ptr noundef %22)
  store i32 1, ptr %3, align 4
  br label %183

24:                                               ; preds = %2
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 2
  %27 = load ptr, ptr %26, align 8
  %28 = call i32 @atoi(ptr noundef %27) #8
  store i32 %28, ptr %7, align 4
  %29 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #9
  store i32 %29, ptr %6, align 4
  %30 = load i32, ptr %6, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %24
  call void @perror(ptr noundef @.str.3) #10
  store i32 1, ptr %3, align 4
  br label %183

33:                                               ; preds = %24
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i64 1
  %36 = load ptr, ptr %35, align 8
  %37 = call ptr @gethostbyname(ptr noundef %36)
  store ptr %37, ptr %10, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = icmp eq ptr %38, null
  br i1 %39, label %40, label %43

40:                                               ; preds = %33
  %41 = load ptr, ptr @stderr, align 8
  %42 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.4)
  store i32 1, ptr %3, align 4
  br label %183

43:                                               ; preds = %33
  call void @llvm.memset.p0.i64(ptr align 4 %9, i8 0, i64 16, i1 false)
  %44 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 0
  store i16 2, ptr %44, align 4
  %45 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 2
  %46 = getelementptr inbounds %struct.in_addr, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr inbounds %struct.hostent, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds ptr, ptr %49, i64 0
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds %struct.hostent, ptr %52, i32 0, i32 3
  %54 = load i32, ptr %53, align 4
  %55 = sext i32 %54 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %46, ptr align 1 %51, i64 %55, i1 false)
  %56 = load i32, ptr %7, align 4
  %57 = trunc i32 %56 to i16
  %58 = call zeroext i16 @htons(i16 noundef zeroext %57) #11
  %59 = getelementptr inbounds %struct.sockaddr_in, ptr %9, i32 0, i32 1
  store i16 %58, ptr %59, align 2
  %60 = load i32, ptr %6, align 4
  %61 = call i32 @connect(i32 noundef %60, ptr noundef %9, i32 noundef 16)
  %62 = icmp slt i32 %61, 0
  br i1 %62, label %63, label %64

63:                                               ; preds = %43
  call void @perror(ptr noundef @.str.5) #10
  store i32 1, ptr %3, align 4
  br label %183

64:                                               ; preds = %43
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds ptr, ptr %65, i64 1
  %67 = load ptr, ptr %66, align 8
  %68 = load i32, ptr %7, align 4
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %67, i32 noundef %68)
  %70 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %70, i8 0, i64 1024, i1 false)
  %71 = load i32, ptr %6, align 4
  %72 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %73 = call i64 @read(i32 noundef %71, ptr noundef %72, i64 noundef 1023)
  %74 = trunc i64 %73 to i32
  store i32 %74, ptr %8, align 4
  %75 = load i32, ptr %8, align 4
  %76 = icmp slt i32 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %64
  call void @perror(ptr noundef @.str.7) #10
  store i32 1, ptr %3, align 4
  br label %183

78:                                               ; preds = %64
  %79 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %79)
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %82 = getelementptr inbounds [1024 x i8], ptr %12, i64 0, i64 0
  %83 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %82)
  %84 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %85 = getelementptr inbounds [1024 x i8], ptr %12, i64 0, i64 0
  %86 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %84, ptr noundef @.str.11, ptr noundef %85) #9
  %87 = load i32, ptr %6, align 4
  %88 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %89 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %90 = call i64 @strlen(ptr noundef %89) #8
  %91 = call i64 @write(i32 noundef %87, ptr noundef %88, i64 noundef %90)
  %92 = trunc i64 %91 to i32
  store i32 %92, ptr %8, align 4
  %93 = load i32, ptr %8, align 4
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %96

95:                                               ; preds = %78
  call void @perror(ptr noundef @.str.12) #10
  store i32 1, ptr %3, align 4
  br label %183

96:                                               ; preds = %78
  %97 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %97, i8 0, i64 1024, i1 false)
  %98 = load i32, ptr %6, align 4
  %99 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %100 = call i64 @read(i32 noundef %98, ptr noundef %99, i64 noundef 1023)
  %101 = trunc i64 %100 to i32
  store i32 %101, ptr %8, align 4
  %102 = load i32, ptr %8, align 4
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %105

104:                                              ; preds = %96
  call void @perror(ptr noundef @.str.7) #10
  store i32 1, ptr %3, align 4
  br label %183

105:                                              ; preds = %96
  %106 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %106)
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %109 = getelementptr inbounds [1024 x i8], ptr %13, i64 0, i64 0
  %110 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.10, ptr noundef %109)
  %111 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %112 = getelementptr inbounds [1024 x i8], ptr %13, i64 0, i64 0
  %113 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %111, ptr noundef @.str.14, ptr noundef %112) #9
  %114 = load i32, ptr %6, align 4
  %115 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %116 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %117 = call i64 @strlen(ptr noundef %116) #8
  %118 = call i64 @write(i32 noundef %114, ptr noundef %115, i64 noundef %117)
  %119 = trunc i64 %118 to i32
  store i32 %119, ptr %8, align 4
  %120 = load i32, ptr %8, align 4
  %121 = icmp slt i32 %120, 0
  br i1 %121, label %122, label %123

122:                                              ; preds = %105
  call void @perror(ptr noundef @.str.12) #10
  store i32 1, ptr %3, align 4
  br label %183

123:                                              ; preds = %105
  %124 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %124, i8 0, i64 1024, i1 false)
  %125 = load i32, ptr %6, align 4
  %126 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %127 = call i64 @read(i32 noundef %125, ptr noundef %126, i64 noundef 1023)
  %128 = trunc i64 %127 to i32
  store i32 %128, ptr %8, align 4
  %129 = load i32, ptr %8, align 4
  %130 = icmp slt i32 %129, 0
  br i1 %130, label %131, label %132

131:                                              ; preds = %123
  call void @perror(ptr noundef @.str.7) #10
  store i32 1, ptr %3, align 4
  br label %183

132:                                              ; preds = %123
  %133 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %134 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %133)
  %135 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %136 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %135, ptr noundef @.str.15) #9
  %137 = load i32, ptr %6, align 4
  %138 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %139 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %140 = call i64 @strlen(ptr noundef %139) #8
  %141 = call i64 @write(i32 noundef %137, ptr noundef %138, i64 noundef %140)
  %142 = trunc i64 %141 to i32
  store i32 %142, ptr %8, align 4
  %143 = load i32, ptr %8, align 4
  %144 = icmp slt i32 %143, 0
  br i1 %144, label %145, label %146

145:                                              ; preds = %132
  call void @perror(ptr noundef @.str.12) #10
  store i32 1, ptr %3, align 4
  br label %183

146:                                              ; preds = %132
  %147 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %147, i8 0, i64 1024, i1 false)
  %148 = load i32, ptr %6, align 4
  %149 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %150 = call i64 @read(i32 noundef %148, ptr noundef %149, i64 noundef 1023)
  %151 = trunc i64 %150 to i32
  store i32 %151, ptr %8, align 4
  %152 = load i32, ptr %8, align 4
  %153 = icmp slt i32 %152, 0
  br i1 %153, label %154, label %155

154:                                              ; preds = %146
  call void @perror(ptr noundef @.str.7) #10
  store i32 1, ptr %3, align 4
  br label %183

155:                                              ; preds = %146
  %156 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %157 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %156)
  %158 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %159 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %158, ptr noundef @.str.16) #9
  %160 = load i32, ptr %6, align 4
  %161 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %162 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %163 = call i64 @strlen(ptr noundef %162) #8
  %164 = call i64 @write(i32 noundef %160, ptr noundef %161, i64 noundef %163)
  %165 = trunc i64 %164 to i32
  store i32 %165, ptr %8, align 4
  %166 = load i32, ptr %8, align 4
  %167 = icmp slt i32 %166, 0
  br i1 %167, label %168, label %169

168:                                              ; preds = %155
  call void @perror(ptr noundef @.str.12) #10
  store i32 1, ptr %3, align 4
  br label %183

169:                                              ; preds = %155
  %170 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %170, i8 0, i64 1024, i1 false)
  %171 = load i32, ptr %6, align 4
  %172 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %173 = call i64 @read(i32 noundef %171, ptr noundef %172, i64 noundef 1023)
  %174 = trunc i64 %173 to i32
  store i32 %174, ptr %8, align 4
  %175 = load i32, ptr %8, align 4
  %176 = icmp slt i32 %175, 0
  br i1 %176, label %177, label %178

177:                                              ; preds = %169
  call void @perror(ptr noundef @.str.7) #10
  store i32 1, ptr %3, align 4
  br label %183

178:                                              ; preds = %169
  %179 = getelementptr inbounds [1024 x i8], ptr %11, i64 0, i64 0
  %180 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %179)
  %181 = load i32, ptr %6, align 4
  %182 = call i32 @close(i32 noundef %181)
  store i32 0, ptr %3, align 4
  br label %183

183:                                              ; preds = %178, %177, %168, %154, %145, %131, %122, %104, %95, %77, %63, %40, %32, %18
  %184 = load i32, ptr %3, align 4
  ret i32 %184
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #2

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #4

declare ptr @gethostbyname(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nounwind willreturn memory(none)
declare zeroext i16 @htons(i16 noundef zeroext) #7

declare i32 @connect(i32 noundef, ptr noundef, i32 noundef) #1

declare i64 @read(i32 noundef, ptr noundef, i64 noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #3

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

declare i32 @close(i32 noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }
attributes #10 = { cold }
attributes #11 = { nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
