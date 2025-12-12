; ModuleID = 'DATASETv2/gemini_pro-262.c'
source_filename = "DATASETv2/gemini_pro-262.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.thread_args = type { ptr, i32, i32, ptr }

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Usage: %s <text file>\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Error opening file: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"Summary:\0A%s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local ptr @summarize_text(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  store ptr %9, ptr %3, align 8
  %10 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %10, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %11, i8 0, i64 1024, i1 false)
  store i32 0, ptr %5, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.thread_args, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 8
  store i32 %14, ptr %6, align 4
  br label %15

15:                                               ; preds = %100, %1
  %16 = load i32, ptr %6, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.thread_args, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %18, align 4
  %20 = icmp slt i32 %16, %19
  br i1 %20, label %21, label %103

21:                                               ; preds = %15
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.thread_args, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp eq i32 %29, 46
  br i1 %30, label %51, label %31

31:                                               ; preds = %21
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.thread_args, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = load i32, ptr %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %34, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 33
  br i1 %40, label %51, label %41

41:                                               ; preds = %31
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.thread_args, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = load i32, ptr %6, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, ptr %44, i64 %46
  %48 = load i8, ptr %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp eq i32 %49, 63
  br i1 %50, label %51, label %99

51:                                               ; preds = %41, %31, %21
  %52 = load i32, ptr %5, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %54, label %57

54:                                               ; preds = %51
  %55 = load ptr, ptr %4, align 8
  %56 = call ptr @strcat(ptr noundef %55, ptr noundef @.str) #7
  br label %57

57:                                               ; preds = %54, %51
  %58 = load i32, ptr %6, align 4
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds %struct.thread_args, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 8
  %62 = sub nsw i32 %58, %61
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %7, align 4
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = call noalias ptr @malloc(i64 noundef %66) #6
  store ptr %67, ptr %8, align 8
  %68 = load ptr, ptr %8, align 8
  %69 = load i32, ptr %7, align 4
  %70 = add nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %68, i8 0, i64 %71, i1 false)
  %72 = load ptr, ptr %8, align 8
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr inbounds %struct.thread_args, ptr %73, i32 0, i32 0
  %75 = load ptr, ptr %74, align 8
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds %struct.thread_args, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %77, align 8
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, ptr %75, i64 %79
  %81 = load i32, ptr %7, align 4
  %82 = sext i32 %81 to i64
  %83 = call ptr @strncpy(ptr noundef %72, ptr noundef %80, i64 noundef %82) #7
  %84 = load ptr, ptr %8, align 8
  %85 = load i32, ptr %7, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, ptr %84, i64 %86
  store i8 0, ptr %87, align 1
  %88 = load ptr, ptr %4, align 8
  %89 = load ptr, ptr %8, align 8
  %90 = call ptr @strcat(ptr noundef %88, ptr noundef %89) #7
  %91 = load i32, ptr %7, align 4
  %92 = load i32, ptr %5, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, ptr %5, align 4
  %94 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %94) #7
  %95 = load i32, ptr %6, align 4
  %96 = add nsw i32 %95, 1
  %97 = load ptr, ptr %3, align 8
  %98 = getelementptr inbounds %struct.thread_args, ptr %97, i32 0, i32 1
  store i32 %96, ptr %98, align 8
  br label %99

99:                                               ; preds = %57, %41
  br label %100

100:                                              ; preds = %99
  %101 = load i32, ptr %6, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, ptr %6, align 4
  br label %15, !llvm.loop !6

103:                                              ; preds = %15
  %104 = load ptr, ptr %3, align 8
  %105 = getelementptr inbounds %struct.thread_args, ptr %104, i32 0, i32 3
  %106 = load ptr, ptr %105, align 8
  %107 = load ptr, ptr %4, align 8
  %108 = call ptr @strcpy(ptr noundef %106, ptr noundef %107) #7
  %109 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %109) #7
  ret ptr null
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare ptr @strcat(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca [8 x %struct.thread_args], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [8 x i64], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %18 = load i32, ptr %4, align 4
  %19 = icmp ne i32 %18, 2
  br i1 %19, label %20, label %25

20:                                               ; preds = %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds ptr, ptr %21, i64 0
  %23 = load ptr, ptr %22, align 8
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %23)
  store i32 1, ptr %3, align 4
  br label %180

