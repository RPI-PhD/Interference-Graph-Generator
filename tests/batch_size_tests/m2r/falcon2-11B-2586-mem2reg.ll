; ModuleID = 'LLVM_IR/falcon2-11B-2586.ll'
source_filename = "DATASETv2/falcon2-11B-2586.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Stock = type { [20 x i8], float, float }

@.str = private unnamed_addr constant [22 x i8] c"Stock Market Tracker\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"%s: %.2f %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"BUY\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"SELL\00", align 1
@.str.4 = private unnamed_addr constant [51 x i8] c"Enter the name of the stock you want to buy/sell: \00", align 1
@stdin = external global ptr, align 8
@.str.5 = private unnamed_addr constant [14 x i8] c"BUYING %s...\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"You bought %s for %.2f\0A\00", align 1
@.str.7 = private unnamed_addr constant [15 x i8] c"SELLING %s...\0A\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"You sold %s for %.2f\0A\00", align 1
@.str.9 = private unnamed_addr constant [29 x i8] c"No such stock in the market\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10 x %struct.Stock], align 16
  %2 = alloca [20 x i8], align 16
  br label %3

3:                                                ; preds = %28, %0
  %.01 = phi i32 [ 0, %0 ], [ %29, %28 ]
  %4 = icmp slt i32 %.01, 10
  br i1 %4, label %5, label %30

5:                                                ; preds = %3
  %6 = call i32 @rand() #4
  %7 = srem i32 %6, 26
  %8 = add nsw i32 %7, 97
  %9 = trunc i32 %8 to i8
  %10 = sext i32 %.01 to i64
  %11 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %10
  %12 = getelementptr inbounds %struct.Stock, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds [20 x i8], ptr %12, i64 0, i64 0
  store i8 %9, ptr %13, align 4
  %14 = call i32 @rand() #4
  %15 = srem i32 %14, 1000
  %16 = add nsw i32 %15, 1
  %17 = sitofp i32 %16 to float
  %18 = sext i32 %.01 to i64
  %19 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %18
  %20 = getelementptr inbounds %struct.Stock, ptr %19, i32 0, i32 1
  store float %17, ptr %20, align 4
  %21 = call i32 @rand() #4
  %22 = srem i32 %21, 1000
  %23 = add nsw i32 %22, 1
  %24 = sitofp i32 %23 to float
  %25 = sext i32 %.01 to i64
  %26 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.Stock, ptr %26, i32 0, i32 2
  store float %24, ptr %27, align 4
  br label %28

28:                                               ; preds = %5
  %29 = add nsw i32 %.01, 1
  br label %3, !llvm.loop !6

30:                                               ; preds = %3
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %32

32:                                               ; preds = %52, %30
  %.02 = phi i32 [ 0, %30 ], [ %53, %52 ]
  %33 = icmp slt i32 %.02, 10
  br i1 %33, label %34, label %54

34:                                               ; preds = %32
  %35 = sext i32 %.02 to i64
  %36 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.Stock, ptr %36, i32 0, i32 0
  %38 = getelementptr inbounds [20 x i8], ptr %37, i64 0, i64 0
  %39 = sext i32 %.02 to i64
  %40 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.Stock, ptr %40, i32 0, i32 1
  %42 = load float, ptr %41, align 4
  %43 = fpext float %42 to double
  %44 = sext i32 %.02 to i64
  %45 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.Stock, ptr %45, i32 0, i32 2
  %47 = load float, ptr %46, align 4
  %48 = fcmp ogt float %47, 0.000000e+00
  %49 = zext i1 %48 to i64
  %50 = select i1 %48, ptr @.str.2, ptr @.str.3
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %38, double noundef %43, ptr noundef %50)
  br label %52

52:                                               ; preds = %34
  %53 = add nsw i32 %.02, 1
  br label %32, !llvm.loop !8

54:                                               ; preds = %32
  %55 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %56 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %57 = load ptr, ptr @stdin, align 8
  %58 = call ptr @fgets(ptr noundef %56, i32 noundef 20, ptr noundef %57)
  br label %59

