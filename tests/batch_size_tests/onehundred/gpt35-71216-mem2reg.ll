; ModuleID = 'LLVM_IR/gpt35-71216.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [4 x i8], align 1
  %2 = alloca [10 x i8], align 1
  %3 = call i64 @time(ptr noundef null) #3
  %4 = trunc i64 %3 to i32
  call void @srand(i32 noundef %4) #3
  %5 = call i32 @rand() #3
  %6 = srem i32 %5, 50
  %7 = add nsw i32 %6, 15
  %8 = sitofp i32 %7 to float
  %9 = call i32 @rand() #3
  %10 = srem i32 %9, 101
  %11 = call i32 @rand() #3
  %12 = srem i32 %11, 25
  %13 = call i32 @rand() #3
  %14 = srem i32 %13, 71
  %15 = call i32 @rand() #3
  %16 = srem i32 %15, 16
  switch i32 %16, label %65 [
    i32 0, label %17
    i32 1, label %20
    i32 2, label %23
    i32 3, label %26
    i32 4, label %29
    i32 5, label %32
    i32 6, label %35
    i32 7, label %38
    i32 8, label %41
    i32 9, label %44
    i32 10, label %47
    i32 11, label %50
    i32 12, label %53
    i32 13, label %56
    i32 14, label %59
    i32 15, label %62
  ]

17:                                               ; preds = %0
  %18 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %19 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %18, ptr noundef @.str) #3
  br label %65

20:                                               ; preds = %0
  %21 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %22 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %21, ptr noundef @.str.1) #3
  br label %65

23:                                               ; preds = %0
  %24 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %25 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %24, ptr noundef @.str.2) #3
  br label %65

26:                                               ; preds = %0
  %27 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %28 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %27, ptr noundef @.str.3) #3
  br label %65

29:                                               ; preds = %0
  %30 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %31 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %30, ptr noundef @.str.4) #3
  br label %65

32:                                               ; preds = %0
  %33 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %34 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %33, ptr noundef @.str.5) #3
  br label %65

35:                                               ; preds = %0
  %36 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %37 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %36, ptr noundef @.str.6) #3
  br label %65

38:                                               ; preds = %0
  %39 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %40 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %39, ptr noundef @.str.7) #3
  br label %65

41:                                               ; preds = %0
  %42 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %43 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %42, ptr noundef @.str.8) #3
  br label %65

44:                                               ; preds = %0
  %45 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %46 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %45, ptr noundef @.str.9) #3
  br label %65

47:                                               ; preds = %0
  %48 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %49 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %48, ptr noundef @.str.10) #3
  br label %65

50:                                               ; preds = %0
  %51 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %52 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %51, ptr noundef @.str.11) #3
  br label %65

53:                                               ; preds = %0
  %54 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %55 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %54, ptr noundef @.str.12) #3
  br label %65

56:                                               ; preds = %0
  %57 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %58 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %57, ptr noundef @.str.13) #3
  br label %65

59:                                               ; preds = %0
  %60 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %61 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %60, ptr noundef @.str.14) #3
  br label %65

62:                                               ; preds = %0
  %63 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %64 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %63, ptr noundef @.str.15) #3
  br label %65

65:                                               ; preds = %62, %59, %56, %53, %50, %47, %44, %41, %38, %35, %32, %29, %26, %23, %20, %17, %0
  %66 = call i32 @rand() #3
  %67 = srem i32 %66, 4
  switch i32 %67, label %80 [
    i32 0, label %68
    i32 1, label %71
    i32 2, label %74
    i32 3, label %77
  ]

68:                                               ; preds = %65
  %69 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %70 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %69, ptr noundef @.str.16) #3
  br label %80

71:                                               ; preds = %65
  %72 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %73 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %72, ptr noundef @.str.17) #3
  br label %80

74:                                               ; preds = %65
  %75 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %76 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %75, ptr noundef @.str.18) #3
  br label %80

77:                                               ; preds = %65
  %78 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %79 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %78, ptr noundef @.str.19) #3
  br label %80

80:                                               ; preds = %77, %74, %71, %68, %65
  %81 = fpext float %8 to double
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, double noundef %81)
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %10)
  %84 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %12)
  %85 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %14)
  %86 = getelementptr inbounds [4 x i8], ptr %1, i64 0, i64 0
  %87 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, ptr noundef %86)
  %88 = getelementptr inbounds [10 x i8], ptr %2, i64 0, i64 0
  %89 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, ptr noundef %88)
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

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