25:                                               ; preds = %2
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 1
  %28 = load ptr, ptr %27, align 8
  %29 = call noalias ptr @fopen(ptr noundef %28, ptr noundef @.str.2)
  store ptr %29, ptr %6, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = icmp eq ptr %30, null
  br i1 %31, label %32, label %37

32:                                               ; preds = %25
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds ptr, ptr %33, i64 1
  %35 = load ptr, ptr %34, align 8
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %35)
  store i32 1, ptr %3, align 4
  br label %180

37:                                               ; preds = %25
  %38 = load ptr, ptr %6, align 8
  %39 = call i32 @fseek(ptr noundef %38, i64 noundef 0, i32 noundef 2)
  %40 = load ptr, ptr %6, align 8
  %41 = call i64 @ftell(ptr noundef %40)
  %42 = trunc i64 %41 to i32
  store i32 %42, ptr %7, align 4
  %43 = load ptr, ptr %6, align 8
  call void @rewind(ptr noundef %43)
  %44 = load i32, ptr %7, align 4
  %45 = add nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = call noalias ptr @malloc(i64 noundef %46) #6
  store ptr %47, ptr %8, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = load i32, ptr %7, align 4
  %50 = add nsw i32 %49, 1
  %51 = sext i32 %50 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %48, i8 0, i64 %51, i1 false)
  %52 = load ptr, ptr %8, align 8
  %53 = load i32, ptr %7, align 4
  %54 = sext i32 %53 to i64
  %55 = load ptr, ptr %6, align 8
  %56 = call i64 @fread(ptr noundef %52, i64 noundef 1, i64 noundef %54, ptr noundef %55)
  %57 = load ptr, ptr %6, align 8
  %58 = call i32 @fclose(ptr noundef %57)
  %59 = load i32, ptr %7, align 4
  %60 = sdiv i32 %59, 8
  store i32 %60, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %61

61:                                               ; preds = %95, %37
  %62 = load i32, ptr %11, align 4
  %63 = icmp slt i32 %62, 8
  br i1 %63, label %64, label %98

64:                                               ; preds = %61
  %65 = load ptr, ptr %8, align 8
  %66 = load i32, ptr %11, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %67
  %69 = getelementptr inbounds %struct.thread_args, ptr %68, i32 0, i32 0
  store ptr %65, ptr %69, align 8
  %70 = load i32, ptr %11, align 4
  %71 = load i32, ptr %10, align 4
  %72 = mul nsw i32 %70, %71
  %73 = load i32, ptr %11, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %74
  %76 = getelementptr inbounds %struct.thread_args, ptr %75, i32 0, i32 1
  store i32 %72, ptr %76, align 8
  %77 = load i32, ptr %11, align 4
  %78 = add nsw i32 %77, 1
  %79 = load i32, ptr %10, align 4
  %80 = mul nsw i32 %78, %79
  %81 = load i32, ptr %11, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.thread_args, ptr %83, i32 0, i32 2
  store i32 %80, ptr %84, align 4
  %85 = call noalias ptr @malloc(i64 noundef 1024) #6
  %86 = load i32, ptr %11, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %87
  %89 = getelementptr inbounds %struct.thread_args, ptr %88, i32 0, i32 3
  store ptr %85, ptr %89, align 8
  %90 = load i32, ptr %11, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %91
  %93 = getelementptr inbounds %struct.thread_args, ptr %92, i32 0, i32 3
  %94 = load ptr, ptr %93, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %94, i8 0, i64 1024, i1 false)
  br label %95

95:                                               ; preds = %64
  %96 = load i32, ptr %11, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %11, align 4
  br label %61, !llvm.loop !8

98:                                               ; preds = %61
  store i32 0, ptr %13, align 4
  br label %99

99:                                               ; preds = %110, %98
  %100 = load i32, ptr %13, align 4
  %101 = icmp slt i32 %100, 8
  br i1 %101, label %102, label %113

102:                                              ; preds = %99
  %103 = load i32, ptr %13, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [8 x i64], ptr %12, i64 0, i64 %104
  %106 = load i32, ptr %13, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %107
  %109 = call i32 @pthread_create(ptr noundef %105, ptr noundef null, ptr noundef @summarize_text, ptr noundef %108) #7
  br label %110

