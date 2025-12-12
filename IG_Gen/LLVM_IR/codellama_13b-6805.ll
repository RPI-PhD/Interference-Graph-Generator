; ModuleID = 'DATASETv2/codellama_13b-6805.c'
source_filename = "DATASETv2/codellama_13b-6805.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@start_x = dso_local global i32 0, align 4
@start_y = dso_local global i32 0, align 4
@end_x = dso_local global i32 9, align 4
@end_y = dso_local global i32 9, align 4
@dir_x = dso_local global i32 0, align 4
@dir_y = dso_local global i32 0, align 4
@moving = dso_local global i8 1, align 1
@maze = dso_local global [10 x [10 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @is_valid_position(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %17, label %8

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp sge i32 %9, 10
  br i1 %10, label %17, label %11

11:                                               ; preds = %8
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %11
  %15 = load i32, ptr %5, align 4
  %16 = icmp sge i32 %15, 10
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %11, %8, %2
  store i1 false, ptr %3, align 1
  br label %29

18:                                               ; preds = %14
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [10 x [10 x i32]], ptr @maze, i64 0, i64 %20
  %22 = load i32, ptr %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %28

27:                                               ; preds = %18
  store i1 false, ptr %3, align 1
  br label %29

28:                                               ; preds = %18
  store i1 true, ptr %3, align 1
  br label %29

29:                                               ; preds = %28, %27, %17
  %30 = load i1, ptr %3, align 1
  ret i1 %30
}

; Function Attrs: noinline nounwind  uwtable
define dso_local zeroext i1 @is_end_position(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr @end_x, align 4
  %8 = icmp eq i32 %6, %7
  br i1 %8, label %9, label %14

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr @end_y, align 4
  %12 = icmp eq i32 %10, %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  store i1 true, ptr %3, align 1
  br label %15

14:                                               ; preds = %9, %2
  store i1 false, ptr %3, align 1
  br label %15

15:                                               ; preds = %14, %13
  %16 = load i1, ptr %3, align 1
  ret i1 %16
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = call zeroext i1 @is_valid_position(i32 noundef %7, i32 noundef %8)
  br i1 %9, label %11, label %10

10:                                               ; preds = %2
  br label %30

11:                                               ; preds = %2
  %12 = load i32, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = call zeroext i1 @is_end_position(i32 noundef %12, i32 noundef %13)
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  store i8 0, ptr @moving, align 1
  br label %30

16:                                               ; preds = %11
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr @dir_x, align 4
  %19 = add nsw i32 %17, %18
  store i32 %19, ptr %5, align 4
  %20 = load i32, ptr %4, align 4
  %21 = load i32, ptr @dir_y, align 4
  %22 = add nsw i32 %20, %21
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %5, align 4
  %24 = load i32, ptr %6, align 4
  %25 = call zeroext i1 @is_valid_position(i32 noundef %23, i32 noundef %24)
  br i1 %25, label %27, label %26

26:                                               ; preds = %16
  br label %30

27:                                               ; preds = %16
  %28 = load i32, ptr %5, align 4
  store i32 %28, ptr %3, align 4
  %29 = load i32, ptr %6, align 4
  store i32 %29, ptr %4, align 4
  br label %30

30:                                               ; preds = %27, %26, %15, %10
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @generate_random_direction() #0 {
  %1 = call i32 @rand() #3
  %2 = srem i32 %1, 3
  %3 = sub nsw i32 %2, 1
  store i32 %3, ptr @dir_x, align 4
  %4 = call i32 @rand() #3
  %5 = srem i32 %4, 3
  %6 = sub nsw i32 %5, 1
  store i32 %6, ptr @dir_y, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @solve_maze() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = load i32, ptr @start_x, align 4
  store i32 %3, ptr %1, align 4
  %4 = load i32, ptr @start_y, align 4
  store i32 %4, ptr %2, align 4
  call void @generate_random_direction()
  %5 = load i32, ptr %1, align 4
  %6 = load i32, ptr %2, align 4
  call void @move(i32 noundef %5, i32 noundef %6)
  br label %7

7:                                                ; preds = %10, %0
  %8 = load i8, ptr @moving, align 1
  %9 = trunc i8 %8 to i1
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  call void @generate_random_direction()
  %11 = load i32, ptr %1, align 4
  %12 = load i32, ptr %2, align 4
  call void @move(i32 noundef %11, i32 noundef %12)
  br label %7, !llvm.loop !6

13:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %6

6:                                                ; preds = %24, %0
  %7 = load i32, ptr %2, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %27

9:                                                ; preds = %6
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %20, %9
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 10
  br i1 %12, label %13, label %23

13:                                               ; preds = %10
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x [10 x i32]], ptr @maze, i64 0, i64 %15
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [10 x i32], ptr %16, i64 0, i64 %18
  store i32 0, ptr %19, align 4
  br label %20

20:                                               ; preds = %13
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %10, !llvm.loop !8

23:                                               ; preds = %10
  br label %24

24:                                               ; preds = %23
  %25 = load i32, ptr %2, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %2, align 4
  br label %6, !llvm.loop !9

27:                                               ; preds = %6
  store i32 1, ptr @maze, align 16
  store i32 1, ptr getelementptr inbounds ([10 x i32], ptr @maze, i64 0, i64 9), align 4
  store i32 1, ptr getelementptr inbounds ([10 x [10 x i32]], ptr @maze, i64 0, i64 9), align 8
  store i32 1, ptr getelementptr inbounds ([10 x [10 x i32]], ptr @maze, i64 0, i64 9, i64 9), align 4
  call void @solve_maze()
  store i32 0, ptr %4, align 4
  br label %28

28:                                               ; preds = %49, %27
  %29 = load i32, ptr %4, align 4
  %30 = icmp slt i32 %29, 10
  br i1 %30, label %31, label %52

31:                                               ; preds = %28
  store i32 0, ptr %5, align 4
  br label %32

32:                                               ; preds = %44, %31
  %33 = load i32, ptr %5, align 4
  %34 = icmp slt i32 %33, 10
  br i1 %34, label %35, label %47

35:                                               ; preds = %32
  %36 = load i32, ptr %4, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [10 x [10 x i32]], ptr @maze, i64 0, i64 %37
  %39 = load i32, ptr %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [10 x i32], ptr %38, i64 0, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %42)
  br label %44

44:                                               ; preds = %35
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %5, align 4
  br label %32, !llvm.loop !10

47:                                               ; preds = %32
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %49

49:                                               ; preds = %47
  %50 = load i32, ptr %4, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %4, align 4
  br label %28, !llvm.loop !11

52:                                               ; preds = %28
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

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
!11 = distinct !{!11, !7}
