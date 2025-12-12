; ModuleID = 'LLVM_IR/falcon180b-52374.ll'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10 x [50 x i8]], align 16
  %2 = alloca [50 x %struct.expense], align 16
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %4

4:                                                ; preds = %18, %0
  %.01 = phi i32 [ 0, %0 ], [ %19, %18 ]
  %5 = icmp slt i32 %.01, 10
  br i1 %5, label %6, label %20

6:                                                ; preds = %4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %8 = sext i32 %.01 to i64
  %9 = getelementptr inbounds [10 x [50 x i8]], ptr %1, i64 0, i64 %8
  %10 = getelementptr inbounds [50 x i8], ptr %9, i64 0, i64 0
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %10)
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds [10 x [50 x i8]], ptr %1, i64 0, i64 %12
  %14 = getelementptr inbounds [50 x i8], ptr %13, i64 0, i64 0
  %15 = call i32 @strcmp(ptr noundef %14, ptr noundef @.str.3) #3
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %6
  br label %20

18:                                               ; preds = %6
  %19 = add nsw i32 %.01, 1
  br label %4, !llvm.loop !6

20:                                               ; preds = %17, %4
  br label %21

21:                                               ; preds = %44, %20
  %.02 = phi i32 [ 0, %20 ], [ %45, %44 ]
  %22 = icmp slt i32 %.02, 50
  br i1 %22, label %23, label %46

23:                                               ; preds = %21
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %25 = sext i32 %.02 to i64
  %26 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.expense, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds [50 x i8], ptr %27, i64 0, i64 0
  %29 = sext i32 %.02 to i64
  %30 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.expense, ptr %30, i32 0, i32 1
  %32 = sext i32 %.02 to i64
  %33 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %32
  %34 = getelementptr inbounds %struct.expense, ptr %33, i32 0, i32 2
  %35 = getelementptr inbounds [50 x i8], ptr %34, i64 0, i64 0
  %36 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %28, ptr noundef %31, ptr noundef %35)
  %37 = sext i32 %.02 to i64
  %38 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %37
  %39 = getelementptr inbounds %struct.expense, ptr %38, i32 0, i32 0
  %40 = getelementptr inbounds [50 x i8], ptr %39, i64 0, i64 0
  %41 = call i32 @strcmp(ptr noundef %40, ptr noundef @.str.3) #3
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %23
  br label %46

44:                                               ; preds = %23
  %45 = add nsw i32 %.02, 1
  br label %21, !llvm.loop !8

46:                                               ; preds = %43, %21
  %47 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %48

48:                                               ; preds = %83, %46
  %.03 = phi i32 [ 0, %46 ], [ %84, %83 ]
  %49 = icmp slt i32 %.03, %.01
  br i1 %49, label %50, label %85

50:                                               ; preds = %48
  %51 = sext i32 %.03 to i64
  %52 = getelementptr inbounds [10 x [50 x i8]], ptr %1, i64 0, i64 %51
  %53 = getelementptr inbounds [50 x i8], ptr %52, i64 0, i64 0
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %53)
  br label %55

55:                                               ; preds = %79, %50
  %.0 = phi i32 [ 0, %50 ], [ %80, %79 ]
  %56 = icmp slt i32 %.0, %.02
  br i1 %56, label %57, label %81

57:                                               ; preds = %55
  %58 = sext i32 %.0 to i64
  %59 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.expense, ptr %59, i32 0, i32 2
  %61 = getelementptr inbounds [50 x i8], ptr %60, i64 0, i64 0
  %62 = sext i32 %.03 to i64
  %63 = getelementptr inbounds [10 x [50 x i8]], ptr %1, i64 0, i64 %62
  %64 = getelementptr inbounds [50 x i8], ptr %63, i64 0, i64 0
  %65 = call i32 @strcmp(ptr noundef %61, ptr noundef %64) #3
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %78

67:                                               ; preds = %57
  %68 = sext i32 %.0 to i64
  %69 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %68
  %70 = getelementptr inbounds %struct.expense, ptr %69, i32 0, i32 0
  %71 = getelementptr inbounds [50 x i8], ptr %70, i64 0, i64 0
  %72 = sext i32 %.0 to i64
  %73 = getelementptr inbounds [50 x %struct.expense], ptr %2, i64 0, i64 %72
  %74 = getelementptr inbounds %struct.expense, ptr %73, i32 0, i32 1
  %75 = load float, ptr %74, align 4
  %76 = fpext float %75 to double
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %71, double noundef %76)
  br label %78

78:                                               ; preds = %67, %57
  br label %79

79:                                               ; preds = %78
  %80 = add nsw i32 %.0, 1
  br label %55, !llvm.loop !9

81:                                               ; preds = %55
  %82 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %83

83:                                               ; preds = %81
  %84 = add nsw i32 %.03, 1
  br label %48, !llvm.loop !10

85:                                               ; preds = %48
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
