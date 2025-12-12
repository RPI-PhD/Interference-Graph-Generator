; ModuleID = 'DATASETv2/falcon180b-70673.c'
source_filename = "DATASETv2/falcon180b-70673.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.File = type { ptr, i32, ptr }

@.str = private unnamed_addr constant [16 x i8] c"Enter command: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"scan\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Enter path to scan: \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Error opening file\0A\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"File already scanned\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"File scanned successfully\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"list\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"%s (%d bytes)\0A\00", align 1
@.str.10 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str.11 = private unnamed_addr constant [17 x i8] c"Invalid command\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca [100 x i8], align 16
  %5 = alloca [100 x i8], align 16
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  %12 = call noalias ptr @malloc(i64 noundef 2400) #5
  store ptr %12, ptr %3, align 8
  br label %13

13:                                               ; preds = %0, %28, %139
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %15 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %15)
  %17 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %18 = call i32 @strcmp(ptr noundef %17, ptr noundef @.str.2) #6
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %103

20:                                               ; preds = %13
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %22 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %22)
  %24 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %25 = call noalias ptr @fopen(ptr noundef %24, ptr noundef @.str.4)
  store ptr %25, ptr %6, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %30

28:                                               ; preds = %20
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %13

30:                                               ; preds = %20
  %31 = load ptr, ptr %6, align 8
  %32 = call i32 @fseek(ptr noundef %31, i64 noundef 0, i32 noundef 2)
  %33 = load ptr, ptr %6, align 8
  %34 = call i64 @ftell(ptr noundef %33)
  %35 = trunc i64 %34 to i32
  store i32 %35, ptr %7, align 4
  %36 = load ptr, ptr %6, align 8
  %37 = call i32 @fseek(ptr noundef %36, i64 noundef 0, i32 noundef 0)
  %38 = load i32, ptr %7, align 4
  %39 = sext i32 %38 to i64
  %40 = call noalias ptr @malloc(i64 noundef %39) #5
  store ptr %40, ptr %8, align 8
  %41 = load ptr, ptr %8, align 8
  %42 = load i32, ptr %7, align 4
  %43 = sext i32 %42 to i64
  %44 = load ptr, ptr %6, align 8
  %45 = call i64 @fread(ptr noundef %41, i64 noundef 1, i64 noundef %43, ptr noundef %44)
  %46 = load ptr, ptr %6, align 8
  %47 = call i32 @fclose(ptr noundef %46)
  store i32 0, ptr %9, align 4
  br label %48

48:                                               ; preds = %66, %30
  %49 = load i32, ptr %9, align 4
  %50 = load i32, ptr %2, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %69

52:                                               ; preds = %48
  %53 = load ptr, ptr %3, align 8
  %54 = load i32, ptr %9, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.File, ptr %53, i64 %55
  %57 = getelementptr inbounds %struct.File, ptr %56, i32 0, i32 2
  %58 = load ptr, ptr %57, align 8
  %59 = load ptr, ptr %8, align 8
  %60 = call i32 @strcmp(ptr noundef %58, ptr noundef %59) #6
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %65

62:                                               ; preds = %52
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %64 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %64) #7
  br label %66

65:                                               ; preds = %52
  br label %66

66:                                               ; preds = %65, %62
  %67 = load i32, ptr %9, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %9, align 4
  br label %48, !llvm.loop !6

