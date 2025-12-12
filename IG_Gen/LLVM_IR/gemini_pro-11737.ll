; ModuleID = 'DATASETv2/gemini_pro-11737.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @set_nonblock(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  %6 = call i32 (i32, i32, ...) @fcntl(i32 noundef %5, i32 noundef 3, i32 noundef 0)
  store i32 %6, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  call void @perror(ptr noundef @.str) #8
  store i32 -1, ptr %2, align 4
  br label %19

10:                                               ; preds = %1
  %11 = load i32, ptr %4, align 4
  %12 = or i32 %11, 2048
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = call i32 (i32, i32, ...) @fcntl(i32 noundef %13, i32 noundef 4, i32 noundef %14)
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %18

17:                                               ; preds = %10
  call void @perror(ptr noundef @.str) #8
  store i32 -1, ptr %2, align 4
  br label %19

18:                                               ; preds = %10
  store i32 0, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %17, %9
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

declare i32 @fcntl(i32 noundef, i32 noundef, ...) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @create_client_data(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  %5 = call noalias ptr @malloc(i64 noundef 24) #9
  store ptr %5, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  call void @perror(ptr noundef @.str.1) #8
  store ptr null, ptr %2, align 8
  br label %26

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.client_data, ptr %11, i32 0, i32 0
  store i32 %10, ptr %12, align 8
  %13 = call noalias ptr @malloc(i64 noundef 4096) #9
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.client_data, ptr %14, i32 0, i32 1
  store ptr %13, ptr %15, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.client_data, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %9
  call void @perror(ptr noundef @.str.1) #8
  %21 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %21) #10
  store ptr null, ptr %2, align 8
  br label %26

22:                                               ; preds = %9
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.client_data, ptr %23, i32 0, i32 2
  store i64 0, ptr %24, align 8
  %25 = load ptr, ptr %4, align 8
  store ptr %25, ptr %2, align 8
  br label %26

26:                                               ; preds = %22, %20, %8
  %27 = load ptr, ptr %2, align 8
  ret ptr %27
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local void @free_client_data(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.client_data, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = call i32 @close(i32 noundef %5)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.client_data, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %9) #10
  %10 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %10) #10
  ret void
}

declare i32 @close(i32 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.sockaddr_in, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.epoll_event, align 1
  %11 = alloca [1024 x %struct.epoll_event], align 16
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.sockaddr_in, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i64, align 8
  %20 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %21, 2
  br i1 %22, label %23, label %29

23:                                               ; preds = %2
  %24 = load ptr, ptr @stderr, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 0
  %27 = load ptr, ptr %26, align 8
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %24, ptr noundef @.str.2, ptr noundef %27)
  store i32 1, ptr %3, align 4
  br label %222

29:                                               ; preds = %2
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds ptr, ptr %30, i64 1
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 @atoi(ptr noundef %32) #11
  store i32 %33, ptr %6, align 4
  %34 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #10
  store i32 %34, ptr %7, align 4
  %35 = load i32, ptr %7, align 4
  %36 = icmp eq i32 %35, -1
  br i1 %36, label %37, label %38

37:                                               ; preds = %29
  call void @perror(ptr noundef @.str.3) #8
  store i32 1, ptr %3, align 4
  br label %222

38:                                               ; preds = %29
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 16, i1 false)
  %39 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 0
  store i16 2, ptr %39, align 4
  %40 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 2
  %41 = getelementptr inbounds %struct.in_addr, ptr %40, i32 0, i32 0
  store i32 0, ptr %41, align 4
  %42 = load i32, ptr %6, align 4
  %43 = trunc i32 %42 to i16
  %44 = call zeroext i16 @htons(i16 noundef zeroext %43) #12
  %45 = getelementptr inbounds %struct.sockaddr_in, ptr %8, i32 0, i32 1
  store i16 %44, ptr %45, align 2
  %46 = load i32, ptr %7, align 4
  %47 = call i32 @bind(i32 noundef %46, ptr noundef %8, i32 noundef 16) #10
  %48 = icmp eq i32 %47, -1
  br i1 %48, label %49, label %50

