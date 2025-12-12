; ModuleID = 'DATASETv2/gemini_pro-1805.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_board(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.Piece, align 4
  store ptr %0, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %65, %1
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 8
  br i1 %10, label %11, label %68

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %13)
  store i32 0, ptr %4, align 4
  br label %15

15:                                               ; preds = %60, %11
  %16 = load i32, ptr %4, align 4
  %17 = icmp slt i32 %16, 8
  br i1 %17, label %18, label %63

18:                                               ; preds = %15
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.Board, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.Side, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %3, align 4
  %23 = mul nsw i32 %22, 8
  %24 = load i32, ptr %4, align 4
  %25 = add nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [16 x %struct.Piece], ptr %21, i64 0, i64 %26
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %27, i64 12, i1 false)
  %28 = getelementptr inbounds %struct.Piece, ptr %5, i32 0, i32 0
  %29 = load i8, ptr %28, align 4
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %30, 32
  br i1 %31, label %32, label %37

32:                                               ; preds = %18
  %33 = getelementptr inbounds %struct.Piece, ptr %5, i32 0, i32 0
  %34 = load i8, ptr %33, align 4
  %35 = sext i8 %34 to i32
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %35)
  br label %59

37:                                               ; preds = %18
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.Board, ptr %38, i32 0, i32 1
  %40 = getelementptr inbounds %struct.Side, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %3, align 4
  %42 = mul nsw i32 %41, 8
  %43 = load i32, ptr %4, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [16 x %struct.Piece], ptr %40, i64 0, i64 %45
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %5, ptr align 4 %46, i64 12, i1 false)
  %47 = getelementptr inbounds %struct.Piece, ptr %5, i32 0, i32 0
  %48 = load i8, ptr %47, align 4
  %49 = sext i8 %48 to i32
  %50 = icmp ne i32 %49, 32
  br i1 %50, label %51, label %56

51:                                               ; preds = %37
  %52 = getelementptr inbounds %struct.Piece, ptr %5, i32 0, i32 0
  %53 = load i8, ptr %52, align 4
  %54 = sext i8 %53 to i32
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %54)
  br label %58

56:                                               ; preds = %37
  %57 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %58

58:                                               ; preds = %56, %51
  br label %59

59:                                               ; preds = %58, %32
  br label %60

60:                                               ; preds = %59
  %61 = load i32, ptr %4, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %4, align 4
  br label %15, !llvm.loop !6

63:                                               ; preds = %15
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %65

65:                                               ; preds = %63
  %66 = load i32, ptr %3, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %3, align 4
  br label %8, !llvm.loop !8

68:                                               ; preds = %8
  %69 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Board, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %37, %0
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 8
  br i1 %9, label %10, label %40

10:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %33, %10
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 8
  br i1 %13, label %14, label %36

14:                                               ; preds = %11
  %15 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %16 = getelementptr inbounds %struct.Side, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %3, align 4
  %18 = mul nsw i32 %17, 8
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %18, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [16 x %struct.Piece], ptr %16, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.Piece, ptr %22, i32 0, i32 0
  store i8 32, ptr %23, align 4
  %24 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %25 = getelementptr inbounds %struct.Side, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %3, align 4
  %27 = mul nsw i32 %26, 8
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [16 x %struct.Piece], ptr %25, i64 0, i64 %30
  %32 = getelementptr inbounds %struct.Piece, ptr %31, i32 0, i32 0
  store i8 32, ptr %32, align 4
  br label %33

33:                                               ; preds = %14
  %34 = load i32, ptr %4, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %4, align 4
  br label %11, !llvm.loop !9

36:                                               ; preds = %11
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %7, !llvm.loop !10

40:                                               ; preds = %7
  %41 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %42 = getelementptr inbounds %struct.Side, ptr %41, i32 0, i32 0
  %43 = getelementptr inbounds [16 x %struct.Piece], ptr %42, i64 0, i64 0
  %44 = getelementptr inbounds %struct.Piece, ptr %43, i32 0, i32 0
  store i8 82, ptr %44, align 4
  %45 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %46 = getelementptr inbounds %struct.Side, ptr %45, i32 0, i32 0
  %47 = getelementptr inbounds [16 x %struct.Piece], ptr %46, i64 0, i64 1
  %48 = getelementptr inbounds %struct.Piece, ptr %47, i32 0, i32 0
  store i8 78, ptr %48, align 4
  %49 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %50 = getelementptr inbounds %struct.Side, ptr %49, i32 0, i32 0
  %51 = getelementptr inbounds [16 x %struct.Piece], ptr %50, i64 0, i64 2
  %52 = getelementptr inbounds %struct.Piece, ptr %51, i32 0, i32 0
  store i8 66, ptr %52, align 4
  %53 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %54 = getelementptr inbounds %struct.Side, ptr %53, i32 0, i32 0
  %55 = getelementptr inbounds [16 x %struct.Piece], ptr %54, i64 0, i64 3
  %56 = getelementptr inbounds %struct.Piece, ptr %55, i32 0, i32 0
  store i8 81, ptr %56, align 4
  %57 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %58 = getelementptr inbounds %struct.Side, ptr %57, i32 0, i32 0
  %59 = getelementptr inbounds [16 x %struct.Piece], ptr %58, i64 0, i64 4
  %60 = getelementptr inbounds %struct.Piece, ptr %59, i32 0, i32 0
  store i8 75, ptr %60, align 4
  %61 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %62 = getelementptr inbounds %struct.Side, ptr %61, i32 0, i32 0
  %63 = getelementptr inbounds [16 x %struct.Piece], ptr %62, i64 0, i64 5
  %64 = getelementptr inbounds %struct.Piece, ptr %63, i32 0, i32 0
  store i8 66, ptr %64, align 4
  %65 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %66 = getelementptr inbounds %struct.Side, ptr %65, i32 0, i32 0
  %67 = getelementptr inbounds [16 x %struct.Piece], ptr %66, i64 0, i64 6
  %68 = getelementptr inbounds %struct.Piece, ptr %67, i32 0, i32 0
  store i8 78, ptr %68, align 4
  %69 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %70 = getelementptr inbounds %struct.Side, ptr %69, i32 0, i32 0
  %71 = getelementptr inbounds [16 x %struct.Piece], ptr %70, i64 0, i64 7
  %72 = getelementptr inbounds %struct.Piece, ptr %71, i32 0, i32 0
  store i8 82, ptr %72, align 4
  store i32 0, ptr %5, align 4
  br label %73

