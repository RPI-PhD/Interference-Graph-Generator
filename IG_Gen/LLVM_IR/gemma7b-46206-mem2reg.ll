; ModuleID = 'LLVM_IR/gemma7b-46206.ll'
source_filename = "DATASETv2/gemma7b-46206.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"clear\00", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"Welcome to the Text-Based Adventure Game!\0A\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"------------------------\0A\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"What is your hero's name? \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@__const.main.map = private unnamed_addr constant [10 x [10 x i32]] [[10 x i32] zeroinitializer, [10 x i32] [i32 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [10 x i32] [i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [10 x i32] [i32 0, i32 0, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0], [10 x i32] [i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0], [10 x i32] [i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0], [10 x i32] [i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0], [10 x i32] [i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0], [10 x i32] zeroinitializer, [10 x i32] zeroinitializer], align 16
@.str.5 = private unnamed_addr constant [3 x i8] c"O \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"  \00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"What direction do you want to go (N, S, E, W)? \00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.10 = private unnamed_addr constant [15 x i8] c"Invalid move.\0A\00", align 1
@.str.11 = private unnamed_addr constant [45 x i8] c"Congratulations, %s! You have won the game!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [20 x i8], align 16
  %2 = alloca [5 x i32], align 16
  %3 = alloca [10 x [10 x i32]], align 16
  %4 = alloca i8, align 1
  %5 = call i32 @system(ptr noundef @.str)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %9 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %9)
  call void @llvm.memset.p0.i64(ptr align 16 %2, i8 0, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.map, i64 400, i1 false)
  br label %11

11:                                               ; preds = %104, %0
  br label %12

12:                                               ; preds = %33, %11
  %.01 = phi i32 [ 0, %11 ], [ %34, %33 ]
  %13 = icmp slt i32 %.01, 10
  br i1 %13, label %14, label %35

14:                                               ; preds = %12
  br label %15

15:                                               ; preds = %29, %14
  %.0 = phi i32 [ 0, %14 ], [ %30, %29 ]
  %16 = icmp slt i32 %.0, 10
  br i1 %16, label %17, label %31

17:                                               ; preds = %15
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %18
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [10 x i32], ptr %19, i64 0, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %24, label %26

24:                                               ; preds = %17
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %28

26:                                               ; preds = %17
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %28

28:                                               ; preds = %26, %24
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.0, 1
  br label %15, !llvm.loop !6

31:                                               ; preds = %15
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %33

33:                                               ; preds = %31
  %34 = add nsw i32 %.01, 1
  br label %12, !llvm.loop !8

35:                                               ; preds = %12
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %37 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %4)
  %38 = load i8, ptr %4, align 1
  %39 = sext i8 %38 to i32
  switch i32 %39, label %88 [
    i32 78, label %40
    i32 83, label %52
    i32 69, label %64
    i32 87, label %76
  ]

40:                                               ; preds = %35
  %41 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %42 = load i32, ptr %41, align 8
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %43
  %45 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %46 = load i32, ptr %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [10 x i32], ptr %44, i64 0, i64 %47
  store i32 1, ptr %48, align 4
  %49 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %50 = load i32, ptr %49, align 8
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %49, align 8
  br label %90

52:                                               ; preds = %35
  %53 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %54 = load i32, ptr %53, align 8
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %55
  %57 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %58 = load i32, ptr %57, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [10 x i32], ptr %56, i64 0, i64 %59
  store i32 1, ptr %60, align 4
  %61 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %62 = load i32, ptr %61, align 8
  %63 = add nsw i32 %62, -1
  store i32 %63, ptr %61, align 8
  br label %90

64:                                               ; preds = %35
  %65 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %66 = load i32, ptr %65, align 8
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %67
  %69 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %70 = load i32, ptr %69, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [10 x i32], ptr %68, i64 0, i64 %71
  store i32 1, ptr %72, align 4
  %73 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %74 = load i32, ptr %73, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %73, align 4
  br label %90

76:                                               ; preds = %35
  %77 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %78 = load i32, ptr %77, align 8
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %79
  %81 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %82 = load i32, ptr %81, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [10 x i32], ptr %80, i64 0, i64 %83
  store i32 1, ptr %84, align 4
  %85 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %86 = load i32, ptr %85, align 4
  %87 = add nsw i32 %86, -1
  store i32 %87, ptr %85, align 4
  br label %90

88:                                               ; preds = %35
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %90

90:                                               ; preds = %88, %76, %64, %52, %40
  %91 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 2
  %92 = load i32, ptr %91, align 8
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %93
  %95 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 3
  %96 = load i32, ptr %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [10 x i32], ptr %94, i64 0, i64 %97
  %99 = load i32, ptr %98, align 4
  %100 = icmp eq i32 %99, 3
  br i1 %100, label %101, label %104

101:                                              ; preds = %90
  %102 = getelementptr inbounds [20 x i8], ptr %1, i64 0, i64 0
  %103 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %102)
  br label %105

104:                                              ; preds = %90
  br label %11

105:                                              ; preds = %101
  ret i32 0
}

declare i32 @system(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
