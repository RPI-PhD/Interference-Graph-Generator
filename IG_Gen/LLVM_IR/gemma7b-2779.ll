; ModuleID = 'DATASETv2/gemma7b-2779.c'
source_filename = "DATASETv2/gemma7b-2779.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Passenger = type { [50 x i8], i32, ptr }
%struct.Bag = type { [20 x i8], i32, ptr }

@.str = private unnamed_addr constant [35 x i8] c"Passenger: %s, Number of bags: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Bag tag: %s, Weight: %d\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @simulate_airport() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr null, ptr %1, align 8
  store ptr null, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %23, %0
  %11 = load i32, ptr %3, align 4
  %12 = icmp slt i32 %11, 10
  br i1 %12, label %13, label %26

13:                                               ; preds = %10
  %14 = call noalias ptr @malloc(i64 noundef 64) #4
  store ptr %14, ptr %4, align 8
  %15 = call i32 @rand() #5
  %16 = srem i32 %15, 20
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.Passenger, ptr %17, i32 0, i32 1
  store i32 %16, ptr %18, align 4
  %19 = load ptr, ptr %1, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.Passenger, ptr %20, i32 0, i32 2
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %4, align 8
  store ptr %22, ptr %1, align 8
  br label %23

23:                                               ; preds = %13
  %24 = load i32, ptr %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %3, align 4
  br label %10, !llvm.loop !6

26:                                               ; preds = %10
  %27 = load ptr, ptr %1, align 8
  store ptr %27, ptr %5, align 8
  br label %28

28:                                               ; preds = %52, %26
  %29 = load ptr, ptr %5, align 8
  %30 = icmp ne ptr %29, null
  br i1 %30, label %31, label %56

31:                                               ; preds = %28
  store i32 0, ptr %6, align 4
  br label %32

32:                                               ; preds = %48, %31
  %33 = load i32, ptr %6, align 4
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.Passenger, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %51

38:                                               ; preds = %32
  %39 = call noalias ptr @malloc(i64 noundef 32) #4
  store ptr %39, ptr %7, align 8
  %40 = call i32 @rand() #5
  %41 = srem i32 %40, 50
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds %struct.Bag, ptr %42, i32 0, i32 1
  store i32 %41, ptr %43, align 4
  %44 = load ptr, ptr %2, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.Bag, ptr %45, i32 0, i32 2
  store ptr %44, ptr %46, align 8
  %47 = load ptr, ptr %7, align 8
  store ptr %47, ptr %2, align 8
  br label %48

48:                                               ; preds = %38
  %49 = load i32, ptr %6, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %6, align 4
  br label %32, !llvm.loop !8

51:                                               ; preds = %32
  br label %52

52:                                               ; preds = %51
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.Passenger, ptr %53, i32 0, i32 2
  %55 = load ptr, ptr %54, align 8
  store ptr %55, ptr %5, align 8
  br label %28, !llvm.loop !9

56:                                               ; preds = %28
  %57 = load ptr, ptr %1, align 8
  store ptr %57, ptr %8, align 8
  br label %58

58:                                               ; preds = %69, %56
  %59 = load ptr, ptr %8, align 8
  %60 = icmp ne ptr %59, null
  br i1 %60, label %61, label %73

61:                                               ; preds = %58
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds %struct.Passenger, ptr %62, i32 0, i32 0
  %64 = getelementptr inbounds [50 x i8], ptr %63, i64 0, i64 0
  %65 = load ptr, ptr %8, align 8
  %66 = getelementptr inbounds %struct.Passenger, ptr %65, i32 0, i32 1
  %67 = load i32, ptr %66, align 4
  %68 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %64, i32 noundef %67)
  br label %69

69:                                               ; preds = %61
  %70 = load ptr, ptr %8, align 8
  %71 = getelementptr inbounds %struct.Passenger, ptr %70, i32 0, i32 2
  %72 = load ptr, ptr %71, align 8
  store ptr %72, ptr %8, align 8
  br label %58, !llvm.loop !10

73:                                               ; preds = %58
  %74 = load ptr, ptr %2, align 8
  store ptr %74, ptr %9, align 8
  br label %75

75:                                               ; preds = %86, %73
  %76 = load ptr, ptr %9, align 8
  %77 = icmp ne ptr %76, null
  br i1 %77, label %78, label %90

78:                                               ; preds = %75
  %79 = load ptr, ptr %9, align 8
  %80 = getelementptr inbounds %struct.Bag, ptr %79, i32 0, i32 0
  %81 = getelementptr inbounds [20 x i8], ptr %80, i64 0, i64 0
  %82 = load ptr, ptr %9, align 8
  %83 = getelementptr inbounds %struct.Bag, ptr %82, i32 0, i32 1
  %84 = load i32, ptr %83, align 4
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %81, i32 noundef %84)
  br label %86

86:                                               ; preds = %78
  %87 = load ptr, ptr %9, align 8
  %88 = getelementptr inbounds %struct.Bag, ptr %87, i32 0, i32 2
  %89 = load ptr, ptr %88, align 8
  store ptr %89, ptr %9, align 8
  br label %75, !llvm.loop !11

90:                                               ; preds = %75
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @simulate_airport()
  ret i32 0
}

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
