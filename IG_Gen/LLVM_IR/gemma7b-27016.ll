; ModuleID = 'DATASETv2/gemma7b-27016.c'
source_filename = "DATASETv2/gemma7b-27016.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, i32, ptr }

@.str = private unnamed_addr constant [3 x i8] c"O \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @createMaze(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  store ptr null, ptr %8, align 8
  store i32 0, ptr %5, align 4
  br label %9

9:                                                ; preds = %44, %1
  %10 = load i32, ptr %5, align 4
  %11 = icmp slt i32 %10, 10
  br i1 %11, label %12, label %47

12:                                               ; preds = %9
  store i32 0, ptr %6, align 4
  br label %13

13:                                               ; preds = %40, %12
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 10
  br i1 %15, label %16, label %43

16:                                               ; preds = %13
  %17 = call noalias ptr @malloc(i64 noundef 16) #3
  store ptr %17, ptr %7, align 8
  %18 = load i32, ptr %5, align 4
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 0
  store i32 %18, ptr %20, align 8
  %21 = load i32, ptr %6, align 4
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds %struct.Node, ptr %22, i32 0, i32 1
  store i32 %21, ptr %23, align 4
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds %struct.Node, ptr %24, i32 0, i32 2
  store ptr null, ptr %25, align 8
  %26 = load ptr, ptr %2, align 8
  %27 = load ptr, ptr %26, align 8
  %28 = icmp eq ptr %27, null
  br i1 %28, label %29, label %32

29:                                               ; preds = %16
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %2, align 8
  store ptr %30, ptr %31, align 8
  br label %39

32:                                               ; preds = %16
  %33 = load ptr, ptr %7, align 8
  %34 = load ptr, ptr %2, align 8
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.Node, ptr %35, i32 0, i32 2
  store ptr %33, ptr %36, align 8
  %37 = load ptr, ptr %7, align 8
  %38 = load ptr, ptr %2, align 8
  store ptr %37, ptr %38, align 8
  br label %39

39:                                               ; preds = %32, %29
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %6, align 4
  br label %13, !llvm.loop !6

43:                                               ; preds = %13
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %5, align 4
  br label %9, !llvm.loop !8

47:                                               ; preds = %9
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @printMaze(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %41, %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %44

9:                                                ; preds = %6
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %36, %9
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %11, 10
  br i1 %12, label %13, label %39

13:                                               ; preds = %10
  %14 = load ptr, ptr %2, align 8
  store ptr %14, ptr %5, align 8
  br label %15

15:                                               ; preds = %34, %13
  %16 = load ptr, ptr %5, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %35

18:                                               ; preds = %15
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = load i32, ptr %3, align 4
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %32

24:                                               ; preds = %18
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = load i32, ptr %4, align 4
  %29 = icmp eq i32 %27, %28
  br i1 %29, label %30, label %32

30:                                               ; preds = %24
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %34

32:                                               ; preds = %24, %18
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %34

34:                                               ; preds = %32, %30
  br label %15, !llvm.loop !9

35:                                               ; preds = %15
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %4, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %4, align 4
  br label %10, !llvm.loop !10

39:                                               ; preds = %10
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %41

41:                                               ; preds = %39
  %42 = load i32, ptr %3, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %3, align 4
  br label %6, !llvm.loop !11

44:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  call void @createMaze(ptr noundef %2)
  %3 = load ptr, ptr %2, align 8
  call void @printMaze(ptr noundef %3)
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) }

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
