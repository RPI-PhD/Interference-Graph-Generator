; ModuleID = 'LLVM_IR/gpt35-73252.ll'
source_filename = "DATASETv2/gpt35-73252.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"Input word is spelled correctly.\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Did you mean:\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"world\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"spell\00", align 1
@.str.6 = private unnamed_addr constant [9 x i8] c"checking\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"example\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"computer\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"science\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"is\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"awesome\00", align 1
@__const.main.dictionary = private unnamed_addr constant [9 x ptr] [ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6, ptr @.str.7, ptr @.str.8, ptr @.str.9, ptr @.str.10, ptr @.str.11], align 16
@.str.12 = private unnamed_addr constant [28 x i8] c"Enter word to spell check: \00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @strip(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %23, %1
  %.01 = phi ptr [ %0, %1 ], [ %24, %23 ]
  %.0 = phi ptr [ %0, %1 ], [ %.1, %23 ]
  %3 = load i8, ptr %.01, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %25

6:                                                ; preds = %2
  %7 = call ptr @__ctype_b_loc() #6
  %8 = load ptr, ptr %7, align 8
  %9 = load i8, ptr %.01, align 1
  %10 = sext i8 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i16, ptr %8, i64 %11
  %13 = load i16, ptr %12, align 2
  %14 = zext i16 %13 to i32
  %15 = and i32 %14, 8
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %23

17:                                               ; preds = %6
  %18 = load i8, ptr %.01, align 1
  %19 = sext i8 %18 to i32
  %20 = call i32 @tolower(i32 noundef %19) #7
  %21 = trunc i32 %20 to i8
  %22 = getelementptr inbounds i8, ptr %.0, i32 1
  store i8 %21, ptr %.0, align 1
  br label %23

23:                                               ; preds = %17, %6
  %.1 = phi ptr [ %22, %17 ], [ %.0, %6 ]
  %24 = getelementptr inbounds i8, ptr %.01, i32 1
  br label %2, !llvm.loop !6

