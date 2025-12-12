; ModuleID = 'LLVM_IR/gpt35-29825.ll'
source_filename = "DATASETv2/gpt35-29825.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.planet_names = private unnamed_addr constant [5 x [20 x i8]] [[20 x i8] c"Arcturus\00\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"Vega\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"Sirius\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"Proxima Centauri\00\00\00\00", [20 x i8] c"Alpha Centauri\00\00\00\00\00\00"], align 16
@__const.main.planet_distances = private unnamed_addr constant [5 x [5 x i32]] [[5 x i32] [i32 0, i32 10, i32 20, i32 30, i32 15], [5 x i32] [i32 10, i32 0, i32 12, i32 8, i32 25], [5 x i32] [i32 20, i32 12, i32 0, i32 15, i32 18], [5 x i32] [i32 30, i32 8, i32 15, i32 0, i32 5], [5 x i32] [i32 15, i32 25, i32 18, i32 5, i32 0]], align 16
@.str = private unnamed_addr constant [46 x i8] c"Welcome to our C Procedural Space Adventure!\0A\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"You are currently on the planet %s.\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"What do you want to do?\0A\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"1 - Travel to a new planet.\0A\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"2 - Land on this planet.\0A\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"0 - Quit the game.\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [30 x i8] c"Thanks for playing our game!\0A\00", align 1
@.str.9 = private unnamed_addr constant [40 x i8] c"Which planet do you want to travel to?\0A\00", align 1
@.str.10 = private unnamed_addr constant [9 x i8] c"%d - %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [34 x i8] c"Enter the number of your choice: \00", align 1
@.str.12 = private unnamed_addr constant [42 x i8] c"Invalid planet choice. Please try again.\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"Traveling to %s.\0A\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"The journey will take %d days.\0A\0A\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"Landing on %s.\0A\0A\00", align 1
@.str.16 = private unnamed_addr constant [43 x i8] c"You found a cache of valuable resources.\0A\0A\00", align 1
@.str.17 = private unnamed_addr constant [34 x i8] c"You encountered hostile aliens.\0A\0A\00", align 1
@.str.18 = private unnamed_addr constant [41 x i8] c"You discovered a new species of plant.\0A\0A\00", align 1
@.str.19 = private unnamed_addr constant [36 x i8] c"Invalid choice. Please try again.\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [20 x i8]], align 16
  %2 = alloca [5 x [5 x i32]], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = call i64 @time(ptr noundef null) #4
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #4
  %7 = call i32 @rand() #4
  %8 = srem i32 %7, 5
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %1, ptr align 16 @__const.main.planet_names, i64 100, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.planet_distances, i64 100, i1 false)
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = sext i32 %8 to i64
  %11 = getelementptr inbounds [5 x [20 x i8]], ptr %1, i64 0, i64 %10
  %12 = getelementptr inbounds [20 x i8], ptr %11, i64 0, i64 0
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %12)
  store i32 1, ptr %3, align 4
  br label %14

14:                                               ; preds = %90, %0
  %.01 = phi i32 [ %8, %0 ], [ %.2, %90 ]
  %15 = load i32, ptr %3, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %91

17:                                               ; preds = %14
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %3)
  %24 = load i32, ptr %3, align 4
  switch i32 %24, label %88 [
    i32 0, label %25
    i32 1, label %27
    i32 2, label %74
  ]

25:                                               ; preds = %17
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %90

27:                                               ; preds = %17
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %29

29:                                               ; preds = %40, %27
  %.0 = phi i32 [ 0, %27 ], [ %41, %40 ]
  %30 = icmp slt i32 %.0, 5
  br i1 %30, label %31, label %42

31:                                               ; preds = %29
  %32 = icmp ne i32 %.0, %.01
  br i1 %32, label %33, label %39

33:                                               ; preds = %31
  %34 = add nsw i32 %.0, 1
  %35 = sext i32 %.0 to i64
  %36 = getelementptr inbounds [5 x [20 x i8]], ptr %1, i64 0, i64 %35
  %37 = getelementptr inbounds [20 x i8], ptr %36, i64 0, i64 0
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %34, ptr noundef %37)
  br label %39

39:                                               ; preds = %33, %31
  br label %40

40:                                               ; preds = %39
  %41 = add nsw i32 %.0, 1
  br label %29, !llvm.loop !6

42:                                               ; preds = %29
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %44 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %4)
  %45 = load i32, ptr %4, align 4
  %46 = icmp sle i32 %45, 0
  br i1 %46, label %54, label %47

47:                                               ; preds = %42
  %48 = load i32, ptr %4, align 4
  %49 = icmp sgt i32 %48, 5
  br i1 %49, label %54, label %50

50:                                               ; preds = %47
  %51 = load i32, ptr %4, align 4
  %52 = add nsw i32 %.01, 1
  %53 = icmp eq i32 %51, %52
  br i1 %53, label %54, label %56

54:                                               ; preds = %50, %47, %42
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %73

56:                                               ; preds = %50
  %57 = load i32, ptr %4, align 4
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [5 x [20 x i8]], ptr %1, i64 0, i64 %59
  %61 = getelementptr inbounds [20 x i8], ptr %60, i64 0, i64 0
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %61)
  %63 = sext i32 %.01 to i64
  %64 = getelementptr inbounds [5 x [5 x i32]], ptr %2, i64 0, i64 %63
  %65 = load i32, ptr %4, align 4
  %66 = sub nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [5 x i32], ptr %64, i64 0, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %69)
  %71 = load i32, ptr %4, align 4
  %72 = sub nsw i32 %71, 1
  br label %73

73:                                               ; preds = %56, %54
  %.1 = phi i32 [ %.01, %54 ], [ %72, %56 ]
  br label %90

74:                                               ; preds = %17
  %75 = sext i32 %.01 to i64
  %76 = getelementptr inbounds [5 x [20 x i8]], ptr %1, i64 0, i64 %75
  %77 = getelementptr inbounds [20 x i8], ptr %76, i64 0, i64 0
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %77)
  %79 = call i32 @rand() #4
  %80 = srem i32 %79, 3
  switch i32 %80, label %87 [
    i32 0, label %81
    i32 1, label %83
    i32 2, label %85
  ]

81:                                               ; preds = %74
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %87

83:                                               ; preds = %74
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %87

85:                                               ; preds = %74
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %87

87:                                               ; preds = %85, %83, %81, %74
  br label %90

88:                                               ; preds = %17
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %90

90:                                               ; preds = %88, %87, %73, %25
  %.2 = phi i32 [ %.01, %88 ], [ %.01, %87 ], [ %.1, %73 ], [ %.01, %25 ]
  br label %14, !llvm.loop !8

91:                                               ; preds = %14
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

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
