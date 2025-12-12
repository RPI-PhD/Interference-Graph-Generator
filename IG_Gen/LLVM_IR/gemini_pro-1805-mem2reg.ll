; ModuleID = 'LLVM_IR/gemini_pro-1805.ll'
source_filename = "DATASETv2/gemini_pro-1805.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Piece = type { i8, %struct.Position }
%struct.Position = type { i32, i32 }
%struct.Board = type { %struct.Side, %struct.Side, i32 }
%struct.Side = type { [16 x %struct.Piece], i32 }

@.str = private unnamed_addr constant [21 x i8] c"    a b c d e f g h\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"   -----------------\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%d | \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c" |\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_board(ptr noundef %0) #0 {
  %2 = alloca %struct.Piece, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %5

5:                                                ; preds = %52, %1
  %.01 = phi i32 [ 0, %1 ], [ %53, %52 ]
  %6 = icmp slt i32 %.01, 8
  br i1 %6, label %7, label %54

7:                                                ; preds = %5
  %8 = add nsw i32 %.01, 1
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %8)
  br label %10

10:                                               ; preds = %48, %7
  %.0 = phi i32 [ 0, %7 ], [ %49, %48 ]
  %11 = icmp slt i32 %.0, 8
  br i1 %11, label %12, label %50

12:                                               ; preds = %10
  %13 = getelementptr inbounds %struct.Board, ptr %0, i32 0, i32 0
  %14 = getelementptr inbounds %struct.Side, ptr %13, i32 0, i32 0
  %15 = mul nsw i32 %.01, 8
  %16 = add nsw i32 %15, %.0
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [16 x %struct.Piece], ptr %14, i64 0, i64 %17
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %18, i64 12, i1 false)
  %19 = getelementptr inbounds %struct.Piece, ptr %2, i32 0, i32 0
  %20 = load i8, ptr %19, align 4
  %21 = sext i8 %20 to i32
  %22 = icmp ne i32 %21, 32
  br i1 %22, label %23, label %28

23:                                               ; preds = %12
  %24 = getelementptr inbounds %struct.Piece, ptr %2, i32 0, i32 0
  %25 = load i8, ptr %24, align 4
  %26 = sext i8 %25 to i32
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %26)
  br label %47

28:                                               ; preds = %12
  %29 = getelementptr inbounds %struct.Board, ptr %0, i32 0, i32 1
  %30 = getelementptr inbounds %struct.Side, ptr %29, i32 0, i32 0
  %31 = mul nsw i32 %.01, 8
  %32 = add nsw i32 %31, %.0
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [16 x %struct.Piece], ptr %30, i64 0, i64 %33
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %34, i64 12, i1 false)
  %35 = getelementptr inbounds %struct.Piece, ptr %2, i32 0, i32 0
  %36 = load i8, ptr %35, align 4
  %37 = sext i8 %36 to i32
  %38 = icmp ne i32 %37, 32
  br i1 %38, label %39, label %44

39:                                               ; preds = %28
  %40 = getelementptr inbounds %struct.Piece, ptr %2, i32 0, i32 0
  %41 = load i8, ptr %40, align 4
  %42 = sext i8 %41 to i32
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %42)
  br label %46

44:                                               ; preds = %28
  %45 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %46

46:                                               ; preds = %44, %39
  br label %47

47:                                               ; preds = %46, %23
  br label %48

48:                                               ; preds = %47
  %49 = add nsw i32 %.0, 1
  br label %10, !llvm.loop !6

50:                                               ; preds = %10
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %52

52:                                               ; preds = %50
  %53 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !8

54:                                               ; preds = %5
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.Board, align 4
  br label %2

2:                                                ; preds = %25, %0
  %.01 = phi i32 [ 0, %0 ], [ %26, %25 ]
  %3 = icmp slt i32 %.01, 8
  br i1 %3, label %4, label %27

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %22, %4
  %.02 = phi i32 [ 0, %4 ], [ %23, %22 ]
  %6 = icmp slt i32 %.02, 8
  br i1 %6, label %7, label %24

