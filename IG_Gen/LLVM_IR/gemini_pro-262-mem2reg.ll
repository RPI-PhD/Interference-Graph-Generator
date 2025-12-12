; ModuleID = 'LLVM_IR/gemini_pro-262.ll'
source_filename = "DATASETv2/gemini_pro-262.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.thread_args = type { ptr, i32, i32, ptr }

@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Usage: %s <text file>\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Error opening file: %s\0A\00", align 1
@.str.4 = private unnamed_addr constant [13 x i8] c"Summary:\0A%s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @summarize_text(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 1024) #6
  call void @llvm.memset.p0.i64(ptr align 1 %2, i8 0, i64 1024, i1 false)
  %3 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  br label %5

5:                                                ; preds = %62, %1
  %.01 = phi i32 [ 0, %1 ], [ %.1, %62 ]
  %.0 = phi i32 [ %4, %1 ], [ %63, %62 ]
  %6 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 2
  %7 = load i32, ptr %6, align 4
  %8 = icmp slt i32 %.0, %7
  br i1 %8, label %9, label %64

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i8, ptr %11, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 46
  br i1 %16, label %33, label %17

17:                                               ; preds = %9
  %18 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds i8, ptr %19, i64 %20
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp eq i32 %23, 33
  br i1 %24, label %33, label %25

25:                                               ; preds = %17
  %26 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = sext i32 %.0 to i64
  %29 = getelementptr inbounds i8, ptr %27, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp eq i32 %31, 63
  br i1 %32, label %33, label %61

33:                                               ; preds = %25, %17, %9
  %34 = icmp sgt i32 %.01, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %33
  %36 = call ptr @strcat(ptr noundef %2, ptr noundef @.str) #7
  br label %37

37:                                               ; preds = %35, %33
  %38 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 1
  %39 = load i32, ptr %38, align 8
  %40 = sub nsw i32 %.0, %39
  %41 = add nsw i32 %40, 1
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = call noalias ptr @malloc(i64 noundef %43) #6
  %45 = add nsw i32 %41, 1
  %46 = sext i32 %45 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %44, i8 0, i64 %46, i1 false)
  %47 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 1
  %50 = load i32, ptr %49, align 8
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, ptr %48, i64 %51
  %53 = sext i32 %41 to i64
  %54 = call ptr @strncpy(ptr noundef %44, ptr noundef %52, i64 noundef %53) #7
  %55 = sext i32 %41 to i64
  %56 = getelementptr inbounds i8, ptr %44, i64 %55
  store i8 0, ptr %56, align 1
  %57 = call ptr @strcat(ptr noundef %2, ptr noundef %44) #7
  %58 = add nsw i32 %.01, %41
  call void @free(ptr noundef %44) #7
  %59 = add nsw i32 %.0, 1
  %60 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 1
  store i32 %59, ptr %60, align 8
  br label %61

61:                                               ; preds = %37, %25
  %.1 = phi i32 [ %58, %37 ], [ %.01, %25 ]
  br label %62

62:                                               ; preds = %61
  %63 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

64:                                               ; preds = %5
  %65 = getelementptr inbounds %struct.thread_args, ptr %0, i32 0, i32 3
  %66 = load ptr, ptr %65, align 8
  %67 = call ptr @strcpy(ptr noundef %66, ptr noundef %2) #7
  call void @free(ptr noundef %2) #7
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca [8 x %struct.thread_args], align 16
  %4 = alloca [8 x i64], align 16
  %5 = icmp ne i32 %0, 2
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = getelementptr inbounds ptr, ptr %1, i64 0
  %8 = load ptr, ptr %7, align 8
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %8)
  br label %118

10:                                               ; preds = %2
  %11 = getelementptr inbounds ptr, ptr %1, i64 1
  %12 = load ptr, ptr %11, align 8
  %13 = call noalias ptr @fopen(ptr noundef %12, ptr noundef @.str.2)
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = getelementptr inbounds ptr, ptr %1, i64 1
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %17)
  br label %118

19:                                               ; preds = %10
  %20 = call i32 @fseek(ptr noundef %13, i64 noundef 0, i32 noundef 2)
  %21 = call i64 @ftell(ptr noundef %13)
  %22 = trunc i64 %21 to i32
  call void @rewind(ptr noundef %13)
  %23 = add nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = call noalias ptr @malloc(i64 noundef %24) #6
  %26 = add nsw i32 %22, 1
  %27 = sext i32 %26 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %25, i8 0, i64 %27, i1 false)
  %28 = sext i32 %22 to i64
  %29 = call i64 @fread(ptr noundef %25, i64 noundef 1, i64 noundef %28, ptr noundef %13)
  %30 = call i32 @fclose(ptr noundef %13)
  %31 = sdiv i32 %22, 8
  br label %32

32:                                               ; preds = %55, %19
  %.05 = phi i32 [ 0, %19 ], [ %56, %55 ]
  %33 = icmp slt i32 %.05, 8
  br i1 %33, label %34, label %57

