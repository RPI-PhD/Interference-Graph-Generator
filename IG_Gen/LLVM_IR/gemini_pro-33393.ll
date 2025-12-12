; ModuleID = 'DATASETv2/gemini_pro-33393.c'
source_filename = "DATASETv2/gemini_pro-33393.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@charset = dso_local global [13 x i8] c" .,-;:=+*#%@\00", align 1
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Enter the text string: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.4 = private unnamed_addr constant [46 x i8] c"Enter the width and height of the ASCII art: \00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1

; Function Attrs: noinline nounwind  uwtable
define dso_local void @text_to_ascii(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = load ptr, ptr %4, align 8
  %24 = call i64 @strlen(ptr noundef %23) #5
  %25 = udiv i64 %22, %24
  %26 = trunc i64 %25 to i32
  store i32 %26, ptr %7, align 4
  %27 = load i32, ptr %6, align 4
  %28 = sdiv i32 %27, 5
  store i32 %28, ptr %8, align 4
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = call noalias ptr @malloc(i64 noundef %31) #6
  store ptr %32, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %33

33:                                               ; preds = %46, %3
  %34 = load i32, ptr %10, align 4
  %35 = load i32, ptr %6, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %49

37:                                               ; preds = %33
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = mul i64 %39, 1
  %41 = call noalias ptr @malloc(i64 noundef %40) #6
  %42 = load ptr, ptr %9, align 8
  %43 = load i32, ptr %10, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds ptr, ptr %42, i64 %44
  store ptr %41, ptr %45, align 8
  br label %46

46:                                               ; preds = %37
  %47 = load i32, ptr %10, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %10, align 4
  br label %33, !llvm.loop !6

49:                                               ; preds = %33
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  store i32 0, ptr %13, align 4
  br label %50

50:                                               ; preds = %112, %49
  %51 = load i32, ptr %13, align 4
  %52 = sext i32 %51 to i64
  %53 = load ptr, ptr %4, align 8
  %54 = call i64 @strlen(ptr noundef %53) #5
  %55 = icmp ult i64 %52, %54
  br i1 %55, label %56, label %115

56:                                               ; preds = %50
  %57 = load ptr, ptr %4, align 8
  %58 = load i32, ptr %13, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, ptr %57, i64 %59
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  store i32 %62, ptr %14, align 4
  %63 = load i32, ptr %14, align 4
  %64 = sub nsw i32 %63, 32
  %65 = mul nsw i32 %64, 16
  %66 = sdiv i32 %65, 31
  store i32 %66, ptr %15, align 4
  store i32 0, ptr %16, align 4
  br label %67

67:                                               ; preds = %97, %56
  %68 = load i32, ptr %16, align 4
  %69 = load i32, ptr %7, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %100

71:                                               ; preds = %67
  store i32 0, ptr %17, align 4
  br label %72

72:                                               ; preds = %93, %71
  %73 = load i32, ptr %17, align 4
  %74 = load i32, ptr %8, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %96

76:                                               ; preds = %72
  %77 = load i32, ptr %15, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [13 x i8], ptr @charset, i64 0, i64 %78
  %80 = load i8, ptr %79, align 1
  %81 = load ptr, ptr %9, align 8
  %82 = load i32, ptr %12, align 4
  %83 = load i32, ptr %17, align 4
  %84 = add nsw i32 %82, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds ptr, ptr %81, i64 %85
  %87 = load ptr, ptr %86, align 8
  %88 = load i32, ptr %11, align 4
  %89 = load i32, ptr %16, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, ptr %87, i64 %91
  store i8 %80, ptr %92, align 1
  br label %93

93:                                               ; preds = %76
  %94 = load i32, ptr %17, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %17, align 4
  br label %72, !llvm.loop !8

96:                                               ; preds = %72
  br label %97

97:                                               ; preds = %96
  %98 = load i32, ptr %16, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %16, align 4
  br label %67, !llvm.loop !9

100:                                              ; preds = %67
  %101 = load i32, ptr %7, align 4
  %102 = load i32, ptr %11, align 4
  %103 = add nsw i32 %102, %101
  store i32 %103, ptr %11, align 4
  %104 = load i32, ptr %11, align 4
  %105 = load i32, ptr %5, align 4
  %106 = icmp sge i32 %104, %105
  br i1 %106, label %107, label %111

107:                                              ; preds = %100
  store i32 0, ptr %11, align 4
  %108 = load i32, ptr %8, align 4
  %109 = load i32, ptr %12, align 4
  %110 = add nsw i32 %109, %108
  store i32 %110, ptr %12, align 4
  br label %111

111:                                              ; preds = %107, %100
  br label %112

112:                                              ; preds = %111
  %113 = load i32, ptr %13, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %13, align 4
  br label %50, !llvm.loop !10

115:                                              ; preds = %50
  store i32 0, ptr %18, align 4
  br label %116

116:                                              ; preds = %142, %115
  %117 = load i32, ptr %18, align 4
  %118 = load i32, ptr %6, align 4
  %119 = icmp slt i32 %117, %118
  br i1 %119, label %120, label %145

120:                                              ; preds = %116
  store i32 0, ptr %19, align 4
  br label %121

121:                                              ; preds = %137, %120
  %122 = load i32, ptr %19, align 4
  %123 = load i32, ptr %5, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %140

125:                                              ; preds = %121
  %126 = load ptr, ptr %9, align 8
  %127 = load i32, ptr %18, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds ptr, ptr %126, i64 %128
  %130 = load ptr, ptr %129, align 8
  %131 = load i32, ptr %19, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i8, ptr %130, i64 %132
  %134 = load i8, ptr %133, align 1
  %135 = sext i8 %134 to i32
  %136 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %135)
  br label %137

137:                                              ; preds = %125
  %138 = load i32, ptr %19, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, ptr %19, align 4
  br label %121, !llvm.loop !11

140:                                              ; preds = %121
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %142

142:                                              ; preds = %140
  %143 = load i32, ptr %18, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %18, align 4
  br label %116, !llvm.loop !12

145:                                              ; preds = %116
  store i32 0, ptr %20, align 4
  br label %146

146:                                              ; preds = %156, %145
  %147 = load i32, ptr %20, align 4
  %148 = load i32, ptr %6, align 4
  %149 = icmp slt i32 %147, %148
  br i1 %149, label %150, label %159

150:                                              ; preds = %146
  %151 = load ptr, ptr %9, align 8
  %152 = load i32, ptr %20, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds ptr, ptr %151, i64 %153
  %155 = load ptr, ptr %154, align 8
  call void @free(ptr noundef %155) #7
  br label %156

156:                                              ; preds = %150
  %157 = load i32, ptr %20, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, ptr %20, align 4
  br label %146, !llvm.loop !13

159:                                              ; preds = %146
  %160 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %160) #7
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind  uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i8], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %6 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %6)
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %3, ptr noundef %4)
  %10 = getelementptr inbounds [100 x i8], ptr %2, i64 0, i64 0
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  call void @text_to_ascii(ptr noundef %10, i32 noundef %11, i32 noundef %12)
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind  uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }

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