7:                                                ; preds = %5
  %8 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %9 = getelementptr inbounds %struct.Side, ptr %8, i32 0, i32 0
  %10 = mul nsw i32 %.01, 8
  %11 = add nsw i32 %10, %.02
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [16 x %struct.Piece], ptr %9, i64 0, i64 %12
  %14 = getelementptr inbounds %struct.Piece, ptr %13, i32 0, i32 0
  store i8 32, ptr %14, align 4
  %15 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %16 = getelementptr inbounds %struct.Side, ptr %15, i32 0, i32 0
  %17 = mul nsw i32 %.01, 8
  %18 = add nsw i32 %17, %.02
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [16 x %struct.Piece], ptr %16, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.Piece, ptr %20, i32 0, i32 0
  store i8 32, ptr %21, align 4
  br label %22

22:                                               ; preds = %7
  %23 = add nsw i32 %.02, 1
  br label %5, !llvm.loop !9

24:                                               ; preds = %5
  br label %25

25:                                               ; preds = %24
  %26 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !10

27:                                               ; preds = %2
  %28 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %29 = getelementptr inbounds %struct.Side, ptr %28, i32 0, i32 0
  %30 = getelementptr inbounds [16 x %struct.Piece], ptr %29, i64 0, i64 0
  %31 = getelementptr inbounds %struct.Piece, ptr %30, i32 0, i32 0
  store i8 82, ptr %31, align 4
  %32 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %33 = getelementptr inbounds %struct.Side, ptr %32, i32 0, i32 0
  %34 = getelementptr inbounds [16 x %struct.Piece], ptr %33, i64 0, i64 1
  %35 = getelementptr inbounds %struct.Piece, ptr %34, i32 0, i32 0
  store i8 78, ptr %35, align 4
  %36 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %37 = getelementptr inbounds %struct.Side, ptr %36, i32 0, i32 0
  %38 = getelementptr inbounds [16 x %struct.Piece], ptr %37, i64 0, i64 2
  %39 = getelementptr inbounds %struct.Piece, ptr %38, i32 0, i32 0
  store i8 66, ptr %39, align 4
  %40 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %41 = getelementptr inbounds %struct.Side, ptr %40, i32 0, i32 0
  %42 = getelementptr inbounds [16 x %struct.Piece], ptr %41, i64 0, i64 3
  %43 = getelementptr inbounds %struct.Piece, ptr %42, i32 0, i32 0
  store i8 81, ptr %43, align 4
  %44 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %45 = getelementptr inbounds %struct.Side, ptr %44, i32 0, i32 0
  %46 = getelementptr inbounds [16 x %struct.Piece], ptr %45, i64 0, i64 4
  %47 = getelementptr inbounds %struct.Piece, ptr %46, i32 0, i32 0
  store i8 75, ptr %47, align 4
  %48 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %49 = getelementptr inbounds %struct.Side, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds [16 x %struct.Piece], ptr %49, i64 0, i64 5
  %51 = getelementptr inbounds %struct.Piece, ptr %50, i32 0, i32 0
  store i8 66, ptr %51, align 4
  %52 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %53 = getelementptr inbounds %struct.Side, ptr %52, i32 0, i32 0
  %54 = getelementptr inbounds [16 x %struct.Piece], ptr %53, i64 0, i64 6
  %55 = getelementptr inbounds %struct.Piece, ptr %54, i32 0, i32 0
  store i8 78, ptr %55, align 4
  %56 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %57 = getelementptr inbounds %struct.Side, ptr %56, i32 0, i32 0
  %58 = getelementptr inbounds [16 x %struct.Piece], ptr %57, i64 0, i64 7
  %59 = getelementptr inbounds %struct.Piece, ptr %58, i32 0, i32 0
  store i8 82, ptr %59, align 4
  br label %60

60:                                               ; preds = %69, %27
  %.03 = phi i32 [ 0, %27 ], [ %70, %69 ]
  %61 = icmp slt i32 %.03, 8
  br i1 %61, label %62, label %71

