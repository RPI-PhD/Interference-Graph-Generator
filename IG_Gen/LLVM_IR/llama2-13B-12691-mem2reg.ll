; ModuleID = 'LLVM_IR/llama2-13B-12691.ll'
source_filename = "DATASETv2/llama2-13B-12691.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.grid = type { ptr, i32, i32 }
%struct.cell = type { i32, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"O \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"_ \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_grid(ptr noundef %0) #0 {
  %2 = call noalias ptr @malloc(i64 noundef 8000) #4
  %3 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  store ptr %2, ptr %3, align 8
  br label %4

4:                                                ; preds = %47, %1
  %.01 = phi i32 [ 0, %1 ], [ %48, %47 ]
  %5 = icmp slt i32 %.01, 100
  br i1 %5, label %6, label %49

6:                                                ; preds = %4
  br label %7

7:                                                ; preds = %44, %6
  %.0 = phi i32 [ 0, %6 ], [ %45, %44 ]
  %8 = icmp slt i32 %.0, 10
  br i1 %8, label %9, label %46

9:                                                ; preds = %7
  %10 = call noalias ptr @malloc(i64 noundef 12) #4
  %11 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = mul nsw i32 %.01, 10
  %14 = add nsw i32 %13, %.0
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds ptr, ptr %12, i64 %15
  store ptr %10, ptr %16, align 8
  %17 = mul nsw i32 %.01, 10
  %18 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = mul nsw i32 %.01, 10
  %21 = add nsw i32 %20, %.0
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds ptr, ptr %19, i64 %22
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.cell, ptr %24, i32 0, i32 0
  store i32 %17, ptr %25, align 4
  %26 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = mul nsw i32 %.01, 10
  %29 = add nsw i32 %28, %.0
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds ptr, ptr %27, i64 %30
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.cell, ptr %32, i32 0, i32 1
  store i32 %.0, ptr %33, align 4
  %34 = call i32 @rand() #5
  %35 = srem i32 %34, 2
  %36 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = mul nsw i32 %.01, 10
  %39 = add nsw i32 %38, %.0
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds ptr, ptr %37, i64 %40
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds %struct.cell, ptr %42, i32 0, i32 2
  store i32 %35, ptr %43, align 4
  br label %44

44:                                               ; preds = %9
  %45 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !6

46:                                               ; preds = %7
  br label %47

47:                                               ; preds = %46
  %48 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !8

49:                                               ; preds = %4
  %50 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 1
  store i32 100, ptr %50, align 8
  %51 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  store i32 10, ptr %51, align 4
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_grid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %137, %1
  %.01 = phi i32 [ 0, %1 ], [ %138, %137 ]
  %3 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %139

6:                                                ; preds = %2
  br label %7

7:                                                ; preds = %134, %6
  %.0 = phi i32 [ 0, %6 ], [ %135, %134 ]
  %8 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %.0, %9
  br i1 %10, label %11, label %136

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = mul nsw i32 %.01, %15
  %17 = add nsw i32 %16, %.0
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %13, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %133

24:                                               ; preds = %11
  %25 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, 1
  %28 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 1
  %29 = load i32, ptr %28, align 8
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %52

31:                                               ; preds = %24
  %32 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %35 = load i32, ptr %34, align 4
  %36 = mul nsw i32 %.01, %35
  %37 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 0
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %36, %38
  %40 = add nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds ptr, ptr %33, i64 %41
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds %struct.cell, ptr %43, i32 0, i32 2
  %45 = load i32, ptr %44, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %52

47:                                               ; preds = %31
  %48 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  %49 = load i32, ptr %48, align 4
  %50 = sub nsw i32 1, %49
  %51 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  store i32 %50, ptr %51, align 4
  br label %52

52:                                               ; preds = %47, %31, %24
  %53 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 0
  %54 = load i32, ptr %53, align 4
  %55 = sub nsw i32 %54, 1
  %56 = icmp sge i32 %55, 0
  br i1 %56, label %57, label %78

57:                                               ; preds = %52
  %58 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %61 = load i32, ptr %60, align 4
  %62 = mul nsw i32 %.01, %61
  %63 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 0
  %64 = load i32, ptr %63, align 4
  %65 = add nsw i32 %62, %64
  %66 = sub nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds ptr, ptr %59, i64 %67
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds %struct.cell, ptr %69, i32 0, i32 2
  %71 = load i32, ptr %70, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %78

73:                                               ; preds = %57
  %74 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  %75 = load i32, ptr %74, align 4
  %76 = sub nsw i32 1, %75
  %77 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  store i32 %76, ptr %77, align 4
  br label %78

78:                                               ; preds = %73, %57, %52
  %79 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 1
  %80 = load i32, ptr %79, align 4
  %81 = add nsw i32 %80, 1
  %82 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %83 = load i32, ptr %82, align 4
  %84 = icmp slt i32 %81, %83
  br i1 %84, label %85, label %106

85:                                               ; preds = %78
  %86 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %89 = load i32, ptr %88, align 4
  %90 = mul nsw i32 %.01, %89
  %91 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 1
  %92 = load i32, ptr %91, align 4
  %93 = add nsw i32 %90, %92
  %94 = add nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds ptr, ptr %87, i64 %95
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds %struct.cell, ptr %97, i32 0, i32 2
  %99 = load i32, ptr %98, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %106

101:                                              ; preds = %85
  %102 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  %103 = load i32, ptr %102, align 4
  %104 = sub nsw i32 1, %103
  %105 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  store i32 %104, ptr %105, align 4
  br label %106

106:                                              ; preds = %101, %85, %78
  %107 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 1
  %108 = load i32, ptr %107, align 4
  %109 = sub nsw i32 %108, 1
  %110 = icmp sge i32 %109, 0
  br i1 %110, label %111, label %132

111:                                              ; preds = %106
  %112 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %113 = load ptr, ptr %112, align 8
  %114 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %115 = load i32, ptr %114, align 4
  %116 = mul nsw i32 %.01, %115
  %117 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 1
  %118 = load i32, ptr %117, align 4
  %119 = add nsw i32 %116, %118
  %120 = sub nsw i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds ptr, ptr %113, i64 %121
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds %struct.cell, ptr %123, i32 0, i32 2
  %125 = load i32, ptr %124, align 4
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %132

127:                                              ; preds = %111
  %128 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  %129 = load i32, ptr %128, align 4
  %130 = sub nsw i32 1, %129
  %131 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  store i32 %130, ptr %131, align 4
  br label %132

132:                                              ; preds = %127, %111, %106
  br label %133

133:                                              ; preds = %132, %11
  br label %134

134:                                              ; preds = %133
  %135 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !9

136:                                              ; preds = %7
  br label %137

137:                                              ; preds = %136
  %138 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !10

139:                                              ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @draw_grid(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %33, %1
  %.01 = phi i32 [ 0, %1 ], [ %34, %33 ]
  %3 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 1
  %4 = load i32, ptr %3, align 8
  %5 = icmp slt i32 %.01, %4
  br i1 %5, label %6, label %35

6:                                                ; preds = %2
  br label %7

7:                                                ; preds = %29, %6
  %.0 = phi i32 [ 0, %6 ], [ %30, %29 ]
  %8 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %.0, %9
  br i1 %10, label %11, label %31

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.grid, ptr %0, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = mul nsw i32 %.01, %15
  %17 = add nsw i32 %16, %.0
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %13, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %struct.cell, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %26

24:                                               ; preds = %11
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %28

26:                                               ; preds = %11
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %28

28:                                               ; preds = %26, %24
  br label %29

29:                                               ; preds = %28
  %30 = add nsw i32 %.0, 1
  br label %7, !llvm.loop !11

31:                                               ; preds = %7
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %33

33:                                               ; preds = %31
  %34 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !12

35:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(ptr noundef null) #5
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #5
  %3 = call noalias ptr @malloc(i64 noundef 16) #4
  call void @init_grid(ptr noundef %3)
  br label %4

4:                                                ; preds = %8, %0
  %.0 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %5 = icmp slt i32 %.0, 100
  br i1 %5, label %6, label %10

6:                                                ; preds = %4
  call void @update_grid(ptr noundef %3)
  call void @draw_grid(ptr noundef %3)
  %7 = call i32 @usleep(i32 noundef 100000)
  br label %8

8:                                                ; preds = %6
  %9 = add nsw i32 %.0, 1
  br label %4, !llvm.loop !13

10:                                               ; preds = %4
  %11 = getelementptr inbounds %struct.grid, ptr %3, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %12) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @usleep(i32 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
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
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