73:                                               ; preds = %84, %40
  %74 = load i32, ptr %5, align 4
  %75 = icmp slt i32 %74, 8
  br i1 %75, label %76, label %87

76:                                               ; preds = %73
  %77 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 0
  %78 = getelementptr inbounds %struct.Side, ptr %77, i32 0, i32 0
  %79 = load i32, ptr %5, align 4
  %80 = add nsw i32 8, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [16 x %struct.Piece], ptr %78, i64 0, i64 %81
  %83 = getelementptr inbounds %struct.Piece, ptr %82, i32 0, i32 0
  store i8 80, ptr %83, align 4
  br label %84

84:                                               ; preds = %76
  %85 = load i32, ptr %5, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %5, align 4
  br label %73, !llvm.loop !11

87:                                               ; preds = %73
  %88 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %89 = getelementptr inbounds %struct.Side, ptr %88, i32 0, i32 0
  %90 = getelementptr inbounds [16 x %struct.Piece], ptr %89, i64 0, i64 56
  %91 = getelementptr inbounds %struct.Piece, ptr %90, i32 0, i32 0
  store i8 82, ptr %91, align 4
  %92 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %93 = getelementptr inbounds %struct.Side, ptr %92, i32 0, i32 0
  %94 = getelementptr inbounds [16 x %struct.Piece], ptr %93, i64 0, i64 57
  %95 = getelementptr inbounds %struct.Piece, ptr %94, i32 0, i32 0
  store i8 78, ptr %95, align 4
  %96 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %97 = getelementptr inbounds %struct.Side, ptr %96, i32 0, i32 0
  %98 = getelementptr inbounds [16 x %struct.Piece], ptr %97, i64 0, i64 58
  %99 = getelementptr inbounds %struct.Piece, ptr %98, i32 0, i32 0
  store i8 66, ptr %99, align 4
  %100 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %101 = getelementptr inbounds %struct.Side, ptr %100, i32 0, i32 0
  %102 = getelementptr inbounds [16 x %struct.Piece], ptr %101, i64 0, i64 59
  %103 = getelementptr inbounds %struct.Piece, ptr %102, i32 0, i32 0
  store i8 81, ptr %103, align 4
  %104 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %105 = getelementptr inbounds %struct.Side, ptr %104, i32 0, i32 0
  %106 = getelementptr inbounds [16 x %struct.Piece], ptr %105, i64 0, i64 60
  %107 = getelementptr inbounds %struct.Piece, ptr %106, i32 0, i32 0
  store i8 75, ptr %107, align 4
  %108 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %109 = getelementptr inbounds %struct.Side, ptr %108, i32 0, i32 0
  %110 = getelementptr inbounds [16 x %struct.Piece], ptr %109, i64 0, i64 61
  %111 = getelementptr inbounds %struct.Piece, ptr %110, i32 0, i32 0
  store i8 66, ptr %111, align 4
  %112 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %113 = getelementptr inbounds %struct.Side, ptr %112, i32 0, i32 0
  %114 = getelementptr inbounds [16 x %struct.Piece], ptr %113, i64 0, i64 62
  %115 = getelementptr inbounds %struct.Piece, ptr %114, i32 0, i32 0
  store i8 78, ptr %115, align 4
  %116 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %117 = getelementptr inbounds %struct.Side, ptr %116, i32 0, i32 0
  %118 = getelementptr inbounds [16 x %struct.Piece], ptr %117, i64 0, i64 63
  %119 = getelementptr inbounds %struct.Piece, ptr %118, i32 0, i32 0
  store i8 82, ptr %119, align 4
  store i32 0, ptr %6, align 4
  br label %120

120:                                              ; preds = %131, %87
  %121 = load i32, ptr %6, align 4
  %122 = icmp slt i32 %121, 8
  br i1 %122, label %123, label %134

123:                                              ; preds = %120
  %124 = getelementptr inbounds %struct.Board, ptr %2, i32 0, i32 1
  %125 = getelementptr inbounds %struct.Side, ptr %124, i32 0, i32 0
  %126 = load i32, ptr %6, align 4
  %127 = add nsw i32 48, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [16 x %struct.Piece], ptr %125, i64 0, i64 %128
  %130 = getelementptr inbounds %struct.Piece, ptr %129, i32 0, i32 0
  store i8 80, ptr %130, align 4
  br label %131

131:                                              ; preds = %123
  %132 = load i32, ptr %6, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, ptr %6, align 4
  br label %120, !llvm.loop !12

134:                                              ; preds = %120
  call void @print_board(ptr noundef %2)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
