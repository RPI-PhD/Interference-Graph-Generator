; ModuleID = 'DATASETv2/gpt35-29825.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [5 x [20 x i8]], align 16
  %4 = alloca [5 x [5 x i32]], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %9 = call i64 @time(ptr noundef null) #4
  %10 = trunc i64 %9 to i32
  call void @srand(i32 noundef %10) #4
  %11 = call i32 @rand() #4
  %12 = srem i32 %11, 5
  store i32 %12, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.planet_names, i64 100, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.main.planet_distances, i64 100, i1 false)
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x [20 x i8]], ptr %3, i64 0, i64 %15
  %17 = getelementptr inbounds [20 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %17)
  store i32 1, ptr %5, align 4
  br label %19

19:                                               ; preds = %105, %0
  %20 = load i32, ptr %5, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %106

22:                                               ; preds = %19
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %28 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %5)
  %29 = load i32, ptr %5, align 4
  switch i32 %29, label %103 [
    i32 0, label %30
    i32 1, label %32
    i32 2, label %87
  ]

30:                                               ; preds = %22
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %105

32:                                               ; preds = %22
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  store i32 0, ptr %6, align 4
  br label %34

34:                                               ; preds = %50, %32
  %35 = load i32, ptr %6, align 4
  %36 = icmp slt i32 %35, 5
  br i1 %36, label %37, label %53

37:                                               ; preds = %34
  %38 = load i32, ptr %6, align 4
  %39 = load i32, ptr %2, align 4
  %40 = icmp ne i32 %38, %39
  br i1 %40, label %41, label %49

41:                                               ; preds = %37
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, 1
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [5 x [20 x i8]], ptr %3, i64 0, i64 %45
  %47 = getelementptr inbounds [20 x i8], ptr %46, i64 0, i64 0
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %43, ptr noundef %47)
  br label %49

49:                                               ; preds = %41, %37
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %6, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %6, align 4
  br label %34, !llvm.loop !6

53:                                               ; preds = %34
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %55 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.7, ptr noundef %7)
  %56 = load i32, ptr %7, align 4
  %57 = icmp sle i32 %56, 0
  br i1 %57, label %66, label %58

58:                                               ; preds = %53
  %59 = load i32, ptr %7, align 4
  %60 = icmp sgt i32 %59, 5
  br i1 %60, label %66, label %61

61:                                               ; preds = %58
  %62 = load i32, ptr %7, align 4
  %63 = load i32, ptr %2, align 4
  %64 = add nsw i32 %63, 1
  %65 = icmp eq i32 %62, %64
  br i1 %65, label %66, label %68

66:                                               ; preds = %61, %58, %53
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  br label %86

68:                                               ; preds = %61
  %69 = load i32, ptr %7, align 4
  %70 = sub nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [5 x [20 x i8]], ptr %3, i64 0, i64 %71
  %73 = getelementptr inbounds [20 x i8], ptr %72, i64 0, i64 0
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %73)
  %75 = load i32, ptr %2, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [5 x [5 x i32]], ptr %4, i64 0, i64 %76
  %78 = load i32, ptr %7, align 4
  %79 = sub nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [5 x i32], ptr %77, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %82)
  %84 = load i32, ptr %7, align 4
  %85 = sub nsw i32 %84, 1
  store i32 %85, ptr %2, align 4
  br label %86

86:                                               ; preds = %68, %66
  br label %105

87:                                               ; preds = %22
  %88 = load i32, ptr %2, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [5 x [20 x i8]], ptr %3, i64 0, i64 %89
  %91 = getelementptr inbounds [20 x i8], ptr %90, i64 0, i64 0
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, ptr noundef %91)
  %93 = call i32 @rand() #4
  %94 = srem i32 %93, 3
  store i32 %94, ptr %8, align 4
  %95 = load i32, ptr %8, align 4
  switch i32 %95, label %102 [
    i32 0, label %96
    i32 1, label %98
    i32 2, label %100
  ]

96:                                               ; preds = %87
  %97 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  br label %102

98:                                               ; preds = %87
  %99 = call i32 (ptr, ...) @printf(ptr noundef @.str.17)
  br label %102

100:                                              ; preds = %87
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  br label %102

102:                                              ; preds = %87, %100, %98, %96
  br label %105

103:                                              ; preds = %22
  %104 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  br label %105

105:                                              ; preds = %103, %102, %86, %30
  br label %19, !llvm.loop !8

106:                                              ; preds = %19
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
