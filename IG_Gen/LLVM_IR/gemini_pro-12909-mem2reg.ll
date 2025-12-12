; ModuleID = 'LLVM_IR/gemini_pro-12909.ll'
source_filename = "DATASETv2/gemini_pro-12909.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.disk_t = type { [1000 x i32] }
%struct.file_t = type { [32 x i8], i32, [1000 x i32] }

@disk = dso_local global %struct.disk_t zeroinitializer, align 4
@files = dso_local global [100 x %struct.file_t] zeroinitializer, align 16
@.str = private unnamed_addr constant [14 x i8] c"File System:\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"  %s (%d bytes)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [32 x i8], align 16
  %2 = alloca [1000 x i32], align 16
  br label %3

3:                                                ; preds = %8, %0
  %.01 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %4 = icmp slt i32 %.01, 1000
  br i1 %4, label %5, label %10

5:                                                ; preds = %3
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %6
  store i32 1, ptr %7, align 4
  br label %8

8:                                                ; preds = %5
  %9 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !6

10:                                               ; preds = %3
  br label %11

11:                                               ; preds = %65, %10
  %.03 = phi i32 [ 0, %10 ], [ %66, %65 ]
  %.02 = phi i32 [ 0, %10 ], [ %64, %65 ]
  %12 = icmp slt i32 %.03, 100
  br i1 %12, label %13, label %67

13:                                               ; preds = %11
  br label %14

14:                                               ; preds = %23, %13
  %.04 = phi i32 [ 0, %13 ], [ %24, %23 ]
  %15 = icmp slt i32 %.04, 32
  br i1 %15, label %16, label %25

16:                                               ; preds = %14
  %17 = call i32 @rand() #4
  %18 = srem i32 %17, 26
  %19 = add nsw i32 97, %18
  %20 = trunc i32 %19 to i8
  %21 = sext i32 %.04 to i64
  %22 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 %21
  store i8 %20, ptr %22, align 1
  br label %23

23:                                               ; preds = %16
  %24 = add nsw i32 %.04, 1
  br label %14, !llvm.loop !8

25:                                               ; preds = %14
  %26 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 31
  store i8 0, ptr %26, align 1
  %27 = call i32 @rand() #4
  %28 = srem i32 %27, 10000
  br label %29

29:                                               ; preds = %45, %25
  %.07 = phi i32 [ 0, %25 ], [ %46, %45 ]
  %.06 = phi i32 [ 0, %25 ], [ %.1, %45 ]
  %30 = icmp slt i32 %.07, %28
  br i1 %30, label %31, label %47

31:                                               ; preds = %29
  %32 = call i32 @rand() #4
  %33 = srem i32 %32, 1000
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %44

38:                                               ; preds = %31
  %39 = add nsw i32 %.06, 1
  %40 = sext i32 %.06 to i64
  %41 = getelementptr inbounds [1000 x i32], ptr %2, i64 0, i64 %40
  store i32 %33, ptr %41, align 4
  %42 = sext i32 %33 to i64
  %43 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %42
  store i32 0, ptr %43, align 4
  br label %44

44:                                               ; preds = %38, %31
  %.1 = phi i32 [ %39, %38 ], [ %.06, %31 ]
  br label %45

45:                                               ; preds = %44
  %46 = add nsw i32 %.07, 1024
  br label %29, !llvm.loop !9

47:                                               ; preds = %29
  %48 = sext i32 %.02 to i64
  %49 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.file_t, ptr %49, i32 0, i32 0
  %51 = getelementptr inbounds [32 x i8], ptr %50, i64 0, i64 0
  %52 = getelementptr inbounds [32 x i8], ptr %1, i64 0, i64 0
  %53 = call ptr @strcpy(ptr noundef %51, ptr noundef %52) #4
  %54 = sext i32 %.02 to i64
  %55 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %54
  %56 = getelementptr inbounds %struct.file_t, ptr %55, i32 0, i32 1
  store i32 %28, ptr %56, align 4
  %57 = sext i32 %.02 to i64
  %58 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %57
  %59 = getelementptr inbounds %struct.file_t, ptr %58, i32 0, i32 2
  %60 = getelementptr inbounds [1000 x i32], ptr %59, i64 0, i64 0
  %61 = getelementptr inbounds [1000 x i32], ptr %2, i64 0, i64 0
  %62 = sext i32 %.06 to i64
  %63 = mul i64 %62, 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %60, ptr align 16 %61, i64 %63, i1 false)
  %64 = add nsw i32 %.02, 1
  br label %65

65:                                               ; preds = %47
  %66 = add nsw i32 %.03, 1
  br label %11, !llvm.loop !10

67:                                               ; preds = %11
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %69

69:                                               ; preds = %81, %67
  %.05 = phi i32 [ 0, %67 ], [ %82, %81 ]
  %70 = icmp slt i32 %.05, %.02
  br i1 %70, label %71, label %83

71:                                               ; preds = %69
  %72 = sext i32 %.05 to i64
  %73 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %72
  %74 = getelementptr inbounds %struct.file_t, ptr %73, i32 0, i32 0
  %75 = getelementptr inbounds [32 x i8], ptr %74, i64 0, i64 0
  %76 = sext i32 %.05 to i64
  %77 = getelementptr inbounds [100 x %struct.file_t], ptr @files, i64 0, i64 %76
  %78 = getelementptr inbounds %struct.file_t, ptr %77, i32 0, i32 1
  %79 = load i32, ptr %78, align 4
  %80 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %75, i32 noundef %79)
  br label %81

81:                                               ; preds = %71
  %82 = add nsw i32 %.05, 1
  br label %69, !llvm.loop !11

83:                                               ; preds = %69
  br label %84

84:                                               ; preds = %89, %83
  %.0 = phi i32 [ 0, %83 ], [ %90, %89 ]
  %85 = icmp slt i32 %.0, 1000
  br i1 %85, label %86, label %91

86:                                               ; preds = %84
  %87 = sext i32 %.0 to i64
  %88 = getelementptr inbounds [1000 x i32], ptr @disk, i64 0, i64 %87
  store i32 1, ptr %88, align 4
  br label %89

89:                                               ; preds = %86
  %90 = add nsw i32 %.0, 1
  br label %84, !llvm.loop !12

91:                                               ; preds = %84
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