59:                                               ; preds = %71, %54
  %.0 = phi i32 [ 0, %54 ], [ %72, %71 ]
  %60 = icmp slt i32 %.0, 10
  br i1 %60, label %61, label %73

61:                                               ; preds = %59
  %62 = sext i32 %.0 to i64
  %63 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %62
  %64 = getelementptr inbounds %struct.Stock, ptr %63, i32 0, i32 0
  %65 = getelementptr inbounds [20 x i8], ptr %64, i64 0, i64 0
  %66 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %67 = call i32 @strcmp(ptr noundef %65, ptr noundef %66) #5
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %70

69:                                               ; preds = %61
  br label %73

70:                                               ; preds = %61
  br label %71

71:                                               ; preds = %70
  %72 = add nsw i32 %.0, 1
  br label %59, !llvm.loop !9

73:                                               ; preds = %69, %59
  %.03 = phi i32 [ %.0, %69 ], [ -1, %59 ]
  %74 = icmp ne i32 %.03, -1
  br i1 %74, label %75, label %124

75:                                               ; preds = %73
  %76 = sext i32 %.03 to i64
  %77 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %76
  %78 = getelementptr inbounds %struct.Stock, ptr %77, i32 0, i32 2
  %79 = load float, ptr %78, align 4
  %80 = fcmp ogt float %79, 0.000000e+00
  br i1 %80, label %81, label %102

81:                                               ; preds = %75
  %82 = sext i32 %.03 to i64
  %83 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %82
  %84 = getelementptr inbounds %struct.Stock, ptr %83, i32 0, i32 0
  %85 = getelementptr inbounds [20 x i8], ptr %84, i64 0, i64 0
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %85)
  %87 = sext i32 %.03 to i64
  %88 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %87
  %89 = getelementptr inbounds %struct.Stock, ptr %88, i32 0, i32 2
  %90 = load float, ptr %89, align 4
  %91 = fadd float %90, -1.000000e+00
  store float %91, ptr %89, align 4
  %92 = sext i32 %.03 to i64
  %93 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %92
  %94 = getelementptr inbounds %struct.Stock, ptr %93, i32 0, i32 0
  %95 = getelementptr inbounds [20 x i8], ptr %94, i64 0, i64 0
  %96 = sext i32 %.03 to i64
  %97 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %96
  %98 = getelementptr inbounds %struct.Stock, ptr %97, i32 0, i32 1
  %99 = load float, ptr %98, align 4
  %100 = fpext float %99 to double
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %95, double noundef %100)
  br label %123

102:                                              ; preds = %75
  %103 = sext i32 %.03 to i64
  %104 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %103
  %105 = getelementptr inbounds %struct.Stock, ptr %104, i32 0, i32 0
  %106 = getelementptr inbounds [20 x i8], ptr %105, i64 0, i64 0
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %106)
  %108 = sext i32 %.03 to i64
  %109 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %108
  %110 = getelementptr inbounds %struct.Stock, ptr %109, i32 0, i32 2
  %111 = load float, ptr %110, align 4
  %112 = fadd float %111, 1.000000e+00
  store float %112, ptr %110, align 4
  %113 = sext i32 %.03 to i64
  %114 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %113
  %115 = getelementptr inbounds %struct.Stock, ptr %114, i32 0, i32 0
  %116 = getelementptr inbounds [20 x i8], ptr %115, i64 0, i64 0
  %117 = sext i32 %.03 to i64
  %118 = getelementptr inbounds [10 x %struct.Stock], ptr %1, i64 0, i64 %117
  %119 = getelementptr inbounds %struct.Stock, ptr %118, i32 0, i32 1
  %120 = load float, ptr %119, align 4
  %121 = fpext float %120 to double
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %116, double noundef %121)
  br label %123

123:                                              ; preds = %102, %81
  br label %126

124:                                              ; preds = %73
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %126

126:                                              ; preds = %124, %123
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(read) }

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