110:                                              ; preds = %102
  %111 = load i32, ptr %13, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %13, align 4
  br label %99, !llvm.loop !9

113:                                              ; preds = %99
  store i32 0, ptr %14, align 4
  br label %114

114:                                              ; preds = %123, %113
  %115 = load i32, ptr %14, align 4
  %116 = icmp slt i32 %115, 8
  br i1 %116, label %117, label %126

117:                                              ; preds = %114
  %118 = load i32, ptr %14, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [8 x i64], ptr %12, i64 0, i64 %119
  %121 = load i64, ptr %120, align 8
  %122 = call i32 @pthread_join(i64 noundef %121, ptr noundef null)
  br label %123

123:                                              ; preds = %117
  %124 = load i32, ptr %14, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %14, align 4
  br label %114, !llvm.loop !10

126:                                              ; preds = %114
  %127 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %127, ptr %15, align 8
  %128 = load ptr, ptr %15, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %128, i8 0, i64 1024, i1 false)
  store i32 0, ptr %16, align 4
  store i32 0, ptr %17, align 4
  br label %129

129:                                              ; preds = %172, %126
  %130 = load i32, ptr %17, align 4
  %131 = icmp slt i32 %130, 8
  br i1 %131, label %132, label %175

132:                                              ; preds = %129
  %133 = load i32, ptr %17, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %134
  %136 = getelementptr inbounds %struct.thread_args, ptr %135, i32 0, i32 3
  %137 = load ptr, ptr %136, align 8
  %138 = getelementptr inbounds i8, ptr %137, i64 0
  %139 = load i8, ptr %138, align 1
  %140 = sext i8 %139 to i32
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %166

142:                                              ; preds = %132
  %143 = load i32, ptr %16, align 4
  %144 = icmp sgt i32 %143, 0
  br i1 %144, label %145, label %148

145:                                              ; preds = %142
  %146 = load ptr, ptr %15, align 8
  %147 = call ptr @strcat(ptr noundef %146, ptr noundef @.str) #7
  br label %148

148:                                              ; preds = %145, %142
  %149 = load ptr, ptr %15, align 8
  %150 = load i32, ptr %17, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %151
  %153 = getelementptr inbounds %struct.thread_args, ptr %152, i32 0, i32 3
  %154 = load ptr, ptr %153, align 8
  %155 = call ptr @strcat(ptr noundef %149, ptr noundef %154) #7
  %156 = load i32, ptr %17, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %157
  %159 = getelementptr inbounds %struct.thread_args, ptr %158, i32 0, i32 3
  %160 = load ptr, ptr %159, align 8
  %161 = call i64 @strlen(ptr noundef %160) #8
  %162 = load i32, ptr %16, align 4
  %163 = sext i32 %162 to i64
  %164 = add i64 %163, %161
  %165 = trunc i64 %164 to i32
  store i32 %165, ptr %16, align 4
  br label %166

166:                                              ; preds = %148, %132
  %167 = load i32, ptr %17, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [8 x %struct.thread_args], ptr %9, i64 0, i64 %168
  %170 = getelementptr inbounds %struct.thread_args, ptr %169, i32 0, i32 3
  %171 = load ptr, ptr %170, align 8
  call void @free(ptr noundef %171) #7
  br label %172

172:                                              ; preds = %166
  %173 = load i32, ptr %17, align 4
  %174 = add nsw i32 %173, 1
  store i32 %174, ptr %17, align 4
  br label %129, !llvm.loop !11

175:                                              ; preds = %129
  %176 = load ptr, ptr %15, align 8
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %176)
  %178 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %178) #7
  %179 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %179) #7
  store i32 0, ptr %3, align 4
  br label %180

180:                                              ; preds = %175, %32, %20
  %181 = load i32, ptr %3, align 4
  ret i32 %181
}

declare i32 @printf(ptr noundef, ...) #4

declare noalias ptr @fopen(ptr noundef, ptr noundef) #4

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #4

declare i64 @ftell(ptr noundef) #4

declare void @rewind(ptr noundef) #4

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #4

declare i32 @fclose(ptr noundef) #4

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare i32 @pthread_join(i64 noundef, ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }
attributes #8 = { nounwind willreturn memory(read) }

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