34:                                               ; preds = %32
  %35 = sext i32 %.05 to i64
  %36 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.thread_args, ptr %36, i32 0, i32 0
  store ptr %25, ptr %37, align 8
  %38 = mul nsw i32 %.05, %31
  %39 = sext i32 %.05 to i64
  %40 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.thread_args, ptr %40, i32 0, i32 1
  store i32 %38, ptr %41, align 8
  %42 = add nsw i32 %.05, 1
  %43 = mul nsw i32 %42, %31
  %44 = sext i32 %.05 to i64
  %45 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.thread_args, ptr %45, i32 0, i32 2
  store i32 %43, ptr %46, align 4
  %47 = call noalias ptr @malloc(i64 noundef 1024) #6
  %48 = sext i32 %.05 to i64
  %49 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.thread_args, ptr %49, i32 0, i32 3
  store ptr %47, ptr %50, align 8
  %51 = sext i32 %.05 to i64
  %52 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %51
  %53 = getelementptr inbounds %struct.thread_args, ptr %52, i32 0, i32 3
  %54 = load ptr, ptr %53, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %54, i8 0, i64 1024, i1 false)
  br label %55

55:                                               ; preds = %34
  %56 = add nsw i32 %.05, 1
  br label %32, !llvm.loop !8

57:                                               ; preds = %32
  br label %58

58:                                               ; preds = %66, %57
  %.04 = phi i32 [ 0, %57 ], [ %67, %66 ]
  %59 = icmp slt i32 %.04, 8
  br i1 %59, label %60, label %68

60:                                               ; preds = %58
  %61 = sext i32 %.04 to i64
  %62 = getelementptr inbounds [8 x i64], ptr %4, i64 0, i64 %61
  %63 = sext i32 %.04 to i64
  %64 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %63
  %65 = call i32 @pthread_create(ptr noundef %62, ptr noundef null, ptr noundef @summarize_text, ptr noundef %64) #7
  br label %66

66:                                               ; preds = %60
  %67 = add nsw i32 %.04, 1
  br label %58, !llvm.loop !9

68:                                               ; preds = %58
  br label %69

69:                                               ; preds = %76, %68
  %.03 = phi i32 [ 0, %68 ], [ %77, %76 ]
  %70 = icmp slt i32 %.03, 8
  br i1 %70, label %71, label %78

71:                                               ; preds = %69
  %72 = sext i32 %.03 to i64
  %73 = getelementptr inbounds [8 x i64], ptr %4, i64 0, i64 %72
  %74 = load i64, ptr %73, align 8
  %75 = call i32 @pthread_join(i64 noundef %74, ptr noundef null)
  br label %76

76:                                               ; preds = %71
  %77 = add nsw i32 %.03, 1
  br label %69, !llvm.loop !10

78:                                               ; preds = %69
  %79 = call noalias ptr @malloc(i64 noundef 1024) #6
  call void @llvm.memset.p0.i64(ptr align 1 %79, i8 0, i64 1024, i1 false)
  br label %80

80:                                               ; preds = %114, %78
  %.02 = phi i32 [ 0, %78 ], [ %.1, %114 ]
  %.01 = phi i32 [ 0, %78 ], [ %115, %114 ]
  %81 = icmp slt i32 %.01, 8
  br i1 %81, label %82, label %116

82:                                               ; preds = %80
  %83 = sext i32 %.01 to i64
  %84 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %83
  %85 = getelementptr inbounds %struct.thread_args, ptr %84, i32 0, i32 3
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds i8, ptr %86, i64 0
  %88 = load i8, ptr %87, align 1
  %89 = sext i8 %88 to i32
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %109

91:                                               ; preds = %82
  %92 = icmp sgt i32 %.02, 0
  br i1 %92, label %93, label %95

93:                                               ; preds = %91
  %94 = call ptr @strcat(ptr noundef %79, ptr noundef @.str) #7
  br label %95

95:                                               ; preds = %93, %91
  %96 = sext i32 %.01 to i64
  %97 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %96
  %98 = getelementptr inbounds %struct.thread_args, ptr %97, i32 0, i32 3
  %99 = load ptr, ptr %98, align 8
  %100 = call ptr @strcat(ptr noundef %79, ptr noundef %99) #7
  %101 = sext i32 %.01 to i64
  %102 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %101
  %103 = getelementptr inbounds %struct.thread_args, ptr %102, i32 0, i32 3
  %104 = load ptr, ptr %103, align 8
  %105 = call i64 @strlen(ptr noundef %104) #8
  %106 = sext i32 %.02 to i64
  %107 = add i64 %106, %105
  %108 = trunc i64 %107 to i32
  br label %109

109:                                              ; preds = %95, %82
  %.1 = phi i32 [ %108, %95 ], [ %.02, %82 ]
  %110 = sext i32 %.01 to i64
  %111 = getelementptr inbounds [8 x %struct.thread_args], ptr %3, i64 0, i64 %110
  %112 = getelementptr inbounds %struct.thread_args, ptr %111, i32 0, i32 3
  %113 = load ptr, ptr %112, align 8
  call void @free(ptr noundef %113) #7
  br label %114

114:                                              ; preds = %109
  %115 = add nsw i32 %.01, 1
  br label %80, !llvm.loop !11

116:                                              ; preds = %80
  %117 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %79)
  call void @free(ptr noundef %79) #7
  call void @free(ptr noundef %25) #7
  br label %118

118:                                              ; preds = %116, %15, %6
  %.0 = phi i32 [ 1, %6 ], [ 1, %15 ], [ 0, %116 ]
  ret i32 %.0
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
