; ModuleID = 'DATASETv2/gemma7b-45982.c'
source_filename = "DATASETv2/gemma7b-45982.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.baggage = type { [20 x i8], i32, ptr }

@.str = private unnamed_addr constant [21 x i8] c"Enter baggage name: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"Enter baggage weight: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"%s (%d) \00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"\0ATotal weight: %d\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %31, %0
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %34

10:                                               ; preds = %7
  %11 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %11, ptr %4, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.baggage, ptr %13, i32 0, i32 0
  %15 = getelementptr inbounds [20 x i8], ptr %14, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %15)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.baggage, ptr %18, i32 0, i32 1
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %19)
  %21 = load ptr, ptr %2, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %25

23:                                               ; preds = %10
  %24 = load ptr, ptr %4, align 8
  store ptr %24, ptr %2, align 8
  br label %30

25:                                               ; preds = %10
  %26 = load ptr, ptr %2, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.baggage, ptr %27, i32 0, i32 2
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %4, align 8
  store ptr %29, ptr %2, align 8
  br label %30

30:                                               ; preds = %25, %23
  br label %31

31:                                               ; preds = %30
  %32 = load i32, ptr %3, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %7, !llvm.loop !6

34:                                               ; preds = %7
  %35 = load ptr, ptr %2, align 8
  store ptr %35, ptr %5, align 8
  br label %36

36:                                               ; preds = %39, %34
  %37 = load ptr, ptr %5, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %50

39:                                               ; preds = %36
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds %struct.baggage, ptr %40, i32 0, i32 0
  %42 = getelementptr inbounds [20 x i8], ptr %41, i64 0, i64 0
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.baggage, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %42, i32 noundef %45)
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.baggage, ptr %47, i32 0, i32 2
  %49 = load ptr, ptr %48, align 8
  store ptr %49, ptr %5, align 8
  br label %36, !llvm.loop !8

50:                                               ; preds = %36
  store i32 0, ptr %6, align 4
  %51 = load ptr, ptr %2, align 8
  store ptr %51, ptr %5, align 8
  br label %52

52:                                               ; preds = %55, %50
  %53 = load ptr, ptr %5, align 8
  %54 = icmp ne ptr %53, null
  br i1 %54, label %55, label %64

55:                                               ; preds = %52
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds %struct.baggage, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr %6, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %6, align 4
  %61 = load ptr, ptr %5, align 8
  %62 = getelementptr inbounds %struct.baggage, ptr %61, i32 0, i32 2
  %63 = load ptr, ptr %62, align 8
  store ptr %63, ptr %5, align 8
  br label %52, !llvm.loop !9

64:                                               ; preds = %52
  %65 = load i32, ptr %6, align 4
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %65)
  %67 = load ptr, ptr %2, align 8
  store ptr %67, ptr %5, align 8
  br label %68

68:                                               ; preds = %71, %64
  %69 = load ptr, ptr %5, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %76

71:                                               ; preds = %68
  %72 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %72) #5
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.baggage, ptr %73, i32 0, i32 2
  %75 = load ptr, ptr %74, align 8
  store ptr %75, ptr %5, align 8
  br label %68, !llvm.loop !10

76:                                               ; preds = %68
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @printf(ptr noundef, ...) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
