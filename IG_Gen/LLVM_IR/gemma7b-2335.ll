; ModuleID = 'DATASETv2/gemma7b-2335.c'
source_filename = "DATASETv2/gemma7b-2335.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"Enter the first string: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [26 x i8] c"Enter the second string: \00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Enter the third string: \00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"Enter the fourth string: \00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Enter the fifth string: \00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"The strings are similar.\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"The strings are not similar.\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca [100 x i8], align 16
  %4 = alloca [100 x i8], align 16
  %5 = alloca [100 x i8], align 16
  %6 = alloca [100 x i8], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %13, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %15 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %16 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %15)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %18 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %19 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %18)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %21 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0
  %22 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %21)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %24 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 0
  %25 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %24)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %27 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 0
  %28 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %27)
  store i32 0, ptr %7, align 4
  br label %29

29:                                               ; preds = %134, %0
  %30 = load i32, ptr %7, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %137

36:                                               ; preds = %29
  store i32 0, ptr %8, align 4
  br label %37

37:                                               ; preds = %130, %36
  %38 = load i32, ptr %8, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %133

44:                                               ; preds = %37
  store i32 0, ptr %9, align 4
  br label %45

45:                                               ; preds = %126, %44
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %47
  %49 = load i8, ptr %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %129

52:                                               ; preds = %45
  store i32 0, ptr %10, align 4
  br label %53

53:                                               ; preds = %122, %52
  %54 = load i32, ptr %10, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 %55
  %57 = load i8, ptr %56, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %125

60:                                               ; preds = %53
  store i32 0, ptr %11, align 4
  br label %61

61:                                               ; preds = %118, %60
  %62 = load i32, ptr %11, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %63
  %65 = load i8, ptr %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %121

68:                                               ; preds = %61
  %69 = load i32, ptr %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 %70
  %72 = load i8, ptr %71, align 1
  %73 = sext i8 %72 to i32
  %74 = load i32, ptr %8, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %75
  %77 = load i8, ptr %76, align 1
  %78 = sext i8 %77 to i32
  %79 = icmp eq i32 %73, %78
  br i1 %79, label %80, label %117

80:                                               ; preds = %68
  %81 = load i32, ptr %8, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 %82
  %84 = load i8, ptr %83, align 1
  %85 = sext i8 %84 to i32
  %86 = load i32, ptr %9, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %87
  %89 = load i8, ptr %88, align 1
  %90 = sext i8 %89 to i32
  %91 = icmp eq i32 %85, %90
  br i1 %91, label %92, label %117

92:                                               ; preds = %80
  %93 = load i32, ptr %9, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 %94
  %96 = load i8, ptr %95, align 1
  %97 = sext i8 %96 to i32
  %98 = load i32, ptr %10, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 %99
  %101 = load i8, ptr %100, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp eq i32 %97, %102
  br i1 %103, label %104, label %117

104:                                              ; preds = %92
  %105 = load i32, ptr %10, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [100 x i8], ptr %5, i64 0, i64 %106
  %108 = load i8, ptr %107, align 1
  %109 = sext i8 %108 to i32
  %110 = load i32, ptr %11, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [100 x i8], ptr %6, i64 0, i64 %111
  %113 = load i8, ptr %112, align 1
  %114 = sext i8 %113 to i32
  %115 = icmp eq i32 %109, %114
  br i1 %115, label %116, label %117

116:                                              ; preds = %104
  store i32 1, ptr %13, align 4
  br label %117

117:                                              ; preds = %116, %104, %92, %80, %68
  br label %118

118:                                              ; preds = %117
  %119 = load i32, ptr %11, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %11, align 4
  br label %61, !llvm.loop !6

121:                                              ; preds = %61
  br label %122

122:                                              ; preds = %121
  %123 = load i32, ptr %10, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %10, align 4
  br label %53, !llvm.loop !8

125:                                              ; preds = %53
  br label %126

126:                                              ; preds = %125
  %127 = load i32, ptr %9, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %9, align 4
  br label %45, !llvm.loop !9

129:                                              ; preds = %45
  br label %130

130:                                              ; preds = %129
  %131 = load i32, ptr %8, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %8, align 4
  br label %37, !llvm.loop !10

133:                                              ; preds = %37
  br label %134

134:                                              ; preds = %133
  %135 = load i32, ptr %7, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %7, align 4
  br label %29, !llvm.loop !11

137:                                              ; preds = %29
  %138 = load i32, ptr %13, align 4
  %139 = icmp eq i32 %138, 1
  br i1 %139, label %140, label %142

140:                                              ; preds = %137
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %144

142:                                              ; preds = %137
  %143 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %144

144:                                              ; preds = %142, %140
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
