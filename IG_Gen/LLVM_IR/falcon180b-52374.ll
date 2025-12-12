; ModuleID = 'DATASETv2/falcon180b-52374.c'
source_filename = "DATASETv2/falcon180b-52374.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.expense = type { [50 x i8], float, [50 x i8] }

@.str = private unnamed_addr constant [33 x i8] c"Welcome to the Expense Tracker!\0A\00", align 1
@.str.1 = private unnamed_addr constant [46 x i8] c"Enter a category (or leave blank to finish): \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Enter an expense (or leave blank to finish): \00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"%s %f %s\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"\0AExpenses by category:\0A\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"%s:\0A\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"%s - $%.2f\0A\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [10 x [50 x i8]], align 16
  %5 = alloca [50 x %struct.expense], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %9

9:                                                ; preds = %26, %0
  %10 = load i32, ptr %2, align 4
  %11 = icmp slt i32 %10, 10
  br i1 %11, label %12, label %29

12:                                               ; preds = %9
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %14 = load i32, ptr %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x [50 x i8]], ptr %4, i64 0, i64 %15
  %17 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0
  %18 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %17)
  %19 = load i32, ptr %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [10 x [50 x i8]], ptr %4, i64 0, i64 %20
  %22 = getelementptr inbounds [50 x i8], ptr %21, i64 0, i64 0
  %23 = call i32 @strcmp(ptr noundef %22, ptr noundef @.str.3) #3
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %12
  br label %29

26:                                               ; preds = %12
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %2, align 4
  br label %9, !llvm.loop !6

29:                                               ; preds = %25, %9
  br label %30

30:                                               ; preds = %58, %29
  %31 = load i32, ptr %3, align 4
  %32 = icmp slt i32 %31, 50
  br i1 %32, label %33, label %61

33:                                               ; preds = %30
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %35 = load i32, ptr %3, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %36
  %38 = getelementptr inbounds %struct.expense, ptr %37, i32 0, i32 0
  %39 = getelementptr inbounds [50 x i8], ptr %38, i64 0, i64 0
  %40 = load i32, ptr %3, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.expense, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %3, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %45
  %47 = getelementptr inbounds %struct.expense, ptr %46, i32 0, i32 2
  %48 = getelementptr inbounds [50 x i8], ptr %47, i64 0, i64 0
  %49 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %39, ptr noundef %43, ptr noundef %48)
  %50 = load i32, ptr %3, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %51
  %53 = getelementptr inbounds %struct.expense, ptr %52, i32 0, i32 0
  %54 = getelementptr inbounds [50 x i8], ptr %53, i64 0, i64 0
  %55 = call i32 @strcmp(ptr noundef %54, ptr noundef @.str.3) #3
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %58

57:                                               ; preds = %33
  br label %61

58:                                               ; preds = %33
  %59 = load i32, ptr %3, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %3, align 4
  br label %30, !llvm.loop !8

61:                                               ; preds = %57, %30
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  store i32 0, ptr %6, align 4
  br label %63

63:                                               ; preds = %108, %61
  %64 = load i32, ptr %6, align 4
  %65 = load i32, ptr %2, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %111

67:                                               ; preds = %63
  %68 = load i32, ptr %6, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [10 x [50 x i8]], ptr %4, i64 0, i64 %69
  %71 = getelementptr inbounds [50 x i8], ptr %70, i64 0, i64 0
  %72 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %71)
  store i32 0, ptr %7, align 4
  br label %73

73:                                               ; preds = %103, %67
  %74 = load i32, ptr %7, align 4
  %75 = load i32, ptr %3, align 4
  %76 = icmp slt i32 %74, %75
  br i1 %76, label %77, label %106

77:                                               ; preds = %73
  %78 = load i32, ptr %7, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %79
  %81 = getelementptr inbounds %struct.expense, ptr %80, i32 0, i32 2
  %82 = getelementptr inbounds [50 x i8], ptr %81, i64 0, i64 0
  %83 = load i32, ptr %6, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [10 x [50 x i8]], ptr %4, i64 0, i64 %84
  %86 = getelementptr inbounds [50 x i8], ptr %85, i64 0, i64 0
  %87 = call i32 @strcmp(ptr noundef %82, ptr noundef %86) #3
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %102

89:                                               ; preds = %77
  %90 = load i32, ptr %7, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %91
  %93 = getelementptr inbounds %struct.expense, ptr %92, i32 0, i32 0
  %94 = getelementptr inbounds [50 x i8], ptr %93, i64 0, i64 0
  %95 = load i32, ptr %7, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [50 x %struct.expense], ptr %5, i64 0, i64 %96
  %98 = getelementptr inbounds %struct.expense, ptr %97, i32 0, i32 1
  %99 = load float, ptr %98, align 4
  %100 = fpext float %99 to double
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %94, double noundef %100)
  br label %102

102:                                              ; preds = %89, %77
  br label %103

103:                                              ; preds = %102
  %104 = load i32, ptr %7, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %7, align 4
  br label %73, !llvm.loop !9

106:                                              ; preds = %73
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %108

108:                                              ; preds = %106
  %109 = load i32, ptr %6, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %6, align 4
  br label %63, !llvm.loop !10

111:                                              ; preds = %63
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) }

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
