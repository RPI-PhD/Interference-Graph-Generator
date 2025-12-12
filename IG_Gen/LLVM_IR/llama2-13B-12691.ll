; ModuleID = 'DATASETv2/llama2-13B-12691.c'
source_filename = "DATASETv2/llama2-13B-12691.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.grid = type { ptr, i32, i32 }
%struct.cell = type { i32, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"O \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"_ \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @init_grid(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call noalias ptr @malloc(i64 noundef 8000) #4
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.grid, ptr %6, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %68, %1
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 100
  br i1 %10, label %11, label %71

11:                                               ; preds = %8
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %64, %11
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 10
  br i1 %14, label %15, label %67

15:                                               ; preds = %12
  %16 = call noalias ptr @malloc(i64 noundef 12) #4
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.grid, ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = load i32, ptr %3, align 4
  %21 = mul nsw i32 %20, 10
  %22 = load i32, ptr %4, align 4
  %23 = add nsw i32 %21, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds ptr, ptr %19, i64 %24
  store ptr %16, ptr %25, align 8
  %26 = load i32, ptr %3, align 4
  %27 = mul nsw i32 %26, 10
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds %struct.grid, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %3, align 4
  %32 = mul nsw i32 %31, 10
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %32, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %30, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.cell, ptr %37, i32 0, i32 0
  store i32 %27, ptr %38, align 4
  %39 = load i32, ptr %4, align 4
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.grid, ptr %40, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  %43 = load i32, ptr %3, align 4
  %44 = mul nsw i32 %43, 10
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds ptr, ptr %42, i64 %47
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.cell, ptr %49, i32 0, i32 1
  store i32 %39, ptr %50, align 4
  %51 = call i32 @rand() #5
  %52 = srem i32 %51, 2
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.grid, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = load i32, ptr %3, align 4
  %57 = mul nsw i32 %56, 10
  %58 = load i32, ptr %4, align 4
  %59 = add nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %55, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds %struct.cell, ptr %62, i32 0, i32 2
  store i32 %52, ptr %63, align 4
  br label %64

64:                                               ; preds = %15
  %65 = load i32, ptr %4, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %4, align 4
  br label %12, !llvm.loop !6

67:                                               ; preds = %12
  br label %68

68:                                               ; preds = %67
  %69 = load i32, ptr %3, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %3, align 4
  br label %8, !llvm.loop !8

71:                                               ; preds = %8
  %72 = load ptr, ptr %2, align 8
  %73 = getelementptr inbounds %struct.grid, ptr %72, i32 0, i32 1
  store i32 100, ptr %73, align 8
  %74 = load ptr, ptr %2, align 8
  %75 = getelementptr inbounds %struct.grid, ptr %74, i32 0, i32 2
  store i32 10, ptr %75, align 4
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind  uwtable
define dso_local void @update_grid(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %181, %1
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.grid, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %184

12:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %13

13:                                               ; preds = %177, %12
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.grid, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %16, align 4
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %180

19:                                               ; preds = %13
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.grid, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %3, align 4
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.grid, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %23, %26
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds ptr, ptr %22, i64 %30
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %5, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.cell, ptr %33, i32 0, i32 2
  %35 = load i32, ptr %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %176

37:                                               ; preds = %19
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds %struct.cell, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 4
  %41 = add nsw i32 %40, 1
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds %struct.grid, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 8
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %73

46:                                               ; preds = %37
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.grid, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = load i32, ptr %3, align 4
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.grid, ptr %51, i32 0, i32 2
  %53 = load i32, ptr %52, align 4
  %54 = mul nsw i32 %50, %53
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds %struct.cell, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %56, align 4
  %58 = add nsw i32 %54, %57
  %59 = add nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %49, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds %struct.cell, ptr %62, i32 0, i32 2
  %64 = load i32, ptr %63, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %73

66:                                               ; preds = %46
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.cell, ptr %67, i32 0, i32 2
  %69 = load i32, ptr %68, align 4
  %70 = sub nsw i32 1, %69
  %71 = load ptr, ptr %5, align 8
  %72 = getelementptr inbounds %struct.cell, ptr %71, i32 0, i32 2
  store i32 %70, ptr %72, align 4
  br label %73

73:                                               ; preds = %66, %46, %37
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr inbounds %struct.cell, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 4
  %77 = sub nsw i32 %76, 1
  %78 = icmp sge i32 %77, 0
  br i1 %78, label %79, label %106

79:                                               ; preds = %73
  %80 = load ptr, ptr %2, align 8
  %81 = getelementptr inbounds %struct.grid, ptr %80, i32 0, i32 0
  %82 = load ptr, ptr %81, align 8
  %83 = load i32, ptr %3, align 4
  %84 = load ptr, ptr %2, align 8
  %85 = getelementptr inbounds %struct.grid, ptr %84, i32 0, i32 2
  %86 = load i32, ptr %85, align 4
  %87 = mul nsw i32 %83, %86
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds %struct.cell, ptr %88, i32 0, i32 0
  %90 = load i32, ptr %89, align 4
  %91 = add nsw i32 %87, %90
  %92 = sub nsw i32 %91, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds ptr, ptr %82, i64 %93
  %95 = load ptr, ptr %94, align 8
  %96 = getelementptr inbounds %struct.cell, ptr %95, i32 0, i32 2
  %97 = load i32, ptr %96, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %106

99:                                               ; preds = %79
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.cell, ptr %100, i32 0, i32 2
  %102 = load i32, ptr %101, align 4
  %103 = sub nsw i32 1, %102
  %104 = load ptr, ptr %5, align 8
  %105 = getelementptr inbounds %struct.cell, ptr %104, i32 0, i32 2
  store i32 %103, ptr %105, align 4
  br label %106

106:                                              ; preds = %99, %79, %73
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.cell, ptr %107, i32 0, i32 1
  %109 = load i32, ptr %108, align 4
  %110 = add nsw i32 %109, 1
  %111 = load ptr, ptr %2, align 8
  %112 = getelementptr inbounds %struct.grid, ptr %111, i32 0, i32 2
  %113 = load i32, ptr %112, align 4
  %114 = icmp slt i32 %110, %113
  br i1 %114, label %115, label %142

115:                                              ; preds = %106
  %116 = load ptr, ptr %2, align 8
  %117 = getelementptr inbounds %struct.grid, ptr %116, i32 0, i32 0
  %118 = load ptr, ptr %117, align 8
  %119 = load i32, ptr %3, align 4
  %120 = load ptr, ptr %2, align 8
  %121 = getelementptr inbounds %struct.grid, ptr %120, i32 0, i32 2
  %122 = load i32, ptr %121, align 4
  %123 = mul nsw i32 %119, %122
  %124 = load ptr, ptr %5, align 8
  %125 = getelementptr inbounds %struct.cell, ptr %124, i32 0, i32 1
  %126 = load i32, ptr %125, align 4
  %127 = add nsw i32 %123, %126
  %128 = add nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds ptr, ptr %118, i64 %129
  %131 = load ptr, ptr %130, align 8
  %132 = getelementptr inbounds %struct.cell, ptr %131, i32 0, i32 2
  %133 = load i32, ptr %132, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %142

135:                                              ; preds = %115
  %136 = load ptr, ptr %5, align 8
  %137 = getelementptr inbounds %struct.cell, ptr %136, i32 0, i32 2
  %138 = load i32, ptr %137, align 4
  %139 = sub nsw i32 1, %138
  %140 = load ptr, ptr %5, align 8
  %141 = getelementptr inbounds %struct.cell, ptr %140, i32 0, i32 2
  store i32 %139, ptr %141, align 4
  br label %142

142:                                              ; preds = %135, %115, %106
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.cell, ptr %143, i32 0, i32 1
  %145 = load i32, ptr %144, align 4
  %146 = sub nsw i32 %145, 1
  %147 = icmp sge i32 %146, 0
  br i1 %147, label %148, label %175

148:                                              ; preds = %142
  %149 = load ptr, ptr %2, align 8
  %150 = getelementptr inbounds %struct.grid, ptr %149, i32 0, i32 0
  %151 = load ptr, ptr %150, align 8
  %152 = load i32, ptr %3, align 4
  %153 = load ptr, ptr %2, align 8
  %154 = getelementptr inbounds %struct.grid, ptr %153, i32 0, i32 2
  %155 = load i32, ptr %154, align 4
  %156 = mul nsw i32 %152, %155
  %157 = load ptr, ptr %5, align 8
  %158 = getelementptr inbounds %struct.cell, ptr %157, i32 0, i32 1
  %159 = load i32, ptr %158, align 4
  %160 = add nsw i32 %156, %159
  %161 = sub nsw i32 %160, 1
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds ptr, ptr %151, i64 %162
  %164 = load ptr, ptr %163, align 8
  %165 = getelementptr inbounds %struct.cell, ptr %164, i32 0, i32 2
  %166 = load i32, ptr %165, align 4
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %175

168:                                              ; preds = %148
  %169 = load ptr, ptr %5, align 8
  %170 = getelementptr inbounds %struct.cell, ptr %169, i32 0, i32 2
  %171 = load i32, ptr %170, align 4
  %172 = sub nsw i32 1, %171
  %173 = load ptr, ptr %5, align 8
  %174 = getelementptr inbounds %struct.cell, ptr %173, i32 0, i32 2
  store i32 %172, ptr %174, align 4
  br label %175

175:                                              ; preds = %168, %148, %142
  br label %176

176:                                              ; preds = %175, %19
  br label %177

177:                                              ; preds = %176
  %178 = load i32, ptr %4, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, ptr %4, align 4
  br label %13, !llvm.loop !9

180:                                              ; preds = %13
  br label %181

181:                                              ; preds = %180
  %182 = load i32, ptr %3, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, ptr %3, align 4
  br label %6, !llvm.loop !10

184:                                              ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind  uwtable
define dso_local void @draw_grid(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %6

6:                                                ; preds = %47, %1
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.grid, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %50

12:                                               ; preds = %6
  store i32 0, ptr %4, align 4
  br label %13

13:                                               ; preds = %42, %12
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.grid, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %16, align 4
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %45

19:                                               ; preds = %13
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.grid, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %3, align 4
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.grid, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %23, %26
  %28 = load i32, ptr %4, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds ptr, ptr %22, i64 %30
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %5, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.cell, ptr %33, i32 0, i32 2
  %35 = load i32, ptr %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %39

37:                                               ; preds = %19
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  br label %41

39:                                               ; preds = %19
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %41

41:                                               ; preds = %39, %37
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %4, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %4, align 4
  br label %13, !llvm.loop !11

45:                                               ; preds = %13
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %47

47:                                               ; preds = %45
  %48 = load i32, ptr %3, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %3, align 4
  br label %6, !llvm.loop !12

50:                                               ; preds = %6
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %4 = call i64 @time(ptr noundef null) #5
  %5 = trunc i64 %4 to i32
  call void @srand(i32 noundef %5) #5
  %6 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %6, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  call void @init_grid(ptr noundef %7)
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %15, %0
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 100
  br i1 %10, label %11, label %18

11:                                               ; preds = %8
  %12 = load ptr, ptr %2, align 8
  call void @update_grid(ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  call void @draw_grid(ptr noundef %13)
  %14 = call i32 @usleep(i32 noundef 100000)
  br label %15

15:                                               ; preds = %11
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %3, align 4
  br label %8, !llvm.loop !13

18:                                               ; preds = %8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.grid, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %21) #5
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #2

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #2

declare i32 @usleep(i32 noundef) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

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
