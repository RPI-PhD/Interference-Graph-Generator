; ModuleID = 'DATASETv2/gpt35-55127.c'
source_filename = "DATASETv2/gpt35-55127.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Graph = type { i32, ptr }

@.str = private unnamed_addr constant [30 x i8] c"Colors assigned to vertices:\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Vertex %d: Color %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"Could not color the graph with maximum %d colors\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_colors(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr %13, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %12, i32 noundef %17)
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %7, !llvm.loop !6

22:                                               ; preds = %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @check_color(i32 noundef %0, i32 noundef %1, i32 %2, ptr %3, ptr noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.Graph, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 0
  store i32 %2, ptr %12, align 8
  %13 = getelementptr inbounds { i32, ptr }, ptr %7, i32 0, i32 1
  store ptr %3, ptr %13, align 8
  store i32 %0, ptr %8, align 4
  store i32 %1, ptr %9, align 4
  store ptr %4, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %14

14:                                               ; preds = %41, %5
  %15 = load i32, ptr %11, align 4
  %16 = getelementptr inbounds %struct.Graph, ptr %7, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %19, label %44

19:                                               ; preds = %14
  %20 = getelementptr inbounds %struct.Graph, ptr %7, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %40

31:                                               ; preds = %19
  %32 = load i32, ptr %9, align 4
  %33 = load ptr, ptr %10, align 8
  %34 = load i32, ptr %11, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr %33, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = icmp eq i32 %32, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %31
  store i32 0, ptr %6, align 4
  br label %45

40:                                               ; preds = %31, %19
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %11, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %11, align 4
  br label %14, !llvm.loop !8

44:                                               ; preds = %14
  store i32 1, ptr %6, align 4
  br label %45

45:                                               ; preds = %44, %39
  %46 = load i32, ptr %6, align 4
  ret i32 %46
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @graph_coloring_util(i32 noundef %0, i32 noundef %1, i32 %2, ptr %3, ptr noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca %struct.Graph, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = getelementptr inbounds { i32, ptr }, ptr %8, i32 0, i32 0
  store i32 %2, ptr %14, align 8
  %15 = getelementptr inbounds { i32, ptr }, ptr %8, i32 0, i32 1
  store ptr %3, ptr %15, align 8
  store i32 %0, ptr %9, align 4
  store i32 %1, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  store i32 %5, ptr %12, align 4
  %16 = load i32, ptr %9, align 4
  %17 = load i32, ptr %10, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %6
  store i32 1, ptr %7, align 4
  br label %63

20:                                               ; preds = %6
  store i32 1, ptr %13, align 4
  br label %21

21:                                               ; preds = %59, %20
  %22 = load i32, ptr %13, align 4
  %23 = load i32, ptr %12, align 4
  %24 = icmp sle i32 %22, %23
  br i1 %24, label %25, label %62

25:                                               ; preds = %21
  %26 = load i32, ptr %9, align 4
  %27 = load i32, ptr %13, align 4
  %28 = load ptr, ptr %11, align 8
  %29 = getelementptr inbounds { i32, ptr }, ptr %8, i32 0, i32 0
  %30 = load i32, ptr %29, align 8
  %31 = getelementptr inbounds { i32, ptr }, ptr %8, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = call i32 @check_color(i32 noundef %26, i32 noundef %27, i32 %30, ptr %32, ptr noundef %28)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %58

35:                                               ; preds = %25
  %36 = load i32, ptr %13, align 4
  %37 = load ptr, ptr %11, align 8
  %38 = load i32, ptr %9, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, ptr %37, i64 %39
  store i32 %36, ptr %40, align 4
  %41 = load i32, ptr %9, align 4
  %42 = add nsw i32 %41, 1
  %43 = load i32, ptr %10, align 4
  %44 = load ptr, ptr %11, align 8
  %45 = load i32, ptr %12, align 4
  %46 = getelementptr inbounds { i32, ptr }, ptr %8, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = getelementptr inbounds { i32, ptr }, ptr %8, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = call i32 @graph_coloring_util(i32 noundef %42, i32 noundef %43, i32 %47, ptr %49, ptr noundef %44, i32 noundef %45)
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %35
  store i32 1, ptr %7, align 4
  br label %63

53:                                               ; preds = %35
  %54 = load ptr, ptr %11, align 8
  %55 = load i32, ptr %9, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  store i32 0, ptr %57, align 4
  br label %58

58:                                               ; preds = %53, %25
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %13, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %13, align 4
  br label %21, !llvm.loop !9

62:                                               ; preds = %21
  store i32 0, ptr %7, align 4
  br label %63

63:                                               ; preds = %62, %52, %19
  %64 = load i32, ptr %7, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @graph_coloring(i32 noundef %0, i32 %1, ptr %2) #0 {
  %4 = alloca %struct.Graph, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 0
  store i32 %1, ptr %8, align 8
  %9 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 1
  store ptr %2, ptr %9, align 8
  store i32 %0, ptr %5, align 4
  %10 = load i32, ptr %5, align 4
  store i32 %10, ptr %6, align 4
  %11 = load i32, ptr %5, align 4
  %12 = sext i32 %11 to i64
  %13 = call noalias ptr @calloc(i64 noundef %12, i64 noundef 4) #4
  store ptr %13, ptr %7, align 8
  %14 = load i32, ptr %5, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = load i32, ptr %6, align 4
  %17 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = getelementptr inbounds { i32, ptr }, ptr %4, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = call i32 @graph_coloring_util(i32 noundef 0, i32 noundef %14, i32 %18, ptr %20, ptr noundef %15, i32 noundef %16)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %3
  %24 = load ptr, ptr %7, align 8
  %25 = load i32, ptr %5, align 4
  call void @print_colors(ptr noundef %24, i32 noundef %25)
  br label %29

26:                                               ; preds = %3
  %27 = load i32, ptr %6, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %27)
  br label %29

29:                                               ; preds = %26, %23
  ret void
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Graph, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 5, ptr %3, align 4
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %3, align 4
  %9 = sub nsw i32 %8, 1
  %10 = mul nsw i32 %7, %9
  %11 = sdiv i32 %10, 2
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 0
  store i32 %12, ptr %13, align 8
  %14 = load i32, ptr %3, align 4
  %15 = sext i32 %14 to i64
  %16 = call noalias ptr @calloc(i64 noundef %15, i64 noundef 8) #4
  %17 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  store ptr %16, ptr %17, align 8
  store i32 0, ptr %5, align 4
  br label %18

18:                                               ; preds = %31, %0
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %3, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %34

22:                                               ; preds = %18
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = call noalias ptr @calloc(i64 noundef %24, i64 noundef 4) #4
  %26 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29
  store ptr %25, ptr %30, align 8
  br label %31

31:                                               ; preds = %22
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %5, align 4
  br label %18, !llvm.loop !10

34:                                               ; preds = %18
  %35 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i64 0
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds i32, ptr %38, i64 1
  store i32 1, ptr %39, align 4
  %40 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 0
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds i32, ptr %43, i64 2
  store i32 1, ptr %44, align 4
  %45 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = getelementptr inbounds ptr, ptr %46, i64 1
  %48 = load ptr, ptr %47, align 8
  %49 = getelementptr inbounds i32, ptr %48, i64 3
  store i32 1, ptr %49, align 4
  %50 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds ptr, ptr %51, i64 2
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds i32, ptr %53, i64 3
  store i32 1, ptr %54, align 4
  %55 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  %57 = getelementptr inbounds ptr, ptr %56, i64 3
  %58 = load ptr, ptr %57, align 8
  %59 = getelementptr inbounds i32, ptr %58, i64 4
  store i32 1, ptr %59, align 4
  %60 = load i32, ptr %3, align 4
  %61 = getelementptr inbounds { i32, ptr }, ptr %2, i32 0, i32 0
  %62 = load i32, ptr %61, align 8
  %63 = getelementptr inbounds { i32, ptr }, ptr %2, i32 0, i32 1
  %64 = load ptr, ptr %63, align 8
  call void @graph_coloring(i32 noundef %60, i32 %62, ptr %64)
  store i32 0, ptr %6, align 4
  br label %65

65:                                               ; preds = %76, %34
  %66 = load i32, ptr %6, align 4
  %67 = load i32, ptr %3, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %79

69:                                               ; preds = %65
  %70 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %71 = load ptr, ptr %70, align 8
  %72 = load i32, ptr %6, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds ptr, ptr %71, i64 %73
  %75 = load ptr, ptr %74, align 8
  call void @free(ptr noundef %75) #5
  br label %76

76:                                               ; preds = %69
  %77 = load i32, ptr %6, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %6, align 4
  br label %65, !llvm.loop !11

79:                                               ; preds = %65
  %80 = getelementptr inbounds %struct.Graph, ptr %2, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  call void @free(ptr noundef %81) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0,1) }
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