49:                                               ; preds = %38
  call void @perror(ptr noundef @.str.4) #8
  store i32 1, ptr %3, align 4
  br label %222

50:                                               ; preds = %38
  %51 = load i32, ptr %7, align 4
  %52 = call i32 @listen(i32 noundef %51, i32 noundef 4096) #10
  %53 = icmp eq i32 %52, -1
  br i1 %53, label %54, label %55

54:                                               ; preds = %50
  call void @perror(ptr noundef @.str.5) #8
  store i32 1, ptr %3, align 4
  br label %222

55:                                               ; preds = %50
  %56 = load i32, ptr %7, align 4
  %57 = call i32 @set_nonblock(i32 noundef %56)
  %58 = icmp eq i32 %57, -1
  br i1 %58, label %59, label %60

59:                                               ; preds = %55
  call void @perror(ptr noundef @.str.6) #8
  store i32 1, ptr %3, align 4
  br label %222

60:                                               ; preds = %55
  %61 = call i32 @epoll_create1(i32 noundef 0) #10
  store i32 %61, ptr %9, align 4
  %62 = load i32, ptr %9, align 4
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %64, label %65

64:                                               ; preds = %60
  call void @perror(ptr noundef @.str.7) #8
  store i32 1, ptr %3, align 4
  br label %222

65:                                               ; preds = %60
  call void @llvm.memset.p0.i64(ptr align 1 %10, i8 0, i64 12, i1 false)
  %66 = getelementptr inbounds %struct.epoll_event, ptr %10, i32 0, i32 0
  store i32 -2147483647, ptr %66, align 1
  %67 = load i32, ptr %7, align 4
  %68 = getelementptr inbounds %struct.epoll_event, ptr %10, i32 0, i32 1
  store i32 %67, ptr %68, align 1
  %69 = load i32, ptr %9, align 4
  %70 = load i32, ptr %7, align 4
  %71 = call i32 @epoll_ctl(i32 noundef %69, i32 noundef 1, i32 noundef %70, ptr noundef %10) #10
  %72 = icmp eq i32 %71, -1
  br i1 %72, label %73, label %74

73:                                               ; preds = %65
  call void @perror(ptr noundef @.str.8) #8
  store i32 1, ptr %3, align 4
  br label %222

74:                                               ; preds = %65
  br label %75

75:                                               ; preds = %74, %85, %221
  %76 = load i32, ptr %9, align 4
  %77 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %11, i64 0, i64 0
  %78 = call i32 @epoll_wait(i32 noundef %76, ptr noundef %77, i32 noundef 1024, i32 noundef -1)
  store i32 %78, ptr %12, align 4
  %79 = load i32, ptr %12, align 4
  %80 = icmp eq i32 %79, -1
  br i1 %80, label %81, label %87

81:                                               ; preds = %75
  %82 = call ptr @__errno_location() #12
  %83 = load i32, ptr %82, align 4
  %84 = icmp eq i32 %83, 4
  br i1 %84, label %85, label %86

85:                                               ; preds = %81
  br label %75

86:                                               ; preds = %81
  call void @perror(ptr noundef @.str.9) #8
  store i32 1, ptr %3, align 4
  br label %222

87:                                               ; preds = %75
  store i32 0, ptr %13, align 4
  br label %88

88:                                               ; preds = %218, %87
  %89 = load i32, ptr %13, align 4
  %90 = load i32, ptr %12, align 4
  %91 = icmp slt i32 %89, %90
  br i1 %91, label %92, label %221

92:                                               ; preds = %88
  %93 = load i32, ptr %13, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %11, i64 0, i64 %94
  %96 = getelementptr inbounds %struct.epoll_event, ptr %95, i32 0, i32 1
  %97 = load i32, ptr %96, align 4
  %98 = load i32, ptr %7, align 4
  %99 = icmp eq i32 %97, %98
  br i1 %99, label %100, label %128

100:                                              ; preds = %92
  store i32 16, ptr %15, align 4
  %101 = load i32, ptr %7, align 4
  %102 = call i32 @accept(i32 noundef %101, ptr noundef %14, ptr noundef %15)
  store i32 %102, ptr %16, align 4
  %103 = load i32, ptr %16, align 4
  %104 = icmp eq i32 %103, -1
  br i1 %104, label %105, label %106

