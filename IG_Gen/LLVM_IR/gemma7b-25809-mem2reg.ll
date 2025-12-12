; ModuleID = 'LLVM_IR/gemma7b-25809.ll'
source_filename = "DATASETv2/gemma7b-25809.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Enter your move (e.g. e4): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Invalid move.\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"White won.\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"Black won.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [64 x i32], align 16
  %2 = alloca i32, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %1, i8 0, i64 256, i1 false)
  %3 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 64
  store i32 1, ptr %3, align 16
  %4 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 65
  store i32 1, ptr %4, align 4
  %5 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 66
  store i32 1, ptr %5, align 8
  %6 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 67
  store i32 1, ptr %6, align 4
  %7 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 56
  store i32 2, ptr %7, align 16
  %8 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 57
  store i32 2, ptr %8, align 4
  %9 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 58
  store i32 2, ptr %9, align 8
  %10 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 59
  store i32 2, ptr %10, align 4
  %11 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 48
  store i32 2, ptr %11, align 16
  %12 = add nsw i32 0, 1
  br label %13

13:                                               ; preds = %33, %31, %0
  %.01 = phi i32 [ %12, %0 ], [ %.01, %31 ], [ %37, %33 ]
  %14 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 64
  %15 = load i32, ptr %14, align 16
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %17, label %21

17:                                               ; preds = %13
  %18 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 65
  %19 = load i32, ptr %18, align 4
  %20 = icmp ne i32 %19, 1
  br label %21

21:                                               ; preds = %17, %13
  %22 = phi i1 [ false, %13 ], [ %20, %17 ]
  br i1 %22, label %23, label %38

23:                                               ; preds = %21
  store i32 0, ptr %2, align 4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %25 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %26 = load i32, ptr %2, align 4
  %27 = icmp slt i32 %26, 1
  br i1 %27, label %31, label %28

28:                                               ; preds = %23
  %29 = load i32, ptr %2, align 4
  %30 = icmp sgt i32 %29, 64
  br i1 %30, label %31, label %33

31:                                               ; preds = %28, %23
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %13, !llvm.loop !6

33:                                               ; preds = %28
  %34 = load i32, ptr %2, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 %35
  store i32 2, ptr %36, align 4
  %37 = add nsw i32 %.01, 1
  br label %13, !llvm.loop !6

38:                                               ; preds = %21
  br label %39

39:                                               ; preds = %46, %38
  %.0 = phi i32 [ 0, %38 ], [ %47, %46 ]
  %40 = icmp slt i32 %.0, 64
  br i1 %40, label %41, label %48

41:                                               ; preds = %39
  %42 = sext i32 %.0 to i64
  %43 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %44)
  br label %46

46:                                               ; preds = %41
  %47 = add nsw i32 %.0, 1
  br label %39, !llvm.loop !8

48:                                               ; preds = %39
  %49 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 64
  %50 = load i32, ptr %49, align 16
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %52, label %54

52:                                               ; preds = %48
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %56

54:                                               ; preds = %48
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %56

56:                                               ; preds = %54, %52
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
