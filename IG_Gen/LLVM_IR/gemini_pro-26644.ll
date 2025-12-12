; ModuleID = 'DATASETv2/gemini_pro-26644.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_airport(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %14, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 10
  br i1 %6, label %7, label %17

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.airport, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10 x %struct.belt], ptr %9, i64 0, i64 %11
  %13 = getelementptr inbounds %struct.belt, ptr %12, i32 0, i32 1
  store i32 0, ptr %13, align 4
  br label %14

14:                                               ; preds = %7
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %3, align 4
  br label %4, !llvm.loop !6

17:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @create_bag(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 @rand() #4
  %4 = srem i32 %3, 50
  %5 = add nsw i32 %4, 1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.bag, ptr %6, i32 0, i32 0
  store i32 %5, ptr %7, align 4
  %8 = call i32 @rand() #4
  %9 = srem i32 %8, 100
  %10 = add nsw i32 %9, 1
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.bag, ptr %11, i32 0, i32 1
  store i32 %10, ptr %12, align 4
  %13 = call i32 @rand() #4
  %14 = srem i32 %13, 10
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.bag, ptr %15, i32 0, i32 2
  store i32 %14, ptr %16, align 4
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @load_bag(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.belt, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.belt, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1000 x %struct.bag], ptr %6, i64 0, i64 %10
  %12 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %11, ptr align 4 %12, i64 12, i1 false)
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.belt, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 4
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @move_bags(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %92, %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %95

10:                                               ; preds = %7
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.airport, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %3, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x %struct.belt], ptr %12, i64 0, i64 %14
  store ptr %15, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %16

16:                                               ; preds = %88, %10
  %17 = load i32, ptr %5, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.belt, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %91

22:                                               ; preds = %16
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.belt, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [1000 x %struct.bag], ptr %24, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.bag, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %40

31:                                               ; preds = %22
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.belt, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1000 x %struct.bag], ptr %33, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.bag, ptr %36, i32 0, i32 1
  %38 = load i32, ptr %37, align 4
  %39 = add nsw i32 %38, -1
  store i32 %39, ptr %37, align 4
  br label %40

40:                                               ; preds = %31, %22
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.belt, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1000 x %struct.bag], ptr %42, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.bag, ptr %45, i32 0, i32 1
  %47 = load i32, ptr %46, align 4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %87

49:                                               ; preds = %40
  %50 = load i32, ptr %5, align 4
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds %struct.belt, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %5, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [1000 x %struct.bag], ptr %52, i64 0, i64 %54
  %56 = getelementptr inbounds %struct.bag, ptr %55, i32 0, i32 2
  %57 = load i32, ptr %56, align 4
  %58 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %50, i32 noundef %57)
  %59 = load i32, ptr %5, align 4
  store i32 %59, ptr %6, align 4
  br label %60

60:                                               ; preds = %79, %49
  %61 = load i32, ptr %6, align 4
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds %struct.belt, ptr %62, i32 0, i32 1
  %64 = load i32, ptr %63, align 4
  %65 = sub nsw i32 %64, 1
  %66 = icmp slt i32 %61, %65
  br i1 %66, label %67, label %82

67:                                               ; preds = %60
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds %struct.belt, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %6, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [1000 x %struct.bag], ptr %69, i64 0, i64 %71
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.belt, ptr %73, i32 0, i32 0
  %75 = load i32, ptr %6, align 4
  %76 = add nsw i32 %75, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [1000 x %struct.bag], ptr %74, i64 0, i64 %77
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %72, ptr align 4 %78, i64 12, i1 false)
  br label %79

79:                                               ; preds = %67
  %80 = load i32, ptr %6, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %6, align 4
  br label %60, !llvm.loop !8

82:                                               ; preds = %60
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.belt, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 4
  %86 = add nsw i32 %85, -1
  store i32 %86, ptr %84, align 4
  br label %87

87:                                               ; preds = %82, %40
  br label %88

88:                                               ; preds = %87
  %89 = load i32, ptr %5, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %5, align 4
  br label %16, !llvm.loop !9

91:                                               ; preds = %16
  br label %92

92:                                               ; preds = %91
  %93 = load i32, ptr %3, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %3, align 4
  br label %7, !llvm.loop !10

95:                                               ; preds = %7
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local void @print_airport(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %44, %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 10
  br i1 %8, label %9, label %47

9:                                                ; preds = %6
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.airport, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [10 x %struct.belt], ptr %11, i64 0, i64 %13
  store ptr %14, ptr %4, align 8
  %15 = load i32, ptr %3, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %15)
  store i32 0, ptr %5, align 4
  br label %17

17:                                               ; preds = %39, %9
  %18 = load i32, ptr %5, align 4
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.belt, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %42

23:                                               ; preds = %17
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.belt, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [1000 x %struct.bag], ptr %25, i64 0, i64 %27
  %29 = getelementptr inbounds %struct.bag, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 4
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.belt, ptr %31, i32 0, i32 0
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1000 x %struct.bag], ptr %32, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.bag, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 4
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %30, i32 noundef %37)
  br label %39

39:                                               ; preds = %23
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %5, align 4
  br label %17, !llvm.loop !11

42:                                               ; preds = %17
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %44

44:                                               ; preds = %42
  %45 = load i32, ptr %3, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %3, align 4
  br label %6, !llvm.loop !12

47:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.airport, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.bag, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %6 = call i64 @time(ptr noundef null) #4
  %7 = trunc i64 %6 to i32
  call void @srand(i32 noundef %7) #4
  call void @init_airport(ptr noundef %2)
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %17, %0
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 1000
  br i1 %10, label %11, label %20

11:                                               ; preds = %8
  call void @create_bag(ptr noundef %4)
  %12 = getelementptr inbounds %struct.airport, ptr %2, i32 0, i32 0
  %13 = getelementptr inbounds %struct.bag, ptr %4, i32 0, i32 2
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x %struct.belt], ptr %12, i64 0, i64 %15
  call void @load_bag(ptr noundef %16, ptr noundef %4)
  br label %17

17:                                               ; preds = %11
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  br label %8, !llvm.loop !13

20:                                               ; preds = %8
  store i32 0, ptr %5, align 4
  br label %21

21:                                               ; preds = %25, %20
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %22, 100
  br i1 %23, label %24, label %28

24:                                               ; preds = %21
  call void @move_bags(ptr noundef %2)
  call void @print_airport(ptr noundef %2)
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %5, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %5, align 4
  br label %21, !llvm.loop !14

28:                                               ; preds = %21
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