25:                                               ; preds = %2
  store i8 0, ptr %.0, align 1
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @tolower(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @min(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp slt i32 %0, %1
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  br label %6

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %5, %4
  %7 = phi i32 [ %0, %4 ], [ %1, %5 ]
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @spellcheck(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  call void @strip(ptr noundef %0)
  %4 = add nsw i32 %2, 1
  %5 = zext i32 %4 to i64
  %6 = call ptr @llvm.stacksave.p0()
  %7 = alloca i32, i64 %5, align 16
  br label %8

8:                                                ; preds = %13, %3
  %.05 = phi i32 [ 0, %3 ], [ %14, %13 ]
  %9 = icmp sle i32 %.05, %2
  br i1 %9, label %10, label %15

10:                                               ; preds = %8
  %11 = sext i32 %.05 to i64
  %12 = getelementptr inbounds i32, ptr %7, i64 %11
  store i32 %.05, ptr %12, align 4
  br label %13

13:                                               ; preds = %10
  %14 = add nsw i32 %.05, 1
  br label %8, !llvm.loop !8

15:                                               ; preds = %8
  br label %16

16:                                               ; preds = %56, %15
  %.06 = phi i32 [ 0, %15 ], [ %57, %56 ]
  %17 = icmp slt i32 %.06, %2
  br i1 %17, label %18, label %58

18:                                               ; preds = %16
  %19 = sext i32 %.06 to i64
  %20 = getelementptr inbounds ptr, ptr %1, i64 %19
  %21 = load ptr, ptr %20, align 8
  %22 = call i64 @strlen(ptr noundef %21) #7
  %23 = trunc i64 %22 to i32
  %24 = getelementptr inbounds i32, ptr %7, i64 0
  %25 = load i32, ptr %24, align 16
  %26 = add nsw i32 %.06, 1
  %27 = getelementptr inbounds i32, ptr %7, i64 0
  store i32 %26, ptr %27, align 16
  br label %28

28:                                               ; preds = %51, %18
  %.07 = phi i32 [ %25, %18 ], [ %50, %51 ]
  %.04 = phi i32 [ 0, %18 ], [ %52, %51 ]
  %29 = icmp slt i32 %.04, %23
  br i1 %29, label %30, label %53

30:                                               ; preds = %28
  %31 = sext i32 %.04 to i64
  %32 = getelementptr inbounds i32, ptr %7, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = add nsw i32 %33, 1
  %35 = add nsw i32 %.07, 1
  %36 = sext i32 %.04 to i64
  %37 = getelementptr inbounds i8, ptr %21, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = sext i32 %.04 to i64
  %41 = getelementptr inbounds i8, ptr %0, i64 %40
  %42 = load i8, ptr %41, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp ne i32 %39, %43
  %45 = zext i1 %44 to i32
  %46 = add nsw i32 %.07, %45
  %47 = sext i32 %.04 to i64
  %48 = getelementptr inbounds i32, ptr %7, i64 %47
  store i32 %.07, ptr %48, align 4
  %49 = call i32 @min(i32 noundef %34, i32 noundef %35)
  %50 = call i32 @min(i32 noundef %49, i32 noundef %46)
  br label %51

51:                                               ; preds = %30
  %52 = add nsw i32 %.04, 1
  br label %28, !llvm.loop !9

53:                                               ; preds = %28
  %54 = sext i32 %23 to i64
  %55 = getelementptr inbounds i32, ptr %7, i64 %54
  store i32 %.07, ptr %55, align 4
  br label %56

56:                                               ; preds = %53
  %57 = add nsw i32 %.06, 1
  br label %16, !llvm.loop !10

58:                                               ; preds = %16
  %59 = getelementptr inbounds i32, ptr %7, i64 0
  %60 = load i32, ptr %59, align 16
  br label %61

61:                                               ; preds = %70, %58
  %.03 = phi i32 [ %60, %58 ], [ %.1, %70 ]
  %.02 = phi i32 [ 1, %58 ], [ %71, %70 ]
  %62 = icmp sle i32 %.02, %2
  br i1 %62, label %63, label %72

63:                                               ; preds = %61
  %64 = sext i32 %.02 to i64
  %65 = getelementptr inbounds i32, ptr %7, i64 %64
  %66 = load i32, ptr %65, align 4
  %67 = icmp slt i32 %66, %.03
  br i1 %67, label %68, label %69

68:                                               ; preds = %63
  br label %69

69:                                               ; preds = %68, %63
  %.1 = phi i32 [ %66, %68 ], [ %.03, %63 ]
  br label %70

70:                                               ; preds = %69
  %71 = add nsw i32 %.02, 1
  br label %61, !llvm.loop !11

72:                                               ; preds = %61
  %73 = icmp eq i32 %.03, 0
  br i1 %73, label %74, label %76

74:                                               ; preds = %72
  %75 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %94

76:                                               ; preds = %72
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %78

78:                                               ; preds = %91, %76
  %.0 = phi i32 [ 0, %76 ], [ %92, %91 ]
  %79 = icmp slt i32 %.0, %2
  br i1 %79, label %80, label %93

80:                                               ; preds = %78
  %81 = sext i32 %.0 to i64
  %82 = getelementptr inbounds ptr, ptr %1, i64 %81
  %83 = load ptr, ptr %82, align 8
  %84 = sext i32 %.0 to i64
  %85 = getelementptr inbounds i32, ptr %7, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = icmp eq i32 %86, %.03
  br i1 %87, label %88, label %90

88:                                               ; preds = %80
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %83)
  br label %90

90:                                               ; preds = %88, %80
  br label %91

91:                                               ; preds = %90
  %92 = add nsw i32 %.0, 1
  br label %78, !llvm.loop !12

93:                                               ; preds = %78
  br label %94

94:                                               ; preds = %93, %74
  %.01 = phi i32 [ 1, %74 ], [ 0, %93 ]
  call void @llvm.stackrestore.p0(ptr %6)
  switch i32 %.01, label %96 [
    i32 0, label %95
    i32 1, label %95
  ]

95:                                               ; preds = %94, %94
  ret void

96:                                               ; preds = %94
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #3

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [9 x ptr], align 16
  %2 = alloca [100 x i8], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.dictionary, i64 72, i1 false)
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %4 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.13, ptr noundef %4)
  %6 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %7 = getelementptr inbounds [9 x ptr], ptr %1, i64 0, i64 0
  call void @spellcheck(ptr noundef %6, ptr noundef %7, i32 noundef 9)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

declare i32 @__isoc99_scanf(ptr noundef, ...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind willreturn memory(none) }
attributes #7 = { nounwind willreturn memory(read) }

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
