; ModuleID = 'DATASETv2/gemini_pro-845.ll'
source_filename = "DATASETv2/gemini_pro-845.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Activity = type { ptr, i32, i32, i64 }

@.str = private unnamed_addr constant [8 x i8] c"Walking\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"Running\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"Cycling\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Swimming\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Sleeping\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"%s: %d steps, %d calories, %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @createActivity(ptr noundef %0, i32 noundef %1, i32 noundef %2, i64 noundef %3) #0 {
  %5 = call noalias ptr @malloc(i64 noundef 24) #4
  %6 = call noalias ptr @strdup(ptr noundef %0) #5
  %7 = getelementptr inbounds %struct.Activity, ptr %5, i32 0, i32 0
  store ptr %6, ptr %7, align 8
  %8 = getelementptr inbounds %struct.Activity, ptr %5, i32 0, i32 1
  store i32 %1, ptr %8, align 8
  %9 = getelementptr inbounds %struct.Activity, ptr %5, i32 0, i32 2
  store i32 %2, ptr %9, align 4
  %10 = getelementptr inbounds %struct.Activity, ptr %5, i32 0, i32 3
  store i64 %3, ptr %10, align 8
  ret ptr %5
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @destroyActivity(ptr noundef %0) #0 {
  %2 = getelementptr inbounds %struct.Activity, ptr %0, i32 0, i32 0
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3) #5
  call void @free(ptr noundef %0) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x ptr], align 16
  %2 = getelementptr inbounds [5 x ptr], ptr %1, i64 0, i64 0
  %3 = call i64 @time(ptr noundef null) #5
  %4 = call ptr @createActivity(ptr noundef @.str, i32 noundef 1000, i32 noundef 100, i64 noundef %3)
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds ptr, ptr %2, i64 1
  %6 = call i64 @time(ptr noundef null) #5
  %7 = call ptr @createActivity(ptr noundef @.str.1, i32 noundef 2000, i32 noundef 200, i64 noundef %6)
  store ptr %7, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %5, i64 1
  %9 = call i64 @time(ptr noundef null) #5
  %10 = call ptr @createActivity(ptr noundef @.str.2, i32 noundef 3000, i32 noundef 300, i64 noundef %9)
  store ptr %10, ptr %8, align 8
  %11 = getelementptr inbounds ptr, ptr %8, i64 1
  %12 = call i64 @time(ptr noundef null) #5
  %13 = call ptr @createActivity(ptr noundef @.str.3, i32 noundef 4000, i32 noundef 400, i64 noundef %12)
  store ptr %13, ptr %11, align 8
  %14 = getelementptr inbounds ptr, ptr %11, i64 1
  %15 = call i64 @time(ptr noundef null) #5
  %16 = call ptr @createActivity(ptr noundef @.str.4, i32 noundef 5000, i32 noundef 500, i64 noundef %15)
  store ptr %16, ptr %14, align 8
  br label %17

17:                                               ; preds = %41, %0
  %.01 = phi i32 [ 0, %0 ], [ %42, %41 ]
  %18 = icmp slt i32 %.01, 5
  br i1 %18, label %19, label %43

19:                                               ; preds = %17
  %20 = sext i32 %.01 to i64
  %21 = getelementptr inbounds [5 x ptr], ptr %1, i64 0, i64 %20
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %struct.Activity, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [5 x ptr], ptr %1, i64 0, i64 %25
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.Activity, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = sext i32 %.01 to i64
  %31 = getelementptr inbounds [5 x ptr], ptr %1, i64 0, i64 %30
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.Activity, ptr %32, i32 0, i32 2
  %34 = load i32, ptr %33, align 4
  %35 = sext i32 %.01 to i64
  %36 = getelementptr inbounds [5 x ptr], ptr %1, i64 0, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.Activity, ptr %37, i32 0, i32 3
  %39 = call ptr @ctime(ptr noundef %38) #5
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %24, i32 noundef %29, i32 noundef %34, ptr noundef %39)
  br label %41

41:                                               ; preds = %19
  %42 = add nsw i32 %.01, 1
  br label %17, !llvm.loop !6

43:                                               ; preds = %17
  br label %44

44:                                               ; preds = %50, %43
  %.0 = phi i32 [ 0, %43 ], [ %51, %50 ]
  %45 = icmp slt i32 %.0, 5
  br i1 %45, label %46, label %52

46:                                               ; preds = %44
  %47 = sext i32 %.0 to i64
  %48 = getelementptr inbounds [5 x ptr], ptr %1, i64 0, i64 %47
  %49 = load ptr, ptr %48, align 8
  call void @destroyActivity(ptr noundef %49)
  br label %50

50:                                               ; preds = %46
  %51 = add nsw i32 %.0, 1
  br label %44, !llvm.loop !8

52:                                               ; preds = %44
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare ptr @ctime(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
