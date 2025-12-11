; ModuleID = 'DATASETv2/gemma7b-30450.ll'
source_filename = "DATASETv2/gemma7b-30450.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%c \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Invalid move.\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"You won!\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"You lost.\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_board(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %19, %1
  %.01 = phi i32 [ 0, %1 ], [ %20, %19 ]
  %3 = icmp slt i32 %.01, 5
  br i1 %3, label %4, label %21

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %15, %4
  %.0 = phi i32 [ 0, %4 ], [ %16, %15 ]
  %6 = icmp slt i32 %.0, 10
  br i1 %6, label %7, label %17

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds ptr, ptr %0, i64 %8
  %10 = load ptr, ptr %9, align 8
  %11 = sext i32 %.0 to i64
  %12 = getelementptr inbounds i32, ptr %10, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %13)
  br label %15

15:                                               ; preds = %7
  %16 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !6

17:                                               ; preds = %5
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %19

19:                                               ; preds = %17
  %20 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !8

21:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 40) #4
  br label %2

2:                                                ; preds = %8, %0
  %.02 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %3 = icmp slt i32 %.02, 5
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = call noalias ptr @malloc(i64 noundef 40) #4
  %6 = sext i32 %.02 to i64
  %7 = getelementptr inbounds ptr, ptr %1, i64 %6
  store ptr %5, ptr %7, align 8
  br label %8

8:                                                ; preds = %4
  %9 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !9

10:                                               ; preds = %2
  br label %11

11:                                               ; preds = %25, %10
  %.03 = phi i32 [ 0, %10 ], [ %26, %25 ]
  %12 = icmp slt i32 %.03, 5
  br i1 %12, label %13, label %27

13:                                               ; preds = %11
  br label %14

14:                                               ; preds = %22, %13
  %.04 = phi i32 [ 0, %13 ], [ %23, %22 ]
  %15 = icmp slt i32 %.04, 10
  br i1 %15, label %16, label %24

16:                                               ; preds = %14
  %17 = sext i32 %.03 to i64
  %18 = getelementptr inbounds ptr, ptr %1, i64 %17
  %19 = load ptr, ptr %18, align 8
  %20 = sext i32 %.04 to i64
  %21 = getelementptr inbounds i32, ptr %19, i64 %20
  store i32 0, ptr %21, align 4
  br label %22

22:                                               ; preds = %16
  %23 = add nsw i32 %.04, 1
  br label %14, !llvm.loop !10

24:                                               ; preds = %14
  br label %25

25:                                               ; preds = %24
  %26 = add nsw i32 %.03, 1
  br label %11, !llvm.loop !11

27:                                               ; preds = %11
  br label %28

28:                                               ; preds = %89, %33, %27
  call void @draw_board(ptr noundef %1)
  %29 = call i32 @getchar()
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %33, label %31

31:                                               ; preds = %28
  %32 = icmp sge i32 %29, 10
  br i1 %32, label %33, label %35

33:                                               ; preds = %31, %28
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %28

35:                                               ; preds = %31
  %36 = getelementptr inbounds ptr, ptr %1, i64 0
  %37 = load ptr, ptr %36, align 8
  %38 = sext i32 %29 to i64
  %39 = getelementptr inbounds i32, ptr %37, i64 %38
  store i32 1, ptr %39, align 4
  %40 = getelementptr inbounds ptr, ptr %1, i64 0
  %41 = load ptr, ptr %40, align 8
  %42 = sext i32 %29 to i64
  %43 = getelementptr inbounds i32, ptr %41, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %44, 3
  br i1 %45, label %46, label %48

46:                                               ; preds = %35
  call void @draw_board(ptr noundef %1)
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %90

48:                                               ; preds = %35
  %49 = getelementptr inbounds ptr, ptr %1, i64 4
  %50 = load ptr, ptr %49, align 8
  %51 = sext i32 %29 to i64
  %52 = getelementptr inbounds i32, ptr %50, i64 %51
  %53 = load i32, ptr %52, align 4
  %54 = icmp eq i32 %53, 3
  br i1 %54, label %55, label %57

55:                                               ; preds = %48
  call void @draw_board(ptr noundef %1)
  %56 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %90

57:                                               ; preds = %48
  br label %58

58:                                               ; preds = %87, %57
  %.05 = phi i32 [ 0, %57 ], [ %88, %87 ]
  %59 = icmp slt i32 %.05, 5
  br i1 %59, label %60, label %89

60:                                               ; preds = %58
  br label %61

61:                                               ; preds = %84, %60
  %.01 = phi i32 [ 0, %60 ], [ %85, %84 ]
  %62 = icmp slt i32 %.01, 10
  br i1 %62, label %63, label %86

63:                                               ; preds = %61
  %64 = sext i32 %.05 to i64
  %65 = getelementptr inbounds ptr, ptr %1, i64 %64
  %66 = load ptr, ptr %65, align 8
  %67 = sext i32 %.01 to i64
  %68 = getelementptr inbounds i32, ptr %66, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = icmp eq i32 %69, 2
  br i1 %70, label %71, label %83

71:                                               ; preds = %63
  %72 = sext i32 %.05 to i64
  %73 = getelementptr inbounds ptr, ptr %1, i64 %72
  %74 = load ptr, ptr %73, align 8
  %75 = sext i32 %.01 to i64
  %76 = getelementptr inbounds i32, ptr %74, i64 %75
  store i32 0, ptr %76, align 4
  %77 = sub nsw i32 %.05, 1
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds ptr, ptr %1, i64 %78
  %80 = load ptr, ptr %79, align 8
  %81 = sext i32 %.01 to i64
  %82 = getelementptr inbounds i32, ptr %80, i64 %81
  store i32 2, ptr %82, align 4
  br label %83

83:                                               ; preds = %71, %63
  br label %84

84:                                               ; preds = %83
  %85 = add nsw i32 %.01, 1
  br label %61, !llvm.loop !12

86:                                               ; preds = %61
  br label %87

87:                                               ; preds = %86
  %88 = add nsw i32 %.05, 1
  br label %58, !llvm.loop !13

89:                                               ; preds = %58
  br label %28

90:                                               ; preds = %55, %46
  br label %91

91:                                               ; preds = %97, %90
  %.0 = phi i32 [ 0, %90 ], [ %98, %97 ]
  %92 = icmp slt i32 %.0, 5
  br i1 %92, label %93, label %99

93:                                               ; preds = %91
  %94 = sext i32 %.0 to i64
  %95 = getelementptr inbounds ptr, ptr %1, i64 %94
  %96 = load ptr, ptr %95, align 8
  call void @free(ptr noundef %96) #5
  br label %97

97:                                               ; preds = %93
  %98 = add nsw i32 %.0, 1
  br label %91, !llvm.loop !14

99:                                               ; preds = %91
  call void @free(ptr noundef %1) #5
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @getchar() #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
