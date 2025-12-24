; ModuleID = 'LLVM_IR/gemini_pro-26644.ll'
source_filename = "DATASETv2/gemini_pro-26644.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.airport = type { [10 x %struct.belt] }
%struct.belt = type { [1000 x %struct.bag], i32 }
%struct.bag = type { i32, i32, i32 }

@.str = private unnamed_addr constant [38 x i8] c"Bag %d has arrived at destination %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"Belt %d: \00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"(%d, %d) \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_airport(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %9, %1
  %.0 = phi i32 [ 0, %1 ], [ %10, %9 ]
  %3 = icmp slt i32 %.0, 10
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.airport, ptr %0, i32 0, i32 0
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [10 x %struct.belt], ptr %5, i64 0, i64 %6
  %8 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 1
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %4
  %10 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !6

11:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @create_bag(ptr noundef %0) #0 {
  %2 = call i32 @rand() #4
  %3 = srem i32 %2, 50
  %4 = add nsw i32 %3, 1
  %5 = getelementptr inbounds %struct.bag, ptr %0, i32 0, i32 0
  store i32 %4, ptr %5, align 4
  %6 = call i32 @rand() #4
  %7 = srem i32 %6, 100
  %8 = add nsw i32 %7, 1
  %9 = getelementptr inbounds %struct.bag, ptr %0, i32 0, i32 1
  store i32 %8, ptr %9, align 4
  %10 = call i32 @rand() #4
  %11 = srem i32 %10, 10
  %12 = getelementptr inbounds %struct.bag, ptr %0, i32 0, i32 2
  store i32 %11, ptr %12, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @load_bag(ptr noundef %0, ptr noundef %1) #0 {
  %3 = getelementptr inbounds %struct.belt, ptr %0, i32 0, i32 0
  %4 = getelementptr inbounds %struct.belt, ptr %0, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [1000 x %struct.bag], ptr %3, i64 0, i64 %6
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %7, ptr align 4 %1, i64 12, i1 false)
  %8 = getelementptr inbounds %struct.belt, ptr %0, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %8, align 4
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @move_bags(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %63, %1
  %.01 = phi i32 [ 0, %1 ], [ %64, %63 ]
  %3 = icmp slt i32 %.01, 10
  br i1 %3, label %4, label %65

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.airport, ptr %0, i32 0, i32 0
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds [10 x %struct.belt], ptr %5, i64 0, i64 %6
  br label %8

8:                                                ; preds = %60, %4
  %.02 = phi i32 [ 0, %4 ], [ %61, %60 ]
  %9 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %.02, %10
  br i1 %11, label %12, label %62

12:                                               ; preds = %8
  %13 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %14 = sext i32 %.02 to i64
  %15 = getelementptr inbounds [1000 x %struct.bag], ptr %13, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.bag, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %26

19:                                               ; preds = %12
  %20 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %21 = sext i32 %.02 to i64
  %22 = getelementptr inbounds [1000 x %struct.bag], ptr %20, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.bag, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = add nsw i32 %24, -1
  store i32 %25, ptr %23, align 4
  br label %26

26:                                               ; preds = %19, %12
  %27 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %28 = sext i32 %.02 to i64
  %29 = getelementptr inbounds [1000 x %struct.bag], ptr %27, i64 0, i64 %28
  %30 = getelementptr inbounds %struct.bag, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %59

33:                                               ; preds = %26
  %34 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %35 = sext i32 %.02 to i64
  %36 = getelementptr inbounds [1000 x %struct.bag], ptr %34, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.bag, ptr %36, i32 0, i32 2
  %38 = load i32, ptr %37, align 4
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %.02, i32 noundef %38)
  br label %40

40:                                               ; preds = %53, %33
  %.0 = phi i32 [ %.02, %33 ], [ %54, %53 ]
  %41 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = sub nsw i32 %42, 1
  %44 = icmp slt i32 %.0, %43
  br i1 %44, label %45, label %55

45:                                               ; preds = %40
  %46 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %47 = sext i32 %.0 to i64
  %48 = getelementptr inbounds [1000 x %struct.bag], ptr %46, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %50 = add nsw i32 %.0, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [1000 x %struct.bag], ptr %49, i64 0, i64 %51
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %48, ptr align 4 %52, i64 12, i1 false)
  br label %53

53:                                               ; preds = %45
  %54 = add nsw i32 %.0, 1
  br label %40, !llvm.loop !8

55:                                               ; preds = %40
  %56 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 1
  %57 = load i32, ptr %56, align 4
  %58 = add nsw i32 %57, -1
  store i32 %58, ptr %56, align 4
  br label %59

59:                                               ; preds = %55, %26
  br label %60

60:                                               ; preds = %59
  %61 = add nsw i32 %.02, 1
  br label %8, !llvm.loop !9

62:                                               ; preds = %8
  br label %63

63:                                               ; preds = %62
  %64 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !10

65:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_airport(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %29, %1
  %.01 = phi i32 [ 0, %1 ], [ %30, %29 ]
  %3 = icmp slt i32 %.01, 10
  br i1 %3, label %4, label %31

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.airport, ptr %0, i32 0, i32 0
  %6 = sext i32 %.01 to i64
  %7 = getelementptr inbounds [10 x %struct.belt], ptr %5, i64 0, i64 %6
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %.01)
  br label %9

9:                                                ; preds = %25, %4
  %.0 = phi i32 [ 0, %4 ], [ %26, %25 ]
  %10 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %.0, %11
  br i1 %12, label %13, label %27

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [1000 x %struct.bag], ptr %14, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.bag, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 4
  %19 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 0
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds [1000 x %struct.bag], ptr %19, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.bag, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %18, i32 noundef %23)
  br label %25

25:                                               ; preds = %13
  %26 = add nsw i32 %.0, 1
  br label %9, !llvm.loop !11

27:                                               ; preds = %9
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %29

29:                                               ; preds = %27
  %30 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !12

31:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca %struct.airport, align 4
  %2 = alloca %struct.bag, align 4
  %3 = call i64 @time(ptr noundef null) #4
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #4
  call void @init_airport(ptr noundef %1)
  br label %5

5:                                                ; preds = %13, %0
  %.01 = phi i32 [ 0, %0 ], [ %14, %13 ]
  %6 = icmp slt i32 %.01, 1000
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  call void @create_bag(ptr noundef %2)
  %8 = getelementptr inbounds %struct.airport, ptr %1, i32 0, i32 0
  %9 = getelementptr inbounds %struct.bag, ptr %2, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10 x %struct.belt], ptr %8, i64 0, i64 %11
  call void @load_bag(ptr noundef %12, ptr noundef %2)
  br label %13

13:                                               ; preds = %7
  %14 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !13

15:                                               ; preds = %5
  br label %16

16:                                               ; preds = %19, %15
  %.0 = phi i32 [ 0, %15 ], [ %20, %19 ]
  %17 = icmp slt i32 %.0, 100
  br i1 %17, label %18, label %21

18:                                               ; preds = %16
  call void @move_bags(ptr noundef %1)
  call void @print_airport(ptr noundef %1)
  br label %19

19:                                               ; preds = %18
  %20 = add nsw i32 %.0, 1
  br label %16, !llvm.loop !14

21:                                               ; preds = %16
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
