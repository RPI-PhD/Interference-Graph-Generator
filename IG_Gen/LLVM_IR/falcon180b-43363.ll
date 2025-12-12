; ModuleID = 'DATASETv2/falcon180b-43363.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @initGame() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %29, %0
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 25
  br i1 %7, label %8, label %32

8:                                                ; preds = %5
  store i32 0, ptr %2, align 4
  br label %9

9:                                                ; preds = %25, %8
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 80
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = call i32 @rand() #3
  %14 = srem i32 %13, 2
  %15 = icmp eq i32 %14, 0
  %16 = zext i1 %15 to i64
  %17 = select i1 %15, i32 46, i32 35
  %18 = trunc i32 %17 to i8
  %19 = load i32, ptr %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [25 x [80 x i8]], ptr @gameBoard, i64 0, i64 %20
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [80 x i8], ptr %21, i64 0, i64 %23
  store i8 %18, ptr %24, align 1
  br label %25

25:                                               ; preds = %12
  %26 = load i32, ptr %2, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %2, align 4
  br label %9, !llvm.loop !6

28:                                               ; preds = %9
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %1, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %1, align 4
  br label %5, !llvm.loop !8

32:                                               ; preds = %5
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printGameBoard() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %25, %0
  %4 = load i32, ptr %1, align 4
  %5 = icmp slt i32 %4, 25
  br i1 %5, label %6, label %28

6:                                                ; preds = %3
  store i32 0, ptr %2, align 4
  br label %7

7:                                                ; preds = %20, %6
  %8 = load i32, ptr %2, align 4
  %9 = icmp slt i32 %8, 80
  br i1 %9, label %10, label %23

10:                                               ; preds = %7
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [25 x [80 x i8]], ptr @gameBoard, i64 0, i64 %12
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [80 x i8], ptr %13, i64 0, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %18)
  br label %20

20:                                               ; preds = %10
  %21 = load i32, ptr %2, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %2, align 4
  br label %7, !llvm.loop !9

23:                                               ; preds = %7
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %25

25:                                               ; preds = %23
  %26 = load i32, ptr %1, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %1, align 4
  br label %3, !llvm.loop !10

28:                                               ; preds = %3
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @movePlayer(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr @playerX, align 4
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %7, %8
  store i32 %9, ptr %5, align 4
  %10 = load i32, ptr @playerY, align 4
  %11 = load i32, ptr %4, align 4
  %12 = add nsw i32 %10, %11
  store i32 %12, ptr %6, align 4
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [25 x [80 x i8]], ptr @gameBoard, i64 0, i64 %14
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [80 x i8], ptr %15, i64 0, i64 %17
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 46
  br i1 %21, label %22, label %25

22:                                               ; preds = %2
  %23 = load i32, ptr %5, align 4
  store i32 %23, ptr @playerX, align 4
  %24 = load i32, ptr %6, align 4
  store i32 %24, ptr @playerY, align 4
  br label %25

25:                                               ; preds = %22, %2
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @checkWin() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generateLevel() #0 {
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @initGame()
  br label %2

2:                                                ; preds = %0, %2
  call void @printGameBoard()
  %3 = load i32, ptr @score, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %3)
  %5 = call i32 @getchar()
  call void @generateLevel()
  br label %2
}

declare i32 @getchar() #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