69:                                               ; preds = %48
  %70 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %71 = call i64 @strlen(ptr noundef %70) #6
  %72 = add i64 %71, 1
  %73 = call noalias ptr @malloc(i64 noundef %72) #5
  %74 = load ptr, ptr %3, align 8
  %75 = load i32, ptr %2, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds %struct.File, ptr %74, i64 %76
  %78 = getelementptr inbounds %struct.File, ptr %77, i32 0, i32 0
  store ptr %73, ptr %78, align 8
  %79 = load ptr, ptr %3, align 8
  %80 = load i32, ptr %2, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds %struct.File, ptr %79, i64 %81
  %83 = getelementptr inbounds %struct.File, ptr %82, i32 0, i32 0
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %86 = call ptr @strcpy(ptr noundef %84, ptr noundef %85) #7
  %87 = load i32, ptr %7, align 4
  %88 = load ptr, ptr %3, align 8
  %89 = load i32, ptr %2, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.File, ptr %88, i64 %90
  %92 = getelementptr inbounds %struct.File, ptr %91, i32 0, i32 1
  store i32 %87, ptr %92, align 8
  %93 = load ptr, ptr %8, align 8
  %94 = load ptr, ptr %3, align 8
  %95 = load i32, ptr %2, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds %struct.File, ptr %94, i64 %96
  %98 = getelementptr inbounds %struct.File, ptr %97, i32 0, i32 2
  store ptr %93, ptr %98, align 8
  %99 = load i32, ptr %2, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, ptr %2, align 4
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %102 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %102) #7
  br label %139

103:                                              ; preds = %13
  %104 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %105 = call i32 @strcmp(ptr noundef %104, ptr noundef @.str.8) #6
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %130

107:                                              ; preds = %103
  store i32 0, ptr %10, align 4
  br label %108

108:                                              ; preds = %126, %107
  %109 = load i32, ptr %10, align 4
  %110 = load i32, ptr %2, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %129

112:                                              ; preds = %108
  %113 = load ptr, ptr %3, align 8
  %114 = load i32, ptr %10, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds %struct.File, ptr %113, i64 %115
  %117 = getelementptr inbounds %struct.File, ptr %116, i32 0, i32 0
  %118 = load ptr, ptr %117, align 8
  %119 = load ptr, ptr %3, align 8
  %120 = load i32, ptr %10, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds %struct.File, ptr %119, i64 %121
  %123 = getelementptr inbounds %struct.File, ptr %122, i32 0, i32 1
  %124 = load i32, ptr %123, align 8
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %118, i32 noundef %124)
  br label %126

126:                                              ; preds = %112
  %127 = load i32, ptr %10, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %10, align 4
  br label %108, !llvm.loop !8

129:                                              ; preds = %108
  br label %138

130:                                              ; preds = %103
  %131 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %132 = call i32 @strcmp(ptr noundef %131, ptr noundef @.str.10) #6
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %135

134:                                              ; preds = %130
  br label %140

135:                                              ; preds = %130
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  br label %137

137:                                              ; preds = %135
  br label %138

138:                                              ; preds = %137, %129
  br label %139

139:                                              ; preds = %138, %69
  br label %13

140:                                              ; preds = %134
  store i32 0, ptr %11, align 4
  br label %141

141:                                              ; preds = %158, %140
  %142 = load i32, ptr %11, align 4
  %143 = load i32, ptr %2, align 4
  %144 = icmp slt i32 %142, %143
  br i1 %144, label %145, label %161

145:                                              ; preds = %141
  %146 = load ptr, ptr %3, align 8
  %147 = load i32, ptr %11, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds %struct.File, ptr %146, i64 %148
  %150 = getelementptr inbounds %struct.File, ptr %149, i32 0, i32 0
  %151 = load ptr, ptr %150, align 8
  call void @free(ptr noundef %151) #7
  %152 = load ptr, ptr %3, align 8
  %153 = load i32, ptr %11, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds %struct.File, ptr %152, i64 %154
  %156 = getelementptr inbounds %struct.File, ptr %155, i32 0, i32 2
  %157 = load ptr, ptr %156, align 8
  call void @free(ptr noundef %157) #7
  br label %158

158:                                              ; preds = %145
  %159 = load i32, ptr %11, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, ptr %11, align 4
  br label %141, !llvm.loop !9

161:                                              ; preds = %141
  %162 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %162) #7
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #2

declare i64 @ftell(ptr noundef) #2

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

declare i32 @fclose(ptr noundef) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind willreturn memory(read) }
attributes #7 = { nounwind }

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