62:                                               ; preds = %60
  %63 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 0
  %64 = getelementptr inbounds %struct.Side, ptr %63, i32 0, i32 0
  %65 = add nsw i32 8, %.03
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [16 x %struct.Piece], ptr %64, i64 0, i64 %66
  %68 = getelementptr inbounds %struct.Piece, ptr %67, i32 0, i32 0
  store i8 80, ptr %68, align 4
  br label %69

69:                                               ; preds = %62
  %70 = add nsw i32 %.03, 1
  br label %60, !llvm.loop !11

71:                                               ; preds = %60
  %72 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %73 = getelementptr inbounds %struct.Side, ptr %72, i32 0, i32 0
  %74 = getelementptr inbounds [16 x %struct.Piece], ptr %73, i64 0, i64 56
  %75 = getelementptr inbounds %struct.Piece, ptr %74, i32 0, i32 0
  store i8 82, ptr %75, align 4
  %76 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %77 = getelementptr inbounds %struct.Side, ptr %76, i32 0, i32 0
  %78 = getelementptr inbounds [16 x %struct.Piece], ptr %77, i64 0, i64 57
  %79 = getelementptr inbounds %struct.Piece, ptr %78, i32 0, i32 0
  store i8 78, ptr %79, align 4
  %80 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %81 = getelementptr inbounds %struct.Side, ptr %80, i32 0, i32 0
  %82 = getelementptr inbounds [16 x %struct.Piece], ptr %81, i64 0, i64 58
  %83 = getelementptr inbounds %struct.Piece, ptr %82, i32 0, i32 0
  store i8 66, ptr %83, align 4
  %84 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %85 = getelementptr inbounds %struct.Side, ptr %84, i32 0, i32 0
  %86 = getelementptr inbounds [16 x %struct.Piece], ptr %85, i64 0, i64 59
  %87 = getelementptr inbounds %struct.Piece, ptr %86, i32 0, i32 0
  store i8 81, ptr %87, align 4
  %88 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %89 = getelementptr inbounds %struct.Side, ptr %88, i32 0, i32 0
  %90 = getelementptr inbounds [16 x %struct.Piece], ptr %89, i64 0, i64 60
  %91 = getelementptr inbounds %struct.Piece, ptr %90, i32 0, i32 0
  store i8 75, ptr %91, align 4
  %92 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %93 = getelementptr inbounds %struct.Side, ptr %92, i32 0, i32 0
  %94 = getelementptr inbounds [16 x %struct.Piece], ptr %93, i64 0, i64 61
  %95 = getelementptr inbounds %struct.Piece, ptr %94, i32 0, i32 0
  store i8 66, ptr %95, align 4
  %96 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %97 = getelementptr inbounds %struct.Side, ptr %96, i32 0, i32 0
  %98 = getelementptr inbounds [16 x %struct.Piece], ptr %97, i64 0, i64 62
  %99 = getelementptr inbounds %struct.Piece, ptr %98, i32 0, i32 0
  store i8 78, ptr %99, align 4
  %100 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %101 = getelementptr inbounds %struct.Side, ptr %100, i32 0, i32 0
  %102 = getelementptr inbounds [16 x %struct.Piece], ptr %101, i64 0, i64 63
  %103 = getelementptr inbounds %struct.Piece, ptr %102, i32 0, i32 0
  store i8 82, ptr %103, align 4
  br label %104

104:                                              ; preds = %113, %71
  %.0 = phi i32 [ 0, %71 ], [ %114, %113 ]
  %105 = icmp slt i32 %.0, 8
  br i1 %105, label %106, label %115

106:                                              ; preds = %104
  %107 = getelementptr inbounds %struct.Board, ptr %1, i32 0, i32 1
  %108 = getelementptr inbounds %struct.Side, ptr %107, i32 0, i32 0
  %109 = add nsw i32 48, %.0
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [16 x %struct.Piece], ptr %108, i64 0, i64 %110
  %112 = getelementptr inbounds %struct.Piece, ptr %111, i32 0, i32 0
  store i8 80, ptr %112, align 4
  br label %113

113:                                              ; preds = %106
  %114 = add nsw i32 %.0, 1
  br label %104, !llvm.loop !12

115:                                              ; preds = %104
  call void @print_board(ptr noundef %1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

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
