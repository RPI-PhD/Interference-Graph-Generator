; ModuleID = 'LLVM_IR/falcon180b-43363.ll'
source_filename = "DATASETv2/falcon180b-43363.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@gameBoard = dso_local global [25 x [80 x i8]] zeroinitializer, align 16
@playerX = dso_local global i32 0, align 4
@playerY = dso_local global i32 0, align 4
@score = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Score: %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @initGame() #0 {
  %1 = call i64 @time(ptr noundef null) #3
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #3
  br label %3

3:                                                ; preds = %22, %0
  %.0 = phi i32 [ 0, %0 ], [ %23, %22 ]
  %4 = icmp slt i32 %.0, 25
  br i1 %4, label %5, label %24

5:                                                ; preds = %3
  br label %6

6:                                                ; preds = %19, %5
  %.01 = phi i32 [ 0, %5 ], [ %20, %19 ]
  %7 = icmp slt i32 %.01, 80
  br i1 %7, label %8, label %21

8:                                                ; preds = %6
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 2
  %11 = icmp eq i32 %10, 0
  %12 = zext i1 %11 to i64
  %13 = select i1 %11, i32 46, i32 35
  %14 = trunc i32 %13 to i8
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [25 x [80 x i8]], ptr @gameBoard, i64 0, i64 %15
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [80 x i8], ptr %16, i64 0, i64 %17
  store i8 %14, ptr %18, align 1
  br label %19

19:                                               ; preds = %8
  %20 = add nsw i32 %.01, 1
  br label %6, !llvm.loop !6

21:                                               ; preds = %6
  br label %22

22:                                               ; preds = %21
  %23 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

24:                                               ; preds = %3
  store i32 0, ptr @playerX, align 4
  store i32 12, ptr @playerY, align 4
  store i32 0, ptr @score, align 4
  ret void
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printGameBoard() #0 {
  br label %1

1:                                                ; preds = %18, %0
  %.0 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %2 = icmp slt i32 %.0, 25
  br i1 %2, label %3, label %20

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %14, %3
  %.01 = phi i32 [ 0, %3 ], [ %15, %14 ]
  %5 = icmp slt i32 %.01, 80
  br i1 %5, label %6, label %16

6:                                                ; preds = %4
  %7 = sext i32 %.0 to i64
  %8 = getelementptr inbounds [25 x [80 x i8]], ptr @gameBoard, i64 0, i64 %7
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [80 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %12)
  br label %14

14:                                               ; preds = %6
  %15 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !9

16:                                               ; preds = %4
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %18

18:                                               ; preds = %16
  %19 = add nsw i32 %.0, 1
  br label %1, !llvm.loop !10

20:                                               ; preds = %1
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @movePlayer(i32 noundef %0, i32 noundef %1) #0 {
  %3 = load i32, ptr @playerX, align 4
  %4 = add nsw i32 %3, %0
  %5 = load i32, ptr @playerY, align 4
  %6 = add nsw i32 %5, %1
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [25 x [80 x i8]], ptr @gameBoard, i64 0, i64 %7
  %9 = sext i32 %4 to i64
  %10 = getelementptr inbounds [80 x i8], ptr %8, i64 0, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 46
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  store i32 %4, ptr @playerX, align 4
  store i32 %6, ptr @playerY, align 4
  br label %15

15:                                               ; preds = %14, %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @checkWin() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @generateLevel() #0 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  call void @initGame()
  br label %1

1:                                                ; preds = %1, %0
  call void @printGameBoard()
  %2 = load i32, ptr @score, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %2)
  %4 = call i32 @getchar()
  call void @generateLevel()
  br label %1
}

declare i32 @getchar() #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
