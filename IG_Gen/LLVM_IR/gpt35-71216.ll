; ModuleID = 'DATASETv2/gpt35-71216.c'
source_filename = "DATASETv2/gpt35-71216.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"N\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"NNE\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"NE\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"ENE\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"ESE\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"SE\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"SSE\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"SSW\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"SW\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"WSW\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"W\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"WNW\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"NW\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"NNW\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c"Clear\00", align 1
@.str.17 = private unnamed_addr constant [14 x i8] c"Partly cloudy\00", align 1
@.str.18 = private unnamed_addr constant [14 x i8] c"Mostly cloudy\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"Overcast\00", align 1
@.str.20 = private unnamed_addr constant [21 x i8] c"Temperature: %.1f*C\0A\00", align 1
@.str.21 = private unnamed_addr constant [16 x i8] c"Humidity: %d%%\0A\00", align 1
@.str.22 = private unnamed_addr constant [22 x i8] c"Precipitation: %d mm\0A\00", align 1
@.str.23 = private unnamed_addr constant [21 x i8] c"Wind speed: %d km/h\0A\00", align 1
@.str.24 = private unnamed_addr constant [20 x i8] c"Wind direction: %s\0A\00", align 1
@.str.25 = private unnamed_addr constant [19 x i8] c"Sky condition: %s\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [4 x i8], align 1
  %7 = alloca [10 x i8], align 1
  store i32 0, ptr %1, align 4
  %8 = call i64 @time(ptr noundef null) #3
  %9 = trunc i64 %8 to i32
  call void @srand(i32 noundef %9) #3
  %10 = call i32 @rand() #3
  %11 = srem i32 %10, 50
  %12 = add nsw i32 %11, 15
  %13 = sitofp i32 %12 to float
  store float %13, ptr %2, align 4
  %14 = call i32 @rand() #3
  %15 = srem i32 %14, 101
  store i32 %15, ptr %3, align 4
  %16 = call i32 @rand() #3
  %17 = srem i32 %16, 25
  store i32 %17, ptr %4, align 4
  %18 = call i32 @rand() #3
  %19 = srem i32 %18, 71
  store i32 %19, ptr %5, align 4
  %20 = call i32 @rand() #3
  %21 = srem i32 %20, 16
  switch i32 %21, label %70 [
    i32 0, label %22
    i32 1, label %25
    i32 2, label %28
    i32 3, label %31
    i32 4, label %34
    i32 5, label %37
    i32 6, label %40
    i32 7, label %43
    i32 8, label %46
    i32 9, label %49
    i32 10, label %52
    i32 11, label %55
    i32 12, label %58
    i32 13, label %61
    i32 14, label %64
    i32 15, label %67
  ]

22:                                               ; preds = %0
  %23 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %24 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %23, ptr noundef @.str) #3
  br label %70

25:                                               ; preds = %0
  %26 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %27 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %26, ptr noundef @.str.1) #3
  br label %70

28:                                               ; preds = %0
  %29 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %30 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %29, ptr noundef @.str.2) #3
  br label %70

31:                                               ; preds = %0
  %32 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %33 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %32, ptr noundef @.str.3) #3
  br label %70

34:                                               ; preds = %0
  %35 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %36 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %35, ptr noundef @.str.4) #3
  br label %70

37:                                               ; preds = %0
  %38 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %39 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %38, ptr noundef @.str.5) #3
  br label %70

40:                                               ; preds = %0
  %41 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %42 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %41, ptr noundef @.str.6) #3
  br label %70

43:                                               ; preds = %0
  %44 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %45 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %44, ptr noundef @.str.7) #3
  br label %70

46:                                               ; preds = %0
  %47 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %48 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %47, ptr noundef @.str.8) #3
  br label %70

49:                                               ; preds = %0
  %50 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %51 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %50, ptr noundef @.str.9) #3
  br label %70

52:                                               ; preds = %0
  %53 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %54 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %53, ptr noundef @.str.10) #3
  br label %70

55:                                               ; preds = %0
  %56 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %57 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %56, ptr noundef @.str.11) #3
  br label %70

58:                                               ; preds = %0
  %59 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %60 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %59, ptr noundef @.str.12) #3
  br label %70

61:                                               ; preds = %0
  %62 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %63 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %62, ptr noundef @.str.13) #3
  br label %70

64:                                               ; preds = %0
  %65 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %66 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %65, ptr noundef @.str.14) #3
  br label %70

67:                                               ; preds = %0
  %68 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %69 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %68, ptr noundef @.str.15) #3
  br label %70

70:                                               ; preds = %0, %67, %64, %61, %58, %55, %52, %49, %46, %43, %40, %37, %34, %31, %28, %25, %22
  %71 = call i32 @rand() #3
  %72 = srem i32 %71, 4
  switch i32 %72, label %85 [
    i32 0, label %73
    i32 1, label %76
    i32 2, label %79
    i32 3, label %82
  ]

73:                                               ; preds = %70
  %74 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %75 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %74, ptr noundef @.str.16) #3
  br label %85

76:                                               ; preds = %70
  %77 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %78 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %77, ptr noundef @.str.17) #3
  br label %85

79:                                               ; preds = %70
  %80 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %81 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %80, ptr noundef @.str.18) #3
  br label %85

82:                                               ; preds = %70
  %83 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %84 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %83, ptr noundef @.str.19) #3
  br label %85

85:                                               ; preds = %70, %82, %79, %76, %73
  %86 = load float, ptr %2, align 4
  %87 = fpext float %86 to double
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, double noundef %87)
  %89 = load i32, ptr %3, align 4
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %89)
  %91 = load i32, ptr %4, align 4
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %91)
  %93 = load i32, ptr %5, align 4
  %94 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %93)
  %95 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %95)
  %97 = getelementptr inbounds [10 x i8], ptr %7, i64 0, i64 0
  %98 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, ptr noundef %97)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