105:                                              ; preds = %100
  call void @perror(ptr noundef @.str.10) #8
  br label %218

106:                                              ; preds = %100
  %107 = load i32, ptr %16, align 4
  %108 = call i32 @set_nonblock(i32 noundef %107)
  %109 = icmp eq i32 %108, -1
  br i1 %109, label %110, label %111

110:                                              ; preds = %106
  call void @perror(ptr noundef @.str.6) #8
  br label %218

111:                                              ; preds = %106
  %112 = load i32, ptr %16, align 4
  %113 = call ptr @create_client_data(i32 noundef %112)
  store ptr %113, ptr %17, align 8
  %114 = load ptr, ptr %17, align 8
  %115 = icmp eq ptr %114, null
  br i1 %115, label %116, label %117

116:                                              ; preds = %111
  br label %218

117:                                              ; preds = %111
  %118 = getelementptr inbounds %struct.epoll_event, ptr %10, i32 0, i32 0
  store i32 -2147483647, ptr %118, align 1
  %119 = load ptr, ptr %17, align 8
  %120 = getelementptr inbounds %struct.epoll_event, ptr %10, i32 0, i32 1
  store ptr %119, ptr %120, align 1
  %121 = load i32, ptr %9, align 4
  %122 = load i32, ptr %16, align 4
  %123 = call i32 @epoll_ctl(i32 noundef %121, i32 noundef 1, i32 noundef %122, ptr noundef %10) #10
  %124 = icmp eq i32 %123, -1
  br i1 %124, label %125, label %127

125:                                              ; preds = %117
  call void @perror(ptr noundef @.str.8) #8
  %126 = load ptr, ptr %17, align 8
  call void @free_client_data(ptr noundef %126)
  br label %218

127:                                              ; preds = %117
  br label %217

128:                                              ; preds = %92
  %129 = load i32, ptr %13, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %11, i64 0, i64 %130
  %132 = getelementptr inbounds %struct.epoll_event, ptr %131, i32 0, i32 1
  %133 = load ptr, ptr %132, align 4
  store ptr %133, ptr %18, align 8
  %134 = load i32, ptr %13, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [1024 x %struct.epoll_event], ptr %11, i64 0, i64 %135
  %137 = getelementptr inbounds %struct.epoll_event, ptr %136, i32 0, i32 0
  %138 = load i32, ptr %137, align 4
  %139 = and i32 %138, 1
  %140 = icmp ne i32 %139, 0
  br i1 %140, label %141, label %216

141:                                              ; preds = %128
  %142 = load ptr, ptr %18, align 8
  %143 = getelementptr inbounds %struct.client_data, ptr %142, i32 0, i32 0
  %144 = load i32, ptr %143, align 8
  %145 = load ptr, ptr %18, align 8
  %146 = getelementptr inbounds %struct.client_data, ptr %145, i32 0, i32 1
  %147 = load ptr, ptr %146, align 8
  %148 = load ptr, ptr %18, align 8
  %149 = getelementptr inbounds %struct.client_data, ptr %148, i32 0, i32 2
  %150 = load i64, ptr %149, align 8
  %151 = getelementptr inbounds i8, ptr %147, i64 %150
  %152 = load ptr, ptr %18, align 8
  %153 = getelementptr inbounds %struct.client_data, ptr %152, i32 0, i32 2
  %154 = load i64, ptr %153, align 8
  %155 = sub i64 4096, %154
  %156 = call i64 @read(i32 noundef %144, ptr noundef %151, i64 noundef %155)
  store i64 %156, ptr %19, align 8
  %157 = load i64, ptr %19, align 8
  %158 = icmp eq i64 %157, -1
  br i1 %158, label %159, label %166

159:                                              ; preds = %141
  %160 = call ptr @__errno_location() #12
  %161 = load i32, ptr %160, align 4
  %162 = icmp eq i32 %161, 11
  br i1 %162, label %163, label %164

163:                                              ; preds = %159
  br label %218

