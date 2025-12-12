; ModuleID = 'DATASETv2/gemma7b-24778.c'
source_filename = "DATASETv2/gemma7b-24778.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@invader_direction = dso_local global i32 1, align 4
@invader_shoot_direction = dso_local global i32 -1, align 4
@player_x = dso_local global i32 0, align 4
@player_y = dso_local global i32 0, align 4
@player_health = dso_local global i32 3, align 4
@level = dso_local global i32 1, align 4
@.str = private unnamed_addr constant [2 x i8] c"o\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.2 = private unnamed_addr constant [53 x i8] c"###################################################\0A\00", align 1
@invaders_x = dso_local global [5 x i32] zeroinitializer, align 16
@invaders_y = dso_local global [5 x i32] zeroinitializer, align 16
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"Game Over!\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"Level Complete!\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"pause\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_invaders() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %2

2:                                                ; preds = %7, %0
  %3 = load i32, ptr %1, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %10

5:                                                ; preds = %2
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %7

7:                                                ; preds = %5
  %8 = load i32, ptr %1, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %1, align 4
  br label %2, !llvm.loop !6

10:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_player() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_border() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @move_invaders() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, ptr @invader_direction, align 4
  switch i32 %3, label %32 [
    i32 1, label %4
    i32 -1, label %18
  ]

4:                                                ; preds = %0
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %14, %4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [5 x i32], ptr @invaders_x, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %11, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %1, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %1, align 4
  br label %5, !llvm.loop !8

17:                                               ; preds = %5
  br label %32

18:                                               ; preds = %0
  store i32 0, ptr %2, align 4
  br label %19

19:                                               ; preds = %28, %18
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 5
  br i1 %21, label %22, label %31

22:                                               ; preds = %19
  %23 = load i32, ptr %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [5 x i32], ptr @invaders_x, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, ptr %25, align 4
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %2, align 4
  br label %19, !llvm.loop !9

31:                                               ; preds = %19
  br label %32

32:                                               ; preds = %0, %31, %17
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @shoot_invaders() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, ptr @invader_shoot_direction, align 4
  switch i32 %3, label %32 [
    i32 -1, label %4
    i32 1, label %18
  ]

4:                                                ; preds = %0
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %14, %4
  %6 = load i32, ptr %1, align 4
  %7 = icmp slt i32 %6, 5
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = load i32, ptr %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [5 x i32], ptr @invaders_y, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  %13 = add nsw i32 %12, -1
  store i32 %13, ptr %11, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %1, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %1, align 4
  br label %5, !llvm.loop !10

17:                                               ; preds = %5
  br label %32

18:                                               ; preds = %0
  store i32 0, ptr %2, align 4
  br label %19

19:                                               ; preds = %28, %18
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %20, 5
  br i1 %21, label %22, label %31

22:                                               ; preds = %19
  %23 = load i32, ptr %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [5 x i32], ptr @invaders_y, i64 0, i64 %24
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %25, align 4
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %2, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %2, align 4
  br label %19, !llvm.loop !11

31:                                               ; preds = %19
  br label %32

32:                                               ; preds = %0, %31, %17
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @check_game_over() #0 {
  %1 = load i32, ptr @player_health, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %5

3:                                                ; preds = %0
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef @.str.4)
  call void @exit(i32 noundef 0) #3
  unreachable

5:                                                ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @check_level_complete() #0 {
  %1 = load i32, ptr @invaders_x, align 16
  %2 = load i32, ptr @level, align 4
  %3 = mul nsw i32 %2, 20
  %4 = icmp eq i32 %1, %3
  br i1 %4, label %5, label %9

5:                                                ; preds = %0
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef @.str.5)
  %7 = load i32, ptr @level, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, ptr @level, align 4
  br label %9

9:                                                ; preds = %5, %0
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %3

3:                                                ; preds = %14, %0
  %4 = load i32, ptr %2, align 4
  %5 = icmp slt i32 %4, 5
  br i1 %5, label %6, label %17

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %2, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x i32], ptr @invaders_x, i64 0, i64 %9
  store i32 %7, ptr %10, align 4
  %11 = load i32, ptr %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [5 x i32], ptr @invaders_y, i64 0, i64 %12
  store i32 0, ptr %13, align 4
  br label %14

14:                                               ; preds = %6
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %2, align 4
  br label %3, !llvm.loop !12

17:                                               ; preds = %3
  store i32 0, ptr @player_x, align 4
  store i32 0, ptr @player_y, align 4
  br label %18

18:                                               ; preds = %17, %18
  call void @draw_border()
  call void @draw_invaders()
  call void @draw_player()
  call void @move_invaders()
  call void @shoot_invaders()
  call void @check_game_over()
  call void @check_level_complete()
  %19 = call i32 @system(ptr noundef @.str.6)
  br label %18
}

declare i32 @system(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

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
