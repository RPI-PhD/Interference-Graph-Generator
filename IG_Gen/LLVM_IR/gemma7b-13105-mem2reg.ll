; ModuleID = 'LLVM_IR/gemma7b-13105.ll'
source_filename = "DATASETv2/gemma7b-13105.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { [16 x i8], ptr }

@.str = private unnamed_addr constant [20 x i8] c"Encrypting key: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @encrypt(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %20, %1
  %.0 = phi ptr [ %0, %1 ], [ %22, %20 ]
  %3 = icmp ne ptr %.0, null
  br i1 %3, label %4, label %23

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 0
  %6 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %6)
  br label %8

8:                                                ; preds = %18, %4
  %.01 = phi i32 [ 0, %4 ], [ %19, %18 ]
  %9 = icmp slt i32 %.01, 16
  br i1 %9, label %10, label %20

10:                                               ; preds = %8
  %11 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 0
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = sext i8 %14 to i32
  %16 = xor i32 %15, 31
  %17 = trunc i32 %16 to i8
  store i8 %17, ptr %13, align 1
  br label %18

18:                                               ; preds = %10
  %19 = add nsw i32 %.01, 1
  br label %8, !llvm.loop !6

20:                                               ; preds = %8
  %21 = getelementptr inbounds %struct.Node, ptr %.0, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  br label %2, !llvm.loop !8

23:                                               ; preds = %2
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call noalias ptr @malloc(i64 noundef 24) #3
  %2 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %3 = getelementptr inbounds [16 x i8], ptr %2, i64 0, i64 0
  store i8 97, ptr %3, align 8
  %4 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %5 = getelementptr inbounds [16 x i8], ptr %4, i64 0, i64 1
  store i8 98, ptr %5, align 1
  %6 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %7 = getelementptr inbounds [16 x i8], ptr %6, i64 0, i64 2
  store i8 99, ptr %7, align 2
  %8 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %9 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 3
  store i8 100, ptr %9, align 1
  %10 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %11 = getelementptr inbounds [16 x i8], ptr %10, i64 0, i64 4
  store i8 101, ptr %11, align 4
  %12 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %13 = getelementptr inbounds [16 x i8], ptr %12, i64 0, i64 5
  store i8 102, ptr %13, align 1
  %14 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %15 = getelementptr inbounds [16 x i8], ptr %14, i64 0, i64 6
  store i8 103, ptr %15, align 2
  %16 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %17 = getelementptr inbounds [16 x i8], ptr %16, i64 0, i64 7
  store i8 104, ptr %17, align 1
  %18 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %19 = getelementptr inbounds [16 x i8], ptr %18, i64 0, i64 8
  store i8 105, ptr %19, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %21 = getelementptr inbounds [16 x i8], ptr %20, i64 0, i64 9
  store i8 106, ptr %21, align 1
  %22 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %23 = getelementptr inbounds [16 x i8], ptr %22, i64 0, i64 10
  store i8 107, ptr %23, align 2
  %24 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %25 = getelementptr inbounds [16 x i8], ptr %24, i64 0, i64 11
  store i8 108, ptr %25, align 1
  %26 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %27 = getelementptr inbounds [16 x i8], ptr %26, i64 0, i64 12
  store i8 109, ptr %27, align 4
  %28 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %29 = getelementptr inbounds [16 x i8], ptr %28, i64 0, i64 13
  store i8 110, ptr %29, align 1
  %30 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %31 = getelementptr inbounds [16 x i8], ptr %30, i64 0, i64 14
  store i8 111, ptr %31, align 2
  %32 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  %33 = getelementptr inbounds [16 x i8], ptr %32, i64 0, i64 15
  store i8 112, ptr %33, align 1
  %34 = call noalias ptr @malloc(i64 noundef 24) #3
  %35 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  store ptr %34, ptr %35, align 8
  %36 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.Node, ptr %37, i32 0, i32 0
  %39 = getelementptr inbounds [16 x i8], ptr %38, i64 0, i64 0
  store i8 113, ptr %39, align 8
  %40 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds %struct.Node, ptr %41, i32 0, i32 0
  %43 = getelementptr inbounds [16 x i8], ptr %42, i64 0, i64 1
  store i8 114, ptr %43, align 1
  %44 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.Node, ptr %45, i32 0, i32 0
  %47 = getelementptr inbounds [16 x i8], ptr %46, i64 0, i64 2
  store i8 115, ptr %47, align 2
  %48 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.Node, ptr %49, i32 0, i32 0
  %51 = getelementptr inbounds [16 x i8], ptr %50, i64 0, i64 3
  store i8 116, ptr %51, align 1
  %52 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds %struct.Node, ptr %53, i32 0, i32 0
  %55 = getelementptr inbounds [16 x i8], ptr %54, i64 0, i64 4
  store i8 117, ptr %55, align 4
  %56 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.Node, ptr %57, i32 0, i32 0
  %59 = getelementptr inbounds [16 x i8], ptr %58, i64 0, i64 5
  store i8 118, ptr %59, align 1
  %60 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = getelementptr inbounds %struct.Node, ptr %61, i32 0, i32 0
  %63 = getelementptr inbounds [16 x i8], ptr %62, i64 0, i64 6
  store i8 119, ptr %63, align 2
  %64 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds %struct.Node, ptr %65, i32 0, i32 0
  %67 = getelementptr inbounds [16 x i8], ptr %66, i64 0, i64 7
  store i8 120, ptr %67, align 1
  %68 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = getelementptr inbounds %struct.Node, ptr %69, i32 0, i32 0
  %71 = getelementptr inbounds [16 x i8], ptr %70, i64 0, i64 8
  store i8 121, ptr %71, align 8
  %72 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds %struct.Node, ptr %73, i32 0, i32 0
  %75 = getelementptr inbounds [16 x i8], ptr %74, i64 0, i64 9
  store i8 122, ptr %75, align 1
  %76 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %struct.Node, ptr %77, i32 0, i32 0
  %79 = getelementptr inbounds [16 x i8], ptr %78, i64 0, i64 10
  store i8 65, ptr %79, align 2
  %80 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr inbounds %struct.Node, ptr %81, i32 0, i32 0
  %83 = getelementptr inbounds [16 x i8], ptr %82, i64 0, i64 11
  store i8 66, ptr %83, align 1
  %84 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds %struct.Node, ptr %85, i32 0, i32 0
  %87 = getelementptr inbounds [16 x i8], ptr %86, i64 0, i64 12
  store i8 67, ptr %87, align 4
  %88 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds %struct.Node, ptr %89, i32 0, i32 0
  %91 = getelementptr inbounds [16 x i8], ptr %90, i64 0, i64 13
  store i8 68, ptr %91, align 1
  %92 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %93 = load ptr, ptr %92, align 8
  %94 = getelementptr inbounds %struct.Node, ptr %93, i32 0, i32 0
  %95 = getelementptr inbounds [16 x i8], ptr %94, i64 0, i64 14
  store i8 69, ptr %95, align 2
  %96 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds %struct.Node, ptr %97, i32 0, i32 0
  %99 = getelementptr inbounds [16 x i8], ptr %98, i64 0, i64 15
  store i8 70, ptr %99, align 1
  %100 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 1
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr inbounds %struct.Node, ptr %101, i32 0, i32 1
  store ptr null, ptr %102, align 8
  call void @encrypt(ptr noundef %1)
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
