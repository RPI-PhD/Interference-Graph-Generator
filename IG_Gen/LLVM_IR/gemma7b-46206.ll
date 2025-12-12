; ModuleID = 'DATASETv2/gemma7b-46206.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [20 x i8], align 16
  %3 = alloca [5 x i32], align 16
  %4 = alloca [10 x [10 x i32]], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  store i32 0, ptr %1, align 4
  %8 = call i32 @system(ptr noundef @.str)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %12 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %12)
  call void @llvm.memset.p0.i64(ptr align 16 %3, i8 0, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.main.map, i64 400, i1 false)
  br label %14

14:                                               ; preds = %0, %113
  store i32 0, ptr %5, align 4
  br label %15

15:                                               ; preds = %41, %14
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %16, 10
  br i1 %17, label %18, label %44

18:                                               ; preds = %15
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %36, %18
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, 10
  br i1 %21, label %22, label %39

22:                                               ; preds = %19
  %23 = load i32, ptr %5, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %24
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [10 x i32], ptr %25, i64 0, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %33

31:                                               ; preds = %22
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %35

33:                                               ; preds = %22
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %35

35:                                               ; preds = %33, %31
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %6, align 4
  br label %19, !llvm.loop !6

39:                                               ; preds = %19
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %41

41:                                               ; preds = %39
  %42 = load i32, ptr %5, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %5, align 4
  br label %15, !llvm.loop !8

44:                                               ; preds = %15
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %46 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.9, ptr noundef %7)
  %47 = load i8, ptr %7, align 1
  %48 = sext i8 %47 to i32
  switch i32 %48, label %97 [
    i32 78, label %49
    i32 83, label %61
    i32 69, label %73
    i32 87, label %85
  ]

49:                                               ; preds = %44
  %50 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %51 = load i32, ptr %50, align 8
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %52
  %54 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %55 = load i32, ptr %54, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [10 x i32], ptr %53, i64 0, i64 %56
  store i32 1, ptr %57, align 4
  %58 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %59 = load i32, ptr %58, align 8
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %58, align 8
  br label %99

61:                                               ; preds = %44
  %62 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %63 = load i32, ptr %62, align 8
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %64
  %66 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %67 = load i32, ptr %66, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [10 x i32], ptr %65, i64 0, i64 %68
  store i32 1, ptr %69, align 4
  %70 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %71 = load i32, ptr %70, align 8
  %72 = add nsw i32 %71, -1
  store i32 %72, ptr %70, align 8
  br label %99

73:                                               ; preds = %44
  %74 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %75 = load i32, ptr %74, align 8
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %76
  %78 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %79 = load i32, ptr %78, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [10 x i32], ptr %77, i64 0, i64 %80
  store i32 1, ptr %81, align 4
  %82 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %83 = load i32, ptr %82, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %82, align 4
  br label %99

85:                                               ; preds = %44
  %86 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %87 = load i32, ptr %86, align 8
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %88
  %90 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %91 = load i32, ptr %90, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [10 x i32], ptr %89, i64 0, i64 %92
  store i32 1, ptr %93, align 4
  %94 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %95 = load i32, ptr %94, align 4
  %96 = add nsw i32 %95, -1
  store i32 %96, ptr %94, align 4
  br label %99

97:                                               ; preds = %44
  %98 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  br label %99

99:                                               ; preds = %97, %85, %73, %61, %49
  %100 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %101 = load i32, ptr %100, align 8
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %102
  %104 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 3
  %105 = load i32, ptr %104, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [10 x i32], ptr %103, i64 0, i64 %106
  %108 = load i32, ptr %107, align 4
  %109 = icmp eq i32 %108, 3
  br i1 %109, label %110, label %113

110:                                              ; preds = %99
  %111 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %111)
  br label %114

113:                                              ; preds = %99
  br label %14

114:                                              ; preds = %110
  ret i32 0
}

declare i32 @system(ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
