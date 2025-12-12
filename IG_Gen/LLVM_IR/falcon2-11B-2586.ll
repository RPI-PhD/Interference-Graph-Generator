; ModuleID = 'DATASETv2/falcon2-11B-2586.c'
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

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x %struct.Stock], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [20 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %37, %0
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %40

11:                                               ; preds = %8
  %12 = call i32 @rand() #4
  %13 = srem i32 %12, 26
  %14 = add nsw i32 %13, 97
  %15 = trunc i32 %14 to i8
  %16 = load i32, ptr %3, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %17
  %19 = getelementptr inbounds %struct.Stock, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds [20 x i8], ptr %19, i64 0, i64 0
  store i8 %15, ptr %20, align 4
  %21 = call i32 @rand() #4
  %22 = srem i32 %21, 1000
  %23 = add nsw i32 %22, 1
  %24 = sitofp i32 %23 to float
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %26
  %28 = getelementptr inbounds %struct.Stock, ptr %27, i32 0, i32 1
  store float %24, ptr %28, align 4
  %29 = call i32 @rand() #4
  %30 = srem i32 %29, 1000
  %31 = add nsw i32 %30, 1
  %32 = sitofp i32 %31 to float
  %33 = load i32, ptr %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %34
  %36 = getelementptr inbounds %struct.Stock, ptr %35, i32 0, i32 2
  store float %32, ptr %36, align 4
  br label %37

37:                                               ; preds = %11
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %8, !llvm.loop !6

40:                                               ; preds = %8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %4, align 4
  br label %42

42:                                               ; preds = %66, %40
  %43 = load i32, ptr %4, align 4
  %44 = icmp slt i32 %43, 10
  br i1 %44, label %45, label %69

45:                                               ; preds = %42
  %46 = load i32, ptr %4, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.Stock, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds [20 x i8], ptr %49, i64 0, i64 0
  %51 = load i32, ptr %4, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.Stock, ptr %53, i32 0, i32 1
  %55 = load float, ptr %54, align 4
  %56 = fpext float %55 to double
  %57 = load i32, ptr %4, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.Stock, ptr %59, i32 0, i32 2
  %61 = load float, ptr %60, align 4
  %62 = fcmp ogt float %61, 0.000000e+00
  %63 = zext i1 %62 to i64
  %64 = select i1 %62, ptr @.str.2, ptr @.str.3
  %65 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %50, double noundef %56, ptr noundef %64)
  br label %66

66:                                               ; preds = %45
  %67 = load i32, ptr %4, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %4, align 4
  br label %42, !llvm.loop !8

69:                                               ; preds = %42
  %70 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %71 = getelementptr inbounds [20 x i8], ptr %5, i64 0, i64 0
  %72 = load ptr, ptr @stdin, align 8
  %73 = call ptr @fgets(ptr noundef %71, i32 noundef 20, ptr noundef %72)
  store i32 -1, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %74

74:                                               ; preds = %89, %69
  %75 = load i32, ptr %7, align 4
  %76 = icmp slt i32 %75, 10
  br i1 %76, label %77, label %92

77:                                               ; preds = %74
  %78 = load i32, ptr %7, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %79
  %81 = getelementptr inbounds %struct.Stock, ptr %80, i32 0, i32 0
  %82 = getelementptr inbounds [20 x i8], ptr %81, i64 0, i64 0
  %83 = getelementptr inbounds [20 x i8], ptr %5, i64 0, i64 0
  %84 = call i32 @strcmp(ptr noundef %82, ptr noundef %83) #5
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %88

86:                                               ; preds = %77
  %87 = load i32, ptr %7, align 4
  store i32 %87, ptr %6, align 4
  br label %92

88:                                               ; preds = %77
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %7, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %7, align 4
  br label %74, !llvm.loop !9

92:                                               ; preds = %86, %74
  %93 = load i32, ptr %6, align 4
  %94 = icmp ne i32 %93, -1
  br i1 %94, label %95, label %153

95:                                               ; preds = %92
  %96 = load i32, ptr %6, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %97
  %99 = getelementptr inbounds %struct.Stock, ptr %98, i32 0, i32 2
  %100 = load float, ptr %99, align 4
  %101 = fcmp ogt float %100, 0.000000e+00
  br i1 %101, label %102, label %127

102:                                              ; preds = %95
  %103 = load i32, ptr %6, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %104
  %106 = getelementptr inbounds %struct.Stock, ptr %105, i32 0, i32 0
  %107 = getelementptr inbounds [20 x i8], ptr %106, i64 0, i64 0
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, ptr noundef %107)
  %109 = load i32, ptr %6, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %110
  %112 = getelementptr inbounds %struct.Stock, ptr %111, i32 0, i32 2
  %113 = load float, ptr %112, align 4
  %114 = fadd float %113, -1.000000e+00
  store float %114, ptr %112, align 4
  %115 = load i32, ptr %6, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %116
  %118 = getelementptr inbounds %struct.Stock, ptr %117, i32 0, i32 0
  %119 = getelementptr inbounds [20 x i8], ptr %118, i64 0, i64 0
  %120 = load i32, ptr %6, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.Stock, ptr %122, i32 0, i32 1
  %124 = load float, ptr %123, align 4
  %125 = fpext float %124 to double
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, ptr noundef %119, double noundef %125)
  br label %152

127:                                              ; preds = %95
  %128 = load i32, ptr %6, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %129
  %131 = getelementptr inbounds %struct.Stock, ptr %130, i32 0, i32 0
  %132 = getelementptr inbounds [20 x i8], ptr %131, i64 0, i64 0
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, ptr noundef %132)
  %134 = load i32, ptr %6, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %135
  %137 = getelementptr inbounds %struct.Stock, ptr %136, i32 0, i32 2
  %138 = load float, ptr %137, align 4
  %139 = fadd float %138, 1.000000e+00
  store float %139, ptr %137, align 4
  %140 = load i32, ptr %6, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %141
  %143 = getelementptr inbounds %struct.Stock, ptr %142, i32 0, i32 0
  %144 = getelementptr inbounds [20 x i8], ptr %143, i64 0, i64 0
  %145 = load i32, ptr %6, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [10 x %struct.Stock], ptr %2, i64 0, i64 %146
  %148 = getelementptr inbounds %struct.Stock, ptr %147, i32 0, i32 1
  %149 = load float, ptr %148, align 4
  %150 = fpext float %149 to double
  %151 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, ptr noundef %144, double noundef %150)
  br label %152

152:                                              ; preds = %127, %102
  br label %155

153:                                              ; preds = %92
  %154 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  br label %155

155:                                              ; preds = %153, %152
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
