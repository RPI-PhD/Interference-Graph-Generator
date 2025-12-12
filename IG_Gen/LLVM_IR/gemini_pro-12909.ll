; ModuleID = 'DATASETv2/gemini_pro-12909.c'
source_filename = "DATASETv2/gemini_pro-12909.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.disk_t = type { [1000 x i32] }
%struct.file_t = type { [32 x i8], i32, [1000 x i32] }

@disk = dso_local global %struct.disk_t zeroinitializer, align 4
@files = dso_local global [100 x %struct.file_t] zeroinitializer, align 16
@.str = private unnamed_addr constant [14 x i8] c"File System:\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"  %s (%d bytes)\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [32 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [1000 x i32], align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %14

14:                                               ; preds = %21, %0
  %15 = load i32, ptr %2, align 4
  %16 = icmp slt i32 %15, 1000
  br i1 %16, label %17, label %24

17:                                               ; preds = %14
  %18 = load i32, ptr %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %19
  store i32 1, ptr %20, align 4
  br label %21

21:                                               ; preds = %17
  %22 = load i32, ptr %2, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %2, align 4
  br label %14, !llvm.loop !6

24:                                               ; preds = %14
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %25

25:                                               ; preds = %96, %24
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %26, 100
  br i1 %27, label %28, label %99

28:                                               ; preds = %25
  store i32 0, ptr %6, align 4
  br label %29

29:                                               ; preds = %40, %28
  %30 = load i32, ptr %6, align 4
  %31 = icmp slt i32 %30, 32
  br i1 %31, label %32, label %43

32:                                               ; preds = %29
  %33 = call i32 @rand() #4
  %34 = srem i32 %33, 26
  %35 = add nsw i32 97, %34
  %36 = trunc i32 %35 to i8
  %37 = load i32, ptr %6, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 %38
  store i8 %36, ptr %39, align 1
  br label %40

40:                                               ; preds = %32
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %6, align 4
  br label %29, !llvm.loop !8

43:                                               ; preds = %29
  %44 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 31
  store i8 0, ptr %44, align 1
  %45 = call i32 @rand() #4
  %46 = srem i32 %45, 10000
  store i32 %46, ptr %7, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %47

47:                                               ; preds = %69, %43
  %48 = load i32, ptr %10, align 4
  %49 = load i32, ptr %7, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %72

51:                                               ; preds = %47
  %52 = call i32 @rand() #4
  %53 = srem i32 %52, 1000
  store i32 %53, ptr %11, align 4
  %54 = load i32, ptr %11, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %68

59:                                               ; preds = %51
  %60 = load i32, ptr %11, align 4
  %61 = load i32, ptr %9, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %9, align 4
  %63 = sext i32 %61 to i64
  %64 = getelementptr inbounds [1000 x i32], ptr %8, i64 0, i64 %63
  store i32 %60, ptr %64, align 4
  %65 = load i32, ptr %11, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %66
  store i32 0, ptr %67, align 4
  br label %68

68:                                               ; preds = %59, %51
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %10, align 4
  %71 = add nsw i32 %70, 1024
  store i32 %71, ptr %10, align 4
  br label %47, !llvm.loop !9

72:                                               ; preds = %47
  %73 = load i32, ptr %3, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %74
  %76 = getelementptr inbounds %struct.file_t, ptr %75, i32 0, i32 0
  %77 = getelementptr inbounds [32 x i8], ptr %76, i64 0, i64 0
  %78 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %79 = call ptr @strcpy(ptr noundef %77, ptr noundef %78) #4
  %80 = load i32, ptr %7, align 4
  %81 = load i32, ptr %3, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.file_t, ptr %83, i32 0, i32 1
  store i32 %80, ptr %84, align 4
  %85 = load i32, ptr %3, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %86
  %88 = getelementptr inbounds %struct.file_t, ptr %87, i32 0, i32 2
  %89 = getelementptr inbounds [1000 x i32], ptr %88, i64 0, i64 0
  %90 = getelementptr inbounds [1000 x i32], ptr %8, i64 0, i64 0
  %91 = load i32, ptr %9, align 4
  %92 = sext i32 %91 to i64
  %93 = mul i64 %92, 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %89, ptr align 16 %90, i64 %93, i1 false)
  %94 = load i32, ptr %3, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %3, align 4
  br label %96

96:                                               ; preds = %72
  %97 = load i32, ptr %4, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %4, align 4
  br label %25, !llvm.loop !10

99:                                               ; preds = %25
  %100 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %12, align 4
  br label %101

101:                                              ; preds = %117, %99
  %102 = load i32, ptr %12, align 4
  %103 = load i32, ptr %3, align 4
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %105, label %120

105:                                              ; preds = %101
  %106 = load i32, ptr %12, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %107
  %109 = getelementptr inbounds %struct.file_t, ptr %108, i32 0, i32 0
  %110 = getelementptr inbounds [32 x i8], ptr %109, i64 0, i64 0
  %111 = load i32, ptr %12, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %112
  %114 = getelementptr inbounds %struct.file_t, ptr %113, i32 0, i32 1
  %115 = load i32, ptr %114, align 4
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %110, i32 noundef %115)
  br label %117

117:                                              ; preds = %105
  %118 = load i32, ptr %12, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, ptr %12, align 4
  br label %101, !llvm.loop !11

120:                                              ; preds = %101
  store i32 0, ptr %13, align 4
  br label %121

121:                                              ; preds = %128, %120
  %122 = load i32, ptr %13, align 4
  %123 = icmp slt i32 %122, 1000
  br i1 %123, label %124, label %131

124:                                              ; preds = %121
  %125 = load i32, ptr %13, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %126
  store i32 1, ptr %127, align 4
  br label %128

128:                                              ; preds = %124
  %129 = load i32, ptr %13, align 4
  %130 = add nsw i32 %129, 1
  store i32 %130, ptr %13, align 4
  br label %121, !llvm.loop !12

131:                                              ; preds = %121
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
!12 = distinct !{!12, !7}
