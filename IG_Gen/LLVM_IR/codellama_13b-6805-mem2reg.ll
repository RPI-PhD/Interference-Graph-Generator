; ModuleID = 'LLVM_IR/codellama_13b-6805.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @is_valid_position(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp slt i32 %0, 0
  br i1 %3, label %10, label %4

4:                                                ; preds = %2
  %5 = icmp sge i32 %0, 10
  br i1 %5, label %10, label %6

6:                                                ; preds = %4
  %7 = icmp slt i32 %1, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %6
  %9 = icmp sge i32 %1, 10
  br i1 %9, label %10, label %11

10:                                               ; preds = %8, %6, %4, %2
  br label %20

11:                                               ; preds = %8
  %12 = sext i32 %0 to i64
  %13 = getelementptr inbounds [10 x [10 x i32]], ptr @maze, i64 0, i64 %12
  %14 = sext i32 %1 to i64
  %15 = getelementptr inbounds [10 x i32], ptr %13, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %11
  br label %20

19:                                               ; preds = %11
  br label %20

20:                                               ; preds = %19, %18, %10
  %.0 = phi i1 [ false, %10 ], [ false, %18 ], [ true, %19 ]
  ret i1 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @is_end_position(i32 noundef %0, i32 noundef %1) #0 {
  %3 = load i32, ptr @end_x, align 4
  %4 = icmp eq i32 %0, %3
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = load i32, ptr @end_y, align 4
  %7 = icmp eq i32 %1, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  br label %10

9:                                                ; preds = %5, %2
  br label %10

10:                                               ; preds = %9, %8
  %.0 = phi i1 [ true, %8 ], [ false, %9 ]
  ret i1 %.0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @move(i32 noundef %0, i32 noundef %1) #0 {
  %3 = call zeroext i1 @is_valid_position(i32 noundef %0, i32 noundef %1)
  br i1 %3, label %5, label %4

4:                                                ; preds = %2
  br label %16

5:                                                ; preds = %2
  %6 = call zeroext i1 @is_end_position(i32 noundef %0, i32 noundef %1)
  br i1 %6, label %7, label %8

7:                                                ; preds = %5
  store i8 0, ptr @moving, align 1
  br label %16

8:                                                ; preds = %5
  %9 = load i32, ptr @dir_x, align 4
  %10 = add nsw i32 %0, %9
  %11 = load i32, ptr @dir_y, align 4
  %12 = add nsw i32 %1, %11
  %13 = call zeroext i1 @is_valid_position(i32 noundef %10, i32 noundef %12)
  br i1 %13, label %15, label %14

14:                                               ; preds = %8
  br label %16

15:                                               ; preds = %8
  br label %16

16:                                               ; preds = %15, %14, %7, %4
  ret void
}

; Function Attrs: noinline nounwind uwtable
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

; Function Attrs: noinline nounwind uwtable
define dso_local void @solve_maze() #0 {
  %1 = load i32, ptr @start_x, align 4
  %2 = load i32, ptr @start_y, align 4
  call void @generate_random_direction()
  call void @move(i32 noundef %1, i32 noundef %2)
  br label %3

3:                                                ; preds = %6, %0
  %4 = load i8, ptr @moving, align 1
  %5 = trunc i8 %4 to i1
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  call void @generate_random_direction()
  call void @move(i32 noundef %1, i32 noundef %2)
  br label %3, !llvm.loop !6

7:                                                ; preds = %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  br label %1

1:                                                ; preds = %14, %0
  %.01 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %2 = icmp slt i32 %.01, 10
  br i1 %2, label %3, label %16

3:                                                ; preds = %1
  br label %4

4:                                                ; preds = %11, %3
  %.02 = phi i32 [ 0, %3 ], [ %12, %11 ]
  %5 = icmp slt i32 %.02, 10
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = sext i32 %.01 to i64
  %8 = getelementptr inbounds [10 x [10 x i32]], ptr @maze, i64 0, i64 %7
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds [10 x i32], ptr %8, i64 0, i64 %9
  store i32 0, ptr %10, align 4
  br label %11

11:                                               ; preds = %6
  %12 = add nsw i32 %.02, 1
  br label %4, !llvm.loop !8

13:                                               ; preds = %4
  br label %14

14:                                               ; preds = %13
  %15 = add nsw i32 %.01, 1
  br label %1, !llvm.loop !9

16:                                               ; preds = %1
  store i32 1, ptr @maze, align 16
  store i32 1, ptr getelementptr inbounds ([10 x i32], ptr @maze, i64 0, i64 9), align 4
  store i32 1, ptr getelementptr inbounds ([10 x [10 x i32]], ptr @maze, i64 0, i64 9), align 8
  store i32 1, ptr getelementptr inbounds ([10 x [10 x i32]], ptr @maze, i64 0, i64 9, i64 9), align 4
  call void @solve_maze()
  br label %17

17:                                               ; preds = %33, %16
  %.03 = phi i32 [ 0, %16 ], [ %34, %33 ]
  %18 = icmp slt i32 %.03, 10
  br i1 %18, label %19, label %35

19:                                               ; preds = %17
  br label %20

20:                                               ; preds = %29, %19
  %.0 = phi i32 [ 0, %19 ], [ %30, %29 ]
  %21 = icmp slt i32 %.0, 10
  br i1 %21, label %22, label %31

22:                                               ; preds = %20
  %23 = sext i32 %.03 to i64
  %24 = getelementptr inbounds [10 x [10 x i32]], ptr @maze, i64 0, i64 %23
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds [10 x i32], ptr %24, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %27)
  br label %29

29:                                               ; preds = %22
  %30 = add nsw i32 %.0, 1
  br label %20, !llvm.loop !10

31:                                               ; preds = %20
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %33

33:                                               ; preds = %31
  %34 = add nsw i32 %.03, 1
  br label %17, !llvm.loop !11

35:                                               ; preds = %17
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

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
!11 = distinct !{!11, !7}
