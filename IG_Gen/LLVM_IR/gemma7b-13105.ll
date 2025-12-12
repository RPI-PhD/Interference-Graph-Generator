; ModuleID = 'DATASETv2/gemma7b-13105.c'
source_filename = "DATASETv2/gemma7b-13105.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { [16 x i8], ptr }

@.str = private unnamed_addr constant [20 x i8] c"Encrypting key: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @encrypt(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %28, %1
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %32

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds [16 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %10)
  store i32 0, ptr %3, align 4
  br label %12

12:                                               ; preds = %25, %7
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %13, 16
  br i1 %14, label %15, label %28

15:                                               ; preds = %12
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.Node, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [16 x i8], ptr %17, i64 0, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = xor i32 %22, 31
  %24 = trunc i32 %23 to i8
  store i8 %24, ptr %20, align 1
  br label %25

25:                                               ; preds = %15
  %26 = load i32, ptr %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %3, align 4
  br label %12, !llvm.loop !6

28:                                               ; preds = %12
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %2, align 8
  br label %4, !llvm.loop !8

32:                                               ; preds = %4
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  %3 = call noalias ptr @malloc(i64 noundef 24) #3
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Node, ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [16 x i8], ptr %5, i64 0, i64 0
  store i8 97, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.Node, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds [16 x i8], ptr %8, i64 0, i64 1
  store i8 98, ptr %9, align 1
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.Node, ptr %10, i32 0, i32 0
  %12 = getelementptr inbounds [16 x i8], ptr %11, i64 0, i64 2
  store i8 99, ptr %12, align 2
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.Node, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [16 x i8], ptr %14, i64 0, i64 3
  store i8 100, ptr %15, align 1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.Node, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds [16 x i8], ptr %17, i64 0, i64 4
  store i8 101, ptr %18, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.Node, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds [16 x i8], ptr %20, i64 0, i64 5
  store i8 102, ptr %21, align 1
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.Node, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds [16 x i8], ptr %23, i64 0, i64 6
  store i8 103, ptr %24, align 2
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds %struct.Node, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds [16 x i8], ptr %26, i64 0, i64 7
  store i8 104, ptr %27, align 1
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.Node, ptr %28, i32 0, i32 0
  %30 = getelementptr inbounds [16 x i8], ptr %29, i64 0, i64 8
  store i8 105, ptr %30, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds %struct.Node, ptr %31, i32 0, i32 0
  %33 = getelementptr inbounds [16 x i8], ptr %32, i64 0, i64 9
  store i8 106, ptr %33, align 1
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.Node, ptr %34, i32 0, i32 0
  %36 = getelementptr inbounds [16 x i8], ptr %35, i64 0, i64 10
  store i8 107, ptr %36, align 2
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds %struct.Node, ptr %37, i32 0, i32 0
  %39 = getelementptr inbounds [16 x i8], ptr %38, i64 0, i64 11
  store i8 108, ptr %39, align 1
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.Node, ptr %40, i32 0, i32 0
  %42 = getelementptr inbounds [16 x i8], ptr %41, i64 0, i64 12
  store i8 109, ptr %42, align 4
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.Node, ptr %43, i32 0, i32 0
  %45 = getelementptr inbounds [16 x i8], ptr %44, i64 0, i64 13
  store i8 110, ptr %45, align 1
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds %struct.Node, ptr %46, i32 0, i32 0
  %48 = getelementptr inbounds [16 x i8], ptr %47, i64 0, i64 14
  store i8 111, ptr %48, align 2
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds %struct.Node, ptr %49, i32 0, i32 0
  %51 = getelementptr inbounds [16 x i8], ptr %50, i64 0, i64 15
  store i8 112, ptr %51, align 1
  %52 = call noalias ptr @malloc(i64 noundef 24) #3
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.Node, ptr %53, i32 0, i32 1
  store ptr %52, ptr %54, align 8
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds %struct.Node, ptr %55, i32 0, i32 1
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.Node, ptr %57, i32 0, i32 0
  %59 = getelementptr inbounds [16 x i8], ptr %58, i64 0, i64 0
  store i8 113, ptr %59, align 8
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds %struct.Node, ptr %60, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds %struct.Node, ptr %62, i32 0, i32 0
  %64 = getelementptr inbounds [16 x i8], ptr %63, i64 0, i64 1
  store i8 114, ptr %64, align 1
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.Node, ptr %65, i32 0, i32 1
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds %struct.Node, ptr %67, i32 0, i32 0
  %69 = getelementptr inbounds [16 x i8], ptr %68, i64 0, i64 2
  store i8 115, ptr %69, align 2
  %70 = load ptr, ptr %2, align 8
  %71 = getelementptr inbounds %struct.Node, ptr %70, i32 0, i32 1
  %72 = load ptr, ptr %71, align 8
  %73 = getelementptr inbounds %struct.Node, ptr %72, i32 0, i32 0
  %74 = getelementptr inbounds [16 x i8], ptr %73, i64 0, i64 3
  store i8 116, ptr %74, align 1
  %75 = load ptr, ptr %2, align 8
  %76 = getelementptr inbounds %struct.Node, ptr %75, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %struct.Node, ptr %77, i32 0, i32 0
  %79 = getelementptr inbounds [16 x i8], ptr %78, i64 0, i64 4
  store i8 117, ptr %79, align 4
  %80 = load ptr, ptr %2, align 8
  %81 = getelementptr inbounds %struct.Node, ptr %80, i32 0, i32 1
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds %struct.Node, ptr %82, i32 0, i32 0
  %84 = getelementptr inbounds [16 x i8], ptr %83, i64 0, i64 5
  store i8 118, ptr %84, align 1
  %85 = load ptr, ptr %2, align 8
  %86 = getelementptr inbounds %struct.Node, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds %struct.Node, ptr %87, i32 0, i32 0
  %89 = getelementptr inbounds [16 x i8], ptr %88, i64 0, i64 6
  store i8 119, ptr %89, align 2
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.Node, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = getelementptr inbounds %struct.Node, ptr %92, i32 0, i32 0
  %94 = getelementptr inbounds [16 x i8], ptr %93, i64 0, i64 7
  store i8 120, ptr %94, align 1
  %95 = load ptr, ptr %2, align 8
  %96 = getelementptr inbounds %struct.Node, ptr %95, i32 0, i32 1
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds %struct.Node, ptr %97, i32 0, i32 0
  %99 = getelementptr inbounds [16 x i8], ptr %98, i64 0, i64 8
  store i8 121, ptr %99, align 8
  %100 = load ptr, ptr %2, align 8
  %101 = getelementptr inbounds %struct.Node, ptr %100, i32 0, i32 1
  %102 = load ptr, ptr %101, align 8
  %103 = getelementptr inbounds %struct.Node, ptr %102, i32 0, i32 0
  %104 = getelementptr inbounds [16 x i8], ptr %103, i64 0, i64 9
  store i8 122, ptr %104, align 1
  %105 = load ptr, ptr %2, align 8
  %106 = getelementptr inbounds %struct.Node, ptr %105, i32 0, i32 1
  %107 = load ptr, ptr %106, align 8
  %108 = getelementptr inbounds %struct.Node, ptr %107, i32 0, i32 0
  %109 = getelementptr inbounds [16 x i8], ptr %108, i64 0, i64 10
  store i8 65, ptr %109, align 2
  %110 = load ptr, ptr %2, align 8
  %111 = getelementptr inbounds %struct.Node, ptr %110, i32 0, i32 1
  %112 = load ptr, ptr %111, align 8
  %113 = getelementptr inbounds %struct.Node, ptr %112, i32 0, i32 0
  %114 = getelementptr inbounds [16 x i8], ptr %113, i64 0, i64 11
  store i8 66, ptr %114, align 1
  %115 = load ptr, ptr %2, align 8
  %116 = getelementptr inbounds %struct.Node, ptr %115, i32 0, i32 1
  %117 = load ptr, ptr %116, align 8
  %118 = getelementptr inbounds %struct.Node, ptr %117, i32 0, i32 0
  %119 = getelementptr inbounds [16 x i8], ptr %118, i64 0, i64 12
  store i8 67, ptr %119, align 4
  %120 = load ptr, ptr %2, align 8
  %121 = getelementptr inbounds %struct.Node, ptr %120, i32 0, i32 1
  %122 = load ptr, ptr %121, align 8
  %123 = getelementptr inbounds %struct.Node, ptr %122, i32 0, i32 0
  %124 = getelementptr inbounds [16 x i8], ptr %123, i64 0, i64 13
  store i8 68, ptr %124, align 1
  %125 = load ptr, ptr %2, align 8
  %126 = getelementptr inbounds %struct.Node, ptr %125, i32 0, i32 1
  %127 = load ptr, ptr %126, align 8
  %128 = getelementptr inbounds %struct.Node, ptr %127, i32 0, i32 0
  %129 = getelementptr inbounds [16 x i8], ptr %128, i64 0, i64 14
  store i8 69, ptr %129, align 2
  %130 = load ptr, ptr %2, align 8
  %131 = getelementptr inbounds %struct.Node, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = getelementptr inbounds %struct.Node, ptr %132, i32 0, i32 0
  %134 = getelementptr inbounds [16 x i8], ptr %133, i64 0, i64 15
  store i8 70, ptr %134, align 1
  %135 = load ptr, ptr %2, align 8
  %136 = getelementptr inbounds %struct.Node, ptr %135, i32 0, i32 1
  %137 = load ptr, ptr %136, align 8
  %138 = getelementptr inbounds %struct.Node, ptr %137, i32 0, i32 1
  store ptr null, ptr %138, align 8
  %139 = load ptr, ptr %2, align 8
  call void @encrypt(ptr noundef %139)
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
