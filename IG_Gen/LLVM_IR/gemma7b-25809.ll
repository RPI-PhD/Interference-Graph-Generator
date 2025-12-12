; ModuleID = 'DATASETv2/gemma7b-25809.c'
source_filename = "DATASETv2/gemma7b-25809.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Enter your move (e.g. e4): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Invalid move.\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"White won.\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"Black won.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [64 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 256, i1 false)
  store i32 0, ptr %3, align 4
  %6 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 64
  store i32 1, ptr %6, align 16
  %7 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 65
  store i32 1, ptr %7, align 4
  %8 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 66
  store i32 1, ptr %8, align 8
  %9 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 67
  store i32 1, ptr %9, align 4
  %10 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 56
  store i32 2, ptr %10, align 16
  %11 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 57
  store i32 2, ptr %11, align 4
  %12 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 58
  store i32 2, ptr %12, align 8
  %13 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 59
  store i32 2, ptr %13, align 4
  %14 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 48
  store i32 2, ptr %14, align 16
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %37, %35, %0
  %18 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 64
  %19 = load i32, ptr %18, align 16
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %21, label %25

21:                                               ; preds = %17
  %22 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 65
  %23 = load i32, ptr %22, align 4
  %24 = icmp ne i32 %23, 1
  br label %25

25:                                               ; preds = %21, %17
  %26 = phi i1 [ false, %17 ], [ %24, %21 ]
  br i1 %26, label %27, label %43

27:                                               ; preds = %25
  store i32 0, ptr %4, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %29 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %4)
  %30 = load i32, ptr %4, align 4
  %31 = icmp slt i32 %30, 1
  br i1 %31, label %35, label %32

32:                                               ; preds = %27
  %33 = load i32, ptr %4, align 4
  %34 = icmp sgt i32 %33, 64
  br i1 %34, label %35, label %37

35:                                               ; preds = %32, %27
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %17, !llvm.loop !6

37:                                               ; preds = %32
  %38 = load i32, ptr %4, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 %39
  store i32 2, ptr %40, align 4
  %41 = load i32, ptr %3, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %3, align 4
  br label %17, !llvm.loop !6

43:                                               ; preds = %25
  store i32 0, ptr %5, align 4
  br label %44

44:                                               ; preds = %53, %43
  %45 = load i32, ptr %5, align 4
  %46 = icmp slt i32 %45, 64
  br i1 %46, label %47, label %56

47:                                               ; preds = %44
  %48 = load i32, ptr %5, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 %49
  %51 = load i32, ptr %50, align 4
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %51)
  br label %53

53:                                               ; preds = %47
  %54 = load i32, ptr %5, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %5, align 4
  br label %44, !llvm.loop !8

56:                                               ; preds = %44
  %57 = getelementptr inbounds [64 x i32], ptr %2, i64 0, i64 64
  %58 = load i32, ptr %57, align 16
  %59 = icmp eq i32 %58, 1
  br i1 %59, label %60, label %62

60:                                               ; preds = %56
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %64

62:                                               ; preds = %56
  %63 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %64

64:                                               ; preds = %62, %60
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