164:                                              ; preds = %159
  call void @perror(ptr noundef @.str.11) #8
  %165 = load ptr, ptr %18, align 8
  call void @free_client_data(ptr noundef %165)
  br label %218

166:                                              ; preds = %141
  %167 = load i64, ptr %19, align 8
  %168 = icmp eq i64 %167, 0
  br i1 %168, label %169, label %180

169:                                              ; preds = %166
  %170 = load ptr, ptr %18, align 8
  %171 = getelementptr inbounds %struct.client_data, ptr %170, i32 0, i32 0
  %172 = load i32, ptr %171, align 8
  %173 = call i32 @close(i32 noundef %172)
  %174 = load i32, ptr %9, align 4
  %175 = load ptr, ptr %18, align 8
  %176 = getelementptr inbounds %struct.client_data, ptr %175, i32 0, i32 0
  %177 = load i32, ptr %176, align 8
  %178 = call i32 @epoll_ctl(i32 noundef %174, i32 noundef 2, i32 noundef %177, ptr noundef null) #10
  %179 = load ptr, ptr %18, align 8
  call void @free_client_data(ptr noundef %179)
  br label %218

180:                                              ; preds = %166
  br label %181

181:                                              ; preds = %180
  %182 = load i64, ptr %19, align 8
  %183 = load ptr, ptr %18, align 8
  %184 = getelementptr inbounds %struct.client_data, ptr %183, i32 0, i32 2
  %185 = load i64, ptr %184, align 8
  %186 = add i64 %185, %182
  store i64 %186, ptr %184, align 8
  %187 = load ptr, ptr %18, align 8
  %188 = getelementptr inbounds %struct.client_data, ptr %187, i32 0, i32 1
  %189 = load ptr, ptr %188, align 8
  %190 = call ptr @strstr(ptr noundef %189, ptr noundef @.str.12) #11
  %191 = icmp ne ptr %190, null
  br i1 %191, label %192, label %215

192:                                              ; preds = %181
  %193 = load ptr, ptr %18, align 8
  %194 = getelementptr inbounds %struct.client_data, ptr %193, i32 0, i32 1
  %195 = load ptr, ptr %194, align 8
  %196 = call ptr @strchr(ptr noundef %195, i32 noundef 10) #11
  store ptr %196, ptr %20, align 8
  %197 = load ptr, ptr %20, align 8
  store i8 0, ptr %197, align 1
  %198 = load ptr, ptr %18, align 8
  %199 = getelementptr inbounds %struct.client_data, ptr %198, i32 0, i32 1
  %200 = load ptr, ptr %199, align 8
  %201 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %200)
  %202 = load ptr, ptr %18, align 8
  %203 = getelementptr inbounds %struct.client_data, ptr %202, i32 0, i32 0
  %204 = load i32, ptr %203, align 8
  %205 = load ptr, ptr %18, align 8
  %206 = getelementptr inbounds %struct.client_data, ptr %205, i32 0, i32 1
  %207 = load ptr, ptr %206, align 8
  %208 = load ptr, ptr %18, align 8
  %209 = getelementptr inbounds %struct.client_data, ptr %208, i32 0, i32 1
  %210 = load ptr, ptr %209, align 8
  %211 = call i64 @strlen(ptr noundef %210) #11
  %212 = call i64 @write(i32 noundef %204, ptr noundef %207, i64 noundef %211)
  %213 = load ptr, ptr %18, align 8
  %214 = getelementptr inbounds %struct.client_data, ptr %213, i32 0, i32 2
  store i64 0, ptr %214, align 8
  br label %215

215:                                              ; preds = %192, %181
  br label %216

216:                                              ; preds = %215, %128
  br label %217

217:                                              ; preds = %216, %127
  br label %218

218:                                              ; preds = %217, %169, %164, %163, %125, %116, %110, %105
  %219 = load i32, ptr %13, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, ptr %13, align 4
  br label %88, !llvm.loop !6

221:                                              ; preds = %88
  br label %75

222:                                              ; preds = %86, %73, %64, %59, %54, %49, %37, %23
  %223 = load i32, ptr %3, align 4
  ret i32 %223
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

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
